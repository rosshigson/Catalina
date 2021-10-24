/* Copyright (c) 2009 Ross Higson */
#ifndef lint
static char *sccsid = "@(#)catalina.c 1.0 (Ross Higson) 20/12/2009";
#endif

/***

* program name:
    xvi
* function:
    Portable version of UNIX "vi" editor, with extensions.
* module name:
    catalina.c
* module function:
    System interface module for Catalina.
* history:
    STEVIE - ST Editor for VI Enthusiasts, Version 3.10
    Originally by Tim Thompson (twitch!tjt)
    Extensive modifications by Tony Andrews (onecom!wldrdg!tony)
    Heavily modified by Chris & John Downey
    Catalina version by Ross Higson

    NOTES ON VT100 Terminal Emulation:
       - Terminal must be 24 rows by 80 columns
       - Terminal must have alternate keypad mode enabled


***/

#include "xvi.h"
#include "catalina_hmi.h"
#include "catalina_cog.h"

#define ESCAPE_CHAR 0x1b

#define NUM_SPACES 40

#define KEY_RETRIES 100

static char SPACES[NUM_SPACES + 1] = "                                        ";

/*
 * We don't actually use these on the MS-DOS version, but they have to
 * exist.
 */
volatile   unsigned char   SIG_suspend_request;
volatile   unsigned char   SIG_user_disconnected;
volatile   unsigned char   SIG_terminate;

void
ignore_signals(void)
{
    
}

void
catch_signals(void)
{
    
}

/*
 * forward declarations
 */
void invis_cursor();
void vis_cursor();

/*
 * These are globals which are set by the OS-specific module,
 * and used for various purposes throughout the rest of xvi.
 */
int Rows;      /* Number of Rows and Columns */
int Columns;   /* in the current window. */

static char tmpbuff[L_tmpnam];
static char *logscreen;
static char rootdir[]= {"\\"};

/*
 * inchar() - get a character from the keyboard
 *
 * "timeout" parameter not handled yet.
 */
int
inchar(long timeout)
{
   int i, k;
   int got_key;

   k = k_wait() & 0xff; // TODO - handle timeout

#ifdef __CATALINA_VT100
   if (k == ESCAPE_CHAR) {
     // check for '[' or 'O' ==> ANSI sequence
     got_key = 0;
     for (i = 0; i < KEY_RETRIES; i++) { // '[' or 'O' must arrive soon!
        if (k_ready()) {
           k = k_wait() & 0xff;
           got_key = 1;
           break;
        } 
	else {
           _waitcnt(_cnt() + _clockfreq() / 1000);
	}
     }
     if (got_key) {
        // check for ANSI sequence
        if (k == '[') {
           // decode ANSI sequence
           k = k_wait() & 0xff;
           switch (k) {
              case 'D': k = K_LARROW; break;
              case 'C': k = K_RARROW; break;
              case 'A': k = K_UARROW; break;
              case 'B': k = K_DARROW; break;
              case 'P': k = K_HELP; break; // PF1
              default: break;
           }
        }
        else if (k == 'O') {
           // decode ANSI sequence
           k = k_wait() & 0xff; // TODO - handle timeout
           switch (k) {
              case 'D': k = K_LARROW; break;
              case 'C': k = K_RARROW; break;
              case 'A': k = K_UARROW; break;
              case 'B': k = K_DARROW; break;
              case 't': k = K_LARROW; break;
              case 'v': k = K_RARROW; break;
              case 'x': k = K_UARROW; break;
              case 'r': k = K_DARROW; break;
              case 'w': k = K_HOME; break;
              case 'q': k = K_END; break;
              case 'y': k = K_PGUP; break;
              case 's': k = K_PGDOWN; break;
              case 'P': k = K_HELP; break; // PF1
              default:  break;
           }
        }
     }
   }
   return k;
#else
  
   switch (k) {
      case 192: k = K_LARROW; break;
      case 193: k = K_RARROW; break;
      case 194: k = K_UARROW; break;
      case 195: k = K_DARROW; break;
      case 196: k = K_HOME; break;
      case 197: k = K_END; break;
      case 198: k = K_PGUP; break;
      case 199: k = K_PGDOWN; break;
      case 201: k = 0x7f; break; // DEL
      case 202: k = K_INSERT; break;
      case 208: k = K_HELP; break; // F1
      default: break;
   }
   return k;
#endif   
}

void
outchar(char c)
{
    t_char(1, c);
}

void
outstr(char   *s)
{
    t_string(1, s);
}

void
alert()
{
   // TODO - maybe flash screen?
}

/*
 * erase_line - erase to end of line
 */
void
erase_line()
{
   long location = t_getpos(1);
   int row = location & 0xff;
   int col = (location >> 8) & 0xff;
   int i;
#ifdef __CATALINA_VT100
   t_char(1, ESCAPE_CHAR);
   t_string(1, "[K");
#else
   invis_cursor();
   i = col;
   while (Columns - col > NUM_SPACES) {
      t_string(1, SPACES);
      col += NUM_SPACES;
   }
   if (col < Columns) {
      t_string(1, SPACES + (NUM_SPACES - (Columns - col)));
   }
   //for (i = col; i < Columns; i++) {
   //   t_char(1, ' ');
   //}
   t_setpos(1, col, row);
   vis_cursor();
   //(void)puts("erase line not implemented!");
#endif
}

