/*------------------------------------------------------------*
 | io.c                                                       |
 | copyright 1999,  Andrew Sumner (andrewsumner@yahoo.com)    |
 |                                                            |
 | This is a source file for the awka package, a translator   |
 | of the AWK programming language to ANSI C.                 |
 |                                                            |
 | This library is free software; you can redistribute it     |
 | and/or modify it under the terms of the GNU General        |
 | Public License (GPL).                                      |
 |                                                            |
 | This library is distributed in the hope that it will be    |
 | useful, but WITHOUT ANY WARRANTY; without even the implied |
 | warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR    |
 | PURPOSE.                                                   |
 *------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#include "libawka.h"
#include "garbage.h"

#define _IO_C
#define _IN_LIBRARY
#include "libawka.h"

#ifdef HAVE_UNISTD_H
#include <unistd.h>
#endif

#ifdef HAVE_FCNTL_H
#include <fcntl.h>
#endif
#ifndef VMS
#include <sys/stat.h>
#else
#include <stat.h>
#endif

#if HAVE_SOCKETS == 1
#ifdef HAVE_SYS_SOCKET_H
#include <sys/socket.h>
#endif
#ifdef HAVE_NETINET_IN_H
#include <netinet/in.h>
#else
#include <in.h>
#endif
#ifdef HAVE_NETDB_H
#include <netdb.h>
#endif

#endif /* HAVE_SOCKETS=1 */

#define INVALID_HANDLE (-1)
#ifndef O_BINARY
#define O_BINARY 0
#endif

enum inet_prot { INET_NONE, INET_TCP, INET_UDP, INET_RAW };

_a_IOSTREAM *_a_iostream = NULL;
int _a_ioallc = 0, _a_ioused = 0;
char _a_char[256], _interactive = FALSE;
extern a_VAR **_lvar;

/*
 * _awka_str2mode()
 * takes a string and returns a file open flag.
 * copied from Gawk's str2mode function
 */
static int
_awka_str2mode(const char *mode)
{
  int ret;
  const char *second = & mode[1];

  if (*second == 'b')
    second++;

  switch(mode[0]) {
    case 'r':
      ret = O_RDONLY;
      if (*second == '+' || *second == 'w')
        ret = O_RDWR;
      break;

    case 'w':
      ret = O_WRONLY|O_CREAT|O_TRUNC;
      if (*second == '+' || *second == 'r')
        ret = O_RDWR|O_CREAT|O_TRUNC;
      break;

    case 'a':
      ret = O_WRONLY|O_APPEND|O_CREAT;
      if (*second == '+')
        ret = O_RDWR|O_APPEND|O_CREAT;
      break;

    default:
      ret = 0;                /* lint */
      awka_error("Something wierd has happened.\n");
  }

  if (strchr(mode, 'b') != NULL)
    ret |= O_BINARY;

  return ret;
}

int
_awka_isdir(int fd)
{
  struct stat sbuf;
  return (fstat(fd, &sbuf) == 0 && S_ISDIR(sbuf.st_mode));
}

/*
 * _awka_socketopen()
 * Gawk's socketopen function
 */
