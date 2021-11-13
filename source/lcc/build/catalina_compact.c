
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
//#define DIAGNOSTIC

/*
 * DEBUGGER_SUPPORT is used to include symbol table info.
 */ 
#define DEBUGGER_SUPPORT

/*
 * DEBUG_IN_OUTPUT_PATH is used to direct debug files to the path
 * used for ouptut files - otherwise, debug files go in the current
 * working directory.
 */
//#define DEBUG_IN_OUTPUT_PATH   

/*
 * PRINT_SYMBOL_INFO is used to print debug messges (on stderr) as
 * various symbols (mainly function and constant symbols) are defined. 
 * This flag is not defined by default.
 */
//#define PRINT_SYMBOL_INFO

/*
 * ALIGN_LINES_LONG_FOR_DEBUG causes the start of each line to be aligned
 * to a long boundary.
 */
//#define ALIGN_LINES_LONG_FOR_DEBUG


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

//#define INTTMP 0x00003fc0
//#define INTVAR 0x00ffc000

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
//static Symbol fltreg[32]; // Catalina 3.7
static int special_name(char *);
static int special(Node);
static int power_of_2(Node);
static int power_of_2_greater_than_31(Node);
static int in_place_special(Node);

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

static Symbol charregw, shortregw, intregw; // , fltregw; // Catalina 3.7

static int cseg;

/*
generated at Fri Oct 29 15:38:53 2021
by $Id: lburg.c 355 2007-02-18 22:08:49Z drh $
*/
static void _kids(NODEPTR_TYPE, int, NODEPTR_TYPE[]);
static void _label(NODEPTR_TYPE);
static int _rule(void*, int);

#define _stmt_NT 1
#define _reg_NT 2
#define _coni_NT 3
#define _conn_NT 4
#define _conli_NT 5
#define _cons_NT 6
#define _con_NT 7
#define _addrg_NT 8
#define _special_NT 9
#define _addrl16_NT 10
#define _addrl32_NT 11

static char *_ntname[] = {
	0,
	"stmt",
	"reg",
	"coni",
	"conn",
	"conli",
	"cons",
	"con",
	"addrg",
	"special",
	"addrl16",
	"addrl32",
	0
};

struct _state {
	short cost[12];
	struct {
		unsigned int _stmt:8;
		unsigned int _reg:8;
		unsigned int _coni:3;
		unsigned int _conn:3;
		unsigned int _conli:3;
		unsigned int _cons:3;
		unsigned int _con:4;
		unsigned int _addrg:1;
		unsigned int _special:1;
		unsigned int _addrl16:2;
		unsigned int _addrl32:2;
	} rule;
};

static short _nts_0[] = { 0 };
static short _nts_1[] = { _reg_NT, 0 };
static short _nts_2[] = { _addrl16_NT, 0 };
static short _nts_3[] = { _addrl32_NT, 0 };
static short _nts_4[] = { _addrg_NT, 0 };
static short _nts_5[] = { _special_NT, 0 };
static short _nts_6[] = { _coni_NT, 0 };
static short _nts_7[] = { _conn_NT, 0 };
static short _nts_8[] = { _cons_NT, 0 };
static short _nts_9[] = { _conli_NT, 0 };
static short _nts_10[] = { _con_NT, 0 };
static short _nts_11[] = { _addrg_NT, _reg_NT, 0 };
static short _nts_12[] = { _special_NT, _reg_NT, 0 };
static short _nts_13[] = { _special_NT, _conli_NT, 0 };
static short _nts_14[] = { _addrl16_NT, _reg_NT, 0 };
static short _nts_15[] = { _addrl32_NT, _reg_NT, 0 };
static short _nts_16[] = { _reg_NT, _reg_NT, 0 };
static short _nts_17[] = { _reg_NT, _coni_NT, 0 };
static short _nts_18[] = { _special_NT, _special_NT, _conli_NT, 0 };
static short _nts_19[] = { _special_NT, _special_NT, _reg_NT, 0 };
static short _nts_20[] = { _special_NT, _special_NT, _coni_NT, 0 };
static short _nts_21[] = { _reg_NT, _conli_NT, 0 };

static short *_nts[] = {
	0,	/* 0 */
	_nts_0,	/* 1 */
	_nts_0,	/* 2 */
	_nts_0,	/* 3 */
	_nts_0,	/* 4 */
	_nts_0,	/* 5 */
	_nts_0,	/* 6 */
	_nts_0,	/* 7 */
	_nts_0,	/* 8 */
	_nts_1,	/* 9 */
	_nts_1,	/* 10 */
	_nts_1,	/* 11 */
	_nts_1,	/* 12 */
	_nts_1,	/* 13 */
	_nts_1,	/* 14 */
	_nts_1,	/* 15 */
	_nts_1,	/* 16 */
	_nts_1,	/* 17 */
	_nts_1,	/* 18 */
	_nts_1,	/* 19 */
	_nts_1,	/* 20 */
	_nts_1,	/* 21 */
	_nts_1,	/* 22 */
	_nts_1,	/* 23 */
	_nts_1,	/* 24 */
	_nts_1,	/* 25 */
	_nts_1,	/* 26 */
	_nts_0,	/* 27 */
	_nts_0,	/* 28 */
	_nts_0,	/* 29 */
	_nts_0,	/* 30 */
	_nts_0,	/* 31 */
	_nts_0,	/* 32 */
	_nts_0,	/* 33 */
	_nts_0,	/* 34 */
	_nts_0,	/* 35 */
	_nts_0,	/* 36 */
	_nts_0,	/* 37 */
	_nts_0,	/* 38 */
	_nts_0,	/* 39 */
	_nts_0,	/* 40 */
	_nts_0,	/* 41 */
	_nts_0,	/* 42 */
	_nts_0,	/* 43 */
	_nts_0,	/* 44 */
	_nts_0,	/* 45 */
	_nts_0,	/* 46 */
	_nts_0,	/* 47 */
	_nts_0,	/* 48 */
	_nts_0,	/* 49 */
	_nts_0,	/* 50 */
	_nts_0,	/* 51 */
	_nts_0,	/* 52 */
	_nts_0,	/* 53 */
	_nts_0,	/* 54 */
	_nts_0,	/* 55 */
	_nts_0,	/* 56 */
	_nts_0,	/* 57 */
	_nts_0,	/* 58 */
	_nts_0,	/* 59 */
	_nts_0,	/* 60 */
	_nts_0,	/* 61 */
	_nts_0,	/* 62 */
	_nts_0,	/* 63 */
	_nts_0,	/* 64 */
	_nts_2,	/* 65 */
	_nts_3,	/* 66 */
	_nts_4,	/* 67 */
	_nts_5,	/* 68 */
	_nts_6,	/* 69 */
	_nts_7,	/* 70 */
	_nts_8,	/* 71 */
	_nts_9,	/* 72 */
	_nts_10,	/* 73 */
	_nts_1,	/* 74 */
	_nts_1,	/* 75 */
	_nts_1,	/* 76 */
	_nts_1,	/* 77 */
	_nts_1,	/* 78 */
	_nts_1,	/* 79 */
	_nts_1,	/* 80 */
	_nts_1,	/* 81 */
	_nts_4,	/* 82 */
	_nts_4,	/* 83 */
	_nts_4,	/* 84 */
	_nts_4,	/* 85 */
	_nts_4,	/* 86 */
	_nts_4,	/* 87 */
	_nts_4,	/* 88 */
	_nts_4,	/* 89 */
	_nts_5,	/* 90 */
	_nts_5,	/* 91 */
	_nts_5,	/* 92 */
	_nts_5,	/* 93 */
	_nts_5,	/* 94 */
	_nts_5,	/* 95 */
	_nts_5,	/* 96 */
	_nts_5,	/* 97 */
	_nts_2,	/* 98 */
	_nts_2,	/* 99 */
	_nts_2,	/* 100 */
	_nts_2,	/* 101 */
	_nts_2,	/* 102 */
	_nts_2,	/* 103 */
	_nts_2,	/* 104 */
	_nts_2,	/* 105 */
	_nts_3,	/* 106 */
	_nts_3,	/* 107 */
	_nts_3,	/* 108 */
	_nts_3,	/* 109 */
	_nts_3,	/* 110 */
	_nts_3,	/* 111 */
	_nts_3,	/* 112 */
	_nts_3,	/* 113 */
	_nts_1,	/* 114 */
	_nts_1,	/* 115 */
	_nts_1,	/* 116 */
	_nts_1,	/* 117 */
	_nts_1,	/* 118 */
	_nts_1,	/* 119 */
	_nts_1,	/* 120 */
	_nts_1,	/* 121 */
	_nts_1,	/* 122 */
	_nts_1,	/* 123 */
	_nts_1,	/* 124 */
	_nts_1,	/* 125 */
	_nts_11,	/* 126 */
	_nts_11,	/* 127 */
	_nts_11,	/* 128 */
	_nts_11,	/* 129 */
	_nts_11,	/* 130 */
	_nts_11,	/* 131 */
	_nts_11,	/* 132 */
	_nts_11,	/* 133 */
	_nts_12,	/* 134 */
	_nts_12,	/* 135 */
	_nts_12,	/* 136 */
	_nts_12,	/* 137 */
	_nts_12,	/* 138 */
	_nts_12,	/* 139 */
	_nts_12,	/* 140 */
	_nts_12,	/* 141 */
	_nts_13,	/* 142 */
	_nts_13,	/* 143 */
	_nts_13,	/* 144 */
	_nts_13,	/* 145 */
	_nts_13,	/* 146 */
	_nts_13,	/* 147 */
	_nts_13,	/* 148 */
	_nts_13,	/* 149 */
	_nts_14,	/* 150 */
	_nts_14,	/* 151 */
	_nts_14,	/* 152 */
	_nts_14,	/* 153 */
	_nts_14,	/* 154 */
	_nts_14,	/* 155 */
	_nts_14,	/* 156 */
	_nts_14,	/* 157 */
	_nts_15,	/* 158 */
	_nts_15,	/* 159 */
	_nts_15,	/* 160 */
	_nts_15,	/* 161 */
	_nts_15,	/* 162 */
	_nts_15,	/* 163 */
	_nts_15,	/* 164 */
	_nts_15,	/* 165 */
	_nts_16,	/* 166 */
	_nts_16,	/* 167 */
	_nts_16,	/* 168 */
	_nts_16,	/* 169 */
	_nts_16,	/* 170 */
	_nts_16,	/* 171 */
	_nts_16,	/* 172 */
	_nts_16,	/* 173 */
	_nts_4,	/* 174 */
	_nts_4,	/* 175 */
	_nts_4,	/* 176 */
	_nts_4,	/* 177 */
	_nts_4,	/* 178 */
	_nts_1,	/* 179 */
	_nts_1,	/* 180 */
	_nts_1,	/* 181 */
	_nts_1,	/* 182 */
	_nts_1,	/* 183 */
	_nts_1,	/* 184 */
	_nts_1,	/* 185 */
	_nts_1,	/* 186 */
	_nts_1,	/* 187 */
	_nts_6,	/* 188 */
	_nts_6,	/* 189 */
	_nts_6,	/* 190 */
	_nts_8,	/* 191 */
	_nts_8,	/* 192 */
	_nts_8,	/* 193 */
	_nts_9,	/* 194 */
	_nts_9,	/* 195 */
	_nts_9,	/* 196 */
	_nts_10,	/* 197 */
	_nts_10,	/* 198 */
	_nts_10,	/* 199 */
	_nts_10,	/* 200 */
	_nts_1,	/* 201 */
	_nts_1,	/* 202 */
	_nts_1,	/* 203 */
	_nts_1,	/* 204 */
	_nts_1,	/* 205 */
	_nts_1,	/* 206 */
	_nts_1,	/* 207 */
	_nts_1,	/* 208 */
	_nts_1,	/* 209 */
	_nts_1,	/* 210 */
	_nts_1,	/* 211 */
	_nts_1,	/* 212 */
	_nts_1,	/* 213 */
	_nts_1,	/* 214 */
	_nts_1,	/* 215 */
	_nts_1,	/* 216 */
	_nts_1,	/* 217 */
	_nts_1,	/* 218 */
	_nts_1,	/* 219 */
	_nts_1,	/* 220 */
	_nts_1,	/* 221 */
	_nts_17,	/* 222 */
	_nts_17,	/* 223 */
	_nts_17,	/* 224 */
	_nts_16,	/* 225 */
	_nts_16,	/* 226 */
	_nts_16,	/* 227 */
	_nts_16,	/* 228 */
	_nts_16,	/* 229 */
	_nts_16,	/* 230 */
	_nts_16,	/* 231 */
	_nts_16,	/* 232 */
	_nts_16,	/* 233 */
	_nts_16,	/* 234 */
	_nts_17,	/* 235 */
	_nts_17,	/* 236 */
	_nts_17,	/* 237 */
	_nts_16,	/* 238 */
	_nts_16,	/* 239 */
	_nts_16,	/* 240 */
	_nts_16,	/* 241 */
	_nts_16,	/* 242 */
	_nts_16,	/* 243 */
	_nts_16,	/* 244 */
	_nts_16,	/* 245 */
	_nts_16,	/* 246 */
	_nts_16,	/* 247 */
	_nts_16,	/* 248 */
	_nts_16,	/* 249 */
	_nts_16,	/* 250 */
	_nts_16,	/* 251 */
	_nts_17,	/* 252 */
	_nts_17,	/* 253 */
	_nts_16,	/* 254 */
	_nts_16,	/* 255 */
	_nts_17,	/* 256 */
	_nts_17,	/* 257 */
	_nts_12,	/* 258 */
	_nts_12,	/* 259 */
	_nts_18,	/* 260 */
	_nts_18,	/* 261 */
	_nts_19,	/* 262 */
	_nts_19,	/* 263 */
	_nts_18,	/* 264 */
	_nts_18,	/* 265 */
	_nts_19,	/* 266 */
	_nts_19,	/* 267 */
	_nts_18,	/* 268 */
	_nts_18,	/* 269 */
	_nts_19,	/* 270 */
	_nts_19,	/* 271 */
	_nts_20,	/* 272 */
	_nts_20,	/* 273 */
	_nts_18,	/* 274 */
	_nts_18,	/* 275 */
	_nts_19,	/* 276 */
	_nts_19,	/* 277 */
	_nts_20,	/* 278 */
	_nts_20,	/* 279 */
	_nts_18,	/* 280 */
	_nts_18,	/* 281 */
	_nts_19,	/* 282 */
	_nts_19,	/* 283 */
	_nts_20,	/* 284 */
	_nts_20,	/* 285 */
	_nts_18,	/* 286 */
	_nts_18,	/* 287 */
	_nts_19,	/* 288 */
	_nts_19,	/* 289 */
	_nts_20,	/* 290 */
	_nts_20,	/* 291 */
	_nts_18,	/* 292 */
	_nts_18,	/* 293 */
	_nts_19,	/* 294 */
	_nts_19,	/* 295 */
	_nts_16,	/* 296 */
	_nts_16,	/* 297 */
	_nts_16,	/* 298 */
	_nts_16,	/* 299 */
	_nts_16,	/* 300 */
	_nts_16,	/* 301 */
	_nts_16,	/* 302 */
	_nts_16,	/* 303 */
	_nts_16,	/* 304 */
	_nts_16,	/* 305 */
	_nts_16,	/* 306 */
	_nts_16,	/* 307 */
	_nts_16,	/* 308 */
	_nts_16,	/* 309 */
	_nts_16,	/* 310 */
	_nts_16,	/* 311 */
	_nts_16,	/* 312 */
	_nts_16,	/* 313 */
	_nts_17,	/* 314 */
	_nts_17,	/* 315 */
	_nts_17,	/* 316 */
	_nts_17,	/* 317 */
	_nts_17,	/* 318 */
	_nts_17,	/* 319 */
	_nts_17,	/* 320 */
	_nts_17,	/* 321 */
	_nts_17,	/* 322 */
	_nts_17,	/* 323 */
	_nts_17,	/* 324 */
	_nts_17,	/* 325 */
	_nts_21,	/* 326 */
	_nts_21,	/* 327 */
	_nts_21,	/* 328 */
	_nts_21,	/* 329 */
	_nts_21,	/* 330 */
	_nts_21,	/* 331 */
	_nts_21,	/* 332 */
	_nts_21,	/* 333 */
	_nts_21,	/* 334 */
	_nts_21,	/* 335 */
	_nts_21,	/* 336 */
	_nts_21,	/* 337 */
	_nts_1,	/* 338 */
	_nts_16,	/* 339 */
	_nts_2,	/* 340 */
	_nts_3,	/* 341 */
	_nts_4,	/* 342 */
	_nts_1,	/* 343 */
	_nts_4,	/* 344 */
	_nts_0,	/* 345 */
	_nts_10,	/* 346 */
	_nts_10,	/* 347 */
	_nts_10,	/* 348 */
	_nts_10,	/* 349 */
	_nts_6,	/* 350 */
	_nts_6,	/* 351 */
	_nts_6,	/* 352 */
	_nts_6,	/* 353 */
	_nts_1,	/* 354 */
	_nts_1,	/* 355 */
	_nts_1,	/* 356 */
	_nts_1,	/* 357 */
	_nts_0,	/* 358 */
	_nts_0,	/* 359 */
	_nts_0,	/* 360 */
	_nts_0,	/* 361 */
	_nts_0,	/* 362 */
	_nts_0,	/* 363 */
	_nts_0,	/* 364 */
	_nts_0,	/* 365 */
	_nts_0,	/* 366 */
	_nts_0,	/* 367 */
	_nts_0,	/* 368 */
	_nts_0,	/* 369 */
	_nts_0,	/* 370 */
	_nts_0,	/* 371 */
	_nts_0,	/* 372 */
	_nts_0,	/* 373 */
	_nts_0,	/* 374 */
	_nts_0,	/* 375 */
	_nts_0,	/* 376 */
	_nts_0,	/* 377 */
	_nts_0,	/* 378 */
	_nts_0,	/* 379 */
	_nts_0,	/* 380 */
	_nts_0,	/* 381 */
};

