#include "ptoc.h"

#ifdef __CATALINA__
#define round(x) lround(x)
extern int wait_for_key();
#else
#define wait_for_key()
#endif

/*$c+,t-,d-,l-*/
/*******************************************************************************
*                                                                              *
*                           Portable Pascal compiler                           *
*                           ************************                           *
*                                                                              *
*                                 Pascal P5                                    *
*                                                                              *
*                                 ETH May 76                                   *
*                                                                              *
* Authors:                                                                     *
*                                                                              *
*    Urs Ammann                                                                *
*    Kesav Nori                                                                *
*    Christian Jacobi                                                          *
*    K. Jensen                                                                 *
*    N. Wirth                                                                  *
*                                                                              *
* Address:                                                                     *
*                                                                              *
*    Institut Fuer Informatik                                                  *
*    Eidg. Technische Hochschule                                               *
*    CH-8096 Zuerich                                                           *
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
* Note for the implementation.                                                 *
* ===========================                                                  *
* This interpreter is written for the case where all the fundamental types     *
* take one storage unit.                                                       *
*                                                                              *
* In an actual implementation, the handling of the sp pointer has to take      *
* into account the fact that the types may have lengths different from one:    *
* in push and pop operations the sp has to be increased and decreased not      *
* by 1, but by a number depending on the type concerned.                       *
*                                                                              *
* However, where the number of units of storage has been computed by the       *
* compiler, the value must not be corrected, since the lengths of the types    *
* involved have already been taken into account.                               *
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
* fbv             Validates a file buffer variable. Expects a file address on  *
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
* fvb             Expects the length of the file buffer on stack, and the file *
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
*                 reset().                                                     *
*                                                                              *
* rwf    rewrite: Expects a logical file number on stack top. Performs         *
*                 reset().                                                     *
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
* wrf    write:   Expects a fraction number on on stack top, followed by a     *
*                 field number, then a real to print, then the file address.   *
*                 The  real is output in r:f:f (fraction) format. All but the  *
*                 file are removed from stack.                                 *
*                                                                              *
* wbf    write:   Expects the length of the type to write, followed by the     *
*                 variable address to write from, then the file address to     *
*                 write to. Writes binary store to the file.                   *
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
*                 reset() and sets the file to binary mode read.               *
*                                                                              *
* rwb    rewrite: Expects a logical file number on stack top. Performs         *
*                 rewrite() and sets the file to binary mode write.            *
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
* New layout of memory in store:                                               *
*                                                                              *
*    maxstr -> ---------------------                                           *
*              | Constants         |                                           *
*        cp -> ---------------------                                           *
*              | Dynamic variables |                                           *
*        np -> ---------------------                                           *
*              | Free space        |                                           *
*        sp -> ---------------------                                           *
*              | Stack             |                                           *
*              ---------------------                                           *
*              | Code              |                                           *
*              ---------------------                                           *
*                                                                              *
* The constants are loaded upside down from the top of memory. The heap grows  *
* down, the stack grows up, and when they cross, it is an overflow error.      *
*                                                                              *
*******************************************************************************/





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
intal = 4,               /* alignment of integer */
realsize = 8,            /* size of real */
realal = 4,              /* alignment of real */
charsize = 1,            /* size of char */
charal = 1,              /* alignment of char */
charmax = 1,
boolsize = 1,            /* size of boolean */
boolal = 1,              /* alignment of boolean */
ptrsize = 4,             /* size of pointer */
adrsize = 4,             /* size of address */
adral = 4,               /* alignment of address */
setsize = 32,            /* size of set */
setal = 1,               /* alignment of set */
filesize = 2,            /* required runtime space for file (logical no.) */
fileidsize = 1,          /* size of the lfn only */
stackal = 4,             /* alignment of stack */
stackelsize = 4,         /* stack element size */
maxsize = 32,            /* this is the largest type that can be on the stack */
/* Heap alignment should be either the natural word alignment of the 
        machine, or the largest object needing alignment that will be allocated.
        It can also be used to enforce minimum block allocation policy. */
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

/* internal constants */

/* !!! Need to use the small size memory to self compile, otherwise, by 
        definition, pint cannot fit into its own memory. */
#ifdef __CATALINA_P2
// The P2 has enough space to fit the original buffer size
/*elide*/maxstr = 100000,   /*noelide*/  /* maximum size of addressing for program/var */
#else
// The P1 generally needs a much smaller buffer size to fit in XMM SRAM
/*elide*/maxstr = 50000,   /*noelide*/  /* maximum size of addressing for program/var */
#endif
/*remove maxstr     =  2000000; remove*/  /* maximum size of addressing for program/var */
maxdigh = 6,           /* number of digits in hex representation of maxstr */
maxdigd = 8,           /* number of digits in decimal representation of maxstr */

codemax = maxstr,      /* set size of code store to maximum possible */
pcmax = codemax,       /* set size of pc as same */
begincode = 9  /*2+6+1*/,/* beginning of code, offset by program preamble:

                                  2: mst
                                  6: cup
                                  1: stp

                             */
maxlabel = 5000,       /* total possible labels in intermediate */
resspc = 0,            /* reserve space in heap (if you want) */

/* the header files have a logical no. followed by a buffer var */
inputoff = 32,         /* 'input' file address */
outputoff = 34,        /* 'output' file address */
prdoff = 36,           /* 'prd' file address */
prroff = 38,           /* 'prr' file address */

/* assigned logical channels for header files */
inputfn = 1,           /* 'input' file no. */
outputfn = 2,          /* 'output' file no. */
prdfn = 3,             /* 'prd' file no. */
prrfn = 4,             /* 'prr' file no. */

/* Mark element offsets 

        Mark format is:

        0:  Function return value, 64 bits, enables a full real result.
        8:  Static link.
        12: Dynamic link.
        16: Saved EP from previous frame.
        20: Stack bottom after locals allocate. Used for interprocdural gotos.
        24: EP from current frame. Used for interprocedural gotos.
        28: Return address

      */
markfv = 0,             /* function value */
marksl = 8,             /* static link */
markdl = 12,            /* dynamic link */
markep = 16,            /* (old) maximum frame size */
marksb = 20,            /* stack bottom */
market = 24,            /* current ep */
markra = 28,            /* return address */

stringlgth = 1000,     /* longest string length we can buffer */
maxsp = 36,            /* number of predefined procedures/functions */
maxins = 255,          /* maximum instruction code, 0-255 or byte */
maxfil = 100,          /* maximum number of general (temp) files */
maxalfa = 10,          /* maximum number of characters in alfa type */
ujplen = 5,            /* length of ujp instruction (used for case jumps) */

/* debug flags: turn these on for various dumps and traces */

dodmpins = false,       /* dump instructions after assembly */
dodmplab = false,       /* dump label definitions */
dodmpsto = false,       /* dump storage area specs */
dotrcrot = false,       /* trace routine executions */
dotrcins = false,       /* trace instruction executions */
dopmd = false,          /* perform post-mortem dump on error */
dosrclin = true,        /* add source line sets to code */
dotrcsrc = false,       /* trace source line executions (requires dosrclin) */
dodmpspc = false,       /* dump heap space after execution */
dorecycl = true,        /* obey heap space recycle requests */
/* We can perform limited checking for attempts to access freed heap
        blocks, but only if we don't recycle them, because this moves the header
        information around. It is "limited" because there is nothing to prevent
        the program from holding the address of a data item within the block
        past a dispose. */                      
dochkrpt = false,       /* check reuse of freed entry (automatically 
                                invokes dorecycl = false */

/* version numbers */

majorver = 0,   /* major version number */
minorver = 8};        /* minor version number */

/* These equates define the instruction layout. I have choosen a 32 bit
        layout for the instructions defined by (4 bit) digit:

           byte 0:   Instruction code
           byte 1:   P parameter
           byte 2-5: Q parameter

        This means that there are 256 instructions, 256 procedure levels,
        and 2gb of total addressing. This could be 4gb if we get rid of the
        need for negatives. */
typedef unsigned char lvltyp;
#define min_lvltyp 0
#define max_lvltyp 255
                          /* procedure/function level */
typedef unsigned char instyp;
#define min_instyp 0
#define max_instyp maxins
                          /* instruction */
typedef int address;
#define min_address -maxstr
#define max_address maxstr
                               /* address */

typedef enum { undef,int_,reel,bool_,sett,adr,mark,car, last_datatype} datatype;
typedef char beta[25];                     /*error message*/
typedef set settype;
typedef unsigned char alfainx;
#define min_alfainx 1
#define max_alfainx maxalfa
                          /* index for alfa type */
typedef char alfa[max_alfainx-min_alfainx+1];
typedef unsigned char byte1;
#define min_byte1 0
#define max_byte1 255
                      /* 8-bit byte */
typedef file(byte1) bytfil; /* untyped file of bytes */
typedef unsigned char my_fileno;
#define min_fileno 0
#define max_fileno maxfil
                               /* logical file number */

address pc;              /*program address register*/
address pctop;           /* top of code store */
instyp op; lvltyp p; address q;        /*instruction register*/
address q1;  /* extra parameter */
byte1 store_[maxstr-0+1];                /* complete program storage */
address cp;             /* pointer to next free constant position */
address mp,sp,np,ep;    /* address registers */
/*mp  points to beginning of a data segment
        sp  points to top of the stack
        ep  points to the maximum extent of the stack
        np  points to top of the dynamically allocated area*/

boolean interpreting;

/* !!! remove this next statement for self compile */
/*elide*/text prd = VOID_FILE,prr = VOID_FILE;/*noelide*//*prd for read only, prr for write only */

alfa instr[max_instyp-min_instyp+1]; /* mnemonic instruction codes */
alfa sptable[maxsp-0+1];               /*standard functions and procedures*/
boolean insp[max_instyp-min_instyp+1];  /* instruction includes a p parameter */
unsigned char insq[max_instyp-min_instyp+1]; /* length of q parameter */
integer srclin;        /* current source line executing */

text filtable[maxfil] = {0};             /* general (temp) text file holders */
/* general (temp) binary file holders */
bytfil bfiltable[maxfil] = {0};
/* file state holding */
enum {                              fclosed, fread1, fwrite1} filstate[maxfil];
/* file buffer full status */
boolean filbuff[maxfil];

/*locally used for interpreting one instruction*/
address ad,ad1;
boolean b;
integer i,j,i1,i2;
char c;
integer i3, i4;
integer pa;
real r1, r2;
boolean b1, b2;
settype s1, s2;
char c1, c2;
address a1, a2, a3;
my_fileno fn;
address pcs;

/*--------------------------------------------------------------------*/

/* Accessor functions

  These translate store variables to internal, and convert to and from store BAM
  formats.

  The acessors are fairly machine independent, they rely here on the machine
  being byte addressable. The endian format is inherent to the machine.

  The exception are the get/put int8,16,32,64 and 128 bit routines, which are
  dependent on the endian mode of the machine.

*/

integer getint(address a)

{
    struct { union {

          integer i;
          byte1 b[intsize];
             } u;

    } r;
    unsigned char i;



   integer getint_result;
   for( i = 1; i <= intsize; i ++) r.u.b[i-(1)] = store_[a+i-1];

   getint_result = r.u.i; 

   return getint_result;
}

void putint(address a, integer x) 

{
    struct { union {

          integer i;
          byte1 b[intsize];
             } u;

    } r;
    unsigned char i;



   r.u.i = x;
   for( i = 1; i <= intsize; i ++) store_[a+i-1] = r.u.b[i-(1)];

}

real getrel(address a)

{
    struct { union {

          real r;
          byte1 b[realsize];
             } u;

    } r;
    unsigned char i;



   real getrel_result;
   for( i = 1; i <= realsize; i ++) r.u.b[i-(1)] = store_[a+i-1];
   getrel_result = r.u.r; 

   return getrel_result;
}

void putrel(address a, real f)

{
    struct { union {

          real r;
          byte1 b[realsize];
             } u;

    } r;
    unsigned char i;



   r.u.r = f;
   for( i = 1; i <= realsize; i ++) store_[a+i-1] = r.u.b[i-(1)];

}

boolean getbol(address a)

{
    boolean b;



   boolean getbol_result;
   if (store_[a] == 0)  b = false; else b = true;
   getbol_result = b;

   return getbol_result;
}

void putbol(address a, boolean b)

{

   store_[a] = ord(b);

}

void getset(address a, settype* s)

{
    struct { union {

          settype s;
          byte1 b[setsize];
             } u;

    } r;
    unsigned char i;



   for( i = 1; i <= setsize; i ++) r.u.b[i-(1)] = store_[a+i-1];
   *s = r.u.s; 

}

void putset(address a, settype s)

{
    struct { union {

          settype s;
          byte1 b[setsize];
             } u;

    } r;
    unsigned char i;



   r.u.s = s;
   for( i = 1; i <= setsize; i ++) store_[a+i-1] = r.u.b[i-(1)];

}

char getchr(address a)

{

   char getchr_result;
   getchr_result = chr(store_[a]);

   return getchr_result;
}

void putchr(address a, char c)

{

   store_[a] = ord(c);

}

address getadr(address a)

{
    struct { union {

          address a;
          byte1 b[adrsize];
             } u;

    } r;
    unsigned char i;



   address getadr_result;
   for( i = 1; i <= adrsize; i ++) r.u.b[i-(1)] = store_[a+i-1];
   getadr_result = r.u.a; 

   return getadr_result;
}

void putadr(address a, address ad)

{
    struct { union {

          address a;
          byte1 b[adrsize];
             } u;

    } r;
    unsigned char i;



   r.u.a = ad;
   for( i = 1; i <= adrsize; i ++) store_[a+i-1] = r.u.b[i-(1)];

}

/* Swap pointer on top with second on stack. The size of the second is given. */

void swpstk(address l)

{
    byte1 sb[maxsize];
    address p;
    unsigned char i;



   /* get the top pointer */
   p = getadr(sp-adrsize);
   /* load up the second on stack */
   for( i = 1; i <= l; i ++) sb[i-(1)] = store_[sp-adrsize-l+i-1];
   putadr(sp-adrsize-l, p); /* place pointer at bottom */
   for( i = 1; i <= l; i ++) store_[sp-l+i-1] = sb[i-(1)]; /* place second as new top */

}

