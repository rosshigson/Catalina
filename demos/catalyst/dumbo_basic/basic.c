/******************************************************************
 *                           Dumbo BASIC                          *
 *                           version 1.6                          *
 *                         by Ross Higson                         *
 *                                                                *
 *                     (very loosely) based on                    *
 *                           Mini BASIC                           *
 *                        by Malcolm McLean                       *
 ******************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <math.h>
#include <limits.h>
#include <ctype.h>
#include <assert.h>
#include <errno.h>
#include <time.h>

#ifdef __CATALINA__
#include <rtc.h>
#include <hmi.h>
#else
#ifdef _WIN32
#include <conio.h>
#else
#include <termios.h>
#include <unistd.h>
#include <fcntl.h>
#endif
#include <sys/time.h>
#endif

#include "tokens.h"

/* debug flags and other general constants */
#define DEBUG             0
#define XDEBUG            0

#define NEW_GETTOKEN      0     /* 1 means use gettoken changes added in 1.0 */

#define TOKENIZE_ON_LOAD  1     /* tokenize lines as they are loaded */
#define PRINT_TOKENS      0     /* print tokenized lines */

#define PRINT_ON_LOAD     0     /* print program lines as they are loaded  */
#define PRINT_ON_ERROR    1     /* print program line when error occurs */

#define ERROR_NOT_EOL     1     /* error if extra tokens after EOL expected */

#define AUTODEF           1     /* autodefine undefined variables */
#define DEFTYPE           FLTID /* default type if no other type specified */
#define MAX_TOKENS        1024  /* max tokens in line */
#define MAX_CHARS         1024  /* max chars in line */

#define debug printf


/* error codes (in BASIC script) defined */
#define ERR_CLEAR 0
#define ERR_SYNTAX 1
#define ERR_OUTOFMEMORY 2
#define ERR_IDTOOLONG 3
#define ERR_NOSUCHVARIABLE 4
#define ERR_BADSUBSCRIPT 5
#define ERR_TOOMANYDIMS 6
#define ERR_TOOMANYINITS 7
#define ERR_BADTYPE 8
#define ERR_TOOMANYFORS 9
#define ERR_NONEXT 10
#define ERR_NOFOR 11
#define ERR_DIVIDEBYZERO 12
#define ERR_NEGLOG 13
#define ERR_NEGSQR 14
#define ERR_BADSINCOS 15
#define ERR_EOF 16
#define ERR_ILLEGALOFFSET 17
#define ERR_TYPEMISMATCH 18
#define ERR_INPUTTOOLONG 19
#define ERR_BADVALUE 20
#define ERR_NOTINT 21
#define ERR_NOTEOL 22
#define ERR_NOWHILE 23
#define ERR_TOOMANYWHILES 24
#define ERR_NOWEND 25
#define ERR_NOIF 26
#define ERR_NOGOSUB 27
#define ERR_TOOMANYGOSUBS 28
#define ERR_NORETURN 29
#define ERR_BADSELECTOR 30
#define ERR_NODATA 31
#define ERR_EXPRESSION 32
#define ERR_EXPONENT 33
#define ERR_TOOMANYDEFS 34
#define ERR_TOOMANYARGS 35
#define ERR_FNNOTALLOWED 36
#define ERR_OVERFLOW 37
#define ERR_BADDATE 38
#define ERR_BADTIME 39
#define ERR_UNTERMINATED 40
#define ERR_LINETOOLONG 41
#define ERR_RESUME 42
#define ERR_BADMODE 43
#define ERR_BADFILE 44
#define ERR_BADNAME 45
#define ERR_BADREC 46
#define ERR_NOFILE 47
#define ERR_FIELDOVR 48
#define ERR_BADRECNUM 49
#define ERR_BADUSR 50
#define ERR_ILLEGALFNCALL 51
#define ERR_DISKFULL 61
#define ERR_INTERNAL 99


/* program constants */
#define MAXFORS      32     /* maximum number of nested fors */
#define MAXWHILES    32     /* max number of nested whiles */
#define MAXGOSUBS    32     /* max number of nested gosubs */
#define MAXID        40     /* max length of id (var name) */
#define MAXFNS       32     /* max number of user defined functions */
#define MAXARG        5     /* max number of user defined function arguments */
#define MAXFILES      3     /* max number of open files */
#define MAXNAME     128     /* max name length for files */
#define MAXREC      128     /* max record length for files */
#define MAXUSING     24     /* maximum size of USING clause */

typedef struct {
  int no;               /* line number (negative if the line has no number) */
  unsigned char *str;   /* start of line */
  int len;              /* length of tokenized line */
  unsigned char *tok;   /* start of tokenized line (NULL if not tokenized) */
} SOURCE_LINE;

typedef union {
  float dval;           /* value if a real */
  int ival;             /* value if an integer */
  int indx;             /* index if a line */
} UVALUE;

typedef union {
  float dval;           /* value of real */
  int ival;             /* value of integer */
  unsigned char *sval;  /* value of char */
  unsigned char byte[8];/* value of above as bytes */
} CONVERTER;

typedef struct {
  unsigned char type;   /* type of rvalue, INTID or FLTID or LINE */
  UVALUE val;           /* union of different value types */
} RVALUE;

typedef struct {
  unsigned char id[MAXID + 1];   /* id of variable */
  unsigned char type;            /* its type, INTID, STRID or FLTID */
  unsigned int len;              /* length (for STRID used as FIELD only) */
  union {
     float dval;                 /* its value if a real */
     unsigned char *sval;        /* its value if a string (malloced) */
     int ival;                   /* its value if an integer */
  } val;
} VARIABLE;

typedef struct {
   unsigned char type;  /* type of variable or argument */
   unsigned char indx;  /* index of variable or argument (0 .. 255 only) */
} VARARG;  

typedef struct {
  unsigned char id[MAXID + 1]; /* id of user def function (prefixed with 'FN')*/
  unsigned char type;          /* its type, INTID, STRID or FLTID */
  int  nargs;                  /* number of arguments */
  VARIABLE arg[MAXARG];        /* the arguments (and storage for values) */
  int indx;                    /* the function line index */
  int offs;                    /* the function line offset */
} FUNCTION;

typedef struct {
  unsigned char id[MAXID + 1]; /* id of dimensioned variable */
  unsigned char type;          /* its type, INTID, STRID or FLTID */
  unsigned int len;            /* length (for STRID used as FIELD only) */
  int ndims;                   /* number of dimensions */
  int dim[5];                  /* dimensions in x y order */
  union {
     unsigned char **sval;     /* pointer to string data */
     float *dval;              /* pointer to real data */
     int *ival;                /* pointer to integer data */
  } val;
} DIMVAR;

typedef struct {
  unsigned char type;          /* type of var (INTID, STRID, FLTID or ERRID */ 
  unsigned int len;            /* length (for STRID used as FIELD only) */
  union {
     unsigned char **sval;     /* pointer to string data */
     float *dval;              /* pointer to real data */
     int *ival;                /* pointer to integer data */
  } val;
} LVALUE;

typedef struct {
  unsigned char id[MAXID + 1];  /* id of control variable */
  LVALUE control;               /* type and value of control variable */
  int nextline;                 /* line below FOR to which control passes */
  RVALUE toval;                 /* terminal value */
  RVALUE step;                  /* step size */
} FORLOOP;

typedef struct {
  int nextline;         /* line below WHILE to which control passes */
} WHILELOOP;

typedef struct {
  int nextline;         /* line below GOSUB to which control passes */
} GOSUBSTACK;

typedef struct {
  FILE *file;                      /* file handle (non-null when open) */
  int  mode;                       /* 0=input, 1=output, 2=random, 3=append */
  unsigned char buff[MAXREC];      /* file buffer (if random) */
  int  reclen;                     /* record length (if random) */
} FILE_TYPE;


static unsigned char *nullstr = (unsigned char *)"";

static int deftype['Z' - 'A' + 1];     /* default type for variables A .. Z */

static unsigned int usr_function[10];  /* assembly functions (via DEF USR) */

static FUNCTION functions[MAXFNS];     /* user defined functions */
static int nfunctions;                 /* number of functions in list */

static FUNCTION *context;              /* context (if within user defined function) */

static FORLOOP forstack[MAXFORS];      /* stack for for loop conrol */
static int nfors;                      /* number of fors on stack */

static WHILELOOP whilestack[MAXWHILES];/* stack for while loop conrol */
static int nwhiles;                    /* number of whiles on stack */

static GOSUBSTACK gosubstack[MAXGOSUBS]; /* stack for gosubs */
static int ngosubs;                    /* number of gosubs on stack */

static FILE_TYPE FILES[MAXFILES];      /* files */

static VARIABLE *variables;            /* the scripts variables */
static int nvariables;                 /* number of variables */

static DIMVAR *dimvariables;           /* dimensioned arrays */
static int ndimvariables;              /* number of dimensioned arrays */

static SOURCE_LINE *lines;             /* list of line starts */
static int nlines;                     /* number of BASIC lines in program */

static int  tron = 0;                  /* trace lines */
static int  pos = 1;                   /* line position (for input and print) */
static char last_char = 0;             /* last charaacter output */
static int  width = 80;                /* current line width */
static int  base = 0;                  /* can be set by OPTION BASE to 0 or 1 */
static int  base_set = 0;              /* set to 1 when OPTION BASE used */
float  last_rnd;                       /* last random number returned */
static FILE *fpin;                     /* input stream */
static FILE *fpout;                    /* output strem */
static FILE *fperr;                    /* error stream */

static int current_indx = 0;           /* line we are parsing */
static int current_offs = 0;           /* offset into line */

static int tokenized = 0;              /* source has been tokenized */
static int token = 0;                  /* current token (lookahead) */

static int errorflag = 0;              /* set when error in input encountered */
static int errorlast = 0;              /* set when error in input encountered */
static int errorindx = 0;              /* set when error in input encountered */
static int resume_indx = 0;            /* line we will resume to */

static int data_indx = 0;              /* current read index */
static int data_offs = 0;              /* current read offs */

static int in_call = 0;                /* 1 when processing CALL statement */

#ifdef __CATALINA__
extern int assembly_addr = 0;   /* address to call for assembly function */
extern int assembly_retn = 0;   /* value to return from assembly function */
#endif


static int setup(unsigned char *script);
static void cleanup(void);

static void reporterror(int lineno);
static int findline(int no);

static int strcmp_i(unsigned char *str1, unsigned char *str2);
static int strncmp_i(unsigned char *str1, unsigned char *str2, int len);

static int lineno(int index);

static int execute_line(void);

static void do_print(void);
static void do_write(void);
static void do_fileprint(void);
static void do_filewrite(void);
static void do_let_or_usr(void);
static void do_dim(void);
static int do_if(void);
static int do_goto(void);
static int do_error(void);
static int do_restore(void);
static void do_input(void);
static void do_lineinput(void);
static void do_fileinput(void);
static void do_filelineinput(void);
static int do_rem(void);
static void do_tron(void);
static void do_troff(void);
static int do_for(void);
static int do_next(void);
static int do_while(void);
static int do_wend(void);
static int do_gosub(void);
static int do_return(void);
static void do_end(void);
static void do_stop(void);
static int do_on(void);
static void do_data(void);
static int do_read(void);
static void do_deffn(void);
static void do_defusr(void);
static void do_clear(void);
static void do_width(void);
static int do_defint(void);
static int do_defsng(void);
static int do_defdbl(void);
static int do_defstr(void);
static int do_date(void);
static int do_time(void);
static int do_datestring(void);
static int do_timestring(void);
static void do_swap(void);
static void do_randomize(void);
static void do_cls(void);
static int do_option(void);

static void do_open(void);
static void do_close(void);
static void do_put(void);
static void do_get(void);
static void do_field(void);
static void do_lset(void);
static void do_rset(void);
static void do_poke(void);
static void do_call(void);
static int do_resume(void);

static void lvalue(LVALUE *lv);

static RVALUE expr(int level);
static RVALUE binop(RVALUE left, int op, RVALUE right);
static RVALUE stringfactor(void);
static RVALUE factor(void);
static RVALUE variable(void);
static RVALUE dimvariable(void);
static RVALUE variable_addr(void);
static RVALUE dimvariable_addr(void);

static int int_usr(int i, int arg);
static float real_usr(int i, float arg);
static unsigned char *str_usr(int i, unsigned char *arg);

static int instr(void);

static RVALUE DUMMY_IVALUE = {INTID, { 0 } };
static RVALUE DUMMY_FVALUE = {FLTID, { 0 } };

static FUNCTION *findfunction(unsigned char *name, int len);
static VARIABLE *findvariable(unsigned char *id);
static int findvarindx(unsigned char *id);
static DIMVAR *finddimvar(unsigned char *id);
static int finddimvarindx(unsigned char *id);
static DIMVAR *dimension(unsigned char *id, int ndims, ...);
static void *getdimvar(DIMVAR *dv, ...);
static VARIABLE *addautovar(const unsigned char *id);
static VARIABLE *addinteger(const unsigned char *id);
static VARIABLE *addfloat(const unsigned char *id);
static VARIABLE *addstring(const unsigned char *id);
static DIMVAR *adddimvar(const unsigned char *id);
static DIMVAR *autodimvar(unsigned char *id);

static unsigned char *stringexpr(void);
static unsigned char *chrstring(void);
static unsigned char *strstring(void);
static unsigned char *leftstring(void);
static unsigned char *rightstring(void);
static unsigned char *midstring(void);
static unsigned char *hexstring(void);
static unsigned char *octstring(void);
static unsigned char *datestring(void);
static unsigned char *timestring(void);
static unsigned char *spacestring(void);
static unsigned char *mkistring(void);
static unsigned char *mksstring(void);
static unsigned char *mkdstring(void);
static unsigned char *inkeystring(void);
static unsigned char *inputstring(void);
static unsigned char *stringstring(void);
static unsigned char *stringdimvar(void);
static unsigned char *stringvar(void);
static unsigned char *stringliteral(void);
static unsigned char *varptrstring();

static int strict_integer(RVALUE x);
static int integer(RVALUE x);
static float real(RVALUE x);

static void match_token(int tok);
static void match_eol(void);
static void match_literal(void);
static unsigned char *untokenized_eol(unsigned char *str);
static void find_eol(void);
static void seterror(int errorcode);
static int is_eol(int token);
static int is_string(int token);
static int getvalue(RVALUE *val);
static void putvalue(RVALUE val);
static int getlineindex(RVALUE *val);
static int getid(unsigned char *out);
static int getindex(void);
static int gettoken(void);
void next_token(void);
static unsigned char *getcurrentpos(void);
static RVALUE getstringvalue(unsigned char *str, int *len);

static int tokenlen(void);

static void mystrgrablit(unsigned char *dest, unsigned char *src);
static unsigned char *mystrend(unsigned char *str, char quote);
static int linecount(unsigned char *str);
static unsigned char *mystrdup(unsigned char *str);
static unsigned char *mystrndup(unsigned char *str, int n);
static unsigned char *mystrconcat(unsigned char *str, unsigned char *cat);
static float factorial(float x);
static long mystrtoll(const char *str, char **end, int base);

/*
 * Interpret a BASIC script
 *
 * Params: script - the script to run
 *     in - input stream
 *     out - output stream
 *     err - error stream 
 * Returns: 0 on success, 1 on error condition.
 */
int basic(unsigned char *script, FILE *in, FILE *out, FILE *err) {
  int index = 1;
  int nextline;
  int result = 0;

  fpin  = in;
  fpout = out;
  fperr = err;

  if (setup(script) == -1) {
     return 1;
  }
  
  data_indx = 0;
  data_offs = 0;

  while (index != -1) {
    errorflag = 0;
   
    current_indx = index; 
    current_offs = 0;
    nextline = execute_line();

    if (errorflag) {
       if (resume_indx > 0) {
          nextline = resume_indx;
       }
       else {
          reporterror(lineno(index));
          result = 1;
          break;
       }
    }
    else {
       match_eol();
    }

    if (nextline == 0) {
       token = gettoken();
#if ERROR_NOT_EOL
       // error if not at EOL when we finishg executing a statement
       // note that trailing REM or ' is ok
       if ((current_offs != 0) 
       &&  !is_eol(token) 
       &&  !(token == REM)
       && !(token == '\'')) {
          errorflag = ERR_NOTEOL;
          reporterror(lineno(index));
          result = -1;
          break;
       }
#endif
       index++;
       if (index >= nlines - 1) {
          break;
       }
    }
    else if (nextline > 0) {
       index = nextline;
       if (index >= nlines - 1) {
          break;
       }
    }
    else {
       result = -1;
       break;
    }
  }

  cleanup();
 
  if (in == stdin) {
     printf("\n\nBASIC exiting - press ENTER to continue");
     fgetc(in); 
  }
  return result;
}

/*
 * space_or_tab - char is space or tab
 */
static int space_or_tab(char ch) {
   return ((ch == ' ') || (ch == '\t'));
}

/*
static int digit(unsigned char ch) {
   return (isdigit(ch) && (ch < 0x80));
}
static int alpha(unsigned char ch) {
   return (isalpha(ch) && (ch < 0x80));
}
static int alnum(unsigned char ch) {
   return (isalnum(ch) && (ch < 0x80));
}
*/

#define digit(char) isdigit(char)
#define alpha(char) isalpha(char)
#define alnum(char) isalnum(char)

/*
 * print_tokenized_line - print the tokenized line at the given index
 */
static void print_tokenized_line(int index) {
   unsigned char *str;
   int i;

#if DEBUG
      fprintf(fperr, "  tokenized ", index);
#endif

   if ((lines[index].tok) && (*lines[index].tok)) {
#if DEBUG
      fprintf(fperr, "%5d: line ", index);
#endif
      //debug("  tokenized %5d: line ", index);
      if (lines[index].no >= 0) {
         fprintf(fperr, "%6d: ", lines[index].no);
      }
      else {
         fprintf(fperr, "      : ");
      }
      str = lines[index].tok;
      for (i = 0; i < lines[index].len; i++) {
         fprintf(fperr, "[%2X] ", str[i]);
      }
      fputc('\n',fperr);
   }
#if DEBUG
   fputc('\n',fperr);
#endif
}

/*
 * print_untokenized_line - print the untokenized line at the given index
 */
static void print_untokenized_line(int index) {
   unsigned char *tmpstr1;
   unsigned char *tmpstr2;

#if DEBUG
      fprintf(fperr, "untokenized ", index);
#endif
   if ((lines[index].str) && (*lines[index].str)) {
#if DEBUG
      fprintf(fperr, "%5d: line ", index);
#endif
      if (lines[index].no >= 0) {
         fprintf(fperr, "%6d: ", lines[index].no);
      }
      else {
         fprintf(fperr, "      : ");
      }
      tmpstr1 = lines[index].str;
      tmpstr2 = untokenized_eol(tmpstr1);
      while (tmpstr1 < tmpstr2) {
         fputc(*tmpstr1,fperr);
         tmpstr1++;
      }
      fputc('\n',fperr);
   }
}

/*
 * tokenize_line - tokenize current line for faster execution
 */
static void tokenize_line(int index) {
   unsigned char *tmpstr1;
   unsigned char *tmpstr2;
   int     i;
   int     pos, tmppos;
   int     len;
   RVALUE  val;
   unsigned char    buff[MAXID + 1];
   unsigned char    tokens[MAX_TOKENS + 1];
   int     tok;
   int     indx;
   int     in_def;
   VARIABLE *var;
   DIMVAR   *dimvar = NULL;


   current_indx = index;
   current_offs = 0;
   pos = 0;
   in_def = 0; // set to 1 if within DEF statement
   in_call = 0; // set to 1 if within CALL statement
   if (lines[current_indx].tok) {
      // free any existing tokenized version of line
      free(lines[current_indx].tok);
      lines[current_indx].tok = NULL;
   }
   // generate a new tokenized version of line
   if ((lines[current_indx].str) && (*lines[current_indx].str)) {
      while (!errorflag) {
#if DEBUG
         printf("calling gettoken\n");
#endif
         tok = (token = gettoken());
#if DEBUG
         printf("token=%d, pos = %d\n", tok, pos);
#endif
         switch (tok) {
            case OPTION :
               // for OPTION, we mst actually do them now,
               // since OPTION BASE affects array declarations
               do_option();
               break;
            case DEF :
               match_token(DEF);
               if (token == USR) {
                  // for DEF USR statements, we just tokenize them
                  match_token(USR);
                  tokens[pos++] = DEF;
                  tokens[pos++] = USR;
               }
               else {
                  // it must be DEF FN, so we must actually do the DEF now
                  // and also disable tokenization in this statement
                  in_def = 1;
                  do_deffn();
               }
               break;
            case DEFINT :
               // for DEFINT, we must actually do the DEF now
               // and also disable tokenization in this statement
               in_def = 1;
               do_defint();
               break;
            case DEFSNG :
               // for DEFSNG, we must actually do the DEF now
               // and also disable tokenization in this statement
               in_def = 1;
               do_defsng();
               break;
            case DEFDBL :
               // for DEFDBL, we must actually do the DEF now
               // and also disable tokenization in this statement
               in_def = 1;
               do_defdbl();
               break;
            case DEFSTR :
               // for DEFSTR, we must actually do the DEF now
               // and also disable tokenization in this statement
               in_def = 1;
               do_defstr();
               break;
            case DIM:
               // for DIM, we must actually do the DIM now
               do_dim();
               break;
            case VALUE :
               len = getvalue(&val);
               //printf("len = %d\n", len);
               tokens[pos++] = VALUE;              
               if ((val.type == INTID) 
               &&  (val.val.ival > -63) 
               &&  (val.val.ival < 63)) {
                  // small integer values (-64 .. +63) are stored directly
                  tokens[pos++] = (unsigned char) (val.val.ival + 64);
               }
               else {
                  // other values are stored as a long-aligned UVALUE
                  tokens[pos++] = val.type;
                  // long align 
                  tmppos = (pos+3) & ~0x3; 
                  if (tmppos + sizeof(UVALUE) < MAX_TOKENS) {
                     while (pos < tmppos) {
                         tokens[pos++] = 0;
                     }
                     *((UVALUE *)&tokens[pos]) = val.val;
                     pos += sizeof(UVALUE);
                  }
                  else {
                     // we cannot tokenize this line
                     pos = MAX_TOKENS + 1;
                     len = 0;
                  }
               }
               current_offs += len;
               break;
            case '"' :
               tmpstr1 = lines[current_indx].str + current_offs;
               tmpstr2 = mystrend(tmpstr1, '"');
               if (tmpstr2 > tmpstr1) {
                  len = tmpstr2 - tmpstr1 + 1; // include quotation marks
                  if ((pos + len) < MAX_TOKENS) {
                     for (i = 0; i < len; i++) {
                        tokens[pos++] = *tmpstr1;
                        tmpstr1++;
                     }
                  }
                  else {
                     // we cannot tokenize this line
                     pos = MAX_TOKENS + 1;
                  }
                  current_offs += len;
               }
               break;
            case INTID:
            case STRID:
            case FLTID:
               len = getid(buff);
               // we may get returned a non-dimensioned variable name
               // followed by an open parantheses (from a CALL statement)
               // so drop the open parentheses from the name before
               // trying to find it
               i = strlen((char *)buff);
               if ((i > 0) && (buff[i-1] == '(')) {
                 buff[i-1]='\0';
               }
               indx = findvarindx(buff);
               if ((in_def == 0) && (indx < 0)) {
                  if (tok == FLTID) {
                     var = addfloat(buff);
                  } 
                  else if (tok == INTID) {
                     var = addinteger(buff);
                  }
                  else {
                     var = addstring(buff);
                  }
                  indx = findvarindx(buff);
               }
               if ((in_def == 0) 
               &&  (indx >= 0) && (indx <= 255)
               &&  (pos + 2 < MAX_TOKENS)) {
                   // insert appropriate VAR token
                   tokens[pos++] = VAR_INT + tok - INTID;
                   tokens[pos++] = indx;
               }
               else {
                  if ((pos + len) < MAX_TOKENS) {
                     for (i = 0; i < len; i++) {
                        tokens[pos++] = buff[i];
                     }
                  }
                  else {
                     // we cannot tokenize this line
                     pos = MAX_TOKENS + 1;
                  }
               }
               current_offs += len;
               break;
            case DIMINTID:
            case DIMSTRID:
            case DIMFLTID:
               len = getid(buff);
               if (!findfunction(buff, len)) {
                  indx = finddimvarindx(buff);
#if AUTODEF
                  if ((in_call == 0) && (in_def == 0) && (indx < 0)) {
                     dimvar = autodimvar(buff);
                     indx = finddimvarindx(buff);
                  }
#endif
                  if ((in_def == 0) 
                  &&  (indx >= 0) && (indx <= 255)
                  &&  (pos + 2 < MAX_TOKENS)) {
                      // insert appropriate DIMVAR token
                      tokens[pos++] = VAR_DIMINT + tok - DIMINTID;
                      tokens[pos++] = indx;
                  }
                  else {
                     if ((pos + len) < MAX_TOKENS) {
                        for (i = 0; i < len; i++) {
                           tokens[pos++] = buff[i];
                        }
                     }
                     else {
                        // we cannot tokenize this line
                        pos = MAX_TOKENS + 1;
                     }
                  }
               }
               else {
                  if ((pos + len) < MAX_TOKENS) {
                     for (i = 0; i < len; i++) {
                        tokens[pos++] = buff[i];
                     }
                  }
                  else {
                     // we cannot tokenize this line
                     pos = MAX_TOKENS + 1;
                  }
               }
               current_offs += len;
               break;
            case TOKERR :
               if (fperr) {
                  fprintf(fperr, "Tokenizer error in line %d, at token %d\n",
                     lines[current_indx].no, pos);
               }
               seterror(ERR_SYNTAX);
               //tok = EOL;
               break;
            case '\'' :
            case REM :
               tokens[pos++] = tok;
               tmpstr1 = lines[current_indx].str + current_offs;
               tmpstr2 = untokenized_eol(tmpstr1);
               tok = EOL;
               current_offs = tmpstr2 - tmpstr1;
               break;
            case EOL :
            case EOS :
               tok = EOL;
               break;
            case LET :
               // the LET keyword is optional      
               match_token(tok);
               break;       
            case ':' :
               // leave colons in when tokenizing, but break the line
#if DEBUG
               printf("colon terminating line\n");
#endif
               tokens[pos++] = tok;
               match_token(tok);
               break;
            default :
#if AUTODEF
               // if we are processing a CALL statement, the call to
               // the assembly language function looks like an
               // array definition, so if we are auto-defining
               // then we must not do so in this statement!
               if (token == CALL) {
                  in_call = 1;
               }
#endif
               tokens[pos++] = tok;
               match_token(tok);
               break;
         }
         if (is_eol(tok)) {
            // finished tokenizing the line
            in_def = 0;
            in_call = 0;
#if DEBUG
            printf("terminating line\n");
#endif
            break; 
         } 
         else if (pos > MAX_TOKENS) {
            // the line cannot be tokenized as it is too long
            pos = 0;
            seterror(ERR_LINETOOLONG);
            break;
         }
      }
   }
   if (errorflag) {
      reporterror(lineno(index));
   }
   // terminate the tokenized version of the line
   tokens[pos] = 0; 
   // save tokenized version
   lines[current_indx].len = pos;
   lines[current_indx].tok = (unsigned char*) mystrndup(tokens, pos + 1); 
#if DEBUG
   if (lines[current_indx].tok == NULL) {
      printf("line not tokenized\n");
   }
   else {
      printf("tokenized line = ");
      for (i = 0; i < pos; i++) {
         printf("%d ", lines[current_indx].tok[i]);
      }
      printf("\n");
   }
#endif
}

/*
  Sets up all our globals, including the list of lines.
  Params: script - the script passed by the user
  Returns: 0 on success, -1 on failure
*/
static int setup(unsigned char *script) {
  int i;
  int lastline;
  char *end_lineno;
  RVALUE val;
  int len;
  unsigned int indx;
  int j;
  unsigned char *end;
  unsigned char *str;

  nvariables = 0;
  variables = 0;

  dimvariables = 0;
  ndimvariables = 0;

  tokenized = 0;
  seterror(0);

  for (i = 0; i < MAXFILES; i++) {
     FILES[i].file = NULL;
     FILES[i].reclen = 0;
  }

  for (i = 0; i < 'Z' - 'A' + 1; i++) {
     deftype[i] = DEFTYPE;
  }

  nlines = linecount(script) + 1; // do not use index 0!!!
  // malloc enough space for one extra line (which will be a null line)
  lines = malloc((nlines + 1) * sizeof(SOURCE_LINE));
  if (!lines) {
     if (fperr) {
         fprintf(fperr, "Out of memory\n");
     }
     return -1;
  }
  lastline = 1;
  for (i = 0; i < nlines; i++) {
     lines[i].no = -1;
     lines[i].str = NULL;
     lines[i].tok = NULL;
     lines[i].len = 0;
  }
  for (i = 1; i < nlines; i++) {
     while (space_or_tab(*script)) {
          script++;
     }
     if (digit(*script)) {
        lastline = strtol((const char *)script, &end_lineno, 10);
        lines[i].no = lastline;
        script = (unsigned char *)end_lineno;
        while (space_or_tab(*script)) {
             script++;
        }
     }
     else {
        lines[i].no = -lastline; // negative means same as previous line
     }
     lines[i].str = script;
#if PRINT_ON_LOAD
     print_untokenized_line(i);
#endif
#if TOKENIZE_ON_LOAD
     tokenize_line(i);
#if PRINT_TOKENS
     print_tokenized_line(i);
#endif     
#endif     
     if (*script) {
        script = untokenized_eol(script);
        script++;
     }
     if (errorflag) {
        break;
     }
  }

#if TOKENIZE_ON_LOAD
   if (!errorflag) {
#if DEBUG
      printf("lines have been tokenized\n");
#endif
      tokenized = 1;
   }
#endif

  if (errorflag) {
     return -1;
  }

  // add a terminating line that points to an empty line (i.e. the '\0')
  lines[nlines].str = script;
  lines[nlines].tok = script;
  lines[nlines].no = -1;
  nlines++;
  if (!nlines) {
     if (fperr) {
        fprintf(fperr, "Can't read program\n");
     }
     free(lines);
     return -1;
  }

  // check for duplicate or out of order lines
  lastline = -1;
  for (i = 0; i < nlines; i++) {
     if (lines[i].no > 0) {
        if (lastline > 0) {
           if (lines[i].no == lastline) {
              if (fperr) {
                 fprintf(fperr, "duplicate line number %d\n", lastline);
              }
              free(lines);
              return -1;
           }
           if (lines[i].no < lastline) {
              if (fperr) {
                 fprintf(fperr, "program lines %d and %d not in order\n", 
                    lastline, lines[i].no);
              }
              free(lines);
              return -1;
           }
        }
        lastline = lines[i].no;
     }
  }

  // replace GOTO and GOSUB line number with line index
  for (i = 0; i < nlines; i++) {
     if ((lines[i].no > 0) && (lines[i].tok != NULL)) {
#if DEBUG
        printf("substituted line = ");
        for (j = 0; j < lines[i].len; j++) {
           printf("%d ", lines[i].tok[j]);
        }
        printf("\n");
#endif
        current_indx = i;
        current_offs = 0;
        token = gettoken();
        while (!is_eol(token)) {
#if DEBUG
           printf("token %d @ (%d, %d), len = %d\n", 
                  token, current_indx, current_offs, tokenlen());
#endif
           if ((token == GOTO) || (token == GOSUB)) {
              do {
                 current_offs += tokenlen();
                 token = gettoken();
                 if (token == VALUE) {
                    len = getvalue(&val);
                    // note: we cannot replace small integer values, which
                    // are stored in only 2 bytes - we must have at least
                    // enough space to store a UVALUE (aligned)
                    if ((len >= sizeof(UVALUE)) && (val.type == INTID)) {
                       indx = findline(val.val.ival);
                       if (indx > 0) {
#if DEBUG
                          printf("%d: replace %d with index %d (line %d)\n",
                                 lineno(i), 
                                 val.val.ival, 
                                 indx, 
                                 lineno(indx));
#endif                          
                          val.type = LINE;
                          val.val.indx = indx;
                          putvalue(val);
                       }
                    }
                    current_offs += tokenlen();
                    token = gettoken();
                 }
              }
              while (token == ',');
           }
           else if (token == '"') {
              str = lines[current_indx].tok + current_offs;
              end = mystrend(str, '"');
              if (end > str) {
                 current_offs += end - str + 1;
              }
              else {
                 break;
              }
              token = gettoken();
           }
           else {
              current_offs += tokenlen();
              token = gettoken();
           }
        }
     }
  }

  if (errorflag) {
     return -1;
  }

  return 0;
}

/*
 * frees all the memory we have allocated
 */
static void cleanup(void)
{
  int i;
  int ii;
  int size;

#if DEBUG  
  for ( ;  nfors > 0; nfors--) {
     errorflag = ERR_NONEXT;
     reporterror(lineno(forstack[nfors-1].nextline-1));
  }
  for ( ;  nwhiles > 0; nwhiles--) {
     errorflag = ERR_NOWEND;
     reporterror(lineno(whilestack[nwhiles-1].nextline));
  }
  for ( ; ngosubs > 0; ngosubs--) {
     errorflag = ERR_NORETURN;
     reporterror(lineno(gosubstack[ngosubs-1].nextline-1));
  }
#endif  

  for (i = 0; i < MAXFILES; i++) {
     if (FILES[i].file != NULL) {
        fclose(FILES[i].file);
        FILES[i].file = NULL;
     } 
  }

  for (i = 0; i < nvariables; i++) {
    if ((variables[i].type == STRID) 
    &&  (variables[i].val.sval != NULL) 
    &&  (variables[i].len == 0)) {
      free(variables[i].val.sval);
    }
  }
  if (variables) {
    free(variables);
  }
  variables = NULL;
  nvariables = 0;

  for (i = 0; i < ndimvariables; i++) {
    if (dimvariables[i].type == STRID) {
      if (dimvariables[i].val.sval != NULL) {
        size = 1;
        for (ii = 0; ii < dimvariables[i].ndims; ii++) {
          size *= dimvariables[i].dim[ii];
        }
        for (ii = 0; ii < size; ii++) {
          if (dimvariables[i].val.sval[ii] != NULL) {
            free(dimvariables[i].val.sval[ii]);
          }
        }
        free(dimvariables[i].val.sval);
      }
    }
    else {
       if (dimvariables[i].val.dval != NULL) {
         free(dimvariables[i].val.dval);
       }
    }
  }

  if (dimvariables) {
    free(dimvariables);
  }
 
  dimvariables = 0;
  ndimvariables = 0;

  if (lines) {
    free(lines);
  }

  lines = 0;
  nlines = 0;
  
}