static char *_templates[] = {
/* 0 */	0,
/* 1 */	"# read register\n",	/* reg: INDIRI1(VREGP) */
/* 2 */	"# read register\n",	/* reg: INDIRU1(VREGP) */
/* 3 */	"# read register\n",	/* reg: INDIRI2(VREGP) */
/* 4 */	"# read register\n",	/* reg: INDIRU2(VREGP) */
/* 5 */	"# read register\n",	/* reg: INDIRI4(VREGP) */
/* 6 */	"# read register\n",	/* reg: INDIRU4(VREGP) */
/* 7 */	"# read register\n",	/* reg: INDIRP4(VREGP) */
/* 8 */	"# read register\n",	/* reg: INDIRF4(VREGP) */
/* 9 */	"# foo\n",	/* reg: LOADB(reg) */
/* 10 */	"# peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n",	/* reg: LOADI1(reg) */
/* 11 */	"# peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n",	/* reg: LOADI2(reg) */
/* 12 */	"# peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n",	/* reg: LOADI4(reg) */
/* 13 */	"# peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n",	/* reg: LOADU1(reg) */
/* 14 */	"# peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n",	/* reg: LOADU2(reg) */
/* 15 */	"# peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n",	/* reg: LOADU4(reg) */
/* 16 */	"# peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n",	/* reg: LOADP4(reg) */
/* 17 */	"# peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n",	/* reg: LOADF4(reg) */
/* 18 */	"",	/* stmt: reg */
/* 19 */	"# write register\n",	/* stmt: ASGNI1(VREGP,reg) */
/* 20 */	"# write register\n",	/* stmt: ASGNI2(VREGP,reg) */
/* 21 */	"# write register\n",	/* stmt: ASGNI4(VREGP,reg) */
/* 22 */	"# write register\n",	/* stmt: ASGNU1(VREGP,reg) */
/* 23 */	"# write register\n",	/* stmt: ASGNU2(VREGP,reg) */
/* 24 */	"# write register\n",	/* stmt: ASGNU4(VREGP,reg) */
/* 25 */	"# write register\n",	/* stmt: ASGNP4(VREGP,reg) */
/* 26 */	"# write register\n",	/* stmt: ASGNF4(VREGP,reg) */
/* 27 */	"%a",	/* coni: CNSTI1 */
/* 28 */	"%a",	/* coni: CNSTI2 */
/* 29 */	"%a",	/* coni: CNSTI4 */
/* 30 */	"%a",	/* coni: CNSTU1 */
/* 31 */	"%a",	/* coni: CNSTU2 */
/* 32 */	"%a",	/* coni: CNSTU4 */
/* 33 */	"%a",	/* conn: CNSTI1 */
/* 34 */	"%a",	/* conn: CNSTI2 */
/* 35 */	"%a",	/* conn: CNSTI4 */
/* 36 */	"%a",	/* conn: CNSTU1 */
/* 37 */	"%a",	/* conn: CNSTU2 */
/* 38 */	"%a",	/* conn: CNSTU4 */
/* 39 */	"%a",	/* conli: CNSTI1 */
/* 40 */	"%a",	/* conli: CNSTI2 */
/* 41 */	"%a",	/* conli: CNSTI4 */
/* 42 */	"%a",	/* conli: CNSTU1 */
/* 43 */	"%a",	/* conli: CNSTU2 */
/* 44 */	"%a",	/* conli: CNSTU4 */
/* 45 */	"%a",	/* cons: CNSTI1 */
/* 46 */	"%a",	/* cons: CNSTI2 */
/* 47 */	"%a",	/* cons: CNSTI4 */
/* 48 */	"%a",	/* cons: CNSTU1 */
/* 49 */	"%a",	/* cons: CNSTU2 */
/* 50 */	"%a",	/* cons: CNSTU4 */
/* 51 */	"%a",	/* con: CNSTI1 */
/* 52 */	"%a",	/* con: CNSTI2 */
/* 53 */	"%a",	/* con: CNSTI4 */
/* 54 */	"%a",	/* con: CNSTU1 */
/* 55 */	"%a",	/* con: CNSTU2 */
/* 56 */	"%a",	/* con: CNSTU4 */
/* 57 */	"%a",	/* con: CNSTP4 */
/* 58 */	"%a",	/* con: CNSTF4 */
/* 59 */	"%a",	/* addrg: ADDRGP4 */
/* 60 */	"%a",	/* special: ADDRGP4 */
/* 61 */	"%a",	/* addrl16: ADDRLP4 */
/* 62 */	"%a",	/* addrl16: ADDRFP4 */
/* 63 */	"%a",	/* addrl32: ADDRLP4 */
/* 64 */	"%a",	/* addrl32: ADDRFP4 */
/* 65 */	" word I16B_LODF + ((%a)&$1FF)<<S16B\n word I16A_MOV + (%c)<<D16A + RI<<S16A ' reg <- addrl16\n",	/* reg: addrl16 */
/* 66 */	" alignl ' align long\n long I32_LODF + ((%a)&$FFFFFF)<<S32\n word I16A_MOV + (%c)<<D16A + RI<<S16A ' reg <- addrl32\n",	/* reg: addrl32 */
/* 67 */	" word I16B_LODL + (%c)<<D16B\n alignl ' align long\n long @%0 ' reg <- addrg\n",	/* reg: addrg */
/* 68 */	" alignl ' align long\n long I32_MOV + (%c)<<D32 + %a<<S32 ' reg <- special\n",	/* reg: special */
/* 69 */	" word I16A_MOVI + (%c)<<D16A + (%0)<<S16A ' reg <- coni\n",	/* reg: coni */
/* 70 */	" word I16A_NEGI + (%c)<<D16A + (-(%0)&$1F)<<S16A ' reg <- conn\n",	/* reg: conn */
/* 71 */	" alignl ' align long\n long I32_LODS + (%c)<<D32S + ((%0)&$7FFFF)<<S32 ' reg <- cons\n",	/* reg: cons */
/* 72 */	" alignl ' align long\n long I32_MOVI + (%c)<<D32 +(%0)<<S32 ' reg <- conli\n",	/* reg: conli */
/* 73 */	" word I16B_LODL + (%c)<<D16B\n alignl ' align long\n long %0 ' reg <- con\n",	/* reg: con */
/* 74 */	" word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRI1 reg\n",	/* reg: INDIRI1(reg) */
/* 75 */	" word I16A_RDWORD + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRI2 reg\n",	/* reg: INDIRI2(reg) */
/* 76 */	" word I16A_RDLONG + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRI4 reg\n",	/* reg: INDIRI4(reg) */
/* 77 */	" word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRU1 reg\n",	/* reg: INDIRU1(reg) */
/* 78 */	" word I16A_RDWORD + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRU2 reg\n",	/* reg: INDIRU2(reg) */
/* 79 */	" word I16A_RDLONG + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRU4 reg\n",	/* reg: INDIRU4(reg) */
/* 80 */	" word I16A_RDLONG + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRF4 reg\n",	/* reg: INDIRF4(reg) */
/* 81 */	" word I16A_RDLONG + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRP4 reg\n",	/* reg: INDIRP4(reg) */
/* 82 */	" alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_RDBYTE + (%c)<<D16A + RI<<S16A ' reg <- INDIRI1 addrg\n",	/* reg: INDIRI1(addrg) */
/* 83 */	" alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_RDWORD + (%c)<<D16A + RI<<S16A ' reg <- INDIRI2 addrg\n",	/* reg: INDIRI2(addrg) */
/* 84 */	" alignl ' align long\n long I32_LODI + (@%0)<<S32\n word I16A_MOV + (%c)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg\n",	/* reg: INDIRI4(addrg) */
/* 85 */	" alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_RDBYTE + (%c)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg\n",	/* reg: INDIRU1(addrg) */
/* 86 */	" alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_RDWORD + (%c)<<D16A + RI<<S16A ' reg <- INDIRU2 addrg\n",	/* reg: INDIRU2(addrg) */
/* 87 */	" alignl ' align long\n long I32_LODI + (@%0)<<S32\n word I16A_MOV + (%c)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg\n",	/* reg: INDIRU4(addrg) */
/* 88 */	" alignl ' align long\n long I32_LODI + (@%0)<<S32\n word I16A_MOV + (%c)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg\n",	/* reg: INDIRF4(addrg) */
/* 89 */	" alignl ' align long\n long I32_LODI + (@%0)<<S32\n word I16A_MOV + (%c)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg\n",	/* reg: INDIRP4(addrg) */
/* 90 */	" alignl ' align long\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRI1 addrg special\n",	/* reg: INDIRI1(special) */
/* 91 */	" alignl ' align long\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRI2 addrg special\n",	/* reg: INDIRI2(special) */
/* 92 */	" alignl ' align long\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRI4 addrg special\n",	/* reg: INDIRI4(special) */
/* 93 */	" alignl ' align long\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRU1 addrg special\n",	/* reg: INDIRU1(special) */
/* 94 */	" alignl ' align long\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRU2 addrg special\n",	/* reg: INDIRU2(special) */
/* 95 */	" alignl ' align long\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRU4 addrg special\n",	/* reg: INDIRU4(special) */
/* 96 */	" alignl ' align long\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRF4 addrg special\n",	/* reg: INDIRF4(special) */
/* 97 */	" alignl ' align long\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRP4 addrg special\n",	/* reg: INDIRP4(special) */
/* 98 */	" word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDBYTE + (%c)<<D16A + RI<<S16A ' reg <- INDIRI1 addrl16\n",	/* reg: INDIRI1(addrl16) */
/* 99 */	" word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDWORD + (%c)<<D16A + RI<<S16A ' reg <- INDIRI2 addrl16\n",	/* reg: INDIRI2(addrl16) */
/* 100 */	" word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16\n",	/* reg: INDIRI4(addrl16) */
/* 101 */	" word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDBYTE + (%c)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16\n",	/* reg: INDIRU1(addrl16) */
/* 102 */	" word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDWORD + (%c)<<D16A + RI<<S16A ' reg <- INDIRU2 addrl16\n",	/* reg: INDIRU2(addrl16) */
/* 103 */	" word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16\n",	/* reg: INDIRU4(addrl16) */
/* 104 */	" word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16\n",	/* reg: INDIRF4(addrl16) */
/* 105 */	" word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16\n",	/* reg: INDIRP4(addrl16) */
/* 106 */	" alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDBYTE + (%c)<<D16A + RI<<S16A ' reg <- INDIRI1 addrl32\n",	/* reg: INDIRI1(addrl32) */
/* 107 */	" alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDWORD + (%c)<<D16A + RI<<S16A ' reg <- INDIRI2 addrl32\n",	/* reg: INDIRI2(addrl32) */
/* 108 */	" alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl32\n",	/* reg: INDIRI4(addrl32) */
/* 109 */	" alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDBYTE + (%c)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl32\n",	/* reg: INDIRU1(addrl32) */
/* 110 */	" alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDWORD + (%c)<<D16A + RI<<S16A ' reg <- INDIRU2 addrl32\n",	/* reg: INDIRU2(addrl32) */
/* 111 */	" alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl32\n",	/* reg: INDIRU4(addrl32) */
/* 112 */	" alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl32\n",	/* reg: INDIRF4(addrl32) */
/* 113 */	" alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl32\n",	/* reg: INDIRP4(addrl32) */
/* 114 */	" word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- CVUU1 INDIRU1 reg\n",	/* reg: CVUU1(INDIRU1(reg)) */
/* 115 */	" word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- CVUU2 INDIRU1 reg\n",	/* reg: CVUU2(INDIRU1(reg)) */
/* 116 */	" word I16A_RDWORD + (%c)<<D16A + (%0)<<S16A ' reg <- CVUU2 INDIRU2 reg\n",	/* reg: CVUU2(INDIRU2(reg)) */
/* 117 */	" word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- CVUU4 INDIRU1 reg\n",	/* reg: CVUU4(INDIRU1(reg)) */
/* 118 */	" word I16A_RDWORD + (%c)<<D16A + (%0)<<S16A ' reg <- CVUU4 INDIRU2 reg\n",	/* reg: CVUU4(INDIRU2(reg)) */
/* 119 */	" word I16A_RDLONG + (%c)<<D16A + (%0)<<S16A ' reg <- CVUU4 INDIRU4 reg\n",	/* reg: CVUU4(INDIRU4(reg)) */
/* 120 */	" word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- CVUI1 INDIRU1 reg\n",	/* reg: CVUI1(INDIRU1(reg)) */
/* 121 */	" word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- CVUI2 INDIRU1 reg\n",	/* reg: CVUI2(INDIRU1(reg)) */
/* 122 */	" word I16A_RDWORD + (%c)<<D16A + (%0)<<S16A ' reg <- CVUI2 INDIRU2 reg\n",	/* reg: CVUI2(INDIRU2(reg)) */
/* 123 */	" word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- CVUI4 INDIRU1 reg\n",	/* reg: CVUI4(INDIRU1(reg)) */
/* 124 */	" word I16A_RDWORD + (%c)<<D16A + (%0)<<S16A ' reg <- CVUI4 INDIRU2 reg\n",	/* reg: CVUI4(INDIRU2(reg)) */
/* 125 */	" word I16A_RDLONG + (%c)<<D16A + (%0)<<S16A ' reg <- CVUI4 INDIRU4 reg\n",	/* reg: CVUI4(INDIRU4(reg)) */
/* 126 */	" alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_WRBYTE + (%1)<<D16A + RI<<S16A ' ASGNI1 addrg reg\n",	/* stmt: ASGNI1(addrg,reg) */
/* 127 */	" alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_WRWORD + (%1)<<D16A + RI<<S16A ' ASGNI2 addrg reg\n",	/* stmt: ASGNI2(addrg,reg) */
/* 128 */	" alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNI4 addrg reg\n",	/* stmt: ASGNI4(addrg,reg) */
/* 129 */	" alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_WRBYTE + (%1)<<D16A + RI<<S16A ' ASGNU1 addrg reg\n",	/* stmt: ASGNU1(addrg,reg) */
/* 130 */	" alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_WRWORD + (%1)<<D16A + RI<<S16A ' ASGNU2 addrg reg\n",	/* stmt: ASGNU2(addrg,reg) */
/* 131 */	" alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNU4 addrg reg\n",	/* stmt: ASGNU4(addrg,reg) */
/* 132 */	" alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNF4 addrg reg\n",	/* stmt: ASGNF4(addrg,reg) */
/* 133 */	" alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNP4 addrg reg\n",	/* stmt: ASGNP4(addrg,reg) */
/* 134 */	" alignl ' align long\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNI1 special reg\n",	/* stmt: ASGNI1(special,reg) */
/* 135 */	" alignl ' align long\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNI2 special reg\n",	/* stmt: ASGNI2(special,reg) */
/* 136 */	" alignl ' align long\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNI4 special reg\n",	/* stmt: ASGNI4(special,reg) */
/* 137 */	" alignl ' align long\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNU1 special reg\n",	/* stmt: ASGNU1(special,reg) */
/* 138 */	" alignl ' align long\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNU2 special reg\n",	/* stmt: ASGNU2(special,reg) */
/* 139 */	" alignl ' align long\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNU4 special reg\n",	/* stmt: ASGNU4(special,reg) */
/* 140 */	" alignl ' align long\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNF4 special reg\n",	/* stmt: ASGNF4(special,reg) */
/* 141 */	" alignl ' align long\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNP4 special reg\n",	/* stmt: ASGNP4(special,reg) */
/* 142 */	" alignl ' align long\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNI1 special conli\n",	/* stmt: ASGNI1(special,conli) */
/* 143 */	" alignl ' align long\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNI2 special conli\n",	/* stmt: ASGNI2(special,conli) */
/* 144 */	" alignl ' align long\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNI4 special conli\n",	/* stmt: ASGNI4(special,conli) */
/* 145 */	" alignl ' align long\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNU1 special conli\n",	/* stmt: ASGNU1(special,conli) */
/* 146 */	" alignl ' align long\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNU2 special conli\n",	/* stmt: ASGNU2(special,conli) */
/* 147 */	" alignl ' align long\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNU4 special conli\n",	/* stmt: ASGNU4(special,conli) */
/* 148 */	" alignl ' align long\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNF4 special conli\n",	/* stmt: ASGNF4(special,conli) */
/* 149 */	" alignl ' align long\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNP4 special conli\n",	/* stmt: ASGNP4(special,conli) */
/* 150 */	" word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRBYTE + (%1)<<D16A + RI<<S16A ' ASGNI1 addrl16 reg\n",	/* stmt: ASGNI1(addrl16,reg) */
/* 151 */	" word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRWORD + (%1)<<D16A + RI<<S16A ' ASGNI2 addrl16 reg\n",	/* stmt: ASGNI2(addrl16,reg) */
/* 152 */	" word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg\n",	/* stmt: ASGNI4(addrl16,reg) */
/* 153 */	" word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRBYTE + (%1)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg\n",	/* stmt: ASGNU1(addrl16,reg) */
/* 154 */	" word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRWORD + (%1)<<D16A + RI<<S16A ' ASGNU2 addrl16 reg\n",	/* stmt: ASGNU2(addrl16,reg) */
/* 155 */	" word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg\n",	/* stmt: ASGNU4(addrl16,reg) */
/* 156 */	" word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg\n",	/* stmt: ASGNF4(addrl16,reg) */
/* 157 */	" word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg\n",	/* stmt: ASGNP4(addrl16,reg) */
/* 158 */	" alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRBYTE + (%1)<<D16A + RI<<S16A ' ASGNI1 addrl32 reg\n",	/* stmt: ASGNI1(addrl32,reg) */
/* 159 */	" alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRWORD + (%1)<<D16A + RI<<S16A ' ASGNI2 addrl32 reg\n",	/* stmt: ASGNI2(addrl32,reg) */
/* 160 */	" alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNI4 addrl32 reg\n",	/* stmt: ASGNI4(addrl32,reg) */
/* 161 */	" alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRBYTE + (%1)<<D16A + RI<<S16A ' ASGNU1 addrl32 reg\n",	/* stmt: ASGNU1(addrl32,reg) */
/* 162 */	" alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRWORD + (%1)<<D16A + RI<<S16A ' ASGNU2 addrl32 reg\n",	/* stmt: ASGNU2(addrl32,reg) */
/* 163 */	" alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNU4 addrl32 reg\n",	/* stmt: ASGNU4(addrl32,reg) */
/* 164 */	" alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNF4 addrl32 reg\n",	/* stmt: ASGNF4(addrl32,reg) */
/* 165 */	" alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNP4 addrl32 reg\n",	/* stmt: ASGNP4(addrl32,reg) */
/* 166 */	" word I16A_WRBYTE + (%1)<<D16A + (%0)<<S16A ' ASGNI1 reg reg\n",	/* stmt: ASGNI1(reg,reg) */
/* 167 */	" word I16A_WRWORD + (%1)<<D16A + (%0)<<S16A ' ASGNI2 reg reg\n",	/* stmt: ASGNI2(reg,reg) */
/* 168 */	" word I16A_WRLONG + (%1)<<D16A + (%0)<<S16A ' ASGNI4 reg reg\n",	/* stmt: ASGNI4(reg,reg) */
/* 169 */	" word I16A_WRBYTE + (%1)<<D16A + (%0)<<S16A ' ASGNU1 reg reg\n",	/* stmt: ASGNU1(reg,reg) */
/* 170 */	" word I16A_WRWORD + (%1)<<D16A + (%0)<<S16A ' ASGNU2 reg reg\n",	/* stmt: ASGNU2(reg,reg) */
/* 171 */	" word I16A_WRLONG + (%1)<<D16A + (%0)<<S16A ' ASGNU4 reg reg\n",	/* stmt: ASGNU4(reg,reg) */
/* 172 */	" word I16A_WRLONG + (%1)<<D16A + (%0)<<S16A ' ASGNF4 reg reg\n",	/* stmt: ASGNF4(reg,reg) */
/* 173 */	" word I16A_WRLONG + (%1)<<D16A + (%0)<<S16A ' ASGNP4 reg reg\n",	/* stmt: ASGNP4(reg,reg) */
/* 174 */	"# call\n",	/* reg: CALLI4(addrg) */
/* 175 */	"# call\n",	/* reg: CALLU4(addrg) */
/* 176 */	"# call\n",	/* reg: CALLP4(addrg) */
/* 177 */	"# call\n",	/* reg: CALLF4(addrg) */
/* 178 */	"# call\n",	/* reg: CALLV(addrg) */
/* 179 */	"# call\n",	/* reg: CALLI4(reg) */
/* 180 */	"# call\n",	/* reg: CALLU4(reg) */
/* 181 */	"# call\n",	/* reg: CALLP4(reg) */
/* 182 */	"# call\n",	/* reg: CALLF4(reg) */
/* 183 */	"# call\n",	/* reg: CALLV(reg) */
/* 184 */	"# ret\n",	/* stmt: RETI4(reg) */
/* 185 */	"# ret\n",	/* stmt: RETU4(reg) */
/* 186 */	"# ret\n",	/* stmt: RETP4(reg) */
/* 187 */	"# ret\n",	/* stmt: RETF4(reg) */
/* 188 */	" word I16A_MOVI + R0<<D16A + (%0)<<S16A ' RET coni\n",	/* stmt: RETI4(coni) */
/* 189 */	" word I16A_MOVI + R0<<D16A + (%0)<<S16A ' RET coni\n",	/* stmt: RETU4(coni) */
/* 190 */	" word I16A_MOVI + R0<<D16A + (%0)<<S16A ' RET coni\n",	/* stmt: RETP4(coni) */
/* 191 */	" alignl ' align long\n long I32_LODS + R0<<D32S + ((%0)&$7FFFF)<<S32 ' RET cons\n",	/* stmt: RETI4(cons) */
/* 192 */	" alignl ' align long\n long I32_LODS + R0<<D32S + ((%0)&$7FFFF)<<S32 ' RET cons\n",	/* stmt: RETU4(cons) */
/* 193 */	" alignl ' align long\n long I32_LODS + R0<<D32S + ((%0)&$7FFFF)<<S32 ' RET cons\n",	/* stmt: RETP4(cons) */
/* 194 */	" alignl ' align long\n long I32_MOVI + R0<<D32 + (%0)<<S32 ' RET conli\n",	/* stmt: RETI4(conli) */
/* 195 */	" alignl ' align long\n long I32_MOVI + R0<<D32 + (%0)<<S32 ' RET conli\n",	/* stmt: RETU4(conli) */
/* 196 */	" alignl ' align long\n long I32_MOVI + R0<<D32 + (%0)<<S32 ' RET conli\n",	/* stmt: RETP4(conli) */
/* 197 */	" word I16B_LODL + R0<<D16B\n alignl ' align long\n long %0 ' RET con\n",	/* stmt: RETI4(con) */
/* 198 */	" word I16B_LODL + R0<<D16B\n alignl ' align long\n long %0 ' RET con\n",	/* stmt: RETU4(con) */
/* 199 */	" word I16B_LODL + R0<<D16B\n alignl ' align long\n long %0 ' RET con\n",	/* stmt: RETP4(con) */
/* 200 */	" word I16B_LODL + R0<<D16B\n alignl ' align long\n long %0 ' RET con\n",	/* stmt: RETF4(con) */
/* 201 */	"# zero extend\n",	/* reg: CVUI1(reg) */
/* 202 */	"# zero extend\n",	/* reg: CVUI2(reg) */
/* 203 */	"# zero extend\n",	/* reg: CVUI4(reg) */
/* 204 */	"# truncate\n",	/* reg: CVUU1(reg) */
/* 205 */	"# truncate\n",	/* reg: CVUU2(reg) */
/* 206 */	"# truncate\n",	/* reg: CVUU4(reg) */
/* 207 */	"? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' CVUP4\n",	/* reg: CVUP4(reg) */
/* 208 */	"? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' CVPU4\n",	/* reg: CVPU4(reg) */
/* 209 */	"# sign extend\n",	/* reg: CVII1(reg) */
/* 210 */	"# sign extend\n",	/* reg: CVII2(reg) */
/* 211 */	"# sign extend\n",	/* reg: CVII4(reg) */
/* 212 */	"# truncate\n",	/* reg: CVIU1(reg) */
/* 213 */	"# truncate\n",	/* reg: CVIU2(reg) */
/* 214 */	"# truncate\n",	/* reg: CVIU4(reg) */
/* 215 */	"# nothing",	/* reg: CVFF4(reg) */
/* 216 */	" word I16B_FLTP + INFL<<S16B ' CVFI4\n",	/* reg: CVFI4(reg) */
/* 217 */	" word I16B_FLTP + FLIN<<S16B ' CVIF4\n",	/* reg: CVIF4(reg) */
/* 218 */	" word I16A_NEG + (%c)<<D16A + (%0)<<S16A ' NEGI4\n",	/* reg: NEGI4(reg) */
/* 219 */	"? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16B_SIGN + (%c)<<D16B ' NEGF4\n",	/* reg: NEGF4(reg) */
/* 220 */	"? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16B_CPL + (%c)<<D16B ' BCOMI4\n",	/* reg: BCOMI4(reg) */
/* 221 */	"? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16B_CPL + (%c)<<D16B ' BCOMU4\n",	/* reg: BCOMU4(reg) */
/* 222 */	"? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_ADDSI + (%c)<<D16A + (%1)<<S16A ' ADDI4 reg coni\n",	/* reg: ADDI4(reg,coni) */
/* 223 */	"? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_ADDI + (%c)<<D16A + (%1)<<S16A ' ADDU4 reg coni\n",	/* reg: ADDU4(reg,coni) */
/* 224 */	"? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_ADDSI + (%c)<<D16A + (%1)<<S16A ' ADDP4 reg coni\n",	/* reg: ADDP4(reg,coni) */
/* 225 */	"# mov RI, %0\n adds RI, %1\n mov %c, RI ' ADDI4 reg\n",	/* reg: ADDI4(reg,reg) */
/* 226 */	"# mov RI, %0\n add RI, %1\n mov %c, RI ' ADDU4 reg\n",	/* reg: ADDU4(reg,reg) */
/* 227 */	"# mov RI, %0\n adds RI, %1\n mov %c, RI ' ADDP4 reg\n",	/* reg: ADDP4(reg,reg) */
/* 228 */	"# jmp #FADD ' ADDF4\n",	/* reg: ADDF4(reg,reg) */
/* 229 */	"# mov RI, %0\n and RI, %1\n mov %c, RI ' BANDI4 reg\n",	/* reg: BANDI4(reg,reg) */
/* 230 */	"# mov RI, %0\n and RI, %1\n mov %c, RI ' BANDU4 reg\n",	/* reg: BANDU4(reg,reg) */
/* 231 */	"# mov RI, %0\n or RI, %1\n mov %c, RI ' BORI4 reg\n",	/* reg: BORI4(reg,reg) */
/* 232 */	"# mov RI, %0\n or RI, %1\n mov %c, RI ' BORU4 reg\n",	/* reg: BORU4(reg,reg) */
/* 233 */	"# mov RI, %0\n xor RI, %1\n mov %c, RI ' BXORI4 reg\n",	/* reg: BXORI4(reg,reg) */
/* 234 */	"# mov RI, %0\n xor RI, %1\n mov %c, RI ' BXORU4 reg\n",	/* reg: BXORU4(reg,reg) */
/* 235 */	"? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SUBSI + (%c)<<D16A + (%1)<<S16A ' SUBI4 reg coni\n",	/* reg: SUBI4(reg,coni) */
/* 236 */	"? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SUBI + (%c)<<D16A + (%1)<<S16A ' SUBU4 reg coni\n",	/* reg: SUBU4(reg,coni) */
/* 237 */	"? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SUBSI + (%c)<<D16A + (%1)<<S16A ' SUBP4 reg coni\n",	/* reg: SUBP4(reg,coni) */
/* 238 */	"# mov RI, %0\n subs RI, %1\n mov %c, RI ' SUBI4 reg\n",	/* reg: SUBI4(reg,reg) */
/* 239 */	"# mov RI, %0\n sub RI, %1\n mov %c, RI ' SUBU4 reg\n",	/* reg: SUBU4(reg,reg) */
/* 240 */	"# mov RI, %0\n subs RI, %1\n mov %c, RI ' SUBP4 reg\n",	/* reg: SUBP4(reg,reg) */
/* 241 */	"# jmp #FSUB ' SUBF4\n",	/* reg: SUBF4(reg,reg) */
/* 242 */	"# jmp #DIVS ' DIVI4\n",	/* reg: DIVI4(reg,reg) */
/* 243 */	"# jmp #DIVU ' DIVU4\n",	/* reg: DIVU4(reg,reg) */
/* 244 */	"# jmp #FDIV ' DIVF4\n",	/* reg: DIVF4(reg,reg) */
/* 245 */	"# jmp #DIVS ' MODI4\n",	/* reg: MODI4(reg,reg) */
/* 246 */	"# jmp #DIVU ' MODU4\n",	/* reg: MODU4(reg,reg) */
/* 247 */	"# jmp #MULT ' MULI4\n",	/* reg: MULI4(reg,reg) */
/* 248 */	"# jmp #MULT ' MULU4\n",	/* reg: MULU4(reg,reg) */
/* 249 */	"# jmp #FMUL ' MULF4\n",	/* reg: MULF4(reg,reg) */
/* 250 */	"# mov RI, %0\n shl RI, %1\n mov %c, RI ' LSHI4 reg\n",	/* reg: LSHI4(reg,reg) */
/* 251 */	"# mov RI, %0\n shl RI, %1\n mov %c, RI ' LSHU4 reg\n",	/* reg: LSHU4(reg,reg) */
/* 252 */	"? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SHLI + (%c)<<D16A + (%1)<<S16A ' SHLI4 reg coni\n",	/* reg: LSHI4(reg,coni) */
/* 253 */	"? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SHLI + (%c)<<D16A + (%1)<<S16A ' SHLU4 reg coni\n",	/* reg: LSHU4(reg,coni) */
/* 254 */	"# mov RI, %0\n sar RI, %1\n mov %c, RI ' RSHI4 reg\n",	/* reg: RSHI4(reg,reg) */
/* 255 */	"# mov RI, %0\n shr RI, %1\n mov %c, RI ' RSHU4 reg\n",	/* reg: RSHU4(reg,reg) */
/* 256 */	"? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SARI + (%c)<<D16A + (%1)<<S16A ' SHRI4 reg coni\n",	/* reg: RSHI4(reg,coni) */
/* 257 */	"? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SHRI + (%c)<<D16A + (%1)<<S16A ' SHRU4 reg coni\n",	/* reg: RSHU4(reg,coni) */
/* 258 */	" alignl ' align long\n long I32_MOV + (%1)<<D32 + (%2)<<S32 ' ASGNI4 special reg\n",	/* stmt: ASGNI4(special,reg) */
/* 259 */	" alignl ' align long\n long I32_MOV + (%1)<<D32 + (%2)<<S32 ' ASGNU4 special reg\n",	/* stmt: ASGNU4(special,reg) */
/* 260 */	" word I16B_PASM \n alignl ' align long\n and %0, #%2 ' ASGNI4 special BAND4 special conli\n",	/* stmt: ASGNI4(special,BANDI4(INDIRI4(special),conli)) */
/* 261 */	" word I16B_PASM \n alignl ' align long\n and %0, #%2 ' ASGNU4 special BAND4 special conli\n",	/* stmt: ASGNU4(special,BANDU4(INDIRU4(special),conli)) */
/* 262 */	" word I16B_PASM \n alignl ' align long\n and %0, %2 ' ASGNI4 special BAND4 special reg\n",	/* stmt: ASGNI4(special,BANDI4(INDIRI4(special),reg)) */
/* 263 */	" word I16B_PASM \n alignl ' align long\n and %0, %2 ' ASGNU4 special BAND4 special reg\n",	/* stmt: ASGNU4(special,BANDU4(INDIRU4(special),reg)) */
/* 264 */	" word I16B_PASM \n alignl ' align long\n or %0, #%2 ' ASGNI4 special BOR4 special conli\n",	/* stmt: ASGNI4(special,BORI4(INDIRI4(special),conli)) */
/* 265 */	" word I16B_PASM \n alignl ' align long\n or %0, #%2 ' ASGNU4 special BOR4 special conli\n",	/* stmt: ASGNU4(special,BORU4(INDIRU4(special),conli)) */
/* 266 */	" word I16B_PASM \n alignl ' align long\n or %0, %2 ' ASGNI4 special BOR4 special reg\n",	/* stmt: ASGNI4(special,BORI4(INDIRI4(special),reg)) */
/* 267 */	" word I16B_PASM \n alignl ' align long\n or %0, %2 ' ASGNU4 special BOR4 special reg\n",	/* stmt: ASGNU4(special,BORU4(INDIRU4(special),reg)) */
/* 268 */	" word I16B_PASM \n alignl ' align long\n xor %0, #%2 ' ASGNI4 special BXOR4 special conli\n",	/* stmt: ASGNI4(special,BXORI4(INDIRI4(special),conli)) */
/* 269 */	" word I16B_PASM \n alignl ' align long\n xor %0, #%2 ' ASGNU4 special BXOR4 special conli\n",	/* stmt: ASGNU4(special,BXORU4(INDIRU4(special),conli)) */
/* 270 */	" word I16B_PASM \n alignl ' align long\n xor %0, %2 ' ASGNI4 special BXOR4 special reg\n",	/* stmt: ASGNI4(special,BXORI4(INDIRI4(special),reg)) */
/* 271 */	" word I16B_PASM \n alignl ' align long\n xor %0, %2 ' ASGNU4 special BXOR4 special reg\n",	/* stmt: ASGNU4(special,BXORU4(INDIRU4(special),reg)) */
/* 272 */	" word I16A_ADDSI (%0)<<D16A + (%2)<<S16A ' ASGNI4 special BADD4 special coni\n",	/* stmt: ASGNI4(special,SUBI4(INDIRI4(special),coni)) */
/* 273 */	" word I16A_ADDI (%0)<<D16A + (%2)<<S16A ' ASGNU4 special BADD4 special coni\n",	/* stmt: ASGNU4(special,SUBU4(INDIRU4(special),coni)) */
/* 274 */	" word I16B_PASM \n alignl ' align long\n adds %0, #%2 ' ASGNI4 special BADD4 special conli\n",	/* stmt: ASGNI4(special,ADDI4(INDIRI4(special),conli)) */
/* 275 */	" word I16B_PASM \n alignl ' align long\n add %0, #%2 ' ASGNU4 special BADD4 special conli\n",	/* stmt: ASGNU4(special,ADDU4(INDIRU4(special),conli)) */
/* 276 */	" word I16B_PASM \n alignl ' align long\n adds %0, %2 ' ASGNI4 special BADD4 special reg\n",	/* stmt: ASGNI4(special,ADDI4(INDIRI4(special),reg)) */
/* 277 */	" word I16B_PASM \n alignl ' align long\n add %0, %2 ' ASGNU4 special BADD4 special reg\n",	/* stmt: ASGNU4(special,ADDU4(INDIRU4(special),reg)) */
/* 278 */	" word I16A_SUBSI (%0)<<D16A + (%2)<<S16A ' ASGNI4 special BSUB4 special coni\n",	/* stmt: ASGNI4(special,SUBI4(INDIRI4(special),coni)) */
/* 279 */	" word I16A_SUBI (%0)<<D16A + (%2)<<S16A ' ASGNU4 special BSUB4 special coni\n",	/* stmt: ASGNU4(special,SUBU4(INDIRU4(special),coni)) */
/* 280 */	" word I16B_PASM \n alignl ' align long\n subs %0, #%2 ' ASGNI4 special BSUB4 special conli\n",	/* stmt: ASGNI4(special,SUBI4(INDIRI4(special),conli)) */
/* 281 */	" word I16B_PASM \n alignl ' align long\n sub %0, #%2 ' ASGNU4 special BSUB4 special conli\n",	/* stmt: ASGNU4(special,SUBU4(INDIRU4(special),conli)) */
/* 282 */	" word I16B_PASM \n alignl ' align long\n subs %0, %2 ' ASGNI4 special BSUB4 special reg\n",	/* stmt: ASGNI4(special,SUBI4(INDIRI4(special),reg)) */
/* 283 */	" word I16B_PASM \n alignl ' align long\n sub %0, %2 ' ASGNU4 special BSUB4 special reg\n",	/* stmt: ASGNU4(special,SUBU4(INDIRU4(special),reg)) */
/* 284 */	" word I16A_SHLI + (%0)<<D16A + (%2)<<S16A ' ASGNI4 special LSH4 special coni\n",	/* stmt: ASGNI4(special,LSHI4(INDIRI4(special),coni)) */
/* 285 */	" word I16A_SHLI + (%0)<<D16A + (%2)<<S16A ' ASGNU4 special LSH4 special coni\n",	/* stmt: ASGNU4(special,LSHU4(INDIRU4(special),coni)) */
/* 286 */	" word I16B_PASM \n alignl ' align long\n shl %0, #%2 ' ASGNI4 special LSH4 special conli\n",	/* stmt: ASGNI4(special,LSHI4(INDIRI4(special),conli)) */
/* 287 */	" word I16B_PASM \n alignl ' align long\n shl %0, #%2 ' ASGNU4 special LSH4 special conli\n",	/* stmt: ASGNU4(special,LSHU4(INDIRU4(special),conli)) */
/* 288 */	" word I16B_PASM \n alignl ' align long\n shl %0, %2 ' ASGNI4 special LSH4 special reg\n",	/* stmt: ASGNI4(special,LSHI4(INDIRI4(special),reg)) */
/* 289 */	" word I16B_PASM \n alignl ' align long\n shl %0, %2 ' ASGNU4 special LSH4 special reg\n",	/* stmt: ASGNU4(special,LSHU4(INDIRU4(special),reg)) */
/* 290 */	" word I16A_SHRI + (%0)<<D16A + (%2)<<S16A ' ASGNI4 special RSH4 special coni\n",	/* stmt: ASGNI4(special,RSHI4(INDIRI4(special),coni)) */
/* 291 */	" word I16A_SHRI + (%0)<<D16A + (%2)<<S16A ' ASGNU4 special RSH4 special coni\n",	/* stmt: ASGNU4(special,RSHU4(INDIRU4(special),coni)) */
/* 292 */	" word I16B_PASM \n alignl ' align long\n shr %0, #%2 ' ASGNI4 special RSH4 special conli\n",	/* stmt: ASGNI4(special,RSHI4(INDIRI4(special),conli)) */
/* 293 */	" word I16B_PASM \n alignl ' align long\n shr %0, #%2 ' ASGNU4 special RSH4 special conli\n",	/* stmt: ASGNU4(special,RSHU4(INDIRU4(special),conli)) */
/* 294 */	" word I16B_PASM \n alignl ' align long\n shr %0, %2 ' ASGNI4 special RSH4 special reg\n",	/* stmt: ASGNI4(special,RSHI4(INDIRI4(special),reg)) */
/* 295 */	" word I16B_PASM \n alignl ' align long\n shr %0, %2 ' ASGNU4 special RSH4 special reg\n",	/* stmt: ASGNU4(special,RSHU4(INDIRU4(special),reg)) */
/* 296 */	" word I16A_CMPS + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_Z + (@%a)<<S32 ' EQI4 reg reg\n",	/* stmt: EQI4(reg,reg) */
/* 297 */	" word I16A_CMP + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_Z + (@%a)<<S32 ' EQU4 reg reg\n",	/* stmt: EQU4(reg,reg) */
/* 298 */	"# jmp #FCMP\n jmp #BR_Z\n long (@%a) ' EQF4 reg reg\n",	/* stmt: EQF4(reg,reg) */
/* 299 */	" word I16A_CMPS + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRNZ + (@%a)<<S32 ' NEI4 reg reg\n",	/* stmt: NEI4(reg,reg) */
/* 300 */	" word I16A_CMP + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRNZ + (@%a)<<S32 ' NEU4 reg reg\n",	/* stmt: NEU4(reg,reg) */
/* 301 */	"# jmp #FCMP\n jmp #BRNZ\n long (@%a) ' NEF4 reg reg\n",	/* stmt: NEF4(reg,reg) */
/* 302 */	" word I16A_CMPS + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRAE + (@%a)<<S32 ' GEI4 reg reg\n",	/* stmt: GEI4(reg,reg) */
/* 303 */	" word I16A_CMP + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRAE + (@%a)<<S32 ' GEU4 reg reg\n",	/* stmt: GEU4(reg,reg) */
/* 304 */	"# jmp #FCMP\n jmp #BRAE\n long (@%a) ' GEF4 reg reg\n",	/* stmt: GEF4(reg,reg) */
/* 305 */	" word I16A_CMPS + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_A + (@%a)<<S32 ' GTI4 reg reg\n",	/* stmt: GTI4(reg,reg) */
/* 306 */	" word I16A_CMP + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_A + (@%a)<<S32 ' GTU4 reg reg\n",	/* stmt: GTU4(reg,reg) */
/* 307 */	"# jmp #FCMP\n jmp #BR_A\n long (@%a) ' GTF4 reg reg\n",	/* stmt: GTF4(reg,reg) */
/* 308 */	" word I16A_CMPS + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRBE + (@%a)<<S32 ' LEI4 reg reg\n",	/* stmt: LEI4(reg,reg) */
/* 309 */	" word I16A_CMP + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRBE + (@%a)<<S32 ' LEU4 reg reg\n",	/* stmt: LEU4(reg,reg) */
/* 310 */	"# jmp #FCMP\n jmp #BRBE\n long (@%a) '  LEF4 reg reg\n",	/* stmt: LEF4(reg,reg) */
/* 311 */	" word I16A_CMPS + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_B + (@%a)<<S32 ' LTI4 reg reg\n",	/* stmt: LTI4(reg,reg) */
/* 312 */	" word I16A_CMP + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_B + (@%a)<<S32 ' LTU4 reg reg\n",	/* stmt: LTU4(reg,reg) */
/* 313 */	"# jmp #FCMP\n jmp #BR_B\n long (@%a) ' LTF4 reg reg\n",	/* stmt: LTF4(reg,reg) */
/* 314 */	" word I16A_CMPSI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_Z + (@%a)<<S32 ' EQI4 reg coni\n",	/* stmt: EQI4(reg,coni) */
/* 315 */	" word I16A_CMPI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_Z + (@%a)<<S32 ' EQU4 reg coni\n",	/* stmt: EQU4(reg,coni) */
/* 316 */	" word I16A_CMPSI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRNZ + (@%a)<<S32 ' NEI4 reg coni\n",	/* stmt: NEI4(reg,coni) */
/* 317 */	" word I16A_CMPI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRNZ + (@%a)<<S32 ' NEU4 reg coni\n",	/* stmt: NEU4(reg,coni) */
/* 318 */	" word I16A_CMPSI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRAE + (@%a)<<S32 ' GEI4 reg coni\n",	/* stmt: GEI4(reg,coni) */
/* 319 */	" word I16A_CMPI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRAE + (@%a)<<S32 ' GEU4 reg coni\n",	/* stmt: GEU4(reg,coni) */
/* 320 */	" word I16A_CMPSI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_A + (@%a)<<S32 ' GTI4 reg coni\n",	/* stmt: GTI4(reg,coni) */
/* 321 */	" word I16A_CMPI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_A + (@%a)<<S32 ' GTU4 reg coni\n",	/* stmt: GTU4(reg,coni) */
/* 322 */	" word I16A_CMPSI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRBE + (@%a)<<S32 ' LEI4 reg coni\n",	/* stmt: LEI4(reg,coni) */
/* 323 */	" word I16A_CMPI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRBE + (@%a)<<S32 ' LEU4 reg coni\n",	/* stmt: LEU4(reg,coni) */
/* 324 */	" word I16A_CMPSI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_B + (@%a)<<S32 ' LTI4 reg coni\n",	/* stmt: LTI4(reg,coni) */
/* 325 */	" word I16A_CMPI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_B + (@%a)<<S32 ' LTU4 reg coni\n",	/* stmt: LTU4(reg,coni) */
/* 326 */	" alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMPS + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BR_Z + (@%a)<<S32 ' EQI4 reg coni\n",	/* stmt: EQI4(reg,conli) */
/* 327 */	" alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMP + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BR_Z + (@%a)<<S32 ' EQU4 reg coni\n",	/* stmt: EQU4(reg,conli) */
/* 328 */	" alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMPS + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BRNZ + (@%a)<<S32 ' NEI4 reg coni\n",	/* stmt: NEI4(reg,conli) */
/* 329 */	" alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMP + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BRNZ + (@%a)<<S32 ' NEU4 reg coni\n",	/* stmt: NEU4(reg,conli) */
/* 330 */	" alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMPS + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BRAE + (@%a)<<S32 ' GEI4 reg coni\n",	/* stmt: GEI4(reg,conli) */
/* 331 */	" alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMP + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BRAE + (@%a)<<S32 ' GEU4 reg coni\n",	/* stmt: GEU4(reg,conli) */
/* 332 */	" alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMPS + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BR_A + (@%a)<<S32 ' GTI4 reg coni\n",	/* stmt: GTI4(reg,conli) */
/* 333 */	" alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMP + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BR_A + (@%a)<<S32 ' GTU4 reg coni\n",	/* stmt: GTU4(reg,conli) */
/* 334 */	" alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMPS + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BRBE + (@%a)<<S32 ' LEI4 reg coni\n",	/* stmt: LEI4(reg,conli) */
/* 335 */	" alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMP + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BRBE + (@%a)<<S32 ' LEU4 reg coni\n",	/* stmt: LEU4(reg,conli) */
/* 336 */	" alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMPS + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BR_B + (@%a)<<S32 ' LTI4 reg coni\n",	/* stmt: LTI4(reg,conli) */
/* 337 */	" alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMP + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BR_B + (@%a)<<S32 ' LTU4 reg coni\n",	/* stmt: LTU4(reg,conli) */
/* 338 */	"# ARGB\n",	/* stmt: ARGB(INDIRB(reg)) */
/* 339 */	"# ASGNB\n",	/* stmt: ASGNB(reg,INDIRB(reg)) */
/* 340 */	" word I16A_RDLONG + RI<<D16A + (%0)<<S16A\n word I16B_JMPI ' JUMPV INDIR addrl16\n alignl ' align long\n",	/* stmt: JUMPV(INDIRP4(addrl16)) */
/* 341 */	" word I16A_RDLONG + RI<<D16A + (%0)<<S16A\n word I16B_JMPI ' JUMPV INDIR addrl32\n alignl ' align long\n",	/* stmt: JUMPV(INDIRP4(addrl32)) */
/* 342 */	" word I16A_RDLONG + RI<<D16A + (%0)<<S16A\n word I16B_JMPI ' JUMPV INDIR addrg\n alignl ' align long\n",	/* stmt: JUMPV(INDIRP4(addrg)) */
/* 343 */	" word I16A_RDLONG + RI<<D16A + (%0)<<S16A\n word I16B_JMPI ' JUMPV INDIR reg\n alignl ' align long\n",	/* stmt: JUMPV(INDIRP4(reg)) */
/* 344 */	" alignl ' align long\n long I32_JMPA + (@%0)<<S32 ' JUMPV addrg\n",	/* stmt: JUMPV(addrg) */
/* 345 */	"# %a\n",	/* stmt: LABELV */
/* 346 */	"# jmp #LODL\n long %0\n jmp #PSHL ' ARGI4 addrg\n",	/* stmt: ARGI4(con) */
/* 347 */	"# jmp #LODL\n long %0\n jmp #PSHL ' ARGU4 addrg\n",	/* stmt: ARGU4(con) */
/* 348 */	"# jmp #LODL\n long %0\n jmp #PSHL ' ARGP4 addrg\n",	/* stmt: ARGP4(con) */
/* 349 */	"# jmp #LODL\n long %0\n jmp #PSHL ' ARGF4 addrg\n",	/* stmt: ARGF4(con) */
/* 350 */	"# mov RI, #%0\n jmp #PSHL ' ARGI4\n",	/* stmt: ARGI4(coni) */
/* 351 */	"# mov RI, #%0\n jmp #PSHL ' ARGU4\n",	/* stmt: ARGU4(coni) */
/* 352 */	"# mov RI, #%0\n jmp #PSHL ' ARGP4\n",	/* stmt: ARGP4(coni) */
/* 353 */	"# mov RI, #%0\n jmp #PSHL ' ARGF4\n",	/* stmt: ARGF4(coni) */
/* 354 */	"# mov RI, %0\n jmp #PSHL ' ARGI4\n",	/* stmt: ARGI4(reg) */
/* 355 */	"# mov RI, %0\n jmp #PSHL ' ARGU4\n",	/* stmt: ARGU4(reg) */
/* 356 */	"# mov RI, %0\n jmp #PSHL ' ARGP4\n",	/* stmt: ARGP4(reg) */
/* 357 */	"# mov RI, %0\n jmp #PSHL ' ARGF4\n",	/* stmt: ARGF4(reg) */
/* 358 */	"# jmp #LODL\n long @%0\n jmp #PSHL ' ARGI4 ADDRGP4\n",	/* stmt: ARGI4(ADDRGP4) */
/* 359 */	"# jmp #LODL\n long @%0\n jmp #PSHL ' ARGU4 ADDRGP4\n",	/* stmt: ARGU4(ADDRGP4) */
/* 360 */	"# jmp #LODL\n long @%0\n jmp #PSHL ' ARGP4 ADDRGP4\n",	/* stmt: ARGP4(ADDRGP4) */
/* 361 */	"# jmp #LODL\n long @%0\n jmp #PSHL ' ARGF4 ADDRGP4\n",	/* stmt: ARGF4(ADDRGP4) */
/* 362 */	"# jmp #LODF\n long %0\n jmp #PSHL ' ARGI4 ADDRLP4\n",	/* stmt: ARGI4(ADDRLP4) */
/* 363 */	"# jmp #LODF\n long %0\n jmp #PSHL ' ARGU4 ADDRLP4\n",	/* stmt: ARGU4(ADDRLP4) */
/* 364 */	"# jmp #LODF\n long %0\n jmp #PSHL ' ARGP4 ADDRLP4\n",	/* stmt: ARGP4(ADDRLP4) */
/* 365 */	"# jmp #LODF\n long %0\n jmp #PSHL ' ARGF4 ADDRLP4\n",	/* stmt: ARGF4(ADDRLP4) */
/* 366 */	"# jmp #LODF\n long %0\n jmp #PSHL ' ARGI4 ADDRFP4\n",	/* stmt: ARGI4(ADDRFP4) */
/* 367 */	"# jmp #LODF\n long %0\n jmp #PSHL ' ARGU4 ADDRFP4\n",	/* stmt: ARGU4(ADDRFP4) */
/* 368 */	"# jmp #LODF\n long %0\n jmp #PSHL ' ARGP4 ADDRFP4\n",	/* stmt: ARGP4(ADDRFP4) */
/* 369 */	"# jmp #LODF\n long %0\n jmp #PSHL ' ARGF4 ADDRFP4\n",	/* stmt: ARGF4(ADDRFP4) */
/* 370 */	"# jmp #PSHA\n long @%0 ' ARGI4 INDIRI4 ADDRGP4\n",	/* stmt: ARGI4(INDIRI4(ADDRGP4)) */
/* 371 */	"# jmp #PSHA\n long @%0 ' ARGU4 INDIRU4 ADDRGP4\n",	/* stmt: ARGU4(INDIRU4(ADDRGP4)) */
/* 372 */	"# jmp #PSHA\n long @%0 ' ARGP4 INDIRP4 ADDRGP4\n",	/* stmt: ARGP4(INDIRP4(ADDRGP4)) */
/* 373 */	"# jmp #PSHA\n long @%0 ' ARGF4 INDIRF4 ADDRGP4\n",	/* stmt: ARGF4(INDIRF4(ADDRGP4)) */
/* 374 */	"# jmp #PSHF\n long %0 ' ARGI4 INDIRI4 ADDRLP4\n",	/* stmt: ARGI4(INDIRI4(ADDRLP4)) */
/* 375 */	"# jmp #PSHF\n long %0 ' ARGU4 INDIRU4 ADDRLP4\n",	/* stmt: ARGU4(INDIRU4(ADDRLP4)) */
/* 376 */	"# jmp #PSHF\n long %0 ' ARGP4 INDIRP4 ADDRLP4\n",	/* stmt: ARGP4(INDIRP4(ADDRLP4)) */
/* 377 */	"# jmp #PSHF\n long %0 ' ARGF4 INDIRF4 ADDRLP4\n",	/* stmt: ARGF4(INDIRF4(ADDRLP4)) */
/* 378 */	"# jmp #PSHF\n long %0 ' ARGI4 INDIRI4 ADDRFP4\n",	/* stmt: ARGI4(INDIRI4(ADDRFP4)) */
/* 379 */	"# jmp #PSHF\n long %0 ' ARGU4 INDIRU4 ADDRFP4\n",	/* stmt: ARGU4(INDIRU4(ADDRFP4)) */
/* 380 */	"# jmp #PSHF\n long %0 ' ARGP4 INDIRP4 ADDRFP4\n",	/* stmt: ARGP4(INDIRP4(ADDRFP4)) */
/* 381 */	"# jmp #PSHF\n long %0 ' ARGF4 INDIRF4 ADDRFP4\n",	/* stmt: ARGF4(INDIRF4(ADDRFP4)) */
};