/* end of accessor functions

(*--------------------------------------------------------------------*/

/* Push/pop

  These routines handle both the data type, and their lengths on the stack.

*/

void popint(integer* i) { sp = sp-intsize; *i = getint(sp); }
void pshint(integer i) { putint(sp, i); sp = sp+intsize; }
void poprel(real* r) { sp = sp-realsize; *r = getrel(sp); }
void pshrel(real r) { putrel(sp, r); sp = sp+realsize; }
void popset(settype* s) { sp = sp-setsize; getset(sp, s); }
void pshset(settype s) { putset(sp, s); sp = sp+setsize; }
void popadr(address* a) { sp = sp-adrsize; *a = getadr(sp); }
void pshadr(address a) { putadr(sp, a); sp = sp+adrsize; }

/* print in hex (carefull, it chops high digits freely!) */

void wrthex(integer v,       /* value */ integer f /* field */)
{
    integer p,i,d;

   p = 1;
   for( i = 1; i <= f-1; i ++) p = p*16;
   while (p > 0)  {
      d = v / p % 16;      /* extract digit */
      if (d < 10)  cwrite("%c", chr(d+ord('0')));
      else cwrite("%c", chr(d-10+ord('A')));
      p = p / 16;
   }
}

/* list single instruction at address */

void lstins(address* ad)

{
    address ads;
    instyp op; lvltyp p; address q;       /*instruction register*/



   /* fetch instruction from byte store */
   ads = *ad;
   op = store_[*ad]; *ad = *ad+1;
   if (insp[op - min_instyp])  { p = store_[*ad]; *ad = *ad+1; }
   if (insq[op - min_instyp] > 0)  { 

      switch (insq[op - min_instyp]) {

         case 1:        q = store_[*ad]; break;
         case intsize:  q = getint(*ad); break;

      }
      *ad = *ad+insq[op - min_instyp]; 

   }
   cwrite(": ");
   wrthex(op, 2);
   cwrite(" %10s  ", min_alfainx, max_alfainx, instr[op - min_instyp]);
   if (insp[op - min_instyp])  {

      wrthex(p, 2);
      if (insq[op - min_instyp] > 0)  { cwrite(","); wrthex(q, maxdigh); }

   } else if (insq[op - min_instyp] > 0)  { cwrite("   "); wrthex(q, maxdigh); }

} 

/* dump contents of instruction memory */

void dmpins()

{
    address i;



   cwrite("\n");
   cwrite("Contents of instruction memory\n");
   cwrite("\n");
   cwrite("  Addr  Opc Ins          P       Q\n");
   cwrite("----------------------------------\n");
   i = 0;
   while (i < pctop)  {

      wrthex(i, maxdigh);
      lstins(&i);
      cwrite("\n");

   }
   cwrite("\n");

} 

/* align address, upwards */

void alignu(address algn, address* flc)
{
      integer l;

  if (*flc % algn != 0) {
    
    l = *flc-1;
    *flc = l + algn  -  (algn+l) % algn;
  }
}   /*align*/

/* align address, downwards */

void alignd(address algn, address* flc)
{
      integer l;

  if (*flc % algn != 0) {
    l = *flc+1;
    *flc = l - algn  +  (algn-l) % algn;
  }
}   /*align*/

/*--------------------------------------------------------------------*/

/* load intermediate file */

void load();

typedef enum {entered,defined, last_labelst} labelst; /*label situation*/
typedef unsigned short labelrg;
#define min_labelrg 0
#define max_labelrg maxlabel
                              /*label range*/
typedef struct labelrec {
                 address val;
                  labelst st;
} labelrec;

                        /* line number of intermediate file */

