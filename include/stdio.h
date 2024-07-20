/*
 * stdio.h - input/output definitions
 *
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
/* $Id: stdio.h,v 1.11 1994/06/24 11:41:21 ceriel Exp $ */

#if	!defined(_STDIO_H)
#define	_STDIO_H

/*
 * The following two flags control the I/O mode. They should be set
 * appropriately when when compiling the different versions of the
 * standard C library. By default, we use simple I/O and do not 
 * include support for an SD Card file system. Note that it makes
 * no sense to set both flags to 1.
 */
#ifndef __CATALINA_SIMPLE_IO
#define __CATALINA_SIMPLE_IO 1
#endif

#ifndef __CATALINA_SDCARD_IO
#define __CATALINA_SDCARD_IO 0
#endif

/*
 * if we are using the tiny library, redefine printf, scanf, sprintf and sscanf
 * to be their tiny equivalents.
 * (note that we don't redefine printf if it has already been defined)
 */
#ifdef __CATALINA_libtiny
#ifndef printf
#define printf  tiny_printf
#endif
#define gets    tiny_gets
#define scanf   tiny_scanf
#define sprintf tiny_sprintf
#define sscanf  tiny_sscanf
#endif


/*
 * Focus point of all stdio activity.
 */
typedef struct __iobuf {
	int		_count;
	int		_fd;
	int		_flags;
	int		_bufsiz;
	unsigned char	*_buf;
	unsigned char	*_ptr;
} FILE;

#define	_IOFBF		0x000
#define	_IOREAD		0x001
#define	_IOWRITE		0x002
#define	_IONBF		0x004
#define	_IOMYBUF		0x008
#define	_IOEOF		0x010
#define	_IOERR		0x020
#define	_IOLBF		0x040
#define	_IOREADING	0x080
#define _IOWRITING	0x100
#define	_IOAPPEND	0x200

/* The following definitions are also in <unistd.h>. They should not
 * conflict.
 */
#define	SEEK_SET	0
#define	SEEK_CUR	1
#define	SEEK_END	2

#define STATIC_FILE_BUFFERS 0 // 0 to use dynamic, 1 to use static file buffers
#define STATIC_IO_BUFFERS   0 // 0 to use dynamic, 1 to use static io buffers

#if STATIC_IO_BUFFERS
#define	stdin		(&__iotab[0])
#define	stdout	(&__iotab[1])
#define	stderr	(&__iotab[2])
#else
#define	stdin		(&__stdin)
#define	stdout	(&__stdout)
#define	stderr	(&__stderr)
#endif

#define	BUFSIZ	512 // RJH: was 1024
#define	LINSIZ	128 // size of stdin & stdout buffers (stderr is unbuffered)
#define	NULL		((void *)0)
#define	EOF		(-1)

#if defined(__CATALINA_P2)
#if STATIC_IO_BUFFERS
#define	FOPEN_MAX	32  // must be at least 4!
#else
#define	FOPEN_MAX	64  // must be at least 4!
#endif
#else
#if STATIC_IO_BUFFERS
#define	FOPEN_MAX	8   // must be at least 4!
#else
#define	FOPEN_MAX	20  // must be at least 4!
#endif
#endif

#if	defined(__BSD4_2)
#define	FILENAME_MAX	255
#else
#define	FILENAME_MAX	14
#endif	/* __BSD4_2 */
#define	TMP_MAX		999
#define	L_tmpnam	(sizeof("/tmp/") + 15)

typedef long int	fpos_t;

#if	!defined(_SIZE_T)
#define	_SIZE_T
typedef unsigned int	size_t;		/* type returned by sizeof */
#endif	/* _SIZE_T */

#if STATIC_IO_BUFFERS
extern FILE	__iotab[FOPEN_MAX];
#else
extern FILE	*__iotab[FOPEN_MAX];
extern FILE	__stdin, __stdout, __stderr;
#endif

int	remove(const char *_filename);
int	rename(const char *_old, const char *_new);
FILE	*tmpfile(void);
char	*tmpnam(char *_s);
int	fclose(FILE *_stream);
int	fflush(FILE *_stream);
FILE	*fopen(const char *_filename, const char *_mode);
FILE	*freopen(const char *_filename, const char *_mode, FILE *_stream);
void	setbuf(FILE *_stream, char *_buf);
int	setvbuf(FILE *_stream, char *_buf, int _mode, size_t _size);
int	fprintf(FILE *_stream, const char *_format, ...);
int	fscanf(FILE *_stream, const char *_format, ...);
int	printf(const char *_format, ...);
int	scanf(const char *_format, ...);
int	sprintf(char *_s, const char *_format, ...);
int	sscanf(const char *_s, const char *_format, ...);
int	vfprintf(FILE *_stream, const char *_format, char *_arg);
int	vprintf(const char *_format, char *_arg);
int	vsprintf(char *_s, const char *_format, char *_arg);
int	fgetc(FILE *_stream);
char	*fgets(char *_s, int _n, FILE *_stream);
int	fputc(int _c, FILE *_stream);
int	fputs(const char *_s, FILE *_stream);
int	getc(FILE *_stream);
int	getchar(void);
char	*gets(char *_s);
int	putc(int _c, FILE *_stream);
int	putchar(int _c);
int	puts(const char *_s);

size_t	fread(void *_ptr, size_t _size, size_t _nmemb, FILE *_stream);
size_t	fwrite(const void *_ptr, size_t _size, size_t _nmemb, FILE *_stream);
int	fgetpos(FILE *_stream, fpos_t *_pos);
int	fseek(FILE *_stream, long _offset, int _whence);
int	fsetpos(FILE *_stream, fpos_t *_pos);
long	ftell(FILE *_stream);
void	rewind(FILE *_stream);
void	clearerr(FILE *_stream);
int	feof(FILE *_stream);
int	ferror(FILE *_stream);
void	perror(const char *_s);
int	ungetc(int _c, FILE *_stream);

int __fillbuf(FILE *_stream);
int __flushbuf(int _c, FILE *_stream);

#define	getchar()	getc(stdin)
#define	putchar(c)	putc(c,stdout)

#define	feof(p)		(((p)->_flags & _IOEOF) != 0)
#define	ferror(p)	(((p)->_flags & _IOERR) != 0)
#define clearerr(p)	((p)->_flags &= ~(_IOERR|_IOEOF))

#if	defined(__BSD4_2) || defined(__USG) || defined(_POSIX_SOURCE)
int fileno(FILE *_stream);
FILE *fdopen(int fildes, const char *type);
#define	fileno(stream)		((stream)->_fd)
#endif	/* __BSD4_2 || __USG || _POSIX_SOURCE */

#endif	/* _STDIO_H */
