/*------------------------------------------------------------*
 | init.c                                                     |
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

#define _INIT_C

#define _IN_LIBRARY
#include "libawka.h"

extern void _awka_arrayinitargv( char **, int, char *argv[] );
extern void _awka_arrayinitenviron( char **, int );
extern char _a_char[256], _interactive;
extern struct gvar_struct *_gvar;
struct awka_fn_struct *_awkafn;
extern struct a_VAR **_lvar;

char **awka_filein = NULL;
int awka_filein_no = 0, _awka_fileoffset = 0;
char **_argv = NULL, **_int_argv = NULL;
int _argc, _int_argc = 0, _orig_argc = 0;
extern char _a_space[256];
char _env_used = 0;
char *patch_str, *date_str;

struct ivar_idx
{
  char *name;
  int  var;
} ivar[] = {
  "ARGC",        a_ARGC,
  "ARGIND",      a_ARGIND,
  "ARGV",        a_ARGV,
  "CONVFMT",     a_CONVFMT,
  "ENVIRON",     a_ENVIRON,
  "FIELDWIDTHS", a_FIELDWIDTHS,
  "FILENAME",    a_FILENAME,
  "FNR",         a_FNR,
  "FS",          a_FS,
  "NF",          a_NF,
  "NR",          a_NR,
  "OFMT",        a_OFMT,
  "OFS",         a_OFS,
  "ORS",         a_ORS,
  "PROCINFO",    a_PROCINFO,
  "RLENGTH",     a_RLENGTH,
  "RS",          a_RS,
  "RSTART",      a_RSTART,
  "RT",          a_RT,
  "SAVEWIDTHS",  a_SAVEWIDTHS,
  "SORTTYPE",    a_SORTTYPE,
  "SUBSEP",      a_SUBSEP
}; 
   
#define IVAR_MAX 20

int
findivar(char *c)
{
  int i = IVAR_MAX / 2, hi = IVAR_MAX, lo = 0;
  int x;

  while (1)
  {    
    if (!(x = strcmp(ivar[i].name, c)))
      return i;
    else if (x > 0)
    {
      if (i == lo)
        return -1;
      else if (i-1 == lo)
      {
        if (!strcmp(ivar[lo].name, c))
          return lo;
        return -1;
      }
      hi = i;
      i = lo + ((hi - lo) / 2);
    }
    else
    {
      if (i == hi)
        return -1;
      else if (i+1 == hi)
      {
        if (!strcmp(ivar[hi].name, c))
          return hi;
        return -1;
      }
      lo = i;
      i = lo + ((hi - lo) / 2);
    }
  }
}

void
awka_initgvar(int idx, char *name, a_VAR *var)
{
  int i = strlen(name);
  malloc( &_gvar[idx].name, i+1);
  strncpy(_gvar[idx].name, name, i-4);
  _gvar[idx].name[i-4] = 0;
  _gvar[idx].var = var;
}

void
_awka_initstreams()
{
  int i;
  _a_ioallc = 5;
  malloc( &_a_iostream, 5 * sizeof(_a_IOSTREAM) );

  for (i=0; i<5; i++)
  {
    _a_iostream[i].name = _a_iostream[i].buf = _a_iostream[i].end = _a_iostream[i].current = NULL;
    _a_iostream[i].io = _a_IO_CLOSED;
    _a_iostream[i].fp = NULL;
    _a_iostream[i].alloc = _a_iostream[i].interactive = 0;
  }

  if (_interactive == TRUE)
  {
    setvbuf(stdin, NULL, _IONBF, 0);
    setvbuf(stdout, NULL, _IONBF, 0);
  }

  malloc( &_a_iostream[0].name, 12 );
  strcpy(_a_iostream[0].name, "/dev/stdout");
  _a_iostream[0].fp = stdout;
  fflush(_a_iostream[0].fp);

  malloc( &_a_iostream[1].name, 12 );
  strcpy(_a_iostream[1].name, "/dev/stderr");
  _a_iostream[1].fp = stderr;
  fflush(_a_iostream[1].fp);

  _a_iostream[0].buf = _a_iostream[1].buf = NULL;
  _a_iostream[0].alloc = _a_iostream[1].alloc = 0;
  _a_iostream[0].current = _a_iostream[0].end = NULL;
  _a_iostream[1].current = _a_iostream[1].end = NULL;
  _a_iostream[0].io = _a_iostream[1].io = _a_IO_WRITE;
  _a_iostream[0].pipe = _a_iostream[1].pipe = FALSE;
  _a_ioused = 2;
}

static INLINE void
_awka_initchar()
{
  register int i;

  memset(_a_char, ' ', 256);
  _a_char['\n'] = '\n';
  _a_char['\t'] = '\t';
  for (i=32; i<127; i++)
    _a_char[i] = (char) i;

  memset(_a_space, 0, 256);
  _a_space['\n'] = 1;
  _a_space['\t'] = 1;
  _a_space['\f'] = 1;
  _a_space['\r'] = 1;
  _a_space['\013'] = 1;
  _a_space[' '] = 1;
}

#ifdef PROCINFO_READY_TO_USE
void
_awka_init_procinfo( a_VAR *procinfo )
{
  a_VAR *ret, *tmp = NULL;
  awka_varinit(tmp);

  /* egid */
  /* euid */

  /* FS */
  awka_strcpy(tmp, "FS");
  ret = awka_arraysearch1( procinfo, tmp, a_ARR_CREATE, 0 );
  awka_strcpy(ret, "FS");
  ret->type = a_VARUNK;

  /* gid */
  /* pgrpid */
  /* pid */
  /* ppid */
  /* uid */
}
#endif