int
_awka_socketopen(enum inet_prot type, int localport, int remoteport, char *remotehostname)
{
  int socket_fd = 0;
#if HAVE_SOCKETS == 1
  struct hostent *hp = gethostbyname(remotehostname);
  struct sockaddr_in local_addr, remote_addr;
  int any_remote_host = strcmp(remotehostname, "0");

  socket_fd = INVALID_HANDLE;
  switch (type) 
  {
    case INET_TCP:
      if (localport != 0 || remoteport != 0) 
      {
        int on = 1;
#ifdef SO_LINGER
        struct linger linger;

        memset(& linger, '\0', sizeof(linger));
#endif
        socket_fd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
        setsockopt(socket_fd, SOL_SOCKET, SO_REUSEADDR, (char *) & on, sizeof(on));
#ifdef SO_LINGER
        linger.l_onoff = 1;
        linger.l_linger = 30;    /* linger for 30/100 second */
        setsockopt(socket_fd, SOL_SOCKET, SO_LINGER, (char *) & linger, sizeof(linger));
#endif
      }
      break;
    case INET_UDP:
      if (localport != 0 || remoteport != 0)
        socket_fd = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
      break;
    case INET_RAW:
#ifdef SOCK_RAW
      if (localport == 0 && remoteport == 0)
        socket_fd = socket(AF_INET, SOCK_RAW, IPPROTO_RAW);
#endif
      break;
    case INET_NONE:
      /* fall through */
      default:
        awka_error("Something strange has happened.\n");
        break;
  }

  if (socket_fd < 0 || socket_fd == INVALID_HANDLE
      || (hp == NULL && any_remote_host != 0))
    return INVALID_HANDLE;

  local_addr.sin_family = remote_addr.sin_family = AF_INET;
  local_addr.sin_addr.s_addr = htonl(INADDR_ANY);
  remote_addr.sin_addr.s_addr = htonl(INADDR_ANY);
  local_addr.sin_port  = htons(localport);
  remote_addr.sin_port = htons(remoteport);
  if (bind(socket_fd, (struct sockaddr *) &local_addr, sizeof(local_addr)) == 0) 
  {
    if (any_remote_host != 0) 
    { /* not ANY => create a client */
      if (type == INET_TCP || type == INET_UDP) 
      {
        memcpy(&remote_addr.sin_addr, hp->h_addr, sizeof(remote_addr.sin_addr));
        if (connect(socket_fd, (struct sockaddr *) &remote_addr, sizeof(remote_addr)) != 0) 
        {
          close(socket_fd);
          if (localport == 0)
            socket_fd = INVALID_HANDLE;
          else
            socket_fd = _awka_socketopen(type, localport, 0, "0");
        }
      } 
      else 
      {
        /* /inet/raw client not ready yet */
        awka_error("/inet/raw client not ready yet, sorry\n");
        if (geteuid() != 0)
          awka_error("only root may use `/inet/raw'.\n");
      }
    } 
    else 
    { /* remote host is ANY => create a server */
      if (type == INET_TCP) 
      {
        int clientsocket_fd = INVALID_HANDLE;
        int namelen = sizeof(remote_addr);

        if (listen(socket_fd, 1) >= 0
            && (clientsocket_fd = accept(socket_fd, (struct sockaddr *) &remote_addr, &namelen)) >= 0) 
        {
          close(socket_fd);
          socket_fd = clientsocket_fd;
        } 
        else 
        {
          close(socket_fd);
          socket_fd = INVALID_HANDLE;
        }
      } 
      else if (type == INET_UDP) 
      {
        char buf[10];
        int readle;

#ifdef MSG_PEEK
        if (recvfrom(socket_fd, buf, 1, MSG_PEEK, (struct sockaddr *) & remote_addr, & readle) < 1
            || readle != sizeof(remote_addr)
            || connect(socket_fd, (struct sockaddr *)& remote_addr, readle) != 0) 
        {
          close(socket_fd);
          socket_fd = INVALID_HANDLE;
        }
#endif
      } 
      else 
      {
        /* /inet/raw server not ready yet */
        awka_error("/inet/raw server not ready yet, sorry\n");
        if (geteuid() != 0)
          awka_error("only root may use `/inet/raw'.\n");
      }
    }
  } 
  else 
  {
    close(socket_fd);
    socket_fd = INVALID_HANDLE;
  }

#endif   /* HAVE_SOCKET = 1 */
        return socket_fd;
}

/*
 * _awka_io_opensocket()
 * mostly copied from Gawk's devopen function
 */
