#include "ptoc.h"

/*$c+,t-,d-,l-*/
/*******************************************************************************
*                                                                              *
*                     Portable Pascal assembler/interpreter                    *
*                     *************************************                    *
*                                                                              *
*                                 Pascal P5                                    *
*                                                                              *
*                                 ETH May 76                                   *
*                                                                              *
* Authors:                                                                     *
*    Urs Ammann                                                                *
*    Kesav Nori                                                                *
*    Christian Jacobi                                                          *
*    K. Jensen                                                                 *
*    N. Wirth                                                                  *
*                                                                              *
*    Address:                                                                  *
*       Institut Fuer Informatik                                               *
*       Eidg. Technische Hochschule                                            *
*       CH-8096 Zuerich                                                        *
*                                                                              *
*  This code is fully documented in the book                                   *
*        "Pascal Implementation"                                               *
*   by Steven Pemberton and Martin Daniels                                     *
* published by Ellis Horwood, Chichester, UK                                   *
*         ISBN: 0-13-653-0311                                                  *
*       (also available in Japanese)                                           *
*                                                                              *
* Steven Pemberton, CWI/AA,                                                    *
* Kruislaan 413, 1098 SJ Amsterdam, NL                                         *
* Steven.Pemberton@cwi.nl                                                      *
*                                                                              *
* Adaption from P4 to P5 by:                                                   *
*                                                                              *
*    Scott A. Moore                                                            *
*    samiam@moorecad.com                                                       *
*                                                                              *
*    The comments marked with brackets are mine [sam]                          *
*                                                                              *
* P5 is an extended version of P4 with the following goals:                    *
*                                                                              *
* 1. The remaining unimplemented functions of Pascal are implemented, so that  *
*    P5 is no longer a "subset" of full Pascal. This was done because it is    *
*    no longer necessary to produce a minimum size implementation, and it      *
*    allows any standard program to be used with P5.                           *
*                                                                              *
* 2. The P5 compiler is brought up to ISO 7185 level 0 standards, both in the  *
*    language it compiles for, and the language it is implemented in.          *
*                                                                              *
* 3. The internal storage efficiency is increased. For example, character      *
*    strings no longer take as much space per character as integers and other  *
*    data. Sets are placed in their own space so that the minimum stack size   *
*    not determined by set size.                                               *
*                                                                              *
* 4. The remaining limitations and dependencies on the CDC 6000 version are    *
*    removed. For example, the instruction store no longer is packed 2         *
*    instructions to a 60 bit word.                                            *
*                                                                              *
* 5. General clean up. Longstanding bugs and issues are addressed. Constants   *
*    that were buried in the source (magic numbers) were made constants. The   *
*    type 'alpha' (specific to CDC 6000) was replaced with idstr, etc.         *
*                                                                              *
* The idea of P5 is to obtain a compiler that is ISO 7185 compliant, can       *
* compile itself, can compile any reasonable standard program, and is          *
* efficient enough to be used as a normal compiler for some certain uses.      *
* Finally, it can serve as a starting implementation for native compilers.     *
*                                                                              *
* P5 machine instructions added:                                               *
*                                                                              *
* rnd    round:   expects a float on stack, performs round() and places the    *
*                 result back on the stack as an integer.                      *
*                                                                              *
* pck ln pack:    Expects a packed array on stack top, followed by the         *
*                 starting subscript, then the unpacked array. The parameter   *
*                 contains the length of packed array in elements. Performs    *
*                 pack(upa, ss, pa) and removes all from stack. The starting   *
*                 subscript is zero based and scaled to the element size.      *
*                                                                              *
* upk ln pack:    Expects the starting subscript on stack top, followed by the *
*                 unpacked array, then the packed array. The parameter         *
*                 contains the length of packed array in elements. Performs    *
*                 unpack(pa, upa, ss) and removes all from stack. The starting *
*                 subscript is zero based and scaled to the element size.      *
*                                                                              *
* rgs    set rng: Expects a set range specification on stack, with the last    *
*                 value on the top, and the first value next. The two values   *
*                 are replaced with a set with all of the values between and   *
*                 including the first and last values.                         *
*                                                                              *
* fbv ad buf val: Validates a file buffer variable. Expects a file address on  *
*                 stack. The buffer is "validated" for lazy I/O, which means   *
*                 that if the associated file is in read mode, the delayed     *
*                 read to the buffer variable occurs. The file address remains *
*                 on the stack.                                                *
*                                                                              *
* ipj v l ip jmp: Interprocedure jump. Contains the level of the target        *
*                 procedure, and the label to jump to. The stack is adjusted   *
*                 to remove all nested procedures/functions, then the label is *
*                 unconditionally jumped to.                                   *        
*                                                                              *
* cip p           Call indirect procedure/function. The top of stack has the   *
*                 address of a mp/address pair pushed by lpa. The dl of the    *
*                 current mark is replaced by the mp, and the address replaces *
*                 the current pc. The mp/ad address is removed from stack.     *
*                                                                              *
* lpa p l q       Load procedure address. The current mark pointer is loaded   *
*                 onto the stack, followed by the target procedure or function *
*                 address. This puts enough information on the stack to call   *
*                 it with the callers environment.                             *
*                                                                              *
* lip p q         load procedure function address. Loads a mark/address pair   *
*                 for a procedure or function parameter onto the stack. Used   *
*                 to pass a procedure or function parameter to another         *
*                 procedure or function.                                       *
*                                                                              *
* efb    eof:     Find eof for binary file. The top of stack is a logical file *
*                 number. The eof boolean vale replaces it.                    *
*                                                                              *
* fvb ad buf val: Expects the length of the file buffer on stack, and the file *
*                 address under that. The buffer is "validated" for lazy I/O,  *
*                 which means that if the associated file is in read mode, the *
*                 delayed read to the buffer variable occurs. The buffer       *
*                 length is removed only.                                      *
*                                                                              *
* dmp q           Subtracts the value from the stack top. Used to dump the top *
*                 of the stack.                                                *
*                                                                              *
* swp q           Pulls the second on stack to the top, swapping the top to    *
*                 elements. The size of the second on stack is specified, but  *
*                 the top of the on stack is implied as a pointer.             *
*                                                                              *
* tjp q           Expects a boolean on stack. Jumps to the address if the      *
*                 value is true. Removes the value from the stack.             *
*                                                                              *
* P5 machine built in procedures/functions added:                              *
*                                                                              *
* pag    page:    Expects a logical file number on stack top. Performs page(). *
*                                                                              *
* rsf    reset:   Expects a logical file number on stack top. Performs         *
*                 reset() and sets the file to text mode.                      *
*                                                                              *
* rwf    rewrite: Expects a logical file number on stack top. Performs         *
*                 reset() and sets the file to text mode.                      *
*                                                                              *
* wrb    write:   Expects a field number on stack top, followed by a boolean   *
*                 to print, then the logical file number. The boolean is       *
*                 output as per ISO 7185.                                      *
*                                                                              *
* rgs    set rng: Expects a set range specification on stack, with the last    *
*                 value on the top, and the first value next. The two values   *
*                 are replaced with a set with all of the values between and   *
*                 including the first and last values.                         *
*                                                                              *
* wrf    write:   Expects a logical file number on stack top, followed by a    *
*                 field number, then a fraction, then a real to print. The     *
*                 real is output in r:f:f (fraction) format. All but the file  *
*                 are removed from stack.                                      *
*                                                                              *
* wbf    write:   Expects a file address on stack top, followed by the length  *
*                 of the type to write, then the variable address to write     *
*                 from. Writes binary store to the file.                       *
*                                                                              *
* wbi    write:   Expects a file address on stack top, followed by an integer. *
*                 Writes the integer to the file in binary format.             *
*                                                                              *
* wbr    write:   Expects a file address on stack top, followed by a real.     *
*                 Writes the real to the file in binary format.                *
*                                                                              *
* wbc    write:   Expects a file address on stack top, followed by a           *
*                 character. Writes the character to the file in binary        *
*                 format.                                                      *
*                                                                              *
* wbb    write:   Expects a file address on stack top, followed by a boolean.  *
*                 Writes the boolean to the file in binary format.             *
*                                                                              *
* rbf    read:    Expects a file address on stack top, followed by the length  *
*                 of the type to read, then the variable address to read       *
*                 from. Reads binary store from the file.                      *
*                                                                              *
* rsb    reset:   Expects a logical file number on stack top. Performs         *
*                 reset() and sets the file to binary mode.                    *
*                                                                              *
* rwb    rewrite: Expects a logical file number on stack top. Performs         *
*                 reset() and sets the file to binary mode.                    *
*                                                                              *
* gbf    get:     Get file binary. Expects the length of a file element on     *
*                 stack top, followed by a pointer to the file. The next file  *
*                 element is loaded to the file buffer.                        *
*                                                                              *
* pbf    put:     Put file binary. Expects the length of a file element on     *
*                 stack top, followed by a pointer to the file. Writes the     *
*                 file buffer to thr file.                                     *
*                                                                              *
* Note that the previous version of P4 added some type specified instructions  *
* that used to be unified, typeless instructions.                              *
*                                                                              *
* P5 errors added:                                                             *
*                                                                              *
* 182 identifier too long                                                      *
* 183 For index variable must be local to this block                           *
* 184 Interprocedure goto does not reference outter block of destination       *
* 185 Goto references deeper nested statement                                  *
* 186 Label referenced by goto at lesser statement level                       *
* 187 Goto references label in different nested statement                      *
* 188 Label referenced by goto in different nested statement                   *
* 189 Parameter lists of formal and actual parameters not congruous.           *
*                                                                              *
* P5 instructions modified:                                                    *
*                                                                              *
* lca'string'       '                                                          *
*                                                                              *
* was changed to                                                               *
*                                                                              *
* lca 'string'''                                                               *
*                                                                              *
* That is, lca has a space before the opening quote, no longer pads to the     *
* right, and represents single quotes with a quote image. pint converts quote  *
* images back to single quotes, and pads out strings to their full length.     *
*                                                                              *
* In addition, the way files work was extensively modified. Original P5 could  *
* not represent files as full1y expressed variables, such as within an array   *
* or record, and were effectively treated as constants. To treat them as true  *
* variable accesses, the stacking order of the file in all file subroutines    *
* was changed so that the file is on the bottom. This matches the source       *
* order of the file in write(f, ...) or read(f, ...). Also, the file           *
* operations now leave the file on the stack for the duration of a write or    *
* read, then dump them using a specific new instruction "dmp". This allows     *
* multiparameter writes and reads to be effectively a chain of single          *
* operations using one file reference. Finally, files were tied to the type    *
* ending 'a', because files are now full variable references.                  *
*                                                                              *
*******************************************************************************/



          /* terminate immediately */

/*

   Program object sizes and characteristics, sync with pint. These define
   the machine specific characteristics of the target. 
   
   This configuration is for a 32 bit machine as follows:

   integer               32  bits
   real                  64  bits
   char                  8   bits
   boolean               8   bits
   set                   256 bits
   pointers              32  bits
   marks                 32  bits
   File logical number   8   bits

   Both endian types are supported. There is no alignment needed, but you
   may wish to use alignment to tune the runtime speed.

   The machine characteristics dependent on byte accessable machines. This
   table is all you should need to adapt to any byte addressable machine.

   */

enum { intsize = 4,      /* size of integer */
intal = 4,               /* memory alignment of integer */
realsize = 8,            /* size of real */
realal = 4,              /* memory alignment of real */
charsize = 1,            /* size of char */
charal = 1,              /* memory alignment of char */
charmax = 1,
boolsize = 1,            /* size of boolean */
boolal = 1,              /* alignment of boolean */
ptrsize = 4,             /* size of pointer */
adrsize = 4,             /* size of address */
adral = 4,               /* alignment of address */
setsize = 32,            /* size of set */
setal = 1,               /* alignment of set */
filesize = 2,            /* required runtime space for file (lfn+buf) */
fileidsize = 1,          /* size of the lfn only */
stackal = 4,             /* alignment of stack */
stackelsize = 4,         /* stack element size */
maxsize = 32,            /* this is the largest type that can be on the stack */
heapal = 4,              /* alignment for each heap arena */
sethigh = 255,           /* Sets are 256 values */
setlow = 0,
ordmaxchar = 255,        /* Characters are 8 bit ISO/IEC 8859-1 */
ordminchar = 0,
maxresult = realsize,    /* maximum size of function result */
marksize = 32,           /* maxresult+6*ptrsize */
/* Value of nil is 1 because this allows checks for pointers that were
     initialized, which would be zero (since we clear all space to zero).
     In the new unified code/data space scheme, 0 and 1 are always invalid
     addresses, since the startup code is at least that long. */
nilval = 1,              /* value of 'nil' */

/* end of pcom and pint common parameters */

displimit = 20,
maxlevel = 15,
/* strglgth used to define the size of all strings in pcom and pint. With the
     string quanta system, string lengths are effectively unlimited, but there
     it still sets the size of some buffers in pcom. */
strglgth = 250,
/* lcaftermarkstack is a very pcom specific way of stating the size of a mark
     in pint. However, it is used frequently in Perberton's documentation, so I
     left it, but equated it to the more portable marksize. */
lcaftermarkstack = marksize,
fileal = charal,
/* stackelsize = minimum size for 1 stackelement
                  = k*stackal
      stackal     = scm(all other al-constants)
      charmax     = scm(charsize,charal)
                    scm = smallest common multiple
      lcaftermarkstack >= maxresult+3*ptrsize+max(x-size)
                        = k1*stackelsize          */
maxstack = 1,
parmal = stackal,
parmsize = stackelsize,
recal = stackal,
filebuffer = 4,       /* number of system defined files */
maxaddr = maxint,
maxsp = 39,       /* number of standard procedures/functions */
maxins = 74,      /* maximum number of instructions */
maxids = 250,     /* maximum characters in id string (basically, a full line) */
maxstd = 39,      /* number of standard identifiers */
maxres = 35,      /* number of reserved words */
reslen = 9,       /* maximum length of reserved words */
varsqt = 10,      /* variable string quanta */
prtlln = 10,      /* number of label characters to print in dumps */

/* default field sizes for write */
intdeff = 11,    /* default field length for integer */
reldeff = 22,    /* default field length for real */
chrdeff = 1,     /* default field length for char (usually 1) */
boldeff = 5,     /* default field length for boolean (usually 5 for 'false' */

/* debug flags */

dodmplex = false,   /* dump lexical */
doprtryc = false,   /* dump recycling tracker counts */

/* version numbers */

majorver = 0,   /* major version number */
minorver = 8};     /* minor version number */

                                                       /*describing:*/
                                                       /*************/

/*marktype= ^integer;*/
                                                       /*basic symbols*/
                                                       /***************/

typedef enum {ident,intconst,realconst,stringconst,notsy,mulop,addop,relop,
          lparent,rparent,lbrack,rbrack,comma,semicolon,period,arrow,
          colon,becomes,range_,labelsy,constsy,typesy,varsy,funcsy,progsy,
          procsy,setsy,packedsy,arraysy,recordsy,filesy,beginsy,ifsy,
          casesy,repeatsy,whilesy,forsy,withsy,gotosy,endsy,elsesy,untilsy,
          ofsy,dosy,tosy,downtosy,thensy,nilsy,othersy, last_symbol} symbol;
typedef enum {mul,rdiv,andop,idiv,imod,plus,minus,orop,ltop,leop,geop,gtop,
            neop,eqop,inop,noop, last_operator_} operator_;
typedef set setofsys;
typedef enum {letter,number,special,illegal,
        chstrquo,chcolon,chperiod,chlt,chgt,chlparen,chspace,chlcmt, last_chtp} chtp;
/* Here is the variable length string containment to save on space. strings
       strings are only stored in their length rounded to the nearest 10th. */
typedef struct strvs* strvsp; /* pointer to variable length id string */
typedef struct strvs { /* id string variable length */
            char str[varsqt];                        /* data contained */
            strvsp next;  /* next */
} strvs;

                                                       /*constants*/
                                                       /***********/
typedef set setty;
typedef enum {reel,pset,strg, last_cstclass} cstclass;
typedef struct constant* csp;
typedef struct constant {
                  csp next;  /* next entry link */
                  cstclass cclass;
                  union {
                    char rval[strglgth];
                    setty pval;
                    struct {unsigned char slgth; strvsp sval;} s_strg;
                  } u;
} constant;

typedef struct valu { boolean intval;
                      union {          /*intval never set nor tested*/
                integer ival;
                csp valp;
                      } u;
} valu;

                                                      /*data structures*/
                                                      /*****************/
typedef unsigned char levrange;
#define min_levrange 0
#define max_levrange maxlevel
                        typedef unsigned addrrange;
#define min_addrrange 0
#define max_addrrange maxaddr

typedef enum {scalar,subrange,pointer,power,arrays,records,files,
              tagfld,variant, last_structform} structform;
typedef enum {standard,declared, last_declkind} declkind;
typedef struct structure* stp; 
typedef struct identifier* ctp;

typedef struct structure {
              stp next;  /* next entry link */
              boolean marked;    /*for test phase only*/
              addrrange size;
              boolean packing;  /* packing status */
              structform form;
              union {
                struct {declkind scalkind;
                        union {
                             ctp fconst; 
                        } u;} s_scalar;
                struct {stp rangetype; valu min,max;} s_subrange;
                stp eltype;
                struct {stp elset; boolean matchpack;} s_power;
                struct {stp aeltype,inxtype;} s_arrays;
                struct {ctp fstfld; stp recvar; stp recyc;} s_records;
                stp filtype;
                struct {ctp tagfieldp; stp fstvar;} s_tagfld;
                struct {stp nxtvar,subvar; valu varval;} s_variant;
              } u;
} structure;

                                                       /*names*/
                                                       /*******/

typedef enum {types,konst,vars,field,proc,func, last_idclass} idclass;
typedef set setofids;
typedef enum {actual,formal, last_idkind} idkind;
typedef char idstr[maxids];
typedef char restr[reslen];
typedef struct identifier {
              strvsp name; ctp llink, rlink;
              stp idtype; ctp next; boolean keep;
              idclass klass;
              union {

                valu values;
                struct {idkind vkind; levrange vlev; addrrange vaddr;} s_vars;
                addrrange fldaddr;
                struct {addrrange pfaddr; ctp pflist;         /* param list */
                              declkind pfdeckind;
                              union {
                                    unsigned char key;
                         struct {levrange pflev; integer pfname;
                                     idkind pfkind;
                                     union {
                                      struct {boolean forwdecl, externl;} s_actual;

                                     } u;} s_declared;
                              } u;} s_proc;
              } u;
} identifier;


typedef unsigned char disprange;
#define min_disprange 0
#define max_disprange displimit

typedef enum {blck,crec,vrec,rec, last_where} where;

                                                       /*expressions*/
                                                       /*************/
typedef enum {cst,varbl,expr, last_attrkind} attrkind;
typedef enum {drct,indrct,inxd, last_vaccess} vaccess;

typedef struct attr { stp typtr;
         attrkind kind;
         union {
           valu cval;
           struct {vaccess access;
                   union {
                     struct {levrange vlevel; addrrange dplmt;} s_drct;
                     addrrange idplmt;

                   } u;} s_varbl;

         } u;
} attr;

                                                            /*labels*/
                                                            /********/
typedef struct labl* lbp;
typedef struct labl { /* 'goto' label */
              lbp nextlab;       /* next list link */
              boolean defined;   /* label defining point was seen */
              integer labval,            /* numeric value of label */
              labname;           /* internal sequental name of label */
              levrange vlevel;   /* procedure level of definition */
              integer slevel;    /* statement level of definition */
              boolean ipcref;    /* was referenced by another proc/func */
              integer minlvl;    /* minimum goto reference statement lvl */
              boolean bact;      /* containing block is active */
} labl;

/* external file tracking entries */
typedef struct filerec* extfilep;
typedef struct filerec { idstr filename; extfilep nextfile; } filerec;

/* case statement tracking entries */
typedef struct caseinfo* cip;

typedef struct caseinfo { cip next;
             integer csstart;
             integer cslab;
} caseinfo;

/*-------------------------------------------------------------------------*/

/* !!! remove this statement for self compile */    
/*elide*/text prr = VOID_FILE;/*noelide*/       /* output code file */

                         /*returned by source program scanner
                                     insymbol:
                                     **********/

symbol sy;                     /*last symbol*/
operator_ op;                   /*classification of last symbol*/
valu val;                      /*value of last constant*/
integer lgth;                  /*length of last string constant*/
idstr id;                      /*last identifier (possibly truncated)*/
unsigned char kk;                  /*nr of chars in last identifier*/
char ch;                       /*last character*/
boolean eol;                   /*end of line flag*/


                         /*counters:*/
                         /***********/

integer chcnt;                 /*character counter*/
addrrange lc,ic;               /*data location and instruction counter*/
integer linecount;


                         /*switches:*/
                         /***********/

boolean dp,                             /*declaration part*/
prterr,                         /*to allow forward references in pointer type
                                      declaration by suppressing error message*/
list,prcode,prtables;    /*output options for
                                        -- source program listing
                                        -- printing symbolic code
                                        -- displaying ident and struct tables
                                        --> procedure option*/
boolean debug;


                         /*pointers:*/
                         /***********/
stp parmptr,
intptr,realptr,charptr,
boolptr,nilptr,textptr;    /*pointers to entries of standard ids*/
ctp utypptr,ucstptr,uvarptr,
ufldptr,uprcptr,ufctptr,        /*pointers to entries for undeclared ids*/
fwptr;                     /*head of chain of forw decl type ids*/
ctp outputptr,inputptr;        /* pointers to default files */
extfilep fextfilep;            /*head of chain of external files*/

                         /*bookkeeping of declaration levels:*/
                         /************************************/

levrange level;                /*current static level*/
integer stalvl;                /* statement nesting level */
disprange disx,                           /*level of last id searched by searchid*/
top;                     /*top of display*/

struct A2 {               /*=blck:   id is variable id*/
ctp fname; lbp flabel;   /*=crec:   id is field id in record with*/
csp fconst; stp fstruct;
where occur;
union {                  /*   constant address*/
 struct {levrange clev;  /*=vrec:   id is field id in record with*/
       addrrange cdspl;} s_crec;/*   variable address*/
 addrrange vdspl;


} u;
} display[max_disprange-min_disprange+1]/*where:   means:*/;                      /* --> procedure withstatement*/


                         /*error messages:*/
                         /*****************/

unsigned char errinx;                  /*nr of errors in current source line*/
struct A1 { integer pos;
           unsigned short nmr;
} errlist[10];



                         /*expression compilation:*/
                         /*************************/

attr gattr;                    /*describes the expr currently compiled*/


                         /*structured constants:*/
                         /***********************/

setofsys constbegsys,simptypebegsys,typebegsys,blockbegsys,selectsys,facbegsys,
statbegsys,typedels;
chtp chartp[256];
restr rw[maxres/*nr. of res. words*/];
unsigned char frw[10]/*nr. of res. words + 1*/;
symbol rsy[maxres/*nr. of res. words*/];
symbol ssy[256];
operator_ rop[maxres/*nr. of res. words*/];
operator_ sop[256];
restr na[maxstd];
char mn[maxins-0+1][4];
char sna[maxsp][4];
signed char cdx[maxins-0+1];
signed char pdx[maxsp];
integer ordint[256];

integer intlabel,mxint10,digmax;
boolean inputhdf; /* 'input' appears in header files */
boolean outputhdf; /* 'output' appears in header files */
boolean errtbl[500];        /* error occrence tracking */
integer toterr; /* total errors in program */

/* Recycling tracking counters, used to check for new/dispose mismatches. */
integer strcnt; /* strings */
integer cspcnt; /* constants */
integer stpcnt; /* structures */
integer ctpcnt; /* identifiers */
integer tstcnt; /* test entries */
integer lbpcnt; /* label counts */
integer filcnt; /* file tracking counts */
integer cipcnt; /* case entry tracking counts */

integer i;
boolean f;

/*-------------------------------------------------------------------------*/

                           /* recycling controls */

/*-------------------------------------------------------------------------*/

  /* get string quanta */
  void getstr(strvsp* p)
  {
     *p = (strvs*)malloc(sizeof(strvs)); /* get new entry */
     strcnt = strcnt+1; /* count */
  }

  /* recycle string quanta list */
  void putstrs(strvsp p)
  {
      strvsp p1;

    while (p != nil)  {
      p1 = p; p = p->next; free(p1); strcnt = strcnt-1;
    }
  }

  /* get label entry */
  void getlab(lbp* p)
  {
     *p = (labl*)malloc(sizeof(labl)); /* get new entry */
     lbpcnt = lbpcnt+1; /* add to count */
  }

  /* recycle label entry */
  void putlab(lbp p)
  {
     free(p);    /* release entry */
     lbpcnt = lbpcnt-1; /* remove from count */
  }

  /* push constant entry to list */
  void pshcst(csp p)
  {
     /* push to constant list */
     p->next = display[top - min_disprange].fconst;
     display[top - min_disprange].fconst = p;
     cspcnt = cspcnt+1; /* count entries */
  }

  /* recycle constant entry */
  void putcst(csp p)
  {
     /* recycle string if present */
     if (p->cclass == strg)  putstrs(p->u.s_strg.sval);
     free(p);    /* release entry */
     cspcnt = cspcnt-1; /* remove from count */
  }

  /* push structure entry to list */
  void pshstc(stp p)
  {
     /* push to structures list */
     p->next = display[top - min_disprange].fstruct;
     display[top - min_disprange].fstruct = p;
     stpcnt = stpcnt+1; /* count entries */
  }

  /* recycle structure entry */
  void putstc(stp p)
  {
     free(p);    /* release entry */
     stpcnt = stpcnt-1;
  }

  /* initialize and register identifier entry */
  void ininam(ctp p)
  {
     ctpcnt = ctpcnt+1;  /* count entry */
     p->keep = false; /* clear keepme flag */
  }

  /* recycle identifier entry */
  void putnam(ctp p)
  {
      ctp p1;

     if ((p->klass == proc) || (p->klass == func)) 
        while (p->u.s_proc.pflist != nil)  {
        /* scavenge the parameter list */
        p1 = p->u.s_proc.pflist; p->u.s_proc.pflist = p1->next;
        putnam(p1); /* release */
     }
     putstrs(p->name); /* release name string */    
     free(p);    /* release entry */
     ctpcnt = ctpcnt-1; /* remove from count */
  }

  /* recycle identifier tree */
  void putnams(ctp p)
  {
    if (p != nil)  {
      putnams(p->llink); /* release left */
      putnams(p->rlink); /* release right */
      /* "keep" means it is a parameter and stays with it's procedure or
        function entry. */
      if (! p->keep)  putnam(p);    /* release the id entry */
    }
  }

  /* scrub display level */
  void putdsp(disprange l);

     /* release substructure */
static void putsub(stp p)
{
       stp p1;

   /* clear record recycle list if record */
   if (p->form == records)  {
      /* clear structure list */
      while (p->u.s_records.recyc != nil)  {
         /* remove top of list */
         p1 = p->u.s_records.recyc; p->u.s_records.recyc = p1->next;
         putsub(p1); /* release that element */
      }
      putnams(p->u.s_records.fstfld); /* clear id list */
   } else if (p->form == tagfld) 
      /* recycle anonymous tag fields */
      if (p->u.s_tagfld.tagfieldp->name == nil)  putnam(p->u.s_tagfld.tagfieldp);
   putstc(p); /* release head entry */
}

  void putdsp(disprange l)
  {
         lbp llp; csp lvp; stp lsp;
        /* putdsp */
    putnams(display[l - min_disprange].fname); /* dispose of identifier tree */
    /* dispose of label list */
    while (display[l - min_disprange].flabel != nil)  {
      llp = display[l - min_disprange].flabel; display[l - min_disprange].flabel = llp->nextlab; putlab(llp);
    }
    /* dispose of constant list */
    while (display[l - min_disprange].fconst != nil)  {
      lvp = display[l - min_disprange].fconst; display[l - min_disprange].fconst = lvp->next; putcst(lvp);
    }
    /* dispose of structure list */
    while (display[l - min_disprange].fstruct != nil)  {
      /* remove top from list */
      lsp = display[l - min_disprange].fstruct; display[l - min_disprange].fstruct = lsp->next; putsub(lsp);
    }
  }    /* putdsp */

  /* scrub all display levels until given */
  void putdsps(disprange l)
  {
      disprange t;

    if (l > top)  {
      cwrite("*** Error: Compiler internal error\n");
      goto L99;
    }
    t = top;
    while (t > l)  {
      putdsp(t); t = t-1;
    }
  }

  /* get external file entry */
  void getfil(extfilep* p)
  {
     *p = (filerec*)malloc(sizeof(filerec)); /* get new entry */
     filcnt = filcnt+1; /* count entry */
  }

  /* recycle external file entry */
  void putfil(extfilep p)
  {
     free(p);    /* release entry */
     filcnt = filcnt-1; /* count entry */
  }

  /* get case tracking entry */
  void getcas(cip* p)
  {
     *p = (caseinfo*)malloc(sizeof(caseinfo)); /* get new entry */
     cipcnt = cipcnt+1; /* count entry */
  }

  /* recycle case tracking entry */
  void putcas(cip p)
  {
     free(p);    /* release entry */
     cipcnt = cipcnt-1; /* count entry */
  }

/*-------------------------------------------------------------------------*/

                /* character and string quanta functions */