void
_awka_init_ivar(int i)
{
  if (a_bivar[i]) return;

  malloc( &a_bivar[i], sizeof(a_VAR) );
  a_bivar[i]->slen = 0;
  a_bivar[i]->allc = 0;
  a_bivar[i]->dval = 0;
  a_bivar[i]->ptr = NULL;
  a_bivar[i]->type2 = 0;
  a_bivar[i]->temp = 0;
  a_bivar[i]->type = a_VARNUL;
    
  switch (i) {
    case a_ARGV:
      a_bivar[i]->type = a_VARARR;
      awka_arraycreate(a_bivar[i], a_ARR_TYPE_SPLIT);
      break;

    case a_CONVFMT:
    case a_OFMT:
      a_bivar[i]->type = a_VARSTR;
      a_bivar[i]->allc = malloc( &a_bivar[i]->ptr, 5 );
      a_bivar[i]->slen = 4;
      strcpy(a_bivar[i]->ptr, "%.6g");
      break;

    case a_ENVIRON:
      a_bivar[i]->type = a_VARARR;
      _awka_arrayinitenviron(&(a_bivar[i]->ptr), _env_used);
      break;

    case a_FILENAME:
    case a_DOL0:
      a_bivar[i]->type = a_VARUNK;
      a_bivar[i]->allc = malloc( &a_bivar[i]->ptr, 1 );
      a_bivar[i]->ptr[0] = '\0';
      a_bivar[i]->slen = 0;
      break;

    case a_FS:
    case a_OFS:
      a_bivar[i]->type = a_VARSTR;
      a_bivar[i]->allc = malloc( &a_bivar[i]->ptr, 5 );
      a_bivar[i]->ptr[0] = ' ';
      a_bivar[i]->ptr[1] = '\0';
      a_bivar[i]->slen = 1;
      break;

    case a_ARGC:
    case a_ARGIND:
    case a_NF:
    case a_FNR:
    case a_NR:
    case a_RLENGTH:
    case a_RSTART:
      a_bivar[i]->type = a_VARDBL;
      break;

    case a_FIELDWIDTHS:
    case a_SAVEWIDTHS:
      a_bivar[i]->type = a_VARSTR;
      a_bivar[i]->allc = malloc( &a_bivar[i]->ptr, 1 );
      a_bivar[i]->ptr[0] = '\0';
      break;

    case a_RT:
    case a_RS:
    case a_ORS:
      a_bivar[i]->type = a_VARSTR;
      a_bivar[i]->allc = malloc( &a_bivar[i]->ptr, 5 );
      a_bivar[i]->ptr[0] = '\n';
      a_bivar[i]->ptr[1] = '\0';
      a_bivar[i]->slen = 1;
      break;

    case a_SUBSEP:
      a_bivar[i]->type = a_VARSTR;
      a_bivar[i]->allc = malloc( &a_bivar[i]->ptr, 5 );
      a_bivar[i]->ptr[0] = '\034';
      a_bivar[i]->ptr[1] = '\0';
      a_bivar[i]->slen = 1;
      break;

    case a_DOLN:
      a_bivar[i]->type = a_VARARR;
      awka_arraycreate(a_bivar[i], a_ARR_TYPE_SPLIT);
      break;

    case a_PROCINFO:
      a_bivar[i]->type = a_VARARR;
      awka_arraycreate(a_bivar[i], a_ARR_TYPE_HSH);
      /* _awka_init_procinfo( a_bivar[i] ); */
  }
}