static char _isinstruction[] = {
/* 0 */	0,
/* 1 */	1,	/* # read register\n */
/* 2 */	1,	/* # read register\n */
/* 3 */	1,	/* # read register\n */
/* 4 */	1,	/* # read register\n */
/* 5 */	1,	/* # read register\n */
/* 6 */	1,	/* # read register\n */
/* 7 */	1,	/* # read register\n */
/* 8 */	1,	/* # read register\n */
/* 9 */	1,	/* # foo\n */
/* 10 */	1,	/* # peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n */
/* 11 */	1,	/* # peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n */
/* 12 */	1,	/* # peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n */
/* 13 */	1,	/* # peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n */
/* 14 */	1,	/* # peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n */
/* 15 */	1,	/* # peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n */
/* 16 */	1,	/* # peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n */
/* 17 */	1,	/* # peep ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' LOAD\n */
/* 18 */	0,	/*  */
/* 19 */	1,	/* # write register\n */
/* 20 */	1,	/* # write register\n */
/* 21 */	1,	/* # write register\n */
/* 22 */	1,	/* # write register\n */
/* 23 */	1,	/* # write register\n */
/* 24 */	1,	/* # write register\n */
/* 25 */	1,	/* # write register\n */
/* 26 */	1,	/* # write register\n */
/* 27 */	0,	/* %a */
/* 28 */	0,	/* %a */
/* 29 */	0,	/* %a */
/* 30 */	0,	/* %a */
/* 31 */	0,	/* %a */
/* 32 */	0,	/* %a */
/* 33 */	0,	/* %a */
/* 34 */	0,	/* %a */
/* 35 */	0,	/* %a */
/* 36 */	0,	/* %a */
/* 37 */	0,	/* %a */
/* 38 */	0,	/* %a */
/* 39 */	0,	/* %a */
/* 40 */	0,	/* %a */
/* 41 */	0,	/* %a */
/* 42 */	0,	/* %a */
/* 43 */	0,	/* %a */
/* 44 */	0,	/* %a */
/* 45 */	0,	/* %a */
/* 46 */	0,	/* %a */
/* 47 */	0,	/* %a */
/* 48 */	0,	/* %a */
/* 49 */	0,	/* %a */
/* 50 */	0,	/* %a */
/* 51 */	0,	/* %a */
/* 52 */	0,	/* %a */
/* 53 */	0,	/* %a */
/* 54 */	0,	/* %a */
/* 55 */	0,	/* %a */
/* 56 */	0,	/* %a */
/* 57 */	0,	/* %a */
/* 58 */	0,	/* %a */
/* 59 */	0,	/* %a */
/* 60 */	0,	/* %a */
/* 61 */	0,	/* %a */
/* 62 */	0,	/* %a */
/* 63 */	0,	/* %a */
/* 64 */	0,	/* %a */
/* 65 */	1,	/*  word I16B_LODF + ((%a)&$1FF)<<S16B\n word I16A_MOV + (%c)<<D16A + RI<<S16A ' reg <- addrl16\n */
/* 66 */	1,	/*  alignl ' align long\n long I32_LODF + ((%a)&$FFFFFF)<<S32\n word I16A_MOV + (%c)<<D16A + RI<<S16A ' reg <- addrl32\n */
/* 67 */	1,	/*  word I16B_LODL + (%c)<<D16B\n alignl ' align long\n long @%0 ' reg <- addrg\n */
/* 68 */	1,	/*  alignl ' align long\n long I32_MOV + (%c)<<D32 + %a<<S32 ' reg <- special\n */
/* 69 */	1,	/*  word I16A_MOVI + (%c)<<D16A + (%0)<<S16A ' reg <- coni\n */
/* 70 */	1,	/*  word I16A_NEGI + (%c)<<D16A + (-(%0)&$1F)<<S16A ' reg <- conn\n */
/* 71 */	1,	/*  alignl ' align long\n long I32_LODS + (%c)<<D32S + ((%0)&$7FFFF)<<S32 ' reg <- cons\n */
/* 72 */	1,	/*  alignl ' align long\n long I32_MOVI + (%c)<<D32 +(%0)<<S32 ' reg <- conli\n */
/* 73 */	1,	/*  word I16B_LODL + (%c)<<D16B\n alignl ' align long\n long %0 ' reg <- con\n */
/* 74 */	1,	/*  word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRI1 reg\n */
/* 75 */	1,	/*  word I16A_RDWORD + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRI2 reg\n */
/* 76 */	1,	/*  word I16A_RDLONG + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRI4 reg\n */
/* 77 */	1,	/*  word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRU1 reg\n */
/* 78 */	1,	/*  word I16A_RDWORD + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRU2 reg\n */
/* 79 */	1,	/*  word I16A_RDLONG + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRU4 reg\n */
/* 80 */	1,	/*  word I16A_RDLONG + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRF4 reg\n */
/* 81 */	1,	/*  word I16A_RDLONG + (%c)<<D16A + (%0)<<S16A ' reg <- INDIRP4 reg\n */
/* 82 */	1,	/*  alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_RDBYTE + (%c)<<D16A + RI<<S16A ' reg <- INDIRI1 addrg\n */
/* 83 */	1,	/*  alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_RDWORD + (%c)<<D16A + RI<<S16A ' reg <- INDIRI2 addrg\n */
/* 84 */	1,	/*  alignl ' align long\n long I32_LODI + (@%0)<<S32\n word I16A_MOV + (%c)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg\n */
/* 85 */	1,	/*  alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_RDBYTE + (%c)<<D16A + RI<<S16A ' reg <- INDIRU1 addrg\n */
/* 86 */	1,	/*  alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_RDWORD + (%c)<<D16A + RI<<S16A ' reg <- INDIRU2 addrg\n */
/* 87 */	1,	/*  alignl ' align long\n long I32_LODI + (@%0)<<S32\n word I16A_MOV + (%c)<<D16A + RI<<S16A ' reg <- INDIRU4 addrg\n */
/* 88 */	1,	/*  alignl ' align long\n long I32_LODI + (@%0)<<S32\n word I16A_MOV + (%c)<<D16A + RI<<S16A ' reg <- INDIRF4 addrg\n */
/* 89 */	1,	/*  alignl ' align long\n long I32_LODI + (@%0)<<S32\n word I16A_MOV + (%c)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg\n */
/* 90 */	1,	/*  alignl ' align long\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRI1 addrg special\n */
/* 91 */	1,	/*  alignl ' align long\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRI2 addrg special\n */
/* 92 */	1,	/*  alignl ' align long\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRI4 addrg special\n */
/* 93 */	1,	/*  alignl ' align long\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRU1 addrg special\n */
/* 94 */	1,	/*  alignl ' align long\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRU2 addrg special\n */
/* 95 */	1,	/*  alignl ' align long\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRU4 addrg special\n */
/* 96 */	1,	/*  alignl ' align long\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRF4 addrg special\n */
/* 97 */	1,	/*  alignl ' align long\n long I32_MOV + (%c)<<D32 + (%0)<<S32 ' reg <- INDIRP4 addrg special\n */
/* 98 */	1,	/*  word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDBYTE + (%c)<<D16A + RI<<S16A ' reg <- INDIRI1 addrl16\n */
/* 99 */	1,	/*  word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDWORD + (%c)<<D16A + RI<<S16A ' reg <- INDIRI2 addrl16\n */
/* 100 */	1,	/*  word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16\n */
/* 101 */	1,	/*  word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDBYTE + (%c)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl16\n */
/* 102 */	1,	/*  word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDWORD + (%c)<<D16A + RI<<S16A ' reg <- INDIRU2 addrl16\n */
/* 103 */	1,	/*  word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16\n */
/* 104 */	1,	/*  word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl16\n */
/* 105 */	1,	/*  word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16\n */
/* 106 */	1,	/*  alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDBYTE + (%c)<<D16A + RI<<S16A ' reg <- INDIRI1 addrl32\n */
/* 107 */	1,	/*  alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDWORD + (%c)<<D16A + RI<<S16A ' reg <- INDIRI2 addrl32\n */
/* 108 */	1,	/*  alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl32\n */
/* 109 */	1,	/*  alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDBYTE + (%c)<<D16A + RI<<S16A ' reg <- INDIRU1 addrl32\n */
/* 110 */	1,	/*  alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDWORD + (%c)<<D16A + RI<<S16A ' reg <- INDIRU2 addrl32\n */
/* 111 */	1,	/*  alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl32\n */
/* 112 */	1,	/*  alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRF4 addrl32\n */
/* 113 */	1,	/*  alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_RDLONG + (%c)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl32\n */
/* 114 */	1,	/*  word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- CVUU1 INDIRU1 reg\n */
/* 115 */	1,	/*  word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- CVUU2 INDIRU1 reg\n */
/* 116 */	1,	/*  word I16A_RDWORD + (%c)<<D16A + (%0)<<S16A ' reg <- CVUU2 INDIRU2 reg\n */
/* 117 */	1,	/*  word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- CVUU4 INDIRU1 reg\n */
/* 118 */	1,	/*  word I16A_RDWORD + (%c)<<D16A + (%0)<<S16A ' reg <- CVUU4 INDIRU2 reg\n */
/* 119 */	1,	/*  word I16A_RDLONG + (%c)<<D16A + (%0)<<S16A ' reg <- CVUU4 INDIRU4 reg\n */
/* 120 */	1,	/*  word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- CVUI1 INDIRU1 reg\n */
/* 121 */	1,	/*  word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- CVUI2 INDIRU1 reg\n */
/* 122 */	1,	/*  word I16A_RDWORD + (%c)<<D16A + (%0)<<S16A ' reg <- CVUI2 INDIRU2 reg\n */
/* 123 */	1,	/*  word I16A_RDBYTE + (%c)<<D16A + (%0)<<S16A ' reg <- CVUI4 INDIRU1 reg\n */
/* 124 */	1,	/*  word I16A_RDWORD + (%c)<<D16A + (%0)<<S16A ' reg <- CVUI4 INDIRU2 reg\n */
/* 125 */	1,	/*  word I16A_RDLONG + (%c)<<D16A + (%0)<<S16A ' reg <- CVUI4 INDIRU4 reg\n */
/* 126 */	1,	/*  alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_WRBYTE + (%1)<<D16A + RI<<S16A ' ASGNI1 addrg reg\n */
/* 127 */	1,	/*  alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_WRWORD + (%1)<<D16A + RI<<S16A ' ASGNI2 addrg reg\n */
/* 128 */	1,	/*  alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNI4 addrg reg\n */
/* 129 */	1,	/*  alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_WRBYTE + (%1)<<D16A + RI<<S16A ' ASGNU1 addrg reg\n */
/* 130 */	1,	/*  alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_WRWORD + (%1)<<D16A + RI<<S16A ' ASGNU2 addrg reg\n */
/* 131 */	1,	/*  alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNU4 addrg reg\n */
/* 132 */	1,	/*  alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNF4 addrg reg\n */
/* 133 */	1,	/*  alignl ' align long\n long I32_LODA + (@%0)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNP4 addrg reg\n */
/* 134 */	1,	/*  alignl ' align long\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNI1 special reg\n */
/* 135 */	1,	/*  alignl ' align long\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNI2 special reg\n */
/* 136 */	1,	/*  alignl ' align long\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNI4 special reg\n */
/* 137 */	1,	/*  alignl ' align long\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNU1 special reg\n */
/* 138 */	1,	/*  alignl ' align long\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNU2 special reg\n */
/* 139 */	1,	/*  alignl ' align long\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNU4 special reg\n */
/* 140 */	1,	/*  alignl ' align long\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNF4 special reg\n */
/* 141 */	1,	/*  alignl ' align long\n long I32_MOV + (%0)<<D32 + (%1)<<S32 ' ASGNP4 special reg\n */
/* 142 */	1,	/*  alignl ' align long\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNI1 special conli\n */
/* 143 */	1,	/*  alignl ' align long\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNI2 special conli\n */
/* 144 */	1,	/*  alignl ' align long\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNI4 special conli\n */
/* 145 */	1,	/*  alignl ' align long\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNU1 special conli\n */
/* 146 */	1,	/*  alignl ' align long\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNU2 special conli\n */
/* 147 */	1,	/*  alignl ' align long\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNU4 special conli\n */
/* 148 */	1,	/*  alignl ' align long\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNF4 special conli\n */
/* 149 */	1,	/*  alignl ' align long\n long I32_MOVI + (%0)<<D32 + (%1)<<S32 ' ASGNP4 special conli\n */
/* 150 */	1,	/*  word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRBYTE + (%1)<<D16A + RI<<S16A ' ASGNI1 addrl16 reg\n */
/* 151 */	1,	/*  word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRWORD + (%1)<<D16A + RI<<S16A ' ASGNI2 addrl16 reg\n */
/* 152 */	1,	/*  word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg\n */
/* 153 */	1,	/*  word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRBYTE + (%1)<<D16A + RI<<S16A ' ASGNU1 addrl16 reg\n */
/* 154 */	1,	/*  word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRWORD + (%1)<<D16A + RI<<S16A ' ASGNU2 addrl16 reg\n */
/* 155 */	1,	/*  word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg\n */
/* 156 */	1,	/*  word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNF4 addrl16 reg\n */
/* 157 */	1,	/*  word I16B_LODF + ((%0)&$1FF)<<S16B\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg\n */
/* 158 */	1,	/*  alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRBYTE + (%1)<<D16A + RI<<S16A ' ASGNI1 addrl32 reg\n */
/* 159 */	1,	/*  alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRWORD + (%1)<<D16A + RI<<S16A ' ASGNI2 addrl32 reg\n */
/* 160 */	1,	/*  alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNI4 addrl32 reg\n */
/* 161 */	1,	/*  alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRBYTE + (%1)<<D16A + RI<<S16A ' ASGNU1 addrl32 reg\n */
/* 162 */	1,	/*  alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRWORD + (%1)<<D16A + RI<<S16A ' ASGNU2 addrl32 reg\n */
/* 163 */	1,	/*  alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNU4 addrl32 reg\n */
/* 164 */	1,	/*  alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNF4 addrl32 reg\n */
/* 165 */	1,	/*  alignl ' align long\n long I32_LODF + ((%0)&$FFFFFF)<<S32\n word I16A_WRLONG + (%1)<<D16A + RI<<S16A ' ASGNP4 addrl32 reg\n */
/* 166 */	1,	/*  word I16A_WRBYTE + (%1)<<D16A + (%0)<<S16A ' ASGNI1 reg reg\n */
/* 167 */	1,	/*  word I16A_WRWORD + (%1)<<D16A + (%0)<<S16A ' ASGNI2 reg reg\n */
/* 168 */	1,	/*  word I16A_WRLONG + (%1)<<D16A + (%0)<<S16A ' ASGNI4 reg reg\n */
/* 169 */	1,	/*  word I16A_WRBYTE + (%1)<<D16A + (%0)<<S16A ' ASGNU1 reg reg\n */
/* 170 */	1,	/*  word I16A_WRWORD + (%1)<<D16A + (%0)<<S16A ' ASGNU2 reg reg\n */
/* 171 */	1,	/*  word I16A_WRLONG + (%1)<<D16A + (%0)<<S16A ' ASGNU4 reg reg\n */
/* 172 */	1,	/*  word I16A_WRLONG + (%1)<<D16A + (%0)<<S16A ' ASGNF4 reg reg\n */
/* 173 */	1,	/*  word I16A_WRLONG + (%1)<<D16A + (%0)<<S16A ' ASGNP4 reg reg\n */
/* 174 */	1,	/* # call\n */
/* 175 */	1,	/* # call\n */
/* 176 */	1,	/* # call\n */
/* 177 */	1,	/* # call\n */
/* 178 */	1,	/* # call\n */
/* 179 */	1,	/* # call\n */
/* 180 */	1,	/* # call\n */
/* 181 */	1,	/* # call\n */
/* 182 */	1,	/* # call\n */
/* 183 */	1,	/* # call\n */
/* 184 */	1,	/* # ret\n */
/* 185 */	1,	/* # ret\n */
/* 186 */	1,	/* # ret\n */
/* 187 */	1,	/* # ret\n */
/* 188 */	1,	/*  word I16A_MOVI + R0<<D16A + (%0)<<S16A ' RET coni\n */
/* 189 */	1,	/*  word I16A_MOVI + R0<<D16A + (%0)<<S16A ' RET coni\n */
/* 190 */	1,	/*  word I16A_MOVI + R0<<D16A + (%0)<<S16A ' RET coni\n */
/* 191 */	1,	/*  alignl ' align long\n long I32_LODS + R0<<D32S + ((%0)&$7FFFF)<<S32 ' RET cons\n */
/* 192 */	1,	/*  alignl ' align long\n long I32_LODS + R0<<D32S + ((%0)&$7FFFF)<<S32 ' RET cons\n */
/* 193 */	1,	/*  alignl ' align long\n long I32_LODS + R0<<D32S + ((%0)&$7FFFF)<<S32 ' RET cons\n */
/* 194 */	1,	/*  alignl ' align long\n long I32_MOVI + R0<<D32 + (%0)<<S32 ' RET conli\n */
/* 195 */	1,	/*  alignl ' align long\n long I32_MOVI + R0<<D32 + (%0)<<S32 ' RET conli\n */
/* 196 */	1,	/*  alignl ' align long\n long I32_MOVI + R0<<D32 + (%0)<<S32 ' RET conli\n */
/* 197 */	1,	/*  word I16B_LODL + R0<<D16B\n alignl ' align long\n long %0 ' RET con\n */
/* 198 */	1,	/*  word I16B_LODL + R0<<D16B\n alignl ' align long\n long %0 ' RET con\n */
/* 199 */	1,	/*  word I16B_LODL + R0<<D16B\n alignl ' align long\n long %0 ' RET con\n */
/* 200 */	1,	/*  word I16B_LODL + R0<<D16B\n alignl ' align long\n long %0 ' RET con\n */
/* 201 */	1,	/* # zero extend\n */
/* 202 */	1,	/* # zero extend\n */
/* 203 */	1,	/* # zero extend\n */
/* 204 */	1,	/* # truncate\n */
/* 205 */	1,	/* # truncate\n */
/* 206 */	1,	/* # truncate\n */
/* 207 */	1,	/* ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' CVUP4\n */
/* 208 */	1,	/* ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A ' CVPU4\n */
/* 209 */	1,	/* # sign extend\n */
/* 210 */	1,	/* # sign extend\n */
/* 211 */	1,	/* # sign extend\n */
/* 212 */	1,	/* # truncate\n */
/* 213 */	1,	/* # truncate\n */
/* 214 */	1,	/* # truncate\n */
/* 215 */	0,	/* # nothing */
/* 216 */	1,	/*  word I16B_FLTP + INFL<<S16B ' CVFI4\n */
/* 217 */	1,	/*  word I16B_FLTP + FLIN<<S16B ' CVIF4\n */
/* 218 */	1,	/*  word I16A_NEG + (%c)<<D16A + (%0)<<S16A ' NEGI4\n */
/* 219 */	1,	/* ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16B_SIGN + (%c)<<D16B ' NEGF4\n */
/* 220 */	1,	/* ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16B_CPL + (%c)<<D16B ' BCOMI4\n */
/* 221 */	1,	/* ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16B_CPL + (%c)<<D16B ' BCOMU4\n */
/* 222 */	1,	/* ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_ADDSI + (%c)<<D16A + (%1)<<S16A ' ADDI4 reg coni\n */
/* 223 */	1,	/* ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_ADDI + (%c)<<D16A + (%1)<<S16A ' ADDU4 reg coni\n */
/* 224 */	1,	/* ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_ADDSI + (%c)<<D16A + (%1)<<S16A ' ADDP4 reg coni\n */
/* 225 */	1,	/* # mov RI, %0\n adds RI, %1\n mov %c, RI ' ADDI4 reg\n */
/* 226 */	1,	/* # mov RI, %0\n add RI, %1\n mov %c, RI ' ADDU4 reg\n */
/* 227 */	1,	/* # mov RI, %0\n adds RI, %1\n mov %c, RI ' ADDP4 reg\n */
/* 228 */	1,	/* # jmp #FADD ' ADDF4\n */
/* 229 */	1,	/* # mov RI, %0\n and RI, %1\n mov %c, RI ' BANDI4 reg\n */
/* 230 */	1,	/* # mov RI, %0\n and RI, %1\n mov %c, RI ' BANDU4 reg\n */
/* 231 */	1,	/* # mov RI, %0\n or RI, %1\n mov %c, RI ' BORI4 reg\n */
/* 232 */	1,	/* # mov RI, %0\n or RI, %1\n mov %c, RI ' BORU4 reg\n */
/* 233 */	1,	/* # mov RI, %0\n xor RI, %1\n mov %c, RI ' BXORI4 reg\n */
/* 234 */	1,	/* # mov RI, %0\n xor RI, %1\n mov %c, RI ' BXORU4 reg\n */
/* 235 */	1,	/* ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SUBSI + (%c)<<D16A + (%1)<<S16A ' SUBI4 reg coni\n */
/* 236 */	1,	/* ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SUBI + (%c)<<D16A + (%1)<<S16A ' SUBU4 reg coni\n */
/* 237 */	1,	/* ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SUBSI + (%c)<<D16A + (%1)<<S16A ' SUBP4 reg coni\n */
/* 238 */	1,	/* # mov RI, %0\n subs RI, %1\n mov %c, RI ' SUBI4 reg\n */
/* 239 */	1,	/* # mov RI, %0\n sub RI, %1\n mov %c, RI ' SUBU4 reg\n */
/* 240 */	1,	/* # mov RI, %0\n subs RI, %1\n mov %c, RI ' SUBP4 reg\n */
/* 241 */	1,	/* # jmp #FSUB ' SUBF4\n */
/* 242 */	1,	/* # jmp #DIVS ' DIVI4\n */
/* 243 */	1,	/* # jmp #DIVU ' DIVU4\n */
/* 244 */	1,	/* # jmp #FDIV ' DIVF4\n */
/* 245 */	1,	/* # jmp #DIVS ' MODI4\n */
/* 246 */	1,	/* # jmp #DIVU ' MODU4\n */
/* 247 */	1,	/* # jmp #MULT ' MULI4\n */
/* 248 */	1,	/* # jmp #MULT ' MULU4\n */
/* 249 */	1,	/* # jmp #FMUL ' MULF4\n */
/* 250 */	1,	/* # mov RI, %0\n shl RI, %1\n mov %c, RI ' LSHI4 reg\n */
/* 251 */	1,	/* # mov RI, %0\n shl RI, %1\n mov %c, RI ' LSHU4 reg\n */
/* 252 */	1,	/* ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SHLI + (%c)<<D16A + (%1)<<S16A ' SHLI4 reg coni\n */
/* 253 */	1,	/* ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SHLI + (%c)<<D16A + (%1)<<S16A ' SHLU4 reg coni\n */
/* 254 */	1,	/* # mov RI, %0\n sar RI, %1\n mov %c, RI ' RSHI4 reg\n */
/* 255 */	1,	/* # mov RI, %0\n shr RI, %1\n mov %c, RI ' RSHU4 reg\n */
/* 256 */	1,	/* ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SARI + (%c)<<D16A + (%1)<<S16A ' SHRI4 reg coni\n */
/* 257 */	1,	/* ? word I16A_MOV + (%c)<<D16A + (%0)<<S16A\n word I16A_SHRI + (%c)<<D16A + (%1)<<S16A ' SHRU4 reg coni\n */
/* 258 */	1,	/*  alignl ' align long\n long I32_MOV + (%1)<<D32 + (%2)<<S32 ' ASGNI4 special reg\n */
/* 259 */	1,	/*  alignl ' align long\n long I32_MOV + (%1)<<D32 + (%2)<<S32 ' ASGNU4 special reg\n */
/* 260 */	1,	/*  word I16B_PASM \n alignl ' align long\n and %0, #%2 ' ASGNI4 special BAND4 special conli\n */
/* 261 */	1,	/*  word I16B_PASM \n alignl ' align long\n and %0, #%2 ' ASGNU4 special BAND4 special conli\n */
/* 262 */	1,	/*  word I16B_PASM \n alignl ' align long\n and %0, %2 ' ASGNI4 special BAND4 special reg\n */
/* 263 */	1,	/*  word I16B_PASM \n alignl ' align long\n and %0, %2 ' ASGNU4 special BAND4 special reg\n */
/* 264 */	1,	/*  word I16B_PASM \n alignl ' align long\n or %0, #%2 ' ASGNI4 special BOR4 special conli\n */
/* 265 */	1,	/*  word I16B_PASM \n alignl ' align long\n or %0, #%2 ' ASGNU4 special BOR4 special conli\n */
/* 266 */	1,	/*  word I16B_PASM \n alignl ' align long\n or %0, %2 ' ASGNI4 special BOR4 special reg\n */
/* 267 */	1,	/*  word I16B_PASM \n alignl ' align long\n or %0, %2 ' ASGNU4 special BOR4 special reg\n */
/* 268 */	1,	/*  word I16B_PASM \n alignl ' align long\n xor %0, #%2 ' ASGNI4 special BXOR4 special conli\n */
/* 269 */	1,	/*  word I16B_PASM \n alignl ' align long\n xor %0, #%2 ' ASGNU4 special BXOR4 special conli\n */
/* 270 */	1,	/*  word I16B_PASM \n alignl ' align long\n xor %0, %2 ' ASGNI4 special BXOR4 special reg\n */
/* 271 */	1,	/*  word I16B_PASM \n alignl ' align long\n xor %0, %2 ' ASGNU4 special BXOR4 special reg\n */
/* 272 */	1,	/*  word I16A_ADDSI (%0)<<D16A + (%2)<<S16A ' ASGNI4 special BADD4 special coni\n */
/* 273 */	1,	/*  word I16A_ADDI (%0)<<D16A + (%2)<<S16A ' ASGNU4 special BADD4 special coni\n */
/* 274 */	1,	/*  word I16B_PASM \n alignl ' align long\n adds %0, #%2 ' ASGNI4 special BADD4 special conli\n */
/* 275 */	1,	/*  word I16B_PASM \n alignl ' align long\n add %0, #%2 ' ASGNU4 special BADD4 special conli\n */
/* 276 */	1,	/*  word I16B_PASM \n alignl ' align long\n adds %0, %2 ' ASGNI4 special BADD4 special reg\n */
/* 277 */	1,	/*  word I16B_PASM \n alignl ' align long\n add %0, %2 ' ASGNU4 special BADD4 special reg\n */
/* 278 */	1,	/*  word I16A_SUBSI (%0)<<D16A + (%2)<<S16A ' ASGNI4 special BSUB4 special coni\n */
/* 279 */	1,	/*  word I16A_SUBI (%0)<<D16A + (%2)<<S16A ' ASGNU4 special BSUB4 special coni\n */
/* 280 */	1,	/*  word I16B_PASM \n alignl ' align long\n subs %0, #%2 ' ASGNI4 special BSUB4 special conli\n */
/* 281 */	1,	/*  word I16B_PASM \n alignl ' align long\n sub %0, #%2 ' ASGNU4 special BSUB4 special conli\n */
/* 282 */	1,	/*  word I16B_PASM \n alignl ' align long\n subs %0, %2 ' ASGNI4 special BSUB4 special reg\n */
/* 283 */	1,	/*  word I16B_PASM \n alignl ' align long\n sub %0, %2 ' ASGNU4 special BSUB4 special reg\n */
/* 284 */	1,	/*  word I16A_SHLI + (%0)<<D16A + (%2)<<S16A ' ASGNI4 special LSH4 special coni\n */
/* 285 */	1,	/*  word I16A_SHLI + (%0)<<D16A + (%2)<<S16A ' ASGNU4 special LSH4 special coni\n */
/* 286 */	1,	/*  word I16B_PASM \n alignl ' align long\n shl %0, #%2 ' ASGNI4 special LSH4 special conli\n */
/* 287 */	1,	/*  word I16B_PASM \n alignl ' align long\n shl %0, #%2 ' ASGNU4 special LSH4 special conli\n */
/* 288 */	1,	/*  word I16B_PASM \n alignl ' align long\n shl %0, %2 ' ASGNI4 special LSH4 special reg\n */
/* 289 */	1,	/*  word I16B_PASM \n alignl ' align long\n shl %0, %2 ' ASGNU4 special LSH4 special reg\n */
/* 290 */	1,	/*  word I16A_SHRI + (%0)<<D16A + (%2)<<S16A ' ASGNI4 special RSH4 special coni\n */
/* 291 */	1,	/*  word I16A_SHRI + (%0)<<D16A + (%2)<<S16A ' ASGNU4 special RSH4 special coni\n */
/* 292 */	1,	/*  word I16B_PASM \n alignl ' align long\n shr %0, #%2 ' ASGNI4 special RSH4 special conli\n */
/* 293 */	1,	/*  word I16B_PASM \n alignl ' align long\n shr %0, #%2 ' ASGNU4 special RSH4 special conli\n */
/* 294 */	1,	/*  word I16B_PASM \n alignl ' align long\n shr %0, %2 ' ASGNI4 special RSH4 special reg\n */
/* 295 */	1,	/*  word I16B_PASM \n alignl ' align long\n shr %0, %2 ' ASGNU4 special RSH4 special reg\n */
/* 296 */	1,	/*  word I16A_CMPS + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_Z + (@%a)<<S32 ' EQI4 reg reg\n */
/* 297 */	1,	/*  word I16A_CMP + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_Z + (@%a)<<S32 ' EQU4 reg reg\n */
/* 298 */	1,	/* # jmp #FCMP\n jmp #BR_Z\n long (@%a) ' EQF4 reg reg\n */
/* 299 */	1,	/*  word I16A_CMPS + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRNZ + (@%a)<<S32 ' NEI4 reg reg\n */
/* 300 */	1,	/*  word I16A_CMP + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRNZ + (@%a)<<S32 ' NEU4 reg reg\n */
/* 301 */	1,	/* # jmp #FCMP\n jmp #BRNZ\n long (@%a) ' NEF4 reg reg\n */
/* 302 */	1,	/*  word I16A_CMPS + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRAE + (@%a)<<S32 ' GEI4 reg reg\n */
/* 303 */	1,	/*  word I16A_CMP + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRAE + (@%a)<<S32 ' GEU4 reg reg\n */
/* 304 */	1,	/* # jmp #FCMP\n jmp #BRAE\n long (@%a) ' GEF4 reg reg\n */
/* 305 */	1,	/*  word I16A_CMPS + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_A + (@%a)<<S32 ' GTI4 reg reg\n */
/* 306 */	1,	/*  word I16A_CMP + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_A + (@%a)<<S32 ' GTU4 reg reg\n */
/* 307 */	1,	/* # jmp #FCMP\n jmp #BR_A\n long (@%a) ' GTF4 reg reg\n */
/* 308 */	1,	/*  word I16A_CMPS + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRBE + (@%a)<<S32 ' LEI4 reg reg\n */
/* 309 */	1,	/*  word I16A_CMP + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRBE + (@%a)<<S32 ' LEU4 reg reg\n */
/* 310 */	1,	/* # jmp #FCMP\n jmp #BRBE\n long (@%a) '  LEF4 reg reg\n */
/* 311 */	1,	/*  word I16A_CMPS + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_B + (@%a)<<S32 ' LTI4 reg reg\n */
/* 312 */	1,	/*  word I16A_CMP + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_B + (@%a)<<S32 ' LTU4 reg reg\n */
/* 313 */	1,	/* # jmp #FCMP\n jmp #BR_B\n long (@%a) ' LTF4 reg reg\n */
/* 314 */	1,	/*  word I16A_CMPSI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_Z + (@%a)<<S32 ' EQI4 reg coni\n */
/* 315 */	1,	/*  word I16A_CMPI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_Z + (@%a)<<S32 ' EQU4 reg coni\n */
/* 316 */	1,	/*  word I16A_CMPSI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRNZ + (@%a)<<S32 ' NEI4 reg coni\n */
/* 317 */	1,	/*  word I16A_CMPI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRNZ + (@%a)<<S32 ' NEU4 reg coni\n */
/* 318 */	1,	/*  word I16A_CMPSI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRAE + (@%a)<<S32 ' GEI4 reg coni\n */
/* 319 */	1,	/*  word I16A_CMPI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRAE + (@%a)<<S32 ' GEU4 reg coni\n */
/* 320 */	1,	/*  word I16A_CMPSI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_A + (@%a)<<S32 ' GTI4 reg coni\n */
/* 321 */	1,	/*  word I16A_CMPI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_A + (@%a)<<S32 ' GTU4 reg coni\n */
/* 322 */	1,	/*  word I16A_CMPSI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRBE + (@%a)<<S32 ' LEI4 reg coni\n */
/* 323 */	1,	/*  word I16A_CMPI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BRBE + (@%a)<<S32 ' LEU4 reg coni\n */
/* 324 */	1,	/*  word I16A_CMPSI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_B + (@%a)<<S32 ' LTI4 reg coni\n */
/* 325 */	1,	/*  word I16A_CMPI + (%0)<<D16A + (%1)<<S16A\n alignl ' align long\n long I32_BR_B + (@%a)<<S32 ' LTU4 reg coni\n */
/* 326 */	1,	/*  alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMPS + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BR_Z + (@%a)<<S32 ' EQI4 reg coni\n */
/* 327 */	1,	/*  alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMP + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BR_Z + (@%a)<<S32 ' EQU4 reg coni\n */
/* 328 */	1,	/*  alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMPS + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BRNZ + (@%a)<<S32 ' NEI4 reg coni\n */
/* 329 */	1,	/*  alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMP + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BRNZ + (@%a)<<S32 ' NEU4 reg coni\n */
/* 330 */	1,	/*  alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMPS + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BRAE + (@%a)<<S32 ' GEI4 reg coni\n */
/* 331 */	1,	/*  alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMP + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BRAE + (@%a)<<S32 ' GEU4 reg coni\n */
/* 332 */	1,	/*  alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMPS + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BR_A + (@%a)<<S32 ' GTI4 reg coni\n */
/* 333 */	1,	/*  alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMP + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BR_A + (@%a)<<S32 ' GTU4 reg coni\n */
/* 334 */	1,	/*  alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMPS + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BRBE + (@%a)<<S32 ' LEI4 reg coni\n */
/* 335 */	1,	/*  alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMP + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BRBE + (@%a)<<S32 ' LEU4 reg coni\n */
/* 336 */	1,	/*  alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMPS + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BR_B + (@%a)<<S32 ' LTI4 reg coni\n */
/* 337 */	1,	/*  alignl ' align long\n long I32_MOVI + RI<<D32 + (%1)<<S32\n word I16A_CMP + (%0)<<D16A + RI<<S16A\n alignl ' align long\n long I32_BR_B + (@%a)<<S32 ' LTU4 reg coni\n */
/* 338 */	1,	/* # ARGB\n */
/* 339 */	1,	/* # ASGNB\n */
/* 340 */	1,	/*  word I16A_RDLONG + RI<<D16A + (%0)<<S16A\n word I16B_JMPI ' JUMPV INDIR addrl16\n alignl ' align long\n */
/* 341 */	1,	/*  word I16A_RDLONG + RI<<D16A + (%0)<<S16A\n word I16B_JMPI ' JUMPV INDIR addrl32\n alignl ' align long\n */
/* 342 */	1,	/*  word I16A_RDLONG + RI<<D16A + (%0)<<S16A\n word I16B_JMPI ' JUMPV INDIR addrg\n alignl ' align long\n */
/* 343 */	1,	/*  word I16A_RDLONG + RI<<D16A + (%0)<<S16A\n word I16B_JMPI ' JUMPV INDIR reg\n alignl ' align long\n */
/* 344 */	1,	/*  alignl ' align long\n long I32_JMPA + (@%0)<<S32 ' JUMPV addrg\n */
/* 345 */	1,	/* # %a\n */
/* 346 */	1,	/* # jmp #LODL\n long %0\n jmp #PSHL ' ARGI4 addrg\n */
/* 347 */	1,	/* # jmp #LODL\n long %0\n jmp #PSHL ' ARGU4 addrg\n */
/* 348 */	1,	/* # jmp #LODL\n long %0\n jmp #PSHL ' ARGP4 addrg\n */
/* 349 */	1,	/* # jmp #LODL\n long %0\n jmp #PSHL ' ARGF4 addrg\n */
/* 350 */	1,	/* # mov RI, #%0\n jmp #PSHL ' ARGI4\n */
/* 351 */	1,	/* # mov RI, #%0\n jmp #PSHL ' ARGU4\n */
/* 352 */	1,	/* # mov RI, #%0\n jmp #PSHL ' ARGP4\n */
/* 353 */	1,	/* # mov RI, #%0\n jmp #PSHL ' ARGF4\n */
/* 354 */	1,	/* # mov RI, %0\n jmp #PSHL ' ARGI4\n */
/* 355 */	1,	/* # mov RI, %0\n jmp #PSHL ' ARGU4\n */
/* 356 */	1,	/* # mov RI, %0\n jmp #PSHL ' ARGP4\n */
/* 357 */	1,	/* # mov RI, %0\n jmp #PSHL ' ARGF4\n */
/* 358 */	1,	/* # jmp #LODL\n long @%0\n jmp #PSHL ' ARGI4 ADDRGP4\n */
/* 359 */	1,	/* # jmp #LODL\n long @%0\n jmp #PSHL ' ARGU4 ADDRGP4\n */
/* 360 */	1,	/* # jmp #LODL\n long @%0\n jmp #PSHL ' ARGP4 ADDRGP4\n */
/* 361 */	1,	/* # jmp #LODL\n long @%0\n jmp #PSHL ' ARGF4 ADDRGP4\n */
/* 362 */	1,	/* # jmp #LODF\n long %0\n jmp #PSHL ' ARGI4 ADDRLP4\n */
/* 363 */	1,	/* # jmp #LODF\n long %0\n jmp #PSHL ' ARGU4 ADDRLP4\n */
/* 364 */	1,	/* # jmp #LODF\n long %0\n jmp #PSHL ' ARGP4 ADDRLP4\n */
/* 365 */	1,	/* # jmp #LODF\n long %0\n jmp #PSHL ' ARGF4 ADDRLP4\n */
/* 366 */	1,	/* # jmp #LODF\n long %0\n jmp #PSHL ' ARGI4 ADDRFP4\n */
/* 367 */	1,	/* # jmp #LODF\n long %0\n jmp #PSHL ' ARGU4 ADDRFP4\n */
/* 368 */	1,	/* # jmp #LODF\n long %0\n jmp #PSHL ' ARGP4 ADDRFP4\n */
/* 369 */	1,	/* # jmp #LODF\n long %0\n jmp #PSHL ' ARGF4 ADDRFP4\n */
/* 370 */	1,	/* # jmp #PSHA\n long @%0 ' ARGI4 INDIRI4 ADDRGP4\n */
/* 371 */	1,	/* # jmp #PSHA\n long @%0 ' ARGU4 INDIRU4 ADDRGP4\n */
/* 372 */	1,	/* # jmp #PSHA\n long @%0 ' ARGP4 INDIRP4 ADDRGP4\n */
/* 373 */	1,	/* # jmp #PSHA\n long @%0 ' ARGF4 INDIRF4 ADDRGP4\n */
/* 374 */	1,	/* # jmp #PSHF\n long %0 ' ARGI4 INDIRI4 ADDRLP4\n */
/* 375 */	1,	/* # jmp #PSHF\n long %0 ' ARGU4 INDIRU4 ADDRLP4\n */
/* 376 */	1,	/* # jmp #PSHF\n long %0 ' ARGP4 INDIRP4 ADDRLP4\n */
/* 377 */	1,	/* # jmp #PSHF\n long %0 ' ARGF4 INDIRF4 ADDRLP4\n */
/* 378 */	1,	/* # jmp #PSHF\n long %0 ' ARGI4 INDIRI4 ADDRFP4\n */
/* 379 */	1,	/* # jmp #PSHF\n long %0 ' ARGU4 INDIRU4 ADDRFP4\n */
/* 380 */	1,	/* # jmp #PSHF\n long %0 ' ARGP4 INDIRP4 ADDRFP4\n */
/* 381 */	1,	/* # jmp #PSHF\n long %0 ' ARGF4 INDIRF4 ADDRFP4\n */
};