/*-------------------------------------------------------------------------*/

  /* find lower case of character */
  char lcase(char c)
  {
    char lcase_result;
    if (inset(c, setof(range('A','Z'), eos)))  c = chr(ord(c)-ord('A')+ord('a'));
    lcase_result = c;
    return lcase_result;
  }   /* lcase */

  /* convert string to lower case */
  void lcases(idstr s)
  {
      integer i;

    for( i = 1; i <= maxids; i ++) s[i-(1)] = lcase(s[i-(1)]);
  }

  /* find reserved word string equal to id string */
  boolean strequri(restr const a, idstr b)
  {
      boolean m; integer i;

    boolean strequri_result;
    m = true;
    for( i = 1; i <= reslen; i ++) if (lcase(a[i-(1)]) != lcase(b[i-(1)]))  m = false;
    for( i = reslen+1; i <= maxids; i ++) if (b[i-(1)] != ' ')  m = false;
    strequri_result = m;
    return strequri_result;
  }   /* equstr */

  /* write variable length id string to output */
  void writev(strvsp s, integer fl)
  {
      integer i; char c;
        i = 1;
    while (fl > 0)  {
      c = ' '; if (s != nil)  { c = s->str[i-(1)]; i = i+1; }
      cwrite("%c", c); fl = fl-1;
      if (i > varsqt)  { s = s->next; i = 1; }
    }
  }

  /* find padded length of variable length id string */
  integer lenpv(strvsp s)
  {
      integer i, l, lc;
        integer lenpv_result;
        l = 1; lc = 0;
    while (s != nil)  {
      for( i = 1; i <= varsqt; i ++) {
        if (s->str[i-(1)] != ' ')  lc = l;
        l = l+1;  /* count characters */
      }
      s = s->next;
    }
    lenpv_result = lc;
        return lenpv_result;
  }

  /* assign fixed to variable length string, including allocation */
  void strassvf(strvsp* a, idstr b)
  {
      integer i, j, l; strvsp p, lp;
        l = maxids; p = nil; *a = nil; j = 1;
    while ((l > 1) && (b[l-(1)] == ' '))  l = l-1; /* find length of fixed string */
    if (b[l-(1)] == ' ')  l = 0;
    for( i = 1; i <= l; i ++) {
      if (j > varsqt)  p = nil;
      if (p == nil)  { 
        getstr(&p); p->next = nil; j = 1; 
        if (*a == nil)  *a = p; else lp->next = p; lp = p;
      }
      p->str[j-(1)] = b[i-(1)]; j = j+1;
    }
    if (p != nil)  for( j = j; j <= varsqt; j ++) p->str[j-(1)] = ' ';
  }

  /* assign reserved word fixed to variable length string, including allocation */
  void strassvr(strvsp* a, restr const b)
  {
      integer i, j, l; strvsp p, lp;
        l = reslen; p = nil; *a = nil; lp = nil; j = 1;
    while ((l > 1) && (b[l-(1)] == ' '))  l = l-1; /* find length of fixed string */
    if (b[l-(1)] == ' ')  l = 0;
    for( i = 1; i <= l; i ++) {
      if (j > varsqt)  p = nil;
      if (p == nil)  { 
        getstr(&p); p->next = nil; j = 1; 
        if (*a == nil)  *a = p; else lp->next = p; lp = p;
      }
      p->str[j-(1)] = b[i-(1)]; j = j+1;
    }
    if (p != nil)  for( j = j; j <= varsqt; j ++) p->str[j-(1)] = ' ';
  }

  /* compare variable length id strings */
  boolean strequvv(strvsp a, strvsp b)
  {
      boolean m; integer i;

    boolean strequvv_result;
    m = true;
    while ((a != nil) && (b != nil))  {
      for( i = 1; i <= varsqt; i ++) if (lcase(a->str[i-(1)]) != lcase(b->str[i-(1)]))  m = false;
      a = a->next; b = b->next;
    }
    if (a != b)  m = false;
    strequvv_result = m;
    return strequvv_result;
  }

  /* compare variable length id strings, a < b */
  boolean strltnvv(strvsp a, strvsp b)
  {
      integer i; char ca, cb;
        boolean strltnvv_result;
        ca = ' '; cb = ' ';
    while ((a != nil) || (b != nil))  {
      i = 1;
      while ((i <= varsqt) && ((a != nil) || (b != nil)))  {
        if (a != nil)  ca = lcase(a->str[i-(1)]); else ca = ' ';
        if (b != nil)  cb = lcase(b->str[i-(1)]); else cb = ' ';
        if (ca != cb)  { a = nil; b = nil; }
        i = i+1;
      }
      if (a != nil)  a = a->next; if (b != nil)  b = b->next;
    }
    strltnvv_result = ca < cb;
        return strltnvv_result;
  }

  /* compare variable length id string to fixed */
  boolean strequvf(strvsp a, idstr b)
  {
      boolean m; integer i, j; char c;

    boolean strequvf_result;
    m = true; j = 1;
    for( i = 1; i <= maxids; i ++) {
      c = ' '; if (a != nil)  { c = a->str[j-(1)]; j = j+1; }
      if (lcase(c) != lcase(b[i-(1)]))  m = false;
      if (j > varsqt)  { a = a->next; j = 1; }
    }
    strequvf_result = m;
    return strequvf_result;
  }

  /* compare variable length id string to fixed, a < b */
  boolean strltnvf(strvsp a, idstr b)
  {
      boolean m; integer i, j, f; char c;

    boolean strltnvf_result;
    m = true; i = 1; j = 1;
    while (i < maxids)  {
      c = ' '; if (a != nil)  { c = a->str[j-(1)]; j = j+1; }
      if (lcase(c) != lcase(b[i-(1)]))  { f = i; i = maxids; } else i = i+1;
      if (j > varsqt)  { a = a->next; j = 1; }
    }
    strltnvf_result = lcase(c) < lcase(b[f-(1)]);
    return strltnvf_result;
  }

/*-------------------------------------------------------------------------*/

  /* dump the display */
  void prtdsp();

static void prtlnk(ctp p, integer f)
{
    integer i;

  if (p != nil)  {
    for( i = 1; i <= f; i ++) cwrite(" ");
    writev(p->name, 10); cwrite("\n");
    if (p->llink != nil)  prtlnk(p->llink, f+3);
    if (p->rlink != nil)  prtlnk(p->rlink, f+3);
  }
}

  void prtdsp()
  {
      integer i;

    cwrite("\n");
    cwrite("Display:\n");
    cwrite("\n");
    for( i = 0; i <= displimit; i ++) if (display[i - min_disprange].fname != nil)  {

       cwrite("level %1i\n", i);
       cwrite("\n");
       prtlnk(display[i - min_disprange].fname, 0);
       cwrite("\n");

    }
    cwrite("\n");
  }

  void endofline()
  {
        integer lastpos,freepos,currpos,currnmr,f,k;

    if (errinx > 0)      /*output error messages*/
      { twrite(&output, "%6i%9z",linecount," ****  ");
        lastpos = 0; freepos = 1;
        for( k = 1; k <= errinx; k ++)
          {
            {
                    struct A1* with = &errlist[k-(1)]; 
                    currpos = with->pos; currnmr = with->nmr; }
            if (currpos == lastpos)  twrite(&output, ",");
            else
              {
                while (freepos < currpos) 
                  { twrite(&output, " "); freepos = freepos + 1; }
                twrite(&output, "^");
                lastpos = currpos;
              }
            if (currnmr < 10)  f = 1;
            else if (currnmr < 100)  f = 2;
              else f = 3;
            twrite(&output, "%*i",currnmr,f);
            freepos = freepos + f + 1;
          }
        twrite(&output, "\n"); errinx = 0;
      }
    linecount = linecount + 1;
    if (list && (! eof(input))) 
      { twrite(&output, "%6i%2z",linecount,"  ");
        if (dp)  twrite(&output, "%7i",lc); else twrite(&output, "%7i",ic);
        twrite(&output, " ");
      }
    /* output line marker in intermediate file */
    if (! eof(input))  {
      twrite(&prr, ":%1i\n", linecount);
    }
    chcnt = 0;
  }    /*endofline*/ 

  void errmsg(integer ferrnr)
  { switch (ferrnr) {
    case 1:   cwrite("Error in simple type"); break;
    case 2:   cwrite("Identifier expected"); break;
    case 3:   cwrite("'program' expected"); break;
    case 4:   cwrite("')' expected"); break;
    case 5:   cwrite("':' expected"); break;
    case 6:   cwrite("Illegal symbol"); break;
    case 7:   cwrite("Error in parameter list"); break;
    case 8:   cwrite("'of' expected"); break;
    case 9:   cwrite("'(' expected"); break;
    case 10:  cwrite("Error in type"); break;
    case 11:  cwrite("'[' expected"); break;
    case 12:  cwrite("']' expected"); break;
    case 13:  cwrite("'end' expected"); break;
    case 14:  cwrite("':' expected"); break;
    case 15:  cwrite("Integer expected"); break;
    case 16:  cwrite("'=' expected"); break;
    case 17:  cwrite("'begin' expected"); break;
    case 18:  cwrite("Error in declaration part"); break;
    case 19:  cwrite("Error in field-list"); break;
    case 20:  cwrite("',' expected"); break;
    case 21:  cwrite("'*' expected"); break;

    case 50:  cwrite("Error in constant"); break;
    case 51:  cwrite("':=' expected"); break;
    case 52:  cwrite("'then' expected"); break;
    case 53:  cwrite("'until' expected"); break;
    case 54:  cwrite("'do' expected"); break;
    case 55:  cwrite("'to'/'downto' expected"); break;
    case 56:  cwrite("'if' expected"); break;
    case 57:  cwrite("'file' expected"); break;
    case 58:  cwrite("Error in factor"); break;
    case 59:  cwrite("Error in variable"); break;

    case 101: cwrite("Identifier declared twice"); break;
    case 102: cwrite("Low bound exceeds highbound"); break;
    case 103: cwrite("Identifier is not of appropriate class"); break;
    case 104: cwrite("Identifier not declared"); break;
    case 105: cwrite("Sign not allowed"); break;
    case 106: cwrite("Number expected"); break;
    case 107: cwrite("Incompatible subrange types"); break;
    case 109: cwrite("Type must not be real"); break;
    case 110: cwrite("Tagfield type must be scalar or subrange"); break;
    case 111: cwrite("Incompatible with tagfield type"); break;
    case 112: cwrite("Index type must not be real"); break;
    case 113: cwrite("Index type must be scalar or subrange"); break;
    case 114: cwrite("Base type must not be real"); break;
    case 115: cwrite("Base type must be scalar or subrange"); break;
    case 116: cwrite("Error in type of standard procedure parameter"); break;
    case 117: cwrite("Unsatisfied forward reference"); break;
    case 118: cwrite("Forward reference type identifier in variable declaration"); break;
    case 119: cwrite("Forward declared; repetition of parameter list not allowed"); break;
    case 120: cwrite("Function result type must be scalar, subrange or point"); break;
    case 121: cwrite("File value parameter not allowed"); break;
    case 122: cwrite("Forward declared function; repetition of result type not allowed"); break;
    case 123: cwrite("Missing result type in function declaration"); break;
    case 124: cwrite("F-format for real only"); break;
    case 125: cwrite("Error in type of standard function parameter"); break;
    case 126: cwrite("Number of parameters does not agree with declaration"); break;
    case 127: cwrite("Illegal parameter substitution"); break;
    case 128: cwrite("Result type of parameter function does not agree with declaration"); break;
    case 129: cwrite("Type conflict of operands"); break;
    case 130: cwrite("Expression is not of set type"); break;
    case 131: cwrite("Tests on equality allowed only"); break;
    case 132: cwrite("Strict inclusion not allowed"); break;
    case 133: cwrite("File comparison not allowed"); break;
    case 134: cwrite("Illegal type of operand(s)"); break;
    case 135: cwrite("Type of operand must be Boolean"); break;
    case 136: cwrite("Set element type must be scalar nr subrange"); break;
    case 137: cwrite("Set element types not compatible"); break;
    case 138: cwrite("Type of variable is not array"); break;
    case 139: cwrite("Index type is not compatible with declaration"); break;
    case 140: cwrite("Type of variable is not record"); break;
    case 141: cwrite("Type of variable must be file or pointer"); break;
    case 142: cwrite("Illegal parameter substitution"); break;
    case 143: cwrite("Illegal type of loop control variable"); break;
    case 144: cwrite("Illegal type of expression"); break;
    case 145: cwrite("Type conflict"); break;
    case 146: cwrite("Assignment of files not allowed"); break;
    case 147: cwrite("Label type incompatible with selecting expression"); break;
    case 148: cwrite("Subrange bounds must be scalar"); break;
    case 149: cwrite("Index type must not be integer"); break;
    case 150: cwrite("Assignment to standard function is not allowed"); break;
    case 151: cwrite("Assignment to formal function is not allowed"); break;
    case 152: cwrite("No such field in this record"); break;
    case 153: cwrite("Type error in read"); break;
    case 154: cwrite("Actual parameter must be a variable"); break;
    case 155: cwrite("Control variable must ~ot be declared on intermediate"); break;
    case 156: cwrite("Multidefined case label"); break;
    case 157: cwrite("Too many cases in case statement"); break;
    case 158: cwrite("Missing corresponding variant declaration"); break;
    case 159: cwrite("Real or string tagfields not allowed"); break;
    case 160: cwrite("Previous declaration was not forward"); break;
    case 161: cwrite("Again forward declared"); break;
    case 162: cwrite("Parameter size must be constant"); break;
    case 163: cwrite("Missing variant in declaration"); break;
    case 164: cwrite("Substitution of standard proc/func not allowed"); break;
    case 165: cwrite("Multidefined label"); break;
    case 166: cwrite("Multideclared label"); break;
    case 167: cwrite("Undeclared label"); break;
    case 168: cwrite("Undefined label"); break;
    case 169: cwrite("Error in base set"); break;
    case 170: cwrite("Value parameter expected"); break;
    case 171: cwrite("Standard file was redeclared"); break;
    case 172: cwrite("Undeclared external file"); break;
    case 173: cwrite("Fortran procedure or function expected"); break;
    case 174: cwrite("Pascal procedure or function expected"); break;
    case 175: cwrite("Missing file \"input\" in program heading"); break;
    case 176: cwrite("Missing file \"output\" in program heading"); break;
    case 177: cwrite("Assiqnment to function identifier not allowed here"); break;
    case 178: cwrite("Multidefined record variant"); break;
    case 179: cwrite("X-opt of actual proc/funcdoes not match formal declaration"); break;
    case 180: cwrite("Control variable must not be formal"); break;
    case 181: cwrite("Constant part of address out of ranqe"); break;
    case 182: cwrite("identifier too long"); break;
    case 183: cwrite("For index variable must be local to this block"); break;
    case 184: cwrite("Interprocedure goto does not reference outter block of destination"); break;
    case 185: cwrite("Goto references deeper nested statement"); break;
    case 186: cwrite("Label referenced by goto at lesser statement level"); break;
    case 187: cwrite("Goto references label in different nested statement"); break;
    case 188: cwrite("Label referenced by goto in different nested statement"); break;
    case 189: cwrite("Parameter lists of formal and actual parameters not congruous"); break;
    case 190: cwrite("File component may not contain other files"); break;
    case 191: cwrite("Cannot assign from file or component containing files"); break;

    case 201: cwrite("Error in real constant: digit expected"); break;
    case 202: cwrite("String constant must not exceed source line"); break;
    case 203: cwrite("Integer constant exceeds range"); break;
    case 204: cwrite("8 or 9 in octal number"); break;
    case 205: cwrite("Zero strinq not allowed"); break;
    case 206: cwrite("Integer part of real constant exceeds ranqe"); break;

    case 250: cwrite("Too many nestedscopes of identifiers"); break;
    case 251: cwrite("Too many nested procedures and/or functions"); break;
    case 252: cwrite("Too many forward references of procedure entries"); break;
    case 253: cwrite("Procedure too long"); break;
    case 254: cwrite("Too many long constants in this procedure"); break;
    case 255: cwrite("Too many errors on this source line"); break;
    case 256: cwrite("Too many external references"); break;
    case 257: cwrite("Too many externals"); break;
    case 258: cwrite("Too many local files"); break;
    case 259: cwrite("Expression too complicated"); break;
    case 260: cwrite("Too many exit labels"); break;

    case 300: cwrite("Division by zero"); break;
    case 301: cwrite("No case provided for this value"); break;
    case 302: cwrite("Index expression out of bounds"); break;
    case 303: cwrite("Value to be assigned is out of bounds"); break;
    case 304: cwrite("Element expression out of range"); break;

    case 398: cwrite("Implementation restriction"); break;
    case 399: cwrite("Feature not implemented"); break;

    case 400:
    case 500: cwrite("Compiler internal error");
    break;
    }    
  }

  void error(integer ferrnr)
  {

    /* This diagnostic is here because error buffers error numbers til the end
      of line, and sometimes you need to know exactly where they occurred. */

    /*

    writeln('error: ', ferrnr:1); 

    */

    errtbl[ferrnr-(1)] = true; /* track this error */
    if (errinx >= 9) 
      { errlist[9].nmr = 255; errinx = 10; }
    else
      { errinx = errinx + 1;
        errlist[errinx-(1)].nmr = ferrnr;
      }
    errlist[errinx-(1)].pos = chcnt;
    toterr = toterr+1;
  }   /*error*/ 

  void insymbol();


static void nextch(boolean* test)
{ if (eol) 
  { if (list)  twrite(&output, "\n"); endofline();
  }
  if (! eof(input)) 
   { eol = eoln(input); tread(&input, "%c",&ch);
    if (list)  twrite(&output, "%c",ch);
    chcnt = chcnt + 1;
   }
  else
    { twrite(&output, "   *** eof encountered\n");
      *test = false;
    }
}



static void options(boolean* test)
{
  do { nextch(test);
    if (ch != '*') 
      {
        if (ch == 't') 
          { nextch(test); prtables = ch == '+'; }
        else
          if (ch == 'l') 
            { nextch(test); list = ch == '+';
              if (! list)  twrite(&output, "\n");
            }
          else
         if (ch == 'd') 
           { nextch(test); debug = ch == '+'; }
         else
            if (ch == 'c') 
              { nextch(test); prcode = ch == '+'; }
        nextch(test);
      }
  } while (!(ch != ','));
}   /*options*/ 

  void insymbol()
    /*read next basic symbol of source program and return its
    description in the global variables sy, op, id, val and lgth*/

  {
        integer i,k,j;
        char digit[strglgth];
        char string[strglgth];
        csp lvp; boolean test, ferr; strvsp p, lp;
        boolean iscmte;

        /*insymbol*/
  L1:
    /* Skip both spaces and controls. This allows arbitrary formatting characters
      in the source. */
    do { while ((ch <= ' ') && ! eol)  nextch(&test);
      test = eol;
      if (test)  nextch(&test);
    } while (!(! test));
    if (chartp[ch -  -128] == illegal) 
      { sy = othersy; op = noop;
        error(399); nextch(&test);
      }
    else
    switch (chartp[ch -  -128]) {
      case letter:
        { k = 0; ferr = true;
          do {
            if (k < maxids) 
             { k = k + 1; id[k-(1)] = ch; }
            else if (ferr)  { error(182); ferr = false; }
            nextch(&test);
          } while (!(inset(chartp[ch -  -128], setof(special,illegal,chstrquo,chcolon,
                                chperiod,chlt,chgt,chlparen,chspace,chlcmt, eos))));
          if (k >= kk)  kk = k;
          else
            do { id[kk-(1)] = ' '; kk = kk - 1;
            } while (!(kk == k));
          sy = ident; op = noop;
          if (k <= reslen) 
            for( i = frw[k-(1)]; i <= frw[k] - 1; i ++)
              if (strequri(rw[i-(1)], id)) 
                { sy = rsy[i-(1)]; op = rop[i-(1)]; }
      }
      break;
      case number:
        { op = noop; i = 0;
          do { i = i+1; if (i<= digmax)  digit[i-(1)] = ch; nextch(&test);
          } while (!(chartp[ch -  -128] != number));
          if (((ch == '.') && (*currec(input) != '.') && (*currec(input) != ')')) || 
             (ch == 'e')) 
            {
              k = i;
              if (ch == '.') 
                { k = k+1; if (k <= digmax)  digit[k-(1)] = ch;
                  nextch(&test); /*if ch = '.' then begin ch := ':'; goto 3 end;*/
                  if (chartp[ch -  -128] != number)  error(201);
                  else
                    do { k = k + 1;
                      if (k <= digmax)  digit[k-(1)] = ch; nextch(&test);
                    } while (!(chartp[ch -  -128] !=  number));
                }
              if (ch == 'e') 
                { k = k+1; if (k <= digmax)  digit[k-(1)] = ch;
                  nextch(&test);
                  if ((ch == '+') || (ch =='-')) 
                    { k = k+1; if (k <= digmax)  digit[k-(1)] = ch;
                      nextch(&test);
                    }
                  if (chartp[ch -  -128] != number)  error(201);
                  else
                    do { k = k+1;
                      if (k <= digmax)  digit[k-(1)] = ch; nextch(&test);
                    } while (!(chartp[ch -  -128] != number));
                 }
               lvp = (constant*)malloc(sizeof(constant)); pshcst(lvp); sy= realconst; 
               lvp->cclass = reel;
               {
                       constant* with = lvp; 
                       for( i = 1; i <= strglgth; i ++) with->u.rval[i-(1)] = ' ';
                   if (k <= digmax) 
                     for( i = 2; i <= k + 1; i ++) with->u.rval[i-(1)] = digit[i-2];
                   else { error(203); with->u.rval[1] = '0';
                          with->u.rval[2] = '.'; with->u.rval[3] = '0';
                        }
               }
               val.u.valp = lvp;
            }
          else
            {
              if (i > digmax)  { error(203); val.u.ival = 0; }
              else
                  { val.u.ival = 0;
                    for( k = 1; k <= i; k ++)
                      {
                        if (val.u.ival <= mxint10) 
                          val.u.ival = val.u.ival*10+ordint[digit[k-(1)] -  -128];
                        else { error(203); val.u.ival = 0; }
                      }
                    sy = intconst;
                  }
            }
        }
        break;
      case chstrquo:
        { lgth = 0; sy = stringconst;  op = noop;
          do {
            do { nextch(&test); lgth = lgth + 1;
                   if (lgth <= strglgth)  string[lgth-(1)] = ch;
            } while (!((eol) || (ch == '\'')));
            if (eol)  error(202); else nextch(&test);
          } while (!(ch != '\''));
          lgth = lgth - 1;    /*now lgth = nr of chars in string*/
          if (lgth == 0)  error(205); else
          if (lgth == 1)  val.u.ival = ord(string[0]);
          else
            { lvp = (constant*)malloc(sizeof(constant)); pshcst(lvp);
              lvp->cclass=strg;
              if (lgth > strglgth) 
                { error(399); lgth = strglgth; }
              {
                      constant* with = lvp; 
                      with->u.s_strg.slgth = lgth; p = nil; with->u.s_strg.sval = nil; j = 1;
                  for( i = 1; i <= lgth; i ++) {
                    if (j > varsqt)  p = nil;
                    if (p == nil)  { 
                      getstr(&p); p->next = nil; j = 1; 
                      if (with->u.s_strg.sval == nil)  with->u.s_strg.sval = p; else lp->next = p; lp = p;
                    }
                    p->str[j-(1)] = string[i-(1)]; j = j+1;
                  }
                  if (p != nil)  for( j = j; j <= varsqt; j ++) p->str[j-(1)] = ' ';
              }
              val.u.valp = lvp;
            }
        }
        break;
      case chcolon:
        { op = noop; nextch(&test);
          if (ch == '=') 
            { sy = becomes; nextch(&test); }
          else sy = colon;
        }
        break;
      case chperiod:
        { op = noop; nextch(&test);
          if (ch == '.')  { sy = range_; nextch(&test); }
          else if (ch == ')')  { sy = rbrack; nextch(&test); }
          else sy = period;
        }
        break;
      case chlt:
        { nextch(&test); sy = relop;
          if (ch == '=') 
            { op = leop; nextch(&test); }
          else
            if (ch == '>') 
              { op = neop; nextch(&test); }
            else op = ltop;
        }
        break;
      case chgt:
        { nextch(&test); sy = relop;
          if (ch == '=') 
            { op = geop; nextch(&test); }
          else op = gtop;
        }
        break;
      case chlparen:
       { nextch(&test);
         if (ch == '*') 
           { nextch(&test);
             if (ch == '$')  options(&test);
             do {
               while ((ch != '}') && (ch != '*') && ! eof(input))  nextch(&test);
               iscmte = ch == '}'; nextch(&test);
             } while (!(iscmte || (ch == ')') || eof(input)));
             if (! iscmte)  nextch(&test); goto L1;
           }
         else if (ch == '.')  { sy = lbrack; nextch(&test); }
         else sy = lparent; 
         op = noop;
       }
       break;
      case chlcmt:
       { nextch(&test);
         if (ch == '$')  options(&test);
         do {
            while ((ch != '}') && (ch != '*') && ! eof(input))  nextch(&test);
            iscmte = ch == '}'; nextch(&test);
         } while (!(iscmte || (ch == ')') || eof(input)));
         if (! iscmte)  nextch(&test); goto L1;
       }
       break;
      case special:
        { sy = ssy[ch -  -128]; op = sop[ch -  -128];
          nextch(&test);
        }
        break;
      case chspace: sy = othersy;
      break;
    }    /*case*/

    if (dodmplex)  {       /*  lexical dump */

      cwrite("\n");
      cwrite("symbol: ");
      switch (sy) {
         case ident:       cwrite("ident: %10s", 1, items(id), id); break;
         case intconst:    cwrite("int const: %1i", val.u.ival); break;
         case realconst:   cwrite("real const"); break;
         case stringconst: cwrite("string const"); break;
         case notsy: cwrite("not"); break; case mulop: cwrite("*"); break; case addop: cwrite("+"); break; 
         case relop: cwrite("<"); break; case lparent: cwrite("("); break; case rparent: cwrite(")"); break;
         case lbrack: cwrite("["); break; case rbrack: cwrite("]"); break; case comma: cwrite(","); break;
         case semicolon: cwrite(";"); break; case period: cwrite("."); break; case arrow: cwrite("^"); break;
         case colon: cwrite(":"); break; case becomes: cwrite(":="); break; case range_: cwrite(".."); break; 
         case labelsy: cwrite("label"); break; case constsy: cwrite("const"); break; case typesy: cwrite("type"); break;
         case varsy: cwrite("var"); break; case funcsy: cwrite("function"); break; case progsy: cwrite("program"); break;
         case procsy: cwrite("procedure"); break; case setsy: cwrite("set"); break; 
         case packedsy: cwrite("packed"); break; case arraysy: cwrite("array"); break;
         case recordsy: cwrite("record"); break; case filesy: cwrite("file"); break; 
         case beginsy: cwrite("begin"); break; case ifsy: cwrite("if"); break; case casesy: cwrite("case"); break; 
         case repeatsy: cwrite("repeat"); break; case whilesy: cwrite("while"); break; 
         case forsy: cwrite("for"); break; case withsy: cwrite("with"); break; case gotosy: cwrite("goto"); break; 
         case endsy: cwrite("end"); break; case elsesy: cwrite("else"); break; case untilsy: cwrite("until"); break;
         case ofsy: cwrite("of"); break; case dosy: cwrite("do"); break; case tosy: cwrite("to"); break; 
         case downtosy: cwrite("downto"); break; case thensy: cwrite("then"); break;
         case othersy: cwrite("<other>"); break;
      }
      cwrite("\n");

    }

  }   /*insymbol*/ 

  void enterid(ctp fcp)
    /*enter id pointed at by fcp into the name-table,
     which on each declaration level is organised as
     an unbalanced binary tree*/
  {
        ctp lcp, lcp1; boolean lleft;

    lcp = display[top - min_disprange].fname;
    if (lcp == nil) 
      display[top - min_disprange].fname = fcp;
    else
      {
        do { lcp1 = lcp;
          if (strequvv(lcp->name, fcp->name))    /*name conflict, follow right link*/
            { error(101); lcp = lcp->rlink; lleft = false; }
          else
            if (strltnvv(lcp->name, fcp->name)) 
              { lcp = lcp->rlink; lleft = false; }
            else { lcp = lcp->llink; lleft = true; }
        } while (!(lcp == nil));
        if (lleft)  lcp1->llink = fcp; else lcp1->rlink = fcp;
      }
    fcp->llink = nil; fcp->rlink = nil;
  }   /*enterid*/ 

  void searchsection(ctp fcp, ctp* fcp1)
    /*to find record fields and forward declared procedure id's
     --> procedure proceduredeclaration
     --> procedure selector*/

  {
         idstr ts;

    while (fcp != nil)  {
      arrcpy(ts, id); lcases(ts);
      if (strequvf(fcp->name, ts))  goto L1;
      else if (strltnvf(fcp->name, ts))  fcp = fcp->rlink;
        else fcp = fcp->llink;
    }
L1:  *fcp1 = fcp;
  }   /*searchsection*/ 

  void searchidne(setofids fidcls, ctp* fcp)

  {
        ctp lcp;
        disprange disxl;
        idstr ts;

    for( disxl = top; disxl >= 0; disxl --)
      { lcp = display[disxl - min_disprange].fname;
        while (lcp != nil)  {
          arrcpy(ts, id); lcases(ts);
          if (strequvf(lcp->name, ts)) 
            if (inset(lcp->klass, fidcls))  { disx = disxl; goto L1; }
            else
              { if (prterr)  error(103);
                lcp = lcp->rlink;
              }
          else
            if (strltnvf(lcp->name, ts)) 
              lcp = lcp->rlink;
            else lcp = lcp->llink;
        }
      }
      disx = 0;
      lcp = nil;  /* make sure this is not found */
L1:  *fcp = lcp;
  }   /*searchid*/ 

  void searchid(setofids fidcls, ctp* fcp)

  {
        ctp lcp;

    searchidne(fidcls, &lcp); /* perform no error search */
    if (lcp != nil)  goto L1;  /* found */
    /*search not successful; suppress error message in case
     of forward referenced type id in pointer type definition
     --> procedure simpletype*/
    if (prterr) 
      { error(104);
        /*to avoid returning nil, reference an entry
         for an undeclared id of appropriate class
         --> procedure enterundecl*/
        if (inset(types, fidcls))  lcp = utypptr;
        else
          if (inset(vars, fidcls))  lcp = uvarptr;
          else
            if (inset(field, fidcls))  lcp = ufldptr;
            else
              if (inset(konst, fidcls))  lcp = ucstptr;
              else
                if (inset(proc, fidcls))  lcp = uprcptr;
                else lcp = ufctptr;
      }
L1:  *fcp = lcp;
  }   /*searchid*/ 

  void getbounds(stp fsp, integer* fmin,integer* fmax)
    /*get internal bounds of subrange or scalar type*/
    /*assume fsp<>intptr and fsp<>realptr*/
  {
    *fmin = 0; *fmax = 0;
    if (fsp != nil) 
    { structure* with = fsp; 
      if (with->form == subrange) 
        { *fmin = with->u.s_subrange.min.u.ival; *fmax = with->u.s_subrange.max.u.ival; }
      else
          if (fsp == charptr) 
            { *fmin = ordminchar; *fmax = ordmaxchar;
            }
          else
            if (with->u.s_scalar.u.fconst != nil) 
              *fmax = with->u.s_scalar.u.fconst->u.values.u.ival;}
  }   /*getbounds*/ 

  /* alignment for general memory placement */
  integer alignquot(stp fsp)
  {
    integer alignquot_result;
    alignquot_result = 1;
    if (fsp != nil) 
      { structure* with = fsp; 
        switch (with->form) {
          case scalar:   if (fsp==intptr)  alignquot_result = intal;
                    else if (fsp==boolptr)  alignquot_result = boolal;
                    else if (with->u.s_scalar.scalkind==declared)  alignquot_result = intal;
                    else if (fsp==charptr)  alignquot_result = charal;
                    else if (fsp==realptr)  alignquot_result = realal;
                    else /*parmptr*/ alignquot_result = parmal;
                    break;
          case subrange: alignquot_result = alignquot(with->u.s_subrange.rangetype); break;
          case pointer:  alignquot_result = adral; break;
          case power:    alignquot_result = setal; break;
          case files:    alignquot_result = fileal; break;
          case arrays:   alignquot_result = alignquot(with->u.s_arrays.aeltype); break;
          case records:  alignquot_result = recal; break;
          case variant:case tagfld: error(501);
          break;
        }}
    return alignquot_result;
  }   /*alignquot*/

  void align(stp fsp, addrrange* flc)
  {
        integer k,l;

    k = alignquot(fsp);
    l = *flc-1;
    *flc = l + k  -  (k+l) % k;
  }   /*align*/

  void printtables(boolean fb);