int
_awka_io_opensocket(const char *name, const char *mode)
{
  int openfd;
#if HAVE_SOCKETS == 1
  char *cp, *ptr;
  int flag = 0;
  extern double strtod();
  enum inet_prot protocol = INET_NONE;
  int localport, remoteport;
  char *hostname, *hostnameslastcharp, *localpname, proto[4];
  struct servent *service;

  flag = _awka_str2mode(mode);

  cp = (char *) name + 6;

  /* which protocol? */
  if (!strncmp(cp, "tcp/", 4))
    protocol = INET_TCP;
  else if (!strncmp(cp, "udp/", 4))
    protocol = INET_UDP;
  else if (!strncmp(cp, "raw/", 4))
    protocol = INET_RAW;
  else
    awka_error("no known protocol supplied in special filename '%s'\n",name);

  proto[0] = cp[0];
  proto[1] = cp[1];
  proto[2] = cp[2];
  proto[3] = '\0';
  cp += 4;

  /* which localport? */
  localpname = cp;
  while (*cp && *cp != '/') cp++;

  /*
   * require a port, let them explicitly put 0 if
   * they don't care.
   */
  if (*cp != '/' || cp == localpname)
    awka_error("special filename '%s' is incomplete.\n",name);

  /*
   * we change the special filename temporarily because we
   * need a null-terminated string here for conversion with
   * atoi().  By using atoi() the use of decimal numbers is
   * enforced.
   */
  *cp = '\0';

  localport = atoi(localpname);
  if (strcmp(localpname, "0") != 0 &&
     (localport <= 0 || localport > 65535))
  {
    service = getservbyname(localpname, proto);
    if (service == NULL)
      awka_error("local port invalid in '%s'\n",name);
    else
      localport = ntohs(service->s_port);
  }

  *cp = '/';

  /* which hostname? */
  cp++;
  hostname = cp;
  while (*cp != '/' && *cp != '\0')
    cp++;
  if (*cp != '/' || cp == hostname)
    awka_error("must support remote hostname to '/inet/'\n");
  *cp = '\0';
  hostnameslastcharp = cp;

  /* which remoteport? */
  cp++;
  /*
   * The remoteport ends the special file name.
   * This means there is already a 0 at the end of the string.
   * Therefore no need to patch any string ending.
   *
   * Here too, require a port, let them explicitly put 0 if
   * they don't care.
   */
  if (*cp == '\0')
    awka_error("must supply a remote port to '/inet/'\n");
  remoteport = atoi(cp);
  if (strcmp(cp, "0") != 0 &&
     (remoteport <= 0 || remoteport > 65535))
  {
    service = getservbyname(cp, proto);
    if (service == NULL)
      awka_error("remote port invalid in '%s'\n", name);
    else
      remoteport = ntohs(service->s_port);
  }

  /* Open Sesame! */
  openfd = _awka_socketopen(protocol, localport, remoteport, hostname);
  *hostnameslastcharp = '/';

  if (openfd == INVALID_HANDLE)
    openfd = open(name, flag, 0666);
  if (openfd != INVALID_HANDLE)
  {
    if (_awka_isdir(openfd))
      awka_error("file '%s' is a directory\n",name);
    fcntl(openfd, F_SETFD, 1);
  }
#endif
  return openfd;
}
    
/*
 * awka_io_2open()
 * Implements co-process file pointer creation
 */