static char *_string[] = {
/* 0 */	0,
/* 1 */	"reg: INDIRI1(VREGP)",
/* 2 */	"reg: INDIRU1(VREGP)",
/* 3 */	"reg: INDIRI2(VREGP)",
/* 4 */	"reg: INDIRU2(VREGP)",
/* 5 */	"reg: INDIRI4(VREGP)",
/* 6 */	"reg: INDIRU4(VREGP)",
/* 7 */	"reg: INDIRP4(VREGP)",
/* 8 */	"reg: INDIRF4(VREGP)",
/* 9 */	"reg: LOADB(reg)",
/* 10 */	"reg: LOADI1(reg)",
/* 11 */	"reg: LOADI2(reg)",
/* 12 */	"reg: LOADI4(reg)",
/* 13 */	"reg: LOADU1(reg)",
/* 14 */	"reg: LOADU2(reg)",
/* 15 */	"reg: LOADU4(reg)",
/* 16 */	"reg: LOADP4(reg)",
/* 17 */	"reg: LOADF4(reg)",
/* 18 */	"stmt: reg",
/* 19 */	"stmt: ASGNI1(VREGP,reg)",
/* 20 */	"stmt: ASGNI2(VREGP,reg)",
/* 21 */	"stmt: ASGNI4(VREGP,reg)",
/* 22 */	"stmt: ASGNU1(VREGP,reg)",
/* 23 */	"stmt: ASGNU2(VREGP,reg)",
/* 24 */	"stmt: ASGNU4(VREGP,reg)",
/* 25 */	"stmt: ASGNP4(VREGP,reg)",
/* 26 */	"stmt: ASGNF4(VREGP,reg)",
/* 27 */	"coni: CNSTI1",
/* 28 */	"coni: CNSTI2",
/* 29 */	"coni: CNSTI4",
/* 30 */	"coni: CNSTU1",
/* 31 */	"coni: CNSTU2",
/* 32 */	"coni: CNSTU4",
/* 33 */	"conn: CNSTI1",
/* 34 */	"conn: CNSTI2",
/* 35 */	"conn: CNSTI4",
/* 36 */	"conn: CNSTU1",
/* 37 */	"conn: CNSTU2",
/* 38 */	"conn: CNSTU4",
/* 39 */	"conli: CNSTI1",
/* 40 */	"conli: CNSTI2",
/* 41 */	"conli: CNSTI4",
/* 42 */	"conli: CNSTU1",
/* 43 */	"conli: CNSTU2",
/* 44 */	"conli: CNSTU4",
/* 45 */	"cons: CNSTI1",
/* 46 */	"cons: CNSTI2",
/* 47 */	"cons: CNSTI4",
/* 48 */	"cons: CNSTU1",
/* 49 */	"cons: CNSTU2",
/* 50 */	"cons: CNSTU4",
/* 51 */	"con: CNSTI1",
/* 52 */	"con: CNSTI2",
/* 53 */	"con: CNSTI4",
/* 54 */	"con: CNSTU1",
/* 55 */	"con: CNSTU2",
/* 56 */	"con: CNSTU4",
/* 57 */	"con: CNSTP4",
/* 58 */	"con: CNSTF4",
/* 59 */	"addrg: ADDRGP4",
/* 60 */	"special: ADDRGP4",
/* 61 */	"addrl16: ADDRLP4",
/* 62 */	"addrl16: ADDRFP4",
/* 63 */	"addrl32: ADDRLP4",
/* 64 */	"addrl32: ADDRFP4",
/* 65 */	"reg: addrl16",
/* 66 */	"reg: addrl32",
/* 67 */	"reg: addrg",
/* 68 */	"reg: special",
/* 69 */	"reg: coni",
/* 70 */	"reg: conn",
/* 71 */	"reg: cons",
/* 72 */	"reg: conli",
/* 73 */	"reg: con",
/* 74 */	"reg: INDIRI1(reg)",
/* 75 */	"reg: INDIRI2(reg)",
/* 76 */	"reg: INDIRI4(reg)",
/* 77 */	"reg: INDIRU1(reg)",
/* 78 */	"reg: INDIRU2(reg)",
/* 79 */	"reg: INDIRU4(reg)",
/* 80 */	"reg: INDIRF4(reg)",
/* 81 */	"reg: INDIRP4(reg)",
/* 82 */	"reg: INDIRI1(addrg)",
/* 83 */	"reg: INDIRI2(addrg)",
/* 84 */	"reg: INDIRI4(addrg)",
/* 85 */	"reg: INDIRU1(addrg)",
/* 86 */	"reg: INDIRU2(addrg)",
/* 87 */	"reg: INDIRU4(addrg)",
/* 88 */	"reg: INDIRF4(addrg)",
/* 89 */	"reg: INDIRP4(addrg)",
/* 90 */	"reg: INDIRI1(special)",
/* 91 */	"reg: INDIRI2(special)",
/* 92 */	"reg: INDIRI4(special)",
/* 93 */	"reg: INDIRU1(special)",
/* 94 */	"reg: INDIRU2(special)",
/* 95 */	"reg: INDIRU4(special)",
/* 96 */	"reg: INDIRF4(special)",
/* 97 */	"reg: INDIRP4(special)",
/* 98 */	"reg: INDIRI1(addrl16)",
/* 99 */	"reg: INDIRI2(addrl16)",
/* 100 */	"reg: INDIRI4(addrl16)",
/* 101 */	"reg: INDIRU1(addrl16)",
/* 102 */	"reg: INDIRU2(addrl16)",
/* 103 */	"reg: INDIRU4(addrl16)",
/* 104 */	"reg: INDIRF4(addrl16)",
/* 105 */	"reg: INDIRP4(addrl16)",
/* 106 */	"reg: INDIRI1(addrl32)",
/* 107 */	"reg: INDIRI2(addrl32)",
/* 108 */	"reg: INDIRI4(addrl32)",
/* 109 */	"reg: INDIRU1(addrl32)",
/* 110 */	"reg: INDIRU2(addrl32)",
/* 111 */	"reg: INDIRU4(addrl32)",
/* 112 */	"reg: INDIRF4(addrl32)",
/* 113 */	"reg: INDIRP4(addrl32)",
/* 114 */	"reg: CVUU1(INDIRU1(reg))",
/* 115 */	"reg: CVUU2(INDIRU1(reg))",
/* 116 */	"reg: CVUU2(INDIRU2(reg))",
/* 117 */	"reg: CVUU4(INDIRU1(reg))",
/* 118 */	"reg: CVUU4(INDIRU2(reg))",
/* 119 */	"reg: CVUU4(INDIRU4(reg))",
/* 120 */	"reg: CVUI1(INDIRU1(reg))",
/* 121 */	"reg: CVUI2(INDIRU1(reg))",
/* 122 */	"reg: CVUI2(INDIRU2(reg))",
/* 123 */	"reg: CVUI4(INDIRU1(reg))",
/* 124 */	"reg: CVUI4(INDIRU2(reg))",
/* 125 */	"reg: CVUI4(INDIRU4(reg))",
/* 126 */	"stmt: ASGNI1(addrg,reg)",
/* 127 */	"stmt: ASGNI2(addrg,reg)",
/* 128 */	"stmt: ASGNI4(addrg,reg)",
/* 129 */	"stmt: ASGNU1(addrg,reg)",
/* 130 */	"stmt: ASGNU2(addrg,reg)",
/* 131 */	"stmt: ASGNU4(addrg,reg)",
/* 132 */	"stmt: ASGNF4(addrg,reg)",
/* 133 */	"stmt: ASGNP4(addrg,reg)",
/* 134 */	"stmt: ASGNI1(special,reg)",
/* 135 */	"stmt: ASGNI2(special,reg)",
/* 136 */	"stmt: ASGNI4(special,reg)",
/* 137 */	"stmt: ASGNU1(special,reg)",
/* 138 */	"stmt: ASGNU2(special,reg)",
/* 139 */	"stmt: ASGNU4(special,reg)",
/* 140 */	"stmt: ASGNF4(special,reg)",
/* 141 */	"stmt: ASGNP4(special,reg)",
/* 142 */	"stmt: ASGNI1(special,conli)",
/* 143 */	"stmt: ASGNI2(special,conli)",
/* 144 */	"stmt: ASGNI4(special,conli)",
/* 145 */	"stmt: ASGNU1(special,conli)",
/* 146 */	"stmt: ASGNU2(special,conli)",
/* 147 */	"stmt: ASGNU4(special,conli)",
/* 148 */	"stmt: ASGNF4(special,conli)",
/* 149 */	"stmt: ASGNP4(special,conli)",
/* 150 */	"stmt: ASGNI1(addrl16,reg)",
/* 151 */	"stmt: ASGNI2(addrl16,reg)",
/* 152 */	"stmt: ASGNI4(addrl16,reg)",
/* 153 */	"stmt: ASGNU1(addrl16,reg)",
/* 154 */	"stmt: ASGNU2(addrl16,reg)",
/* 155 */	"stmt: ASGNU4(addrl16,reg)",
/* 156 */	"stmt: ASGNF4(addrl16,reg)",
/* 157 */	"stmt: ASGNP4(addrl16,reg)",
/* 158 */	"stmt: ASGNI1(addrl32,reg)",
/* 159 */	"stmt: ASGNI2(addrl32,reg)",
/* 160 */	"stmt: ASGNI4(addrl32,reg)",
/* 161 */	"stmt: ASGNU1(addrl32,reg)",
/* 162 */	"stmt: ASGNU2(addrl32,reg)",
/* 163 */	"stmt: ASGNU4(addrl32,reg)",
/* 164 */	"stmt: ASGNF4(addrl32,reg)",
/* 165 */	"stmt: ASGNP4(addrl32,reg)",
/* 166 */	"stmt: ASGNI1(reg,reg)",
/* 167 */	"stmt: ASGNI2(reg,reg)",
/* 168 */	"stmt: ASGNI4(reg,reg)",
/* 169 */	"stmt: ASGNU1(reg,reg)",
/* 170 */	"stmt: ASGNU2(reg,reg)",
/* 171 */	"stmt: ASGNU4(reg,reg)",
/* 172 */	"stmt: ASGNF4(reg,reg)",
/* 173 */	"stmt: ASGNP4(reg,reg)",
/* 174 */	"reg: CALLI4(addrg)",
/* 175 */	"reg: CALLU4(addrg)",
/* 176 */	"reg: CALLP4(addrg)",
/* 177 */	"reg: CALLF4(addrg)",
/* 178 */	"reg: CALLV(addrg)",
/* 179 */	"reg: CALLI4(reg)",
/* 180 */	"reg: CALLU4(reg)",
/* 181 */	"reg: CALLP4(reg)",
/* 182 */	"reg: CALLF4(reg)",
/* 183 */	"reg: CALLV(reg)",
/* 184 */	"stmt: RETI4(reg)",
/* 185 */	"stmt: RETU4(reg)",
/* 186 */	"stmt: RETP4(reg)",
/* 187 */	"stmt: RETF4(reg)",
/* 188 */	"stmt: RETI4(coni)",
/* 189 */	"stmt: RETU4(coni)",
/* 190 */	"stmt: RETP4(coni)",
/* 191 */	"stmt: RETI4(cons)",
/* 192 */	"stmt: RETU4(cons)",
/* 193 */	"stmt: RETP4(cons)",
/* 194 */	"stmt: RETI4(conli)",
/* 195 */	"stmt: RETU4(conli)",
/* 196 */	"stmt: RETP4(conli)",
/* 197 */	"stmt: RETI4(con)",
/* 198 */	"stmt: RETU4(con)",
/* 199 */	"stmt: RETP4(con)",
/* 200 */	"stmt: RETF4(con)",
/* 201 */	"reg: CVUI1(reg)",
/* 202 */	"reg: CVUI2(reg)",
/* 203 */	"reg: CVUI4(reg)",
/* 204 */	"reg: CVUU1(reg)",
/* 205 */	"reg: CVUU2(reg)",
/* 206 */	"reg: CVUU4(reg)",
/* 207 */	"reg: CVUP4(reg)",
/* 208 */	"reg: CVPU4(reg)",
/* 209 */	"reg: CVII1(reg)",
/* 210 */	"reg: CVII2(reg)",
/* 211 */	"reg: CVII4(reg)",
/* 212 */	"reg: CVIU1(reg)",
/* 213 */	"reg: CVIU2(reg)",
/* 214 */	"reg: CVIU4(reg)",
/* 215 */	"reg: CVFF4(reg)",
/* 216 */	"reg: CVFI4(reg)",
/* 217 */	"reg: CVIF4(reg)",
/* 218 */	"reg: NEGI4(reg)",
/* 219 */	"reg: NEGF4(reg)",
/* 220 */	"reg: BCOMI4(reg)",
/* 221 */	"reg: BCOMU4(reg)",
/* 222 */	"reg: ADDI4(reg,coni)",
/* 223 */	"reg: ADDU4(reg,coni)",
/* 224 */	"reg: ADDP4(reg,coni)",
/* 225 */	"reg: ADDI4(reg,reg)",
/* 226 */	"reg: ADDU4(reg,reg)",
/* 227 */	"reg: ADDP4(reg,reg)",
/* 228 */	"reg: ADDF4(reg,reg)",
/* 229 */	"reg: BANDI4(reg,reg)",
/* 230 */	"reg: BANDU4(reg,reg)",
/* 231 */	"reg: BORI4(reg,reg)",
/* 232 */	"reg: BORU4(reg,reg)",
/* 233 */	"reg: BXORI4(reg,reg)",
/* 234 */	"reg: BXORU4(reg,reg)",
/* 235 */	"reg: SUBI4(reg,coni)",
/* 236 */	"reg: SUBU4(reg,coni)",
/* 237 */	"reg: SUBP4(reg,coni)",
/* 238 */	"reg: SUBI4(reg,reg)",
/* 239 */	"reg: SUBU4(reg,reg)",
/* 240 */	"reg: SUBP4(reg,reg)",
/* 241 */	"reg: SUBF4(reg,reg)",
/* 242 */	"reg: DIVI4(reg,reg)",
/* 243 */	"reg: DIVU4(reg,reg)",
/* 244 */	"reg: DIVF4(reg,reg)",
/* 245 */	"reg: MODI4(reg,reg)",
/* 246 */	"reg: MODU4(reg,reg)",
/* 247 */	"reg: MULI4(reg,reg)",
/* 248 */	"reg: MULU4(reg,reg)",
/* 249 */	"reg: MULF4(reg,reg)",
/* 250 */	"reg: LSHI4(reg,reg)",
/* 251 */	"reg: LSHU4(reg,reg)",
/* 252 */	"reg: LSHI4(reg,coni)",
/* 253 */	"reg: LSHU4(reg,coni)",
/* 254 */	"reg: RSHI4(reg,reg)",
/* 255 */	"reg: RSHU4(reg,reg)",
/* 256 */	"reg: RSHI4(reg,coni)",
/* 257 */	"reg: RSHU4(reg,coni)",
/* 258 */	"stmt: ASGNI4(special,reg)",
/* 259 */	"stmt: ASGNU4(special,reg)",
/* 260 */	"stmt: ASGNI4(special,BANDI4(INDIRI4(special),conli))",
/* 261 */	"stmt: ASGNU4(special,BANDU4(INDIRU4(special),conli))",
/* 262 */	"stmt: ASGNI4(special,BANDI4(INDIRI4(special),reg))",
/* 263 */	"stmt: ASGNU4(special,BANDU4(INDIRU4(special),reg))",
/* 264 */	"stmt: ASGNI4(special,BORI4(INDIRI4(special),conli))",
/* 265 */	"stmt: ASGNU4(special,BORU4(INDIRU4(special),conli))",
/* 266 */	"stmt: ASGNI4(special,BORI4(INDIRI4(special),reg))",
/* 267 */	"stmt: ASGNU4(special,BORU4(INDIRU4(special),reg))",
/* 268 */	"stmt: ASGNI4(special,BXORI4(INDIRI4(special),conli))",
/* 269 */	"stmt: ASGNU4(special,BXORU4(INDIRU4(special),conli))",
/* 270 */	"stmt: ASGNI4(special,BXORI4(INDIRI4(special),reg))",
/* 271 */	"stmt: ASGNU4(special,BXORU4(INDIRU4(special),reg))",
/* 272 */	"stmt: ASGNI4(special,SUBI4(INDIRI4(special),coni))",
/* 273 */	"stmt: ASGNU4(special,SUBU4(INDIRU4(special),coni))",
/* 274 */	"stmt: ASGNI4(special,ADDI4(INDIRI4(special),conli))",
/* 275 */	"stmt: ASGNU4(special,ADDU4(INDIRU4(special),conli))",
/* 276 */	"stmt: ASGNI4(special,ADDI4(INDIRI4(special),reg))",
/* 277 */	"stmt: ASGNU4(special,ADDU4(INDIRU4(special),reg))",
/* 278 */	"stmt: ASGNI4(special,SUBI4(INDIRI4(special),coni))",
/* 279 */	"stmt: ASGNU4(special,SUBU4(INDIRU4(special),coni))",
/* 280 */	"stmt: ASGNI4(special,SUBI4(INDIRI4(special),conli))",
/* 281 */	"stmt: ASGNU4(special,SUBU4(INDIRU4(special),conli))",
/* 282 */	"stmt: ASGNI4(special,SUBI4(INDIRI4(special),reg))",
/* 283 */	"stmt: ASGNU4(special,SUBU4(INDIRU4(special),reg))",
/* 284 */	"stmt: ASGNI4(special,LSHI4(INDIRI4(special),coni))",
/* 285 */	"stmt: ASGNU4(special,LSHU4(INDIRU4(special),coni))",
/* 286 */	"stmt: ASGNI4(special,LSHI4(INDIRI4(special),conli))",
/* 287 */	"stmt: ASGNU4(special,LSHU4(INDIRU4(special),conli))",
/* 288 */	"stmt: ASGNI4(special,LSHI4(INDIRI4(special),reg))",
/* 289 */	"stmt: ASGNU4(special,LSHU4(INDIRU4(special),reg))",
/* 290 */	"stmt: ASGNI4(special,RSHI4(INDIRI4(special),coni))",
/* 291 */	"stmt: ASGNU4(special,RSHU4(INDIRU4(special),coni))",
/* 292 */	"stmt: ASGNI4(special,RSHI4(INDIRI4(special),conli))",
/* 293 */	"stmt: ASGNU4(special,RSHU4(INDIRU4(special),conli))",
/* 294 */	"stmt: ASGNI4(special,RSHI4(INDIRI4(special),reg))",
/* 295 */	"stmt: ASGNU4(special,RSHU4(INDIRU4(special),reg))",
/* 296 */	"stmt: EQI4(reg,reg)",
/* 297 */	"stmt: EQU4(reg,reg)",
/* 298 */	"stmt: EQF4(reg,reg)",
/* 299 */	"stmt: NEI4(reg,reg)",
/* 300 */	"stmt: NEU4(reg,reg)",
/* 301 */	"stmt: NEF4(reg,reg)",
/* 302 */	"stmt: GEI4(reg,reg)",
/* 303 */	"stmt: GEU4(reg,reg)",
/* 304 */	"stmt: GEF4(reg,reg)",
/* 305 */	"stmt: GTI4(reg,reg)",
/* 306 */	"stmt: GTU4(reg,reg)",
/* 307 */	"stmt: GTF4(reg,reg)",
/* 308 */	"stmt: LEI4(reg,reg)",
/* 309 */	"stmt: LEU4(reg,reg)",
/* 310 */	"stmt: LEF4(reg,reg)",
/* 311 */	"stmt: LTI4(reg,reg)",
/* 312 */	"stmt: LTU4(reg,reg)",
/* 313 */	"stmt: LTF4(reg,reg)",
/* 314 */	"stmt: EQI4(reg,coni)",
/* 315 */	"stmt: EQU4(reg,coni)",
/* 316 */	"stmt: NEI4(reg,coni)",
/* 317 */	"stmt: NEU4(reg,coni)",
/* 318 */	"stmt: GEI4(reg,coni)",
/* 319 */	"stmt: GEU4(reg,coni)",
/* 320 */	"stmt: GTI4(reg,coni)",
/* 321 */	"stmt: GTU4(reg,coni)",
/* 322 */	"stmt: LEI4(reg,coni)",
/* 323 */	"stmt: LEU4(reg,coni)",
/* 324 */	"stmt: LTI4(reg,coni)",
/* 325 */	"stmt: LTU4(reg,coni)",
/* 326 */	"stmt: EQI4(reg,conli)",
/* 327 */	"stmt: EQU4(reg,conli)",
/* 328 */	"stmt: NEI4(reg,conli)",
/* 329 */	"stmt: NEU4(reg,conli)",
/* 330 */	"stmt: GEI4(reg,conli)",
/* 331 */	"stmt: GEU4(reg,conli)",
/* 332 */	"stmt: GTI4(reg,conli)",
/* 333 */	"stmt: GTU4(reg,conli)",
/* 334 */	"stmt: LEI4(reg,conli)",
/* 335 */	"stmt: LEU4(reg,conli)",
/* 336 */	"stmt: LTI4(reg,conli)",
/* 337 */	"stmt: LTU4(reg,conli)",
/* 338 */	"stmt: ARGB(INDIRB(reg))",
/* 339 */	"stmt: ASGNB(reg,INDIRB(reg))",
/* 340 */	"stmt: JUMPV(INDIRP4(addrl16))",
/* 341 */	"stmt: JUMPV(INDIRP4(addrl32))",
/* 342 */	"stmt: JUMPV(INDIRP4(addrg))",
/* 343 */	"stmt: JUMPV(INDIRP4(reg))",
/* 344 */	"stmt: JUMPV(addrg)",
/* 345 */	"stmt: LABELV",
/* 346 */	"stmt: ARGI4(con)",
/* 347 */	"stmt: ARGU4(con)",
/* 348 */	"stmt: ARGP4(con)",
/* 349 */	"stmt: ARGF4(con)",
/* 350 */	"stmt: ARGI4(coni)",
/* 351 */	"stmt: ARGU4(coni)",
/* 352 */	"stmt: ARGP4(coni)",
/* 353 */	"stmt: ARGF4(coni)",
/* 354 */	"stmt: ARGI4(reg)",
/* 355 */	"stmt: ARGU4(reg)",
/* 356 */	"stmt: ARGP4(reg)",
/* 357 */	"stmt: ARGF4(reg)",
/* 358 */	"stmt: ARGI4(ADDRGP4)",
/* 359 */	"stmt: ARGU4(ADDRGP4)",
/* 360 */	"stmt: ARGP4(ADDRGP4)",
/* 361 */	"stmt: ARGF4(ADDRGP4)",
/* 362 */	"stmt: ARGI4(ADDRLP4)",
/* 363 */	"stmt: ARGU4(ADDRLP4)",
/* 364 */	"stmt: ARGP4(ADDRLP4)",
/* 365 */	"stmt: ARGF4(ADDRLP4)",
/* 366 */	"stmt: ARGI4(ADDRFP4)",
/* 367 */	"stmt: ARGU4(ADDRFP4)",
/* 368 */	"stmt: ARGP4(ADDRFP4)",
/* 369 */	"stmt: ARGF4(ADDRFP4)",
/* 370 */	"stmt: ARGI4(INDIRI4(ADDRGP4))",
/* 371 */	"stmt: ARGU4(INDIRU4(ADDRGP4))",
/* 372 */	"stmt: ARGP4(INDIRP4(ADDRGP4))",
/* 373 */	"stmt: ARGF4(INDIRF4(ADDRGP4))",
/* 374 */	"stmt: ARGI4(INDIRI4(ADDRLP4))",
/* 375 */	"stmt: ARGU4(INDIRU4(ADDRLP4))",
/* 376 */	"stmt: ARGP4(INDIRP4(ADDRLP4))",
/* 377 */	"stmt: ARGF4(INDIRF4(ADDRLP4))",
/* 378 */	"stmt: ARGI4(INDIRI4(ADDRFP4))",
/* 379 */	"stmt: ARGU4(INDIRU4(ADDRFP4))",
/* 380 */	"stmt: ARGP4(INDIRP4(ADDRFP4))",
/* 381 */	"stmt: ARGF4(INDIRF4(ADDRFP4))",
};