#define intsize_ 11


static integer stptoint(stp p)
{
    struct { union { stp p; integer i;
             } u; } r;
      integer stptoint_result;
      r.u.p = p; stptoint_result = r.u.i; return stptoint_result;
}



static integer ctptoint(ctp p)
{
    struct { union { ctp p; integer i;
             } u; } r;
      integer ctptoint_result;
      r.u.p = p; ctptoint_result = r.u.i; return ctptoint_result;
}

  static void marker(disprange* lim);


static void markstp(stp fp)
  /*mark data structures, prevent cycles*/
{
  if (fp != nil) 
    {
            structure* with = fp; 
            with->marked = true;
        switch (with->form) {
        case scalar:; break;
        case subrange: markstp(with->u.s_subrange.rangetype); break;
        case pointer:/*don't mark eltype: cycle possible; will be marked
                        anyway, if fp = true*/;
        break;
        case power:    markstp(with->u.s_power.elset); break;
        case arrays:   { markstp(with->u.s_arrays.aeltype); markstp(with->u.s_arrays.inxtype); } break;
        case records:  { markctp(with->u.s_records.fstfld); markstp(with->u.s_records.recvar); } break;
        case files:    markstp(with->u.filtype); break;
        case tagfld:   markstp(with->u.s_tagfld.fstvar); break;
        case variant:  { markstp(with->u.s_variant.nxtvar); markstp(with->u.s_variant.subvar); } break;
        }   /*case*/
    }     /*with*/
}   /*markstp*/



static void markctp(ctp fp)
{
  if (fp != nil) 
    {
            identifier* with = fp; 
            markctp(with->llink); markctp(with->rlink);
        markstp(with->idtype);
    }
}   /*markctp*/



static void marker(disprange* lim)
  /*mark data structure entries to avoid multiple printout*/
{
      integer i;

  void markctp(ctp fp);

      /*marker*/
  for( i = top; i >= *lim; i --)
    markctp(display[i - min_disprange].fname);
}   /*marker*/



static void followstp(stp fp)
{
  if (fp != nil) 
    { structure* with = fp; 
      if (with->marked) 
        { with->marked = false; twrite(&output, "%4c%*i%10i",' ',stptoint/*ord*/(fp),intsize_/*6*/,with->size);
          switch (with->form) {
          case scalar:   { twrite(&output, "%10z","scalar");
                      if (with->u.s_scalar.scalkind == standard) 
                        twrite(&output, "%10z","standard");
                      else twrite(&output, "%10z%4c%*i","declared",' ',ctptoint/*ord*/(with->u.s_scalar.u.fconst),intsize_/*6*/);
                      twrite(&output, "\n");
                    }
                    break;
          case subrange: {
                      twrite(&output, "%10z%4c%6i","subrange",' ',stptoint/*ord*/(with->u.s_subrange.rangetype));
                      if (with->u.s_subrange.rangetype != realptr) 
                        twrite(&output, "%i%i",with->u.s_subrange.min.u.ival,with->u.s_subrange.max.u.ival);
                      else
                        if ((with->u.s_subrange.min.u.valp != nil) && (with->u.s_subrange.max.u.valp != nil)) 
                          twrite(&output, " %9s %9s",1, items(with->u.s_subrange.min.u.valp->u.rval), with->u.s_subrange.min.u.valp->u.rval
                                   ,1, items(with->u.s_subrange.max.u.valp->u.rval), with->u.s_subrange.max.u.valp->u.rval);
                      twrite(&output, "\n"); followstp(with->u.s_subrange.rangetype);
                    }
                    break;
          case pointer:  twrite(&output, "%10z%4c%*i\n","pointer",' ',stptoint/*ord*/(with->u.eltype),intsize_/*6*/); break;
          case power:    { twrite(&output, "%10z%4c%*i\n","set",' ',stptoint/*ord*/(with->u.s_power.elset),intsize_/*6*/);
                      followstp(with->u.s_power.elset);
                    }
                    break;
          case arrays:   {
                      twrite(&output, "%10z%4c%*i%4c%6i\n","array",' ',stptoint/*ord*/(with->u.s_arrays.aeltype),intsize_/*6*/,' ',
                        stptoint/*ord*/(with->u.s_arrays.inxtype));
                      followstp(with->u.s_arrays.aeltype); followstp(with->u.s_arrays.inxtype);
                    }
                    break;
          case records:  {
                      twrite(&output, "%10z%4c%*i%4c%*i\n","record",' ',ctptoint/*ord*/(with->u.s_records.fstfld),intsize_/*6*/,' ',
                        stptoint/*ord*/(with->u.s_records.recvar),intsize_/*6*/); followctp(with->u.s_records.fstfld);
                      followstp(with->u.s_records.recvar);
                    }
                    break;
          case files:    { twrite(&output, "%10z%4c%*i","file",' ',stptoint/*ord*/(with->u.filtype),intsize_/*6*/);
                      followstp(with->u.filtype);
                    }
                    break;
          case tagfld:   { twrite(&output, "%10z%4c%*i%4c%*i\n","tagfld",' ',ctptoint/*ord*/(with->u.s_tagfld.tagfieldp),intsize_/*6*/,
                        ' ',stptoint  /*ord*/(with->u.s_tagfld.fstvar),intsize_/*6*/);
                      followstp(with->u.s_tagfld.fstvar);
                    }
                    break;
          case variant:  { twrite(&output, "%10z%4c%*i%4c%*i%i\n","variant",' ',stptoint/*ord*/(with->u.s_variant.nxtvar),intsize_/*6*/,
                        ' ',stptoint  /*ord*/(with->u.s_variant.subvar),intsize_/*6*/,with->u.s_variant.varval.u.ival);
                      followstp(with->u.s_variant.nxtvar); followstp(with->u.s_variant.subvar);
                    }
                    break;
          }   /*case*/
        }}  /*if marked*/
}   /*followstp*/



static void followctp(ctp fp)
{
  if (fp != nil) 
    {
            identifier* with = fp; 
            twrite(&output, "%4c%*i ",' ',ctptoint/*ord*/(fp),intsize_/*6*/); 
            writev(with->name, 9); cwrite("%4c%*i%4c%*i%4c%*i", ' ',ctptoint/*ord*/(with->llink),intsize_/*6*/,
        ' ',ctptoint  /*ord*/(with->rlink),intsize_/*6*/,' ',stptoint/*ord*/(with->idtype),intsize_/*6*/);
        switch (with->klass) {
          case types: twrite(&output, "%10z","type"); break;
          case konst: { twrite(&output, "%10z%4c%*i","constant",' ',ctptoint/*ord*/(with->next),intsize_/*6*/);
                   if (with->idtype != nil) 
                     if (with->idtype == realptr) 
                       {
                         if (with->u.values.u.valp != nil) 
                           twrite(&output, " %9s",1, items(with->u.values.u.valp->u.rval), with->u.values.u.valp->u.rval);
                       }
                     else
                       if (with->idtype->form == arrays)   /*stringconst*/
                         {
                           if (with->u.values.u.valp != nil) 
                             { twrite(&output, " ");
                               { constant* with1 = with->u.values.u.valp; 
                                 writev(with1->u.s_strg.sval, with1->u.s_strg.slgth);}
                             }
                         }
                       else twrite(&output, "%i",with->u.values.u.ival);
                 }
                 break;
          case vars:  { twrite(&output, "%10z","variable");
                   if (with->u.s_vars.vkind == actual)  twrite(&output, "%10z","actual");
                   else twrite(&output, "%10z","formal");
                   twrite(&output, "%4c%*i%i%4c%6i",' ',ctptoint/*ord*/(with->next),intsize_/*6*/,with->u.s_vars.vlev,' ',with->u.s_vars.vaddr );
                 }
                 break;
          case field: twrite(&output, "%10z%4c%*i%4c%6i","field",' ',ctptoint/*ord*/(with->next),intsize_/*6*/,' ',with->u.fldaddr); break;
          case proc:
          case func:  {
                   if (with->klass == proc)  twrite(&output, "%10z","procedure");
                   else twrite(&output, "%10z","function");
                   if (with->u.s_proc.pfdeckind == standard) 
                     twrite(&output, "%10z%10i","standard", with->u.s_proc.u.key);
                   else
                     { twrite(&output, "%10z%4c%*i","declared",' ',ctptoint/*ord*/(with->next),intsize_/*6*/);
                       twrite(&output, "%i%4c%6i",with->u.s_proc.u.s_declared.pflev,' ',with->u.s_proc.u.s_declared.pfname);
                       if (with->u.s_proc.u.s_declared.pfkind == actual) 
                         { twrite(&output, "%10z","actual");
                           if (with->u.s_proc.u.s_declared.u.s_actual.forwdecl)  twrite(&output, "%10z","forward");
                           else twrite(&output, "%10z","notforward");
                           if (with->u.s_proc.u.s_declared.u.s_actual.externl)  twrite(&output, "%10z","extern");
                           else twrite(&output, "%10z","not extern");
                         }
                       else twrite(&output, "%10z","formal");
                     }
                 }
                 break;
        }   /*case*/
        twrite(&output, "\n");
        followctp(with->llink); followctp(with->rlink);
        followstp(with->idtype);
    }     /*with*/
}   /*followctp*/

  void printtables(boolean fb)
    /*print data structure and name table*/
    /* Added these functions to convert pointers to integers.
      Works on any machine where pointers and integers are the same format.
      The original code was for a processor where "ord" would do this, a
      very nonstandard feature [sam] */
                        /* size of printed integer */

  {
        disprange i, lim;

    void followctp(ctp fp);

        /*printtables*/
    twrite(&output, "\n"); twrite(&output, "\n"); twrite(&output, "\n");
    if (fb)  lim = 0;
    else { lim = top; twrite(&output, " local"); }
    twrite(&output, " tables \n"); twrite(&output, "\n");
    marker(&lim);
    for( i = top; i >= lim; i --)
      followctp(display[i - min_disprange].fname);
    twrite(&output, "\n");
    if (! eol)  twrite(&output, "%*c",' ',chcnt+16);

#undef intsize_

  }   /*printtables*/

  void genlabel(integer* nxtlab)
  { intlabel = intlabel + 1;
    *nxtlab = intlabel;
  }   /*genlabel*/

  void searchlabel(lbp* llp, disprange level)
  {
      lbp fllp;  /* found label entry */

    fllp = nil;  /* set no label found */
    *llp = display[level - min_disprange].flabel; /* index top of label list */
    while (*llp != nil)  {    /* traverse */
      if ((*llp)->labval == val.u.ival)  { /* found */
        fllp = *llp; /* set entry found */
        *llp = nil; /* stop */
      } else *llp = (*llp)->nextlab; /* next in list */
    }
    *llp = fllp; /* return found entry or nil */
  }

  void newlabel(lbp* llp)
  {
      integer lbname;

    {
            struct A2* with = &display[top - min_disprange]; 
            getlab(llp);
        {
                labl* with1 = (*llp); 
                with1->labval = val.u.ival; genlabel(&lbname);
            with1->defined = false; with1->nextlab = with->flabel; with1->labname = lbname;
            with1->vlevel = level; with1->slevel = 0; with1->ipcref = false; with1->minlvl = maxint;
            with1->bact = false;
        }
        with->flabel = *llp;
    }
  }

  void prtlabels()
  {
      lbp llp;  /* found label entry */

    cwrite("\n");
    cwrite("Labels: \n");
    cwrite("\n");
    llp = display[level - min_disprange].flabel; /* index top of label list */
    while (llp != nil)  {
      labl* with = llp;                    /* traverse */
      cwrite("label: %1i defined: %b internal: %1i vlevel: %1i slevel: %1i ipcref: %1b minlvl: %1i\n", with->labval, with->defined
                           , with->labname, with->vlevel
                         , with->slevel, with->ipcref
                         , with->minlvl);
      cwrite("   bact: %b\n", with->bact);
      llp = llp->nextlab; /* next in list */
                        }
  }

  void block(setofsys fsys, symbol fsy, ctp fprocp);


static void skip(setofsys fsys)
  /*skip input string until relevant symbol found*/
{
  if (! eof(input)) 
    { while (!(inset(sy, fsys)) && (! eof(input)))  insymbol();
      if (! (inset(sy, fsys)))  insymbol();
    }
}   /*skip*/ 



static void constant1(setofsys fsys, stp* fsp, valu* fvalu)
{
      stp lsp; ctp lcp; enum {   none,pos,neg} sign;
      csp lvp; unsigned char i;
      lsp = nil; fvalu->u.ival = 0;
  if (!(inset(sy, constbegsys))) 
    { error(50); skip(join(fsys, constbegsys)); }
  if (inset(sy, constbegsys)) 
    {
      if (sy == stringconst) 
        {
          if (lgth == 1)  lsp = charptr;
          else
            {
              lsp = (structure*)malloc(sizeof(structure)); pshstc(lsp);
              {
                      structure* with = lsp; 
                      with->u.s_arrays.aeltype = charptr; with->u.s_arrays.inxtype = nil;
                   with->size = lgth*charsize; with->form = arrays;
                   with->packing = true;
              }
            }
          *fvalu = val; insymbol();
        }
      else
        {
          sign = none;
          if ((sy == addop) && (inset(op, setof(plus,minus, eos)))) 
            { if (op == plus)  sign = pos; else sign = neg;
              insymbol();
            }
          if (sy == ident) 
            { searchid(setof(konst, eos),&lcp);
              {
                      identifier* with = lcp; 
                      lsp = with->idtype; *fvalu = with->u.values; }
              if (sign != none) 
                if (lsp == intptr) 
                  { if (sign == neg)  fvalu->u.ival = -fvalu->u.ival; }
                else
                  if (lsp == realptr) 
                    {
                      if (sign == neg) 
                        { lvp = (constant*)malloc(sizeof(constant)); pshcst(lvp);
                          if (fvalu->u.valp->u.rval[0] == '-') 
                            lvp->u.rval[0] = '+';
                          else lvp->u.rval[0] = '-';
                          for( i = 2; i <= strglgth; i ++)
                            lvp->u.rval[i-(1)] = fvalu->u.valp->u.rval[i-(1)];
                          fvalu->u.valp = lvp;
                        }
                      }
                    else error(105);
              insymbol();
            }
          else
            if (sy == intconst) 
              { if (sign == neg)  val.u.ival = -val.u.ival;
                lsp = intptr; *fvalu = val; insymbol();
              }
            else
              if (sy == realconst) 
                { if (sign == neg)  val.u.valp->u.rval[0] = '-';
                  lsp = realptr; *fvalu = val; insymbol();
                }
              else
                { error(106); skip(fsys); }
        }
      if (! (inset(sy, fsys))) 
        { error(6); skip(fsys); }
      }
  *fsp = lsp;
}   /*constant*/ 



static boolean comptypes(stp fsp1,stp fsp2)
  /*decide whether structures pointed at by fsp1 and fsp2 are compatible*/
{
  boolean comptypes_result;
  comptypes_result = false; /* set default is false */
  /* Check equal. Aliases of the same type will also be equal. */
  if (fsp1 == fsp2)  comptypes_result = true;
  else
    if ((fsp1 != nil) && (fsp2 != nil)) 
      if (fsp1->form == fsp2->form) 
        switch (fsp1->form) {
          case scalar:; break;
          /* Subranges are compatible if either type is a subrange of the 
                other, or if the base type is the same. */
          case subrange: comptypes_result = (fsp1->u.s_subrange.rangetype == fsp2) || 
                                 (fsp2->u.s_subrange.rangetype == fsp1) ||
                                 (fsp1->u.s_subrange.rangetype == fsp2->u.s_subrange.rangetype);
                                 break;
          /* Sets are compatible if they have the same base types and packed/
                unpacked status, or one of them is the empty set. The empty set
                is indicated by a nil base type, which is identical to a base
                type in error. Either way, we treat them as compatible.
                
                Set types created for set constants have a flag that disables
                packing matches. This is because set constants can be packed or
                unpacked by context. */
          case power: comptypes_result = (comptypes(fsp1->u.s_power.elset, fsp2->u.s_power.elset) && 
                                ((fsp1->packing == fsp2->packing) || 
                                 ! fsp1->u.s_power.matchpack || 
                                 ! fsp2->u.s_power.matchpack)) ||
                              (fsp1->u.s_power.elset == nil) || (fsp2->u.s_power.elset == nil);
                              break;
          /* Arrays are compatible if they are string types and equal in size */
          case arrays: comptypes_result = string(fsp1) && string(fsp2) && 
                               (fsp1->size == fsp2->size );
                               break;
          /* Pointers, must either be the same type or aliases of the same
                type, or one must be nil. The nil pointer is indicated by a nil
                base type, which is identical to a base type in error. Either 
                way, we treat them as compatible. */
          case pointer: comptypes_result = (fsp1->u.eltype == nil) || (fsp2->u.eltype == nil); break;
          /* records and files must either be the same type or aliases of the
                same type */
          case records:; break;
          case files:;
          break;
        }   /*case*/
      else /*fsp1^.form <> fsp2^.form*/
        /* subranges of a base type match the base type */
        if (fsp1->form == subrange) 
          comptypes_result = fsp1->u.s_subrange.rangetype == fsp2;
        else
          if (fsp2->form == subrange) 
            comptypes_result = fsp1 == fsp2->u.s_subrange.rangetype;
          else comptypes_result = false;
    else comptypes_result = true; /* one of the types is in error */
  return comptypes_result;
}   /*comptypes*/ 

  static boolean filecomponent(stp fsp);

      /* tour identifier tree */
static boolean filecomponentre(ctp lcp)
{
    boolean f;

  boolean filecomponentre_result;
  f = false;  /* set not file by default */
  if (lcp != nil)  {
    identifier* with = lcp;  
    if (filecomponent(with->idtype))  f = true;
    if (filecomponentre(with->llink))  f = true;
    if (filecomponentre(with->rlink))  f = true;
                   }
  filecomponentre_result = f;
  return filecomponentre_result;
}



    /* check structure is, or contains, a file */
static boolean filecomponent(stp fsp)
{
    boolean f;

  boolean filecomponent_result;
  f = false;  /* set not a file by default */
  if (fsp != nil)  { structure* with = fsp;  switch (with->form) {
    case scalar:; break;
    case subrange:; break;
    case pointer:; break;
    case power:; break;
    case arrays:   if (filecomponent(with->u.s_arrays.aeltype))  f = true; break; 
    case records:  if (filecomponentre(with->u.s_records.fstfld))  f = true; break;
    case files:    f = true; break;
    case tagfld:; break;
    case variant:; break;
  }}
  filecomponent_result = f;
  return filecomponent_result;
}



static boolean string(stp fsp)
{
    integer fmin, fmax;
      boolean string_result;
      string_result = false;
  if (fsp != nil) 
    if ((fsp->form == arrays) && fsp->packing)  {
      /* if the index is nil, either the array is a string constant or the
            index type was in error. Either way, we call it a string */
      if (fsp->u.s_arrays.inxtype == nil)  fmin = 1;
      else getbounds(fsp->u.s_arrays.inxtype,&fmin,&fmax);
      if (comptypes(fsp->u.s_arrays.aeltype,charptr) && (fmin == 1))  string_result = true;
    }
      return string_result;
}   /*string*/ 

  static void typ(setofsys fsys, stp* fsp, addrrange* fsize);


static void simpletype(setofsys fsys, stp* fsp, addrrange* fsize)
{
      stp lsp,lsp1; ctp lcp,lcp1; disprange ttop;
      integer lcnt; valu lvalu;
      *fsize = 1;
  if (! (inset(sy, simptypebegsys))) 
    { error(1); skip(join(fsys, simptypebegsys)); }
  if (inset(sy, simptypebegsys)) 
    {
      if (sy == lparent) 
        { ttop = top;        /*decl. consts local to innermost block*/
          while (display[top - min_disprange].occur != blck)  top = top - 1;
          lsp = (structure*)malloc(sizeof(structure)); pshstc(lsp);
          {
                  structure* with = lsp; 
                  with->size = intsize; with->form = scalar;
              with->u.s_scalar.scalkind = declared;
          }
          lcp1 = nil; lcnt = 0;
          do { insymbol();
            if (sy == ident) 
              { lcp = (identifier*)malloc(sizeof(identifier)); ininam(lcp);
                {
                        identifier* with = lcp; 
                        strassvf(&with->name, id); with->idtype = lsp; with->next = lcp1;
                    with->u.values.u.ival = lcnt; with->klass = konst;
                }
                enterid(lcp);
                lcnt = lcnt + 1;
                lcp1 = lcp; insymbol();
              }
            else error(2);
            if (! (inset(sy, join(fsys, setof(comma,rparent, eos))))) 
              { error(6); skip(join(fsys, setof(comma,rparent, eos))); }
          } while (!(sy != comma));
          lsp->u.s_scalar.u.fconst = lcp1; top = ttop;
          if (sy == rparent)  insymbol(); else error(4);
        }
      else
        {
          if (sy == ident) 
            { searchid(setof(types,konst, eos),&lcp);
              insymbol();
              if (lcp->klass == konst) 
                { lsp = (structure*)malloc(sizeof(structure)); pshstc(lsp);
                  {
                          structure* with = lsp;
                          identifier* with1 = lcp; 
                          with->u.s_subrange.rangetype = with1->idtype; with->form = subrange;
                      if (string(rangetype)) 
                        { error(148); with->u.s_subrange.rangetype = nil; }
                      with->u.s_subrange.min = with1->u.values; with->size = intsize;
                  }
                  if (sy == range_)  insymbol(); else error(5);
                  constant1(fsys,&lsp1,&lvalu);
                  lsp->u.s_subrange.max = lvalu;
                  if (lsp->u.s_subrange.rangetype != lsp1)  error(107);
                }
              else
                { lsp = lcp->idtype;
                  if (lsp != nil)  *fsize = lsp->size;
                }
            }   /*sy = ident*/
          else
            { lsp = (structure*)malloc(sizeof(structure)); pshstc(lsp);
              lsp->form = subrange;
              constant1(join(fsys, setof(range_, eos)),&lsp1,&lvalu);
              if (string(lsp1)) 
                { error(148); lsp1 = nil; }
              {
                      structure* with = lsp; 
                      with->u.s_subrange.rangetype=lsp1; with->u.s_subrange.min=lvalu; with->size=intsize; }
              if (sy == range_)  insymbol(); else error(5);
              constant1(fsys,&lsp1,&lvalu);
              lsp->u.s_subrange.max = lvalu;
              if (lsp->u.s_subrange.rangetype != lsp1)  error(107);
            }
          if (lsp != nil) 
            { structure* with = lsp; 
              if (with->form == subrange) 
                if (with->u.s_subrange.rangetype != nil) 
                  if (with->u.s_subrange.rangetype == realptr)  error(399);
                  else
                    if (with->u.s_subrange.min.u.ival > with->u.s_subrange.max.u.ival)  error(102);}
        }
      *fsp = lsp;
      if (! (inset(sy, fsys))) 
        { error(6); skip(fsys); }
    }
      else *fsp = nil;
}   /*simpletype*/ 



static void fieldlist(setofsys fsys, stp* frecvar, addrrange* displ)
{
      ctp lcp,lcp1,nxt,nxt1; stp lsp,lsp1,lsp2,lsp3,lsp4;
      addrrange minsize,maxsize_,lsize; valu lvalu;
      boolean test;
      nxt1 = nil; lsp = nil;
  if (! (inset(sy, (join(fsys, setof(ident,casesy, eos)))))) 
    { error(19); skip(join(fsys, setof(ident,casesy, eos))); }
  while (sy == ident) 
    { nxt = nxt1;
      do {
        if (sy == ident) 
          { lcp = (identifier*)malloc(sizeof(identifier)); ininam(lcp);
            {
                    identifier* with = lcp; 
                    strassvf(&with->name, id); with->idtype = nil; with->next = nxt;
                with->klass = field;
            }
            nxt = lcp;
            enterid(lcp);
            insymbol();
          }
        else error(2);
        if (! (inset(sy, setof(comma,colon, eos)))) 
          { error(6); skip(join(fsys, setof(comma,colon,semicolon,casesy, eos)));
          }
        test = sy != comma;
        if (! test)   insymbol();
      } while (!test);
      if (sy == colon)  insymbol(); else error(5);
      typ(join(fsys, setof(casesy,semicolon, eos)),&lsp,&lsize);
      while (nxt != nxt1) 
        {
                identifier* with = nxt; 
                align(lsp,displ);
            with->idtype = lsp; with->u.fldaddr = *displ;
            nxt = with->next; *displ = *displ + lsize;
        }
      nxt1 = lcp;
      while (sy == semicolon) 
        { insymbol();
          if (! (inset(sy, join(fsys, setof(ident,casesy,semicolon, eos))))) 
            { error(19); skip(join(fsys, setof(ident,casesy, eos))); }
        }
    }   /*while*/
  nxt = nil;
  while (nxt1 != nil) 
    {
            identifier* with = nxt1; 
            lcp = with->next; with->next = nxt; nxt = nxt1; nxt1 = lcp; }
  if (sy == casesy) 
    { lsp = (structure*)malloc(sizeof(structure)); pshstc(lsp);
      {
              structure* with = lsp; 
              with->u.s_tagfld.tagfieldp = nil; with->u.s_tagfld.fstvar = nil; with->form=tagfld; }
      *frecvar = lsp;
      insymbol();
      if (sy == ident)  
        {
          /* find possible type first */
          searchidne(setof(types, eos),&lcp1);
          /* now set up as field id */
          lcp = (identifier*)malloc(sizeof(identifier)); ininam(lcp);
          {
                  identifier* with = lcp; 
                  strassvf(&with->name, id); with->idtype = nil; with->klass=field;
              with->next = nil; with->u.fldaddr = *displ;
          }
          insymbol();
          /* If type only (undiscriminated variant), kill the id. Note
                  we should recycle the name entry. */
          if (sy == colon)  { 
            enterid(lcp); insymbol();
            if (sy == ident)  { searchid(setof(types, eos),&lcp1); insymbol(); }
            else { error(2); skip(join(fsys, setof(ofsy,lparent, eos))); lcp1 = nil; }
          } else {
             putstrs(lcp->name); /* release name string */
             lcp->name = nil; /* set no tagfield */
          }
          if (lcp1 != nil)  {
            lsp1 = lcp1->idtype;
            if (lsp1 != nil) 
              { align(lsp1,displ);
                lcp->u.fldaddr = *displ;
                /* only allocate field if named */
                if (lcp->name != nil)  *displ = *displ+lsp1->size;
                if ((lsp1->form <= subrange) || string(lsp1)) 
                  { if (comptypes(realptr,lsp1))  error(109);
                    else if (string(lsp1))  error(399);
                    lcp->idtype = lsp1; lsp->u.s_tagfld.tagfieldp = lcp;
                  }
                else error(110);
              }
            }
        }
      else { error(2); skip(join(fsys, setof(ofsy,lparent, eos))); }
      lsp->size = *displ;
      if (sy == ofsy)  insymbol(); else error(8);
      lsp1 = nil; minsize = *displ; maxsize_ = *displ;
      do { lsp2 = nil;
        if (! (inset(sy, join(fsys, setof(semicolon, eos))))) 
        {
          do { constant1(join(fsys, setof(comma,colon,lparent, eos)),&lsp3,&lvalu);
            if (lsp->u.s_tagfld.tagfieldp != nil) 
             if (! comptypes(lsp->u.s_tagfld.tagfieldp->idtype,lsp3)) error(111);
            lsp3 = (structure*)malloc(sizeof(structure)); pshstc(lsp3);
            {
                    structure* with = lsp3; 
                    with->u.s_variant.nxtvar = lsp1; with->u.s_variant.subvar = lsp2; with->u.s_variant.varval = lvalu;
                with->form = variant;
            }
            lsp4 = lsp1;
            while (lsp4 != nil) 
              {
                  structure* with = lsp4; 

                  if (with->u.s_variant.varval.u.ival == lvalu.u.ival)  error(178);
                  lsp4 = with->u.s_variant.nxtvar;
              }
            lsp1 = lsp3; lsp2 = lsp3;
            test = sy != comma;
            if (! test)  insymbol();
          } while (!test);
          if (sy == colon)  insymbol(); else error(5);
          if (sy == lparent)  insymbol(); else error(9);
          fieldlist(join(fsys, setof(rparent,semicolon, eos)),&lsp2, displ);
          if (*displ > maxsize_)  maxsize_ = *displ;
          while (lsp3 != nil) 
            { lsp4 = lsp3->u.s_variant.subvar; lsp3->u.s_variant.subvar = lsp2;
              lsp3->size = *displ;
              lsp3 = lsp4;
            }
          if (sy == rparent) 
            { insymbol();
              if (! (inset(sy, join(fsys, setof(semicolon, eos))))) 
                { error(6); skip(join(fsys, setof(semicolon, eos))); }
            }
          else error(4);
        }
        test = sy != semicolon;
        if (! test) 
          { *displ = minsize;
                insymbol();
          }
      } while (!test);
      *displ = maxsize_;
      lsp->u.s_tagfld.fstvar = lsp1;
    }
  else *frecvar = nil;
}   /*fieldlist*/ 