void
_awka_kill_ivar()
{
  int i;

  for (i=0; i<a_BIVARS; i++)
  {
    if (!(a_bivar[i])) continue;

    awka_killvar(a_bivar[i]);
    free(a_bivar[i]);
    a_bivar[i] = NULL;
  }
  
  if (awka_filein)
  {
    for (i=0; i<awka_filein_no; i++)
      if (awka_filein[i])
        free(awka_filein[i]);
    free(awka_filein);
  }
  awka_filein = NULL;
  awka_filein_no = 0;
  
  if (_orig_argc)
  {
    for (i=0; i<_orig_argc; i++)
      if (_argv[i])
        free(_argv[i]);
    free(_argv);
  }
  _argv = NULL;
  _argc = 0;
}

void
_awka_kill_gvar()
{
  struct gvar_struct *gvar = _gvar;

  if (_gvar)
  {
    while (gvar->name)
    {
      free(gvar->name);
      awka_killvar(gvar->var);
      gvar++;
    }
    free(_gvar);
    _gvar = NULL;
  }
}

void
_awka_kill_fn()
{
  if (_awkafn)
    free(_awkafn);
  _awkafn = NULL;
}

void
awka_init(int argc, char *argv[], char *patch_string, char *date_string)
{
  int i=0, j;
  extern void _awka_gc_init();

  patch_str = patch_string;
  date_str = date_string;

  _argc = argc + _int_argc;
  _orig_argc = argc;
  malloc( &_argv, _argc * sizeof(char *) );

  if (argc)
  {
    i++;
    malloc( &_argv[0], strlen(argv[0])+1 );
    strcpy(_argv[0], argv[0]);
  }

  for (j=0; j<_int_argc; j++)
  {
    malloc( &_argv[j+i], strlen(_int_argv[j])+1 );
    strcpy(_argv[j+i], _int_argv[j]);
  }

  for (; i<argc; i++)
  {
    malloc( &_argv[i+j], strlen(argv[i])+1 );
    strcpy(_argv[i+j], argv[i]);
  }

  _awka_gc_init();

  for (i=0; i<a_BIVARS; i++) a_bivar[i] = NULL;
  _awka_init_ivar(a_ARGC);
  _awka_init_ivar(a_ARGV);

  awka_parsecmdline(1);

  /* set up internal variables */
  for (i=0; i<a_BIVARS; i++)
    if (i != a_ARGC && i != a_ARGV)
      _awka_init_ivar(i);

  /* set up output streams */
  _awka_initstreams();
  _awka_initchar();

#ifndef a_DUMP_ON_ERROR
  /* handle signals */
  awka_init_parachute();
#endif
}

void
_awka_printhelp()
{
  fprintf(stderr,"\nThis executable was generated from an AWK program using Awka.\n\n");
  fprintf(stderr,"Command-line Options:\n\n");
  fprintf(stderr,"  -We           All following arguments will be added to the ARGV array.\n");
  fprintf(stderr,"  -Wi           Interactive mode.  Input from stdin will be unbuffered.\n");
  fprintf(stderr,"  -v var=value  Sets variable 'var' to 'value'.  'var' must be a defined\n");
  fprintf(stderr,"                variable else an error message will be printed.\n");
  fprintf(stderr,"  -Fvalue       Sets FS to value.\n");
  fprintf(stderr,"  -showarg      shows compiled-in arguments.\n");
  fprintf(stderr,"  -awkaversion  prints version of awka that generated this executable\n");
  fprintf(stderr,"  -help         prints this message.\n\n");
  exit(1);
}

#define _setp \
  if (_argv[i][2] == '\0')  \
  { \
    i++; \
    if (i >= _argc)  \
       awka_error("command line parse: expecting argument after %s.\n",_argv[i-1]); \
    p = _argv[i]; \
  } \
  else \
    p = _argv[i]+2

