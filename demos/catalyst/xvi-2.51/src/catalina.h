/* Copyright (c) 2009 Ross Higson */
/***

* @(#)catalina.h 1.0 (Ross Higson) 20/12/09

* program name:
    xvi
* function:
    Portable version of UNIX "vi" editor, with extensions.
* module name:
    catalina.h
* module function:
    Definitions for Catalina system interface module.
* history:
    STEVIE - ST Editor for VI Enthusiasts, Version 3.10
    Originally by Tim Thompson (twitch!tjt)
    Extensive modifications by Tony Andrews (onecom!wldrdg!tony)
    Heavily modified by Chris & John Downey
    Catalina version by Ross Higson

***/

#ifndef HELPFILE
#   define  HELPFILE "help.xvi"
#endif

/*
 * System-dependent constants
 */

/*
 * These numbers may not be right for TOS; who knows?
 */
#define MAXPATHLEN   79   /* maximum length of full path name */
#define MAXNAMLEN    12   /* maximum length of file name */
#define DIRSEPS      "\\"

extern int Rows;         /* size of screen */
extern int Columns;

#define flush_output() fflush(stdout)

/*
 * Default file format.
 */
#define DEF_TFF fmt_UNIX

/*
 * Terminal driving functions.
 */
#define   scroll_up(x, y, z)   cat_scroll((x),(y),(z))   /* scroll up area */
#define   scroll_down(x, y, z) cat_scroll((x),(y),-(z))  /* scroll down area */

#define   cost_goto      0        /* cost of using tty_goto() */
#define   can_ins_line   FALSE
#define   can_del_line   FALSE
/*
 * tty_linefeed() isn't needed if can_del_line is TRUE.
 */
#define tty_linefeed()

#define   can_scroll_area   FALSE

#define   can_inschar   FALSE
#define   inschar(c)

/*
 * Colour handling:
 */
#define DEF_COLOUR	  "7"
#define DEF_SYSCOLOUR	"7"
#define DEF_STCOLOUR	"2"
#define DEF_ROSCOLOUR	"1"
#define DEF_TAGCOLOUR	"3"

/*
 * Macros to open files in binary mode,
 * and to expand filenames.
 */
#define fopenrb(f)   fopen((f), "rb")
#define fopenwb(f)   fopen((f), "wb")
#define fopenab(f)   fopen((f),"a")
#define fexpand(f, c) (f)

#define   subshells   FALSE

/*
 * Declarations for system interface routines in catalina.c.
 */
extern  int       inchar(long);
extern  void      outchar(char);
extern  void      outstr(char *);
extern  void      alert(void);
extern  bool_t    exists(char *);
extern  bool_t    can_write(char *);
extern  void      sys_init(void);
extern  void      sys_startv(void);
extern  void      sys_endv(void);
extern  void      sys_exit(int);
extern  void      tty_goto(int, int);
extern  void      Wait200ms(void);
extern  void      sleep(unsigned);
extern  void      set_colour(int);
extern  char      *tempfname(char *);

extern  char      *getcwd(char *, size_t);
extern  int       chdir(char *path);
extern  int       call_system(char *command);
extern  int       call_shell(char *sh);
extern  bool_t    sys_pipe P((char *, int (*)(FILE *), long (*)(FILE *)));