static void typ(setofsys fsys, stp* fsp, addrrange* fsize)
{
      stp lsp,lsp1,lsp2; disprange oldtop; ctp lcp;
      addrrange lsize,displ; integer lmin,lmax;
      boolean test; boolean ispacked;

      /*typ*/
  if (! (inset(sy, typebegsys))) 
     { error(10); skip(join(fsys, typebegsys)); }
  if (inset(sy, typebegsys)) 
    {
      if (inset(sy, simptypebegsys))  simpletype(fsys,fsp,fsize);
      else
/*^*/     if (sy == arrow) 
          { lsp = (structure*)malloc(sizeof(structure)); pshstc(lsp); *fsp = lsp;
            {
                    structure* with = lsp; 
                    with->u.eltype = nil; with->size = ptrsize; with->form=pointer; }
            insymbol();
            if (sy == ident) 
              { prterr = false;      /*no error if search not successful*/
                searchid(setof(types, eos),&lcp); prterr = true;
                if (lcp == nil)     /*forward referenced type id*/
                  { lcp = (identifier*)malloc(sizeof(identifier)); ininam(lcp);
                    {
                            identifier* with = lcp; 
                            strassvf(&with->name, id); with->idtype = lsp;
                        with->next = fwptr; with->klass = types;
                    }
                    fwptr = lcp;
                  }
                else lsp->u.eltype = lcp->idtype;
                insymbol();
              }
            else error(2);
          }
        else
          {
            ispacked = false;  /* set not packed by default */
            if (sy == packedsy) 
              { insymbol(); ispacked = true;    /* packed */
                if (! (inset(sy, typedels))) 
                  {
                    error(10); skip(join(fsys, typedels));
                  }
              }
/*array*/     if (sy == arraysy) 
              { insymbol();
                if (sy == lbrack)  insymbol(); else error(11);
                lsp1 = nil;
                do { lsp = (structure*)malloc(sizeof(structure)); pshstc(lsp);
                  {
                          structure* with = lsp; 
                          with->u.s_arrays.aeltype = lsp1; with->u.s_arrays.inxtype = nil; with->form=arrays; 
                          with->packing = ispacked; }
                  lsp1 = lsp;
                  simpletype(join(fsys, setof(comma,rbrack,ofsy, eos)),&lsp2,&lsize);
                  lsp1->size = lsize;
                  if (lsp2 != nil) 
                    if (lsp2->form <= subrange) 
                      {
                        if (lsp2 == realptr) 
                          { error(109); lsp2 = nil; }
                        else
                          if (lsp2 == intptr) 
                            { error(149); lsp2 = nil; }
                        lsp->u.s_arrays.inxtype = lsp2;
                      }
                    else { error(113); lsp2 = nil; }
                  test = sy != comma;
                  if (! test)  insymbol();
                } while (!test);
                if (sy == rbrack)  insymbol(); else error(12);
                if (sy == ofsy)  insymbol(); else error(8);
                typ(fsys,&lsp,&lsize);
                do {
                  {
                          structure* with = lsp1; 
                          lsp2 = with->u.s_arrays.aeltype; with->u.s_arrays.aeltype = lsp;
                      if (with->u.s_arrays.inxtype != nil) 
                        { getbounds(with->u.s_arrays.inxtype,&lmin,&lmax);
                          align(lsp,&lsize);
                          lsize = lsize*(lmax - lmin + 1);
                          with->size = lsize;
                        }
                  }
                  lsp = lsp1; lsp1 = lsp2;
                } while (!(lsp1 == nil));
              }
            else
/*record*/      if (sy == recordsy) 
                { insymbol();
                  oldtop = top;
                  if (top < displimit) 
                    { top = top + 1;
                      {
                              struct A2* with = &display[top - min_disprange]; 
                              with->fname = nil;
                              with->flabel = nil;
                              with->fconst = nil;
                              with->fstruct = nil;
                              with->occur = rec;
                      }
                    }
                  else error(250);
                  displ = 0;
                  fieldlist(join(difference(fsys, setof(semicolon, eos)), setof(endsy, eos)),&lsp1, &displ);
                  lsp = (structure*)malloc(sizeof(structure));
                  {
                          structure* with = lsp; 
                          with->u.s_records.fstfld = display[top - min_disprange].fname; 
                      display[top - min_disprange].fname = nil;
                      with->u.s_records.recvar = lsp1; with->size = displ; with->form = records; 
                      with->packing = ispacked;
                      with->u.s_records.recyc = display[top - min_disprange].fstruct; 
                      display[top - min_disprange].fstruct = nil;
                  }
                  putdsps(oldtop); top = oldtop;
                  /* register the record late because of the purge above */
                  pshstc(lsp);
                  if (sy == endsy)  insymbol(); else error(13);
                }
              else
/*set*/        if (sy == setsy) 
                  { insymbol();
                    if (sy == ofsy)  insymbol(); else error(8);
                    simpletype(fsys,&lsp1,&lsize);
                    if (lsp1 != nil) 
                      if (lsp1->form > subrange) 
                        { error(115); lsp1 = nil; }
                      else
                        if (lsp1 == realptr) 
                          { error(114); lsp1 = nil; }
                        else if (lsp1 == intptr) 
                          { error(169); lsp1 = nil; }
                        else
                          { getbounds(lsp1,&lmin,&lmax);
                            if ((lmin < setlow) || (lmax > sethigh))
                                   error(169);
                          }
                    lsp = (structure*)malloc(sizeof(structure)); pshstc(lsp);
                    {
                            structure* with = lsp; 
                            with->u.s_power.elset=lsp1; with->size=setsize; with->form=power; 
                            with->packing = ispacked; with->u.s_power.matchpack = true; }
                  }
                else
/*file*/        if (sy == filesy) 
                      { insymbol();
                        if (sy == ofsy)  insymbol(); else error(8);
                        typ(fsys,&lsp1,&lsize);
                        if (filecomponent(lsp1))  error(190);
                        lsp = (structure*)malloc(sizeof(structure)); pshstc(lsp);
                        {
                                structure* with = lsp; 
                                with->u.filtype = lsp1; with->size = filesize+lsize; 
                            with->form = files; with->packing = ispacked;
                        }
                      }
            *fsp = lsp;
          }
      if (! (inset(sy, fsys))) 
        { error(6); skip(fsys); }
    }
  else *fsp = nil;
  if (*fsp == nil)  *fsize = 1; else *fsize = (*fsp)->size;
}   /*typ*/ 



static void labeldeclaration(setofsys* fsys)
{
      lbp llp;
      boolean test;

  do {
    if (sy == intconst)  {
      searchlabel(&llp, top); /* search preexisting label */
      if (llp != nil)  error(166);  /* multideclared label */
      else newlabel(&llp);
      insymbol();
    } else error(15);
    if (! ( inset(sy, join(*fsys, setof(comma, semicolon, eos))) )) 
      { error(6); skip(join(*fsys, setof(comma,semicolon, eos))); }
    test = sy != comma;
    if (! test)  insymbol();
  } while (!test);
  if (sy == semicolon)  insymbol(); else error(14);
}   /* labeldeclaration */ 



static void constdeclaration(setofsys* fsys)
{
      ctp lcp; stp lsp; valu lvalu;

  if (sy != ident) 
    { error(2); skip(join(*fsys, setof(ident, eos))); }
  while (sy == ident) 
    { lcp = (identifier*)malloc(sizeof(identifier)); ininam(lcp);
      {
              identifier* with = lcp; 
              strassvf(&with->name, id); with->idtype = nil; with->next = nil; with->klass=konst; }
      insymbol();
      if ((sy == relop) && (op == eqop))  insymbol(); else error(16);
      constant1(join(*fsys, setof(semicolon, eos)),&lsp,&lvalu);
      enterid(lcp);
      lcp->idtype = lsp; lcp->u.values = lvalu;
      if (sy == semicolon) 
        { insymbol();
          if (! (inset(sy, join(*fsys, setof(ident, eos))))) 
            { error(6); skip(join(*fsys, setof(ident, eos))); }
        }
      else error(14);
    }
}   /*constdeclaration*/ 



static void typedeclaration(setofsys* fsys)
{
      ctp lcp,lcp1,lcp2,lcp3; stp lsp; addrrange lsize;

  if (sy != ident) 
    { error(2); skip(join(*fsys, setof(ident, eos))); }
  while (sy == ident) 
    { lcp = (identifier*)malloc(sizeof(identifier)); ininam(lcp);
      {
              identifier* with = lcp; 
              strassvf(&with->name, id); with->idtype = nil; with->klass = types; }
      insymbol();
      if ((sy == relop) && (op == eqop))  insymbol(); else error(16);
      typ(join(*fsys, setof(semicolon, eos)),&lsp,&lsize);
      enterid(lcp);
      lcp->idtype = lsp;
      /*has any forward reference been satisfied:*/
      lcp1 = fwptr;
      while (lcp1 != nil) 
        {
          lcp3 = nil;  /* set no entry found */
          if (strequvv(lcp1->name, lcp->name)) 
            { lcp1->idtype->u.eltype = lcp->idtype; 
              lcp3 = lcp1;  /* save found entry */
              if (lcp1 != fwptr) 
                lcp2->next = lcp1->next;
              else fwptr = lcp1->next;
            }
          else lcp2 = lcp1;
          lcp1 = lcp1->next;
          /* release entry if found */
          if (lcp3 != nil)  putnam(lcp3);
        }
      if (sy == semicolon) 
        { insymbol();
          if (! (inset(sy, join(*fsys, setof(ident, eos))))) 
            { error(6); skip(join(*fsys, setof(ident, eos))); }
        }
      else error(14);
    }
  if (fwptr != nil) 
    { error(117); twrite(&output, "\n");
      do { cwrite(" type-id "); writev(fwptr->name, prtlln); cwrite("\n");
        lcp3 = fwptr;  /* save entry */
        fwptr = fwptr->next;
        putnam(lcp3); /* release entry */
      } while (!(fwptr == nil));
      if (! eol)  twrite(&output, "%*c",' ', chcnt+16);
    }
}   /*typedeclaration*/ 



static void vardeclaration(setofsys* fsys)
{
      ctp lcp,nxt; stp lsp; addrrange lsize;
      boolean test;
      nxt = nil;
  do {
    do {
      if (sy == ident) 
        { lcp = (identifier*)malloc(sizeof(identifier)); ininam(lcp);
          {
                 identifier* with = lcp; 
                 strassvf(&with->name, id); with->next = nxt; with->klass = vars;
              with->idtype = nil; with->u.s_vars.vkind = actual; with->u.s_vars.vlev = level;
          }
          enterid(lcp);
          nxt = lcp;
          insymbol();
        }
      else error(2);
      if (! (inset(sy, join(join(*fsys, setof(comma,colon, eos)), typedels)))) 
        { error(6); skip(join(join(*fsys, setof(comma,colon,semicolon, eos)), typedels)); }
      test = sy != comma;
      if (! test)  insymbol();
    } while (!test);
    if (sy == colon)  insymbol(); else error(5);
    typ(join(join(*fsys, setof(semicolon, eos)), typedels),&lsp,&lsize);
    while (nxt != nil) 
      {
              identifier* with = nxt; 
              align(lsp,&lc);
          with->idtype = lsp; with->u.s_vars.vaddr = lc;
          lc = lc + lsize; nxt = with->next;
      }
    if (sy == semicolon) 
      { insymbol();
        if (! (inset(sy, join(*fsys, setof(ident, eos))))) 
          { error(6); skip(join(*fsys, setof(ident, eos))); }
      }
    else error(14);
  } while (!((sy != ident) && ! (inset(sy, typedels))));
  if (fwptr != nil) 
    { error(117); twrite(&output, "\n");
      do { cwrite(" type-id "); writev(fwptr->name, prtlln); cwrite("\n");
        fwptr = fwptr->next;
      } while (!(fwptr == nil));
      if (! eol)  twrite(&output, "%*c",' ', chcnt+16);
    }
}   /*vardeclaration*/ 

  static void procdeclaration(symbol fsy, setofsys* fsys);
                                               /*markp: marktype;*/

static void pushlvl(boolean forw, ctp lcp)
{
  if (level < maxlevel)  level = level + 1; else error(251);
  if (top < displimit) 
    { top = top + 1;
      {
          struct A2* with = &display[top - min_disprange]; 

          if (forw)  with->fname = lcp->u.s_proc.pflist;
          else with->fname = nil;
          with->flabel = nil; with->fconst = nil; with->fstruct = nil;
          with->occur = blck;
      }
    }
  else error(250);
}



static void parameterlist(setofsys fsy, ctp* fpar, setofsys* fsys, boolean* forw)
{
      ctp lcp,lcp1,lcp2,lcp3; stp lsp; idkind lkind;
    addrrange llc,lsize; integer count;
    unsigned char oldlev; disprange oldtop;
    addrrange lcs;
    boolean test;
      lcp1 = nil;
  if (! (inset(sy, join(fsy, setof(lparent, eos))))) 
    { error(7); skip(join(join(*fsys, fsy), setof(lparent, eos))); }
  if (sy == lparent) 
    { if (*forw)  error(119);
      insymbol();
      if (! (inset(sy, setof(ident,varsy,procsy,funcsy, eos)))) 
        { error(7); skip(join(*fsys, setof(ident,rparent, eos))); }
      while (inset(sy, setof(ident,varsy,procsy,funcsy, eos))) 
        {
          if (sy == procsy) 
            {
              insymbol(); lcp = nil;
              if (sy == ident) 
                { lcp = (identifier*)malloc(sizeof(identifier)); ininam(lcp);
                  {
                          identifier* with = lcp; 
                          strassvf(&with->name, id); with->idtype = nil; with->next = lcp1;
                      with->u.s_proc.u.s_declared.pflev = level/*beware of parameter procedures*/;
                      with->klass=proc;with->u.s_proc.pfdeckind=declared;
                      with->u.s_proc.u.s_declared.pfkind=formal; with->u.s_proc.pfaddr = lc; with->keep = true;
                  }
                  enterid(lcp);
                  lcp1 = lcp;
                  align(parmptr,&lc);
                  lc = lc+ptrsize*2;  /* mp and addr */
                  insymbol();
                }
              else error(2);
              oldlev = level; oldtop = top; pushlvl(false, lcp);
              lcs = lc; parameterlist(setof(semicolon,rparent, eos),&lcp2, fsys, forw); lc = lcs;
              if (lcp != nil)  lcp->u.s_proc.pflist = lcp2;
              if (! (inset(sy, join(*fsys, setof(semicolon,rparent, eos))))) 
                { error(7);skip(join(*fsys, setof(semicolon,rparent, eos))); }
              level = oldlev; putdsps(oldtop); top = oldtop;
            }
          else
            {
              if (sy == funcsy) 
                { lcp2 = nil;
                  insymbol();
                  if (sy == ident) 
                    { lcp = (identifier*)malloc(sizeof(identifier)); ininam(lcp);
                      {
                              identifier* with = lcp; 
                              strassvf(&with->name, id); with->idtype = nil; with->next = lcp1;
                          with->u.s_proc.u.s_declared.pflev = level/*beware param funcs*/;
                          with->klass=func;with->u.s_proc.pfdeckind=declared;
                          with->u.s_proc.u.s_declared.pfkind=formal; with->u.s_proc.pfaddr=lc; with->keep = true;
                      }
                      enterid(lcp);
                      lcp1 = lcp;
                      align(parmptr,&lc);
                      lc = lc+ptrsize*2;  /* mp and addr */
                      insymbol();
                    }
                  else error(2);
                  oldlev = level; oldtop = top; pushlvl(false, lcp);
                  lcs = lc; parameterlist(setof(colon,semicolon,rparent, eos),&lcp2, fsys, forw); lc = lcs;
                  if (lcp != nil)  lcp->u.s_proc.pflist = lcp2;
                  if (! (inset(sy, join(*fsys, setof(colon, eos))))) 
                    { error(7);skip(join(*fsys, setof(comma,semicolon,rparent, eos))); }
                  if (sy == colon) 
                    { insymbol();
                      if (sy == ident) 
                        { searchid(setof(types, eos),&lcp2);
                          lsp = lcp2->idtype;
                          lcp->idtype = lsp;
                          if (lsp != nil) 
                           if (!(inset(lsp->form, setof(scalar,subrange,pointer, eos))))
                                   { error(120); lsp = nil; }
                          insymbol();
                        }
                      else error(2);
                      if (! (inset(sy, join(*fsys, setof(semicolon,rparent, eos))))) 
                        { error(7);skip(join(*fsys, setof(semicolon,rparent, eos)));}
                    }
                  else error(5);
                  level = oldlev; putdsps(oldtop); top = oldtop;
                }
              else
                {
                  if (sy == varsy) 
                    { lkind = formal; insymbol(); }
                  else lkind = actual;
                  lcp2 = nil;
                  count = 0;
                  do {
                    if (sy == ident) 
                      { lcp = (identifier*)malloc(sizeof(identifier)); ininam(lcp);
                        {
                                identifier* with = lcp; 
                                strassvf(&with->name,id); with->idtype=nil; with->klass=vars;
                            with->u.s_vars.vkind = lkind; with->next = lcp2; with->u.s_vars.vlev = level; 
                            with->keep = true;
                        }
                        enterid(lcp);
                        lcp2 = lcp; count = count+1;
                        insymbol();
                      }
                    if (! (inset(sy, join(setof(comma,colon, eos), *fsys)))) 
                      { error(7);skip(join(*fsys, setof(comma,semicolon,rparent, eos)));
                      }
                    test = sy != comma;
                    if (! test)  insymbol();
                  } while (!test);
                  if (sy == colon) 
                    { insymbol();
                      if (sy == ident) 
                        { searchid(setof(types, eos),&lcp);
                          lsp = lcp->idtype;
                          lsize = ptrsize;
                          if (lsp != nil) 
                            if (lkind==actual) 
                              if (lsp->form<=power)  lsize = lsp->size;
                              else if (lsp->form==files)  error(121);
                          align(parmptr,&lsize);
                          lcp3 = lcp2;
                          align(parmptr,&lc);
                          lc = lc+count*lsize;
                          llc = lc;
                          while (lcp2 != nil) 
                            { lcp = lcp2;
                              {
                                      identifier* with = lcp2; 
                                      with->idtype = lsp;
                                  llc = llc-lsize;
                                  with->u.s_vars.vaddr = llc;
                              }
                              lcp2 = lcp2->next;
                            }
                          lcp->next = lcp1; lcp1 = lcp3;
                          insymbol();
                        }
                      else error(2);
                      if (! (inset(sy, join(*fsys, setof(semicolon,rparent, eos))))) 
                        { error(7);skip(join(*fsys, setof(semicolon,rparent, eos)));}
                    }
                  else error(5);
                }
            }
          if (sy == semicolon) 
            { insymbol();
              if (! (inset(sy, join(*fsys, setof(ident,varsy,procsy,funcsy, eos))))) 
                { error(7); skip(join(*fsys, setof(ident,rparent, eos))); }
            }
        }   /*while*/ 
      if (sy == rparent) 
        { insymbol();
          if (! (inset(sy, join(fsy, *fsys)))) 
            { error(6); skip(join(fsy, *fsys)); }
        }
      else error(4);
      lcp3 = nil;
      /*reverse pointers and reserve local cells for copies of multiple
             values*/
      while (lcp1 != nil) 
        {
                identifier* with = lcp1; 
                lcp2 = with->next; with->next = lcp3;
            if (with->klass == vars) 
              if (with->idtype != nil) 
                if ((with->u.s_vars.vkind==actual)&&(with->idtype->form>power)) 
                  { align(with->idtype,&lc);
                    with->u.s_vars.vaddr = lc;
                    lc = lc+with->idtype->size;
                  }
            lcp3 = lcp1; lcp1 = lcp2;
        }
      *fpar = lcp3;
    }
      else *fpar = nil;
} /*parameterlist*/ 



static void procdeclaration(symbol fsy, setofsys* fsys)
{
      unsigned char oldlev; ctp lcp,lcp1; stp lsp;
      boolean forw; disprange oldtop;
      addrrange llc,lcm; integer lbname;

      /*procdeclaration*/
  llc = lc; lc = lcaftermarkstack; forw = false;
  if (sy == ident) 
    { searchsection(display[top - min_disprange].fname,&lcp); /*decide whether forw.*/
      if (lcp != nil) 
        {
          if (lcp->klass == proc) 
            forw = lcp->u.s_proc.u.s_declared.u.s_actual.forwdecl &&(fsy==procsy)&&(lcp->u.s_proc.u.s_declared.pfkind==actual);
          else
            if (lcp->klass == func) 
              forw=lcp->u.s_proc.u.s_declared.u.s_actual.forwdecl &&(fsy==funcsy)&&(lcp->u.s_proc.u.s_declared.pfkind==actual);
            else forw = false;
          if (! forw)  error(160);
        }
      if (! forw) 
        {
          if (fsy == procsy)  lcp = (identifier*)malloc(sizeof(identifier));
          else lcp = (identifier*)malloc(sizeof(identifier)); ininam(lcp);
          {
                  identifier* with = lcp; 
                  strassvf(&with->name, id); with->idtype = nil;
              with->u.s_proc.u.s_declared.u.s_actual.externl = false; with->u.s_proc.u.s_declared.pflev = level; genlabel(&lbname);
              with->u.s_proc.pfdeckind = declared; with->u.s_proc.u.s_declared.pfkind = actual; with->u.s_proc.u.s_declared.pfname = lbname;
              if (fsy == procsy)  with->klass = proc;
              else with->klass = func;
          }
          enterid(lcp);
        }
      else
        { lcp1 = lcp->u.s_proc.pflist;
          while (lcp1 != nil) 
            {
              { identifier* with = lcp1; 
                if (with->klass == vars) 
                  if (with->idtype != nil) 
                    { lcm = with->u.s_vars.vaddr + with->idtype->size;
                      if (lcm > lc)  lc = lcm;
                    }}
              lcp1 = lcp1->next;
            }
        }
      insymbol();
    }
  else
    { error(2); lcp = ufctptr; }
  oldlev = level; oldtop = top;
  pushlvl(forw, lcp);
  if (fsy == procsy) 
    { parameterlist(setof(semicolon, eos),&lcp1, fsys, &forw);
      if (! forw)  lcp->u.s_proc.pflist = lcp1;
    }
  else
    { parameterlist(setof(semicolon,colon, eos),&lcp1, fsys, &forw);
      if (! forw)  lcp->u.s_proc.pflist = lcp1;
      if (sy == colon) 
        { insymbol();
          if (sy == ident) 
            { if (forw)  error(122);
              searchid(setof(types, eos),&lcp1);
              lsp = lcp1->idtype;
              lcp->idtype = lsp;
              if (lsp != nil) 
                if (! (inset(lsp->form, setof(scalar,subrange,pointer, eos)))) 
                  { error(120); lcp->idtype = nil; }
              insymbol();
            }
          else { error(2); skip(join(*fsys, setof(semicolon, eos))); }
        }
      else
        if (! forw)  error(123);
    }
  if (sy == semicolon)  insymbol(); else error(14);
  if ((sy == ident) && strequri("forward  ", id)) 
    {
      if (forw)  error(161);
      else lcp->u.s_proc.u.s_declared.u.s_actual.forwdecl = true;
      insymbol();
      if (sy == semicolon)  insymbol(); else error(14);
      if (! (inset(sy, *fsys))) 
        { error(6); skip(*fsys); }
    }
  else
    { lcp->u.s_proc.u.s_declared.u.s_actual.forwdecl = false;
      /* mark(markp); */
      do { block(*fsys,semicolon,lcp);
        if (sy == semicolon) 
          { if (prtables)  printtables(false); insymbol();
            if (! (inset(sy, setof(beginsy,procsy,funcsy, eos)))) 
              { error(6); skip(*fsys); }
          }
        else error(14);
      } while (!((inset(sy, setof(beginsy,procsy,funcsy, eos))) || eof(input)));
      /* release(markp); */ /* return local entries on runtime heap */
    }
  level = oldlev; putdsps(oldtop); top = oldtop; lc = llc;
}   /*procdeclaration*/ 

  static void body(setofsys fsys, ctp* fprocp);

#define cstoccmax 4000    /*65*/
#define cixmax 1000

                                               /* cstoccmax was too small [sam] */
typedef unsigned char oprange;



      /* add statement level */
static void addlvl()
{
  stalvl = stalvl+1;
}



      /* remove statement level */
static void sublvl()
{
    lbp llp;

   stalvl = stalvl-1;
   /* traverse label list for current block and remove any label from
           active status whose statement block has closed */
   llp = display[top - min_disprange].flabel;
   while (llp != nil)  {
     labl* with = llp;  
     if (with->slevel > stalvl)  with->bact = false;
     llp = with->nextlab; /* link next */
                       }
}



static void mes(integer i, integer* topnew, integer* topmax)
{ *topnew = *topnew + cdx[i]*maxstack;
  if (*topnew > *topmax)  *topmax = *topnew;
}



static void putic()
{ if (ic % 10 == 0)  twrite(&prr, "i%5i\n",ic); }



static void gen0(oprange fop, integer* topnew, integer* topmax)
{
  if (prcode)  { putic(); twrite(&prr, "%4s\n",1, items(mn[fop]), mn[fop]); }
  ic = ic + 1; mes(fop, topnew, topmax);
}   /*gen0*/ 



static void gen1(oprange fop, integer fp2, integer* topnew, integer* topmax, csp cstptr[cstoccmax])
{
      integer k, j; strvsp p;

  if (prcode) 
    { putic(); twrite(&prr, "%4s",1, items(mn[fop]), mn[fop]);
      if (fop == 30) 
        { twrite(&prr, "%12s\n",1, items(sna[fp2-(1)]), sna[fp2-(1)]);
          *topnew = *topnew + pdx[fp2-(1)]*maxstack;
          if (*topnew > *topmax)  *topmax = *topnew;
        }
      else
        {
          if (fop == 38) 
             { {
                                              constant* with = cstptr[fp2-(1)];   p = with->u.s_strg.sval; j = 1;
                 twrite(&prr, " %4i '",with->u.s_strg.slgth);
                 for( k = 1; k <= lenpv(p); k ++) {
                   if (p->str[j-(1)] == '\'')  twrite(&prr, "''");
                   else twrite(&prr, "%1c",p->str[j-(1)]);
                   j = j+1; if (j > varsqt)  { 
                     p = p->next; j = 1; 
                   }
                 }
               }
               twrite(&prr, "\'\n");
             }
          else if (fop == 42)  twrite(&prr, "%c\n",chr(fp2));
          else if (fop == 67)  twrite(&prr, "%4i\n",fp2);
          else twrite(&prr, "%12i\n",fp2);
          mes(fop, topnew, topmax);
        }
    }
  ic = ic + 1;
}   /*gen1*/ 



static void gen2(oprange fop, integer fp1,integer fp2, csp cstptr[cstoccmax], integer* topnew, integer* topmax)
{
      integer k;

  if (prcode) 
    { putic(); twrite(&prr, "%4s",1, items(mn[fop]), mn[fop]);
      switch (fop) {
        case 45:case 50:case 54:case 56:case 74:case 62:case 63:
          twrite(&prr, " %3i%8i\n",fp1,fp2);
          break;
        case 47:case 48:case 49:case 52:case 53:case 55:
          { twrite(&prr, "%c",chr(fp1));
            if (chr(fp1) == 'm')  twrite(&prr, "%11i",fp2);
            twrite(&prr, "\n");
          }
          break;
        case 51:
          switch (fp1) {
            case 1: twrite(&prr, "i %i\n",fp2); break;
            case 2: { twrite(&prr, "r ");
                 { constant* with = cstptr[fp2-(1)]; 
                   for( k = 1; k <= strglgth; k ++) twrite(&prr, "%c",with->u.rval[k-(1)]);}
                 twrite(&prr, "\n");
               }
               break;
            case 3: twrite(&prr, "b %i\n",fp2); break;
            case 4: twrite(&prr, "n\n"); break;
            case 6: twrite(&prr, "%3z%c\'\n","c '",chr(fp2)); break;
            case 5: { twrite(&prr, "(");
                 { constant* with = cstptr[fp2-(1)]; 
                   for( k = setlow; k <= sethigh; k ++)
                     /* increased for testing [sam] */
                     if (inset(k, with->u.pval))  twrite(&prr, "%7i",k/*3*/);}
                 twrite(&prr, ")\n");
               }
               break;
          }
          break;
      }
    }
  ic = ic + 1; mes(fop, topnew, topmax);
}   /*gen2*/ 



static void gentypindicator(stp fsp)
{
  if (fsp!=nil) 
    { structure* with = fsp; 
      switch (with->form) {
       case scalar: if (fsp==intptr)  twrite(&prr, "i");
               else
                 if (fsp==boolptr)  twrite(&prr, "b");
                 else
                   if (fsp==charptr)  twrite(&prr, "c");
                   else
                     if (with->u.s_scalar.scalkind == declared)  twrite(&prr, "i");
                     else twrite(&prr, "r");
                     break;
       case subrange: gentypindicator(with->u.s_subrange.rangetype); break;
       case pointer:  twrite(&prr, "a"); break;
       case power:    twrite(&prr, "s"); break;
       case records:case arrays: twrite(&prr, "m"); break;
       case files:    twrite(&prr, "a"); break;
       case tagfld:case variant: error(500);
       break;
      }}
}   /*typindicator*/



static void gen0t(oprange fop, stp fsp, integer* topnew, integer* topmax)
{
  if (prcode) 
    { putic();
      twrite(&prr, "%4s",1, items(mn[fop]), mn[fop]);
      gentypindicator(fsp);
      twrite(&prr, "\n");
    }
  ic = ic + 1; mes(fop, topnew, topmax);
}   /*gen0t*/



static void gen1t(oprange fop, integer fp2, stp fsp, integer* topnew, integer* topmax)
{
  if (prcode) 
    { putic();
      twrite(&prr, "%4s",1, items(mn[fop]), mn[fop]);
      gentypindicator(fsp);
      twrite(&prr, "%11i\n",fp2);
    }
  ic = ic + 1; mes(fop, topnew, topmax);
}   /*gen1t*/



static void gen2t(oprange fop, integer fp1,integer fp2, stp fsp, integer* topnew, integer* topmax)
{
  if (prcode) 
    { putic();
      twrite(&prr, "%4s",1, items(mn[fop]), mn[fop]);
      gentypindicator(fsp);
      twrite(&prr, "%*i%11i\n",fp1,3+5*ord(abs(fp1)>99),fp2);
    }
  ic = ic + 1; mes(fop, topnew, topmax);
}   /*gen2t*/



static void load(csp cstptr[cstoccmax], integer* topnew, integer* topmax, unsigned short* cstptrix)
{
    if (gattr.typtr != nil) 
      {
        switch (gattr.kind) {
          case cst:   if ((gattr.typtr->form == scalar) && (gattr.typtr != realptr)) 
                   if (gattr.typtr == boolptr)  gen2(51/*ldc*/,3,gattr.u.cval.u.ival, cstptr, topnew, topmax);
                   else
                     if (gattr.typtr==charptr) 
                       gen2(51/*ldc*/,6,gattr.u.cval.u.ival, cstptr, topnew, topmax);
                     else gen2(51/*ldc*/,1,gattr.u.cval.u.ival, cstptr, topnew, topmax);
                 else
                   if (gattr.typtr == nilptr)  gen2(51/*ldc*/,4,0, cstptr, topnew, topmax);
                   else
                     if (*cstptrix >= cstoccmax)  error(254);
                     else
                       { *cstptrix = *cstptrix + 1;
                         cstptr[*cstptrix-(1)] = gattr.u.cval.u.valp;
                         if (gattr.typtr == realptr) 
                           gen2(51/*ldc*/,2,*cstptrix, cstptr, topnew, topmax);
                         else
                           gen2(51/*ldc*/,5,*cstptrix, cstptr, topnew, topmax);
                       }
                       break;
          case varbl: switch (gattr.u.s_varbl.access) {
                   case drct:   if (gattr.u.s_varbl.u.s_drct.vlevel<=1)  gen1t(39/*ldo*/,gattr.u.s_varbl.u.s_drct.dplmt,gattr.typtr, topnew, topmax);
                           else gen2t(54/*lod*/,level-gattr.u.s_varbl.u.s_drct.vlevel,gattr.u.s_varbl.u.s_drct.dplmt,gattr.typtr, topnew, topmax);
                           break;
                   case indrct: gen1t(35/*ind*/,gattr.u.s_varbl.u.idplmt,gattr.typtr, topnew, topmax); break;
                   case inxd:   error(400);
                   break;
                 }
                 break;
          case expr:;
          break;
        }
        gattr.kind = expr;
      }
}   /*load*/ 