/*
 * reporterror - error report function.
 * for reporting errors in the user's script.
 * checks the global errorflag.
 * writes to fperr.
 * Params: lineno - the line on which the error occurred
 */
static void reporterror(int lineno)
{
  int index;

  if (!fperr) {
    return;
  }

  switch (errorflag) {
  case ERR_CLEAR:
    fprintf(fperr, "NO ERROR (?)");
    break;
  case ERR_SYNTAX:
    fprintf(fperr, "Syntax error");
    break;
  case ERR_OUTOFMEMORY:
    fprintf(fperr, "Out of memory");
    break;
  case ERR_IDTOOLONG:
    fprintf(fperr, "Identifier too long");
    break;
  case ERR_NOSUCHVARIABLE:
    fprintf(fperr, "No such variable");
    break;
  case ERR_BADSUBSCRIPT:
    fprintf(fperr, "Bad subscript");
    break;
  case ERR_TOOMANYDIMS:
    fprintf(fperr, "Too many dimensions");
    break;
  case ERR_TOOMANYINITS:
    fprintf(fperr, "Too many initialisers");
    break;
  case ERR_BADTYPE:
    fprintf(fperr, "Illegal type");
    break;
  case ERR_TOOMANYFORS:
    fprintf(fperr, "Too many nested fors");
    break;
  case ERR_NONEXT:
    fprintf(fperr, "For without matching next");
    break;
  case ERR_NOFOR:
    fprintf(fperr, "Next without matching for");
    break;
  case ERR_DIVIDEBYZERO:
    fprintf(fperr, "Divide by zero");
    break;
  case ERR_NEGLOG:
    fprintf(fperr, "Negative logarithm");
    break;
  case ERR_NEGSQR:
    fprintf(fperr, "Negative square root");
    break;
  case ERR_BADSINCOS:
    fprintf(fperr, "Sine or cosine out of range");
    break;
  case ERR_EOF:
    fprintf(fperr, "Unexpected end of input file");
    break;
  case ERR_ILLEGALOFFSET:
    fprintf(fperr, "Illegal offset");
    break;
  case ERR_TYPEMISMATCH:
    fprintf(fperr, "Type mismatch");
    break;
  case ERR_INPUTTOOLONG:
    fprintf(fperr, "Input too long");
    break;
  case ERR_BADVALUE:
    fprintf(fperr, "Bad value");
    break;
  case ERR_NOTINT:
    fprintf(fperr, "Not an integer");
    break;
  case ERR_NOTEOL:
    fprintf(fperr, "Unexpected character follows statement");
    break;
  case ERR_NOWHILE:
    fprintf(fperr, "Wend without matching while");
    break;
  case ERR_TOOMANYWHILES:
    fprintf(fperr, "Too many nested whiles");
    break;
  case ERR_NOWEND:
    fprintf(fperr, "While without matching wend");
    break;
  case ERR_NOIF:
    fprintf(fperr, "End if without matching if");
    break;
  case ERR_NOGOSUB:
    fprintf(fperr, "Return without matching gosub");
    break;
  case ERR_TOOMANYGOSUBS:
    fprintf(fperr, "Too many nested gosubs");
    break;
  case ERR_NORETURN:
    fprintf(fperr, "Gosub without matching return");
    break;
  case ERR_BADSELECTOR:
    fprintf(fperr, "Illegal selector");
    break;
  case ERR_NODATA:
    fprintf(fperr, "Out of data");
    break;
  case ERR_EXPRESSION:
    fprintf(fperr, "Badly formed expression");
    break;
  case ERR_EXPONENT:
    fprintf(fperr, "Illegal exponentiation");
    break;
  case ERR_TOOMANYDEFS:
    fprintf(fperr, "Too many user defined functions");
    break;
  case ERR_TOOMANYARGS:
    fprintf(fperr, "Too many arguments to user defined function");
    break;
  case ERR_FNNOTALLOWED:
    fprintf(fperr, "Functions not allowed within function");
    break;
  case ERR_OVERFLOW:
    fprintf(fperr, "Arithmetic overflow");
    break;
  case ERR_BADDATE:
    fprintf(fperr, "Invalid date");
    break;
  case ERR_BADTIME:
    fprintf(fperr, "Invalid time");
    break;
  case ERR_UNTERMINATED:
    fprintf(fperr, "Unterminated string literal");
    break;
  case ERR_LINETOOLONG:
    fprintf(fperr, "Line too long");
    break;
  case ERR_RESUME:
    fprintf(fperr, "RESUME without error");
    break;
  case ERR_BADMODE:
    fprintf(fperr, "Invalid file mode");
    break;
  case ERR_BADFILE:
    fprintf(fperr, "Invalid file number");
    break;
  case ERR_BADNAME:
    fprintf(fperr, "Invalid file name");
    break;
  case ERR_BADREC:
    fprintf(fperr, "Invalid record length");
    break;
  case ERR_NOFILE:
    fprintf(fperr, "File not found");
    break;
  case ERR_FIELDOVR:
    fprintf(fperr, "Field Overflow");
    break;
  case ERR_INTERNAL:
    fprintf(fperr, "Internal error");
    break;
  case ERR_BADRECNUM:
    fprintf(fperr, "Bad Record Number");
    break;
  case ERR_BADUSR:
    fprintf(fperr, "No such USR function");
    break;
  case ERR_ILLEGALFNCALL:
    fprintf(fperr, "Illegal function call");
    break;
  case ERR_DISKFULL:
    fprintf(fperr, "Disk full");
    break;
  default:
    fprintf(fperr, "Unknown error");
    break;
  }
#if PRINT_ON_ERROR  
  if (PRINT_ON_ERROR) {
     index = findline(lineno);
     if (index > 0) {
        fprintf(fperr, ", line:\n");
        print_untokenized_line(index);
        while ((index < nlines - 1) && (lines[index + 1].no < 0)) {
           index++;
           print_untokenized_line(index);
        }
     }
     else {
        fprintf(fperr, ", line %d\n", lineno);
     }
  }
#else 
  fprintf(fperr, ", line %d\n", lineno);
#endif  
}

/*
 * binary search for a line
 * Params: no - line number to find
 * Returns: index of the line, or -1 on fail.
 */
static int findline(int no) {
  int high = 0;
  int low = 0;
  int mid = 0;

#if DEBUG
  printf("looking for line no %d\n", no);
#endif
  low = 1;
  high = nlines-2;
  while ((high >= 1) && (lines[high].no  < 0)) {
     high--;
  }
  while (high > low + 1) {
    mid = (high + low)/2;
    while ((mid >= 1) && (lines[mid].no < 0)) {
       mid--;
    }
    if (low == mid) {
       mid = (high + low)/2;
       while ((mid < high) && (lines[mid].no < 0)) {
          mid++;
       }
    }
#if DEBUG    
    printf("low=%d,mid=%d,high=%d\n",low,mid,high);
#endif    
    if (lines[mid].no == no) {
      return mid;
    }
    if ((mid == high) || (mid == low)) {
       // avoid an infinite loop if line does not exist!
       break;
    }
    if (lines[mid].no > no) {
       high = mid;
    }
    else {
       low = mid;
    }
  }

  while ((mid >= 0) && (lines[mid].no < 0)) {
     mid--;
  }
  if (lines[low].no == no) {
    mid = low;
  }
  else if (lines[high].no == no) {
    mid = high;
  }
  else {
    mid = -1;
  }

  if (mid < 0) {
     if (fperr) {
        fprintf(fperr, "line %d not found\n", no);
     }
  }
  
  return mid;
}

/*
 * lineno - return the line number of a line given the line index
 */
static int lineno(int index) {
   return abs(lines[index].no);
}
/*
 * execute_line - execute the line at the given index and offset
 * Returns: index of line to go to, or 0 for next line, or -1 for terminate.
 *
 */
static int execute_line(void) {
  int answer = 0;
  const unsigned char *str;

#if DEBUG
  printf("\nexecuting index %d, offset is %d\n\n", current_indx, current_offs);
#endif

  token = gettoken();
  
  // in case line is still preceeded by a number
  if (token == VALUE) {
     match_token(VALUE);
  }

  if (tron) {
     if (lines[current_indx].no != -1) {
        printf("[%d] ", lines[current_indx].no); 
     }
     else {
        printf("[-] "); 
     }
  }  

#if DEBUG
  printf("line %d token is %d\n", lines[current_indx].no, token);
#endif
  switch (token) {
    case EOL:
    case ':':
      break;
    case EOS:
      return -1;
    case PRINT:
    case '?':
      do_print();
      break;
    case WRITE:
      do_write();
      break;
    case LET:
    case INTID:
    case FLTID:
    case STRID:
    case DIMINTID:
    case DIMFLTID:
    case DIMSTRID:
    case VAR_INT:
    case VAR_FLT:
    case VAR_STR:
    case VAR_DIMINT:
    case VAR_DIMFLT:
    case VAR_DIMSTR:
      do_let_or_usr();
      break;
    case DIM:
      // we executed the DIM while tokenizing
      //do_dim();
      break;
    case IF:
      answer = do_if();
      break;
    case GOTO:
      answer = do_goto();
      break;
    case ERROR:
      answer = do_error();
      break;
    case INPUT:
      do_input();
      break;
    case LINE:
      do_lineinput();
      break;
    case RESTORE:
      do_restore();
      break;
    case REM:
    case '\'':
      answer = do_rem();
      break;
    case TRON:
      do_tron();
      break;
    case TROFF:
      do_troff();
      break;
    case FOR:
      answer = do_for();
      break;
    case NEXT:
      answer = do_next();
      break;
    case WHILE:
      answer = do_while();
      break;
    case WEND:
      answer = do_wend();
      break;
    case GOSUB:
      answer = do_gosub();
      break;
    case RETURN:
      answer = do_return();
      break;
    case STOP:
      do_stop();
      break;
    case END:
      do_end();
      break;
    case ON:
      answer = do_on();
      break;
    case READ:
      answer = do_read();
      break;
    case DATA:
      do_data();
      break;
    case DEF:
      match_token(DEF);
      // we did DEF FN we did while tokenizing, but DEF USR we do now
      if (token == USR) {
         do_defusr();
      }
      break;
    case DEFINT:
      answer = do_defint();
      break;
    case DEFSNG:
      answer = do_defsng();
      break;
    case DEFDBL:
      answer = do_defdbl();
      break;
    case DEFSTR:
      answer = do_defstr();
      break;
    case CLEAR:
      do_clear();
      break;
    case DATESTRING:
      answer = do_datestring();
      break;
    case TIMESTRING:
      answer = do_timestring();
      break;
    case SWAP:
      do_swap();
      break;
    case RANDOMIZE:
      do_randomize();
      break;
    case WIDTH:
      do_width();
      break;
    case CLS:
      do_cls();
      break;
    case OPTION:
      // we executed the OPTION while tokenizing
      //do_option();
      break;
    case OPEN:
      do_open();
      break;
    case CLOSE:
      do_close();
      break;
    case GET:
      do_get();
      break;
    case PUT:
      do_put();
      break;
    case FIELD:
      do_field();
      break;
    case LSET:
      do_lset();
      break;
    case RSET:
      do_rset();
      break;
    case RESUME:
      answer = do_resume();
      break;
    case POKE:
      do_poke();
      break;
    case CALL:
      do_call();
      break;

    default:
      seterror(ERR_SYNTAX);
      break;
  }

  return answer;
}

/*
 * decode_using : decode USING for strings or numbers - TODO - MORE TO DO !!!
 *                Note: prefix and suffix are static, and do not need
 *                to be freed - they will remain valid until the next
 *                USING clause is processed.
 */
static void decode_using(unsigned char *fmt, int *dp, int *len,
                         int *plus, int *minus,
                         int *before, int *after, 
                         unsigned char **prefix, unsigned char **suffix,
                         int *aster, int *dollar, 
                         int*expo) {

   static unsigned char using_prefix[MAXUSING+1];
   static unsigned char using_suffix[MAXUSING+1];
   int plen = 0;
   int slen = 0;
   int saw_hash = 0;
   int saw_strspec = 0;

   *plus = 0;
   *minus = 0;
   *before = 0;
   *after = 0;
   *aster = 0;
   *dollar = 0;
   *dp = 0;

   while (*fmt) {
      if (strncmp((char *)fmt, "**$", 3) == 0) {
         *dollar = 1;
         *aster = 1;
         *before +=3;
         fmt += 3;
      }
      else if (strncmp((char *)fmt, "$$", 2) == 0) {
         *dollar = 1;
         *before +=2;
         fmt += 2;
      }
      else if (strncmp((char *)fmt, "**", 2) == 0) {
         *aster = 1;
         *before += 2;
         fmt += 2;
      }
      else if (strncmp((char *)fmt, "^^^^", 4) == 0) {
         *expo = 1;
         *after +=4;
         fmt += 4;
      }
      else if (*fmt == '#') {
         saw_hash = 1;
         if (*dp) {
            (*after)++;
         }
         else {
            (*before)++;
         }
         fmt++;
      }
      else if (*fmt == '+') {
         if (*dp) {
            (*after)++;
         }
         else {
            (*before)++;
         }
         *plus = 1;
         fmt++;
      }
      else if (*fmt == '-') {
         (*after)++;
         *minus = 1;
         fmt++;
      }
      else if (*fmt == '.') {
         *dp = 1;
         fmt++;
      }
      else if ((*fmt == '_') && (*(fmt+1) != 0)) {
         fmt++;
         if (saw_hash) {
            if (slen < MAXUSING) {
               using_suffix[slen++] = *fmt++;
            }
         }
         else {
            if (plen < MAXUSING) {
               using_prefix[plen++] = *fmt++;
            }
         }
      }
      else if (*fmt == '!') {
         saw_strspec = 1;
         *len = 1;
         fmt++;
      }
      else if (*fmt == '&') {
         saw_strspec = 1;
         *len = 0;
         fmt++;
      }
      else if (*fmt == '\\') {
         saw_strspec = 1;
         fmt++;
         *len = 2;
         while ((*fmt != '\\') && (*fmt != 0)) {
            fmt++;
            (*len)++;
         }
         if (*fmt == '\\') {
           fmt++;
         }
      }
      else {
         if (saw_hash || saw_strspec) {
            if (slen < 255) {
               using_suffix[slen++] = *fmt++;
            }
         }
         else {
            if (plen < 255) {
               using_prefix[plen++] = *fmt++;
            }
         }
      }
   }
   using_prefix[plen] = 0;
   *prefix = (unsigned char*)&using_prefix;
   using_suffix[slen] = 0;
   *suffix = (unsigned char*)&using_suffix;
}


/*
 * print_char - print a char and update output pos
 */
static void print_char(char ch) {
   if (ch == '\n') {
      pos = 1;
      fputc(ch, fpout);
   }
   else if (pos == width) {
      fputc(ch, fpout);
      pos = 1; // we assume screen wraps at width
   }
   else {
      if ((ch == 0x08) || (ch == 0x7F)) {
         if (pos > 1) {
            fputc(ch, fpout);
            pos--;
         }
      }
      else {
         fputc(ch, fpout);
         pos++;
      }
   }
   fflush(stdout);
   last_char = ch;
}

/*
 * print_str - print string and update output pos
 */
static void print_str (unsigned char *str) {
   while (*str) {
      if (*str == '\t') {
         do {
            if (pos < width) {
               fputc(' ', fpout);
               last_char = ' ';
               pos++;
            }
         } while ((((pos - 1) & 7) != 7) && (pos <= width));

      }
      else if (*str == '\n') {
         fputc(*str, fpout);
         last_char = *str;
         pos = 1;
      }
      else {
         print_char(*str);
      }
      str++;
   }
}


/*
 * the WRITE statement
 */
static void do_write(void)
{
  unsigned char buff[256];
  unsigned char *str;
  RVALUE x;
  int i;
  int j;

  match_token(token);

  if (token == '#') {
    do_filewrite();
    return;
  }

  while (!is_eol(token) && !(token == END) && !(token == ELSE)) {
    if (is_string(token)) {
      str = stringexpr();
      if (str) {
        sprintf((char *)buff, "\"%s\"", str);
        print_str(buff);
        free(str);
      }
    }
    else if (token == TAB) {
       // not allowed in WRITE
       seterror(ERR_SYNTAX);
    }
    else if (token == SPC) {
       // not allowed in WRITE
       seterror(ERR_SYNTAX);
    }
    else {
      x = expr(1);
      if (x.type == INTID) {
         sprintf((char *)buff, "%d", x.val.ival);
      }
      else {
         sprintf((char *)buff, "%g", x.val.dval);
      }
      str = buff;
      while (*str) {
         print_char (*str);
         str++;
      }
    }
    if ((token == ',') || (token == ';')) {
      match_token(token);
      print_char(',');
    }
  }
  print_char('\n');
}


/*
 * print_to_buff : print a formatted number into a buffer
 */
void print_to_buff(RVALUE x, unsigned char *buff, 
              unsigned char *prefix, int percent, int dollar, 
              int aster, int plus, int minus, 
              int before, int after, 
              int expo, unsigned char *suffix)
{
   char str[MAXUSING+1];
   char pad[MAXUSING+1];
   int slen;
   int flen;
   int plen;
   int over;
   int neg;

   // print the number without a sign and with the correct precision after
   // the decimal point (if floating point) to 'str' but note that the 
   // resulting string may be longer than the final field width (which is 
   // 'before' for integers, and either 'before' or 'before+after+1' for 
   // floats, depending on whether a '.' was included in the format string. 
   if (x.type == INTID) {
      // print the integer to str without sign or $ or padding
      sprintf(str,"%d", abs(x.val.ival));
      slen = strlen(str);
      // check whether we need to print '-' (not strict GW Basic!)
      neg = (x.val.ival < 0);
      // calculate total field length
      if (before > 0) {
         // use the specified field length
         flen = before;
         if (minus) {
            // trailing minus is always added to 'after', not 'before',
            // even for integers
            flen++;
         }
      }
      else {
         // no field length - use actual length
         flen = slen + plus + minus + 1; // + 1 for leading space
      }
      // check whether we need to print % (field too small)
      over = 0;
      if (flen >= slen + dollar + ((plus || neg) && !(minus && neg)) + minus) {
         plen = flen - slen - minus;
      }
      else {
         plen = dollar + (plus || neg);
         if (percent) {
            // field is too small - add '%'
            plen++;
            over = 1;
         }
      }
   }
   else {
      // print the float to str without sign or $ or padding, but with 
      // the correct precision
      if (after >= 0) {
         // precision specified, so use it
         if (expo) {
            sprintf(str,"%.*E", after - minus - 4, fabs(x.val.dval));
         }
         else {
            sprintf(str,"%.*f", after - minus, fabs(x.val.dval));
         }
      }
      else {
         // no precision specified - use most flexible format
         sprintf(str,"%g", fabs(x.val.dval));
      }
      slen = strlen(str);
      // check whether we need to print '-' (not strict GW Basic!)
      neg = (x.val.dval < 0.0);
      // calculate total field length 
      if (before + after >= 0) {
         // use the specified field length
         flen = before + after + 1; // +1  to include decimal point
      }
      else {
         // no field length - use actual length
         flen = slen + plus + minus + 1; // +1 for leading space
      }
      over = 0;
      // check whether we need to print % (field too small)
      if (flen >= slen + dollar + ((plus || neg) && !(minus && neg)) + minus) {
         plen = flen - slen - minus;
      }
      else {
         plen = dollar + (plus || neg);
         if (percent) {
            // field is too small - add '%'
            plen++;
            over = 1;
         }
      }
   }
   // make sure we don't overlfow fields
   if (flen > MAXUSING) {
      seterror(ERR_ILLEGALFNCALL);
      flen = MAXUSING;
   }
   if (plen > MAXUSING) {
      seterror(ERR_ILLEGALFNCALL);
      plen = MAXUSING;
   }

   // pad the field with either spaces or asterisks, add the sign, 
   // dollar and % (if required) and truncate it to the correct length
   if (aster) {
     memset(pad, '*', plen);
   }
   else {
     memset(pad, ' ', plen);
   }
   pad[plen]=0;

   if (dollar && (plen >= 0)) {
     pad[--plen]='$';
   }
   if (plen >= 0) {
     if (neg && !minus) {
        pad[--plen]='-'; // not strict GC Basic!
     }
     else if (((plus || neg) && !(minus && neg))) {
        pad[--plen]='+';
     }
   }
   if (over && (plen >= 0)) {
     pad[--plen]='%';
   }
   sprintf((char *)buff, 
           "%s%s%s%s%s", 
           prefix, 
           pad, 
           str, 
           //((minus && neg) ? "-" : ""),
           (minus ? (neg ? "-" : " ") : ""),
           suffix);
}


/*
 * the PRINT statement
 */
static void do_print(void)
{
  unsigned char buff[256];
  unsigned char *str = NULL;
  unsigned char *fmt = NULL; 
  unsigned char *prefix = nullstr; 
  unsigned char *suffix = nullstr; 
  RVALUE x;
  int i;
  int j;
  int no_lf = 0;
  int dp = 0;
  int percent = 0;
  int plus = 0;
  int minus = 0;
  int before = 0;
  int after = -1;
  int aster = 0;
  int dollar = 0;
  int expo = 0;
  int len = 0;
  int ulen;
  int slen;
  int indx;

  match_token(token);

  if (token == '#') {
    do_fileprint();
    return;
  }

  if (token == USING) {
     match_token(USING);
     percent = 1;
     fmt = stringexpr();
     if (fmt) {
        decode_using(fmt, &dp, &len,
                     &plus, &minus,
                     &before, &after, 
                     &prefix, &suffix, 
                     &aster, &dollar, 
                     &expo);
#if DEBUG        
        printf("fmt=%s,dp=%d,before=%d,after=%d,prefix=%s,suffix=%s\n",
               fmt, dp, before, after, prefix, suffix);
#endif        
     }
     match_token(';');
  }

  while (!errorflag && !is_eol(token) && !(token == END) && !(token == ELSE)) {
    if (is_string(token)) {
      ulen = 0;
      if (token == VAR_STR) {
          indx = getindex();
          if ((indx >= 0) & (indx < nvariables)) {
             // it's a field, so we use the field length
             ulen = variables[indx].len;
          }
          else {
             ulen = 0;
          }
      }
      if (ulen == 0) {
         // not a field, so we use the USING len (if there is one)
         ulen = len;
      }
      str = stringexpr();
      slen = 0;
      if (str) {
        slen = strlen((char *)str);
        if (ulen == 0) {
           ulen = slen;
        }
        if (ulen > 255) {
           ulen = 255;
        }
        if (slen > ulen) {
           slen = ulen;
        }
        for (i = 0; i < slen; i++) {
           buff[i] = str[i];
        }
        for (i = slen; i < ulen; i++) {
           buff[i] = ' ';
        }
        buff[i] = 0;
        print_str(prefix);
        print_str(buff);
        print_str(suffix);
        free(str);
      }
      no_lf = 0;
    }
    else if (token == TAB) {
       match_token(TAB);
       match_token('(');
       i = strict_integer(expr(1));
       match_token(')');
       if ((i < 1) || (i > width)) {
          seterror(ERR_BADVALUE);
       }
       else {
          if (i < pos) {
             print_char('\n');
          }
          for (j = 0; j < i - pos; j++) {
             buff[j] = ' ';
          }
          buff[j] = '\0';
          print_str(buff);
       }
       no_lf = 1;
    }
    else if (token == SPC) {
       match_token(SPC);
       match_token('(');
       i = strict_integer(expr(1));
       match_token(')');
       if ((i < 0) || (i > 255)) {
          seterror(ERR_BADVALUE);
       }
       else {
          for (j = 0; j < i; j++) {
             buff[i] = ' ';
          }
          buff[j] = '\0';
          print_str(buff);
       }
       no_lf = 1;
    }
    else {
      x = expr(1);
      print_to_buff(x, buff, 
         prefix, percent, dollar, 
         aster, plus, minus, 
         before, after, 
         expo, suffix);
      no_lf = 0;
      if (fmt) {
         // don't add any spaces when USING
         i = 0;
         while (buff[i]) {
            print_char(buff[i++]);
         }
      }
      else {
         // no USING clause - add space required by BASIC
         i = 0;
         while (buff[i]) {
            print_char(buff[i++]);
         }
         print_char(' ');
      }
    }
    if (token == ',') {
      match_token(',');
      i = 14*((pos - 1) / 14) + 15;
      if (i > width) {
         i = 1;
      }
      while (pos < i) {
         print_char(' ');
      }
      no_lf = 1;
    }
    else if (token == ';') {
      match_token(';');
      no_lf = 1;
    }
  }
  if (no_lf) {
     fflush(fpout);
  }
  else {
     print_char('\n');
  }
  free(fmt);
}

/*
 * do_let_or_usr - the LET and USR statements
 */
static void do_let_or_usr(void)
{
   RVALUE val;
   int len;
   int i;
   LVALUE lv;
   unsigned char *temp = NULL;

   // LET is optional
   if (token == LET) {
      match_token(LET);
   }

   lvalue(&lv);
   match_token('=');

   if (token == USR) {
      // this is a USR statement
      match_token(USR);
      if (token == '(') {
         i = 0;
      }
      else if (token == VALUE) {
         len = getvalue(&val);
         match_token(VALUE);
         if (val.type != INTID) {
            seterror(ERR_BADTYPE);
         }
         i = val.val.ival;
         if ((i < 0) || (i > 9)) {
            seterror(ERR_BADUSR);
         }
      }
      match_token('(');
      switch (lv.type) {
         case INTID:
            *lv.val.ival = int_usr(i, integer(expr(1)));
            break;
         case FLTID:
            *lv.val.dval = real_usr(i, real(expr(1)));
            break;      
         case STRID:
            if (lv.len > 0) {
               // this lvalue is a FIELD, so overwrite the field with the
               // new value, up to the length of the field
               temp = str_usr(i, stringexpr());
               if (temp) {
                  for (i = 0; i < lv.len; i++) {
                     (*lv.val.sval)[i] = temp[i];
                  }
               }
            }
            else {
               // this lvalue is not a field, so replace the string value
               temp = *lv.val.sval;
               *lv.val.sval = str_usr(i, stringexpr());
            }
            if (temp) {
               free(temp);
            }
         break;
      }
      match_token(')');
   }
   else {
      // this is a normal LET statement
      switch (lv.type) {
         case INTID:
            *lv.val.ival = integer(expr(1));
            break;
         case FLTID:
            *lv.val.dval = real(expr(1));
            break;
         case STRID:
            if (lv.len > 0) {
               // this lvalue is a FIELD, so overwrite the field with the
               // new value, up to the length of the field
               temp = stringexpr();
               if (temp) {
                  for (i = 0; i < lv.len; i++) {
                     (*lv.val.sval)[i] = temp[i];
                  }
               }
            }
            else {
               // this lvalue is not a field, so replace the string value
               temp = *lv.val.sval;
               *lv.val.sval = stringexpr();
            }
            if (temp) {
               free(temp);
            }
            break;
         default:
            break;
      }
   }
}

/*
  the DIM statement
*/
static void do_dim(void)
{
  int ndims = 0;
  int dims[5];
  unsigned char name[MAXID + 1];
  int len;
  DIMVAR *dimvar = NULL;
  int i;
  int size;
  int indx;

  match_token(DIM);

  while (!is_eol(token)) {
     ndims = 0;
     size = 1;     
     switch (token) {

       case DIMINTID:
       case DIMFLTID:
       case DIMSTRID:
         len = getid(name);
         match_token(token);
         dims[ndims++] = integer(expr(1));
         while (token == ',') {
           match_token(',');
           dims[ndims++] = integer(expr(1));
           if (ndims > 5) {
             seterror(ERR_TOOMANYDIMS);
             return;
           }
         } 
         match_token(')');
         break;
         
       case VAR_DIMINT:
       case VAR_DIMFLT:
       case VAR_DIMSTR:
         indx = getindex();
         if (indx < nvariables) {
            strcpy((char *)name, (char *)variables[indx].id);
         }
         match_token(token);
         dims[ndims++] = integer(expr(1));
         while (token == ',') {
           match_token(',');
           dims[ndims++] = integer(expr(1));
           if (ndims > 5) {
             seterror(ERR_TOOMANYDIMS);
             return;
           }
         } 
         match_token(')');
         break;
         
       default:
         seterror(ERR_SYNTAX);
         return;
     }

     for (i = 0; i < ndims; i++) {
       if (dims[i] < 0) {
         seterror(ERR_BADSUBSCRIPT);
         return;
       }
     }
     switch (ndims) {
       case 1:
         dimvar = dimension(name, 1, dims[0]);
         break;
       case 2:
         dimvar = dimension(name, 2, dims[0], dims[1]);
         break;
       case 3:
         dimvar = dimension(name, 3, dims[0], dims[1], dims[2]);
         break;
       case 4:
         dimvar = dimension(name, 4, dims[0], dims[1], dims[2], dims[3]);
         break;
       case 5:
         dimvar = dimension(name, 5, dims[0], dims[1], dims[2], dims[3], dims[4]);
         break;
     }

     if (dimvar == NULL) {
       /* out of memory */
       seterror(ERR_OUTOFMEMORY);
       return;
     }
   
     if (token == '=') {
       match_token('=');
   
       for (i = 0; i < dimvar->ndims; i++) {
         size *= dimvar->dim[i];
       }
   
       switch (dimvar->type) {
         case INTID:
           i = 0;
           dimvar->val.ival[i++] = integer(expr(1));
           while (token == ',' && i < size) {
             match_token(',');
             dimvar->val.ival[i++] = integer(expr(1));
             if (errorflag) {
               break;
             }
           }
           break;
         case FLTID:
           i = 0;
           dimvar->val.dval[i++] = real(expr(1));
           while (token == ',' && i < size) {
             match_token(',');
             dimvar->val.dval[i++] = real(expr(1));
             if (errorflag) {
               break;
             }
           }
           break;
         case STRID:
           i = 0;
           if (dimvar->val.sval[i]) {
             free(dimvar->val.sval[i]);
           }
           dimvar->val.sval[i++] = stringexpr();
     
           while (token == ',' && i < size) {
             match_token(',');
             if (dimvar->val.sval[i]) {
               free(dimvar->val.sval[i]);
             }
             dimvar->val.sval[i++] = stringexpr();
             if (errorflag) {
                break;
             }
           }
           break;
         }
       
         if (token == ',') {
           seterror(ERR_TOOMANYINITS);
         }
     }
     else {
       for (i = 0; i < dimvar->ndims; i++) {
         size *= dimvar->dim[i];
       }
   
       switch (dimvar->type) {
         case INTID:
           i = 0;
           dimvar->val.ival[i++] = 0;
           while (token == ',' && i < size) {
             match_token(',');
             dimvar->val.ival[i++] = 0;
             if (errorflag) {
               break;
             }
           }
           break;
         case FLTID:
           i = 0;
           dimvar->val.dval[i++] = 0.0;
           while (token == ',' && i < size) {
             match_token(',');
             dimvar->val.dval[i++] = 0.0;
             if (errorflag) {
               break;
             }
           }
           break;
         case STRID:
           i = 0;
           dimvar->val.sval[i++] = mystrdup(nullstr);
           while (token == ',' && i < size) {
             match_token(',');
             dimvar->val.sval[i++] = mystrdup(nullstr);
             if (errorflag) {
               break;
             }
           }
           break;
       }
     }
     if (token == ',') {
        match_token(',');
     }
  }
}

int nextline(int index) {
   while (index < nlines - 1) {
      if (lines[index + 1].no != -1) {
         return lines[index + 1].no;
      }
      index++;
   }
   return 0;
}

/*
 * match_literal : match a string literal
 */
static void match_literal(void) {
  int len = 1;
  unsigned char *end;
  unsigned char *str;

  if ((context == NULL) && (str = lines[current_indx].tok) != NULL) {
     // use tokenized line if there is one, and we are not in
     // the context of a user-defined function
     str += current_offs;
  }
  else {
     // use non-tokenized line
     str = lines[current_indx].str + current_offs;
     // in non-tokenized lines, there may be extraneous spaces
     while (space_or_tab(*str)) {
       current_offs++;  
       str++;
     }
  }

  while (token == '"') {
    end = mystrend(str, '"');
    if (end > str) {
      current_offs += end - str;
    }
    else {
      seterror(ERR_SYNTAX);
    }

    match_token('"');
  }
}

/*
 * do_if - the IF statement. There are multiple acceptable forms:
 *
 * IF <cond> GOTO <line> [ ELSE <line>|<statements> ] [ END IF ]
 * IF <cond> THEN <line>|<statements> [ ELSE <line>|<statements> ] [ END IF]
 * IF <cond> THEN END [ ELSE <line>|<statements> ] [ END IF]
 *
 * When a <line> is specified in a THEN clause, returns that line number
 * if <cond> evaluates to TRUE. When a <line> is specified in an ELSE
 * clause, returns that line number if <cond> evaluates to FALSE.
 * Returns -1 on error, otherwise returns the the result of executing the
 * specified statements, or the next line to be executed.
 *
 * Colons can be used to separate multiple statements within a THEN or ELSE 
 * clause. Such colons do not terminate the IF statement.
 * 
 * When a <line> is specified, the IF statement is terminated immediately 
 * unless there is an ELSE clause.
 *
 * ELSE clauses are optional. If specified, the ELSE clause belongs to the 
 * last unterminated IF.
 * 
 * END IF is optional. If not specified, the statement is terminated by EOL.
 *
 * IF statements can be nested, but the whole statement must be on one line. 
 *
 */