static void init(char word[max_alfainx-min_alfainx+1], labelrec labeltab[max_labelrg-min_labelrg+1], integer* iline)
{
       integer i;
      for( i = 0; i <= maxins; i ++) arrcpy(instr[i - min_instyp], "          ");
      /*

           Notes: 

           1. Instructions marked with "*" are for internal use only.
              The "*" mark both shows in the listing, and also prevents
              their use in the intermediate file, since only alpha
              characters are allowed as opcode labels.

           2. "---" entries are no longer used, but left here to keep the
              original instruction numbers from P4. They could be safely
              assigned to other instructions if the space is needed.

         */
      arrcpy(instr[  0 - min_instyp], "lodi      "); insp[  0 - min_instyp] = true;  insq[  0 - min_instyp] = intsize;     
      arrcpy(instr[  1 - min_instyp], "ldoi      "); insp[  1 - min_instyp] = false; insq[  1 - min_instyp] = intsize;
      arrcpy(instr[  2 - min_instyp], "stri      "); insp[  2 - min_instyp] = true;  insq[  2 - min_instyp] = intsize;     
      arrcpy(instr[  3 - min_instyp], "sroi      "); insp[  3 - min_instyp] = false; insq[  3 - min_instyp] = intsize;
      arrcpy(instr[  4 - min_instyp], "lda       "); insp[  4 - min_instyp] = true;  insq[  4 - min_instyp] = intsize;     
      arrcpy(instr[  5 - min_instyp], "lao       "); insp[  5 - min_instyp] = false; insq[  5 - min_instyp] = intsize;
      arrcpy(instr[  6 - min_instyp], "stoi      "); insp[  6 - min_instyp] = false; insq[  6 - min_instyp] = 0;
      arrcpy(instr[  7 - min_instyp], "ldc       "); insp[  7 - min_instyp] = false; insq[  7 - min_instyp] = intsize;
      arrcpy(instr[  8 - min_instyp], "---       "); insp[  8 - min_instyp] = false; insq[  8 - min_instyp] = 0;
      arrcpy(instr[  9 - min_instyp], "indi      "); insp[  9 - min_instyp] = false; insq[  9 - min_instyp] = intsize;
      arrcpy(instr[ 10 - min_instyp], "inci      "); insp[ 10 - min_instyp] = false; insq[ 10 - min_instyp] = intsize;
      arrcpy(instr[ 11 - min_instyp], "mst       "); insp[ 11 - min_instyp] = true;  insq[ 11 - min_instyp] = 0;
      arrcpy(instr[ 12 - min_instyp], "cup       "); insp[ 12 - min_instyp] = true;  insq[ 12 - min_instyp] = intsize;
      arrcpy(instr[ 13 - min_instyp], "ents      "); insp[ 13 - min_instyp] = false; insq[ 13 - min_instyp] = intsize;
      arrcpy(instr[ 14 - min_instyp], "retp      "); insp[ 14 - min_instyp] = false; insq[ 14 - min_instyp] = 0;
      arrcpy(instr[ 15 - min_instyp], "csp       "); insp[ 15 - min_instyp] = false; insq[ 15 - min_instyp] = intsize;
      arrcpy(instr[ 16 - min_instyp], "ixa       "); insp[ 16 - min_instyp] = false; insq[ 16 - min_instyp] = intsize;
      arrcpy(instr[ 17 - min_instyp], "equa      "); insp[ 17 - min_instyp] = false; insq[ 17 - min_instyp] = 0;
      arrcpy(instr[ 18 - min_instyp], "neqa      "); insp[ 18 - min_instyp] = false; insq[ 18 - min_instyp] = 0;
      arrcpy(instr[ 19 - min_instyp], "geqa      "); insp[ 19 - min_instyp] = false; insq[ 19 - min_instyp] = 0;
      arrcpy(instr[ 20 - min_instyp], "grta      "); insp[ 20 - min_instyp] = false; insq[ 20 - min_instyp] = 0;
      arrcpy(instr[ 21 - min_instyp], "leqa      "); insp[ 21 - min_instyp] = false; insq[ 21 - min_instyp] = 0;
      arrcpy(instr[ 22 - min_instyp], "lesa      "); insp[ 22 - min_instyp] = false; insq[ 22 - min_instyp] = 0;
      arrcpy(instr[ 23 - min_instyp], "ujp       "); insp[ 23 - min_instyp] = false; insq[ 23 - min_instyp] = intsize;
      arrcpy(instr[ 24 - min_instyp], "fjp       "); insp[ 24 - min_instyp] = false; insq[ 24 - min_instyp] = intsize;
      arrcpy(instr[ 25 - min_instyp], "xjp       "); insp[ 25 - min_instyp] = false; insq[ 25 - min_instyp] = intsize;
      arrcpy(instr[ 26 - min_instyp], "chki      "); insp[ 26 - min_instyp] = false; insq[ 26 - min_instyp] = intsize;
      arrcpy(instr[ 27 - min_instyp], "eof       "); insp[ 27 - min_instyp] = false; insq[ 27 - min_instyp] = 0;
      arrcpy(instr[ 28 - min_instyp], "adi       "); insp[ 28 - min_instyp] = false; insq[ 28 - min_instyp] = 0;
      arrcpy(instr[ 29 - min_instyp], "adr       "); insp[ 29 - min_instyp] = false; insq[ 29 - min_instyp] = 0;
      arrcpy(instr[ 30 - min_instyp], "sbi       "); insp[ 30 - min_instyp] = false; insq[ 30 - min_instyp] = 0;
      arrcpy(instr[ 31 - min_instyp], "sbr       "); insp[ 31 - min_instyp] = false; insq[ 31 - min_instyp] = 0;
      arrcpy(instr[ 32 - min_instyp], "sgs       "); insp[ 32 - min_instyp] = false; insq[ 32 - min_instyp] = 0;
      arrcpy(instr[ 33 - min_instyp], "flt       "); insp[ 33 - min_instyp] = false; insq[ 33 - min_instyp] = 0;
      arrcpy(instr[ 34 - min_instyp], "flo       "); insp[ 34 - min_instyp] = false; insq[ 34 - min_instyp] = 0;
      arrcpy(instr[ 35 - min_instyp], "trc       "); insp[ 35 - min_instyp] = false; insq[ 35 - min_instyp] = 0;
      arrcpy(instr[ 36 - min_instyp], "ngi       "); insp[ 36 - min_instyp] = false; insq[ 36 - min_instyp] = 0;
      arrcpy(instr[ 37 - min_instyp], "ngr       "); insp[ 37 - min_instyp] = false; insq[ 37 - min_instyp] = 0;
      arrcpy(instr[ 38 - min_instyp], "sqi       "); insp[ 38 - min_instyp] = false; insq[ 38 - min_instyp] = 0;
      arrcpy(instr[ 39 - min_instyp], "sqr       "); insp[ 39 - min_instyp] = false; insq[ 39 - min_instyp] = 0;
      arrcpy(instr[ 40 - min_instyp], "abi       "); insp[ 40 - min_instyp] = false; insq[ 40 - min_instyp] = 0;
      arrcpy(instr[ 41 - min_instyp], "abr       "); insp[ 41 - min_instyp] = false; insq[ 41 - min_instyp] = 0;
      arrcpy(instr[ 42 - min_instyp], "not       "); insp[ 42 - min_instyp] = false; insq[ 42 - min_instyp] = 0;
      arrcpy(instr[ 43 - min_instyp], "and       "); insp[ 43 - min_instyp] = false; insq[ 43 - min_instyp] = 0;
      arrcpy(instr[ 44 - min_instyp], "ior       "); insp[ 44 - min_instyp] = false; insq[ 44 - min_instyp] = 0;
      arrcpy(instr[ 45 - min_instyp], "dif       "); insp[ 45 - min_instyp] = false; insq[ 45 - min_instyp] = 0;
      arrcpy(instr[ 46 - min_instyp], "int       "); insp[ 46 - min_instyp] = false; insq[ 46 - min_instyp] = 0;
      arrcpy(instr[ 47 - min_instyp], "uni       "); insp[ 47 - min_instyp] = false; insq[ 47 - min_instyp] = 0;
      arrcpy(instr[ 48 - min_instyp], "inn       "); insp[ 48 - min_instyp] = false; insq[ 48 - min_instyp] = 0;
      arrcpy(instr[ 49 - min_instyp], "mod       "); insp[ 49 - min_instyp] = false; insq[ 49 - min_instyp] = 0;
      arrcpy(instr[ 50 - min_instyp], "odd       "); insp[ 50 - min_instyp] = false; insq[ 50 - min_instyp] = 0;
      arrcpy(instr[ 51 - min_instyp], "mpi       "); insp[ 51 - min_instyp] = false; insq[ 51 - min_instyp] = 0;
      arrcpy(instr[ 52 - min_instyp], "mpr       "); insp[ 52 - min_instyp] = false; insq[ 52 - min_instyp] = 0;
      arrcpy(instr[ 53 - min_instyp], "dvi       "); insp[ 53 - min_instyp] = false; insq[ 53 - min_instyp] = 0;
      arrcpy(instr[ 54 - min_instyp], "dvr       "); insp[ 54 - min_instyp] = false; insq[ 54 - min_instyp] = 0;
      arrcpy(instr[ 55 - min_instyp], "mov       "); insp[ 55 - min_instyp] = false; insq[ 55 - min_instyp] = intsize;
      arrcpy(instr[ 56 - min_instyp], "lca       "); insp[ 56 - min_instyp] = false; insq[ 56 - min_instyp] = intsize;
      arrcpy(instr[ 57 - min_instyp], "deci      "); insp[ 57 - min_instyp] = false; insq[ 57 - min_instyp] = intsize;
      arrcpy(instr[ 58 - min_instyp], "stp       "); insp[ 58 - min_instyp] = false; insq[ 58 - min_instyp] = 0;
      arrcpy(instr[ 59 - min_instyp], "ordi      "); insp[ 59 - min_instyp] = false; insq[ 59 - min_instyp] = 0;
      arrcpy(instr[ 60 - min_instyp], "chr       "); insp[ 60 - min_instyp] = false; insq[ 60 - min_instyp] = 0;
      arrcpy(instr[ 61 - min_instyp], "ujc       "); insp[ 61 - min_instyp] = false; insq[ 61 - min_instyp] = intsize;
      arrcpy(instr[ 62 - min_instyp], "rnd       "); insp[ 62 - min_instyp] = false; insq[ 62 - min_instyp] = 0;
      arrcpy(instr[ 63 - min_instyp], "pck       "); insp[ 63 - min_instyp] = false; insq[ 63 - min_instyp] = intsize;
      arrcpy(instr[ 64 - min_instyp], "upk       "); insp[ 64 - min_instyp] = false; insq[ 64 - min_instyp] = intsize;
      arrcpy(instr[ 65 - min_instyp], "ldoa      "); insp[ 65 - min_instyp] = false; insq[ 65 - min_instyp] = intsize;
      arrcpy(instr[ 66 - min_instyp], "ldor      "); insp[ 66 - min_instyp] = false; insq[ 66 - min_instyp] = intsize;
      arrcpy(instr[ 67 - min_instyp], "ldos      "); insp[ 67 - min_instyp] = false; insq[ 67 - min_instyp] = intsize;
      arrcpy(instr[ 68 - min_instyp], "ldob      "); insp[ 68 - min_instyp] = false; insq[ 68 - min_instyp] = intsize;
      arrcpy(instr[ 69 - min_instyp], "ldoc      "); insp[ 69 - min_instyp] = false; insq[ 69 - min_instyp] = intsize;
      arrcpy(instr[ 70 - min_instyp], "stra      "); insp[ 70 - min_instyp] = true;  insq[ 70 - min_instyp] = intsize;
      arrcpy(instr[ 71 - min_instyp], "strr      "); insp[ 71 - min_instyp] = true;  insq[ 71 - min_instyp] = intsize;
      arrcpy(instr[ 72 - min_instyp], "strs      "); insp[ 72 - min_instyp] = true;  insq[ 72 - min_instyp] = intsize;
      arrcpy(instr[ 73 - min_instyp], "strb      "); insp[ 73 - min_instyp] = true;  insq[ 73 - min_instyp] = intsize;
      arrcpy(instr[ 74 - min_instyp], "strc      "); insp[ 74 - min_instyp] = true;  insq[ 74 - min_instyp] = intsize;
      arrcpy(instr[ 75 - min_instyp], "sroa      "); insp[ 75 - min_instyp] = false; insq[ 75 - min_instyp] = intsize;
      arrcpy(instr[ 76 - min_instyp], "sror      "); insp[ 76 - min_instyp] = false; insq[ 76 - min_instyp] = intsize;
      arrcpy(instr[ 77 - min_instyp], "sros      "); insp[ 77 - min_instyp] = false; insq[ 77 - min_instyp] = intsize;
      arrcpy(instr[ 78 - min_instyp], "srob      "); insp[ 78 - min_instyp] = false; insq[ 78 - min_instyp] = intsize;
      arrcpy(instr[ 79 - min_instyp], "sroc      "); insp[ 79 - min_instyp] = false; insq[ 79 - min_instyp] = intsize;
      arrcpy(instr[ 80 - min_instyp], "stoa      "); insp[ 80 - min_instyp] = false; insq[ 80 - min_instyp] = 0;
      arrcpy(instr[ 81 - min_instyp], "stor      "); insp[ 81 - min_instyp] = false; insq[ 81 - min_instyp] = 0;
      arrcpy(instr[ 82 - min_instyp], "stos      "); insp[ 82 - min_instyp] = false; insq[ 82 - min_instyp] = 0;
      arrcpy(instr[ 83 - min_instyp], "stob      "); insp[ 83 - min_instyp] = false; insq[ 83 - min_instyp] = 0;
      arrcpy(instr[ 84 - min_instyp], "stoc      "); insp[ 84 - min_instyp] = false; insq[ 84 - min_instyp] = 0;
      arrcpy(instr[ 85 - min_instyp], "inda      "); insp[ 85 - min_instyp] = false; insq[ 85 - min_instyp] = intsize;
      arrcpy(instr[ 86 - min_instyp], "indr      "); insp[ 86 - min_instyp] = false; insq[ 86 - min_instyp] = intsize;
      arrcpy(instr[ 87 - min_instyp], "inds      "); insp[ 87 - min_instyp] = false; insq[ 87 - min_instyp] = intsize;
      arrcpy(instr[ 88 - min_instyp], "indb      "); insp[ 88 - min_instyp] = false; insq[ 88 - min_instyp] = intsize;
      arrcpy(instr[ 89 - min_instyp], "indc      "); insp[ 89 - min_instyp] = false; insq[ 89 - min_instyp] = intsize;
      arrcpy(instr[ 90 - min_instyp], "inca      "); insp[ 90 - min_instyp] = false; insq[ 90 - min_instyp] = intsize;
      arrcpy(instr[ 91 - min_instyp], "incr      "); insp[ 91 - min_instyp] = false; insq[ 91 - min_instyp] = intsize;
      arrcpy(instr[ 92 - min_instyp], "incs      "); insp[ 92 - min_instyp] = false; insq[ 92 - min_instyp] = intsize;
      arrcpy(instr[ 93 - min_instyp], "incb      "); insp[ 93 - min_instyp] = false; insq[ 93 - min_instyp] = intsize;
      arrcpy(instr[ 94 - min_instyp], "incc      "); insp[ 94 - min_instyp] = false; insq[ 94 - min_instyp] = intsize;
      arrcpy(instr[ 95 - min_instyp], "chka      "); insp[ 95 - min_instyp] = false; insq[ 95 - min_instyp] = intsize;
      arrcpy(instr[ 96 - min_instyp], "chkr      "); insp[ 96 - min_instyp] = false; insq[ 96 - min_instyp] = intsize;
      arrcpy(instr[ 97 - min_instyp], "chks      "); insp[ 97 - min_instyp] = false; insq[ 97 - min_instyp] = intsize;
      arrcpy(instr[ 98 - min_instyp], "chkb      "); insp[ 98 - min_instyp] = false; insq[ 98 - min_instyp] = intsize;
      arrcpy(instr[ 99 - min_instyp], "chkc      "); insp[ 99 - min_instyp] = false; insq[ 99 - min_instyp] = intsize;
      arrcpy(instr[100 - min_instyp], "deca      "); insp[100 - min_instyp] = false; insq[100 - min_instyp] = intsize;
      arrcpy(instr[101 - min_instyp], "decr      "); insp[101 - min_instyp] = false; insq[101 - min_instyp] = intsize;
      arrcpy(instr[102 - min_instyp], "decs      "); insp[102 - min_instyp] = false; insq[102 - min_instyp] = intsize;
      arrcpy(instr[103 - min_instyp], "decb      "); insp[103 - min_instyp] = false; insq[103 - min_instyp] = intsize;
      arrcpy(instr[104 - min_instyp], "decc      "); insp[104 - min_instyp] = false; insq[104 - min_instyp] = intsize;
      arrcpy(instr[105 - min_instyp], "loda      "); insp[105 - min_instyp] = true;  insq[105 - min_instyp] = intsize;
      arrcpy(instr[106 - min_instyp], "lodr      "); insp[106 - min_instyp] = true;  insq[106 - min_instyp] = intsize;
      arrcpy(instr[107 - min_instyp], "lods      "); insp[107 - min_instyp] = true;  insq[107 - min_instyp] = intsize;
      arrcpy(instr[108 - min_instyp], "lodb      "); insp[108 - min_instyp] = true;  insq[108 - min_instyp] = intsize;
      arrcpy(instr[109 - min_instyp], "lodc      "); insp[109 - min_instyp] = true;  insq[109 - min_instyp] = intsize;
      arrcpy(instr[110 - min_instyp], "rgs       "); insp[110 - min_instyp] = false; insq[110 - min_instyp] = 0;
      arrcpy(instr[111 - min_instyp], "fbv       "); insp[111 - min_instyp] = false; insq[111 - min_instyp] = 0;
      arrcpy(instr[112 - min_instyp], "ipj       "); insp[112 - min_instyp] = true;  insq[112 - min_instyp] = intsize;
      arrcpy(instr[113 - min_instyp], "cip       "); insp[113 - min_instyp] = true;  insq[113 - min_instyp] = 0;
      arrcpy(instr[114 - min_instyp], "lpa       "); insp[114 - min_instyp] = true;  insq[114 - min_instyp] = intsize;
      arrcpy(instr[115 - min_instyp], "efb       "); insp[115 - min_instyp] = false; insq[115 - min_instyp] = 0;
      arrcpy(instr[116 - min_instyp], "fvb       "); insp[116 - min_instyp] = false; insq[116 - min_instyp] = 0;
      arrcpy(instr[117 - min_instyp], "dmp       "); insp[117 - min_instyp] = false; insq[117 - min_instyp] = intsize;
      arrcpy(instr[118 - min_instyp], "swp       "); insp[118 - min_instyp] = false; insq[118 - min_instyp] = intsize;
      arrcpy(instr[119 - min_instyp], "tjp       "); insp[119 - min_instyp] = false; insq[119 - min_instyp] = intsize;
      arrcpy(instr[120 - min_instyp], "lip       "); insp[120 - min_instyp] = true;  insq[120 - min_instyp] = intsize;
      arrcpy(instr[121 - min_instyp], "---       "); insp[121 - min_instyp] = false; insq[121 - min_instyp] = 0;
      arrcpy(instr[122 - min_instyp], "---       "); insp[122 - min_instyp] = false; insq[122 - min_instyp] = 0;
      arrcpy(instr[123 - min_instyp], "ldci      "); insp[123 - min_instyp] = false; insq[123 - min_instyp] = intsize;
      arrcpy(instr[124 - min_instyp], "ldcr      "); insp[124 - min_instyp] = false; insq[124 - min_instyp] = intsize;
      arrcpy(instr[125 - min_instyp], "ldcn      "); insp[125 - min_instyp] = false; insq[125 - min_instyp] = 0;
      arrcpy(instr[126 - min_instyp], "ldcb      "); insp[126 - min_instyp] = false; insq[126 - min_instyp] = boolsize;
      arrcpy(instr[127 - min_instyp], "ldcc      "); insp[127 - min_instyp] = false; insq[127 - min_instyp] = charsize;
      arrcpy(instr[128 - min_instyp], "reti      "); insp[128 - min_instyp] = false; insq[128 - min_instyp] = 0;
      arrcpy(instr[129 - min_instyp], "retr      "); insp[129 - min_instyp] = false; insq[129 - min_instyp] = 0;
      arrcpy(instr[130 - min_instyp], "retc      "); insp[130 - min_instyp] = false; insq[130 - min_instyp] = 0;
      arrcpy(instr[131 - min_instyp], "retb      "); insp[131 - min_instyp] = false; insq[131 - min_instyp] = 0;
      arrcpy(instr[132 - min_instyp], "reta      "); insp[132 - min_instyp] = false; insq[132 - min_instyp] = 0;
      arrcpy(instr[133 - min_instyp], "ordr      "); insp[133 - min_instyp] = false; insq[133 - min_instyp] = 0;
      arrcpy(instr[134 - min_instyp], "ordb      "); insp[134 - min_instyp] = false; insq[134 - min_instyp] = 0;
      arrcpy(instr[135 - min_instyp], "ords      "); insp[135 - min_instyp] = false; insq[135 - min_instyp] = 0;
      arrcpy(instr[136 - min_instyp], "ordc      "); insp[136 - min_instyp] = false; insq[136 - min_instyp] = 0;
      arrcpy(instr[137 - min_instyp], "equi      "); insp[137 - min_instyp] = false; insq[137 - min_instyp] = 0;
      arrcpy(instr[138 - min_instyp], "equr      "); insp[138 - min_instyp] = false; insq[138 - min_instyp] = 0;
      arrcpy(instr[139 - min_instyp], "equb      "); insp[139 - min_instyp] = false; insq[139 - min_instyp] = 0;
      arrcpy(instr[140 - min_instyp], "equs      "); insp[140 - min_instyp] = false; insq[140 - min_instyp] = 0;
      arrcpy(instr[141 - min_instyp], "equc      "); insp[141 - min_instyp] = false; insq[141 - min_instyp] = 0;
      arrcpy(instr[142 - min_instyp], "equm      "); insp[142 - min_instyp] = false; insq[142 - min_instyp] = intsize;
      arrcpy(instr[143 - min_instyp], "neqi      "); insp[143 - min_instyp] = false; insq[143 - min_instyp] = 0;
      arrcpy(instr[144 - min_instyp], "neqr      "); insp[144 - min_instyp] = false; insq[144 - min_instyp] = 0;
      arrcpy(instr[145 - min_instyp], "neqb      "); insp[145 - min_instyp] = false; insq[145 - min_instyp] = 0;
      arrcpy(instr[146 - min_instyp], "neqs      "); insp[146 - min_instyp] = false; insq[146 - min_instyp] = 0;
      arrcpy(instr[147 - min_instyp], "neqc      "); insp[147 - min_instyp] = false; insq[147 - min_instyp] = 0;
      arrcpy(instr[148 - min_instyp], "neqm      "); insp[148 - min_instyp] = false; insq[148 - min_instyp] = intsize;
      arrcpy(instr[149 - min_instyp], "geqi      "); insp[149 - min_instyp] = false; insq[149 - min_instyp] = 0;
      arrcpy(instr[150 - min_instyp], "geqr      "); insp[150 - min_instyp] = false; insq[150 - min_instyp] = 0;
      arrcpy(instr[151 - min_instyp], "geqb      "); insp[151 - min_instyp] = false; insq[151 - min_instyp] = 0;
      arrcpy(instr[152 - min_instyp], "geqs      "); insp[152 - min_instyp] = false; insq[152 - min_instyp] = 0;
      arrcpy(instr[153 - min_instyp], "geqc      "); insp[153 - min_instyp] = false; insq[153 - min_instyp] = 0;
      arrcpy(instr[154 - min_instyp], "geqm      "); insp[154 - min_instyp] = false; insq[154 - min_instyp] = intsize;
      arrcpy(instr[155 - min_instyp], "grti      "); insp[155 - min_instyp] = false; insq[155 - min_instyp] = 0;
      arrcpy(instr[156 - min_instyp], "grtr      "); insp[156 - min_instyp] = false; insq[156 - min_instyp] = 0;
      arrcpy(instr[157 - min_instyp], "grtb      "); insp[157 - min_instyp] = false; insq[157 - min_instyp] = 0;
      arrcpy(instr[158 - min_instyp], "grts      "); insp[158 - min_instyp] = false; insq[158 - min_instyp] = 0;
      arrcpy(instr[159 - min_instyp], "grtc      "); insp[159 - min_instyp] = false; insq[159 - min_instyp] = 0;
      arrcpy(instr[160 - min_instyp], "grtm      "); insp[160 - min_instyp] = false; insq[160 - min_instyp] = intsize;
      arrcpy(instr[161 - min_instyp], "leqi      "); insp[161 - min_instyp] = false; insq[161 - min_instyp] = 0;
      arrcpy(instr[162 - min_instyp], "leqr      "); insp[162 - min_instyp] = false; insq[162 - min_instyp] = 0;
      arrcpy(instr[163 - min_instyp], "leqb      "); insp[163 - min_instyp] = false; insq[163 - min_instyp] = 0;
      arrcpy(instr[164 - min_instyp], "leqs      "); insp[164 - min_instyp] = false; insq[164 - min_instyp] = 0;
      arrcpy(instr[165 - min_instyp], "leqc      "); insp[165 - min_instyp] = false; insq[165 - min_instyp] = 0;
      arrcpy(instr[166 - min_instyp], "leqm      "); insp[166 - min_instyp] = false; insq[166 - min_instyp] = intsize;
      arrcpy(instr[167 - min_instyp], "lesi      "); insp[167 - min_instyp] = false; insq[167 - min_instyp] = 0;
      arrcpy(instr[168 - min_instyp], "lesr      "); insp[168 - min_instyp] = false; insq[168 - min_instyp] = 0;
      arrcpy(instr[169 - min_instyp], "lesb      "); insp[169 - min_instyp] = false; insq[169 - min_instyp] = 0;
      arrcpy(instr[170 - min_instyp], "less      "); insp[170 - min_instyp] = false; insq[170 - min_instyp] = 0;
      arrcpy(instr[171 - min_instyp], "lesc      "); insp[171 - min_instyp] = false; insq[171 - min_instyp] = 0;
      arrcpy(instr[172 - min_instyp], "lesm      "); insp[172 - min_instyp] = false; insq[172 - min_instyp] = intsize;
      arrcpy(instr[173 - min_instyp], "ente      "); insp[173 - min_instyp] = false; insq[173 - min_instyp] = intsize;
      arrcpy(instr[174 - min_instyp], "mrkl*     "); insp[174 - min_instyp] = false; insq[174 - min_instyp] = intsize;

      /* sav (mark) and rst (release) were removed */
      arrcpy(sptable[ 0], "get       ");     arrcpy(sptable[ 1], "put       ");
      arrcpy(sptable[ 2], "---       ");     arrcpy(sptable[ 3], "rln       ");
      arrcpy(sptable[ 4], "new       ");     arrcpy(sptable[ 5], "wln       ");
      arrcpy(sptable[ 6], "wrs       ");     arrcpy(sptable[ 7], "eln       ");
      arrcpy(sptable[ 8], "wri       ");     arrcpy(sptable[ 9], "wrr       ");
      arrcpy(sptable[10], "wrc       ");     arrcpy(sptable[11], "rdi       ");
      arrcpy(sptable[12], "rdr       ");     arrcpy(sptable[13], "rdc       ");
      arrcpy(sptable[14], "sin       ");     arrcpy(sptable[15], "cos       ");
      arrcpy(sptable[16], "exp       ");     arrcpy(sptable[17], "log       ");
      arrcpy(sptable[18], "sqt       ");     arrcpy(sptable[19], "atn       ");
      arrcpy(sptable[20], "---       ");     arrcpy(sptable[21], "pag       ");
      arrcpy(sptable[22], "rsf       ");     arrcpy(sptable[23], "rwf       ");
      arrcpy(sptable[24], "wrb       ");     arrcpy(sptable[25], "wrf       ");
      arrcpy(sptable[26], "dsp       ");     arrcpy(sptable[27], "wbf       ");
      arrcpy(sptable[28], "wbi       ");     arrcpy(sptable[29], "wbr       ");
      arrcpy(sptable[30], "wbc       ");     arrcpy(sptable[31], "wbb       ");
      arrcpy(sptable[32], "rbf       ");     arrcpy(sptable[33], "rsb       ");
      arrcpy(sptable[34], "rwb       ");     arrcpy(sptable[35], "gbf       ");
      arrcpy(sptable[36], "pbf       ");

      pc = begincode;
      cp = maxstr;  /* set constants pointer to top of storage */
      for( i= 1; i <= 10; i ++) word[i - min_alfainx]= ' ';
      for( i= 0; i <= maxlabel; i ++)
          {
                                    labelrec* with = &labeltab[i - min_labelrg];   with->val=-1; with->st= entered; }
      /* initalize file state */
      for( i = 1; i <= maxfil; i ++) filstate[i-(1)] = fclosed;

      /* !!! remove this next statement for self compile */
      /*elide*reset(prd, 0, 0, 0);*noelide*/

      *iline = 1; /* set 1st line of intermediate */
}      /*init*/



