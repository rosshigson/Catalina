%{

/*--------------------------------------------------------------------------
    This file is part of Catalina.

    Copyright 2009 Ross Higson

    Catalina is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Catalina is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Catalina.  If not, see <http://www.gnu.org/licenses/>.

  -------------------------------------------------------------------------- */

/*
 * SUPPORT_PASM allows the use of PASM("string") to insert PASM in the C code
 */
#define SUPPORT_PASM

/*
 * SUPPORT_ALLOCA allows the use of alloca() to allocate space on the stack
 * (which is always in Hub RAM). This is useful because it is faster than 
 * both malloc and hub_malloc. Like hub_malloc, it is especially useful for 
 * allocating Hub RAM in XMM LARGE programs where the standard malloc always
 * allocates XMM RAM. Using alloca is both smaller and faster than hub_malloc. 
 * However, note that unlike hub_malloc, Hub RAM allocated using alloca is 
 * invalid as soon as the scope in which it was allocated (e.g. a function) 
 * is exited. 
 *
 * Note that we expect alloca to be a macro defined in alloca.h as follows:
 *
 *   #define alloca(size) __builtin_alloca(size)
 * 
 * Alloca support involves:
 * - ensuring any function that calls alloca has a frame, even if it
 *   has no local variables (note - this is currently done by making any
 *   function that is NOT a leaf function allocate a frame - a better way 
 *   to do his would be to scan all the function calls in the function and
 *   identify if any of them are calls to alloca).
 * - adding one long to each frame when it is constructed, to store the 
 *   original SP, because the final SP may be different if alloca is called.
 *   This is done by modifying the NEWF and RETF kernal primitives. Note that
 *   since the kernel changes are independent of this program, it is assumed 
 *   that the new NEWF and RETF primitives are in use even if SUPPORT_ALLOCA
 *   is not defined. Otherwise the entire library would need to be recompiled
 *   every time SUPPORT_ALLOCA is changed.
 * - using the stored SP when dismantling the frame instead of adding
 *   a fixed value to the SP if alloca is actually called, to take into 
 *   account the space allocated on the stack by calls to alloca. Storing 
 *   the current SP is done once only - at the first use of alloca by the 
 *   function. If alloca is not called, the technique of adding the fixed 
 *   value of the framesize to the SP is still used (which saves a hub write 
 *   and read).
 */
#define SUPPORT_ALLOCA

/* 
 * PATH_SEPARATOR is the character used to separate elements of a path   
 */
#ifdef WIN32
#define PATH_SEPARATOR '\\'
#else
#define PATH_SEPARATOR '/'
#endif   

/*
 * MAX_PATHNAME_LENGTH is used to determine the maximum length of path names
 * (e.g. when trying to determine the output path to figure out where to put 
 * debug files).
 */

#define MAX_PATHNAME_LENGTH 1024

/*
 * MAX_NAME_LENGTH is used in deciding when to 'mangle' C names to fit
 * into the maximum label supported by the SPIN compiler used.
 * The value has to be 30 if you want to use the Parallax Propeller Tool.
 * The value has to be 28 if you want to use the Parallax PNUT Tool.
 * The value should be at least 65 for true ANSI C compatibiliy - this is
 * ok if Homespun is used as the SPIN compiler, since it allows arbitrary 
 * length labels.
 */
#define MAX_NAME_LENGTH 65 

/*
 * REG_PASSING is used to enable the passing of up to 4 arguments
 * using registers r2 .. r5. This is now the default, and disabling
 * it will probably no longer work. The flag is left in case it ever
 * becomes desirable to revert to stack passing - but in that case
 * all the argument passing code will have to be completely re-tested.
 */
#define REG_PASSING

/*
 * OLD_VARIADIC is used to enable support for old (pre-ANSI) style
 * variadic functions. This has a detrimental effect on the code 
 * generation, but is currently REQUIRED since the alternative is
 * not working correctly yet
 */
#define OLD_VARIADIC    

/*
 * DIAGNOSTIC is used to include diagnostic messages in the output -
 * all the messages are included as comments (i.e. preceeded with ')
 * so the resulting code will still compile - but it is very verbose
 * so this flag is not defined by default.
 */
/* #define DIAGNOSTIC */

/*
 * DEBUGGER_SUPPORT is used to include symbol table info.
 */ 
#define DEBUGGER_SUPPORT

/*
 * DEBUG_IN_OUTPUT_PATH is used to direct debug files to the path
 * used for ouptut files - otherwise, debug files go in the current
 * working directory.
 */
/* #define DEBUG_IN_OUTPUT_PATH */

/*
 * PRINT_SYMBOL_INFO is used to print debug messges (on stderr) as
 * various symbols (mainly function and constant symbols) are defined. 
 * This flag is not defined by default.
 */
/* #define PRINT_SYMBOL_INFO */

/*
 * ALIGN_LINES_LONG_FOR_DEBUG causes the start of each line to be aligned
 * to a long boundary.
 */
/* #define ALIGN_LINES_LONG_FOR_DEBUG */


/*
 * NOTE: Not all combinations of temp and variable registers work - some
 * cause register corruption and others cause lcc to loop infinitely - this
 * is partly due to the complexities of spilling and reloading registers.
 *
 * e.g:
 *    register corruption occurs when INTTMP = 0x0000003e and INTVAR = 0x00000fc0
 *    infinite loop occurs when INTTMP = 0x0000007e and INTVAR = 0x00000f80 
 *
 * If the register allocation is ever changed, it is essential that it be
 * EXTENSIVELY re-tested.
 */

#ifdef REG_PASSING

#define INTTMP 0x00555000
#define INTVAR 0x00aaaFC0

#define FLTTMP 0x00000000
#define FLTVAR 0x00000000

#else

#define INTTMP 0x00000ffc
#define INTVAR 0x000ff000

#define FLTTMP 0x00300000
#define FLTVAR 0x00c00000

#endif

#define INTRET 0x00000001

#define FLTRET 0x00000001

#define MULREG 0x00000002

#define MODREG 0x00000001

enum {
   r0=0,
   r1=1,
   r2=2,
   r3=3,
   r4=4,
   r5=5,
   r6=6,
   r7=7,
   r8=8,
   r9=9,
   r10=10,
   r11=11,
   r12=12,
   r13=13,
   r14=14,
   r15=15,
   r16=16,
   r17=17,
   r18=18,
   r19=19,
   r20=20,
   r21=21,
   r22=22,
   r23=23
};

#include "c.h"

#ifdef DEBUGGER_SUPPORT
#include "ctype.h"
#include "stab.h"
#endif

#define NODEPTR_TYPE Node
#define OP_LABEL(p) ((p)->op)
#define LEFT_CHILD(p) ((p)->kids[0])
#define RIGHT_CHILD(p) ((p)->kids[1])
#define STATE_LABEL(p) ((p)->x.state)
static void address(Symbol, Symbol, long);
static void blkfetch(int, int, int, int);
static void blkloop(int, int, int, int, int, int[]);
static void blkstore(int, int, int, int);
static void defaddress(Symbol);
static void defconst(int, int, Value);
static void defstring(int, char *);
static void defsymbol(Symbol);
static void doarg(Node);
static void emit2(Node);
static void export(Symbol);
static void clobber(Node);
static void function(Symbol, Symbol [], Symbol [], int);
static void global(Symbol);
static void import(Symbol);
static void local(Symbol);
static void progbeg(int, char **);
static void progend(void);
static void segment(int);
static void space(int);
static void target(Node);
static Symbol charreg[32];
static Symbol shortreg[32];
static Symbol intreg[32];
static int special_name(char *);
static int special(Node);
static int power_of_2(Node);
static int power_of_2_greater_than_31(Node);
static int in_place_special(Node);

#ifdef SUPPORT_ALLOCA
static int calls_alloca;
#endif

#define I16A_MOVI_SIZE 32

#define I32_MOVI_SIZE 512

#define I32_LODS_MIN -262144
#define I32_LODS_MAX 262143

#define I16B_LODF_SIZE 128

#define I16B_POPM_SIZE 128

#define I16B_CPREP_BC_SIZE 32
#define I16B_CPREP_BC_SHFT 4
#define I16B_CPREP_SP_SIZE 16

#ifdef REG_PASSING

#define FIRST_PASSING_REG 2
#define NUM_PASSING_REGS 4

static Symbol argreg(int);

static int memop(Node);
static int sametree(Node, Node);

#endif

#ifdef __CATALINA__
char * strdup(const char *str);
#endif

static Symbol charregw, shortregw, intregw;

static int cseg;

%}
%start stmt
%term CNSTF4=4113
%term CNSTI1=1045
%term CNSTI2=2069
%term CNSTI4=4117
%term CNSTP4=4119
%term CNSTU1=1046
%term CNSTU2=2070
%term CNSTU4=4118
 
%term ARGB=41
%term ARGF4=4129
%term ARGI4=4133
%term ARGP4=4135
%term ARGU4=4134

%term ASGNB=57
%term ASGNF4=4145
%term ASGNI1=1077
%term ASGNI2=2101
%term ASGNI4=4149
%term ASGNP4=4151
%term ASGNU1=1078
%term ASGNU2=2102
%term ASGNU4=4150

%term INDIRB=73
%term INDIRF4=4161
%term INDIRI1=1093
%term INDIRI2=2117
%term INDIRI4=4165
%term INDIRP4=4167
%term INDIRU1=1094
%term INDIRU2=2118
%term INDIRU4=4166

%term CVFF4=4209
%term CVFI4=4213
%term CVIF4=4225
%term CVII1=1157
%term CVII2=2181
%term CVII4=4229
%term CVIU1=1158
%term CVIU2=2182
%term CVIU4=4230

%term CVPU4=4246

%term CVUI1=1205
%term CVUI2=2229
%term CVUI4=4277
%term CVUP4=4279
%term CVUU1=1206
%term CVUU2=2230
%term CVUU4=4278

%term NEGF4=4289
%term NEGI4=4293

%term CALLB=217
%term CALLF4=4305
%term CALLI4=4309
%term CALLP4=4311
%term CALLU4=4310
%term CALLV=216

%term RETF4=4337
%term RETI4=4341
%term RETP4=4343
%term RETU4=4342
%term RETV=248

%term ADDRGP4=4359
%term ADDRFP4=4375
%term ADDRLP4=4391

%term ADDF4=4401
%term ADDI4=4405
%term ADDP4=4407
%term ADDU4=4406

%term SUBF4=4417
%term SUBI4=4421
%term SUBP4=4423
%term SUBU4=4422

%term LSHI4=4437
%term LSHU4=4438

%term MODI4=4453
%term MODU4=4454

%term RSHI4=4469
%term RSHU4=4470

%term BANDI4=4485
%term BANDU4=4486

%term BCOMI4=4501
%term BCOMU4=4502

%term BORI4=4517
%term BORU4=4518

%term BXORI4=4533
%term BXORU4=4534

%term DIVF4=4545
%term DIVI4=4549
%term DIVU4=4550

%term MULF4=4561
%term MULI4=4565
%term MULU4=4566

%term EQF4=4577
%term EQI4=4581
%term EQU4=4582

%term GEF4=4593
%term GEI4=4597
%term GEU4=4598

%term GTF4=4609
%term GTI4=4613
%term GTU4=4614

%term LEF4=4625
%term LEI4=4629
%term LEU4=4630

%term LTF4=4641
%term LTI4=4645
%term LTU4=4646

%term NEF4=4657
%term NEI4=4661
%term NEU4=4662

%term JUMPV=584

%term LABELV=600

%term LOADB=233
%term LOADF4=4321
%term LOADI1=1253
%term LOADI2=2277
%term LOADI4=4325
%term LOADP4=4327
%term LOADU1=1254
%term LOADU2=2278
%term LOADU4=4326

%term VREGP=711
%%

reg:  INDIRI1(VREGP)    "# read register\n"
reg:  INDIRU1(VREGP)    "# read register\n"
reg:  INDIRI2(VREGP)    "# read register\n"
reg:  INDIRU2(VREGP)    "# read register\n"
reg:  INDIRI4(VREGP)    "# read register\n"
reg:  INDIRU4(VREGP)    "# read register\n"
reg:  INDIRP4(VREGP)    "# read register\n"
reg:  INDIRF4(VREGP)    "# read register\n"

reg: LOADB(reg)  "# foo\n"

reg: LOADI1(reg)  "# peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n"  move(a)
reg: LOADI2(reg)  "# peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n"  move(a)
reg: LOADI4(reg)  "# peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n"  move(a)
reg: LOADU1(reg)  "# peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n"  move(a)
reg: LOADU2(reg)  "# peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n"  move(a)
reg: LOADU4(reg)  "# peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n"  move(a)
reg: LOADP4(reg)  "# peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n"  move(a)
reg: LOADF4(reg)  "# peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n"  move(a)

stmt: reg  ""

stmt: ASGNI1(VREGP,reg)  "# write register\n"
stmt: ASGNI2(VREGP,reg)  "# write register\n"
stmt: ASGNI4(VREGP,reg)  "# write register\n"
stmt: ASGNU1(VREGP,reg)  "# write register\n"
stmt: ASGNU2(VREGP,reg)  "# write register\n"
stmt: ASGNU4(VREGP,reg)  "# write register\n"
stmt: ASGNP4(VREGP,reg)  "# write register\n"
stmt: ASGNF4(VREGP,reg)  "# write register\n"

coni: CNSTI1  "%a"  range(a, 0, 31)
coni: CNSTI2  "%a"  range(a, 0, 31)
coni: CNSTI4  "%a"  range(a, 0, 31)
coni: CNSTU1  "%a"  range(a, 0, 31)
coni: CNSTU2  "%a"  range(a, 0, 31)
coni: CNSTU4  "%a"  range(a, 0, 31)

conn: CNSTI1  "%a"  range(a, -31, -1)
conn: CNSTI2  "%a"  range(a, -31, -1)
conn: CNSTI4  "%a"  range(a, -31, -1)
conn: CNSTU1  "%a"  range(a, -31, -1)
conn: CNSTU2  "%a"  range(a, -31, -1)
conn: CNSTU4  "%a"  range(a, -31, -1)

conli: CNSTI1  "%a"  range(a, 0, 511)
conli: CNSTI2  "%a"  range(a, 0, 511)
conli: CNSTI4  "%a"  range(a, 0, 511)
conli: CNSTU1  "%a"  range(a, 0, 511)
conli: CNSTU2  "%a"  range(a, 0, 511)
conli: CNSTU4  "%a"  range(a, 0, 511)

cons: CNSTI1  "%a"  range(a, -262144, 262143)
cons: CNSTI2  "%a"  range(a, -262144, 262143)
cons: CNSTI4  "%a"  range(a, -262144, 262143)
cons: CNSTU1  "%a"  range(a, -262144, 262143)
cons: CNSTU2  "%a"  range(a, -262144, 262143)
cons: CNSTU4  "%a"  range(a, -262144, 262143)

con: CNSTI1   "%a"
con: CNSTI2   "%a"
con: CNSTI4   "%a"
con: CNSTU1   "%a"
con: CNSTU2   "%a"
con: CNSTU4   "%a"
con: CNSTP4   "%a"
con: CNSTF4   "%a"

addrg: ADDRGP4  "%a"   (special(a)?LBURG_MAX:0)

special: ADDRGP4  "%a"   (special(a)?0:LBURG_MAX)

addrl16: ADDRLP4  "%a" range (a, -255, 255)
addrl16: ADDRFP4  "%a" range (a, -255, 255)

addrl32: ADDRLP4  "%a"
addrl32: ADDRFP4  "%a"

reg: addrl16  " word I16B_LODF + ((%a)&$1FF)<<S16B\n word I16A_MOV + (%c)<<D16A + RI<<S16A ' reg <- addrl16\n" 7
reg: addrl32  " alignl_p1\n long I32_LODF + ((%a)&$FFFFFF)<<S32\n word I16A_MOV + (%c)<<D16A + RI<<S16A ' reg <- addrl32\n" 7

reg: addrg  " word I16B_LODL + (%c)<<D16B\n alignl_p1\n long @%0 ' reg <- addrg\n" 7

reg: special " alignl_p1\n long I32_MOV + (%c)<<D32 + %a<<S32 ' reg <- special\n" 99

reg: coni  " word I16A_MOVI + (%c)<<D16A + (%0)<<S16A ' reg <- coni\n" 3
reg: conn  " word I16A_NEGI + (%c)<<D16A + (-(%0)&$1F)<<S16A ' reg <- conn\n" 3
reg: cons  " alignl_p1\n long I32_LODS + (%c)<<D32S + ((%0)&$7FFFF)<<S32 ' reg <- cons\n" 4
reg: conli " alignl_p1\n long I32_MOVI + (%c)<<D32 +(%0)<<S32 ' reg <- conli\n" 7
reg: con   " word I16B_LODL + (%c)<<D16B\n alignl_p1\n long %0 ' reg <- con\n" 17



reg: INDIRI1(reg)   " word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRI1 reg\n" 1
reg: INDIRI2(reg)   " word I16A_RDWORD + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRI2 reg\n" 1
reg: INDIRI4(reg)   " word I16A_RDLONG + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRI4 reg\n" 1
reg: INDIRU1(reg)   " word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRU1 reg\n" 1
reg: INDIRU2(reg)   " word I16A_RDWORD + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRU2 reg\n" 1
reg: INDIRU4(reg)   " word I16A_RDLONG + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRU4 reg\n" 1
reg: INDIRF4(reg)   " word I16A_RDLONG + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRF4 reg\n" 1
reg: INDIRP4(reg)   " word I16A_RDLONG + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRP4 reg\n" 1

reg: INDIRI1(addrg) " alignl_p1\n long I32_LODA + (@%0)<<S32\n word I16A_RDBYTE + (%c)<<D16A + RI<<S16A ' reg <- INDIRI1 addrg\n" 7
reg: INDIRI2(addrg) " alignl_p1\n long I32_LODA + (@%0)<<S32\n word I16A_RDWORD + (%c)<<D16A + RI<<S16A ' reg <- INDIRI2 addrg\n" 7
reg: INDIRI4(addrg) " alignl_p1\n long I32_LODI + (@%0)<<S32\n word I16A_MOV + (%c)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg\n" 7
reg: INDIRU1(addrg) " alignl_p1\n long I32_LODA + (@%0)<<S32\n word I16A_RDBYTE + (%c)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg\n" 7
reg: INDIRU2(addrg) " alignl_p1\n long I32_LODA + (@%0)<<S32\n word I16A_RDWORD + (%c)<<D16A + RI<<S16A ' reg <- INDIRU2 addrg\n" 7
reg: INDIRU4(addrg) " alignl_p1\n long I32_LODI + (@%0)<<S32\n word I16A_MOV + (%c)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg\n" 7
reg: INDIRF4(addrg) " alignl_p1\n long I32_LODI + (@%0)<<S32\n word I16A_MOV + (%c)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg\n" 7
reg: INDIRP4(addrg) " alignl_p1\n long I32_LODI + (@%0)<<S32\n word I16A_MOV + (%c)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg\n" 7

reg: INDIRI1(special) " alignl_p1\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRI1 addrg special\n" 0
reg: INDIRI2(special) " alignl_p1\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRI2 addrg special\n" 0
reg: INDIRI4(special) " alignl_p1\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRI4 addrg special\n" 0
reg: INDIRU1(special) " alignl_p1\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRU1 addrg special\n" 0
reg: INDIRU2(special) " alignl_p1\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRU2 addrg special\n" 0
reg: INDIRU4(special) " alignl_p1\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRU4 addrg special\n" 0
reg: INDIRF4(special) " alignl_p1\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRF4 addrg special\n" 0
reg: INDIRP4(special) " alignl_p1\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRP4 addrg special\n" 0

reg: INDIRI1(addrl16) " word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDBYTE + (%c)<<D16A + RI<<S16A ' reg <- INDIRI1 addrl16\n" 7 
reg: INDIRI2(addrl16) " word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDWORD + (%c)<<D16A + RI<<S16A ' reg <- INDIRI2 addrl16\n" 7
reg: INDIRI4(addrl16) " word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16\n" 7
reg: INDIRU1(addrl16) " word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDBYTE + (%c)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16\n" 7
reg: INDIRU2(addrl16) " word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDWORD + (%c)<<D16A + RI<<S16A ' reg <- INDIRU2 addrl16\n" 7
reg: INDIRU4(addrl16) " word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16\n" 7
reg: INDIRF4(addrl16) " word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16\n" 7
reg: INDIRP4(addrl16) " word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16\n" 7

reg: INDIRI1(addrl32) " alignl_p1\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDBYTE + (%c)<<D16A + RI<<S16A ' reg <- INDIRI1 addrl32\n" 7 
reg: INDIRI2(addrl32) " alignl_p1\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDWORD + (%c)<<D16A + RI<<S16A ' reg <- INDIRI2 addrl32\n" 7
reg: INDIRI4(addrl32) " alignl_p1\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl32\n" 7
reg: INDIRU1(addrl32) " alignl_p1\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDBYTE + (%c)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl32\n" 7
reg: INDIRU2(addrl32) " alignl_p1\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDWORD + (%c)<<D16A + RI<<S16A ' reg <- INDIRU2 addrl32\n" 7
reg: INDIRU4(addrl32) " alignl_p1\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl32\n" 7
reg: INDIRF4(addrl32) " alignl_p1\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl32\n" 7
reg: INDIRP4(addrl32) " alignl_p1\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl32\n" 7