static int do_if(void)
{
  RVALUE condition;
  RVALUE index;
  int if_count = 1;
  int if_type = 0;
  int jump = 0;
  int len;
  int line;

  match_token(IF);
  condition = expr(1);
  if (condition.type != INTID) {
     seterror(ERR_BADTYPE);
     return -1;     
  }
  if (token == GOTO) {
     match_token(GOTO);
     if_type = GOTO;
     // GOTO can only be followed by a <line> (or an integer <expr>)
     if ((len = getlineindex(&index)) > 0) {
        jump = index.val.indx;
        current_offs += len + 1;
     }
     else {
        jump = findline(strict_integer(expr(1)));
     }
     if ((jump <= 0) || (errorflag)) {
        return -1;
     }
  }
  else {
     // if not GOTO it MUST be THEN
     match_token(THEN);
     if_type = THEN;
     if (errorflag) {
        return -1;
     }
     // THEN CAN be followed by a <line> (or an integer <expr>, 
     // which we check for later)
     if ((len = getlineindex(&index)) > 0) {
        jump = index.val.indx;
        current_offs += len + 1;
     }
  }
  if (condition.val.ival) {
#if XDEBUG
     printf("\nIF CONDITION TRUE\n");
#endif  
     if (jump > 0) {  
        // continue execution on new line
        return jump;
     }
     else if (token == VALUE) {
        // special case - accept an integer <expr>
        jump = findline(strict_integer(expr(1)));
        if ((jump <= 0) || errorflag) {
           return -1;
        }
        // continue execution on new line
        return jump;
     }
     else if (token == END) {
        // special case - accept "THEN END" (which does "END").
        do_end();
        return 0;
     }
     else {
        // execute statements until we get to end of line or find
        // an END IF or an ELSE clause - note that colons in a THEN
        // clause DO NOT terminate the IF statement. Also note that
        // we will recursively execute any nested if statements.
        while ((token != EOL) 
        &&     (token != '\n') 
        &&     (token != EOS) 
        &&     (token != ELSE) 
        &&     (token != END)) { 
           if (token == ':') {
              match_eol();
           }
           jump = execute_line();
           if (errorflag) {
              return -1;
           }
           if (jump != 0) {
              // continue execution on new line
              return jump;
           }
           token = gettoken();
        }
        if ((token == EOL) || (token == '\n') || (token == EOS)) {
           // we hit the end of line so there is no ELSE cause, 
           // so just return
           match_eol();
        }
        else if (token == END) {
           // this must be END IF and if so there is no ELSE clause,
           // so just return
           match_token(END);
           match_token(IF);
        }
        else if (token == ELSE) {
           // skip to the end of the ELSE clause
           match_token(ELSE);
           jump = 0;
           // ELSE CAN be followed by <line>
           if ((len = getlineindex(&index)) > 0) {
              jump = index.val.indx;
              current_offs += len + 1;
           }
           if (token == VALUE) {
              // special case - accept "ELSE <expr>"
              jump = findline(strict_integer(expr(1)));
              if ((jump <= 0) || errorflag) {
                 return -1;
              }
           }
           token = gettoken();
           if (jump > 0) {
              // the ELSE clause is terminated because of <line> or <expr>, 
              // but we still accept "END IF"
              if (token == END) {
                 match_token(END);
                 match_token(IF);
              }
              if (is_eol(token)) {
                  match_eol();
                  // continue execution on new line
                  return current_indx;
              }
           }
           else {
              // if ELSE is NOT followed by <line> or <expr> then
              // look for eol or END. Note that colons DO NOT terminate
              // the ELSE clause, but do termintate the IF statement. 
              // Note that we must take account of nested IF statements.
              while ((token != EOL)
              &&     (token != EOS) 
              &&     (token != '\n') 
              &&     ((token != END) || (if_count != 0))) {
#if XDEBUG
                 printf("\nFOUND TOKEN = %d\n", token);
                 printf("index = %d, offs = %d\n",current_indx, current_offs);
#endif  
                 if (token == ':') {
                    if (if_count != 0) {
                       match_token(token);
                       if (is_eol(token)) {
                          match_eol();
                       }
                    }
                    else {
                      break;
                    }
                 }
                 else if (token == '"') {
                    match_literal();
                 }
                 else if ((token == REM) ||(token == '\'')) {
                    find_eol();
                 }
                 else {
                    if (token == IF) {
                       match_token(IF);
                       if_count++;
                    }
                    else if (token == END) {
                       match_token(END);
                       match_token(IF); 
                       if (if_count > 0) {
                          if_count--;
                       }
                       else {
                          seterror(ERR_NOIF);
                          return -1;
                       }
                    }
                    else {
                       match_token(token);
                    }
                 }
              }
           }
           if (is_eol(token)) {
             // continue execution on new line
             match_eol();
             return current_indx;
           }
           else {
             // continue execution on current line
             return 0;
           }
        }
     }
  }
  else {
#if XDEBUG
     printf("\nIF CONDITION FALSE, TOKEN = %d\n", token);
     printf("index = %d, offs = %d\n",current_indx, current_offs);
#endif  
     token = gettoken();
     // THEN or GOTO CAN be followed by an integer <expr>
     if (token == VALUE) {
        // skip integer <expr>
        jump = findline(strict_integer(expr(1)));
        if ((jump <= 0) || errorflag) {
           return -1;
        }
     }
     else if (token == END) {
        // skip "END".
        current_offs += 1;
        token = gettoken();
     }
     // find the ELSE clause - note that we must skip over
     // any nested IF statements! 
     while ((token != EOL)
     &&     (token != '\n')
     &&     (token != EOS) 
     &&     ((token != ELSE) || (if_count != 1))) {
#if XDEBUG
        printf("\nFOUND TOKEN = %d\n", token);
        printf("index = %d, offs = %d\n",current_indx, current_offs);
#endif  
        if (token == ':') {
           // colon terminates if we are not in an IF statement, or
           // the IF statement is followed by a GOTO not a THEN
           if ((if_count == 0) || (if_type == GOTO)) {
              break;
           }
           else {
              match_token(token);
              if (is_eol(token)) {
                match_eol();
              }
           }
        }
        else if (token == '"') {
           match_literal();
        }
        else if ((token == REM) ||(token == '\'')) {
           find_eol();
        }
        else {
           if (token == IF) {
              match_token(IF);
              if_count++;
           }
           else if (token == END) {
              match_token(END);
              match_token(IF); 
              if (if_count > 0) {
                 if_count--;
              }
              else {
                 seterror(ERR_NOIF);
                 return -1;
              }
           }
           else {
              match_token(token);
           }
        }
        token = gettoken();
     }
     if (token == ELSE) {
#if XDEBUG 
        printf("\nPROCESSING ELSE\n");
        printf("index = %d, offs = %d\n",current_indx, current_offs);
#endif  
        match_token(ELSE);
        jump = 0;
        // ELSE CAN be followed by <line>
        if ((len = getlineindex(&index)) > 0) {
           jump = index.val.indx;
           current_offs += len + 1;
        }
        if (jump > 0) {
           return jump;
        }
        if (token == VALUE) {
           // special case - accept "ELSE <expr>"
           jump = findline(strict_integer(expr(1)));
           if ((jump <= 0) || errorflag) {
              return -1;
           }
           return jump;
        }
        token = gettoken();
        while ((token != EOL) 
        &&     (token != '\n') 
        &&     (token != EOS) 
        &&     (token != ELSE) 
        &&     (token != END)) { 
           if (token == ':') {
              if (if_count != 0) {
                 match_token(token);
                 if (is_eol(token)) {
                    match_eol();
                 }
              }
              else {
                break;
              }
           }
           jump = execute_line();
           if (errorflag) {
              return -1;
           }
           if (jump != 0) {
              return jump;
           }
        }
        if ((token == EOL) || (token == '\n') || (token == EOS)) {
           match_eol();
        }
        else if (token == END) {
           match_token(END);
           match_token(IF);
           if (is_eol(token)) {
              match_eol();
              return current_indx;
           }
        }
        else if (token == ELSE) {
           while ((token != EOL)
           &&     (token != EOS) 
           &&     (token != '\n') 
           &&     (token != END)) { 
              if (is_eol(token)) {
                 match_eol();
                 return current_indx;
              }
              else if (token == '"') {
                 match_literal();
              }
              else if ((token == REM) ||(token == '\'')) {
                 find_eol();
              }
              else {
                 match_token(token);
              }
           }
           if (token == END) {
              match_token(END);
              match_token(IF);
           }
           if (is_eol(token)) {
              match_eol();
              return current_indx;
           }
        }
        token = gettoken();
        if ((token == EOL) || (token == '\n') || (token == EOS)) {
           match_eol();
           return current_indx;
        }
     }
     else {
        // no ELSE clause 
        if (is_eol(token)) {
          // continue execution on new line
          match_eol();
          return current_indx;
        }
        else {
          // continue execution on current line
          return 0;
        }
     }
  }
  if (errorflag) {
     return -1;
  }
  // return current_indx;
  return 0;
}


/*
 * do_goto - the GOTO statement
 * returns new line number
 */
static int do_goto(void) {
  RVALUE line_index;
  match_token(GOTO);
  if (getlineindex(&line_index) > 0) {
     return line_index.val.indx;
  }
  else {
     return findline(strict_integer(expr(1)));
  }
}


/*
 * do_error - the ERROR statement
 * simulates an error
 */
static int do_error(void) {
  int err_no;

  match_token(ERROR);
  err_no = strict_integer(expr(1));
  if ((err_no > 0) && (err_no < 255)) {
     seterror(err_no);
  }
  return 0;
}


/*
 * do_option - the OPTION statement
 * currently, OPTION BASE [ 0 | 1 ] is the only option supported
 */
static int do_option(void) {
  int new_base = 0;

  match_token(token);
  if (token == BASE) {
     match_token(BASE);
     new_base = strict_integer(expr(1));
     if (errorflag == 0) {
        if (((base_set) || (ndimvariables > 0)) && (new_base != base)) {
           // cannot set the base once arrays defined, or if the base has 
           // already been set - unless it is being set to the same value
           seterror(ERR_BADVALUE);
        }
#if DEBUG        
        printf("old base = %d, new base = %d\n", base, new_base);
#endif
        base = new_base;
        base_set = 1; 
     }
  }
  else {
     seterror(ERR_SYNTAX);
  }
  return 0;
}


/*
 * do_open - open a file
 */
static void do_open(void) {
   int i;
   char *str  = NULL;
   char *name = NULL;
   int mode = 0;
   int reclen = MAXREC;

   match_token(OPEN);

   if (is_string(token)) {
      // the next string could be mode or name
      str = (char *)stringexpr();
      if (str) {
        if (token == ',') {
           match_token(',');
           // syntax is "OPEN mode, [#] file number, filename [,reclen]"
           // str is mode
           if (strlen(str) == 1) {
              if (str[0] == 'I') {
                 mode = 0;
              }
              else if (str[0] == 'O') {
                 mode = 1;
              }
              else if (str[0] == 'R') {
                 mode = 2;
              }
              else if (str[0] == 'A') {
                 mode = 3;
              }
              else {
                 seterror(ERR_BADMODE);
              }
           }
           else {
              seterror(ERR_BADMODE);
           }
           if (token == '#') {
              match_token('#');
           }
           i = strict_integer(expr(1));
           if ((i >= 1) && (i <= MAXFILES)) {
              i--;
              match_token(',');
              if (errorflag == 0) {
                 if (is_string(token)) {
                    name = (char *)stringexpr();
                    if (errorflag == 0) {
                       if (token == ',') {
                          match_token(',');
                          reclen = strict_integer(expr(1));
                       }
                       if ((reclen >= 1) && (reclen <= MAXREC)) {
                          if (FILES[i].file == NULL) {
                             // open the file!
                             if (mode == 0) {
                                FILES[i].file = fopen(name, "r");
                             }
                             else if (mode == 1) {
                                FILES[i].file = fopen(name, "w+");
                                // create file if it does not exist
                                if (FILES[i].file == NULL) {
                                   FILES[i].file = fopen(name, "w+");
                                }
                             }
                             else if (mode == 2) {
                                FILES[i].file = fopen(name, "r+");
                                // create file if it does not exist
                                if (FILES[i].file == NULL) {
                                   FILES[i].file = fopen(name, "w+");
                                }
                             }
                             else if (mode == 3) {
                                FILES[i].file = fopen(name, "a+");
                                // create file if it does not exist
                                if (FILES[i].file == NULL) {
                                   FILES[i].file = fopen(name, "w+");
                                }
                                fseek(FILES[i].file, 0, SEEK_END);
                             }
                             if (FILES[i].file == NULL) {
                                // file not found
                                seterror(ERR_NOFILE);
                             }
                             else {
                                FILES[i].mode = mode;
                                FILES[i].reclen = reclen;
                             }
                          }
                          else {
                             // that file number is already open
                             seterror(ERR_BADFILE);
                          }

                       }
                       else {
                          seterror(ERR_BADREC);
                       }
                    }
                 }
                 else {
                    seterror(ERR_BADNAME);
                 }
              }
           }
           else {
              seterror(ERR_BADFILE);
           }
        }
        else {
           // syntax is "OPEN filename [FOR mode] [ACCESS access] [lock] 
           //            AS [#] file number [LEN=reclen]"
           // str is name
           if (token == FOR) {
              match_token(FOR);
              if (token == INPUT) {
                 match_token(INPUT);
                 mode = 0;
              }
              else if (token == OUTPUT) {
                 match_token(OUTPUT);
                 mode = 1;
              }
              else if (token == RANDOM) {
                 match_token(RANDOM);
                 mode = 2;
              }
              else if (token == APPEND) {
                 match_token(APPEND);
                 mode = 3;
              }
           }
           if (token == ACCESS) {
              match_token(ACCESS);
              // access is ignored
              while ((token == READ) || (token == WRITE)) {
                 match_token(token);
              }
           }
           if ((token == SHARED) || (token == LOCK)) {
              match_token(token);
              // shared and lock is ignored
              while ((token == READ) || (token == WRITE)) {
                 match_token(token);
              }
           }
           if (token == AS) {
              match_token(AS);
              if (token == '#') {
                 match_token('#');
              }
              i = strict_integer(expr(1));
              if ((i >= 1) && (i <= MAXFILES)) {
                 i--;
                 if (token == LEN) {
                    match_token(LEN);
                    if (token == '=') {
                       match_token('=');
                       reclen = strict_integer(expr(1));
                    }
                    else {
                       seterror(ERR_SYNTAX);
                    }
                 }
                 if ((reclen >= 1) && (reclen <= MAXREC)) {
                    if (FILES[i].file == NULL) {
                       // open the file!
                       if (mode == 0) {
                          FILES[i].file = fopen(str, "r");
                       }
                       else if (mode == 1) {
                          FILES[i].file = fopen(str, "w+");
                          // create file if it does not exist
                          if (FILES[i].file == NULL) {
                             FILES[i].file = fopen(name, "w+");
                          }
                       }
                       else if (mode == 2) {
                          FILES[i].file = fopen(str, "r+");
                          // create file if it does not exist
                          if (FILES[i].file == NULL) {
                             FILES[i].file = fopen(name, "w+");
                          }
                       }
                       else if (mode == 3) {
                          FILES[i].file = fopen(str, "a+");
                          // create file if it does not exist
                          if (FILES[i].file == NULL) {
                             FILES[i].file = fopen(name, "w+");
                          }
                          fseek(FILES[i].file, 0, SEEK_END);
                       }
                       if (FILES[i].file == NULL) {
                          // file not found
                          seterror(ERR_NOFILE);
                       }
                       else {
                          FILES[i].mode = mode;
                          FILES[i].reclen = reclen;
                       }
                    }
                    else {
                       // that file number is already open
                       seterror(ERR_BADFILE);
                    }
                 }
                 else {
                    seterror(ERR_BADREC);
                 }
              }
              else {
                 seterror(ERR_BADFILE);
              }
           }
           else {
              seterror(ERR_SYNTAX);
           }
        }
        free(str);
        free(name);
      }
   }
}


/*
 * do_close - close a file
 */
static void do_close(void) {
   int i;

   match_token(CLOSE);
   if (is_eol(token)) {
      // close all files
      for (i = 0; i < MAXFILES; i++) {
          if (FILES[i].file != NULL) {
             fclose(FILES[i].file);
             FILES[i].file = NULL;
             FILES[i].reclen = 0;
          }

      }
      return;
   }

   while (!is_eol(token) && (errorflag == 0)) {
      if (token == '#') {
         match_token('#');
      }
      i = strict_integer(expr(1));
      if (errorflag == 0) {
         if ((i >= 1) && (i <= MAXFILES)) {
            i--;
            if (FILES[i].file != NULL) {
               fclose(FILES[i].file);
               FILES[i].file = NULL;
               FILES[i].reclen = 0;
            }
         }
         else {
            seterror(ERR_BADFILE);
         }
         if (token == ',') {
            match_token(',');
         }
      }
   }
}


/*
 * do_put - put a random record
 */
static void do_put(void) {
   int i;
   int rec;
   int len;
   match_token(PUT);

   if (token == '#') {
      match_token('#');
   }

   i = strict_integer(expr(1));
   if ((i >= 1) && (i <= MAXFILES)) {
      i--;
      if ((errorflag == 0) && (FILES[i].file != NULL)) {
         if (FILES[i].mode == 0) {
            seterror(ERR_BADMODE);
         }
         else {
            if (token == ',') {
               match_token(',');
               rec = strict_integer(expr(1));
               if (rec > 0) {
                  int loc, end;
                  rec --;
                  // to cater for DOSFS, which does NOT extend the file if
                  // you seek past the end and then write data to the file,
                  // we instead extend the file manually if we are asked
                  // to put data in a record beyond the end of the file
                  loc = rec * FILES[i].reclen;
                  fseek(FILES[i].file, 0, SEEK_END);
                  end = ftell(FILES[i].file);
                  if (end < loc) {
                     char zero = 0;
                     while (end < loc) {
                        // we must extend the file
                        if (fwrite(&zero, 1, 1, FILES[i].file) != 1) {
                           // can't extend file - disk full?
                           seterror(ERR_DISKFULL);
                           break;
                        }
                        end++;
                     }
                  }
                  else {
                     // we can just seek to the correct location
                     fseek(FILES[i].file, loc, SEEK_SET);
                  }
               }
               else {
                  seterror(ERR_BADRECNUM);
               }
            }
            if (errorflag == 0) {
               len = fwrite(FILES[i].buff, 1, FILES[i].reclen, FILES[i].file);
               if (len != FILES[i].reclen) {
                  seterror(ERR_BADRECNUM);
               }
            }
         }
      }
      else {
         // file is not open
         seterror(ERR_NOFILE);
      }
   }
}


/*
 * do_get - get a random record
 */
static void do_get(void) {
   int i;
   int rec;
   int len;

   match_token(GET);

   if (token == '#') {
      match_token('#');
   }

   i = strict_integer(expr(1));
   if ((i >= 1) && (i <= MAXFILES)) {
      i--;
      if ((errorflag == 0) && (FILES[i].file != NULL)) {
         if ((FILES[i].mode == 1) || (FILES[i].mode == 3)) {
            seterror(ERR_BADMODE);
         }
         else {
            if (token == ',') {
               match_token(',');
               rec = strict_integer(expr(1));
               if (rec > 0) {
                  rec--;
                  fseek(FILES[i].file, rec * FILES[i].reclen, SEEK_SET);
                  if (ftell(FILES[i].file) != rec * FILES[i].reclen) {
                     seterror(ERR_BADRECNUM);
                  }
               }
               else {
                  seterror(ERR_BADRECNUM);
               }
            }
            if (errorflag == 0) {
               len = fread(FILES[i].buff, 1, FILES[i].reclen, FILES[i].file);
               if (len != FILES[i].reclen) {
                  seterror(ERR_BADRECNUM);
               }
            }
         }
      }
      else {
         // file is not open
         seterror(ERR_NOFILE);
      }
   }
}


/*
 * do_field - set up a field specification. This means deleting any string
 *           we have malloced, pointing the string into the buffer used for
 *           the file, and setting the length in the string. The string
 *           variables used in a FIELD statement.
 */
static void do_field(void) {
   int i;
   int w = 0;
   int total = 0;
   int indx;
   unsigned char id[MAXID + 1];
   int len;

   int reclen = MAXREC;

   match_token(FIELD);

   if (token == '#') {
      match_token('#');
   }
   i = strict_integer(expr(1));
   if (errorflag != 0) {
      return;
   }
   if ((i >= 1) && (i <= MAXFILES)) {
      i--;
      match_token(',');
      if (errorflag != 0) {
         return;
      }
      if (FILES[i].file != NULL) {
         while (!is_eol(token)) {
            w = strict_integer(expr(1));
            if (errorflag != 0) {
               return;
            }
            if ((w < 1) || (w > FILES[i].reclen)) {
                seterror(ERR_FIELDOVR);
                return;
            }
            match_token(AS);
            if (errorflag != 0) {
               return;
            }
            if ((token == VAR_STR)) {
               indx = getindex();
            }
            else {
               len = getid(id);
               indx = findvarindx(id);
            }
            if ((indx >= 0) & (indx < nvariables)) {
               //printf("index = %d, name = %s\n", indx, variables[indx].id);
               variables[indx].len = w;
               free(variables[indx].val.sval);
               variables[indx].val.sval 
                  = (unsigned char *)&FILES[i].buff + total;
               total+= w;
#if DEBUG
               printf("field name = %s, len = %d, addr = 0x%X\n", 
                      variables[indx].id,  
                      variables[indx].len, 
                      variables[indx].val.sval);
#endif
            }
            else {
               seterror(ERR_NOSUCHVARIABLE);
               return;
            }
            match_token(token);
            if (!is_eol(token)) {
               match_token(',');
            }
         }
         if (!is_eol(token)) {
            seterror(ERR_SYNTAX);
            return;
         }
         if (total > FILES[i].reclen) {
            // file is not open
            seterror(ERR_FIELDOVR);
            return;
         }
      }
      else {
         // file is not open
         seterror(ERR_NOFILE);
         return;
      }
   }
}


/*
 * do_file input - input from a file
 */
static void do_fileinput(void) {
   LVALUE lv;
   unsigned char buff[256];
   char ch;
   int quoted;
   int i;
   int f;

   match_token('#');

   f = strict_integer(expr(1));
   if (errorflag != 0) {
      return;
   }
   if ((f >= 1) && (f <= MAXFILES)) {
      f--;
      match_token(',');
      if (errorflag != 0) {
         return;
      }
      if (FILES[f].file != NULL) {
         while (!is_eol(token) && !(token == END) && !(token == ELSE)) {

            lvalue(&lv);
            
            do {
               ch = fgetc(FILES[f].file);
            }
            while ((ch != EOF) && ((ch == ' ') || (ch == '\n')));

            if (ch == EOF) {
               seterror(ERR_EOF);
               return;
            }
            ungetc(ch, FILES[f].file);

            switch (lv.type) {
              case INTID:
                if (fscanf(FILES[f].file, "%d", lv.val.ival) != 1) {
                   seterror(ERR_BADVALUE);
                   return;
                }
                break;
              case FLTID:
                if (fscanf(FILES[f].file, "%f", lv.val.dval) != 1) {
                   seterror(ERR_BADVALUE);
                   return;
                }
                break;
              case STRID:
                if (*lv.val.sval) {
                  free(*lv.val.sval);
                  *lv.val.sval = 0;
                }
                i = 0;
                quoted = 0;
                ch = fgetc(FILES[f].file);
                while ((i < 255) && (ch != EOF)
                &&     ((quoted && (ch != '"')
                    ||  (!quoted && ((ch!=',')&&(ch!='\r')&&(ch!='\n')))))) {
                   if ((i == 0) && (ch == '"')) {
                      quoted = 1;
                   }
                   else {
                      buff[i++] = ch;
                   }
                   ch = fgetc(FILES[f].file);
                }
                buff[i] = 0;
                *lv.val.sval = mystrdup(buff);
                if (!*lv.val.sval) {
                  seterror(ERR_OUTOFMEMORY);
                  return;
                }
                break;
              default:
                break;
            }
            if (token == ',') {
               match_token(',');
            }
         }
      }
      else {
         // file is not open
         seterror(ERR_NOFILE);
         return;
      }
   }
   else {
      seterror(ERR_BADFILE);
   }
}


/*
 * do_filelineinput - line input from a file
 */
static void do_filelineinput(void) {
   LVALUE lv;
   unsigned char buff[256];
   unsigned char ch;
   int i = 0;
   int f;

   match_token('#');

   f = strict_integer(expr(1));
   if (errorflag != 0) {
      return;
   }
   if ((f >= 1) && (f <= MAXFILES)) {
      f--;
      if (FILES[f].file != NULL) {
         if ((FILES[i].mode == 1) || (FILES[i].mode == 3)) {
            seterror(ERR_BADMODE);
            return;
         }
         else {
            match_token(',');
            if (errorflag != 0) {
               return;
            }
          
            lvalue(&lv);
          
            if (lv.type != STRID) {
                seterror(ERR_BADTYPE);
                return;
            }
          
            if (*lv.val.sval) {
              free(*lv.val.sval);
              *lv.val.sval = 0;
            }
          
            while (i < 255) {
               ch = fgetc(FILES[f].file);
               // TODO - line feed followed by carriage return 
               // should not terminate input
               if ((ch == EOF) || (ch == '\r') || (ch == '\n')) {
                 break;
               }
               buff[i++] = ch;                 
            }
            buff[i++] = 0;
            *lv.val.sval = mystrndup(buff, i);
            if (!*lv.val.sval) {
              seterror(ERR_OUTOFMEMORY);
              return;
            }
         }
      }
      else {
         // file is not open
         seterror(ERR_NOFILE);
         return;
      }
   }
   else {
      seterror(ERR_BADFILE);
   }
}


/*
 * fwrite_char - write a single char to a file
 */
static int fwrite_char(FILE *file, char ch) {
   return fwrite(&ch, 1, 1, file);
}


/*
 * fwrite_str - write a string to a file
 */
static int fwrite_str(FILE *file, unsigned char *str) {
   return fwrite(str, 1, strlen((char *)str), file);
}


/*
 * fwrite_num - print number, adding spaces as required by basic
 */
static void fwrite_num (FILE *file, unsigned char *num) {
   fwrite_char(file, ' ');
   while (*num) {
      fwrite_char (file, *num);
      num++;
   }
   fwrite_char(file, ' ');
}


/*
 * do_fileprint - print to a file 
 */
static void do_fileprint(void) {
  unsigned char buff[256];
  unsigned char *str = NULL;
  unsigned char *fmt = NULL;
  unsigned char *prefix = nullstr; 
  unsigned char *suffix = nullstr; 
  RVALUE x;
  int i;
  int j;
  int dp = 0;
  int plus = 0;
  int minus = 0;
  int before = 0;
  int after = -1;
  int aster = 0;
  int dollar = 0;
  int expo = 0;
  int percent = 0;
  int f;
  int len = 0;
  int slen;
  int ulen;
  int indx;

  match_token('#');

   f = strict_integer(expr(1));
   if (errorflag != 0) {
      return;
   }
   if ((f >= 1) && (f <= MAXFILES)) {
      f--;
      if (FILES[f].file != NULL) {
         if (FILES[f].mode == 0) {
            seterror(ERR_BADMODE);
            return;
         }
         match_token(',');
         if (token == USING) {
            match_token(USING);
            fmt = stringexpr();
            percent = 1; // print % if USING clause is too small
            if (fmt) {
               decode_using(fmt, &dp, &len,
                            &plus, &minus,
                            &before, &after, 
                            &prefix, &suffix, 
                            &aster, &dollar, 
                            &expo);
#if DEBUG     
               printf("fmt=%s,dp=%d,before=%d,after=%d,prefix=%s,suffix=%s\n",
                      fmt, dp, before, after, prefix, suffix);
#endif     
            }
            match_token(';');
         }
         
         while (!is_eol(token) && !(token == END) && !(token == ELSE)) {
            if (errorflag != 0) {
               return;
            }
            if (is_string(token)) {
              ulen = 0;
              if (token == VAR_STR) {
                  indx = getindex();
                  if ((indx >= 0) & (indx < nvariables)) {
                     // it's a field, so we use the field length
                     ulen = variables[indx].len;
                  }
                  else {
                     ulen = 0;
                  }
              }
              if (ulen == 0) {
                 // not a field, so we use the USING len (if there is one)
                 ulen = len;
              }
              str = stringexpr();
              slen = 0;
              if (str) {
                 slen = strlen((char *)str);
                 if (ulen == 0) {
                    ulen = slen;
                 }
                 if (ulen > 255) {
                    ulen = 255;
                 }
                 if (slen > ulen) {
                    slen = ulen;
                 }
                 for (i = 0; i < slen; i++) {
                    buff[i] = str[i];
                 }
                 for (i = slen; i < ulen; i++) {
                    buff[i] = ' ';
                 }
                 buff[i] = 0;
                 fwrite_str(FILES[f].file, prefix);
                 fwrite_str(FILES[f].file, buff);
                 fwrite_str(FILES[f].file, suffix);
                 free(str);
              }
           }
           else if (token == TAB) {
              match_token(TAB);
              match_token('(');
              i = strict_integer(expr(1));
              match_token(')');
              if ((i < 1) || (i > width)) {
                 seterror(ERR_BADVALUE);
              }
              // TAB is accepted, but does nothing in PRINT#
           }
           else if (token == SPC) {
              match_token(SPC);
              match_token('(');
              i = strict_integer(expr(1));
              match_token(')');
              if ((i < 0) || (i > 255)) {
                 seterror(ERR_BADVALUE);
              }
              // SPC is accepted, but does nothing in PRINT#
           }
           else {
              x = expr(1);
              print_to_buff(x, buff, 
                  prefix, percent, dollar, 
                  aster, plus, minus,
                  before, after, 
                  expo, suffix);
              fwrite_num(FILES[f].file, buff);
            }
            if (token == ',') {
              match_token(',');
            }
            else if (token == ';') {
              match_token(';');
            }
         }
         fwrite_char(FILES[f].file, '\n');
         free(fmt);
      }
   }
   else {
      seterror(ERR_BADFILE);
   }
}

/*
 * do_filewrite - write to a file
 */
static void do_filewrite(void) {
   unsigned char buff[256];
   unsigned char *str;
   RVALUE x;
   int i;
   int j;
   int f;

   match_token('#');

   i = strict_integer(expr(1));
   if (errorflag != 0) {
      return;
   }
   if ((i >= 1) && (i <= MAXFILES)) {
      i--;
      if (FILES[f].file != NULL) {
         if (FILES[f].mode == 0) {
            seterror(ERR_BADMODE);
            return;
         }
         match_token(',');
         while (!is_eol(token) && !(token == END) && !(token == ELSE)) {
            if (errorflag != 0) {
               return;
            }
            if (is_string(token)) {
              str = stringexpr();
              if (str) {
                sprintf((char *)buff, "\"%s\"", str);
                fwrite_str(FILES[f].file, buff);
                free(str);
              }
            }
            else if (token == TAB) {
               // not allowed in WRITE#
               seterror(ERR_SYNTAX);
            }
            else if (token == SPC) {
               // not allowed in WRITE#
               seterror(ERR_SYNTAX);
            }
            else {
               x = expr(1);
               if (x.type == INTID) {
                  sprintf((char *)buff, "%d", x.val.ival);
               }
               else {
                  sprintf((char *)buff, "%g", x.val.dval);
               }
               str = buff;
               while (*str) {
                  fwrite_char(FILES[f].file, *str);
                  str++;
               }
            }
            if ((token == ',') || (token == ';')) {
              match_token(token);
              fwrite_char(FILES[f].file, ',');
              fwrite_char(FILES[f].file, ' ');
            }
         }
         fwrite_char(FILES[f].file, '\n');
      }
      else {
         // file is not open
         seterror(ERR_NOFILE);
         return;
      }      
   }
}


/*
 * do_lset - left align a field
 */
static void do_lset(void) {
  LVALUE lv;
  unsigned char *temp = NULL;
  int len1;
  int len2;
  int i;

  match_token(LSET);

  lvalue(&lv);

  match_token('=');

  if (lv.type == STRID) {
      temp = stringexpr();
      if (temp) {
         if (lv.len > 0) {
            // this lvalue is a FIELD, so overwrite the field with the
            // new value, left justified, up to the length of the field
            len1 = lv.len;
            for (i = 0; i < len1; i++) {
               (*lv.val.sval)[i] = temp[i];
            }
         }
         else {
            // this lvalue is not a field, so overwrite the existing
            // string with the new value, left justified, up to the
            // existing length of the string
            len1 = strlen((char *)*lv.val.sval);
            len2 = strlen((char *)temp);
            if (len2 < len1) {
               len1 = len2;
            }
            for (i = 0; i < len1; i++) {
               (*lv.val.sval)[i] = temp[i];
            }
         }
      }
      if (temp) {
         free(temp);
      }
  }
  else {
     seterror(ERR_BADTYPE);
  }
}


/*
 * do_rset - right align a field
 */
static void do_rset(void) {
  LVALUE lv;
  unsigned char *temp = NULL;
  int len1;
  int len2;
  int off1;
  int off2;
  int i;

  match_token(RSET);

  lvalue(&lv);

  match_token('=');

  if (lv.type == STRID) {
      temp = stringexpr();
      if (temp) {
         if (lv.len > 0) {
            // this lvalue is a FIELD, so overwrite the field with the
            // new value, right justified, up to the length of the field
            len1 = lv.len;
         }
         else {
            // this lvalue is not a field, so overwrite the existing
            // string with the new value, right justified, up to the
            // existing length of the string
            len1 = strlen((char *)*lv.val.sval);
         }
         len2 = strlen((char *)temp);
         if (len2 < len1) {
            off1 = len1 - len2;
            off2 = 0;
            len1 = len2;
         }
         else {
            off1 = 0;
            off2 = len2 - len1;
         }
         for (i = 0; i < len1; i++) {
            (*lv.val.sval)[i + off1] = temp[i + off2];
         }
      }
      if (temp) {
         free(temp);
      }
  }
  else {
     seterror(ERR_BADTYPE);
  }
}


/*
 * do_poke - poke a byte
 */
static void do_poke(void) {
  int i;
  int addr;
  int byte;

  match_token(POKE);

  addr = strict_integer(expr(1));
  if (addr < 0) {
      seterror(ERR_BADVALUE);
  }
  
  match_token(',');

  byte = strict_integer(expr(1));

  if ((byte < 0) || (byte > 255)) {
      seterror(ERR_BADVALUE);
  }

  if (errorflag == 0) {
     *((char *)addr) = byte;
  }
}


/*
 * do_resume - resume after error
 */
static int do_resume(void) {
   RVALUE line_index;
   int line_no;

   match_token(RESUME);

   if ((errorindx == 0) || (errorlast == 0)) {
      // we are not in error trap
      seterror(ERR_RESUME);
      return 0;
   }

   errorflag = 0; // clear error

   if (is_eol(token)) {
      return errorindx;
   }
   else if (token == NEXT) {
      return errorindx + 1;
   }

   if (getlineindex(&line_index) > 0) {
      return line_index.val.indx;
   }
   else {
      line_no = strict_integer(expr(1));
      if (line_no == 0) {
         return errorindx;
      }
      else {
         return findline(line_no);
      }
   }
}