FILE *
_awka_io_2open( char *str )
{
  FILE *fp = NULL;

#if HAVE_SOCKETS == 1
  if (!strncmp(str, "/inet/", 6))
  {
    int fd, newfd;

    if ((fd = _awka_io_opensocket(str, "rw")) == INVALID_HANDLE)
      return NULL;

    if (!(fp = fdopen(fd, "w")))
    {
      close(fd);
      return NULL;
    }

    newfd = dup(fd);
    if (newfd < 0)
    {
      fclose(fp);
      return FALSE;
    }
    fcntl(newfd, F_SETFD, 1);
    
    return fp;
  }
#endif

#ifdef HAVE_PORTALS
  if (!strncmp(str, "/p/", 3))
  {
    int fd, newfd;

    fd = open(str, O_RDWD);
    if (fd == INVALID_HANDLE)
      return NULL;
    if (!(fp = fdopen(fd, "w")))
    {
      close(fd);
      return NULL;
    }
    newfd = dup(fd);
    if (newfd < 0)
    {
      fclose(fp);
      return NULL;
    }
    fcntl(newfd, F_SETFD, 1);

    return fp;
  }
#endif

#if HAVE_REAL_PIPES == 1
  /* open a two-way pipe */
  {
    /*
     * This code borrowed from Gawk-3.1.0, used under LGPL with
     * permission from Free Software Foundation.
     */
    int ptoc[2], ctop[2];
    int pid;
    int save_errno;

    if (pipe(ptoc) < 0)
      return NULL;   /* errno set, diagnostic from caller */

    if (pipe(ctop) < 0) 
    {
      save_errno = errno;
      close(ptoc[0]);
      close(ptoc[1]);
      errno = save_errno;
      return NULL;
    }

    if ((pid = fork()) < 0) 
    {
      save_errno = errno;
      close(ptoc[0]); close(ptoc[1]);
      close(ctop[0]); close(ctop[1]);
      errno = save_errno;
      return NULL;
    }

    if (pid == 0) 
    { /* child */
      if (close(1) == -1)
        awka_error("close of stdout in child process failed.\n");
      if (dup(ctop[1]) != 1)
        awka_error("moving pipe to stdout in child failed.\n");
      if (close(0) == -1)
        awka_error("close of stdin in child process failed.\n");
      if (dup(ptoc[0]) == -1)
        awka_error("moving pipe to stdin in child process failed.\n");
      if (close(ctop[0]) == -1 || close(ctop[1]) == -1 ||
          close(ptoc[0]) == -1 || close(ptoc[1]) == -1)
        awka_error("close of pipe failed.\n");
      execl(awka_shell, "sh", "-c", str, NULL);
      _exit(127);
    }

    /* parent */
    fp = fdopen(ptoc[1], "w");
    if (fp == NULL) 
    {
      (void) close(ctop[0]);
      (void) close(ctop[1]);
      (void) close(ptoc[0]);
      (void) close(ptoc[1]);
      /* (void) kill(pid, SIGKILL);      /* overkill? (pardon pun) */
      return NULL;
    }

#ifdef F_SETFD
    fcntl(ctop[0], F_SETFD, 1);
    fcntl(ptoc[1], F_SETFD, 1);
#endif

    (void) close(ptoc[0]);
    (void) close(ctop[1]);
    return fp;
  }
#else
  awka_error("|& not supported on your system.\n");
#endif

  return NULL;
}

/*
 * _awka_sopen
 * opens a file or pipe for input/output
 */
void
_awka_sopen(_a_IOSTREAM *s, char flag)
{
  if (s->io != (char) _a_IO_CLOSED) return;
  s->interactive = FALSE;

  if ((s->pipe == 1))   /* PIPED I/O */
  {
    switch (flag)
    {
      case _a_IO_READ:
        s->fp = popen(s->name, "r");
        if (s->fp) fflush(s->fp);
        if (_interactive) s->interactive = TRUE;
        break;
      case _a_IO_WRITE:
        if (!(s->fp = popen(s->name, "w")))
          awka_error("sopen: unable to open piped process '%s' for write access.\n",s->name);
        fflush(s->fp);
        break;
      case _a_IO_APPEND:
        if (!(s->fp = popen(s->name, "a")))
          awka_error("sopen: unable to open piped process '%s' for append access.\n",s->name);
        fflush(s->fp);
        break;
    }
  }
  else if ((s->pipe == 2))  /* TWO-WAY I/O */
  {
    if (!(s->fp = _awka_io_2open(s->name)))
      awka_error("sopen: unable to open %s process '%s' for %s access.\n",
#if HAVE_SOCKETS == 1
          !strncmp("/inet", s->name, 6) ? "socket" : "pipe",
#endif
          s->name,
          "read/write");
    setbuf(s->fp, NULL);
    fflush(s->fp);
    flag = _a_IO_READ | _a_IO_WRITE;
  }
  else
  {
    switch (flag)
    {
      case _a_IO_READ:
        if (!strcmp(s->name, "-") || !strcmp(s->name, "/dev/stdin"))
          s->fp = stdin;
        else 
          s->fp = fopen(s->name, "r");
        if (_interactive || !strncmp(s->name, "/dev/", 5))
          s->interactive = TRUE;
        if (s->fp) fflush(s->fp);
        break;
      case _a_IO_WRITE:
        if (!(s->fp = fopen(s->name, "w")))
          awka_error("sopen: unable to open file '%s' for write access.\n",s->name);
        fflush(s->fp);
        break;
      case _a_IO_APPEND:
        if (!(s->fp = fopen(s->name, "a")))
          awka_error("sopen: unable to open file '%s' for append access.\n",s->name);
        fflush(s->fp);
        break;
    }
  }
  if (!s->fp)
    s->io = _a_IO_CLOSED;
  else
  {
    s->io = flag;
    if (flag & _a_IO_READ && !s->alloc)
    {
      s->alloc = A_BUFSIZ;
      malloc( &s->buf, A_BUFSIZ + 4 );
      s->buf[A_BUFSIZ] = '\0';
      s->current = s->end = s->buf;
    }
  }
  s->lastmode = 0;
}