static void errorl(beta const string, integer* iline) /*error in loading*/
{ cwrite("\n");
   cwrite("*** Program load error: [%1i] %s\n", *iline, 1, 25, string);
   wait_for_key();
   exit(EXIT_SUCCESS);//goto L1;
}       /*errorl*/



static void dmplabs(labelrec labeltab[max_labelrg-min_labelrg+1]) /* dump label table */

{
    labelrg i;



   cwrite("\n");
   cwrite("Label table\n");
   cwrite("\n");
   for( i = 1; i <= maxlabel; i ++) if (labeltab[i - min_labelrg].val != -1)  {

      cwrite("Label: %5i value: %i ", i, labeltab[i - min_labelrg].val);
      if (labeltab[i - min_labelrg].st == entered)  cwrite("Entered\n");
      else cwrite("Defined\n");

   }
   cwrite("\n");

}



static void update(labelrg x, labelrec labeltab[max_labelrg-min_labelrg+1], integer* iline, address* labelvalue) /*when a label definition lx is found*/
{
       address curr,succ_,ad; /*resp. current element and successor element
                               of a list of future references*/
       boolean endlist;
       instyp op; address q;     /*instruction register*/

   if (labeltab[x - min_labelrg].st==defined)  errorl("duplicated label         ", iline);
   else {
          if (labeltab[x - min_labelrg].val!=-1)  /*forward reference(s)*/
          { curr= labeltab[x - min_labelrg].val; endlist= false;
             while (! endlist)  {
                   ad = curr;
                   op = store_[ad]; /* get instruction */
                   q = getadr(ad+1+ord(insp[op - min_instyp]));
                   succ_= q; /* get target address from that */
                   q= *labelvalue; /* place new target address */
                   ad = curr;
                   putadr(ad+1+ord(insp[op - min_instyp]), q);
                   if (succ_==-1)  endlist= true;
                              else curr= succ_;
              }
          }
          labeltab[x - min_labelrg].st = defined;
          labeltab[x - min_labelrg].val= *labelvalue;
   }
}      /*update*/



static void getnxt(char* ch) /* get next character */
{
   *ch = ' ';
   if (! eoln(prd))  tread(&prd, "%c",ch);
}



static void skpspc(char* ch) /* skip spaces */
{
  while ((*ch == ' ') && ! eoln(prd))  getnxt(ch);
}



static void getlin(integer* iline) /* get next line */
{
  tread(&prd, "\n");
  *iline = *iline+1; /* next intermediate line */
}


static void assemble(integer* iline, char word[max_alfainx-min_alfainx+1], char* ch, labelrec labeltab[max_labelrg-min_labelrg+1]);

static void generate(integer* iline, char* ch, address* labelvalue, labelrec labeltab[max_labelrg-min_labelrg+1], char word[max_alfainx-min_alfainx+1])/*generate segment of code*/
{
       integer x;  /* label number */
       boolean again;

   again = true;
   while (again) 
         { if (eof(prd))  errorl("unexpected eof on input  ", iline);
               getnxt(ch);/* first character of line*/
               if (! (inset(*ch, setof('i', 'l', 'q', ' ', '!', ':', eos))))  
                 errorl("unexpected line start    ", iline);
               switch (*ch) {
                    case 'i': getlin(iline); break;
                    case 'l': { tread(&prd, "%i",&x);
                               getnxt(ch);
                               if (*ch=='=')  tread(&prd, "%i",labelvalue);
                                         else *labelvalue= pc;
                               update(x, labeltab, iline, labelvalue); getlin(iline);
                         }
                         break;
                    case 'q': { again = false; getlin(iline); } break;
                    case ' ': { getnxt(ch); assemble(iline, word, ch, labeltab); } break;
                    case ':': { /* source line */

                            tread(&prd, "%i",&x); /* get source line number */
                            if (dosrclin)  { 

                               /* pass source line register instruction */ 
                               store_[pc] = 174; pc = pc+1;
                               putint(pc, x); pc = pc+intsize;

                            }
                            /* skip the rest of the line, which would be the
                                 contents of the source line if included */
                            while (! eoln(prd)) 
                               tread(&prd, "%c", &c); /* get next character */
                            getlin(iline); /* source line */

                         }
                         break;
               }
         }
}       /*generate*/

static void assemble(integer* iline, char word[max_alfainx-min_alfainx+1], char* ch, labelrec labeltab[max_labelrg-min_labelrg+1]);
                                                     /* buffer for string constants */

static void lookup(labelrg x, labelrec labeltab[max_labelrg-min_labelrg+1]) /* search in label table*/
{ switch (labeltab[x - min_labelrg].st) {
          case entered: { q = labeltab[x - min_labelrg].val;
                     labeltab[x - min_labelrg].val = pc;
                   }
                   break;
          case defined: q= labeltab[x - min_labelrg].val;
          break;
      }  /*case label..*/
}         /*lookup*/



static void labelsearch(char* ch, labelrec labeltab[max_labelrg-min_labelrg+1])
{
       labelrg x;
      while ((*ch!='l') && ! eoln(prd))  tread(&prd, "%c",ch);
      tread(&prd, "%W",&x); lookup(x, labeltab);
}         /*labelsearch*/



static void getname(integer* iline, char word[max_alfainx-min_alfainx+1], char* ch, char name[max_alfainx-min_alfainx+1])
{
    alfainx i;

  if (eof(prd))  errorl("unexpected eof on input  ", iline);
  for( i = 1; i <= maxalfa; i ++) word[i - min_alfainx] = ' ';
  i = 1;  /* set 1st character of word */
  while (inset(*ch, setof(range('a','z'), eos)))  {
    if (i == maxalfa)  errorl("Opcode label is too long ", iline);
    word[i - min_alfainx] = *ch;
    i = i+1; *ch = ' ';
    if (! eoln(prd))  tread(&prd, "%c",ch); /* next character */
  }
  pack(min_alfainx, max_alfainx, word,1,name); 
}          /*getname*/



static void storeop(integer* iline)
{
  if (pc+1 > cp)  errorl("Program code overflow    ", iline);
  store_[pc] = op; pc = pc+1;
}



static void storep(integer* iline)
{
  if (pc+1 > cp)  errorl("Program code overflow    ", iline);
  store_[pc] = p; pc = pc+1;
}



static void storeq(integer* iline)
{
  if (pc+adrsize > cp)  errorl("Program code overflow    ", iline);
   putadr(pc, q); pc = pc+adrsize;
}



static void storeq1(integer* iline)
{
  if (pc+adrsize > cp)  errorl("Program code overflow    ", iline);
   putadr(pc, q1); pc = pc+adrsize;
}