static short _decode_stmt[] = {
	0,
	18,
	19,
	20,
	21,
	22,
	23,
	24,
	25,
	26,
	126,
	127,
	128,
	129,
	130,
	131,
	132,
	133,
	134,
	135,
	136,
	137,
	138,
	139,
	140,
	141,
	142,
	143,
	144,
	145,
	146,
	147,
	148,
	149,
	150,
	151,
	152,
	153,
	154,
	155,
	156,
	157,
	158,
	159,
	160,
	161,
	162,
	163,
	164,
	165,
	166,
	167,
	168,
	169,
	170,
	171,
	172,
	173,
	184,
	185,
	186,
	187,
	188,
	189,
	190,
	191,
	192,
	193,
	194,
	195,
	196,
	197,
	198,
	199,
	200,
	258,
	259,
	260,
	261,
	262,
	263,
	264,
	265,
	266,
	267,
	268,
	269,
	270,
	271,
	272,
	273,
	274,
	275,
	276,
	277,
	278,
	279,
	280,
	281,
	282,
	283,
	284,
	285,
	286,
	287,
	288,
	289,
	290,
	291,
	292,
	293,
	294,
	295,
	296,
	297,
	298,
	299,
	300,
	301,
	302,
	303,
	304,
	305,
	306,
	307,
	308,
	309,
	310,
	311,
	312,
	313,
	314,
	315,
	316,
	317,
	318,
	319,
	320,
	321,
	322,
	323,
	324,
	325,
	326,
	327,
	328,
	329,
	330,
	331,
	332,
	333,
	334,
	335,
	336,
	337,
	338,
	339,
	340,
	341,
	342,
	343,
	344,
	345,
	346,
	347,
	348,
	349,
	350,
	351,
	352,
	353,
	354,
	355,
	356,
	357,
	358,
	359,
	360,
	361,
	362,
	363,
	364,
	365,
	366,
	367,
	368,
	369,
	370,
	371,
	372,
	373,
	374,
	375,
	376,
	377,
	378,
	379,
	380,
	381,
};

static short _decode_reg[] = {
	0,
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	10,
	11,
	12,
	13,
	14,
	15,
	16,
	17,
	65,
	66,
	67,
	68,
	69,
	70,
	71,
	72,
	73,
	74,
	75,
	76,
	77,
	78,
	79,
	80,
	81,
	82,
	83,
	84,
	85,
	86,
	87,
	88,
	89,
	90,
	91,
	92,
	93,
	94,
	95,
	96,
	97,
	98,
	99,
	100,
	101,
	102,
	103,
	104,
	105,
	106,
	107,
	108,
	109,
	110,
	111,
	112,
	113,
	114,
	115,
	116,
	117,
	118,
	119,
	120,
	121,
	122,
	123,
	124,
	125,
	174,
	175,
	176,
	177,
	178,
	179,
	180,
	181,
	182,
	183,
	201,
	202,
	203,
	204,
	205,
	206,
	207,
	208,
	209,
	210,
	211,
	212,
	213,
	214,
	215,
	216,
	217,
	218,
	219,
	220,
	221,
	222,
	223,
	224,
	225,
	226,
	227,
	228,
	229,
	230,
	231,
	232,
	233,
	234,
	235,
	236,
	237,
	238,
	239,
	240,
	241,
	242,
	243,
	244,
	245,
	246,
	247,
	248,
	249,
	250,
	251,
	252,
	253,
	254,
	255,
	256,
	257,
};

static short _decode_coni[] = {
	0,
	27,
	28,
	29,
	30,
	31,
	32,
};

static short _decode_conn[] = {
	0,
	33,
	34,
	35,
	36,
	37,
	38,
};

static short _decode_conli[] = {
	0,
	39,
	40,
	41,
	42,
	43,
	44,
};

static short _decode_cons[] = {
	0,
	45,
	46,
	47,
	48,
	49,
	50,
};

static short _decode_con[] = {
	0,
	51,
	52,
	53,
	54,
	55,
	56,
	57,
	58,
};

static short _decode_addrg[] = {
	0,
	59,
};

static short _decode_special[] = {
	0,
	60,
};

static short _decode_addrl16[] = {
	0,
	61,
	62,
};

static short _decode_addrl32[] = {
	0,
	63,
	64,
};

static int _rule(void *state, int goalnt) {
	if (goalnt < 1 || goalnt > 11)
		fatal("_rule", "Bad goal nonterminal %d\n", goalnt);
	if (!state)
		return 0;
	switch (goalnt) {
	case _stmt_NT:	return _decode_stmt[((struct _state *)state)->rule._stmt];
	case _reg_NT:	return _decode_reg[((struct _state *)state)->rule._reg];
	case _coni_NT:	return _decode_coni[((struct _state *)state)->rule._coni];
	case _conn_NT:	return _decode_conn[((struct _state *)state)->rule._conn];
	case _conli_NT:	return _decode_conli[((struct _state *)state)->rule._conli];
	case _cons_NT:	return _decode_cons[((struct _state *)state)->rule._cons];
	case _con_NT:	return _decode_con[((struct _state *)state)->rule._con];
	case _addrg_NT:	return _decode_addrg[((struct _state *)state)->rule._addrg];
	case _special_NT:	return _decode_special[((struct _state *)state)->rule._special];
	case _addrl16_NT:	return _decode_addrl16[((struct _state *)state)->rule._addrl16];
	case _addrl32_NT:	return _decode_addrl32[((struct _state *)state)->rule._addrl32];
	default:
		fatal("_rule", "Bad goal nonterminal %d\n", goalnt);
		return 0;
	}
}

static void _closure_reg(NODEPTR_TYPE, int);
static void _closure_coni(NODEPTR_TYPE, int);
static void _closure_conn(NODEPTR_TYPE, int);
static void _closure_conli(NODEPTR_TYPE, int);
static void _closure_cons(NODEPTR_TYPE, int);
static void _closure_con(NODEPTR_TYPE, int);
static void _closure_addrg(NODEPTR_TYPE, int);
static void _closure_special(NODEPTR_TYPE, int);
static void _closure_addrl16(NODEPTR_TYPE, int);
static void _closure_addrl32(NODEPTR_TYPE, int);

static void _closure_reg(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 0 < p->cost[_stmt_NT]) {
		p->cost[_stmt_NT] = c + 0;
		p->rule._stmt = 1;
	}
}

static void _closure_coni(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 3 < p->cost[_reg_NT]) {
		p->cost[_reg_NT] = c + 3;
		p->rule._reg = 22;
		_closure_reg(a, c + 3);
	}
}

static void _closure_conn(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 3 < p->cost[_reg_NT]) {
		p->cost[_reg_NT] = c + 3;
		p->rule._reg = 23;
		_closure_reg(a, c + 3);
	}
}

static void _closure_conli(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 7 < p->cost[_reg_NT]) {
		p->cost[_reg_NT] = c + 7;
		p->rule._reg = 25;
		_closure_reg(a, c + 7);
	}
}

static void _closure_cons(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 4 < p->cost[_reg_NT]) {
		p->cost[_reg_NT] = c + 4;
		p->rule._reg = 24;
		_closure_reg(a, c + 4);
	}
}

static void _closure_con(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 17 < p->cost[_reg_NT]) {
		p->cost[_reg_NT] = c + 17;
		p->rule._reg = 26;
		_closure_reg(a, c + 17);
	}
}

static void _closure_addrg(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 7 < p->cost[_reg_NT]) {
		p->cost[_reg_NT] = c + 7;
		p->rule._reg = 20;
		_closure_reg(a, c + 7);
	}
}

static void _closure_special(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 99 < p->cost[_reg_NT]) {
		p->cost[_reg_NT] = c + 99;
		p->rule._reg = 21;
		_closure_reg(a, c + 99);
	}
}

static void _closure_addrl16(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 7 < p->cost[_reg_NT]) {
		p->cost[_reg_NT] = c + 7;
		p->rule._reg = 18;
		_closure_reg(a, c + 7);
	}
}

static void _closure_addrl32(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 7 < p->cost[_reg_NT]) {
		p->cost[_reg_NT] = c + 7;
		p->rule._reg = 19;
		_closure_reg(a, c + 7);
	}
}