/*
 * call assembly function - note that the assembly language and interface
 *                          depends on the processor and memory model in use.
 *                          All the memory models that Dumbo BASIC can be
 *                          compiled in are implemented for the P1 and P2.
 */
static int call_assembly(int addr, int arg4, int arg3, int arg2, int arg1) {
#ifdef __CATALINA__

#if DEBUG
   printf("\nRequest to call assembly function, address %08X, args:\n", addr);
   printf("  r2 = %08X\n", arg1);
   printf("  r3 = %08X\n", arg2);
   printf("  r4 = %08X\n", arg3);
   printf("  r5 = %08X\n\n", arg4);
   printf("\nWARNING! ENABLING THIS DEBUGGING MESSAGE DESTROYS THE REGISTERS\n", addr);
#endif

   assembly_addr = addr;
   assembly_retn = 0;

#if defined(__CATALINA_COMPACT)
// Propeller 1 or 2 ...
   PASM(" long I32_LODI+@C_assembly_addr<<S32 ' get address to call\n");
   PASM(" alignl\n");
   PASM(" word I16B_CALI                      ' call assembly function\n");
   PASM(" long I32_LODI+@C_assembly_retn<<S32\n"); 
   PASM(" alignl\n");
   PASM(" word I16B_PASM\n");
   PASM(" wrlong r0, RI                       ' return assembly result\n");
#else
#if defined(__CATALINA_P2)
// Propeller 2
#if defined(__CATALINA_LARGE)
   PASM(" calld PA, #LODL\n");
   PASM(" long @C_assembly_addr\n");
   PASM(" calld PA, #RLNG\n");
   PASM(" mov RI, BC\n");
   PASM(" calld PA, #CALI\n");
   PASM(" calld PA, #LODL\n");
   PASM(" long @C_assembly_addr\n");
   PASM(" calld PA, #RLNG\n");
   PASM(" mov RI, BC\n");
   PASM(" calld PA, #LODL\n");
   PASM(" long @C_assembly_retn\n");
   PASM(" calld PA, #WLNG\n");
   PASM(" mov RI, BC\n");
   PASM(" rdlong RI, RI\n");
#elif defined(__CATALINA_SMALL) || defined(__CATALINA_TINY) 
   PASM(" calld PA, #LODL\n");
   PASM(" long @C_assembly_addr\n");
   PASM(" rdlong RI, RI\n");
   PASM(" calld PA, #CALI\n");
   PASM(" calld PA, #LODL\n");
   PASM(" long @C_assembly_addr\n");
   PASM(" rdlong RI, RI\n");
   PASM(" calld PA, #LODL\n");
   PASM(" long @C_assembly_retn\n");
   PASM(" rdlong RI, RI\n");
#else
   // must be NATIVE
   PASM(" rdlong RI, ##@C_assembly_addr ' get address to call\n");
   PASM(" calld PA,#CALI\n");
   PASM(" wrlong r0, ##@C_assembly_retn ' return assembly result\n");
#endif
#else
// Propeller 1
#if defined(__CATALINA_LARGE)
   PASM(" jmp #LODL\n");
   PASM(" long @C_assembly_addr\n");
   PASM(" jmp #RLNG\n");
   PASM(" mov RI, BC\n");
   PASM(" jmp #CALI\n");
   PASM(" jmp #LODL\n");
   PASM(" long @C_assembly_addr\n");
   PASM(" jmp #RLNG\n");
   PASM(" mov RI, BC\n");
   PASM(" jmp #LODL\n");
   PASM(" long @C_assembly_retn\n");
   PASM(" jmp #WLNG\n");
   PASM(" mov RI, BC\n");
   PASM(" rdlong RI, RI\n");
#else
   PASM(" jmp #LODL\n");
   PASM(" long @C_assembly_addr\n");
   PASM(" rdlong RI, RI\n");
   PASM(" jmp #CALI\n");
   PASM(" jmp #LODL\n");
   PASM(" long @C_assembly_addr\n");
   PASM(" rdlong RI, RI\n");
   PASM(" jmp #LODL\n");
   PASM(" long @C_assembly_retn\n");
   PASM(" rdlong RI, RI\n");
#endif
#endif
#endif

#if DEBUG
   printf("Returns r0 = %08X\n\n", assembly_retn);
#endif

   return assembly_retn;

#else
   printf("ERROR: Calling assembly functions is not supported on this platform\n\n");
   return 0;
#endif

}

/*
  Get a call variable from the environment (similar to lvalue, but
  in a call statement, the syntax var(a,b,c,d) does not mean var is an
  array and we want the element with subscripts (a,b,c,d), but that it  
  is a simple variable with an integer value that contains the address 
  to be called with the parameters (a,b,c,d). This means we have to
  re-interpret the variable name.
  Notes: missing variables are added to the variable list, but cannot
  be called because the value will be zero.
*/
static void cvalue(LVALUE *lv)
{
  unsigned char name[MAXID + 1];
  int len;
  VARIABLE *var = NULL;
  DIMVAR *dimvar = NULL;
  int indx;
  
  lv->type = ERRID;
  lv->len  = 0;

#if DEBUG
  printf("cvalue token = %d\n", token);
#endif  

  switch (token) {

    case VAR_INT:
    case VAR_FLT:
    case VAR_STR:
       indx = getindex();
       lv->type = token - VAR_INT + INTID;
       match_token(token);
       if (indx < nvariables) {
          if (lv->type == FLTID) {
             lv->val.dval = &variables[indx].val.dval;
          }
          else if (lv->type == INTID) {
             lv->val.ival = &variables[indx].val.ival;
          }
          else {
             lv->len = variables[indx].len;
             lv->val.sval = &variables[indx].val.sval;
          }
          return;
       }
       else {
          seterror(ERR_INTERNAL);
          return;
       }
       break;

    case INTID:
    case FLTID:
    case STRID:
       lv->type = token;
       len = getid(name);
       match_token(token);
       var = findvariable(name);
       if (!var) {
          if (lv->type == FLTID) {
             var = addfloat(name);
             lv->val.dval = &var->val.dval;
          }
          else if (lv->type == INTID) {
             var = addinteger(name);
             lv->val.ival = &var->val.ival;
          }
          else {
             var = addstring(name);
             lv->len = var->len;
             lv->val.sval = &var->val.sval;
          }
          return;
       }
       if (var == NULL) {
          seterror(ERR_OUTOFMEMORY);
          return;
       }
       break;

    case VAR_DIMINT:
    case VAR_DIMFLT:
    case VAR_DIMSTR:
       indx = getindex();
       lv->type = token - VAR_DIMINT + INTID;     
       match_token(token);
       if (indx < ndimvariables) {
          dimvar = &dimvariables[indx];
          lv->type = dimvar->type;
       }
       else {
          seterror(ERR_INTERNAL);
          return;
       }
       len = strlen((char *)dimvar->id) - 1;
       strncpy((char *)name, (char *)dimvar->id, len);
       name[len] = '\0';
       var = findvariable(name);
       if (var != NULL) {
          if (lv->type == FLTID) {
             lv->val.dval = &var->val.dval;
          }
          else if (lv->type == INTID) {
             lv->val.ival = &var->val.ival;
          }
          else {
             lv->len = var->len;
             lv->val.sval = &var->val.sval;
          }
          return;
       }
       else {
          seterror(ERR_INTERNAL);
          return;
       }
       break;

    case DIMINTID:
    case DIMFLTID:
    case DIMSTRID:
       lv->type = token - DIMINTID + INTID;
       len = getid(name);
       match_token(token);
       len = strlen((char *)name) - 1;
       name[len] = '\0';
       var = findvariable(name);
       if (var != NULL) {
          if (lv->type == FLTID) {
             lv->val.dval = &var->val.dval;
          }
          else if (lv->type == INTID) {
             lv->val.ival = &var->val.ival;
          }
          else {
             lv->len = var->len;
             lv->val.sval = &var->val.sval;
          }
          return;
       }
       else {
          if (lv->type == FLTID) {
             var = addfloat(name);
             lv->val.dval = &var->val.dval;
          }
          else if (lv->type == INTID) {
             var = addinteger(name);
             lv->val.ival = &var->val.ival;
          }
          else {
             var = addstring(name);
             lv->len = var->len;
             lv->val.sval = &var->val.sval;
          }
          return;
       }
       break;

     default:
       seterror(ERR_SYNTAX);
       return;
  }

}


/*
 * do_call - call a propeller assembly function
 */
static void do_call(void) {
   int addr;
   LVALUE lv;
   int arg_count;
   int i;
   RVALUE exp[4];
   unsigned char *str[4] = {NULL, NULL, NULL, NULL};
   int arg[4] = {0, 0, 0, 0};

   match_token(CALL);

   cvalue(&lv);
   if (lv.type == INTID) {
      if ((addr = *lv.val.ival) == 0) {
         seterror(ERR_BADVALUE);
         return;
      }
   }
   else {
      seterror(ERR_BADTYPE);
      return;
   }

   // the '(' may have been swallowed during tokenization :(
   if (token == '(') {
      match_token('(');
   }
   arg_count = 0;
   if (!is_eol(token)) {
      while ((arg_count < 4) && (token != ')')) {
         if (is_string(token)) {
            str[arg_count] = stringexpr();
         }
         else {
            exp[arg_count] = expr(1);
         }
         arg_count++;
         if (token == ',') {
            match_token(',');
         }
      }
      if (token == ',') {
         seterror(ERR_TOOMANYARGS);
         return;
      }
      else if (token == ')') {
         match_token(')');
      }
      else {
         seterror(ERR_SYNTAX);
         return;
      }
   }

   // marshall arguments
   for (i = 0; i < 4; i++) {
      if (str[i] != NULL) {
         arg[i] = (int)str[i];
      }
      else if (exp[i].type == INTID) {
         arg[i] = exp[i].val.ival;
      }
      else if (exp[i].type == FLTID) {
         arg[i] = (int)exp[i].val.dval;
      }
      else {
         seterror(ERR_SYNTAX);
         return;
      }
   }
   // call assembly function at addr with args 0 .. 3
   // there is no result returned
   call_assembly(addr, arg[3], arg[2], arg[1], arg[0]);
}


/*
 * int_usr - call propeller USR assembly function 'i'
 *           This version takes an int argument and must return an int
 */
static int int_usr(int i, int arg) {
   int answer = 0;
   int addr = usr_function[i];

   if (addr == 0) {
      seterror(ERR_BADUSR);
   }
   else {
      // call assembly function at addr with arg in r2
      // return int result as int;
#if DEBUG      
      printf("int_usr, addr = %X, arg = %d (%X)\n", addr, arg, arg);
#endif
      answer = call_assembly(addr, 0, 0, 0, arg);
   }
   return answer;
}


/*
 * real_usr - call propeller USR assembly function 'i'
 *            This version takes a real argument and must return a real
 */
static float real_usr(int i, float arg) {
   float answer = 0.0;
   int addr = usr_function[i];
   CONVERTER c;

   if (addr == 0) {
      seterror(ERR_BADUSR);
   }
   else {
      // call assembly function at addr with arg
      // return result as float;
      c.dval = arg;
#if DEBUG      
      printf("real_usr, addr = %X, arg = %f (%X)\n", addr, arg, c.ival);
#endif
      c.ival = call_assembly(addr, 0, 0, 0, c.ival);
      answer = c.dval;
   }
   return answer;
}


/*
 * str_usr - call propeller USR assembly function 'i'
 *           This version takes a string argument and must return a string
 */
static unsigned char *str_usr(int i, unsigned char *arg) {
   unsigned char *answer;
   int addr = usr_function[i];
   CONVERTER c;

   if (addr == 0) {
      seterror(ERR_BADUSR);
      answer = mystrdup(nullstr);
   }
   else {
      // call assembly function at addr with arg
      // return result as float;
      c.sval = arg;
#if DEBUG
      printf("str_usr, addr = %X, arg = %s (%X)\n", addr, arg, c.ival);
#endif
      c.ival = call_assembly(addr, 0, 0, 0, c.ival);
      answer = c.sval;
   }
   return answer;
}


/*
 * do_restore - the RESTORE statement
 */
static int do_restore(void)
{
  int line;
  int saved_indx;
  int saved_offs;

  match_token(RESTORE);
  if (is_eol(token)) {
     data_indx = 0;
     data_offs = 0;
  }
  else {
     line = findline(strict_integer(expr(1)));
     if (line < 0) {
        seterror(ERR_NODATA);
        return -1;
     }
     saved_indx = current_indx;
     saved_offs = current_offs;
     current_indx = line;
     current_offs = 0;
     token = gettoken();
     if (token == VALUE) {
        match_token(VALUE);
     }
     if (token == DATA) {
        match_token(DATA);
        data_indx = current_indx;
        data_offs = current_offs;
     }
     else {
        current_indx = saved_indx;
        current_offs = saved_offs;
        return -1;
     }
     current_indx = saved_indx;
     current_offs = saved_offs;
  }
  return 0;
}

/*
 * the DATA statement
 */
static void do_data(void) {
   // just skip over data lines
   find_eol();
}

/*
 * move to next data element
 */
void next_data_element(void) {

   if (token == ',') {
      match_token(',');
   }
   else {
      while (!errorflag && (token != DATA) && (token != EOS)) {
         next_token();
      }
      if (token == DATA) {
         match_token(DATA);
      }
   }
}

/*
 * the READ statement
 */
static int do_read(void) {
  LVALUE lv;
  unsigned char *temp;
  int saved_indx;
  int saved_offs;
  int answer = 0;
  unsigned char id[MAXID + 1];
  int len;
  int indx;

  match_token(READ);
  if ((data_indx == 0) && (data_offs == 0)) {
     saved_indx = current_indx;
     saved_offs = current_offs;
     current_indx = 1;
     current_offs = 0;
     token = gettoken();
     while (!errorflag) {
        if (token == EOS) {
           seterror(ERR_NODATA);
           return -1;
        }
        if (token == DATA) {
           match_token(DATA);
           data_indx = current_indx;
           data_offs = current_offs;
           current_indx = saved_indx;
           current_offs = saved_offs;
           break;
        }
        next_token();
     }
  }
  do {
     token = gettoken();
     if ((token >= VAR_INT) && (token <= VAR_STR)) {
        indx = getindex();
        //printf("indx = %d, nvariables = %d\n", indx, nvariables);
        if (indx < nvariables) {
           //printf("index = %d, name = %s\n", indx, variables[indx].id);
           strcpy((char *)id, (char *)variables[indx].id);
        }
        lvalue(&lv);
     }
     else if ((token >= VAR_DIMINT) && (token <= VAR_DIMSTR)) {
        indx = getindex();
        //printf("indx = %d, nvariables = %d\n", indx, ndimvariables);
        if (indx < ndimvariables) {
           //printf("index = %d, name = %s\n", indx, dimvariables[indx].id);
           strcpy((char *)id, (char *)dimvariables[indx].id);
        }
        lvalue(&lv);
     }
     else {
        len = getid(id);
        lvalue(&lv);
     }
     if (errorflag != 0) {
        return -1;
     }

     saved_indx = current_indx;
     saved_offs = current_offs;
     current_indx = data_indx;
     current_offs = data_offs;
     token = gettoken();
     switch (lv.type) {
       case INTID:
         *lv.val.ival = integer(expr(1));
         break;
       case FLTID:
         *lv.val.dval = real(expr(1));
         break;
       case STRID:
         temp = *lv.val.sval;
         *lv.val.sval = stringexpr();
         if (temp) {
            free(temp);
         }
         break;
       default:
         break;
     }
     next_data_element();
     data_indx = current_indx;
     data_offs = current_offs;
     current_indx = saved_indx;
     current_offs = saved_offs;
     token = gettoken();
     if (token == ',') {
        match_token(',');
     }
  } while (!is_eol(token));
  return answer;

}

/* 
 * find_control - find the for loop control variable if already on the for stack
 */
int find_control(unsigned char *id) {
   int i;
   for (i = 0; i < nfors; i++) {
      if (strcmp_i(forstack[i].id, id) == 0) {
         //debug("found for loop control %s (%s) at %d\n", id, forstack[i].id, i);
         return i;
      }
   }
   //debug("no for loop control %s found\n", id);
   return -1;
}


/*
 * do_for - the FOR statement.
 *
 * Pushes the for stack (removing the control variable if already on the stack).
 * Returns line to jump to, or -1 to end program
 *
 */
static int do_for(void)
{
  LVALUE lv;
  unsigned char id[MAXID + 1];
  unsigned char nextid[MAXID + 1];
  int len;
  RVALUE initval;
  RVALUE toval;
  RVALUE stepval;
  int for_count = 0;
  int answer = 0;
  int skip_for;
  int i;
  int indx;

  match_token(FOR);

#if DEBUG       
  printf("For at line %d\n", lines[current_indx].no);
#endif       

  if ((token >= VAR_INT) && (token <= VAR_STR)) {
     indx = getindex();
     //printf("indx = %d, nvariables = %d\n", indx, nvariables);
     if (indx < nvariables) {
        //printf("index = %d, name = %s\n", indx, variables[indx].id);
        strcpy((char *)id, (char *)variables[indx].id);
     }
     lvalue(&lv);
  }
  else if ((token >= VAR_DIMINT) && (token <= VAR_DIMSTR)) {
     indx = getindex();
     //printf("indx = %d, nvariables = %d\n", indx, ndimvariables);
     if (indx < ndimvariables) {
        //printf("index = %d, name = %s\n", indx, dimvariables[indx].id);
        strcpy((char *)id, (char *)dimvariables[indx].id);
     }
     lvalue(&lv);
  }
  else {
     len = getid(id);
     lvalue(&lv);
  }
#if DEBUG       
  printf("control variable %s\n", id);
#endif       

  if (errorflag != 0) {
     return -1;
  }

  if ((lv.type != INTID) && (lv.type != FLTID)) {
    seterror(ERR_BADTYPE);
    return -1;
  }

  match_token('=');
  initval.type = lv.type;
  if (lv.type == INTID) {
     initval.val.ival = integer(expr(1));
  }
  else {
     initval.val.dval = real(expr(1));
  }
  match_token(TO);
  toval.type = lv.type;
  if (lv.type == INTID) {
     toval.val.ival = integer(expr(1));
  }
  else {
     toval.val.dval = real(expr(1));
  }
  if (token == STEP) {
    match_token(STEP);
    if (lv.type == INTID) {
       stepval.val.ival = integer(expr(1));
    }
    else {
       stepval.val.dval = real(expr(1));
    }
  }
  else {
    if (lv.type == INTID) {
       stepval.val.ival = 1;
    }
    else {
       stepval.val.dval = 1.0;
    }
  }
  stepval.type = lv.type;

  if (lv.type == INTID) {
     *lv.val.ival = initval.val.ival;
  }
  else {
     *lv.val.dval = initval.val.dval;
  }

  if (lv.type == INTID) {
     skip_for = ((stepval.val.ival < 0) && (initval.val.ival < toval.val.ival))  
             || ((stepval.val.ival > 0) && (initval.val.ival > toval.val.ival));
  }
  else {
     skip_for = ((stepval.val.dval < 0.0) && (initval.val.dval < toval.val.dval)) 
             || ((stepval.val.dval > 0.0) && (initval.val.dval > toval.val.dval));
  }
 
  if (skip_for) {
    while (!errorflag) {
       next_token();
       if (!errorflag) {
         if (token == EOS) {
            seterror(ERR_NONEXT);
            return -1;
         }
         if (token == FOR) {
#if DEBUG
           printf("found embedded for\n");
#endif     
            for_count++;
         }
         if (token == NEXT) {
           match_token(NEXT);
           if (is_eol(token)) {
              if (for_count > 0) {
#if DEBUG
                 printf("found embedded next\n");
#endif     
                 for_count--;
              }
              else {
#if DEBUG
                 printf("found unembelished next\n");
#endif     
                 answer = current_indx + 1;
                 return answer;
              }
           }
           else {
              while ((token == INTID) 
              ||     (token == FLTID) 
              ||     (token == DIMINTID)
              ||     (token == DIMFLTID)
              ||     (token == VAR_INT)
              ||     (token == VAR_FLT)
              ||     (token == VAR_DIMINT)
              ||     (token == VAR_DIMFLT)) {
                if ((token >= VAR_INT) && (token <= ARG_DIMSTR)) {
                   // these tokens are followed by an index
                   indx = getindex();
                   //printf("indx = %d, nvariables = %d\n", indx, nvariables);
                   if (indx < nvariables) {
                      //printf("index = %d, name = %s\n", indx, variables[indx].id);
                      strcpy((char *)nextid, (char *)variables[indx].id);
                   }
                }
                else {
                   len = getid(nextid);
                }
#if DEBUG
                printf("found next %s\n", nextid);
#endif
                match_token(token);
                if (strcmp_i(id, nextid) == 0) {
                  answer = current_indx + 1;
                  return answer;
                }
                printf("%s and %s don't match\n", id, nextid);
                if (token == ',') {
                   match_token(',');
#if DEBUG
                printf("found comma\n");
#endif     
                }
              }
           }
         }
         find_eol();
      }
      else {
         answer = -1;
         break;
      }
    }
  }
  else {
    i = find_control(id);
    if (i < 0) {
       // add to stack
       if (nfors >= MAXFORS - 1) {
          seterror(ERR_TOOMANYFORS);
          return -1;
       }
#if DEBUG       
       printf("putting control variable %s at %d\n", id, nfors);
#endif       
       i = nfors;
       nfors++;
    }
    else {
       // first remove old control variable
#if DEBUG       
       printf("overriding control variable %s at %d\n", id, i);
#endif       
       for (for_count = i; for_count < nfors; for_count++) {
          forstack[for_count] = forstack[for_count+1];
       }
       i = nfors - 1;
    }
    strcpy((char *)forstack[i].id, (char *)id);
    forstack[i].control = lv;
    forstack[i].nextline = current_indx + 1;
    forstack[i].step = stepval;
    forstack[i].toval = toval;
#if DEBUG
    printf("for statement with next %d, nfors=%d, errorflag=%d\n", forstack[i].nextline, nfors, errorflag);
#endif     
    answer = 0;
  }
  return answer;
}

/*
 * for_complete - increment for variable and check for loop completion
 */
static int for_complete(LVALUE *lv) {
   if (lv->type == INTID) {
#if DEBUG
      printf("val=%d\n", *lv->val.ival);
#endif     
      *lv->val.ival += forstack[nfors-1].step.val.ival;
      if ((forstack[nfors-1].step.val.ival < 0.0 
          && *lv->val.ival < forstack[nfors-1].toval.val.ival) 
      ||  (forstack[nfors-1].step.val.ival > 0.0 
          && *lv->val.ival > forstack[nfors-1].toval.val.ival) ) {
         return 1;
      }
   }
   else {
#if DEBUG
      printf("val=%g\n", *lv->val.dval);
#endif     
      *lv->val.dval += forstack[nfors-1].step.val.dval;
      if ((forstack[nfors-1].step.val.dval < 0.0 
          && *lv->val.dval < forstack[nfors-1].toval.val.dval) 
      ||  (forstack[nfors-1].step.val.dval > 0.0 
          && *lv->val.dval > forstack[nfors-1].toval.val.dval) ) {
         return 1;
      }
   }
   return 0;
}

/*
 * do_next - the NEXT statement
 * updates the counting index, pops the for stack if required, and returns line to jump to
 */
static int do_next(void)
{
  int answer = 0;
  unsigned char nextid[MAXID + 1];
  int len;
  LVALUE lv;
  int saved_indx;
  int saved_offs;
  int found;
  int indx;

  match_token(NEXT);

  //printf("doing next\n");
  if (nfors) {
     
     if (is_eol(token)) {
#if DEBUG
           printf("found unembelished next, nfors=%d\n",nfors);
#endif     
        if (for_complete (&forstack[nfors - 1].control)) {
              nfors--;
        }
        else {
           answer = forstack[nfors - 1].nextline;
#if DEBUG
           printf("next statement going to index %d\n", answer);
#endif     
           return answer;
        }
     }
     else {
        found = 0;             
        saved_indx = current_indx;
        saved_offs = current_offs;        
        while ((token == INTID) 
        ||     (token == FLTID) 
        ||     (token == DIMINTID)
        ||     (token == DIMFLTID)
        ||     (token == VAR_INT)
        ||     (token == VAR_FLT)
        ||     (token == VAR_DIMINT)
        ||     (token == VAR_DIMFLT)) {
           if ((token >= VAR_INT) && (token <= ARG_DIMSTR)) {
              // these tokens are followed by an index
              indx = getindex();
              //printf("indx = %d, nvariables = %d\n", indx, nvariables);
              if (indx < nvariables) {
                 //printf("index = %d, name = %s\n", indx, variables[indx].id);
                 strcpy((char *)nextid, (char *)variables[indx].id);
              }
           }
           else {
              len = getid(nextid);
           }
#if DEBUG
           printf("found next %s (while looking for next %s,nfors=%d)\n", 
                 nextid, forstack[nfors-1].id,nfors); 
#endif     
           if (strcmp_i(forstack[nfors-1].id, nextid) == 0) {
              lvalue(&lv);
              if (for_complete (&lv)) {
#if DEBUG
                    printf("for statement complete\n");
#endif
                    nfors--;
                    if (nfors) {
                       // keep looking    
                       current_indx = saved_indx;
                       current_offs = saved_offs;
                       token = gettoken();      
                    }
                    else {
                    }
              }
              else {
                 answer = forstack[nfors - 1].nextline;
#if DEBUG
                 printf("next statement going to index %d\n", answer);
#endif
                 find_eol(); 
                 return answer;
              }
           }
           else {
              match_token(token);
           }
           if (token == ',') {
              match_token(',');
#if DEBUG
              printf("found comma\n");
#endif     
           }
        }
     }
  }
  else {
    seterror(ERR_NOFOR);
    return -1;
  }
  return answer;
}

/*
 * next_token : find next token, skipping over EOLs and REM statements, but
 *              not EOS
 */
void next_token(void) {
#if DEBUG
      printf("entering next_token, token = %d\n", token);
      printf("current_indx = %d, current_offs = %d\n", current_indx, current_offs);
#endif
   do {
      if (token == EOS) {
#if DEBUG
         printf("found EOS\n");
         printf("current_indx = %d, current_offs = %d\n", current_indx, current_offs);
#endif
         break;
      }
      else if (is_eol(token)) {
#if DEBUG
         printf("found EOL, token = %d\n", token);
         printf("current_indx = %d, current_offs = %d\n", current_indx, current_offs);
#endif
         match_eol();
         if (token == VALUE) {
#if DEBUG
            printf("found value\n");
#endif
            match_token(VALUE);
         }
      }
      else if (token == '"') {
#if DEBUG
         printf("found string literal\n");
#endif
         match_literal();
      }
      else if ((token == REM) ||(token == '\'')) {
#if DEBUG
         printf("found REM or '\n");
#endif
         find_eol();
      }
      else {
         match_token(token);
      }
   } while ((current_indx <= nlines) 
     &&     (is_eol(token) || (token == REM) || (token == '\'')));
#if DEBUG
   printf("leaving next_token\n");
   printf("current_indx = %d, current_offs = %d\n", current_indx, current_offs);
#endif
} 

/*
  The WHILE statement.

  Pushes the while stack.
  Returns line to jump to, or -1 to end program

*/
static int do_while()
{
  int index = current_indx;
  RVALUE condition;
  int while_count = 0;
  int answer = 0;

  match_token(WHILE);
  condition = expr(1);
  if (condition.type != INTID) {
     seterror(ERR_BADTYPE);
     return -1;     
  }

  if (nwhiles >= MAXWHILES - 1) {
    seterror(ERR_TOOMANYWHILES);
    return -1;
  }


  if (condition.val.ival) {
#if DEBUG
    printf("while condition true, wend will return to index %d\n", index);
#endif     
    whilestack[nwhiles].nextline = index;
    nwhiles++;
    answer = 0;
  }
  else {
#if DEBUG
    printf("while condition not true at index %d\n", index);
#endif     

    while (!errorflag) {
       next_token();
       if (!errorflag) {
#if DEBUG
         printf("token = %d\n", token);
#endif    
         if (token == EOS) {
            seterror(ERR_NOWEND);
            return -1;
         }
         if (token == WHILE) {
#if DEBUG
           printf("found embedded while\n");
#endif     
           while_count++;
         }
         else if (token == WEND) {
           if (while_count > 0) {
#if DEBUG
              printf("found embedded wend\n");
#endif     
              while_count--;
           }
           else {
#if DEBUG
              printf("found wend\n");
#endif     
              answer = current_indx + 1;
              //token = gettoken();
              //answer = answer ? answer : -1;
              break;
           }
         }
       }
       else {
          answer = -1;
          break;
       }
    }
  }
#if DEBUG
  printf("answer = %d\n", answer);
#endif     
  return answer;
}

/*
  the WEND statement
  returns line to jump to
*/
static int do_wend(void)
{
  int answer = 0;

  match_token(WEND);

  if (nwhiles) {
    answer = whilestack[--nwhiles].nextline;
#if DEBUG    
    printf("wend returning to index %d\n", answer);
#endif    
  }
  else {
    seterror(ERR_NOWHILE);
    return -1;
  }
  return answer;
}

/*
  the GOSUB statement
  adds an entry to the gosub stack and return the gosub line number
*/
static int do_gosub(void)
{
  RVALUE line_index;
  int gosub_line;
  int answer = 0;
  int index = current_indx;

  match_token(GOSUB);
  if (getlineindex(&line_index) > 0) {
     gosub_line = line_index.val.indx;
  }
  else {
     gosub_line = findline(strict_integer(expr(1)));
  }
  if (ngosubs >= MAXGOSUBS - 1) {
    seterror(ERR_TOOMANYGOSUBS);
    return -1;
  }
  gosubstack[ngosubs].nextline = index + 1;
  ngosubs++;
#if DEBUG  
  printf("gosub to index %d\n", gosub_line);
#endif
  answer = gosub_line;
  return answer;
}

/*
  the RETURN statement
  returns line to jump to. Note that a line number can be
  specified but is ignored
*/
static int do_return(void)
{
  int answer = 0;
  int return_line;

  match_token(RETURN);
  if (token == VALUE) {
     return_line = findline(strict_integer(expr(1)));
  }

  if (ngosubs) {
    answer = gosubstack[--ngosubs].nextline;
#if DEBUG    
    printf("gosub returning to %d\n", answer);
#endif    
  }
  else {
    seterror(ERR_NOGOSUB);
    return -1;
  }
  return answer;
}

/*
 * do_end - the END statement
 */
static void do_end(void)
{
   cleanup();
#ifdef __CATALINA__
   _waitms(100); // allow time for output to be printed
#endif
   exit(0);
}

/*
 * do_stop - the STOP statement
 */
static void do_stop(void) {
   fprintf(fperr, "Break in line %d\n", lineno(current_indx)); 
   //
   // note - stop expects to be continued, and so does not cleanup,
   //        but at the moment dumbo_basic just exits
#ifdef __CATALINA__
   _waitms(100); // allow time for output to be printed
#endif
   exit(0);
}

/*
 * line_index - get a line integer from an RVALUE, or if it is an integer
 *              then cast an rvalue to an integer, triggering errors if out 
 *              of range or the value is not integral
 */
static int line_index(RVALUE x) {
  if (x.type == LINE) {
     return x.val.indx;
  }
  if (x.type == INTID) {
     return findline(x.val.ival);
  }
  if ( x.val.dval < INT_MIN || x.val.dval > INT_MAX ) {
     seterror( ERR_BADVALUE );
  }
  if ( x.val.dval != floor(x.val.dval) ) {
     seterror( ERR_NOTINT );
  }
  return findline((int) x.val.dval);
}


/*
 * get_choice - select from a comma-separated list of line numbers, based 
 *              on the expression
 */
int get_choice(int selector) {
   int i;
   int answer = 0;

   if (selector == 0) {
      answer = 0;
   }
   else if ((selector < 0) || (selector > 255)) {
      seterror(ERR_BADSELECTOR);
      answer = -1;
   }
   else {
      for (i = 0; i < selector; i++) {
         answer = line_index(expr(1));
         token = gettoken();
         if (token == ',') {
            match_token(',');
         }
         else if (is_eol(token)) {
            if (i != selector - 1) {
               answer = 0;
               break;
            }
         }
      }
   }
   find_eol();
#if DEBUG
   printf("choice at line %d is line %d\n", 
      lineno(current_indx), 
      lineno(answer));
#endif
   return answer;
}
/*
 * The ON .. GOTO, ON .. GOSUB and ON ERROR GOTO statements
 * for ON .. GOTO returns to the goto line number
 * for ON .. GOSUB adds an entry to the gosub stack and return the gosub line number
 * for ON ERROR GOTO just save the specified line index in resume_indx
 */
static int do_on(void) {
  RVALUE line_index;
  int go_line;
  int selector;
  int answer;
  int len;

  match_token(ON);

  if (token == ERROR) {
     match_token(ERROR);
     match_token(GOTO);
     if (!errorflag) {
        if ((len = getlineindex(&line_index)) > 0) {
           resume_indx = line_index.val.indx;
           current_offs += len + 1;
        }
        else {
           go_line = strict_integer(expr(1));
           if (errorflag == 0) {
              if (go_line == 0) { 
                 if (resume_indx > 0) {
                    errorflag = errorlast;
                    reporterror(lineno(errorindx));
                    errorflag = 0;
                 }
                 else {
                    resume_indx = 0;
                 }
              }
              else {
                resume_indx = findline(go_line);
              }
           }
        }
     }
     return 0;
  }

  selector = integer(expr(1));
  token = gettoken();

  if (token == GOTO) {
     match_token(GOTO);
     answer = get_choice(selector);
  }
  else if (token == GOSUB) {
     match_token(GOSUB);
     answer = get_choice(selector);
     if (answer <= 0) {
        return answer;
     }
     if (ngosubs >= MAXGOSUBS - 1) {
       seterror(ERR_TOOMANYGOSUBS);
       return -1;
     }
     gosubstack[ngosubs].nextline = current_indx + 1;
     ngosubs++;
#if DEBUG  
     printf("gosub to index %d\n", go_line);
#endif
  }
  return answer;
}

/*
 * argtype - decode function or agument type
 */
static int argtype(const unsigned char *id, int len) {
   if (id[len - 1] == '(') {
      len--;
   }
   switch (id[len - 1]) {
     case '%':
       //debug("argtype = INTID\n");
       return INTID;
     case '$':
       //debug("argtype = STRID\n");
       return STRID;
     case '!':
     case '#':
       //debug("argtype = FLTID\n");
       return FLTID;
     default:
       //debug("argtype will be based on '%c'\n",toupper(id[0]));
       return deftype[toupper(id[0])-'A'];
   }
}