static void assemble(integer* iline, char word[max_alfainx-min_alfainx+1], char* ch, labelrec labeltab[max_labelrg-min_labelrg+1]) /*translate symbolic code into machine code and store*/
{
       alfa name; real r; settype s;
       integer i,x,s1,lb,ub,l; char c;
       char str[stringlgth];

       p = 0;  q = 0;  op = 0;
   getname(iline, word, ch, name);
   /* note this search removes the top instruction from use */
   while ((arrcmp(instr[op - min_instyp], name) != 0) && (op < maxins))  op = op+1;
   if (op == maxins)  errorl("illegal instruction      ", iline);

   switch (op) {  /* get parameters p,q */

       /*lod,str,lda,lip*/
       case 0: case 105: case 106: case 107: case 108: case 109:
       case 2: case 70: case 71: case 72: case 73: case 74:case 4:case 120: { tread(&prd, "%B%i",&p,&q); storeop(iline); storep(iline); 
                                          storeq(iline);
                                    }
                                    break;

       case 12/*cup*/: { tread(&prd, "%B",&p); labelsearch(ch, labeltab); storeop(iline); storep(iline); storeq(iline);
                  }
                  break;

       case 11:case 113/*mst,cip*/: { tread(&prd, "%B",&p); storeop(iline); storep(iline); } break;

       /* equm,neqm,geqm,grtm,leqm,lesm take a parameter */
       case 142: case 148: case 154: case 160: case 166: case 172:

       /*lao,ixa,mov,fvb,dmp,swp*/
       case 5:case 16:case 55:case 116:case 117:case 118:

       /*ldo,sro,ind,inc,dec*/
       case 1: case 65: case 66: case 67: case 68: case 69:
       case 3: case 75: case 76: case 77: case 78: case 79:
       case 9: case 85: case 86: case 87: case 88: case 89:
       case 10: case 90: case 91: case 92: case 93: case 94:
       case 57: case 100: case 101: case 102: case 103: case 104: { tread(&prd, "%i",&q); storeop(iline); storeq(iline); }
       break;

       /*pck,upk*/
       case 63: case 64: { tread(&prd, "%i",&q); tread(&prd, "%i",&q1); storeop(iline); storeq(iline); storeq1(iline); } break;

       /*ujp,fjp,xjp,lpa,tjp*/
       case 23:case 24:case 25:case 119:

       /*ents,ente*/
       case 13: case 173: { labelsearch(ch, labeltab); storeop(iline); storeq(iline); }
       break;

       /*ipj,lpa*/
       case 112:case 114: { tread(&prd, "%B",&p); labelsearch(ch, labeltab); storeop(iline); storep(iline); storeq(iline); } break;

       case 15 /*csp*/: { skpspc(ch); getname(iline, word, ch, name);
                        while (arrcmp(name, sptable[q]) != 0)  
                        { q = q+1; if (q > maxsp)  
                              errorl("std proc/func not found  ", iline);
                        }
                        storeop(iline); storeq(iline);
                   }
                   break;

       case 7: case 123: case 124: case 125: case 126: case 127 /*ldc*/: { switch (op) {  /*get q*/
                        case 123: { tread(&prd, "%i",&i); storeop(iline); 
                                   if (pc+intsize > cp)  
                                      errorl("Program code overflow    ", iline);
                                   putint(pc, i); pc = pc+intsize;
                             }
                             break;

                        case 124: { tread(&prd, "%f",&r); 
                                   cp = cp-realsize;
                                   alignd(realal, &cp);
                                   if (cp <= 0)  
                                      errorl("constant table overflow  ", iline);
                                   putrel(cp, r); q = cp;
                                   storeop(iline); storeq(iline);
                             }
                             break;

                        case 125: storeop(iline); break; /*p,q = 0*/

                        case 126: { tread(&prd, "%i",&q); storeop(iline); 
                                   if (pc+1 > cp)  
                                     errorl("Program code overflow    ", iline);
                                   putbol(pc, q != 0); pc = pc+1; }
                                   break;

                        case 127: {
                               skpspc(ch);
                               if (*ch != '\'') 
                                 errorl("illegal character        ", iline);
                               getnxt(ch);  c = *ch;
                               getnxt(ch);
                               if (*ch != '\'') 
                                 errorl("illegal character        ", iline);
                               storeop(iline); 
                               if (pc+1 > cp)  
                                 errorl("Program code overflow    ", iline);
                               putchr(pc, c); pc = pc+1;
                             }
                             break;
                        case 7: { skpspc(ch); 
                                if (*ch != '(')  errorl("ldc() expected           ", iline);
                                s = setof( eos);  getnxt(ch);
                                while (*ch!=')') 
                                { tread(&prd, "%i",&s1); getnxt(ch); s = join(s, setof(s1, eos));
                                }
                                cp = cp-setsize;
                                alignd(setal, &cp);
                                if (cp <= 0) 
                                   errorl("constant table overflow  ", iline);
                                putset(cp, s);
                                q = cp;
                                storeop(iline); storeq(iline);
                             }
                             break;
                        }   /*case*/
                  }
                  break;

        case 26: case 95: case 96: case 97: case 98: case 99 /*chk*/: {
                      tread(&prd, "%i%i",&lb,&ub);
                      if (op == 95)  q = lb;
                      else
                      {
                        cp = cp-intsize; 
                        alignd(intal, &cp);
                        if (cp <= 0)  errorl("constant table overflow  ", iline);
                        putint(cp, ub);
                        cp = cp-intsize; 
                        alignd(intal, &cp);
                        if (cp <= 0)  errorl("constant table overflow  ", iline);
                        putint(cp, lb); q = cp;
                      }
                      storeop(iline); storeq(iline);
                    }
                    break;

        case 56 /*lca*/: { tread(&prd, "%i",&l); skpspc(ch);
                      for( i = 1; i <= stringlgth; i ++) str[i-(1)] = ' ';
                      if (*ch != '\'')  errorl("bad string format        ", iline);
                      i = 0;
                      do {
                        if (eoln(prd))  errorl("unterminated string      ", iline);
                        getnxt(ch);
                        c = *ch; if ((*ch == '\'') && (*currec(prd) == '\''))  {
                          getnxt(ch); c = ' ';
                        }
                        if (c != '\'')  {
                          if (i >= stringlgth)  errorl("string overflow          ", iline);
                          str[i] = *ch;   /* accumulate string */
                          i = i+1;
                        }
                      } while (!(c == '\''));
                      /* place in storage */
                      cp = cp-l;
                      if (cp <= 0)  errorl("constant table overflow  ", iline);
                      q = cp;
                      for( x = 1; x <= l; x ++) putchr(q+x-1, str[x-(1)]);
                      /* this should have worked, the for loop is faulty 
                           because the calculation for end is done after the i
                           set
                         for i := 0 to i-1 do putchr(q+i, str[i+1]);
                         */
                      storeop(iline); storeq(iline);
                    }
                    break;

       case 14: case 128: case 129: case 130: case 131: case 132: /*ret*/

       /* equ,neq,geq,grt,leq,les with no parameter */
       case 17: case 137: case 138: case 139: case 140: case 141:
       case 18: case 143: case 144: case 145: case 146: case 147:
       case 19: case 149: case 150: case 151: case 152: case 153:
       case 20: case 155: case 156: case 157: case 158: case 159:
       case 21: case 161: case 162: case 163: case 164: case 165:
       case 22: case 167: case 168: case 169: case 170: case 171:

       case 59: case 133: case 134: case 135: case 136: /*ord*/

       case 6: case 80: case 81: case 82: case 83: case 84: /*sto*/

       /* eof,adi,adr,sbi,sbr,sgs,flt,flo,trc,ngi,ngr,sqi,sqr,abi,abr,not,and,
            ior,dif,int,uni,inn,mod,odd,mpi,mpr,dvi,dvr,stp,chr,rnd,rgs,fbv */
       case 27:case 28:case 29:case 30:case 31:case 32:case 33:case 34:case 35:case 36:case 37:case 38:case 39:case 40:case 41:case 42:case 43:case 44:case 45:case 46:case 47:
       case 48:case 49:case 50:case 51:case 52:case 53:case 54:case 58:case 60:case 62:case 110:case 111:
       case 115: storeop(iline);
       break;

                   /*ujc must have same length as ujp, so we output a dummy
                        q argument*/
       case 61 /*ujc*/: { storeop(iline); q = 0; storeq(iline); } break;

   }    /*case*/

   getlin(iline); /* next intermediate line */

}       /*assemble*/

void load()
{
        static char word[max_alfainx-min_alfainx+1]; char ch;
        static labelrec labeltab[max_labelrg-min_labelrg+1];
        address labelvalue;
        integer iline;

   void assemble(integer* iline, char word[max_alfainx-min_alfainx+1], char* ch, labelrec labeltab[max_labelrg-min_labelrg+1]);

      /*load*/

   init(word, labeltab, &iline);
   generate(&iline, &ch, &labelvalue, labeltab, word);
   pctop = pc;  /* save top of code store */
   pc = 0;
   generate(&iline, &ch, &labelvalue, labeltab, word);
   alignu(stackal, &pctop); /* align the end of code for stack bottom */
   alignd(heapal, &cp); /* align the start of cp for heap top */

   if (dodmpsto)  {       /* dump storage overview */

      cwrite("\n");
      cwrite("Storage areas occupied\n");
      cwrite("\n");
      cwrite("Program     "); wrthex(0, maxdigh); cwrite("-"); wrthex(pctop-1, maxdigh);
      cwrite(" (%*i)\n", pctop,maxdigd);
      cwrite("Stack/Heap  "); wrthex(pctop, maxdigh); cwrite("-"); wrthex(cp-1, maxdigh); 
      cwrite(" (%*i)\n", cp-pctop+1,maxdigd);
      cwrite("Constants   "); wrthex(cp, maxdigh); cwrite("-"); wrthex(maxstr, maxdigh); 
      cwrite(" (%*i)\n", maxstr-(cp),maxdigd);
      cwrite("\n");

   }
   if (dodmpins)  dmpins(); /* Debug: dump instructions from store */
   if (dodmplab)  dmplabs(labeltab); /* Debug: dump label definitions */

}    /*load*/

/*------------------------------------------------------------------------*/

void pmd();


static void pt(integer* i, integer* s)
{ if (*i == 0)  { wrthex(*s, maxdigh); cwrite(": "); }
   wrthex(store_[*s], 2); cwrite(" ");
   *s = *s - 1;
   *i = *i + 1;
   if (*i == 16) 
      { twrite(&output, "\n"); *i = 0; }
}       /*pt*/

void pmd()
{
       integer s; integer i;


   if (dopmd)  {
      cwrite("\n");
      cwrite("pc = "); wrthex(pc-1, maxdigh);
      cwrite(" op = %3i", op);
      cwrite(" sp = "); wrthex(sp, maxdigh);
      cwrite(" mp = "); wrthex(mp, maxdigh);
      cwrite(" np = "); wrthex(np, maxdigh);
      cwrite(" cp = "); wrthex(cp, maxdigh);
      cwrite("\n"); 
      cwrite("------------------------------------------------------------");
      cwrite("-------------\n");

      cwrite("\n");
      cwrite("Stack\n");
      cwrite("\n");
      s = sp; i = 0;
      while (s>=pctop)  pt(&i, &s);
      cwrite("\n");
      cwrite("\n");
      cwrite("Constants\n");
      cwrite("\n");
      s = maxstr; i = 0;
      while (s>=cp)  pt(&i, &s);
      cwrite("\n");
      cwrite("\n");
      cwrite("Heap\n");
      cwrite("\n");
      s = cp-1; i = 0;
      while (s>=np)  pt(&i, &s);
      cwrite("\n");
   }
}    /*pmd*/

void errori(beta const string)
{ cwrite("\n"); cwrite("*** Runtime error");
      if (srclin > 0)  cwrite(" [%1i]", srclin);
      cwrite(": %s\n", 1, 25, string);
      wait_for_key();
      pmd(); exit(EXIT_SUCCESS); //goto L1;
}   /*errori*/

address base(integer ld)
{
       address ad;
      address base_result;
      ad = mp;
   while (ld>0)  { ad = getadr(ad+marksl); ld = ld-1; }
   base_result = ad;
      return base_result;
}    /*base*/

void compare()
/*comparing is only correct if result by comparing integers will be*/
{
  popadr(&a2);
  popadr(&a1);
  i = 0; b = true;
  while (b && (i!=q)) 
    if (store_[a1+i] == store_[a2+i])  i = i+1;
    else b = false;
}    /*compare*/

void valfil(address fa)        /* attach file to file entry */
{
    integer i,ff;

   if (store_[fa] == 0)  {     /* no file */
     if (fa == pctop+inputoff)  ff = inputfn;
     else if (fa == pctop+outputoff)  ff = outputfn;
     else if (fa == pctop+prdoff)  ff = prdfn;
     else if (fa == pctop+prroff)  ff = prrfn;
     else {
       i = 5;  /* start search after the header files */
       ff = 0; 
       while (i <= maxfil)  { 
         if (filstate[i-(1)] == fclosed)  { ff = i; i = maxfil; }
         i = i+1; 
       }
       if (ff == 0)  errori("To many files            ");
     }
     store_[fa] = ff;
   }
}

void valfilwm(address fa)        /* validate file write mode */
{
   valfil(fa); /* validate file address */
   if (filstate[store_[fa]-(1)] != fwrite1)  errori("File not in write mode   ");
}

void valfilrm(address fa)        /* validate file read mode */
{
   valfil(fa); /* validate file address */
   if (filstate[store_[fa]-(1)] != fread1)  errori("File not in read mode    ");
}

void getop()     /* get opcode */

{

   op = store_[pc]; pc = pc+1;

}

void getp()     /* get p parameter */

{

   p = store_[pc]; pc = pc+1;

}

void getq()     /* get q parameter */

{

   q = getadr(pc); pc = pc+adrsize;

}

void getq1()     /* get q1 parameter */

{

   q1 = getadr(pc); pc = pc+adrsize;

}

/*

   Blocks in the heap are dead simple. The block begins with a length, including
   the length itself. If the length is positive, the block is free. If negative,
   the block is allocated. This means that AddressOfBLock+abs(lengthOfBlock) is
   address of the next block, and RequestedSize <= LengthOfBLock+adrsize is a
   reasonable test for if a free block fits the requested size, since it will
   never be true of occupied blocks.

*/

/* report all space in heap */

void repspc()
{
    address l, ad;

   cwrite("\n");
   cwrite("Heap space breakdown\n");
   cwrite("\n");
   ad = np;  /* index the bottom of heap */
   while (ad < cp)  {
      l = getadr(ad);  /* get next block length */
      cwrite("addr: "); wrthex(ad, maxdigh); cwrite(": %6f: ", abs(l)); 
      if (l >= 0)  cwrite("free\n"); else cwrite("alloc\n");
      ad = ad+abs(l);
   }
}

/* find free block using length */

void fndfre(address len, address* blk)
{
    address l, b;

  b = 0;  /* set no block found */
  *blk = np; /* set to bottom of heap active */
  while (*blk < cp)  {    /* search blocks in heap */
     l = getadr(*blk); /* get length */
     if (l >= len+adrsize)  { b = *blk; *blk = cp; }        /* found */
     else *blk = *blk+abs(l); /* go next block */
  }
  if (b > 0)  {       /* block was found */
     putadr(b, -(len+adrsize)); /* allocate block */
     *blk = b+adrsize; /* set base address */
     if (l > len+adrsize+adrsize+resspc)  { 
        /* If there is enough room for the block, header, and another header,
          then a reserve factor if desired. */
        b = b+len+adrsize;  /* go to top of allocated block */
        putadr(b, l-(len+adrsize)); /* set length of stub space */
     }
  } else *blk = 0;  /* set no block found */
}

/* coalesce space in heap */

void cscspc()
{
    boolean done;
    address ad, ad1, l, l1;

   /* first, colapse all free blocks at the heap bottom */
   done = false;
   while (! done && (np < cp))  { 
      l = getadr(np);  /* get header length */
      if (l >= 0)  np = np+getadr(np);   /* free, skip block */
      else done = true; /* end */
   }
   /* now, walk up and collapse adjacent free blocks */
   ad = np;  /* index bottom */
   while (ad < cp)  {
      l = getadr(ad);  /* get header length */
      if (l >= 0)  {       /* free */
         ad1 = ad+l;  /* index next block */
         if (ad1 < cp)  {       /* not against end */
            l1 = getadr(ad1);  /* get length next */
            if (l1 >=0)  
               putadr(ad, l+l1); /* both blocks are free, combine the blocks */
            else ad = ad+l+abs(l1); /* skip both blocks */
         } else ad = ad+l+abs(l1);   /* skip both blocks */
      } else ad = ad+abs(l);   /* skip this block */
   }
}

/* allocate space in heap */

void newspc(address len, address* blk)
{
    address ad,ad1;

  fndfre(len, blk); /* try finding an existing free block */
  if (*blk == 0)  {     /* allocate from heap bottom */
     ad = np-(len+adrsize);  /* find new heap bottom */
     ad1 = ad;  /* save address */
     alignd(heapal, &ad); /* align to arena */
     len = len+(ad1-ad);  /* adjust length upwards for alignment */
     if (ad <= ep)  errori("store overflow           ");
     np= ad;
     putadr(ad, -(len+adrsize)); /* allocate block */
     *blk = ad+adrsize; /* index start of block */
  }
} 