reg: CVUU1(INDIRU1(reg)) " word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- CVUU1 INDIRU1 reg\n" 5
reg: CVUU2(INDIRU1(reg)) " word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- CVUU2 INDIRU1 reg\n" 5
reg: CVUU2(INDIRU2(reg)) " word I16A_RDWORD + (%c)<<D16A + (%0)<<S16A ' reg <- CVUU2 INDIRU2 reg\n" 5
reg: CVUU4(INDIRU1(reg)) " word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- CVUU4 INDIRU1 reg\n" 5
reg: CVUU4(INDIRU2(reg)) " word I16A_RDWORD + (%c)<<D16A + (%0)<<S16A ' reg <- CVUU4 INDIRU2 reg\n" 5
reg: CVUU4(INDIRU4(reg)) " word I16A_RDLONG + (%c)<<D16A + (%0)<<S16A ' reg <- CVUU4 INDIRU4 reg\n" 5
reg: CVUI1(INDIRU1(reg)) " word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- CVUI1 INDIRU1 reg\n" 5
reg: CVUI2(INDIRU1(reg)) " word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- CVUI2 INDIRU1 reg\n" 5
reg: CVUI2(INDIRU2(reg)) " word I16A_RDWORD + (%c)<<D16A + (%0)<<S16A ' reg <- CVUI2 INDIRU2 reg\n" 5
reg: CVUI4(INDIRU1(reg)) " word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- CVUI4 INDIRU1 reg\n" 5
reg: CVUI4(INDIRU2(reg)) " word I16A_RDWORD + (%c)<<D16A + (%0)<<S16A ' reg <- CVUI4 INDIRU2 reg\n" 5
reg: CVUI4(INDIRU4(reg)) " word I16A_RDLONG + (%c)<<D16A + (%0)<<S16A ' reg <- CVUI4 INDIRU4 reg\n" 5

stmt: ASGNI1(addrg,reg)   " alignl_p1\n long I32_LODA + (@%0)<<S32\n word I16A_WRBYTE + (%1)<<D16A + RI<<S16A ' ASGNI1 addrg reg\n" 7
stmt: ASGNI2(addrg,reg)   " alignl_p1\n long I32_LODA + (@%0)<<S32\n word I16A_WRWORD + (%1)<<D16A + RI<<S16A ' ASGNI2 addrg reg\n" 7
stmt: ASGNI4(addrg,reg)   " alignl_p1\n long I32_LODA + (@%0)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNI4 addrg reg\n" 7
stmt: ASGNU1(addrg,reg)   " alignl_p1\n long I32_LODA + (@%0)<<S32\n word I16A_WRBYTE + (%1)<<D16A + RI<<S16A ' ASGNU1 addrg reg\n" 7
stmt: ASGNU2(addrg,reg)   " alignl_p1\n long I32_LODA + (@%0)<<S32\n word I16A_WRWORD + (%1)<<D16A + RI<<S16A ' ASGNU2 addrg reg\n" 7
stmt: ASGNU4(addrg,reg)   " alignl_p1\n long I32_LODA + (@%0)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNU4 addrg reg\n" 7
stmt: ASGNF4(addrg,reg)   " alignl_p1\n long I32_LODA + (@%0)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNF4 addrg reg\n" 7
stmt: ASGNP4(addrg,reg)   " alignl_p1\n long I32_LODA + (@%0)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNP4 addrg reg\n" 7

stmt: ASGNI1(special,reg)   " alignl_p1\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNI1 special reg\n" 1
stmt: ASGNI2(special,reg)   " alignl_p1\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNI2 special reg\n" 1
stmt: ASGNI4(special,reg)   " alignl_p1\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNI4 special reg\n" 1
stmt: ASGNU1(special,reg)   " alignl_p1\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNU1 special reg\n" 1
stmt: ASGNU2(special,reg)   " alignl_p1\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNU2 special reg\n" 1
stmt: ASGNU4(special,reg)   " alignl_p1\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNU4 special reg\n" 1
stmt: ASGNF4(special,reg)   " alignl_p1\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNF4 special reg\n" 1
stmt: ASGNP4(special,reg)   " alignl_p1\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNP4 special reg\n" 1

stmt: ASGNI1(special,conli)   " alignl_p1\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNI1 special conli\n" 1 
stmt: ASGNI2(special,conli)   " alignl_p1\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNI2 special conli\n" 1
stmt: ASGNI4(special,conli)   " alignl_p1\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNI4 special conli\n" 1
stmt: ASGNU1(special,conli)   " alignl_p1\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNU1 special conli\n" 1
stmt: ASGNU2(special,conli)   " alignl_p1\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNU2 special conli\n" 1
stmt: ASGNU4(special,conli)   " alignl_p1\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNU4 special conli\n" 1
stmt: ASGNF4(special,conli)   " alignl_p1\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNF4 special conli\n" 1
stmt: ASGNP4(special,conli)   " alignl_p1\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNP4 special conli\n" 1

stmt: ASGNI1(addrl16,reg)   " word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRBYTE + (%1)<<D16A + RI<<S16A ' ASGNI1 addrl16 reg\n" 7
stmt: ASGNI2(addrl16,reg)   " word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRWORD + (%1)<<D16A + RI<<S16A ' ASGNI2 addrl16 reg\n" 7
stmt: ASGNI4(addrl16,reg)   " word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg\n" 7
stmt: ASGNU1(addrl16,reg)   " word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRBYTE + (%1)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg\n" 7
stmt: ASGNU2(addrl16,reg)   " word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRWORD + (%1)<<D16A + RI<<S16A ' ASGNU2 addrl16 reg\n" 7
stmt: ASGNU4(addrl16,reg)   " word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg\n" 7
stmt: ASGNF4(addrl16,reg)   " word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg\n" 7
stmt: ASGNP4(addrl16,reg)   " word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg\n" 7

stmt: ASGNI1(addrl32,reg)   " alignl_p1\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRBYTE + (%1)<<D16A + RI<<S16A ' ASGNI1 addrl32 reg\n" 7
stmt: ASGNI2(addrl32,reg)   " alignl_p1\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRWORD + (%1)<<D16A + RI<<S16A ' ASGNI2 addrl32 reg\n" 7
stmt: ASGNI4(addrl32,reg)   " alignl_p1\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNI4 addrl32 reg\n" 7
stmt: ASGNU1(addrl32,reg)   " alignl_p1\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRBYTE + (%1)<<D16A + RI<<S16A ' ASGNU1 addrl32 reg\n" 7
stmt: ASGNU2(addrl32,reg)   " alignl_p1\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRWORD + (%1)<<D16A + RI<<S16A ' ASGNU2 addrl32 reg\n" 7
stmt: ASGNU4(addrl32,reg)   " alignl_p1\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNU4 addrl32 reg\n" 7
stmt: ASGNF4(addrl32,reg)   " alignl_p1\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNF4 addrl32 reg\n" 7
stmt: ASGNP4(addrl32,reg)   " alignl_p1\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNP4 addrl32 reg\n" 7

stmt: ASGNI1(reg,reg)   " word I16A_WRBYTE + (%1)<<D16A + (%0)<<S16A ' ASGNI1 reg reg\n" 99
stmt: ASGNI2(reg,reg)   " word I16A_WRWORD + (%1)<<D16A + (%0)<<S16A ' ASGNI2 reg reg\n" 99
stmt: ASGNI4(reg,reg)   " word I16A_WRLONG + (%1)<<D16A + (%0)<<S16A ' ASGNI4 reg reg\n" 99
stmt: ASGNU1(reg,reg)   " word I16A_WRBYTE + (%1)<<D16A + (%0)<<S16A ' ASGNU1 reg reg\n" 99
stmt: ASGNU2(reg,reg)   " word I16A_WRWORD + (%1)<<D16A + (%0)<<S16A ' ASGNU2 reg reg\n" 99
stmt: ASGNU4(reg,reg)   " word I16A_WRLONG + (%1)<<D16A + (%0)<<S16A ' ASGNU4 reg reg\n" 99
stmt: ASGNF4(reg,reg)   " word I16A_WRLONG + (%1)<<D16A + (%0)<<S16A ' ASGNF4 reg reg\n" 99
stmt: ASGNP4(reg,reg)   " word I16A_WRLONG + (%1)<<D16A + (%0)<<S16A ' ASGNP4 reg reg\n" 99

reg:  CALLI4(addrg)  "# call\n"
reg:  CALLU4(addrg)  "# call\n"
reg:  CALLP4(addrg)  "# call\n"
reg:  CALLF4(addrg)  "# call\n"
reg:  CALLV(addrg)  "# call\n"

reg:  CALLI4(reg)  "# call\n"
reg:  CALLU4(reg)  "# call\n"
reg:  CALLP4(reg)  "# call\n"
reg:  CALLF4(reg)  "# call\n"
reg:  CALLV(reg)  "# call\n"

stmt: RETI4(reg)  "# ret\n"
stmt: RETU4(reg)  "# ret\n"
stmt: RETP4(reg)  "# ret\n"
stmt: RETF4(reg)  "# ret\n"

stmt: RETI4(coni)  " word I16A_MOVI + R0<<D16A + (%0)<<S16A ' RET coni\n" 1 
stmt: RETU4(coni)  " word I16A_MOVI + R0<<D16A + (%0)<<S16A ' RET coni\n" 1
stmt: RETP4(coni)  " word I16A_MOVI + R0<<D16A + (%0)<<S16A ' RET coni\n" 1

stmt: RETI4(cons)  " alignl_p1\n long I32_LODS + R0<<D32S + ((%0)&$7FFFF)<<S32 ' RET cons\n" 2 
stmt: RETU4(cons)  " alignl_p1\n long I32_LODS + R0<<D32S + ((%0)&$7FFFF)<<S32 ' RET cons\n" 2
stmt: RETP4(cons)  " alignl_p1\n long I32_LODS + R0<<D32S + ((%0)&$7FFFF)<<S32 ' RET cons\n" 2

stmt: RETI4(conli)  " alignl_p1\n long I32_MOVI + R0<<D32 + (%0)<<S32 ' RET conli\n" 1 
stmt: RETU4(conli)  " alignl_p1\n long I32_MOVI + R0<<D32 + (%0)<<S32 ' RET conli\n" 1
stmt: RETP4(conli)  " alignl_p1\n long I32_MOVI + R0<<D32 + (%0)<<S32 ' RET conli\n" 1

stmt: RETI4(con)  " word I16B_LODL + R0<<D16B\n alignl_p1\n long %0 ' RET con\n" 7
stmt: RETU4(con)  " word I16B_LODL + R0<<D16B\n alignl_p1\n long %0 ' RET con\n" 7
stmt: RETP4(con)  " word I16B_LODL + R0<<D16B\n alignl_p1\n long %0 ' RET con\n" 7
stmt: RETF4(con)  " word I16B_LODL + R0<<D16B\n alignl_p1\n long %0 ' RET con\n" 7

reg: CVUI1(reg)  "# zero extend\n" 1
reg: CVUI2(reg)  "# zero extend\n" 1
reg: CVUI4(reg)  "# zero extend\n" 1
reg: CVUU1(reg)  "# truncate\n" 1
reg: CVUU2(reg)  "# truncate\n" 1
reg: CVUU4(reg)  "# truncate\n" 1

reg: CVUP4(reg)  "? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' CVUP4\n"  move(a)
reg: CVPU4(reg)  "? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' CVPU4\n"  move(a)

reg: CVII1(reg)  "# sign extend\n" 2
reg: CVII2(reg)  "# sign extend\n" 2
reg: CVII4(reg)  "# sign extend\n" 2
reg: CVIU1(reg)  "# truncate\n" 1
reg: CVIU2(reg)  "# truncate\n" 1
reg: CVIU4(reg)  "# truncate\n" 1

reg: CVFF4(reg) "# nothing" 1
reg: CVFI4(reg) " word I16B_FLTP + INFL<<S16B ' CVFI4\n" 1
reg: CVIF4(reg) " word I16B_FLTP + FLIN<<S16B ' CVIF4\n" 1

reg:  NEGI4(reg) " word I16A_NEG + (%c)<<D16A + (%0)<<S16A ' NEGI4\n" 1
reg:  NEGF4(reg) "? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16B_SIGN + (%c)<<D16B ' NEGF4\n" 2


reg:  BCOMI4(reg) "? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16B_CPL + (%c)<<D16B ' BCOMI4\n" 2 
reg:  BCOMU4(reg) "? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16B_CPL + (%c)<<D16B ' BCOMU4\n" 2


reg:  ADDI4(reg,coni) "? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_ADDSI + (%c)<<D16A + (%1)<<S16A ' ADDI4 reg coni\n" 1
reg:  ADDU4(reg,coni) "? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_ADDI + (%c)<<D16A + (%1)<<S16A ' ADDU4 reg coni\n" 1
reg:  ADDP4(reg,coni) "? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_ADDSI + (%c)<<D16A + (%1)<<S16A ' ADDP4 reg coni\n" 1

reg:  ADDI4(reg,reg) "# mov RI, %0\n adds RI, %1\n mov %c, RI ' ADDI4 reg\n" 3
reg:  ADDU4(reg,reg) "# mov RI, %0\n add RI, %1\n mov %c, RI ' ADDU4 reg\n"  3
reg:  ADDP4(reg,reg) "# mov RI, %0\n adds RI, %1\n mov %c, RI ' ADDP4 reg\n" 3

reg:  ADDF4(reg,reg) "# jmp #FADD ' ADDF4\n" 5

reg:  BANDI4(reg,reg) "# mov RI, %0\n and RI, %1\n mov %c, RI ' BANDI4 reg\n" 3
reg:  BANDU4(reg,reg) "# mov RI, %0\n and RI, %1\n mov %c, RI ' BANDU4 reg\n" 3

reg:  BORI4(reg,reg) "# mov RI, %0\n or RI, %1\n mov %c, RI ' BORI4 reg\n" 3
reg:  BORU4(reg,reg) "# mov RI, %0\n or RI, %1\n mov %c, RI ' BORU4 reg\n" 3

reg:  BXORI4(reg,reg) "# mov RI, %0\n xor RI, %1\n mov %c, RI ' BXORI4 reg\n" 3
reg:  BXORU4(reg,reg) "# mov RI, %0\n xor RI, %1\n mov %c, RI ' BXORU4 reg\n" 3

reg:  SUBI4(reg,coni) "? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SUBSI + (%c)<<D16A + (%1)<<S16A ' SUBI4 reg coni\n" 1
reg:  SUBU4(reg,coni) "? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SUBI + (%c)<<D16A + (%1)<<S16A ' SUBU4 reg coni\n" 1
reg:  SUBP4(reg,coni) "? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SUBSI + (%c)<<D16A + (%1)<<S16A ' SUBP4 reg coni\n" 1

reg:  SUBI4(reg,reg) "# mov RI, %0\n subs RI, %1\n mov %c, RI ' SUBI4 reg\n" 3
reg:  SUBU4(reg,reg) "# mov RI, %0\n sub RI, %1\n mov %c, RI ' SUBU4 reg\n" 3
reg:  SUBP4(reg,reg) "# mov RI, %0\n subs RI, %1\n mov %c, RI ' SUBP4 reg\n" 3

reg:  SUBF4(reg,reg) "# jmp #FSUB ' SUBF4\n" 5

reg:  DIVI4(reg,reg) "# jmp #DIVS ' DIVI4\n" 5
reg:  DIVU4(reg,reg) "# jmp #DIVU ' DIVU4\n" 5
reg:  DIVF4(reg,reg) "# jmp #FDIV ' DIVF4\n" 5

reg:  MODI4(reg,reg) "# jmp #DIVS ' MODI4\n" 5
reg:  MODU4(reg,reg) "# jmp #DIVU ' MODU4\n" 5

reg:  MULI4(reg,reg) "# jmp #MULT ' MULI4\n" 5
reg:  MULU4(reg,reg) "# jmp #MULT ' MULU4\n" 5
reg:  MULF4(reg,reg) "# jmp #FMUL ' MULF4\n" 5

reg:  LSHI4(reg,reg) "# mov RI, %0\n shl RI, %1\n mov %c, RI ' LSHI4 reg\n" 3
reg:  LSHU4(reg,reg) "# mov RI, %0\n shl RI, %1\n mov %c, RI ' LSHU4 reg\n" 3
 
reg:  LSHI4(reg,coni) "? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SHLI + (%c)<<D16A + (%1)<<S16A ' SHLI4 reg coni\n" 1
reg:  LSHU4(reg,coni) "? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SHLI + (%c)<<D16A + (%1)<<S16A ' SHLU4 reg coni\n" 1
 
reg:  RSHI4(reg,reg) "# mov RI, %0\n sar RI, %1\n mov %c, RI ' RSHI4 reg\n" 2
reg:  RSHU4(reg,reg) "# mov RI, %0\n shr RI, %1\n mov %c, RI ' RSHU4 reg\n" 2

reg:  RSHI4(reg,coni) "? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SARI + (%c)<<D16A + (%1)<<S16A ' SHRI4 reg coni\n" 1
reg:  RSHU4(reg,coni) "? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SHRI + (%c)<<D16A + (%1)<<S16A ' SHRU4 reg coni\n" 1
 

stmt: ASGNI4(special, reg)   " alignl_p1\n long I32_MOV + (%1)<<D32 + (%2)<<S32 ' ASGNI4 special reg\n" 1
stmt: ASGNU4(special, reg)   " alignl_p1\n long I32_MOV + (%1)<<D32 + (%2)<<S32 ' ASGNU4 special reg\n" 1