/*
 * do_clear - CLEAR (not currently implementeD)
 */
static void do_clear(void) {
   // just skip over clear lines
   find_eol();
}

/*
 * do_datestring - parse the $DATE = <stringexpr> statement
 * Accepts:
 *   mm-dd-yy
 *   mm/dd/yy
 *   mm-dd-yyyy
 *   mm/dd/yyyy
 */ 
static int do_datestring(void) {
   time_t bt;
   struct tm *t;
   char c1, c2;
   unsigned char *str;

   match_token(DATESTRING);

   match_token('=');

   str = stringexpr();

   if (!str) {
      seterror(ERR_SYNTAX);
      return -1;
   }
   else {
      bt = time(NULL);
      t = localtime(&bt);
   
      if (((sscanf((char *)str, "%d%c%d%c%d", &t->tm_mon, &c1, &t->tm_mday, &c2, &t->tm_year)) == 5)
      &&  (((c1 == '-') && (c2 == '-')) || ((c1 == '/') && (c2=='/')))) {
   
         if ((t->tm_mday >= 1) && (t->tm_mday <= 31) && (t->tm_mon > 0) && (t->tm_mon < 12)) {
            t->tm_mon -= 1;
            if ((t->tm_year) < 100) {
               t->tm_year += 100;
            }
            else {
               t->tm_year -= 1900;
            }
#if DEBUG            
            printf("date (mm/dd/yyyy)=%02d/%02d/%04d\n", t->tm_mon+1, t->tm_mday, t->tm_year+1900);
#endif            
            bt = mktime(t);
#ifdef __CATALINA__
            rtc_settime(bt); 
#else
#ifdef _WIN32            
            printf("Time cannot be set in Windows\n");            
#else
            {
               struct timeval tv; 
               tv.tv_sec = bt;
               tv.tv_usec = 0; 
               settimeofday(&tv, NULL); 
            }
#endif            
#endif 
         }
         else {
            //debug("date error\n");
            seterror(ERR_BADDATE);
            free(str);
            return -1; 
         }
      }
      else {
         //debug("date error\n");
         seterror(ERR_BADDATE);
         free(str);
         return -1; 
      }
      free(str);
      return 0;
   }
}

/*
 * do_timestring - parse the $TIME = <stringexpr> statement
 */
static int do_timestring(void) {
   time_t bt;
   struct tm *t;
   char c1, c2;
   unsigned char *str;

   match_token(TIMESTRING);
   match_token('=');

   str = stringexpr();

   if (!str) {
      seterror(ERR_SYNTAX);
      return -1;
   }
   else {
      bt = time(NULL);
      t = localtime(&bt);
   
      if (((sscanf((char *)str,
                   "%d%c%d%c%d", 
                   &t->tm_hour, 
                   &c1, 
                   &t->tm_min, 
                   &c2, 
                   &t->tm_sec)) == 5)
      &&  (c1 == ':') && (c2 == ':')) {
   
         if ((t->tm_hour >= 0) && (t->tm_hour <= 23) 
         &&  (t->tm_min >= 0) && (t->tm_min <= 59)
         &&  (t->tm_sec >= 0) && (t->tm_sec <= 59)) {
#if DEBUG            
            printf("time (hh:mm:ss)=%02d:%02d:%02d\n", t->tm_hour, t->tm_min, t->tm_sec);
#endif            
            bt = mktime(t);
#ifdef __CATALINA__
            rtc_settime(bt);
#else
#ifdef _WIN32            
            printf("Date cannot be set in Windows\n");            
#else
            {
               struct timeval tv; 
               tv.tv_sec = bt;
               tv.tv_usec = 0; 
               settimeofday(&tv, NULL); 
            }
#endif            
#endif 
         }
         else {
            //debug("time error\n");
            seterror(ERR_BADTIME); 
            free(str);
            return -1; 
         }
      }
      else {
         //debug("time error\n");
         seterror(ERR_BADTIME); 
         free(str);
         return -1; 
      }
      free(str);
      return 0;
   }
}

/*
 * do_swap - SWAP 
 */
static void do_swap(void) {
  LVALUE lv1;
  LVALUE lv2;
  int itmp;
  float dtmp;
  unsigned char *stmp;

  match_token(SWAP);
  lvalue(&lv1);
  match_token(',');
  lvalue(&lv2);
  if (lv1.type != lv2.type) {
     seterror(ERR_TYPEMISMATCH);
  }
  else {
     switch (lv1.type) {
        case INTID:
           itmp = *lv1.val.ival;
           *lv1.val.ival = *lv2.val.ival;
           *lv2.val.ival = itmp;
           break;
        case FLTID:
           dtmp = *lv1.val.dval;
           *lv1.val.dval = *lv2.val.dval;
           *lv2.val.dval = dtmp;
           break;
        default:
           stmp = *lv1.val.sval;
           *lv1.val.sval = *lv2.val.sval;
           *lv2.val.sval = stmp;
           break;
     }
  }
}

int get_seed() {
   int seed = 0;

   print_str((unsigned char *)"Random number seed (-32768 to 32767)? ");
   while ((fscanf(fpin, "%d", &seed) != 1) 
   || (seed < -32768) || (seed > 32767)) {
      fgetc(fpin);
      if (feof(fpin)) {
        seterror(ERR_EOF);
        return seed;
      }
   }
   fgetc(fpin);
   return seed;
}

/*
 * do_randomize - this statement can be any of:
 *    RANDOMIZE            -> prompt for the seed
 *    RANDOMIZE TIMER      -> use the the current time as the seed
 *    RANDOMIZE <expr>     -> use <expr> as the seed
 *    RANDOMIZE RANDOM     -> use getrealrand() as the seed (on the P2,
 *                            or when compiled with RANDOM on the P1) or 
 *                            else prompt for the seed (note this is an
 *                            extension to GW Basic)
 */
static void do_randomize(void) {
   LVALUE lv;
   int seed;

   match_token(RANDOMIZE);

   if (is_eol(token)) {
      // ask for the seed to be input
      seed = get_seed();
   }
   else if (token == TIMER) {
      // use the current time (lower 16 bits)
      match_token(TIMER);
      seed = (time(NULL) &0xFFFF) - 32768;
   }
   else if (token == RANDOM) {
      match_token(RANDOM);
#if defined(__CATALINA_RANDOM) || defined(__CATALINA_P2)
      // if we were compiled to include it on the P1, 
      // or we are on a P2, then use the real
      // real random number generator (lower 16 bits)
      seed = (getrealrand() & 0xFFFF) - 32768;
#else
      // ask for the seed to be input
      seed = get_seed();
#endif
   }
   else {
      // use the specified seed
      seed = integer(expr(1));
   }
   srand(seed);
}

/*
 * do_width - WIDTH (only screen width implemented)
 */
static void do_width(void) {
   int w;

   match_token(WIDTH);
   w = integer(expr(1));
   if ((w >= 0) && (w <= 255)) {
      width = w;
   }
   else {
      seterror(ERR_BADVALUE);
   }
}

/*
 * do_cls - CLS
 */
static void do_cls(void) {
   int w;

   match_token(CLS);
   find_eol();
#ifdef __CATALINA__
   t_char(1, '\f');
#else
   printf("CLS not implemented on PC\n");
#endif   
}

static void getrange(int *a, int *b) {
   unsigned char *str;
   *a = 0; 
   *b = -1;

   if ((context == NULL) && (str = lines[current_indx].tok) != NULL) {
     // use tokenized line if there is one, and we are not in
     // the context of a user-defined function
      str += current_offs;
   }
   else {
      // use non-tokenized line
      str = lines[current_indx].str + current_offs;
      // in non-tokenized lines, there may be extraneous spaces
      while (space_or_tab(*str)) {
        current_offs++;  
        str++;
      }
   }

   if (is_eol(*str)) {
      seterror(ERR_SYNTAX);
   }
   else {
      if (alpha(*str)) {
         *a = toupper (*str) - 'A';
         *b = *a;
         current_offs++;  
         str++;
      }
      while (space_or_tab(*str)) {
        current_offs++;   
        str++;
      }
      if (*str == '-') {
         current_offs++;   
         str++;
         while (space_or_tab(*str)) {
           current_offs++;   
           str++;
         }
         if (alpha(*str)) {
            *b = toupper (*str) - 'A';
            current_offs++;   
            str++;
            if (*b < *a) {
               seterror(ERR_SYNTAX);
            }
         }
      }
   }
}

/* 
 * do_defint - the DEF INT statement.
 */
static int do_defint(void) {
   int a;
   int b;

   match_token(DEFINT);
   while (!is_eol(token)) {
      getrange(&a, &b);
#if DEBUG
      printf("in defint, range = %d to %d", a, b);
#endif 
      while (a <= b) {
         deftype[a++] = INTID;
      }
      token = gettoken();
      if (errorflag) {
         return -1;
      }
      if (token == ',') {
         match_token(',');
      }
   }
   return 0;
}

/* 
 * do_defsng - the DEF SNG statement.
 */
static int do_defsng(void) {
   int a;
   int b;

   match_token(DEFSNG);
   while (!is_eol(token)) {
      getrange(&a, &b);
      while (a <= b) {
         deftype[a++] = FLTID;
      }
      token = gettoken();
      if (errorflag) {
         return - 1;
      }
      if (token == ',') {
         match_token(',');
      }
   }
   return 0;
}

/* 
 * do_defdbl - the DEF DBL statement.
 */
static int do_defdbl(void) {
   int a;
   int b;

   match_token(DEFDBL);
   while (!is_eol(token)) {
      getrange(&a, &b);
      while (a <= b) {
         deftype[a++] = FLTID;
      }
      token = gettoken();
      if (errorflag) {
         return -1;
      }
      if (token == ',') {
         match_token(',');
      }
   }
   return 0;
}

/* 
 * do_defstr - the DEF STR statement.
 */
static int do_defstr(void) {
   int a;
   int b;

   match_token(DEFSTR);
   while (!is_eol(token)) {
      getrange(&a, &b);
      while (a <= b) {
         deftype[a++] = STRID;
      }
      token = gettoken();
      if (errorflag) {
         return -1;
      }
      if (token == ',') {
         match_token(',');
      }
   }
   return 0;
}

/*
 * do_deffn - the DEF FN statement.
 * Note that the syntax of the function is not checked until it is used.
 *          
 */
static void do_deffn(void)
{
   int len;
   int i;

   if (nfunctions >= MAXFNS - 1) {
      seterror(ERR_TOOMANYDEFS);
      return;
   }

   len = getid(functions[nfunctions].id);
   current_offs += len;
   token = gettoken();
   if ((len > 2) && (toupper(functions[nfunctions].id[0]) == 'F') 
                 && (toupper(functions[nfunctions].id[1]) == 'N')) {
      functions[nfunctions].type = argtype(&functions[nfunctions].id[2], len-2);
      functions[nfunctions].nargs = 0;
      i = 0;
      //debug("def %s type = %d\n",  functions[nfunctions].id, functions[nfunctions].type); 
      if (functions[nfunctions].id[len - 1] == '(') {
         functions[nfunctions].id[len - 1] = '\0'; 
         while (i < 5) {
            len = getid(functions[nfunctions].arg[i].id);
            current_offs += len;
            token = gettoken();
            functions[nfunctions].arg[i].type = argtype(functions[nfunctions].arg[i].id, len);
            //debug("arg %s type = %d\n",  functions[nfunctions].arg[i].id, functions[nfunctions].arg[i].type); 
            i++;
            if (token == ',') {
               match_token(',');
            }
            else {
               break;
            }
         }
         if (token == ',') {
            seterror(ERR_TOOMANYARGS);
            return;
         }
         //debug("errorflag = %d, token=%d\n", errorflag, token);
         match_token(')');
         //debug("errorflag = %d, token=%d\n", errorflag, token);
      }
      functions[nfunctions].nargs = i;
      match_token('=');
      functions[nfunctions].indx = current_indx;
      functions[nfunctions].offs = current_offs;
#if DEBUG
      { 
         unsigned char *str = getcurrentpos();
         fprintf(fperr, "function name = %s\n", functions[nfunctions].id);
         fprintf(fperr, "function indx = %d\n", functions[nfunctions].indx);
         fprintf(fperr, "function offs = %d\n", functions[nfunctions].offs);
         fprintf(fperr, "function string = ");
         while (!is_eol(*str)) {
             fprintf(fperr, "%c", *str++);
         }
         fprintf(fperr, "\n");
      }
#endif
      nfunctions++;
      find_eol();
   }
   else {
      seterror(ERR_SYNTAX);
   }
}


/*
 * do_defusr - the DEF USR statement.
 *          
 */
static void do_defusr(void)
{
   RVALUE val;
   int len;
   int addr;
   int i;

   match_token(USR);

   if (token == '=') {
      i = 0;
   }
   else if (token == VALUE) {
      len = getvalue(&val);
      match_token(VALUE);
      if (val.type != INTID) {
         seterror(ERR_BADTYPE);
      }
      i = val.val.ival;
      if ((i < 0) || (i > 9)) {
         seterror(ERR_BADUSR);
      }
   }
   match_token('=');
   addr = strict_integer(expr(1));
   usr_function[i] = addr;
}

/*
 * wait_key() - wait for a key and return it
 */
int wait_key() {
#ifdef __CATALINA__
    return k_wait();
#else
#ifdef _WIN32
    return getch();
#else
  struct termios oldt, newt;
  int ch;
  int oldf;

  tcgetattr(STDIN_FILENO, &oldt);
  newt = oldt;
  newt.c_lflag &= ~(ICANON | ECHO);
  tcsetattr(STDIN_FILENO, TCSANOW, &newt);
  oldf = fcntl(STDIN_FILENO, F_GETFL, 0);
  fcntl(STDIN_FILENO, F_SETFL, oldf | O_NONBLOCK);

  do {
     ch = getchar();
     usleep(10);
  }
  while (ch == EOF);

  tcsetattr(STDIN_FILENO, TCSANOW, &oldt);
  fcntl(STDIN_FILENO, F_SETFL, oldf);

  return ch;
#endif
#endif
}

/*
  the INPUT statement
*/
static void do_input(void)
{
  LVALUE lv;
  unsigned char buff[MAX_CHARS];
  unsigned char *next, *end, endq;
  unsigned char *prompt;
  char ch;
  int len = 0;
  int no_return = 0;
  int indx = 0;
  int quoted;
  int start_offs;

  match_token(INPUT);

  if (token == '#') {
    do_fileinput();
    return;
  }

  if (token == ';') {
     match_token(';');
     no_return = 1;
  }
  if (token == '"') {
     prompt = stringliteral();
     if (prompt) {
        if (token == ',') {
           match_token(',');
           print_str(prompt);
           print_char(' ');
           fflush(stdout);
        }
        else {
           match_token(';');
           print_str(prompt);
           print_str((unsigned char *)"? ");
           fflush(stdout);
        }
        free(prompt);
     }
  }
  else {
     print_str((unsigned char *)"? ");
  }

  start_offs = current_offs;

  while ((indx <= 0) || (!is_eol(token) && !(token == END) && !(token == ELSE))) {

     if (indx < 0) {
        // must have encountered an error - restart
        print_str((unsigned char *)"?Redo from start\n");
        pos = 1;
        indx = 0;
        len = 0;
        current_offs = start_offs;
        token = gettoken();
     }

     if (indx == 0) {
        // read a line of characters
        while (len < MAX_CHARS) {
           ch = wait_key();
           if ((ch == EOF) || (ch == 0x03) || (ch == '\r') || (ch == '\n')) {
             break;
           }
           if ((ch == 0x08) || (ch == 0x7F)) {
             if (len > 0) {
                buff[--len] = 0;
                print_char(ch);
             }
           }
           else {
              buff[len++] = ch;
              print_char(ch);
           }
        }
        buff[len] = 0;
#ifndef __CATALINA
        if (ch == 0x03) {
           // CTRL-C should exit program on Windows and Linux
           exit(0);
        }
#endif
     }

     lvalue(&lv);

     switch (lv.type) {
       case INTID:
         if (sscanf((char *)&buff[indx], "%d", lv.val.ival) != 1) {
            indx = -1;
         }
         else {
            // move indx to next data item
            while ((buff[indx] != ',') 
            &&     (buff[indx] != '\n')
            &&     (buff[indx] != 0)) {
               indx++;
            }
            // skip over data item separator
            if (buff[indx] == ',') {
               indx++;
            }
         }
         break;
       case FLTID:
         if (sscanf((char *)&buff[indx], "%g", lv.val.dval) != 1) {
            indx = -1;
         }
         else {         
            // move indx to next data item
            while ((buff[indx] != ',') 
            &&     (buff[indx] != '\n')
            &&     (buff[indx] != 0)) {
               indx++;
            }
            // skip over data item separator
            if (buff[indx] == ',') {
               indx++;
            }
         }
         break;
       case STRID:
         if (*lv.val.sval) {
           free(*lv.val.sval);
           *lv.val.sval = 0;
         }
         // terminate line (or last data item)
         if (indx == 0) {
           end  = &buff[len];
           *end = 0;
         }
         // remove leading spaces (before quote!)
         while (buff[indx] == ' ') {
            indx++;
         }
         // check for a quoted string
         if (quoted = (buff[indx] == '"')) {
            // skip leading quote
            indx++;
            // find matching end quote
            next = (unsigned char *)strchr((char *)&buff[indx], '"'); 
            if (next == NULL) {
               // no matching end quote
               seterror(ERR_INPUTTOOLONG);
               return;
            }
            // terminate string at quote
            *next = 0;
            // point to next data item (if there are multiple items)
            next++;
            // skip trailing spaces (after quote!)
            while (*next == ' ') {
              next++;
            }
            if (*next != ',') {
               // no next data item
               next = NULL;
            }
            else {
               next++;
            }
         }
         else {
            unsigned char *endi;
            // find next data item (if there are multiple items)
            next = (unsigned char *)strchr((char *)&buff[indx], ',');
            if (next != NULL) {
               // terminate current data item
               *next = 0;
               // remove trailing spaces from current data item
               endi = next;
               // point to next data item (if there are multiple items)
               next++;
            }
            else {
               // remove trailing spaces from last data item
               endi = end;
            }
            // remove trailing spaces
            while ((endi > &buff[indx]) && (*(endi-1)  == ' ')) {
               *(endi-1) = 0;
               endi--;
            }
         }
         *lv.val.sval = mystrdup(&buff[indx]);
         if (!*lv.val.sval) {
           seterror(ERR_OUTOFMEMORY);
           return;
         }
         if (next != NULL) {
            // set indx to next data item 
            indx = next - buff;
         }
         else {
            // if we still have tokens to process but no more data
            // items, this is an error
            if (!is_eol(token) && !(token == END) && !(token == ELSE)) {
               indx = -1;
            }
            else {
               // set indx to beyond end (there are no more tokens to
               // process, so this just signals we have processed the
               // line of input and not seen any errors)
               indx = end + 1 - buff;
               }
         }
         break;
       default:
         break;
     }
     if (token == ',') {
        match_token(',');
     }
  }
  if (!no_return) {
    print_char('\n');
    pos = 1;
  }
}

/*
  the LINE INPUT statement
*/
static void do_lineinput(void)
{
   LVALUE lv;
   unsigned char buff[MAX_CHARS];
   unsigned char ch;
   unsigned char *prompt = NULL;
   int no_return = 0;
   int i = 0;

   match_token(LINE);
   match_token(INPUT);

   if (token == '#') {
     do_filelineinput();
     return;
   }

   if (token == ';') {
      no_return = 1;
      match_token(';');
   }
   if (token == '"') {
      prompt = stringliteral();
      if (prompt) {
         match_token(';');
         print_str(prompt);
         fflush(stdout);
      }
      free(prompt);
   }

   lvalue(&lv);

   if (lv.type != STRID) {
       seterror(ERR_BADTYPE);
       return;
   }

   if (*lv.val.sval) {
     free(*lv.val.sval);
     *lv.val.sval = 0;
   }

   while (i < MAX_CHARS) {
      ch = wait_key();
      if ((ch == EOF) || (ch == 0x03) || (ch == '\r') || (ch == '\n')) {
        break;
      }
      if ((ch == 0x08) || (ch == 0x7F)) {
         if (i > 0) {
            buff[--i] = 0;
            print_char(ch);
         }
      }
      else {
         buff[i++] = ch;
         print_char(ch);
      }
      buff[i] = 0;
      // TODO - line feed followed by carriage return 
      // should not terminate input
   }
#ifndef __CATALINA
   if (ch == 0x03) {
      // CTRL-C should exit program on Windows and Linux
      exit(0);
   }
#endif
   buff[i++] = 0;
   *lv.val.sval = mystrndup(buff, i);
   if (*lv.val.sval == NULL) {
     seterror(ERR_OUTOFMEMORY);
     return;
   }
   if (!no_return) {
     print_char('\n');
     pos = 1;
   }
}

/*
 * do_rem - the REM statement. Just skip to the next line.
 *
 */
static int do_rem(void)
{
   find_eol();
   return 0;
}

/*
 * do_tron - the TRON statement. Turn on trace.
 *
 */
static void do_tron(void)
{
   match_token(TRON);
   tron = 1;
}

/*
 * do_troff - the TROFF statement. Turn off trace.
 *
 */
static void do_troff(void)
{
   match_token(TROFF);
   tron = 0;
}

/*
  Get an lvalue from the environment
  Params: lv - structure to fill.
  Notes: missing variables (but not out of range subscripts)
         are added to the variable list.
*/
static void lvalue(LVALUE *lv)
{
  unsigned char name[MAXID + 1];
  int len;
  VARIABLE *var = NULL;
  DIMVAR *dimvar = NULL;
  int index[5];
  void *valptr = NULL;
  int indx;
  
  lv->type = ERRID;
  lv->len  = 0;

#if DEBUG
  printf("lvalue token = %d\n", token);
#endif  

  switch (token) {

    case VAR_INT:
    case VAR_FLT:
    case VAR_STR:
       indx = getindex();
       lv->type = token - VAR_INT + INTID;
       match_token(token);
       if (indx < nvariables) {
          if (lv->type == FLTID) {
             lv->val.dval = &variables[indx].val.dval;
          }
          else if (lv->type == INTID) {
             lv->val.ival = &variables[indx].val.ival;
          }
          else {
             lv->len = variables[indx].len;
             lv->val.sval = &variables[indx].val.sval;
          }
          return;
       }
       else {
          seterror(ERR_INTERNAL);
          return;
       }
       break;

    case INTID:
    case FLTID:
    case STRID:
       lv->type = token;
       len = getid(name);
       match_token(token);
       var = findvariable(name);
       if (!var) {
          if (token == FLTID) {
             var = addfloat(name);
             lv->val.dval = &var->val.dval;
          }
          else if (token == INTID) {
             var = addinteger(name);
             lv->val.ival = &var->val.ival;
          }
          else {
             var = addstring(name);
             lv->len = var->len;
             lv->val.sval = &var->val.sval;
          }
          return;
       }
       if (var == NULL) {
          seterror(ERR_OUTOFMEMORY);
          return;
       }
       break;

    case VAR_DIMINT:
    case VAR_DIMFLT:
    case VAR_DIMSTR:
       indx = getindex();
       lv->type = token - VAR_DIMINT + INTID;     
       match_token(token);
       if (indx < ndimvariables) {
          dimvar = &dimvariables[indx];
          lv->type = dimvar->type;
       }
       else {
          seterror(ERR_INTERNAL);
          return;
       }
       break;

    case DIMINTID:
    case DIMFLTID:
    case DIMSTRID:
       len = getid(name);
       match_token(token);
       dimvar = finddimvar(name);
#if AUTODEF
       if (dimvar == NULL) {
          dimvar = autodimvar(name);
       }
#endif  
       lv->type = token - DIMINTID + INTID;     
       break;

     default:
       seterror(ERR_SYNTAX);
       return;
  }

  if (dimvar != NULL) {
    switch (dimvar->ndims) {
       case 1:
          index[0] = strict_integer(expr(1));
          if (errorflag == 0) {
             valptr = getdimvar(dimvar, index[0]);
          }
          break;
       case 2:
          index[0] = strict_integer(expr(1));
          match_token(',');
          index[1] = strict_integer(expr(1));
          if (errorflag == 0) {
             valptr = getdimvar(dimvar, index[0], index[1]);
          }
          break;
       case 3:
          index[0] = strict_integer(expr(1));
          match_token(',');
          index[1] = strict_integer(expr(1));
          match_token(',');
          index[2] = strict_integer(expr(1));
          if (errorflag == 0) {
             valptr = getdimvar(dimvar, index[0], index[1], index[2]);
          }
          break;
       case 4:
          index[0] = strict_integer(expr(1));
          match_token(',');
          index[1] = strict_integer(expr(1));
          match_token(',');
          index[2] = strict_integer(expr(1));
          match_token(',');
          index[3] = strict_integer(expr(1));
          if (errorflag == 0) {
             valptr = getdimvar(dimvar, index[0], index[1], index[2], index[3]);
          }
          break;
       case 5:
          index[0] = strict_integer(expr(1));
          match_token(',');
          index[1] = strict_integer(expr(1));
          match_token(',');
          index[2] = strict_integer(expr(1));
          match_token(',');
          index[3] = strict_integer(expr(1));
          match_token(',');
          index[4] = strict_integer(expr(1));
          if (errorflag == 0) {
             valptr = getdimvar(dimvar, index[0], index[1], index[2], index[3], index[4]);
          }
          break;
     }
     match_token(')');

     if (valptr != NULL) {
        if (lv->type == FLTID) {
           lv->val.dval = valptr;
        }
        else if (lv->type == INTID) {
           lv->val.ival = valptr;
        }
        else {
           lv->val.sval = valptr;
        }
     }
     else {
        lv->type = ERRID;
     }
  }
  else {
     seterror(ERR_NOSUCHVARIABLE);
     return;
  }
}

/*
 * precedence - return the operator precedence of a token
 */
int precedence(int token) {
   switch (token) {
      case '^':
        return 9;
      case '*': 
      case '/':
        return 8;
      case MOD:
        return 7;
      case '+':
      case '-':
        return 6;
      case '=':
      case NEQ:
        return 5;
      case '<':
      case '>':
      case LTE:
      case GTE:
        return 4;
      case AND:
        return 3;
      case OR:
      case XOR:
        return 2;
      case EQV:
      case IMP:
        return 1;
      default:
        return 0;
   }
}

static void debug_val(RVALUE val) {
   if (val.type==INTID) {
      printf("%d ",val.val.ival);
   }
   else {
      printf("%f ",val.val.dval);
   }
}
/*
 * expr - parse an expression
 */
static RVALUE expr(int level)
{
  RVALUE left;
  RVALUE right;
  RVALUE right2;
  int thisop;
  int thislevel;
  int nextop;
  int nextlevel;

  left = factor();
  //debug("left=");debug_val(left);debug("\n");

  thisop = token;
  thislevel = precedence(thisop);
  if (thislevel >= level) {
     match_token(token);
  }

  while (thislevel >= level) {
     //debug("thislevel=%d\n",thislevel);
     right = factor();
     //debug("right=");debug_val(right);debug("\n");
     nextop = token;
     //debug("nextop = %d\n",nextop);
     nextlevel = precedence(nextop);
     if (nextlevel >= level) {
        match_token(token);
     }
     if (nextlevel <= thislevel) {
        // expression terminates, or continues 
        // at the current or lower precedence
        //debug("binop %d : ",thisop); debug_val(left); debug_val(right);debug("\n");
        left = binop(left, thisop, right);
        thisop = nextop;
        thislevel = nextlevel;
     }
     else {
        // expression continues at higher precedence
        while (nextlevel > thislevel) {
           //debug("calling expr\n");
           right2 = expr(nextlevel);
           //debug("result =");debug_val(right2);debug("\n");
           //debug("binop %d : ",nextop); debug_val(right); debug_val(right2);debug("\n");
           right = binop (right, nextop, right2);
           nextop = token;
           //debug("nextop = %d\n",nextop);
           nextlevel = precedence(nextop);
           if (nextlevel > thislevel) {
              match_token(token);
           }
        }
        //debug("binop %d : ",thisop); debug_val(left); debug_val(right);debug("\n");
        left = binop(left, thisop, right);
        thisop = token;
        //debug("thisop 2 = %d\n",thisop);
        thislevel = precedence(thisop);
        if (thislevel >= level) {
            match_token(token);
        }
     }
  }
  return left;
  
}

static RVALUE binop(RVALUE left, int op, RVALUE right) {
   switch (op) {
      case '=':
        if (left.type == INTID) {
           if (right.type == INTID) {
              left.val.ival = (left.val.ival == right.val.ival) ? 1 : 0;
           }
           else {
              left.val.ival = (left.val.ival == right.val.dval) ? 1 : 0;
           }
        }
        else {
           left.type = INTID;
           if (right.type == FLTID) {
              left.val.ival = (left.val.dval == right.val.dval) ? 1 : 0;
           }
           else {
              left.val.ival = (left.val.dval == right.val.ival) ? 1 : 0;
           }
        }
        break;
      case NEQ:
        if (left.type == INTID) {
           if (right.type == INTID) {
              left.val.ival = (left.val.ival != right.val.ival) ? 1 : 0;
           }
           else {
              left.val.ival = (left.val.ival != right.val.dval) ? 1 : 0;
           }
        }
        else {
           left.type = INTID;
           if (right.type == FLTID) {
              left.val.ival = (left.val.dval != right.val.dval) ? 1 : 0;
           }
           else {
              left.val.ival = (left.val.dval != right.val.ival) ? 1 : 0;
           }
        }
        break;
      case '<':
        if (left.type == INTID) {
           if (right.type == INTID) {
              left.val.ival = (left.val.ival < right.val.ival) ? 1 : 0;
           }
           else {
              left.val.ival = (left.val.ival < right.val.dval) ? 1 : 0;
           }
        }
        else {
           left.type = INTID;
           if (right.type == FLTID) {
              left.val.ival = (left.val.dval < right.val.dval) ? 1 : 0;
           }
           else {
              left.val.ival = (left.val.dval < right.val.ival) ? 1 : 0;
           }
        }
        break;
      case LTE:
        if (left.type == INTID) {
           if (right.type == INTID) {
              left.val.ival = (left.val.ival <= right.val.ival) ? 1 : 0;
           }
           else {
              left.val.ival = (left.val.ival <= right.val.dval) ? 1 : 0;
           }
        }
        else {
           left.type = INTID;
           if (right.type == FLTID) {
              left.val.ival = (left.val.dval <= right.val.dval) ? 1 : 0;
           }
           else {
              left.val.ival = (left.val.dval <= right.val.ival) ? 1 : 0;
           }
        }
        break;
      case '>':
        if (left.type == INTID) {
           if (right.type == INTID) {
              left.val.ival = (left.val.ival > right.val.ival) ? 1 : 0;
           }
           else {
              left.val.ival = (left.val.ival > right.val.dval) ? 1 : 0;
           }
        }
        else {
           left.type = INTID;
           if (right.type == FLTID) {
              left.val.ival = (left.val.dval > right.val.dval) ? 1 : 0;
           }
           else {
              left.val.ival = (left.val.dval > right.val.ival) ? 1 : 0;
           }
        }
        break;
      case GTE:
        if (left.type == INTID) {
           if (right.type == INTID) {
              left.val.ival = (left.val.ival >= right.val.ival) ? 1 : 0;
           }
           else {
              left.val.ival = (left.val.ival >= right.val.dval) ? 1 : 0;
           }
        }
        else {
           left.type = INTID;
           if (right.type == FLTID) {
              left.val.ival = (left.val.dval >= right.val.dval) ? 1 : 0;
           }
           else {
              left.val.ival = (left.val.dval >= right.val.ival) ? 1 : 0;
           }
        }
        break;
      case AND:
        if ((left.type == INTID) && (right.type == INTID)) {
           left.val.ival = (left.val.ival && right.val.ival);
        }
        else {
           seterror(ERR_BADTYPE);
        }
        break;      
      case OR:
        if ((left.type == INTID) && (right.type == INTID)) {
           left.val.ival = (left.val.ival || right.val.ival);
        }
        else {
           seterror(ERR_BADTYPE);
        }
        break;      
      case XOR:
        if ((left.type == INTID) && (right.type == INTID)) {
           left.val.ival = (left.val.ival && !right.val.ival) || (!left.val.ival && right.val.ival);
        }
        else {
           seterror(ERR_BADTYPE);
        }
        break;      
      case IMP:
        if ((left.type == INTID) && (right.type == INTID)) {
           left.val.ival = (!left.val.ival) || (right.val.ival);
        }
        else {
           seterror(ERR_BADTYPE);
        }
        break;      
      case EQV:
        if ((left.type == INTID) && (right.type == INTID)) {
           left.val.ival = (left.val.ival == right.val.ival);
        }
        else {
           seterror(ERR_BADTYPE);
        }
        break;      
      case '+':
        if (left.type == INTID) {
           if (right.type == INTID) {
              left.val.ival += right.val.ival;
           }
           else {
              left.type = FLTID;
              left.val.dval = left.val.ival + right.val.dval;
           }
        }
        else {
           if (right.type == FLTID) {
              left.val.dval += right.val.dval;
           }
           else {
              left.val.dval += right.val.ival;
           }
        }
        break;
      case '-':
        if (left.type == INTID) {
           if (right.type == INTID) {
              left.val.ival -= right.val.ival;
           }
           else {
              left.type = FLTID;
              left.val.dval = left.val.ival - right.val.dval;
           }
        }
        else {
           if (right.type == FLTID) {
              left.val.dval -= right.val.dval;
           }
           else {
              left.val.dval -= right.val.ival;
           }
        }
        break;
      case '*':
        if (left.type == INTID) {
           if (right.type == INTID) {
              left.val.ival *= right.val.ival;
           }
           else {
              left.type = FLTID;
              left.val.dval = left.val.ival * right.val.dval;
           }
        }
        else {
           if (right.type == FLTID) {
              left.val.dval *= right.val.dval;
           }
           else {
              left.val.dval *= right.val.ival;
           }
        }
        break;
      case '/':
        if (left.type == INTID) {
           if (right.type == INTID) {
              if (right.val.ival != 0) {
                 left.val.ival /= right.val.ival;
              }
              else {
                 seterror(ERR_DIVIDEBYZERO);
              }
           }
           else {
              if (right.val.dval != 0.0) {
                 left.type = FLTID;
                 left.val.dval = left.val.ival / right.val.dval;
              }
              else {
                 seterror(ERR_DIVIDEBYZERO);
              }
           }
        }
        else {
           if (right.type == FLTID) {
              if (right.val.dval != 0.0) {
                left.val.dval /= right.val.dval;
              }
              else {
                 seterror(ERR_DIVIDEBYZERO);
              }
           }
           else {
              if (right.val.ival != 0) {
                 left.val.dval /= right.val.ival;
              }
              else {
                 seterror(ERR_DIVIDEBYZERO);
              }
           }
        }
        break;
      case MOD:
        if (left.type == INTID) {
           if (right.type == INTID) {
              if (right.val.ival != 0) {
                 left.val.ival %= right.val.ival;
              }
              else {
                 seterror(ERR_DIVIDEBYZERO);
              }
           }
           else {
              if (right.val.dval != 0.0) {
                 left.type = FLTID;
                 left.val.dval = fmod(left.val.ival,right.val.dval);
              }
              else {
                 seterror(ERR_DIVIDEBYZERO);
              }
           }
        }
        else {
           if (right.type == FLTID) {
              if (right.val.dval != 0.0) {
                left.val.dval = fmod(left.val.dval, right.val.dval);
              }
              else {
                 seterror(ERR_DIVIDEBYZERO);
              }
           }
           else {
              if (right.val.ival != 0) {
                 left.val.dval = fmod (left.val.dval, right.val.ival);
              }
              else {
                 seterror(ERR_DIVIDEBYZERO);
              }
           }
        }
        break;
      case '\\':
        if (left.type == INTID) {
           if (right.type == INTID) {
              if (right.val.ival != 0) {
                 left.val.ival /= right.val.ival;
              }
              else {
                 seterror(ERR_DIVIDEBYZERO);
              }
           }
           else {
              if (right.val.dval != 0.0) {
                 right.type = INTID;
                 right.val.ival = (int) right.val.dval;
                 left.val.ival = left.val.ival / right.val.ival;
              }
              else {
                 seterror(ERR_DIVIDEBYZERO);
              }
           }
        }
        else {
           left.type = INTID;
           left.val.ival = (int) left.val.dval;      
           if (right.type == FLTID) {
              if (right.val.dval != 0.0) {
                right.type = INTID;
                right.val.ival = (int) right.val.dval;         
                left.val.ival /= right.val.ival;
              }
              else {
                 seterror(ERR_DIVIDEBYZERO);
              }
           }
           else {
              if (right.val.ival != 0) {
                 left.val.ival /= right.val.ival;
              }
              else {
                 seterror(ERR_DIVIDEBYZERO);
              }
           }
        }
        break;
      case '^':
        if (left.type == INTID) {
           if (right.type == INTID) {
              left.type = FLTID;
              left.val.dval = pow (left.val.ival, right.val.ival);
           }
           else {
              if ((left.val.ival >= 0) || (right.val.dval == (int)(right.val.dval))) {
                 left.type = FLTID;
                 left.val.dval = pow (left.val.ival, right.val.dval);
              }
              else {
                 seterror(ERR_EXPONENT);
              }
           }
        }
        else {
           if (right.type == FLTID) {
              if ((left.val.dval >= 0.0) || (right.val.dval == (int)right.val.dval)) {
                left.val.dval = pow (left.val.dval, right.val.dval);
              }
              else {
                 seterror(ERR_EXPONENT);
              }
           }
           else {
              left.val.dval = pow (left.val.dval, right.val.ival);
           }
        }
        break;

      default:
        seterror(ERR_SYNTAX);
        break;
   }
   return left;
}