/* dispose of space in heap */

void dspspc(address len, address blk)
{
    address ad;

   len = len;  /* shut up compiler check */
   if (blk == 0)  errori("dispose uninit pointer   ");
   else if (blk == nilval)  errori("Dispose nil pointer      ");
   else if ((blk < np) || (blk >= cp))  errori("bad pointer value        ");
   ad = blk-adrsize;  /* index header */
   if (getadr(ad) >= 0)  errori("block already freed      ");
   if (dorecycl && ! dochkrpt)  {          /* obey recycling requests */
      putadr(ad, abs(getadr(ad))); /* set block free */
      cscspc(); /* coalesce free space */
   }
}

/* check pointer indexes free entry */

boolean isfree(address blk)
{
   boolean isfree_result;
   isfree_result = getadr(blk-adrsize) >= 0;
   return isfree_result;
}

/* system routine call*/

void callsp();


static void readi(text* f, integer* i)
{ if (eof(*f))  errori("End of file              ");
      tread(f, "%i",i);
}      /*readi*/



static void readr(text* f, real* r)
{ if (eof(*f))  errori("End of file              ");
      tread(f, "%f",r);
}      /*readr*/



static void readc(text* f, char* c)
{ if (eof(*f))  errori("End of file              ");
      tread(f, "%c",c);
}      /*readc*/



static void writestr(text* f, address ad, integer w, integer l)
{
       integer i;
      /* l and w are numbers of characters */
      if (w>l)  for( i=1; i <= w-l; i ++) twrite(f, " ");
             else l = w;
      for( i = 0; i <= l-1; i ++) twrite(f, "%c", getchr(ad+i));
}      /*writestr*/



static void getfile(text* f)
{ if (eof(*f))  errori("End of file              ");
      get(*f);
}      /*getfile*/



static void putfile(text* f, address* ad)
{
   char c = getchr(*ad+fileidsize);
   store((*f), c); put(*f);
}      /*putfile*/

void callsp()
{
       boolean line;
       integer i, j, w, l, f;
       char c;
       boolean b;
       address ad,ad1;
       real r;
       my_fileno fn;

      /*callsp*/
      if (q > maxsp)  errori("invalid std proc/func    ");

      /* trace routine executions */
      if (dotrcrot)  cwrite("%6i/%6i-> %2i\n", pc, sp, q);

      switch (q) {
           case 0 /*get*/: { popadr(&ad); valfil(ad); fn = store_[ad];
                           if (fn <= prrfn)  switch (fn) {
                              case inputfn: getfile(&input); break;
                              case outputfn: errori("get on output file       "); break;
                              case prdfn: getfile(&prd); break;
                              case prrfn: errori("get on prr file          ");
                              break;
                           } else {
                                if (filstate[fn-(1)] != fread1) 
                                   errori("File not in read mode    ");
                                getfile(&filtable[fn-(1)]);
                           }
                      }
                      break;
           case 1 /*put*/: { popadr(&ad); valfil(ad); fn = store_[ad];
                           if (fn <= prrfn)  switch (fn) {
                              case inputfn: errori("put on read file         "); break;
                              case outputfn: putfile(&output, &ad); break;
                              case prdfn: errori("put on prd file          "); break;
                              case prrfn: putfile(&prr, &ad);
                              break;
                           } else {
                                if (filstate[fn-(1)] != fwrite1) 
                                   errori("File not in write mode   ");
                                putfile(&filtable[fn-(1)], &ad);
                           }
                      }
                      break;
           /* unused placeholder for "release" */
           case 2 /*rst*/: errori("invalid std proc/func    "); break;
           case 3 /*rln*/: { popadr(&ad); pshadr(ad); valfil(ad); fn = store_[ad];
                           if (fn <= prrfn)  switch (fn) {
                              case inputfn: {
                                 if (eof(input))  errori("End of file              ");
                                 tread(&input, "\n");
                              }
                              break;
                              case outputfn: errori("readln on output file    "); break;
                              case prdfn: {
                                 if (eof(prd))  errori("End of file              ");
                                 tread(&prd, "\n");
                              }
                              break;
                              case prrfn: errori("readln on prr file       ");
                              break;
                           } else {
                                if (filstate[fn-(1)] != fread1) 
                                   errori("File not in read mode    ");
                                if (eof(filtable[fn-(1)]))  errori("End of file              ");
                                tread(&filtable[fn-(1)], "\n");
                           }
                      }
                      break;
           case 4 /*new*/: { popadr(&ad1); newspc(ad1, &ad);
                      /*top of stack gives the length in units of storage */
                            popadr(&ad1); putadr(ad1, ad);
                      }
                      break;
           case 5 /*wln*/: { popadr(&ad); pshadr(ad); valfil(ad); fn = store_[ad];
                           if (fn <= prrfn)  switch (fn) {
                              case inputfn: errori("writeln on input file    "); break;
                              case outputfn: twrite(&output, "\n"); break;
                              case prdfn: errori("writeln on prd file      "); break;
                              case prrfn: twrite(&prr, "\n");
                              break;
                           } else {
                                if (filstate[fn-(1)] != fwrite1) 
                                   errori("File not in write mode   ");
                                twrite(&filtable[fn-(1)], "\n");
                           }
                      }
                      break;
           case 6 /*wrs*/: { popint(&l); popint(&w); popadr(&ad1); 
                           popadr(&ad); pshadr(ad); valfil(ad); fn = store_[ad];
                           if (fn <= prrfn)  switch (fn) {
                              case inputfn: errori("write on input file      "); break;
                              case outputfn: writestr(&output, ad1, w, l); break;
                              case prdfn: errori("write on prd file        "); break;
                              case prrfn: writestr(&prr, ad1, w, l);
                              break;
                           } else {
                                if (filstate[fn-(1)] != fwrite1) 
                                   errori("File not in write mode   ");
                                writestr(&filtable[fn-(1)], ad1, w, l);
                           }
                      }
                      break;
           case 7 /*eln*/: { popadr(&ad); valfil(ad); fn = store_[ad];
                           if (fn <= prrfn)  switch (fn) {
                                 case inputfn: line= eoln(input); break;
                                 case outputfn: errori("eoln output file         "); break;
                                 case prdfn: line=eoln(prd); break;
                                 case prrfn: errori("eoln on prr file         ");
                                 break;
                              }
                           else {
                                if (filstate[fn-(1)] != fread1)  
                                   errori("File not in read mode    ");
                                line=eoln(filtable[fn-(1)]);
                           }
                           pshint(ord(line));
                      }
                      break;
           case 8 /*wri*/: { popint(&w); popint(&i); popadr(&ad); pshadr(ad); 
                            valfil(ad); fn = store_[ad];
                           if (fn <= prrfn)  switch (fn) {
                                 case inputfn: errori("write on input file      "); break;
                                 case outputfn: twrite(&output, "%*i", i,w); break;
                                 case prdfn: errori("write on prd file        "); break;
                                 case prrfn: twrite(&prr, "%*i", i,w);
                                 break;
                              }
                           else {
                                if (filstate[fn-(1)] != fwrite1) 
                                   errori("File not in write mode   ");
                                twrite(&filtable[fn-(1)], "%*i", i,w);
                           }
                      }
                      break;
           case 9 /*wrr*/: { popint(&w); poprel(&r); popadr(&ad); pshadr(ad); 
                            valfil(ad); fn = store_[ad];
                           if (fn <= prrfn)  switch (fn) {
                                 case inputfn: errori("write on input file      "); break;
                                 case outputfn: twrite(&output, "%*f", r, w); break;
                                 case prdfn: errori("write on prd file        "); break;
                                 case prrfn: twrite(&prr, "%*f", r,w);
                                 break;
                              }
                           else {
                                if (filstate[fn-(1)] != fwrite1) 
                                   errori("File not in write mode   ");
                                twrite(&filtable[fn-(1)], "%*f", r,w);
                           }
                      }
                      break;
           case 10/*wrc*/: { popint(&w); popint(&i); c = chr(i); popadr(&ad); 
                            pshadr(ad); valfil(ad); fn = store_[ad];
                           if (fn <= prrfn)  switch (fn) {
                                 case inputfn: errori("write on input file      "); break;
                                 case outputfn: twrite(&output, "%*c", c,w); break;
                                 case prdfn: errori("write on prd file        "); break;
                                 case prrfn: twrite(&prr, "%*c", c,w);
                                 break;
                              }
                           else {
                                if (filstate[fn-(1)] != fwrite1) 
                                   errori("File not in write mode   ");
                                twrite(&filtable[fn-(1)], "%*c", c,w);
                           }
                      }
                      break;
           case 11/*rdi*/: { popadr(&ad1); popadr(&ad); pshadr(ad); valfil(ad); 
                            fn = store_[ad];
                           if (fn <= prrfn)  switch (fn) {
                                 case inputfn: { readi(&input, &i); putint(ad1, i); } break;
                                 case outputfn: errori("read on output file      "); break;
                                 case prdfn: { readi(&prd, &i); putint(ad1, i); } break;
                                 case prrfn: errori("read on prr file         ");
                                 break;
                              }
                           else {
                                if (filstate[fn-(1)] != fread1) 
                                   errori("File not in read mode    ");
                                readi(&filtable[fn-(1)], &i);
                                putint(ad1, i); 
                           }
                      }
                      break;
           case 12/*rdr*/: { popadr(&ad1); popadr(&ad); pshadr(ad); valfil(ad); 
                            fn = store_[ad];
                           if (fn <= prrfn)  switch (fn) {
                                 case inputfn: { readr(&input, &r); putrel(ad1, r); } break;
                                 case outputfn: errori("read on output file      "); break;
                                 case prdfn: { readr(&prd, &r); putrel(ad1, r); } break;
                                 case prrfn: errori("read on prr file         ");
                                 break;
                              }
                           else {
                                if (filstate[fn-(1)] != fread1) 
                                   errori("File not in read mode    ");
                                readr(&filtable[fn-(1)], &r);
                                putrel(ad1, r);
                           }
                      }
                      break;
           case 13/*rdc*/: { popadr(&ad1); popadr(&ad); pshadr(ad); valfil(ad); 
                            fn = store_[ad];
                           if (fn <= prrfn)  switch (fn) {
                                 case inputfn: { readc(&input, &c); putchr(ad1, c); } break;
                                 case outputfn: errori("read on output file      "); break;
                                 case prdfn: { readc(&prd, &c); putchr(ad1, c); } break;
                                 case prrfn: errori("read on prr file         ");
                                 break;
                              }
                           else {
                                if (filstate[fn-(1)] != fread1) 
                                   errori("File not in read mode    ");
                                readc(&filtable[fn-(1)], &c);
                                putchr(ad1, c);
                           }
                      }
                      break;
           case 14/*sin*/: { poprel(&r1); pshrel(sin(r1)); } break;
           case 15/*cos*/: { poprel(&r1); pshrel(cos(r1)); } break;
           case 16/*exp*/: { poprel(&r1); pshrel(exp(r1)); } break;
           case 17/*log*/: { poprel(&r1); pshrel(log(r1)); } break;
           case 18/*sqt*/: { poprel(&r1); pshrel(sqrt(r1)); } break;
           case 19/*atn*/: { poprel(&r1); pshrel(atan(r1)); } break;
           /* placeholder for "mark" */
           case 20/*sav*/: errori("invalid std proc/func    "); break;
           case 21/*pag*/: { popadr(&ad); valfil(ad); fn = store_[ad];
                           if (fn <= prrfn)  switch (fn) {
                                case inputfn: errori("page on read file        "); break;
                                case outputfn: page(output); break;
                                case prdfn: errori("page on prd file         "); break;
                                case prrfn: page(prr);
                                break;
                              }
                           else {
                                if (filstate[fn-(1)] != fwrite1) 
                                   errori("File not in write mode   ");
                                page(filtable[fn-(1)]);
                           }
                      }
                      break;
           case 22/*rsf*/: { popadr(&ad); valfil(ad); fn = store_[ad];
                           if (fn <= prrfn)  switch (fn) {
                                case inputfn: errori("reset on input file      "); break;
                                case outputfn: errori("reset on output file     "); break;
                                case prdfn: reset(prd, 0, 0, 0); break;
                                case prrfn: errori("reset on prr file        ");
                                break;
                              } 
                           else {
                                filstate[fn-(1)] = fread1;
                                reset(filtable[fn-(1)], 0, 0, 0);
                           }
                      }
                      break;
           case 23/*rwf*/: { popadr(&ad); valfil(ad); fn = store_[ad];
                           if (fn <= prrfn)  switch (fn) {
                                case inputfn: errori("rewrite on input file    "); break;
                                case outputfn: errori("rewrite on output file   "); break;
                                case prdfn: errori("rewrite on prd file      "); break;
                                case prrfn: rewrite(prr, 0, 0, 0);
                                break;
                              } 
                           else {
                                filstate[fn-(1)] = fwrite1;
                                rewrite(filtable[fn-(1)], 0, 0, 0);
                           }
                      }
                      break;
           case 24/*wrb*/: { popint(&w); popint(&i); b = i != 0; popadr(&ad); 
                            pshadr(ad); valfil(ad); fn = store_[ad];
                           if (fn <= prrfn)  switch (fn) {
                                 case inputfn: errori("write on input file      "); break;
                                 case outputfn: twrite(&output, "%*b", b,w); break;
                                 case prdfn: errori("write on prd file        "); break;
                                 case prrfn: twrite(&prr, "%*b", b,w);
                                 break;
                              } 
                           else {
                                if (filstate[fn-(1)] != fwrite1) 
                                   errori("File not in write mode   ");
                                twrite(&filtable[fn-(1)], "%*b", b,w);
                           }
                      }
                      break;
           case 25/*wrf*/: { popint(&f); popint(&w); poprel(&r); popadr(&ad); pshadr(ad);
                            valfil(ad); fn = store_[ad];
                           if (fn <= prrfn)  switch (fn) {
                                 case inputfn: errori("write on input file      "); break;
                                 case outputfn: twrite(&output, "%*.*f", r,w,f); break;
                                 case prdfn: errori("write on prd file        "); break;
                                 case prrfn: twrite(&prr, "%*.*f", r,w,f);
                                 break;
                              } 
                           else {
                                if (filstate[fn-(1)] != fwrite1) 
                                   errori("File not in write mode   ");
                                twrite(&filtable[fn-(1)], "%*.*f", r,w,f); 
                           }
                      }
                      break;
           case 26/*dsp*/: {
                           popadr(&ad1); popadr(&ad); dspspc(ad1, getadr(ad));
                      }
                      break;
           case 27/*wbf*/: { popint(&l); popadr(&ad1); popadr(&ad);
                           valfilwm(ad); fn = store_[ad];
                           for( i = 1; i <= l; i ++) {
                              swrite(bfiltable[fn-(1)], store_[ad1]);
                              ad1 = ad1+1;
                           }
                      }
                      break;
           case 28/*wbi*/: { popint(&i); popadr(&ad); pshadr(ad); pshint(i);
                            valfilwm(ad); fn = store_[ad];
                            for( i = 1; i <= intsize; i ++)
                               swrite(bfiltable[fn-(1)], store_[sp-intsize+i-1]);
                            popint(&i);
                      }
                      break;
           case 29/*wbr*/: { poprel(&r); popadr(&ad); pshadr(ad); pshrel(r); 
                            valfilwm(ad); fn = store_[ad];
                            for( i = 1; i <= realsize; i ++) 
                               swrite(bfiltable[fn-(1)], store_[sp-realsize+i-1]);
                            poprel(&r);
                      }
                      break;
           case 30/*wbc*/: { popint(&i); c = chr(i); popadr(&ad); pshadr(ad); pshint(i); 
                            valfilwm(ad); fn = store_[ad];
                            for( i = 1; i <= charsize; i ++)
                               swrite(bfiltable[fn-(1)], store_[sp-intsize+i-1]);
                            popint(&i);
                      }
                      break;
           case 31/*wbb*/: { popint(&i); popadr(&ad); pshadr(ad); pshint(i); 
                            valfilwm(ad); fn = store_[ad];
                            for( i = 1; i <= boolsize; i ++)
                               swrite(bfiltable[fn-(1)], store_[sp-intsize+i-1]);
                            popint(&i);
                      }
                      break;
           case 32/*rbf*/: { popint(&l); popadr(&ad1); popadr(&ad); pshadr(ad);
                            valfilrm(ad); fn = store_[ad];
                            if (filbuff[fn-(1)])  /* buffer data exists */
                            for( i = 1; i <= l; i ++)
                              store_[ad1+i-1] = store_[ad+fileidsize+i-1];
                            else {
                              if (eof(bfiltable[fn-(1)]))  errori("End of file              ");
                              for( i = 1; i <= l; i ++) {
                                sread(bfiltable[fn-(1)], store_[ad1]);
                                ad1 = ad1+1;
                              }
                            }
                      }
                      break;
           case 33/*rsb*/: { popadr(&ad); valfil(ad); fn = store_[ad];
                           filstate[fn-(1)] = fread1;
                           reset(bfiltable[fn-(1)], 0, 0, 0);
                           filbuff[fn-(1)] = false;
                      }
                      break;
           case 34/*rwb*/: { popadr(&ad); valfil(ad); fn = store_[ad];
                           filstate[fn-(1)] = fwrite1;
                           rewrite(bfiltable[fn-(1)], 0, 0, 0);
                           filbuff[fn-(1)] = false;
                      }
                      break;
           case 35/*gbf*/: { popint(&i); popadr(&ad); valfilrm(ad); fn = store_[ad];
                           if (filbuff[fn-(1)])  filbuff[fn-(1)] = false;
                           else
                             for( j = 1; j <= i; j ++)
                                sread(bfiltable[fn-(1)], store_[ad+fileidsize+j-1]);
                      }
                      break;
           case 36/*pbf*/: { popint(&i); popadr(&ad); valfilwm(ad); fn = store_[ad];
                           for( j = 1; j <= i; j ++)
                              swrite(bfiltable[fn-(1)], store_[ad+fileidsize+j-1]);
                      }
                      break;
      }   /*case q*/
}   /*callsp*/