stmt: ASGNI4(special, BANDI4(INDIRI4(special),conli)) " word I16B_PASM \n alignl_p1\n and %0, #%2 ' ASGNI4 special BAND4 special conli\n" (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNU4(special, BANDU4(INDIRU4(special),conli)) " word I16B_PASM \n alignl_p1\n and %0, #%2 ' ASGNU4 special BAND4 special conli\n" (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNI4(special, BANDI4(INDIRI4(special),reg))   " word I16B_PASM \n alignl_p1\n and %0, %2 ' ASGNI4 special BAND4 special reg\n"   (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNU4(special, BANDU4(INDIRU4(special),reg))   " word I16B_PASM \n alignl_p1\n and %0, %2 ' ASGNU4 special BAND4 special reg\n"   (in_place_special(a) ? 0 : LBURG_MAX)

stmt: ASGNI4(special, BORI4(INDIRI4(special),conli))  " word I16B_PASM \n alignl_p1\n or %0, #%2 ' ASGNI4 special BOR4 special conli\n" (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNU4(special, BORU4(INDIRU4(special),conli))  " word I16B_PASM \n alignl_p1\n or %0, #%2 ' ASGNU4 special BOR4 special conli\n" (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNI4(special, BORI4(INDIRI4(special),reg))    " word I16B_PASM \n alignl_p1\n or %0, %2 ' ASGNI4 special BOR4 special reg\n"   (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNU4(special, BORU4(INDIRU4(special),reg))    " word I16B_PASM \n alignl_p1\n or %0, %2 ' ASGNU4 special BOR4 special reg\n"   (in_place_special(a) ? 0 : LBURG_MAX)

stmt: ASGNI4(special, BXORI4(INDIRI4(special),conli)) " word I16B_PASM \n alignl_p1\n xor %0, #%2 ' ASGNI4 special BXOR4 special conli\n" (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNU4(special, BXORU4(INDIRU4(special),conli)) " word I16B_PASM \n alignl_p1\n xor %0, #%2 ' ASGNU4 special BXOR4 special conli\n" (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNI4(special, BXORI4(INDIRI4(special),reg))   " word I16B_PASM \n alignl_p1\n xor %0, %2 ' ASGNI4 special BXOR4 special reg\n"   (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNU4(special, BXORU4(INDIRU4(special),reg))   " word I16B_PASM \n alignl_p1\n xor %0, %2 ' ASGNU4 special BXOR4 special reg\n"   (in_place_special(a) ? 0 : LBURG_MAX)

stmt: ASGNI4(special, SUBI4(INDIRI4(special),coni))   " word I16A_ADDSI (%0)<<D16A + (%2)<<S16A ' ASGNI4 special BADD4 special coni\n" (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNU4(special, SUBU4(INDIRU4(special),coni))   " word I16A_ADDI (%0)<<D16A + (%2)<<S16A ' ASGNU4 special BADD4 special coni\n"  (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNI4(special, ADDI4(INDIRI4(special),conli))  " word I16B_PASM \n alignl_p1\n adds %0, #%2 ' ASGNI4 special BADD4 special conli\n" (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNU4(special, ADDU4(INDIRU4(special),conli))  " word I16B_PASM \n alignl_p1\n add %0, #%2 ' ASGNU4 special BADD4 special conli\n"  (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNI4(special, ADDI4(INDIRI4(special),reg))    " word I16B_PASM \n alignl_p1\n adds %0, %2 ' ASGNI4 special BADD4 special reg\n"   (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNU4(special, ADDU4(INDIRU4(special),reg))    " word I16B_PASM \n alignl_p1\n add %0, %2 ' ASGNU4 special BADD4 special reg\n"    (in_place_special(a) ? 0 : LBURG_MAX)

stmt: ASGNI4(special, SUBI4(INDIRI4(special),coni))   " word I16A_SUBSI (%0)<<D16A + (%2)<<S16A ' ASGNI4 special BSUB4 special coni\n" (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNU4(special, SUBU4(INDIRU4(special),coni))   " word I16A_SUBI (%0)<<D16A + (%2)<<S16A ' ASGNU4 special BSUB4 special coni\n"  (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNI4(special, SUBI4(INDIRI4(special),conli))  " word I16B_PASM \n alignl_p1\n subs %0, #%2 ' ASGNI4 special BSUB4 special conli\n" (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNU4(special, SUBU4(INDIRU4(special),conli))  " word I16B_PASM \n alignl_p1\n sub %0, #%2 ' ASGNU4 special BSUB4 special conli\n"  (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNI4(special, SUBI4(INDIRI4(special),reg))    " word I16B_PASM \n alignl_p1\n subs %0, %2 ' ASGNI4 special BSUB4 special reg\n"   (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNU4(special, SUBU4(INDIRU4(special),reg))    " word I16B_PASM \n alignl_p1\n sub %0, %2 ' ASGNU4 special BSUB4 special reg\n"    (in_place_special(a) ? 0 : LBURG_MAX)

stmt: ASGNI4(special, LSHI4(INDIRI4(special),coni))   " word I16A_SHLI + (%0)<<D16A + (%2)<<S16A ' ASGNI4 special LSH4 special coni\n" (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNU4(special, LSHU4(INDIRU4(special),coni))   " word I16A_SHLI + (%0)<<D16A + (%2)<<S16A ' ASGNU4 special LSH4 special coni\n" (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNI4(special, LSHI4(INDIRI4(special),conli))  " word I16B_PASM \n alignl_p1\n shl %0, #%2 ' ASGNI4 special LSH4 special conli\n" (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNU4(special, LSHU4(INDIRU4(special),conli))  " word I16B_PASM \n alignl_p1\n shl %0, #%2 ' ASGNU4 special LSH4 special conli\n" (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNI4(special, LSHI4(INDIRI4(special),reg))    " word I16B_PASM \n alignl_p1\n shl %0, %2 ' ASGNI4 special LSH4 special reg\n"   (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNU4(special, LSHU4(INDIRU4(special),reg))    " word I16B_PASM \n alignl_p1\n shl %0, %2 ' ASGNU4 special LSH4 special reg\n"   (in_place_special(a) ? 0 : LBURG_MAX)

stmt: ASGNI4(special, RSHI4(INDIRI4(special),coni))   " word I16A_SHRI + (%0)<<D16A + (%2)<<S16A ' ASGNI4 special RSH4 special coni\n" (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNU4(special, RSHU4(INDIRU4(special),coni))   " word I16A_SHRI + (%0)<<D16A + (%2)<<S16A ' ASGNU4 special RSH4 special coni\n" (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNI4(special, RSHI4(INDIRI4(special),conli))  " word I16B_PASM \n alignl_p1\n shr %0, #%2 ' ASGNI4 special RSH4 special conli\n" (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNU4(special, RSHU4(INDIRU4(special),conli))  " word I16B_PASM \n alignl_p1\n shr %0, #%2 ' ASGNU4 special RSH4 special conli\n" (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNI4(special, RSHI4(INDIRI4(special),reg))    " word I16B_PASM \n alignl_p1\n shr %0, %2 ' ASGNI4 special RSH4 special reg\n"   (in_place_special(a) ? 0 : LBURG_MAX)
stmt: ASGNU4(special, RSHU4(INDIRU4(special),reg))    " word I16B_PASM \n alignl_p1\n shr %0, %2 ' ASGNU4 special RSH4 special reg\n"   (in_place_special(a) ? 0 : LBURG_MAX)

stmt: EQI4(reg,reg)  " word I16A_CMPS + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BR_Z + (@%a)<<S32 ' EQI4 reg reg\n" 11
stmt: EQU4(reg,reg)  " word I16A_CMP + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BR_Z + (@%a)<<S32 ' EQU4 reg reg\n" 11
stmt: EQF4(reg,reg)  "# jmp #FCMP\n jmp #BR_Z\n long (@%a) ' EQF4 reg reg\n" 15

stmt: NEI4(reg,reg)  " word I16A_CMPS + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BRNZ + (@%a)<<S32 ' NEI4 reg reg\n" 11
stmt: NEU4(reg,reg)  " word I16A_CMP + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BRNZ + (@%a)<<S32 ' NEU4 reg reg\n" 11
stmt: NEF4(reg,reg)  "# jmp #FCMP\n jmp #BRNZ\n long (@%a) ' NEF4 reg reg\n" 15

stmt: GEI4(reg,reg)  " word I16A_CMPS + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BRAE + (@%a)<<S32 ' GEI4 reg reg\n" 11
stmt: GEU4(reg,reg)  " word I16A_CMP + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BRAE + (@%a)<<S32 ' GEU4 reg reg\n" 11
stmt: GEF4(reg,reg)  "# jmp #FCMP\n jmp #BRAE\n long (@%a) ' GEF4 reg reg\n" 15

stmt: GTI4(reg,reg)  " word I16A_CMPS + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BR_A + (@%a)<<S32 ' GTI4 reg reg\n" 11
stmt: GTU4(reg,reg)  " word I16A_CMP + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BR_A + (@%a)<<S32 ' GTU4 reg reg\n" 11
stmt: GTF4(reg,reg)  "# jmp #FCMP\n jmp #BR_A\n long (@%a) ' GTF4 reg reg\n" 15

stmt: LEI4(reg,reg)  " word I16A_CMPS + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BRBE + (@%a)<<S32 ' LEI4 reg reg\n" 11
stmt: LEU4(reg,reg)  " word I16A_CMP + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BRBE + (@%a)<<S32 ' LEU4 reg reg\n" 11
stmt: LEF4(reg,reg)  "# jmp #FCMP\n jmp #BRBE\n long (@%a) '  LEF4 reg reg\n" 15

stmt: LTI4(reg,reg)  " word I16A_CMPS + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BR_B + (@%a)<<S32 ' LTI4 reg reg\n" 11
stmt: LTU4(reg,reg)  " word I16A_CMP + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BR_B + (@%a)<<S32 ' LTU4 reg reg\n" 11
stmt: LTF4(reg,reg)  "# jmp #FCMP\n jmp #BR_B\n long (@%a) ' LTF4 reg reg\n" 15


stmt: EQI4(reg,coni)  " word I16A_CMPSI + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BR_Z + (@%a)<<S32 ' EQI4 reg coni\n" 3
stmt: EQU4(reg,coni)  " word I16A_CMPI + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BR_Z + (@%a)<<S32 ' EQU4 reg coni\n" 3

stmt: NEI4(reg,coni)  " word I16A_CMPSI + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BRNZ + (@%a)<<S32 ' NEI4 reg coni\n" 3
stmt: NEU4(reg,coni)  " word I16A_CMPI + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BRNZ + (@%a)<<S32 ' NEU4 reg coni\n" 3

stmt: GEI4(reg,coni)  " word I16A_CMPSI + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BRAE + (@%a)<<S32 ' GEI4 reg coni\n" 3
stmt: GEU4(reg,coni)  " word I16A_CMPI + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BRAE + (@%a)<<S32 ' GEU4 reg coni\n" 3

stmt: GTI4(reg,coni)  " word I16A_CMPSI + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BR_A + (@%a)<<S32 ' GTI4 reg coni\n" 3
stmt: GTU4(reg,coni)  " word I16A_CMPI + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BR_A + (@%a)<<S32 ' GTU4 reg coni\n" 3

stmt: LEI4(reg,coni)  " word I16A_CMPSI + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BRBE + (@%a)<<S32 ' LEI4 reg coni\n" 3
stmt: LEU4(reg,coni)  " word I16A_CMPI + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BRBE + (@%a)<<S32 ' LEU4 reg coni\n" 3

stmt: LTI4(reg,coni)  " word I16A_CMPSI + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BR_B + (@%a)<<S32 ' LTI4 reg coni\n" 3
stmt: LTU4(reg,coni)  " word I16A_CMPI + (%0)<<D16A + (%1)<<S16A\n alignl_p1\n long I32_BR_B + (@%a)<<S32 ' LTU4 reg coni\n" 3

stmt: EQI4(reg,conli)  " alignl_p1\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMPS + (%0)<<D16A + RI<<S16A\n alignl_p1\n long I32_BR_Z + (@%a)<<S32 ' EQI4 reg coni\n" 3
stmt: EQU4(reg,conli)  " alignl_p1\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMP + (%0)<<D16A + RI<<S16A\n alignl_p1\n long I32_BR_Z + (@%a)<<S32 ' EQU4 reg coni\n" 3

stmt: NEI4(reg,conli)  " alignl_p1\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMPS + (%0)<<D16A + RI<<S16A\n alignl_p1\n long I32_BRNZ + (@%a)<<S32 ' NEI4 reg coni\n" 3
stmt: NEU4(reg,conli)  " alignl_p1\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMP + (%0)<<D16A + RI<<S16A\n alignl_p1\n long I32_BRNZ + (@%a)<<S32 ' NEU4 reg coni\n" 3

stmt: GEI4(reg,conli)  " alignl_p1\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMPS + (%0)<<D16A + RI<<S16A\n alignl_p1\n long I32_BRAE + (@%a)<<S32 ' GEI4 reg coni\n" 3
stmt: GEU4(reg,conli)  " alignl_p1\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMP + (%0)<<D16A + RI<<S16A\n alignl_p1\n long I32_BRAE + (@%a)<<S32 ' GEU4 reg coni\n" 3

stmt: GTI4(reg,conli)  " alignl_p1\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMPS + (%0)<<D16A + RI<<S16A\n alignl_p1\n long I32_BR_A + (@%a)<<S32 ' GTI4 reg coni\n" 3
stmt: GTU4(reg,conli)  " alignl_p1\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMP + (%0)<<D16A + RI<<S16A\n alignl_p1\n long I32_BR_A + (@%a)<<S32 ' GTU4 reg coni\n" 3

stmt: LEI4(reg,conli)  " alignl_p1\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMPS + (%0)<<D16A + RI<<S16A\n alignl_p1\n long I32_BRBE + (@%a)<<S32 ' LEI4 reg coni\n" 3
stmt: LEU4(reg,conli)  " alignl_p1\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMP + (%0)<<D16A + RI<<S16A\n alignl_p1\n long I32_BRBE + (@%a)<<S32 ' LEU4 reg coni\n" 3

stmt: LTI4(reg,conli)  " alignl_p1\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMPS + (%0)<<D16A + RI<<S16A\n alignl_p1\n long I32_BR_B + (@%a)<<S32 ' LTI4 reg coni\n" 3
stmt: LTU4(reg,conli)  " alignl_p1\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMP + (%0)<<D16A + RI<<S16A\n alignl_p1\n long I32_BR_B + (@%a)<<S32 ' LTU4 reg coni\n" 3

stmt: ARGB(INDIRB(reg))   "# ARGB\n"
stmt: ASGNB(reg, INDIRB(reg))  "# ASGNB\n"

stmt:  JUMPV(INDIRP4(addrl16))  " word I16A_RDLONG + RI<<D16A + (%0)<<S16A\n word I16B_JMPI ' JUMPV INDIR addrl16\n alignl_p1\n"  6
stmt:  JUMPV(INDIRP4(addrl32))  " word I16A_RDLONG + RI<<D16A + (%0)<<S16A\n word I16B_JMPI ' JUMPV INDIR addrl32\n alignl_p1\n"  6
stmt:  JUMPV(INDIRP4(addrg))  " word I16A_RDLONG + RI<<D16A + (%0)<<S16A\n word I16B_JMPI ' JUMPV INDIR addrg\n alignl_p1\n"  6
stmt:  JUMPV(INDIRP4(reg))    " word I16A_RDLONG + RI<<D16A + (%0)<<S16A\n word I16B_JMPI ' JUMPV INDIR reg\n alignl_p1\n" 6
stmt:  JUMPV(addrg)           " alignl_p1\n long I32_JMPA + (@%0)<<S32 ' JUMPV addrg\n" 6

stmt:  LABELV "# %a\n"

stmt: ARGI4(con)  "# jmp #LODL\n long %0\n jmp #PSHL ' ARGI4 addrg\n"  1
stmt: ARGU4(con)  "# jmp #LODL\n long %0\n jmp #PSHL ' ARGU4 addrg\n"  1
stmt: ARGP4(con)  "# jmp #LODL\n long %0\n jmp #PSHL ' ARGP4 addrg\n"  1
stmt: ARGF4(con)  "# jmp #LODL\n long %0\n jmp #PSHL ' ARGF4 addrg\n"  1

stmt: ARGI4(coni)  "# mov RI, #%0\n jmp #PSHL ' ARGI4\n"  1
stmt: ARGU4(coni)  "# mov RI, #%0\n jmp #PSHL ' ARGU4\n"  1
stmt: ARGP4(coni)  "# mov RI, #%0\n jmp #PSHL ' ARGP4\n"  1
stmt: ARGF4(coni)  "# mov RI, #%0\n jmp #PSHL ' ARGF4\n"  1

stmt: ARGI4(reg)  "# mov RI, %0\n jmp #PSHL ' ARGI4\n"  1
stmt: ARGU4(reg)  "# mov RI, %0\n jmp #PSHL ' ARGU4\n"  1
stmt: ARGP4(reg)  "# mov RI, %0\n jmp #PSHL ' ARGP4\n"  1
stmt: ARGF4(reg)  "# mov RI, %0\n jmp #PSHL ' ARGF4\n"  1

stmt: ARGI4(ADDRGP4)  "# jmp #LODL\n long @%0\n jmp #PSHL ' ARGI4 ADDRGP4\n"  1
stmt: ARGU4(ADDRGP4)  "# jmp #LODL\n long @%0\n jmp #PSHL ' ARGU4 ADDRGP4\n"  1
stmt: ARGP4(ADDRGP4)  "# jmp #LODL\n long @%0\n jmp #PSHL ' ARGP4 ADDRGP4\n"  1
stmt: ARGF4(ADDRGP4)  "# jmp #LODL\n long @%0\n jmp #PSHL ' ARGF4 ADDRGP4\n"  1

stmt: ARGI4(ADDRLP4)  "# jmp #LODF\n long %0\n jmp #PSHL ' ARGI4 ADDRLP4\n"  1
stmt: ARGU4(ADDRLP4)  "# jmp #LODF\n long %0\n jmp #PSHL ' ARGU4 ADDRLP4\n"  1
stmt: ARGP4(ADDRLP4)  "# jmp #LODF\n long %0\n jmp #PSHL ' ARGP4 ADDRLP4\n"  1
stmt: ARGF4(ADDRLP4)  "# jmp #LODF\n long %0\n jmp #PSHL ' ARGF4 ADDRLP4\n"  1

stmt: ARGI4(ADDRFP4)  "# jmp #LODF\n long %0\n jmp #PSHL ' ARGI4 ADDRFP4\n"  1
stmt: ARGU4(ADDRFP4)  "# jmp #LODF\n long %0\n jmp #PSHL ' ARGU4 ADDRFP4\n"  1
stmt: ARGP4(ADDRFP4)  "# jmp #LODF\n long %0\n jmp #PSHL ' ARGP4 ADDRFP4\n"  1
stmt: ARGF4(ADDRFP4)  "# jmp #LODF\n long %0\n jmp #PSHL ' ARGF4 ADDRFP4\n"  1

stmt: ARGI4(INDIRI4(ADDRGP4))  "# jmp #PSHA\n long @%0 ' ARGI4 INDIRI4 ADDRGP4\n"  1
stmt: ARGU4(INDIRU4(ADDRGP4))  "# jmp #PSHA\n long @%0 ' ARGU4 INDIRU4 ADDRGP4\n"  1
stmt: ARGP4(INDIRP4(ADDRGP4))  "# jmp #PSHA\n long @%0 ' ARGP4 INDIRP4 ADDRGP4\n"  1
stmt: ARGF4(INDIRF4(ADDRGP4))  "# jmp #PSHA\n long @%0 ' ARGF4 INDIRF4 ADDRGP4\n"  1

stmt: ARGI4(INDIRI4(ADDRLP4))  "# jmp #PSHF\n long %0 ' ARGI4 INDIRI4 ADDRLP4\n"  1
stmt: ARGU4(INDIRU4(ADDRLP4))  "# jmp #PSHF\n long %0 ' ARGU4 INDIRU4 ADDRLP4\n"  1
stmt: ARGP4(INDIRP4(ADDRLP4))  "# jmp #PSHF\n long %0 ' ARGP4 INDIRP4 ADDRLP4\n"  1
stmt: ARGF4(INDIRF4(ADDRLP4))  "# jmp #PSHF\n long %0 ' ARGF4 INDIRF4 ADDRLP4\n"  1

stmt: ARGI4(INDIRI4(ADDRFP4))  "# jmp #PSHF\n long %0 ' ARGI4 INDIRI4 ADDRFP4\n"  1
stmt: ARGU4(INDIRU4(ADDRFP4))  "# jmp #PSHF\n long %0 ' ARGU4 INDIRU4 ADDRFP4\n"  1
stmt: ARGP4(INDIRP4(ADDRFP4))  "# jmp #PSHF\n long %0 ' ARGP4 INDIRP4 ADDRFP4\n"  1
stmt: ARGF4(INDIRF4(ADDRFP4))  "# jmp #PSHF\n long %0 ' ARGF4 INDIRF4 ADDRFP4\n"  1


%%

/*

NOTES: removed due to lack of encode/decode operators in p2asm:

con2: CNSTI1  "%a"  (power_of_2(a)?0:LBURG_MAX)
con2: CNSTI2  "%a"  (power_of_2(a)?0:LBURG_MAX)
con2: CNSTI4  "%a"  (power_of_2(a)?0:LBURG_MAX)
con2: CNSTU1  "%a"  (power_of_2(a)?0:LBURG_MAX)
con2: CNSTU2  "%a"  (power_of_2(a)?0:LBURG_MAX)
con2: CNSTU4  "%a"  (power_of_2(a)?0:LBURG_MAX)

con2x: CNSTI1  "%a"  (power_of_2_greater_than_31(a)?0:LBURG_MAX)
con2x: CNSTI2  "%a"  (power_of_2_greater_than_31(a)?0:LBURG_MAX)
con2x: CNSTI4  "%a"  (power_of_2_greater_than_31(a)?0:LBURG_MAX)
con2x: CNSTU1  "%a"  (power_of_2_greater_than_31(a)?0:LBURG_MAX)
con2x: CNSTU2  "%a"  (power_of_2_greater_than_31(a)?0:LBURG_MAX)
con2x: CNSTU4  "%a"  (power_of_2_greater_than_31(a)?0:LBURG_MAX)

reg: con2x " word I16A_MOVI + (%c)<<D16A + 1<<S16A\n word I16A_SHLI + (%c)<<D16A + ((>|%0)-1)<<S16A ' reg <- con2 (power of 2 and > 31)\n" 8

reg:  DIVU4(reg,con2) " word I16A_MOV + r0<<D16A + (%0)<<S16A\n word I16A_SHRI + (r0)<<D16A + ((>|%1)-1)<<S16A ' DIVU4 (power of 2)\n" 5

reg:  MULI4(reg,con2) " word I16A_MOV + r0<<D16A + (%0)<<S16A\n word I16A_SHLI + (r0)<<D16A + ((>|%1)-1)<<S16A ' MULI4 (power of 2)\n" 5
reg:  MULU4(reg,con2) " word I16A_MOV + r0<<D16A + (%0)<<S16A\n word I16A_SHLI + (r0)<<D16A + ((>|%1)-1)<<S16A ' MULU4 (power of 2)\n" 5

*/

static int memop(Node p) {
    assert( p && generic(p->op) == ASGN );
    assert( p->kids[0] && p->kids[1] && p->kids[1]->kids[0] );
    if (generic(p->kids[1]->kids[0]->op) == INDIR
    && sametree(p->kids[0], p->kids[1]->kids[0]->kids[0]))
        return 1;
    else
        return LBURG_MAX;
}

static int sametree(Node p, Node q) {
    return (p == NULL && q == NULL)
        || (p && q && p->op == q->op && p->syms[0] == q->syms[0]
            && sametree(p->kids[0], q->kids[0])
            && sametree(p->kids[1], q->kids[1]));
}

static void dumptree(Node p) {
   switch (specific(p->op)) {
   case ASGN+B:
      assert(p->kids[0]);
      assert(p->kids[1]);
      assert(p->syms[0]);
      dumptree(p->kids[0]);
      dumptree(p->kids[1]);
      print("' %s %d\n", opname(p->op), p->syms[0]->u.c.v.u);
      return;
   case RET+V:
      assert(!p->kids[0]);
      assert(!p->kids[1]);
      print("' %s\n", opname(p->op));
      return;
   case VREG+P:
      print("' VREGP %s %s\n", p->syms[0]->name, p->syms[0]->x.name);
      return;
   }
   switch (generic(p->op)) {
   case LOAD:
      if (p->kids[0]) {
         dumptree(p->kids[0]);
      }
      if (p->kids[1]) {
         dumptree(p->kids[1]);
      }
      print("' %s\n", opname(p->op));
      return;
   case CNST: case ADDRG: case ADDRF: case ADDRL: case LABEL:
      assert(!p->kids[0]);
      assert(!p->kids[1]);
      assert(p->syms[0] && p->syms[0]->x.name);
      print("' %s %s\n", opname(p->op), p->syms[0]->x.name);
      return;
   case CVF: case CVI: case CVP: case CVU:
      assert(p->kids[0]);
      assert(!p->kids[1]);
      assert(p->syms[0]);
      dumptree(p->kids[0]);
      print("' %s %d\n", opname(p->op), p->syms[0]->u.c.v.i);
      return;
   case ARG:
      assert(p->kids[0]);
      assert(!p->kids[1]);
      dumptree(p->kids[0]);
      print("' %s\n", opname(p->op));
      return;
   case BCOM: case NEG: case INDIR: case JUMP: case RET:
      assert(p->kids[0]);
      assert(!p->kids[1]);
      dumptree(p->kids[0]);
      print("' %s\n", opname(p->op));
      return;
   case CALL:
      assert(p->kids[0]);
      assert(!p->kids[1]);
      assert(optype(p->op) != B);
      dumptree(p->kids[0]);
      print("' %s\n", opname(p->op));
      return;
   case ASGN: case BOR: case BAND: case BXOR: case RSH: case LSH:
   case ADD: case SUB: case DIV: case MUL: case MOD:
      assert(p->kids[0]);
      assert(p->kids[1]);
      dumptree(p->kids[0]);
      dumptree(p->kids[1]);
      print("' %s\n", opname(p->op));
      return;
   case EQ: case NE: case GT: case GE: case LE: case LT:
      assert(p->kids[0]);
      assert(p->kids[1]);
      assert(p->syms[0]);
      assert(p->syms[0]->x.name);
      dumptree(p->kids[0]);
      dumptree(p->kids[1]);
      print("' %s %s\n", opname(p->op), p->syms[0]->x.name);
      return;
   }
   printf("' unknown node type %d\n", p->op);
}

static int special_name(char *name) {
  if ((strcmp(name, "PAR") == 0) 
  ||  (strcmp(name, "CNT") == 0)
  ||  (strcmp(name, "INA") == 0)
  ||  (strcmp(name, "INB") == 0)
  ||  (strcmp(name, "OUTA") == 0)
  ||  (strcmp(name, "OUTB") == 0)
  ||  (strcmp(name, "DIRA") == 0)
  ||  (strcmp(name, "DIRB") == 0)
  ||  (strcmp(name, "_PAR") == 0) 
  ||  (strcmp(name, "_CNT") == 0)
  ||  (strcmp(name, "_INA") == 0)
  ||  (strcmp(name, "_INB") == 0)
  ||  (strcmp(name, "_OUTA") == 0)
  ||  (strcmp(name, "_OUTB") == 0)
  ||  (strcmp(name, "_DIRA") == 0)
  ||  (strcmp(name, "_DIRB") == 0)

  ||  (strcmp(name, "CTRA") == 0)
  ||  (strcmp(name, "CTRB") == 0)
  ||  (strcmp(name, "FRQA") == 0)
  ||  (strcmp(name, "FRQB") == 0)
  ||  (strcmp(name, "PHSA") == 0)
  ||  (strcmp(name, "PHSB") == 0)
  ||  (strcmp(name, "VCFG") == 0)
  ||  (strcmp(name, "VSCL") == 0)
  ||  (strcmp(name, "_CTRA") == 0)
  ||  (strcmp(name, "_CTRB") == 0)
  ||  (strcmp(name, "_FRQA") == 0)
  ||  (strcmp(name, "_FRQB") == 0)
  ||  (strcmp(name, "_PHSA") == 0)
  ||  (strcmp(name, "_PHSB") == 0)
  ||  (strcmp(name, "_VCFG") == 0)
  ||  (strcmp(name, "_VSCL") == 0)

  ||  (strcmp(name, "IJMP3") == 0)
  ||  (strcmp(name, "IRET3") == 0)
  ||  (strcmp(name, "IJMP2") == 0)
  ||  (strcmp(name, "IRET2") == 0)
  ||  (strcmp(name, "IJMP1") == 0)
  ||  (strcmp(name, "IRET1") == 0)
  ||  (strcmp(name, "PA"   ) == 0)
  ||  (strcmp(name, "PB"   ) == 0)
  ||  (strcmp(name, "PTRA" ) == 0)
  ||  (strcmp(name, "PTRB" ) == 0)
  ||  (strcmp(name, "_IJMP3") == 0)
  ||  (strcmp(name, "_IRET3") == 0)
  ||  (strcmp(name, "_IJMP2") == 0)
  ||  (strcmp(name, "_IRET2") == 0)
  ||  (strcmp(name, "_IJMP1") == 0)
  ||  (strcmp(name, "_IRET1") == 0)
  ||  (strcmp(name, "_PA"   ) == 0)
  ||  (strcmp(name, "_PB"   ) == 0)
  ||  (strcmp(name, "_PTRA" ) == 0)
  ||  (strcmp(name, "_PTRB" ) == 0)) {
     return 1;
  }
  return 0;
}

static int special(Node p) {
  if ((generic(p->op) == ADDRG) && (p->syms[0]) && (p->syms[0]->type)) {
     if (special_name(p->syms[0]->name)) {
        if ((p->syms[0]->sclass == EXTERN) && isvolatile(p->syms[0]->type)) {
           p->syms[0]->x.name = strdup(p->syms[0]->name);
           p->syms[0]->defined = 1;
           return 1;
        }
     }
  }
  return 0;
}

static int power_of_2(Node p) {
   long unsigned int i = strtoul(p->syms[0]->name, NULL, 0);
   if ((i > 0) && ((i & (~i + 1)) == i)) {
      return 1;
   }
   else {
      return 0;
   }
}

static int power_of_2_greater_than_31(Node p) {
   long unsigned int i = strtoul(p->syms[0]->name, NULL, 0);
   if ((i > 31) && ((i & (~i + 1)) == i)) {
      return 1;
   }
   else {
      return 0;
   }
}

static int in_place_special(Node p) {
  char *vreg0;
  char *vreg1;
  char *name0; 
  char *name1;

  /* not sure exactly how much of this checking is necessary, but ... */

  if (p->kids[0] 
  &&  p->kids[0]->kids[0]
  &&  p->kids[0]->kids[0]->syms[0] 
  &&  p->kids[0]->kids[0]->syms[0]->name 
  &&  p->kids[0]->kids[0]->syms[0]->temporary 
  &&  p->kids[0]->kids[0]->syms[0]->u.t.cse
  &&  p->kids[0]->kids[0]->syms[0]->u.t.cse->syms[0]
  &&  p->kids[0]->kids[0]->syms[0]->u.t.cse->syms[0]->name
  &&  p->kids[1] 
  &&  p->kids[1]->kids[0]
  &&  p->kids[1]->kids[0]->kids[0] 
  &&  p->kids[1]->kids[0]->kids[0]->kids[0]
  &&  p->kids[1]->kids[0]->kids[0]->kids[0]->syms[0]
  &&  p->kids[1]->kids[0]->kids[0]->kids[0]->syms[0]->name
  &&  p->kids[1]->kids[0]->kids[0]->kids[0]->syms[0]->temporary
  &&  p->kids[1]->kids[0]->kids[0]->kids[0]->syms[0]->u.t.cse
  &&  p->kids[1]->kids[0]->kids[0]->kids[0]->syms[0]->u.t.cse->syms[0]
  &&  p->kids[1]->kids[0]->kids[0]->kids[0]->syms[0]->u.t.cse->syms[0]->name) {

     vreg0 = p->kids[0]->kids[0]->syms[0]->name;
     vreg1 = p->kids[1]->kids[0]->kids[0]->kids[0]->syms[0]->name;

     name0 = p->kids[0]->kids[0]->syms[0]->u.t.cse->syms[0]->name;
     name1 = p->kids[1]->kids[0]->kids[0]->kids[0]->syms[0]->u.t.cse->syms[0]->name;

     if (strcmp(vreg0, vreg1) == 0) {

        /* statement of form x = x op y (or x op= y), so see if x is special */
        if (special_name(name0)) {
           return 1;
        }
     }
  }
  return 0;
}

static int ntypes;

static char *stabprefix = "L__";
static char stablabel[MAX_PATHNAME_LENGTH + 6 + 1];

static char *currentfile;
static int prevline;

static void my_stabinit(char *, int, char *[]);
static void my_stabline(Coordinate *);
static void my_stabsym(Symbol);


#ifdef DEBUGGER_SUPPORT

extern char *stabprefix;

extern int glevel;

static FILE *debug_file = NULL;

static void asgncode(Type, int);
static void dbxout(Type);
static int dbxtype(Type);
static int emittype(Type, int, int);

static void my_stabtype(Symbol);

/* asgncode - assign type code to ty */
static void asgncode(Type ty, int lev) {
   if (ty->x.marked || ty->x.typeno)
      return;
   ty->x.marked = 1;
   switch (ty->op) {
   case VOLATILE: case CONST: case VOLATILE+CONST:
      asgncode(ty->type, lev);
      ty->x.typeno = ty->type->x.typeno;
      break;
   case POINTER: case FUNCTION: case ARRAY:
      asgncode(ty->type, lev + 1);
      /* fall thru */
   case VOID: case INT: case UNSIGNED: case FLOAT:
      break;
   case STRUCT: case UNION: {
      Field p;
      for (p = fieldlist(ty); p; p = p->link)
         asgncode(p->type, lev + 1);
      /* fall thru */
   case ENUM:
      if (ty->x.typeno == 0)
         ty->x.typeno = ++ntypes;
      if (lev > 0 && (*ty->u.sym->name < '0' || *ty->u.sym->name > '9'))
         dbxout(ty);
      break;
      }
   default:
      assert(0);
   }
}

/* dbxout - output .stabs entry for type ty */
static void dbxout(Type ty) {
   ty = unqual(ty);
   if (!ty->x.printed) {
      int col = 0;
      fprintf(debug_file, ".stabs \""), col += 8;
      if (ty->u.sym && !(isfunc(ty) || isarray(ty) || isptr(ty)))
         fprintf(debug_file, "%s", ty->u.sym->name), col += strlen(ty->u.sym->name);
      fprintf(debug_file, ":%c", isstruct(ty) || isenum(ty) ? 'T' : 't'), col += 2;
      emittype(ty, 0, col);
      fprintf(debug_file, "\",%d,0,0,0\n", N_LSYM);
   }
}

/* dbxtype - emit a stabs entry for type ty, return type code */
static int dbxtype(Type ty) {
   asgncode(ty, 0);
   dbxout(ty);
   return ty->x.typeno;
}

/*
 * emittype - emit ty's type number, emitting its definition if necessary.
 * Returns the output column number after emission; col is the approximate
 * output column before emission and is used to emit continuation lines for long
 * struct, union, and enum types. Continuations are not emitted for other types,
 * even if the definition is long. lev is the depth of calls to emittype.
 */
static int emittype(Type ty, int lev, int col) {
   int tc = ty->x.typeno;

   if (isconst(ty) || isvolatile(ty)) {
      col = emittype(ty->type, lev, col);
      ty->x.typeno = ty->type->x.typeno;
      ty->x.printed = 1;
      return col;
   }
   if (tc == 0) {
      ty->x.typeno = tc = ++ntypes;
/*              fprint(2,"`%t'=%d\n", ty, tc); */
   }
   fprintf(debug_file, "%d", tc), col += 3;
   if (ty->x.printed)
      return col;
   if (lev == 0) {
      ty->x.printed = 1;
   }
   switch (ty->op) {
   case VOID:   /* void is defined as itself */
      fprintf(debug_file, "=%d", tc), col += 1+3;
      break;
   case INT:
      if (ty == chartype)   /* plain char is a subrange of itself */
         fprintf(debug_file, "=r%d;%ld;%ld;", tc, ty->u.sym->u.limits.min.i, ty->u.sym->u.limits.max.i),
            col += 2+3+2*2.408*ty->size+2;
      else         /* other signed ints are subranges of int */
         fprintf(debug_file, "=r1;%ld;%ld;", ty->u.sym->u.limits.min.i, ty->u.sym->u.limits.max.i),
            col += 4+2*2.408*ty->size+2;
      break;
   case UNSIGNED:
      if (ty == chartype)   /* plain char is a subrange of itself */
         fprintf(debug_file, "=r%d;0;%lu;", tc, ty->u.sym->u.limits.max.i),
            col += 2+3+2+2.408*ty->size+1;
      else         /* other signed ints are subranges of int */
         fprintf(debug_file, "=r1;0;%lu;", ty->u.sym->u.limits.max.i),
            col += 4+2.408*ty->size+1;
      break;
   case FLOAT:   /* float, double, long double get sizes, not ranges */
      fprintf(debug_file, "=r1;%d;0;", ty->size), col += 4+1+3;
      break;
   case POINTER:
      fprintf(debug_file, "=*"), col += 2;
      col = emittype(ty->type, lev + 1, col);
      break;
   case FUNCTION:
      fprintf(debug_file, "=f"), col += 2;
      col = emittype(ty->type, lev + 1, col);
      break;
   case ARRAY:   /* array includes subscript as an int range */
      if (ty->size && ty->type->size)
         fprintf(debug_file, "=ar1;0;%d;", ty->size/ty->type->size - 1), col += 7+3+1;
      else
         fprintf(debug_file, "=ar1;0;-1;"), col += 10;
      col = emittype(ty->type, lev + 1, col);
      break;
   case STRUCT: case UNION: {
      Field p;
      if (!ty->u.sym->defined) {
         fprintf(debug_file, "=x%c%s:", ty->op == STRUCT ? 's' : 'u', ty->u.sym->name);
         col += 2+1+strlen(ty->u.sym->name)+1;
         break;
      }
      if (lev > 0 && (*ty->u.sym->name < '0' || *ty->u.sym->name > '9')) {
         ty->x.printed = 0;
         break;
      }
      fprintf(debug_file, "=%c%d", ty->op == STRUCT ? 's' : 'u', ty->size), col += 1+1+3;
      for (p = fieldlist(ty); p; p = p->link) {
         if (p->name)
            fprintf(debug_file, "%s:", p->name), col += strlen(p->name)+1;
         else
            fprintf(debug_file, ":"), col += 1;
         col = emittype(p->type, lev + 1, col);
         if (p->lsb)
            fprintf(debug_file, ",%d,%d;", 8*p->offset +
               (IR->little_endian ? fieldright(p) : fieldleft(p)),
               fieldsize(p));
         else
            fprintf(debug_file, ",%d,%d;", 8*p->offset, 8*p->type->size);
         col += 1+3+1+3+1;   /* accounts for ,%d,%d; */
         if (col >= 80 && p->link) {
            fprintf(debug_file, "\\\\\",%d,0,0,0\n.stabs \"", N_LSYM);
            col = 8;
         }
      }
      fprintf(debug_file, ";"), col += 1;
      break;
      }
   case ENUM: {
      Symbol *p;
      if (lev > 0 && (*ty->u.sym->name < '0' || *ty->u.sym->name > '9')) {
         ty->x.printed = 0;
         break;
      }
      fprintf(debug_file, "=e"), col += 2;
      for (p = ty->u.sym->u.idlist; *p; p++) {
         fprintf(debug_file, "%s:%d,", (*p)->name, (*p)->u.value), col += strlen((*p)->name)+3;
         if (col >= 80 && p[1]) {
            fprintf(debug_file, "\\\\\",%d,0,0,0\n.stabs \"", N_LSYM);
            col = 8;
         }
      }
      fprintf(debug_file, ";"), col += 1;
      break;
      }
   default:
      assert(0);
   }
   return col;
}

/* my_stabblock - output a stab entry for '{' or '}' at level lev */
static void my_stabblock(int brace, int lev, Symbol *p) {
   int lab;
   if (brace == '{')
      while (*p)
         my_stabsym(*p++);
    lab = genlabel(1);
     fprintf(debug_file, ".stabn 0x%x,0,%d,%s%s_%d-%s\n", 
      brace == '{' ? N_LBRAC : N_RBRAC, lev,
        stabprefix, stablabel, lab, cfunc->x.name);
     printf("%s%s_%d\n\n", stabprefix, stablabel, lab);
}

/* my_stabinit - initialize stab output */
static void my_stabinit(char *file, int argc, char *argv[]) {
   typedef void (*Closure)(Symbol, void *);
   extern char *getcwd(char *, size_t);

   char debug_filename[MAX_PATHNAME_LENGTH + 6 + 1 + 1];
   char debug_path[MAX_PATHNAME_LENGTH + 1 + 1];
   int i, j;
   int len;

   if (file) {
      print("' file \"%s\"\n", file);
      currentfile = file;
   }

   /* default debug path is current working directory */
   getcwd(debug_path, sizeof debug_path);
#ifdef DEBUG_IN_OUTPUT_PATH   
   /* now look for any overriding '-o', and (if found) extract the output path */
   for (i = 0; i < argc; i++) {
      /* search for any '-o' option */
      if (strncmp (argv[i], "-o", 2) == 0) {
         if (strlen(argv[i]) == 2) {
            /* use next arg */
            strncpy(debug_path, (argv[++i]), MAX_PATHNAME_LENGTH);
         }
         else {
            /* use remainder of this arg */
            strncpy(debug_path, &argv[i][2], MAX_PATHNAME_LENGTH);
         }
         /* we use only the directory portion - i.e. remove the final filename */
         for (j = strlen(debug_path) - 1; j > 0; j--) {
            if (debug_path[j] == PATH_SEPARATOR) {
               debug_path[j + 1] = '\0';
               break;
            }
         }
         if (j == 0) {
            /* no directory portion specified  */
            debug_path[0] = '\0';
         }
         break;
      }
   }
#endif   
   len = strlen(debug_path); 
   if (debug_path[0] == '\"') {
      /* remove leading quote */
      for (i = 0; i < len - 1; i++) {
         debug_path[i] = debug_path[i + 1];
      }
      debug_path[i] = '\0';
      len--;
   }
   if ((len  > 0) && debug_path[len - 1] != PATH_SEPARATOR) {
      /* add terminating path separator */
      debug_path[len] = PATH_SEPARATOR;
      debug_path[len + 1] = '\0';
      len++;
   }
#ifdef DIAGNOSTIC 
   fprintf(stderr, "debug_path = %s\n", debug_path);
#endif   

   /* default debug filename is current filename, but with the */
   /* '.c' extension replaced with '.debug' */
   strncpy (debug_filename, file, MAX_PATHNAME_LENGTH);
   len = strlen(debug_filename);
   if ((len > 2) && strcmp(&debug_filename[len-2],".c") == 0) {
      debug_filename[len-2]='\0';
   }
   strcat(debug_filename,".debug");
   if (debug_file != NULL) {
      fclose(debug_file);
   }
   /* use only filename portion - i.e. find last path separator */
   for (j = strlen(debug_filename) - 1; j > 0; j--) {
      if (debug_filename[j] == PATH_SEPARATOR) {
         j++;
         break;
      }
   }

   /* combine output path name with debug filename */
#ifdef DIAGNOSTIC
   fprintf(stderr, "debug_filename = %s\n", &debug_filename[j]);
#endif   
   strcat(debug_path, &debug_filename[j]);

   debug_file = fopen(debug_path, "w");

   fprintf(debug_file, ".stabs \"lcc4_compiled, debug=%d.\",0x%x,0,0,0\n", glevel, N_OPT);
   if (file && *file) {
      char buf[MAX_PATHNAME_LENGTH], *cwd = getcwd(buf, sizeof buf);
      int i;
      int j;
      char c;
      len = strlen(file);
      if (len > MAX_PATHNAME_LENGTH) {
         len = MAX_PATHNAME_LENGTH;
      }
      i = 0;
      j = 0;
      while ((i < len) && (j < MAX_PATHNAME_LENGTH)) {
         if (isalnum(file[i])) {
            stablabel[j++] = file[i++];
         }
         else {
            stablabel[j++] = '_';
            c = ((file[i] >> 4) & 0x0f);
            stablabel[j++] = ((c < 10) ? '0'+ c : 'a' + c - 10);
            c = (file[i++] & 0x0f);
            stablabel[j++] = ((c < 10) ? '0'+ c : 'a' + c - 10);
         }
      }
      stablabel[j++]='_';
      stablabel[j++]='0';
      stablabel[j++]='0';
      stablabel[j]='\0';
      if (cwd)
         fprintf(debug_file, ".stabs \"%s/\",0x%x,0,3,%s%s_text0\n", cwd, N_SO, stabprefix, stablabel);
      fprintf(debug_file, ".stabs \"%s\",0x%x,0,3,%s%s_text0\n", file, N_SO, stabprefix, stablabel);
      (*IR->segment)(CODE);
      printf("%s%s_text0\n\n", stabprefix, stablabel);
      currentfile = file;
   }
   dbxtype(inttype);
   dbxtype(chartype);
   dbxtype(doubletype);
   dbxtype(floattype);
   dbxtype(longdouble);
   dbxtype(longtype);
   dbxtype(longlong);
   dbxtype(shorttype);
   dbxtype(signedchar);
   dbxtype(unsignedchar);
   dbxtype(unsignedlong);
   dbxtype(unsignedlonglong);
   dbxtype(unsignedshort);
   dbxtype(unsignedtype);
   dbxtype(voidtype);
   foreach(types, GLOBAL, (Closure)my_stabtype, NULL);
}

/* my_stabline - emit stab entry for source coordinate *cp */
static void my_stabline(Coordinate *cp) {
   int lab;
   if (cp->file && (currentfile == NULL || strcmp(currentfile, cp->file) != 0)) {
      prevline = 0;
   }
   if (cp->y != prevline) {
#ifdef ALIGN_LINES_LONG_FOR_DEBUG
      if (glevel > 0) {
         /* when debugging all lines must start long aligned */
         print(" alignl_debug ' line %d\n", prevline = cp->y);
      }
      else {
         print("' line %d\n", prevline = cp->y);
      }
#else
      print("' line %d\n", prevline = cp->y);
#endif
   }

   if (cp->file && cp->file != currentfile) {
      lab = genlabel(1);
      fprintf(debug_file, ".stabs \"%s\",0x%x,0,0,%s%d\n", cp->file, N_SOL, stabprefix, lab);
      printf("%s%d\n\n", stabprefix, lab);
      currentfile = cp->file;
   }
   lab = genlabel(1);
   fprintf(debug_file, ".stabn 0x%x,0,%d,%s%s_%d-%s\n", N_SLINE, cp->y,
      stabprefix, stablabel, lab, cfunc->x.name);
   printf("%s%s_%d\n\n", stabprefix, stablabel, lab);
}

/* my_stabsym - output a stab entry for symbol p */
static void my_stabsym(Symbol p) {
   int code, tc, sz = p->type->size;

   if (p == cfunc && IR->stabline) {
      (*IR->stabline)(&p->src);
   }
   
   if (p->generated || p->computed)
      return;
   if (isfunc(p->type)) {
      fprintf(debug_file, ".stabs \"%s:%c%d\",%d,0,0,%s\n", p->name,
         p->sclass == STATIC ? 'f' : 'F', dbxtype(freturn(p->type)),
         N_FUN, p->x.name);
      return;
   }
   if (!IR->wants_argb && p->scope == PARAM && p->structarg) {
      assert(isptr(p->type) && isstruct(p->type->type));
      tc = dbxtype(p->type->type);
      sz = p->type->type->size;
   } else
      tc = dbxtype(p->type);
   if (p->sclass == AUTO && p->scope == GLOBAL || p->sclass == EXTERN) {
      fprintf(debug_file, ".stabs \"%s:G", p->name);
      code = N_GSYM;
   } else if (p->sclass == STATIC) {
      fprintf(debug_file, ".stabs \"%s:%c%d\",%d,0,0,%s\n", p->name, p->scope == GLOBAL ? 'S' : 'V',
         tc, p->u.seg == BSS ? N_LCSYM : N_STSYM, p->x.name);
      return;
   } else if (p->sclass == REGISTER) {
      if (p->x.regnode) {
         int r = p->x.regnode->number;
         if (p->x.regnode->set == FREG)
            r += 32;   /* floating point */
            fprintf(debug_file, ".stabs \"%s:%c%d\",%d,0,", p->name,
               p->scope == PARAM ? 'P' : 'r', tc, N_RSYM);
         fprintf(debug_file, "%d,%d\n", sz, r);
      }
      return;
   } else if (p->scope == PARAM) {
      fprintf(debug_file, ".stabs \"%s:p", p->name);
      code = N_PSYM;
   } else if (p->scope >= LOCAL) {
      fprintf(debug_file, ".stabs \"%s:", p->name);
      code = N_LSYM;
   } else
      assert(0);
   fprintf(debug_file, "%d\",%d,0,0,%s\n", tc, code,
      p->scope >= PARAM && p->sclass != EXTERN ? p->x.name : "0");
}

/* my_stabtype - output a stab entry for type *p */
static void my_stabtype(Symbol p) {
   if (p->type) {
      if (p->sclass == 0)
         dbxtype(p->type);
      else if (p->sclass == TYPEDEF)
         fprintf(debug_file, ".stabs \"%s:t%d\",%d,0,0,0\n", p->name, dbxtype(p->type), N_LSYM);
   }
}

/* my_stabend - finalize a function */
static void my_stabfend(Symbol p, int lineno) {
   if (debug_file != NULL) {
      fflush(debug_file);
   }
}

/* my_stabend - finalize stab output */
static void my_stabend(Coordinate *cp, Symbol p, Coordinate **cpp, Symbol *sp, Symbol *stab) {
   (*IR->segment)(CODE);
   fprintf(debug_file, ".stabs \"\", %d, 0, 0,%s%s_etext\n", N_SO, stabprefix, stablabel);
   printf("%s%s_etext\n\n", stabprefix, stablabel);
   if (debug_file != NULL) {
      fflush(debug_file);
   }
}

#else

/* my_stabinit - initialize stab output */
static void my_stabinit(char *file, int argc, char *argv[]) {
   int len;
   if (file) {
      print("' file \"%s\"\n", file);
      currentfile = file;
   }
}

/* my_stabline - output line numbers */
static void my_stabline(Coordinate *cp) {

   if (cp->file && (currentfile == NULL || strcmp(currentfile, cp->file) != 0)) {
      prevline = 0;
   }
   if (cp->y != prevline) {
      print("' line %d\n", prevline = cp->y);
   }
}

/* my_stabsym - output a stab entry for symbol p */
static void my_stabsym(Symbol p) {
   if (p == cfunc && IR->stabline) {
      (*IR->stabline)(&p->src);
   }
}

#endif

static void progbeg(int argc, char *argv[]) {
   int i;

   parseflags(argc, argv);
   print("' Catalina Code\n");
   print("\nDAT ' code segment\n");
   print("'\n");
   print("' LCC 4.2 for Parallax Propeller\n");
   print("' (Catalina v3.15 Code Generator by Ross Higson)\n");
   print("'\n");
   for (i = r0; i <= r23; i++) {
      intreg[i] = mkreg("r%d", i, 1, IREG);
   }
   intregw = mkwildcard(intreg);

   tmask[IREG] = INTTMP;
   vmask[IREG] = INTVAR;

   tmask[FREG] = FLTTMP;
   vmask[FREG] = FLTVAR;
   cseg = CODE;
}

static Symbol rmap(int opk) {
   switch (optype(opk)) {
   case B: case P:
      return intregw;
   case I: case U:
      return intregw;
   case F:
      return intregw; 
   default:
      return 0;
   }
}

static void segment(int n) {
   if (n == cseg) {
      return;
   }
   cseg = n;
   if (cseg == CODE) {
      print("\n' Catalina Code\n");
      print("\nDAT ' code segment\n");
   }
   else if (cseg == LIT) {
      print("\n' Catalina Cnst\n");
      print("\nDAT ' const data segment\n");
   }
   else if (cseg == BSS) {
      print("\n' Catalina Data\n");
      print("\nDAT ' uninitialized data segment\n");
   }
   else /* if (cseg == DATA) */ {
      print("\n' Catalina Init\n");
      print("\nDAT ' initialized data segment\n");
   }
}

static void progend(void) {
   segment(CODE);
   print("' end\n");
}

/* NOTE: Target always uses intreg, even for targets that take or */
/* return floats - this is NOT AN ERROR - there is in fact only one */
/* set of registers, and r0 and r1 can be used for both floats and */
/* integer values - but we don't want LCC to think it can use the */
/* intregs and not corrupt the fltregs, so we always use the intregs */
static void target(Node p) {
   assert(p);
   switch (specific(p->op)) {
   case CVF+I: 
      rtarget(p, 0, intreg[0]);
      setreg(p, intreg[0]);
      break;
   case CVI+F: 
      rtarget(p, 0, intreg[0]);
      setreg(p, intreg[0]);
      break;
   case EQ+F: case NE+F: case GE+F: case LE+F: case GT+F: case LT+F:
      setreg(p, intreg[0]);
      break;
   case ADD+F: case SUB+F: case MUL+F: case DIV+F:
      setreg(p, intreg[0]);
      break;
   case MUL+I: case MUL+U:
      setreg(p, intreg[0]);
      break;
   case DIV+I: case DIV+U:
      setreg(p, intreg[0]);
      break;
   case MOD+I: case MOD+U:
      setreg(p, intreg[1]);
      break;
   case CALL+I: case CALL+U: case CALL+P: case CALL+V:
      setreg(p, intreg[0]);
      break;
   case CALL+F:
      setreg(p, intreg[0]);
      break;
   case RET+I: case RET+U: case RET+P: case RET+V:
      rtarget(p, 0, intreg[0]);
      break;
   case ARG+B:
      rtarget(p->kids[0], 0, intreg[0]);
      break;
   case ASGN+B:
      rtarget(p, 0, intreg[0]);
      rtarget(p->kids[1], 0, intreg[1]);
      break;
   case RET+F:
      rtarget(p, 0, intreg[0]);
      break;
#ifdef REG_PASSING
   case ARG+F: case ARG+I: case ARG+P: case ARG+U:
      {
         Symbol q;
         q = argreg(p->x.argno);
         if (q != NULL) {
#ifdef DIAGNOSTIC
            printf("' ARG %d TARGETS %s\n", p->x.argno, q->x.name);
#endif
            rtarget(p, 0, q);
         }
         else {
#ifdef DIAGNOSTIC
            printf("' ARG %d USES STACK\n", p->x.argno);  
#endif
            /*rtarget(p, 0, intreg[0]); */
         }
         break;
      }
#endif
   }
}


static void clobber(Node p) {
   assert(p);
   switch (specific(p->op)) {
   case CALL+F:
      /*spill(INTRET, IREG, p); */
      spill(FLTRET, FREG, p);
      break;
   case CALL+I: case CALL+P: case CALL+U:
      spill(FLTRET, FREG, p);
      break;
   case CALL+V:
      spill(FLTRET, FREG, p);
      break;
   case MUL+I: case MUL+U: 
   case DIV+I: case DIV+U: 
      spill(MULREG, IREG, p);
      break;
   case MOD+I: case MOD+U:
      spill(MODREG, IREG, p);
      break;
   case MUL+F: case DIV+F:
   case ADD+F: case SUB+F:
   case EQ+F: case NE+F: 
   case GE+F: case GT+F: 
   case LE+F: case LT+F:
      spill(MULREG, FREG, p);
      break;
   }

}

extern int last_dst;
extern int last_src;

/* do trivial peephole optimization to eliminate unnecessary mov instructions */
static void move_if_required (char *dst, char *src, char *comment) {
   int this_dst;
   int this_src;
   sscanf(src, "r%d", &this_src);
   sscanf(dst, "r%d", &this_dst);
   if (this_dst == this_src) {
      /* no move is required */
#ifdef DIAGNOSTIC 
      print ("' word I16A_MOV + (%s)<<D16A + (%s)<<S16A ' %s <- removed by optimization\n", dst, src, comment);
#endif
   }
   else {
      print (" word I16A_MOV + (%s)<<D16A + (%s)<<S16A ' %s\n", dst, src, comment);
      last_dst = this_dst;
      last_src = this_src;
   }
}

/* do trivial peephole optimization to eliminate unnecessary mov instructions */
static void move_if_required_2 (char *dst, char *src, char *comment) {
   int this_dst;
   int this_src;
   sscanf(src, "r%d", &this_src);
   sscanf(dst, "r%d", &this_dst);
   if ((this_dst == this_src) 
   ||  ((this_dst == last_dst) && (this_src == last_src))
   ||  ((this_dst == last_src) && (this_src == last_dst))) {
      /* no move is required */
#ifdef DIAGNOSTIC 
      print ("' word I16A_MOV + (%s)<<D16A + (%s)<<S16A ' %s <- removed by optimization\n", dst, src, comment);
#endif
   }
   else {
      print (" word I16A_MOV + (%s)<<D16A + (%s)<<S16A ' %s\n", dst, src, comment);
      last_dst = this_dst;
      last_src = this_src;
   }
}

/* set up r0 with op1 and r1 with op2 without clobbering either */
static void setup_r0_and_r1(char *op1, char *op2) {
   if (strcmp(op2,"r0") == 0) {
      /* don't clobber r0 */
      move_if_required("r1", op2, "setup r0/r1 (1)");
      move_if_required_2("r0", op1, "setup r0/r1 (1)");
   }
   else {
      /* safe to clobber r0 */
      move_if_required("r0", op1, "setup r0/r1 (2)");
      move_if_required_2("r1", op2, "setup r0/r1 (2)");
   }
}

#ifdef SUPPORT_PASM
/* determine if this ARG is being generated preparatory  */
/* to calling an PASM function */
static int is_arg_to_PASM(Node p) {
   int op;
   Node q = p;

   /* find the call node we are argument for */
   while ((q && generic(q->op) != CALL)) {
      assert (q->x.next);
      q = q->x.next;
   }
   assert (q->kids[0]);
   if (generic(q->kids[0]->op) == ADDRG) {
      return (strcmp(q->kids[0]->syms[0]->x.name, "C_P_A_S_M_") == 0);
   }
   return 0;
}  
#endif

#ifndef OLD_VARIADIC
/* determine if this ARG is being generated preparatory to call a  */
/* variadic function (only supports ANSI style variadics) */
static int is_arg_to_variadic(Node p) {
   int op;
   Node q = p;

   /* find the call node we are argument for */
   while ((q && generic(q->op) != CALL)) {
      assert (q->x.next);
      q = q->x.next;
   }
   assert (q->kids[0]);
   if (generic(q->kids[0]->op) == ADDRG) {
      assert (q->kids[0]->syms[0]);
      return variadic(q->kids[0]->syms[0]->type);
   }
   else {
      assert(generic(q->kids[0]->op) == INDIR);
      assert (q->kids[0]->kids[0]);
      assert (q->kids[0]->kids[0]->syms[0]);
      return variadic(q->kids[0]->kids[0]->syms[0]->type->type);
   }  
}  
#endif

#define isfp(p) (optype((p)->op)==F)

static void dump(Symbol s, void * not_used) {
   print("'dump name = %s (%s)\n", s->name, s->x.name);
}

#define P_FUNC_NAME     "_PASM"  /* name of function to return PASM identifier */
#define P_FUNC_LEN      5        /* must be strlen(P_FUNC_NAME) */

static char *my_lookup(char *str) {
  Symbol sym;
  sym = lookup(string(str), identifiers);
  if (sym != NULL) {
     print("' %s resolves to C identifier %s (PASM %s)\n", 
           str, 
           sym->name, 
           sym->x.name);
     return sym->x.name;
  }
  else {
     print("' %s does not resolve to a C identifier\n", str);
     return str;
  }
}

/* strindex - return index of string t in string s, or -1 if not found  */
static int strindex(char s[], char t[]) {
   int i, j, k;

   for (i = 0; s[i] != '\0'; i++) {
      for (j = i, k = 0; s[j] == t[k]; j++, k++) {
         ;
      }
      if (k > 0 && t[k] == '\0') {
          return i;
      }
   }
   return -1;
}

/* skipspace - return index of next non-whitespace, starting at str[index]  */
/*             Note that this may may the index of the terminating null! */
static int skipspace(char *str, int index) {
   while (isspace(str[index])) {
      index++;
   }
   return index;
}

/* C_name - substitute all references to P_FUNC_NAME(name) with the identifier  */
/*          generated by the C compiler, or just the name if there is none. */
/*          e.g. P_FUNC_NAME(func) might return "C_func" or just "func". */
/* Note that for function aruments that are passed in a register, it will  */
/* return the register name allocated to the argument (i.e. r2 .. r23).  */
/* For arguments passed on the stack, it will return the offset that */
/* needs to be added to the current frame pointer (e.g. 8, 12, 16 etc). */
/* For globals and externals, it will return the C label. */
/* It cannot resolve the id of local variables - pass them to a function. */
/* The return string is dynamically allocated, and should be freed after use. */
/* */
static char *C_name(char *src) {
   int src_index = 0;
   int nxt_index = 0;
   int dst_index = 0;
   char *dst;
   int maxlen;
   int count = 0;
   char id[MAX_NAME_LENGTH + 1];
   char *new_id;

   /*first, calculate how many replacements we might need */
   while ((nxt_index = strindex(&src[src_index], P_FUNC_NAME)) >= 0) {
      count++;
      src_index += nxt_index + P_FUNC_LEN; /* point past P_FUNC_NAME */
   }
   src_index = 0;
   nxt_index = 0;

   /* calculate maximum length of replacemenmt string */
   maxlen = strlen(src) + count * MAX_NAME_LENGTH + 1;
   /* allocate new string, and intialize it to all zeroes */
   dst = malloc(maxlen);
   if (dst == NULL) {
      printf("string allocation failed in %s processing\n", P_FUNC_NAME);
      return NULL;
   }
   memset(dst, 0, maxlen);

   if (count > 0) {
      /* replace all instances of P_FUNC_NAME(xxx) with the PASM identifier */
      char *next = src;
      int i;
      for (i = 0; i < count; i++) {
         nxt_index = strindex(&src[src_index], P_FUNC_NAME);
         if (nxt_index >= 0) {
            if ((nxt_index == 0) 
            || !(isalnum(src[src_index+nxt_index-1]) || (src[src_index+nxt_index-1] == '_'))) {
               /* copy string preceeding instance from src to dst */
               strncpy(&dst[dst_index], &src[src_index], nxt_index);
               dst_index += nxt_index;
               src_index = skipspace(src, src_index + nxt_index + P_FUNC_LEN);
               if (src[src_index] == '(') {
                  int first, last;
                  src_index = skipspace(src, src_index + 1);
                  first = src_index;
                  while (!isspace(src[src_index]) 
                  &&     (src[src_index] != ')')
                  &&     (src[nxt_index] != 0)) {
                     last = src_index++;
                  }
                  src_index = skipspace(src, src_index);
                  if (src[src_index] == ')') {
                     strncpy(id, &src[first], last - first + 1);
                     id[last - first + 1] = 0;
                     src_index++;
                  }
                  else {
                     printf("error: expected ')' at character %d\n", src_index);
                  }
                  new_id = my_lookup(id);
                  strcpy(&dst[dst_index], new_id);
                  dst_index += strlen(new_id);
                  nxt_index = src_index;
               }
               else {
                  printf("error: expected '(' at character %d\n", src_index);
               }
            }
            else {
               /* copy non-matching instance from src to dst */
               strncpy(&dst[dst_index], &src[src_index], nxt_index + P_FUNC_LEN);
               dst_index += nxt_index + P_FUNC_LEN;
               src_index += nxt_index + P_FUNC_LEN;
            }
         }
         else {
            /* this should never happen! */
            printf("error: %s processing failed\n", P_FUNC_NAME);
         }
      }
      /* copy remainder of src to dst string */
      strcpy(&dst[dst_index], &src[src_index]);
   }
   else {
      /* no instances of P_FUNC_NAME so just return a copy of the source */
      strncpy(dst, src, maxlen);
   }
   return dst;
}

#define P_PSTR_NAME     "_PSTR"  /* name of macro to convert C to PASM string */
#define P_PSTR_LEN      5        /* must be strlen(P_PSTR_NAME) */

/* hex_digit - return the hex character (i.e. '0' .. '9', 'A' .. 'F' for the  */
/*             hex integer, which must be in the range 0 .. 16 */
static char hex_digit(unsigned int hex) {
   return ((hex < 10) ? hex + '0' : hex - 10 + 'A');
}

/* my_escape - generate a sequence of bytes that represent a C string,  */
/*             substituting all C escape sequences with the appropriate byte */
/*             sequences. Note that in the string, the escape sequences will */
/*             have to use \\, not \ or they will be interpreted by C. */
/*             The processing stops at the first null character.  */
/*             The length of the final string is returned (but note */
/*             the result is not null terminated). */
/*             e.g. my_escape("hello\\n", 8) would return the value 6  */
/*             and the characters h e l l o <nl> */
/*  */
/* The length of the final string is returned, but note that it is not  */
/* terminated by a null byte, so that generated strings can be concatenated  */
/* if required. */
/* */
/* The return string is dynamically allocated, and should be freed after use. */
/* */
static int my_escape(char *src, char *dst, int len) {
   int src_index = 0;
   int dst_index = 0;
   unsigned char byte;
   int count;

   while (src_index < len) {
      if ((src[src_index] == '\\') && (src[src_index+1] != 0)) {
         memcpy(&dst[dst_index], " byte $", 7);
         dst_index += 7;
         switch (src[++src_index]) {
           case 'a' :
             byte = '\a';
             src_index++;
             break;
           case 'b' :
             byte = '\b';
             src_index++;
             break;
           case 'f' :
             byte = '\f';
             src_index++;
             break;
           case 'n' :
             byte = '\n';
             src_index++;
             break;
           case 'r' :
             byte = '\r';
             src_index++;
             break;
           case 't' :
             byte = '\t';
             src_index++;
             break;
           case 'v' :
             byte = '\v';
             src_index++;
             break;
           case '\\' :
             byte = '\\';
             src_index++;
             break;
           case '\'' :
             byte = '\'';
             src_index++;
             break;
           case '\"' :
             byte = '\"';
             src_index++;
             break;
           case '\?' :
             byte = '\?';
             src_index++;
             break;
           case '0' :
           case '1' :
           case '2' :
           case '3' :
           case '4' :
           case '5' :
           case '6' :
           case '7' :
             count = 0;
             while ((count < 3) 
             &&     (src[src_index] >='0' && (src[src_index]<='7'))) {
                byte = (byte<<3) + src[src_index++] - '0';
                count++;
             }
             break;
           case 'x' :
             src_index++;
             while (isxdigit(src[src_index])) {
                if (isdigit(src[src_index])) {
                   byte = (byte<<4) + src[src_index++] - '0';
                }
                else {
                   byte = (byte<<4) + 10 + tolower(src[src_index++]) - 'a';
                }
             }
             break;
           default :
             if (isprint(src[src_index])) {
                printf("error: illegal escape sequence \\%c\n", 
                    src[src_index]);
             }
             else {
                printf("error: illegal escape sequence \\x%02X\n", 
                    src[src_index]);
             }
             src_index++;
             byte = 0;
             break;
         }
         /* dst[dst_index++] = byte; */
         dst[dst_index++] = hex_digit((byte>>4)&0xF);
         dst[dst_index++] = hex_digit(byte&0xF);
         dst[dst_index++] = '\n';
      }
      else {
         /* dst[dst_index++] = src[src_index]; */
         memcpy(&dst[dst_index], " byte $", 7);
         dst_index += 7;
         byte = src[src_index++];
         dst[dst_index++] = hex_digit((byte>>4)&0xF);
         dst[dst_index++] = hex_digit(byte&0xF);
         dst[dst_index++] = '\n';
      }
   }
   return dst_index;
}

/* C_escape - substitute all references to P_PSTR_NAME(cstr) with the */
/*            PASM version of the C string by substituting C escape */
/*            sequences. */
/*           */
/* Since all C escape sequences produce less characters than it takes to */
/* express them, the return string can only ever be smaller than the source  */
/* string - so it can be built in place in the space occupied by the */
/* source string. */
/* */
static char *C_escape(char *src) {
   int src_index = 0;
   int nxt_index = 0;
   int dst_index = 0;
   char *dst;
   int count = 0;
   int len;
   int in_literal;
   int i;
   int first, last;
   int maxlen;

   /*first, calculate how many replacements we might need to make */
   while ((nxt_index = strindex(&src[src_index], P_PSTR_NAME)) >= 0) {
      count++;
      src_index += nxt_index + P_PSTR_LEN; /* point past P_PSTR_NAME */
   }
   src_index = 0;
   nxt_index = 0;

   /* allocate new string, and intialize it to all zeroes - we might need */
   /* up to 10 times the length of the source string, since each byte in */
   /* the src can expand to 10 bytes in the destination - " byte $XX\n" */
   maxlen = 10*strlen(src) + 1;
   dst = malloc(maxlen);
   if (dst == NULL) {
      printf("string allocation failed in %s processing\n", P_FUNC_NAME);
      return NULL;
   }
   memset(dst, 0, maxlen);

   if (count > 0) {
      /* replace all instances of P_PSTR_NAME(cstr) with the PASM string */
      for (i = 0; i < count; i++) {
         nxt_index = strindex(&src[src_index], P_PSTR_NAME);
         if (nxt_index >= 0) {
            if ((nxt_index == 0) 
            || !(isalnum(src[src_index+nxt_index-1]) || (src[src_index+nxt_index-1] == '_'))) {
               /* copy string preceeding instance from src to dst */
               strncpy(&dst[dst_index], &src[src_index], nxt_index);
               dst_index += nxt_index;
               src_index = skipspace(src, src_index + nxt_index + P_FUNC_LEN);
               first = src_index;
               if (src[first] == '(') {
                  first = skipspace(src, first + 1);
                  if (src[first] != '\"') {
                     in_literal = 0;
                  }
                  else {
                     in_literal = 1;
                     first++;
                  }
                  last = first;
                  while (src[last] != 0) {
                     if ((!in_literal) && src[last] == ')') {
                        break;
                     }
                     if (src[last] == '\"') {
                        in_literal = !in_literal;
                        if (!in_literal) {
                           break;
                        }
                     }
                     else if (src[last] == '\\') {
                        if (src[last+1] == '\"') {
                          last++;
                        }
                     }
                     last++;
                  }
                  src_index = last;
                  if (src[last] == '\"') {
                     src_index = skipspace(src, last + 1);
                  }
                  if (src[src_index] == ')') {
                     src_index++;
                  }
                  else {
                     printf("error: expected ')' at character %d\n", src_index);
                  }
                  len = my_escape(&src[first], &dst[dst_index], last - first);
                  dst_index += len;
               }
               else {
                  printf("error: expected '(' at character %d\n", src_index);
               }
            }
            else {
               /* copy non-matching instance from src to dst */
               strncpy(&dst[dst_index], &src[src_index], nxt_index + P_FUNC_LEN);
               dst_index += nxt_index + P_FUNC_LEN;
               src_index += nxt_index + P_FUNC_LEN;
            }
         }
      }
      /* copy remainder of src to dst string */
      while (src[src_index] != 0) {
        dst[dst_index++] = src[src_index++];
      }
      dst[dst_index] = 0;
   }
   else {
      /* no instances of P_PSTR_NAME so just return a copy of the source */
      strncpy(dst, src, maxlen);
   }
   return dst;
}


static void emit2(Node p) {
   int op = specific(p->op);
   static int spsize = 0;
   static int rpsize = 0;

#define preg0(f) ((f)[getregnum(p->x.kids[0])]->x.name)
#define preg1(f) ((f)[getregnum(p->x.kids[1])]->x.name)

   if (generic(op) == LABEL) {
      Symbol r;
      r = p->syms[0];
      if (!r->generated || (r->ref > 0)) {
         print(" alignl_label\n%s\n", r->x.name);
      }
      else {
         print("' %s ' (symbol refcount = %d)\n", r->x.name, (int)r->ref);
      }
   }
   if (generic(op) == CALL) {
      char * src;
      int ssize;
      int kop, kkop;
      Node kp, kkp;

      kp = (p->kids[0]);
      assert(kp);
      kop = kp->op;

#ifdef SUPPORT_PASM
      if  (generic(kop) == ADDRG) {
         assert(kp->syms[0] && kp->syms[0]->x.name);
         src = kp->syms[0]->x.name;
         if (strcmp(src, "C_P_A_S_M_") == 0) {
            print("' call to PASM eliminated\n");
            return;
         }
      }
#endif

#ifdef SUPPORT_ALLOCA
      if  (generic(kop) == ADDRG) {
         assert(kp->syms[0] && kp->syms[0]->x.name);
         src = kp->syms[0]->x.name;
         if (strcmp(src, "C___builtin_alloca") == 0) {
            calls_alloca = 1;
            print ("' call to alloca replaced with ...\n");
            print (" word I16B_EXEC\n");
            print (" alignl\n");
            print (" mov RI, FP         ' if ...\n");
            print (" sub RI, #4         ' ... we have not yet ...\n");
            print (" rdlong r0, RI      ' ... saved a pre-alloca SP ...\n");
            print (" cmp r0, Bit31 wz   ' ... then ...\n");
            print (" if_z wrlong SP, RI ' ... save it now (first alloca)\n");
            print (" add r2, #3         ' round up size in r2 ...\n");
            print (" andn r2, #3        ' ... to be a multiple of 4 bytes\n");
            print (" sub SP, r2         ' allocate space on stack ...\n");
            print (" mov r0, SP         ' ... and return its addr in r0\n");
            print (" jmp #EXEC_STOP\n");
            return;
         }
      }
#endif

#ifndef REG_PASSING
      spsize = p->syms[0]->u.c.v.u;
#endif

#ifdef NO_CPREP /* don't use CPREP instruction! */

#ifdef OLD_VARIADIC
      if (p->syms[0]->u.c.v.u < I16A_MOVI_SIZE) {
         print(" word I16A_MOVI + BC<<D16A + %d<<S16A ' arg size, rpsize = %d, spsize = %d\n", p->syms[0]->u.c.v.u, rpsize, spsize);
      }
      else if (p->syms[0]->u.c.v.u < I32_MOVI_SIZE) {
         print(" alignl_p1\n long I32_MOVI + BC<<D32 + %d<<S32 ' arg size, rpsize = %d, spsize = %d\n", p->syms[0]->u.c.v.u, rpsize, spsize);
      }
      else {
         print(" ERROR !!!!\n");
      }
#endif      
      if ((spsize > 0) && (rpsize == 0)) {
         print(" word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! \n");
      }
      else if (rpsize > 0) {
         if (rpsize < I16A_MOVI_SIZE + 4) {
            if (rpsize > 4) {
               print(" word I16A_SUBI + SP<<D16A + %d<<S16A ' stack space for reg ARGs\n", rpsize - 4);
            }
         }
         else {
            print(" alignl_p1\n long I32_LODA + %d<<S32\n word I16A_SUB + SP<<D16A + RI<<S16A ' stack space for reg ARGs\n", rpsize - 4);
         }
      }

#else

      if ((spsize > 0) && (rpsize == 0)) {
#ifdef OLD_VARIADIC
         if (p->syms[0]->u.c.v.u < I16A_MOVI_SIZE) {
            print(" word I16A_MOVI + BC<<D16A + %d<<S16A ' arg size, rpsize = %d, spsize = %d\n", p->syms[0]->u.c.v.u, rpsize, spsize);
         }
         else if (p->syms[0]->u.c.v.u < I32_MOVI_SIZE) {
            print(" alignl_p1\n long I32_MOVI + BC<<D32 + %d<<S32 ' arg size, rpsize = %d, spsize = %d\n", p->syms[0]->u.c.v.u, rpsize, spsize);
         }
         else {
            print(" ERROR !!!!\n");
         }
#endif      
         print(" word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! \n");
      }
      else if (rpsize > 0) {
         if (rpsize < I16A_MOVI_SIZE + 4) {
            if (rpsize > 4) {
#ifdef OLD_VARIADIC
               if ((p->syms[0]->u.c.v.u/4 < I16B_CPREP_BC_SIZE) && ((rpsize - 4)/4 << I16B_CPREP_SP_SIZE)) {
                  print(" word I16B_CPREP + %d<<S16B ' arg size, rpsize = %d, spsize = %d\n", (((p->syms[0]->u.c.v.u/4)<<I16B_CPREP_BC_SHFT) + (rpsize - 4)/4), rpsize, spsize);
               }
               else {
                  print(" alignl_p1\n long I32_CPREP + %d<<D32 + %d<<S32 ' arg size, rpsize = %d, spsize = %d\n", p->syms[0]->u.c.v.u, rpsize - 4, rpsize, spsize);
               }
#else
               print(" word I16A_SUBI + SP<<D16A + %d<<S16A ' stack space for reg ARGs\n", rpsize - 4);
#endif      
            }
            else {
#ifdef OLD_VARIADIC
               if (p->syms[0]->u.c.v.u < I16A_MOVI_SIZE) {
                  print(" word I16A_MOVI + BC<<D16A + %d<<S16A ' arg size, rpsize = %d, spsize = %d\n", p->syms[0]->u.c.v.u, rpsize, spsize);
               }
               else if (p->syms[0]->u.c.v.u < I32_MOVI_SIZE) {
                  print(" alignl_p1\n long I32_MOVI + BC<<D32 + %d<<S32 ' arg size, rpsize = %d, spsize = %d\n", p->syms[0]->u.c.v.u, rpsize, spsize);
               }
               else {
                  print(" ERROR !!!!\n");
               }
#endif      
            }
         }
         else {
#ifdef OLD_VARIADIC
            if (p->syms[0]->u.c.v.u < I16A_MOVI_SIZE) {
               print(" word I16A_MOVI + BC<<D16A + %d<<S16A ' arg size, rpsize = %d, spsize = %d\n", p->syms[0]->u.c.v.u, rpsize, spsize);
            }
            else if (p->syms[0]->u.c.v.u < I32_MOVI_SIZE) {
               print(" alignl_p1\n long I32_MOVI + BC<<D32 + %d<<S32 ' arg size, rpsize = %d, spsize = %d\n", p->syms[0]->u.c.v.u, rpsize, spsize);
            }
            else {
               print(" ERROR !!!!\n");
            }
#endif      
            print(" alignl_p1\n long I32_LODA + %d<<S32\n word I16A_SUB + SP<<D16A + RI<<S16A ' stack space for reg ARGs\n", rpsize - 4);
         }
      }

#endif /* NO_CPREP */

      if  (generic(kop) == ADDRG) {
#ifdef DIAGNOSTIC
         print("' CALL case 1\n");
#endif
         assert(kp->syms[0] && kp->syms[0]->x.name);
         src = kp->syms[0]->x.name;
         if (spsize <= 4) {
            print(" alignl_p1\n long I32_CALA + (@%s)<<S32 ' CALL addrg\n", src);
         }
         else if (spsize < I16A_MOVI_SIZE + 4) {
            print(" alignl_p1\n long I32_CALA + (@%s)<<S32\n word I16A_ADDI + SP<<D16A + %d<<S16A ' CALL addrg\n", src, spsize - 4);   
         }
         else {
            print(" alignl_p1\n long I32_CALA + (@%s)<<S32\n alignl_p1\n long I32_LODA + %d<<S32\n word I16A_ADD + SP<<D16A + RI<<S16A ' CALL addrg\n", src, spsize - 4);   
         }
      }
      else {
#ifdef DIAGNOSTIC
         print("' CALL case 2\n");
#endif
         assert (kp);
         assert(kp->syms[RX] && kp->syms[RX]->x.name);
         src = kp->syms[RX]->x.name;
         if (spsize <= 4) {
            print(" word I16A_MOV + RI<<D16A + (%s)<<S16A\n word I16B_CALI' CALL indirect\n alignl\n", src); 
         }
         else if (spsize < I16A_MOVI_SIZE + 4) {
            print(" word I16A_MOV + RI<<D16A + (%s)<<S16A\n word I16B_CALI\n alignl\n word I16A_ADDI + SP<<D16A + %d<<S16A ' CALL indirect\n", src, spsize - 4); 
         }
         else {
            print(" word I16A_MOV + RI<<D16A + (%s)<<S16A\n word I16B_CALI\n alignl\n long I32_LODA + %d<<S32\n word I16A_ADD + SP<<D16A + RI<<S16A ' CALL indirect\n", src, spsize - 4); 
         }
      }
      spsize = 0;
      rpsize = 0;
   }
   if (generic(op) == ARG) {
      int sz, ty;
      char *src;
      char *dst;
      Symbol q, r;
      int kop, kkop;
      Node kp, kkp;
      int offs;

#ifdef DIAGNOSTIC
      print("' EMIT2 -- ARG\n");
#endif
      ty = optype(p->op);
      sz = opsize(p->op);
#ifdef REG_PASSING
#ifdef OLD_VARIADIC      
      q = argreg(p->x.argno);   /* use reg arg if possible */
#else      
      if (is_arg_to_variadic(p)) {
         q = NULL; /* variadics always use stack args */
      }
      else {
         q = argreg(p->x.argno);   /* use reg arg if possible */
      }
#endif      
#else
      q = NULL;   /* always use stack arg */
#endif
#ifdef DIAGNOSTIC
      dumptree(p);
#endif
      kp = (p->kids[0]);
      assert(kp);
      kop = kp->op;

#ifdef SUPPORT_PASM
      if (is_arg_to_PASM(p)) {
         Symbol s;
         char *n_str;
         char *e_str;
         if  (generic(kop) == ADDRG) {
            assert(kp->syms[0] && kp->syms[0]->x.name);
            src = kp->syms[0]->x.name;
            kp->syms[0]->pasm_ref += 1.0;
            print("' loading argument %s to PASM eliminated\n", src);
            s = findconst(src);
            if ((s!= NULL) && (s->sclass == STATIC)) {
               n_str = C_name(s->name); /* substitute C names */
               e_str = C_escape(n_str);
               print("'START PASM ... \n%s\n'... END PASM\n", e_str);
               free(n_str);
               free(e_str);
            }
            else {
               error("argument to PASM must be a string literal");
            }
            return;
         }
         else {
            error("argument to PASM must be a string literal");
         }
      }
#endif

      if (q == NULL) {
         /* argument uses stack */
#ifdef DIAGNOSTIC
         print("' EMIT2 -- STACK ARG\n");
#endif
         if (rpsize > 0) {
            if (rpsize < I16A_MOVI_SIZE) {
               print(" word I16A_SUBI + SP<<D16A + %d<<S16A ' stack space for reg ARGs\n", rpsize);
            }
            else {
               print(" alignl_p1\n long I32_LODA + (%s)<<S32 \n word I16A_SUB + SP<<D16A + RI<<S16A ' stack space for reg ARGs\n", rpsize);
            }
            rpsize = 0;
         }
         if (generic(kop) == CNST) {
#ifdef DIAGNOSTIC            
            print ("' ARG const case 1\n");
#endif
            assert(kp->syms[0] && kp->syms[0]->x.name);
            r = kp->syms[0];
            src = r->x.name;
            if ((isint(r->type) || isunsigned(r->type))
            &&  (r->u.c.v.i >= 0) && (r->u.c.v.i < I16A_MOVI_SIZE)) {
               print(" word I16A_MOVI + RI<<D16A + (%s)<<S16A\n word I16B_PSHL ' stack ARG coni\n", src);
            }
            else if ((isint(r->type) || isunsigned(r->type))
            &&       (r->u.c.v.i >= 0) && (r->u.c.v.i < I32_MOVI_SIZE)) {
               print(" alignl_p1\n long I32_MOVI + RI<<D32 + (%s)<<S32\n word I16B_PSHL ' stack ARG coni\n", src);
            }
            else if ((isint(r->type) || isunsigned(r->type))
            &&       (r->u.c.v.i >= I32_LODS_MIN) && (r->u.c.v.i <= I32_LODS_MAX)) {
               print(" alignl_p1\n long I32_LODS + RI<<D32S + ((%s)&$7FFFF)<<S32\n word I16B_PSHL ' stack ARG cons\n", src);
            }
            else {
               print(" word I16B_LODL + RI<<D16B\n alignl_p1\n long %s\n word I16B_PSHL ' stack ARG con\n", src);
            }
         }
         else if  (generic(kop) == ADDRG) {
#ifdef DIAGNOSTIC            
            print ("' ARG case 1\n");
#endif
            assert(kp->syms[0] && kp->syms[0]->x.name);
            src = kp->syms[0]->x.name;
            print(" alignl_p1\n long I32_LODA + (@%s)<<S32\n word I16B_PSHL ' stack ARG ADDRG\n", src); 
         }
         else if (generic(kop) == ADDRL) {
#ifdef DIAGNOSTIC            
            print ("' ARG case 2a\n");
#endif
            assert(kp->syms[0] && kp->syms[0]->x.name);
            src = kp->syms[0]->x.name;
            offs = kp->syms[0]->x.offset;
            if ((offs > -I16B_LODF_SIZE) && (offs < I16B_LODF_SIZE)) {
               print(" word I16B_LODF + ((%s)&$1FF)<<S16B\n word I16B_PSHL ' stack ARG ADDRLi\n", src); 
            }
            else {
               print(" alignl_p1\n long I32_LODF + ((%s)&$FFFFFF)<<S32\n word I16B_PSHL ' stack ARG ADDRL\n", src); 
            }
         }
         else if (generic(kop) == ADDRF) {
#ifdef DIAGNOSTIC            
            print ("' ARG case 2b\n");
#endif
            assert(kp->syms[0] && kp->syms[0]->x.name);
            src = kp->syms[0]->x.name;
            offs = kp->syms[0]->x.offset;
            if ((offs > -I16B_LODF_SIZE) && (offs < I16B_LODF_SIZE)) {
               print(" word I16B_LODF + ((%s)&$1FF)<<S16B\n word I16B_PSHL ' stack ARG ADDRFi\n", src); 
            }
            else {
               print(" alignl_p1\n long I32_LODF + ((%s)&$FFFFFF)<<S32\n word I16B_PSHL ' stack ARG ADDRF\n", src); 
            }
         }
         else if ((generic(kop) == INDIR) && !special(kp->kids[0])) {
            kkp = (kp->kids[0]);
            assert(kkp);
            kkop = kkp->op;
            if  (generic(kkop) == ADDRG) {
#ifdef DIAGNOSTIC            
               print ("' ARG case INDIR 1\n");
#endif
               assert(kkp->syms[0] && kkp->syms[0]->x.name);
               src = kkp->syms[0]->x.name;
               print(" alignl_p1\n long I32_PSHA + (@%s)<<S32 ' stack ARG INDIR ADDRG\n", src); 
            }
            else if (generic(kkop) == ADDRL) {
#ifdef DIAGNOSTIC            
               print ("' ARG case INDIR 2a\n");
#endif
               assert(kkp->syms[0] && kkp->syms[0]->x.name);
               src = kkp->syms[0]->x.name;
               offs = kkp->syms[0]->x.offset;
               print(" alignl_p1\n long I32_PSHF + ((%s)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL\n", src); 
            }
            else if (generic(kkop) == ADDRF) {
#ifdef DIAGNOSTIC            
               print ("' ARG case INDIR 2b\n");
#endif
               assert(kkp->syms[0] && kkp->syms[0]->x.name);
               src = kkp->syms[0]->x.name;
               offs = kkp->syms[0]->x.offset;
               print(" alignl_p1\n long I32_PSHF + ((%s)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF\n", src); 
            }
            else if (kkop == VREG+P) {
#ifdef DIAGNOSTIC            
               print ("' ARG case INDIR 6\n");
#endif
               /* check for common subexpressions - see pp 384 */
               assert(kp->syms[RX] && kp->syms[RX]->x.name);
               src = kp->syms[RX]->x.name;
               if (*src == '?') {
#ifdef DIAGNOSTIC            
                  print ("' Common Subexpression Simplified away - reinstating ...\n");
#endif
                  assert(kp->syms[RX]->u.t.cse);
                  if (generic(kp->syms[RX]->u.t.cse->op) == CNST) {
                     assert(kp->syms[RX]->u.t.cse->syms[0] && kp->syms[RX]->u.t.cse->syms[0]->x.name);
                     r = kp->syms[RX]->u.t.cse->syms[0];
                     src = r->x.name;
                     assert(r && src);
                     if ((isint(r->type) || isunsigned(r->type))
                     &&  (r->u.c.v.i >= 0) && (r->u.c.v.i < I16A_MOVI_SIZE)) {
                        print(" word I16A_MOVI + RI<<D16A + (%s)<<S16A\n word I16B_PSHL ' stack ARG coni\n", src);
                     }
                     else if ((isint(r->type) || isunsigned(r->type))
                     &&       (r->u.c.v.i >= 0) && (r->u.c.v.i < I32_MOVI_SIZE)) {
                        print(" alignl_p1\n long I32_MOVI + RI<<D32 + (%s)<<S32\n word I16B_PSHL ' stack ARG coni\n", src);
                     }
                     else if ((isint(r->type) || isunsigned(r->type))
                     &&       (r->u.c.v.i >= I32_LODS_MIN) && (r->u.c.v.i <= I32_LODS_MAX)) {
                        print(" alignl_p1\n long I32_LODS + RI<<D32S + ((%s)&$7FFFF)<<S32\n word I16B_PSHL ' stack ARG cons\n", src);
                     }
                     else {
                        print(" word I16B_LODL + RI<<D16B\n alignl_p1\n long %s\n word I16B_PSHL ' stack ARG con\n", src);
                     }
#ifdef DIAGNOSTIC            
                     print ("' ... Common Subexpression Reinstated\n");
#endif
                  } 
                  else {
                     error("internal error - common subexpression cannot be reinstated!");
                  }
               }
               else {
                  /* NOTE: INDIRx(VREGP) is a register read, not an indirect read */
                  print(" word I16A_MOV + RI<<D16A + (%s)<<S16A\n word I16B_PSHL ' stack ARG\n", src);
               }
            }
            else {
               /* for anything not matched yet, assume the result is in the node's target register */
#ifdef DIAGNOSTIC            
               print ("' Fallback Processing\n");
#endif               
               assert(kp->syms[RX] && kp->syms[RX]->x.name);
               src = kp->syms[RX]->x.name;
               print(" word I16A_MOV + RI<<D16A + (%s)<<S16A\n word I16B_PSHL ' stack ARG\n", src); 
            }
         }
         else {
#ifdef DIAGNOSTIC            
            print ("' ARG case 6\n");
#endif
            assert(kp->syms[RX] && kp->syms[RX]->x.name);
            src = kp->syms[RX]->x.name;
            print(" word I16A_MOV + RI<<D16A + (%s)<<S16A\n word I16B_PSHL ' stack ARG\n", src);
         }
      }
      else {
         /* argument uses reg */
         if  (generic(kop) == CNST) {
#ifdef DIAGNOSTIC            
            print ("' ARG const case 1\n");
#endif
            assert(kp->syms[0] && kp->syms[0]->x.name);
            r = kp->syms[0];
            src = r->x.name;
            if ((isint(r->type) || isunsigned(r->type))
            &&  (r->u.c.v.i >= 0) && (r->u.c.v.i < I16A_MOVI_SIZE)) {
               print(" word I16A_MOVI + (%s)<<D16A + (%s)<<S16A ' reg ARG coni\n", q->name, src);
            }
            else if ((isint(r->type) || isunsigned(r->type))
            &&       (r->u.c.v.i >= 0) && (r->u.c.v.i < I32_MOVI_SIZE)) {
               print(" alignl_p1\n long I32_MOVI + (%s)<<D32 + (%s)<<S32 ' reg ARG coni\n", q->name, src);
            }
            else if ((isint(r->type) || isunsigned(r->type))
            &&       (r->u.c.v.i >= I32_LODS_MIN) && (r->u.c.v.i <= I32_LODS_MAX)) {
               print(" alignl_p1\n long I32_LODS + (%s)<<D32S + ((%s)&$7FFFF)<<S32 ' reg ARG cons\n", q->name, src);
            }
            else {
               print(" word I16B_LODL + (%s)<<D16B\n alignl_p1\n long %s ' reg ARG con\n", q->name, src);
            }
         }
         else if  (generic(kop) == ADDRG) {
#ifdef DIAGNOSTIC            
            print ("' ARG case 1\n");
#endif
            assert(kp->syms[0] && kp->syms[0]->x.name);
            src = kp->syms[0]->x.name;
            print(" word I16B_LODL + (%s)<<D16B\n alignl_p1\n long @%s ' reg ARG ADDRG\n", q->name, src); 
         }
         else if (generic(kop) == ADDRL) {
#ifdef DIAGNOSTIC            
            print ("' ARG case 2a\n");
#endif
            assert(kp->syms[0] && kp->syms[0]->x.name);
            src = kp->syms[0]->x.name;
            offs = kp->syms[0]->x.offset;
            if ((offs > -I16B_LODF_SIZE) && (offs < I16B_LODF_SIZE)) {
               print(" word I16B_LODF + ((%s)&$1FF)<<S16B\n word I16A_MOV + (%s)<<D16A + RI<<S16A ' reg ARG ADDRLi\n", src, q->name); 
            }
            else {
               print(" alignl_p1\n long I32_LODF + ((%s)&$FFFFFF)<<S32 \n word I16A_MOV + (%s)<<D16A + RI<<S16A ' reg ARG ADDRL\n", src, q->name); 
            }
         }
         else if (generic(kop) == ADDRF) {
#ifdef DIAGNOSTIC            
            print ("' ARG case 2b\n");
#endif
            assert(kp->syms[0] && kp->syms[0]->x.name);
            src = kp->syms[0]->x.name;
            offs = kp->syms[0]->x.offset;
            if ((offs > -I16B_LODF_SIZE) && (offs < I16B_LODF_SIZE)) {
               print(" word I16B_LODF + ((%s)&$1FF)<<S16B\n word I16A_MOV + (%s)<<D16A + RI<<S16A ' reg ARG ADDRFi\n", src, q->name); 
            }
            else {
               print(" alignl_p1\n long I32_LODF + ((%s)&$FFFFFF)<<S32\n word I16A_MOV + (%s)<<D16A + RI<<S16A ' reg ARG ADDRF\n", src, q->name); 
            }
         }
         else if ((generic(kop) == INDIR) && !special(kp->kids[0])) {
            kkp = (kp->kids[0]);
            assert(kkp);
            kkop = kkp->op;
            if  (generic(kkop) == ADDRG) {
#ifdef DIAGNOSTIC            
               print ("' ARG case INDIR 1\n");
#endif
               assert(kkp->syms[0] && kkp->syms[0]->x.name);
               src = kkp->syms[0]->x.name;
               print(" alignl_p1\n long I32_LODI + (@%s)<<S32\n word I16A_MOV + (%s)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG\n", src, q->name); 
            }
            else if (generic(kkop) == ADDRL) {
#ifdef DIAGNOSTIC            
               print ("' ARG case INDIR 2a\n");
#endif
               assert(kkp->syms[0] && kkp->syms[0]->x.name);
               src = kkp->syms[0]->x.name;
               offs = kkp->syms[0]->x.offset;
               if ((offs > -I16B_LODF_SIZE) && (offs < I16B_LODF_SIZE)) {
                  print(" word I16B_LODF + ((%s)&$1FF)<<S16B\n word I16A_RDLONG + (%s)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi\n", src, q->name); 
               }
               else {
                  print(" alignl_p1\n long I32_LODF + ((%s)&$FFFFFF)<<S32\n word I16A_RDLONG + (%s)<<D16A + RI<<S16A ' reg ARG INDIR ADDRL\n", src, q->name); 
               }
            }
            else if (generic(kkop) == ADDRF) {
#ifdef DIAGNOSTIC            
               print ("' ARG case INDIR 2b\n");
#endif
               assert(kkp->syms[0] && kkp->syms[0]->x.name);
               src = kkp->syms[0]->x.name;
               offs = kkp->syms[0]->x.offset;
               if ((offs > -I16B_LODF_SIZE) && (offs < I16B_LODF_SIZE)) {
                  print(" word I16B_LODF + ((%s)&$1FF)<<S16B\n word I16A_RDLONG + (%s)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi\n", src, q->name); 
               }
               else {
                  print(" alignl_p1\n long I32_LODF + ((%s)&$FFFFFF)<<S32\n word I16A_RDLONG + (%s)<<D16A + RI<<S16A ' reg ARG INDIR ADDRF\n", src, q->name); 
               }
            }
            else {
#ifdef DIAGNOSTIC            
               print ("' ARG case INDIR 6\n");
#endif
               /* do nothing - argument should have been targeted to correct register already */
            }
         }
         else {
#ifdef DIAGNOSTIC            
            print ("' ARG case 6\n");
#endif
            /* do nothing - argument should have been targeted to correct register already */
         }
#ifdef DIAGNOSTIC
         print("' EMIT2 -- REG ARG\n");
#endif
         rpsize += 4;
      }
      spsize += 4;
   }
   if (op == CVI+I) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *src = preg0(intreg);
      move_if_required(dst, src, "CVII");
      if (opsize(p->x.kids[0]->op) < opsize(p->op)) {
         if (opsize(p->x.kids[0]->op) == 1) {
            print(" word I16A_SHLI + (%s)<<D16A + 24<<S16A\n", dst);
            print(" word I16A_SARI + (%s)<<D16A + 24<<S16A ' sign extend\n", dst);
         }
         else if (opsize(p->x.kids[0]->op) == 2) {
            if (dst != src) {
               print(" word I16A_MOV + (%s)<<D16A + (%s)<<S16A ' CVII\n", dst, src);
            }
            print(" word I16A_SHLI + (%s)<<D16A + 16<<S16A\n", dst);
            print(" word I16A_SARI + (%s)<<D16A + 16<<S16A ' sign extend\n", dst);
         }
      }
   }
   else if (op == CVU+I) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *src = preg0(intreg);
      move_if_required(dst, src, "CVUI");
      if (opsize(p->x.kids[0]->op) < opsize(p->op)) {
         if (opsize(p->x.kids[0]->op) == 1) {
            print(" word I16B_TRN1 + (%s)<<D16B ' zero extend\n", dst);
         }
         else if (opsize(p->x.kids[0]->op) == 2) {
            print(" word I16B_TRN2 + (%s)<<D16B ' zero extend\n", dst);
         }
      }
   }
   else if (generic(op) == CVI || generic(op) == CVU || generic(op) == LOAD) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *src = preg0(intreg);
      move_if_required(dst, src, "CVI, CVU or LOAD");
      if (opsize(p->x.kids[0]->op) < opsize(p->op)) {
         if (opsize(p->x.kids[0]->op) == 1) {
            print(" word I16B_TRN1 + (%s)<<D16B ' truncate\n", dst);
         }
         else if (opsize(p->x.kids[0]->op) == 2) {
            print(" word I16B_TRN2 + (%s)<<D16B ' truncate\n", dst);
         }
      }
   }
   else if (op == ASGN+B) {
      int size = p->syms[0]->u.c.v.u;
      print(" alignl_p1\n long I32_CPYB + %d<<S32 ' ASGNB\n", size); 
   }   
   else if (op == ARG+B) {
      int size = p->syms[0]->u.c.v.u;
      if (rpsize > 0) {
         if (rpsize < I16A_MOVI_SIZE) {
            if (rpsize) {
               print(" word I16A_SUBI + SP<<D16A + %d<<S16A ' stack space for reg ARGs\n", rpsize);
            }
         }
         else if (rpsize <= I32_LODS_MAX) {
            print(" alignl_p1\n long I32_LODS + RI<<D32S + ((%s)&$7FFFF)<<S32\n word I16A_SUB + SP<<D16A + RI<<S16A ' stack space for reg ARGs\n", rpsize);
         }
         else {
            print(" word I16B_LODL + RI<<D16B\n alignl_p1\n long %d\n word I16A_SUB + SP<<D16A + RI<<S16A ' stack space for reg ARGs\n", rpsize);
         }
         rpsize = 0;
      }
      print(" alignl_p1\n long I32_PSHB + %d<<S32 ' ARGB\n", size);
      spsize += roundup(size, 4);
   }
   /* 
    * the following code is necessary to detect cases where one or the other of the 
    * operands is already in r0 (and therefore gets clobbered by lcc) - there must 
    * be a cleaner way of doing this, but this one works ok
    */
   else if (op == ADD+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" word I16B_FLTP + FADD<<S16B ' ADDF4\n");
   }
   else if (op == SUB+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" word I16B_FLTP + FSUB<<S16B ' SUBF4\n");
   }
   else if (op == MUL+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" word I16B_FLTP + FMUL<<S16B ' MULF4\n");
   }
   else if (op == DIV+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" word I16B_FLTP + FDIV<<S16B ' DIVF4\n");
   }
   else if ((op == MUL+I) || (op == MUL+U)) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" word I16B_MULT ' MULT(I/U)\n");
   }
   else if ((op == DIV+I) || (op == MOD+I)) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" word I16B_DIVS ' DIVI\n");
   }
   else if ((op == DIV+U) || (op == MOD+U)) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" word I16B_DIVU ' DIVU\n");
   }
   else if (op == EQ+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" word I16B_FLTP + FCMP<<S16B\n alignl_p1\n long I32_BR_Z + (@%s)<<S32 ' EQF4\n", p->syms[0]->x.name);
   }
   else if (op == NE+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" word I16B_FLTP + FCMP<<S16B\n alignl_p1\n long I32_BRNZ + (@%s)<<S32 ' NEF4\n", p->syms[0]->x.name);
   }
   else if (op == GE+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" word I16B_FLTP + FCMP<<S16B\n alignl_p1\n long I32_BRAE + (@%s)<<S32 ' GEF4\n", p->syms[0]->x.name);
   }
   else if (op == GT+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" word I16B_FLTP + FCMP<<S16B\n alignl_p1\n long I32_BR_A + (@%s)<<S32 ' GTF4\n", p->syms[0]->x.name);
   }
   else if (op == LE+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" word I16B_FLTP + FCMP<<S16B\n alignl_p1\n long I32_BRBE + (@%s)<<S32 ' LEF4\n", p->syms[0]->x.name);
   }
   else if (op == LT+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" word I16B_FLTP + FCMP<<S16B\n alignl_p1\n long I32_BR_B + (@%s)<<S32 ' LTF4\n", p->syms[0]->x.name);
   }
 
   /*
    * The following code saves some instructions by detecting when
    * the destination register already holds one of the operands 
    */
   else if ((op == ADD+I) || (op == ADD+P)) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *op1 = preg0(intreg);
      char *op2 = preg1(intreg);
      if (strcmp(dst, op1) == 0) {
         print (" word I16A_ADDS + (%s)<<D16A + (%s)<<S16A ' ADDI/P (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" word I16A_ADDS + (%s)<<D16A + (%s)<<S16A ' ADDI/P (2)\n", dst, op1);
      }
      else {
         move_if_required(dst, op1, "ADDI/P");
         print (" word I16A_ADDS + (%s)<<D16A + (%s)<<S16A ' ADDI/P (3)\n", dst, op2);
      }
   }
   else if (op == ADD+U) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *op1 = preg0(intreg);
      char *op2 = preg1(intreg);
      if (strcmp(dst, op1) == 0) {
         print (" word I16A_ADD + (%s)<<D16A + (%s)<<S16A ' ADDU (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" word I16A_ADD + (%s)<<D16A + (%s)<<S16A ' ADDU (2)\n", dst, op1);
      }
      else {
         move_if_required(dst, op1, "ADDU");
         print (" word I16A_ADD + (%s)<<D16A + (%s)<<S16A ' ADDU (3)\n", dst, op2);
      }
   }
   else if ((op == SUB+I) || (op == SUB+P)) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *op1 = preg0(intreg);
      char *op2 = preg1(intreg);
      if (strcmp(dst, op1) == 0) {
         print (" word I16A_SUBS + (%s)<<D16A + (%s)<<S16A ' SUBI/P (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" word I16A_SUBS + (%s)<<D16A + (%s)<<S16A\n word I16A_NEG + (%s)<<D16A + (%s)<<S16A ' SUBI/P (2)\n", dst, op1, dst, dst);
      }
      else {
      move_if_required(dst, op1, "SUBI/P");
         print (" word I16A_SUBS + (%s)<<D16A + (%s)<<S16A ' SUBI/P (3)\n", dst, op2);
      }
   }
   else if (op == SUB+U) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *op1 = preg0(intreg);
      char *op2 = preg1(intreg);
      if (strcmp(dst, op1) == 0) {
         print (" word I16A_SUB + (%s)<<D16A + (%s)<<S16A ' SUBU (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" word I16A_MOV + RI<<D16A + (%s)<<S16A\n word I16A_SUB + RI<<D16A + (%s)<<S16A\n word I16A_MOV + (%s)<<D16A + RI<<S16A ' SUBU (2)\n", op1, op2, dst);
      }
      else {
         move_if_required(dst, op1, "SUBU");
         print (" word I16A_SUB + (%s)<<D16A + (%s)<<S16A ' SUBU (3)\n", dst, op2);
      }
   }
   else if ((op == BOR+I) || (op == BOR+U)) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *op1 = preg0(intreg);
      char *op2 = preg1(intreg);
      if (strcmp(dst, op1) == 0) {
         print (" word I16A_OR + (%s)<<D16A + (%s)<<S16A ' BORI/U (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" word I16A_OR + (%s)<<D16A + (%s)<<S16A ' BORI/U (2)\n", dst, op1);
      }
      else {
         move_if_required(dst, op1, "BORI/U");
         print (" word I16A_OR + (%s)<<D16A + (%s)<<S16A ' BORI/U (3)\n", dst, op2);
      }
   }
   else if ((op == BAND+I) || (op == BAND+U)) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *op1 = preg0(intreg);
      char *op2 = preg1(intreg);
      if (strcmp(dst, op1) == 0) {
         print (" word I16A_AND + (%s)<<D16A + (%s)<<S16A ' BANDI/U (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" word I16A_AND + (%s)<<D16A + (%s)<<S16A ' BANDI/U (2)\n", dst, op1);
      }
      else {
         move_if_required(dst, op1, "BANDI/U");
         print (" word I16A_AND + (%s)<<D16A + (%s)<<S16A ' BANDI/U (3)\n", dst, op2);
      }
   }
   else if ((op == BXOR+I) || (op == BXOR+U)) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *op1 = preg0(intreg);
      char *op2 = preg1(intreg);
      if (strcmp(dst, op1) == 0) {
         print (" word I16A_XOR + (%s)<<D16A + (%s)<<S16A ' BXORI/U (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" word I16A_XOR + (%s)<<D16A + (%s)<<S16A ' BXORI/U (2)\n", dst, op1);
      }
      else {
         move_if_required(dst, op1, "BXORI/U");
         print (" word I16A_XOR + (%s)<<D16A + (%s)<<S16A ' BXORI/U (3)\n", dst, op2);
      }
   }
   else if ((op == LSH+I) || (op == LSH+U)) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *op1 = preg0(intreg);
      char *op2 = preg1(intreg);
      if (strcmp(dst, op1) == 0) {
         print (" word I16A_SHL + (%s)<<D16A + (%s)<<S16A ' LSHI/U (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" word I16A_MOV + RI<<D16A + (%s)<<S16A\n word I16A_SHL + RI<<D16A + (%s)<<S16A\n word I16A_MOV + (%s)<<D16A + RI<<S16A ' SHLI/U (2)\n", op1, op2, dst);
      }
      else {
         move_if_required(dst, op1, "LSHI/U");
         print (" word I16A_SHL + (%s)<<D16A + (%s)<<S16A ' LSHI/U (3)\n", dst, op2);
      }
   }
   else if (op == RSH+I) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *op1 = preg0(intreg);
      char *op2 = preg1(intreg);
      if (strcmp(dst, op1) == 0) {
         print (" word I16A_SAR + (%s)<<D16A + (%s)<<S16A ' RSHI (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" word I16A_MOV + RI<<D16A + (%s)<<S16A\n word I16A_SAR + RI<<D16A + (%s)<<S16A\n word I16A_MOV + (%s)<<D16A + RI<<S16A ' RSHI (2)\n", op1, op2, dst);
      }
      else {
         move_if_required(dst, op1, "RSHI");
         print (" word I16A_SAR + (%s)<<D16A + (%s)<<S16A ' RSHI (3)\n", dst, op2);
      }
   }
   else if (op == RSH+U) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *op1 = preg0(intreg);
      char *op2 = preg1(intreg);
      if (strcmp(dst, op1) == 0) {
         print (" word I16A_SHR + (%s)<<D16A + (%s)<<S16A ' RSHU (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" word I16A_MOV + RI<<D16A + (%s)<<S16A\n word I16A_SHR + RI<<D16A + (%s)<<S16A\n word I16A_MOV + (%s)<<D16A + RI<<S16A ' RSHU (2)\n", op1, op2, dst);
      }
      else {
         move_if_required(dst, op1, "RSHU");
         print (" word I16A_SHR + (%s)<<D16A + (%s)<<S16A ' RSHU (3)\n", dst, op2);
      }
   }
}

#ifdef REG_PASSING
static Symbol argreg(int argno) {
#ifdef DIAGNOSTIC
   printf("' ARG %d ", argno);
#endif
   /* arguments 0 .. NUM_PASSING_REGS - 1 (in order of being pushed) may use registers  */
   if (argno >= NUM_PASSING_REGS) {

#ifdef DIAGNOSTIC
      printf("MUST USE STACK\n");
#endif
      return NULL;
   }
   else {
#ifdef DIAGNOSTIC
      printf("MAY USE REG %d\n", FIRST_PASSING_REG + argno);
#endif
      return intreg[FIRST_PASSING_REG + argno];
   }
}
#endif

static void doarg(Node p) {
   static int argno;

   assert(p && p->syms[0]);

#ifdef REG_PASSING

   if (argoffset == 0) {
      argno = 0;
   }
   p->x.argno = argno++;

#endif

   mkactual(4, p->syms[0]->u.c.v.i);
}

static void blkfetch(int k, int off, int reg, int tmp) {}
static void blkstore(int k, int off, int reg, int tmp) {}
static void blkloop(int dreg, int doff, int sreg, int soff, int size, int tmps[]) {}

static void local(Symbol p) {
   if (askregvar(p, (*IR->x.rmap)(ttob(p->type))) == 0) {
      assert(p->sclass == AUTO);
      offset = roundup(offset + p->type->size, p->type->align < 4 ? 4 : p->type->align);
      p->x.offset = -offset;
      p->x.name = stringd(-offset);
   }
}

static void function(Symbol f, Symbol caller[], Symbol callee[], int n) {
   int nextreg;
   int i, nump;
   int ismain;
   int varargs;
   int args_in_frame;
   int need_frame;
   unsigned saveimask;
   unsigned savefmask;

#ifdef REG_PASSING
   Symbol r;
#endif

   usedmask[0] = usedmask[1] = 0;
   freemask[0] = freemask[1] = ~(unsigned)0;

   need_frame = 0;

   args_in_frame = 0;

   offset = maxoffset = maxargoffset = 0;

   print("\n alignl_label\n%s ' <symbol:%s>\n", f->x.name, f->name);
#ifdef PRINT_SYMBOL_INFO
   fprintf(stderr,"\nfunction %s\n", f->x.name);
#endif

   ismain = (strcmp(f->x.name,"C_main") == 0);

   if (ismain && (variadic(f->type))) {
      error("main function cannot be variadic");
   }   

   offset = 8; /* leave space for PC & FP */

#ifndef REG_PASSING
   /* all parameters passed on stack */
   for (i = 0; callee[i]; i++) {
      Symbol p = callee[i];
      Symbol q = caller[i];
      assert(q);
      p->x.offset = q->x.offset = offset;
      p->x.name = q->x.name = stringf("%d", p->x.offset);
      p->sclass = q->sclass = AUTO;
      offset += roundup(q->type->size, 4);
   }
#else
   /* pass parameters in registers where possible - this complicates variadic functions */

   for (nump = 0; callee[nump]; nump++) {
      ; /* just count the number of parameters */
#ifdef DIAGNOSTIC
      printf("' parameter name %s\n", callee[nump]->name);
#endif      
   }
   if (ismain && (nump > 2)) {
      error("main function can have at most two arguments");
   }   
#ifdef OLD_VARIADIC
   varargs = variadic(f->type) || ((nump > 0) && strcmp(callee[nump-1]->name, "va_alist") == 0);
#else   
   varargs = variadic(f->type);
#endif   
#ifdef DIAGNOSTIC
   if (varargs) {
      printf("' VARIADIC FUNCTION %s\n", f->x.name);
   }
#endif

   for (i = 0; callee[i]; i++) {
      Symbol p = callee[i];
      Symbol q = caller[i];

      if (((nump - i - 1) < NUM_PASSING_REGS) && !varargs) {
         r = argreg(nump - i - 1);
      }
      else {
         r = NULL;
      }
      if (r != NULL && !isstruct(q->type) && !p->addressed) {
         if (n == 0) {
#ifdef DIAGNOSTIC
            printf("' ARG %d (OFFSET %d) USES REG PASSING (LEAF)\n", i, offset);
#endif
            p->sclass = q->sclass = REGISTER;
            p->x.offset = q->x.offset = offset;
            if (askregvar(p, r) == 0) {
#ifdef PRINT_SYMBOL_INFO
               fprintf(stderr, "CANNOT MAKE REG VAR for ARG %d!!\n", i);
#endif
               assert(0);
            }
            q->x = p->x;
            q->type = p->type;
         }
         else {
#ifdef DIAGNOSTIC
            printf("' ARG %d OFFSET (%d) USES REG PASSING (NON-LEAF)\n", i, offset);
#endif
            p->sclass = q->sclass = REGISTER;
            p->x.offset = q->x.offset = offset;
            if (askregvar(p, rmap(ttob(p->type))) == 0) {
#ifdef PRINT_SYMBOL_INFO
               fprintf(stderr, "CANNOT MAKE REG VAR for ARG %d!!\n", i);
#endif
               assert(0);
            }
            assert(p->x.regnode);
            q->type = p->type;
         }
      }
      else {
#ifdef DIAGNOSTIC
         printf("' ARG %d (OFFSET %d) CANNOT USE REG PASSING\n", i, offset);
#endif
         p->x.offset = q->x.offset = offset;
         p->x.name = q->x.name = stringf("%d", p->x.offset);
         p->sclass = q->sclass = AUTO;
         args_in_frame = 1;
      }
      offset += roundup(q->type->size, 4);
   }
#endif
   assert(caller[i] == 0);

#ifdef DIAGNOSTIC
   printf("' PRE-GENCODE  OFFSET=%d, MAXOFFSET=%d, MAXARGOFFSET=%d\n", offset, maxoffset, maxargoffset);
#endif

#ifdef SUPPORT_ALLOCA
   calls_alloca = 0;
#endif
   offset = maxoffset = 4; /* new NEWF and RETF add a long to the frame for SP */

   gencode(caller, callee);

#ifdef DIAGNOSTIC
   printf("' POST-GENCODE OFFSET=%d, MAXOFFSET=%d, MAXARGOFFSET=%d\n", offset, maxoffset, maxargoffset);
#endif

#ifdef DIAGNOSTIC
   printf("' USEDMASK[IREG]=%lx\n", usedmask[IREG]);
   printf("' USEDMASK[FREG]=%lx\n", usedmask[FREG]);
#endif
   saveimask = usedmask[IREG] & (INTVAR|INTTMP);
   savefmask = usedmask[FREG] & (FLTVAR|FLTTMP);
   framesize = roundup(maxoffset, 4);

#ifdef DIAGNOSTIC
   printf("' PRE-FRAMESIZE=%d\n", framesize);
#endif

   need_frame = (framesize > 4) || args_in_frame || varargs || (glevel > 1);
#ifdef SUPPORT_ALLOCA
   need_frame |= (n > 0);
#endif
   if (need_frame) {
#ifdef REG_PASSING            
      if (ismain) {
         /* main does not get called the normal way - so simulate it */
         printf(" word I16A_MOVI + RI<<D16A + 8<<S16A\n word I16A_SUB + SP<<D16A + RI<<S16A\n");
#ifdef OLD_VARIADIC
         printf(" word I16A_MOVI + BC<<D16A + 8<<S16A\n");
#endif
      }
#endif         
      print(" alignl_p1\n long I32_NEWF + %d<<S32\n", framesize-4);
   }
   if (ismain) {
      print ("#ifdef libthreads\n");
      print (" alignl_p1\n long I32_CALA + @C_thread_setup<<S32\n");
      print ("#endif\n");
      print ("#ifndef NO_ARGS\n");
      print (" alignl_p1\n long I32_CALA + @C_arg_setup<<S32\n");
      print ("#endif\n");
      if (glevel > 0) {
         print (" alignl_p1\n long I32_CALA + @C_debug_init<<S32\n");
      }
   }
   else {
#ifdef DIAGNOSTIC
      printf("' SAVEMASK=%x\n", (saveimask | savefmask) & 0xfffffe);
#endif
      if (((saveimask | savefmask) & 0xfffffe) != 0) {
         print (" alignl_p1\n long I32_PSHM + $%x<<S32 ' save registers\n", (saveimask | savefmask) & 0xfffffe);
      }
   }
#ifdef REG_PASSING
   if (varargs) {
#ifdef OLD_VARIADIC      
      /* variadic functions must spill all reg arguments to stack, even if the */
      /* caller doesn't use all the possible reg arguments - but we must be */
      /* careful to only use the available space - i.e. from FP + 8 to BC */
      /* ensure there is enough space to do this! */
      print(" word I16B_LODF + 8<<S16B\n");
      for (i = 0; i < NUM_PASSING_REGS; i++) {
         print(" alignl_p1\n long I32_SPILL + r%d<<D32 ' spill reg (varadic)\n", FIRST_PASSING_REG + i);
      }
#endif      
   }
   else {
      /* non-variadic functions may need to spill individual arguments, and in any case will */
      /* usually need to map registers used to pass arguments to registers used in the function */
      for (i = 0; i < nump; i++) {
         if (((nump - i - 1) < NUM_PASSING_REGS)) {
            r = argreg(nump - i - 1);
         }
         else {
            r = NULL;
         }
         if (r != NULL && !isstruct(callee[i]->type)) {
            if (r->x.regnode != callee[i]->x.regnode) {
               Symbol in  = caller[i];
               Symbol out = callee[i];
               char * ins = r->x.name;
               char * outs = out->x.name;
      
               assert(out && in && r && r->x.regnode);
               if (out->sclass == REGISTER) {
                  move_if_required(outs, ins, "reg var <- reg arg");
               }
               else {
                  if ((out->x.offset > -I16B_LODF_SIZE) && (out->x.offset < I16B_LODF_SIZE)) {
                     print(" word I16B_LODF + ((%d)&$1FF)<<S16B\n word I16A_WRLONG + (%s)<<D16A + RI<<S16A ' spill reg\n", out->x.offset, ins); 
                  }
                  else {
                    print(" alignl_p1\n long I32_LODF + ((%d)&$FFFFFF)<<S32\n word I16A_WRLONG + (%s)<<D16A + RI<<D16A ' spill reg\n", out->x.offset, ins);
                  }
               }
            }
         }
      }
   }
#endif

   emitcode();

#ifdef DIAGNOSTIC
   printf("' POST-FRAMESIZE=%d\n", framesize);
#endif

   if (ismain) {
      /* main routine never returns - if it never even exits, define  */
      /* NO_EXIT to disable the generation of the jump to exit. */
      print("#ifndef NO_EXIT\n");
      print(" alignl_p1\n long I32_JMPA + (@C__exit)<<S32\n");
      print("#endif\n");
   }
   else {
#ifdef DIAGNOSTIC
      printf("' SAVEMASK=%x\n", (saveimask | savefmask) & 0xfffffe);
#endif
#ifdef SUPPORT_ALLOCA
      if (calls_alloca) {
         print (" word I16B_EXEC\n");
         print (" alignl\n");
         print (" mov RI, FP    ' restore SP ... \n");
         print (" sub RI, #4    ' ... from SP stored in frame ...\n");
         print (" rdlong SP, RI ' ... because alloca was used\n");
         print (" jmp #EXEC_STOP\n");
      }
#endif
      need_frame = (framesize > 4) || args_in_frame || varargs || (glevel > 1);
#ifdef SUPPORT_ALLOCA
      need_frame |= (n > 0);
#endif
      if (need_frame) {
         if ((framesize-4)/4 < I16B_POPM_SIZE) {
            if (((saveimask | savefmask) & 0xfffffe) != 0) {
               print (" word I16B_POPM + %d<<S16B ' restore registers, do pop frame, do return\n", (framesize-4)/4);
            }
            else {
               print(" word I16B_RETF + %d<<S32\n", framesize-4);
            }
         }
         else {
            if (((saveimask | savefmask) & 0xfffffe) != 0) {
               print (" word I16B_POPM + $180<<S16B ' restore registers, do not pop frame, do not return\n");
            }
            print(" alignl_p1\n long I32_RETF + %d<<S32\n", framesize-4);
         }
      }
      else {
         if (((saveimask | savefmask) & 0xfffffe) != 0) {
            print (" word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return\n");
         }
         else {
            print(" word I16B_RETN\n alignl_p1\n");
         }
      }
   }
   /* after each function, ensure we are long aligned */
   print(" alignl_p1\n");

#ifdef PRINT_SYMBOL_INFO
   fprintf(stderr,"\n%s done\n", f->x.name);
#endif
   
}

/* 
 * mangled_name: Generates a name guaranteed to be no more than 
 *               MAX_NAME_LENGTH characters, of the form 
 *               "prefix[_symbol][_Lnnnnnn]" 
 *
 * Since the propeller assembler is not case sensitive, symbol names
 * with different case have to be explicitly differentiated - this
 * is done by appending underscores to all capital letters - for
 * example "Hydra_XTreme" becomes "H_ydra_X_T_reme".
 *
 * The numeric suffix is appended when explicitly requested, when 
 * the symbol is null, or in any case when the whole name would 
 * otherwise end up longer than MAX_NAME_LENGTH characters.
 *
 */
static char *mangled_name(char *prefix, char *symbol, int suffix) {
   static char buf[3 * MAX_NAME_LENGTH + 3];
   int   i, j, k;
   char  c;

   j = 0;
   for (i = 0; i < MAX_NAME_LENGTH && ((c = prefix[i]) != '\0'); i++) {
      buf[j++] = c;
   }
   if (symbol != NULL) {
      buf[j++] = '_';
      for (i = 0; i < MAX_NAME_LENGTH && ((c = symbol[i]) != '\0'); i++) {
         buf[j++] = c;
         if (isupper (c)) {
            buf[j++] = '_';
         }
      }
   }
   buf[j] = '\0';
   k = 0;
   if (j > MAX_NAME_LENGTH) {
      k = MAX_NAME_LENGTH - 8;
   }
   if (suffix) {
     if (j < MAX_NAME_LENGTH - 8) {
        k = j;
     }
     else {
        k = MAX_NAME_LENGTH - 8;
     }
   }
   if (k > 0) {
      sprintf(&buf[k],"_L%06d\0", genlabel(1));
   }
   return buf;
}

static void defsymbol(Symbol p) {
   int  i, j;
   char *tmp_name;
   char temp_now[8+1+1];
   char temp_prefix[L_tmpnam + 8 + 1];
   unsigned long now = (unsigned long)time(NULL);

   /* "C_" prefix is used for disambiguation with PASM or SPIN symbols */
#ifdef PRINT_SYMBOL_INFO
   fprintf(stderr,"Defining Symbol %s\n", p->name);
#endif
   if (p->scope >= LOCAL && p->sclass == STATIC) {
      p->x.name = strdup(mangled_name((cfunc?cfunc->x.name:"C"), p->name, 1));
   }
   if (p->scope >= GLOBAL && p->sclass == STATIC) {
      /* TODO: this may generate the same name for different statics in  */
      /* different files, which would result in the symbol being multiply */
      /* defined. One solution would be to use the filename, but there is no */
      /* mechanism in lcc to get the name of the source file without  */
      /* turning on the generation of symbol table information (i.e. via */
      /* the -g option to rcc). So currently we use a temporary filename, */
      /* with further disambiguation provided by including the time of */
      /* the compile */
      tmp_name = tmpnam(NULL);
      strcpy(temp_prefix,"C_");
      j = 2;
      for (i = 0; (i < L_tmpnam) && (tmp_name[i] != '\0'); i++) {
         if (isalnum(tmp_name[i])) {
            temp_prefix[j++] = tmp_name[i];
         }
      }
      sprintf(temp_now, "_%08lx", now);
      for (i = 0; i < 9; i++) {
         temp_prefix[j++]=temp_now[i];
      }
      temp_prefix[j] = '\0';
      p->x.name = strdup(mangled_name((cfunc?cfunc->x.name:temp_prefix), p->name, 1));
   }
   else if (p->generated) {
      p->x.name = strdup(mangled_name((cfunc?cfunc->x.name:"C"), p->name, 0));
   }
   else if (p->scope == GLOBAL || p->sclass == EXTERN) {
      p->x.name = strdup(mangled_name("C", p->name, 0));
   }
   else if (p->scope == CONSTANTS) {
      /* constants are generated 'in line' */
      int cnst = p->u.c.v.i;
      tmp_name = p->name;
      if ((tmp_name[0] == '0') && (tmp_name[1] == 'x')) {
          p->x.name = stringf("$%s", &tmp_name[2]);
#ifdef PRINT_SYMBOL_INFO
         fprintf(stderr,"Hex constant %s\n", p->x.name);
#endif
      }
      else {
          p->x.name = stringf("%s", p->name);
#ifdef PRINT_SYMBOL_INFO
         fprintf(stderr,"Nonhex constant %s\n", p->x.name);
#endif
      }
#ifdef PRINT_SYMBOL_INFO
      fprintf(stderr,"In Line Symbol %s, %d\n", p->x.name, p->type);
#endif
   }
   else {
      p->x.name = strdup(mangled_name("C", p->name, 0));
   }
#ifdef PRINT_SYMBOL_INFO
   fprintf(stderr,"Symbol ended up named %s\n", p->x.name);
#endif
}


static void address(Symbol q, Symbol p, long n) {
   if (p->scope == GLOBAL || p->sclass == STATIC || p->sclass == EXTERN)
      q->x.name = stringf("%s%s%D", p->x.name, n >= 0 ? "+" : "", n);
   else {
      assert(n <= INT_MAX && n >= INT_MIN);
      q->x.offset = p->x.offset + n;
      q->x.name = stringd(q->x.offset);
   }
}

static void defconst(int suffix, int size, Value v) {
   if (suffix == I && size == 1)
      print(" byte %d\n",   v.u);
   else if (suffix == I && size == 2)
      print(" word %d\n",   v.i);
   else if (suffix == I && size == 4)
      print(" long %d\n",   v.i);
   else if (suffix == U && size == 1)
      print(" byte $%x\n", (unsigned)((unsigned char)v.u));
   else if (suffix == U && size == 2)
      print(" word $%x\n", (unsigned)((unsigned short)v.u));
   else if (suffix == U && size == 4)
      print(" long $%x\n", (unsigned)v.u);
   else if (suffix == P && size == 4)
      print(" long $%x\n", v.p);
   else if (suffix == F && size == 4) {
      float f = v.d;
      print(" long $%x ' float\n", *(unsigned *)&f);
   }
   else assert(0);
}

static void defaddress(Symbol p) {
   print(" long @%s\n", p->x.name);
   p->ref++;
}

static void defstring(int n, char *str) {
   char *s;

   for (s = str; s < str + n; s++) {
      print(" byte %d\n", (*s)&0377);
   }
}

static void export(Symbol p) {
   print("\n' Catalina Export %s\n", p->name);
}

static void import(Symbol p) {
   int oldseg = cseg;

   if ((p->ref > 0) && (!p->defined)) {
#ifdef SUPPORT_PASM
      if (strcmp(p->name, "PASM") == 0) {
         return;
      }
#endif
#ifdef SUPPORT_ALLOCA
      if (strcmp(p->name, "__builtin_alloca") == 0) {
         return;
      }
#endif
      segment(CODE);
      print("\n' Catalina Import %s\n", p->name);
      segment(oldseg);
   }
}

static void global(Symbol p) {
   print("\n alignl_label\n");
   print("%s ' <symbol:%s>\n", p->x.name, p->name);
}

static void space(int n) {
   print(" byte 0[%d]\n", n);
}


Interface catalina_compactIR = {
   1, 1, 0,  /* char */
   2, 2, 0,  /* short */
   4, 4, 0,  /* int */
   4, 4, 0,  /* long */
   4, 4, 0,  /* long long */
   4, 4, 1,  /* float */
   4, 4, 1,  /* double */
   4, 4, 1,  /* long double */
   4, 4, 0,  /* pointer * */
   0, 1, 0,  /* struct */
   1,        /* little_endian */
   0,        /* mulops_calls */
   0,        /* wants_callb */
   0,        /* wants_argb  - MUST BE 0 WHEN REG_PASSING */
   0,        /* left_to_right - MUST BE 0 WHEN REG_PASSING */
   0,        /* wants_dag */
   1,        /* unsigned_char */
   address,
   blockbeg,
   blockend,
   defaddress,
   defconst,
   defstring,
   defsymbol,
   emit,
   export,
   function,
   gen,
   global,
   import,
   local,
   progbeg,
   progend,
   segment,
   space,
#ifdef DEBUGGER_SUPPORT
   my_stabblock,  /* stabblock */ 
   my_stabend,    /* stabend */   
   my_stabfend,   /* stabfend */  
   my_stabinit,   /* stabinit */  
   my_stabline,   /* stabline */  
   my_stabsym,    /* stabsym */   
   my_stabtype,   /* stabtype */  
#else
   0,          /* stabblock */
   0,          /* stabend */
   0,          /* stabfend */
   my_stabinit,   /* stabinit */
   my_stabline,   /* stabline */
   my_stabsym,    /* stabsym */
   0,          /* stabtype */
#endif 
   {   
      1, 
      rmap,
      blkfetch, blkstore, blkloop,
      _label,
      _rule,
      _nts,
      _kids,
      _string,
      _templates,
      _isinstruction,
      _ntname,
      emit2,
      doarg,
      target,
      clobber,
   }
};