void
awka_parsecmdline(int first)
{
  int i = 1, j, argc, options_done = FALSE;
  char c, *p, *p1, *p2, tmp[128];
  a_VAR *var;

  awka_getd(a_bivar[a_ARGC]);

  if (!first)
  {
    for (i=1; i<_argc; i++)
      if (_argv[i])
        free(_argv[i]);

    argc = _argc;
    _argc = (int) awka_getd(a_bivar[a_ARGC]);

    if (argc != _argc)
      realloc( &_argv, _argc * sizeof(char *));

    for (i=0; i<_argc; i++)
    {
      var = awka_arraysearch1(a_bivar[a_ARGV], awka_tmp_dbl2var(i), a_ARR_QUERY, 0);
      if (var->slen != -1)
      {
        var = awka_arraysearch1(a_bivar[a_ARGV], awka_tmp_dbl2var(i), a_ARR_CREATE, 0);
        p1 = awka_gets1(var);
        malloc( &_argv[i], var->slen+1);
        strcpy(_argv[i], p1);
      }
      else
      {
        _argv[i] = NULL;
      }
    }

    if (awka_filein_no)
    {
      for (i=0; i<awka_filein_no; i++)
        free(awka_filein[i]);
      free(awka_filein);
      awka_filein_no = 0;
    }

    a_bivar[a_ARGC]->dval = 0;
  }
  else
  {
    a_bivar[a_ARGC]->dval = 0;
    awka_strcpy(awka_arraysearch1(a_bivar[a_ARGV], a_bivar[a_ARGC], a_ARR_CREATE, 1), _argv[0]);
  }

  i = 1;
  while (i < _argc)
  {
    if (!_argv[i]) { i++; continue; }
    c = _argv[i][0];
    
    if (options_done == FALSE && c == '-' && _argv[i][1] != '\0')
    {
      switch (_argv[i][1])
      {
        case 'F':
          _setp;
          if (!first) break;
          if (!a_bivar[a_FS])
            _awka_init_ivar(a_FS);
          awka_strcpy(a_bivar[a_FS], p);
          break;

        case '-':
          switch (_argv[i][2])
          {
            case 'h':
            case 'u':
              _awka_printhelp();
            default:
              awka_error("command line parse: unknown option %s\n",_argv[i]);

            case 'a':
              break;
          }
        case 'a':
          fprintf(stderr,"\n\"%s\" was generated by Awka (http://awka.sourceforge.net)\n",_argv[0]);
          fprintf(stderr,"   - translator version %s, %s\n",patch_str,date_str);
          fprintf(stderr,"   - library version %s, %s\n\n",AWKAVERSION,DATE_STRING);
          exit(0);

        case 'v':
          _setp;
          if (!first) break;
          strcpy(tmp, p);
          p1 = p2 = tmp;
          while (*p2 && *p2 != '=') p2++;
          if (*p2 == '=')
            *p2++ = '\0';
          else
            awka_error("command line parse: expected 'var=value' after -v.\n");
          if (p1 == p2-1)
            awka_error("command line parse: null value for 'var' in 'var=value' after -v.\n");
          
          j = 0;
          while (_gvar[j].name)
          {
            if (!strcmp(_gvar[j].name, tmp))
              break;
            j++;
          }
          if (!_gvar[j].name)
          {
            if ((j = findivar(tmp)) == -1)
              awka_error("command line parse: variable '%s' not defined.\n",tmp);
            if (!a_bivar[ivar[j].var])
              _awka_init_ivar(ivar[j].var);
            if (a_bivar[ivar[j].var]->type == a_VARARR)
              awka_error("command line parse: array variable '%s' used as scalar.\n",tmp);
            awka_strcpy(a_bivar[ivar[j].var], p2);
            a_bivar[ivar[j].var]->type = a_VARUNK;
            break;
          }
          else if (_gvar[j].var->type == a_VARARR)
            awka_error("command line parse: array variable '%s' used as scalar.\n",tmp);
          awka_strcpy(_gvar[j].var, p2);
          _gvar[j].var->type = a_VARUNK;
          break;

        case 'W':
          _setp;
          switch (*p)
          {
            case 'e':
              options_done = TRUE;
              break;

            case 'i':
              _interactive = TRUE;
              break;
          
            default:
              awka_error("command line parse: unknown option -W%s\n",p);
          }
          break;

        case 's':
          if (_int_argc == 0)
            fprintf(stderr,"No compiled-in arguments.\n");
          else
          {
            fprintf(stderr,"The following arguments were compiled into this executable:-\n  ");
            for (j=0; j<_int_argc; j++)
              fprintf(stderr," %s", _int_argv[j]);
            fprintf(stderr,"\n");
          }
          exit(1);

        case 'h':
          _awka_printhelp();

        default:
          awka_error("command-line parse error: unknown argument '%s' - type \"-help\" for more info.\n",_argv[i]);
      }
    }
    else if (_argv[i][0] != '\0')
    {
      a_bivar[a_ARGC]->dval++;
      var = awka_arraysearch1(a_bivar[a_ARGV], a_bivar[a_ARGC], a_ARR_CREATE, 0);
      awka_strcpy(var, _argv[i]);
      var->type = a_VARUNK;
      if (!awka_filein_no)
        malloc( &awka_filein, (_argc + i) * sizeof(char *) );

      malloc( &awka_filein[awka_filein_no], strlen(_argv[i])+1 );
      strcpy(awka_filein[awka_filein_no++], _argv[i]);
      if (!_awka_fileoffset) _awka_fileoffset = i;
    }

    i++;
  }
  a_bivar[a_ARGC]->dval++;

  if (!awka_filein_no)
  {
    malloc( &awka_filein, sizeof(char *) );
    malloc( &awka_filein[0], 3 );
    strcpy(awka_filein[0], "-");
    awka_filein_no = 1;
    _awka_fileoffset = -1;
  }
}
  