static void store_(attr* fattr, integer* topnew, integer* topmax)
{
    if (fattr->typtr != nil) 
      switch (fattr->u.s_varbl.access) {
        case drct:   if (fattr->u.s_varbl.u.s_drct.vlevel <= 1)  gen1t(43/*sro*/,fattr->u.s_varbl.u.s_drct.dplmt,fattr->typtr, topnew, topmax);
                else gen2t(56/*str*/,level-fattr->u.s_varbl.u.s_drct.vlevel,fattr->u.s_varbl.u.s_drct.dplmt,fattr->typtr, topnew, topmax);
                break;
        case indrct: if (fattr->u.s_varbl.u.idplmt != 0)  error(400);
                else gen0t(26/*sto*/,fattr->typtr, topnew, topmax);
                break;
        case inxd:   error(400);
        break;
      }
}   /*store*/ 



static void loadaddress(unsigned short* cstptrix, csp cstptr[cstoccmax], integer* topnew, integer* topmax)
{
    if (gattr.typtr != nil) 
      {
        switch (gattr.kind) {
          case cst:   if (string(typtr)) 
                   if (*cstptrix >= cstoccmax)  error(254);
                   else
                     { *cstptrix = *cstptrix + 1;
                       cstptr[*cstptrix-(1)] = gattr.u.cval.u.valp;
                       gen1(38/*lca*/,*cstptrix, topnew, topmax, cstptr);
                     }
                 else error(400);
                 break;
          case varbl: switch (gattr.u.s_varbl.access) {
                   case drct:   if (gattr.u.s_varbl.u.s_drct.vlevel <= 1)  gen1(37/*lao*/,gattr.u.s_varbl.u.s_drct.dplmt, topnew, topmax, cstptr);
                           else gen2(50/*lda*/,level-gattr.u.s_varbl.u.s_drct.vlevel,gattr.u.s_varbl.u.s_drct.dplmt, cstptr, topnew, topmax);
                           break;
                   case indrct: if (gattr.u.s_varbl.u.idplmt != 0) 
                             gen1t(34/*inc*/,gattr.u.s_varbl.u.idplmt,nilptr, topnew, topmax);
                             break;
                   case inxd:   error(400);
                   break;
                 }
                 break;
          case expr:  error(400);
          break;
        }
        gattr.kind = varbl; gattr.u.s_varbl.access = indrct; gattr.u.s_varbl.u.idplmt = 0;
      }
}   /*loadaddress*/ 




static void genfjp(integer faddr, csp cstptr[cstoccmax], integer* topnew, integer* topmax, unsigned short* cstptrix)
{ load(cstptr, topnew, topmax, cstptrix);
  if (gattr.typtr != nil) 
    if (gattr.typtr != boolptr)  error(144);
  if (prcode)  { putic(); twrite(&prr, "%4s%8z%4i\n",1, items(mn[33]), mn[33]," l",faddr); }
  ic = ic + 1; mes(33, topnew, topmax);
}   /*genfjp*/ 



static void genujpxjp(oprange fop, integer fp2, integer* topnew, integer* topmax)
{
 if (prcode) 
    { putic(); twrite(&prr, "%4s%8z%4i\n", 1, items(mn[fop]), mn[fop], " l",fp2); }
  ic = ic + 1; mes(fop, topnew, topmax);
}   /*genujpxjp*/



static void genipj(oprange fop, integer fp1, integer fp2, integer* topnew, integer* topmax)
{
 if (prcode) 
    { putic(); twrite(&prr, "%4s%4i%8z%4i\n", 1, items(mn[fop]), mn[fop],fp1," l",fp2); }
  ic = ic + 1; mes(fop, topnew, topmax);
}   /*genujpxjp*/



static void gencupent(oprange fop, integer fp1,integer fp2, integer* topnew, integer* topmax)
{
  if (prcode) 
    { putic();
      if (fop == 32)  {      /* create ents or ente instructions */
        if (fp1 == 1)  twrite(&prr, "%4ss%8c%4i\n",1, items(mn[fop]), mn[fop],'l',fp2);
        else twrite(&prr, "%4se%8c%4i\n",1, items(mn[fop]), mn[fop],'l',fp2);
      } else twrite(&prr, "%4s%4i%4c%4i\n",1, items(mn[fop]), mn[fop],fp1,'l',fp2);
    }
  ic = ic + 1; mes(fop, topnew, topmax);
}



static void genlpa(integer fp1,integer fp2, integer* topnew, integer* topmax)
{
  if (prcode) 
    { putic();
      twrite(&prr, "%4s%4i%4c%4i\n",1, items(mn[68]), mn[68],fp2,'l',fp1);
    }
  ic = ic + 1; mes(68, topnew, topmax);
}   /*genlpa*/ 



static void checkbnds(stp fsp, integer* topnew, integer* topmax)
{
      integer lmin,lmax;

  if (fsp != nil) 
    if (fsp != intptr) 
      if (fsp != realptr) 
        if (fsp->form <= subrange) 
          {
            getbounds(fsp,&lmin,&lmax);
            gen2t(45/*chk*/,lmin,lmax,fsp, topnew, topmax);
          }
}   /*checkbnds*/



static void putlabel(integer labname)
{ if (prcode)  twrite(&prr, "l%4i\n", labname);
}   /*putlabel*/

  static void statement(setofsys fsys, integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax], addrrange* lcmax);