/*
 * _awka_io_addstream
 * creates a new input or output stream
 */
int
_awka_io_addstream( char *name, char flag, int pipe )
{
  int i, j, k;

  if (!*name) 
    awka_error("io_addstream: empty filename, flag = %d.\n",flag);

  if (pipe < 0 || pipe > 2)
    awka_error("io_addstream: pipe argument must be 0, 1 or 2, got %d.\n",pipe);

  for (i=0; i<_a_ioused; i++)
    if (_a_iostream[i].pipe == pipe &&
        !strcmp(name, _a_iostream[i].name) &&
        (_a_iostream[i].io == flag || 
        _a_iostream[i].io == _a_IO_CLOSED))
      break;

  if (i < _a_ioused)
  {
    if (_a_iostream[i].io == flag) 
      return i;
    _a_iostream[i].pipe = pipe;
    _awka_sopen(&_a_iostream[i], flag);
    return i;
  }

  j = _a_ioused++;
  if (_a_ioused >= _a_ioallc)
  {
    if (!_a_ioallc)
    {
      /* awka_init has not been called */
      awka_error("io_addstream: awka_init() not called!\n");
    }
    else
    {
      k = _a_ioallc;
      _a_ioallc *= 2;
      realloc( &_a_iostream, _a_ioallc * sizeof(_a_IOSTREAM) );
      for (i=k; i<_a_ioallc; i++) 
      {
        _a_iostream[i].name = _a_iostream[i].buf = _a_iostream[i].end = _a_iostream[i].current = NULL;
        _a_iostream[i].io = _a_IO_CLOSED;
        _a_iostream[i].fp = NULL;
        _a_iostream[i].alloc = _a_iostream[i].interactive = 0;
      }
    }
  }

  malloc( &_a_iostream[j].name, strlen(name)+1);
  strcpy(_a_iostream[j].name, name);
  _a_iostream[j].pipe = (char) pipe;
  _awka_sopen(&_a_iostream[j], flag);
  return j;
}
      
void
_awka_io_cleanbinchars(a_VAR *var)
{
  register char *r, *q;

  r = var->ptr + var->slen;
  q = var->ptr;
  if (var->slen >= 8)
  while (q<=(r-8)) 
  {
    *q = _a_char[*q++];
    *q = _a_char[*q++];
    *q = _a_char[*q++];
    *q = _a_char[*q++];
    *q = _a_char[*q++];
    *q = _a_char[*q++];
    *q = _a_char[*q++];
    *q = _a_char[*q++];
  }
  while (q<r)
    *q = _a_char[*q++];
}

int
_awka_io_fillbuff(_a_IOSTREAM *s)
{
  if (!fread(s->current, 1, s->alloc - (s->current - s->buf), s->fp))
    return 0;
  return 1;
}

#define _RS_REGEXP 1
#define _RS_NL     2
#define _RS_CHAR   3
#define _RS_NLCHAR 4

/*
 * awka_io_readline
 * reads a new line from the designated strm and
 * inserts it into var.
 */