/*
 * stringfactor -  a string factor consists of "string relop string"
 */
static RVALUE stringfactor(void) {
  RVALUE answer;
  int op;
  unsigned char *strleft;
  unsigned char *strright;
  int cmp;

  answer.type = INTID;
  strleft = stringexpr();
  op = token;
  match_token(op);
  strright = stringexpr();
  if (!strleft || !strright) {
    answer.val.ival = 0;
  }
  else {
    cmp = strcmp((char *)strleft, (char *)strright);
    switch (op) {
      case '=':
        answer.val.ival = cmp == 0 ? 1 : 0;
        break;
      case NEQ:
        answer.val.ival = cmp == 0 ? 0 : 1;
        break;
      case '<':
        answer.val.ival = cmp < 0 ? 1 : 0;
        break;
      case LTE:
        answer.val.ival = cmp <= 0 ? 1 : 0;
        break;
      case '>':
        answer.val.ival = cmp > 0 ? 1 : 0;
        break;
      case GTE:
        answer.val.ival = cmp >= 0 ? 1 : 0;
        break;
      default:
        seterror(ERR_EXPRESSION);
        answer.val.ival = 0;
    }
  }
  free(strleft);
  free(strright);
  return answer;
}


/*
 * ms_since_midnight - return microseconds since midnight
 */
unsigned int ms_since_midnight()
{
   time_t local_now;
   struct tm *lt;

#ifdef __CATALINA__
   unsigned long now;
   unsigned long local_sec;
   unsigned long local_clk;
   
   now = rtc_getclock();                 // get high precision time since boot
   local_sec = now/CLOCKS_PER_SEC;       // get seconds since boot
   local_clk = now - local_sec*CLOCKS_PER_SEC; // get msec since boot
   local_now = rtc_gettime();            // get local time now (in secs)
   lt = localtime(&local_now);           // convert to local time
   return 1000*(lt->tm_hour*3600 + lt->tm_min*60 + lt->tm_sec) 
        + (local_clk*1000)/CLOCKS_PER_SEC; // calc ms since local midnight
#else
   struct timespec now;
   
   clock_gettime(CLOCK_REALTIME, &now);  // get high precision time since epoch
   local_now = now.tv_sec;               // get seconds since epoch
   lt = localtime(&local_now);           // convert to local time
   return 1000*(lt->tm_hour*3600 + lt->tm_min*60 + lt->tm_sec) 
        + now.tv_nsec/1000000;           // calc ms since local midnight
#endif
}


/*
 * timer - return seconds since midnight (as a float)
 */
float timer(void) {

    return ((float) ms_since_midnight())/1000.0;
}

/*
 * factor - parse a factor
 */
static RVALUE factor(void)
{
   CONVERTER c;
   RVALUE answer;
   RVALUE temp;
   unsigned char *str;
   char *end;
   int len;
   int i;
   int indx;
   char ch;
   long addr;

  if (is_string(token)) {
     return stringfactor();     
  }

  switch (token) {
  case '(':
    match_token('(');
    answer = expr(1);
    match_token(')');
    break;
  case VALUE:
#if DEBUG
    printf("getting value, index = %d, offs = %d\n",current_indx, current_offs);
#endif    
    len = getvalue(&answer);
#if DEBUG
    printf("got value, index = %d, offs = %d\n",current_indx, current_offs);
#endif    
    match_token(VALUE);
#if DEBUG
    printf("done\n");
#endif    
    break;
  case '-':
    match_token('-');
    answer = factor();
    if (answer.type == INTID) {
       answer.val.ival = -answer.val.ival;
    }
    else {
       answer.val.dval = -answer.val.dval;
    }
    break;
  case NOT:
    match_token(NOT);
    answer = factor();
    if (answer.type == INTID) {
       answer.val.ival = !answer.val.ival;
    }
    else {
       seterror(ERR_BADTYPE);
    }
    break;
  case VAR_INT:
  case VAR_FLT:
  case INTID:
  case FLTID:
    answer = variable();
    break;
  case DIMINTID:
  case DIMFLTID:
  case VAR_DIMINT:
  case VAR_DIMFLT:
    answer = dimvariable();
    break;
/*    
  case E:
    answer.type = FLTID;
    answer.val.dval = exp(1.0);
    match_token(E);
    break;
*/    
  case PI:
    answer.type = FLTID;
    answer.val.dval = acos(0.0) * 2.0;
    match_token(PI);
    break;
  case TIMER:
    answer.type = FLTID;
    answer.val.dval = timer(); 
    match_token(TIMER);
    break;
  case SIN:
    match_token(SIN);
    match_token('(');
    answer = expr(1);
    match_token(')');
    if (answer.type == INTID) {
       answer.type = FLTID;
       answer.val.dval = sin(answer.val.ival);
    }
    else {
       answer.val.dval = sin(answer.val.dval);
    }
    break;
  case COS:
    match_token(COS);
    match_token('(');
    answer = expr(1);
    match_token(')');
    if (answer.type == INTID) {
       answer.type = FLTID;
       answer.val.dval = cos(answer.val.ival);
    }
    else {
       answer.val.dval = cos(answer.val.dval);
    }
    break;
  case TAN:
    match_token(TAN);
    match_token('(');
    answer = expr(1);
    match_token(')');
    if (answer.type == INTID) {
       answer.type = FLTID;
       answer.val.dval = tan(answer.val.ival);
    }
    else {
       answer.val.dval = tan(answer.val.dval);
    }
    break;
  case LOG:
    match_token(LOG);
    match_token('(');
    answer = expr(1);
    match_token(')');
    if (answer.type == INTID) {
       answer.type = FLTID;
       if (answer.val.ival > 0) {
          answer.val.dval = log(answer.val.ival);
       }
       else {
          seterror(ERR_NEGLOG);
       }
    }
    else {
       if (answer.val.dval > 0.0) {
          answer.val.dval = log(answer.val.dval);
       }
       else {
          seterror(ERR_NEGLOG);
       }
    }
    break;
  case POW:
    match_token(POW);
    match_token('(');
    answer = expr(1);
    if (answer.type == INTID) {
       answer.type = FLTID;
       answer.val.dval = answer.val.ival;
    }
    match_token(',');
    temp = expr(1);
    if (temp.type == INTID) {
       temp.type = FLTID;
       temp.val.dval = temp.val.ival;
    }
    match_token(')');
    if ((answer.val.dval >= 0.0) || (temp.val.dval = (int)temp.val.dval)) {
       answer.val.dval = pow(answer.val.dval, temp.val.dval);
    }
    else {
       seterror(ERR_EXPONENT);
    }
    break;
  case EXP:
    match_token(EXP);
    match_token('(');
    answer = expr(1);
    match_token(')');
    if (answer.type == INTID) {
       answer.type = FLTID;
       answer.val.dval = exp(answer.val.ival);
    }
    else {
       answer.val.dval = exp(answer.val.dval);
    }
    break;
  case SQR:
    match_token(SQR);
    match_token('(');
    answer = expr(1);
    match_token(')');
    if (answer.type == INTID) {
       answer.type = FLTID;
       if (answer.val.ival >= 0) {
          answer.val.dval = sqrt(answer.val.ival);
       }
       else {
          seterror(ERR_NEGSQR);
       }
    }
    else {
       if (answer.val.dval >= 0.0) {
          answer.val.dval = sqrt(answer.val.dval);
       }
       else {
          seterror(ERR_NEGSQR);
       }
    }
    break;
  case ABS:
    match_token(ABS);
    match_token('(');
    answer = expr(1);
    match_token(')');
    if (answer.type == INTID) {
       if (answer.val.ival < 0) {
          answer.val.ival = -answer.val.ival;
       }
    }
    else {
       answer.val.dval = fabs(answer.val.dval);
    }
    break;
  case SGN:
    match_token(SGN);
    match_token('(');
    answer = expr(1);
    match_token(')');
    if (answer.type == INTID) {
       if (answer.val.ival < 0) {
          answer.val.ival = -1;
       }
       else if (answer.val.ival > 0) {
          answer.val.ival = 1;
       }
       else {
          answer.val.ival = 0;
       }
    }
    else {
       if (answer.val.dval < 0.0) {
          answer.val.dval = -1.0;
       }
       else if (answer.val.dval > 0) {
          answer.val.dval = 1.0;
       }
       else {
          answer.val.dval = 0.0;
       }
    }
    break;
  case LEN:
    match_token(LEN);
    match_token('(');
    str = stringexpr();
    match_token(')');
    answer.type = INTID;
    if (str) {
      answer.val.ival = strlen((char *)str);
      free(str);
    }
    else {
       answer.val.ival = 0;
    }
    break;
  case ASC:
    match_token(ASC);
    match_token('(');
    str = stringexpr();
    match_token(')');
    answer.type = INTID;
    if (str) {
       answer.val.ival = *str;
       free(str);
    }
    else {
       answer.val.ival = 0;
    }
    break;
  case ASIN:
    match_token(ASIN);
    match_token('(');
    answer = expr(1);
    match_token(')');
    if (answer.type == INTID) {
       if (answer.val.ival >= -1 && answer.val.ival <= 1) {
          answer.type = FLTID;
          answer.val.dval = asin(answer.val.ival);
       }
       else {
           seterror(ERR_BADSINCOS);
       }
    }
    else {
       if (answer.val.dval >= -1.0 && answer.val.dval <= 1.0) {
          answer.val.dval = asin(answer.val.dval);
       }
       else {
           seterror(ERR_BADSINCOS);
       }
    }
    break;
  case ACOS:
    match_token(ACOS);
    match_token('(');
    answer = expr(1);
    match_token(')');
    if (answer.type == INTID) {
       if (answer.val.ival >= -1 && answer.val.ival <= 1) {
          answer.type = FLTID;
          answer.val.dval = acos(answer.val.ival);
       }
       else {
           seterror(ERR_BADSINCOS);
       }
    }
    else {
       if (answer.val.dval >= -1.0 && answer.val.dval <= 1.0) {
          answer.val.dval = acos(answer.val.dval);
       }
       else {
           seterror(ERR_BADSINCOS);
       }
    }
    break;
  case ATN:
  case ATAN:
    match_token(token);
    match_token('(');
    answer = expr(1);
    match_token(')');
    if (answer.type == INTID) {
       answer.type = FLTID;
       answer.val.dval = atan(answer.val.ival);
    }
    else {
       answer.val.dval = atan(answer.val.dval);
    }
    break;
  case INT:
    match_token(INT);
    match_token('(');
    answer = expr(1);
    match_token(')');
    if (answer.type == FLTID) {
       answer.type = INTID;
       answer.val.ival = floor(answer.val.dval);
    }
    break;
  case FIX:
    match_token(FIX);
    match_token('(');
    answer = expr(1);
    match_token(')');
    if (answer.type == FLTID) {
       answer.type = INTID;
       if (answer.val.dval > 0.0) {
          answer.val.ival = floor(answer.val.dval);
       }
       else {
          answer.val.ival = -floor(-answer.val.dval);
       }
    }
    break;
  case CINT:
    match_token(CINT);
    match_token('(');
    answer = expr(1);
    match_token(')');
    if (answer.type == FLTID) {
       answer.type = INTID;
       if (answer.val.dval >= 0.0) {
          if (answer.val.dval > INT_MAX) {
             seterror(ERR_OVERFLOW);
          }
          else {
             if ((answer.val.dval - floor(answer.val.dval)) < 0.5) {
                answer.val.ival = (int) answer.val.dval;
             }
             else {
                answer.val.ival = (int) answer.val.dval + 1;
             }
          }
       }
       else {
          if (answer.val.dval < INT_MIN) {
             seterror(ERR_OVERFLOW);
          }
          else {
             if ((-answer.val.dval + floor(answer.val.dval)) < -0.5) {
                answer.val.ival = (int) answer.val.dval;
             }
             else {
                answer.val.ival = (int) answer.val.dval - 1;
             }
          }
       }
    }
    break;
  case CDBL:
  case CSNG:
    match_token(token);
    match_token('(');
    answer = expr(1);
    match_token(')');
    if (answer.type == INTID) {
       answer.type = FLTID;
       answer.val.dval = (float) answer.val.ival;
    }
    break;
  case RND:
    match_token(RND);
    if (token == '(') {
       match_token('(');
       i = integer(expr(1));
       match_token(')');
       if (i == 0) {
          answer.type = FLTID;
          answer.val.dval = last_rnd;
          break;
       }
       else if (i < 0) {
          answer.type = FLTID;
          answer.val.dval = (((float)(getrealrand()&0x7FFF))/(RAND_MAX + 1.0));
          last_rnd = answer.val.dval;
          break;
       }
    }
    answer.type = FLTID;
    answer.val.dval = (((float)rand())/(RAND_MAX + 1.0));
    last_rnd = answer.val.dval;
    break;
  case POS:
    match_token(POS);
    if (token == '(') {
       // dummy argument
       match_token('(');
       i = integer(expr(1));
       match_token(')');
    }
    answer.type = INTID;
    answer.val.ival = pos;
    break;
  case VAL:
    match_token(VAL);
    match_token('(');
    str = stringexpr();
    match_token(')');
    if (str) {
      answer = getstringvalue(str, &len);
      free(str);
    }
    else {
       answer.type = INTID;
       answer.val.ival = 0;
    }
    break;
  case VALLEN:
    match_token(VALLEN);
    match_token('(');
    str = stringexpr();
    match_token(')');
    answer.type = INTID;
    if (str) {
       getstringvalue(str, &len);
       answer.val.ival = len;
       free(str);
    }
    else {
       answer.val.ival = 0;
    }
    break;
  case INSTR:
    answer.type = INTID;
    answer.val.ival = instr();
    break;
  case ERL:
    answer.type = INTID;
    if (errorindx > 0) {
       answer.val.ival = lines[errorindx].no;
    }
    else {
       answer.val.ival = 0;
    }
    match_token(ERL);
    break;
  case ERR:
    answer.type = INTID;
    answer.val.ival = errorlast;
    match_token(ERR);
    break;
  case CVI:
    match_token(CVI);
    match_token('(');
    str = stringexpr();
    match_token(')');
    if (str) {
       for (i = 0; i < sizeof(float); i++) {
          c.byte[i] = str[i];
       }
       free(str);
       answer.type = INTID;
       answer.val.ival = c.ival;
    }
    break;
  case CVS:
    match_token(CVS);
    match_token('(');
    str = stringexpr();
    match_token(')');
    if (str) {
       for (i = 0; i < sizeof(float); i++) {
          c.byte[i] = str[i];
       }
       free(str);
       answer.type = FLTID;
       answer.val.dval = c.dval;
    }
    break;
  case CVD:
    match_token(CVD);
    match_token('(');
    str = stringexpr();
    match_token(')');
    if (str) {
       for (i = 0; i < sizeof(float); i++) {
          c.byte[i] = str[i];
       }
       free(str);
       answer.type = FLTID;
       answer.val.dval = c.dval;
    }
    break;
  case LOF:
    match_token(LOF);
    answer.type = INTID;
    answer.val.ival = 0;
    if (token == '(') {
       match_token('(');
       i = integer(expr(1));
       match_token(')');
       if ((i >= 1) && (i <= MAXFILES)) {
          i--;
          if (FILES[i].file != NULL) {
             int pos = ftell(FILES[i].file);
             fseek(FILES[i].file, 0, SEEK_END);
             answer.val.ival = ftell(FILES[i].file);
             fseek(FILES[i].file, pos, SEEK_SET);    
          }
          else {
             // file is not open
             seterror(ERR_NOFILE);
          }
       }
    }
    else {
       seterror(ERR_SYNTAX);
    }
    break;
  case LOC:
    match_token(LOC);
    answer.type = INTID;
    answer.val.ival = 0;
    if (token == '(') {
       match_token('(');
       i = integer(expr(1));
       match_token(')');
       if ((i >= 1) && (i <= MAXFILES)) {
          i--;
          if (FILES[i].file != NULL) {
             if (FILES[i].reclen > 0) {
                answer.val.ival = (ftell(FILES[i].file) + 1)/FILES[i].reclen;
             }
             else {
                answer.val.ival = (ftell(FILES[i].file) + 1)/128;
             }
          }
          else {
             // file is not open
             seterror(ERR_NOFILE);
          }
       }
    }
    else {
       seterror(ERR_SYNTAX);
    }
    break;
  case xEOF:
    match_token(xEOF);
    answer.type = INTID;
    answer.val.ival = 0;
    if (token == '(') {
       match_token('(');
       i = integer(expr(1));
       match_token(')');
       if ((i >= 1) && (i <= MAXFILES)) {
          i--;
          if (FILES[i].file != NULL) {
             ch = fgetc(FILES[i].file);
             if (feof(FILES[i].file)) {
                answer.val.ival = -1;
             }
             else {
               ungetc(ch, FILES[i].file);
             }
          }
          else {
             // file is not open
             seterror(ERR_NOFILE);
          }
       }
    }
    else {
       seterror(ERR_SYNTAX);
    }
    break;
  case PEEK:
    match_token(PEEK);
    answer.type = INTID;
    match_token('(');
    addr = strict_integer(expr(1));
    match_token(')');
    answer.val.ival = *((unsigned char *)addr);
    break;
  case VARPTR:
    match_token(VARPTR);
    answer.type = INTID;
    match_token('(');
    switch (token) {
       case '#':
          match_token('#');
          i = strict_integer(expr(1));
          if ((i >= 0) && (i < MAXFILES)) {
             i--;
             if (FILES[i].file != NULL) {
                answer.val.ival = (int)(FILES[i].file);
             }
             else {
                seterror(ERR_BADFILE);
             }
          }
          else {
              seterror(ERR_BADFILE);
          }
          break;
       case VAR_INT:
       case VAR_FLT:
       case INTID:
       case FLTID:
         answer = variable_addr();
         break;
       case DIMINTID:
       case DIMFLTID:
       case VAR_DIMINT:
       case VAR_DIMFLT:
         answer = dimvariable_addr();
         break;
       default:
         seterror(ERR_BADTYPE);
         break;
    }
    match_token(')');
    break;
  default:
    if (is_string(token)) {
       seterror(ERR_TYPEMISMATCH);
    }
    else {
      seterror(ERR_SYNTAX);
    }
    break;
  }

  return answer;
}

/*
  calculate the INSTR() function.
*/
static int instr(void) {
  unsigned char *str;
  unsigned char *substr;
  unsigned char *end;
  int  answer = 0;
  int  offset;

  match_token(INSTR);
  match_token('(');
  str = stringexpr();
  match_token(',');
  substr = stringexpr();
  match_token(',');
  offset = strict_integer(expr(1));
  offset--;
  match_token(')');

  if (!str || !substr) {
    if (str) {
       free(str);
    }
    if (substr) {
      free(substr);
    }
    return 0;
  }

  if (offset >= 0 && offset < (int) strlen((char *)str)) {
    end = (unsigned char *)strstr((char *)str + offset, (char *)substr);
    if (end) {
      answer = end - str + 1;
    }
  }

  free(str);
  free(substr);

  return answer;
}

/*
 * findfunction - find a function by name
 */
static FUNCTION *findfunction(unsigned char *name, int len) {
   int i;
   if (name[len - 1] == '(') {
      len--; 
   }
   for (i = 0; i < nfunctions; i++) {
      if (!strncmp_i(name, functions[i].id, len)) {
         return &functions[i];
      }
   }
   return 0;
}

/*
 * findargument - find an argument in context
 */
static VARIABLE *findargument(unsigned char *name) {
   int i;
   if (context) {
      for (i = 0; i < context->nargs; i++) {
         if (!strcmp_i(name, context->arg[i].id)) {
            return &context->arg[i];
         }
      }
   }
   return 0;

}

/* 
 * evalstringfunction - evaluate a string function
 */
static unsigned char *evalstringfunction(FUNCTION *func) {
   VARIABLE *var;
   unsigned char *answer;
   int saved_indx;
   int saved_offs;
   int i;

   //debug("evaluating string function %s, with %d arguments\n",func->id, func->nargs);
   if (context != NULL) {
      seterror(ERR_FNNOTALLOWED);
      return mystrdup(nullstr);

   }
   if (func->nargs == 0) {
      if (token == '(') {
         seterror(ERR_SYNTAX);
         return mystrdup(nullstr);
      }
   }
   else {
      for (i = 0; i < func->nargs; i++) {
         //debug("evaluating arg %d\n", i);
         switch (func->arg[i].type) {
            case STRID:
               free(func->arg[i].val.sval); 
               func->arg[i].val.sval = stringexpr();
               //debug("arg %s, val = %s\n", func->arg[i].id, func->arg[i].val.sval);
               break;
            case FLTID:
               func->arg[i].val.dval = real(expr(1));
               //debug("arg %s, val = %g\n", func->arg[i].id, func->arg[i].val.dval);
               break;
            default:
               func->arg[i].val.ival = integer(expr(1));
               //debug("arg %s, val = %d\n", func->arg[i].id, func->arg[i].val.ival);
               break;
         }
         if (i < func->nargs - 1) {
            match_token(',');
         }
      }
      match_token(')');
   }
   saved_indx = current_indx;
   saved_offs = current_offs;
   current_indx = func->indx;
   current_offs = func->offs;
   context = func;
   token = gettoken();
   answer = stringexpr();
   current_indx = saved_indx;
   current_offs = saved_offs;
   context = NULL;
   token = gettoken();
   return answer;
}
            
/* 
 * evalfunction - evaluate a non-string function
 */
static RVALUE evalfunction(FUNCTION *func) {
   VARIABLE *var;
   RVALUE answer;
   int saved_indx;
   int saved_offs;
   int i;

   if (context != NULL) {
      seterror(ERR_FNNOTALLOWED);
      return DUMMY_IVALUE;

   }
   if (func->nargs == 0) {
      if (token == '(') {
         seterror(ERR_SYNTAX);
         return DUMMY_IVALUE;
      }
   }
   else {
      for (i = 0; i < func->nargs; i++) {
         switch (func->arg[i].type) {
            case STRID:
               free(func->arg[i].val.sval); 
               func->arg[i].val.sval = stringexpr();
               break;
            case FLTID:
               func->arg[i].val.dval = real(expr(1));
               break;
            default:
               func->arg[i].val.ival = integer(expr(1));
               break;
         }
         if (i < func->nargs - 1) {
            match_token(',');
         }
      }
      match_token(')');
   }
   saved_indx = current_indx;
   saved_offs = current_offs;
   current_indx = func->indx;
   current_offs = func->offs;
   context = func;
   token = gettoken();
   answer = expr(1);
   current_indx = saved_indx;
   current_offs = saved_offs;
   context = NULL;
   token = gettoken();
   if (func->type == INTID) {
      if (answer.type == FLTID) {
         answer.val.ival = integer (answer);
         answer.type = INTID;
      }
   }
   else {
      if (answer.type == INTID) {
         answer.val.dval = real (answer);
         answer.type = FLTID;
      }
   }
   return answer;
}


/*
 * variable - get the value of a scalar variable (or user defined function
 *            without arguments).
 */
static RVALUE variable(void)
{
  VARIABLE *var;
  FUNCTION *func;
  unsigned char id[MAXID + 1];
  int len;
  RVALUE answer;
  int indx;

  if ((token >= VAR_INT) && (token <= ARG_DIMSTR)) {
    // these tokens are followed by an index
    indx = getindex();
    //printf("indx = %d, nvariables = %d\n", indx, nvariables);
    if (indx < nvariables) {
       //printf("index = %d, name = %s\n", indx, variables[indx].id);
       answer.type = variables[indx].type;
       switch (answer.type) {
          case INTID:
             answer.val.ival = variables[indx].val.ival;
             break;
          case FLTID:
             answer.val.dval = variables[indx].val.dval;
             break;
          default:
             answer.type = ERRID;
             break;
       }
    }
    match_token(token);
    return answer;
  }

  len = getid(id);
  if (context != NULL) {
     var = findargument(id);
  }
  else {
     var = findvariable(id);
  }
  if (var) {
     answer.type = var->type;
     switch (var->type) {
        case INTID:
           match_token(INTID);
           answer.val.ival = var->val.ival;
           break;
        case FLTID:
           match_token(FLTID);
           answer.val.dval = var->val.dval;
           break;
        default:
           answer.type = ERRID;
           break;
     }
     return answer;
  }
  func = findfunction(id, len);
  if (func) {
     current_offs += len;
     token = gettoken();
     answer = evalfunction(func);
     return answer;
  }
#if AUTODEF
  var = addautovar(id);
  match_token(var->type);
#else     
  seterror(ERR_NOSUCHVARIABLE);
#endif  
  switch (var->type) {
     case INTID:
        return DUMMY_IVALUE;
     case FLTID:
        return DUMMY_FVALUE;
     default:
        seterror(ERR_BADTYPE);
        return DUMMY_IVALUE;
  }
}

/*
 * dimvariable - get value of a dimensioned variable (or user defined 
 *               function with arguments).
 */
static RVALUE dimvariable(void) {
  DIMVAR *dimvar = NULL;
  FUNCTION * dimfunc;
  unsigned char id[MAXID + 1];
  int len;
  int index[5];
  RVALUE answer;
  void *valptr = 0;
  int indx;

  if ((token >= VAR_INT) && (token <= ARG_DIMSTR)) {
    // these tokens are followed by an index
    indx = getindex();
    //printf("indx = %d, nvariables = %d\n", indx, nvariables);
    if (indx < ndimvariables) {
       //printf("index = %d, name = %s\n", indx, variables[indx].id);
       dimvar = &dimvariables[indx];
    }
  }
  else {
     len = getid(id);
     dimvar = finddimvar(id);
  }
  match_token(token);
  if (dimvar == NULL) {
     dimfunc = findfunction(id, len);
     if (dimfunc) {
       answer = evalfunction(dimfunc);
       return answer;
     }
#if AUTODEF
     dimvar = autodimvar(id);
#else     
     seterror(ERR_NOSUCHVARIABLE);
#endif       
  }

  if (dimvar != NULL) {

    switch (dimvar->ndims) {
    case 1:
        index[0] = strict_integer(expr(1));
        valptr = getdimvar(dimvar, index[0]);
        break;
    case 2:
        index[0] = strict_integer(expr(1));
        match_token(',');
        index[1] = strict_integer(expr(1));
        valptr = getdimvar(dimvar, index[0], index[1]);
        break;
    case 3:
        index[0] = strict_integer(expr(1));
        match_token(',');
        index[1] = strict_integer(expr(1));
        match_token(',');
        index[2] = strict_integer(expr(1));
        valptr = getdimvar(dimvar, index[0], index[1], index[2]);
        break;
    case 4:
        index[0] = strict_integer(expr(1));
        match_token(',');
        index[1] = strict_integer(expr(1));
        match_token(',');
        index[2] = strict_integer(expr(1));
        match_token(',');
        index[3] = strict_integer(expr(1));
        valptr = getdimvar(dimvar, index[0], index[1], index[2], index[3]);
        break;
    case 5:
        index[0] = strict_integer(expr(1));
        match_token(',');
        index[1] = strict_integer(expr(1));
        match_token(',');
        index[2] = strict_integer(expr(1));
        match_token(',');
        index[3] = strict_integer(expr(1));
        match_token(',');
        index[4] = strict_integer(expr(1));
        valptr = getdimvar(dimvar, index[0], index[1], index[2], index[3], index[4]);
        break;

    }

    match_token(')');
  }

  if (valptr) {
     answer.type = dimvar->type;
     switch (dimvar->type) {
        case INTID:
           answer.val.ival = *((int *)valptr);
           break;
        case FLTID:
           answer.val.dval = *((float *)valptr);
           break;
        default:
           answer.type = ERRID;
           break;
     }

     return answer;
  }
  return DUMMY_IVALUE;

}


/*
 * variable_addr - get the address of a scalar variable.
 */
static RVALUE variable_addr(void)
{
  VARIABLE *var;
  unsigned char id[MAXID + 1];
  int len;
  RVALUE answer;
  int indx;

  answer.type = INTID;
  if ((token >= VAR_INT) && (token <= ARG_DIMSTR)) {
    // these tokens are followed by an index
    indx = getindex();
    //printf("indx = %d, nvariables = %d\n", indx, nvariables);
    if (indx < nvariables) {
       //printf("index = %d, name = %s\n", indx, variables[indx].id);
       switch (variables[indx].type) {
          case INTID:
             answer.val.ival = (int) &variables[indx].val.ival;
             break;
          case FLTID:
             answer.val.ival = (int) &variables[indx].val.dval;
             break;
          case STRID:
             answer.val.ival = (int) &variables[indx].val.sval;
             break;
          default:
             answer.val.ival = 0;
             break;
       }
    }
    match_token(token);
    return answer;
  }

  len = getid(id);
  if (context != NULL) {
     var = findargument(id);
  }
  else {
     var = findvariable(id);
#if AUTODEF
     if (var == NULL) {
        var = addautovar(id);
     }
#endif  
  }
  if (var) {
     switch (var->type) {
        case INTID:
           match_token(INTID);
           answer.val.ival = var->val.ival;
           break;
        case FLTID:
           match_token(FLTID);
           answer.val.ival = (int) &var->val.dval;
           break;
       case STRID:
           match_token(STRID);
           answer.val.ival = (int) &var->val.sval;
           break;
        default:
           break;
     }
     return answer;
  }
  else {
     seterror(ERR_NOSUCHVARIABLE);
     return DUMMY_IVALUE;
  }
}

/*
 * dimvariable_addr - get address of a dimensioned variable.
 */
static RVALUE dimvariable_addr(void) {
  DIMVAR *dimvar = NULL;
  unsigned char id[MAXID + 1];
  int len;
  int index[5];
  RVALUE answer;
  void *valptr = 0;
  int indx;

  answer.type = INTID;
  if ((token >= VAR_INT) && (token <= ARG_DIMSTR)) {
    // these tokens are followed by an index
    indx = getindex();
    //printf("indx = %d, nvariables = %d\n", indx, nvariables);
    if (indx < ndimvariables) {
       //printf("index = %d, name = %s\n", indx, variables[indx].id);
       dimvar = &dimvariables[indx];
    }
  }
  else {
     len = getid(id);
     dimvar = finddimvar(id);
  }
  match_token(token);

  if (dimvar != NULL) {

    switch (dimvar->ndims) {
    case 1:
        index[0] = strict_integer(expr(1));
        valptr = getdimvar(dimvar, index[0]);
        break;
    case 2:
        index[0] = strict_integer(expr(1));
        match_token(',');
        index[1] = strict_integer(expr(1));
        valptr = getdimvar(dimvar, index[0], index[1]);
        break;
    case 3:
        index[0] = strict_integer(expr(1));
        match_token(',');
        index[1] = strict_integer(expr(1));
        match_token(',');
        index[2] = strict_integer(expr(1));
        valptr = getdimvar(dimvar, index[0], index[1], index[2]);
        break;
    case 4:
        index[0] = strict_integer(expr(1));
        match_token(',');
        index[1] = strict_integer(expr(1));
        match_token(',');
        index[2] = strict_integer(expr(1));
        match_token(',');
        index[3] = strict_integer(expr(1));
        valptr = getdimvar(dimvar, index[0], index[1], index[2], index[3]);
        break;
    case 5:
        index[0] = strict_integer(expr(1));
        match_token(',');
        index[1] = strict_integer(expr(1));
        match_token(',');
        index[2] = strict_integer(expr(1));
        match_token(',');
        index[3] = strict_integer(expr(1));
        match_token(',');
        index[4] = strict_integer(expr(1));
        valptr = getdimvar(dimvar, index[0], index[1], index[2], index[3], index[4]);
        break;

    }

    match_token(')');
  }
  else {
    seterror(ERR_NOSUCHVARIABLE);
    return DUMMY_IVALUE;
  }

  if (valptr) {
     answer.val.ival = (int)valptr;
     return answer;
  }
  else {
     seterror(ERR_NOSUCHVARIABLE);
     return DUMMY_IVALUE;
  }
}