static void _label(NODEPTR_TYPE a) {
	int c;
	struct _state *p;

	if (!a)
		fatal("_label", "Null tree\n", 0);
	STATE_LABEL(a) = p = allocate(sizeof *p, FUNC);
	p->rule._stmt = 0;
	p->cost[1] =
	p->cost[2] =
	p->cost[3] =
	p->cost[4] =
	p->cost[5] =
	p->cost[6] =
	p->cost[7] =
	p->cost[8] =
	p->cost[9] =
	p->cost[10] =
	p->cost[11] =
		0x7fff;
	switch (OP_LABEL(a)) {
	case 41: /* ARGB */
		_label(LEFT_CHILD(a));
		if (	/* stmt: ARGB(INDIRB(reg)) */
			LEFT_CHILD(a)->op == 73 /* INDIRB */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_reg_NT] + 0;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 155;
			}
		}
		break;
	case 57: /* ASGNB */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		if (	/* stmt: ASGNB(reg,INDIRB(reg)) */
			RIGHT_CHILD(a)->op == 73 /* INDIRB */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(LEFT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + 0;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 156;
			}
		}
		break;
	case 73: /* INDIRB */
		_label(LEFT_CHILD(a));
		break;
	case 216: /* CALLV */
		_label(LEFT_CHILD(a));
		/* reg: CALLV(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 83;
			_closure_reg(a, c + 0);
		}
		/* reg: CALLV(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 88;
			_closure_reg(a, c + 0);
		}
		break;
	case 217: /* CALLB */
		break;
	case 233: /* LOADB */
		_label(LEFT_CHILD(a));
		/* reg: LOADB(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 9;
			_closure_reg(a, c + 0);
		}
		break;
	case 248: /* RETV */
		break;
	case 584: /* JUMPV */
		_label(LEFT_CHILD(a));
		if (	/* stmt: JUMPV(INDIRP4(addrl16)) */
			LEFT_CHILD(a)->op == 4167 /* INDIRP4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_addrl16_NT] + 6;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 157;
			}
		}
		if (	/* stmt: JUMPV(INDIRP4(addrl32)) */
			LEFT_CHILD(a)->op == 4167 /* INDIRP4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_addrl32_NT] + 6;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 158;
			}
		}
		if (	/* stmt: JUMPV(INDIRP4(addrg)) */
			LEFT_CHILD(a)->op == 4167 /* INDIRP4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_addrg_NT] + 6;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 159;
			}
		}
		if (	/* stmt: JUMPV(INDIRP4(reg)) */
			LEFT_CHILD(a)->op == 4167 /* INDIRP4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_reg_NT] + 6;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 160;
			}
		}
		/* stmt: JUMPV(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 6;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 161;
		}
		break;
	case 600: /* LABELV */
		/* stmt: LABELV */
		if (0 + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = 0 + 0;
			p->rule._stmt = 162;
		}
		break;
	case 711: /* VREGP */
		break;
	case 1045: /* CNSTI1 */
		/* coni: CNSTI1 */
		c = (range(a, 0, 31));
		if (c + 0 < p->cost[_coni_NT]) {
			p->cost[_coni_NT] = c + 0;
			p->rule._coni = 1;
			_closure_coni(a, c + 0);
		}
		/* conn: CNSTI1 */
		c = (range(a, -31, -1));
		if (c + 0 < p->cost[_conn_NT]) {
			p->cost[_conn_NT] = c + 0;
			p->rule._conn = 1;
			_closure_conn(a, c + 0);
		}
		/* conli: CNSTI1 */
		c = (range(a, 0, 511));
		if (c + 0 < p->cost[_conli_NT]) {
			p->cost[_conli_NT] = c + 0;
			p->rule._conli = 1;
			_closure_conli(a, c + 0);
		}
		/* cons: CNSTI1 */
		c = (range(a, -262144, 262143));
		if (c + 0 < p->cost[_cons_NT]) {
			p->cost[_cons_NT] = c + 0;
			p->rule._cons = 1;
			_closure_cons(a, c + 0);
		}
		/* con: CNSTI1 */
		if (0 + 0 < p->cost[_con_NT]) {
			p->cost[_con_NT] = 0 + 0;
			p->rule._con = 1;
			_closure_con(a, 0 + 0);
		}
		break;
	case 1046: /* CNSTU1 */
		/* coni: CNSTU1 */
		c = (range(a, 0, 31));
		if (c + 0 < p->cost[_coni_NT]) {
			p->cost[_coni_NT] = c + 0;
			p->rule._coni = 4;
			_closure_coni(a, c + 0);
		}
		/* conn: CNSTU1 */
		c = (range(a, -31, -1));
		if (c + 0 < p->cost[_conn_NT]) {
			p->cost[_conn_NT] = c + 0;
			p->rule._conn = 4;
			_closure_conn(a, c + 0);
		}
		/* conli: CNSTU1 */
		c = (range(a, 0, 511));
		if (c + 0 < p->cost[_conli_NT]) {
			p->cost[_conli_NT] = c + 0;
			p->rule._conli = 4;
			_closure_conli(a, c + 0);
		}
		/* cons: CNSTU1 */
		c = (range(a, -262144, 262143));
		if (c + 0 < p->cost[_cons_NT]) {
			p->cost[_cons_NT] = c + 0;
			p->rule._cons = 4;
			_closure_cons(a, c + 0);
		}
		/* con: CNSTU1 */
		if (0 + 0 < p->cost[_con_NT]) {
			p->cost[_con_NT] = 0 + 0;
			p->rule._con = 4;
			_closure_con(a, 0 + 0);
		}
		break;
	case 1077: /* ASGNI1 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		if (	/* stmt: ASGNI1(VREGP,reg) */
			LEFT_CHILD(a)->op == 711 /* VREGP */
		) {
			c = ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 2;
			}
		}
		/* stmt: ASGNI1(addrg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 10;
		}
		/* stmt: ASGNI1(special,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 18;
		}
		/* stmt: ASGNI1(special,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 26;
		}
		/* stmt: ASGNI1(addrl16,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl16_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 34;
		}
		/* stmt: ASGNI1(addrl32,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl32_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 42;
		}
		/* stmt: ASGNI1(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 99;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 50;
		}
		break;
	case 1078: /* ASGNU1 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		if (	/* stmt: ASGNU1(VREGP,reg) */
			LEFT_CHILD(a)->op == 711 /* VREGP */
		) {
			c = ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 5;
			}
		}
		/* stmt: ASGNU1(addrg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 13;
		}
		/* stmt: ASGNU1(special,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 21;
		}
		/* stmt: ASGNU1(special,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 29;
		}
		/* stmt: ASGNU1(addrl16,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl16_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 37;
		}
		/* stmt: ASGNU1(addrl32,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl32_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 45;
		}
		/* stmt: ASGNU1(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 99;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 53;
		}
		break;
	case 1093: /* INDIRI1 */
		_label(LEFT_CHILD(a));
		if (	/* reg: INDIRI1(VREGP) */
			LEFT_CHILD(a)->op == 711 /* VREGP */
		) {
			if (mayrecalc(a)) {
				struct _state *q = a->syms[RX]->u.t.cse->x.state;
				if (q->cost[_stmt_NT] == 0) {
					p->cost[_stmt_NT] = 0;
					p->rule._stmt = q->rule._stmt;
				}
				if (q->cost[_reg_NT] == 0) {
					p->cost[_reg_NT] = 0;
					p->rule._reg = q->rule._reg;
				}
				if (q->cost[_coni_NT] == 0) {
					p->cost[_coni_NT] = 0;
					p->rule._coni = q->rule._coni;
				}
				if (q->cost[_conn_NT] == 0) {
					p->cost[_conn_NT] = 0;
					p->rule._conn = q->rule._conn;
				}
				if (q->cost[_conli_NT] == 0) {
					p->cost[_conli_NT] = 0;
					p->rule._conli = q->rule._conli;
				}
				if (q->cost[_cons_NT] == 0) {
					p->cost[_cons_NT] = 0;
					p->rule._cons = q->rule._cons;
				}
				if (q->cost[_con_NT] == 0) {
					p->cost[_con_NT] = 0;
					p->rule._con = q->rule._con;
				}
				if (q->cost[_addrg_NT] == 0) {
					p->cost[_addrg_NT] = 0;
					p->rule._addrg = q->rule._addrg;
				}
				if (q->cost[_special_NT] == 0) {
					p->cost[_special_NT] = 0;
					p->rule._special = q->rule._special;
				}
				if (q->cost[_addrl16_NT] == 0) {
					p->cost[_addrl16_NT] = 0;
					p->rule._addrl16 = q->rule._addrl16;
				}
				if (q->cost[_addrl32_NT] == 0) {
					p->cost[_addrl32_NT] = 0;
					p->rule._addrl32 = q->rule._addrl32;
				}
			}
			c = 0;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 1;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: INDIRI1(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 27;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI1(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 35;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI1(special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 43;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI1(addrl16) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl16_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 51;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI1(addrl32) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl32_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 59;
			_closure_reg(a, c + 0);
		}
		break;
	case 1094: /* INDIRU1 */
		_label(LEFT_CHILD(a));
		if (	/* reg: INDIRU1(VREGP) */
			LEFT_CHILD(a)->op == 711 /* VREGP */
		) {
			if (mayrecalc(a)) {
				struct _state *q = a->syms[RX]->u.t.cse->x.state;
				if (q->cost[_stmt_NT] == 0) {
					p->cost[_stmt_NT] = 0;
					p->rule._stmt = q->rule._stmt;
				}
				if (q->cost[_reg_NT] == 0) {
					p->cost[_reg_NT] = 0;
					p->rule._reg = q->rule._reg;
				}
				if (q->cost[_coni_NT] == 0) {
					p->cost[_coni_NT] = 0;
					p->rule._coni = q->rule._coni;
				}
				if (q->cost[_conn_NT] == 0) {
					p->cost[_conn_NT] = 0;
					p->rule._conn = q->rule._conn;
				}
				if (q->cost[_conli_NT] == 0) {
					p->cost[_conli_NT] = 0;
					p->rule._conli = q->rule._conli;
				}
				if (q->cost[_cons_NT] == 0) {
					p->cost[_cons_NT] = 0;
					p->rule._cons = q->rule._cons;
				}
				if (q->cost[_con_NT] == 0) {
					p->cost[_con_NT] = 0;
					p->rule._con = q->rule._con;
				}
				if (q->cost[_addrg_NT] == 0) {
					p->cost[_addrg_NT] = 0;
					p->rule._addrg = q->rule._addrg;
				}
				if (q->cost[_special_NT] == 0) {
					p->cost[_special_NT] = 0;
					p->rule._special = q->rule._special;
				}
				if (q->cost[_addrl16_NT] == 0) {
					p->cost[_addrl16_NT] = 0;
					p->rule._addrl16 = q->rule._addrl16;
				}
				if (q->cost[_addrl32_NT] == 0) {
					p->cost[_addrl32_NT] = 0;
					p->rule._addrl32 = q->rule._addrl32;
				}
			}
			c = 0;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 2;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: INDIRU1(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 30;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU1(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 38;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU1(special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 46;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU1(addrl16) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl16_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 54;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU1(addrl32) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl32_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 62;
			_closure_reg(a, c + 0);
		}
		break;
	case 1157: /* CVII1 */
		_label(LEFT_CHILD(a));
		/* reg: CVII1(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 97;
			_closure_reg(a, c + 0);
		}
		break;
	case 1158: /* CVIU1 */
		_label(LEFT_CHILD(a));
		/* reg: CVIU1(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 100;
			_closure_reg(a, c + 0);
		}
		break;
	case 1205: /* CVUI1 */
		_label(LEFT_CHILD(a));
		if (	/* reg: CVUI1(INDIRU1(reg)) */
			LEFT_CHILD(a)->op == 1094 /* INDIRU1 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_reg_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 73;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: CVUI1(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 89;
			_closure_reg(a, c + 0);
		}
		break;
	case 1206: /* CVUU1 */
		_label(LEFT_CHILD(a));
		if (	/* reg: CVUU1(INDIRU1(reg)) */
			LEFT_CHILD(a)->op == 1094 /* INDIRU1 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_reg_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 67;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: CVUU1(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 92;
			_closure_reg(a, c + 0);
		}
		break;
	case 1253: /* LOADI1 */
		_label(LEFT_CHILD(a));
		/* reg: LOADI1(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + (move(a));
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 10;
			_closure_reg(a, c + 0);
		}
		break;
	case 1254: /* LOADU1 */
		_label(LEFT_CHILD(a));
		/* reg: LOADU1(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + (move(a));
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 13;
			_closure_reg(a, c + 0);
		}
		break;
	case 2069: /* CNSTI2 */
		/* coni: CNSTI2 */
		c = (range(a, 0, 31));
		if (c + 0 < p->cost[_coni_NT]) {
			p->cost[_coni_NT] = c + 0;
			p->rule._coni = 2;
			_closure_coni(a, c + 0);
		}
		/* conn: CNSTI2 */
		c = (range(a, -31, -1));
		if (c + 0 < p->cost[_conn_NT]) {
			p->cost[_conn_NT] = c + 0;
			p->rule._conn = 2;
			_closure_conn(a, c + 0);
		}
		/* conli: CNSTI2 */
		c = (range(a, 0, 511));
		if (c + 0 < p->cost[_conli_NT]) {
			p->cost[_conli_NT] = c + 0;
			p->rule._conli = 2;
			_closure_conli(a, c + 0);
		}
		/* cons: CNSTI2 */
		c = (range(a, -262144, 262143));
		if (c + 0 < p->cost[_cons_NT]) {
			p->cost[_cons_NT] = c + 0;
			p->rule._cons = 2;
			_closure_cons(a, c + 0);
		}
		/* con: CNSTI2 */
		if (0 + 0 < p->cost[_con_NT]) {
			p->cost[_con_NT] = 0 + 0;
			p->rule._con = 2;
			_closure_con(a, 0 + 0);
		}
		break;
	case 2070: /* CNSTU2 */
		/* coni: CNSTU2 */
		c = (range(a, 0, 31));
		if (c + 0 < p->cost[_coni_NT]) {
			p->cost[_coni_NT] = c + 0;
			p->rule._coni = 5;
			_closure_coni(a, c + 0);
		}
		/* conn: CNSTU2 */
		c = (range(a, -31, -1));
		if (c + 0 < p->cost[_conn_NT]) {
			p->cost[_conn_NT] = c + 0;
			p->rule._conn = 5;
			_closure_conn(a, c + 0);
		}
		/* conli: CNSTU2 */
		c = (range(a, 0, 511));
		if (c + 0 < p->cost[_conli_NT]) {
			p->cost[_conli_NT] = c + 0;
			p->rule._conli = 5;
			_closure_conli(a, c + 0);
		}
		/* cons: CNSTU2 */
		c = (range(a, -262144, 262143));
		if (c + 0 < p->cost[_cons_NT]) {
			p->cost[_cons_NT] = c + 0;
			p->rule._cons = 5;
			_closure_cons(a, c + 0);
		}
		/* con: CNSTU2 */
		if (0 + 0 < p->cost[_con_NT]) {
			p->cost[_con_NT] = 0 + 0;
			p->rule._con = 5;
			_closure_con(a, 0 + 0);
		}
		break;
	case 2101: /* ASGNI2 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		if (	/* stmt: ASGNI2(VREGP,reg) */
			LEFT_CHILD(a)->op == 711 /* VREGP */
		) {
			c = ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 3;
			}
		}
		/* stmt: ASGNI2(addrg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 11;
		}
		/* stmt: ASGNI2(special,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 19;
		}
		/* stmt: ASGNI2(special,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 27;
		}
		/* stmt: ASGNI2(addrl16,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl16_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 35;
		}
		/* stmt: ASGNI2(addrl32,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl32_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 43;
		}
		/* stmt: ASGNI2(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 99;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 51;
		}
		break;
	case 2102: /* ASGNU2 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		if (	/* stmt: ASGNU2(VREGP,reg) */
			LEFT_CHILD(a)->op == 711 /* VREGP */
		) {
			c = ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 6;
			}
		}
		/* stmt: ASGNU2(addrg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 14;
		}
		/* stmt: ASGNU2(special,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 22;
		}
		/* stmt: ASGNU2(special,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 30;
		}
		/* stmt: ASGNU2(addrl16,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl16_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 38;
		}
		/* stmt: ASGNU2(addrl32,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl32_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 46;
		}
		/* stmt: ASGNU2(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 99;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 54;
		}
		break;
	case 2117: /* INDIRI2 */
		_label(LEFT_CHILD(a));
		if (	/* reg: INDIRI2(VREGP) */
			LEFT_CHILD(a)->op == 711 /* VREGP */
		) {
			if (mayrecalc(a)) {
				struct _state *q = a->syms[RX]->u.t.cse->x.state;
				if (q->cost[_stmt_NT] == 0) {
					p->cost[_stmt_NT] = 0;
					p->rule._stmt = q->rule._stmt;
				}
				if (q->cost[_reg_NT] == 0) {
					p->cost[_reg_NT] = 0;
					p->rule._reg = q->rule._reg;
				}
				if (q->cost[_coni_NT] == 0) {
					p->cost[_coni_NT] = 0;
					p->rule._coni = q->rule._coni;
				}
				if (q->cost[_conn_NT] == 0) {
					p->cost[_conn_NT] = 0;
					p->rule._conn = q->rule._conn;
				}
				if (q->cost[_conli_NT] == 0) {
					p->cost[_conli_NT] = 0;
					p->rule._conli = q->rule._conli;
				}
				if (q->cost[_cons_NT] == 0) {
					p->cost[_cons_NT] = 0;
					p->rule._cons = q->rule._cons;
				}
				if (q->cost[_con_NT] == 0) {
					p->cost[_con_NT] = 0;
					p->rule._con = q->rule._con;
				}
				if (q->cost[_addrg_NT] == 0) {
					p->cost[_addrg_NT] = 0;
					p->rule._addrg = q->rule._addrg;
				}
				if (q->cost[_special_NT] == 0) {
					p->cost[_special_NT] = 0;
					p->rule._special = q->rule._special;
				}
				if (q->cost[_addrl16_NT] == 0) {
					p->cost[_addrl16_NT] = 0;
					p->rule._addrl16 = q->rule._addrl16;
				}
				if (q->cost[_addrl32_NT] == 0) {
					p->cost[_addrl32_NT] = 0;
					p->rule._addrl32 = q->rule._addrl32;
				}
			}
			c = 0;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 3;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: INDIRI2(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 28;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI2(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 36;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI2(special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 44;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI2(addrl16) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl16_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 52;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI2(addrl32) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl32_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 60;
			_closure_reg(a, c + 0);
		}
		break;
	case 2118: /* INDIRU2 */
		_label(LEFT_CHILD(a));
		if (	/* reg: INDIRU2(VREGP) */
			LEFT_CHILD(a)->op == 711 /* VREGP */
		) {
			if (mayrecalc(a)) {
				struct _state *q = a->syms[RX]->u.t.cse->x.state;
				if (q->cost[_stmt_NT] == 0) {
					p->cost[_stmt_NT] = 0;
					p->rule._stmt = q->rule._stmt;
				}
				if (q->cost[_reg_NT] == 0) {
					p->cost[_reg_NT] = 0;
					p->rule._reg = q->rule._reg;
				}
				if (q->cost[_coni_NT] == 0) {
					p->cost[_coni_NT] = 0;
					p->rule._coni = q->rule._coni;
				}
				if (q->cost[_conn_NT] == 0) {
					p->cost[_conn_NT] = 0;
					p->rule._conn = q->rule._conn;
				}
				if (q->cost[_conli_NT] == 0) {
					p->cost[_conli_NT] = 0;
					p->rule._conli = q->rule._conli;
				}
				if (q->cost[_cons_NT] == 0) {
					p->cost[_cons_NT] = 0;
					p->rule._cons = q->rule._cons;
				}
				if (q->cost[_con_NT] == 0) {
					p->cost[_con_NT] = 0;
					p->rule._con = q->rule._con;
				}
				if (q->cost[_addrg_NT] == 0) {
					p->cost[_addrg_NT] = 0;
					p->rule._addrg = q->rule._addrg;
				}
				if (q->cost[_special_NT] == 0) {
					p->cost[_special_NT] = 0;
					p->rule._special = q->rule._special;
				}
				if (q->cost[_addrl16_NT] == 0) {
					p->cost[_addrl16_NT] = 0;
					p->rule._addrl16 = q->rule._addrl16;
				}
				if (q->cost[_addrl32_NT] == 0) {
					p->cost[_addrl32_NT] = 0;
					p->rule._addrl32 = q->rule._addrl32;
				}
			}
			c = 0;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 4;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: INDIRU2(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 31;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU2(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 39;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU2(special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 47;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU2(addrl16) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl16_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 55;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU2(addrl32) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl32_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 63;
			_closure_reg(a, c + 0);
		}
		break;
	case 2181: /* CVII2 */
		_label(LEFT_CHILD(a));
		/* reg: CVII2(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 98;
			_closure_reg(a, c + 0);
		}
		break;
	case 2182: /* CVIU2 */
		_label(LEFT_CHILD(a));
		/* reg: CVIU2(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 101;
			_closure_reg(a, c + 0);
		}
		break;
	case 2229: /* CVUI2 */
		_label(LEFT_CHILD(a));
		if (	/* reg: CVUI2(INDIRU1(reg)) */
			LEFT_CHILD(a)->op == 1094 /* INDIRU1 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_reg_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 74;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUI2(INDIRU2(reg)) */
			LEFT_CHILD(a)->op == 2118 /* INDIRU2 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_reg_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 75;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: CVUI2(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 90;
			_closure_reg(a, c + 0);
		}
		break;
	case 2230: /* CVUU2 */
		_label(LEFT_CHILD(a));
		if (	/* reg: CVUU2(INDIRU1(reg)) */
			LEFT_CHILD(a)->op == 1094 /* INDIRU1 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_reg_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 68;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUU2(INDIRU2(reg)) */
			LEFT_CHILD(a)->op == 2118 /* INDIRU2 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_reg_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 69;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: CVUU2(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 93;
			_closure_reg(a, c + 0);
		}
		break;
	case 2277: /* LOADI2 */
		_label(LEFT_CHILD(a));
		/* reg: LOADI2(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + (move(a));
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 11;
			_closure_reg(a, c + 0);
		}
		break;
	case 2278: /* LOADU2 */
		_label(LEFT_CHILD(a));
		/* reg: LOADU2(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + (move(a));
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 14;
			_closure_reg(a, c + 0);
		}
		break;
	case 4113: /* CNSTF4 */
		/* con: CNSTF4 */
		if (0 + 0 < p->cost[_con_NT]) {
			p->cost[_con_NT] = 0 + 0;
			p->rule._con = 8;
			_closure_con(a, 0 + 0);
		}
		break;
	case 4117: /* CNSTI4 */
		/* coni: CNSTI4 */
		c = (range(a, 0, 31));
		if (c + 0 < p->cost[_coni_NT]) {
			p->cost[_coni_NT] = c + 0;
			p->rule._coni = 3;
			_closure_coni(a, c + 0);
		}
		/* conn: CNSTI4 */
		c = (range(a, -31, -1));
		if (c + 0 < p->cost[_conn_NT]) {
			p->cost[_conn_NT] = c + 0;
			p->rule._conn = 3;
			_closure_conn(a, c + 0);
		}
		/* conli: CNSTI4 */
		c = (range(a, 0, 511));
		if (c + 0 < p->cost[_conli_NT]) {
			p->cost[_conli_NT] = c + 0;
			p->rule._conli = 3;
			_closure_conli(a, c + 0);
		}
		/* cons: CNSTI4 */
		c = (range(a, -262144, 262143));
		if (c + 0 < p->cost[_cons_NT]) {
			p->cost[_cons_NT] = c + 0;
			p->rule._cons = 3;
			_closure_cons(a, c + 0);
		}
		/* con: CNSTI4 */
		if (0 + 0 < p->cost[_con_NT]) {
			p->cost[_con_NT] = 0 + 0;
			p->rule._con = 3;
			_closure_con(a, 0 + 0);
		}
		break;
	case 4118: /* CNSTU4 */
		/* coni: CNSTU4 */
		c = (range(a, 0, 31));
		if (c + 0 < p->cost[_coni_NT]) {
			p->cost[_coni_NT] = c + 0;
			p->rule._coni = 6;
			_closure_coni(a, c + 0);
		}
		/* conn: CNSTU4 */
		c = (range(a, -31, -1));
		if (c + 0 < p->cost[_conn_NT]) {
			p->cost[_conn_NT] = c + 0;
			p->rule._conn = 6;
			_closure_conn(a, c + 0);
		}
		/* conli: CNSTU4 */
		c = (range(a, 0, 511));
		if (c + 0 < p->cost[_conli_NT]) {
			p->cost[_conli_NT] = c + 0;
			p->rule._conli = 6;
			_closure_conli(a, c + 0);
		}
		/* cons: CNSTU4 */
		c = (range(a, -262144, 262143));
		if (c + 0 < p->cost[_cons_NT]) {
			p->cost[_cons_NT] = c + 0;
			p->rule._cons = 6;
			_closure_cons(a, c + 0);
		}
		/* con: CNSTU4 */
		if (0 + 0 < p->cost[_con_NT]) {
			p->cost[_con_NT] = 0 + 0;
			p->rule._con = 6;
			_closure_con(a, 0 + 0);
		}
		break;
	case 4119: /* CNSTP4 */
		/* con: CNSTP4 */
		if (0 + 0 < p->cost[_con_NT]) {
			p->cost[_con_NT] = 0 + 0;
			p->rule._con = 7;
			_closure_con(a, 0 + 0);
		}
		break;
	case 4129: /* ARGF4 */
		_label(LEFT_CHILD(a));
		/* stmt: ARGF4(con) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_con_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 166;
		}
		/* stmt: ARGF4(coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 170;
		}
		/* stmt: ARGF4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 174;
		}
		if (	/* stmt: ARGF4(ADDRGP4) */
			LEFT_CHILD(a)->op == 4359 /* ADDRGP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 178;
			}
		}
		if (	/* stmt: ARGF4(ADDRLP4) */
			LEFT_CHILD(a)->op == 4391 /* ADDRLP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 182;
			}
		}
		if (	/* stmt: ARGF4(ADDRFP4) */
			LEFT_CHILD(a)->op == 4375 /* ADDRFP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 186;
			}
		}
		if (	/* stmt: ARGF4(INDIRF4(ADDRGP4)) */
			LEFT_CHILD(a)->op == 4161 && /* INDIRF4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4359 /* ADDRGP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 190;
			}
		}
		if (	/* stmt: ARGF4(INDIRF4(ADDRLP4)) */
			LEFT_CHILD(a)->op == 4161 && /* INDIRF4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4391 /* ADDRLP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 194;
			}
		}
		if (	/* stmt: ARGF4(INDIRF4(ADDRFP4)) */
			LEFT_CHILD(a)->op == 4161 && /* INDIRF4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4375 /* ADDRFP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 198;
			}
		}
		break;
	case 4133: /* ARGI4 */
		_label(LEFT_CHILD(a));
		/* stmt: ARGI4(con) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_con_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 163;
		}
		/* stmt: ARGI4(coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 167;
		}
		/* stmt: ARGI4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 171;
		}
		if (	/* stmt: ARGI4(ADDRGP4) */
			LEFT_CHILD(a)->op == 4359 /* ADDRGP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 175;
			}
		}
		if (	/* stmt: ARGI4(ADDRLP4) */
			LEFT_CHILD(a)->op == 4391 /* ADDRLP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 179;
			}
		}
		if (	/* stmt: ARGI4(ADDRFP4) */
			LEFT_CHILD(a)->op == 4375 /* ADDRFP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 183;
			}
		}
		if (	/* stmt: ARGI4(INDIRI4(ADDRGP4)) */
			LEFT_CHILD(a)->op == 4165 && /* INDIRI4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4359 /* ADDRGP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 187;
			}
		}
		if (	/* stmt: ARGI4(INDIRI4(ADDRLP4)) */
			LEFT_CHILD(a)->op == 4165 && /* INDIRI4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4391 /* ADDRLP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 191;
			}
		}
		if (	/* stmt: ARGI4(INDIRI4(ADDRFP4)) */
			LEFT_CHILD(a)->op == 4165 && /* INDIRI4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4375 /* ADDRFP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 195;
			}
		}
		break;
	case 4134: /* ARGU4 */
		_label(LEFT_CHILD(a));
		/* stmt: ARGU4(con) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_con_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 164;
		}
		/* stmt: ARGU4(coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 168;
		}
		/* stmt: ARGU4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 172;
		}
		if (	/* stmt: ARGU4(ADDRGP4) */
			LEFT_CHILD(a)->op == 4359 /* ADDRGP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 176;
			}
		}
		if (	/* stmt: ARGU4(ADDRLP4) */
			LEFT_CHILD(a)->op == 4391 /* ADDRLP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 180;
			}
		}
		if (	/* stmt: ARGU4(ADDRFP4) */
			LEFT_CHILD(a)->op == 4375 /* ADDRFP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 184;
			}
		}
		if (	/* stmt: ARGU4(INDIRU4(ADDRGP4)) */
			LEFT_CHILD(a)->op == 4166 && /* INDIRU4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4359 /* ADDRGP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 188;
			}
		}
		if (	/* stmt: ARGU4(INDIRU4(ADDRLP4)) */
			LEFT_CHILD(a)->op == 4166 && /* INDIRU4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4391 /* ADDRLP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 192;
			}
		}
		if (	/* stmt: ARGU4(INDIRU4(ADDRFP4)) */
			LEFT_CHILD(a)->op == 4166 && /* INDIRU4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4375 /* ADDRFP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 196;
			}
		}
		break;
	case 4135: /* ARGP4 */
		_label(LEFT_CHILD(a));
		/* stmt: ARGP4(con) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_con_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 165;
		}
		/* stmt: ARGP4(coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 169;
		}
		/* stmt: ARGP4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 173;
		}
		if (	/* stmt: ARGP4(ADDRGP4) */
			LEFT_CHILD(a)->op == 4359 /* ADDRGP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 177;
			}
		}
		if (	/* stmt: ARGP4(ADDRLP4) */
			LEFT_CHILD(a)->op == 4391 /* ADDRLP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 181;
			}
		}
		if (	/* stmt: ARGP4(ADDRFP4) */
			LEFT_CHILD(a)->op == 4375 /* ADDRFP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 185;
			}
		}
		if (	/* stmt: ARGP4(INDIRP4(ADDRGP4)) */
			LEFT_CHILD(a)->op == 4167 && /* INDIRP4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4359 /* ADDRGP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 189;
			}
		}
		if (	/* stmt: ARGP4(INDIRP4(ADDRLP4)) */
			LEFT_CHILD(a)->op == 4167 && /* INDIRP4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4391 /* ADDRLP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 193;
			}
		}
		if (	/* stmt: ARGP4(INDIRP4(ADDRFP4)) */
			LEFT_CHILD(a)->op == 4167 && /* INDIRP4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4375 /* ADDRFP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 197;
			}
		}
		break;
	case 4145: /* ASGNF4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		if (	/* stmt: ASGNF4(VREGP,reg) */
			LEFT_CHILD(a)->op == 711 /* VREGP */
		) {
			c = ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 9;
			}
		}
		/* stmt: ASGNF4(addrg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 16;
		}
		/* stmt: ASGNF4(special,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 24;
		}
		/* stmt: ASGNF4(special,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 32;
		}
		/* stmt: ASGNF4(addrl16,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl16_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 40;
		}
		/* stmt: ASGNF4(addrl32,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl32_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 48;
		}
		/* stmt: ASGNF4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 99;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 56;
		}
		break;
	case 4149: /* ASGNI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		if (	/* stmt: ASGNI4(VREGP,reg) */
			LEFT_CHILD(a)->op == 711 /* VREGP */
		) {
			c = ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 4;
			}
		}
		/* stmt: ASGNI4(addrg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 12;
		}
		/* stmt: ASGNI4(special,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 20;
		}
		/* stmt: ASGNI4(special,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 28;
		}
		/* stmt: ASGNI4(addrl16,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl16_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 36;
		}
		/* stmt: ASGNI4(addrl32,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl32_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 44;
		}
		/* stmt: ASGNI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 99;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 52;
		}
		/* stmt: ASGNI4(special,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 75;
		}
		if (	/* stmt: ASGNI4(special,BANDI4(INDIRI4(special),conli)) */
			RIGHT_CHILD(a)->op == 4485 && /* BANDI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_conli_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 77;
			}
		}
		if (	/* stmt: ASGNI4(special,BANDI4(INDIRI4(special),reg)) */
			RIGHT_CHILD(a)->op == 4485 && /* BANDI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 79;
			}
		}
		if (	/* stmt: ASGNI4(special,BORI4(INDIRI4(special),conli)) */
			RIGHT_CHILD(a)->op == 4517 && /* BORI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_conli_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 81;
			}
		}
		if (	/* stmt: ASGNI4(special,BORI4(INDIRI4(special),reg)) */
			RIGHT_CHILD(a)->op == 4517 && /* BORI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 83;
			}
		}
		if (	/* stmt: ASGNI4(special,BXORI4(INDIRI4(special),conli)) */
			RIGHT_CHILD(a)->op == 4533 && /* BXORI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_conli_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 85;
			}
		}
		if (	/* stmt: ASGNI4(special,BXORI4(INDIRI4(special),reg)) */
			RIGHT_CHILD(a)->op == 4533 && /* BXORI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 87;
			}
		}
		if (	/* stmt: ASGNI4(special,SUBI4(INDIRI4(special),coni)) */
			RIGHT_CHILD(a)->op == 4421 && /* SUBI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 89;
			}
		}
		if (	/* stmt: ASGNI4(special,ADDI4(INDIRI4(special),conli)) */
			RIGHT_CHILD(a)->op == 4405 && /* ADDI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_conli_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 91;
			}
		}
		if (	/* stmt: ASGNI4(special,ADDI4(INDIRI4(special),reg)) */
			RIGHT_CHILD(a)->op == 4405 && /* ADDI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 93;
			}
		}
		if (	/* stmt: ASGNI4(special,SUBI4(INDIRI4(special),coni)) */
			RIGHT_CHILD(a)->op == 4421 && /* SUBI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 95;
			}
		}
		if (	/* stmt: ASGNI4(special,SUBI4(INDIRI4(special),conli)) */
			RIGHT_CHILD(a)->op == 4421 && /* SUBI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_conli_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 97;
			}
		}
		if (	/* stmt: ASGNI4(special,SUBI4(INDIRI4(special),reg)) */
			RIGHT_CHILD(a)->op == 4421 && /* SUBI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 99;
			}
		}
		if (	/* stmt: ASGNI4(special,LSHI4(INDIRI4(special),coni)) */
			RIGHT_CHILD(a)->op == 4437 && /* LSHI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 101;
			}
		}
		if (	/* stmt: ASGNI4(special,LSHI4(INDIRI4(special),conli)) */
			RIGHT_CHILD(a)->op == 4437 && /* LSHI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_conli_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 103;
			}
		}
		if (	/* stmt: ASGNI4(special,LSHI4(INDIRI4(special),reg)) */
			RIGHT_CHILD(a)->op == 4437 && /* LSHI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 105;
			}
		}
		if (	/* stmt: ASGNI4(special,RSHI4(INDIRI4(special),coni)) */
			RIGHT_CHILD(a)->op == 4469 && /* RSHI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 107;
			}
		}
		if (	/* stmt: ASGNI4(special,RSHI4(INDIRI4(special),conli)) */
			RIGHT_CHILD(a)->op == 4469 && /* RSHI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_conli_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 109;
			}
		}
		if (	/* stmt: ASGNI4(special,RSHI4(INDIRI4(special),reg)) */
			RIGHT_CHILD(a)->op == 4469 && /* RSHI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 111;
			}
		}
		break;
	case 4150: /* ASGNU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		if (	/* stmt: ASGNU4(VREGP,reg) */
			LEFT_CHILD(a)->op == 711 /* VREGP */
		) {
			c = ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 7;
			}
		}
		/* stmt: ASGNU4(addrg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 15;
		}
		/* stmt: ASGNU4(special,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 23;
		}
		/* stmt: ASGNU4(special,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 31;
		}
		/* stmt: ASGNU4(addrl16,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl16_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 39;
		}
		/* stmt: ASGNU4(addrl32,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl32_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 47;
		}
		/* stmt: ASGNU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 99;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 55;
		}
		/* stmt: ASGNU4(special,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 76;
		}
		if (	/* stmt: ASGNU4(special,BANDU4(INDIRU4(special),conli)) */
			RIGHT_CHILD(a)->op == 4486 && /* BANDU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_conli_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 78;
			}
		}
		if (	/* stmt: ASGNU4(special,BANDU4(INDIRU4(special),reg)) */
			RIGHT_CHILD(a)->op == 4486 && /* BANDU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 80;
			}
		}
		if (	/* stmt: ASGNU4(special,BORU4(INDIRU4(special),conli)) */
			RIGHT_CHILD(a)->op == 4518 && /* BORU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_conli_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 82;
			}
		}
		if (	/* stmt: ASGNU4(special,BORU4(INDIRU4(special),reg)) */
			RIGHT_CHILD(a)->op == 4518 && /* BORU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 84;
			}
		}
		if (	/* stmt: ASGNU4(special,BXORU4(INDIRU4(special),conli)) */
			RIGHT_CHILD(a)->op == 4534 && /* BXORU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_conli_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 86;
			}
		}
		if (	/* stmt: ASGNU4(special,BXORU4(INDIRU4(special),reg)) */
			RIGHT_CHILD(a)->op == 4534 && /* BXORU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 88;
			}
		}
		if (	/* stmt: ASGNU4(special,SUBU4(INDIRU4(special),coni)) */
			RIGHT_CHILD(a)->op == 4422 && /* SUBU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 90;
			}
		}
		if (	/* stmt: ASGNU4(special,ADDU4(INDIRU4(special),conli)) */
			RIGHT_CHILD(a)->op == 4406 && /* ADDU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_conli_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 92;
			}
		}
		if (	/* stmt: ASGNU4(special,ADDU4(INDIRU4(special),reg)) */
			RIGHT_CHILD(a)->op == 4406 && /* ADDU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 94;
			}
		}
		if (	/* stmt: ASGNU4(special,SUBU4(INDIRU4(special),coni)) */
			RIGHT_CHILD(a)->op == 4422 && /* SUBU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 96;
			}
		}
		if (	/* stmt: ASGNU4(special,SUBU4(INDIRU4(special),conli)) */
			RIGHT_CHILD(a)->op == 4422 && /* SUBU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_conli_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 98;
			}
		}
		if (	/* stmt: ASGNU4(special,SUBU4(INDIRU4(special),reg)) */
			RIGHT_CHILD(a)->op == 4422 && /* SUBU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 100;
			}
		}
		if (	/* stmt: ASGNU4(special,LSHU4(INDIRU4(special),coni)) */
			RIGHT_CHILD(a)->op == 4438 && /* LSHU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 102;
			}
		}
		if (	/* stmt: ASGNU4(special,LSHU4(INDIRU4(special),conli)) */
			RIGHT_CHILD(a)->op == 4438 && /* LSHU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_conli_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 104;
			}
		}
		if (	/* stmt: ASGNU4(special,LSHU4(INDIRU4(special),reg)) */
			RIGHT_CHILD(a)->op == 4438 && /* LSHU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 106;
			}
		}
		if (	/* stmt: ASGNU4(special,RSHU4(INDIRU4(special),coni)) */
			RIGHT_CHILD(a)->op == 4470 && /* RSHU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 108;
			}
		}
		if (	/* stmt: ASGNU4(special,RSHU4(INDIRU4(special),conli)) */
			RIGHT_CHILD(a)->op == 4470 && /* RSHU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_conli_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 110;
			}
		}
		if (	/* stmt: ASGNU4(special,RSHU4(INDIRU4(special),reg)) */
			RIGHT_CHILD(a)->op == 4470 && /* RSHU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 112;
			}
		}
		break;
	case 4151: /* ASGNP4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		if (	/* stmt: ASGNP4(VREGP,reg) */
			LEFT_CHILD(a)->op == 711 /* VREGP */
		) {
			c = ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 8;
			}
		}
		/* stmt: ASGNP4(addrg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 17;
		}
		/* stmt: ASGNP4(special,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 25;
		}
		/* stmt: ASGNP4(special,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 33;
		}
		/* stmt: ASGNP4(addrl16,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl16_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 41;
		}
		/* stmt: ASGNP4(addrl32,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl32_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 49;
		}
		/* stmt: ASGNP4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 99;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 57;
		}
		break;
	case 4161: /* INDIRF4 */
		_label(LEFT_CHILD(a));
		if (	/* reg: INDIRF4(VREGP) */
			LEFT_CHILD(a)->op == 711 /* VREGP */
		) {
			if (mayrecalc(a)) {
				struct _state *q = a->syms[RX]->u.t.cse->x.state;
				if (q->cost[_stmt_NT] == 0) {
					p->cost[_stmt_NT] = 0;
					p->rule._stmt = q->rule._stmt;
				}
				if (q->cost[_reg_NT] == 0) {
					p->cost[_reg_NT] = 0;
					p->rule._reg = q->rule._reg;
				}
				if (q->cost[_coni_NT] == 0) {
					p->cost[_coni_NT] = 0;
					p->rule._coni = q->rule._coni;
				}
				if (q->cost[_conn_NT] == 0) {
					p->cost[_conn_NT] = 0;
					p->rule._conn = q->rule._conn;
				}
				if (q->cost[_conli_NT] == 0) {
					p->cost[_conli_NT] = 0;
					p->rule._conli = q->rule._conli;
				}
				if (q->cost[_cons_NT] == 0) {
					p->cost[_cons_NT] = 0;
					p->rule._cons = q->rule._cons;
				}
				if (q->cost[_con_NT] == 0) {
					p->cost[_con_NT] = 0;
					p->rule._con = q->rule._con;
				}
				if (q->cost[_addrg_NT] == 0) {
					p->cost[_addrg_NT] = 0;
					p->rule._addrg = q->rule._addrg;
				}
				if (q->cost[_special_NT] == 0) {
					p->cost[_special_NT] = 0;
					p->rule._special = q->rule._special;
				}
				if (q->cost[_addrl16_NT] == 0) {
					p->cost[_addrl16_NT] = 0;
					p->rule._addrl16 = q->rule._addrl16;
				}
				if (q->cost[_addrl32_NT] == 0) {
					p->cost[_addrl32_NT] = 0;
					p->rule._addrl32 = q->rule._addrl32;
				}
			}
			c = 0;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 8;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: INDIRF4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 33;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRF4(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 41;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRF4(special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 49;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRF4(addrl16) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl16_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 57;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRF4(addrl32) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl32_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 65;
			_closure_reg(a, c + 0);
		}
		break;
	case 4165: /* INDIRI4 */
		_label(LEFT_CHILD(a));
		if (	/* reg: INDIRI4(VREGP) */
			LEFT_CHILD(a)->op == 711 /* VREGP */
		) {
			if (mayrecalc(a)) {
				struct _state *q = a->syms[RX]->u.t.cse->x.state;
				if (q->cost[_stmt_NT] == 0) {
					p->cost[_stmt_NT] = 0;
					p->rule._stmt = q->rule._stmt;
				}
				if (q->cost[_reg_NT] == 0) {
					p->cost[_reg_NT] = 0;
					p->rule._reg = q->rule._reg;
				}
				if (q->cost[_coni_NT] == 0) {
					p->cost[_coni_NT] = 0;
					p->rule._coni = q->rule._coni;
				}
				if (q->cost[_conn_NT] == 0) {
					p->cost[_conn_NT] = 0;
					p->rule._conn = q->rule._conn;
				}
				if (q->cost[_conli_NT] == 0) {
					p->cost[_conli_NT] = 0;
					p->rule._conli = q->rule._conli;
				}
				if (q->cost[_cons_NT] == 0) {
					p->cost[_cons_NT] = 0;
					p->rule._cons = q->rule._cons;
				}
				if (q->cost[_con_NT] == 0) {
					p->cost[_con_NT] = 0;
					p->rule._con = q->rule._con;
				}
				if (q->cost[_addrg_NT] == 0) {
					p->cost[_addrg_NT] = 0;
					p->rule._addrg = q->rule._addrg;
				}
				if (q->cost[_special_NT] == 0) {
					p->cost[_special_NT] = 0;
					p->rule._special = q->rule._special;
				}
				if (q->cost[_addrl16_NT] == 0) {
					p->cost[_addrl16_NT] = 0;
					p->rule._addrl16 = q->rule._addrl16;
				}
				if (q->cost[_addrl32_NT] == 0) {
					p->cost[_addrl32_NT] = 0;
					p->rule._addrl32 = q->rule._addrl32;
				}
			}
			c = 0;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 5;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: INDIRI4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 29;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI4(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 37;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI4(special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 45;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI4(addrl16) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl16_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 53;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI4(addrl32) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl32_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 61;
			_closure_reg(a, c + 0);
		}
		break;
	case 4166: /* INDIRU4 */
		_label(LEFT_CHILD(a));
		if (	/* reg: INDIRU4(VREGP) */
			LEFT_CHILD(a)->op == 711 /* VREGP */
		) {
			if (mayrecalc(a)) {
				struct _state *q = a->syms[RX]->u.t.cse->x.state;
				if (q->cost[_stmt_NT] == 0) {
					p->cost[_stmt_NT] = 0;
					p->rule._stmt = q->rule._stmt;
				}
				if (q->cost[_reg_NT] == 0) {
					p->cost[_reg_NT] = 0;
					p->rule._reg = q->rule._reg;
				}
				if (q->cost[_coni_NT] == 0) {
					p->cost[_coni_NT] = 0;
					p->rule._coni = q->rule._coni;
				}
				if (q->cost[_conn_NT] == 0) {
					p->cost[_conn_NT] = 0;
					p->rule._conn = q->rule._conn;
				}
				if (q->cost[_conli_NT] == 0) {
					p->cost[_conli_NT] = 0;
					p->rule._conli = q->rule._conli;
				}
				if (q->cost[_cons_NT] == 0) {
					p->cost[_cons_NT] = 0;
					p->rule._cons = q->rule._cons;
				}
				if (q->cost[_con_NT] == 0) {
					p->cost[_con_NT] = 0;
					p->rule._con = q->rule._con;
				}
				if (q->cost[_addrg_NT] == 0) {
					p->cost[_addrg_NT] = 0;
					p->rule._addrg = q->rule._addrg;
				}
				if (q->cost[_special_NT] == 0) {
					p->cost[_special_NT] = 0;
					p->rule._special = q->rule._special;
				}
				if (q->cost[_addrl16_NT] == 0) {
					p->cost[_addrl16_NT] = 0;
					p->rule._addrl16 = q->rule._addrl16;
				}
				if (q->cost[_addrl32_NT] == 0) {
					p->cost[_addrl32_NT] = 0;
					p->rule._addrl32 = q->rule._addrl32;
				}
			}
			c = 0;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 6;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: INDIRU4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 32;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU4(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 40;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU4(special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 48;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU4(addrl16) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl16_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 56;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU4(addrl32) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl32_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 64;
			_closure_reg(a, c + 0);
		}
		break;
	case 4167: /* INDIRP4 */
		_label(LEFT_CHILD(a));
		if (	/* reg: INDIRP4(VREGP) */
			LEFT_CHILD(a)->op == 711 /* VREGP */
		) {
			if (mayrecalc(a)) {
				struct _state *q = a->syms[RX]->u.t.cse->x.state;
				if (q->cost[_stmt_NT] == 0) {
					p->cost[_stmt_NT] = 0;
					p->rule._stmt = q->rule._stmt;
				}
				if (q->cost[_reg_NT] == 0) {
					p->cost[_reg_NT] = 0;
					p->rule._reg = q->rule._reg;
				}
				if (q->cost[_coni_NT] == 0) {
					p->cost[_coni_NT] = 0;
					p->rule._coni = q->rule._coni;
				}
				if (q->cost[_conn_NT] == 0) {
					p->cost[_conn_NT] = 0;
					p->rule._conn = q->rule._conn;
				}
				if (q->cost[_conli_NT] == 0) {
					p->cost[_conli_NT] = 0;
					p->rule._conli = q->rule._conli;
				}
				if (q->cost[_cons_NT] == 0) {
					p->cost[_cons_NT] = 0;
					p->rule._cons = q->rule._cons;
				}
				if (q->cost[_con_NT] == 0) {
					p->cost[_con_NT] = 0;
					p->rule._con = q->rule._con;
				}
				if (q->cost[_addrg_NT] == 0) {
					p->cost[_addrg_NT] = 0;
					p->rule._addrg = q->rule._addrg;
				}
				if (q->cost[_special_NT] == 0) {
					p->cost[_special_NT] = 0;
					p->rule._special = q->rule._special;
				}
				if (q->cost[_addrl16_NT] == 0) {
					p->cost[_addrl16_NT] = 0;
					p->rule._addrl16 = q->rule._addrl16;
				}
				if (q->cost[_addrl32_NT] == 0) {
					p->cost[_addrl32_NT] = 0;
					p->rule._addrl32 = q->rule._addrl32;
				}
			}
			c = 0;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 7;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: INDIRP4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 34;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRP4(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 42;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRP4(special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 50;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRP4(addrl16) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl16_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 58;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRP4(addrl32) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl32_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 66;
			_closure_reg(a, c + 0);
		}
		break;
	case 4209: /* CVFF4 */
		_label(LEFT_CHILD(a));
		/* reg: CVFF4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 103;
			_closure_reg(a, c + 0);
		}
		break;
	case 4213: /* CVFI4 */
		_label(LEFT_CHILD(a));
		/* reg: CVFI4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 104;
			_closure_reg(a, c + 0);
		}
		break;
	case 4225: /* CVIF4 */
		_label(LEFT_CHILD(a));
		/* reg: CVIF4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 105;
			_closure_reg(a, c + 0);
		}
		break;
	case 4229: /* CVII4 */
		_label(LEFT_CHILD(a));
		/* reg: CVII4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 99;
			_closure_reg(a, c + 0);
		}
		break;
	case 4230: /* CVIU4 */
		_label(LEFT_CHILD(a));
		/* reg: CVIU4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 102;
			_closure_reg(a, c + 0);
		}
		break;
	case 4246: /* CVPU4 */
		_label(LEFT_CHILD(a));
		/* reg: CVPU4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + (move(a));
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 96;
			_closure_reg(a, c + 0);
		}
		break;
	case 4277: /* CVUI4 */
		_label(LEFT_CHILD(a));
		if (	/* reg: CVUI4(INDIRU1(reg)) */
			LEFT_CHILD(a)->op == 1094 /* INDIRU1 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_reg_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 76;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUI4(INDIRU2(reg)) */
			LEFT_CHILD(a)->op == 2118 /* INDIRU2 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_reg_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 77;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUI4(INDIRU4(reg)) */
			LEFT_CHILD(a)->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_reg_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 78;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: CVUI4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 91;
			_closure_reg(a, c + 0);
		}
		break;
	case 4278: /* CVUU4 */
		_label(LEFT_CHILD(a));
		if (	/* reg: CVUU4(INDIRU1(reg)) */
			LEFT_CHILD(a)->op == 1094 /* INDIRU1 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_reg_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 70;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUU4(INDIRU2(reg)) */
			LEFT_CHILD(a)->op == 2118 /* INDIRU2 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_reg_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 71;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUU4(INDIRU4(reg)) */
			LEFT_CHILD(a)->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_reg_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 72;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: CVUU4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 94;
			_closure_reg(a, c + 0);
		}
		break;
	case 4279: /* CVUP4 */
		_label(LEFT_CHILD(a));
		/* reg: CVUP4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + (move(a));
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 95;
			_closure_reg(a, c + 0);
		}
		break;
	case 4289: /* NEGF4 */
		_label(LEFT_CHILD(a));
		/* reg: NEGF4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 107;
			_closure_reg(a, c + 0);
		}
		break;
	case 4293: /* NEGI4 */
		_label(LEFT_CHILD(a));
		/* reg: NEGI4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 106;
			_closure_reg(a, c + 0);
		}
		break;
	case 4305: /* CALLF4 */
		_label(LEFT_CHILD(a));
		/* reg: CALLF4(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 82;
			_closure_reg(a, c + 0);
		}
		/* reg: CALLF4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 87;
			_closure_reg(a, c + 0);
		}
		break;
	case 4309: /* CALLI4 */
		_label(LEFT_CHILD(a));
		/* reg: CALLI4(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 79;
			_closure_reg(a, c + 0);
		}
		/* reg: CALLI4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 84;
			_closure_reg(a, c + 0);
		}
		break;
	case 4310: /* CALLU4 */
		_label(LEFT_CHILD(a));
		/* reg: CALLU4(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 80;
			_closure_reg(a, c + 0);
		}
		/* reg: CALLU4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 85;
			_closure_reg(a, c + 0);
		}
		break;
	case 4311: /* CALLP4 */
		_label(LEFT_CHILD(a));
		/* reg: CALLP4(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 81;
			_closure_reg(a, c + 0);
		}
		/* reg: CALLP4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 86;
			_closure_reg(a, c + 0);
		}
		break;
	case 4321: /* LOADF4 */
		_label(LEFT_CHILD(a));
		/* reg: LOADF4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + (move(a));
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 17;
			_closure_reg(a, c + 0);
		}
		break;
	case 4325: /* LOADI4 */
		_label(LEFT_CHILD(a));
		/* reg: LOADI4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + (move(a));
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 12;
			_closure_reg(a, c + 0);
		}
		break;
	case 4326: /* LOADU4 */
		_label(LEFT_CHILD(a));
		/* reg: LOADU4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + (move(a));
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 15;
			_closure_reg(a, c + 0);
		}
		break;
	case 4327: /* LOADP4 */
		_label(LEFT_CHILD(a));
		/* reg: LOADP4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + (move(a));
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 16;
			_closure_reg(a, c + 0);
		}
		break;
	case 4337: /* RETF4 */
		_label(LEFT_CHILD(a));
		/* stmt: RETF4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 61;
		}
		/* stmt: RETF4(con) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_con_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 74;
		}
		break;
	case 4341: /* RETI4 */
		_label(LEFT_CHILD(a));
		/* stmt: RETI4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 58;
		}
		/* stmt: RETI4(coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 62;
		}
		/* stmt: RETI4(cons) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_cons_NT] + 2;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 65;
		}
		/* stmt: RETI4(conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_conli_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 68;
		}
		/* stmt: RETI4(con) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_con_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 71;
		}
		break;
	case 4342: /* RETU4 */
		_label(LEFT_CHILD(a));
		/* stmt: RETU4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 59;
		}
		/* stmt: RETU4(coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 63;
		}
		/* stmt: RETU4(cons) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_cons_NT] + 2;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 66;
		}
		/* stmt: RETU4(conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_conli_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 69;
		}
		/* stmt: RETU4(con) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_con_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 72;
		}
		break;
	case 4343: /* RETP4 */
		_label(LEFT_CHILD(a));
		/* stmt: RETP4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 60;
		}
		/* stmt: RETP4(coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 64;
		}
		/* stmt: RETP4(cons) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_cons_NT] + 2;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 67;
		}
		/* stmt: RETP4(conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_conli_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 70;
		}
		/* stmt: RETP4(con) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_con_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 73;
		}
		break;
	case 4359: /* ADDRGP4 */
		/* addrg: ADDRGP4 */
		c = ((special(a)?LBURG_MAX:0));
		if (c + 0 < p->cost[_addrg_NT]) {
			p->cost[_addrg_NT] = c + 0;
			p->rule._addrg = 1;
			_closure_addrg(a, c + 0);
		}
		/* special: ADDRGP4 */
		c = ((special(a)?0:LBURG_MAX));
		if (c + 0 < p->cost[_special_NT]) {
			p->cost[_special_NT] = c + 0;
			p->rule._special = 1;
			_closure_special(a, c + 0);
		}
		break;
	case 4375: /* ADDRFP4 */
		/* addrl16: ADDRFP4 */
		c = (range (a, -255, 255));
		if (c + 0 < p->cost[_addrl16_NT]) {
			p->cost[_addrl16_NT] = c + 0;
			p->rule._addrl16 = 2;
			_closure_addrl16(a, c + 0);
		}
		/* addrl32: ADDRFP4 */
		if (0 + 0 < p->cost[_addrl32_NT]) {
			p->cost[_addrl32_NT] = 0 + 0;
			p->rule._addrl32 = 2;
			_closure_addrl32(a, 0 + 0);
		}
		break;
	case 4391: /* ADDRLP4 */
		/* addrl16: ADDRLP4 */
		c = (range (a, -255, 255));
		if (c + 0 < p->cost[_addrl16_NT]) {
			p->cost[_addrl16_NT] = c + 0;
			p->rule._addrl16 = 1;
			_closure_addrl16(a, c + 0);
		}
		/* addrl32: ADDRLP4 */
		if (0 + 0 < p->cost[_addrl32_NT]) {
			p->cost[_addrl32_NT] = 0 + 0;
			p->rule._addrl32 = 1;
			_closure_addrl32(a, 0 + 0);
		}
		break;
	case 4401: /* ADDF4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: ADDF4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 5;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 116;
			_closure_reg(a, c + 0);
		}
		break;
	case 4405: /* ADDI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: ADDI4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 110;
			_closure_reg(a, c + 0);
		}
		/* reg: ADDI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 113;
			_closure_reg(a, c + 0);
		}
		break;
	case 4406: /* ADDU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: ADDU4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 111;
			_closure_reg(a, c + 0);
		}
		/* reg: ADDU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 114;
			_closure_reg(a, c + 0);
		}
		break;
	case 4407: /* ADDP4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: ADDP4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 112;
			_closure_reg(a, c + 0);
		}
		/* reg: ADDP4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 115;
			_closure_reg(a, c + 0);
		}
		break;
	case 4417: /* SUBF4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: SUBF4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 5;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 129;
			_closure_reg(a, c + 0);
		}
		break;
	case 4421: /* SUBI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: SUBI4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 123;
			_closure_reg(a, c + 0);
		}
		/* reg: SUBI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 126;
			_closure_reg(a, c + 0);
		}
		break;
	case 4422: /* SUBU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: SUBU4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 124;
			_closure_reg(a, c + 0);
		}
		/* reg: SUBU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 127;
			_closure_reg(a, c + 0);
		}
		break;
	case 4423: /* SUBP4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: SUBP4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 125;
			_closure_reg(a, c + 0);
		}
		/* reg: SUBP4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 128;
			_closure_reg(a, c + 0);
		}
		break;
	case 4437: /* LSHI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: LSHI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 138;
			_closure_reg(a, c + 0);
		}
		/* reg: LSHI4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 140;
			_closure_reg(a, c + 0);
		}
		break;
	case 4438: /* LSHU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: LSHU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 139;
			_closure_reg(a, c + 0);
		}
		/* reg: LSHU4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 141;
			_closure_reg(a, c + 0);
		}
		break;
	case 4453: /* MODI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: MODI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 5;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 133;
			_closure_reg(a, c + 0);
		}
		break;
	case 4454: /* MODU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: MODU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 5;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 134;
			_closure_reg(a, c + 0);
		}
		break;
	case 4469: /* RSHI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: RSHI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 142;
			_closure_reg(a, c + 0);
		}
		/* reg: RSHI4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 144;
			_closure_reg(a, c + 0);
		}
		break;
	case 4470: /* RSHU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: RSHU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 143;
			_closure_reg(a, c + 0);
		}
		/* reg: RSHU4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 145;
			_closure_reg(a, c + 0);
		}
		break;
	case 4485: /* BANDI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: BANDI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 117;
			_closure_reg(a, c + 0);
		}
		break;
	case 4486: /* BANDU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: BANDU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 118;
			_closure_reg(a, c + 0);
		}
		break;
	case 4501: /* BCOMI4 */
		_label(LEFT_CHILD(a));
		/* reg: BCOMI4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 108;
			_closure_reg(a, c + 0);
		}
		break;
	case 4502: /* BCOMU4 */
		_label(LEFT_CHILD(a));
		/* reg: BCOMU4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 109;
			_closure_reg(a, c + 0);
		}
		break;
	case 4517: /* BORI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: BORI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 119;
			_closure_reg(a, c + 0);
		}
		break;
	case 4518: /* BORU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: BORU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 120;
			_closure_reg(a, c + 0);
		}
		break;
	case 4533: /* BXORI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: BXORI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 121;
			_closure_reg(a, c + 0);
		}
		break;
	case 4534: /* BXORU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: BXORU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 122;
			_closure_reg(a, c + 0);
		}
		break;
	case 4545: /* DIVF4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: DIVF4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 5;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 132;
			_closure_reg(a, c + 0);
		}
		break;
	case 4549: /* DIVI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: DIVI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 5;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 130;
			_closure_reg(a, c + 0);
		}
		break;
	case 4550: /* DIVU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: DIVU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 5;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 131;
			_closure_reg(a, c + 0);
		}
		break;
	case 4561: /* MULF4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: MULF4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 5;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 137;
			_closure_reg(a, c + 0);
		}
		break;
	case 4565: /* MULI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: MULI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 5;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 135;
			_closure_reg(a, c + 0);
		}
		break;
	case 4566: /* MULU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: MULU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 5;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 136;
			_closure_reg(a, c + 0);
		}
		break;
	case 4577: /* EQF4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: EQF4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 15;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 115;
		}
		break;
	case 4581: /* EQI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: EQI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 113;
		}
		/* stmt: EQI4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 131;
		}
		/* stmt: EQI4(reg,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 143;
		}
		break;
	case 4582: /* EQU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: EQU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 114;
		}
		/* stmt: EQU4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 132;
		}
		/* stmt: EQU4(reg,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 144;
		}
		break;
	case 4593: /* GEF4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: GEF4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 15;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 121;
		}
		break;
	case 4597: /* GEI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: GEI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 119;
		}
		/* stmt: GEI4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 135;
		}
		/* stmt: GEI4(reg,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 147;
		}
		break;
	case 4598: /* GEU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: GEU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 120;
		}
		/* stmt: GEU4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 136;
		}
		/* stmt: GEU4(reg,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 148;
		}
		break;
	case 4609: /* GTF4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: GTF4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 15;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 124;
		}
		break;
	case 4613: /* GTI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: GTI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 122;
		}
		/* stmt: GTI4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 137;
		}
		/* stmt: GTI4(reg,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 149;
		}
		break;
	case 4614: /* GTU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: GTU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 123;
		}
		/* stmt: GTU4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 138;
		}
		/* stmt: GTU4(reg,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 150;
		}
		break;
	case 4625: /* LEF4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: LEF4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 15;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 127;
		}
		break;
	case 4629: /* LEI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: LEI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 125;
		}
		/* stmt: LEI4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 139;
		}
		/* stmt: LEI4(reg,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 151;
		}
		break;
	case 4630: /* LEU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: LEU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 126;
		}
		/* stmt: LEU4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 140;
		}
		/* stmt: LEU4(reg,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 152;
		}
		break;
	case 4641: /* LTF4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: LTF4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 15;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 130;
		}
		break;
	case 4645: /* LTI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: LTI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 128;
		}
		/* stmt: LTI4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 141;
		}
		/* stmt: LTI4(reg,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 153;
		}
		break;
	case 4646: /* LTU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: LTU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 129;
		}
		/* stmt: LTU4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 142;
		}
		/* stmt: LTU4(reg,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 154;
		}
		break;
	case 4657: /* NEF4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: NEF4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 15;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 118;
		}
		break;
	case 4661: /* NEI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: NEI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 116;
		}
		/* stmt: NEI4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 133;
		}
		/* stmt: NEI4(reg,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 145;
		}
		break;
	case 4662: /* NEU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: NEU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 117;
		}
		/* stmt: NEU4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 134;
		}
		/* stmt: NEU4(reg,conli) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_conli_NT] + 3;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 146;
		}
		break;
	default:
		fatal("_label", "Bad terminal %d\n", OP_LABEL(a));
	}
}

static void _kids(NODEPTR_TYPE p, int eruleno, NODEPTR_TYPE kids[]) {
	if (!p)
		fatal("_kids", "Null tree\n", 0);
	if (!kids)
		fatal("_kids", "Null kids\n", 0);
	switch (eruleno) {
	case 381: /* stmt: ARGF4(INDIRF4(ADDRFP4)) */
	case 380: /* stmt: ARGP4(INDIRP4(ADDRFP4)) */
	case 379: /* stmt: ARGU4(INDIRU4(ADDRFP4)) */
	case 378: /* stmt: ARGI4(INDIRI4(ADDRFP4)) */
	case 377: /* stmt: ARGF4(INDIRF4(ADDRLP4)) */
	case 376: /* stmt: ARGP4(INDIRP4(ADDRLP4)) */
	case 375: /* stmt: ARGU4(INDIRU4(ADDRLP4)) */
	case 374: /* stmt: ARGI4(INDIRI4(ADDRLP4)) */
	case 373: /* stmt: ARGF4(INDIRF4(ADDRGP4)) */
	case 372: /* stmt: ARGP4(INDIRP4(ADDRGP4)) */
	case 371: /* stmt: ARGU4(INDIRU4(ADDRGP4)) */
	case 370: /* stmt: ARGI4(INDIRI4(ADDRGP4)) */
	case 369: /* stmt: ARGF4(ADDRFP4) */
	case 368: /* stmt: ARGP4(ADDRFP4) */
	case 367: /* stmt: ARGU4(ADDRFP4) */
	case 366: /* stmt: ARGI4(ADDRFP4) */
	case 365: /* stmt: ARGF4(ADDRLP4) */
	case 364: /* stmt: ARGP4(ADDRLP4) */
	case 363: /* stmt: ARGU4(ADDRLP4) */
	case 362: /* stmt: ARGI4(ADDRLP4) */
	case 361: /* stmt: ARGF4(ADDRGP4) */
	case 360: /* stmt: ARGP4(ADDRGP4) */
	case 359: /* stmt: ARGU4(ADDRGP4) */
	case 358: /* stmt: ARGI4(ADDRGP4) */
	case 345: /* stmt: LABELV */
	case 64: /* addrl32: ADDRFP4 */
	case 63: /* addrl32: ADDRLP4 */
	case 62: /* addrl16: ADDRFP4 */
	case 61: /* addrl16: ADDRLP4 */
	case 60: /* special: ADDRGP4 */
	case 59: /* addrg: ADDRGP4 */
	case 58: /* con: CNSTF4 */
	case 57: /* con: CNSTP4 */
	case 56: /* con: CNSTU4 */
	case 55: /* con: CNSTU2 */
	case 54: /* con: CNSTU1 */
	case 53: /* con: CNSTI4 */
	case 52: /* con: CNSTI2 */
	case 51: /* con: CNSTI1 */
	case 50: /* cons: CNSTU4 */
	case 49: /* cons: CNSTU2 */
	case 48: /* cons: CNSTU1 */
	case 47: /* cons: CNSTI4 */
	case 46: /* cons: CNSTI2 */
	case 45: /* cons: CNSTI1 */
	case 44: /* conli: CNSTU4 */
	case 43: /* conli: CNSTU2 */
	case 42: /* conli: CNSTU1 */
	case 41: /* conli: CNSTI4 */
	case 40: /* conli: CNSTI2 */
	case 39: /* conli: CNSTI1 */
	case 38: /* conn: CNSTU4 */
	case 37: /* conn: CNSTU2 */
	case 36: /* conn: CNSTU1 */
	case 35: /* conn: CNSTI4 */
	case 34: /* conn: CNSTI2 */
	case 33: /* conn: CNSTI1 */
	case 32: /* coni: CNSTU4 */
	case 31: /* coni: CNSTU2 */
	case 30: /* coni: CNSTU1 */
	case 29: /* coni: CNSTI4 */
	case 28: /* coni: CNSTI2 */
	case 27: /* coni: CNSTI1 */
	case 8: /* reg: INDIRF4(VREGP) */
	case 7: /* reg: INDIRP4(VREGP) */
	case 6: /* reg: INDIRU4(VREGP) */
	case 5: /* reg: INDIRI4(VREGP) */
	case 4: /* reg: INDIRU2(VREGP) */
	case 3: /* reg: INDIRI2(VREGP) */
	case 2: /* reg: INDIRU1(VREGP) */
	case 1: /* reg: INDIRI1(VREGP) */
		break;
	case 357: /* stmt: ARGF4(reg) */
	case 356: /* stmt: ARGP4(reg) */
	case 355: /* stmt: ARGU4(reg) */
	case 354: /* stmt: ARGI4(reg) */
	case 353: /* stmt: ARGF4(coni) */
	case 352: /* stmt: ARGP4(coni) */
	case 351: /* stmt: ARGU4(coni) */
	case 350: /* stmt: ARGI4(coni) */
	case 349: /* stmt: ARGF4(con) */
	case 348: /* stmt: ARGP4(con) */
	case 347: /* stmt: ARGU4(con) */
	case 346: /* stmt: ARGI4(con) */
	case 344: /* stmt: JUMPV(addrg) */
	case 221: /* reg: BCOMU4(reg) */
	case 220: /* reg: BCOMI4(reg) */
	case 219: /* reg: NEGF4(reg) */
	case 218: /* reg: NEGI4(reg) */
	case 217: /* reg: CVIF4(reg) */
	case 216: /* reg: CVFI4(reg) */
	case 215: /* reg: CVFF4(reg) */
	case 214: /* reg: CVIU4(reg) */
	case 213: /* reg: CVIU2(reg) */
	case 212: /* reg: CVIU1(reg) */
	case 211: /* reg: CVII4(reg) */
	case 210: /* reg: CVII2(reg) */
	case 209: /* reg: CVII1(reg) */
	case 208: /* reg: CVPU4(reg) */
	case 207: /* reg: CVUP4(reg) */
	case 206: /* reg: CVUU4(reg) */
	case 205: /* reg: CVUU2(reg) */
	case 204: /* reg: CVUU1(reg) */
	case 203: /* reg: CVUI4(reg) */
	case 202: /* reg: CVUI2(reg) */
	case 201: /* reg: CVUI1(reg) */
	case 200: /* stmt: RETF4(con) */
	case 199: /* stmt: RETP4(con) */
	case 198: /* stmt: RETU4(con) */
	case 197: /* stmt: RETI4(con) */
	case 196: /* stmt: RETP4(conli) */
	case 195: /* stmt: RETU4(conli) */
	case 194: /* stmt: RETI4(conli) */
	case 193: /* stmt: RETP4(cons) */
	case 192: /* stmt: RETU4(cons) */
	case 191: /* stmt: RETI4(cons) */
	case 190: /* stmt: RETP4(coni) */
	case 189: /* stmt: RETU4(coni) */
	case 188: /* stmt: RETI4(coni) */
	case 187: /* stmt: RETF4(reg) */
	case 186: /* stmt: RETP4(reg) */
	case 185: /* stmt: RETU4(reg) */
	case 184: /* stmt: RETI4(reg) */
	case 183: /* reg: CALLV(reg) */
	case 182: /* reg: CALLF4(reg) */
	case 181: /* reg: CALLP4(reg) */
	case 180: /* reg: CALLU4(reg) */
	case 179: /* reg: CALLI4(reg) */
	case 178: /* reg: CALLV(addrg) */
	case 177: /* reg: CALLF4(addrg) */
	case 176: /* reg: CALLP4(addrg) */
	case 175: /* reg: CALLU4(addrg) */
	case 174: /* reg: CALLI4(addrg) */
	case 113: /* reg: INDIRP4(addrl32) */
	case 112: /* reg: INDIRF4(addrl32) */
	case 111: /* reg: INDIRU4(addrl32) */
	case 110: /* reg: INDIRU2(addrl32) */
	case 109: /* reg: INDIRU1(addrl32) */
	case 108: /* reg: INDIRI4(addrl32) */
	case 107: /* reg: INDIRI2(addrl32) */
	case 106: /* reg: INDIRI1(addrl32) */
	case 105: /* reg: INDIRP4(addrl16) */
	case 104: /* reg: INDIRF4(addrl16) */
	case 103: /* reg: INDIRU4(addrl16) */
	case 102: /* reg: INDIRU2(addrl16) */
	case 101: /* reg: INDIRU1(addrl16) */
	case 100: /* reg: INDIRI4(addrl16) */
	case 99: /* reg: INDIRI2(addrl16) */
	case 98: /* reg: INDIRI1(addrl16) */
	case 97: /* reg: INDIRP4(special) */
	case 96: /* reg: INDIRF4(special) */
	case 95: /* reg: INDIRU4(special) */
	case 94: /* reg: INDIRU2(special) */
	case 93: /* reg: INDIRU1(special) */
	case 92: /* reg: INDIRI4(special) */
	case 91: /* reg: INDIRI2(special) */
	case 90: /* reg: INDIRI1(special) */
	case 89: /* reg: INDIRP4(addrg) */
	case 88: /* reg: INDIRF4(addrg) */
	case 87: /* reg: INDIRU4(addrg) */
	case 86: /* reg: INDIRU2(addrg) */
	case 85: /* reg: INDIRU1(addrg) */
	case 84: /* reg: INDIRI4(addrg) */
	case 83: /* reg: INDIRI2(addrg) */
	case 82: /* reg: INDIRI1(addrg) */
	case 81: /* reg: INDIRP4(reg) */
	case 80: /* reg: INDIRF4(reg) */
	case 79: /* reg: INDIRU4(reg) */
	case 78: /* reg: INDIRU2(reg) */
	case 77: /* reg: INDIRU1(reg) */
	case 76: /* reg: INDIRI4(reg) */
	case 75: /* reg: INDIRI2(reg) */
	case 74: /* reg: INDIRI1(reg) */
	case 17: /* reg: LOADF4(reg) */
	case 16: /* reg: LOADP4(reg) */
	case 15: /* reg: LOADU4(reg) */
	case 14: /* reg: LOADU2(reg) */
	case 13: /* reg: LOADU1(reg) */
	case 12: /* reg: LOADI4(reg) */
	case 11: /* reg: LOADI2(reg) */
	case 10: /* reg: LOADI1(reg) */
	case 9: /* reg: LOADB(reg) */
		kids[0] = LEFT_CHILD(p);
		break;
	case 73: /* reg: con */
	case 72: /* reg: conli */
	case 71: /* reg: cons */
	case 70: /* reg: conn */
	case 69: /* reg: coni */
	case 68: /* reg: special */
	case 67: /* reg: addrg */
	case 66: /* reg: addrl32 */
	case 65: /* reg: addrl16 */
	case 18: /* stmt: reg */
		kids[0] = p;
		break;
	case 26: /* stmt: ASGNF4(VREGP,reg) */
	case 25: /* stmt: ASGNP4(VREGP,reg) */
	case 24: /* stmt: ASGNU4(VREGP,reg) */
	case 23: /* stmt: ASGNU2(VREGP,reg) */
	case 22: /* stmt: ASGNU1(VREGP,reg) */
	case 21: /* stmt: ASGNI4(VREGP,reg) */
	case 20: /* stmt: ASGNI2(VREGP,reg) */
	case 19: /* stmt: ASGNI1(VREGP,reg) */
		kids[0] = RIGHT_CHILD(p);
		break;
	case 343: /* stmt: JUMPV(INDIRP4(reg)) */
	case 342: /* stmt: JUMPV(INDIRP4(addrg)) */
	case 341: /* stmt: JUMPV(INDIRP4(addrl32)) */
	case 340: /* stmt: JUMPV(INDIRP4(addrl16)) */
	case 338: /* stmt: ARGB(INDIRB(reg)) */
	case 125: /* reg: CVUI4(INDIRU4(reg)) */
	case 124: /* reg: CVUI4(INDIRU2(reg)) */
	case 123: /* reg: CVUI4(INDIRU1(reg)) */
	case 122: /* reg: CVUI2(INDIRU2(reg)) */
	case 121: /* reg: CVUI2(INDIRU1(reg)) */
	case 120: /* reg: CVUI1(INDIRU1(reg)) */
	case 119: /* reg: CVUU4(INDIRU4(reg)) */
	case 118: /* reg: CVUU4(INDIRU2(reg)) */
	case 117: /* reg: CVUU4(INDIRU1(reg)) */
	case 116: /* reg: CVUU2(INDIRU2(reg)) */
	case 115: /* reg: CVUU2(INDIRU1(reg)) */
	case 114: /* reg: CVUU1(INDIRU1(reg)) */
		kids[0] = LEFT_CHILD(LEFT_CHILD(p));
		break;
	case 337: /* stmt: LTU4(reg,conli) */
	case 336: /* stmt: LTI4(reg,conli) */
	case 335: /* stmt: LEU4(reg,conli) */
	case 334: /* stmt: LEI4(reg,conli) */
	case 333: /* stmt: GTU4(reg,conli) */
	case 332: /* stmt: GTI4(reg,conli) */
	case 331: /* stmt: GEU4(reg,conli) */
	case 330: /* stmt: GEI4(reg,conli) */
	case 329: /* stmt: NEU4(reg,conli) */
	case 328: /* stmt: NEI4(reg,conli) */
	case 327: /* stmt: EQU4(reg,conli) */
	case 326: /* stmt: EQI4(reg,conli) */
	case 325: /* stmt: LTU4(reg,coni) */
	case 324: /* stmt: LTI4(reg,coni) */
	case 323: /* stmt: LEU4(reg,coni) */
	case 322: /* stmt: LEI4(reg,coni) */
	case 321: /* stmt: GTU4(reg,coni) */
	case 320: /* stmt: GTI4(reg,coni) */
	case 319: /* stmt: GEU4(reg,coni) */
	case 318: /* stmt: GEI4(reg,coni) */
	case 317: /* stmt: NEU4(reg,coni) */
	case 316: /* stmt: NEI4(reg,coni) */
	case 315: /* stmt: EQU4(reg,coni) */
	case 314: /* stmt: EQI4(reg,coni) */
	case 313: /* stmt: LTF4(reg,reg) */
	case 312: /* stmt: LTU4(reg,reg) */
	case 311: /* stmt: LTI4(reg,reg) */
	case 310: /* stmt: LEF4(reg,reg) */
	case 309: /* stmt: LEU4(reg,reg) */
	case 308: /* stmt: LEI4(reg,reg) */
	case 307: /* stmt: GTF4(reg,reg) */
	case 306: /* stmt: GTU4(reg,reg) */
	case 305: /* stmt: GTI4(reg,reg) */
	case 304: /* stmt: GEF4(reg,reg) */
	case 303: /* stmt: GEU4(reg,reg) */
	case 302: /* stmt: GEI4(reg,reg) */
	case 301: /* stmt: NEF4(reg,reg) */
	case 300: /* stmt: NEU4(reg,reg) */
	case 299: /* stmt: NEI4(reg,reg) */
	case 298: /* stmt: EQF4(reg,reg) */
	case 297: /* stmt: EQU4(reg,reg) */
	case 296: /* stmt: EQI4(reg,reg) */
	case 259: /* stmt: ASGNU4(special,reg) */
	case 258: /* stmt: ASGNI4(special,reg) */
	case 257: /* reg: RSHU4(reg,coni) */
	case 256: /* reg: RSHI4(reg,coni) */
	case 255: /* reg: RSHU4(reg,reg) */
	case 254: /* reg: RSHI4(reg,reg) */
	case 253: /* reg: LSHU4(reg,coni) */
	case 252: /* reg: LSHI4(reg,coni) */
	case 251: /* reg: LSHU4(reg,reg) */
	case 250: /* reg: LSHI4(reg,reg) */
	case 249: /* reg: MULF4(reg,reg) */
	case 248: /* reg: MULU4(reg,reg) */
	case 247: /* reg: MULI4(reg,reg) */
	case 246: /* reg: MODU4(reg,reg) */
	case 245: /* reg: MODI4(reg,reg) */
	case 244: /* reg: DIVF4(reg,reg) */
	case 243: /* reg: DIVU4(reg,reg) */
	case 242: /* reg: DIVI4(reg,reg) */
	case 241: /* reg: SUBF4(reg,reg) */
	case 240: /* reg: SUBP4(reg,reg) */
	case 239: /* reg: SUBU4(reg,reg) */
	case 238: /* reg: SUBI4(reg,reg) */
	case 237: /* reg: SUBP4(reg,coni) */
	case 236: /* reg: SUBU4(reg,coni) */
	case 235: /* reg: SUBI4(reg,coni) */
	case 234: /* reg: BXORU4(reg,reg) */
	case 233: /* reg: BXORI4(reg,reg) */
	case 232: /* reg: BORU4(reg,reg) */
	case 231: /* reg: BORI4(reg,reg) */
	case 230: /* reg: BANDU4(reg,reg) */
	case 229: /* reg: BANDI4(reg,reg) */
	case 228: /* reg: ADDF4(reg,reg) */
	case 227: /* reg: ADDP4(reg,reg) */
	case 226: /* reg: ADDU4(reg,reg) */
	case 225: /* reg: ADDI4(reg,reg) */
	case 224: /* reg: ADDP4(reg,coni) */
	case 223: /* reg: ADDU4(reg,coni) */
	case 222: /* reg: ADDI4(reg,coni) */
	case 173: /* stmt: ASGNP4(reg,reg) */
	case 172: /* stmt: ASGNF4(reg,reg) */
	case 171: /* stmt: ASGNU4(reg,reg) */
	case 170: /* stmt: ASGNU2(reg,reg) */
	case 169: /* stmt: ASGNU1(reg,reg) */
	case 168: /* stmt: ASGNI4(reg,reg) */
	case 167: /* stmt: ASGNI2(reg,reg) */
	case 166: /* stmt: ASGNI1(reg,reg) */
	case 165: /* stmt: ASGNP4(addrl32,reg) */
	case 164: /* stmt: ASGNF4(addrl32,reg) */
	case 163: /* stmt: ASGNU4(addrl32,reg) */
	case 162: /* stmt: ASGNU2(addrl32,reg) */
	case 161: /* stmt: ASGNU1(addrl32,reg) */
	case 160: /* stmt: ASGNI4(addrl32,reg) */
	case 159: /* stmt: ASGNI2(addrl32,reg) */
	case 158: /* stmt: ASGNI1(addrl32,reg) */
	case 157: /* stmt: ASGNP4(addrl16,reg) */
	case 156: /* stmt: ASGNF4(addrl16,reg) */
	case 155: /* stmt: ASGNU4(addrl16,reg) */
	case 154: /* stmt: ASGNU2(addrl16,reg) */
	case 153: /* stmt: ASGNU1(addrl16,reg) */
	case 152: /* stmt: ASGNI4(addrl16,reg) */
	case 151: /* stmt: ASGNI2(addrl16,reg) */
	case 150: /* stmt: ASGNI1(addrl16,reg) */
	case 149: /* stmt: ASGNP4(special,conli) */
	case 148: /* stmt: ASGNF4(special,conli) */
	case 147: /* stmt: ASGNU4(special,conli) */
	case 146: /* stmt: ASGNU2(special,conli) */
	case 145: /* stmt: ASGNU1(special,conli) */
	case 144: /* stmt: ASGNI4(special,conli) */
	case 143: /* stmt: ASGNI2(special,conli) */
	case 142: /* stmt: ASGNI1(special,conli) */
	case 141: /* stmt: ASGNP4(special,reg) */
	case 140: /* stmt: ASGNF4(special,reg) */
	case 139: /* stmt: ASGNU4(special,reg) */
	case 138: /* stmt: ASGNU2(special,reg) */
	case 137: /* stmt: ASGNU1(special,reg) */
	case 136: /* stmt: ASGNI4(special,reg) */
	case 135: /* stmt: ASGNI2(special,reg) */
	case 134: /* stmt: ASGNI1(special,reg) */
	case 133: /* stmt: ASGNP4(addrg,reg) */
	case 132: /* stmt: ASGNF4(addrg,reg) */
	case 131: /* stmt: ASGNU4(addrg,reg) */
	case 130: /* stmt: ASGNU2(addrg,reg) */
	case 129: /* stmt: ASGNU1(addrg,reg) */
	case 128: /* stmt: ASGNI4(addrg,reg) */
	case 127: /* stmt: ASGNI2(addrg,reg) */
	case 126: /* stmt: ASGNI1(addrg,reg) */
		kids[0] = LEFT_CHILD(p);
		kids[1] = RIGHT_CHILD(p);
		break;
	case 295: /* stmt: ASGNU4(special,RSHU4(INDIRU4(special),reg)) */
	case 294: /* stmt: ASGNI4(special,RSHI4(INDIRI4(special),reg)) */
	case 293: /* stmt: ASGNU4(special,RSHU4(INDIRU4(special),conli)) */
	case 292: /* stmt: ASGNI4(special,RSHI4(INDIRI4(special),conli)) */
	case 291: /* stmt: ASGNU4(special,RSHU4(INDIRU4(special),coni)) */
	case 290: /* stmt: ASGNI4(special,RSHI4(INDIRI4(special),coni)) */
	case 289: /* stmt: ASGNU4(special,LSHU4(INDIRU4(special),reg)) */
	case 288: /* stmt: ASGNI4(special,LSHI4(INDIRI4(special),reg)) */
	case 287: /* stmt: ASGNU4(special,LSHU4(INDIRU4(special),conli)) */
	case 286: /* stmt: ASGNI4(special,LSHI4(INDIRI4(special),conli)) */
	case 285: /* stmt: ASGNU4(special,LSHU4(INDIRU4(special),coni)) */
	case 284: /* stmt: ASGNI4(special,LSHI4(INDIRI4(special),coni)) */
	case 283: /* stmt: ASGNU4(special,SUBU4(INDIRU4(special),reg)) */
	case 282: /* stmt: ASGNI4(special,SUBI4(INDIRI4(special),reg)) */
	case 281: /* stmt: ASGNU4(special,SUBU4(INDIRU4(special),conli)) */
	case 280: /* stmt: ASGNI4(special,SUBI4(INDIRI4(special),conli)) */
	case 279: /* stmt: ASGNU4(special,SUBU4(INDIRU4(special),coni)) */
	case 278: /* stmt: ASGNI4(special,SUBI4(INDIRI4(special),coni)) */
	case 277: /* stmt: ASGNU4(special,ADDU4(INDIRU4(special),reg)) */
	case 276: /* stmt: ASGNI4(special,ADDI4(INDIRI4(special),reg)) */
	case 275: /* stmt: ASGNU4(special,ADDU4(INDIRU4(special),conli)) */
	case 274: /* stmt: ASGNI4(special,ADDI4(INDIRI4(special),conli)) */
	case 273: /* stmt: ASGNU4(special,SUBU4(INDIRU4(special),coni)) */
	case 272: /* stmt: ASGNI4(special,SUBI4(INDIRI4(special),coni)) */
	case 271: /* stmt: ASGNU4(special,BXORU4(INDIRU4(special),reg)) */
	case 270: /* stmt: ASGNI4(special,BXORI4(INDIRI4(special),reg)) */
	case 269: /* stmt: ASGNU4(special,BXORU4(INDIRU4(special),conli)) */
	case 268: /* stmt: ASGNI4(special,BXORI4(INDIRI4(special),conli)) */
	case 267: /* stmt: ASGNU4(special,BORU4(INDIRU4(special),reg)) */
	case 266: /* stmt: ASGNI4(special,BORI4(INDIRI4(special),reg)) */
	case 265: /* stmt: ASGNU4(special,BORU4(INDIRU4(special),conli)) */
	case 264: /* stmt: ASGNI4(special,BORI4(INDIRI4(special),conli)) */
	case 263: /* stmt: ASGNU4(special,BANDU4(INDIRU4(special),reg)) */
	case 262: /* stmt: ASGNI4(special,BANDI4(INDIRI4(special),reg)) */
	case 261: /* stmt: ASGNU4(special,BANDU4(INDIRU4(special),conli)) */
	case 260: /* stmt: ASGNI4(special,BANDI4(INDIRI4(special),conli)) */
		kids[0] = LEFT_CHILD(p);
		kids[1] = LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(p)));
		kids[2] = RIGHT_CHILD(RIGHT_CHILD(p));
		break;
	case 339: /* stmt: ASGNB(reg,INDIRB(reg)) */
		kids[0] = LEFT_CHILD(p);
		kids[1] = LEFT_CHILD(RIGHT_CHILD(p));
		break;
	default:
		fatal("_kids", "Bad rule number %d\n", eruleno);
	}
}


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
           //print ("' extern volatile %s\n", p->syms[0]->name);
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
      //print ("' %d (%s) is a power of 2\n", i, p->syms[0]->name);
      return 1;
   }
   else {
      //print ("' %d (%s) is not a power of 2\n", i, p->syms[0]->name);
      return 0;
   }
}

static int power_of_2_greater_than_31(Node p) {
   long unsigned int i = strtoul(p->syms[0]->name, NULL, 0);
   if ((i > 31) && ((i & (~i + 1)) == i)) {
      //print ("' %d (%s) is a power of 2 and > 31\n", i, p->syms[0]->name);
      return 1;
   }
   else {
      //print ("' %d (%s) is not a power of 2 and > 31\n", i, p->syms[0]->name);
      return 0;
   }
}

static int in_place_special(Node p) {
  char *vreg0;
  char *vreg1;
  char *name0; 
  char *name1;

  // not sure exactly how much of this checking is necessary, but ...

  if (p->kids[0] 
  &&  p->kids[0]->kids[0]
  &&  p->kids[0]->kids[0]->syms[0] 
  &&  p->kids[0]->kids[0]->syms[0]->name 
  &&  p->kids[0]->kids[0]->syms[0]->u.t.cse
  &&  p->kids[0]->kids[0]->syms[0]->u.t.cse->syms[0]
  &&  p->kids[0]->kids[0]->syms[0]->u.t.cse->syms[0]->name
  &&  p->kids[1] 
  &&  p->kids[1]->kids[0]
  &&  p->kids[1]->kids[0]->kids[0] 
  &&  p->kids[1]->kids[0]->kids[0]->kids[0]
  &&  p->kids[1]->kids[0]->kids[0]->kids[0]->syms[0]
  &&  p->kids[1]->kids[0]->kids[0]->kids[0]->syms[0]->name
  &&  p->kids[1]->kids[0]->kids[0]->kids[0]->syms[0]->u.t.cse
  &&  p->kids[1]->kids[0]->kids[0]->kids[0]->syms[0]->u.t.cse->syms[0]
  &&  p->kids[1]->kids[0]->kids[0]->kids[0]->syms[0]->u.t.cse->syms[0]->name) {

     vreg0 = p->kids[0]->kids[0]->syms[0]->name;
     vreg1 = p->kids[1]->kids[0]->kids[0]->kids[0]->syms[0]->name;

     //print("vreg 0 = %s\n", vreg0);
     //print("vreg 1 = %s\n", vreg1);

     name0 = p->kids[0]->kids[0]->syms[0]->u.t.cse->syms[0]->name;
     name1 = p->kids[1]->kids[0]->kids[0]->kids[0]->syms[0]->u.t.cse->syms[0]->name;

     //print("name 0 = %s\n", name0);
     //print("name 1 = %s\n", name1);

     if (strcmp(vreg0, vreg1) == 0) {

        // statement of form x = x op y (or x op= y), so see if x is special
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
   ty->x.printed = 1;
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
   if (brace == '{')
      while (*p)
         my_stabsym(*p++);
    int lab = genlabel(1);
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

   // default debug path is current working directory
   getcwd(debug_path, sizeof debug_path);
#ifdef DEBUG_IN_OUTPUT_PATH   
   // now look for any overriding '-o', and (if found) extract the output path
   for (i = 0; i < argc; i++) {
      // search for any '-o' option
      if (strncmp (argv[i], "-o", 2) == 0) {
         if (strlen(argv[i]) == 2) {
            // use next arg
            strncpy(debug_path, (argv[++i]), MAX_PATHNAME_LENGTH);
         }
         else {
            // use remainder of this arg
            strncpy(debug_path, &argv[i][2], MAX_PATHNAME_LENGTH);
         }
         // we use only the directory portion - i.e. remove the final filename
         for (j = strlen(debug_path) - 1; j > 0; j--) {
            if (debug_path[j] == PATH_SEPARATOR) {
               debug_path[j + 1] = '\0';
               break;
            }
         }
         if (j == 0) {
            // no directory portion specified 
            debug_path[0] = '\0';
         }
         break;
      }
   }
#endif   
   len = strlen(debug_path); 
   if (debug_path[0] == '\"') {
      // remove leading quote
      for (i = 0; i < len - 1; i++) {
         debug_path[i] = debug_path[i + 1];
      }
      debug_path[i] = '\0';
      len--;
   }
   if ((len  > 0) && debug_path[len - 1] != PATH_SEPARATOR) {
      // add terminating path separator
      debug_path[len] = PATH_SEPARATOR;
      debug_path[len + 1] = '\0';
      len++;
   }
#ifdef DIAGNOSTIC 
   fprintf(stderr, "debug_path = %s\n", debug_path);
#endif   

   // default debug filename is current filename, but with the
   // '.c' extension replaced with '.debug'
   strncpy (debug_filename, file, MAX_PATHNAME_LENGTH);
   len = strlen(debug_filename);
   if ((len > 2) && strcmp(&debug_filename[len-2],".c") == 0) {
      debug_filename[len-2]='\0';
   }
   strcat(debug_filename,".debug");
   if (debug_file != NULL) {
      fclose(debug_file);
   }
   // use only filename portion - i.e. find last path separator
   for (j = strlen(debug_filename) - 1; j > 0; j--) {
      if (debug_filename[j] == PATH_SEPARATOR) {
         j++;
         break;
      }
   }

   // combine output path name with debug filename
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
      printf("%s%s_text0\n\n", stabprefix, stablabel, N_SO);
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
   if (cp->file && (currentfile == NULL || strcmp(currentfile, cp->file) != 0)) {
      prevline = 0;
   }
   if (cp->y != prevline) {
#ifdef ALIGN_LINES_LONG_FOR_DEBUG
      if (glevel > 0) {
         // when debugging all lines must start long aligned
         print(" alignl ' align long - line %d\n", prevline = cp->y);
      }
      else {
         print("' line %d\n", prevline = cp->y);
      }
#else
      print("' line %d\n", prevline = cp->y);
#endif
   }

   if (cp->file && cp->file != currentfile) {
      int lab = genlabel(1);
      fprintf(debug_file, ".stabs \"%s\",0x%x,0,0,%s%d\n", cp->file, N_SOL, stabprefix, lab);
      printf("%s%d\n\n", stabprefix, lab);
      currentfile = cp->file;
   }
   int lab = genlabel(1);
   fprintf(debug_file, ".stabn 0x%x,0,%d,%s%s_%d-%s\n", N_SLINE, cp->y,
      stabprefix, stablabel, lab, cfunc->x.name);
   printf("%s%s_%d\n\n", stabprefix, stablabel, lab);
}

/* my_stabsym - output a stab entry for symbol p */
void my_stabsym(Symbol p) {
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
      //fltreg[i] = mkreg("r%d", i, 1, FREG); // Catalina 3.7
   }
   intregw = mkwildcard(intreg);
   // fltregw = mkwildcard(fltreg); // Catalina 3.7

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
      //return fltregw; in Catalina 3.7, all registers are allocated from intregw, but can be used for floats as well
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

// NOTE: Target always uses intreg, even for targets that take or
// return floats - this is NOT AN ERROR - there is in fact only one
// set of registers, and r0 and r1 can be used for both floats and
// integer values - but we don't want LCC to think it can use the
// intregs and not corrupt the fltregs, so we always use the intregs
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
            //rtarget(p, 0, intreg[0]);
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
      //spill(INTRET, IREG, p);
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

#ifdef __CATALINA__

char * strdup(const char *str) {
   if (str != NULL) {
      register char *copy = malloc(strlen(str) + 1);
      if (copy != NULL)
         return strcpy(copy, str);
   }
   return NULL;
}

#endif

extern int last_dst;
extern int last_src;

/* do trivial peephole optimization to eliminate unnecessary mov instructions */
static void move_if_required (char *dst, char *src, char *comment) {
   int this_dst;
   int this_src;
   sscanf(src, "r%d", &this_src);
   sscanf(dst, "r%d", &this_dst);
   if (this_dst == this_src) {
      // no move is required
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
      // no move is required
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
      // don't clobber r0
      move_if_required("r1", op2, "setup r0/r1 (1)");
      move_if_required_2("r0", op1, "setup r0/r1 (1)");
   }
   else {
      // safe to clobber r0
      move_if_required("r0", op1, "setup r0/r1 (2)");
      move_if_required_2("r1", op2, "setup r0/r1 (2)");
   }
}

#ifdef SUPPORT_PASM
// determine if this ARG is being generated preparatory 
// to calling an PASM function
static int is_arg_to_PASM(Node p) {
   int op;
   Node q = p;

   // find the call node we are argument for
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
// determine if this ARG is being generated preparatory to call a 
// variadic function (only supports ANSI style variadics)
static int is_arg_to_variadic(Node p) {
   int op;
   Node q = p;

   // find the call node we are argument for
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
         print(" alignl ' align long\n%s\n", r->x.name);
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

#ifndef REG_PASSING
      spsize = p->syms[0]->u.c.v.u;
#endif

#ifdef NO_CPREP // don't use CPREP instruction!

#ifdef OLD_VARIADIC
      if (p->syms[0]->u.c.v.u < I16A_MOVI_SIZE) {
         print(" word I16A_MOVI + BC<<D16A + %d<<S16A ' arg size, rpsize = %d, spsize = %d\n", p->syms[0]->u.c.v.u, rpsize, spsize);
      }
      else if (p->syms[0]->u.c.v.u < I32_MOVI_SIZE) {
         print(" alignl ' align long\n long I32_MOVI + BC<<D32 + %d<<S32 ' arg size, rpsize = %d, spsize = %d\n", p->syms[0]->u.c.v.u, rpsize, spsize);
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
            print(" alignl ' align long\n long I32_LODA + %d<<S32\n word I16A_SUB + SP<<D16A + RI<<S16A ' stack space for reg ARGs\n", rpsize - 4);
         }
      }

#else

      if ((spsize > 0) && (rpsize == 0)) {
#ifdef OLD_VARIADIC
         if (p->syms[0]->u.c.v.u < I16A_MOVI_SIZE) {
            print(" word I16A_MOVI + BC<<D16A + %d<<S16A ' arg size, rpsize = %d, spsize = %d\n", p->syms[0]->u.c.v.u, rpsize, spsize);
         }
         else if (p->syms[0]->u.c.v.u < I32_MOVI_SIZE) {
            print(" alignl ' align long\n long I32_MOVI + BC<<D32 + %d<<S32 ' arg size, rpsize = %d, spsize = %d\n", p->syms[0]->u.c.v.u, rpsize, spsize);
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
                  print(" alignl ' align long\n long I32_CPREP + %d<<D32 + %d<<S32 ' arg size, rpsize = %d, spsize = %d\n", p->syms[0]->u.c.v.u, rpsize - 4, rpsize, spsize);
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
                  print(" alignl ' align long\n long I32_MOVI + BC<<D32 + %d<<S32 ' arg size, rpsize = %d, spsize = %d\n", p->syms[0]->u.c.v.u, rpsize, spsize);
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
               print(" alignl ' align long\n long I32_MOVI + BC<<D32 + %d<<S32 ' arg size, rpsize = %d, spsize = %d\n", p->syms[0]->u.c.v.u, rpsize, spsize);
            }
            else {
               print(" ERROR !!!!\n");
            }
#endif      
            print(" alignl ' align long\n long I32_LODA + %d<<S32\n word I16A_SUB + SP<<D16A + RI<<S16A ' stack space for reg ARGs\n", rpsize - 4);
         }
      }

#endif // NO_CPREP

      if  (generic(kop) == ADDRG) {
#ifdef DIAGNOSTIC
         print("' CALL case 1\n");
#endif
         assert(kp->syms[0] && kp->syms[0]->x.name);
         src = kp->syms[0]->x.name;
         if (spsize <= 4) {
            print(" alignl ' align long\n long I32_CALA + (@%s)<<S32 ' CALL addrg\n", src);
         }
         else if (spsize < I16A_MOVI_SIZE + 4) {
            print(" alignl ' align long\n long I32_CALA + (@%s)<<S32\n word I16A_ADDI + SP<<D16A + %d<<S16A ' CALL addrg\n", src, spsize - 4);   
         }
         else {
            print(" alignl ' align long\n long I32_CALA + (@%s)<<S32\n alignl ' align long\n long I32_LODA + %d<<S32\n word I16A_ADD + SP<<D16A + RI<<S16A ' CALL addrg\n", src, spsize - 4);   
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
            print(" word I16A_MOV + RI<<D16A + (%s)<<S16A\n word I16B_CALI' CALL indirect\n alignl ' align long\n", src); 
         }
         else if (spsize < I16A_MOVI_SIZE + 4) {
            print(" word I16A_MOV + RI<<D16A + (%s)<<S16A\n word I16B_CALI\n alignl ' align long\n word I16A_ADDI + SP<<D16A + %d<<S16A ' CALL indirect\n", src, spsize - 4); 
         }
         else {
            print(" word I16A_MOV + RI<<D16A + (%s)<<S16A\n word I16B_CALI\n alignl ' align long\n long I32_LODA + %d<<S32\n word I16A_ADD + SP<<D16A + RI<<S16A ' CALL indirect\n", src, spsize - 4); 
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
      q = argreg(p->x.argno);   // use reg arg if possible
#else      
      if (is_arg_to_variadic(p)) {
         q = NULL; // variadics always use stack args
      }
      else {
         q = argreg(p->x.argno);   // use reg arg if possible
      }
#endif      
#else
      q = NULL;   // always use stack arg
#endif
#ifdef DIAGNOSTIC
      dumptree(p);
#endif
      kp = (p->kids[0]);
      assert(kp);
      kop = kp->op;

#ifdef SUPPORT_PASM
      if (is_arg_to_PASM(p)) {
         if  (generic(kop) == ADDRG) {
            assert(kp->syms[0] && kp->syms[0]->x.name);
            src = kp->syms[0]->x.name;
            kp->syms[0]->pasm_ref += 1.0;
            print("' loading argument %s to PASM eliminated\n", src);
            Symbol s = findconst(src);
            if ((s!= NULL) && (s->sclass == STATIC)) {
               print("'START PASM ... \n %s\n'... END PASM\n", s->name);
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
               print(" alignl ' align long\n long I32_LODA + (%s)<<S32 \n word I16A_SUB + SP<<D16A + RI<<S16A ' stack space for reg ARGs\n", rpsize);
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
               print(" alignl ' align long\n long I32_MOVI + RI<<D32 + (%s)<<S32\n word I16B_PSHL ' stack ARG coni\n", src);
            }
            else if ((isint(r->type) || isunsigned(r->type))
            &&       (r->u.c.v.i >= I32_LODS_MIN) && (r->u.c.v.i <= I32_LODS_MAX)) {
               print(" alignl ' align long\n long I32_LODS + RI<<D32S + ((%s)&$7FFFF)<<S32\n word I16B_PSHL ' stack ARG cons\n", src);
            }
            else {
               print(" word I16B_LODL + RI<<D16B\n alignl ' align long\n long %s\n word I16B_PSHL ' stack ARG con\n", src);
            }
         }
         else if  (generic(kop) == ADDRG) {
#ifdef DIAGNOSTIC            
            print ("' ARG case 1\n");
#endif
            assert(kp->syms[0] && kp->syms[0]->x.name);
            src = kp->syms[0]->x.name;
            print(" alignl ' align long\n long I32_LODA + (@%s)<<S32\n word I16B_PSHL ' stack ARG ADDRG\n", src); 
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
               print(" alignl ' align long\n long I32_LODF + ((%s)&$FFFFFF)<<S32\n word I16B_PSHL ' stack ARG ADDRL\n", src); 
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
               print(" alignl ' align long\n long I32_LODF + ((%s)&$FFFFFF)<<S32\n word I16B_PSHL ' stack ARG ADDRF\n", src); 
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
               print(" alignl ' align long\n long I32_PSHA + (@%s)<<S32 ' stack ARG INDIR ADDRG\n", src); 
            }
            else if (generic(kkop) == ADDRL) {
#ifdef DIAGNOSTIC            
               print ("' ARG case INDIR 2a\n");
#endif
               assert(kkp->syms[0] && kkp->syms[0]->x.name);
               src = kkp->syms[0]->x.name;
               offs = kkp->syms[0]->x.offset;
               print(" alignl ' align long\n long I32_PSHF + ((%s)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRL\n", src); 
            }
            else if (generic(kkop) == ADDRF) {
#ifdef DIAGNOSTIC            
               print ("' ARG case INDIR 2b\n");
#endif
               assert(kkp->syms[0] && kkp->syms[0]->x.name);
               src = kkp->syms[0]->x.name;
               offs = kkp->syms[0]->x.offset;
               print(" alignl ' align long\n long I32_PSHF + ((%s)&$FFFFFF)<<S32 ' stack ARG INDIR ADDRF\n", src); 
            }
            else if (kkop == VREG+P) {
#ifdef DIAGNOSTIC            
               print ("' ARG case INDIR 6\n");
#endif
               // check for common subexpressions - see pp 384
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
                        print(" alignl ' align long\n long I32_MOVI + RI<<D32 + (%s)<<S32\n word I16B_PSHL ' stack ARG coni\n", src);
                     }
                     else if ((isint(r->type) || isunsigned(r->type))
                     &&       (r->u.c.v.i >= I32_LODS_MIN) && (r->u.c.v.i <= I32_LODS_MAX)) {
                        print(" alignl ' align long\n long I32_LODS + RI<<D32S + ((%s)&$7FFFF)<<S32\n word I16B_PSHL ' stack ARG cons\n", src);
                     }
                     else {
                        print(" word I16B_LODL + RI<<D16B\n alignl ' align long\n long %s\n word I16B_PSHL ' stack ARG con\n", src);
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
                  // NOTE: INDIRx(VREGP) is a register read, not an indirect read
                  // print(" rdlong RI, %s\n jmp #PSHL ' stack ARG\n", src);
                  print(" word I16A_MOV + RI<<D16A + (%s)<<S16A\n word I16B_PSHL ' stack ARG\n", src);
               }
            }
            else {
               // for anything not matched yet, assume the result is in the node's target register
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
               print(" alignl ' align long\n long I32_MOVI + (%s)<<D32 + (%s)<<S32 ' reg ARG coni\n", q->name, src);
            }
            else if ((isint(r->type) || isunsigned(r->type))
            &&       (r->u.c.v.i >= I32_LODS_MIN) && (r->u.c.v.i <= I32_LODS_MAX)) {
               print(" alignl ' align long\n long I32_LODS + (%s)<<D32S + ((%s)&$7FFFF)<<S32 ' reg ARG cons\n", q->name, src);
            }
            else {
               print(" word I16B_LODL + (%s)<<D16B\n alignl ' align long\n long %s ' reg ARG con\n", q->name, src);
            }
         }
         else if  (generic(kop) == ADDRG) {
#ifdef DIAGNOSTIC            
            print ("' ARG case 1\n");
#endif
            assert(kp->syms[0] && kp->syms[0]->x.name);
            src = kp->syms[0]->x.name;
            print(" word I16B_LODL + (%s)<<D16B\n alignl ' align long\n long @%s ' reg ARG ADDRG\n", q->name, src); 
            //print(" alignl ' align long\n long I32_LODS + (%s)<<D32S + ((@%s)&$7FFFF)<<S32 ' reg ARG ADDRG !!!TBD !!! MUST USE LODL FOR XMM!!!\n", q->name, src); 
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
               print(" alignl ' align long\n long I32_LODF + ((%s)&$FFFFFF)<<S32 \n word I16A_MOV + (%s)<<D16A + RI<<S16A ' reg ARG ADDRL\n", src, q->name); 
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
               print(" alignl ' align long\n long I32_LODF + ((%s)&$FFFFFF)<<S32\n word I16A_MOV + (%s)<<D16A + RI<<S16A ' reg ARG ADDRF\n", src, q->name); 
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
               print(" alignl ' align long\n long I32_LODI + (@%s)<<S32\n word I16A_MOV + (%s)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG\n", src, q->name); 
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
                  print(" alignl ' align long\n long I32_LODF + ((%s)&$FFFFFF)<<S32\n word I16A_RDLONG + (%s)<<D16A + RI<<S16A ' reg ARG INDIR ADDRL\n", src, q->name); 
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
                  print(" alignl ' align long\n long I32_LODF + ((%s)&$FFFFFF)<<S32\n word I16A_RDLONG + (%s)<<D16A + RI<<S16A ' reg ARG INDIR ADDRF\n", src, q->name); 
               }
            }
            else {
#ifdef DIAGNOSTIC            
               print ("' ARG case INDIR 6\n");
#endif
               // do nothing - argument should have been targeted to correct register already
            }
         }
         else {
#ifdef DIAGNOSTIC            
            print ("' ARG case 6\n");
#endif
            // do nothing - argument should have been targeted to correct register already
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
      print(" alignl ' align long\n long I32_CPYB + %d<<S32 ' ASGNB\n", size); 
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
            print(" alignl ' align long\n long I32_LODS + RI<<D32S + ((%s)&$7FFFF)<<S32\n word I16A_SUB + SP<<D16A + RI<<S16A ' stack space for reg ARGs\n", rpsize);
         }
         else {
            print(" word I16B_LODL + RI<<D16B\n alignl ' align long\n long %d\n word I16A_SUB + SP<<D16A + RI<<S16A ' stack space for reg ARGs\n", rpsize);
         }
         rpsize = 0;
      }
      print(" alignl ' align long\n long I32_PSHB + %d<<S32 ' ARGB\n", size);
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
      print(" word I16B_FLTP + FCMP<<S16B\n alignl ' align long\n long I32_BR_Z + (@%s)<<S32 ' EQF4\n", p->syms[0]->x.name);
   }
   else if (op == NE+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" word I16B_FLTP + FCMP<<S16B\n alignl ' align long\n long I32_BRNZ + (@%s)<<S32 ' NEF4\n", p->syms[0]->x.name);
   }
   else if (op == GE+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" word I16B_FLTP + FCMP<<S16B\n alignl ' align long\n long I32_BRAE + (@%s)<<S32 ' GEF4\n", p->syms[0]->x.name);
   }
   else if (op == GT+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" word I16B_FLTP + FCMP<<S16B\n alignl ' align long\n long I32_BR_A + (@%s)<<S32 ' GTF4\n", p->syms[0]->x.name);
   }
   else if (op == LE+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" word I16B_FLTP + FCMP<<S16B\n alignl ' align long\n long I32_BRBE + (@%s)<<S32 ' LEF4\n", p->syms[0]->x.name);
   }
   else if (op == LT+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" word I16B_FLTP + FCMP<<S16B\n alignl ' align long\n long I32_BR_B + (@%s)<<S32 ' LTF4\n", p->syms[0]->x.name);
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
   // arguments 0 .. NUM_PASSING_REGS - 1 (in order of being pushed) may use registers 
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
   unsigned saveimask;
   unsigned savefmask;

#ifdef REG_PASSING
   Symbol r;
#endif

   usedmask[0] = usedmask[1] = 0;
   freemask[0] = freemask[1] = ~(unsigned)0;

   args_in_frame = 0;

   offset = maxoffset = maxargoffset = 0;

   print("\n alignl ' align long\n%s ' <symbol:%s>\n", f->x.name, f->name);
#ifdef PRINT_SYMBOL_INFO
   fprintf(stderr,"\nfunction %s\n", f->x.name);
#endif

   ismain = (strcmp(f->x.name,"C_main") == 0);

   if (ismain && (variadic(f->type))) {
      error("main function cannot be variadic");
   }   

   offset = 8; // leave space for PC & FP

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
      ; // just count the number of parameters
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

   offset = maxoffset = 0;

   gencode(caller, callee);

#ifdef DIAGNOSTIC
   printf("' POST-GENCODE OFFSET=%d, MAXOFFSET=%d, MAXARGOFFSET=%d\n", offset, maxoffset, maxargoffset);
#endif

#ifdef DIAGNOSTIC
   printf("' USEDMASK[IREG]=%lx\n", usedmask[IREG]);
   printf("' USEDMASK[FREG]=%lx\n", usedmask[FREG]);
#endif
   //saveimask = usedmask[IREG] & INTVAR; /* modified to the line below since it seems necessary to save temp registers as well (???) */
   saveimask = usedmask[IREG] & (INTVAR|INTTMP);
   savefmask = usedmask[FREG] & (FLTVAR|FLTTMP);
   framesize = roundup(maxoffset, 4);

#ifdef DIAGNOSTIC
   printf("' PRE-FRAMESIZE=%d\n", framesize);
#endif

   if ((framesize > 0) || args_in_frame || varargs || (glevel > 1)) {
#ifdef REG_PASSING            
      if (ismain) {
         // main does not get called the normal way - so simulate it
         printf(" word I16A_MOVI + RI<<D16A + 8<<S16A\n word I16A_SUB + SP<<D16A + RI<<S16A\n");
#ifdef OLD_VARIADIC
         printf(" word I16A_MOVI + BC<<D16A + 8<<S16A\n");
#endif
      }
#endif         
      print(" alignl ' align long\n long I32_NEWF + %d<<S32\n", framesize);
   }
   if (ismain) {
      print ("#ifdef libthreads\n");
      print (" alignl ' align long\n long I32_CALA + @C_thread_setup<<S32\n");
      print ("#endif\n");
      print ("#ifndef NO_ARGS\n");
      print (" alignl ' align long\n long I32_CALA + @C_arg_setup<<S32\n");
      print ("#endif\n");
      if (glevel > 0) {
         print (" alignl ' align long\n long I32_CALA + @C_debug_init<<S32\n");
      }
   }
   else {
#ifdef DIAGNOSTIC
      printf("' SAVEMASK=%x\n", (saveimask | savefmask) & 0xfffffe);
#endif
      if (((saveimask | savefmask) & 0xfffffe) != 0) {
         print (" alignl ' align long\n long I32_PSHM + $%x<<S32 ' save registers\n", (saveimask | savefmask) & 0xfffffe);
      }
   }
#ifdef REG_PASSING
   if (varargs) {
#ifdef OLD_VARIADIC      
      // variadic functions must spill all reg arguments to stack, even if the
      // caller doesn't use all the possible reg arguments - but we must be
      // careful to only use the available space - i.e. from FP + 8 to BC
      // ensure there is enough space to do this!
      print(" word I16B_LODF + 8<<S16B\n");
      for (i = 0; i < NUM_PASSING_REGS; i++) {
         print(" alignl ' align long\n long I32_SPILL + r%d<<D32 ' spill reg (varadic)\n", FIRST_PASSING_REG + i);
      }
#endif      
   }
   else {
      // non-variadic functions may need to spill individual arguments, and in any case will
      // usually need to map registers used to pass arguments to registers used in the function
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
                    print(" alignl ' align long\n long I32_LODF + ((%d)&$FFFFFF)<<S32\n word I16A_WRLONG + (%s)<<D16A + RI<<D16A ' spill reg\n", out->x.offset, ins);
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
      // main routine never returns - if it never even exits, define 
      // NO_EXIT to disable the generation of the jump to exit.
      print("#ifndef NO_EXIT\n");
      print(" alignl ' align long\n long I32_JMPA + (@C__exit)<<S32\n");
      print("#endif\n");
   }
   else {
#ifdef DIAGNOSTIC
      printf("' SAVEMASK=%x\n", (saveimask | savefmask) & 0xfffffe);
#endif
      if ((framesize > 0) || args_in_frame || varargs || (glevel > 1)) {
         if (framesize/4 < I16B_POPM_SIZE) {
            if (((saveimask | savefmask) & 0xfffffe) != 0) {
               print (" word I16B_POPM + %d<<S16B ' restore registers, do pop frame, do return\n", framesize/4);
            }
            else {
               print(" word I16B_RETF + %d<<S32\n", framesize);
            }
         }
         else {
            if (((saveimask | savefmask) & 0xfffffe) != 0) {
               print (" word I16B_POPM + $180<<S16B ' restore registers, do not pop frame, do not return\n");
            }
            print(" alignl ' align long\n long I32_RETF + %d<<S32\n", framesize);
         }
      }
      else {
         if (((saveimask | savefmask) & 0xfffffe) != 0) {
            print (" word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return\n");
         }
         else {
            print(" word I16B_RETN\n alignl ' align long\n");
         }
      }
   }
   // after each function, ensure we are long aligned
   print(" alignl ' align long\n");

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

   // "C_" prefix is used for disambiguation with PASM or SPIN symbols
#ifdef PRINT_SYMBOL_INFO
   fprintf(stderr,"Defining Symbol %s\n", p->name);
#endif
   if (p->scope >= LOCAL && p->sclass == STATIC) {
      p->x.name = strdup(mangled_name((cfunc?cfunc->x.name:"C"), p->name, 1));
   }
   if (p->scope >= GLOBAL && p->sclass == STATIC) {
      // TODO: this may generate the same name for different statics in 
      // different files, which would result in the symbol being multiply
      // defined. One solution would be to use the filename, but there is no
      // mechanism in lcc to get the name of the source file without 
      // turning on the generation of symbol table information (i.e. via
      // the -g option to rcc). So currently we use a temporary filename,
      // with further disambiguation provided by including the time of
      // the compile
      tmp_name = tmpnam(NULL);
      strcpy(temp_prefix,"C_");
      j = 2;
      for (i = 0; (i < L_tmpnam) && (tmp_name[i] != '\0'); i++) {
         if (isalnum(tmp_name[i])) {
            temp_prefix[j++] = tmp_name[i];
         }
      }
      sprintf(temp_now, "_%8lx", now);
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
      // constants are generated 'in line'
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
      print(" long $%x\n", (unsigned)v.p);
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
      segment(CODE);
      print("\n' Catalina Import %s\n", p->name);
      segment(oldseg);
   }
}

static void global(Symbol p) {
   print("\n alignl ' align long\n");
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
   1,        /* mulops_calls */
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