int
awka_io_readline( a_VAR *var, int strm, int fill_target)
{
  char *p = NULL, *q = NULL;
  register char recsep = '\n', rs_type = _RS_CHAR;
  char *end = NULL, eof = FALSE;
  _a_IOSTREAM *s = &_a_iostream[strm];
  int j = 0, i = 0;

  if (strm >= _a_ioused)
    awka_error("io_readline: stream %d passed to io_readline, but highest available is %d.\n",strm,_a_ioused-1);

  if (s->io == _a_IO_WRITE || s->io == _a_IO_APPEND)
    awka_error("io_readline: output stream %d (%s) passed to io_readline!\n",strm,s->name);
  else if (s->io == _a_IO_CLOSED)
  {
    _awka_sopen(s, _a_IO_READ);
    if (s->io == _a_IO_CLOSED)
      return 0;
  }
  else if (s->io == _a_IO_EOF)
    return 0;
  else if (s->io == _a_IO_READ + _a_IO_WRITE && s->lastmode != _a_IO_READ && s->fp)
  {
    fflush(s->fp);
    s->lastmode = _a_IO_READ;
  }

  switch (a_bivar[a_RS]->type)
  {
    case a_VARDBL:
    case a_VARNUL:
      awka_gets(a_bivar[a_RS]);
    case a_VARSTR:
    case a_VARUNK:
      if (a_bivar[a_RS]->slen <= 1)
      {
        recsep = a_bivar[a_RS]->ptr[0];
        rs_type = _RS_CHAR;
        if (!recsep) 
          rs_type = _RS_NL;
        break;
      }
      
      a_bivar[a_RS]->ptr = (char *) _awka_compile_regexp_SPLIT(
                              a_bivar[a_RS]->ptr, a_bivar[a_RS]->slen );
      a_bivar[a_RS]->type = a_VARREG;
    case a_VARREG:
      rs_type = _RS_REGEXP;
  }

  while (1)
  {
    p = NULL;

    if (s->end > s->buf && s->end > s->current)
    {
      /* identify RS in data already read */
      switch (rs_type)
      {
        case _RS_CHAR:
            p = memchr(s->current, recsep, s->end - s->current);
            break;
        case _RS_NL:
            q = s->current;
            while (*q == '\n' && q < s->end) q++;
            if (q == s->end) break;
            p = strstr(q, "\n\n");
            break;
        case _RS_REGEXP:
          {
            regmatch_t pmatch;
            i = !awka_regexec((awka_regexp *) a_bivar[a_RS]->ptr, 
                               s->current, 1, &pmatch, REG_NEEDSTART);
            if (i)
            {
              p   = s->current + pmatch.rm_so;
              end = s->current + pmatch.rm_eo;
            }
          }
      }

      if (p)
      {
        /* RS found */
        if (fill_target)
        {
          if (rs_type == _RS_NL)
            awka_strncpy(var, q, p - q);
          else
            awka_strncpy(var, s->current, p - s->current);
#ifdef NO_BIN_CHARS
          _awka_io_cleanbinchars(var);
#endif
        }

        switch (rs_type)
        {
          case _RS_REGEXP:
            awka_strncpy(a_bivar[a_RT], p, end - p);
            s->current = end;
            break;
          case _RS_NL:
            s->current = (p+2 > s->end ? s->end : p+2);
            break;
          case _RS_CHAR:
            s->current = p+1;
        }
  
        return 1;
      }
    }

    /* here because there's no data in buffer, or RS is not 
     * in the buffer's data, hence try to read in more data */

    if (eof == TRUE)
    {
      char ret = 1;
      /* end of file already reached */
      if (fill_target)
      {
        if (rs_type == _RS_NL && s->end > s->current)
        {
          /* scrub trailing newline characters */
          p = s->end - 1;
          while (*p == '\n') *(p--) = '\0';
          s->end = ++p;
        }
        else if (rs_type == _RS_REGEXP)
          awka_strcpy(a_bivar[a_RT], "");
           
        if (s->end > s->current)
        {
          if (rs_type == _RS_NL)
            awka_strncpy(var, q, (p - q));
          else
            awka_strncpy(var, s->current, (s->end - s->current));
#ifdef NO_BIN_CHARS
          _awka_io_cleanbinchars(var);
#endif
        }
      }
      if (s->end <= s->current) ret = 0;
      if (s->buf) free(s->buf);
      s->buf = s->current = s->end = NULL;
      s->io = _a_IO_EOF;
      return ret;
    }

    if (s->current - s->buf > s->alloc - 256)
    {
      /* about to hit end of buffer - move remainder to front */
      if (s->current < s->end)
      {
        /* there's a remainder to preserve */
        memmove(s->buf, s->current, s->end - s->current);
        s->end -= (s->current - s->buf);
        s->current = s->buf;
      }
      else
      {
        /* there isn't */
        *s->buf = '\0';
        s->end = s->current = s->buf;
      }
    }

    if (s->end - s->buf > s->alloc - 256)
    {
      /* increase buffer size */
      i = s->current - s->buf;
      j = s->end - s->buf;
      s->alloc = realloc( &s->buf, s->alloc * 2 );
      s->current = s->buf + i;
      s->end = s->buf + j;
    }

    if (s->interactive)
    {
      /* line buffered */
      if (!fgets(s->end, s->alloc - (s->end - s->buf) - 1, s->fp))
        eof = TRUE;
      else
        s->end = s->end + strlen(s->end);
    }
    else
    {
      /* block buffered */
      if (!(i = fread(s->end, 1, s->alloc - (s->end - s->buf) - 1, s->fp)))
        eof = TRUE;
      else
        s->end += i;
    }

  }
}