// case insensitive strcmp
static int strcmp_i(unsigned char *str1, unsigned char *str2) {
   while ((*str1) && (*str2) && (toupper(*str1) == toupper(*str2))) {
      str1++;
      str2++;
   }
   return (toupper(*str1) - toupper(*str2));
}

// case insensitive strncmp
static int strncmp_i(unsigned char *str1, unsigned char *str2, int len) {
   int i = 0;
   if (len <= 0) {
      return 0;
   }
   while ((*str1) && (*str2)
   &&     (toupper(*str1) == toupper(*str2))
   &&     (i < len - 1)) {
      str1++;
      str2++;
      i++;
   }
   return (toupper(*str1) - toupper(*str2));
}

/*
  find a scalar variable in variables list
  Params: id - id to get
  Returns: pointer to that entry, 0 on fail
*/
static VARIABLE *findvariable(unsigned char *id)
{
  int i;

  for (i = 0; i < nvariables; i++) {
    if (!strcmp_i(variables[i].id, id)) {
      return &variables[i];
    }
  }
  return 0;
}

/*
  find a scalar variable index in variables list
  Params: id - id to get
  Returns: index of variable, -1 on fail
*/
static int findvarindx(unsigned char *id)
{
  int i;

  for (i = 0; i < nvariables; i++) {
    if (!strcmp_i(variables[i].id, id)) {
      return i;
    }
  }
  return -1;
}

/*
  get a dimensioned array by name
  Params: id (includes opening parenthesis)
  Returns: pointer to array entry or 0 on fail
*/
static DIMVAR *finddimvar(unsigned char *id)
{
  int i;

  for (i = 0; i < ndimvariables; i++) {
    if (!strcmp_i(dimvariables[i].id, id)) {
      return &dimvariables[i];
    }
  }
  return 0;
}

/*
  find a dimensioned array index in dimensioned array list
  Params: id - id to get
  Returns: index of dimensioned array, -1 on fail
*/
static int finddimvarindx(unsigned char *id)
{
  int i;

  for (i = 0; i < ndimvariables; i++) {
    if (!strcmp_i(dimvariables[i].id, id)) {
      return i;
    }
  }
  return -1;
}

/*
 * dimension - dimension an array.
 * Params: id - the id of the array (include leading '(')
 *         ndims - number of dimension (1-5)
 *     ... - integers giving dimension size, 
 */
static DIMVAR *dimension(unsigned char *id, int ndims, ...)
{
  DIMVAR *dv;
  va_list vargs;
  int size = 1;
  int oldsize = 1;
  int i;
  int dimensions[5];
  int *itemp;
  float *dtemp;
  unsigned char **stemp;

  if (ndims > 5) {
    seterror(ERR_TOOMANYDIMS);  
    return 0;
  }

  dv = finddimvar(id);
  if (dv == NULL) {
    dv = adddimvar(id);
  }
  if (dv == NULL) {
    seterror(ERR_OUTOFMEMORY);
    return 0;
  }

  if (dv->ndims) {
    for (i = 0; i < dv->ndims; i++) {
       oldsize *= dv->dim[i];
    }
  }
  else {
     oldsize = 0;
  }

  va_start(vargs, ndims);
  for (i = 0; i < ndims; i++) {
    dimensions[i] = va_arg(vargs, int);
    size *= (dimensions[i] + 1 - base); // NOTE +1 IF BASE IS ZERO!!!
  }
  va_end(vargs);
#if DEBUG
  printf("dim type = %d, size = %d\n", dv->type, size);
#endif  

  switch (dv->type) {
    case INTID:
      itemp = realloc(dv->val.ival, size * sizeof(int));
      if (itemp != NULL) {
        dv->val.ival = itemp;
        for (i = 0; i < size; i++) {
          dv->val.ival[i] = 0;
        }
      }
      else {
        seterror(ERR_OUTOFMEMORY);
        return 0;
      }
      break;
    case FLTID:
      dtemp = realloc(dv->val.dval, size * sizeof(float));
      if (dtemp != NULL) {
        dv->val.dval = dtemp;
        for (i = 0; i < size; i++) {
          dv->val.dval[i] = 0;
        }
      }
      else {
        seterror(ERR_OUTOFMEMORY);
        return 0;
      }
      break;
    case STRID:
      if (dv->val.sval) {
        for (i = size; i < oldsize; i++) {
          if (dv->val.sval[i]) {
            free(dv->val.sval[i]);
            dv->val.sval[i] = 0;
          }
        }
      }
      stemp = realloc(dv->val.sval, size * sizeof(char *));
      if (stemp != NULL) {
        dv->val.sval = stemp;
        for (i = 0; i < size; i++) {
          dv->val.sval[i] = 0;
        }
      }
      else {
        for (i = 0;i < oldsize; i++) {
          if (dv->val.sval[i]) {
            free(dv->val.sval[i]);
            dv->val.sval[i] = 0;
          }
        }
        seterror(ERR_OUTOFMEMORY);
        return 0;
      }
      break;
    default:
      seterror(ERR_BADTYPE);
      return 0;
    }

  for (i = 0; i < 5; i++) {
    dv->dim[i] = dimensions[i] + 1 - base; // NOTE +1 IF BASE IS ZERO!!!
  }
  dv->ndims = ndims;

  return dv;
}

/*
  get the address of a dimensioned array element.
  works for both string and real arrays.
  Params: dv - the array's entry in variable list
          ... - integers telling which array element to get
  Returns: the address of that element, 0 on fail
*/ 
static void *getdimvar(DIMVAR *dv, ...)
{
  va_list vargs;
  int index[5];
  int i;
  void *answer = 0;

  va_start(vargs, dv);
  for (i = 0; i < dv->ndims; i++) {
    index[i] = va_arg(vargs, int) - base; // note use of BASE
  }
  va_end(vargs);

  for (i = 0; i < dv->ndims; i++) {
    if ((index[i] > dv->dim[i]) || (index[i] < 0)) {
      seterror(ERR_BADSUBSCRIPT);
      return 0;
    }
  }

  if (dv->type == INTID) {
    switch (dv->ndims) {
      case 1:
        answer = &dv->val.ival[ index[0] ]; 
        break;
      case 2:
        answer = &dv->val.ival[ index[1] * dv->dim[0] 
        + index[0] ];
        break;
      case 3:
        answer = &dv->val.ival[ index[2] * (dv->dim[0] * dv->dim[1]) 
        + index[1] * dv->dim[0] 
        + index[0] ];
        break;
      case 4:
        answer = &dv->val.ival[ index[3] * (dv->dim[0] + dv->dim[1] + dv->dim[2]) 
        + index[2] * (dv->dim[0] * dv->dim[1]) 
        + index[1] * dv->dim[0] 
        + index[0] ];
      case 5:
        answer = &dv->val.ival[ 
          index[4] * (dv->dim[0] + dv->dim[1] + dv->dim[2] + dv->dim[3])
        + index[3] * (dv->dim[0] + dv->dim[1] + dv->dim[2])
        + index[2] * (dv->dim[0] + dv->dim[1])
        + index[1] * dv->dim[0]
        + index[0] ];
        break;
    }
  }
  else if (dv->type == FLTID) {
    switch (dv->ndims) {
      case 1:
        answer = &dv->val.dval[ index[0] ]; 
        break;
      case 2:
        answer = &dv->val.dval[ index[1] * dv->dim[0] 
        + index[0] ];
        break;
      case 3:
        answer = &dv->val.dval[ index[2] * (dv->dim[0] * dv->dim[1]) 
        + index[1] * dv->dim[0] 
        + index[0] ];
        break;
      case 4:
        answer = &dv->val.dval[ index[3] * (dv->dim[0] + dv->dim[1] + dv->dim[2]) 
        + index[2] * (dv->dim[0] * dv->dim[1]) 
        + index[1] * dv->dim[0] 
        + index[0] ];
      case 5:
        answer = &dv->val.dval[ 
          index[4] * (dv->dim[0] + dv->dim[1] + dv->dim[2] + dv->dim[3])
        + index[3] * (dv->dim[0] + dv->dim[1] + dv->dim[2])
        + index[2] * (dv->dim[0] + dv->dim[1])
        + index[1] * dv->dim[0]
        + index[0] ];
        break;
    }
  }
  else if (dv->type == STRID) {
    switch (dv->ndims) {
      case 1:
        answer = &dv->val.sval[ index[0] ]; 
        break;
      case 2:
        answer = &dv->val.sval[ index[1] * dv->dim[0] 
        + index[0] ];
        break;
      case 3:
        answer = &dv->val.sval[ 
          index[2] * (dv->dim[0] * dv->dim[1]) + index[1] * dv->dim[0] 
        + index[0] ];
        break;
      case 4:
        answer = &dv->val.sval[ index[3] * (dv->dim[0] + dv->dim[1] + dv->dim[2]) 
        + index[2] * (dv->dim[0] * dv->dim[1]) 
        + index[1] * dv->dim[0] 
        + index[0] ];
      case 5:
        answer = &dv->val.sval[ 
          index[4] * (dv->dim[0] + dv->dim[1] + dv->dim[2] + dv->dim[3])
        + index[3] * (dv->dim[0] + dv->dim[1] + dv->dim[2])
        + index[2] * (dv->dim[0] + dv->dim[1])
        + index[1] * dv->dim[0]
        + index[0] ];
        break;
    }
  }

  return answer;
}

/*
 * addautovar - add a variable of automatic type
 */
static VARIABLE *addautovar(const unsigned char *id)
{
   VARIABLE *vars;
   switch (deftype[toupper(*id) - 'A']) {
      case INTID:
         //debug("var %s = integer\n", id);
         return addinteger(id);
         break;
      case FLTID:
         //debug("var %s = real\n", id);
         return addfloat(id);
         break;
      default:
         //debug("var %s = string\n", id);
         return addstring(id);
         break;
   }
}

/*
 * addinteger - add an integer variable to our variable list
 * Params: id - id of variable to add.
 * Returns: pointer to new entry in table
 */
static VARIABLE *addinteger(const unsigned char *id)
{
   VARIABLE *vars;

  vars = realloc(variables, (nvariables + 1) * sizeof(VARIABLE));
  if (vars != NULL) {
     variables = vars;
     strcpy((char *)variables[nvariables].id, (char *)id);
     variables[nvariables].type = INTID;
     variables[nvariables].val.ival = 0;
     nvariables++;
     return &variables[nvariables-1];
  }
  else {
     printf("out of RAM? (%d)\n",errno);
     seterror(ERR_OUTOFMEMORY);
  }

  return 0; 
}

/*
 * addfloat - add a real variable to our variable list
 * Params: id - id of variable to add.
 * Returns: pointer to new entry in table
 */
static VARIABLE *addfloat(const unsigned char *id)
{
   VARIABLE *vars;

  vars = realloc(variables, (nvariables + 1) * sizeof(VARIABLE));
  if (vars != NULL) {
     variables = vars;
     strcpy((char *)variables[nvariables].id, (char *)id);
     variables[nvariables].type = FLTID;
     variables[nvariables].val.dval = 0;
     nvariables++;
     return &variables[nvariables-1];
  }
  else {
     printf("out of RAM? (%d)\n",errno);
     seterror(ERR_OUTOFMEMORY);
  }

  return 0; 
}

/*
 * addstring - add a string variable to table.
 * Params: id - id of variable to get (including trailing $)
 * Retruns: pointer to new entry in table, 0 on fail.       
 */
static VARIABLE *addstring(const unsigned char *id)
{
  VARIABLE *vars;

  vars = realloc(variables, (nvariables + 1) * sizeof(VARIABLE));
  if (vars) {
     variables = vars;
     strcpy((char *)variables[nvariables].id, (char *)id);
     variables[nvariables].type = STRID;
     variables[nvariables].len = 0;
     variables[nvariables].val.sval = 0;
     nvariables++;
     return &variables[nvariables-1];
  }
  else {
     printf("out of RAM? (%d)\n",errno);
     seterror(ERR_OUTOFMEMORY);
  }

  return 0;
}

/*
 * addimvar - add a new array to our symbol table.
 * Params: id - id of array (include leading ()
 * Returns: pointer to new entry, 0 on fail.
 */
static DIMVAR *adddimvar(const unsigned char *id)
{
  DIMVAR *vars;

  vars = realloc(dimvariables, (ndimvariables + 1) * sizeof(DIMVAR));
  if (vars != NULL) {
    dimvariables = vars;
    strcpy((char *)dimvariables[ndimvariables].id, (char *)id);
    dimvariables[ndimvariables].ndims = 0;
    if (strchr((char *)id, '%')) {
      dimvariables[ndimvariables].type = INTID;
      dimvariables[ndimvariables].val.ival = 0;
    }
    else if (strchr((char *)id, '$')) {
      dimvariables[ndimvariables].type = STRID;
      dimvariables[ndimvariables].len = 0;
      dimvariables[ndimvariables].val.sval = 0;
    }
    else if (strchr((char *)id,'!') || (strchr((char *)id,'#'))) {
      dimvariables[ndimvariables].type = FLTID;
      dimvariables[ndimvariables].val.dval = 0;
    }
    else {
      dimvariables[ndimvariables].type = deftype[toupper(*id)-'A'];
      dimvariables[ndimvariables].val.ival = 0;
    }
    ndimvariables++;
    return &dimvariables[ndimvariables-1];
  }
  else {
    seterror(ERR_OUTOFMEMORY);
  }
 
  return 0;
}

/*
 * autodimvar - add a new array to our symbol table with all dimensions = 10.
 * Params: id - id of array (include leading ()
 * Returns: pointer to new entry, 0 on fail.
 */
static DIMVAR *autodimvar(unsigned char *id)
{
  const char * savedstring;
  int saved_indx;
  int saved_offs;
  int saved_token;
  DIMVAR *dimvar = NULL;
  char name[MAXID + 1];
  int len;
  int ndims;
  int i;
  int size;

  saved_indx = current_indx;
  saved_offs = current_offs;
  saved_token = token;
  match_token(token);
  i = integer(expr(1)); // don't care what the value is
  ndims = 1;
  while (token == ',') {
     ndims++;
     match_token(',');
     i = integer(expr(1)); // don't care what the value is
  } 
  match_token(')');
  current_indx = saved_indx;
  current_offs = saved_offs;
  token = saved_token;
  if (ndims > 5) {
     seterror(ERR_TOOMANYDIMS);
     return 0;
  }
  switch (ndims) {
    case 1:
      dimvar = dimension(id, 1, 10);
      break;
    case 2:
      dimvar = dimension(id, 2, 10, 10);
      break;
    case 3:
      dimvar = dimension(id, 3, 10, 10, 10);
      break;
    case 4:
      dimvar = dimension(id, 4, 10, 10, 10, 10);
      break;
    case 5:
      dimvar = dimension(id, 5, 10, 10, 10, 10, 10);
      break;
  }

  size = 1;
  for (i = 0; i < dimvar->ndims; i++) {
    size *= dimvar->dim[i];
  }
  
  switch (dimvar->type) {
    case INTID:
      i = 0;
      dimvar->val.ival[i++] = 0;
      while (i < size) {
        dimvar->val.ival[i++] = 0;
        if (errorflag) {
          break;
        }
      }
      break;
    case FLTID:
      i = 0;
      dimvar->val.dval[i++] = 0.0;
      while (i < size) {
        dimvar->val.dval[i++] = 0.0;
        if (errorflag) {
          break;
        }
      }
      break;
    case STRID:
      i = 0;
      dimvar->val.sval[i++] = mystrdup(nullstr);
      while (i < size) {
        dimvar->val.sval[i++] = mystrdup(nullstr);
        if (errorflag) {
          break;
        }
      }
      break;
  }
  return dimvar;
  
}

/*
  high level string parsing function.
  Returns: a malloced pointer, or 0 on error condition.
  caller must free!
*/
static unsigned char *stringexpr(void)
{
  unsigned char *left;
  unsigned char *right;
  unsigned char *temp;

  switch (token) {
  case DIMSTRID:
  case VAR_DIMSTR:
    left = stringdimvar();
    break;
  case STRID:
  case VAR_STR:
    left = stringvar();
    break;
  case '"':
    left = stringliteral();
    break;
  case CHRSTRING:
    left = chrstring();
    break;
  case STRSTRING:
    left = strstring();
    break;
  case LEFTSTRING:
    left = leftstring();
    break;
  case RIGHTSTRING:
    left = rightstring();
    break;
  case MIDSTRING:
    left = midstring();
    break;
  case STRINGSTRING:
    left = stringstring();
    break;
  case HEXSTRING:
    left = hexstring();
    break;
  case OCTSTRING:
    left = octstring();
    break;
  case DATESTRING:
    left = datestring();
    break;
  case TIMESTRING:
    left = timestring();
    break;
  case SPACESTRING:
    left = spacestring();
    break;
  case MKISTRING:
    left = mkistring();
    break;
  case MKDSTRING:
    left = mkdstring();
    break;
  case MKSSTRING:
    left = mksstring();
    break;
  case INKEYSTRING:
    left = inkeystring();
    break;
  case INPUTSTRING:
    left = inputstring();
    break;
  case VARPTRSTRING:
    left = varptrstring();
    break;
  default:
    if (!is_string(token)) {
       seterror(ERR_TYPEMISMATCH);
    }
    else {
      seterror(ERR_SYNTAX);
    }
    return mystrdup(nullstr);
  }

  if (left == NULL) {
    seterror(ERR_OUTOFMEMORY);
    return 0;
  }

  switch (token) {
  case '+':
    match_token('+');
    right = stringexpr();
    if (right != NULL) {
      temp = mystrconcat(left, right);
      free(right);
      if (temp != NULL) {
        free(left);
        left = temp;
      }
      else {
         seterror(ERR_OUTOFMEMORY);
      }
    }
    else {
       seterror(ERR_OUTOFMEMORY);
    }
    break;
  default:
    return left;
  }

  return left;
}

/*
  parse the CHR$ token
*/
static unsigned char *chrstring(void)
{
  float x;
  unsigned char buff[6];
  unsigned char *answer;

  match_token(CHRSTRING);
  match_token('(');
  x = strict_integer(expr(1));
  match_token(')');

  buff[0] = (char) x;
  buff[1] = 0;
  answer = mystrdup(buff);

  if (answer == NULL) {
     seterror(ERR_OUTOFMEMORY);
  }

  return answer;
}

/*
  parse the STR$ token
*/
static unsigned char *strstring(void)
{
  RVALUE x;
  unsigned char buff[64];
  unsigned char *answer;

  match_token(STRSTRING);
  match_token('(');
  x = expr(1);
  match_token(')');

  if (x.type == INTID) {
     if (x.val.ival > 0) {
        sprintf((char *)buff, " %d", x.val.ival);
     }
     else {
        sprintf((char *)buff, "%d", x.val.ival);
     }
  }
  else {
     if (x.val.dval > 0) {
        sprintf((char *)buff, " %g", x.val.dval);
     }
     else {
        sprintf((char *)buff, "%g", x.val.dval);
     }
  }
  answer = mystrdup(buff);
  if (answer == NULL) {
     seterror(ERR_OUTOFMEMORY);
  }
  return answer;
}

/*
  parse the HEX$ token
*/
static unsigned char *hexstring(void)
{
  RVALUE x;
  unsigned char buff[64];
  unsigned char *answer;

  match_token(HEXSTRING);
  match_token('(');
  x = expr(1);
  match_token(')');

  if (x.type == INTID) {
     sprintf((char *)buff, "%X", x.val.ival);
  }
  else {
     sprintf((char *)buff, "%X", (int)x.val.dval);
  }
  answer = mystrdup(buff);
  if (answer == NULL) {
     seterror(ERR_OUTOFMEMORY);
  }
  return answer;
}

/*
  parse the OCT$ token
*/
static unsigned char *octstring(void)
{
  RVALUE x;
  unsigned char buff[64];
  unsigned char *answer;

  match_token(OCTSTRING);
  match_token('(');
  x = expr(1);
  match_token(')');

  if (x.type == INTID) {
     sprintf((char *)buff, "%o", x.val.ival);
  }
  else {
     sprintf((char *)buff, "%o", (int)x.val.dval);
  }
  answer = mystrdup(buff);
  if (answer == NULL) {
     seterror(ERR_OUTOFMEMORY);
  }
  return answer;
}
/*
 * spacestring - the SPACE$ function
 */
static unsigned char *spacestring(void)
{
  int  x;
  int  i;
  unsigned char buff[256];
  unsigned char *answer;

  match_token(SPACESTRING);
  match_token('(');
  x = integer(expr(1));
  match_token(')');

  if ((x >= 0) && (x <= 255)) {
     for (i = 0; i < x; i++) {
        buff[i] = ' ';
     }
     buff[i] = '\0';     
  }
  else {
     seterror(ERR_BADVALUE);
  }
  answer = mystrdup(buff);
  if (answer == NULL) {
     seterror(ERR_OUTOFMEMORY);
  }
  return answer;
}


/*
 * mkistring - the MKI$ function
 */
static unsigned char *mkistring(void)
{
   CONVERTER c;
   RVALUE x;
   unsigned char *answer;
   
   match_token(MKISTRING);
   match_token('(');
   x =  expr(1);
   match_token(')');

   if (x.type != INTID) {
     seterror(ERR_BADTYPE);
     return NULL;
   }
   else {
      c.ival = x.val.ival;
      answer = mystrndup((unsigned char *)&c.byte, sizeof(int));

      if (answer == NULL) {
         seterror(ERR_OUTOFMEMORY);
      }
      return answer;
   }
}


/*
 * mksstring - the MKS$ function
 */
static unsigned char *mksstring(void)
{
   CONVERTER c;
   RVALUE x;
   unsigned char *answer;
   
   match_token(MKSSTRING);
   match_token('(');
   x = expr(1);
   match_token(')');

   if (x.type != FLTID) {
     seterror(ERR_BADTYPE);
     return NULL;
   }
   else {
      c.dval = x.val.dval;
      answer = mystrndup((unsigned char *)&c.byte, sizeof(float));

      if (answer == NULL) {
         seterror(ERR_OUTOFMEMORY);
      }
      return answer;
   }
}


/*
 * mkdstring - the MKD$ function
 */
static unsigned char *mkdstring(void)
{
   CONVERTER c;
   RVALUE x;
   unsigned char *answer;
   
   match_token(MKDSTRING);
   match_token('(');
   x =  expr(1);
   match_token(')');

   if (x.type != FLTID) {
     seterror(ERR_BADTYPE);
     return NULL;
   }
   else {
      c.dval = x.val.dval;
      answer = mystrndup((unsigned char *)&c.byte, sizeof(float));

      if (answer == NULL) {
         seterror(ERR_OUTOFMEMORY);
      }
      return answer;
   }
}

/*
 * varptrstring - the VARPTR$ function
 */
static unsigned char *varptrstring(void)
{
   CONVERTER c;
   LVALUE lv;
   unsigned char *answer;
   
   match_token(VARPTRSTRING);
   match_token('(');
   lvalue(&lv);
   match_token(')');

   if (errorflag == 0) {
      switch (lv.type) {
         case INTID:
         c.ival = (int) &lv.val.ival;
         break;
      case FLTID:
         c.ival = (int) &lv.val.dval;
         break;
      case STRID:
         c.ival = (int) &lv.val.sval;
         break;
      default:
         c.ival = 0;
         seterror(ERR_BADTYPE);
         break;
      }
   }
   answer = mystrndup((unsigned char *)&c.byte, sizeof(int));
   return answer;
}


/*
 * get_key() - return a key if ready, or zero if not
 */
int get_key() {
#ifdef __CATALINA__
    return k_get();
#else
#ifdef _WIN32
   if (kbhit()) {
     return getch();
   }
#else
  struct termios oldt, newt;
  int ch;
  int oldf;

  tcgetattr(STDIN_FILENO, &oldt);
  newt = oldt;
  newt.c_lflag &= ~(ICANON | ECHO);
  tcsetattr(STDIN_FILENO, TCSANOW, &newt);
  oldf = fcntl(STDIN_FILENO, F_GETFL, 0);
  fcntl(STDIN_FILENO, F_SETFL, oldf | O_NONBLOCK);

  ch = getchar();

  tcsetattr(STDIN_FILENO, TCSANOW, &oldt);
  fcntl(STDIN_FILENO, F_SETFL, oldf);

  if(ch != EOF) {
    return ch;
  }
  return 0;
#endif
#endif
}

/*
 * inkeystring - the INKEY$ function
 */
static unsigned char *inkeystring(void)
{
   RVALUE x;
   char ch[2];
   unsigned char *answer;
   
   match_token(INKEYSTRING);
   ch[0] = get_key();
   ch[1] = 0;
   answer = mystrndup((unsigned char *)ch, 2);
   if (answer == NULL) {
      seterror(ERR_OUTOFMEMORY);
   }
   return answer;
}

/*
 * inputstring - the INPUT$ function
 */
static unsigned char *inputstring(void)
{
   int x;
   char buff[256];
   char ch;
   unsigned char *answer;
   int file_input = 0;
   int f;
   int i;
   
   match_token(INPUTSTRING);
   match_token('(');
   x = strict_integer(expr(1));
   if ((x < 0) || (x > 255)) {
      seterror(ERR_BADVALUE);
      return mystrdup(nullstr);
   }
   if (token == ',') {
      match_token(',');
      file_input = 1;
      if (token == '#') {
         match_token('#');
      }
      f = strict_integer(expr(1));
   }
   match_token(')');

   if (errorflag != 0) {
      return mystrdup(nullstr);
   }
   
   if (file_input) {
      if ((f >= 1) && (f <= MAXFILES)) {
         f--;
         if (FILES[f].file != NULL) {
            for (i = 0; i < x; i++) {
               ch = fgetc(FILES[f].file);
               if (ch == EOF) {
                  break;
               }
               buff[i] = ch;
            }
            buff[i] = 0;
         }
         else {
            seterror(ERR_NOFILE);
            return mystrdup(nullstr);
         }
      }
      else {
         seterror(ERR_BADFILE);
         return mystrdup(nullstr);
      }
   }
   else {
      for (i = 0; i < x; i++) {
         ch = wait_key();
         if (ch == 0x03) {
            break;
         }
         buff[i] = ch;
      }
      buff[i] = 0;
   }
   answer = mystrndup((unsigned char *)buff, i+1);
   if (answer == NULL) {
      seterror(ERR_OUTOFMEMORY);
   }
   return answer;
}

/*
 * timestring - the TIME$ function
 */
static unsigned char *timestring(void)
{
   unsigned char buff[64];
   unsigned char *answer;
   time_t bt;
   struct tm *t;

   match_token(TIMESTRING);

   bt = time(NULL);
   t = localtime(&bt);
   sprintf((char *)buff, "%02d:%02d:%02d", t->tm_hour, t->tm_min, t->tm_sec);

   answer = mystrdup(buff);
   if (answer == NULL) {
      seterror(ERR_OUTOFMEMORY);
   }
   return answer;
}


/*
 * datestring - the DATE$ function
 */
static unsigned char *datestring(void)
{
   unsigned char buff[64];
   unsigned char *answer;
   time_t bt;
   struct tm *t;

   match_token(DATESTRING);

   bt = time(NULL);
   t = localtime(&bt);
   sprintf((char *)buff, "%02d-%02d-%04d", t->tm_mon + 1, t->tm_mday, t->tm_year + 1900);

   answer = mystrdup(buff);
   if (answer == NULL) {
      seterror(ERR_OUTOFMEMORY);
   }
   return answer;
}

/*
  parse the LEFT$ token
*/
static unsigned char *leftstring(void)
{
  unsigned char *str;
  int x;
  unsigned char *answer;

  match_token(LEFTSTRING);
  match_token('(');
  str = stringexpr();
  if (!str)
  return 0;
  match_token(',');
  x = strict_integer(expr(1));
  match_token(')');

  if (x > (int) strlen((char *)str))
  return str;
  if (x < 0) {
    seterror(ERR_ILLEGALOFFSET);
    return str;
  }
  str[x] = 0;
  answer = mystrdup(str);
  free(str);
  if (answer == NULL) {
     seterror(ERR_OUTOFMEMORY);
  }
  return answer;
}

/*
  parse the RIGHT$ token
*/
static unsigned char *rightstring(void)
{
  int x;
  unsigned char *str;
  unsigned char *answer;

  match_token(RIGHTSTRING);
  match_token('(');
  str = stringexpr();
  if (!str)
  return 0;
  match_token(',');
  x = strict_integer(expr(1));
  match_token(')');

  if ( x > (int) strlen((char *)str)) {
     return str;
  }

  if (x < 0) {
    seterror(ERR_ILLEGALOFFSET);
     return str;
  }
  
  answer = mystrdup( &str[strlen((char *)str) - x] );
  free(str);
  if (answer == NULL) {
     seterror(ERR_OUTOFMEMORY);
  }
  return answer;
}

/*
  parse the MID$ token
*/
static unsigned char *midstring(void)
{
  unsigned char *str;
  int x;
  int len;
  unsigned char *answer;
  unsigned char *temp;

  match_token(MIDSTRING);
  match_token('(');
  str = stringexpr();
  match_token(',');
  x = strict_integer(expr(1));
  match_token(',');
  len = strict_integer(expr(1));
  match_token(')');

  if (!str) {
     return 0;
  }

  if (len == -1) {
     len = strlen((char *)str) - x + 1;
  }

  if ( x > (int) strlen((char *)str) || len < 1) {
     free(str);
     answer = mystrdup(nullstr);
     if (answer == NULL) {
        seterror(ERR_OUTOFMEMORY);
     }
     return answer;
  }
  
  if (x < 1) {
     seterror(ERR_ILLEGALOFFSET);
     return str;
  }

  temp = &str[x-1];

  answer = malloc(len + 1);
  if (answer == NULL) {
     seterror(ERR_OUTOFMEMORY);
     return str;
  }
  strncpy((char *)answer, (char *)temp, len);
  answer[len] = 0;
  free(str);

  return answer;
}

/*
 * parse the string$ token
 */
static unsigned char *stringstring(void)
{
  int x;
  unsigned char *str;
  unsigned char *answer;
  int string_arg;
  int len;
  int N;
  int i;
  int ch;

  match_token(STRINGSTRING);
  match_token('(');
  x = strict_integer(expr(1));
  match_token(',');
  if (is_string(token)) {
     // second argument is string
     str = stringexpr();
     string_arg = 1;
     if (!str) {
        return 0;
     }
  }
  else {
     // second argument must be integer
     ch = strict_integer(expr(1));
     string_arg = 0;
  }
  match_token(')');

  N = x;

  if (N < 1) {
     free(str);
     answer = mystrdup(nullstr);
     if (answer == NULL) {
        seterror(ERR_OUTOFMEMORY);
     }
     return answer;
  }

  if (string_arg) {
     len = strlen((char *)str);
     answer = malloc( N * len + 1 );
     if (answer == NULL) {
        free(str);
        seterror(ERR_OUTOFMEMORY);
        return 0;
     }
     for (i = 0; i < N; i++) {
        strcpy((char *)answer + len * i, (char *)str);
     }
     free(str);
  }
  else {
     answer = malloc( N + 1 );
     if (answer == NULL) {
        seterror(ERR_OUTOFMEMORY);
        return 0;
     }
     for (i = 0; i < N; i++) {
        answer[i] = ch;
     }
     answer[i] = 0;
  }

  return answer;
}

/*
  read a dimensioned string variable from input.
  Returns: pointer to a malloced string 
*/
static unsigned char *stringdimvar(void)
{
  unsigned char id[MAXID + 1];
  int  len;
  DIMVAR   *dimvar = NULL;
  FUNCTION *dimfunc;
  unsigned char **answer;
  int  index[5];
  int  indx;

  if (token == VAR_DIMSTR) {
     indx = getindex();
     match_token(VAR_DIMSTR);
     if (indx < ndimvariables) {
        dimvar = &dimvariables[indx];
     }
  }
  else {
     len = getid(id);
     match_token(DIMSTRID);
     dimvar = finddimvar(id);
  }

  if (dimvar == NULL) {
     dimfunc = findfunction(id, len);
     if (dimfunc) {
       return evalstringfunction(dimfunc);
     }
#if AUTODEF
     dimvar = autodimvar(id);
#else     
     seterror(ERR_NOSUCHVARIABLE);
#endif       
  }
  
  if (dimvar != NULL) {
    switch (dimvar->ndims) {
      case 1:
        index[0] = strict_integer(expr(1));
        answer = getdimvar(dimvar, index[0]);
        break;
      case 2:
        index[0] = strict_integer(expr(1));
        match_token(',');
        index[1] = strict_integer(expr(1));
        answer = getdimvar(dimvar, index[0], index[1]);
        break;
      case 3:
        index[0] = strict_integer(expr(1));
        match_token(',');
        index[1] = strict_integer(expr(1));
        match_token(',');
        index[2] = strict_integer(expr(1));
        answer = getdimvar(dimvar, index[0], index[1], index[2]);
        break;
      case 4:
        index[0] = strict_integer(expr(1));
        match_token(',');
        index[1] = strict_integer(expr(1));
        match_token(',');
        index[2] = strict_integer(expr(1));
        match_token(',');
        index[3] = strict_integer(expr(1));
        answer = getdimvar(dimvar, index[0], index[1], index[2], index[3]);
        break;
      case 5:
        index[0] = strict_integer(expr(1));
        match_token(',');
        index[1] = strict_integer(expr(1));
        match_token(',');
        index[2] = strict_integer(expr(1));
        match_token(',');
        index[3] = strict_integer(expr(1));
        match_token(',');
        index[4] = strict_integer(expr(1));
        answer = getdimvar(dimvar, index[0], index[1], index[2], index[3], index[4]);
        break;
    }
    match_token(')');
  }
  else {
    seterror(ERR_NOSUCHVARIABLE);
  }

  if (!errorflag) {
    if (*answer) {
      return mystrdup(*answer);
    }
  }
   
  return mystrdup(nullstr);
}