int main(int argc, char* argv[])
{     /* main */

  pio_initialize(argc, (const char **)argv);
  cwrite("P5 Pascal interpreter vs. %1i.%1i\n", majorver, minorver);
  cwrite("\n");

  /* !!! remove this next statement for self compile */
  /*elide*/rewrite(prr, 0, 0, 0);/*noelide*/
  {
     int error;
     if (argc >= 2) {
         //printf("open file %s\n", argv[1]);
         reset(prd, argv[1], 0, &error); /* open input file */
         if (error == -1) {
            printf("failed to open file %s\n", argv[1]);
            wait_for_key();
            exit(EXIT_SUCCESS);
         }
     }
  }

  cwrite("Assembling/loading program\n");
  load(); /* assembles and stores code */
  pc = 0; sp = pctop; mp = pctop; np = cp; ep = 5; srclin = 0;

  interpreting = true;

  cwrite("Running program\n");
  cwrite("\n");
  while (interpreting) 
  {

    /* fetch instruction from byte store */
    pcs = pc;  /* save starting pc */
    getop();

    /*execute*/

    /* trace executed instructions */
    if (dotrcins)  { 

       wrthex(pcs, maxdigh);
       cwrite("/");
       wrthex(sp, maxdigh);
       lstins(&pcs);
       cwrite("\n");

    }
    switch (op) {

          case 0   /*lodi*/: { getp(); getq(); pshint(getint(base(p) + q)); } break;
          case 105 /*loda*/: { getp(); getq(); pshadr(getadr(base(p) + q)); } break;
          case 106 /*lodr*/: { getp(); getq(); pshrel(getrel(base(p) + q)); } break;
          case 107 /*lods*/: { getp(); getq(); getset(base(p) + q, &s1); pshset(s1); } break;
          case 108 /*lodb*/: { getp(); getq(); pshint(ord(getbol(base(p) + q))); } break;
          case 109 /*lodc*/: { getp(); getq(); pshint(ord(getchr(base(p) + q))); } break;

          case 1  /*ldoi*/: { getq(); pshint(getint(pctop+q)); } break;
          case 65 /*ldoa*/: { getq(); pshadr(getadr(pctop+q)); } break;
          case 66 /*ldor*/: { getq(); pshrel(getrel(pctop+q)); } break;
          case 67 /*ldos*/: { getq(); getset(pctop+q, &s1); pshset(s1); } break;
          case 68 /*ldob*/: { getq(); pshint(ord(getbol(pctop+q))); } break;
          case 69 /*ldoc*/: { getq(); pshint(ord(getchr(pctop+q))); } break;

          case 2  /*stri*/: { getp(); getq(); popint(&i); putint(base(p)+q, i); } break;
          case 70 /*stra*/: { getp(); getq(); popadr(&ad); putadr(base(p)+q, ad); } break;
          case 71 /*strr*/: { getp(); getq(); poprel(&r1); putrel(base(p)+q, r1); } break;
          case 72 /*strs*/: { getp(); getq(); popset(&s1); putset(base(p)+q, s1); } break;
          case 73 /*strb*/: { getp(); getq(); popint(&i1); b1 = i1 != 0; 
                             putbol(base(p)+q, b1); }
                             break;
          case 74 /*strc*/: { getp(); getq(); popint(&i1); c1 = chr(i1);
                             putchr(base(p)+q, c1); }
                             break;

          case 3  /*sroi*/: { getq(); popint(&i); putint(pctop+q, i); } break;
          case 75 /*sroa*/: { getq(); popadr(&ad); putadr(pctop+q, ad); } break;
          case 76 /*sror*/: { getq(); poprel(&r1); putrel(pctop+q, r1); } break;
          case 77 /*sros*/: { getq(); popset(&s1); putset(pctop+q, s1); } break;
          case 78 /*srob*/: { getq(); popint(&i1); b1 = i1 != 0; putbol(pctop+q, b1); } break;
          case 79 /*sroc*/: { getq(); popint(&i1); c1 = chr(i1); putchr(pctop+q, c1); } break;

          case 4 /*lda*/: { getp(); getq(); pshadr(base(p)+q); } break;
          case 5 /*lao*/: { getq(); pshadr(pctop+q); } break;

          case 6  /*stoi*/: { popint(&i); popadr(&ad); putint(ad, i); } break;
          case 80 /*stoa*/: { popadr(&ad1); popadr(&ad); putadr(ad, ad1); } break;
          case 81 /*stor*/: { poprel(&r1); popadr(&ad); putrel(ad, r1); } break;
          case 82 /*stos*/: { popset(&s1); popadr(&ad); putset(ad, s1); } break;
          case 83 /*stob*/: { popint(&i1); b1 = i1 != 0; popadr(&ad); 
                             putbol(ad, b1); }
                             break;
          case 84 /*stoc*/: { popint(&i1); c1 = chr(i1); popadr(&ad); 
                             putchr(ad, c1); }
                             break;

          case 127 /*ldcc*/: { pshint(ord(getchr(pc))); pc = pc+1; } break;
          case 126 /*ldcb*/: { pshint(ord(getbol(pc))); pc = pc+1; } break;
          case 123 /*ldci*/: { i = getint(pc); pc = pc+intsize; pshint(i); } break;
          case 125 /*ldcn*/: pshadr(nilval)/* load nil */; break;
          case 124 /*ldcr*/: { getq(); pshrel(getrel(q)); } break;
          case 7   /*ldc*/: { getq(); getset(q, &s1); pshset(s1); } break;

          case 9  /*indi*/: { getq(); popadr(&ad); pshint(getint(ad+q)); } break;
          case 85 /*inda*/: { getq(); popadr(&ad); ad1 = getadr(ad+q); pshadr(ad1); } break;
          case 86 /*indr*/: { getq(); popadr(&ad); pshrel(getrel(ad+q)); } break;
          case 87 /*inds*/: { getq(); popadr(&ad); getset(ad+q, &s1); pshset(s1); } break;
          case 88 /*indb*/: { getq(); popadr(&ad); pshint(ord(getbol(ad+q))); } break;
          case 89 /*indc*/: { getq(); popadr(&ad); pshint(ord(getchr(ad+q))); } break;

          case 93 /*incb*/:
          case 94 /*incc*/:
          case 10 /*inci*/: { getq(); popint(&i1); pshint(i1+q); }
          break;
          case 90 /*inca*/: { getq(); popadr(&a1); pshadr(a1+q); } break;
          case 91 /*incr*/:
          case 92 /*incs*/: errori("Instruction error        ");
          break;

          case 11 /*mst*/: { /*p=level of calling procedure minus level of called
                              procedure + 1;  set dl and sl, increment sp*/
                       /* then length of this element is
                          max(intsize,realsize,boolsize,charsize,ptrsize */
                       getp();
                       ad = sp;  /* save mark base */
                       sp = sp+marksize;  /* allocate mark */
                       putadr(ad+marksl, base(p)); /* sl */
                       /* the length of this element is ptrsize */
                       putadr(ad+markdl, mp); /* dl */
                       /* idem */
                       putadr(ad+markep, ep); /* ep */
                       /* idem */
                      }
                      break;

          case 12 /*cup*/: { /*p=no of locations for parameters, q=entry point*/
                       getp(); getq();
                       mp = sp-(p+marksize);  /* mp to base of mark */
                       putadr(mp+markra, pc); /* place ra */
                       pc = q;
                      }
                      break;

          case 13 /*ents*/: { getq(); ad = mp + q; /*q = length of dataseg*/
                          if (sp >= np)  errori("store overflow           ");
                          /* clear allocated memory */
                          while (sp < ad)  { store_[sp] = 0; sp = sp+1; }
                          putadr(mp+marksb, sp); /* set bottom of stack */
                       }
                       break;

          case 173 /*ente*/: { getq(); ep = sp+q;
                          if (ep >= np)  errori("store overflow           ");
                          putadr(mp+market, ep); /* place current ep */
                        }
                        break;
                        /*q = max space required on stack*/

          case 14  /*retp*/: {
                         sp = mp;
                         pc = getadr(mp+markra);  /* get ra */
                         ep = getadr(mp+markep);  /* get old ep */
                         mp = getadr(mp+markdl);  /* get dl */
                       }
                       break;
          /* For characters and booleans, need to clean 8 bit results because
            only the lower 8 bits were stored to. */
          case 130 /*retc*/: {
                         putint(mp, ord(getchr(mp)));
                         sp = mp+intsize;  /* set stack above function result */
                         pc = getadr(mp+markra);
                         ep = getadr(mp+markep);
                         mp = getadr(mp+markdl);
                       }
                       break;
          case 131 /*retb*/: {
                         putint(mp, ord(getbol(mp)));
                         sp = mp+intsize;  /* set stack above function result */
                         pc = getadr(mp+markra);
                         ep = getadr(mp+markep);
                         mp = getadr(mp+markdl);
                       }
                       break;
          case 128 /*reti*/: {
                         sp = mp+intsize;  /* set stack above function result */
                         pc = getadr(mp+markra);
                         ep = getadr(mp+markep);
                         mp = getadr(mp+markdl);
                       }
                       break;
          case 129 /*retr*/: {
                         sp = mp+realsize;  /* set stack above function result */
                         pc = getadr(mp+markra);
                         ep = getadr(mp+markep);
                         mp = getadr(mp+markdl);
                       }
                       break;
          case 132  /*reta*/: {
                         sp = mp+adrsize;  /* set stack above function result */
                         pc = getadr(mp+markra);
                         ep = getadr(mp+markep);
                         mp = getadr(mp+markdl);
                       }
                       break;

          case 15 /*csp*/: { getq(); callsp(); } break;

          case 16 /*ixa*/: { getq(); popint(&i); popadr(&a1); pshadr(q*i+a1); } break;

          case 17  /* equa */: { popadr(&a2); popadr(&a1); pshint(ord(a1==a2)); } break;
          case 139 /* equb */:
          case 141 /* equc */:
          case 137 /* equi */: { popint(&i2); popint(&i1); pshint(ord(i1==i2)); }
          break;
          case 138 /* equr */: { poprel(&r2); poprel(&r1); pshint(ord(r1==r2)); } break;
          case 140 /* equs */: { popset(&s2); popset(&s1); pshint(ord(equivalent(s1, s2))); } break;
          case 142 /* equm */: { getq(); compare(); pshint(ord(b)); } break;

          case 18  /* neqa */: { popadr(&a2); popadr(&a1); pshint(ord(a1!=a2)); } break;
          case 145 /* neqb */:
          case 147 /* neqc */:
          case 143 /* neqi */: { popint(&i2); popint(&i1); pshint(ord(i1!=i2)); }
          break;
          case 144 /* neqr */: { poprel(&r2); poprel(&r1); pshint(ord(r1!=r2)); } break;
          case 146 /* neqs */: { popset(&s2); popset(&s1); pshint(ord(!equivalent(s1, s2))); } break;
          case 148 /* neqm */: { getq(); compare(); pshint(ord(! b)); } break;

          case 19  /* geqa */: errori("<,<=,>,>= for address    "); break;
          case 151 /* geqb */:
          case 153 /* geqc */:
          case 149 /* geqi */: { popint(&i2); popint(&i1); pshint(ord(i1>=i2)); }
          break;
          case 150 /* geqr */: { poprel(&r2); poprel(&r1); pshint(ord(r1>=r2)); } break;
          case 152 /* geqs */: { popset(&s2); popset(&s1); pshint(ord(subset(s2, s1))); } break;
          case 154 /* geqm */: { getq(); compare(); pshint(ord(b || (store_[a1+i] >= store_[a2+i]))); } break;

          case 20  /* grta */: errori("<,<=,>,>= for address    "); break;
          case 157 /* grtb */:
          case 159 /* grtc */:
          case 155 /* grti */: { popint(&i2); popint(&i1); pshint(ord(i1>i2)); }
          break;
          case 156 /* grtr */: { poprel(&r2); poprel(&r1); pshint(ord(r1>r2)); } break;
          case 158 /* grts */: errori("set inclusion            "); break;
          case 160 /* grtm */: { getq(); compare(); pshint(ord(! b && (store_[a1+i] > store_[a2+i]))); } break;

          case 21  /* leqa */: errori("<,<=,>,>= for address    "); break;
          case 163 /* leqb */:
          case 165 /* leqc */:
          case 161 /* leqi */: { popint(&i2); popint(&i1); pshint(ord(i1<=i2)); }
          break;
          case 162 /* leqr */: { poprel(&r2); poprel(&r1); pshint(ord(r1<=r2)); } break;
          case 164 /* leqs */: { popset(&s2); popset(&s1); pshint(ord(subset(s1, s2))); } break;
          case 166 /* leqm */: { getq(); compare(); pshint(ord(b || (store_[a1+i] <= store_[a2+i]))); } break;

          case 22  /* lesa */: errori("<,<=,>,>= for address    "); break;
          case 169 /* lesb */:
          case 171 /* lesc */:
          case 167 /* lesi */: { popint(&i2); popint(&i1); pshint(ord(i1<i2)); }
          break;
          case 168 /* lesr */: { poprel(&r2); poprel(&r1); pshint(ord(r1<r2)); } break;
          case 170 /* less */: errori("set inclusion            "); break;
          case 172 /* lesm */: { getq(); compare(); pshint(ord(! b && (store_[a1+i] < store_[a2+i]))); } break;

          case 23 /*ujp*/: { getq(); pc = q; } break;
          case 24 /*fjp*/: { getq(); popint(&i); if (i == 0)  pc = q; } break;
          case 25 /*xjp*/: { getq(); popint(&i1); pc = i1*ujplen+q; } break;

          case 95 /*chka*/: { getq(); popadr(&a1); pshadr(a1); 
                             /*     0 = assign pointer including nil
                               Not 0 = assign pointer from heap address */
                             if (a1 == 0)   
                                /* if zero, but not nil, it's never been assigned */
                                errori("uninitialized pointer    ");
                             else if ((q != 0) && (a1 == nilval)) 
                                /* q <> 0 means deref, and it was nil 
                                  (which is not zero) */
                                errori("Dereference of nil ptr   ");
                             else if (((a1 < np) || (a1 >= cp)) && 
                                     (a1 != nilval)) 
                                /* outside heap space (which could have 
                                  contracted!) */
                                errori("bad pointer value        ");
                             else if (dochkrpt && (a1 != nilval))  {
                                /* perform use of freed space check */
                                if (isfree(a1)) 
                                   /* attempt to dereference or assign a freed 
                                     block */
                                   errori("Ptr used after dispose op");
                             }
                       }
                       break;
          case 96 /*chkr*/:
          case 97 /*chks*/: errori("Instruction error        ");
          break;
          case 98 /*chkb*/:
          case 99 /*chkc*/:
          case 26 /*chki*/: { getq(); popint(&i1); pshint(i1); 
                        if ((i1 < getint(q)) || (i1 > getint(q+intsize))) 
                        errori("value out of range       ");
                      }
                      break;

          case 27 /*eof*/: { popadr(&ad); valfil(ad); fn = store_[ad];
                            if (fn <= prrfn)  switch (fn) {
                               case inputfn: pshint(ord(eof(input))); break;
                               case prdfn: pshint(ord(eof(prd))); break;
                               case outputfn:
                               case prrfn: errori("eof test on output file  ");
                               break;
                            } else { 
                               if (filstate[fn-(1)] != fread1) 
                                  errori("File not in read mode    ");
                               pshint(ord(eof(filtable[fn-(1)]) && ! filbuff[fn-(1)]));
                            }
                      }
                      break;

          case 28 /*adi*/: { popint(&i2); popint(&i1); pshint(i1+i2); } break;
          case 29 /*adr*/: { poprel(&r2); poprel(&r1); pshrel(r1+r2); } break;
          case 30 /*sbi*/: { popint(&i2); popint(&i1); pshint(i1-i2); } break;
          case 31 /*sbr*/: { poprel(&r2); poprel(&r1); pshrel(r1-r2); } break;
          case 32 /*sgs*/: { popint(&i1); pshset(setof(i1, eos)); } break;
          case 33 /*flt*/: { popint(&i1); pshrel(i1); } break;

          /* note that flo implies the tos is float as well */
          case 34 /*flo*/: { poprel(&r1); popint(&i1); pshrel(i1); pshrel(r1); } break;

          case 35 /*trc*/: { poprel(&r1); pshint(trunc(r1)); } break;
          case 36 /*ngi*/: { popint(&i1); pshint(-i1); } break;
          case 37 /*ngr*/: { poprel(&r1); pshrel(-r1); } break;
          case 38 /*sqi*/: { popint(&i1); pshint(sqr(i1)); } break;
          case 39 /*sqr*/: { poprel(&r1); pshrel(sqr(r1)); } break;
          case 40 /*abi*/: { popint(&i1); pshint(abs(i1)); } break;
          case 41 /*abr*/: { poprel(&r1); pshrel(abs(r1)); } break;
          case 42 /*not*/: { popint(&i1); b1 = i1 != 0; pshint(ord(! b1)); } break;
          case 43 /*and*/: { popint(&i2); b2 = i2 != 0; 
                            popint(&i1); b1 = i1 != 0; 
                            pshint(ord(b1 && b2)); }
                            break;
          case 44 /*ior*/: { popint(&i2); b2 = i2 != 0; 
                            popint(&i1); b1 = i1 != 0; 
                            pshint(ord(b1 || b2)); }
                            break;
          case 45 /*dif*/: { popset(&s2); popset(&s1); pshset(difference(s1, s2)); } break;
          case 46 /*int*/: { popset(&s2); popset(&s1); pshset(intersect(s1, s2)); } break;
          case 47 /*uni*/: { popset(&s2); popset(&s1); pshset(join(s1, s2)); } break;
          case 48 /*inn*/: { popset(&s1); popint(&i1); pshint(ord(inset(i1, s1))); } break;
          case 49 /*mod*/: { popint(&i2); popint(&i1); pshint(i1 % i2); } break;
          case 50 /*odd*/: { popint(&i1); pshint(ord(odd(i1))); } break;
          case 51 /*mpi*/: { popint(&i2); popint(&i1); pshint(i1*i2); } break;
          case 52 /*mpr*/: { poprel(&r2); poprel(&r1); pshrel(r1*r2); } break;
          case 53 /*dvi*/: { popint(&i2); popint(&i1); 
                            if (i2 == 0)  errori("Zero divide              ");
                            pshint(i1 / i2); }
                            break;
          case 54 /*dvr*/: { poprel(&r2); poprel(&r1); 
                            if (r2 == 0.0)  errori("Zero divide              ");
                            pshrel(r1/r2); }
                            break;
          case 55 /*mov*/: { getq(); popint(&i2); popint(&i1);
                       for( i3 = 0; i3 <= q-1; i3 ++) store_[i1+i3] = store_[i2+i3];
                       /* q is a number of storage units */
                      }
                      break;
          case 56 /*lca*/: { getq(); pshadr(q); } break;

          case 103 /*decb*/:
          case 104 /*decc*/:
          case 57  /*deci*/: { getq(); popint(&i1); pshint(i1-q); }
          break;
          case 100 /*deca*/:
          case 101 /*decr*/:
          case 102 /*decs*/: errori("Instruction error        ");
          break;

          case 58 /*stp*/: interpreting = false; break;

          case 134 /*ordb*/:
          case 136 /*ordc*/:
          case 59  /*ordi*/:;
          break;          /* ord is a no-op */
          case 133 /*ordr*/:
          case 135 /*ords*/: errori("Instruction error        ");
          break;

          case 60 /*chr*/:; break; /* chr is a no-op */

          case 61 /*ujc*/: errori("case - error             "); break;
          case 62 /*rnd*/: { poprel(&r1); pshint(round(r1)); } break;

          case 63 /*pck*/: { getq(); getq1(); popadr(&a3); popadr(&a2); popadr(&a1);
                       if (a2+q > q1)  errori("pack elements out of bnds");
                       for( i4 = 0; i4 <= q-1; i4 ++) {
                          store_[a3+i4] = store_[a1+a2];
                          a2 = a2+1;
                       }
                     }
                     break;
          case 64 /*upk*/: { getq(); getq1(); popadr(&a3); popadr(&a2); popadr(&a1);
                       if (a3+q > q1)  errori("unpack elem out of bnds  ");
                       for( i4 = 0; i4 <= q-1; i4 ++) {
                          store_[a2+a3] = store_[a1+i4];
                          a3 = a3+1;
                       }
                     }
                     break;

          case 110 /*rgs*/: { popint(&i2); popint(&i1); pshset(setof(range(i1,i2), eos)); } break;
          case 111 /*fbv*/: { popadr(&ad); pshadr(ad); valfil(ad); fn = store_[ad];
                       if (fn == inputfn)  putchr(ad+fileidsize, *currec(input));
                       else if (fn == prdfn)  putchr(ad+fileidsize, *currec(prd));
                       else {
                         if (filstate[fn-(1)] == fread1) 
                           putchr(ad+fileidsize, *currec(filtable[fn-(1)]));
                       }
                     }
                     break;
          case 112 /*ipj*/: { getp(); getq(); pc = q;
                       mp = base(p);  /* index the mark to restore */
                       /* restore marks until we reach the destination level */
                       sp = getadr(mp+marksb);  /* get the stack bottom */
                       ep = getadr(mp+market); /* get the mark ep */
                     }
                     break;
          case 113 /*cip*/: { getp(); popadr(&ad);
                      mp = sp-(p+marksize);
                      /* replace next link mp with the one for the target */
                      putadr(mp+marksl, getadr(ad));
                      putadr(mp+markra, pc);
                      pc = getadr(ad+1*ptrsize);
                    }
                    break;
          case 114 /*lpa*/: { getp(); getq(); /* place procedure address on stack */
                      pshadr(base(p));
                      pshadr(q);
                    }
                    break;
          case 115 /*efb*/: {
                      popadr(&ad); pshadr(ad); valfilrm(ad); fn = store_[ad];
                      /* eof is file eof, and buffer not full */
                      pshint(ord(eof(bfiltable[fn-(1)]) && ! filbuff[fn-(1)]));
                     }
                     break;
          case 116 /*fvb*/: { popint(&i); popadr(&ad); pshadr(ad); valfil(ad);
                      fn = store_[ad];
                      /* load buffer only if in read mode, and buffer is empty */
                      if ((filstate[fn-(1)] == fread1) && ! filbuff[fn-(1)])  { 
                        for( j = 1; j <= i; j ++)
                          sread(bfiltable[fn-(1)], store_[ad+fileidsize+j-1]);
                        filbuff[fn-(1)] = true;
                      }
                    }
                    break;
          case 117 /*dmp*/: { getq(); sp = sp-q; } break; /* remove top of stack */

          case 118 /*swp*/: { getq(); swpstk(q); } break;

          case 119 /*tjp*/: { getq(); popint(&i); if (i != 0)  pc = q; } break;

          case 120 /*lip*/: { getp(); getq(); ad = base(p) + q;
                        i = getadr(ad); a1 = getadr(ad+1*ptrsize);
                        pshadr(i); pshadr(a1);
                      }
                      break;

          case 174 /*mrkl*/: { getq(); srclin = q; 
                              if (dotrcsrc)  
                                cwrite("Source line executed: %1i\n", q);
                        }
                        break;

          /* illegal instructions */
          case 8:   case 121: case 122: case 175: case 176: case 177: case 178:
          case 180: case 181: case 182: case 183: case 184: case 185: case 186: case 187: case 188: case 189:
          case 190: case 191: case 192: case 193: case 194: case 195: case 196: case 197: case 198: case 199:
          case 200: case 201: case 202: case 203: case 204: case 205: case 206: case 207: case 208: case 209:
          case 210: case 211: case 212: case 213: case 214: case 215: case 216: case 217: case 218: case 219:
          case 220: case 221: case 222: case 223: case 224: case 225: case 226: case 227: case 228: case 229:
          case 230: case 231: case 232: case 233: case 234: case 235: case 236: case 237: case 238: case 239:
          case 240: case 241: case 242: case 243: case 244: case 245: case 246: case 247: case 248: case 249:
          case 250: case 251: case 252: case 253: case 254: 
          case 255: errori("illegal instruction      ");
          break;

    }
  }    /*while interpreting*/

  /* perform heap dump if requested */
  if (dodmpspc)  repspc();

  L1 : /* abort run */

  cwrite("\n");
  cwrite("program complete\n");

  return EXIT_SUCCESS;
}