void
awka_exit( double ret )
{
  register int i;

  for (i=0; i<_a_ioused; i++)
  {
    if (_a_iostream[i].fp && _a_iostream[i].io != _a_IO_CLOSED)
    {
      if (_a_iostream[i].io == _a_IO_WRITE || _a_iostream[i].io == _a_IO_APPEND)
        fflush(_a_iostream[i].fp);
      if (_a_iostream[i].pipe == 1)
        pclose(_a_iostream[i].fp);
      else
      {
        if (strcmp(_a_iostream[i].name, "/dev/stdout") &&
            strcmp(_a_iostream[i].name, "/dev/stderr"))
          fclose(_a_iostream[i].fp);
      }
    }
  }

  _awka_kill_ivar();
  exit((int) ret);
}

void
awka_cleanup()
{
  register int i;

  /* close open streams */
  for (i=0; i<_a_ioused; i++)
  {
    if (_a_iostream[i].fp && _a_iostream[i].io != _a_IO_CLOSED)
    {
      if (_a_iostream[i].io == _a_IO_WRITE || _a_iostream[i].io == _a_IO_APPEND)
        fflush(_a_iostream[i].fp);
      if (_a_iostream[i].pipe == 1)
        pclose(_a_iostream[i].fp);
      else
      {
        if (strcmp(_a_iostream[i].name, "/dev/stdout") &&
            strcmp(_a_iostream[i].name, "/dev/stderr"))
          fclose(_a_iostream[i].fp);
      }
    }
  }
  
  /* free up stream memory */
  for (i=0; i<_a_ioallc; i++)
    if (_a_iostream[i].name)
      free(_a_iostream[i].name);
  free(_a_iostream);
  _a_iostream = NULL;
  _a_ioused = _a_ioallc = 0;

  _awka_kill_ivar();
  _awka_kill_gvar();
  _awka_gc_kill();
}

static struct pid_child {
  int pid;
  int exit_value;
  struct pid_child *link;
} *childlist;

static void
_awka_childlist_add(int pid, int exit_value)
{
  struct pid_child *child;

  malloc(&child, sizeof(struct pid_child));
  child->pid = pid;
  child->exit_value = exit_value;
  child->link = childlist;
  childlist = child;
}

static struct pid_child *
_awka_childlist_del(int pid)
{
  struct pid_child dummy, *child, *tmp = &dummy;

  dummy.link = child = childlist;
  while (child)
  {
    if (child->pid == pid)
    {
      tmp->link = child->link;
      break;
    }
    else
    {
      tmp = child;
      child = child->link;
    }
  }

  childlist = dummy.link;
  return child;
}
  
int
_awka_wait_pid(int pid)
{
#if HAVE_FORK == 0
   // we don't expect this to be called if we don't use fork
   awka_error("Unexpected call to _awka_wait_pid\n");
   return -1;
#else
  struct pid_child *child;
  int exit_value, id;

  if (!pid)
  {
    id = wait(&exit_value);
    _awka_childlist_add(id, exit_value);
  }
  else if (child = _awka_childlist_del(pid))
  {
    exit_value = child->exit_value;
    free(child);
  }
  else
  {
    while ((id = wait(&exit_value)) != pid)
    {
      if (id == -1)
        awka_error("Unexpected error occured while trying to fork new process\n");
      else
        _awka_childlist_add(id, exit_value);
    }
  }

  if (exit_value & 0xff) 
    exit_value = 128 + (exit_value & 0xff);
  else
    exit_value = (exit_value & 0xff00) >> 8;

  return exit_value;
#endif
}