/*
  parse a string variable.
  Returns: pointer to malloced string, or the result of string function  
*/
static unsigned char *stringvar(void)
{
  unsigned char id[MAXID + 1];
  int len;
  VARIABLE *var;
  FUNCTION *func;
  int indx;
  unsigned char *str;

  if (token == VAR_STR) {
     indx = getindex();
     match_token(VAR_STR);
     //printf("indx = %d, nvariables = %d\n", indx, nvariables);
     if (indx < nvariables) {
        //printf("index = %d, name = %s\n", indx, variables[indx].id);
        if (variables[indx].val.sval) {
           if (variables[indx].len > 0) {
              // this is a FIELD - return a copy of all 'len' characters, but 
              // add a null character at the end, so the result can also be 
              // used as a normal string
              str = mystrndup(variables[indx].val.sval, variables[indx].len + 1);
              str[variables[indx].len] = 0;
              return str;
           }
           else {
              // this is not a FIELD - just return a copy of the string
              return mystrdup(variables[indx].val.sval);
           }
        }
        return mystrdup(nullstr);
     }
  }

  len = getid(id);
  if (context != NULL) {
     //debug("looking for argument %s\n", id);
     var = findargument(id);
     if (var) {
           //debug("found argument, val = %s\n", var->val.sval);
           match_token(STRID);
           return var->val.sval;
     }
  }
  var = findvariable(id);
  if (var) {
    match_token(STRID);
    if (var->val.sval) {
       return var->val.sval;
    }
    return mystrdup(nullstr);
  }
  func = findfunction(id, len);
  if (func) {
     current_offs += len;
     token = gettoken();
     return evalstringfunction(func);
  }
  match_token(STRID);
#ifdef AUTODEF
  var = addstring(id);
#else 
  seterror(ERR_NOSUCHVARIABLE);
#endif  
  return mystrdup(nullstr);
}

/*
  parse a string literal
  Returns: malloced string literal
  Notes: newlines aren't allwed in literals, but blind
         concatenation across newlines is. 
*/
static unsigned char *stringliteral(void) {
  int len = 1;
  unsigned char *answer = 0;
  unsigned char *substr;
  unsigned char *temp;
  unsigned char *str;
  unsigned char *end;

  if ((context == NULL) && (str = lines[current_indx].tok) != NULL) {
     // use tokenized line if there is one, and we are not in
     // the context of a user-defined function
     str += current_offs;
  }
  else {
     // use non-tokenized line
     str = lines[current_indx].str + current_offs;
  }
  
  while (token == '"') {
    while (space_or_tab(*str)) {
      str++;
      current_offs++;
    }

    end = mystrend(str, '"');
    if (end) {
      len = end - str; // including terminating null
      substr = malloc(len);
      if (!substr) {
        seterror(ERR_OUTOFMEMORY);
        return answer;
      }
      mystrgrablit(substr, str);
      if (answer) {
        temp = mystrconcat(answer, substr);
        free(substr);
        free(answer);
        answer = temp;
        if (answer == NULL) {
          seterror(ERR_OUTOFMEMORY);
          return answer;
        }
      }
      else {
        answer = substr;
      }
      current_offs += len;
    }
    else {
      match_token('"');
      seterror(ERR_SYNTAX);
      return answer;
    }

    match_token('"');
  }

  return answer;
}

/*
 * strict_integer - cast an rvalue to an integer, triggering errors if out 
 *                  of range or the value is not integral
 */
static int strict_integer(RVALUE x) {
  if (x.type == INTID) {
     return x.val.ival;
  }
  if ( x.val.dval < INT_MIN || x.val.dval > INT_MAX ) {
     seterror( ERR_BADVALUE );
  }
  if ( x.val.dval != floor(x.val.dval) ) {
     seterror( ERR_NOTINT );
  }
  return (int) x.val.dval;
}

/*
 * integer - cast cast an rvalue to an integer, triggering errors if out 
 *           of range, "flooring" the value if it is not integral
 */
static int integer(RVALUE x) {
  if (x.type == INTID) {
     return x.val.ival;
  }
  if ( x.val.dval < INT_MIN || x.val.dval > INT_MAX ) {
     seterror( ERR_BADVALUE );
  }
  return (int) floor(x.val.dval);
}

/*
 * real - cast an rvalue to a real
 */
static float real(RVALUE x) {
  if (x.type == FLTID) {
     return x.val.dval;
  }
  return (float) x.val.ival;
}

/*
 * check that we have a token of the passed type 
 * (if not set the errorflag)
 * Move parser on to next token. Sets token and string.
 */
static void match_token(int tok) {
  unsigned char *str;

  if ((context == NULL) && (str = lines[current_indx].tok) != NULL) {
     // use tokenized line if there is one, and we are not in
     // the context of a user-defined function
     str += current_offs;
  }
  else {
     // use non-tokenized line
     str = lines[current_indx].str + current_offs;
     // in non-tokenized lines, there may be extraneous spaces
     while (space_or_tab(*str)) {
       current_offs++;  
       str++;
     }
  }

  if (token != tok) {
#if DEBUG    
    printf("looking for token %d, found token %d ",tok,token);
    printf("index = %d, offs = %d\n",current_indx, current_offs);
#endif    
    seterror(ERR_SYNTAX);
    return;
  }

  current_offs += tokenlen();
  token = gettoken();
  if (token == TOKERR) {
     seterror(ERR_SYNTAX);
  }
#if DEBUG  
  printf("in match, next token = %d ",token);
  printf("index = %d, offs = %d\n",current_indx, current_offs);
#endif   
}

/*
 * check that we have reached the end of line. If so, and we
 * are not at EOS, then move to next token. Otherwise set error flag. 
 * Updates index and offset.
 */
static void match_eol(void) {
  unsigned char *str;
  int len;

#if DEBUG  
  printf("in match_eol\n");
#endif

  if ((context == NULL) && (str = lines[current_indx].tok) != NULL) {
     // use tokenized line if there is one, and we are not in
     // the context of a user-defined function
     str += current_offs;
  }
  else {
     // use non-tokenized line
     str = lines[current_indx].str + current_offs;
     // in non-tokenized lines, there may be extraneous spaces
     while (space_or_tab(*str)) {
       current_offs++;  
       str++;
     }
  }

  if ((token == EOL) || (token == '\n')) {
     // move to next line  
     current_indx++;
     current_offs = 0;    
     if (current_indx >= nlines) {
        token = EOS;
     }
     else {
        token = gettoken();
     }
  }
  else if (token == ':') {
     if (lines[current_indx].tok != NULL) {
        current_indx++;
        current_offs = 0;
     }
     else {
        current_offs += 1;
        str += 1;
        while (space_or_tab(*str)) {
           current_offs++;    
           str++;
        }
     } 
     token = gettoken();
  }
  else if (token != EOS) {
#if DEBUG
     printf("expected EOL, got token %d\n at string ", token);
      { 
         unsigned char *str = getcurrentpos();
         while (!is_eol(*str)) {
             fprintf(fperr, "%c", *str++);
         }
      }
#endif
     seterror(ERR_NOTEOL);
  }
#if DEBUG  
  printf("match_eol done\n");
#endif
}


/*
 * find_eol - find the end of the line, which may be
 * terminated by the end of the whole program, or by
 * a line terminator, or a colon, or a '\0' - but check  
 * for quoted strings to avoid terminating the line too 
 * early if we find a colon. Also check for 'rem'
 * statements
 */
static void find_eol(void) {
   int in_string = 0;
   int len;
   unsigned char *str;

   if ((context == NULL) && (str = lines[current_indx].tok) != NULL) {
     // use tokenized line if there is one, and we are not in
     // the context of a user-defined function
      str += current_offs;
   }
   else {
      // use non-tokenized line
      str = lines[current_indx].str + current_offs;
      // in non-tokenized lines, there may be extraneous spaces
      while (space_or_tab(*str)) {
         current_offs++;  
         str++;
      }
   }

   while (!is_eol(token)) {

      if ((token == REM) || (token == '\'')) {
         // after a REM token (tokenized or not) the
         // remainder of the line is untokenized and 
         // colons do not terminate the line, so we 
         // must look for the actual end of line
         while ((*str != '\0') && (*str != '\n')) {
            current_offs++;
            str++;
         }
         token = *str;
      }
      else if (token == '"') {
         if (in_string && (*(str + 1) == '"')) {
            // quotes escape quotes
            current_offs += 2;
            str += 2;
         }
         else {
            in_string = !in_string;
            current_offs++;
            str++;
         }
         if (in_string) {
            token = *str;
         }
         else {
            token = gettoken();
         }
      }
      else {
         if (in_string) {
            current_offs += len;
            str++;
            token = *str;
         }
         else {
            len = tokenlen();
            current_offs += len;
            str += len;
            token = gettoken();
         }
      }

      //debug("indx = %d, offs = %d, token = %d\n", current_indx, current_offs, token);
   }
}

/*
 * untokenized_eol - find the end of the line in an untokenized string.
 * The string may be terminated by the end of the whole program, or by
 * a line terminator, or a colon - but check for quoted strings to avoid
 * terminating the line too early if we find a colon. Also check for REM
 * statements.
 */
static unsigned char * untokenized_eol(unsigned char * str) {
   int in_rem = 0;
   int in_string = 0;

   while (1) {
      if (!in_string) {
         if ((strncmp_i(str, (unsigned char *)"rem", 3) == 0)) {
            in_rem = 1;
            str += 3;
         }
         else if (*str == '\'') {
            in_rem = 1;
            str++;
         }
      }
      if (in_rem) {
         // in REM lines, only EOL or EOS terminates the line
         if ((*str == '\0') || (*str == '\n')) {
            break; 
         }
         else {
            str++;
         }
      }
      else {
         // in non-REM lines, colons can also terminate the line
         // unless they are within a quoted string.
         if ((*str == '\0') || (*str == '\n')) {
             break;
         }
         if (*str == '"') {
            if (in_string && (*(str + 1) == '"')) { // quotes escape quotes
               str += 2;
            }
            else {
               in_string = !in_string;
               str++;
            }
         }
         else if ((*str != ':') || in_string) {
            str++;
         }
         else {
            break;
         }
      }
   }
   return str;
}

/*
 * seterror - set the errorflag and errorindx
 * Params: errorcode - the error
 * Notes: ignores error cascades
 */
static void seterror(int errorcode)
{
   if (errorflag == 0 || errorcode == 0) {
      if ((errorflag = errorcode) > 0) {
         errorlast = errorflag;
         errorindx = current_indx;
      }
   }
}

/*
 * getindex - get a variable or argument index from the extended token
 *            at the current index and offset (tokenized lines only)
 */
static int getindex(void)
{
   unsigned char *str;

   if ((str = lines[current_indx].tok) != NULL) {
      // use tokenized line
      return *(str + current_offs + 1);
   }
   else {
      seterror(ERR_INTERNAL);
      return 0;
   }
}

/*
 * gettoken - get a token from the current index and offset
 * 
 * Notes: Ignores white space between tokens, but not end of line
 *
 *        Extended tokens (in tokenized lines only) are returned 
 *        as EXT(EX_TOKEN)
 *
 *        Checks whether an id exists as a non-dimensioned variable
 *        before returning a dimensioned variable if NEW_GETTOKEN
 *        is defined
 */
static int gettoken(void)
{
  int result;
  char typechar;
  unsigned char *str;
  unsigned char buff[MAXID + 1];
  int i;

  if ((context == NULL) && (str = lines[current_indx].tok) != NULL) {
     // use tokenized line if there is one, and we are not in
     // the context of a user-defined function
     str += current_offs;
     if (*str == 0) {
        // in a tokenized line, this means EOL             
#if DEBUG  
        printf("in gettoken, index = %d, offset = %d, token=%d\n", 
               current_indx, current_offs, *str);
#endif  
        return EOL;             
     }
     if (*str == EXTEND) {
        // found an extended token, so return it
#if DEBUG  
        printf("in gettoken, index = %d, offset = %d, token = EXTEND+%d\n", 
               current_indx, current_offs, *(str + 1));
#endif  
        return (EXT(*(str + 1)));
     }
     if ((*str < 0x20) || (*str > 0x7F)) {
        // found a normal token, so return it
#if DEBUG  
        printf("in gettoken, index = %d, offset = %d, token=%d\n", 
               current_indx, current_offs, *str);
#endif  
        return *str;
     }
  }
  else {
     // use non-tokenized line
     str = lines[current_indx].str + current_offs;
     // in non-tokenized lines, there may be extraneous spaces
     while (space_or_tab(*str)) {
       current_offs++;  
       str++;
     }
  }

#if DEBUG  
  printf("in gettoken, index = %d, offset = %d, chr=%d (%c)\n", 
         current_indx, current_offs, *str, *str);
#endif  

  if (digit(*str) || (*str== '&') || (*str== '.')) {
    return VALUE;
  }
 
  switch (*str) {
  case 0:
#if DEBUG     
    printf ("EOS\n");
#endif    
    return EOS;
  case '\n':
#if DEBUG    
    printf ("EOL\n");
#endif    
    return EOL;
  case '/': 
  case '*':
  case '(':
  case ')':
  case '+':
  case '-':
  case ',':
  case ';':
  case ':':
  case '\'':
  case '?':
  case '^':
  case '\\':
  case '"':
  case '=':
  case '#':
    return *str;
  case '<':
    if (str[1] == '>') {
       return NEQ;
    }
    if (str[1] == '=') {
       return LTE;
    }
    else {
       return '<';
    }
  case '>':
    if (str[1] == '=') {
       return GTE;
    }
    else {
       return '>';
    }

  default:

    result = token_parser(str);
    if (result != 0) {
       return result;
    }

    if (alpha(*str)) {
       typechar = toupper(*str);
       i = 0;
       while (alnum(*str)) {
         if (i < MAXID) {
            buff[i++] = *str;
         }
         str++;
       }
       switch (*str) {
         case '%':
           buff[i++] = *str;
           buff[i] = '\0';
#if NEW_GETTOKEN
           if (findvarindx(buff) >= 0) {
              return INTID;
           }
           else {
              return str[1] == '(' ? DIMINTID : INTID;
           }
#else
           return str[1] == '(' ? DIMINTID : INTID;
#endif
         case '$':
           buff[i++] = *str;
           buff[i] = '\0';
#if NEW_GETTOKEN
           if (findvarindx(buff) >= 0) {
              return STRID;
           }
           else {
              return str[1] == '(' ? DIMSTRID : STRID;
           }
#else
           return str[1] == '(' ? DIMSTRID : STRID;
#endif
         case '!':
         case '#':
           buff[i++] = *str;
           buff[i] = '\0';
#if NEW_GETTOKEN
           if (findvarindx(buff) >= 0) {
              return FLTID;
           }
           else {
              return str[1] == '(' ? DIMFLTID : FLTID;
           }
#else
           return str[1] == '(' ? DIMFLTID : FLTID;
#endif
         case '(':
           buff[i] = '\0';
           return deftype[typechar - 'A'] - INTID + DIMINTID;
         default:
           return deftype[typechar - 'A'];
       }
    }

    return TOKERR;
  } 
}

/*
 * get the length of the token at the current index and offset.
 * Returns: length of the token, or 0 for EOS to prevent
 *          it being read past.
 */
static int tokenlen(void)
{
  int     len = 0;
  unsigned char buff[MAXID + 1];
  RVALUE  val;
  const unsigned char *str;

  if ((context == NULL) && (str = lines[current_indx].tok) != NULL) {
     // use tokenized line if there is one, and we are not in
     // the context of a user-defined function
     switch (token) {

       case EOS:
       case EOL:               
       case TOKERR:
         return 0;

       case VALUE:
         len = getvalue(&val);
         return len;

       case INTID:
       case STRID:
       case FLTID:
       case DIMINTID:
       case DIMSTRID:
       case DIMFLTID:
         len = getid(buff);
         return len;

       case VAR_INT:
       case VAR_FLT:
       case VAR_STR:
       case VAR_DIMINT:
       case VAR_DIMFLT:
       case VAR_DIMSTR:
       case ARG_INT:
       case ARG_FLT:
       case ARG_STR:
       case ARG_DIMINT:
       case ARG_DIMFLT:
       case ARG_DIMSTR:
         return 2;

       default:
         return 1;

     }
  }
  
  // untokenized line
  switch (token) {

    case EOS:
    case TOKERR:
      return 0;

/*      
    case E:
*/      
    case EOL:
    case ';':
    case ':':
    case '\'':
    case '?':
    case '^':
    case '\\':
    case '/':
    case '*':
    case '(':
    case ')':
    case '+':
    case '-':
    case ',':
    case '"':
    case '=':
    case '#':
    case '<':
    case '>':
      return 1;
     
    case ON:
    case IF:
    case PI:
    case NEQ:
    case LTE:
    case GTE:
    case OR:
    case TO:
    case AS:
      return 2;

    case SIN:
    case COS:
    case TAN:
    case LOG:
    case POW:
    case SQR:
    case LET:
    case DIM:
    case AND:
    case REM:
    case FOR:
    case MOD:
    case ABS:
    case LEN:
    case ASC:
    case ATN:
    case INT:
    case RND:
    case VAL:
    case SPC:
    case TAB:
    case END:
    case DEF:
    case NOT:
    case XOR:
    case EQV:
    case IMP:
    case ERR:
    case FRE:
    case FIX:
    case CLS:
    case POS:
    case ERL:
    case SGN:
    case EXP:
    case GET:
    case PUT:
    case CVI:
    case CVS:
    case CVD:
    case LOF:
    case LOC:
    case xEOF:
    case USR:
      return 3;

    case NEXT:
    case STEP:
    case ASIN:
    case ACOS:
    case ATAN:
    case THEN:
    case GOTO:
    case READ:
    case DATA:
    case STOP:
    case ELSE:
    case BASE:
    case WEND:
    case PEEK:
    case POKE:
    case LINE:
    case CINT:
    case CSNG:
    case CDBL:
    case SWAP:
    case TRON:
    case BEEP:
    case OPEN:
    case LSET:
    case RSET:
    case LOCK:
    case CALL:
    case HEXSTRING:
    case CHRSTRING:
    case STRSTRING:
    case MIDSTRING:
    case OCTSTRING:
    case MKDSTRING:
    case MKISTRING:
    case MKSSTRING:
      return 4;

    case PRINT:
    case INPUT:
    case INSTR:
    case GOSUB:
    case WHILE:
    case USING:
    case WIDTH:
    case CLEAR:
    case TIMER:
    case TROFF:
    case ERASE:
    case ERROR:
    case CLOSE:
    case WRITE:
    case FIELD:
    case LEFTSTRING:
    case DATESTRING:
    case TIMESTRING:
      return 5;

    case OPTION:
    case VALLEN:
    case RETURN:
    case DEFINT:
    case DEFSNG:
    case DEFDBL:
    case DEFSTR:
    case OUTPUT:
    case APPEND:
    case RANDOM:
    case RESUME:
    case UNLOCK:
    case SHARED:
    case ACCESS:
    case VARPTR:
    case RIGHTSTRING:
    case INKEYSTRING:
    case INPUTSTRING:
    case SPACESTRING:
      return 6;

    case RESTORE:
    case STRINGSTRING:
    case VARPTRSTRING:
      return 7;

    case RANDOMIZE:
      return 9;

    case VALUE:
      len = getvalue(&val);
      return len;
    case DIMINTID:
    case DIMSTRID:
    case DIMFLTID:
    case INTID:
    case STRID:
    case FLTID:
      len = getid(buff);
      return len;

    default:
      seterror(ERR_INTERNAL);
#if DEBUG      
      str = lines[current_indx].str;
      printf("token = %d, but str = %s\n", token, str);
#endif      
      return 0;
  }
}


/*
 * is_eol - test if a token represents an end of line condition
 * Params: token - token to test
 * Returns: 1 if token is EOL, EOS, '\n' or COLON, else 0
 */
static int is_eol(int token) {
  return ((token == EOL)
  ||      (token == '\n')
  ||      (token == EOS)
  ||      (token == ':'));
}


/*
 * is_string - test if a token represents a string expression
 * Params: token - token to test
 * Returns: 1 if a string, else 0
 */
static int is_string(int token) {
  int indx;

  switch (token) {
     case '"':
     case STRID:
     case DIMSTRID:
     case CHRSTRING:
     case STRSTRING:
     case LEFTSTRING:
     case RIGHTSTRING:
     case MIDSTRING:
     case STRINGSTRING:
     case HEXSTRING:
     case OCTSTRING:   
     case DATESTRING:   
     case TIMESTRING:
     case SPACESTRING:
     case INKEYSTRING:
     case INPUTSTRING:
     case MKSSTRING:
     case MKISTRING:
     case MKDSTRING:
     case VAR_STR:
     case VAR_DIMSTR:
        return 1;
     default:
        break;
  }
  return 0;
}


/*
 * get a pointer to the current position in the line (tokenized or untokenized)
 */
static unsigned char *getcurrentpos(void) {
   unsigned char *str;

   if ((context != NULL) || (str = lines[current_indx].tok) == NULL) {
     // use untokenized line we are in the context of a user-defined 
     // function, or there is no tokenized line
      str = lines[current_indx].str;
   }

   return (str + current_offs);
}


/*
 * get a line index (if the line has been tokenized)
 * Params: val - pointer to rvalue to return
 * Retuns: len - chars read (0 if not an index, or if line not tokenized)
 */
static int getlineindex(RVALUE *val)
{
  unsigned char *str, *str2;
  int len;

  if ((context == NULL) && (str = lines[current_indx].tok) != NULL) {
     // use tokenized line if there is one, and we are not in
     // the context of a user-defined function
     str += current_offs + 1;
     // get type (and increment str)
     val->type = *str++;
     // long align str
     str2 = (unsigned char *)((unsigned long)(str + 3) & ~0x3); 
     val->val = *(UVALUE *)str2;
     len = str2 + sizeof(UVALUE) - str + 1;
#if DEBUG
     printf("len = %d, str = %d, str2 = %d, sizeof = %d\n", len, str, str2, sizeof(UVALUE));
#endif
     if (val->type == LINE) {
        return len;
     }
  }
  return 0;
}


/*
 * get a numerical value from the parse string
 * Params: val - pointer to rvalue to return
 * Retuns: len - chars read
 */
static int getvalue(RVALUE *val)
{
  unsigned char *start;
  unsigned char *end;
  unsigned char *str, *str2;
  int minus;
  int overflow;
  long temp;
  int len;
  long addr;

  if ((context == NULL) && (str = lines[current_indx].tok) != NULL) {
     // use tokenized line if there is one, and we are not in
     // the context of a user-defined function
     str += current_offs;
     if (*str == VALUE) {
        // found tokenized value, so get type
        val->type = *(str + 1);
        if ((val->type >= 0) && (val->type <= 127)) {
           // small integer values (-64 .. +63) are stored directly
           val->val.ival = (int)val->type - 64;
           val->type = INTID;
           return 2;
        }
        else {
           // long align str
           addr = ((unsigned long)(str + 5) & ~0x3);
           str2 = (unsigned char *)addr; 
           val->val = *(UVALUE *)str2;
           len = str2 + sizeof(UVALUE) - str;
#if DEBUG
           printf("len = %d, str = %d, str2 = %d, sizeof = %d\n", len, str, str2, sizeof(UVALUE));
#endif
           return len;
        }
     }
  }
  else {
     // use non-tokenized line
     str = lines[current_indx].str + current_offs;
     // in non-:tokenized lines, there may be extraneous spaces
     while (space_or_tab(*str)) {
        //current_offs++;  
        str++;
     }
  }

  // read an untokenized value, either from a tokenized line, or from
  // an untokenized line
  start = str;

  if (*str == '&') {
     val->type = INTID;
     if ((str[1] == 'H') || (str[1] == 'h')) {
        str += 2;
        val->val.ival = mystrtoll((const char *)str, (char **)&end, 16);
     }
     else if ((str[1] == 'O') || (str[1] == 'o')) {
        str += 2;
        val->val.ival = mystrtoll((const char *)str, (char **)&end, 8);
     }
     else {
        str ++;
        val->val.ival = mystrtoll((const char *)str, (char **)&end, 8);
     }
  }
  else {
     temp = 0;
     minus = 0;
     overflow = 0;
     if (*str == '+') {
        str++;
     }
     else if (*str == '-') {
        minus = 1;
        str++;
     }
     while (digit(*str)) {
        //debug("found digit %c\n", *str);
        if (temp > INT_MAX/10) {
           overflow = 1;
        }
        else {
           temp = (temp<<3) + (temp<<1) + (*str - '0');
           //debug("temp=%d\n", temp);
        }
        str++;
     }
     if ((*str != '.') && (*str != '!') && (*str != '#') && !overflow) {
        //debug("found int-digit '%c'\n", *str);
        val->type = INTID;
        val->val.ival = (minus ? -temp : temp);
        end = str;
     }
     else {
        //debug("found real-digit '%c'\n", *str);
        val->type = FLTID;
        val->val.dval = strtod((const char *)start, (char **)&end);
        if ((*str == '!') || (*str == '#')) {
           str++;
        }
     }
  }
  if (end == start) {
    seterror(ERR_SYNTAX);
  }     
  len = end - start;
  //debug("type=%d,ival=%d, dval=%g, len=%d\n", val->type, val->val.ival, val->val.dval, len);
  return (len);
}


/*
 * replace a numerical value (in the tokenized string only)
 * Params: val - value to put
 */
static void putvalue(RVALUE val)
{
  unsigned char *str, *str2;
  unsigned long addr;

  // we can only do this to tokenized lines
  if ((str = lines[current_indx].tok) != NULL) {
     str += current_offs + 1;
     *str++ = val.type;
     // long align (and zero fill)
     addr = ((unsigned long)(str + 3) & ~0x3);
     str2 = (unsigned char *)addr; 
     while (str < str2) {
        *str++ = 0;
     }
     *((UVALUE *)str) = val.val;
  }
}


/*
 * get a numerical value from a string
 * Params: str - pointer to string
 * returns: the value parsed (as an RVALUE)
 *          updates len to be the number of characters parsed
 */
static RVALUE getstringvalue(unsigned char *str, int *len)
{
  unsigned char *start;
  unsigned char *end;
  int minus;
  int overflow;
  long temp;
  RVALUE rvalue;

  while (space_or_tab(*str)) {
     str++;
  }

  start = str;

  if (*str == '&') {
     rvalue.type = INTID;
     if ((str[1] == 'H') || (str[1] == 'h')) {
        str += 2;
        rvalue.val.ival = mystrtoll((char *)str, (char **)&end, 16);
     }
     else if ((str[1] == 'O') || (str[1] == 'o')) {
        str += 2;
        rvalue.val.ival = mystrtoll((char *)str, (char **)&end, 8);
     }
     else {
        str ++;
        rvalue.val.ival = mystrtoll((char *)str, (char **)&end, 8);
     }
     end = str;
  }
  else {
     temp = 0;
     minus = 0;
     overflow = 0;
     if (*str == '+') {
        str++;
     }
     else if (*str == '-') {
        minus = 1;
        str++;
     }
     while (digit(*str)) {
        //debug("found digit %c\n", *str);
        if (temp > INT_MAX/10) {
           overflow = 1;
        }
        else {
           temp = (temp<<3) + (temp<<1) + (*str - '0');
           //debug("temp=%d\n", temp);
        }
        str++;
     }
     if ((*str != '.') && (*str != '!') && (*str != '#') && !overflow) {
        //debug("found int-digit '%c'\n", *str);
        rvalue.type = INTID;
        rvalue.val.ival = (minus ? -temp : temp);
        end = str;
     }
     else {
        //debug("found real-digit '%c'\n", *str);
        rvalue.type = FLTID;
        rvalue.val.dval = strtod((char *)start, (char **)&end);
        if ((*str == '!') || (*str == '#')) {
           str++;
        }
        end = str;
     }
  }
  *len = end - start;
  if (end == start) {
    seterror(ERR_SYNTAX);
  }     
  //debug("type=%d,ival=%d, dval=%g\n", rvalue.type, rvalue.val.ival, rvalue.val.dval);
  return rvalue;
}    


/*
 * getid - get an id from the current index and offset:
 * Params: out - id output [MAXID chars max ]
 * Returns: length of id
 * Notes: Triggers an error if id > MAX_NAME chars
 *        The id includes any qualifiers - $ ! # (
 */
static int getid(unsigned char *out)
{
  int nread = 0;
  unsigned char *str;

  if ((context == NULL) && (str = lines[current_indx].tok) != NULL) {
     // use tokenized line if there is one, and we are not in
     // the context of a user-defined function
     str += current_offs;
  }
  else {
     // use non-tokenized line
     str = lines[current_indx].str + current_offs;
     // in non-tokenized lines, there may be extraneous spaces
     while (space_or_tab(*str)) {
        current_offs++;  
        str++;
     }
  }

  if (!alpha(*str)) {
     seterror(ERR_SYNTAX);
  }
  while (alnum(*str)) {
    if (nread < MAXID) {
      out[nread++] = *str;
      str++;
    }
    else {
      seterror(ERR_IDTOOLONG);
      break;
    }
  }
  if ((*str == '%') || (*str == '!') || (*str == '#') || (*str == '$')) {
    if (nread < MAXID) {
      out[nread++] = *str;
      str++;
    }
    else {
      seterror(ERR_IDTOOLONG);
    }
  }
  if (*str == '(') {
    if (nread < MAXID) {
      out[nread++] = *str;
      str++;
    }
    else {
      seterror(ERR_IDTOOLONG);
    }
  }
  out[nread] = 0;
#if DEBUG
  {
     int i;
     printf("found ");
     for (i = 0; i < nread; i++) {
        printf("%c", out[i]);
     }
     printf(" len = %d\n",nread);
  }
#endif
  return (nread);
}


/*
 * mystrgrablit - grab a literal from the parse string.
 * Params: dest - destination string
 *         src - source string
 * Notes: strings are in quotes, double quotes the escape
 */
static void mystrgrablit(unsigned char *dest, unsigned char *src)
{
  assert(*src == '"');
  src++;
  
  while (*src) {
     if (*src == '"') {
       if (src[1] == '"') {
          *dest++ = *src;
          src++;
          src++;
       }
       else {
          break;
       }
     }
     else {
        *dest++ = *src++;
     }
  }
  *dest++ = 0;
}


/*
 * mystrend - find where a source string literal ends (tokenized or untokenized)
 * Params: src - string to check (must point to quote)
 *         quote - character to use for quotation
 * Returns: pointer to quote which ends string
 * Notes: quotes escape quotes
 */
static unsigned char *mystrend(unsigned char *str, char quote) {

  while (space_or_tab(*str)) {
     current_offs++;
     str++;
  }

  if (*str != quote) {
     seterror(ERR_SYNTAX);
     return 0;     
  }
  str++;

  while (*str) {
    while (*str != quote) {
      if (*str == '\n' || *str == '\0') {
         seterror(ERR_UNTERMINATED);
         return 0;
      }
      str++;
    }
    if (str[1] == quote) {
      str += 2;
    }
    else {
      break;
    }
  }
  if (*str != quote) {
     seterror(ERR_UNTERMINATED);
     return 0;
  }
  return str;
}


/*
 * linecount - Fast Count of the number of lines in a string.
 * Params: str - string to check
 * Returns: no of line terminators in str. 
 * 
 * Note: This routine is designed to be fast, but because we now include 
 * colons as line terminators, this routine may count too many lines (e.g. 
 * it will include any colons in strings and comments. This means we may 
 * 'malloc' too much memory to hold the lines - but other than that, this 
 * will not cause any other problems.
 *
 */
static int linecount(unsigned char *str) {
  int lines = 0;
  int chars = 0;
  unsigned char c;

  while ((c = *str)) {
    chars++;  
    if ((c == '\n') || (c == ':')) {
       lines++;
    }
    else if ((c < 0x20) || (c > 0x7F)) {
       fprintf(fperr, "Invalid character (hex %2X) in script position %d\n",
          c, chars);
       return 0;
    }    
    str++;
  }
#if DEBUG
  printf("counted %d lines\n",lines);
#endif  
  return lines;
}


/*
 * mystrdup - duplicate a string.
 * Params: str - string to duplicate
 * Returns: malloced duplicate.
 */
static unsigned char *mystrdup(unsigned char *str)
{
  unsigned char *answer;

  answer = malloc(strlen((char *)str) + 1);
  if (answer) {
    strcpy((char *)answer, (char *)str);
  }

  return answer;
}


/*
 * mystrndup - duplicate a string of n chars.
 * Params: str - string to duplicate
 * Returns: malloced duplicate.
 */
static unsigned char *mystrndup(unsigned char *str, int n)
{
  unsigned char *answer;
  int  i;

  answer = malloc(n);
  if (answer) {
     for ( i = 0; i < n; i++) {
        answer[i] = str[i];
     }
  }

  return answer;
}


/*
 * mystrcat - concatenate two strings.
 * Params: str - firsts string
 *         cat - second string
 * Returns: malloced string.
 */
static unsigned char *mystrconcat(unsigned char *str, unsigned char *cat)
{
  int len;
  unsigned char *answer;

  len = strlen((char *)str) + strlen((char *)cat);
  answer = malloc(len + 1);
  if (answer)
  {
    strcpy((char *)answer, (char *)str);
    strcat((char *)answer, (char *)cat);
  }
  return answer;
}


/*
 * factorial - compute x!  
 */
static float factorial(float x)
{
  float answer = 1.0;
  float t;

  if ( x > 1000.0) {
    x = 1000.0;
  }
  for (t = 1; t <= x; t += 1.0) {
     answer *= t;
  }
  return answer;
}

// mystrtoll - catalina needs a simple strtoll equivalent. It only needs
//           to support base 8 and 16, otherwise we just use strtol
static long mystrtoll(const char *str, char **end, int base) {
   long result = 0;
   int  neg = 0;
   while (isspace(*str)) {
      str++;
   }
   if (*str == '+') {
      str++;
   }
   if (*str == '-') {
      str++;
      neg = 1;
   }
   if (base == 8) {
      while ((*str >= '0') && (*str <= '7')) {
         result = (result<<3) + (*str - '0');
         str++;
      }
      *end = (char *)str;
   }
   else if (base == 16) {
      while (isxdigit(*str)) {
         if ((*str >= '0') && (*str <= '9')) {
            result = (result<<4) + (*str - '0');
         }
         else {
            result = (result<<4) + (toupper(*str) -'A' + 10);
         }
         str++;
      }
      *end = (char *)str;
   }
   else { 
      result = strtol(str, end, base);
   }
   if (neg) {
      result = -result;
   }
   return result;
}

