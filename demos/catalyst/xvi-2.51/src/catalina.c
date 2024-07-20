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
#include "hmi.h"
#include "cog.h"

#define ESCAPE_CHAR 0x1b

#define NUM_SPACES 40

#define KEY_TIMEOUT 100 // milliseconds

#define can_ins_line	FALSE
#define can_del_line	FALSE
#define can_scroll_area FALSE


static char SPACES[NUM_SPACES + 1] = "                                        ";

/*
 * We don't actually use these on the Catalina version, but they have to
 * exist.
 */
volatile bool_t   SIG_suspend_request;
volatile bool_t   SIG_user_disconnected;
volatile bool_t   SIG_terminate;

void ignore_signals(void)
{
}

void catch_signals(void)
{
}

void delete_a_line()
{
}

void insert_a_line()
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
 * intime() - get a key with a timeout (milliseconds)
 *
 * "timeout" of zero means no timeout.
 */
int
intime(long timeout) 
{
  int i;

  if (timeout == 0) {
     return(k_wait() & 0xff);
  }
  for (i = 0; i < timeout; i++) { // '[' or 'O' must arrive soon!
     if (k_ready()) {
         return(k_wait() & 0xff);
     } 
	   else {
       _waitms(1);
     }
	}
  return -1; // timed out
}

/*
 * inchar() - get a character from the keyboard
 *
 * "timeout" of zero means no timeout.
 */
int
inchar(long timeout)
{
   int k, t;
   int e = 0; // editing key

   k = intime(timeout);

#ifdef __CATALINA_VT100
   if (k == ESCAPE_CHAR) {
     // check for '[' or 'O' ==> ANSI sequence
     k = intime(KEY_TIMEOUT); // '[' or 'O' must arrive soon!
     if (k < 0) {
        k = ESCAPE_CHAR;
     }
     else {
        // check for ANSI sequence
        if (k == '[') {
           // decode ANSI sequence
           k = k_wait() & 0xff;
           switch (k) {
              case 'D': k = K_LARROW; break;
              case 'C': k = K_RARROW; break;
              case 'A': k = K_UARROW; break;
              case 'B': k = K_DARROW; break;
              case '1': k = K_HOME;   e = 1; break; // editing key
              case '2': k = K_INSERT; e = 1; break; // editing key
              case '3': k = K_DELETE; e = 1; break; // editing key
              case '4': k = K_END;    e = 1; break; // editing key
              case '5': k = K_PGUP;   e = 1; break; // editing key
              case '6': k = K_PGDOWN; e = 1; break; // editing key
              default: break;
           }
           if (e) {
              t = k_wait() & 0xff; // get trailing '~'
              if (t != '~') {
                 // incorrect editing key sequence
                 k = -1;
              }
              return k;
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
   char str[20];
   int rows = 0;
   int cols = 0;
   int k = 0;

   Rows = 24;
   Columns = 80;
   _waitms(100);
   sprintf(str,"%c[999;999H", ESCAPE_CHAR);
   t_string(1, str);
   sprintf(str,"%c[6n", ESCAPE_CHAR);
   t_string(1, str);
   _waitms(100);
   k = intime(KEY_TIMEOUT);
   if (k == ESCAPE_CHAR) {
      k = intime(KEY_TIMEOUT);
      if (k == '[') {
         k = intime(KEY_TIMEOUT);
         while (isdigit(k)) {
            rows = 10*rows + (k - '0');
            k = intime(KEY_TIMEOUT);
         }
         if (k == ';') {
            k = intime(KEY_TIMEOUT);
            while (isdigit(k)) {
               cols = 10*cols + (k - '0');
               k = intime(KEY_TIMEOUT);
            }
            if (k == 'R') {
               Rows = rows;
               Columns  = cols;
            }
         }
      }
   }
   // RESET MAY DISABLE AUTO WRAP ...
   //t_char(1, ESCAPE_CHAR);
   //t_char(1, 'c');
   // AND THIS MAY BE UNABLE TO RE-ENABLE IT ...
   //sprintf(str,"%c[7h", ESCAPE_CHAR); // set auto-wrap
   //t_string(1, str);
   // SO INSTEAD OF A RESET, WE JUST CLEAR THE SCREEN ...
   sprintf(str,"%c[2J", ESCAPE_CHAR); // erase screen
   t_string(1, str);
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
   tty_goto(Rows+1, 0);
   set_colour(9); // revert to default fg and bg colours
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
// color must be supported on a per-character basis, so we cannot use it
// on the P1 in HIRES_VGA mode or if the  Columns variable is greater than 
// 40. We can use it in VT100 mode if we have VT100 emulator with 
// colour support (such as comms.exe). This must be indicated by defining
// either the Catalina symbol USE_COLOR or USE_COLOUR (in addition to the
// Catalina symbol VT100). Note that anything other than 0 .. 7 
// (or 30 .. 37) means the current default fg colour.
#if defined (__CATALINA_VT100)
#if defined(__CATALINA_USE_COLOR) || defined(__CATALINA_USE_COLOUR)
   switch(c) {
     case 0  :
               t_char(1, ESCAPE_CHAR);
               t_string(1, "[0;30m");
               break;
     case 1  :
     case 31  :
               t_char(1, ESCAPE_CHAR);
               t_string(1, "[0;31m");
               break;
     case 2  :
     case 32  :
               t_char(1, ESCAPE_CHAR);
               t_string(1, "[0;32m");
               break;
     case 3  :
     case 33  :
               t_char(1, ESCAPE_CHAR);
               t_string(1, "[0;33m");
               break;
     case 4  :
     case 34  :
               t_char(1, ESCAPE_CHAR);
               t_string(1, "[0;34m");
               break;
     case 5  :
     case 35  :
               t_char(1, ESCAPE_CHAR);
               t_string(1, "[0;35m");
               break;
     case 6  :
     case 36  :
               t_char(1, ESCAPE_CHAR);
               t_string(1, "[0;36m");
               break;
     case 7 : 
     case 37  :
               t_char(1, ESCAPE_CHAR);
               t_string(1, "[0;37m");
               break;
     case 10  :
               t_char(1, ESCAPE_CHAR);
               t_string(1, "[1;30m");
               break;
     case 11  :
               t_char(1, ESCAPE_CHAR);
               t_string(1, "[1;31m");
               break;
     case 12  :
               t_char(1, ESCAPE_CHAR);
               t_string(1, "[1;32m");
               break;
     case 13  :
               t_char(1, ESCAPE_CHAR);
               t_string(1, "[1;33m");
               break;
     case 14  :
               t_char(1, ESCAPE_CHAR);
               t_string(1, "[1;34m");
               break;
     case 15  :
               t_char(1, ESCAPE_CHAR);
               t_string(1, "[1;35m");
               break;
     case 16  :
               t_char(1, ESCAPE_CHAR);
               t_string(1, "[1;36m");
               break;
     case 17 : 
               t_char(1, ESCAPE_CHAR);
               t_string(1, "[1;37m");
               break;
     default  :
               t_char(1, ESCAPE_CHAR);
               t_string(1, "[0;39m");
               break;
   }
#endif
#else
#if defined(__CATALINA_P2)
   t_color(1, c);
#else
#if !defined(__CATALINA_HIRES_VGA)
   if (Columns <= 40) {
      t_color(1, c);
   }
#endif
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