/*
 * erase_display - erase display
 */
void
erase_display()
{

#ifdef __CATALINA_VT100
   t_char(1, ESCAPE_CHAR);
   t_string(1, "[2J");
#else
   t_char(1,0x0c);
#endif
}

/*
 * insert_line - insert one line
 */
void
insert_line()
{
   (void)puts("insert line not implemented!");
}

/*
 * delete_line - delete one line
 */
void
delete_line()
{
   (void)puts("delete line not implemented!");
}

/*
 * invis_cursor - invisible cursor
 */
void
invis_cursor()
{
#ifdef __CATALINA_VT100
   t_char(1, ESCAPE_CHAR);
   t_string(1, "[?25l");
#else
   t_mode (1, 0);
#endif   
}


/*
 * vis_cursor - visible cursor
 */
void
vis_cursor()
{
#ifdef __CATALINA_VT100
   t_char(1, ESCAPE_CHAR);
   t_string(1, "[?25h");
#else
#ifdef __CATALINA_P2
   t_mode (1, 3);
#else
   t_mode (1, 1);
#endif
#endif   
}

bool_t
can_write(char   *file)
{
   return TRUE;
}

void
sys_init()
{
#ifdef __CATALINA_VT100
   Rows = 24;
   Columns = 80;
   t_char(1, ESCAPE_CHAR);
   t_string(1, "c");
#else
   int i;

   i = t_geometry();

   Rows = i & 0xFF;
   Columns = (i >> 8) & 0xFF;

   if (Rows == 0) {
      // assume sone kind of serial terminal
      Rows = 24;
   }
   if (Columns == 0) {
      // assume sone kind of serial terminal
      Columns = 80;
   }
   vis_cursor();
#endif   
}

void
sys_startv()
{
}

void
sys_endv()
{
}

void
sys_exit(int   r)
{
   tty_goto(25, 0);
   outchar('\n');

   exit(r);
}

void
tty_goto(int   r, int c)
{
#ifdef __CATALINA_VT100
   char str[10];
   sprintf(str,"[%d;%dH", r+1, c+1);
   t_char(1, ESCAPE_CHAR);
   t_string(1, str);
#else
   t_setpos(1, c, r);
#endif
#ifdef __CATALINA_P2
   // slow down output a little on the P2 (writing too fast can
   // cause characters to be lost - not sure where yet!)
   _waitcnt(_cnt() + _clockfreq() / 3000);
#endif
}

/*
 * System calls or library routines missing in Catalina.
 */

void
sleep(unsigned   n)
{
   int i;
   for (i = 0; i < n; i++) {
       _waitcnt(_cnt() + _clockfreq());
   }
}

void
Wait200ms()
{
    _waitcnt(_cnt() + _clockfreq() / 5);
}

/*
 * Set the specified colour. Just does standout/standend mode for now.
 * Optimisation here to avoid setting standend when we aren't in
 * standout; assumes calling routines are well-behaved (i.e. only do
 * screen movement in P_colour) or some terminals will write garbage
 * all over the screen.
 */
void
set_colour(int   c)
{
// color must be supported on a per-character basis, so we cannot use it (on 
// the P1) with with either the HIRES_VGA or (on the P1 or P2) the VT100 
// option, or (on the P1) if the Columns variable is greater than 40 
#if defined(__CATALINA_P2)
#if !defined(__CATALINA_VT100)
   t_color(1, c);
#endif
#else
#if !(defined(__CATALINA_VT100) || defined(__CATALINA_HIRES_VGA))
   if (Columns <= 40) {
      t_color(1, c);
   }
#endif
#endif
}

/*
 * tempfname - Create a temporary file name.
 */
char *
tempfname(char *srcname)
{
    return(tmpnam(tmpbuff));
}

char *
getcwd(char *buf, size_t size)
{
   (void)puts("getcwd not implemented!");
   return rootdir;
}

int chdir(char *path) {
   (void)puts("chdir not implemented!");
   return TRUE;
}

bool_t exists(char *buf)
{
   return FALSE; // TODO - check file exists
}

/*
 * cat_scroll - scroll the screen.
 */
void
cat_scroll(unsigned start, unsigned end, int nlines)
{
   (void)puts("scrolling not implemented!");
}

int
call_system(char *command)
{
   (void)puts("system command not implemented!");
   return -1;
}

int
call_shell(char *sh)
{
   (void)puts("shell command not implemented!");
   return -1;
}


bool_t
sys_pipe(char *cmd, int (*writefunc) P((FILE *)), long (*readfunc) P((FILE *)))
{
   (void)puts("Pipes not implemented!");
   return -1;
}