static void selector(setofsys fsys, ctp fcp, integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax])
{
    attr lattr; ctp lcp; addrrange lsize; integer lmin,lmax;

  {
          identifier* with = fcp;

          gattr.typtr = with->idtype; gattr.kind = varbl;
      switch (with->klass) {
        case vars:
          if (with->u.s_vars.vkind == actual) 
            { gattr.u.s_varbl.access = drct; gattr.u.s_varbl.u.s_drct.vlevel = with->u.s_vars.vlev;
              gattr.u.s_varbl.u.s_drct.dplmt = with->u.s_vars.vaddr;
            }
          else
            { gen2t(54    /*lod*/,level-with->u.s_vars.vlev,with->u.s_vars.vaddr,nilptr, topnew, topmax);
              gattr.u.s_varbl.access = indrct; gattr.u.s_varbl.u.idplmt = 0;
            }
            break;
        case field:
          { struct A2* with2 = &display[disx - min_disprange]; 
            if (with2->occur == crec) 
              { gattr.u.s_varbl.access = drct; gattr.u.s_varbl.u.s_drct.vlevel = with2->u.s_crec.clev;
                gattr.u.s_varbl.u.s_drct.dplmt = with2->u.s_crec.cdspl + with->u.fldaddr;
              }
            else
              {
                if (level == 1)  gen1t(39 /*ldo*/,with2->u.vdspl,nilptr, topnew, topmax);
                else gen2t(54/*lod*/,0,with2->u.vdspl,nilptr, topnew, topmax);
                gattr.u.s_varbl.access = indrct; gattr.u.s_varbl.u.idplmt = with->u.fldaddr;
              }}
              break;
        case func:
          if (with->u.s_proc.pfdeckind == standard) 
            { error(150); gattr.typtr = nil; }
          else
            {
              if (with->u.s_proc.u.s_declared.pfkind == formal)  error(151);
              else
                if ((with->u.s_proc.u.s_declared.pflev+1!=level)||(*fprocp!=fcp))  error(177);
                { gattr.u.s_varbl.access = drct; gattr.u.s_varbl.u.s_drct.vlevel = with->u.s_proc.u.s_declared.pflev + 1;
                  gattr.u.s_varbl.u.s_drct.dplmt = 0;   /*impl. relat. addr. of fct. result*/
                }
            }
            break;
      }   /*case*/
  }     /*with*/
  if (! (inset(sy, join(selectsys, fsys)))) 
    { error(59); skip(join(selectsys, fsys)); }
  while (inset(sy, selectsys)) 
    {
/*[*/ if (sy == lbrack) 
        {
          do { lattr = gattr;
              if (lattr.typtr != nil) 
                if (lattr.typtr->form != arrays) 
                  { error(138); lattr.typtr = nil; }
            loadaddress(cstptrix, cstptr, topnew, topmax);
            insymbol(); expression(join(fsys, setof(comma,rbrack, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
            load(cstptr, topnew, topmax, cstptrix);
            if (gattr.typtr != nil) 
              if (gattr.typtr->form!=scalar)  error(113);
              else if (! comptypes(gattr.typtr,intptr)) 
                     gen0t(58/*ord*/,gattr.typtr, topnew, topmax);
            if (lattr.typtr != nil) 
              {
                  structure* with = lattr.typtr; 

                  if (comptypes(with->u.s_arrays.inxtype,gattr.typtr)) 
                    {
                      if (with->u.s_arrays.inxtype != nil) 
                        { getbounds(with->u.s_arrays.inxtype,&lmin,&lmax);
                          if (debug) 
                            gen2t(45/*chk*/,lmin,lmax,intptr, topnew, topmax);
                          if (lmin>0)  gen1t(31  /*dec*/,lmin,intptr, topnew, topmax);
                          else if (lmin<0) 
                            gen1t(34/*inc*/,-lmin,intptr, topnew, topmax);
                          /*or simply gen1(31,lmin)*/
                        }
                    }
                  else error(139);
                    { gattr.typtr = with->u.s_arrays.aeltype; gattr.kind = varbl;
                      gattr.u.s_varbl.access = indrct; gattr.u.s_varbl.u.idplmt = 0;
                    }
                  if (gattr.typtr != nil) 
                    {
                      lsize = gattr.typtr->size;
                      align(gattr.typtr,&lsize);
                      gen1(36/*ixa*/,lsize, topnew, topmax, cstptr);
                    }
              }
          } while (!(sy != comma));
          if (sy == rbrack)  insymbol(); else error(12);
        }   /*if sy = lbrack*/
      else
/*.*/   if (sy == period) 
          {
              {
                if (gattr.typtr != nil) 
                  if (gattr.typtr->form != records) 
                    { error(140); gattr.typtr = nil; }
                insymbol();
                if (sy == ident) 
                  {
                    if (gattr.typtr != nil) 
                      { searchsection(gattr.typtr->u.s_records.fstfld,&lcp);
                        if (lcp == nil) 
                          { error(152); gattr.typtr = nil; }
                        else
                          {
                                  identifier* with1 = lcp; 
                                  gattr.typtr = with1->idtype;
                              switch (gattr.u.s_varbl.access) {
                                case drct:   gattr.u.s_varbl.u.s_drct.dplmt = gattr.u.s_varbl.u.s_drct.dplmt + with1->u.fldaddr; break;
                                case indrct: gattr.u.s_varbl.u.idplmt = gattr.u.s_varbl.u.idplmt + with1->u.fldaddr; break;
                                case inxd:   error(400);
                                break;
                              }
                          }
                      }
                    insymbol();
                  }   /*sy = ident*/
                else error(2);
              }   /*with gattr*/
          }   /*if sy = period*/
        else
/*^*/     {
            if (gattr.typtr != nil) 
              { structure* with1 = gattr.typtr; 
                if (with1->form == pointer) 
                  { load(cstptr, topnew, topmax, cstptrix); gattr.typtr = with1->u.eltype;
                    if (debug)  gen2t(45  /*chk*/,1,maxaddr,nilptr, topnew, topmax);
                      { gattr.kind = varbl; gattr.u.s_varbl.access = indrct;
                        gattr.u.s_varbl.u.idplmt = 0;
                      }
                  }
                else
                  if (with1->form == files)  { loadaddress(cstptrix, cstptr, topnew, topmax);
                     /* generate buffer validate for file */
                     if (gattr.typtr == textptr)  gen0(65, topnew, topmax/*fbv*/);
                     else {
                       gen2(51/*ldc*/,1,with1->u.filtype->size, cstptr, topnew, topmax);
                       gen1t(70/*fvb*/,gattr.u.s_varbl.u.s_drct.dplmt,with1->u.filtype, topnew, topmax);
                     }
                     /* index buffer */
                     gen1t(34/*inc*/,fileidsize,gattr.typtr, topnew, topmax);
                     gattr.typtr = with1->u.filtype;
                  } else error(141);}
            insymbol();
          }
      if (! (inset(sy, join(fsys, selectsys)))) 
        { error(6); skip(join(fsys, selectsys)); }
    }   /*while*/
}   /*selector*/ 

  static void call(setofsys fsys, ctp fcp, integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax]);


static void variable(setofsys fsys, integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax])
{
      ctp lcp;

  if (sy == ident) 
    { searchid(setof(vars,field, eos),&lcp); insymbol(); }
  else { error(2); lcp = uvarptr; }
  selector(fsys,lcp, topnew, topmax, fprocp, cstptrix, cstptr);
}   /*variable*/ 



static void getputresetrewriteprocedure(integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax], setofsys* fsys, unsigned char* lkey)
{ variable(join(*fsys, setof(rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr); loadaddress(cstptrix, cstptr, topnew, topmax);
  if (gattr.typtr != nil) 
    if (gattr.typtr->form != files)  error(116);
  if (*lkey <= 2)  {
    if (gattr.typtr == textptr)  gen1(30 /*csp*/,*lkey, topnew, topmax, cstptr/*get,put*/);
    else {
      if (gattr.typtr != nil)  
        gen2(51/*ldc*/,1,gattr.typtr->u.filtype->size, cstptr, topnew, topmax);
      if (*lkey == 1)  gen1(30/*csp*/,38, topnew, topmax, cstptr/*gbf*/);
      else gen1(30/*csp*/,39, topnew, topmax, cstptr/*pbf*/);
    }
  } else
    if (gattr.typtr == textptr)  { 
      if (*lkey == 3)  gen1(30/*csp*/,25, topnew, topmax, cstptr/*reset*/);
      else gen1(30/*csp*/,26, topnew, topmax, cstptr/*rewrite*/);
    } else {
      if (*lkey == 3)  gen1(30/*csp*/,36, topnew, topmax, cstptr/*reset*/);
      else gen1(30/*csp*/,37, topnew, topmax, cstptr/*rewrite*/);
    }
}   /*getputresetrewrite*/ 



static void pageprocedure(integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax], setofsys* fsys)
{
    levrange llev; 

  llev = 1; 
  if (sy == lparent) 
  { insymbol();
    variable(join(*fsys, setof(rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr); loadaddress(cstptrix, cstptr, topnew, topmax);
    if (gattr.typtr != nil) 
      if (gattr.typtr != textptr)  error(116);
    if (sy == rparent)  insymbol(); else error(4);
  } else {
    if (! outputhdf)  error(176);
    gen2(50/*lda*/,level-outputptr->u.s_vars.vlev,outputptr->u.s_vars.vaddr, cstptr, topnew, topmax);
  }
  gen1(30/*csp*/,24, topnew, topmax, cstptr/*page*/);
}   /*page*/ 



static void readprocedure(integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax], setofsys* fsys, unsigned char* lkey)
{
      stp lsp;
      boolean txt;  /* is a text file */
      boolean deffil;  /* default file was loaded */
      boolean test;

  txt = true; deffil = true;
  if (sy == lparent) 
    { insymbol();
      variable(join(*fsys, setof(comma,rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
      lsp = gattr.typtr; test = false;
      if (lsp != nil) 
        if (lsp->form == files) 
          {
              structure* with1 = lsp; 

              txt = lsp == textptr;
              if (! txt && (*lkey == 11))  error(116);
              loadaddress(cstptrix, cstptr, topnew, topmax); deffil = false;
              if (sy == rparent) 
                { if (*lkey == 5)  error(116);
                  test = true;
                }
              else
                if (sy != comma) 
                  { error(116); skip(join(*fsys, setof(comma,rparent, eos))); }
              if (sy == comma) 
                { insymbol(); variable(join(*fsys, setof(comma,rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
                }
              else test = true;
          }
        else if (! inputhdf)  error(175);
     if (! test) 
      do { loadaddress(cstptrix, cstptr, topnew, topmax);
        if (deffil)  { 
          /* file was not loaded, we load and swap so that it ends up
                      on the bottom.*/
          gen2(50/*lda*/,level-inputptr->u.s_vars.vlev,inputptr->u.s_vars.vaddr, cstptr, topnew, topmax);
          gen1(72/*swp*/,ptrsize, topnew, topmax, cstptr); /* note 2nd is always pointer */
          deffil = false;
        }
        if (txt)  {
          if (gattr.typtr != nil) 
            if (gattr.typtr->form <= subrange) 
              if (comptypes(intptr,gattr.typtr)) 
                gen1(30/*csp*/,3, topnew, topmax, cstptr/*rdi*/);
              else
                if (comptypes(realptr,gattr.typtr)) 
                  gen1(30/*csp*/,4, topnew, topmax, cstptr/*rdr*/);
                else
                  if (comptypes(charptr,gattr.typtr)) 
                    gen1(30/*csp*/,5, topnew, topmax, cstptr/*rdc*/);
                  else error(399);
            else error(116);
        } else {       /* binary file */
          if (! comptypes(gattr.typtr,lsp->u.filtype))  error(129);
          gen2(51/*ldc*/,1,lsp->u.filtype->size, cstptr, topnew, topmax);
          gen1(30/*csp*/,35, topnew, topmax, cstptr/*rbf*/);
        }
        test = sy != comma;
        if (! test) 
          { insymbol(); variable(join(*fsys, setof(comma,rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
          }
      } while (!test);
      if (sy == rparent)  insymbol(); else error(4);
    }
  else {
    if (! inputhdf)  error(175);
    if (*lkey == 5)  error(116);
    gen2(50/*lda*/,level-inputptr->u.s_vars.vlev,inputptr->u.s_vars.vaddr, cstptr, topnew, topmax);
  }
  if (*lkey == 11)  gen1(30/*csp*/,21, topnew, topmax, cstptr/*rln*/);
  /* remove the file pointer from stack */
  gen1(71/*dmp*/,ptrsize, topnew, topmax, cstptr);
}   /*read*/ 



static void writeprocedure(unsigned char* lkey, setofsys* fsys, unsigned short* cstptrix, csp cstptr[cstoccmax], integer* topnew, integer* topmax, ctp* fprocp)
{
      stp lsp,lsp1; boolean default_, default1; unsigned char llkey;
      addrrange len;
      boolean txt;  /* is a text file */
      boolean deffil;  /* default file was loaded */
      boolean test;
      llkey = *lkey; txt = true; deffil = true;
  if (sy == lparent) 
  { insymbol();
  expression(join(*fsys, setof(comma,colon,rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
  lsp = gattr.typtr; test = false;
  if (lsp != nil) 
    if (lsp->form == files) 
      {
              structure* with1 = lsp; 
              lsp1 = lsp;
          txt = lsp == textptr;
          if (! txt && (*lkey == 12))  error(116);
          loadaddress(cstptrix, cstptr, topnew, topmax); deffil = false;
          if (sy == rparent) 
            { if (llkey == 6)  error(116);
              test = true;
            }
          else
            if (sy != comma) 
              { error(116); skip(join(*fsys, setof(comma,rparent, eos))); }
          if (sy == comma) 
            { insymbol(); expression(join(*fsys, setof(comma,colon,rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
            }
          else test = true;
      }
    else if (! outputhdf)  error(176);
  if (! test) 
  do {
    lsp = gattr.typtr;
    if (lsp != nil) 
      if (lsp->form <= subrange)  load(cstptr, topnew, topmax, cstptrix); else loadaddress(cstptrix, cstptr, topnew, topmax);
    if (deffil)  { 
      /* file was not loaded, we load and swap so that it ends up
                  on the bottom.*/
      gen2(50/*lda*/,level-outputptr->u.s_vars.vlev,outputptr->u.s_vars.vaddr, cstptr, topnew, topmax);
      if (lsp != nil) 
        if (lsp->form <= subrange)  {
        if (lsp->size < stackelsize)  
          gen1(72/*swp*/,stackelsize, topnew, topmax, cstptr); /* size of 2nd is minimum stack */
        else 
          gen1(72/*swp*/,lsp->size, topnew, topmax, cstptr); /* size of 2nd is operand */
      } else
        gen1(72/*swp*/,ptrsize, topnew, topmax, cstptr); /* size of 2nd is pointer */
      deffil = false;
    }
    if (txt)  {
      if (sy == colon) 
        { insymbol(); expression(join(*fsys, setof(comma,colon,rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
          if (gattr.typtr != nil) 
            if (gattr.typtr != intptr)  error(116);
          load(cstptr, topnew, topmax, cstptrix); default_ = false;
        }
      else default_ = true;
      if (sy == colon) 
        { insymbol(); expression(join(*fsys, setof(comma,rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
          if (gattr.typtr != nil) 
            if (gattr.typtr != intptr)  error(116);
          if (lsp != realptr)  error(124);
          load(cstptr, topnew, topmax, cstptrix); default1 = false;
        } else default1 = true;
      if (lsp == intptr) 
        { if (default_)  gen2(51     /*ldc*/,1,intdeff, cstptr, topnew, topmax);
          gen1(30/*csp*/,6, topnew, topmax, cstptr/*wri*/);
        }
      else
        if (lsp == realptr) 
          {
            if (default1)  { 
              if (default_)  gen2(51 /*ldc*/,1,reldeff, cstptr, topnew, topmax);
              gen1(30/*csp*/,8, topnew, topmax, cstptr/*wrr*/);
            } else {
              if (default_)  gen2(51 /*ldc*/,1,reldeff, cstptr, topnew, topmax);
              gen1(30/*csp*/,28, topnew, topmax, cstptr/*wrf*/);
            }
          }
        else
          if (lsp == charptr) 
            { if (default_)  gen2(51     /*ldc*/,1,chrdeff, cstptr, topnew, topmax);
              gen1(30/*csp*/,9, topnew, topmax, cstptr/*wrc*/);
            }
          else
            if (lsp == boolptr) 
              { if (default_)  gen2(51     /*ldc*/,1,boldeff, cstptr, topnew, topmax);
                gen1(30/*csp*/,27, topnew, topmax, cstptr/*wrb*/);
              }
            else
              if (lsp != nil) 
                {
                  if (lsp->form == scalar)  error(399);
                  else
                    if (string(lsp)) 
                      { len = lsp->size / charmax;
                        if (default_) 
                              gen2(51/*ldc*/,1,len, cstptr, topnew, topmax);
                        gen2(51/*ldc*/,1,len, cstptr, topnew, topmax);
                        gen1(30/*csp*/,10, topnew, topmax, cstptr/*wrs*/);
                      }
                    else error(116);
                }
    } else {       /* binary file */
      if (! comptypes(lsp1->u.filtype,lsp))  error(129);
      if (lsp == intptr)  gen1(30 /*csp*/,31, topnew, topmax, cstptr/*wbi*/);
      else
        if (lsp == realptr)  gen1(30 /*csp*/,32, topnew, topmax, cstptr/*wbr*/);
        else
          if (lsp == charptr)  gen1(30 /*csp*/,33, topnew, topmax, cstptr/*wbc*/);
          else
            if (lsp == boolptr)  gen1(30 /*csp*/,34, topnew, topmax, cstptr/*wbb*/);
            else
              if (lsp->form <= subrange)  gen1(30  /*csp*/,31, topnew, topmax, cstptr/*wbi*/);
              else
                 if (lsp != nil) 
                    {
                      gen2(51/*ldc*/,1,lsp1->u.filtype->size, cstptr, topnew, topmax);
                      gen1(30/*csp*/,30, topnew, topmax, cstptr/*wbf*/);
                    }
    }
    test = sy != comma;
    if (! test) 
      { insymbol(); expression(join(*fsys, setof(comma,colon,rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
      }
  } while (!test);
  if (sy == rparent)  insymbol(); else error(4);
  } else {
    if (! outputhdf)  error(176);
    if (*lkey == 6)  error(116);
    gen2(50/*lda*/,level-outputptr->u.s_vars.vlev,outputptr->u.s_vars.vaddr, cstptr, topnew, topmax);
  }
  if (llkey == 12)   /*writeln*/
    gen1(30/*csp*/,22, topnew, topmax, cstptr/*wln*/);
  /* remove the file pointer from stack */
  gen1(71/*dmp*/,ptrsize, topnew, topmax, cstptr);
}   /*write*/ 



static void packprocedure(integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax], setofsys* fsys)
{
      stp lsp,lsp1; integer lb, bs; attr lattr;
      variable(join(*fsys, setof(comma,rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr); loadaddress(cstptrix, cstptr, topnew, topmax);
  lsp = nil; lsp1 = nil; lb = 1; bs = 1;
  lattr = gattr;
  if (gattr.typtr != nil) 
    { structure* with = gattr.typtr; 
      if (with->form == arrays) 
        { lsp = with->u.s_arrays.inxtype; lsp1 = with->u.s_arrays.aeltype;
          if ((with->u.s_arrays.inxtype == charptr) || (with->u.s_arrays.inxtype == boolptr))  lb = 0;
          else if (with->u.s_arrays.inxtype->form == subrange)  lb = with->u.s_arrays.inxtype->u.s_subrange.min.u.ival;
          bs = with->u.s_arrays.aeltype->size;
        }
      else error(116);}
  if (sy == comma)  insymbol(); else error(20);
  expression(join(*fsys, setof(comma,rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr); load(cstptr, topnew, topmax, cstptrix);
  if (gattr.typtr != nil) 
    if (gattr.typtr->form != scalar)  error(116);
    else
      if (! comptypes(lsp,gattr.typtr))  error(116);
  gen2(51/*ldc*/,1,lb, cstptr, topnew, topmax);
  gen0(21, topnew, topmax/*sbi*/);
  gen2(51/*ldc*/,1,bs, cstptr, topnew, topmax);
  gen0(15, topnew, topmax/*mpi*/);
  if (sy == comma)  insymbol(); else error(20);
  variable(join(*fsys, setof(rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr); loadaddress(cstptrix, cstptr, topnew, topmax);
  if (gattr.typtr != nil) 
    { structure* with = gattr.typtr; 
      if (with->form == arrays) 
        {
          if (! comptypes(with->u.s_arrays.aeltype,lsp1))  error(116);
        }
      else error(116);}
  if ((gattr.typtr != nil) && (lattr.typtr != nil)) 
    gen2(62/*pck*/,gattr.typtr->size,lattr.typtr->size, cstptr, topnew, topmax);
}   /*pack*/ 



static void unpackprocedure(integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax], setofsys* fsys)
{
      stp lsp,lsp1; attr lattr,lattr1; integer lb, bs;
      variable(join(*fsys, setof(comma,rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr); loadaddress(cstptrix, cstptr, topnew, topmax);
  lattr = gattr;
  lsp = nil; lsp1 = nil; lb = 1; bs = 1;
  if (gattr.typtr != nil) 
    { structure* with = gattr.typtr; 
      if (with->form == arrays)  lsp1 = with->u.s_arrays.aeltype;
      else error(116);}
  if (sy == comma)  insymbol(); else error(20);
  variable(join(*fsys, setof(comma,rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr); loadaddress(cstptrix, cstptr, topnew, topmax);
  lattr1 = gattr;
  if (gattr.typtr != nil) 
    { structure* with = gattr.typtr; 
      if (with->form == arrays) 
        {
          if (! comptypes(with->u.s_arrays.aeltype,lsp1))  error(116);
          if ((with->u.s_arrays.inxtype == charptr) || (with->u.s_arrays.inxtype == boolptr))  lb = 0;
          else if (with->u.s_arrays.inxtype->form == subrange)  lb = with->u.s_arrays.inxtype->u.s_subrange.min.u.ival;
          bs = with->u.s_arrays.aeltype->size;
          lsp = with->u.s_arrays.inxtype; 
        }
      else error(116);}
  if (sy == comma)  insymbol(); else error(20);
  expression(join(*fsys, setof(rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr); load(cstptr, topnew, topmax, cstptrix);
  if (gattr.typtr != nil) 
    if (gattr.typtr->form != scalar)  error(116);
    else
      if (! comptypes(lsp,gattr.typtr))  error(116);
  gen2(51/*ldc*/,1,lb, cstptr, topnew, topmax);
  gen0(21, topnew, topmax/*sbi*/);
  gen2(51/*ldc*/,1,bs, cstptr, topnew, topmax);
  gen0(15, topnew, topmax/*mpi*/);
  if ((gattr.typtr != nil) && (lattr.typtr != nil)) 
    gen2(63/*upk*/,lattr.typtr->size,lattr1.typtr->size, cstptr, topnew, topmax);
}   /*unpack*/ 



static void newdisposeprocedure(integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax], setofsys* fsys, unsigned char* lkey)

{
      stp lsp,lsp1; integer varts;
      addrrange lsize; valu lval;
      variable(join(*fsys, setof(comma,rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr); loadaddress(cstptrix, cstptr, topnew, topmax);
  lsp = nil; varts = 0; lsize = 0;
  if (gattr.typtr != nil) 
    { structure* with = gattr.typtr; 
      if (with->form == pointer) 
        {
          if (with->u.eltype != nil) 
            { lsize = with->u.eltype->size;
              if (with->u.eltype->form == records)  lsp = with->u.eltype->u.s_records.recvar;
            }
        }
      else error(116);}
  while (sy == comma) 
    { insymbol();constant1(join(*fsys, setof(comma,rparent, eos)),&lsp1,&lval);
      varts = varts + 1;
      /*check to insert here: is constant in tagfieldtype range*/
      if (lsp == nil)  error(158);
      else
        if (lsp->form != tagfld)  error(162);
        else
          if (lsp->u.s_tagfld.tagfieldp != nil) 
            if (string(lsp1) || (lsp1 == realptr))  error(159);
            else
              if (comptypes(lsp->u.s_tagfld.tagfieldp->idtype,lsp1)) 
                {
                  lsp1 = lsp->u.s_tagfld.fstvar;
                  while (lsp1 != nil) 
                    { structure* with = lsp1; 
                      if (with->u.s_variant.varval.u.ival == lval.u.ival) 
                        { lsize = with->size; lsp = with->u.s_variant.subvar;
                          goto L1;
                        }
                      else lsp1 = with->u.s_variant.nxtvar;}
                  lsize = lsp->size; lsp = nil;
                }
              else error(116);
L1:;  } /*while*/ 
  gen2(51/*ldc*/,1,lsize, cstptr, topnew, topmax);
  if (*lkey == 9)  gen1(30/*csp*/,12, topnew, topmax, cstptr/*new*/);
  else gen1(30/*csp*/,29, topnew, topmax, cstptr/*dispose*/);
}   /*new*/ 



static void absfunction(integer* topnew, integer* topmax)
{
  if (gattr.typtr != nil) 
    if (gattr.typtr == intptr)  gen0(0, topnew, topmax/*abi*/);
    else
      if (gattr.typtr == realptr)  gen0(1, topnew, topmax/*abr*/);
      else { error(125); gattr.typtr = intptr; }
}   /*abs*/ 



static void sqrfunction(integer* topnew, integer* topmax)
{
  if (gattr.typtr != nil) 
    if (gattr.typtr == intptr)  gen0(24, topnew, topmax/*sqi*/);
    else
      if (gattr.typtr == realptr)  gen0(25, topnew, topmax/*sqr*/);
      else { error(125); gattr.typtr = intptr; }
}   /*sqr*/ 



static void truncfunction(integer* topnew, integer* topmax)
{
  if (gattr.typtr != nil) 
    if (gattr.typtr != realptr)  error(125);
  gen0(27, topnew, topmax/*trc*/);
  gattr.typtr = intptr;
}   /*trunc*/ 



static void roundfunction(integer* topnew, integer* topmax)
{
  if (gattr.typtr != nil) 
    if (gattr.typtr != realptr)  error(125);
  gen0(61, topnew, topmax/*rnd*/);
  gattr.typtr = intptr;
}   /*round*/ 



static void oddfunction(integer* topnew, integer* topmax)
{
  if (gattr.typtr != nil) 
    if (gattr.typtr != intptr)  error(125);
  gen0(20, topnew, topmax/*odd*/);
  gattr.typtr = boolptr;
}   /*odd*/ 



static void ordfunction(integer* topnew, integer* topmax)
{
  if (gattr.typtr != nil) 
    if (gattr.typtr->form >= power)  error(125);
  gen0t(58/*ord*/,gattr.typtr, topnew, topmax);
  gattr.typtr = intptr;
}   /*ord*/ 



static void chrfunction(integer* topnew, integer* topmax)
{
  if (gattr.typtr != nil) 
    if (gattr.typtr != intptr)  error(125);
  gen0(59, topnew, topmax/*chr*/);
  gattr.typtr = charptr;
}   /*chr*/ 



static void predsuccfunction(unsigned char* lkey, integer* topnew, integer* topmax)
{
  if (gattr.typtr != nil) 
    if (gattr.typtr->form != scalar)  error(125);
  if (*lkey == 7)  gen1t(31/*dec*/,1,gattr.typtr, topnew, topmax);
  else gen1t(34/*inc*/,1,gattr.typtr, topnew, topmax);
}   /*predsucc*/ 



static void eofeolnfunction(integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax], setofsys* fsys, unsigned char* lkey)
{
  if (sy == lparent) 
    { insymbol(); variable(join(*fsys, setof(rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
      if (sy == rparent)  insymbol(); else error(4);
    }
  else {
    if (! inputhdf)  error(175);
      { gattr.typtr = textptr; gattr.kind = varbl; gattr.u.s_varbl.access = drct;
        gattr.u.s_varbl.u.s_drct.vlevel = inputptr->u.s_vars.vlev; gattr.u.s_varbl.u.s_drct.dplmt = inputptr->u.s_vars.vaddr;
      }
  }
  loadaddress(cstptrix, cstptr, topnew, topmax);
  if (gattr.typtr != nil) 
    if (gattr.typtr->form != files)  error(125);
    else if ((*lkey == 10) && (gattr.typtr != textptr))  error(116); 
  if (*lkey == 9)  {
    if (gattr.typtr == textptr)  gen0(8, topnew, topmax/*eof*/);
    else gen0(69, topnew, topmax/*efb*/);
  } else gen1(30  /*csp*/,14, topnew, topmax, cstptr/*eln*/);
    gattr.typtr = boolptr;
}   /*eof*/ 

  static void callnonstandard(ctp* fcp, integer* topnew, integer* topmax, csp cstptr[cstoccmax], setofsys* fsys, unsigned short* cstptrix, ctp* fprocp);


static void compparam(ctp pla, ctp plb)
{
  while ((pla != nil) && (plb != nil))  {
    if (! comptypes(pla->idtype,plb->idtype))  error(189);
    pla = pla->next; plb = plb->next;
  }
  if ((pla != nil) || (plb != nil))  error(189);
}



static void callnonstandard(ctp* fcp, integer* topnew, integer* topmax, csp cstptr[cstoccmax], setofsys* fsys, unsigned short* cstptrix, ctp* fprocp)
{
      ctp nxt,lcp; stp lsp; idkind lkind; boolean lb;
      addrrange locpar, llc;

      locpar = 0;
  {
          identifier* with = (*fcp); 
          nxt = with->u.s_proc.pflist; lkind = with->u.s_proc.u.s_declared.pfkind;
      if (with->u.s_proc.u.s_declared.pfkind == actual)  { /* it's a system call */
        if (! with->u.s_proc.u.s_declared.u.s_actual.externl)  gen1(41/*mst*/,level-with->u.s_proc.u.s_declared.pflev, topnew, topmax, cstptr);
      } else gen1(41  /*mst*/,level-with->u.s_proc.u.s_declared.pflev, topnew, topmax, cstptr); /* its an indirect */
  }
  if (sy == lparent) 
    { llc = lc;
      do { lb = false;    /*decide whether proc/func must be passed*/
        if (nxt == nil)  error(126);
        else lb = inset(nxt->klass, setof(proc,func, eos));
        insymbol();
        if (lb)      /*pass function or procedure*/
          {
            if (sy != ident) 
              { error(2); skip(join(*fsys, setof(comma,rparent, eos))); }
            else if (nxt != nil) 
              {
                if (nxt->klass == proc)  searchid(setof(proc, eos),&lcp);
                else
                  { searchid(setof(func, eos),&lcp);
                    /* compare result types */
                    if (! comptypes(lcp->idtype,nxt->idtype)) 
                      error(128);
                  }
                /* compare parameter lists */
                if ((inset(nxt->klass, setof(proc,func, eos))) && 
                   (inset(lcp->klass, setof(proc,func, eos)))) 
                  compparam(nxt->u.s_proc.pflist, lcp->u.s_proc.pflist);
                if (lcp->u.s_proc.u.s_declared.pfkind == actual)  genlpa(lcp->u.s_proc.u.s_declared.pfname,level-lcp->u.s_proc.u.s_declared.pflev, topnew, topmax);
                else gen2(74/*lip*/,level-lcp->u.s_proc.u.s_declared.pflev,lcp->u.s_proc.pfaddr, cstptr, topnew, topmax);
                locpar = locpar+ptrsize*2;
                insymbol();
                if (! (inset(sy, join(*fsys, setof(comma,rparent, eos))))) 
                  { error(6); skip(join(*fsys, setof(comma,rparent, eos))); }
              }
          }   /*if lb*/
        else
          { expression(join(*fsys, setof(comma,rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
            if (gattr.typtr != nil) 
              {
                if (nxt != nil) 
                  { lsp = nxt->idtype;
                    if (lsp != nil) 
                      {
                        if (nxt->u.s_vars.vkind == actual) 
                          if (lsp->form <= power) 
                            { load(cstptr, topnew, topmax, cstptrix);
                              if (debug)  checkbnds(lsp, topnew, topmax);
                              if (comptypes(realptr,lsp)
                                 && (gattr.typtr == intptr)) 
                                { gen0(10, topnew, topmax/*flt*/);
                                  gattr.typtr = realptr;
                                }
                              locpar = locpar+lsp->size;
                              align(parmptr,&locpar);
                            }
                          else
                            {
                              loadaddress(cstptrix, cstptr, topnew, topmax);
                              locpar = locpar+ptrsize;
                              align(parmptr,&locpar);
                            }
                        else
                          if (gattr.kind == varbl) 
                            { loadaddress(cstptrix, cstptr, topnew, topmax);
                              locpar = locpar+ptrsize;
                              align(parmptr,&locpar);
                            }
                          else error(154);
                        if (! comptypes(lsp,gattr.typtr)) 
                          error(142);
                      }
                  }
              }
          }
        if (nxt != nil)  nxt = nxt->next;
      } while (!(sy != comma));
      lc = llc;
      if (sy == rparent)  insymbol(); else error(4);
    }   /*if lparent*/
  if (lkind == actual) 
    { if (nxt != nil)  error(126);
      {
          identifier* with = (*fcp); 

          if (with->u.s_proc.u.s_declared.u.s_actual.externl)  gen1(30/*csp*/,with->u.s_proc.u.s_declared.pfname, topnew, topmax, cstptr);
          else gencupent(46/*cup*/,locpar,with->u.s_proc.u.s_declared.pfname, topnew, topmax);
      }
    }
  else {     /* call procedure or function parameter */
    gen2(50/*lda*/,level-(*fcp)->u.s_proc.u.s_declared.pflev,(*fcp)->u.s_proc.pfaddr, cstptr, topnew, topmax);
    gen1(67/*cip*/,locpar, topnew, topmax, cstptr);
  }
  gattr.typtr = (*fcp)->idtype;
}   /*callnonstandard*/ 



static void call(setofsys fsys, ctp fcp, integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax])
{
      unsigned char lkey;

      /*call*/
  if (fcp->u.s_proc.pfdeckind == standard) 
    { lkey = fcp->u.s_proc.u.key;
      if (fcp->klass == proc) 
        {
          if (!(inset(lkey, setof(5,6,11,12,17, eos)))) 
            if (sy == lparent)  insymbol(); else error(9);
          switch (lkey) {
            case 1:case 2:
            case 3:case 4:   getputresetrewriteprocedure(topnew, topmax, fprocp, cstptrix, cstptr, &fsys, &lkey);
            break;
            case 17:    pageprocedure(topnew, topmax, fprocp, cstptrix, cstptr, &fsys); break;
            case 5:case 11:  readprocedure(topnew, topmax, fprocp, cstptrix, cstptr, &fsys, &lkey); break;
            case 6:case 12:  writeprocedure(&lkey, &fsys, cstptrix, cstptr, topnew, topmax, fprocp); break;
            case 7:     packprocedure(topnew, topmax, fprocp, cstptrix, cstptr, &fsys); break;
            case 8:     unpackprocedure(topnew, topmax, fprocp, cstptrix, cstptr, &fsys); break;
            case 9:case 18:  newdisposeprocedure(topnew, topmax, fprocp, cstptrix, cstptr, &fsys, &lkey); break;
            case 10:case 13: error(399);
            break;
          }
          if (!(inset(lkey, setof(5,6,11,12,17, eos)))) 
            if (sy == rparent)  insymbol(); else error(4);
        }
      else
        {
          if ((lkey <= 8) || (lkey == 16)) 
            {
              if (sy == lparent)  insymbol(); else error(9);
              expression(join(fsys, setof(rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr); load(cstptr, topnew, topmax, cstptrix);
            }
          switch (lkey) {
            case 1:    absfunction(topnew, topmax); break;
            case 2:    sqrfunction(topnew, topmax); break;
            case 3:    truncfunction(topnew, topmax); break;
            case 16:   roundfunction(topnew, topmax); break;
            case 4:    oddfunction(topnew, topmax); break;
            case 5:    ordfunction(topnew, topmax); break;
            case 6:    chrfunction(topnew, topmax); break;
            case 7:case 8:  predsuccfunction(&lkey, topnew, topmax); break;
            case 9:case 10: eofeolnfunction(topnew, topmax, fprocp, cstptrix, cstptr, &fsys, &lkey);
            break;
          }
          if ((lkey <= 8) || (lkey == 16)) 
            if (sy == rparent)  insymbol(); else error(4);
        }
    }   /*standard procedures and functions*/
  else callnonstandard(&fcp, topnew, topmax, cstptr, &fsys, cstptrix, fprocp);
}   /*call*/ 

  static void expression(setofsys fsys, integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax]);
  static void simpleexpression(setofsys fsys, integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax]);
  static void term(setofsys fsys, integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax]);


static void factor(setofsys fsys, integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax], attr* lattr)
{
      ctp lcp; csp lvp; boolean varpart;
      setty cstpart; stp lsp;
      attr tattr, rattr;
      boolean test;

  if (! (inset(sy, facbegsys))) 
    { error(58); skip(join(fsys, facbegsys));
      gattr.typtr = nil;
    }
  while (inset(sy, facbegsys)) 
    {
      switch (sy) {
/*id*/    case ident:
          { searchid(setof(konst,vars,field,func, eos),&lcp);
            insymbol();
            if (lcp->klass == func) 
              { call(fsys,lcp, topnew, topmax, fprocp, cstptrix, cstptr);
                  { gattr.kind = expr;
                    if (gattr.typtr != nil) 
                      if (gattr.typtr->form==subrange) 
                        gattr.typtr = gattr.typtr->u.s_subrange.rangetype;
                  }
              }
            else
              if (lcp->klass == konst) 
                {
                        identifier* with1 = lcp; 
                        gattr.typtr = with1->idtype; gattr.kind = cst;
                    gattr.u.cval = with1->u.values;
                }
              else
                { selector(fsys,lcp, topnew, topmax, fprocp, cstptrix, cstptr);
                  if (gattr.typtr!=nil)   /*elim.subr.types to*/
                    { structure* with1 = gattr.typtr; /*simplify later tests*/
                      if (with1->form == subrange) 
                        gattr.typtr = with1->u.s_subrange.rangetype;}
                }
          }
          break;
/*cst*/   case intconst:
          {
              { gattr.typtr = intptr; gattr.kind = cst;
                gattr.u.cval = val;
              }
            insymbol();
          }
          break;
          case realconst:
          {
              { gattr.typtr = realptr; gattr.kind = cst;
                gattr.u.cval = val;
              }
            insymbol();
          }
          break;
          case stringconst:
          {
              {
                if (lgth == 1)  gattr.typtr = charptr;
                else
                  { lsp = (structure*)malloc(sizeof(structure)); pshstc(lsp);
                    {
                            structure* with1 = lsp; 
                            with1->u.s_arrays.aeltype = charptr; with1->form=arrays;
                        with1->packing = true;
                        with1->u.s_arrays.inxtype = nil; with1->size = lgth*charsize;
                    }
                    gattr.typtr = lsp;
                  }
                gattr.kind = cst; gattr.u.cval = val;
              }
            insymbol();
          }
          break;
/* ( */   case lparent:
          { insymbol(); expression(join(fsys, setof(rparent, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
            if (sy == rparent)  insymbol(); else error(4);
          }
          break;
/*not*/   case notsy:
          { insymbol(); factor(fsys, topnew, topmax, fprocp, cstptrix, cstptr, lattr);
            load(cstptr, topnew, topmax, cstptrix); gen0(19, topnew, topmax/*not*/);
            if (gattr.typtr != nil) 
              if (gattr.typtr != boolptr) 
                { error(135); gattr.typtr = nil; }
          }
          break;
/*[*/     case lbrack:
          { insymbol(); cstpart = setof( eos); varpart = false;
            lsp = (structure*)malloc(sizeof(structure)); pshstc(lsp);
            {
                    structure* with = lsp; 
                    with->u.s_power.elset=nil;with->size=setsize;with->form=power; 
                    with->packing = false; with->u.s_power.matchpack = false; }
            if (sy == rbrack) 
              {
                  { gattr.typtr = lsp; gattr.kind = cst; }
                insymbol();
              }
            else
              {
                do { expression(join(fsys, setof(comma,range_,rbrack, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
                  rattr.typtr = nil;
                  if (sy == range_)  { insymbol(); 
                    tattr = gattr; expression(join(fsys, setof(comma,rbrack, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
                    rattr = gattr; gattr = tattr;
                  }
                  if (gattr.typtr != nil) 
                    if (gattr.typtr->form != scalar) 
                      { error(136); gattr.typtr = nil; }
                    else
                      if (comptypes(lsp->u.s_power.elset,gattr.typtr)) 
                        {
                          if (rattr.typtr != nil)  {       /* x..y form */
                            if (rattr.typtr->form != scalar) 
                              { error(136); rattr.typtr = nil; }
                            else
                              if (comptypes(lsp->u.s_power.elset,rattr.typtr)) 
                                {
                                  if ((gattr.kind == cst) && 
                                     (rattr.kind == cst)) 
                                    if ((lattr->u.cval.u.ival < setlow) ||
                                       (lattr->u.cval.u.ival > sethigh) ||
                                       (gattr.u.cval.u.ival < setlow) ||
                                       (gattr.u.cval.u.ival > sethigh)) 
                                      error(304);
                                    else
                                      cstpart = join(cstpart, 
                                        setof(range(gattr.u.cval.u.ival,rattr.u.cval.u.ival), eos));
                                  else
                                    { load(cstptr, topnew, topmax, cstptrix);
                                      if (! comptypes(gattr.typtr,intptr))
                                           gen0t(58/*ord*/,gattr.typtr, topnew, topmax);
                                      tattr = gattr; gattr = rattr;
                                      load(cstptr, topnew, topmax, cstptrix);
                                      gattr = tattr;
                                      if (! comptypes(rattr.typtr,intptr))
                                           gen0t(58/*ord*/,rattr.typtr, topnew, topmax);
                                      gen0(64, topnew, topmax/*rgs*/);
                                      if (varpart)  gen0(28, topnew, topmax/*uni*/);
                                      else varpart = true;
                                    }
                                }
                              else error(137);
                          } else {
                            if (gattr.kind == cst) 
                              if ((gattr.u.cval.u.ival < setlow) ||
                                (gattr.u.cval.u.ival > sethigh)) 
                                error(304);
                              else
                                cstpart = join(cstpart, setof(gattr.u.cval.u.ival, eos));
                            else
                              { load(cstptr, topnew, topmax, cstptrix);
                                if (! comptypes(gattr.typtr,intptr))
                                     gen0t(58/*ord*/,gattr.typtr, topnew, topmax);
                                gen0(23, topnew, topmax/*sgs*/);
                                if (varpart)  gen0(28, topnew, topmax/*uni*/);
                                else varpart = true;
                              }
                          }
                          lsp->u.s_power.elset = gattr.typtr;
                          gattr.typtr = lsp;
                        }
                      else error(137);
                  test = sy != comma;
                  if (! test)  insymbol();
                } while (!test);
                if (sy == rbrack)  insymbol(); else error(12);
              }
            if (varpart) 
              {
                if (!equivalent(cstpart, setof( eos))) 
                  { lvp = (constant*)malloc(sizeof(constant)); pshcst(lvp);
                    lvp->u.pval = cstpart;
                    lvp->cclass = pset;
                    if (*cstptrix == cstoccmax)  error(254);
                    else
                      { *cstptrix = *cstptrix + 1;
                        cstptr[*cstptrix-(1)] = lvp;
                        gen2(51/*ldc*/,5,*cstptrix, cstptr, topnew, topmax);
                        gen0(28, topnew, topmax/*uni*/); gattr.kind = expr;
                      }
                  }
              }
            else
              { lvp = (constant*)malloc(sizeof(constant)); pshcst(lvp);
                lvp->u.pval = cstpart;
                lvp->cclass = pset;
                gattr.u.cval.u.valp = lvp;
              }
          }
          break;
/*nil*/   case nilsy: { gattr.typtr = nilptr; gattr.kind = cst;
                         gattr.u.cval.u.ival = nilval;
                         insymbol();
                   }
                   break;
      }   /*case*/ 
      if (! (inset(sy, fsys))) 
        { error(6); skip(join(fsys, facbegsys)); }
    }   /*while*/
}   /*factor*/ 



static void term(setofsys fsys, integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax])
{
      attr lattr; operator_ lop;

      /*term*/
  factor(join(fsys, setof(mulop, eos)), topnew, topmax, fprocp, cstptrix, cstptr, &lattr);
  while (sy == mulop) 
    { load(cstptr, topnew, topmax, cstptrix); lattr = gattr; lop = op;
      insymbol(); factor(join(fsys, setof(mulop, eos)), topnew, topmax, fprocp, cstptrix, cstptr, &lattr); load(cstptr, topnew, topmax, cstptrix);
      if ((lattr.typtr != nil) && (gattr.typtr != nil)) 
        switch (lop) {
/***/     case mul:  if ((lattr.typtr==intptr)&&(gattr.typtr==intptr))
                     gen0(15, topnew, topmax/*mpi*/);
                else
                  {
                    if (lattr.typtr == intptr) 
                      { gen0(9, topnew, topmax/*flo*/);
                        lattr.typtr = realptr;
                      }
                    else
                      if (gattr.typtr == intptr) 
                        { gen0(10, topnew, topmax/*flt*/);
                          gattr.typtr = realptr;
                        }
                    if ((lattr.typtr == realptr)
                      &&(gattr.typtr==realptr)) gen0(16, topnew, topmax/*mpr*/);
                    else
                      if((lattr.typtr->form==power)
                        && comptypes(lattr.typtr,gattr.typtr))
                        gen0(12, topnew, topmax/*int*/);
                      else { error(134); gattr.typtr=nil; }
                  }
                  break;
/* / */   case rdiv: {
                  if (gattr.typtr == intptr) 
                    { gen0(10, topnew, topmax/*flt*/);
                      gattr.typtr = realptr;
                    }
                  if (lattr.typtr == intptr) 
                    { gen0(9, topnew, topmax/*flo*/);
                      lattr.typtr = realptr;
                    }
                  if ((lattr.typtr == realptr)
                    && (gattr.typtr==realptr)) gen0(7, topnew, topmax/*dvr*/);
                  else { error(134); gattr.typtr = nil; }
                }
                break;
/*div*/   case idiv: if ((lattr.typtr == intptr)
                  && (gattr.typtr == intptr))  gen0(6, topnew, topmax/*dvi*/);
                else { error(134); gattr.typtr = nil; }
                break;
/*mod*/   case imod: if ((lattr.typtr == intptr)
                  && (gattr.typtr == intptr))  gen0(14, topnew, topmax/*mod*/);
                else { error(134); gattr.typtr = nil; }
                break;
/*and*/   case andop:if ((lattr.typtr == boolptr)
                  && (gattr.typtr == boolptr))  gen0(4, topnew, topmax/*and*/);
                else { error(134); gattr.typtr = nil; }
                break;
        }   /*case*/
      else gattr.typtr = nil;
    }   /*while*/
}   /*term*/ 



static void simpleexpression(setofsys fsys, integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax])
{
      attr lattr; operator_ lop; boolean signed_;

      /*simpleexpression*/
  signed_ = false;
  if ((sy == addop) && (inset(op, setof(plus,minus, eos)))) 
    { signed_ = op == minus; insymbol(); }
  term(join(fsys, setof(addop, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
  if (signed_) 
    { load(cstptr, topnew, topmax, cstptrix);
      if (gattr.typtr == intptr)  gen0(17, topnew, topmax/*ngi*/);
      else
        if (gattr.typtr == realptr)  gen0(18, topnew, topmax/*ngr*/);
        else { error(134); gattr.typtr = nil; }
    }
  while (sy == addop) 
    { load(cstptr, topnew, topmax, cstptrix); lattr = gattr; lop = op;
      insymbol(); term(join(fsys, setof(addop, eos)), topnew, topmax, fprocp, cstptrix, cstptr); load(cstptr, topnew, topmax, cstptrix);
      if ((lattr.typtr != nil) && (gattr.typtr != nil)) 
        switch (lop) {
/*+*/       case plus:
            if ((lattr.typtr == intptr)&&(gattr.typtr == intptr)) 
              gen0(2, topnew, topmax/*adi*/);
            else
              {
                if (lattr.typtr == intptr) 
                  { gen0(9, topnew, topmax/*flo*/);
                    lattr.typtr = realptr;
                  }
                else
                  if (gattr.typtr == intptr) 
                    { gen0(10, topnew, topmax/*flt*/);
                      gattr.typtr = realptr;
                    }
                if ((lattr.typtr == realptr)&&(gattr.typtr == realptr))
                       gen0(3, topnew, topmax/*adr*/);
                else if((lattr.typtr->form==power)
                       && comptypes(lattr.typtr,gattr.typtr)) 
                       gen0(28, topnew, topmax/*uni*/);
                     else { error(134); gattr.typtr=nil; }
              }
              break;
/*-*/       case minus:
            if ((lattr.typtr == intptr)&&(gattr.typtr == intptr)) 
              gen0(21, topnew, topmax/*sbi*/);
            else
              {
                if (lattr.typtr == intptr) 
                  { gen0(9, topnew, topmax/*flo*/);
                    lattr.typtr = realptr;
                  }
                else
                  if (gattr.typtr == intptr) 
                    { gen0(10, topnew, topmax/*flt*/);
                      gattr.typtr = realptr;
                    }
                if ((lattr.typtr == realptr)&&(gattr.typtr == realptr))
                       gen0(22, topnew, topmax/*sbr*/);
                else
                  if ((lattr.typtr->form == power)
                    && comptypes(lattr.typtr,gattr.typtr)) 
                    gen0(5, topnew, topmax/*dif*/);
                  else { error(134); gattr.typtr = nil; }
              }
              break;
/*or*/      case orop:
            if((lattr.typtr==boolptr)&&(gattr.typtr==boolptr))
              gen0(13, topnew, topmax/*ior*/);
            else { error(134); gattr.typtr = nil; }
            break;
        }   /*case*/
      else gattr.typtr = nil;
    }   /*while*/
}   /*simpleexpression*/ 



static void expression(setofsys fsys, integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax])
{
      attr lattr; operator_ lop; char typind; addrrange lsize;

      /*expression*/
  simpleexpression(join(fsys, setof(relop, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
  if (sy == relop) 
    {
      if (gattr.typtr != nil) 
        if (gattr.typtr->form <= power)  load(cstptr, topnew, topmax, cstptrix);
        else loadaddress(cstptrix, cstptr, topnew, topmax);
      lattr = gattr; lop = op;
      if (lop == inop) 
        if (! comptypes(gattr.typtr,intptr)) 
          gen0t(58/*ord*/,gattr.typtr, topnew, topmax);
      insymbol(); simpleexpression(fsys, topnew, topmax, fprocp, cstptrix, cstptr);
      if (gattr.typtr != nil) 
        if (gattr.typtr->form <= power)  load(cstptr, topnew, topmax, cstptrix);
        else loadaddress(cstptrix, cstptr, topnew, topmax);
      if ((lattr.typtr != nil) && (gattr.typtr != nil)) 
        if (lop == inop) 
          if (gattr.typtr->form == power) 
            if (comptypes(lattr.typtr,gattr.typtr->u.s_power.elset)) 
              gen0(11, topnew, topmax/*inn*/);
            else { error(129); gattr.typtr = nil; }
          else { error(130); gattr.typtr = nil; }
        else
          {
            if (lattr.typtr != gattr.typtr) 
              if (lattr.typtr == intptr) 
                { gen0(9, topnew, topmax/*flo*/);
                  lattr.typtr = realptr;
                }
              else
                if (gattr.typtr == intptr) 
                  { gen0(10, topnew, topmax/*flt*/);
                    gattr.typtr = realptr;
                  }
            if (comptypes(lattr.typtr,gattr.typtr)) 
              { lsize = lattr.typtr->size;
                switch (lattr.typtr->form) {
                  case scalar:
                    if (lattr.typtr == realptr)  typind = 'r';
                    else
                      if (lattr.typtr == boolptr)  typind = 'b';
                      else
                        if (lattr.typtr == charptr)  typind = 'c';
                        else typind = 'i';
                        break;
                  case pointer:
                    {
                      if (inset(lop, setof(ltop,leop,gtop,geop, eos)))  error(131);
                      typind = 'a';
                    }
                    break;
                  case power:
                    { if (inset(lop, setof(ltop,gtop, eos)))  error(132);
                      typind = 's';
                    }
                    break;
                  case arrays:
                    {
                      if (~ string(lattr.typtr))
                             error(134);
                      typind = 'm';
                    }
                    break;
                  case records:
                    {
                      error(134);
                      typind = 'm';
                    }
                    break;
                  case files:
                    { error(133); typind = 'f'; }
                    break;
                }
                switch (lop) {
                  case ltop: gen2(53/*les*/,ord(typind),lsize, cstptr, topnew, topmax); break;
                  case leop: gen2(52/*leq*/,ord(typind),lsize, cstptr, topnew, topmax); break;
                  case gtop: gen2(49/*grt*/,ord(typind),lsize, cstptr, topnew, topmax); break;
                  case geop: gen2(48/*geq*/,ord(typind),lsize, cstptr, topnew, topmax); break;
                  case neop: gen2(55/*neq*/,ord(typind),lsize, cstptr, topnew, topmax); break;
                  case eqop: gen2(47/*equ*/,ord(typind),lsize, cstptr, topnew, topmax);
                  break;
                }
              }
            else error(129);
          }
      gattr.typtr = boolptr; gattr.kind = expr;
    }   /*sy = relop*/
}   /*expression*/ 



static void assignment(ctp fcp, integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax], setofsys* fsys)
{
      attr lattr;
      selector(join(*fsys, setof(becomes, eos)),fcp, topnew, topmax, fprocp, cstptrix, cstptr);
  if (sy == becomes) 
    {
      if (gattr.typtr != nil) 
        if ((gattr.u.s_varbl.access!=drct) || (gattr.typtr->form>power)) 
          loadaddress(cstptrix, cstptr, topnew, topmax);
      lattr = gattr;
      insymbol(); expression(*fsys, topnew, topmax, fprocp, cstptrix, cstptr);
      if (gattr.typtr != nil) 
        if (gattr.typtr->form <= power)  load(cstptr, topnew, topmax, cstptrix);
        else loadaddress(cstptrix, cstptr, topnew, topmax);
      if ((lattr.typtr != nil) && (gattr.typtr != nil)) 
        {
          if (comptypes(realptr,lattr.typtr)&&(gattr.typtr==intptr))
            { gen0(10, topnew, topmax/*flt*/);
              gattr.typtr = realptr;
            }
          if (comptypes(lattr.typtr,gattr.typtr))  {
            if (filecomponent(gattr.typtr))  error(191);
            switch (lattr.typtr->form) {
              case scalar:
              case subrange: {
                          if (debug)  checkbnds(lattr.typtr, topnew, topmax);
                          store_(&lattr, topnew, topmax);
                        }
                        break;
              case pointer: {
                         if (debug) 
                           gen2t(45/*chk*/,0,maxaddr,nilptr, topnew, topmax);
                         store_(&lattr, topnew, topmax);
                       }
                       break;
              case power:   store_(&lattr, topnew, topmax); break;
              case arrays:
              case records: gen1(40/*mov*/,lattr.typtr->size, topnew, topmax, cstptr);
              break;
              case files: error(146);
              break;
            }
          } else error(129);
        }
    }   /*sy = becomes*/
  else error(51);
}   /*assignment*/ 



static void gotostatement(integer* topnew, integer* topmax)
{
      lbp llp; disprange ttop,ttop1;


  if (sy == intconst) 
    {
      ttop = top;
      while (display[ttop - min_disprange].occur != blck)  ttop = ttop - 1;
      ttop1 = ttop;
      do {
        searchlabel(&llp, ttop); /* find label */
        if (llp != nil)  {
          labl* with = llp;  
          if (with->defined) 
            if (with->slevel > stalvl)  /* defining point level greater than
                                              present statement level */
              error(185); /* goto references deeper nested statement */
            else if ((with->slevel > 1) && ! with->bact)  
              error(187); /* Goto references label in different nested
                                    statement */
          /* establish the minimum statement level a goto appeared at */
          if (with->minlvl > stalvl)  with->minlvl = stalvl;
          if (ttop == ttop1) 
            genujpxjp(57/*ujp*/,with->labname, topnew, topmax); 
          else {     /* interprocedural goto */
            genipj(66/*ipj*/,level-with->vlevel,with->labname, topnew, topmax);
            with->ipcref = true;
          }
                         }
        ttop = ttop - 1;
      } while (!((llp != nil) || (ttop == 0)));
      if (llp == nil)  {
        error(167); /* undeclared label */
        newlabel(&llp); /* create dummy label in current context */
      }
      insymbol();
    }
  else error(15);
}   /*gotostatement*/ 



static void compoundstatement(setofsys* fsys, integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax], addrrange* lcmax)
{
    boolean test;

  addlvl();
  do {
    do { statement(join(*fsys, setof(semicolon,endsy, eos)), topnew, topmax, fprocp, cstptrix, cstptr, lcmax);
    } while (!(! (inset(sy, statbegsys))));
    test = sy != semicolon;
    if (! test)  insymbol();
  } while (!test);
  if (sy == endsy)  insymbol(); else error(13);
  sublvl();
}   /*compoundstatemenet*/ 



static void ifstatement(integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax], setofsys* fsys, addrrange* lcmax)
{
      integer lcix1,lcix2;
      expression(join(*fsys, setof(thensy, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
  genlabel(&lcix1); genfjp(lcix1, cstptr, topnew, topmax, cstptrix);
  if (sy == thensy)  insymbol(); else error(52);
  addlvl();
  statement(join(*fsys, setof(elsesy, eos)), topnew, topmax, fprocp, cstptrix, cstptr, lcmax);
  sublvl();
  if (sy == elsesy) 
    { genlabel(&lcix2); genujpxjp(57   /*ujp*/,lcix2, topnew, topmax);
      putlabel(lcix1);
      insymbol(); 
      addlvl();
      statement(*fsys, topnew, topmax, fprocp, cstptrix, cstptr, lcmax);
      sublvl();
      putlabel(lcix2);
    }
  else putlabel(lcix1);
}   /*ifstatement*/ 



static void casestatement(integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax], setofsys* fsys, addrrange* lcmax)

{
      stp lsp,lsp1; cip fstptr,lpt1,lpt2,lpt3; valu lval;
      integer laddr, lcix, lcix1, lmin, lmax;
      boolean test;
      expression(join(*fsys, setof(ofsy,comma,colon, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
  load(cstptr, topnew, topmax, cstptrix); genlabel(&lcix);
  lsp = gattr.typtr;
  if (lsp != nil) 
    if ((lsp->form != scalar) || (lsp == realptr)) 
      { error(144); lsp = nil; }
    else if (! comptypes(lsp,intptr))  gen0t(58    /*ord*/,lsp, topnew, topmax);
  genujpxjp(57/*ujp*/,lcix, topnew, topmax);
  if (sy == ofsy)  insymbol(); else error(8);
  fstptr = nil; genlabel(&laddr);
  do {
    lpt3 = nil; genlabel(&lcix1);
    if (!(inset(sy, setof(semicolon,endsy, eos)))) 
      {
        do { constant1(join(*fsys, setof(comma,colon, eos)),&lsp1,&lval);
          if (lsp != nil) 
            if (comptypes(lsp,lsp1)) 
              { lpt1 = fstptr; lpt2 = nil;
                while (lpt1 != nil) 
                  {
                      caseinfo* with = lpt1; 

                      if (with->cslab <= lval.u.ival) 
                        { if (with->cslab == lval.u.ival)  error(156);
                          goto L1;
                        }
                      lpt2 = lpt1; lpt1 = with->next;
                  }
    L1:    getcas(&lpt3);
                {
                        caseinfo* with = lpt3; 
                        with->next = lpt1; with->cslab = lval.u.ival;
                    with->csstart = lcix1;
                }
                if (lpt2 == nil)  fstptr = lpt3;
                else lpt2->next = lpt3;
              }
            else error(147);
          test = sy != comma;
          if (! test)  insymbol();
        } while (!test);
        if (sy == colon)  insymbol(); else error(5);
        putlabel(lcix1);
        do { 
          addlvl();
          statement(join(*fsys, setof(semicolon, eos)), topnew, topmax, fprocp, cstptrix, cstptr, lcmax);
          sublvl();
        } while (!(! (inset(sy, statbegsys))));
        if (lpt3 != nil) 
          genujpxjp(57/*ujp*/,laddr, topnew, topmax);
      }
    test = sy != semicolon;
    if (! test)  insymbol();
  } while (!test);
  putlabel(lcix);
  if (fstptr != nil) 
    { lmax = fstptr->cslab;
      /*reverse pointers*/
      lpt1 = fstptr; fstptr = nil;
      do { lpt2 = lpt1->next; lpt1->next = fstptr;
        fstptr = lpt1; lpt1 = lpt2;
      } while (!(lpt1 == nil));
      lmin = fstptr->cslab;
      if (lmax - lmin < cixmax) 
        {
          gen2t(45/*chk*/,lmin,lmax,intptr, topnew, topmax);
          gen2(51/*ldc*/,1,lmin, cstptr, topnew, topmax); gen0(21, topnew, topmax/*sbi*/); genlabel(&lcix);
          genujpxjp(44/*xjp*/,lcix, topnew, topmax); putlabel(lcix);
          do {
            {
                caseinfo* with = fstptr; 

                while (with->cslab > lmin) 
                   { gen0(60, topnew, topmax/*ujc error*/);
                     lmin = lmin+1;
                   }
                genujpxjp(57/*ujp*/,with->csstart, topnew, topmax);
                lpt1 = fstptr; fstptr = with->next; lmin = lmin + 1;
                putcas(lpt1);
            }
          } while (!(fstptr == nil));
          putlabel(laddr);
        }
      else error(157);
    }
    if (sy == endsy)  insymbol(); else error(13);
}   /*casestatement*/ 



static void repeatstatement(setofsys* fsys, integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax], addrrange* lcmax)
{
      integer laddr;
      genlabel(&laddr); putlabel(laddr);
  do { 
    addlvl();
    statement(join(*fsys, setof(semicolon,untilsy, eos)), topnew, topmax, fprocp, cstptrix, cstptr, lcmax);
    sublvl();
    if (inset(sy, statbegsys))  error(14);
  } while (!(!(inset(sy, statbegsys))));
  while (sy == semicolon) 
    { insymbol();
      do { 
        addlvl();
        statement(join(*fsys, setof(semicolon,untilsy, eos)), topnew, topmax, fprocp, cstptrix, cstptr, lcmax);
        if (inset(sy, statbegsys))  error(14);
        sublvl();
      } while (!(! (inset(sy, statbegsys))));
    }
  if (sy == untilsy) 
    { insymbol(); expression(*fsys, topnew, topmax, fprocp, cstptrix, cstptr); genfjp(laddr, cstptr, topnew, topmax, cstptrix);
    }
  else error(53);
}   /*repeatstatement*/ 



static void whilestatement(integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax], setofsys* fsys, addrrange* lcmax)
{
      integer laddr, lcix;
      genlabel(&laddr); putlabel(laddr);
  expression(join(*fsys, setof(dosy, eos)), topnew, topmax, fprocp, cstptrix, cstptr); genlabel(&lcix); genfjp(lcix, cstptr, topnew, topmax, cstptrix);
  if (sy == dosy)  insymbol(); else error(54);
  addlvl();
  statement(*fsys, topnew, topmax, fprocp, cstptrix, cstptr, lcmax); 
  sublvl();
  genujpxjp(57/*ujp*/,laddr, topnew, topmax); putlabel(lcix);
}   /*whilestatement*/ 



static void forstatement(ctp* lcp, setofsys* fsys, integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax], addrrange* lcmax)
{
      attr lattr;  symbol lsy;
      integer lcix, laddr;
            addrrange llc, lcs;
      char typind;  /* added for typing [sam] */
      llc = lc;
    { lattr.typtr = nil; lattr.kind = varbl;
      lattr.u.s_varbl.access = drct; lattr.u.s_varbl.u.s_drct.vlevel = level; lattr.u.s_varbl.u.s_drct.dplmt = 0;
    }
  typind = 'i';  /* default to integer [sam] */
  if (sy == ident) 
    { searchid(setof(vars, eos),lcp);
      {
              identifier* with = (*lcp);

              lattr.typtr = with->idtype; lattr.kind = varbl;
          if (with->u.s_vars.vkind == actual) 
            { lattr.u.s_varbl.access = drct; lattr.u.s_varbl.u.s_drct.vlevel = with->u.s_vars.vlev;
              if (with->u.s_vars.vlev != level)  error(183);
              lattr.u.s_varbl.u.s_drct.dplmt = with->u.s_vars.vaddr;
            }
          else { error(155); lattr.typtr = nil; }
      }
      /* determine type of control variable [sam] */
      if (lattr.typtr == boolptr)  typind = 'b';
      else if (lattr.typtr == charptr)  typind = 'c';
      if (lattr.typtr != nil) 
        if ((lattr.typtr->form > subrange)
           || comptypes(realptr,lattr.typtr)) 
          { error(143); lattr.typtr = nil; }
      insymbol();
    }
  else
    { error(2); skip(join(*fsys, setof(becomes,tosy,downtosy,dosy, eos))); }
  if (sy == becomes) 
    { insymbol(); expression(join(*fsys, setof(tosy,downtosy,dosy, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
      if (gattr.typtr != nil) 
          if (gattr.typtr->form != scalar)  error(144);
          else
            if (comptypes(lattr.typtr,gattr.typtr))  {
              load(cstptr, topnew, topmax, cstptrix); align(intptr,&lc);
              /* store start to temp */
              gen2t(56/*str*/,0,lc,intptr, topnew, topmax);
            } else error(145);
    }
  else
    { error(51); skip(join(*fsys, setof(tosy,downtosy,dosy, eos))); }
  if (inset(sy, setof(tosy,downtosy, eos))) 
    { lsy = sy; insymbol(); expression(join(*fsys, setof(dosy, eos)), topnew, topmax, fprocp, cstptrix, cstptr);
      if (gattr.typtr != nil) 
      if (gattr.typtr->form != scalar)  error(144);
        else
          if (comptypes(lattr.typtr,gattr.typtr)) 
            {
              load(cstptr, topnew, topmax, cstptrix); align(intptr,&lc);
              if (! comptypes(lattr.typtr,intptr)) 
                gen0t(58/*ord*/,gattr.typtr, topnew, topmax);
              gen2t(56/*str*/,0,lc+intsize,intptr, topnew, topmax);
              /* set initial value of index */
              gen2t(54/*lod*/,0,lc,intptr, topnew, topmax);
              store_(&lattr, topnew, topmax);
              genlabel(&laddr); putlabel(laddr);
              gattr = lattr; load(cstptr, topnew, topmax, cstptrix);
              if (! comptypes(gattr.typtr,intptr)) 
                gen0t(58/*ord*/,gattr.typtr, topnew, topmax);
              gen2t(54/*lod*/,0,lc+intsize,intptr, topnew, topmax);
              lcs = lc;
              lc = lc + intsize + intsize;
              if (lc > *lcmax)  *lcmax = lc;
              if (lsy == tosy)  gen2(52 /*leq*/,ord(typind),1, cstptr, topnew, topmax);
              else gen2(48/*geq*/,ord(typind),1, cstptr, topnew, topmax);
            }
          else error(145);
    }
  else { error(55); skip(join(*fsys, setof(dosy, eos))); }
  genlabel(&lcix); genujpxjp(33/*fjp*/,lcix, topnew, topmax);
  if (sy == dosy)  insymbol(); else error(54);
  addlvl();
  statement(*fsys, topnew, topmax, fprocp, cstptrix, cstptr, lcmax);
  sublvl();
  gattr = lattr; load(cstptr, topnew, topmax, cstptrix);
  if (! comptypes(gattr.typtr,intptr)) 
    gen0t(58/*ord*/,gattr.typtr, topnew, topmax);
  gen2t(54/*lod*/,0,lcs+intsize,intptr, topnew, topmax);
  gen2(47/*equ*/,ord(typind),1, cstptr, topnew, topmax);
  genujpxjp(73/*tjp*/,lcix, topnew, topmax);
  gattr = lattr; load(cstptr, topnew, topmax, cstptrix);
  if (lsy==tosy)  gen1t(34 /*inc*/,1,gattr.typtr, topnew, topmax);
  else  gen1t(31/*dec*/,1,gattr.typtr, topnew, topmax);
  store_(&lattr, topnew, topmax); genujpxjp(57/*ujp*/,laddr, topnew, topmax); putlabel(lcix);
  lc = llc;
}   /*forstatement*/ 



static void withstatement(integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax], setofsys* fsys, addrrange* lcmax)
{
      ctp lcp; disprange lcnt1; addrrange llc;
      boolean test;
      lcnt1 = 0; llc = lc;
  do {
    if (sy == ident) 
      { searchid(setof(vars,field, eos),&lcp); insymbol(); }
    else { error(2); lcp = uvarptr; }
    selector(join(*fsys, setof(comma,dosy, eos)),lcp, topnew, topmax, fprocp, cstptrix, cstptr);
    if (gattr.typtr != nil) 
      if (gattr.typtr->form == records) 
        if (top < displimit) 
          { top = top + 1; lcnt1 = lcnt1 + 1;
            {
                    struct A2* with = &display[top - min_disprange]; 
                    with->fname = gattr.typtr->u.s_records.fstfld;
                with->flabel = nil;
                with->flabel = nil;
                with->fconst = nil;
                with->fstruct = nil;
            }
            if (gattr.u.s_varbl.access == drct) 
              {
                      struct A2* with = &display[top - min_disprange]; 
                      with->occur = crec; with->u.s_crec.clev = gattr.u.s_varbl.u.s_drct.vlevel;
                  with->u.s_crec.cdspl = gattr.u.s_varbl.u.s_drct.dplmt;
              }
            else
              { loadaddress(cstptrix, cstptr, topnew, topmax);
                align(nilptr,&lc);
                gen2t(56/*str*/,0,lc,nilptr, topnew, topmax);
                {
                        struct A2* with = &display[top - min_disprange]; 
                        with->occur = vrec; with->u.vdspl = lc; }
                lc = lc+ptrsize;
                if (lc > *lcmax)  *lcmax = lc;
              }
          }
        else error(250);
      else error(140);
    test = sy != comma;
    if (! test)  insymbol();
  } while (!test);
  if (sy == dosy)  insymbol(); else error(54);
  addlvl();
  statement(*fsys, topnew, topmax, fprocp, cstptrix, cstptr, lcmax);
  sublvl();
  /* purge display levels */
  while (lcnt1 > 0)  {
     /* don't recycle the record context */
     display[top - min_disprange].fname = nil;
     putdsp(top); /* purge */
     top = top-1; lcnt1 = lcnt1-1;   /* count off */
  }
  lc = llc;
}   /*withstatement*/ 



static void statement(setofsys fsys, integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax], addrrange* lcmax)
{
      ctp lcp; lbp llp;

  void expression(setofsys fsys, integer* topnew, integer* topmax, ctp* fprocp, unsigned short* cstptrix, csp cstptr[cstoccmax]);

      /*statement*/
  if (sy == intconst)   /*label*/
    { 
      searchlabel(&llp, level); /* search label */
      if (llp != nil)  {
        labl* with = llp;                   /* found */
        if (with->defined)  error(165); /* multidefined label */
        with->bact = true; /* set in active block now */
        with->slevel = stalvl; /* establish statement level */
        with->defined = true; /* set defined */
        if (with->ipcref && (stalvl > 1))  
          error(184); /* intraprocedure goto does not reference outter block */
        else if (with->minlvl < stalvl)  
          error(186); /* label referenced by goto at lesser statement level */
        putlabel(with->labname); /* output label to intermediate */
                       } else { /* not found */
        error(167); /* undeclared label */
        newlabel(&llp); /* create a dummy level */
      }
      insymbol();
      if (sy == colon)  insymbol(); else error(5);
    }
  if (! (inset(sy, join(fsys, setof(ident, eos))))) 
    { error(6); skip(fsys); }
  if (inset(sy, join(statbegsys, setof(ident, eos)))) 
    {
      switch (sy) {
        case ident:    { searchid(setof(vars,field,func,proc, eos),&lcp); insymbol();
                    if (lcp->klass == proc)  call(fsys,lcp, topnew, topmax, fprocp, cstptrix, cstptr);
                    else assignment(lcp, topnew, topmax, fprocp, cstptrix, cstptr, &fsys);
                  }
                  break;
        case beginsy:  { insymbol(); compoundstatement(&fsys, topnew, topmax, fprocp, cstptrix, cstptr, lcmax); } break;
        case gotosy:   { insymbol(); gotostatement(topnew, topmax); } break;
        case ifsy:     { insymbol(); ifstatement(topnew, topmax, fprocp, cstptrix, cstptr, &fsys, lcmax); } break;
        case casesy:   { insymbol(); casestatement(topnew, topmax, fprocp, cstptrix, cstptr, &fsys, lcmax); } break;
        case whilesy:  { insymbol(); whilestatement(topnew, topmax, fprocp, cstptrix, cstptr, &fsys, lcmax); } break;
        case repeatsy: { insymbol(); repeatstatement(&fsys, topnew, topmax, fprocp, cstptrix, cstptr, lcmax); } break;
        case forsy:    { insymbol(); forstatement(&lcp, &fsys, topnew, topmax, fprocp, cstptrix, cstptr, lcmax); } break;
        case withsy:   { insymbol(); withstatement(topnew, topmax, fprocp, cstptrix, cstptr, &fsys, lcmax); } break;
      }
      if (! (inset(sy, setof(semicolon,endsy,elsesy,untilsy, eos)))) 
        { error(6); skip(fsys); }
    }
}   /*statement*/ 



static void body(setofsys fsys, ctp* fprocp){
  

               
#define min_oprange 0
#define max_oprange maxins

    ctp llcp; idstr saveid;
    csp cstptr[cstoccmax];
    unsigned short cstptrix;
    /*allows referencing of noninteger constants by an index
           (instead of a pointer), which can be stored in the p2-field
           of the instruction record until writeout.
           --> procedure load, procedure writeout*/
    integer entname, segsize;
    integer stacktop, topnew, topmax;
    addrrange lcmax,llc1; ctp lcp;
    lbp llp;
    extfilep fp;
    boolean test;

    /*body*/
if (*fprocp != nil)  entname = (*fprocp)->u.s_proc.u.s_declared.pfname;
else genlabel(&entname);
cstptrix = 0; topnew = lcaftermarkstack; topmax = lcaftermarkstack;
putlabel(entname); genlabel(&segsize); genlabel(&stacktop);
gencupent(32/*ent1*/,1,segsize, &topnew, &topmax); gencupent(32/*ent2*/,2,stacktop, &topnew, &topmax);
if (*fprocp != nil)   /*copy multiple values into local cells*/
  { llc1 = lcaftermarkstack;
    lcp = (*fprocp)->u.s_proc.pflist;
    while (lcp != nil) 
      {
          identifier* with = lcp; 

          align(parmptr,&llc1);
          if (with->klass == vars) 
            if (with->idtype != nil) 
              if (with->idtype->form > power) 
                {
                  if (with->u.s_vars.vkind == actual) 
                    {
                      gen2(50/*lda*/,0,with->u.s_vars.vaddr, cstptr, &topnew, &topmax);
                      gen2t(54/*lod*/,0,llc1,nilptr, &topnew, &topmax);
                      gen1(40/*mov*/,with->idtype->size, &topnew, &topmax, cstptr);
                    }
                  llc1 = llc1 + ptrsize;
                }
              else llc1 = llc1 + with->idtype->size;
          lcp = lcp->next;
      }
  }
lcmax = lc;
addlvl();
do {
  do { statement(join(fsys, setof(semicolon,endsy, eos)), &topnew, &topmax, fprocp, &cstptrix, cstptr, &lcmax);
  } while (!(! (inset(sy, statbegsys))));
  test = sy != semicolon;
  if (! test)  insymbol();
} while (!test);
sublvl();
if (sy == endsy)  insymbol(); else error(13);
llp = display[top - min_disprange].flabel; /*test for undefined labels*/
while (llp != nil) 
  {
      labl* with = llp; 

      if (! with->defined) 
        { error(168);
          twrite(&output, "\n"); twrite(&output, " label %i\n",with->labval);
          twrite(&output, "%*c",' ',chcnt+16);
        }
      llp = with->nextlab;
  }
if (*fprocp != nil) 
  {
    if ((*fprocp)->idtype == nil)  gen1(42/*ret*/,ord('p'), &topnew, &topmax, cstptr);
    else gen0t(42/*ret*/,(*fprocp)->idtype, &topnew, &topmax);
    align(parmptr,&lcmax);
    if (prcode) 
      { twrite(&prr, "l%4i=%i\n",segsize,lcmax);
        twrite(&prr, "l%4i=%i\n",stacktop,topmax);
      }
  }
else
  { gen1(42    /*ret*/,ord('p'), &topnew, &topmax, cstptr);
    align(parmptr,&lcmax);
    if (prcode) 
      { twrite(&prr, "l%4i=%i\n",segsize,lcmax);
        twrite(&prr, "l%4i=%i\n",stacktop,topmax);
        twrite(&prr, "q\n");
      }
    ic = 0;
    /*generate call of main program; note that this call must be loaded
            at absolute address zero*/
    gen1(41/*mst*/,0, &topnew, &topmax, cstptr); gencupent(46/*cup*/,0,entname, &topnew, &topmax); gen0(29, &topnew, &topmax/*stp*/);
    if (prcode) 
      twrite(&prr, "q\n");
    arrcpy(saveid, id);
    while (fextfilep != nil) 
      {
        { filerec* with = fextfilep; 
          if (! (strequri("input    ", with->filename) || 
                  strequri("output   ", with->filename) ||
                  strequri("prd      ", with->filename) || 
                  strequri("prr      ", with->filename)))
               { arrcpy(id, with->filename);
                 /* output general error for undefined external file */
                 twrite(&output, "\n");
                 twrite(&output, "**** Error: external file unknown '%8s\'\n",
                                1, items(fextfilep->filename), fextfilep->filename);
                 toterr = toterr+1;
                 /* hold the error in case not found, since this error
                         occurs far from the original symbol */
                 searchidne(setof(vars, eos),&llcp);
                 if (llcp == nil)  {
                   /* a header file was never defined in a var statement */
                   twrite(&output, "\n");
                   twrite(&output, "**** Error: Undeclared external file '%8s\'\n",
                                  1, items(fextfilep->filename), fextfilep->filename);
                   toterr = toterr+1;
                   llcp = uvarptr;
                 }
                 if (llcp->idtype!=nil) 
                   if (llcp->idtype->form!=files) 
                     { twrite(&output, "\n");
                       twrite(&output, "**** Error: Undeclared external file '%8s\'\n",
                                      1, items(fextfilep->filename), fextfilep->filename);
                       toterr = toterr+1;
                     }
               }}
          fp = fextfilep; fextfilep = fextfilep->nextfile; putfil(fp);
      }
    arrcpy(id, saveid);
    if (prtables) 
      { twrite(&output, "\n"); printtables(true);
      }
  }

#undef cixmax
#undef cstoccmax

                                            } /*body*/ 

  void block(setofsys fsys, symbol fsy, ctp fprocp)
  {
        symbol lsy;

    boolean string(stp fsp);

        /*block*/
    stalvl = 0;  /* clear statement nesting level */
    dp = true;
    do {
      if (sy == labelsy) 
        { insymbol(); labeldeclaration(&fsys); }
      if (sy == constsy) 
        { insymbol(); constdeclaration(&fsys); }
      if (sy == typesy) 
        { insymbol(); typedeclaration(&fsys); }
      if (sy == varsy) 
        { insymbol(); vardeclaration(&fsys); }
      while (inset(sy, setof(procsy,funcsy, eos))) 
        { lsy = sy; insymbol(); procdeclaration(lsy, &fsys); }
      if (sy != beginsy) 
        { error(18); skip(fsys); }
    } while (!((inset(sy, statbegsys)) || eof(input)));
    dp = false;
    if (sy == beginsy)  insymbol(); else error(17);
    do { body(join(fsys, setof(casesy, eos)), &fprocp);
      if (sy != fsy) 
        { error(6); skip(fsys); }
    } while (!(((sy == fsy) || (inset(sy, blockbegsys))) || eof(input)));
  }   /*block*/ 

  void programme(setofsys fsys)
  {
        extfilep extfp;

    if (sy == progsy) 
      { insymbol(); if (sy != ident)  error(2); insymbol();
        if (! (inset(sy, setof(lparent,semicolon, eos))))  error(14);
        if (sy == lparent)  
          {
            do { insymbol();
              if (sy == ident) 
                { getfil(&extfp);
                  {
                          filerec* with = extfp; 
                          arrcpy(with->filename, id); with->nextfile = fextfilep; }
                  fextfilep = extfp;
                  /* check 'input' or 'output' appears in header for defaults */
                  if (strequri("input    ", id))  inputhdf = true;
                  else if (strequri("output   ", id))  outputhdf = true;
                  insymbol();
                  if (! ( inset(sy, setof(comma,rparent, eos)) ))  error(20);
                }
              else error(2);
            } while (!(sy != comma));
            if (sy != rparent)  error(4);
            insymbol();
          }
        if (sy != semicolon)  error(14);
        else insymbol();
      } else error(3);
    do { block(fsys,period,nil);
      if (sy != period)  error(21);
    } while (!((sy == period) || eof(input)));
    if (list)  twrite(&output, "\n");
    if (errinx != 0) 
      { list = false; endofline(); }
  }   /*programme*/ 


  void stdnames()
  {
    /* 'mark' and 'release' were removed and replaced with placeholders */
    arrcpy(na[ 0], "false    "); arrcpy(na[ 1], "true     "); arrcpy(na[ 2], "input    ");
    arrcpy(na[ 3], "output   "); arrcpy(na[ 4], "get      "); arrcpy(na[ 5], "put      ");
    arrcpy(na[ 6], "reset    "); arrcpy(na[ 7], "rewrite  "); arrcpy(na[ 8], "read     ");
    arrcpy(na[9], "write    "); arrcpy(na[10], "pack     "); arrcpy(na[11], "unpack   ");
    arrcpy(na[12], "new      "); arrcpy(na[13], "---      "); arrcpy(na[14], "readln   ");
    arrcpy(na[15], "writeln  ");
    arrcpy(na[16], "abs      "); arrcpy(na[17], "sqr      "); arrcpy(na[18], "trunc    ");
    arrcpy(na[19], "odd      "); arrcpy(na[20], "ord      "); arrcpy(na[21], "chr      ");
    arrcpy(na[22], "pred     "); arrcpy(na[23], "succ     "); arrcpy(na[24], "eof      ");
    arrcpy(na[25], "eoln     ");
    arrcpy(na[26], "sin      "); arrcpy(na[27], "cos      "); arrcpy(na[28], "exp      ");
    arrcpy(na[29], "sqrt     "); arrcpy(na[30], "ln       "); arrcpy(na[31], "arctan   ");
    arrcpy(na[32], "prd      "); arrcpy(na[33], "prr      "); arrcpy(na[34], "---      ");
    arrcpy(na[35], "maxint   "); arrcpy(na[36], "round    "); arrcpy(na[37], "page     ");
    arrcpy(na[38], "dispose  ");
  }   /*stdnames*/ 

  void enterstdtypes()

  {                                                     /*type underlying:*/
                                                        /******************/

    intptr = (structure*)malloc(sizeof(structure)); pshstc(intptr);               /*integer*/
    {
            structure* with = intptr; 
            with->size = intsize; with->form = scalar; with->u.s_scalar.scalkind = standard; }
    realptr = (structure*)malloc(sizeof(structure)); pshstc(realptr);             /*real*/
    {
            structure* with = realptr; 
            with->size = realsize; with->form = scalar; with->u.s_scalar.scalkind = standard; }
    charptr = (structure*)malloc(sizeof(structure)); pshstc(charptr);             /*char*/
    {
            structure* with = charptr; 
            with->size = charsize; with->form = scalar; with->u.s_scalar.scalkind = standard; }
    boolptr = (structure*)malloc(sizeof(structure)); pshstc(boolptr);             /*boolean*/
    {
            structure* with = boolptr; 
            with->size = boolsize; with->form = scalar; with->u.s_scalar.scalkind = declared; }
    nilptr = (structure*)malloc(sizeof(structure)); pshstc(nilptr);                /*nil*/
    {
            structure* with = nilptr; 
            with->u.eltype = nil; with->size = ptrsize; with->form = pointer; }
    /*for alignment of parameters*/
    parmptr = (structure*)malloc(sizeof(structure)); pshstc(parmptr);
    {
            structure* with = parmptr; 
            with->size = parmsize; with->form = scalar; with->u.s_scalar.scalkind = standard; } 
    textptr = (structure*)malloc(sizeof(structure)); pshstc(textptr);                /*text*/
    {
            structure* with = textptr; 
            with->u.filtype = charptr; with->size = filesize+charsize; with->form = files; }
  }   /*enterstdtypes*/ 

  void entstdnames()
  {
        ctp cp,cp1; integer i;

                                                              /*name:*/
                                                              /*******/

    cp = (identifier*)malloc(sizeof(identifier)); ininam(cp);                                /*integer*/
    {
            identifier* with = cp; 
            strassvr(&with->name, "integer  "); with->idtype = intptr; with->klass = types; }
    enterid(cp);
    cp = (identifier*)malloc(sizeof(identifier)); ininam(cp);                                /*real*/
    {
            identifier* with = cp; 
            strassvr(&with->name, "real     "); with->idtype = realptr; with->klass = types; }
    enterid(cp);
    cp = (identifier*)malloc(sizeof(identifier)); ininam(cp);                                /*char*/
    {
            identifier* with = cp; 
            strassvr(&with->name, "char     "); with->idtype = charptr; with->klass = types; }
    enterid(cp);
    cp = (identifier*)malloc(sizeof(identifier)); ininam(cp);                                /*boolean*/
    {
            identifier* with = cp; 
            strassvr(&with->name, "boolean  "); with->idtype = boolptr; with->klass = types; }
    enterid(cp);
    cp = (identifier*)malloc(sizeof(identifier)); ininam(cp);                                /*text*/
    {
            identifier* with = cp; 
            strassvr(&with->name, "text     "); with->idtype = textptr; with->klass = types; }
    enterid(cp);
    cp1 = nil;
    for( i = 1; i <= 2; i ++)
      { cp = (identifier*)malloc(sizeof(identifier)); ininam(cp);                        /*false,true*/
        {
                identifier* with = cp; 
                strassvr(&with->name, na[i-(1)]); with->idtype = boolptr;
            with->next = cp1; with->u.values.u.ival = i - 1; with->klass = konst;
        }
        enterid(cp); cp1 = cp;
      }
    boolptr->u.s_scalar.u.fconst = cp;
    for( i = 3; i <= 4; i ++)
      { cp = (identifier*)malloc(sizeof(identifier)); ininam(cp);                         /*input,output*/
        {
                identifier* with = cp; 
                strassvr(&with->name, na[i-(1)]); with->idtype = textptr; with->klass = vars;
            with->u.s_vars.vkind = actual; with->next = nil; with->u.s_vars.vlev = 1;
            with->u.s_vars.vaddr = lcaftermarkstack+(i-3)*filesize;
        }
        enterid(cp);
        if (i == 3)  inputptr = cp; else outputptr = cp;
      }
    for( i=33; i <= 34; i ++)
      { cp = (identifier*)malloc(sizeof(identifier)); ininam(cp);                         /*prd,prr files*/
         {
                 identifier* with = cp; 
                 strassvr(&with->name, na[i-(1)]); with->idtype = textptr; with->klass = vars;
              with->u.s_vars.vkind = actual; with->next = nil; with->u.s_vars.vlev = 1;
              with->u.s_vars.vaddr = lcaftermarkstack+(i-31)*filesize;
         }
         enterid(cp);
      }
    for( i = 5; i <= 16; i ++) if (i != 14)  /* no longer doing release */
      { cp = (identifier*)malloc(sizeof(identifier)); ininam(cp);                 /*get,put,reset*/
        {
                identifier* with = cp;                                             /*rewrite,read*/
                strassvr(&with->name, na[i-(1)]); with->idtype = nil;          /*write,pack*/
            with->u.s_proc.pflist = nil; with->next = nil; with->u.s_proc.u.key = i - 4;          /*unpack,new*/
            with->klass = proc; with->u.s_proc.pfdeckind = standard;               /*readln,writeln*/
        }
        enterid(cp);
      }
    for( i = 17; i <= 26; i ++)
      { cp = (identifier*)malloc(sizeof(identifier)); ininam(cp);                 /*abs,sqr,trunc*/
        {
                identifier* with = cp;                                             /*odd,ord,chr*/
                strassvr(&with->name, na[i-(1)]); with->idtype = nil;          /*pred,succ,eof*/
            with->u.s_proc.pflist = nil; with->next = nil; with->u.s_proc.u.key = i - 16;
            with->klass = func; with->u.s_proc.pfdeckind = standard;
        }
        enterid(cp);
      }
    for( i = 27; i <= 32; i ++)
      { 
        cp = (identifier*)malloc(sizeof(identifier)); ininam(cp);                                /*parameter of predeclared functions*/
        {
                identifier* with = cp; 
                strassvr(&with->name, "         "); with->idtype = realptr; with->klass = vars;
            with->u.s_vars.vkind = actual; with->next = nil; with->u.s_vars.vlev = 1; with->u.s_vars.vaddr = 0;
        }
        cp1 = (identifier*)malloc(sizeof(identifier)); ininam(cp1);            /*sin,cos,exp*/
        {
                identifier* with = cp1;                                            /*sqrt,ln,arctan*/
                strassvr(&with->name, na[i-(1)]); with->idtype = realptr; with->u.s_proc.pflist = cp;
            with->u.s_proc.u.s_declared.u.s_actual.forwdecl = false; with->u.s_proc.u.s_declared.u.s_actual.externl = true; with->u.s_proc.u.s_declared.pflev = 0; with->u.s_proc.u.s_declared.pfname = i - 12;
            with->klass = func; with->u.s_proc.pfdeckind = declared; with->u.s_proc.u.s_declared.pfkind = actual;
        }
        enterid(cp1);
      }
    cp = (identifier*)malloc(sizeof(identifier)); ininam(cp);                                 /*maxint*/
    {
            identifier* with = cp; 
            strassvr(&with->name, na[35]); with->idtype = intptr;
        with->next = nil; with->u.values.u.ival = maxint; with->klass = konst;
    } enterid(cp);
    cp = (identifier*)malloc(sizeof(identifier)); ininam(cp);                         /*round*/
    {
            identifier* with = cp; 
            strassvr(&with->name, na[36]); with->idtype = nil;
        with->u.s_proc.pflist = nil; with->next = nil; with->u.s_proc.u.key = 16;
        with->klass = func; with->u.s_proc.pfdeckind = standard;
    } enterid(cp);
    cp = (identifier*)malloc(sizeof(identifier)); ininam(cp);                         /*page*/
    {
            identifier* with = cp;    
            strassvr(&with->name, na[37]); with->idtype = nil; 
        with->u.s_proc.pflist = nil; with->next = nil; with->u.s_proc.u.key = 17;
        with->klass = proc; with->u.s_proc.pfdeckind = standard;
    } enterid(cp);
    cp = (identifier*)malloc(sizeof(identifier)); ininam(cp);                         /*dispose*/
    {
            identifier* with = cp;    
            strassvr(&with->name, na[38]); with->idtype = nil; 
        with->u.s_proc.pflist = nil; with->next = nil; with->u.s_proc.u.key = 18;
        with->klass = proc; with->u.s_proc.pfdeckind = standard;
    } enterid(cp);
  }   /*entstdnames*/ 

  void enterundecl()
  {
    utypptr = (identifier*)malloc(sizeof(identifier)); ininam(utypptr);
    {
            identifier* with = utypptr; 
            strassvr(&with->name, "         "); with->idtype = nil; with->klass = types; }
    ucstptr = (identifier*)malloc(sizeof(identifier)); ininam(ucstptr);
    {
            identifier* with = ucstptr; 
            strassvr(&with->name, "         "); with->idtype = nil; with->next = nil;
        with->u.values.u.ival = 0; with->klass = konst;
    }
    uvarptr = (identifier*)malloc(sizeof(identifier)); ininam(uvarptr);
    {
            identifier* with = uvarptr; 
            strassvr(&with->name, "         "); with->idtype = nil; with->u.s_vars.vkind = actual;
        with->next = nil; with->u.s_vars.vlev = 0; with->u.s_vars.vaddr = 0; with->klass = vars;
    }
    ufldptr = (identifier*)malloc(sizeof(identifier)); ininam(ufldptr);
    {
            identifier* with = ufldptr; 
            strassvr(&with->name, "         "); with->idtype = nil; with->next = nil; with->u.fldaddr = 0;
        with->klass = field;
    }
    uprcptr = (identifier*)malloc(sizeof(identifier)); ininam(uprcptr);
    {
            identifier* with = uprcptr; 
            strassvr(&with->name, "         "); with->idtype = nil; with->u.s_proc.u.s_declared.u.s_actual.forwdecl = false;
        with->next = nil; with->u.s_proc.u.s_declared.u.s_actual.externl = false; with->u.s_proc.u.s_declared.pflev = 0; genlabel(&with->u.s_proc.u.s_declared.pfname);
        with->klass = proc; with->u.s_proc.pflist = nil; with->u.s_proc.pfdeckind = declared; with->u.s_proc.u.s_declared.pfkind = actual;
    }
    ufctptr = (identifier*)malloc(sizeof(identifier)); ininam(ufctptr);
    {
            identifier* with = ufctptr; 
            strassvr(&with->name, "         "); with->idtype = nil; with->next = nil;
        with->u.s_proc.u.s_declared.u.s_actual.forwdecl = false; with->u.s_proc.u.s_declared.u.s_actual.externl = false; with->u.s_proc.u.s_declared.pflev = 0; genlabel(&with->u.s_proc.u.s_declared.pfname);
        with->klass = func; with->u.s_proc.pflist = nil; with->u.s_proc.pfdeckind = declared; with->u.s_proc.u.s_declared.pfkind = actual;
    }
  }   /*enterundecl*/ 

  /* tear down storage allocations from enterundecl */
  void exitundecl()
  {
    putnam(utypptr);
    putnam(ucstptr);                                  
    putnam(uvarptr);                                    
    putnam(ufldptr);                                    
    putnam(uprcptr);
    putnam(ufctptr);                                   
  }   /*exitundecl*/ 

  void initscalars()
  {
      integer i;
        fwptr = nil;
    prtables = false; list = true; prcode = true; debug = true;
    dp = true; prterr = true; errinx = 0;
    intlabel = 0; kk = maxids; fextfilep = nil;
    lc = lcaftermarkstack+filebuffer*filesize;
    /* note in the above reservation of buffer store for 2 text files */
    ic = 3; eol = true; linecount = 0;
    ch = ' '; chcnt = 0;
    mxint10 = maxint / 10; digmax = strglgth - 1;
    inputhdf = false;  /* set 'input' not in header files */
    outputhdf = false;  /* set 'output' not in header files */
    stalvl = 0;  /* clear statement nesting level */
    for( i = 1; i <= 500; i ++) errtbl[i-(1)] = false; /* initialize error tracking */
    toterr = 0;  /* clear error count */
    /* clear the recycling tracking counters */
    strcnt = 0;  /* strings */
    cspcnt = 0;  /* constants */
    stpcnt = 0;  /* structures */
    ctpcnt = 0;  /* identifiers */
    tstcnt = 0;  /* test entries */
    lbpcnt = 0;  /* label counts */
    filcnt = 0;  /* file tracking counts */
    cipcnt = 0; /* case entry tracking counts */
  }   /*initscalars*/ 

  void initsets()
  {
    constbegsys = setof(addop,intconst,realconst,stringconst,ident, eos);
    simptypebegsys = join(setof(lparent, eos), constbegsys);
    typebegsys=join(setof(arrow,packedsy,arraysy,recordsy,setsy,filesy, eos), simptypebegsys);
    typedels = setof(arraysy,recordsy,setsy,filesy, eos);
    blockbegsys = setof(labelsy,constsy,typesy,varsy,procsy,funcsy,beginsy, eos);
    selectsys = setof(arrow,period,lbrack, eos);
    facbegsys = setof(intconst,realconst,stringconst,ident,lparent,lbrack,notsy,nilsy, eos);
    statbegsys = setof(beginsy,gotosy,ifsy,whilesy,repeatsy,forsy,withsy,casesy, eos);
  }   /*initsets*/ 

  void inittables();

static void reswords()
{
  arrcpy(rw[ 0], "if       "); arrcpy(rw[ 1], "do       "); arrcpy(rw[ 2], "of       ");
  arrcpy(rw[ 3], "to       "); arrcpy(rw[ 4], "in       "); arrcpy(rw[ 5], "or       ");
  arrcpy(rw[ 6], "end      "); arrcpy(rw[ 7], "for      "); arrcpy(rw[ 8], "var      ");
  arrcpy(rw[9], "div      "); arrcpy(rw[10], "mod      "); arrcpy(rw[11], "set      ");
  arrcpy(rw[12], "and      "); arrcpy(rw[13], "not      "); arrcpy(rw[14], "nil      ");
  arrcpy(rw[15], "then     "); arrcpy(rw[16], "else     "); arrcpy(rw[17], "with     "); 
  arrcpy(rw[18], "goto     "); arrcpy(rw[19], "case     "); arrcpy(rw[20], "type     "); 
  arrcpy(rw[21], "file     "); arrcpy(rw[22], "begin    "); arrcpy(rw[23], "until    "); 
  arrcpy(rw[24], "while    "); arrcpy(rw[25], "array    "); arrcpy(rw[26], "const    "); 
  arrcpy(rw[27], "label    "); arrcpy(rw[28], "repeat   "); arrcpy(rw[29], "record   ");
  arrcpy(rw[30], "downto   "); arrcpy(rw[31], "packed   "); arrcpy(rw[32], "program  ");
  arrcpy(rw[33], "function "); arrcpy(rw[34], "procedure");
  frw[0] =  1; frw[1] =  1; frw[2] =  7; frw[3] = 16; frw[4] = 23;
  frw[5] = 29; frw[6] = 33; frw[7] = 34; frw[8] = 35; frw[9] = 36;
}   /*reswords*/ 



static void symbols()
{
  rsy[ 0] = ifsy;      rsy[ 1] = dosy;      rsy[ 2] = ofsy;
  rsy[ 3] = tosy;      rsy[ 4] = relop;     rsy[ 5] = addop;
  rsy[ 6] = endsy;     rsy[ 7] = forsy;     rsy[ 8] = varsy;
  rsy[9] = mulop;     rsy[10] = mulop;     rsy[11] = setsy;
  rsy[12] = mulop;     rsy[13] = notsy;     rsy[14] = nilsy;
  rsy[15] = thensy;    rsy[16] = elsesy;    rsy[17] = withsy; 
  rsy[18] = gotosy;    rsy[19] = casesy;    rsy[20] = typesy;
  rsy[21] = filesy;    rsy[22] = beginsy;   rsy[23] = untilsy;
  rsy[24] = whilesy;   rsy[25] = arraysy;   rsy[26] = constsy;
  rsy[27] = labelsy;   rsy[28] = repeatsy;  rsy[29] = recordsy;
  rsy[30] = downtosy;  rsy[31] = packedsy;  rsy[32] = progsy;
  rsy[33] = funcsy;    rsy[34] = procsy;
  ssy['+' -  -128] = addop;   ssy['-' -  -128] = addop;    ssy['*' -  -128] = mulop;
  ssy['/' -  -128] = mulop;   ssy['(' -  -128] = lparent;  ssy[')' -  -128] = rparent;
  ssy['$' -  -128] = othersy; ssy['=' -  -128] = relop;    ssy[' ' -  -128] = othersy;
  ssy[',' -  -128] = comma;   ssy['.' -  -128] = period;   ssy['\'' -  -128]= othersy;
  ssy['[' -  -128] = lbrack;  ssy[']' -  -128] = rbrack;   ssy[':' -  -128] = colon;
  ssy['^' -  -128] = arrow;   ssy['<' -  -128] = relop;    ssy['>' -  -128] = relop;
  ssy[';' -  -128] = semicolon; ssy['@' -  -128] = arrow;
}   /*symbols*/ 



static void rators()
{
      integer i;

  for( i = 1; i <= maxres; /*nr of res words*/ i ++) rop[i-(1)] = noop;
  rop[4] = inop; rop[9] = idiv; rop[10] = imod;
  rop[5] = orop; rop[12] = andop;
  for( i = ordminchar; i <= ordmaxchar; i ++) sop[chr(i) -  -128] = noop;
  sop['+' -  -128] = plus; sop['-' -  -128] = minus; sop['*' -  -128] = mul; sop['/' -  -128] = rdiv;
  sop['=' -  -128] = eqop; sop['<' -  -128] = ltop;  sop['>' -  -128] = gtop;
}   /*rators*/ 



static void procmnemonics()
{
  /* There are two mnemonics that have no counterpart in the
        assembler/interpreter: wro, pak. I didn't find a generator for them, and
        suspect they are abandoned. */
  arrcpy(sna[ 0], " get"); arrcpy(sna[ 1], " put"); arrcpy(sna[ 2], " rdi"); arrcpy(sna[ 3], " rdr");
  arrcpy(sna[ 4], " rdc"); arrcpy(sna[ 5], " wri"); arrcpy(sna[ 6], " wro"); arrcpy(sna[ 7], " wrr");
  arrcpy(sna[ 8], " wrc"); arrcpy(sna[9], " wrs"); arrcpy(sna[10], " pak"); arrcpy(sna[11], " new");
  arrcpy(sna[12], " rst"); arrcpy(sna[13], " eln"); arrcpy(sna[14], " sin"); arrcpy(sna[15], " cos");
  arrcpy(sna[16], " exp"); arrcpy(sna[17], " sqt"); arrcpy(sna[18], " log"); arrcpy(sna[19], " atn");
  arrcpy(sna[20], " rln"); arrcpy(sna[21], " wln"); arrcpy(sna[22], " sav"); 
  /* new procedure/function memonics for p5 */
  arrcpy(sna[23], " pag"); arrcpy(sna[24], " rsf"); arrcpy(sna[25], " rwf"); arrcpy(sna[26], " wrb");
  arrcpy(sna[27], " wrf"); arrcpy(sna[28], " dsp"); arrcpy(sna[29], " wbf"); arrcpy(sna[30], " wbi");
  arrcpy(sna[31], " wbr"); arrcpy(sna[32], " wbc"); arrcpy(sna[33], " wbb"); arrcpy(sna[34], " rbf");
  arrcpy(sna[35], " rsb"); arrcpy(sna[36], " rwb"); arrcpy(sna[37], " gbf"); arrcpy(sna[38], " pbf");

}   /*procmnemonics*/ 



static void instrmnemonics()
{
  arrcpy(mn[ 0], " abi"); arrcpy(mn[ 1], " abr"); arrcpy(mn[ 2], " adi"); arrcpy(mn[ 3], " adr");
  arrcpy(mn[ 4], " and"); arrcpy(mn[ 5], " dif"); arrcpy(mn[ 6], " dvi"); arrcpy(mn[ 7], " dvr");
  arrcpy(mn[ 8], " eof"); arrcpy(mn[ 9], " flo"); arrcpy(mn[10], " flt"); arrcpy(mn[11], " inn");
  arrcpy(mn[12], " int"); arrcpy(mn[13], " ior"); arrcpy(mn[14], " mod"); arrcpy(mn[15], " mpi");
  arrcpy(mn[16], " mpr"); arrcpy(mn[17], " ngi"); arrcpy(mn[18], " ngr"); arrcpy(mn[19], " not");
  arrcpy(mn[20], " odd"); arrcpy(mn[21], " sbi"); arrcpy(mn[22], " sbr"); arrcpy(mn[23], " sgs");
  arrcpy(mn[24], " sqi"); arrcpy(mn[25], " sqr"); arrcpy(mn[26], " sto"); arrcpy(mn[27], " trc");
  arrcpy(mn[28], " uni"); arrcpy(mn[29], " stp"); arrcpy(mn[30], " csp"); arrcpy(mn[31], " dec");
  arrcpy(mn[32], " ent"); arrcpy(mn[33], " fjp"); arrcpy(mn[34], " inc"); arrcpy(mn[35], " ind");
  arrcpy(mn[36], " ixa"); arrcpy(mn[37], " lao"); arrcpy(mn[38], " lca"); arrcpy(mn[39], " ldo");
  arrcpy(mn[40], " mov"); arrcpy(mn[41], " mst"); arrcpy(mn[42], " ret"); arrcpy(mn[43], " sro");
  arrcpy(mn[44], " xjp"); arrcpy(mn[45], " chk"); arrcpy(mn[46], " cup"); arrcpy(mn[47], " equ");
  arrcpy(mn[48], " geq"); arrcpy(mn[49], " grt"); arrcpy(mn[50], " lda"); arrcpy(mn[51], " ldc");
  arrcpy(mn[52], " leq"); arrcpy(mn[53], " les"); arrcpy(mn[54], " lod"); arrcpy(mn[55], " neq");
  arrcpy(mn[56], " str"); arrcpy(mn[57], " ujp"); arrcpy(mn[58], " ord"); arrcpy(mn[59], " chr");
  arrcpy(mn[60], " ujc"); 
  /* new instruction memonics for p5 */
  arrcpy(mn[61], " rnd"); arrcpy(mn[62], " pck"); arrcpy(mn[63], " upk"); arrcpy(mn[64], " rgs");
  arrcpy(mn[65], " fbv"); arrcpy(mn[66], " ipj"); arrcpy(mn[67], " cip"); arrcpy(mn[68], " lpa");
  arrcpy(mn[69], " efb"); arrcpy(mn[70], " fvb"); arrcpy(mn[71], " dmp"); arrcpy(mn[72], " swp");
  arrcpy(mn[73], " tjp"); arrcpy(mn[74], " lip"); 
}   /*instrmnemonics*/ 



static void chartypes()
{
    integer i;

  for( i = ordminchar; i <= ordmaxchar; i ++) chartp[chr(i) -  -128] = illegal;
  chartp['a' -  -128] = letter;
  chartp['b' -  -128] = letter; chartp['c' -  -128] = letter;
  chartp['d' -  -128] = letter; chartp['e' -  -128] = letter;
  chartp['f' -  -128] = letter; chartp['g' -  -128] = letter;
  chartp['h' -  -128] = letter; chartp['i' -  -128] = letter;
  chartp['j' -  -128] = letter; chartp['k' -  -128] = letter;
  chartp['l' -  -128] = letter; chartp['m' -  -128] = letter;
  chartp['n' -  -128] = letter; chartp['o' -  -128] = letter;
  chartp['p' -  -128] = letter; chartp['q' -  -128] = letter;
  chartp['r' -  -128] = letter; chartp['s' -  -128] = letter;
  chartp['t' -  -128] = letter; chartp['u' -  -128] = letter;
  chartp['v' -  -128] = letter; chartp['w' -  -128] = letter;
  chartp['x' -  -128] = letter; chartp['y' -  -128] = letter;
  chartp['z' -  -128] = letter; 
  chartp['A' -  -128] = letter;
  chartp['B' -  -128] = letter; chartp['C' -  -128] = letter;
  chartp['D' -  -128] = letter; chartp['E' -  -128] = letter;
  chartp['F' -  -128] = letter; chartp['G' -  -128] = letter;
  chartp['H' -  -128] = letter; chartp['I' -  -128] = letter;
  chartp['J' -  -128] = letter; chartp['K' -  -128] = letter;
  chartp['L' -  -128] = letter; chartp['M' -  -128] = letter;
  chartp['N' -  -128] = letter; chartp['O' -  -128] = letter;
  chartp['P' -  -128] = letter; chartp['Q' -  -128] = letter;
  chartp['R' -  -128] = letter; chartp['S' -  -128] = letter;
  chartp['T' -  -128] = letter; chartp['U' -  -128] = letter;
  chartp['V' -  -128] = letter; chartp['W' -  -128] = letter;
  chartp['X' -  -128] = letter; chartp['Y' -  -128] = letter;
  chartp['Z' -  -128] = letter; 
  chartp['0' -  -128] = number;
  chartp['1' -  -128] = number; chartp['2' -  -128] = number;
  chartp['3' -  -128] = number; chartp['4' -  -128] = number;
  chartp['5' -  -128] = number; chartp['6' -  -128] = number;
  chartp['7' -  -128] = number; chartp['8' -  -128] = number;
  chartp['9' -  -128] = number; chartp['+' -  -128] = special;
  chartp['-' -  -128] = special; chartp['*' -  -128] = special;
  chartp['/' -  -128] = special; chartp['(' -  -128] = chlparen;
  chartp[')' -  -128] = special; chartp['$' -  -128] = special;
  chartp['=' -  -128] = special; chartp[' ' -  -128] = chspace;
  chartp[',' -  -128] = special; chartp['.' -  -128] = chperiod;
  chartp['\'' -  -128]= chstrquo; chartp['[' -  -128] = special;
  chartp[']' -  -128] = special; chartp[':' -  -128] = chcolon;
  chartp['^' -  -128] = special; chartp[';' -  -128] = special;
  chartp['<' -  -128] = chlt; chartp['>' -  -128] = chgt;
  chartp['{' -  -128] = chlcmt; chartp['}' -  -128] = special;
  chartp['@' -  -128] = special;

  ordint['0' -  -128] = 0; ordint['1' -  -128] = 1; ordint['2' -  -128] = 2;
  ordint['3' -  -128] = 3; ordint['4' -  -128] = 4; ordint['5' -  -128] = 5;
  ordint['6' -  -128] = 6; ordint['7' -  -128] = 7; ordint['8' -  -128] = 8;
  ordint['9' -  -128] = 9;
}



static void initdx()
{
  cdx[ 0] =  0; cdx[ 1] =  0; cdx[ 2] = -1; cdx[ 3] = -1;
  cdx[ 4] = -1; cdx[ 5] = -1; cdx[ 6] = -1; cdx[ 7] = -1;
  cdx[ 8] =  0; cdx[ 9] =  0; cdx[10] =  0; cdx[11] = -1;
  cdx[12] = -1; cdx[13] = -1; cdx[14] = -1; cdx[15] = -1;
  cdx[16] = -1; cdx[17] =  0; cdx[18] =  0; cdx[19] =  0;
  cdx[20] =  0; cdx[21] = -1; cdx[22] = -1; cdx[23] =  0;
  cdx[24] =  0; cdx[25] =  0; cdx[26] = -2; cdx[27] =  0;
  cdx[28] = -1; cdx[29] =  0; cdx[30] =  0; cdx[31] =  0;
  cdx[32] =  0; cdx[33] = -1; cdx[34] =  0; cdx[35] =  0;
  cdx[36] = -1; cdx[37] = +1; cdx[38] = +1; cdx[39] = +1;
  cdx[40] = -2; cdx[41] =  0; cdx[42] =  0; cdx[43] = -1;
  cdx[44] = -1; cdx[45] =  0; cdx[46] =  0; cdx[47] = -1;
  cdx[48] = -1; cdx[49] = -1; cdx[50] = +1; cdx[51] = +1;
  cdx[52] = -1; cdx[53] = -1; cdx[54] = +1; cdx[55] = -1;
  cdx[56] = -1; cdx[57] =  0; cdx[58] =  0; cdx[59] =  0;
  cdx[60] =  0; cdx[61] =  0; cdx[62] = -3; cdx[63] = -3;
  cdx[64] = -1; cdx[65] =  0; cdx[66] =  0; cdx[67] = -1;
  cdx[68] = +2; cdx[69] =  0; cdx[70] = -1; cdx[71] = -1;
  cdx[72] =  0; cdx[73] = -1; cdx[74] = +2;

  pdx[ 0] = -1; pdx[ 1] = -1; pdx[ 2] = -1; pdx[ 3] = -1;
  pdx[ 4] = -1; pdx[ 5] = -2; pdx[ 6] = -3; pdx[ 7] = -2;
  pdx[ 8] = -2; pdx[9] = -3; pdx[10] =  0; pdx[11] = -2;
  pdx[12] = -1; pdx[13] =  0; pdx[14] =  0; pdx[15] =  0;
  pdx[16] =  0; pdx[17] =  0; pdx[18] =  0; pdx[19] =  0;
  pdx[20] =  0; pdx[21] =  0; pdx[22] = -1; pdx[23] = -1;
  pdx[24] = -1; pdx[25] = -1; pdx[26] = -2; pdx[27] = -3;
  pdx[28] = -2; pdx[29] = -2; pdx[30] = -1; pdx[31] = -1;
  pdx[32] = -1; pdx[33] = -1; pdx[34] = -2; pdx[35] = -1; 
  pdx[36] = -1; pdx[37] = -2; pdx[38] = -2;
}

  void inittables()

  {     /*inittables*/
    reswords(); symbols(); rators();
    instrmnemonics(); procmnemonics();
    chartypes(); initdx();
  }   /*inittables*/ 

int main(int argc, const char* argv[])
{

  pio_initialize(argc, argv);
  cwrite("P5 Pascal compiler vs. %1i.%1i\n", majorver, minorver);
  cwrite("\n");

  /*initialize*/
  /************/
  initscalars(); initsets(); inittables();


  /*enter standard names and standard types:*/
  /******************************************/
  level = 0; top = 0;
  {
          struct A2* with = &display[0 - min_disprange]; 
          with->fname = nil; with->flabel = nil; with->fconst = nil; with->fstruct = nil; 
          with->occur = blck; }
  enterstdtypes();   stdnames(); entstdnames();   enterundecl();
  top = 1; level = 1;
  {
          struct A2* with = &display[1 - min_disprange]; 
          with->fname = nil; with->flabel = nil; with->fconst = nil; with->fstruct = nil; 
          with->occur = blck; }

  /*compile:*/
  /**********/

  /* !!! remove this statement for self compile */
  /*elide*/rewrite(prr, 0, 0, 0);/*noelide*/ /* open output file */

  /* write generator comment */
  twrite(&prr, "i\n");
  twrite(&prr, "i Pascal intermediate file Generated by P5 Pascal compiler vs. %1i.%1i\n", 
          majorver, minorver);
  twrite(&prr, "i\n");
  insymbol();
  programme(difference(join(blockbegsys, statbegsys), setof(casesy, eos)));

  /* dispose of levels 0 and 1 */
  putdsp(1);
  putdsp(0);

  /* remove undeclared ids */
  exitundecl();

  cwrite("\n");
  cwrite("Errors in program: %1i\n", toterr);
  /* output error report as required */
  f = true;
  for( i = 1; i <= 500; i ++) if (errtbl[i-(1)])  {
    if (f)  {
      cwrite("\n");
      cwrite("Error numbers in listing:\n");
      cwrite("-------------------------\n");
      f = false;
    }
    cwrite("%3i  ", i); errmsg(i); cwrite("\n");
  }
  if (! f)  cwrite("\n");

  if (doprtryc)  {       /* print recyling tracking counts */

    cwrite("\n");
    cwrite("Recycling tracking counts:\n");
    cwrite("\n");
    cwrite("string quants:              %1i\n", strcnt);
    cwrite("constants:                  %1i\n", cspcnt);
    cwrite("structures:                 %1i\n", stpcnt);
    cwrite("identifiers:                %1i\n", ctpcnt);
    cwrite("test entries:               %1i\n", tstcnt);
    cwrite("label counts:               %1i\n", lbpcnt);
    cwrite("file tracking counts:       %1i\n", filcnt);
    cwrite("case entry tracking counts: %1i\n", cipcnt);
    cwrite("\n");

  }

  /* perform errors for recycling balance */

  if (strcnt != 0)  
     cwrite("*** Error: Compiler internal error: string recycle balance: %1i\n", 
             strcnt);
  if (cspcnt != 0)  
     cwrite("*** Error: Compiler internal error: constant recycle balance: %1i\n", 
             cspcnt);
  if (stpcnt != 0)  
     cwrite("*** Error: Compiler internal error: structure recycle balance: %1i\n", 
             stpcnt);
  if (ctpcnt != 0)  
     cwrite("*** Error: Compiler internal error: identifier recycle balance: %1i\n", 
             ctpcnt);
  if (tstcnt != 0)  
     cwrite("*** Error: Compiler internal error: test recycle balance: %1i\n", 
             tstcnt);
  if (lbpcnt != 0)  
     cwrite("*** Error: Compiler internal error: label recycle balance: %1i\n", 
             lbpcnt);
  if (filcnt != 0)  
     cwrite("*** Error: Compiler internal error: file recycle balance: %1i\n", 
             filcnt);
  if (cipcnt != 0)  
     cwrite("*** Error: Compiler internal error: case recycle balance: %1i\n", 
             cipcnt);

  L99:;

  return EXIT_SUCCESS;
}
