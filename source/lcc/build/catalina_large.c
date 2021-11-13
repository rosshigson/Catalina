
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
 * MAX_PATHNAME_LENGTH is used to determine the maximum length of the output
 * path to store when trying to figure out where to put debug files.
 */

#define MAX_PATHNAME_LENGTH 1024

/*
 * MAX_NAME_LENGTH is used in deciding when to 'mangle' C names to fit
 * into the maximum label supported by the SPIN compiler used.
 * The value has to be 30 if you want to use the Parallax Propeller Tool.
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

#define INTTMP 0x00555540
#define INTVAR 0x00aaaa80

#define FLTTMP 0x00000000
#define FLTVAR 0x00000000

// #define INTTMP 0x00000fc0 // Catalina 3.7
// #define INTVAR 0x0003f000 // Catalina 3.7

// #define FLTTMP 0x000c0000 // Catalina 3.7
// #define FLTVAR 0x00f00000 // Catalina 3.7

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
static int in_place_special(Node);

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
generated at Fri Oct 29 15:38:52 2021
by $Id: lburg.c 355 2007-02-18 22:08:49Z drh $
*/
static void _kids(NODEPTR_TYPE, int, NODEPTR_TYPE[]);
static void _label(NODEPTR_TYPE);
static int _rule(void*, int);

#define _stmt_NT 1
#define _reg_NT 2
#define _coni_NT 3
#define _con_NT 4
#define _addrli_NT 5
#define _addrfi_NT 6
#define _addrg_NT 7
#define _special_NT 8
#define _addrl_NT 9
#define _regl_NT 10
#define _regg_NT 11
#define _ri_NT 12

static char *_ntname[] = {
	0,
	"stmt",
	"reg",
	"coni",
	"con",
	"addrli",
	"addrfi",
	"addrg",
	"special",
	"addrl",
	"regl",
	"regg",
	"ri",
	0
};

struct _state {
	short cost[13];
	struct {
		unsigned int _stmt:8;
		unsigned int _reg:8;
		unsigned int _coni:3;
		unsigned int _con:4;
		unsigned int _addrli:1;
		unsigned int _addrfi:1;
		unsigned int _addrg:1;
		unsigned int _special:1;
		unsigned int _addrl:2;
		unsigned int _regl:2;
		unsigned int _regg:2;
		unsigned int _ri:2;
	} rule;
};

static short _nts_0[] = { 0 };
static short _nts_1[] = { _reg_NT, 0 };
static short _nts_2[] = { _addrli_NT, 0 };
static short _nts_3[] = { _addrfi_NT, 0 };
static short _nts_4[] = { _addrl_NT, 0 };
static short _nts_5[] = { _addrg_NT, 0 };
static short _nts_6[] = { _special_NT, 0 };
static short _nts_7[] = { _regg_NT, 0 };
static short _nts_8[] = { _regl_NT, 0 };
static short _nts_9[] = { _con_NT, 0 };
static short _nts_10[] = { _coni_NT, 0 };
static short _nts_11[] = { _addrg_NT, _reg_NT, 0 };
static short _nts_12[] = { _special_NT, _reg_NT, 0 };
static short _nts_13[] = { _special_NT, _coni_NT, 0 };
static short _nts_14[] = { _addrl_NT, _reg_NT, 0 };
static short _nts_15[] = { _addrli_NT, _reg_NT, 0 };
static short _nts_16[] = { _addrfi_NT, _reg_NT, 0 };
static short _nts_17[] = { _addrli_NT, _special_NT, 0 };
static short _nts_18[] = { _addrfi_NT, _special_NT, 0 };
static short _nts_19[] = { _reg_NT, _reg_NT, 0 };
static short _nts_20[] = { _ri_NT, 0 };
static short _nts_21[] = { _reg_NT, _coni_NT, 0 };
static short _nts_22[] = { _special_NT, _special_NT, _coni_NT, 0 };
static short _nts_23[] = { _special_NT, _special_NT, _reg_NT, 0 };
static short _nts_24[] = { _reg_NT, _ri_NT, 0 };

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
	_nts_2,	/* 47 */
	_nts_3,	/* 48 */
	_nts_4,	/* 49 */
	_nts_5,	/* 50 */
	_nts_6,	/* 51 */
	_nts_7,	/* 52 */
	_nts_8,	/* 53 */
	_nts_9,	/* 54 */
	_nts_10,	/* 55 */
	_nts_1,	/* 56 */
	_nts_10,	/* 57 */
	_nts_8,	/* 58 */
	_nts_8,	/* 59 */
	_nts_8,	/* 60 */
	_nts_8,	/* 61 */
	_nts_8,	/* 62 */
	_nts_8,	/* 63 */
	_nts_8,	/* 64 */
	_nts_8,	/* 65 */
	_nts_7,	/* 66 */
	_nts_7,	/* 67 */
	_nts_7,	/* 68 */
	_nts_7,	/* 69 */
	_nts_7,	/* 70 */
	_nts_7,	/* 71 */
	_nts_7,	/* 72 */
	_nts_7,	/* 73 */
	_nts_6,	/* 74 */
	_nts_6,	/* 75 */
	_nts_6,	/* 76 */
	_nts_6,	/* 77 */
	_nts_6,	/* 78 */
	_nts_6,	/* 79 */
	_nts_6,	/* 80 */
	_nts_6,	/* 81 */
	_nts_1,	/* 82 */
	_nts_1,	/* 83 */
	_nts_1,	/* 84 */
	_nts_1,	/* 85 */
	_nts_1,	/* 86 */
	_nts_1,	/* 87 */
	_nts_1,	/* 88 */
	_nts_1,	/* 89 */
	_nts_5,	/* 90 */
	_nts_5,	/* 91 */
	_nts_5,	/* 92 */
	_nts_5,	/* 93 */
	_nts_5,	/* 94 */
	_nts_5,	/* 95 */
	_nts_5,	/* 96 */
	_nts_5,	/* 97 */
	_nts_4,	/* 98 */
	_nts_4,	/* 99 */
	_nts_4,	/* 100 */
	_nts_4,	/* 101 */
	_nts_4,	/* 102 */
	_nts_4,	/* 103 */
	_nts_4,	/* 104 */
	_nts_4,	/* 105 */
	_nts_8,	/* 106 */
	_nts_8,	/* 107 */
	_nts_8,	/* 108 */
	_nts_8,	/* 109 */
	_nts_8,	/* 110 */
	_nts_8,	/* 111 */
	_nts_8,	/* 112 */
	_nts_8,	/* 113 */
	_nts_8,	/* 114 */
	_nts_8,	/* 115 */
	_nts_8,	/* 116 */
	_nts_8,	/* 117 */
	_nts_7,	/* 118 */
	_nts_7,	/* 119 */
	_nts_7,	/* 120 */
	_nts_7,	/* 121 */
	_nts_7,	/* 122 */
	_nts_7,	/* 123 */
	_nts_7,	/* 124 */
	_nts_7,	/* 125 */
	_nts_7,	/* 126 */
	_nts_7,	/* 127 */
	_nts_7,	/* 128 */
	_nts_7,	/* 129 */
	_nts_11,	/* 130 */
	_nts_11,	/* 131 */
	_nts_11,	/* 132 */
	_nts_11,	/* 133 */
	_nts_11,	/* 134 */
	_nts_11,	/* 135 */
	_nts_11,	/* 136 */
	_nts_11,	/* 137 */
	_nts_12,	/* 138 */
	_nts_12,	/* 139 */
	_nts_12,	/* 140 */
	_nts_12,	/* 141 */
	_nts_12,	/* 142 */
	_nts_12,	/* 143 */
	_nts_12,	/* 144 */
	_nts_12,	/* 145 */
	_nts_13,	/* 146 */
	_nts_13,	/* 147 */
	_nts_13,	/* 148 */
	_nts_13,	/* 149 */
	_nts_13,	/* 150 */
	_nts_13,	/* 151 */
	_nts_13,	/* 152 */
	_nts_13,	/* 153 */
	_nts_14,	/* 154 */
	_nts_14,	/* 155 */
	_nts_14,	/* 156 */
	_nts_14,	/* 157 */
	_nts_14,	/* 158 */
	_nts_14,	/* 159 */
	_nts_14,	/* 160 */
	_nts_14,	/* 161 */
	_nts_15,	/* 162 */
	_nts_15,	/* 163 */
	_nts_15,	/* 164 */
	_nts_15,	/* 165 */
	_nts_15,	/* 166 */
	_nts_15,	/* 167 */
	_nts_15,	/* 168 */
	_nts_15,	/* 169 */
	_nts_16,	/* 170 */
	_nts_16,	/* 171 */
	_nts_16,	/* 172 */
	_nts_16,	/* 173 */
	_nts_16,	/* 174 */
	_nts_16,	/* 175 */
	_nts_16,	/* 176 */
	_nts_16,	/* 177 */
	_nts_17,	/* 178 */
	_nts_17,	/* 179 */
	_nts_17,	/* 180 */
	_nts_17,	/* 181 */
	_nts_17,	/* 182 */
	_nts_17,	/* 183 */
	_nts_17,	/* 184 */
	_nts_17,	/* 185 */
	_nts_18,	/* 186 */
	_nts_18,	/* 187 */
	_nts_18,	/* 188 */
	_nts_18,	/* 189 */
	_nts_18,	/* 190 */
	_nts_18,	/* 191 */
	_nts_18,	/* 192 */
	_nts_18,	/* 193 */
	_nts_19,	/* 194 */
	_nts_19,	/* 195 */
	_nts_19,	/* 196 */
	_nts_19,	/* 197 */
	_nts_19,	/* 198 */
	_nts_19,	/* 199 */
	_nts_19,	/* 200 */
	_nts_19,	/* 201 */
	_nts_5,	/* 202 */
	_nts_5,	/* 203 */
	_nts_5,	/* 204 */
	_nts_5,	/* 205 */
	_nts_5,	/* 206 */
	_nts_1,	/* 207 */
	_nts_1,	/* 208 */
	_nts_1,	/* 209 */
	_nts_1,	/* 210 */
	_nts_1,	/* 211 */
	_nts_1,	/* 212 */
	_nts_1,	/* 213 */
	_nts_1,	/* 214 */
	_nts_1,	/* 215 */
	_nts_10,	/* 216 */
	_nts_10,	/* 217 */
	_nts_10,	/* 218 */
	_nts_9,	/* 219 */
	_nts_9,	/* 220 */
	_nts_9,	/* 221 */
	_nts_9,	/* 222 */
	_nts_1,	/* 223 */
	_nts_1,	/* 224 */
	_nts_1,	/* 225 */
	_nts_1,	/* 226 */
	_nts_1,	/* 227 */
	_nts_1,	/* 228 */
	_nts_1,	/* 229 */
	_nts_1,	/* 230 */
	_nts_1,	/* 231 */
	_nts_1,	/* 232 */
	_nts_1,	/* 233 */
	_nts_1,	/* 234 */
	_nts_1,	/* 235 */
	_nts_1,	/* 236 */
	_nts_1,	/* 237 */
	_nts_1,	/* 238 */
	_nts_1,	/* 239 */
	_nts_20,	/* 240 */
	_nts_1,	/* 241 */
	_nts_20,	/* 242 */
	_nts_20,	/* 243 */
	_nts_19,	/* 244 */
	_nts_19,	/* 245 */
	_nts_19,	/* 246 */
	_nts_19,	/* 247 */
	_nts_21,	/* 248 */
	_nts_21,	/* 249 */
	_nts_21,	/* 250 */
	_nts_19,	/* 251 */
	_nts_19,	/* 252 */
	_nts_21,	/* 253 */
	_nts_21,	/* 254 */
	_nts_19,	/* 255 */
	_nts_19,	/* 256 */
	_nts_21,	/* 257 */
	_nts_21,	/* 258 */
	_nts_19,	/* 259 */
	_nts_19,	/* 260 */
	_nts_21,	/* 261 */
	_nts_21,	/* 262 */
	_nts_19,	/* 263 */
	_nts_19,	/* 264 */
	_nts_19,	/* 265 */
	_nts_19,	/* 266 */
	_nts_21,	/* 267 */
	_nts_21,	/* 268 */
	_nts_21,	/* 269 */
	_nts_19,	/* 270 */
	_nts_19,	/* 271 */
	_nts_19,	/* 272 */
	_nts_19,	/* 273 */
	_nts_19,	/* 274 */
	_nts_19,	/* 275 */
	_nts_19,	/* 276 */
	_nts_19,	/* 277 */
	_nts_19,	/* 278 */
	_nts_19,	/* 279 */
	_nts_21,	/* 280 */
	_nts_21,	/* 281 */
	_nts_19,	/* 282 */
	_nts_19,	/* 283 */
	_nts_21,	/* 284 */
	_nts_21,	/* 285 */
	_nts_22,	/* 286 */
	_nts_22,	/* 287 */
	_nts_23,	/* 288 */
	_nts_23,	/* 289 */
	_nts_22,	/* 290 */
	_nts_22,	/* 291 */
	_nts_23,	/* 292 */
	_nts_23,	/* 293 */
	_nts_22,	/* 294 */
	_nts_22,	/* 295 */
	_nts_23,	/* 296 */
	_nts_23,	/* 297 */
	_nts_22,	/* 298 */
	_nts_22,	/* 299 */
	_nts_23,	/* 300 */
	_nts_23,	/* 301 */
	_nts_22,	/* 302 */
	_nts_22,	/* 303 */
	_nts_23,	/* 304 */
	_nts_23,	/* 305 */
	_nts_22,	/* 306 */
	_nts_22,	/* 307 */
	_nts_23,	/* 308 */
	_nts_23,	/* 309 */
	_nts_22,	/* 310 */
	_nts_22,	/* 311 */
	_nts_23,	/* 312 */
	_nts_23,	/* 313 */
	_nts_24,	/* 314 */
	_nts_24,	/* 315 */
	_nts_19,	/* 316 */
	_nts_24,	/* 317 */
	_nts_24,	/* 318 */
	_nts_19,	/* 319 */
	_nts_24,	/* 320 */
	_nts_24,	/* 321 */
	_nts_19,	/* 322 */
	_nts_24,	/* 323 */
	_nts_24,	/* 324 */
	_nts_19,	/* 325 */
	_nts_24,	/* 326 */
	_nts_24,	/* 327 */
	_nts_19,	/* 328 */
	_nts_24,	/* 329 */
	_nts_24,	/* 330 */
	_nts_19,	/* 331 */
	_nts_1,	/* 332 */
	_nts_19,	/* 333 */
	_nts_4,	/* 334 */
	_nts_5,	/* 335 */
	_nts_1,	/* 336 */
	_nts_5,	/* 337 */
	_nts_0,	/* 338 */
	_nts_9,	/* 339 */
	_nts_9,	/* 340 */
	_nts_9,	/* 341 */
	_nts_9,	/* 342 */
	_nts_10,	/* 343 */
	_nts_10,	/* 344 */
	_nts_10,	/* 345 */
	_nts_10,	/* 346 */
	_nts_1,	/* 347 */
	_nts_1,	/* 348 */
	_nts_1,	/* 349 */
	_nts_1,	/* 350 */
	_nts_0,	/* 351 */
	_nts_0,	/* 352 */
	_nts_0,	/* 353 */
	_nts_0,	/* 354 */
	_nts_0,	/* 355 */
	_nts_0,	/* 356 */
	_nts_0,	/* 357 */
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
/* 10 */	"# peep ? mov %c, %0 ' LOAD\n",	/* reg: LOADI1(reg) */
/* 11 */	"# peep ? mov %c, %0 ' LOAD\n",	/* reg: LOADI2(reg) */
/* 12 */	"# peep ? mov %c, %0 ' LOAD\n",	/* reg: LOADI4(reg) */
/* 13 */	"# peep ? mov %c, %0 ' LOAD\n",	/* reg: LOADU1(reg) */
/* 14 */	"# peep ? mov %c, %0 ' LOAD\n",	/* reg: LOADU2(reg) */
/* 15 */	"# peep ? mov %c, %0 ' LOAD\n",	/* reg: LOADU4(reg) */
/* 16 */	"# peep ? mov %c, %0 ' LOAD\n",	/* reg: LOADP4(reg) */
/* 17 */	"# peep ? mov %c, %0 ' LOAD\n",	/* reg: LOADF4(reg) */
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
/* 33 */	"%a",	/* con: CNSTI1 */
/* 34 */	"%a",	/* con: CNSTI2 */
/* 35 */	"%a",	/* con: CNSTI4 */
/* 36 */	"%a",	/* con: CNSTU1 */
/* 37 */	"%a",	/* con: CNSTU2 */
/* 38 */	"%a",	/* con: CNSTU4 */
/* 39 */	"%a",	/* con: CNSTP4 */
/* 40 */	"%a",	/* con: CNSTF4 */
/* 41 */	"%a",	/* addrli: ADDRLP4 */
/* 42 */	"%a",	/* addrfi: ADDRFP4 */
/* 43 */	"%a",	/* addrg: ADDRGP4 */
/* 44 */	"%a",	/* special: ADDRGP4 */
/* 45 */	"%a",	/* addrl: ADDRLP4 */
/* 46 */	"%a",	/* addrl: ADDRFP4 */
/* 47 */	" mov %c, FP\n sub %c, #-(%a) ' reg <- addrli\n",	/* regl: addrli */
/* 48 */	" mov %c, FP\n add %c, #%a ' reg <- addrfi\n",	/* regl: addrfi */
/* 49 */	" jmp #LODF\n long %a\n mov %c, RI ' reg <- addrl\n",	/* regl: addrl */
/* 50 */	" jmp #LODL\n long @%a\n mov %c, RI ' reg <- addrg\n",	/* regg: addrg */
/* 51 */	" mov %c, %a ' reg <- special\n",	/* regg: special */
/* 52 */	"%0 ",	/* reg: regg */
/* 53 */	"%0 ",	/* reg: regl */
/* 54 */	" jmp #LODL\n long %0\n mov %c, RI ' reg <- con\n",	/* reg: con */
/* 55 */	" mov %c, #%0 ' reg <- coni\n",	/* reg: coni */
/* 56 */	"%0",	/* ri: reg */
/* 57 */	" #%0",	/* ri: coni */
/* 58 */	" rdbyte %c, %0 ' reg <- INDIRI1 regl\n",	/* reg: INDIRI1(regl) */
/* 59 */	" rdword %c, %0 ' reg <- INDIRI2 regl\n",	/* reg: INDIRI2(regl) */
/* 60 */	" rdlong %c, %0 ' reg <- INDIRI4 regl\n",	/* reg: INDIRI4(regl) */
/* 61 */	" rdbyte %c, %0 ' reg <- INDIRU1 regl\n",	/* reg: INDIRU1(regl) */
/* 62 */	" rdword %c, %0 ' reg <- INDIRU2 regl\n",	/* reg: INDIRU2(regl) */
/* 63 */	" rdlong %c, %0 ' reg <- INDIRU4 regl\n",	/* reg: INDIRU4(regl) */
/* 64 */	" rdlong %c, %0 ' reg <- INDIRF4 regl\n",	/* reg: INDIRF4(regl) */
/* 65 */	" rdlong %c, %0 ' reg <- INDIRP4 regl\n",	/* reg: INDIRP4(regl) */
/* 66 */	" mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- INDIRI1 regg\n",	/* reg: INDIRI1(regg) */
/* 67 */	" mov RI, %0\n jmp #RWRD\n mov %c, BC ' reg <- INDIRI2 regg\n",	/* reg: INDIRI2(regg) */
/* 68 */	" mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- INDIRI4 regg\n",	/* reg: INDIRI4(regg) */
/* 69 */	" mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- INDIRU1 regg\n",	/* reg: INDIRU1(regg) */
/* 70 */	" mov RI, %0\n jmp #RWRD\n mov %c, BC ' reg <- INDIRU2 regg\n",	/* reg: INDIRU2(regg) */
/* 71 */	" mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- INDIRU4 regg\n",	/* reg: INDIRU4(regg) */
/* 72 */	" mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- INDIRF4 regg\n",	/* reg: INDIRF4(regg) */
/* 73 */	" mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- INDIRP4 regg\n",	/* reg: INDIRP4(regg) */
/* 74 */	" mov %c, %0 ' reg <- INDIRI1 addrg special\n",	/* reg: INDIRI1(special) */
/* 75 */	" mov %c, %0 ' reg <- INDIRI2 addrg special\n",	/* reg: INDIRI2(special) */
/* 76 */	" mov %c, %0 ' reg <- INDIRI4 addrg special\n",	/* reg: INDIRI4(special) */
/* 77 */	" mov %c, %0 ' reg <- INDIRU1 addrg special\n",	/* reg: INDIRU1(special) */
/* 78 */	" mov %c, %0 ' reg <- INDIRU2 addrg special\n",	/* reg: INDIRU2(special) */
/* 79 */	" mov %c, %0 ' reg <- INDIRU4 addrg special\n",	/* reg: INDIRU4(special) */
/* 80 */	" mov %c, %0 ' reg <- INDIRF4 addrg special\n",	/* reg: INDIRF4(special) */
/* 81 */	" mov %c, %0 ' reg <- INDIRP4 addrg special\n",	/* reg: INDIRP4(special) */
/* 82 */	" mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- INDIRI1 reg\n",	/* reg: INDIRI1(reg) */
/* 83 */	" mov RI, %0\n jmp #RWRD\n mov %c, BC ' reg <- INDIRI2 reg\n",	/* reg: INDIRI2(reg) */
/* 84 */	" mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- INDIRI4 reg\n",	/* reg: INDIRI4(reg) */
/* 85 */	" mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- INDIRU1 reg\n",	/* reg: INDIRU1(reg) */
/* 86 */	" mov RI, %0\n jmp #RWRD\n mov %c, BC ' reg <- INDIRU2 reg\n",	/* reg: INDIRU2(reg) */
/* 87 */	" mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- INDIRU4 reg\n",	/* reg: INDIRU4(reg) */
/* 88 */	" mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- INDIRF4 reg\n",	/* reg: INDIRF4(reg) */
/* 89 */	" mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- INDIRP4 reg\n",	/* reg: INDIRP4(reg) */
/* 90 */	" jmp #LODL\n long @%0\n jmp #RBYT\n mov %c, BC ' reg <- INDIRI1 addrg\n",	/* reg: INDIRI1(addrg) */
/* 91 */	" jmp #LODL\n long @%0\n jmp #RWRD\n mov %c, BC ' reg <- INDIRI2 addrg\n",	/* reg: INDIRI2(addrg) */
/* 92 */	" jmp #LODI\n long @%0\n mov %c, RI ' reg <- INDIRI4 addrg\n",	/* reg: INDIRI4(addrg) */
/* 93 */	" jmp #LODL\n long @%0\n jmp #RBYT\n mov %c, BC ' reg <- INDIRU1 addrg\n",	/* reg: INDIRU1(addrg) */
/* 94 */	" jmp #LODL\n long @%0\n jmp #RWRD\n mov %c, BC ' reg <- INDIRU2 addrg\n",	/* reg: INDIRU2(addrg) */
/* 95 */	" jmp #LODI\n long @%0\n mov %c, RI ' reg <- INDIRU4 addrg\n",	/* reg: INDIRU4(addrg) */
/* 96 */	" jmp #LODI\n long @%0\n mov %c, RI ' reg <- INDIRF4 addrg\n",	/* reg: INDIRF4(addrg) */
/* 97 */	" jmp #LODI\n long @%0\n mov %c, RI ' reg <- INDIRP4 addrg\n",	/* reg: INDIRP4(addrg) */
/* 98 */	" jmp #LODF\n long %0\n rdbyte %c, RI ' reg <- INDIRI1 addrl\n",	/* reg: INDIRI1(addrl) */
/* 99 */	" jmp #LODF\n long %0\n rdword %c, RI ' reg <- INDIRI2 addrl\n",	/* reg: INDIRI2(addrl) */
/* 100 */	" jmp #LODF\n long %0\n rdlong %c, RI ' reg <- INDIRI4 addrl\n",	/* reg: INDIRI4(addrl) */
/* 101 */	" jmp #LODF\n long %0\n rdbyte %c, RI ' reg <- INDIRU1 addrl\n",	/* reg: INDIRU1(addrl) */
/* 102 */	" jmp #LODF\n long %0\n rdword %c, RI ' reg <- INDIRU2 addrl\n",	/* reg: INDIRU2(addrl) */
/* 103 */	" jmp #LODF\n long %0\n rdlong %c, RI ' reg <- INDIRU4 addrl\n",	/* reg: INDIRU4(addrl) */
/* 104 */	" jmp #LODF\n long %0\n rdlong %c, RI ' reg <- INDIRF4 addrl\n",	/* reg: INDIRF4(addrl) */
/* 105 */	" jmp #LODF\n long %0\n rdlong %c, RI ' reg <- INDIRP4 addrl\n",	/* reg: INDIRP4(addrl) */
/* 106 */	" rdbyte %c, %0 ' reg <- CVUU1 INDIRU1 reg\n",	/* reg: CVUU1(INDIRU1(regl)) */
/* 107 */	" rdbyte %c, %0 ' reg <- CVUU2 INDIRU1 reg\n",	/* reg: CVUU2(INDIRU1(regl)) */
/* 108 */	" rdword %c, %0 ' reg <- CVUU2 INDIRU2 reg\n",	/* reg: CVUU2(INDIRU2(regl)) */
/* 109 */	" rdbyte %c, %0 ' reg <- CVUU4 INDIRU1 reg\n",	/* reg: CVUU4(INDIRU1(regl)) */
/* 110 */	" rdword %c, %0 ' reg <- CVUU4 INDIRU2 reg\n",	/* reg: CVUU4(INDIRU2(regl)) */
/* 111 */	" rdlong %c, %0 ' reg <- CVUU4 INDIRU4 reg\n",	/* reg: CVUU4(INDIRU4(regl)) */
/* 112 */	" rdbyte %c, %0 ' reg <- CVUI1 INDIRU1 reg\n",	/* reg: CVUI1(INDIRU1(regl)) */
/* 113 */	" rdbyte %c, %0 ' reg <- CVUI2 INDIRU1 reg\n",	/* reg: CVUI2(INDIRU1(regl)) */
/* 114 */	" rdword %c, %0 ' reg <- CVUI2 INDIRU2 reg\n",	/* reg: CVUI2(INDIRU2(regl)) */
/* 115 */	" rdbyte %c, %0 ' reg <- CVUI4 INDIRU1 reg\n",	/* reg: CVUI4(INDIRU1(regl)) */
/* 116 */	" rdword %c, %0 ' reg <- CVUI4 INDIRU2 reg\n",	/* reg: CVUI4(INDIRU2(regl)) */
/* 117 */	" rdlong %c, %0 ' reg <- CVUI4 INDIRU4 reg\n",	/* reg: CVUI4(INDIRU4(regl)) */
/* 118 */	" mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- CVUU1 INDIRU1 reg\n",	/* reg: CVUU1(INDIRU1(regg)) */
/* 119 */	" mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- CVUU2 INDIRU1 reg\n",	/* reg: CVUU2(INDIRU1(regg)) */
/* 120 */	" mov RI, %0\n jmp #RWRD\n mov %c, BC ' reg <- CVUU2 INDIRU2 reg\n",	/* reg: CVUU2(INDIRU2(regg)) */
/* 121 */	" mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- CVUU4 INDIRU1 reg\n",	/* reg: CVUU4(INDIRU1(regg)) */
/* 122 */	" mov RI, %0\n jmp #RWRD\n mov %c, BC ' reg <- CVUU4 INDIRU2 reg\n",	/* reg: CVUU4(INDIRU2(regg)) */
/* 123 */	" mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- CVUU4 INDIRU4 reg\n",	/* reg: CVUU4(INDIRU4(regg)) */
/* 124 */	" mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- CVUI1 INDIRU1 reg\n",	/* reg: CVUI1(INDIRU1(regg)) */
/* 125 */	" mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- CVUI2 INDIRU1 reg\n",	/* reg: CVUI2(INDIRU1(regg)) */
/* 126 */	" mov RI, %0\n jmp #RWRD\n mov %c, BC ' reg <- CVUI2 INDIRU2 reg\n",	/* reg: CVUI2(INDIRU2(regg)) */
/* 127 */	" mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- CVUI4 INDIRU1 reg\n",	/* reg: CVUI4(INDIRU1(regg)) */
/* 128 */	" mov RI, %0\n jmp #RWRD\n mov %c, BC ' reg <- CVUI4 INDIRU2 reg\n",	/* reg: CVUI4(INDIRU2(regg)) */
/* 129 */	" mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- CVUI4 INDIRU4 reg\n",	/* reg: CVUI4(INDIRU4(regg)) */
/* 130 */	" jmp #LODL\n long @%0\n mov BC, %1\n jmp #WBYT ' ASGNI1 addrg reg\n",	/* stmt: ASGNI1(addrg,reg) */
/* 131 */	" jmp #LODL\n long @%0\n mov BC, %1\n jmp #WWRD ' ASGNI2 addrg reg\n",	/* stmt: ASGNI2(addrg,reg) */
/* 132 */	" jmp #LODL\n long @%0\n mov BC, %1\n jmp #WLNG ' ASGNI4 addrg reg\n",	/* stmt: ASGNI4(addrg,reg) */
/* 133 */	" jmp #LODL\n long @%0\n mov BC, %1\n jmp #WBYT ' ASGNU1 addrg reg\n",	/* stmt: ASGNU1(addrg,reg) */
/* 134 */	" jmp #LODL\n long @%0\n mov BC, %1\n jmp #WWRD ' ASGNU2 addrg reg\n",	/* stmt: ASGNU2(addrg,reg) */
/* 135 */	" jmp #LODL\n long @%0\n mov BC, %1\n jmp #WLNG ' ASGNU4 addrg reg\n",	/* stmt: ASGNU4(addrg,reg) */
/* 136 */	" jmp #LODL\n long @%0\n mov BC, %1\n jmp #WLNG ' ASGNF4 addrg reg\n",	/* stmt: ASGNF4(addrg,reg) */
/* 137 */	" jmp #LODL\n long @%0\n mov BC, %1\n jmp #WLNG ' ASGNP4 addrg reg\n",	/* stmt: ASGNP4(addrg,reg) */
/* 138 */	" mov %0, %1 ' ASGNI1 special reg\n",	/* stmt: ASGNI1(special,reg) */
/* 139 */	" mov %0, %1 ' ASGNI2 special reg\n",	/* stmt: ASGNI2(special,reg) */
/* 140 */	" mov %0, %1 ' ASGNI4 special reg\n",	/* stmt: ASGNI4(special,reg) */
/* 141 */	" mov %0, %1 ' ASGNU1 special reg\n",	/* stmt: ASGNU1(special,reg) */
/* 142 */	" mov %0, %1 ' ASGNU2 special reg\n",	/* stmt: ASGNU2(special,reg) */
/* 143 */	" mov %0, %1 ' ASGNU4 special reg\n",	/* stmt: ASGNU4(special,reg) */
/* 144 */	" mov %0, %1 ' ASGNF4 special reg\n",	/* stmt: ASGNF4(special,reg) */
/* 145 */	" mov %0, %1 ' ASGNP4 special reg\n",	/* stmt: ASGNP4(special,reg) */
/* 146 */	" mov %0, #%1 ' ASGNI1 special coni\n",	/* stmt: ASGNI1(special,coni) */
/* 147 */	" mov %0, #%1 ' ASGNI2 special coni\n",	/* stmt: ASGNI2(special,coni) */
/* 148 */	" mov %0, #%1 ' ASGNI4 special coni\n",	/* stmt: ASGNI4(special,coni) */
/* 149 */	" mov %0, #%1 ' ASGNU1 special coni\n",	/* stmt: ASGNU1(special,coni) */
/* 150 */	" mov %0, #%1 ' ASGNU2 special coni\n",	/* stmt: ASGNU2(special,coni) */
/* 151 */	" mov %0, #%1 ' ASGNU4 special coni\n",	/* stmt: ASGNU4(special,coni) */
/* 152 */	" mov %0, #%1 ' ASGNF4 special coni\n",	/* stmt: ASGNF4(special,coni) */
/* 153 */	" mov %0, #%1 ' ASGNP4 special coni\n",	/* stmt: ASGNP4(special,coni) */
/* 154 */	" jmp #LODF\n long %0\n wrbyte %1, RI ' ASGNI1 addrl reg\n",	/* stmt: ASGNI1(addrl,reg) */
/* 155 */	" jmp #LODF\n long %0\n wrword %1, RI ' ASGNI2 addrl reg\n",	/* stmt: ASGNI2(addrl,reg) */
/* 156 */	" jmp #LODF\n long %0\n wrlong %1, RI ' ASGNI4 addrl reg\n",	/* stmt: ASGNI4(addrl,reg) */
/* 157 */	" jmp #LODF\n long %0\n wrbyte %1, RI ' ASGNU1 addrl reg\n",	/* stmt: ASGNU1(addrl,reg) */
/* 158 */	" jmp #LODF\n long %0\n wrword %1, RI ' ASGNU2 addrl reg\n",	/* stmt: ASGNU2(addrl,reg) */
/* 159 */	" jmp #LODF\n long %0\n wrlong %1, RI ' ASGNU4 addrl reg\n",	/* stmt: ASGNU4(addrl,reg) */
/* 160 */	" jmp #LODF\n long %0\n wrlong %1, RI ' ASGNF4 addrl reg\n",	/* stmt: ASGNF4(addrl,reg) */
/* 161 */	" jmp #LODF\n long %0\n wrlong %1, RI ' ASGNP4 addrl reg\n",	/* stmt: ASGNP4(addrl,reg) */
/* 162 */	" mov RI, FP\n sub RI, #-(%0)\n wrbyte %1, RI ' ASGNI1 addrli reg\n",	/* stmt: ASGNI1(addrli,reg) */
/* 163 */	" mov RI, FP\n sub RI, #-(%0)\n wrword %1, RI ' ASGNI2 addrli reg\n",	/* stmt: ASGNI2(addrli,reg) */
/* 164 */	" mov RI, FP\n sub RI, #-(%0)\n wrlong %1, RI ' ASGNI4 addrli reg\n",	/* stmt: ASGNI4(addrli,reg) */
/* 165 */	" mov RI, FP\n sub RI, #-(%0)\n wrbyte %1, RI ' ASGNU1 addrli reg\n",	/* stmt: ASGNU1(addrli,reg) */
/* 166 */	" mov RI, FP\n sub RI, #-(%0)\n wrword %1, RI ' ASGNU2 addrli reg\n",	/* stmt: ASGNU2(addrli,reg) */
/* 167 */	" mov RI, FP\n sub RI, #-(%0)\n wrlong %1, RI ' ASGNU4 addrli reg\n",	/* stmt: ASGNU4(addrli,reg) */
/* 168 */	" mov RI, FP\n sub RI, #-(%0)\n wrlong %1, RI ' ASGNF4 addrli reg\n",	/* stmt: ASGNF4(addrli,reg) */
/* 169 */	" mov RI, FP\n sub RI, #-(%0)\n wrlong %1, RI ' ASGNP4 addrli reg\n",	/* stmt: ASGNP4(addrli,reg) */
/* 170 */	" mov RI, FP\n add RI, #%0\n wrbyte %1, RI ' ASGNI1 addrfi reg\n",	/* stmt: ASGNI1(addrfi,reg) */
/* 171 */	" mov RI, FP\n add RI, #%0\n wrword %1, RI ' ASGNI2 addrfi reg\n",	/* stmt: ASGNI2(addrfi,reg) */
/* 172 */	" mov RI, FP\n add RI, #%0\n wrlong %1, RI ' ASGNI4 addrfi reg\n",	/* stmt: ASGNI4(addrfi,reg) */
/* 173 */	" mov RI, FP\n add RI, #%0\n wrbyte %1, RI ' ASGNU1 addrfi reg\n",	/* stmt: ASGNU1(addrfi,reg) */
/* 174 */	" mov RI, FP\n add RI, #%0\n wrword %1, RI ' ASGNU2 addrfi reg\n",	/* stmt: ASGNU2(addrfi,reg) */
/* 175 */	" mov RI, FP\n add RI, #%0\n wrlong %1, RI ' ASGNU4 addrfi reg\n",	/* stmt: ASGNU4(addrfi,reg) */
/* 176 */	" mov RI, FP\n add RI, #%0\n wrlong %1, RI ' ASGNF4 addrfi reg\n",	/* stmt: ASGNF4(addrfi,reg) */
/* 177 */	" mov RI, FP\n add RI, #%0\n wrlong %1, RI ' ASGNP4 addrfi reg\n",	/* stmt: ASGNP4(addrfi,reg) */
/* 178 */	" mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNI1 addrli special\n",	/* stmt: ASGNI1(addrli,special) */
/* 179 */	" mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNI2 addrli special\n",	/* stmt: ASGNI2(addrli,special) */
/* 180 */	" mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNI4 addrli special\n",	/* stmt: ASGNI4(addrli,special) */
/* 181 */	" mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNU1 addrli special\n",	/* stmt: ASGNU1(addrli,special) */
/* 182 */	" mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNU2 addrli special\n",	/* stmt: ASGNU2(addrli,special) */
/* 183 */	" mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNU4 addrli special\n",	/* stmt: ASGNU4(addrli,special) */
/* 184 */	" mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNF4 addrli special\n",	/* stmt: ASGNF4(addrli,special) */
/* 185 */	" mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNP4 addrli special\n",	/* stmt: ASGNP4(addrli,special) */
/* 186 */	" mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNI1 addrfi special\n",	/* stmt: ASGNI1(addrfi,special) */
/* 187 */	" mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNI2 addrfi special\n",	/* stmt: ASGNI2(addrfi,special) */
/* 188 */	" mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNI4 addrfi special\n",	/* stmt: ASGNI4(addrfi,special) */
/* 189 */	" mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNU1 addrfi special\n",	/* stmt: ASGNU1(addrfi,special) */
/* 190 */	" mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNU2 addrfi special\n",	/* stmt: ASGNU2(addrfi,special) */
/* 191 */	" mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNU4 addrfi special\n",	/* stmt: ASGNU4(addrfi,special) */
/* 192 */	" mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNF4 addrfi special\n",	/* stmt: ASGNF4(addrfi,special) */
/* 193 */	" mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNP4 addrfi special\n",	/* stmt: ASGNP4(addrfi,special) */
/* 194 */	" mov RI, %0\n mov BC, %1\n jmp #WBYT ' ASGNI1 reg reg\n",	/* stmt: ASGNI1(reg,reg) */
/* 195 */	" mov RI, %0\n mov BC, %1\n jmp #WWRD ' ASGNI2 reg reg\n",	/* stmt: ASGNI2(reg,reg) */
/* 196 */	" mov RI, %0\n mov BC, %1\n jmp #WLNG ' ASGNI4 reg reg\n",	/* stmt: ASGNI4(reg,reg) */
/* 197 */	" mov RI, %0\n mov BC, %1\n jmp #WBYT ' ASGNU1 reg reg\n",	/* stmt: ASGNU1(reg,reg) */
/* 198 */	" mov RI, %0\n mov BC, %1\n jmp #WWRD ' ASGNU2 reg reg\n",	/* stmt: ASGNU2(reg,reg) */
/* 199 */	" mov RI, %0\n mov BC, %1\n jmp #WLNG ' ASGNU4 reg reg\n",	/* stmt: ASGNU4(reg,reg) */
/* 200 */	" mov RI, %0\n mov BC, %1\n jmp #WLNG ' ASGNF4 reg reg\n",	/* stmt: ASGNF4(reg,reg) */
/* 201 */	" mov RI, %0\n mov BC, %1\n jmp #WLNG ' ASGNP4 reg reg\n",	/* stmt: ASGNP4(reg,reg) */
/* 202 */	"# call\n",	/* reg: CALLI4(addrg) */
/* 203 */	"# call\n",	/* reg: CALLU4(addrg) */
/* 204 */	"# call\n",	/* reg: CALLP4(addrg) */
/* 205 */	"# call\n",	/* reg: CALLF4(addrg) */
/* 206 */	"# call\n",	/* reg: CALLV(addrg) */
/* 207 */	"# call\n",	/* reg: CALLI4(reg) */
/* 208 */	"# call\n",	/* reg: CALLU4(reg) */
/* 209 */	"# call\n",	/* reg: CALLP4(reg) */
/* 210 */	"# call\n",	/* reg: CALLF4(reg) */
/* 211 */	"# call\n",	/* reg: CALLV(reg) */
/* 212 */	"# ret\n",	/* stmt: RETI4(reg) */
/* 213 */	"# ret\n",	/* stmt: RETU4(reg) */
/* 214 */	"# ret\n",	/* stmt: RETP4(reg) */
/* 215 */	"# ret\n",	/* stmt: RETF4(reg) */
/* 216 */	" mov r0, #%0 ' RET coni\n",	/* stmt: RETI4(coni) */
/* 217 */	" mov r0, #%0 ' RET coni\n",	/* stmt: RETU4(coni) */
/* 218 */	" mov r0, #%0 ' RET coni\n",	/* stmt: RETP4(coni) */
/* 219 */	" jmp #LODL\n long %0\n mov r0, RI ' RET con\n",	/* stmt: RETI4(con) */
/* 220 */	" jmp #LODL\n long %0\n mov r0, RI ' RET con\n",	/* stmt: RETU4(con) */
/* 221 */	" jmp #LODL\n long %0\n mov r0, RI ' RET con\n",	/* stmt: RETP4(con) */
/* 222 */	" jmp #LODL\n long %0\n mov r0, RI ' RET con\n",	/* stmt: RETF4(con) */
/* 223 */	"# zero extend\n",	/* reg: CVUI1(reg) */
/* 224 */	"# zero extend\n",	/* reg: CVUI2(reg) */
/* 225 */	"# zero extend\n",	/* reg: CVUI4(reg) */
/* 226 */	"# truncate\n",	/* reg: CVUU1(reg) */
/* 227 */	"# truncate\n",	/* reg: CVUU2(reg) */
/* 228 */	"# truncate\n",	/* reg: CVUU4(reg) */
/* 229 */	"? mov %c, %0 ' CVUP4\n",	/* reg: CVUP4(reg) */
/* 230 */	"? mov %c, %0 ' CVPU4\n",	/* reg: CVPU4(reg) */
/* 231 */	"# sign extend\n",	/* reg: CVII1(reg) */
/* 232 */	"# sign extend\n",	/* reg: CVII2(reg) */
/* 233 */	"# sign extend\n",	/* reg: CVII4(reg) */
/* 234 */	"# truncate\n",	/* reg: CVIU1(reg) */
/* 235 */	"# truncate\n",	/* reg: CVIU2(reg) */
/* 236 */	"# truncate\n",	/* reg: CVIU4(reg) */
/* 237 */	"# nothing",	/* reg: CVFF4(reg) */
/* 238 */	" jmp #INFL ' CVFI4\n",	/* reg: CVFI4(reg) */
/* 239 */	" jmp #FLIN ' CVIF4\n",	/* reg: CVIF4(reg) */
/* 240 */	" neg %c, %0 ' NEGI4\n",	/* reg: NEGI4(ri) */
/* 241 */	"? mov %c, %0\n xor %c, Bit31 ' NEGF4\n",	/* reg: NEGF4(reg) */
/* 242 */	"? mov %c, %0\n xor %c, all_1s ' BCOMI4\n",	/* reg: BCOMI4(ri) */
/* 243 */	"? mov %c, %0\n xor %c, all_1s ' BCOMU4\n",	/* reg: BCOMU4(ri) */
/* 244 */	"# mov RI, %0\n adds RI, %1\n mov %c, RI ' ADDI4 reg\n",	/* reg: ADDI4(reg,reg) */
/* 245 */	"# mov RI, %0\n add RI, %1\n mov %c, RI ' ADDU4 reg\n",	/* reg: ADDU4(reg,reg) */
/* 246 */	"# mov RI, %0\n adds RI, %1\n mov %c, RI ' ADDP4 reg\n",	/* reg: ADDP4(reg,reg) */
/* 247 */	"# jmp #FADD ' ADDF4\n",	/* reg: ADDF4(reg,reg) */
/* 248 */	"? mov %c, %0\n adds %c, #%1 ' ADDI4 coni\n",	/* reg: ADDI4(reg,coni) */
/* 249 */	"? mov %c, %0\n add %c, #%1 ' ADDU4 coni\n",	/* reg: ADDU4(reg,coni) */
/* 250 */	"? mov %c, %0\n adds %c, #%1 ' ADDP4 coni\n",	/* reg: ADDP4(reg,coni) */
/* 251 */	"# mov RI, %0\n and RI, %1\n mov %c, RI ' BANDI4 reg\n",	/* reg: BANDI4(reg,reg) */
/* 252 */	"# mov RI, %0\n and RI, %1\n mov %c, RI ' BANDU4 reg\n",	/* reg: BANDU4(reg,reg) */
/* 253 */	"? mov %c, %0\n and %c, #%1 ' BANDI4 coni\n",	/* reg: BANDI4(reg,coni) */
/* 254 */	"? mov %c, %0\n and %c, #%1 ' BANDU4 coni\n",	/* reg: BANDU4(reg,coni) */
/* 255 */	"# mov RI, %0\n or RI, %1\n mov %c, RI ' BORI4 reg\n",	/* reg: BORI4(reg,reg) */
/* 256 */	"# mov RI, %0\n or RI, %1\n mov %c, RI ' BORU4 reg\n",	/* reg: BORU4(reg,reg) */
/* 257 */	"? mov %c, %0\n or %c, #%1 ' BORI4 coni\n",	/* reg: BORI4(reg,coni) */
/* 258 */	"? mov %c, %0\n or %c, #%1 ' BORU4 coni\n",	/* reg: BORU4(reg,coni) */
/* 259 */	"# mov RI, %0\n xor RI, %1\n mov %c, RI ' BXORI4 reg\n",	/* reg: BXORI4(reg,reg) */
/* 260 */	"# mov RI, %0\n xor RI, %1\n mov %c, RI ' BXORU4 reg\n",	/* reg: BXORU4(reg,reg) */
/* 261 */	"? mov %c, %0\n xor %c, #%1 ' BXORI4 coni\n",	/* reg: BXORI4(reg,coni) */
/* 262 */	"? mov %c, %0\n xor %c, #%1 ' BXORU4 coni\n",	/* reg: BXORU4(reg,coni) */
/* 263 */	"# mov RI, %0\n subs RI, %1\n mov %c, RI ' SUBI4 reg\n",	/* reg: SUBI4(reg,reg) */
/* 264 */	"# mov RI, %0\n sub RI, %1\n mov %c, RI ' SUBU4 reg\n",	/* reg: SUBU4(reg,reg) */
/* 265 */	"# mov RI, %0\n subs RI, %1\n mov %c, RI ' SUBP4 reg\n",	/* reg: SUBP4(reg,reg) */
/* 266 */	"# jmp #FSUB ' SUBF4\n",	/* reg: SUBF4(reg,reg) */
/* 267 */	"? mov %c, %0\n subs %c, #%1 ' SUBI4 coni\n",	/* reg: SUBI4(reg,coni) */
/* 268 */	"? mov %c, %0\n sub %c, #%1 ' SUBU4 coni\n",	/* reg: SUBU4(reg,coni) */
/* 269 */	"? mov %c, %0\n subs %c, #%1 ' SUBP4 coni\n",	/* reg: SUBP4(reg,coni) */
/* 270 */	"# jmp #DIVS ' DIVI4\n",	/* reg: DIVI4(reg,reg) */
/* 271 */	"# jmp #DIVU ' DIVU4\n",	/* reg: DIVU4(reg,reg) */
/* 272 */	"# jmp #FDIV ' DIVF4\n",	/* reg: DIVF4(reg,reg) */
/* 273 */	"# jmp #DIVS ' MODI4\n",	/* reg: MODI4(reg,reg) */
/* 274 */	"# jmp #DIVU ' MODU4\n",	/* reg: MODU4(reg,reg) */
/* 275 */	"# jmp #MULT ' MULI4\n",	/* reg: MULI4(reg,reg) */
/* 276 */	"# jmp #MULT ' MULU4\n",	/* reg: MULU4(reg,reg) */
/* 277 */	"# jmp #FMUL ' MULF4\n",	/* reg: MULF4(reg,reg) */
/* 278 */	"# mov RI, %0\n shl RI, %1\n mov %c, RI ' LSHI4 reg\n",	/* reg: LSHI4(reg,reg) */
/* 279 */	"# mov RI, %0\n shl RI, %1\n mov %c, RI ' LSHU4 reg\n",	/* reg: LSHU4(reg,reg) */
/* 280 */	"? mov %c, %0\n shl %c, #%1 ' LSHI4 coni\n",	/* reg: LSHI4(reg,coni) */
/* 281 */	"? mov %c, %0\n shl %c, #%1 ' LSHU4 coni\n",	/* reg: LSHU4(reg,coni) */
/* 282 */	"# mov RI, %0\n sar RI, %1\n mov %c, RI ' RSHI4 reg\n",	/* reg: RSHI4(reg,reg) */
/* 283 */	"# mov RI, %0\n shr RI, %1\n mov %c, RI ' RSHU4 reg\n",	/* reg: RSHU4(reg,reg) */
/* 284 */	"? mov %c, %0\n sar %c, #%1 ' RSHI4 coni\n",	/* reg: RSHI4(reg,coni) */
/* 285 */	"? mov %c, %0\n shr %c, #%1 ' RSHU4 coni\n",	/* reg: RSHU4(reg,coni) */
/* 286 */	" and %0, #%2 ' ASGNI4 special BAND4 special coni\n",	/* stmt: ASGNI4(special,BANDI4(INDIRI4(special),coni)) */
/* 287 */	" and %0, #%2 ' ASGNU4 special BAND4 special coni\n",	/* stmt: ASGNU4(special,BANDU4(INDIRU4(special),coni)) */
/* 288 */	" and %0, %2 ' ASGNI4 special BAND4 special reg\n",	/* stmt: ASGNI4(special,BANDI4(INDIRI4(special),reg)) */
/* 289 */	" and %0, %2 ' ASGNU4 special BAND4 special reg\n",	/* stmt: ASGNU4(special,BANDU4(INDIRU4(special),reg)) */
/* 290 */	" or %0, #%2 ' ASGNI4 special BOR4 special coni\n",	/* stmt: ASGNI4(special,BORI4(INDIRI4(special),coni)) */
/* 291 */	" or %0, #%2 ' ASGNU4 special BOR4 special coni\n",	/* stmt: ASGNU4(special,BORU4(INDIRU4(special),coni)) */
/* 292 */	" or %0, %2 ' ASGNI4 special BOR4 special reg\n",	/* stmt: ASGNI4(special,BORI4(INDIRI4(special),reg)) */
/* 293 */	" or %0, %2 ' ASGNU4 special BOR4 special reg\n",	/* stmt: ASGNU4(special,BORU4(INDIRU4(special),reg)) */
/* 294 */	" xor %0, #%2 ' ASGNI4 special BXOR4 special coni\n",	/* stmt: ASGNI4(special,BXORI4(INDIRI4(special),coni)) */
/* 295 */	" xor %0, #%2 ' ASGNU4 special BXOR4 special coni\n",	/* stmt: ASGNU4(special,BXORU4(INDIRU4(special),coni)) */
/* 296 */	" xor %0, %2 ' ASGNI4 special BXOR4 special reg\n",	/* stmt: ASGNI4(special,BXORI4(INDIRI4(special),reg)) */
/* 297 */	" xor %0, %2 ' ASGNU4 special BXOR4 special reg\n",	/* stmt: ASGNU4(special,BXORU4(INDIRU4(special),reg)) */
/* 298 */	" adds %0, #%2 ' ASGNI4 special BADD4 special coni\n",	/* stmt: ASGNI4(special,ADDI4(INDIRI4(special),coni)) */
/* 299 */	" add %0, #%2 ' ASGNU4 special BADD4 special coni\n",	/* stmt: ASGNU4(special,ADDU4(INDIRU4(special),coni)) */
/* 300 */	" adds %0, %2 ' ASGNI4 special BADD4 special reg\n",	/* stmt: ASGNI4(special,ADDI4(INDIRI4(special),reg)) */
/* 301 */	" add %0, %2 ' ASGNU4 special BADD4 special reg\n",	/* stmt: ASGNU4(special,ADDU4(INDIRU4(special),reg)) */
/* 302 */	" subs %0, #%2 ' ASGNI4 special BSUB4 special coni\n",	/* stmt: ASGNI4(special,SUBI4(INDIRI4(special),coni)) */
/* 303 */	" sub %0, #%2 ' ASGNU4 special BSUB4 special coni\n",	/* stmt: ASGNU4(special,SUBU4(INDIRU4(special),coni)) */
/* 304 */	" subs %0, %2 ' ASGNI4 special BSUB4 special reg\n",	/* stmt: ASGNI4(special,SUBI4(INDIRI4(special),reg)) */
/* 305 */	" sub %0, %2 ' ASGNU4 special BSUB4 special reg\n",	/* stmt: ASGNU4(special,SUBU4(INDIRU4(special),reg)) */
/* 306 */	" shl %0, #%2 ' ASGNI4 special LSH4 special coni\n",	/* stmt: ASGNI4(special,LSHI4(INDIRI4(special),coni)) */
/* 307 */	" shl %0, #%2 ' ASGNU4 special LSH4 special coni\n",	/* stmt: ASGNU4(special,LSHU4(INDIRU4(special),coni)) */
/* 308 */	" shl %0, %2 ' ASGNI4 special LSH4 special reg\n",	/* stmt: ASGNI4(special,LSHI4(INDIRI4(special),reg)) */
/* 309 */	" shl %0, %2 ' ASGNU4 special LSH4 special reg\n",	/* stmt: ASGNU4(special,LSHU4(INDIRU4(special),reg)) */
/* 310 */	" shr %0, #%2 ' ASGNI4 special RSH4 special coni\n",	/* stmt: ASGNI4(special,RSHI4(INDIRI4(special),coni)) */
/* 311 */	" shr %0, #%2 ' ASGNU4 special RSH4 special coni\n",	/* stmt: ASGNU4(special,RSHU4(INDIRU4(special),coni)) */
/* 312 */	" shr %0, %2 ' ASGNI4 special RSH4 special reg\n",	/* stmt: ASGNI4(special,RSHI4(INDIRI4(special),reg)) */
/* 313 */	" shr %0, %2 ' ASGNU4 special RSH4 special reg\n",	/* stmt: ASGNU4(special,RSHU4(INDIRU4(special),reg)) */
/* 314 */	" cmps %0, %1 wz\n jmp #BR_Z\n long @%a ' EQI4\n",	/* stmt: EQI4(reg,ri) */
/* 315 */	" cmp %0, %1 wz\n jmp #BR_Z\n long @%a ' EQU4\n",	/* stmt: EQU4(reg,ri) */
/* 316 */	"# jmp #FCMP\n jmp #BR_Z\n long @%a ' EQF4\n",	/* stmt: EQF4(reg,reg) */
/* 317 */	" cmps %0, %1 wz\n jmp #BRNZ\n long @%a ' NEI4\n",	/* stmt: NEI4(reg,ri) */
/* 318 */	" cmp %0, %1 wz\n jmp #BRNZ\n long @%a ' NEU4\n",	/* stmt: NEU4(reg,ri) */
/* 319 */	"# jmp #FCMP\n jmp #BRNZ\n long @%a ' NEF4\n",	/* stmt: NEF4(reg,reg) */
/* 320 */	" cmps %0, %1 wz,wc\n jmp #BRAE\n long @%a ' GEI4\n",	/* stmt: GEI4(reg,ri) */
/* 321 */	" cmp %0, %1 wz,wc \n jmp #BRAE\n long @%a ' GEU4\n",	/* stmt: GEU4(reg,ri) */
/* 322 */	"# jmp #FCMP\n jmp #BRAE\n long @%a ' GEF4\n",	/* stmt: GEF4(reg,reg) */
/* 323 */	" cmps %0, %1 wz,wc\n jmp #BR_A\n long @%a ' GTI4\n",	/* stmt: GTI4(reg,ri) */
/* 324 */	" cmp %0, %1 wz,wc \n jmp #BR_A\n long @%a ' GTU4\n",	/* stmt: GTU4(reg,ri) */
/* 325 */	"# jmp #FCMP\n jmp #BR_A\n long @%a ' GTF4\n",	/* stmt: GTF4(reg,reg) */
/* 326 */	" cmps %0, %1 wz,wc\n jmp #BRBE\n long @%a ' LEI4\n",	/* stmt: LEI4(reg,ri) */
/* 327 */	" cmp %0, %1 wz,wc \n jmp #BRBE\n long @%a ' LEU4\n",	/* stmt: LEU4(reg,ri) */
/* 328 */	"# jmp #FCMP\n jmp #BRBE\n long @%a '  LEF4\n",	/* stmt: LEF4(reg,reg) */
/* 329 */	" cmps %0, %1 wz,wc\n jmp #BR_B\n long @%a ' LTI4\n",	/* stmt: LTI4(reg,ri) */
/* 330 */	" cmp %0, %1 wz,wc \n jmp #BR_B\n long @%a' LTU4\n",	/* stmt: LTU4(reg,ri) */
/* 331 */	"# jmp #FCMP\n jmp #BR_B\n long @%a ' LTF4\n",	/* stmt: LTF4(reg,reg) */
/* 332 */	"# ARGB\n",	/* stmt: ARGB(INDIRB(reg)) */
/* 333 */	"# ASGNB\n",	/* stmt: ASGNB(reg,INDIRB(reg)) */
/* 334 */	" rdlong RI, %0\n jmp #JMPI ' JUMPV reg\n",	/* stmt: JUMPV(INDIRP4(addrl)) */
/* 335 */	" mov RI, %0\n jmp #RLNG\n mov RI, BC\n jmp #JMPI ' JUMPV reg\n",	/* stmt: JUMPV(INDIRP4(addrg)) */
/* 336 */	" mov RI, %0\n jmp #RLNG\n mov RI, BC\n jmp #JMPI ' JUMPV reg\n",	/* stmt: JUMPV(INDIRP4(reg)) */
/* 337 */	" jmp #JMPA\n long @%0 ' JUMPV addrg\n",	/* stmt: JUMPV(addrg) */
/* 338 */	"# %a\n",	/* stmt: LABELV */
/* 339 */	"# jmp #LODL\n long %0\n jmp #PSHL ' ARGI4 addrg\n",	/* stmt: ARGI4(con) */
/* 340 */	"# jmp #LODL\n long %0\n jmp #PSHL ' ARGU4 addrg\n",	/* stmt: ARGU4(con) */
/* 341 */	"# jmp #LODL\n long %0\n jmp #PSHL ' ARGP4 addrg\n",	/* stmt: ARGP4(con) */
/* 342 */	"# jmp #LODL\n long %0\n jmp #PSHL ' ARGF4 addrg\n",	/* stmt: ARGF4(con) */
/* 343 */	"# mov RI, #%0\n jmp #PSHL ' ARGI4\n",	/* stmt: ARGI4(coni) */
/* 344 */	"# mov RI, #%0\n jmp #PSHL ' ARGU4\n",	/* stmt: ARGU4(coni) */
/* 345 */	"# mov RI, #%0\n jmp #PSHL ' ARGP4\n",	/* stmt: ARGP4(coni) */
/* 346 */	"# mov RI, #%0\n jmp #PSHL ' ARGF4\n",	/* stmt: ARGF4(coni) */
/* 347 */	"# mov RI, %0\n jmp #PSHL ' ARGI4\n",	/* stmt: ARGI4(reg) */
/* 348 */	"# mov RI, %0\n jmp #PSHL ' ARGU4\n",	/* stmt: ARGU4(reg) */
/* 349 */	"# mov RI, %0\n jmp #PSHL ' ARGP4\n",	/* stmt: ARGP4(reg) */
/* 350 */	"# mov RI, %0\n jmp #PSHL ' ARGF4\n",	/* stmt: ARGF4(reg) */
/* 351 */	"# jmp #LODL\n long @%0\n jmp #PSHL ' ARGI4 ADDRGP4\n",	/* stmt: ARGI4(ADDRGP4) */
/* 352 */	"# jmp #LODL\n long @%0\n jmp #PSHL ' ARGU4 ADDRGP4\n",	/* stmt: ARGU4(ADDRGP4) */
/* 353 */	"# jmp #LODL\n long @%0\n jmp #PSHL ' ARGP4 ADDRGP4\n",	/* stmt: ARGP4(ADDRGP4) */
/* 354 */	"# jmp #LODL\n long @%0\n jmp #PSHL ' ARGF4 ADDRGP4\n",	/* stmt: ARGF4(ADDRGP4) */
/* 355 */	"# jmp #LODF\n long %0\n jmp #PSHL ' ARGI4 ADDRLP4\n",	/* stmt: ARGI4(ADDRLP4) */
/* 356 */	"# jmp #LODF\n long %0\n jmp #PSHL ' ARGU4 ADDRLP4\n",	/* stmt: ARGU4(ADDRLP4) */
/* 357 */	"# jmp #LODF\n long %0\n jmp #PSHL ' ARGP4 ADDRLP4\n",	/* stmt: ARGP4(ADDRLP4) */
/* 358 */	"# jmp #LODF\n long %0\n jmp #PSHL ' ARGF4 ADDRLP4\n",	/* stmt: ARGF4(ADDRLP4) */
/* 359 */	"# jmp #LODF\n long %0\n jmp #PSHL ' ARGI4 ADDRFP4\n",	/* stmt: ARGI4(ADDRFP4) */
/* 360 */	"# jmp #LODF\n long %0\n jmp #PSHL ' ARGU4 ADDRFP4\n",	/* stmt: ARGU4(ADDRFP4) */
/* 361 */	"# jmp #LODF\n long %0\n jmp #PSHL ' ARGP4 ADDRFP4\n",	/* stmt: ARGP4(ADDRFP4) */
/* 362 */	"# jmp #LODF\n long %0\n jmp #PSHL ' ARGF4 ADDRFP4\n",	/* stmt: ARGF4(ADDRFP4) */
/* 363 */	"# jmp #PSHA\n long @%0 ' ARGI4 INDIRI4 ADDRGP4\n",	/* stmt: ARGI4(INDIRI4(ADDRGP4)) */
/* 364 */	"# jmp #PSHA\n long @%0 ' ARGU4 INDIRU4 ADDRGP4\n",	/* stmt: ARGU4(INDIRU4(ADDRGP4)) */
/* 365 */	"# jmp #PSHA\n long @%0 ' ARGP4 INDIRP4 ADDRGP4\n",	/* stmt: ARGP4(INDIRP4(ADDRGP4)) */
/* 366 */	"# jmp #PSHA\n long @%0 ' ARGF4 INDIRF4 ADDRGP4\n",	/* stmt: ARGF4(INDIRF4(ADDRGP4)) */
/* 367 */	"# jmp #PSHF\n long %0 ' ARGI4 INDIRI4 ADDRLP4\n",	/* stmt: ARGI4(INDIRI4(ADDRLP4)) */
/* 368 */	"# jmp #PSHF\n long %0 ' ARGU4 INDIRU4 ADDRLP4\n",	/* stmt: ARGU4(INDIRU4(ADDRLP4)) */
/* 369 */	"# jmp #PSHF\n long %0 ' ARGP4 INDIRP4 ADDRLP4\n",	/* stmt: ARGP4(INDIRP4(ADDRLP4)) */
/* 370 */	"# jmp #PSHF\n long %0 ' ARGF4 INDIRF4 ADDRLP4\n",	/* stmt: ARGF4(INDIRF4(ADDRLP4)) */
/* 371 */	"# jmp #PSHF\n long %0 ' ARGI4 INDIRI4 ADDRFP4\n",	/* stmt: ARGI4(INDIRI4(ADDRFP4)) */
/* 372 */	"# jmp #PSHF\n long %0 ' ARGU4 INDIRU4 ADDRFP4\n",	/* stmt: ARGU4(INDIRU4(ADDRFP4)) */
/* 373 */	"# jmp #PSHF\n long %0 ' ARGP4 INDIRP4 ADDRFP4\n",	/* stmt: ARGP4(INDIRP4(ADDRFP4)) */
/* 374 */	"# jmp #PSHF\n long %0 ' ARGF4 INDIRF4 ADDRFP4\n",	/* stmt: ARGF4(INDIRF4(ADDRFP4)) */
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
/* 10 */	1,	/* # peep ? mov %c, %0 ' LOAD\n */
/* 11 */	1,	/* # peep ? mov %c, %0 ' LOAD\n */
/* 12 */	1,	/* # peep ? mov %c, %0 ' LOAD\n */
/* 13 */	1,	/* # peep ? mov %c, %0 ' LOAD\n */
/* 14 */	1,	/* # peep ? mov %c, %0 ' LOAD\n */
/* 15 */	1,	/* # peep ? mov %c, %0 ' LOAD\n */
/* 16 */	1,	/* # peep ? mov %c, %0 ' LOAD\n */
/* 17 */	1,	/* # peep ? mov %c, %0 ' LOAD\n */
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
/* 47 */	1,	/*  mov %c, FP\n sub %c, #-(%a) ' reg <- addrli\n */
/* 48 */	1,	/*  mov %c, FP\n add %c, #%a ' reg <- addrfi\n */
/* 49 */	1,	/*  jmp #LODF\n long %a\n mov %c, RI ' reg <- addrl\n */
/* 50 */	1,	/*  jmp #LODL\n long @%a\n mov %c, RI ' reg <- addrg\n */
/* 51 */	1,	/*  mov %c, %a ' reg <- special\n */
/* 52 */	0,	/* %0  */
/* 53 */	0,	/* %0  */
/* 54 */	1,	/*  jmp #LODL\n long %0\n mov %c, RI ' reg <- con\n */
/* 55 */	1,	/*  mov %c, #%0 ' reg <- coni\n */
/* 56 */	0,	/* %0 */
/* 57 */	0,	/*  #%0 */
/* 58 */	1,	/*  rdbyte %c, %0 ' reg <- INDIRI1 regl\n */
/* 59 */	1,	/*  rdword %c, %0 ' reg <- INDIRI2 regl\n */
/* 60 */	1,	/*  rdlong %c, %0 ' reg <- INDIRI4 regl\n */
/* 61 */	1,	/*  rdbyte %c, %0 ' reg <- INDIRU1 regl\n */
/* 62 */	1,	/*  rdword %c, %0 ' reg <- INDIRU2 regl\n */
/* 63 */	1,	/*  rdlong %c, %0 ' reg <- INDIRU4 regl\n */
/* 64 */	1,	/*  rdlong %c, %0 ' reg <- INDIRF4 regl\n */
/* 65 */	1,	/*  rdlong %c, %0 ' reg <- INDIRP4 regl\n */
/* 66 */	1,	/*  mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- INDIRI1 regg\n */
/* 67 */	1,	/*  mov RI, %0\n jmp #RWRD\n mov %c, BC ' reg <- INDIRI2 regg\n */
/* 68 */	1,	/*  mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- INDIRI4 regg\n */
/* 69 */	1,	/*  mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- INDIRU1 regg\n */
/* 70 */	1,	/*  mov RI, %0\n jmp #RWRD\n mov %c, BC ' reg <- INDIRU2 regg\n */
/* 71 */	1,	/*  mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- INDIRU4 regg\n */
/* 72 */	1,	/*  mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- INDIRF4 regg\n */
/* 73 */	1,	/*  mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- INDIRP4 regg\n */
/* 74 */	1,	/*  mov %c, %0 ' reg <- INDIRI1 addrg special\n */
/* 75 */	1,	/*  mov %c, %0 ' reg <- INDIRI2 addrg special\n */
/* 76 */	1,	/*  mov %c, %0 ' reg <- INDIRI4 addrg special\n */
/* 77 */	1,	/*  mov %c, %0 ' reg <- INDIRU1 addrg special\n */
/* 78 */	1,	/*  mov %c, %0 ' reg <- INDIRU2 addrg special\n */
/* 79 */	1,	/*  mov %c, %0 ' reg <- INDIRU4 addrg special\n */
/* 80 */	1,	/*  mov %c, %0 ' reg <- INDIRF4 addrg special\n */
/* 81 */	1,	/*  mov %c, %0 ' reg <- INDIRP4 addrg special\n */
/* 82 */	1,	/*  mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- INDIRI1 reg\n */
/* 83 */	1,	/*  mov RI, %0\n jmp #RWRD\n mov %c, BC ' reg <- INDIRI2 reg\n */
/* 84 */	1,	/*  mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- INDIRI4 reg\n */
/* 85 */	1,	/*  mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- INDIRU1 reg\n */
/* 86 */	1,	/*  mov RI, %0\n jmp #RWRD\n mov %c, BC ' reg <- INDIRU2 reg\n */
/* 87 */	1,	/*  mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- INDIRU4 reg\n */
/* 88 */	1,	/*  mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- INDIRF4 reg\n */
/* 89 */	1,	/*  mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- INDIRP4 reg\n */
/* 90 */	1,	/*  jmp #LODL\n long @%0\n jmp #RBYT\n mov %c, BC ' reg <- INDIRI1 addrg\n */
/* 91 */	1,	/*  jmp #LODL\n long @%0\n jmp #RWRD\n mov %c, BC ' reg <- INDIRI2 addrg\n */
/* 92 */	1,	/*  jmp #LODI\n long @%0\n mov %c, RI ' reg <- INDIRI4 addrg\n */
/* 93 */	1,	/*  jmp #LODL\n long @%0\n jmp #RBYT\n mov %c, BC ' reg <- INDIRU1 addrg\n */
/* 94 */	1,	/*  jmp #LODL\n long @%0\n jmp #RWRD\n mov %c, BC ' reg <- INDIRU2 addrg\n */
/* 95 */	1,	/*  jmp #LODI\n long @%0\n mov %c, RI ' reg <- INDIRU4 addrg\n */
/* 96 */	1,	/*  jmp #LODI\n long @%0\n mov %c, RI ' reg <- INDIRF4 addrg\n */
/* 97 */	1,	/*  jmp #LODI\n long @%0\n mov %c, RI ' reg <- INDIRP4 addrg\n */
/* 98 */	1,	/*  jmp #LODF\n long %0\n rdbyte %c, RI ' reg <- INDIRI1 addrl\n */
/* 99 */	1,	/*  jmp #LODF\n long %0\n rdword %c, RI ' reg <- INDIRI2 addrl\n */
/* 100 */	1,	/*  jmp #LODF\n long %0\n rdlong %c, RI ' reg <- INDIRI4 addrl\n */
/* 101 */	1,	/*  jmp #LODF\n long %0\n rdbyte %c, RI ' reg <- INDIRU1 addrl\n */
/* 102 */	1,	/*  jmp #LODF\n long %0\n rdword %c, RI ' reg <- INDIRU2 addrl\n */
/* 103 */	1,	/*  jmp #LODF\n long %0\n rdlong %c, RI ' reg <- INDIRU4 addrl\n */
/* 104 */	1,	/*  jmp #LODF\n long %0\n rdlong %c, RI ' reg <- INDIRF4 addrl\n */
/* 105 */	1,	/*  jmp #LODF\n long %0\n rdlong %c, RI ' reg <- INDIRP4 addrl\n */
/* 106 */	1,	/*  rdbyte %c, %0 ' reg <- CVUU1 INDIRU1 reg\n */
/* 107 */	1,	/*  rdbyte %c, %0 ' reg <- CVUU2 INDIRU1 reg\n */
/* 108 */	1,	/*  rdword %c, %0 ' reg <- CVUU2 INDIRU2 reg\n */
/* 109 */	1,	/*  rdbyte %c, %0 ' reg <- CVUU4 INDIRU1 reg\n */
/* 110 */	1,	/*  rdword %c, %0 ' reg <- CVUU4 INDIRU2 reg\n */
/* 111 */	1,	/*  rdlong %c, %0 ' reg <- CVUU4 INDIRU4 reg\n */
/* 112 */	1,	/*  rdbyte %c, %0 ' reg <- CVUI1 INDIRU1 reg\n */
/* 113 */	1,	/*  rdbyte %c, %0 ' reg <- CVUI2 INDIRU1 reg\n */
/* 114 */	1,	/*  rdword %c, %0 ' reg <- CVUI2 INDIRU2 reg\n */
/* 115 */	1,	/*  rdbyte %c, %0 ' reg <- CVUI4 INDIRU1 reg\n */
/* 116 */	1,	/*  rdword %c, %0 ' reg <- CVUI4 INDIRU2 reg\n */
/* 117 */	1,	/*  rdlong %c, %0 ' reg <- CVUI4 INDIRU4 reg\n */
/* 118 */	1,	/*  mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- CVUU1 INDIRU1 reg\n */
/* 119 */	1,	/*  mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- CVUU2 INDIRU1 reg\n */
/* 120 */	1,	/*  mov RI, %0\n jmp #RWRD\n mov %c, BC ' reg <- CVUU2 INDIRU2 reg\n */
/* 121 */	1,	/*  mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- CVUU4 INDIRU1 reg\n */
/* 122 */	1,	/*  mov RI, %0\n jmp #RWRD\n mov %c, BC ' reg <- CVUU4 INDIRU2 reg\n */
/* 123 */	1,	/*  mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- CVUU4 INDIRU4 reg\n */
/* 124 */	1,	/*  mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- CVUI1 INDIRU1 reg\n */
/* 125 */	1,	/*  mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- CVUI2 INDIRU1 reg\n */
/* 126 */	1,	/*  mov RI, %0\n jmp #RWRD\n mov %c, BC ' reg <- CVUI2 INDIRU2 reg\n */
/* 127 */	1,	/*  mov RI, %0\n jmp #RBYT\n mov %c, BC ' reg <- CVUI4 INDIRU1 reg\n */
/* 128 */	1,	/*  mov RI, %0\n jmp #RWRD\n mov %c, BC ' reg <- CVUI4 INDIRU2 reg\n */
/* 129 */	1,	/*  mov RI, %0\n jmp #RLNG\n mov %c, BC ' reg <- CVUI4 INDIRU4 reg\n */
/* 130 */	1,	/*  jmp #LODL\n long @%0\n mov BC, %1\n jmp #WBYT ' ASGNI1 addrg reg\n */
/* 131 */	1,	/*  jmp #LODL\n long @%0\n mov BC, %1\n jmp #WWRD ' ASGNI2 addrg reg\n */
/* 132 */	1,	/*  jmp #LODL\n long @%0\n mov BC, %1\n jmp #WLNG ' ASGNI4 addrg reg\n */
/* 133 */	1,	/*  jmp #LODL\n long @%0\n mov BC, %1\n jmp #WBYT ' ASGNU1 addrg reg\n */
/* 134 */	1,	/*  jmp #LODL\n long @%0\n mov BC, %1\n jmp #WWRD ' ASGNU2 addrg reg\n */
/* 135 */	1,	/*  jmp #LODL\n long @%0\n mov BC, %1\n jmp #WLNG ' ASGNU4 addrg reg\n */
/* 136 */	1,	/*  jmp #LODL\n long @%0\n mov BC, %1\n jmp #WLNG ' ASGNF4 addrg reg\n */
/* 137 */	1,	/*  jmp #LODL\n long @%0\n mov BC, %1\n jmp #WLNG ' ASGNP4 addrg reg\n */
/* 138 */	1,	/*  mov %0, %1 ' ASGNI1 special reg\n */
/* 139 */	1,	/*  mov %0, %1 ' ASGNI2 special reg\n */
/* 140 */	1,	/*  mov %0, %1 ' ASGNI4 special reg\n */
/* 141 */	1,	/*  mov %0, %1 ' ASGNU1 special reg\n */
/* 142 */	1,	/*  mov %0, %1 ' ASGNU2 special reg\n */
/* 143 */	1,	/*  mov %0, %1 ' ASGNU4 special reg\n */
/* 144 */	1,	/*  mov %0, %1 ' ASGNF4 special reg\n */
/* 145 */	1,	/*  mov %0, %1 ' ASGNP4 special reg\n */
/* 146 */	1,	/*  mov %0, #%1 ' ASGNI1 special coni\n */
/* 147 */	1,	/*  mov %0, #%1 ' ASGNI2 special coni\n */
/* 148 */	1,	/*  mov %0, #%1 ' ASGNI4 special coni\n */
/* 149 */	1,	/*  mov %0, #%1 ' ASGNU1 special coni\n */
/* 150 */	1,	/*  mov %0, #%1 ' ASGNU2 special coni\n */
/* 151 */	1,	/*  mov %0, #%1 ' ASGNU4 special coni\n */
/* 152 */	1,	/*  mov %0, #%1 ' ASGNF4 special coni\n */
/* 153 */	1,	/*  mov %0, #%1 ' ASGNP4 special coni\n */
/* 154 */	1,	/*  jmp #LODF\n long %0\n wrbyte %1, RI ' ASGNI1 addrl reg\n */
/* 155 */	1,	/*  jmp #LODF\n long %0\n wrword %1, RI ' ASGNI2 addrl reg\n */
/* 156 */	1,	/*  jmp #LODF\n long %0\n wrlong %1, RI ' ASGNI4 addrl reg\n */
/* 157 */	1,	/*  jmp #LODF\n long %0\n wrbyte %1, RI ' ASGNU1 addrl reg\n */
/* 158 */	1,	/*  jmp #LODF\n long %0\n wrword %1, RI ' ASGNU2 addrl reg\n */
/* 159 */	1,	/*  jmp #LODF\n long %0\n wrlong %1, RI ' ASGNU4 addrl reg\n */
/* 160 */	1,	/*  jmp #LODF\n long %0\n wrlong %1, RI ' ASGNF4 addrl reg\n */
/* 161 */	1,	/*  jmp #LODF\n long %0\n wrlong %1, RI ' ASGNP4 addrl reg\n */
/* 162 */	1,	/*  mov RI, FP\n sub RI, #-(%0)\n wrbyte %1, RI ' ASGNI1 addrli reg\n */
/* 163 */	1,	/*  mov RI, FP\n sub RI, #-(%0)\n wrword %1, RI ' ASGNI2 addrli reg\n */
/* 164 */	1,	/*  mov RI, FP\n sub RI, #-(%0)\n wrlong %1, RI ' ASGNI4 addrli reg\n */
/* 165 */	1,	/*  mov RI, FP\n sub RI, #-(%0)\n wrbyte %1, RI ' ASGNU1 addrli reg\n */
/* 166 */	1,	/*  mov RI, FP\n sub RI, #-(%0)\n wrword %1, RI ' ASGNU2 addrli reg\n */
/* 167 */	1,	/*  mov RI, FP\n sub RI, #-(%0)\n wrlong %1, RI ' ASGNU4 addrli reg\n */
/* 168 */	1,	/*  mov RI, FP\n sub RI, #-(%0)\n wrlong %1, RI ' ASGNF4 addrli reg\n */
/* 169 */	1,	/*  mov RI, FP\n sub RI, #-(%0)\n wrlong %1, RI ' ASGNP4 addrli reg\n */
/* 170 */	1,	/*  mov RI, FP\n add RI, #%0\n wrbyte %1, RI ' ASGNI1 addrfi reg\n */
/* 171 */	1,	/*  mov RI, FP\n add RI, #%0\n wrword %1, RI ' ASGNI2 addrfi reg\n */
/* 172 */	1,	/*  mov RI, FP\n add RI, #%0\n wrlong %1, RI ' ASGNI4 addrfi reg\n */
/* 173 */	1,	/*  mov RI, FP\n add RI, #%0\n wrbyte %1, RI ' ASGNU1 addrfi reg\n */
/* 174 */	1,	/*  mov RI, FP\n add RI, #%0\n wrword %1, RI ' ASGNU2 addrfi reg\n */
/* 175 */	1,	/*  mov RI, FP\n add RI, #%0\n wrlong %1, RI ' ASGNU4 addrfi reg\n */
/* 176 */	1,	/*  mov RI, FP\n add RI, #%0\n wrlong %1, RI ' ASGNF4 addrfi reg\n */
/* 177 */	1,	/*  mov RI, FP\n add RI, #%0\n wrlong %1, RI ' ASGNP4 addrfi reg\n */
/* 178 */	1,	/*  mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNI1 addrli special\n */
/* 179 */	1,	/*  mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNI2 addrli special\n */
/* 180 */	1,	/*  mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNI4 addrli special\n */
/* 181 */	1,	/*  mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNU1 addrli special\n */
/* 182 */	1,	/*  mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNU2 addrli special\n */
/* 183 */	1,	/*  mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNU4 addrli special\n */
/* 184 */	1,	/*  mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNF4 addrli special\n */
/* 185 */	1,	/*  mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNP4 addrli special\n */
/* 186 */	1,	/*  mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNI1 addrfi special\n */
/* 187 */	1,	/*  mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNI2 addrfi special\n */
/* 188 */	1,	/*  mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNI4 addrfi special\n */
/* 189 */	1,	/*  mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNU1 addrfi special\n */
/* 190 */	1,	/*  mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNU2 addrfi special\n */
/* 191 */	1,	/*  mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNU4 addrfi special\n */
/* 192 */	1,	/*  mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNF4 addrfi special\n */
/* 193 */	1,	/*  mov BC, FP\n sub BC, #-(%0)\n wrlong %1, BC ' ASGNP4 addrfi special\n */
/* 194 */	1,	/*  mov RI, %0\n mov BC, %1\n jmp #WBYT ' ASGNI1 reg reg\n */
/* 195 */	1,	/*  mov RI, %0\n mov BC, %1\n jmp #WWRD ' ASGNI2 reg reg\n */
/* 196 */	1,	/*  mov RI, %0\n mov BC, %1\n jmp #WLNG ' ASGNI4 reg reg\n */
/* 197 */	1,	/*  mov RI, %0\n mov BC, %1\n jmp #WBYT ' ASGNU1 reg reg\n */
/* 198 */	1,	/*  mov RI, %0\n mov BC, %1\n jmp #WWRD ' ASGNU2 reg reg\n */
/* 199 */	1,	/*  mov RI, %0\n mov BC, %1\n jmp #WLNG ' ASGNU4 reg reg\n */
/* 200 */	1,	/*  mov RI, %0\n mov BC, %1\n jmp #WLNG ' ASGNF4 reg reg\n */
/* 201 */	1,	/*  mov RI, %0\n mov BC, %1\n jmp #WLNG ' ASGNP4 reg reg\n */
/* 202 */	1,	/* # call\n */
/* 203 */	1,	/* # call\n */
/* 204 */	1,	/* # call\n */
/* 205 */	1,	/* # call\n */
/* 206 */	1,	/* # call\n */
/* 207 */	1,	/* # call\n */
/* 208 */	1,	/* # call\n */
/* 209 */	1,	/* # call\n */
/* 210 */	1,	/* # call\n */
/* 211 */	1,	/* # call\n */
/* 212 */	1,	/* # ret\n */
/* 213 */	1,	/* # ret\n */
/* 214 */	1,	/* # ret\n */
/* 215 */	1,	/* # ret\n */
/* 216 */	1,	/*  mov r0, #%0 ' RET coni\n */
/* 217 */	1,	/*  mov r0, #%0 ' RET coni\n */
/* 218 */	1,	/*  mov r0, #%0 ' RET coni\n */
/* 219 */	1,	/*  jmp #LODL\n long %0\n mov r0, RI ' RET con\n */
/* 220 */	1,	/*  jmp #LODL\n long %0\n mov r0, RI ' RET con\n */
/* 221 */	1,	/*  jmp #LODL\n long %0\n mov r0, RI ' RET con\n */
/* 222 */	1,	/*  jmp #LODL\n long %0\n mov r0, RI ' RET con\n */
/* 223 */	1,	/* # zero extend\n */
/* 224 */	1,	/* # zero extend\n */
/* 225 */	1,	/* # zero extend\n */
/* 226 */	1,	/* # truncate\n */
/* 227 */	1,	/* # truncate\n */
/* 228 */	1,	/* # truncate\n */
/* 229 */	1,	/* ? mov %c, %0 ' CVUP4\n */
/* 230 */	1,	/* ? mov %c, %0 ' CVPU4\n */
/* 231 */	1,	/* # sign extend\n */
/* 232 */	1,	/* # sign extend\n */
/* 233 */	1,	/* # sign extend\n */
/* 234 */	1,	/* # truncate\n */
/* 235 */	1,	/* # truncate\n */
/* 236 */	1,	/* # truncate\n */
/* 237 */	0,	/* # nothing */
/* 238 */	1,	/*  jmp #INFL ' CVFI4\n */
/* 239 */	1,	/*  jmp #FLIN ' CVIF4\n */
/* 240 */	1,	/*  neg %c, %0 ' NEGI4\n */
/* 241 */	1,	/* ? mov %c, %0\n xor %c, Bit31 ' NEGF4\n */
/* 242 */	1,	/* ? mov %c, %0\n xor %c, all_1s ' BCOMI4\n */
/* 243 */	1,	/* ? mov %c, %0\n xor %c, all_1s ' BCOMU4\n */
/* 244 */	1,	/* # mov RI, %0\n adds RI, %1\n mov %c, RI ' ADDI4 reg\n */
/* 245 */	1,	/* # mov RI, %0\n add RI, %1\n mov %c, RI ' ADDU4 reg\n */
/* 246 */	1,	/* # mov RI, %0\n adds RI, %1\n mov %c, RI ' ADDP4 reg\n */
/* 247 */	1,	/* # jmp #FADD ' ADDF4\n */
/* 248 */	1,	/* ? mov %c, %0\n adds %c, #%1 ' ADDI4 coni\n */
/* 249 */	1,	/* ? mov %c, %0\n add %c, #%1 ' ADDU4 coni\n */
/* 250 */	1,	/* ? mov %c, %0\n adds %c, #%1 ' ADDP4 coni\n */
/* 251 */	1,	/* # mov RI, %0\n and RI, %1\n mov %c, RI ' BANDI4 reg\n */
/* 252 */	1,	/* # mov RI, %0\n and RI, %1\n mov %c, RI ' BANDU4 reg\n */
/* 253 */	1,	/* ? mov %c, %0\n and %c, #%1 ' BANDI4 coni\n */
/* 254 */	1,	/* ? mov %c, %0\n and %c, #%1 ' BANDU4 coni\n */
/* 255 */	1,	/* # mov RI, %0\n or RI, %1\n mov %c, RI ' BORI4 reg\n */
/* 256 */	1,	/* # mov RI, %0\n or RI, %1\n mov %c, RI ' BORU4 reg\n */
/* 257 */	1,	/* ? mov %c, %0\n or %c, #%1 ' BORI4 coni\n */
/* 258 */	1,	/* ? mov %c, %0\n or %c, #%1 ' BORU4 coni\n */
/* 259 */	1,	/* # mov RI, %0\n xor RI, %1\n mov %c, RI ' BXORI4 reg\n */
/* 260 */	1,	/* # mov RI, %0\n xor RI, %1\n mov %c, RI ' BXORU4 reg\n */
/* 261 */	1,	/* ? mov %c, %0\n xor %c, #%1 ' BXORI4 coni\n */
/* 262 */	1,	/* ? mov %c, %0\n xor %c, #%1 ' BXORU4 coni\n */
/* 263 */	1,	/* # mov RI, %0\n subs RI, %1\n mov %c, RI ' SUBI4 reg\n */
/* 264 */	1,	/* # mov RI, %0\n sub RI, %1\n mov %c, RI ' SUBU4 reg\n */
/* 265 */	1,	/* # mov RI, %0\n subs RI, %1\n mov %c, RI ' SUBP4 reg\n */
/* 266 */	1,	/* # jmp #FSUB ' SUBF4\n */
/* 267 */	1,	/* ? mov %c, %0\n subs %c, #%1 ' SUBI4 coni\n */
/* 268 */	1,	/* ? mov %c, %0\n sub %c, #%1 ' SUBU4 coni\n */
/* 269 */	1,	/* ? mov %c, %0\n subs %c, #%1 ' SUBP4 coni\n */
/* 270 */	1,	/* # jmp #DIVS ' DIVI4\n */
/* 271 */	1,	/* # jmp #DIVU ' DIVU4\n */
/* 272 */	1,	/* # jmp #FDIV ' DIVF4\n */
/* 273 */	1,	/* # jmp #DIVS ' MODI4\n */
/* 274 */	1,	/* # jmp #DIVU ' MODU4\n */
/* 275 */	1,	/* # jmp #MULT ' MULI4\n */
/* 276 */	1,	/* # jmp #MULT ' MULU4\n */
/* 277 */	1,	/* # jmp #FMUL ' MULF4\n */
/* 278 */	1,	/* # mov RI, %0\n shl RI, %1\n mov %c, RI ' LSHI4 reg\n */
/* 279 */	1,	/* # mov RI, %0\n shl RI, %1\n mov %c, RI ' LSHU4 reg\n */
/* 280 */	1,	/* ? mov %c, %0\n shl %c, #%1 ' LSHI4 coni\n */
/* 281 */	1,	/* ? mov %c, %0\n shl %c, #%1 ' LSHU4 coni\n */
/* 282 */	1,	/* # mov RI, %0\n sar RI, %1\n mov %c, RI ' RSHI4 reg\n */
/* 283 */	1,	/* # mov RI, %0\n shr RI, %1\n mov %c, RI ' RSHU4 reg\n */
/* 284 */	1,	/* ? mov %c, %0\n sar %c, #%1 ' RSHI4 coni\n */
/* 285 */	1,	/* ? mov %c, %0\n shr %c, #%1 ' RSHU4 coni\n */
/* 286 */	1,	/*  and %0, #%2 ' ASGNI4 special BAND4 special coni\n */
/* 287 */	1,	/*  and %0, #%2 ' ASGNU4 special BAND4 special coni\n */
/* 288 */	1,	/*  and %0, %2 ' ASGNI4 special BAND4 special reg\n */
/* 289 */	1,	/*  and %0, %2 ' ASGNU4 special BAND4 special reg\n */
/* 290 */	1,	/*  or %0, #%2 ' ASGNI4 special BOR4 special coni\n */
/* 291 */	1,	/*  or %0, #%2 ' ASGNU4 special BOR4 special coni\n */
/* 292 */	1,	/*  or %0, %2 ' ASGNI4 special BOR4 special reg\n */
/* 293 */	1,	/*  or %0, %2 ' ASGNU4 special BOR4 special reg\n */
/* 294 */	1,	/*  xor %0, #%2 ' ASGNI4 special BXOR4 special coni\n */
/* 295 */	1,	/*  xor %0, #%2 ' ASGNU4 special BXOR4 special coni\n */
/* 296 */	1,	/*  xor %0, %2 ' ASGNI4 special BXOR4 special reg\n */
/* 297 */	1,	/*  xor %0, %2 ' ASGNU4 special BXOR4 special reg\n */
/* 298 */	1,	/*  adds %0, #%2 ' ASGNI4 special BADD4 special coni\n */
/* 299 */	1,	/*  add %0, #%2 ' ASGNU4 special BADD4 special coni\n */
/* 300 */	1,	/*  adds %0, %2 ' ASGNI4 special BADD4 special reg\n */
/* 301 */	1,	/*  add %0, %2 ' ASGNU4 special BADD4 special reg\n */
/* 302 */	1,	/*  subs %0, #%2 ' ASGNI4 special BSUB4 special coni\n */
/* 303 */	1,	/*  sub %0, #%2 ' ASGNU4 special BSUB4 special coni\n */
/* 304 */	1,	/*  subs %0, %2 ' ASGNI4 special BSUB4 special reg\n */
/* 305 */	1,	/*  sub %0, %2 ' ASGNU4 special BSUB4 special reg\n */
/* 306 */	1,	/*  shl %0, #%2 ' ASGNI4 special LSH4 special coni\n */
/* 307 */	1,	/*  shl %0, #%2 ' ASGNU4 special LSH4 special coni\n */
/* 308 */	1,	/*  shl %0, %2 ' ASGNI4 special LSH4 special reg\n */
/* 309 */	1,	/*  shl %0, %2 ' ASGNU4 special LSH4 special reg\n */
/* 310 */	1,	/*  shr %0, #%2 ' ASGNI4 special RSH4 special coni\n */
/* 311 */	1,	/*  shr %0, #%2 ' ASGNU4 special RSH4 special coni\n */
/* 312 */	1,	/*  shr %0, %2 ' ASGNI4 special RSH4 special reg\n */
/* 313 */	1,	/*  shr %0, %2 ' ASGNU4 special RSH4 special reg\n */
/* 314 */	1,	/*  cmps %0, %1 wz\n jmp #BR_Z\n long @%a ' EQI4\n */
/* 315 */	1,	/*  cmp %0, %1 wz\n jmp #BR_Z\n long @%a ' EQU4\n */
/* 316 */	1,	/* # jmp #FCMP\n jmp #BR_Z\n long @%a ' EQF4\n */
/* 317 */	1,	/*  cmps %0, %1 wz\n jmp #BRNZ\n long @%a ' NEI4\n */
/* 318 */	1,	/*  cmp %0, %1 wz\n jmp #BRNZ\n long @%a ' NEU4\n */
/* 319 */	1,	/* # jmp #FCMP\n jmp #BRNZ\n long @%a ' NEF4\n */
/* 320 */	1,	/*  cmps %0, %1 wz,wc\n jmp #BRAE\n long @%a ' GEI4\n */
/* 321 */	1,	/*  cmp %0, %1 wz,wc \n jmp #BRAE\n long @%a ' GEU4\n */
/* 322 */	1,	/* # jmp #FCMP\n jmp #BRAE\n long @%a ' GEF4\n */
/* 323 */	1,	/*  cmps %0, %1 wz,wc\n jmp #BR_A\n long @%a ' GTI4\n */
/* 324 */	1,	/*  cmp %0, %1 wz,wc \n jmp #BR_A\n long @%a ' GTU4\n */
/* 325 */	1,	/* # jmp #FCMP\n jmp #BR_A\n long @%a ' GTF4\n */
/* 326 */	1,	/*  cmps %0, %1 wz,wc\n jmp #BRBE\n long @%a ' LEI4\n */
/* 327 */	1,	/*  cmp %0, %1 wz,wc \n jmp #BRBE\n long @%a ' LEU4\n */
/* 328 */	1,	/* # jmp #FCMP\n jmp #BRBE\n long @%a '  LEF4\n */
/* 329 */	1,	/*  cmps %0, %1 wz,wc\n jmp #BR_B\n long @%a ' LTI4\n */
/* 330 */	1,	/*  cmp %0, %1 wz,wc \n jmp #BR_B\n long @%a' LTU4\n */
/* 331 */	1,	/* # jmp #FCMP\n jmp #BR_B\n long @%a ' LTF4\n */
/* 332 */	1,	/* # ARGB\n */
/* 333 */	1,	/* # ASGNB\n */
/* 334 */	1,	/*  rdlong RI, %0\n jmp #JMPI ' JUMPV reg\n */
/* 335 */	1,	/*  mov RI, %0\n jmp #RLNG\n mov RI, BC\n jmp #JMPI ' JUMPV reg\n */
/* 336 */	1,	/*  mov RI, %0\n jmp #RLNG\n mov RI, BC\n jmp #JMPI ' JUMPV reg\n */
/* 337 */	1,	/*  jmp #JMPA\n long @%0 ' JUMPV addrg\n */
/* 338 */	1,	/* # %a\n */
/* 339 */	1,	/* # jmp #LODL\n long %0\n jmp #PSHL ' ARGI4 addrg\n */
/* 340 */	1,	/* # jmp #LODL\n long %0\n jmp #PSHL ' ARGU4 addrg\n */
/* 341 */	1,	/* # jmp #LODL\n long %0\n jmp #PSHL ' ARGP4 addrg\n */
/* 342 */	1,	/* # jmp #LODL\n long %0\n jmp #PSHL ' ARGF4 addrg\n */
/* 343 */	1,	/* # mov RI, #%0\n jmp #PSHL ' ARGI4\n */
/* 344 */	1,	/* # mov RI, #%0\n jmp #PSHL ' ARGU4\n */
/* 345 */	1,	/* # mov RI, #%0\n jmp #PSHL ' ARGP4\n */
/* 346 */	1,	/* # mov RI, #%0\n jmp #PSHL ' ARGF4\n */
/* 347 */	1,	/* # mov RI, %0\n jmp #PSHL ' ARGI4\n */
/* 348 */	1,	/* # mov RI, %0\n jmp #PSHL ' ARGU4\n */
/* 349 */	1,	/* # mov RI, %0\n jmp #PSHL ' ARGP4\n */
/* 350 */	1,	/* # mov RI, %0\n jmp #PSHL ' ARGF4\n */
/* 351 */	1,	/* # jmp #LODL\n long @%0\n jmp #PSHL ' ARGI4 ADDRGP4\n */
/* 352 */	1,	/* # jmp #LODL\n long @%0\n jmp #PSHL ' ARGU4 ADDRGP4\n */
/* 353 */	1,	/* # jmp #LODL\n long @%0\n jmp #PSHL ' ARGP4 ADDRGP4\n */
/* 354 */	1,	/* # jmp #LODL\n long @%0\n jmp #PSHL ' ARGF4 ADDRGP4\n */
/* 355 */	1,	/* # jmp #LODF\n long %0\n jmp #PSHL ' ARGI4 ADDRLP4\n */
/* 356 */	1,	/* # jmp #LODF\n long %0\n jmp #PSHL ' ARGU4 ADDRLP4\n */
/* 357 */	1,	/* # jmp #LODF\n long %0\n jmp #PSHL ' ARGP4 ADDRLP4\n */
/* 358 */	1,	/* # jmp #LODF\n long %0\n jmp #PSHL ' ARGF4 ADDRLP4\n */
/* 359 */	1,	/* # jmp #LODF\n long %0\n jmp #PSHL ' ARGI4 ADDRFP4\n */
/* 360 */	1,	/* # jmp #LODF\n long %0\n jmp #PSHL ' ARGU4 ADDRFP4\n */
/* 361 */	1,	/* # jmp #LODF\n long %0\n jmp #PSHL ' ARGP4 ADDRFP4\n */
/* 362 */	1,	/* # jmp #LODF\n long %0\n jmp #PSHL ' ARGF4 ADDRFP4\n */
/* 363 */	1,	/* # jmp #PSHA\n long @%0 ' ARGI4 INDIRI4 ADDRGP4\n */
/* 364 */	1,	/* # jmp #PSHA\n long @%0 ' ARGU4 INDIRU4 ADDRGP4\n */
/* 365 */	1,	/* # jmp #PSHA\n long @%0 ' ARGP4 INDIRP4 ADDRGP4\n */
/* 366 */	1,	/* # jmp #PSHA\n long @%0 ' ARGF4 INDIRF4 ADDRGP4\n */
/* 367 */	1,	/* # jmp #PSHF\n long %0 ' ARGI4 INDIRI4 ADDRLP4\n */
/* 368 */	1,	/* # jmp #PSHF\n long %0 ' ARGU4 INDIRU4 ADDRLP4\n */
/* 369 */	1,	/* # jmp #PSHF\n long %0 ' ARGP4 INDIRP4 ADDRLP4\n */
/* 370 */	1,	/* # jmp #PSHF\n long %0 ' ARGF4 INDIRF4 ADDRLP4\n */
/* 371 */	1,	/* # jmp #PSHF\n long %0 ' ARGI4 INDIRI4 ADDRFP4\n */
/* 372 */	1,	/* # jmp #PSHF\n long %0 ' ARGU4 INDIRU4 ADDRFP4\n */
/* 373 */	1,	/* # jmp #PSHF\n long %0 ' ARGP4 INDIRP4 ADDRFP4\n */
/* 374 */	1,	/* # jmp #PSHF\n long %0 ' ARGF4 INDIRF4 ADDRFP4\n */
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
/* 33 */	"con: CNSTI1",
/* 34 */	"con: CNSTI2",
/* 35 */	"con: CNSTI4",
/* 36 */	"con: CNSTU1",
/* 37 */	"con: CNSTU2",
/* 38 */	"con: CNSTU4",
/* 39 */	"con: CNSTP4",
/* 40 */	"con: CNSTF4",
/* 41 */	"addrli: ADDRLP4",
/* 42 */	"addrfi: ADDRFP4",
/* 43 */	"addrg: ADDRGP4",
/* 44 */	"special: ADDRGP4",
/* 45 */	"addrl: ADDRLP4",
/* 46 */	"addrl: ADDRFP4",
/* 47 */	"regl: addrli",
/* 48 */	"regl: addrfi",
/* 49 */	"regl: addrl",
/* 50 */	"regg: addrg",
/* 51 */	"regg: special",
/* 52 */	"reg: regg",
/* 53 */	"reg: regl",
/* 54 */	"reg: con",
/* 55 */	"reg: coni",
/* 56 */	"ri: reg",
/* 57 */	"ri: coni",
/* 58 */	"reg: INDIRI1(regl)",
/* 59 */	"reg: INDIRI2(regl)",
/* 60 */	"reg: INDIRI4(regl)",
/* 61 */	"reg: INDIRU1(regl)",
/* 62 */	"reg: INDIRU2(regl)",
/* 63 */	"reg: INDIRU4(regl)",
/* 64 */	"reg: INDIRF4(regl)",
/* 65 */	"reg: INDIRP4(regl)",
/* 66 */	"reg: INDIRI1(regg)",
/* 67 */	"reg: INDIRI2(regg)",
/* 68 */	"reg: INDIRI4(regg)",
/* 69 */	"reg: INDIRU1(regg)",
/* 70 */	"reg: INDIRU2(regg)",
/* 71 */	"reg: INDIRU4(regg)",
/* 72 */	"reg: INDIRF4(regg)",
/* 73 */	"reg: INDIRP4(regg)",
/* 74 */	"reg: INDIRI1(special)",
/* 75 */	"reg: INDIRI2(special)",
/* 76 */	"reg: INDIRI4(special)",
/* 77 */	"reg: INDIRU1(special)",
/* 78 */	"reg: INDIRU2(special)",
/* 79 */	"reg: INDIRU4(special)",
/* 80 */	"reg: INDIRF4(special)",
/* 81 */	"reg: INDIRP4(special)",
/* 82 */	"reg: INDIRI1(reg)",
/* 83 */	"reg: INDIRI2(reg)",
/* 84 */	"reg: INDIRI4(reg)",
/* 85 */	"reg: INDIRU1(reg)",
/* 86 */	"reg: INDIRU2(reg)",
/* 87 */	"reg: INDIRU4(reg)",
/* 88 */	"reg: INDIRF4(reg)",
/* 89 */	"reg: INDIRP4(reg)",
/* 90 */	"reg: INDIRI1(addrg)",
/* 91 */	"reg: INDIRI2(addrg)",
/* 92 */	"reg: INDIRI4(addrg)",
/* 93 */	"reg: INDIRU1(addrg)",
/* 94 */	"reg: INDIRU2(addrg)",
/* 95 */	"reg: INDIRU4(addrg)",
/* 96 */	"reg: INDIRF4(addrg)",
/* 97 */	"reg: INDIRP4(addrg)",
/* 98 */	"reg: INDIRI1(addrl)",
/* 99 */	"reg: INDIRI2(addrl)",
/* 100 */	"reg: INDIRI4(addrl)",
/* 101 */	"reg: INDIRU1(addrl)",
/* 102 */	"reg: INDIRU2(addrl)",
/* 103 */	"reg: INDIRU4(addrl)",
/* 104 */	"reg: INDIRF4(addrl)",
/* 105 */	"reg: INDIRP4(addrl)",
/* 106 */	"reg: CVUU1(INDIRU1(regl))",
/* 107 */	"reg: CVUU2(INDIRU1(regl))",
/* 108 */	"reg: CVUU2(INDIRU2(regl))",
/* 109 */	"reg: CVUU4(INDIRU1(regl))",
/* 110 */	"reg: CVUU4(INDIRU2(regl))",
/* 111 */	"reg: CVUU4(INDIRU4(regl))",
/* 112 */	"reg: CVUI1(INDIRU1(regl))",
/* 113 */	"reg: CVUI2(INDIRU1(regl))",
/* 114 */	"reg: CVUI2(INDIRU2(regl))",
/* 115 */	"reg: CVUI4(INDIRU1(regl))",
/* 116 */	"reg: CVUI4(INDIRU2(regl))",
/* 117 */	"reg: CVUI4(INDIRU4(regl))",
/* 118 */	"reg: CVUU1(INDIRU1(regg))",
/* 119 */	"reg: CVUU2(INDIRU1(regg))",
/* 120 */	"reg: CVUU2(INDIRU2(regg))",
/* 121 */	"reg: CVUU4(INDIRU1(regg))",
/* 122 */	"reg: CVUU4(INDIRU2(regg))",
/* 123 */	"reg: CVUU4(INDIRU4(regg))",
/* 124 */	"reg: CVUI1(INDIRU1(regg))",
/* 125 */	"reg: CVUI2(INDIRU1(regg))",
/* 126 */	"reg: CVUI2(INDIRU2(regg))",
/* 127 */	"reg: CVUI4(INDIRU1(regg))",
/* 128 */	"reg: CVUI4(INDIRU2(regg))",
/* 129 */	"reg: CVUI4(INDIRU4(regg))",
/* 130 */	"stmt: ASGNI1(addrg,reg)",
/* 131 */	"stmt: ASGNI2(addrg,reg)",
/* 132 */	"stmt: ASGNI4(addrg,reg)",
/* 133 */	"stmt: ASGNU1(addrg,reg)",
/* 134 */	"stmt: ASGNU2(addrg,reg)",
/* 135 */	"stmt: ASGNU4(addrg,reg)",
/* 136 */	"stmt: ASGNF4(addrg,reg)",
/* 137 */	"stmt: ASGNP4(addrg,reg)",
/* 138 */	"stmt: ASGNI1(special,reg)",
/* 139 */	"stmt: ASGNI2(special,reg)",
/* 140 */	"stmt: ASGNI4(special,reg)",
/* 141 */	"stmt: ASGNU1(special,reg)",
/* 142 */	"stmt: ASGNU2(special,reg)",
/* 143 */	"stmt: ASGNU4(special,reg)",
/* 144 */	"stmt: ASGNF4(special,reg)",
/* 145 */	"stmt: ASGNP4(special,reg)",
/* 146 */	"stmt: ASGNI1(special,coni)",
/* 147 */	"stmt: ASGNI2(special,coni)",
/* 148 */	"stmt: ASGNI4(special,coni)",
/* 149 */	"stmt: ASGNU1(special,coni)",
/* 150 */	"stmt: ASGNU2(special,coni)",
/* 151 */	"stmt: ASGNU4(special,coni)",
/* 152 */	"stmt: ASGNF4(special,coni)",
/* 153 */	"stmt: ASGNP4(special,coni)",
/* 154 */	"stmt: ASGNI1(addrl,reg)",
/* 155 */	"stmt: ASGNI2(addrl,reg)",
/* 156 */	"stmt: ASGNI4(addrl,reg)",
/* 157 */	"stmt: ASGNU1(addrl,reg)",
/* 158 */	"stmt: ASGNU2(addrl,reg)",
/* 159 */	"stmt: ASGNU4(addrl,reg)",
/* 160 */	"stmt: ASGNF4(addrl,reg)",
/* 161 */	"stmt: ASGNP4(addrl,reg)",
/* 162 */	"stmt: ASGNI1(addrli,reg)",
/* 163 */	"stmt: ASGNI2(addrli,reg)",
/* 164 */	"stmt: ASGNI4(addrli,reg)",
/* 165 */	"stmt: ASGNU1(addrli,reg)",
/* 166 */	"stmt: ASGNU2(addrli,reg)",
/* 167 */	"stmt: ASGNU4(addrli,reg)",
/* 168 */	"stmt: ASGNF4(addrli,reg)",
/* 169 */	"stmt: ASGNP4(addrli,reg)",
/* 170 */	"stmt: ASGNI1(addrfi,reg)",
/* 171 */	"stmt: ASGNI2(addrfi,reg)",
/* 172 */	"stmt: ASGNI4(addrfi,reg)",
/* 173 */	"stmt: ASGNU1(addrfi,reg)",
/* 174 */	"stmt: ASGNU2(addrfi,reg)",
/* 175 */	"stmt: ASGNU4(addrfi,reg)",
/* 176 */	"stmt: ASGNF4(addrfi,reg)",
/* 177 */	"stmt: ASGNP4(addrfi,reg)",
/* 178 */	"stmt: ASGNI1(addrli,special)",
/* 179 */	"stmt: ASGNI2(addrli,special)",
/* 180 */	"stmt: ASGNI4(addrli,special)",
/* 181 */	"stmt: ASGNU1(addrli,special)",
/* 182 */	"stmt: ASGNU2(addrli,special)",
/* 183 */	"stmt: ASGNU4(addrli,special)",
/* 184 */	"stmt: ASGNF4(addrli,special)",
/* 185 */	"stmt: ASGNP4(addrli,special)",
/* 186 */	"stmt: ASGNI1(addrfi,special)",
/* 187 */	"stmt: ASGNI2(addrfi,special)",
/* 188 */	"stmt: ASGNI4(addrfi,special)",
/* 189 */	"stmt: ASGNU1(addrfi,special)",
/* 190 */	"stmt: ASGNU2(addrfi,special)",
/* 191 */	"stmt: ASGNU4(addrfi,special)",
/* 192 */	"stmt: ASGNF4(addrfi,special)",
/* 193 */	"stmt: ASGNP4(addrfi,special)",
/* 194 */	"stmt: ASGNI1(reg,reg)",
/* 195 */	"stmt: ASGNI2(reg,reg)",
/* 196 */	"stmt: ASGNI4(reg,reg)",
/* 197 */	"stmt: ASGNU1(reg,reg)",
/* 198 */	"stmt: ASGNU2(reg,reg)",
/* 199 */	"stmt: ASGNU4(reg,reg)",
/* 200 */	"stmt: ASGNF4(reg,reg)",
/* 201 */	"stmt: ASGNP4(reg,reg)",
/* 202 */	"reg: CALLI4(addrg)",
/* 203 */	"reg: CALLU4(addrg)",
/* 204 */	"reg: CALLP4(addrg)",
/* 205 */	"reg: CALLF4(addrg)",
/* 206 */	"reg: CALLV(addrg)",
/* 207 */	"reg: CALLI4(reg)",
/* 208 */	"reg: CALLU4(reg)",
/* 209 */	"reg: CALLP4(reg)",
/* 210 */	"reg: CALLF4(reg)",
/* 211 */	"reg: CALLV(reg)",
/* 212 */	"stmt: RETI4(reg)",
/* 213 */	"stmt: RETU4(reg)",
/* 214 */	"stmt: RETP4(reg)",
/* 215 */	"stmt: RETF4(reg)",
/* 216 */	"stmt: RETI4(coni)",
/* 217 */	"stmt: RETU4(coni)",
/* 218 */	"stmt: RETP4(coni)",
/* 219 */	"stmt: RETI4(con)",
/* 220 */	"stmt: RETU4(con)",
/* 221 */	"stmt: RETP4(con)",
/* 222 */	"stmt: RETF4(con)",
/* 223 */	"reg: CVUI1(reg)",
/* 224 */	"reg: CVUI2(reg)",
/* 225 */	"reg: CVUI4(reg)",
/* 226 */	"reg: CVUU1(reg)",
/* 227 */	"reg: CVUU2(reg)",
/* 228 */	"reg: CVUU4(reg)",
/* 229 */	"reg: CVUP4(reg)",
/* 230 */	"reg: CVPU4(reg)",
/* 231 */	"reg: CVII1(reg)",
/* 232 */	"reg: CVII2(reg)",
/* 233 */	"reg: CVII4(reg)",
/* 234 */	"reg: CVIU1(reg)",
/* 235 */	"reg: CVIU2(reg)",
/* 236 */	"reg: CVIU4(reg)",
/* 237 */	"reg: CVFF4(reg)",
/* 238 */	"reg: CVFI4(reg)",
/* 239 */	"reg: CVIF4(reg)",
/* 240 */	"reg: NEGI4(ri)",
/* 241 */	"reg: NEGF4(reg)",
/* 242 */	"reg: BCOMI4(ri)",
/* 243 */	"reg: BCOMU4(ri)",
/* 244 */	"reg: ADDI4(reg,reg)",
/* 245 */	"reg: ADDU4(reg,reg)",
/* 246 */	"reg: ADDP4(reg,reg)",
/* 247 */	"reg: ADDF4(reg,reg)",
/* 248 */	"reg: ADDI4(reg,coni)",
/* 249 */	"reg: ADDU4(reg,coni)",
/* 250 */	"reg: ADDP4(reg,coni)",
/* 251 */	"reg: BANDI4(reg,reg)",
/* 252 */	"reg: BANDU4(reg,reg)",
/* 253 */	"reg: BANDI4(reg,coni)",
/* 254 */	"reg: BANDU4(reg,coni)",
/* 255 */	"reg: BORI4(reg,reg)",
/* 256 */	"reg: BORU4(reg,reg)",
/* 257 */	"reg: BORI4(reg,coni)",
/* 258 */	"reg: BORU4(reg,coni)",
/* 259 */	"reg: BXORI4(reg,reg)",
/* 260 */	"reg: BXORU4(reg,reg)",
/* 261 */	"reg: BXORI4(reg,coni)",
/* 262 */	"reg: BXORU4(reg,coni)",
/* 263 */	"reg: SUBI4(reg,reg)",
/* 264 */	"reg: SUBU4(reg,reg)",
/* 265 */	"reg: SUBP4(reg,reg)",
/* 266 */	"reg: SUBF4(reg,reg)",
/* 267 */	"reg: SUBI4(reg,coni)",
/* 268 */	"reg: SUBU4(reg,coni)",
/* 269 */	"reg: SUBP4(reg,coni)",
/* 270 */	"reg: DIVI4(reg,reg)",
/* 271 */	"reg: DIVU4(reg,reg)",
/* 272 */	"reg: DIVF4(reg,reg)",
/* 273 */	"reg: MODI4(reg,reg)",
/* 274 */	"reg: MODU4(reg,reg)",
/* 275 */	"reg: MULI4(reg,reg)",
/* 276 */	"reg: MULU4(reg,reg)",
/* 277 */	"reg: MULF4(reg,reg)",
/* 278 */	"reg: LSHI4(reg,reg)",
/* 279 */	"reg: LSHU4(reg,reg)",
/* 280 */	"reg: LSHI4(reg,coni)",
/* 281 */	"reg: LSHU4(reg,coni)",
/* 282 */	"reg: RSHI4(reg,reg)",
/* 283 */	"reg: RSHU4(reg,reg)",
/* 284 */	"reg: RSHI4(reg,coni)",
/* 285 */	"reg: RSHU4(reg,coni)",
/* 286 */	"stmt: ASGNI4(special,BANDI4(INDIRI4(special),coni))",
/* 287 */	"stmt: ASGNU4(special,BANDU4(INDIRU4(special),coni))",
/* 288 */	"stmt: ASGNI4(special,BANDI4(INDIRI4(special),reg))",
/* 289 */	"stmt: ASGNU4(special,BANDU4(INDIRU4(special),reg))",
/* 290 */	"stmt: ASGNI4(special,BORI4(INDIRI4(special),coni))",
/* 291 */	"stmt: ASGNU4(special,BORU4(INDIRU4(special),coni))",
/* 292 */	"stmt: ASGNI4(special,BORI4(INDIRI4(special),reg))",
/* 293 */	"stmt: ASGNU4(special,BORU4(INDIRU4(special),reg))",
/* 294 */	"stmt: ASGNI4(special,BXORI4(INDIRI4(special),coni))",
/* 295 */	"stmt: ASGNU4(special,BXORU4(INDIRU4(special),coni))",
/* 296 */	"stmt: ASGNI4(special,BXORI4(INDIRI4(special),reg))",
/* 297 */	"stmt: ASGNU4(special,BXORU4(INDIRU4(special),reg))",
/* 298 */	"stmt: ASGNI4(special,ADDI4(INDIRI4(special),coni))",
/* 299 */	"stmt: ASGNU4(special,ADDU4(INDIRU4(special),coni))",
/* 300 */	"stmt: ASGNI4(special,ADDI4(INDIRI4(special),reg))",
/* 301 */	"stmt: ASGNU4(special,ADDU4(INDIRU4(special),reg))",
/* 302 */	"stmt: ASGNI4(special,SUBI4(INDIRI4(special),coni))",
/* 303 */	"stmt: ASGNU4(special,SUBU4(INDIRU4(special),coni))",
/* 304 */	"stmt: ASGNI4(special,SUBI4(INDIRI4(special),reg))",
/* 305 */	"stmt: ASGNU4(special,SUBU4(INDIRU4(special),reg))",
/* 306 */	"stmt: ASGNI4(special,LSHI4(INDIRI4(special),coni))",
/* 307 */	"stmt: ASGNU4(special,LSHU4(INDIRU4(special),coni))",
/* 308 */	"stmt: ASGNI4(special,LSHI4(INDIRI4(special),reg))",
/* 309 */	"stmt: ASGNU4(special,LSHU4(INDIRU4(special),reg))",
/* 310 */	"stmt: ASGNI4(special,RSHI4(INDIRI4(special),coni))",
/* 311 */	"stmt: ASGNU4(special,RSHU4(INDIRU4(special),coni))",
/* 312 */	"stmt: ASGNI4(special,RSHI4(INDIRI4(special),reg))",
/* 313 */	"stmt: ASGNU4(special,RSHU4(INDIRU4(special),reg))",
/* 314 */	"stmt: EQI4(reg,ri)",
/* 315 */	"stmt: EQU4(reg,ri)",
/* 316 */	"stmt: EQF4(reg,reg)",
/* 317 */	"stmt: NEI4(reg,ri)",
/* 318 */	"stmt: NEU4(reg,ri)",
/* 319 */	"stmt: NEF4(reg,reg)",
/* 320 */	"stmt: GEI4(reg,ri)",
/* 321 */	"stmt: GEU4(reg,ri)",
/* 322 */	"stmt: GEF4(reg,reg)",
/* 323 */	"stmt: GTI4(reg,ri)",
/* 324 */	"stmt: GTU4(reg,ri)",
/* 325 */	"stmt: GTF4(reg,reg)",
/* 326 */	"stmt: LEI4(reg,ri)",
/* 327 */	"stmt: LEU4(reg,ri)",
/* 328 */	"stmt: LEF4(reg,reg)",
/* 329 */	"stmt: LTI4(reg,ri)",
/* 330 */	"stmt: LTU4(reg,ri)",
/* 331 */	"stmt: LTF4(reg,reg)",
/* 332 */	"stmt: ARGB(INDIRB(reg))",
/* 333 */	"stmt: ASGNB(reg,INDIRB(reg))",
/* 334 */	"stmt: JUMPV(INDIRP4(addrl))",
/* 335 */	"stmt: JUMPV(INDIRP4(addrg))",
/* 336 */	"stmt: JUMPV(INDIRP4(reg))",
/* 337 */	"stmt: JUMPV(addrg)",
/* 338 */	"stmt: LABELV",
/* 339 */	"stmt: ARGI4(con)",
/* 340 */	"stmt: ARGU4(con)",
/* 341 */	"stmt: ARGP4(con)",
/* 342 */	"stmt: ARGF4(con)",
/* 343 */	"stmt: ARGI4(coni)",
/* 344 */	"stmt: ARGU4(coni)",
/* 345 */	"stmt: ARGP4(coni)",
/* 346 */	"stmt: ARGF4(coni)",
/* 347 */	"stmt: ARGI4(reg)",
/* 348 */	"stmt: ARGU4(reg)",
/* 349 */	"stmt: ARGP4(reg)",
/* 350 */	"stmt: ARGF4(reg)",
/* 351 */	"stmt: ARGI4(ADDRGP4)",
/* 352 */	"stmt: ARGU4(ADDRGP4)",
/* 353 */	"stmt: ARGP4(ADDRGP4)",
/* 354 */	"stmt: ARGF4(ADDRGP4)",
/* 355 */	"stmt: ARGI4(ADDRLP4)",
/* 356 */	"stmt: ARGU4(ADDRLP4)",
/* 357 */	"stmt: ARGP4(ADDRLP4)",
/* 358 */	"stmt: ARGF4(ADDRLP4)",
/* 359 */	"stmt: ARGI4(ADDRFP4)",
/* 360 */	"stmt: ARGU4(ADDRFP4)",
/* 361 */	"stmt: ARGP4(ADDRFP4)",
/* 362 */	"stmt: ARGF4(ADDRFP4)",
/* 363 */	"stmt: ARGI4(INDIRI4(ADDRGP4))",
/* 364 */	"stmt: ARGU4(INDIRU4(ADDRGP4))",
/* 365 */	"stmt: ARGP4(INDIRP4(ADDRGP4))",
/* 366 */	"stmt: ARGF4(INDIRF4(ADDRGP4))",
/* 367 */	"stmt: ARGI4(INDIRI4(ADDRLP4))",
/* 368 */	"stmt: ARGU4(INDIRU4(ADDRLP4))",
/* 369 */	"stmt: ARGP4(INDIRP4(ADDRLP4))",
/* 370 */	"stmt: ARGF4(INDIRF4(ADDRLP4))",
/* 371 */	"stmt: ARGI4(INDIRI4(ADDRFP4))",
/* 372 */	"stmt: ARGU4(INDIRU4(ADDRFP4))",
/* 373 */	"stmt: ARGP4(INDIRP4(ADDRFP4))",
/* 374 */	"stmt: ARGF4(INDIRF4(ADDRFP4))",
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
	201,
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
	52,
	53,
	54,
	55,
	58,
	59,
	60,
	61,
	62,
	63,
	64,
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
	126,
	127,
	128,
	129,
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

static short _decode_con[] = {
	0,
	33,
	34,
	35,
	36,
	37,
	38,
	39,
	40,
};

static short _decode_addrli[] = {
	0,
	41,
};

static short _decode_addrfi[] = {
	0,
	42,
};

static short _decode_addrg[] = {
	0,
	43,
};

static short _decode_special[] = {
	0,
	44,
};

static short _decode_addrl[] = {
	0,
	45,
	46,
};

static short _decode_regl[] = {
	0,
	47,
	48,
	49,
};

static short _decode_regg[] = {
	0,
	50,
	51,
};

static short _decode_ri[] = {
	0,
	56,
	57,
};

static int _rule(void *state, int goalnt) {
	if (goalnt < 1 || goalnt > 12)
		fatal("_rule", "Bad goal nonterminal %d\n", goalnt);
	if (!state)
		return 0;
	switch (goalnt) {
	case _stmt_NT:	return _decode_stmt[((struct _state *)state)->rule._stmt];
	case _reg_NT:	return _decode_reg[((struct _state *)state)->rule._reg];
	case _coni_NT:	return _decode_coni[((struct _state *)state)->rule._coni];
	case _con_NT:	return _decode_con[((struct _state *)state)->rule._con];
	case _addrli_NT:	return _decode_addrli[((struct _state *)state)->rule._addrli];
	case _addrfi_NT:	return _decode_addrfi[((struct _state *)state)->rule._addrfi];
	case _addrg_NT:	return _decode_addrg[((struct _state *)state)->rule._addrg];
	case _special_NT:	return _decode_special[((struct _state *)state)->rule._special];
	case _addrl_NT:	return _decode_addrl[((struct _state *)state)->rule._addrl];
	case _regl_NT:	return _decode_regl[((struct _state *)state)->rule._regl];
	case _regg_NT:	return _decode_regg[((struct _state *)state)->rule._regg];
	case _ri_NT:	return _decode_ri[((struct _state *)state)->rule._ri];
	default:
		fatal("_rule", "Bad goal nonterminal %d\n", goalnt);
		return 0;
	}
}

static void _closure_reg(NODEPTR_TYPE, int);
static void _closure_coni(NODEPTR_TYPE, int);
static void _closure_con(NODEPTR_TYPE, int);
static void _closure_addrli(NODEPTR_TYPE, int);
static void _closure_addrfi(NODEPTR_TYPE, int);
static void _closure_addrg(NODEPTR_TYPE, int);
static void _closure_special(NODEPTR_TYPE, int);
static void _closure_addrl(NODEPTR_TYPE, int);
static void _closure_regl(NODEPTR_TYPE, int);
static void _closure_regg(NODEPTR_TYPE, int);

static void _closure_reg(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 1 < p->cost[_ri_NT]) {
		p->cost[_ri_NT] = c + 1;
		p->rule._ri = 1;
	}
	if (c + 0 < p->cost[_stmt_NT]) {
		p->cost[_stmt_NT] = c + 0;
		p->rule._stmt = 1;
	}
}

static void _closure_coni(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 1 < p->cost[_ri_NT]) {
		p->cost[_ri_NT] = c + 1;
		p->rule._ri = 2;
	}
	if (c + 1 < p->cost[_reg_NT]) {
		p->cost[_reg_NT] = c + 1;
		p->rule._reg = 21;
		_closure_reg(a, c + 1);
	}
}

static void _closure_con(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 10 < p->cost[_reg_NT]) {
		p->cost[_reg_NT] = c + 10;
		p->rule._reg = 20;
		_closure_reg(a, c + 10);
	}
}

static void _closure_addrli(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 2 < p->cost[_regl_NT]) {
		p->cost[_regl_NT] = c + 2;
		p->rule._regl = 1;
		_closure_regl(a, c + 2);
	}
}

static void _closure_addrfi(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 2 < p->cost[_regl_NT]) {
		p->cost[_regl_NT] = c + 2;
		p->rule._regl = 2;
		_closure_regl(a, c + 2);
	}
}

static void _closure_addrg(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 6 < p->cost[_regg_NT]) {
		p->cost[_regg_NT] = c + 6;
		p->rule._regg = 1;
		_closure_regg(a, c + 6);
	}
}

static void _closure_special(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 99 < p->cost[_regg_NT]) {
		p->cost[_regg_NT] = c + 99;
		p->rule._regg = 2;
		_closure_regg(a, c + 99);
	}
}

static void _closure_addrl(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 6 < p->cost[_regl_NT]) {
		p->cost[_regl_NT] = c + 6;
		p->rule._regl = 3;
		_closure_regl(a, c + 6);
	}
}

static void _closure_regl(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 1 < p->cost[_reg_NT]) {
		p->cost[_reg_NT] = c + 1;
		p->rule._reg = 19;
		_closure_reg(a, c + 1);
	}
}

static void _closure_regg(NODEPTR_TYPE a, int c) {
	struct _state *p = STATE_LABEL(a);
	if (c + 1 < p->cost[_reg_NT]) {
		p->cost[_reg_NT] = c + 1;
		p->rule._reg = 18;
		_closure_reg(a, c + 1);
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
	p->cost[12] =
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
				p->rule._stmt = 139;
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
				p->rule._stmt = 140;
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
			p->rule._reg = 98;
			_closure_reg(a, c + 0);
		}
		/* reg: CALLV(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 103;
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
		if (	/* stmt: JUMPV(INDIRP4(addrl)) */
			LEFT_CHILD(a)->op == 4167 /* INDIRP4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_addrl_NT] + 11;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 141;
			}
		}
		if (	/* stmt: JUMPV(INDIRP4(addrg)) */
			LEFT_CHILD(a)->op == 4167 /* INDIRP4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_addrg_NT] + 20;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 142;
			}
		}
		if (	/* stmt: JUMPV(INDIRP4(reg)) */
			LEFT_CHILD(a)->op == 4167 /* INDIRP4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_reg_NT] + 50;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 143;
			}
		}
		/* stmt: JUMPV(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 10;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 144;
		}
		break;
	case 600: /* LABELV */
		/* stmt: LABELV */
		if (0 + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = 0 + 0;
			p->rule._stmt = 145;
		}
		break;
	case 711: /* VREGP */
		break;
	case 1045: /* CNSTI1 */
		/* coni: CNSTI1 */
		c = (range(a, 0, 511));
		if (c + 0 < p->cost[_coni_NT]) {
			p->cost[_coni_NT] = c + 0;
			p->rule._coni = 1;
			_closure_coni(a, c + 0);
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
		c = (range(a, 0, 511));
		if (c + 0 < p->cost[_coni_NT]) {
			p->cost[_coni_NT] = c + 0;
			p->rule._coni = 4;
			_closure_coni(a, c + 0);
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
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
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
		/* stmt: ASGNI1(special,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 26;
		}
		/* stmt: ASGNI1(addrl,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 10;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 34;
		}
		/* stmt: ASGNI1(addrli,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrli_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 42;
		}
		/* stmt: ASGNI1(addrfi,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrfi_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 50;
		}
		/* stmt: ASGNI1(addrli,special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrli_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 58;
		}
		/* stmt: ASGNI1(addrfi,special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrfi_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 66;
		}
		/* stmt: ASGNI1(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 99;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 74;
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
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
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
		/* stmt: ASGNU1(special,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 29;
		}
		/* stmt: ASGNU1(addrl,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 10;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 37;
		}
		/* stmt: ASGNU1(addrli,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrli_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 45;
		}
		/* stmt: ASGNU1(addrfi,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrfi_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 53;
		}
		/* stmt: ASGNU1(addrli,special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrli_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 61;
		}
		/* stmt: ASGNU1(addrfi,special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrfi_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 69;
		}
		/* stmt: ASGNU1(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 99;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 77;
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
				if (q->cost[_con_NT] == 0) {
					p->cost[_con_NT] = 0;
					p->rule._con = q->rule._con;
				}
				if (q->cost[_addrli_NT] == 0) {
					p->cost[_addrli_NT] = 0;
					p->rule._addrli = q->rule._addrli;
				}
				if (q->cost[_addrfi_NT] == 0) {
					p->cost[_addrfi_NT] = 0;
					p->rule._addrfi = q->rule._addrfi;
				}
				if (q->cost[_addrg_NT] == 0) {
					p->cost[_addrg_NT] = 0;
					p->rule._addrg = q->rule._addrg;
				}
				if (q->cost[_special_NT] == 0) {
					p->cost[_special_NT] = 0;
					p->rule._special = q->rule._special;
				}
				if (q->cost[_addrl_NT] == 0) {
					p->cost[_addrl_NT] = 0;
					p->rule._addrl = q->rule._addrl;
				}
				if (q->cost[_regl_NT] == 0) {
					p->cost[_regl_NT] = 0;
					p->rule._regl = q->rule._regl;
				}
				if (q->cost[_regg_NT] == 0) {
					p->cost[_regg_NT] = 0;
					p->rule._regg = q->rule._regg;
				}
				if (q->cost[_ri_NT] == 0) {
					p->cost[_ri_NT] = 0;
					p->rule._ri = q->rule._ri;
				}
			}
			c = 0;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 1;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: INDIRI1(regl) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_regl_NT] + 5;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 22;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI1(regg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_regg_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 30;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI1(special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 38;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI1(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 13;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 46;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI1(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 11;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 54;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI1(addrl) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl_NT] + 10;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 62;
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
				if (q->cost[_con_NT] == 0) {
					p->cost[_con_NT] = 0;
					p->rule._con = q->rule._con;
				}
				if (q->cost[_addrli_NT] == 0) {
					p->cost[_addrli_NT] = 0;
					p->rule._addrli = q->rule._addrli;
				}
				if (q->cost[_addrfi_NT] == 0) {
					p->cost[_addrfi_NT] = 0;
					p->rule._addrfi = q->rule._addrfi;
				}
				if (q->cost[_addrg_NT] == 0) {
					p->cost[_addrg_NT] = 0;
					p->rule._addrg = q->rule._addrg;
				}
				if (q->cost[_special_NT] == 0) {
					p->cost[_special_NT] = 0;
					p->rule._special = q->rule._special;
				}
				if (q->cost[_addrl_NT] == 0) {
					p->cost[_addrl_NT] = 0;
					p->rule._addrl = q->rule._addrl;
				}
				if (q->cost[_regl_NT] == 0) {
					p->cost[_regl_NT] = 0;
					p->rule._regl = q->rule._regl;
				}
				if (q->cost[_regg_NT] == 0) {
					p->cost[_regg_NT] = 0;
					p->rule._regg = q->rule._regg;
				}
				if (q->cost[_ri_NT] == 0) {
					p->cost[_ri_NT] = 0;
					p->rule._ri = q->rule._ri;
				}
			}
			c = 0;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 2;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: INDIRU1(regl) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_regl_NT] + 5;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 25;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU1(regg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_regg_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 33;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU1(special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 41;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU1(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 13;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 49;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU1(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 11;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 57;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU1(addrl) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl_NT] + 10;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 65;
			_closure_reg(a, c + 0);
		}
		break;
	case 1157: /* CVII1 */
		_label(LEFT_CHILD(a));
		/* reg: CVII1(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 112;
			_closure_reg(a, c + 0);
		}
		break;
	case 1158: /* CVIU1 */
		_label(LEFT_CHILD(a));
		/* reg: CVIU1(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 115;
			_closure_reg(a, c + 0);
		}
		break;
	case 1205: /* CVUI1 */
		_label(LEFT_CHILD(a));
		if (	/* reg: CVUI1(INDIRU1(regl)) */
			LEFT_CHILD(a)->op == 1094 /* INDIRU1 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regl_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 76;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUI1(INDIRU1(regg)) */
			LEFT_CHILD(a)->op == 1094 /* INDIRU1 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regg_NT] + 7;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 88;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: CVUI1(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 104;
			_closure_reg(a, c + 0);
		}
		break;
	case 1206: /* CVUU1 */
		_label(LEFT_CHILD(a));
		if (	/* reg: CVUU1(INDIRU1(regl)) */
			LEFT_CHILD(a)->op == 1094 /* INDIRU1 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regl_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 70;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUU1(INDIRU1(regg)) */
			LEFT_CHILD(a)->op == 1094 /* INDIRU1 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regg_NT] + 7;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 82;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: CVUU1(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 107;
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
		c = (range(a, 0, 511));
		if (c + 0 < p->cost[_coni_NT]) {
			p->cost[_coni_NT] = c + 0;
			p->rule._coni = 2;
			_closure_coni(a, c + 0);
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
		c = (range(a, 0, 511));
		if (c + 0 < p->cost[_coni_NT]) {
			p->cost[_coni_NT] = c + 0;
			p->rule._coni = 5;
			_closure_coni(a, c + 0);
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
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
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
		/* stmt: ASGNI2(special,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 27;
		}
		/* stmt: ASGNI2(addrl,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 10;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 35;
		}
		/* stmt: ASGNI2(addrli,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrli_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 43;
		}
		/* stmt: ASGNI2(addrfi,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrfi_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 51;
		}
		/* stmt: ASGNI2(addrli,special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrli_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 59;
		}
		/* stmt: ASGNI2(addrfi,special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrfi_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 67;
		}
		/* stmt: ASGNI2(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 99;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 75;
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
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
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
		/* stmt: ASGNU2(special,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 30;
		}
		/* stmt: ASGNU2(addrl,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 10;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 38;
		}
		/* stmt: ASGNU2(addrli,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrli_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 46;
		}
		/* stmt: ASGNU2(addrfi,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrfi_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 54;
		}
		/* stmt: ASGNU2(addrli,special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrli_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 62;
		}
		/* stmt: ASGNU2(addrfi,special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrfi_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 70;
		}
		/* stmt: ASGNU2(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 99;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 78;
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
				if (q->cost[_con_NT] == 0) {
					p->cost[_con_NT] = 0;
					p->rule._con = q->rule._con;
				}
				if (q->cost[_addrli_NT] == 0) {
					p->cost[_addrli_NT] = 0;
					p->rule._addrli = q->rule._addrli;
				}
				if (q->cost[_addrfi_NT] == 0) {
					p->cost[_addrfi_NT] = 0;
					p->rule._addrfi = q->rule._addrfi;
				}
				if (q->cost[_addrg_NT] == 0) {
					p->cost[_addrg_NT] = 0;
					p->rule._addrg = q->rule._addrg;
				}
				if (q->cost[_special_NT] == 0) {
					p->cost[_special_NT] = 0;
					p->rule._special = q->rule._special;
				}
				if (q->cost[_addrl_NT] == 0) {
					p->cost[_addrl_NT] = 0;
					p->rule._addrl = q->rule._addrl;
				}
				if (q->cost[_regl_NT] == 0) {
					p->cost[_regl_NT] = 0;
					p->rule._regl = q->rule._regl;
				}
				if (q->cost[_regg_NT] == 0) {
					p->cost[_regg_NT] = 0;
					p->rule._regg = q->rule._regg;
				}
				if (q->cost[_ri_NT] == 0) {
					p->cost[_ri_NT] = 0;
					p->rule._ri = q->rule._ri;
				}
			}
			c = 0;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 3;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: INDIRI2(regl) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_regl_NT] + 5;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 23;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI2(regg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_regg_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 31;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI2(special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 39;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI2(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 13;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 47;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI2(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 11;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 55;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI2(addrl) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl_NT] + 10;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 63;
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
				if (q->cost[_con_NT] == 0) {
					p->cost[_con_NT] = 0;
					p->rule._con = q->rule._con;
				}
				if (q->cost[_addrli_NT] == 0) {
					p->cost[_addrli_NT] = 0;
					p->rule._addrli = q->rule._addrli;
				}
				if (q->cost[_addrfi_NT] == 0) {
					p->cost[_addrfi_NT] = 0;
					p->rule._addrfi = q->rule._addrfi;
				}
				if (q->cost[_addrg_NT] == 0) {
					p->cost[_addrg_NT] = 0;
					p->rule._addrg = q->rule._addrg;
				}
				if (q->cost[_special_NT] == 0) {
					p->cost[_special_NT] = 0;
					p->rule._special = q->rule._special;
				}
				if (q->cost[_addrl_NT] == 0) {
					p->cost[_addrl_NT] = 0;
					p->rule._addrl = q->rule._addrl;
				}
				if (q->cost[_regl_NT] == 0) {
					p->cost[_regl_NT] = 0;
					p->rule._regl = q->rule._regl;
				}
				if (q->cost[_regg_NT] == 0) {
					p->cost[_regg_NT] = 0;
					p->rule._regg = q->rule._regg;
				}
				if (q->cost[_ri_NT] == 0) {
					p->cost[_ri_NT] = 0;
					p->rule._ri = q->rule._ri;
				}
			}
			c = 0;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 4;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: INDIRU2(regl) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_regl_NT] + 5;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 26;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU2(regg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_regg_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 34;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU2(special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 42;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU2(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 13;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 50;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU2(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 11;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 58;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU2(addrl) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl_NT] + 10;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 66;
			_closure_reg(a, c + 0);
		}
		break;
	case 2181: /* CVII2 */
		_label(LEFT_CHILD(a));
		/* reg: CVII2(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 113;
			_closure_reg(a, c + 0);
		}
		break;
	case 2182: /* CVIU2 */
		_label(LEFT_CHILD(a));
		/* reg: CVIU2(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 116;
			_closure_reg(a, c + 0);
		}
		break;
	case 2229: /* CVUI2 */
		_label(LEFT_CHILD(a));
		if (	/* reg: CVUI2(INDIRU1(regl)) */
			LEFT_CHILD(a)->op == 1094 /* INDIRU1 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regl_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 77;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUI2(INDIRU2(regl)) */
			LEFT_CHILD(a)->op == 2118 /* INDIRU2 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regl_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 78;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUI2(INDIRU1(regg)) */
			LEFT_CHILD(a)->op == 1094 /* INDIRU1 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regg_NT] + 7;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 89;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUI2(INDIRU2(regg)) */
			LEFT_CHILD(a)->op == 2118 /* INDIRU2 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regg_NT] + 7;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 90;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: CVUI2(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 105;
			_closure_reg(a, c + 0);
		}
		break;
	case 2230: /* CVUU2 */
		_label(LEFT_CHILD(a));
		if (	/* reg: CVUU2(INDIRU1(regl)) */
			LEFT_CHILD(a)->op == 1094 /* INDIRU1 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regl_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 71;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUU2(INDIRU2(regl)) */
			LEFT_CHILD(a)->op == 2118 /* INDIRU2 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regl_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 72;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUU2(INDIRU1(regg)) */
			LEFT_CHILD(a)->op == 1094 /* INDIRU1 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regg_NT] + 7;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 83;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUU2(INDIRU2(regg)) */
			LEFT_CHILD(a)->op == 2118 /* INDIRU2 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regg_NT] + 7;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 84;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: CVUU2(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 108;
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
		c = (range(a, 0, 511));
		if (c + 0 < p->cost[_coni_NT]) {
			p->cost[_coni_NT] = c + 0;
			p->rule._coni = 3;
			_closure_coni(a, c + 0);
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
		c = (range(a, 0, 511));
		if (c + 0 < p->cost[_coni_NT]) {
			p->cost[_coni_NT] = c + 0;
			p->rule._coni = 6;
			_closure_coni(a, c + 0);
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
			p->rule._stmt = 149;
		}
		/* stmt: ARGF4(coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 153;
		}
		/* stmt: ARGF4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 157;
		}
		if (	/* stmt: ARGF4(ADDRGP4) */
			LEFT_CHILD(a)->op == 4359 /* ADDRGP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 161;
			}
		}
		if (	/* stmt: ARGF4(ADDRLP4) */
			LEFT_CHILD(a)->op == 4391 /* ADDRLP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 165;
			}
		}
		if (	/* stmt: ARGF4(ADDRFP4) */
			LEFT_CHILD(a)->op == 4375 /* ADDRFP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 169;
			}
		}
		if (	/* stmt: ARGF4(INDIRF4(ADDRGP4)) */
			LEFT_CHILD(a)->op == 4161 && /* INDIRF4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4359 /* ADDRGP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 173;
			}
		}
		if (	/* stmt: ARGF4(INDIRF4(ADDRLP4)) */
			LEFT_CHILD(a)->op == 4161 && /* INDIRF4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4391 /* ADDRLP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 177;
			}
		}
		if (	/* stmt: ARGF4(INDIRF4(ADDRFP4)) */
			LEFT_CHILD(a)->op == 4161 && /* INDIRF4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4375 /* ADDRFP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 181;
			}
		}
		break;
	case 4133: /* ARGI4 */
		_label(LEFT_CHILD(a));
		/* stmt: ARGI4(con) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_con_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 146;
		}
		/* stmt: ARGI4(coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 150;
		}
		/* stmt: ARGI4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 154;
		}
		if (	/* stmt: ARGI4(ADDRGP4) */
			LEFT_CHILD(a)->op == 4359 /* ADDRGP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 158;
			}
		}
		if (	/* stmt: ARGI4(ADDRLP4) */
			LEFT_CHILD(a)->op == 4391 /* ADDRLP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 162;
			}
		}
		if (	/* stmt: ARGI4(ADDRFP4) */
			LEFT_CHILD(a)->op == 4375 /* ADDRFP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 166;
			}
		}
		if (	/* stmt: ARGI4(INDIRI4(ADDRGP4)) */
			LEFT_CHILD(a)->op == 4165 && /* INDIRI4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4359 /* ADDRGP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 170;
			}
		}
		if (	/* stmt: ARGI4(INDIRI4(ADDRLP4)) */
			LEFT_CHILD(a)->op == 4165 && /* INDIRI4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4391 /* ADDRLP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 174;
			}
		}
		if (	/* stmt: ARGI4(INDIRI4(ADDRFP4)) */
			LEFT_CHILD(a)->op == 4165 && /* INDIRI4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4375 /* ADDRFP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 178;
			}
		}
		break;
	case 4134: /* ARGU4 */
		_label(LEFT_CHILD(a));
		/* stmt: ARGU4(con) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_con_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 147;
		}
		/* stmt: ARGU4(coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 151;
		}
		/* stmt: ARGU4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 155;
		}
		if (	/* stmt: ARGU4(ADDRGP4) */
			LEFT_CHILD(a)->op == 4359 /* ADDRGP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 159;
			}
		}
		if (	/* stmt: ARGU4(ADDRLP4) */
			LEFT_CHILD(a)->op == 4391 /* ADDRLP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 163;
			}
		}
		if (	/* stmt: ARGU4(ADDRFP4) */
			LEFT_CHILD(a)->op == 4375 /* ADDRFP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 167;
			}
		}
		if (	/* stmt: ARGU4(INDIRU4(ADDRGP4)) */
			LEFT_CHILD(a)->op == 4166 && /* INDIRU4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4359 /* ADDRGP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 171;
			}
		}
		if (	/* stmt: ARGU4(INDIRU4(ADDRLP4)) */
			LEFT_CHILD(a)->op == 4166 && /* INDIRU4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4391 /* ADDRLP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 175;
			}
		}
		if (	/* stmt: ARGU4(INDIRU4(ADDRFP4)) */
			LEFT_CHILD(a)->op == 4166 && /* INDIRU4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4375 /* ADDRFP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 179;
			}
		}
		break;
	case 4135: /* ARGP4 */
		_label(LEFT_CHILD(a));
		/* stmt: ARGP4(con) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_con_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 148;
		}
		/* stmt: ARGP4(coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 152;
		}
		/* stmt: ARGP4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 156;
		}
		if (	/* stmt: ARGP4(ADDRGP4) */
			LEFT_CHILD(a)->op == 4359 /* ADDRGP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 160;
			}
		}
		if (	/* stmt: ARGP4(ADDRLP4) */
			LEFT_CHILD(a)->op == 4391 /* ADDRLP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 164;
			}
		}
		if (	/* stmt: ARGP4(ADDRFP4) */
			LEFT_CHILD(a)->op == 4375 /* ADDRFP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 168;
			}
		}
		if (	/* stmt: ARGP4(INDIRP4(ADDRGP4)) */
			LEFT_CHILD(a)->op == 4167 && /* INDIRP4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4359 /* ADDRGP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 172;
			}
		}
		if (	/* stmt: ARGP4(INDIRP4(ADDRLP4)) */
			LEFT_CHILD(a)->op == 4167 && /* INDIRP4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4391 /* ADDRLP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 176;
			}
		}
		if (	/* stmt: ARGP4(INDIRP4(ADDRFP4)) */
			LEFT_CHILD(a)->op == 4167 && /* INDIRP4 */
			LEFT_CHILD(LEFT_CHILD(a))->op == 4375 /* ADDRFP4 */
		) {
			c = 1;
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 180;
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
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
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
		/* stmt: ASGNF4(special,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 32;
		}
		/* stmt: ASGNF4(addrl,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 10;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 40;
		}
		/* stmt: ASGNF4(addrli,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrli_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 48;
		}
		/* stmt: ASGNF4(addrfi,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrfi_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 56;
		}
		/* stmt: ASGNF4(addrli,special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrli_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 64;
		}
		/* stmt: ASGNF4(addrfi,special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrfi_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 72;
		}
		/* stmt: ASGNF4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 99;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 80;
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
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
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
		/* stmt: ASGNI4(special,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 28;
		}
		/* stmt: ASGNI4(addrl,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 10;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 36;
		}
		/* stmt: ASGNI4(addrli,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrli_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 44;
		}
		/* stmt: ASGNI4(addrfi,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrfi_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 52;
		}
		/* stmt: ASGNI4(addrli,special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrli_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 60;
		}
		/* stmt: ASGNI4(addrfi,special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrfi_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 68;
		}
		/* stmt: ASGNI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 99;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 76;
		}
		if (	/* stmt: ASGNI4(special,BANDI4(INDIRI4(special),coni)) */
			RIGHT_CHILD(a)->op == 4485 && /* BANDI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 93;
			}
		}
		if (	/* stmt: ASGNI4(special,BANDI4(INDIRI4(special),reg)) */
			RIGHT_CHILD(a)->op == 4485 && /* BANDI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 95;
			}
		}
		if (	/* stmt: ASGNI4(special,BORI4(INDIRI4(special),coni)) */
			RIGHT_CHILD(a)->op == 4517 && /* BORI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 97;
			}
		}
		if (	/* stmt: ASGNI4(special,BORI4(INDIRI4(special),reg)) */
			RIGHT_CHILD(a)->op == 4517 && /* BORI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 99;
			}
		}
		if (	/* stmt: ASGNI4(special,BXORI4(INDIRI4(special),coni)) */
			RIGHT_CHILD(a)->op == 4533 && /* BXORI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 101;
			}
		}
		if (	/* stmt: ASGNI4(special,BXORI4(INDIRI4(special),reg)) */
			RIGHT_CHILD(a)->op == 4533 && /* BXORI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 103;
			}
		}
		if (	/* stmt: ASGNI4(special,ADDI4(INDIRI4(special),coni)) */
			RIGHT_CHILD(a)->op == 4405 && /* ADDI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 105;
			}
		}
		if (	/* stmt: ASGNI4(special,ADDI4(INDIRI4(special),reg)) */
			RIGHT_CHILD(a)->op == 4405 && /* ADDI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 107;
			}
		}
		if (	/* stmt: ASGNI4(special,SUBI4(INDIRI4(special),coni)) */
			RIGHT_CHILD(a)->op == 4421 && /* SUBI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 109;
			}
		}
		if (	/* stmt: ASGNI4(special,SUBI4(INDIRI4(special),reg)) */
			RIGHT_CHILD(a)->op == 4421 && /* SUBI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 111;
			}
		}
		if (	/* stmt: ASGNI4(special,LSHI4(INDIRI4(special),coni)) */
			RIGHT_CHILD(a)->op == 4437 && /* LSHI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 113;
			}
		}
		if (	/* stmt: ASGNI4(special,LSHI4(INDIRI4(special),reg)) */
			RIGHT_CHILD(a)->op == 4437 && /* LSHI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 115;
			}
		}
		if (	/* stmt: ASGNI4(special,RSHI4(INDIRI4(special),coni)) */
			RIGHT_CHILD(a)->op == 4469 && /* RSHI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 117;
			}
		}
		if (	/* stmt: ASGNI4(special,RSHI4(INDIRI4(special),reg)) */
			RIGHT_CHILD(a)->op == 4469 && /* RSHI4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4165 /* INDIRI4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 119;
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
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
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
		/* stmt: ASGNU4(special,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 31;
		}
		/* stmt: ASGNU4(addrl,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 10;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 39;
		}
		/* stmt: ASGNU4(addrli,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrli_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 47;
		}
		/* stmt: ASGNU4(addrfi,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrfi_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 55;
		}
		/* stmt: ASGNU4(addrli,special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrli_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 63;
		}
		/* stmt: ASGNU4(addrfi,special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrfi_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 71;
		}
		/* stmt: ASGNU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 99;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 79;
		}
		if (	/* stmt: ASGNU4(special,BANDU4(INDIRU4(special),coni)) */
			RIGHT_CHILD(a)->op == 4486 && /* BANDU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 94;
			}
		}
		if (	/* stmt: ASGNU4(special,BANDU4(INDIRU4(special),reg)) */
			RIGHT_CHILD(a)->op == 4486 && /* BANDU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 96;
			}
		}
		if (	/* stmt: ASGNU4(special,BORU4(INDIRU4(special),coni)) */
			RIGHT_CHILD(a)->op == 4518 && /* BORU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 98;
			}
		}
		if (	/* stmt: ASGNU4(special,BORU4(INDIRU4(special),reg)) */
			RIGHT_CHILD(a)->op == 4518 && /* BORU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 100;
			}
		}
		if (	/* stmt: ASGNU4(special,BXORU4(INDIRU4(special),coni)) */
			RIGHT_CHILD(a)->op == 4534 && /* BXORU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 102;
			}
		}
		if (	/* stmt: ASGNU4(special,BXORU4(INDIRU4(special),reg)) */
			RIGHT_CHILD(a)->op == 4534 && /* BXORU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 104;
			}
		}
		if (	/* stmt: ASGNU4(special,ADDU4(INDIRU4(special),coni)) */
			RIGHT_CHILD(a)->op == 4406 && /* ADDU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 106;
			}
		}
		if (	/* stmt: ASGNU4(special,ADDU4(INDIRU4(special),reg)) */
			RIGHT_CHILD(a)->op == 4406 && /* ADDU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 108;
			}
		}
		if (	/* stmt: ASGNU4(special,SUBU4(INDIRU4(special),coni)) */
			RIGHT_CHILD(a)->op == 4422 && /* SUBU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 110;
			}
		}
		if (	/* stmt: ASGNU4(special,SUBU4(INDIRU4(special),reg)) */
			RIGHT_CHILD(a)->op == 4422 && /* SUBU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 112;
			}
		}
		if (	/* stmt: ASGNU4(special,LSHU4(INDIRU4(special),coni)) */
			RIGHT_CHILD(a)->op == 4438 && /* LSHU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 114;
			}
		}
		if (	/* stmt: ASGNU4(special,LSHU4(INDIRU4(special),reg)) */
			RIGHT_CHILD(a)->op == 4438 && /* LSHU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 116;
			}
		}
		if (	/* stmt: ASGNU4(special,RSHU4(INDIRU4(special),coni)) */
			RIGHT_CHILD(a)->op == 4470 && /* RSHU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_coni_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 118;
			}
		}
		if (	/* stmt: ASGNU4(special,RSHU4(INDIRU4(special),reg)) */
			RIGHT_CHILD(a)->op == 4470 && /* RSHU4 */
			LEFT_CHILD(RIGHT_CHILD(a))->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(a)))->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(RIGHT_CHILD(a))->x.state))->cost[_reg_NT] + ((in_place_special(a) ? 0 : LBURG_MAX));
			if (c + 0 < p->cost[_stmt_NT]) {
				p->cost[_stmt_NT] = c + 0;
				p->rule._stmt = 120;
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
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 11;
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
		/* stmt: ASGNP4(special,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 33;
		}
		/* stmt: ASGNP4(addrl,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 10;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 41;
		}
		/* stmt: ASGNP4(addrli,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrli_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 49;
		}
		/* stmt: ASGNP4(addrfi,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrfi_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 7;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 57;
		}
		/* stmt: ASGNP4(addrli,special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrli_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 65;
		}
		/* stmt: ASGNP4(addrfi,special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrfi_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 73;
		}
		/* stmt: ASGNP4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 99;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 81;
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
				if (q->cost[_con_NT] == 0) {
					p->cost[_con_NT] = 0;
					p->rule._con = q->rule._con;
				}
				if (q->cost[_addrli_NT] == 0) {
					p->cost[_addrli_NT] = 0;
					p->rule._addrli = q->rule._addrli;
				}
				if (q->cost[_addrfi_NT] == 0) {
					p->cost[_addrfi_NT] = 0;
					p->rule._addrfi = q->rule._addrfi;
				}
				if (q->cost[_addrg_NT] == 0) {
					p->cost[_addrg_NT] = 0;
					p->rule._addrg = q->rule._addrg;
				}
				if (q->cost[_special_NT] == 0) {
					p->cost[_special_NT] = 0;
					p->rule._special = q->rule._special;
				}
				if (q->cost[_addrl_NT] == 0) {
					p->cost[_addrl_NT] = 0;
					p->rule._addrl = q->rule._addrl;
				}
				if (q->cost[_regl_NT] == 0) {
					p->cost[_regl_NT] = 0;
					p->rule._regl = q->rule._regl;
				}
				if (q->cost[_regg_NT] == 0) {
					p->cost[_regg_NT] = 0;
					p->rule._regg = q->rule._regg;
				}
				if (q->cost[_ri_NT] == 0) {
					p->cost[_ri_NT] = 0;
					p->rule._ri = q->rule._ri;
				}
			}
			c = 0;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 8;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: INDIRF4(regl) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_regl_NT] + 5;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 28;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRF4(regg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_regg_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 36;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRF4(special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 44;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRF4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 13;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 52;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRF4(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 11;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 60;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRF4(addrl) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl_NT] + 10;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 68;
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
				if (q->cost[_con_NT] == 0) {
					p->cost[_con_NT] = 0;
					p->rule._con = q->rule._con;
				}
				if (q->cost[_addrli_NT] == 0) {
					p->cost[_addrli_NT] = 0;
					p->rule._addrli = q->rule._addrli;
				}
				if (q->cost[_addrfi_NT] == 0) {
					p->cost[_addrfi_NT] = 0;
					p->rule._addrfi = q->rule._addrfi;
				}
				if (q->cost[_addrg_NT] == 0) {
					p->cost[_addrg_NT] = 0;
					p->rule._addrg = q->rule._addrg;
				}
				if (q->cost[_special_NT] == 0) {
					p->cost[_special_NT] = 0;
					p->rule._special = q->rule._special;
				}
				if (q->cost[_addrl_NT] == 0) {
					p->cost[_addrl_NT] = 0;
					p->rule._addrl = q->rule._addrl;
				}
				if (q->cost[_regl_NT] == 0) {
					p->cost[_regl_NT] = 0;
					p->rule._regl = q->rule._regl;
				}
				if (q->cost[_regg_NT] == 0) {
					p->cost[_regg_NT] = 0;
					p->rule._regg = q->rule._regg;
				}
				if (q->cost[_ri_NT] == 0) {
					p->cost[_ri_NT] = 0;
					p->rule._ri = q->rule._ri;
				}
			}
			c = 0;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 5;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: INDIRI4(regl) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_regl_NT] + 5;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 24;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI4(regg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_regg_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 32;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI4(special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 40;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 13;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 48;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI4(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 11;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 56;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRI4(addrl) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl_NT] + 10;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 64;
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
				if (q->cost[_con_NT] == 0) {
					p->cost[_con_NT] = 0;
					p->rule._con = q->rule._con;
				}
				if (q->cost[_addrli_NT] == 0) {
					p->cost[_addrli_NT] = 0;
					p->rule._addrli = q->rule._addrli;
				}
				if (q->cost[_addrfi_NT] == 0) {
					p->cost[_addrfi_NT] = 0;
					p->rule._addrfi = q->rule._addrfi;
				}
				if (q->cost[_addrg_NT] == 0) {
					p->cost[_addrg_NT] = 0;
					p->rule._addrg = q->rule._addrg;
				}
				if (q->cost[_special_NT] == 0) {
					p->cost[_special_NT] = 0;
					p->rule._special = q->rule._special;
				}
				if (q->cost[_addrl_NT] == 0) {
					p->cost[_addrl_NT] = 0;
					p->rule._addrl = q->rule._addrl;
				}
				if (q->cost[_regl_NT] == 0) {
					p->cost[_regl_NT] = 0;
					p->rule._regl = q->rule._regl;
				}
				if (q->cost[_regg_NT] == 0) {
					p->cost[_regg_NT] = 0;
					p->rule._regg = q->rule._regg;
				}
				if (q->cost[_ri_NT] == 0) {
					p->cost[_ri_NT] = 0;
					p->rule._ri = q->rule._ri;
				}
			}
			c = 0;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 6;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: INDIRU4(regl) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_regl_NT] + 5;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 27;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU4(regg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_regg_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 35;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU4(special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 43;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 13;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 51;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU4(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 11;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 59;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRU4(addrl) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl_NT] + 10;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 67;
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
				if (q->cost[_con_NT] == 0) {
					p->cost[_con_NT] = 0;
					p->rule._con = q->rule._con;
				}
				if (q->cost[_addrli_NT] == 0) {
					p->cost[_addrli_NT] = 0;
					p->rule._addrli = q->rule._addrli;
				}
				if (q->cost[_addrfi_NT] == 0) {
					p->cost[_addrfi_NT] = 0;
					p->rule._addrfi = q->rule._addrfi;
				}
				if (q->cost[_addrg_NT] == 0) {
					p->cost[_addrg_NT] = 0;
					p->rule._addrg = q->rule._addrg;
				}
				if (q->cost[_special_NT] == 0) {
					p->cost[_special_NT] = 0;
					p->rule._special = q->rule._special;
				}
				if (q->cost[_addrl_NT] == 0) {
					p->cost[_addrl_NT] = 0;
					p->rule._addrl = q->rule._addrl;
				}
				if (q->cost[_regl_NT] == 0) {
					p->cost[_regl_NT] = 0;
					p->rule._regl = q->rule._regl;
				}
				if (q->cost[_regg_NT] == 0) {
					p->cost[_regg_NT] = 0;
					p->rule._regg = q->rule._regg;
				}
				if (q->cost[_ri_NT] == 0) {
					p->cost[_ri_NT] = 0;
					p->rule._ri = q->rule._ri;
				}
			}
			c = 0;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 7;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: INDIRP4(regl) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_regl_NT] + 5;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 29;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRP4(regg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_regg_NT] + 7;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 37;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRP4(special) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_special_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 45;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRP4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 13;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 53;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRP4(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 11;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 61;
			_closure_reg(a, c + 0);
		}
		/* reg: INDIRP4(addrl) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrl_NT] + 10;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 69;
			_closure_reg(a, c + 0);
		}
		break;
	case 4209: /* CVFF4 */
		_label(LEFT_CHILD(a));
		/* reg: CVFF4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 118;
			_closure_reg(a, c + 0);
		}
		break;
	case 4213: /* CVFI4 */
		_label(LEFT_CHILD(a));
		/* reg: CVFI4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 119;
			_closure_reg(a, c + 0);
		}
		break;
	case 4225: /* CVIF4 */
		_label(LEFT_CHILD(a));
		/* reg: CVIF4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 120;
			_closure_reg(a, c + 0);
		}
		break;
	case 4229: /* CVII4 */
		_label(LEFT_CHILD(a));
		/* reg: CVII4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 114;
			_closure_reg(a, c + 0);
		}
		break;
	case 4230: /* CVIU4 */
		_label(LEFT_CHILD(a));
		/* reg: CVIU4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 117;
			_closure_reg(a, c + 0);
		}
		break;
	case 4246: /* CVPU4 */
		_label(LEFT_CHILD(a));
		/* reg: CVPU4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + (move(a));
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 111;
			_closure_reg(a, c + 0);
		}
		break;
	case 4277: /* CVUI4 */
		_label(LEFT_CHILD(a));
		if (	/* reg: CVUI4(INDIRU1(regl)) */
			LEFT_CHILD(a)->op == 1094 /* INDIRU1 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regl_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 79;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUI4(INDIRU2(regl)) */
			LEFT_CHILD(a)->op == 2118 /* INDIRU2 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regl_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 80;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUI4(INDIRU4(regl)) */
			LEFT_CHILD(a)->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regl_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 81;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUI4(INDIRU1(regg)) */
			LEFT_CHILD(a)->op == 1094 /* INDIRU1 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regg_NT] + 7;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 91;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUI4(INDIRU2(regg)) */
			LEFT_CHILD(a)->op == 2118 /* INDIRU2 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regg_NT] + 7;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 92;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUI4(INDIRU4(regg)) */
			LEFT_CHILD(a)->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regg_NT] + 7;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 93;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: CVUI4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 106;
			_closure_reg(a, c + 0);
		}
		break;
	case 4278: /* CVUU4 */
		_label(LEFT_CHILD(a));
		if (	/* reg: CVUU4(INDIRU1(regl)) */
			LEFT_CHILD(a)->op == 1094 /* INDIRU1 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regl_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 73;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUU4(INDIRU2(regl)) */
			LEFT_CHILD(a)->op == 2118 /* INDIRU2 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regl_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 74;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUU4(INDIRU4(regl)) */
			LEFT_CHILD(a)->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regl_NT] + 5;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 75;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUU4(INDIRU1(regg)) */
			LEFT_CHILD(a)->op == 1094 /* INDIRU1 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regg_NT] + 7;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 85;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUU4(INDIRU2(regg)) */
			LEFT_CHILD(a)->op == 2118 /* INDIRU2 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regg_NT] + 7;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 86;
				_closure_reg(a, c + 0);
			}
		}
		if (	/* reg: CVUU4(INDIRU4(regg)) */
			LEFT_CHILD(a)->op == 4166 /* INDIRU4 */
		) {
			c = ((struct _state *)(LEFT_CHILD(LEFT_CHILD(a))->x.state))->cost[_regg_NT] + 7;
			if (c + 0 < p->cost[_reg_NT]) {
				p->cost[_reg_NT] = c + 0;
				p->rule._reg = 87;
				_closure_reg(a, c + 0);
			}
		}
		/* reg: CVUU4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 109;
			_closure_reg(a, c + 0);
		}
		break;
	case 4279: /* CVUP4 */
		_label(LEFT_CHILD(a));
		/* reg: CVUP4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + (move(a));
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 110;
			_closure_reg(a, c + 0);
		}
		break;
	case 4289: /* NEGF4 */
		_label(LEFT_CHILD(a));
		/* reg: NEGF4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 122;
			_closure_reg(a, c + 0);
		}
		break;
	case 4293: /* NEGI4 */
		_label(LEFT_CHILD(a));
		/* reg: NEGI4(ri) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_ri_NT] + 1;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 121;
			_closure_reg(a, c + 0);
		}
		break;
	case 4305: /* CALLF4 */
		_label(LEFT_CHILD(a));
		/* reg: CALLF4(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 97;
			_closure_reg(a, c + 0);
		}
		/* reg: CALLF4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 102;
			_closure_reg(a, c + 0);
		}
		break;
	case 4309: /* CALLI4 */
		_label(LEFT_CHILD(a));
		/* reg: CALLI4(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 94;
			_closure_reg(a, c + 0);
		}
		/* reg: CALLI4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 99;
			_closure_reg(a, c + 0);
		}
		break;
	case 4310: /* CALLU4 */
		_label(LEFT_CHILD(a));
		/* reg: CALLU4(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 95;
			_closure_reg(a, c + 0);
		}
		/* reg: CALLU4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 100;
			_closure_reg(a, c + 0);
		}
		break;
	case 4311: /* CALLP4 */
		_label(LEFT_CHILD(a));
		/* reg: CALLP4(addrg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_addrg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 96;
			_closure_reg(a, c + 0);
		}
		/* reg: CALLP4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 101;
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
			p->rule._stmt = 85;
		}
		/* stmt: RETF4(con) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_con_NT] + 10;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 92;
		}
		break;
	case 4341: /* RETI4 */
		_label(LEFT_CHILD(a));
		/* stmt: RETI4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 82;
		}
		/* stmt: RETI4(coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 86;
		}
		/* stmt: RETI4(con) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_con_NT] + 10;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 89;
		}
		break;
	case 4342: /* RETU4 */
		_label(LEFT_CHILD(a));
		/* stmt: RETU4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 83;
		}
		/* stmt: RETU4(coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 87;
		}
		/* stmt: RETU4(con) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_con_NT] + 10;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 90;
		}
		break;
	case 4343: /* RETP4 */
		_label(LEFT_CHILD(a));
		/* stmt: RETP4(reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + 0;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 84;
		}
		/* stmt: RETP4(coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_coni_NT] + 1;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 88;
		}
		/* stmt: RETP4(con) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_con_NT] + 10;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 91;
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
		/* addrfi: ADDRFP4 */
		c = (range (a, 0, 511));
		if (c + 0 < p->cost[_addrfi_NT]) {
			p->cost[_addrfi_NT] = c + 0;
			p->rule._addrfi = 1;
			_closure_addrfi(a, c + 0);
		}
		/* addrl: ADDRFP4 */
		if (0 + 0 < p->cost[_addrl_NT]) {
			p->cost[_addrl_NT] = 0 + 0;
			p->rule._addrl = 2;
			_closure_addrl(a, 0 + 0);
		}
		break;
	case 4391: /* ADDRLP4 */
		/* addrli: ADDRLP4 */
		c = (range (a, -511, 0));
		if (c + 0 < p->cost[_addrli_NT]) {
			p->cost[_addrli_NT] = c + 0;
			p->rule._addrli = 1;
			_closure_addrli(a, c + 0);
		}
		/* addrl: ADDRLP4 */
		if (0 + 0 < p->cost[_addrl_NT]) {
			p->cost[_addrl_NT] = 0 + 0;
			p->rule._addrl = 1;
			_closure_addrl(a, 0 + 0);
		}
		break;
	case 4401: /* ADDF4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: ADDF4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 5;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 128;
			_closure_reg(a, c + 0);
		}
		break;
	case 4405: /* ADDI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: ADDI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 125;
			_closure_reg(a, c + 0);
		}
		/* reg: ADDI4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 129;
			_closure_reg(a, c + 0);
		}
		break;
	case 4406: /* ADDU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: ADDU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 126;
			_closure_reg(a, c + 0);
		}
		/* reg: ADDU4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 130;
			_closure_reg(a, c + 0);
		}
		break;
	case 4407: /* ADDP4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: ADDP4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 127;
			_closure_reg(a, c + 0);
		}
		/* reg: ADDP4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 131;
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
			p->rule._reg = 147;
			_closure_reg(a, c + 0);
		}
		break;
	case 4421: /* SUBI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: SUBI4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 144;
			_closure_reg(a, c + 0);
		}
		/* reg: SUBI4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 148;
			_closure_reg(a, c + 0);
		}
		break;
	case 4422: /* SUBU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: SUBU4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 145;
			_closure_reg(a, c + 0);
		}
		/* reg: SUBU4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 149;
			_closure_reg(a, c + 0);
		}
		break;
	case 4423: /* SUBP4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* reg: SUBP4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 3;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 146;
			_closure_reg(a, c + 0);
		}
		/* reg: SUBP4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 150;
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
			p->rule._reg = 159;
			_closure_reg(a, c + 0);
		}
		/* reg: LSHI4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 161;
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
			p->rule._reg = 160;
			_closure_reg(a, c + 0);
		}
		/* reg: LSHU4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 162;
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
			p->rule._reg = 154;
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
			p->rule._reg = 155;
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
			p->rule._reg = 163;
			_closure_reg(a, c + 0);
		}
		/* reg: RSHI4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 165;
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
			p->rule._reg = 164;
			_closure_reg(a, c + 0);
		}
		/* reg: RSHU4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 166;
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
			p->rule._reg = 132;
			_closure_reg(a, c + 0);
		}
		/* reg: BANDI4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 134;
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
			p->rule._reg = 133;
			_closure_reg(a, c + 0);
		}
		/* reg: BANDU4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 135;
			_closure_reg(a, c + 0);
		}
		break;
	case 4501: /* BCOMI4 */
		_label(LEFT_CHILD(a));
		/* reg: BCOMI4(ri) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_ri_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 123;
			_closure_reg(a, c + 0);
		}
		break;
	case 4502: /* BCOMU4 */
		_label(LEFT_CHILD(a));
		/* reg: BCOMU4(ri) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_ri_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 124;
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
			p->rule._reg = 136;
			_closure_reg(a, c + 0);
		}
		/* reg: BORI4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 138;
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
			p->rule._reg = 137;
			_closure_reg(a, c + 0);
		}
		/* reg: BORU4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 139;
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
			p->rule._reg = 140;
			_closure_reg(a, c + 0);
		}
		/* reg: BXORI4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 142;
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
			p->rule._reg = 141;
			_closure_reg(a, c + 0);
		}
		/* reg: BXORU4(reg,coni) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_coni_NT] + 2;
		if (c + 0 < p->cost[_reg_NT]) {
			p->cost[_reg_NT] = c + 0;
			p->rule._reg = 143;
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
			p->rule._reg = 153;
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
			p->rule._reg = 151;
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
			p->rule._reg = 152;
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
			p->rule._reg = 158;
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
			p->rule._reg = 156;
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
			p->rule._reg = 157;
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
			p->rule._stmt = 123;
		}
		break;
	case 4581: /* EQI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: EQI4(reg,ri) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_ri_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 121;
		}
		break;
	case 4582: /* EQU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: EQU4(reg,ri) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_ri_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 122;
		}
		break;
	case 4593: /* GEF4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: GEF4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 15;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 129;
		}
		break;
	case 4597: /* GEI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: GEI4(reg,ri) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_ri_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 127;
		}
		break;
	case 4598: /* GEU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: GEU4(reg,ri) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_ri_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 128;
		}
		break;
	case 4609: /* GTF4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: GTF4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 15;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 132;
		}
		break;
	case 4613: /* GTI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: GTI4(reg,ri) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_ri_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 130;
		}
		break;
	case 4614: /* GTU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: GTU4(reg,ri) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_ri_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 131;
		}
		break;
	case 4625: /* LEF4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: LEF4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 15;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 135;
		}
		break;
	case 4629: /* LEI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: LEI4(reg,ri) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_ri_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 133;
		}
		break;
	case 4630: /* LEU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: LEU4(reg,ri) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_ri_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 134;
		}
		break;
	case 4641: /* LTF4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: LTF4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 15;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 138;
		}
		break;
	case 4645: /* LTI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: LTI4(reg,ri) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_ri_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 136;
		}
		break;
	case 4646: /* LTU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: LTU4(reg,ri) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_ri_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 137;
		}
		break;
	case 4657: /* NEF4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: NEF4(reg,reg) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_reg_NT] + 15;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 126;
		}
		break;
	case 4661: /* NEI4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: NEI4(reg,ri) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_ri_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 124;
		}
		break;
	case 4662: /* NEU4 */
		_label(LEFT_CHILD(a));
		_label(RIGHT_CHILD(a));
		/* stmt: NEU4(reg,ri) */
		c = ((struct _state *)(LEFT_CHILD(a)->x.state))->cost[_reg_NT] + ((struct _state *)(RIGHT_CHILD(a)->x.state))->cost[_ri_NT] + 11;
		if (c + 0 < p->cost[_stmt_NT]) {
			p->cost[_stmt_NT] = c + 0;
			p->rule._stmt = 125;
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
	case 374: /* stmt: ARGF4(INDIRF4(ADDRFP4)) */
	case 373: /* stmt: ARGP4(INDIRP4(ADDRFP4)) */
	case 372: /* stmt: ARGU4(INDIRU4(ADDRFP4)) */
	case 371: /* stmt: ARGI4(INDIRI4(ADDRFP4)) */
	case 370: /* stmt: ARGF4(INDIRF4(ADDRLP4)) */
	case 369: /* stmt: ARGP4(INDIRP4(ADDRLP4)) */
	case 368: /* stmt: ARGU4(INDIRU4(ADDRLP4)) */
	case 367: /* stmt: ARGI4(INDIRI4(ADDRLP4)) */
	case 366: /* stmt: ARGF4(INDIRF4(ADDRGP4)) */
	case 365: /* stmt: ARGP4(INDIRP4(ADDRGP4)) */
	case 364: /* stmt: ARGU4(INDIRU4(ADDRGP4)) */
	case 363: /* stmt: ARGI4(INDIRI4(ADDRGP4)) */
	case 362: /* stmt: ARGF4(ADDRFP4) */
	case 361: /* stmt: ARGP4(ADDRFP4) */
	case 360: /* stmt: ARGU4(ADDRFP4) */
	case 359: /* stmt: ARGI4(ADDRFP4) */
	case 358: /* stmt: ARGF4(ADDRLP4) */
	case 357: /* stmt: ARGP4(ADDRLP4) */
	case 356: /* stmt: ARGU4(ADDRLP4) */
	case 355: /* stmt: ARGI4(ADDRLP4) */
	case 354: /* stmt: ARGF4(ADDRGP4) */
	case 353: /* stmt: ARGP4(ADDRGP4) */
	case 352: /* stmt: ARGU4(ADDRGP4) */
	case 351: /* stmt: ARGI4(ADDRGP4) */
	case 338: /* stmt: LABELV */
	case 46: /* addrl: ADDRFP4 */
	case 45: /* addrl: ADDRLP4 */
	case 44: /* special: ADDRGP4 */
	case 43: /* addrg: ADDRGP4 */
	case 42: /* addrfi: ADDRFP4 */
	case 41: /* addrli: ADDRLP4 */
	case 40: /* con: CNSTF4 */
	case 39: /* con: CNSTP4 */
	case 38: /* con: CNSTU4 */
	case 37: /* con: CNSTU2 */
	case 36: /* con: CNSTU1 */
	case 35: /* con: CNSTI4 */
	case 34: /* con: CNSTI2 */
	case 33: /* con: CNSTI1 */
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
	case 350: /* stmt: ARGF4(reg) */
	case 349: /* stmt: ARGP4(reg) */
	case 348: /* stmt: ARGU4(reg) */
	case 347: /* stmt: ARGI4(reg) */
	case 346: /* stmt: ARGF4(coni) */
	case 345: /* stmt: ARGP4(coni) */
	case 344: /* stmt: ARGU4(coni) */
	case 343: /* stmt: ARGI4(coni) */
	case 342: /* stmt: ARGF4(con) */
	case 341: /* stmt: ARGP4(con) */
	case 340: /* stmt: ARGU4(con) */
	case 339: /* stmt: ARGI4(con) */
	case 337: /* stmt: JUMPV(addrg) */
	case 243: /* reg: BCOMU4(ri) */
	case 242: /* reg: BCOMI4(ri) */
	case 241: /* reg: NEGF4(reg) */
	case 240: /* reg: NEGI4(ri) */
	case 239: /* reg: CVIF4(reg) */
	case 238: /* reg: CVFI4(reg) */
	case 237: /* reg: CVFF4(reg) */
	case 236: /* reg: CVIU4(reg) */
	case 235: /* reg: CVIU2(reg) */
	case 234: /* reg: CVIU1(reg) */
	case 233: /* reg: CVII4(reg) */
	case 232: /* reg: CVII2(reg) */
	case 231: /* reg: CVII1(reg) */
	case 230: /* reg: CVPU4(reg) */
	case 229: /* reg: CVUP4(reg) */
	case 228: /* reg: CVUU4(reg) */
	case 227: /* reg: CVUU2(reg) */
	case 226: /* reg: CVUU1(reg) */
	case 225: /* reg: CVUI4(reg) */
	case 224: /* reg: CVUI2(reg) */
	case 223: /* reg: CVUI1(reg) */
	case 222: /* stmt: RETF4(con) */
	case 221: /* stmt: RETP4(con) */
	case 220: /* stmt: RETU4(con) */
	case 219: /* stmt: RETI4(con) */
	case 218: /* stmt: RETP4(coni) */
	case 217: /* stmt: RETU4(coni) */
	case 216: /* stmt: RETI4(coni) */
	case 215: /* stmt: RETF4(reg) */
	case 214: /* stmt: RETP4(reg) */
	case 213: /* stmt: RETU4(reg) */
	case 212: /* stmt: RETI4(reg) */
	case 211: /* reg: CALLV(reg) */
	case 210: /* reg: CALLF4(reg) */
	case 209: /* reg: CALLP4(reg) */
	case 208: /* reg: CALLU4(reg) */
	case 207: /* reg: CALLI4(reg) */
	case 206: /* reg: CALLV(addrg) */
	case 205: /* reg: CALLF4(addrg) */
	case 204: /* reg: CALLP4(addrg) */
	case 203: /* reg: CALLU4(addrg) */
	case 202: /* reg: CALLI4(addrg) */
	case 105: /* reg: INDIRP4(addrl) */
	case 104: /* reg: INDIRF4(addrl) */
	case 103: /* reg: INDIRU4(addrl) */
	case 102: /* reg: INDIRU2(addrl) */
	case 101: /* reg: INDIRU1(addrl) */
	case 100: /* reg: INDIRI4(addrl) */
	case 99: /* reg: INDIRI2(addrl) */
	case 98: /* reg: INDIRI1(addrl) */
	case 97: /* reg: INDIRP4(addrg) */
	case 96: /* reg: INDIRF4(addrg) */
	case 95: /* reg: INDIRU4(addrg) */
	case 94: /* reg: INDIRU2(addrg) */
	case 93: /* reg: INDIRU1(addrg) */
	case 92: /* reg: INDIRI4(addrg) */
	case 91: /* reg: INDIRI2(addrg) */
	case 90: /* reg: INDIRI1(addrg) */
	case 89: /* reg: INDIRP4(reg) */
	case 88: /* reg: INDIRF4(reg) */
	case 87: /* reg: INDIRU4(reg) */
	case 86: /* reg: INDIRU2(reg) */
	case 85: /* reg: INDIRU1(reg) */
	case 84: /* reg: INDIRI4(reg) */
	case 83: /* reg: INDIRI2(reg) */
	case 82: /* reg: INDIRI1(reg) */
	case 81: /* reg: INDIRP4(special) */
	case 80: /* reg: INDIRF4(special) */
	case 79: /* reg: INDIRU4(special) */
	case 78: /* reg: INDIRU2(special) */
	case 77: /* reg: INDIRU1(special) */
	case 76: /* reg: INDIRI4(special) */
	case 75: /* reg: INDIRI2(special) */
	case 74: /* reg: INDIRI1(special) */
	case 73: /* reg: INDIRP4(regg) */
	case 72: /* reg: INDIRF4(regg) */
	case 71: /* reg: INDIRU4(regg) */
	case 70: /* reg: INDIRU2(regg) */
	case 69: /* reg: INDIRU1(regg) */
	case 68: /* reg: INDIRI4(regg) */
	case 67: /* reg: INDIRI2(regg) */
	case 66: /* reg: INDIRI1(regg) */
	case 65: /* reg: INDIRP4(regl) */
	case 64: /* reg: INDIRF4(regl) */
	case 63: /* reg: INDIRU4(regl) */
	case 62: /* reg: INDIRU2(regl) */
	case 61: /* reg: INDIRU1(regl) */
	case 60: /* reg: INDIRI4(regl) */
	case 59: /* reg: INDIRI2(regl) */
	case 58: /* reg: INDIRI1(regl) */
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
	case 57: /* ri: coni */
	case 56: /* ri: reg */
	case 55: /* reg: coni */
	case 54: /* reg: con */
	case 53: /* reg: regl */
	case 52: /* reg: regg */
	case 51: /* regg: special */
	case 50: /* regg: addrg */
	case 49: /* regl: addrl */
	case 48: /* regl: addrfi */
	case 47: /* regl: addrli */
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
	case 336: /* stmt: JUMPV(INDIRP4(reg)) */
	case 335: /* stmt: JUMPV(INDIRP4(addrg)) */
	case 334: /* stmt: JUMPV(INDIRP4(addrl)) */
	case 332: /* stmt: ARGB(INDIRB(reg)) */
	case 129: /* reg: CVUI4(INDIRU4(regg)) */
	case 128: /* reg: CVUI4(INDIRU2(regg)) */
	case 127: /* reg: CVUI4(INDIRU1(regg)) */
	case 126: /* reg: CVUI2(INDIRU2(regg)) */
	case 125: /* reg: CVUI2(INDIRU1(regg)) */
	case 124: /* reg: CVUI1(INDIRU1(regg)) */
	case 123: /* reg: CVUU4(INDIRU4(regg)) */
	case 122: /* reg: CVUU4(INDIRU2(regg)) */
	case 121: /* reg: CVUU4(INDIRU1(regg)) */
	case 120: /* reg: CVUU2(INDIRU2(regg)) */
	case 119: /* reg: CVUU2(INDIRU1(regg)) */
	case 118: /* reg: CVUU1(INDIRU1(regg)) */
	case 117: /* reg: CVUI4(INDIRU4(regl)) */
	case 116: /* reg: CVUI4(INDIRU2(regl)) */
	case 115: /* reg: CVUI4(INDIRU1(regl)) */
	case 114: /* reg: CVUI2(INDIRU2(regl)) */
	case 113: /* reg: CVUI2(INDIRU1(regl)) */
	case 112: /* reg: CVUI1(INDIRU1(regl)) */
	case 111: /* reg: CVUU4(INDIRU4(regl)) */
	case 110: /* reg: CVUU4(INDIRU2(regl)) */
	case 109: /* reg: CVUU4(INDIRU1(regl)) */
	case 108: /* reg: CVUU2(INDIRU2(regl)) */
	case 107: /* reg: CVUU2(INDIRU1(regl)) */
	case 106: /* reg: CVUU1(INDIRU1(regl)) */
		kids[0] = LEFT_CHILD(LEFT_CHILD(p));
		break;
	case 331: /* stmt: LTF4(reg,reg) */
	case 330: /* stmt: LTU4(reg,ri) */
	case 329: /* stmt: LTI4(reg,ri) */
	case 328: /* stmt: LEF4(reg,reg) */
	case 327: /* stmt: LEU4(reg,ri) */
	case 326: /* stmt: LEI4(reg,ri) */
	case 325: /* stmt: GTF4(reg,reg) */
	case 324: /* stmt: GTU4(reg,ri) */
	case 323: /* stmt: GTI4(reg,ri) */
	case 322: /* stmt: GEF4(reg,reg) */
	case 321: /* stmt: GEU4(reg,ri) */
	case 320: /* stmt: GEI4(reg,ri) */
	case 319: /* stmt: NEF4(reg,reg) */
	case 318: /* stmt: NEU4(reg,ri) */
	case 317: /* stmt: NEI4(reg,ri) */
	case 316: /* stmt: EQF4(reg,reg) */
	case 315: /* stmt: EQU4(reg,ri) */
	case 314: /* stmt: EQI4(reg,ri) */
	case 285: /* reg: RSHU4(reg,coni) */
	case 284: /* reg: RSHI4(reg,coni) */
	case 283: /* reg: RSHU4(reg,reg) */
	case 282: /* reg: RSHI4(reg,reg) */
	case 281: /* reg: LSHU4(reg,coni) */
	case 280: /* reg: LSHI4(reg,coni) */
	case 279: /* reg: LSHU4(reg,reg) */
	case 278: /* reg: LSHI4(reg,reg) */
	case 277: /* reg: MULF4(reg,reg) */
	case 276: /* reg: MULU4(reg,reg) */
	case 275: /* reg: MULI4(reg,reg) */
	case 274: /* reg: MODU4(reg,reg) */
	case 273: /* reg: MODI4(reg,reg) */
	case 272: /* reg: DIVF4(reg,reg) */
	case 271: /* reg: DIVU4(reg,reg) */
	case 270: /* reg: DIVI4(reg,reg) */
	case 269: /* reg: SUBP4(reg,coni) */
	case 268: /* reg: SUBU4(reg,coni) */
	case 267: /* reg: SUBI4(reg,coni) */
	case 266: /* reg: SUBF4(reg,reg) */
	case 265: /* reg: SUBP4(reg,reg) */
	case 264: /* reg: SUBU4(reg,reg) */
	case 263: /* reg: SUBI4(reg,reg) */
	case 262: /* reg: BXORU4(reg,coni) */
	case 261: /* reg: BXORI4(reg,coni) */
	case 260: /* reg: BXORU4(reg,reg) */
	case 259: /* reg: BXORI4(reg,reg) */
	case 258: /* reg: BORU4(reg,coni) */
	case 257: /* reg: BORI4(reg,coni) */
	case 256: /* reg: BORU4(reg,reg) */
	case 255: /* reg: BORI4(reg,reg) */
	case 254: /* reg: BANDU4(reg,coni) */
	case 253: /* reg: BANDI4(reg,coni) */
	case 252: /* reg: BANDU4(reg,reg) */
	case 251: /* reg: BANDI4(reg,reg) */
	case 250: /* reg: ADDP4(reg,coni) */
	case 249: /* reg: ADDU4(reg,coni) */
	case 248: /* reg: ADDI4(reg,coni) */
	case 247: /* reg: ADDF4(reg,reg) */
	case 246: /* reg: ADDP4(reg,reg) */
	case 245: /* reg: ADDU4(reg,reg) */
	case 244: /* reg: ADDI4(reg,reg) */
	case 201: /* stmt: ASGNP4(reg,reg) */
	case 200: /* stmt: ASGNF4(reg,reg) */
	case 199: /* stmt: ASGNU4(reg,reg) */
	case 198: /* stmt: ASGNU2(reg,reg) */
	case 197: /* stmt: ASGNU1(reg,reg) */
	case 196: /* stmt: ASGNI4(reg,reg) */
	case 195: /* stmt: ASGNI2(reg,reg) */
	case 194: /* stmt: ASGNI1(reg,reg) */
	case 193: /* stmt: ASGNP4(addrfi,special) */
	case 192: /* stmt: ASGNF4(addrfi,special) */
	case 191: /* stmt: ASGNU4(addrfi,special) */
	case 190: /* stmt: ASGNU2(addrfi,special) */
	case 189: /* stmt: ASGNU1(addrfi,special) */
	case 188: /* stmt: ASGNI4(addrfi,special) */
	case 187: /* stmt: ASGNI2(addrfi,special) */
	case 186: /* stmt: ASGNI1(addrfi,special) */
	case 185: /* stmt: ASGNP4(addrli,special) */
	case 184: /* stmt: ASGNF4(addrli,special) */
	case 183: /* stmt: ASGNU4(addrli,special) */
	case 182: /* stmt: ASGNU2(addrli,special) */
	case 181: /* stmt: ASGNU1(addrli,special) */
	case 180: /* stmt: ASGNI4(addrli,special) */
	case 179: /* stmt: ASGNI2(addrli,special) */
	case 178: /* stmt: ASGNI1(addrli,special) */
	case 177: /* stmt: ASGNP4(addrfi,reg) */
	case 176: /* stmt: ASGNF4(addrfi,reg) */
	case 175: /* stmt: ASGNU4(addrfi,reg) */
	case 174: /* stmt: ASGNU2(addrfi,reg) */
	case 173: /* stmt: ASGNU1(addrfi,reg) */
	case 172: /* stmt: ASGNI4(addrfi,reg) */
	case 171: /* stmt: ASGNI2(addrfi,reg) */
	case 170: /* stmt: ASGNI1(addrfi,reg) */
	case 169: /* stmt: ASGNP4(addrli,reg) */
	case 168: /* stmt: ASGNF4(addrli,reg) */
	case 167: /* stmt: ASGNU4(addrli,reg) */
	case 166: /* stmt: ASGNU2(addrli,reg) */
	case 165: /* stmt: ASGNU1(addrli,reg) */
	case 164: /* stmt: ASGNI4(addrli,reg) */
	case 163: /* stmt: ASGNI2(addrli,reg) */
	case 162: /* stmt: ASGNI1(addrli,reg) */
	case 161: /* stmt: ASGNP4(addrl,reg) */
	case 160: /* stmt: ASGNF4(addrl,reg) */
	case 159: /* stmt: ASGNU4(addrl,reg) */
	case 158: /* stmt: ASGNU2(addrl,reg) */
	case 157: /* stmt: ASGNU1(addrl,reg) */
	case 156: /* stmt: ASGNI4(addrl,reg) */
	case 155: /* stmt: ASGNI2(addrl,reg) */
	case 154: /* stmt: ASGNI1(addrl,reg) */
	case 153: /* stmt: ASGNP4(special,coni) */
	case 152: /* stmt: ASGNF4(special,coni) */
	case 151: /* stmt: ASGNU4(special,coni) */
	case 150: /* stmt: ASGNU2(special,coni) */
	case 149: /* stmt: ASGNU1(special,coni) */
	case 148: /* stmt: ASGNI4(special,coni) */
	case 147: /* stmt: ASGNI2(special,coni) */
	case 146: /* stmt: ASGNI1(special,coni) */
	case 145: /* stmt: ASGNP4(special,reg) */
	case 144: /* stmt: ASGNF4(special,reg) */
	case 143: /* stmt: ASGNU4(special,reg) */
	case 142: /* stmt: ASGNU2(special,reg) */
	case 141: /* stmt: ASGNU1(special,reg) */
	case 140: /* stmt: ASGNI4(special,reg) */
	case 139: /* stmt: ASGNI2(special,reg) */
	case 138: /* stmt: ASGNI1(special,reg) */
	case 137: /* stmt: ASGNP4(addrg,reg) */
	case 136: /* stmt: ASGNF4(addrg,reg) */
	case 135: /* stmt: ASGNU4(addrg,reg) */
	case 134: /* stmt: ASGNU2(addrg,reg) */
	case 133: /* stmt: ASGNU1(addrg,reg) */
	case 132: /* stmt: ASGNI4(addrg,reg) */
	case 131: /* stmt: ASGNI2(addrg,reg) */
	case 130: /* stmt: ASGNI1(addrg,reg) */
		kids[0] = LEFT_CHILD(p);
		kids[1] = RIGHT_CHILD(p);
		break;
	case 313: /* stmt: ASGNU4(special,RSHU4(INDIRU4(special),reg)) */
	case 312: /* stmt: ASGNI4(special,RSHI4(INDIRI4(special),reg)) */
	case 311: /* stmt: ASGNU4(special,RSHU4(INDIRU4(special),coni)) */
	case 310: /* stmt: ASGNI4(special,RSHI4(INDIRI4(special),coni)) */
	case 309: /* stmt: ASGNU4(special,LSHU4(INDIRU4(special),reg)) */
	case 308: /* stmt: ASGNI4(special,LSHI4(INDIRI4(special),reg)) */
	case 307: /* stmt: ASGNU4(special,LSHU4(INDIRU4(special),coni)) */
	case 306: /* stmt: ASGNI4(special,LSHI4(INDIRI4(special),coni)) */
	case 305: /* stmt: ASGNU4(special,SUBU4(INDIRU4(special),reg)) */
	case 304: /* stmt: ASGNI4(special,SUBI4(INDIRI4(special),reg)) */
	case 303: /* stmt: ASGNU4(special,SUBU4(INDIRU4(special),coni)) */
	case 302: /* stmt: ASGNI4(special,SUBI4(INDIRI4(special),coni)) */
	case 301: /* stmt: ASGNU4(special,ADDU4(INDIRU4(special),reg)) */
	case 300: /* stmt: ASGNI4(special,ADDI4(INDIRI4(special),reg)) */
	case 299: /* stmt: ASGNU4(special,ADDU4(INDIRU4(special),coni)) */
	case 298: /* stmt: ASGNI4(special,ADDI4(INDIRI4(special),coni)) */
	case 297: /* stmt: ASGNU4(special,BXORU4(INDIRU4(special),reg)) */
	case 296: /* stmt: ASGNI4(special,BXORI4(INDIRI4(special),reg)) */
	case 295: /* stmt: ASGNU4(special,BXORU4(INDIRU4(special),coni)) */
	case 294: /* stmt: ASGNI4(special,BXORI4(INDIRI4(special),coni)) */
	case 293: /* stmt: ASGNU4(special,BORU4(INDIRU4(special),reg)) */
	case 292: /* stmt: ASGNI4(special,BORI4(INDIRI4(special),reg)) */
	case 291: /* stmt: ASGNU4(special,BORU4(INDIRU4(special),coni)) */
	case 290: /* stmt: ASGNI4(special,BORI4(INDIRI4(special),coni)) */
	case 289: /* stmt: ASGNU4(special,BANDU4(INDIRU4(special),reg)) */
	case 288: /* stmt: ASGNI4(special,BANDI4(INDIRI4(special),reg)) */
	case 287: /* stmt: ASGNU4(special,BANDU4(INDIRU4(special),coni)) */
	case 286: /* stmt: ASGNI4(special,BANDI4(INDIRI4(special),coni)) */
		kids[0] = LEFT_CHILD(p);
		kids[1] = LEFT_CHILD(LEFT_CHILD(RIGHT_CHILD(p)));
		kids[2] = RIGHT_CHILD(RIGHT_CHILD(p));
		break;
	case 333: /* stmt: ASGNB(reg,INDIRB(reg)) */
		kids[0] = LEFT_CHILD(p);
		kids[1] = LEFT_CHILD(RIGHT_CHILD(p));
		break;
	default:
		fatal("_kids", "Bad rule number %d\n", eruleno);
	}
}


/*


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
  case VOID:  /* void is defined as itself */
    fprintf(debug_file, "=%d", tc), col += 1+3;
    break;
  case INT:
    if (ty == chartype)  /* plain char is a subrange of itself */
      fprintf(debug_file, "=r%d;%ld;%ld;", tc, ty->u.sym->u.limits.min.i, ty->u.sym->u.limits.max.i),
        col += 2+3+2*2.408*ty->size+2;
    else      /* other signed ints are subranges of int */
      fprintf(debug_file, "=r1;%ld;%ld;", ty->u.sym->u.limits.min.i, ty->u.sym->u.limits.max.i),
        col += 4+2*2.408*ty->size+2;
    break;
  case UNSIGNED:
    if (ty == chartype)  /* plain char is a subrange of itself */
      fprintf(debug_file, "=r%d;0;%lu;", tc, ty->u.sym->u.limits.max.i),
        col += 2+3+2+2.408*ty->size+1;
    else      /* other signed ints are subranges of int */
      fprintf(debug_file, "=r1;0;%lu;", ty->u.sym->u.limits.max.i),
        col += 4+2.408*ty->size+1;
    break;
  case FLOAT:  /* float, double, long double get sizes, not ranges */
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
  case ARRAY:  /* array includes subscript as an int range */
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
      col += 1+3+1+3+1;  /* accounts for ,%d,%d; */
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
      print("' line %d\n", prevline = cp->y);
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
        r += 32;  /* floating point */
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
   print("' LCC 4.2 (LARGE) for Parallax Propeller\n");
   print("' (Catalina v2.5 Code Generator by Ross Higson)\n");
   print("'\n");
   for (i = r0; i <= r23; i++) {
      intreg[i] = mkreg("r%d", i, 1, IREG);
      // fltreg[i] = mkreg("r%d", i, 1, FREG); // Catalina 3.7
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

/* do trivial optimization to eliminate unnecessary mov instructions */
static void move_if_required (char *dst, char *src, char *comment) {
   int this_dst;
   int this_src;
   sscanf(src, "r%d", &this_src);
   sscanf(dst, "r%d", &this_dst);
   if (this_dst == this_src) {
      // no move is required
#ifdef DIAGNOSTIC 
      print ("' mov %s, %s ' %s <- removed by optimization\n", dst, src, comment);
#endif
   }
   else {
      print (" mov %s, %s ' %s\n", dst, src, comment);
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
      print ("' mov %s, %s ' %s <- removed by optimization\n", dst, src, comment);
#endif
   }
   else {
      print (" mov %s, %s ' %s\n", dst, src, comment);
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
         print("%s\n", r->x.name);
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
#ifdef OLD_VARIADIC
      print(" mov BC, #%d ' arg size, rpsize = %d, spsize = %d\n", p->syms[0]->u.c.v.u, rpsize, spsize);
#endif
      if ((spsize > 0) && (rpsize == 0)) {
         print(" add SP, #4 ' correct for new kernel !!! \n");
      }
      else if (rpsize > 0) {
         if (rpsize < 512 + 4) {
            if (rpsize > 4) {
               print(" sub SP, #%d ' stack space for reg ARGs\n", rpsize - 4);
            }
         }
         else {
            print(" jmp #LODL\n long %d\n sub SP, RI ' stack space for reg ARGs\n", rpsize - 4);
         }
      }
      if  (generic(kop) == ADDRG) {
#ifdef DIAGNOSTIC
         print("' CALL case 1\n");
#endif
         assert(kp->syms[0] && kp->syms[0]->x.name);
         src = kp->syms[0]->x.name;
         if (spsize <= 4) {
            print(" jmp #CALA\n long @%s ' CALL addrg\n", src);
         }
         else if (spsize < 512 + 4) {
            print(" jmp #CALA\n long @%s\n add SP, #%d ' CALL addrg\n", src, spsize - 4);   
         }
         else {
            print(" jmp #CALA\n long @%s\n jmp #LODL\n long %d\n add SP, RI ' CALL addrg\n", src, spsize - 4);   
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
            print(" mov RI, %s\n jmp #CALI ' CALL indirect\n", src); 
         }
         else if (spsize < 512 + 4) {
            print(" mov RI, %s\n jmp #CALI\n add SP, #%d ' CALL indirect\n", src, spsize - 4); 
         }
         else {
            print(" mov RI, %s\n jmp #CALI\n jmp #LODL\n long %d\n add SP, RI ' CALL indirect\n", src, spsize - 4); 
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
            if (rpsize < 512) {
               print(" sub SP, #%d ' stack space for reg ARGs\n", rpsize);
            }
            else {
               print(" jmp #LODL\n long %d\n sub SP, RI ' stack space for reg ARGs\n", rpsize);
            }
            rpsize = 0;
         }
         if  (generic(kop) == CNST) {
#ifdef DIAGNOSTIC            
            print ("' ARG const case 1\n");
#endif
            assert(kp->syms[0] && kp->syms[0]->x.name);
            r = kp->syms[0];
            src = r->x.name;
            if ((isint(r->type) || isunsigned(r->type))
            &&  (r->u.c.v.i >= 0) && (r->u.c.v.i < 512)) {
               print(" mov RI, #%s\n jmp #PSHL ' stack ARG coni\n", src);
            }
            else {
               print(" jmp #LODL\n long %s\n jmp #PSHL ' stack ARG con\n", src);
            }
         }
         else if  (generic(kop) == ADDRG) {
#ifdef DIAGNOSTIC            
            print ("' ARG case 1\n");
#endif
            assert(kp->syms[0] && kp->syms[0]->x.name);
            src = kp->syms[0]->x.name;
            print(" jmp #LODL\n long @%s\n jmp #PSHL ' stack ARG ADDRG\n", src); 
         }
         else if (generic(kop) == ADDRL) {
#ifdef DIAGNOSTIC            
            print ("' ARG case 2a\n");
#endif
            assert(kp->syms[0] && kp->syms[0]->x.name);
            src = kp->syms[0]->x.name;
            offs = kp->syms[0]->x.offset;
            if ((offs <= 0) && (offs > -512)) {
               print(" mov RI, FP\n sub RI, #-(%s)\n jmp #PSHL ' stack ARG ADDRLi\n", src); 
            }
            else {
               print(" jmp #LODF\n long %s\n jmp #PSHL ' stack ARG ADDRL\n", src); 
            }
         }
         else if (generic(kop) == ADDRF) {
#ifdef DIAGNOSTIC            
            print ("' ARG case 2b\n");
#endif
            assert(kp->syms[0] && kp->syms[0]->x.name);
            src = kp->syms[0]->x.name;
            offs = kp->syms[0]->x.offset;
            if ((offs >= 0) && (offs < 512)) {
               print(" mov RI, FP\n add RI, #%s\n jmp #PSHL ' stack ARG ADDRFi\n", src); 
            }
            else {
               print(" jmp #LODF\n long %s\n jmp #PSHL ' stack ARG ADDRF\n", src); 
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
               print(" jmp #PSHA\n long @%s ' stack ARG INDIR ADDRG\n", src);
               //print(" jmp #LODL\n long @%s\n jmp #RLNG\n mov RI, BC\n jmp #PSHL' stack ARG INDIR addrg\n", src); 
            }
            else if (generic(kkop) == ADDRL) {
#ifdef DIAGNOSTIC            
               print ("' ARG case INDIR 2a\n");
#endif
               assert(kkp->syms[0] && kkp->syms[0]->x.name);
               src = kkp->syms[0]->x.name;
               offs = kkp->syms[0]->x.offset;
               if ((offs <= 0) && (offs > -512)) {
                  print(" jmp #PSHF\n long %s ' stack ARG INDIR ADDRLi\n", src); 
               }
               else {
                  print(" jmp #PSHF\n long %s ' stack ARG INDIR ADDRL\n", src); 
               }
            }
            else if (generic(kkop) == ADDRF) {
#ifdef DIAGNOSTIC            
               print ("' ARG case INDIR 2b\n");
#endif
               assert(kkp->syms[0] && kkp->syms[0]->x.name);
               src = kkp->syms[0]->x.name;
               offs = kkp->syms[0]->x.offset;
               if ((offs >= 0) && (offs < 512)) {
                  print(" jmp #PSHF\n long %s ' stack ARG INDIR ADDRFi\n", src); 
               }
               else {
                  print(" jmp #PSHF\n long %s ' stack ARG INDIR ADDRF\n", src); 
               }
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
                     &&  (r->u.c.v.i >= 0) && (r->u.c.v.i < 512)) {
                        print(" mov RI, #%s\n jmp #PSHL ' stack ARG coni\n", src);
                     }
                     else {
                        print(" jmp #LODL\n long %s\n jmp #PSHL ' stack ARG con\n", src);
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
                  print(" mov RI, %s\n jmp #PSHL ' stack ARG\n", src);
               }
            }
            else {
               // for anything not matched yet, assume the result is in the node's target register
#ifdef DIAGNOSTIC            
               print ("' Fallback Processing\n");
#endif               
               assert(kp->syms[RX] && kp->syms[RX]->x.name);
               src = kp->syms[RX]->x.name;
               print(" mov RI, %s\n jmp #PSHL ' stack ARG\n", src); 
            }
         }
         else {
#ifdef DIAGNOSTIC            
            print ("' ARG case 6\n");
#endif
            assert(kp->syms[RX] && kp->syms[RX]->x.name);
            src = kp->syms[RX]->x.name;
            print(" mov RI, %s\n jmp #PSHL ' stack ARG\n", src);
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
            &&  (r->u.c.v.i >= 0) && (r->u.c.v.i < 512)) {
               print(" mov %s, #%s ' reg ARG coni\n", q->name, src);
            }
            else {
               print(" jmp #LODL\n long %s\n mov %s, RI ' reg ARG con\n", src, q->name);
            }
         }
         else if  (generic(kop) == ADDRG) {
#ifdef DIAGNOSTIC            
            print ("' ARG case 1\n");
#endif
            assert(kp->syms[0] && kp->syms[0]->x.name);
            src = kp->syms[0]->x.name;
            print(" jmp #LODL\n long @%s\n mov %s, RI ' reg ARG ADDRG\n", src, q->name); 
         }
         else if (generic(kop) == ADDRL) {
#ifdef DIAGNOSTIC            
            print ("' ARG case 2a\n");
#endif
            assert(kp->syms[0] && kp->syms[0]->x.name);
            src = kp->syms[0]->x.name;
            offs = kp->syms[0]->x.offset;
            if ((offs <= 0) && (offs > -512)) {
               print(" mov %s, FP\n sub %s, #-(%s) ' reg ARG ADDRLi\n", q->name, q->name, src); 
            }
            else {
               print(" jmp #LODF\n long %s\n mov %s, RI ' reg ARG ADDRL\n", src, q->name); 
            }
         }
         else if (generic(kop) == ADDRF) {
#ifdef DIAGNOSTIC            
            print ("' ARG case 2b\n");
#endif
            assert(kp->syms[0] && kp->syms[0]->x.name);
            src = kp->syms[0]->x.name;
            offs = kp->syms[0]->x.offset;
            if ((offs >= 0) && (offs < 512)) {
               print(" mov %s, FP\n add %s, #%s ' reg ARG ADDRFi\n", q->name, q->name, src); 
            }
            else {
               print(" jmp #LODF\n long %s\n mov %s, RI ' reg ARG ADDRF\n", src, q->name); 
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
               print(" jmp #LODI\n long @%s\n mov %s, RI ' reg ARG INDIR ADDRG\n", src, q->name); 
            }
            else if (generic(kkop) == ADDRL) {
#ifdef DIAGNOSTIC            
               print ("' ARG case INDIR 2a\n");
#endif
               assert(kkp->syms[0] && kkp->syms[0]->x.name);
               src = kkp->syms[0]->x.name;
               offs = kkp->syms[0]->x.offset;
               if ((offs <= 0) && (offs > -512)) {
                  print(" mov RI, FP\n sub RI, #-(%s)\n rdlong %s, RI ' reg ARG INDIR ADDRLi\n", src, q->name); 
               }
               else {
                  print(" jmp #LODF\n long %s\n rdlong %s, RI ' reg ARG INDIR ADDRL\n", src, q->name); 
               }
            }
            else if (generic(kkop) == ADDRF) {
#ifdef DIAGNOSTIC            
               print ("' ARG case INDIR 2b\n");
#endif
               assert(kkp->syms[0] && kkp->syms[0]->x.name);
               src = kkp->syms[0]->x.name;
               offs = kkp->syms[0]->x.offset;
               if ((offs >= 0) && (offs < 512)) {
                  print(" mov RI, FP\n add RI, #%s\n rdlong %s, RI ' reg ARG INDIR ADDRFi\n", src, q->name); 
               }
               else {
                  print(" jmp #LODF\n long %s\n rdlong %s, RI ' reg ARG INDIR ADDRF\n", src, q->name); 
               }
            }
            else {
#ifdef DIAGNOSTIC            
               print ("' ARG case INDIR 6\n");
#endif
               // do nothing - argument should have been targeted at correct register already
            }
         }
         else {
#ifdef DIAGNOSTIC            
            print ("' ARG case 6\n");
#endif
            // do nothing - argument should have been targeted at correct register already
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
            print(" shl %s, #24\n", dst);
            print(" sar %s, #24 ' sign extend\n", dst);
         }
         else if (opsize(p->x.kids[0]->op) == 2) {
            if (dst != src) {
               print(" mov %s, %s ' CVII\n", dst, src);
            }
            print(" shl %s, #16\n", dst);
            print(" sar %s, #16 ' sign extend\n", dst);
         }
      }
   }
   else if (op == CVU+I) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *src = preg0(intreg);
      move_if_required(dst, src, "CVUI");
      if (opsize(p->x.kids[0]->op) < opsize(p->op)) {
         if (opsize(p->x.kids[0]->op) == 1) {
            print(" and %s, cviu_m1 ' zero extend\n", dst);
         }
         else if (opsize(p->x.kids[0]->op) == 2) {
            print(" and %s, cviu_m2 ' zero extend\n", dst);
         }
      }
   }
   else if (generic(op) == CVI || generic(op) == CVU || generic(op) == LOAD) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *src = preg0(intreg);
      move_if_required(dst, src, "CVI, CVU or LOAD");
      if (opsize(p->x.kids[0]->op) < opsize(p->op)) {
         if (opsize(p->x.kids[0]->op) == 1) {
            print(" and %s, cviu_m1 ' truncate\n", dst);
         }
         else if (opsize(p->x.kids[0]->op) == 2) {
            print(" and %s, cviu_m2 ' truncate\n", dst);
         }
      }
   }
   else if (op == ASGN+B) {
      int size = p->syms[0]->u.c.v.u;
      print(" jmp #CPYB\n long %d ' ASGNB\n", size); 
   }   
   else if (op == ARG+B) {
      int size = p->syms[0]->u.c.v.u;
      if (rpsize > 0) {
         if (rpsize < 512) {
            if (rpsize) {
               print(" sub SP, #%d ' stack space for reg ARGs\n", rpsize);
            }
         }
         else {
            print(" jmp #LODL\n long %d\n sub SP, RI ' stack space for reg ARGs\n", rpsize);
         }
         rpsize = 0;
      }
      print(" jmp #PSHB\n long %d ' ARGB\n", size);
      spsize += roundup(size, 4);
   }
   /* 
    * the following code is necessary to detect cases where one or the other of the 
    * operands is already in r0 (and therefore gets clobbered by lcc) - there must 
    * be a cleaner way of doing this, but this one works ok
    */
   else if (op == ADD+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" jmp #FADD ' ADDF4\n");
   }
   else if (op == SUB+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" jmp #FSUB ' SUBF4\n");
   }
   else if (op == MUL+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" jmp #FMUL ' MULF4\n");
   }
   else if (op == DIV+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" jmp #FDIV ' DIVF4\n");
   }
   else if ((op == MUL+I) || (op == MUL+U)) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" jmp #MULT ' MULT(I/U)\n");
   }
   else if ((op == DIV+I) || (op == MOD+I)) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" jmp #DIVS ' DIVI\n");
   }
   else if ((op == DIV+U) || (op == MOD+U)) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" jmp #DIVU ' DIVU\n");
   }
   else if (op == EQ+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" jmp #FCMP\n jmp #BR_Z\n long @%s ' EQF4\n", p->syms[0]->x.name);
   }
   else if (op == NE+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" jmp #FCMP\n jmp #BRNZ\n long @%s ' NEF4\n", p->syms[0]->x.name);
   }
   else if (op == GE+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" jmp #FCMP\n jmp #BRAE\n long @%s ' GEF4\n", p->syms[0]->x.name);
   }
   else if (op == GT+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" jmp #FCMP\n jmp #BR_A\n long @%s ' GTF4\n", p->syms[0]->x.name);
   }
   else if (op == LE+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" jmp #FCMP\n jmp #BRBE\n long @%s ' LEF4\n", p->syms[0]->x.name);
   }
   else if (op == LT+F) {
      setup_r0_and_r1(preg0(intreg), preg1(intreg)); 
      print(" jmp #FCMP\n jmp #BR_B\n long @%s ' LTF4\n", p->syms[0]->x.name);
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
         print (" adds %s, %s ' ADDI/P (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" adds %s, %s ' ADDI/P (2)\n", dst, op1);
      }
      else {
         move_if_required(dst, op1, "ADDI/P");
         print (" adds %s, %s ' ADDI/P (3)\n", dst, op2);
      }
   }
   else if (op == ADD+U) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *op1 = preg0(intreg);
      char *op2 = preg1(intreg);
      if (strcmp(dst, op1) == 0) {
         print (" add %s, %s ' ADDU (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" add %s, %s ' ADDU (2)\n", dst, op1);
      }
      else {
         move_if_required(dst, op1, "ADDU");
         print (" add %s, %s ' ADDU (3)\n", dst, op2);
      }
   }
   else if ((op == SUB+I) || (op == SUB+P)) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *op1 = preg0(intreg);
      char *op2 = preg1(intreg);
      if (strcmp(dst, op1) == 0) {
         print (" subs %s, %s ' SUBI/P (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" subs %s, %s\n neg %s, %s ' SUBI/P (2)\n", dst, op1, dst, dst);
      }
      else {
      move_if_required(dst, op1, "SUBI/P");
         print (" subs %s, %s ' SUBI/P (3)\n", dst, op2);
      }
   }
   else if (op == SUB+U) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *op1 = preg0(intreg);
      char *op2 = preg1(intreg);
      if (strcmp(dst, op1) == 0) {
         print (" sub %s, %s ' SUBU (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" mov RI, %s\n sub RI, %s\n mov %s, RI ' SUBU (2)\n", op1, op2, dst);
      }
      else {
         move_if_required(dst, op1, "SUBU");
         print (" sub %s, %s ' SUBU (3)\n", dst, op2);
      }
   }
   else if ((op == BOR+I) || (op == BOR+U)) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *op1 = preg0(intreg);
      char *op2 = preg1(intreg);
      if (strcmp(dst, op1) == 0) {
         print (" or %s, %s ' BORI/U (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" or %s, %s ' BORI/U (2)\n", dst, op1);
      }
      else {
         move_if_required(dst, op1, "BORI/U");
         print (" or %s, %s ' BORI/U (3)\n", dst, op2);
      }
   }
   else if ((op == BAND+I) || (op == BAND+U)) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *op1 = preg0(intreg);
      char *op2 = preg1(intreg);
      if (strcmp(dst, op1) == 0) {
         print (" and %s, %s ' BANDI/U (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" and %s, %s ' BANDI/U (2)\n", dst, op1);
      }
      else {
         move_if_required(dst, op1, "BANDI/U");
         print (" and %s, %s ' BANDI/U (3)\n", dst, op2);
      }
   }
   else if ((op == BXOR+I) || (op == BXOR+U)) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *op1 = preg0(intreg);
      char *op2 = preg1(intreg);
      if (strcmp(dst, op1) == 0) {
         print (" xor %s, %s ' BXORI/U (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" xor %s, %s ' BXORI/U (2)\n", dst, op1);
      }
      else {
         move_if_required(dst, op1, "BXORI/U");
         print (" xor %s, %s ' BXORI/U (3)\n", dst, op2);
      }
   }
   else if ((op == LSH+I) || (op == LSH+U)) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *op1 = preg0(intreg);
      char *op2 = preg1(intreg);
      if (strcmp(dst, op1) == 0) {
         print (" shl %s, %s ' LSHI/U (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" mov RI, %s\n shl RI, %s\n mov %s, RI ' SHLI/U (2)\n", op1, op2, dst);
      }
      else {
         move_if_required(dst, op1, "LSHI/U");
         print (" shl %s, %s ' LSHI/U (3)\n", dst, op2);
      }
   }
   else if (op == RSH+I) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *op1 = preg0(intreg);
      char *op2 = preg1(intreg);
      if (strcmp(dst, op1) == 0) {
         print (" sar %s, %s ' RSHI (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" mov RI, %s\n sar RI, %s\n mov %s, RI ' RSHI (2)\n", op1, op2, dst);
      }
      else {
         move_if_required(dst, op1, "RSHI");
         print (" sar %s, %s ' RSHI (3)\n", dst, op2);
      }
   }
   else if (op == RSH+U) {
      char *dst = intreg[getregnum(p)]->x.name;
      char *op1 = preg0(intreg);
      char *op2 = preg1(intreg);
      if (strcmp(dst, op1) == 0) {
         print (" shr %s, %s ' RSHU (1)\n", dst, op2);
      }
      else if (strcmp(dst, op2) == 0) {
         print (" mov RI, %s\n shr RI, %s\n mov %s, RI ' RSHU (2)\n", op1, op2, dst);
      }
      else {
         move_if_required(dst, op1, "RSHU");
         print (" shr %s, %s ' RSHU (3)\n", dst, op2);
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

   print("\n long ' align long\n%s ' <symbol:%s>\n", f->x.name, f->name);
#ifdef PRINT_SYMBOL_INFO
   fprintf(stderr, "\nfunction %s\n", f->x.name);
#endif

   ismain = (strcmp(f->x.name, "C_main") == 0);

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
            else {
#ifdef PRINT_SYMBOL_INFO
               fprintf(stderr, "USING REG %s for ARG %d\n", p->x.name, i);
#endif
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

   if (framesize < 512) {
      if ((framesize > 0) || args_in_frame || varargs || (glevel > 1)) {
#ifdef REG_PASSING            
         if (ismain) {
            // main does not get called the normal way - so simulate it
            printf(" sub SP, #8\n");
#ifdef OLD_VARIADIC
            printf(" mov BC, #8\n");
#endif
         }
#endif
         print(" jmp #NEWF\n");
         if (framesize > 0) {
            print(" sub SP, #%d\n", framesize);
         }
      }
   }
   else {
#ifdef REG_PASSING            
      if (ismain) {
         // main does not get called the normal way - so simulate it
         printf(" sub SP, #8\n");
#ifdef OLD_VARIADIC
         printf(" mov BC, #8\n");
#endif
      }
#endif      
      print(" jmp #NEWF\n");
      print(" jmp #LODL\n long %d\n sub SP, RI\n", framesize);
   }
   if (ismain) {
      if (glevel > 0) {
         print (" jmp #CALA\n long @C_debug_init\n");
      }
      print ("#ifndef NO_ARGS\n");
      print (" jmp #CALA\n long @C_arg_setup\n");
      print ("#endif\n");
   }
   else {
#ifdef DIAGNOSTIC
      printf("' SAVEMASK=%x\n", (saveimask | savefmask) & 0xfffffffe);
#endif
      if (((saveimask | savefmask) & 0xfffffffe) != 0) {
         print (" jmp #PSHM\n long $%x ' save registers\n", (saveimask | savefmask) & 0xfffffffe);
      }
   }
#ifdef REG_PASSING
   if (varargs) {
#ifdef OLD_VARIADIC      
      // variadic functions must spill all reg arguments to stack, even if the
      // caller doesn't use all the possible reg arguments - but we must be
      // careful to only use the available space - i.e. from FP + 8 to BC
      // ensure there is enough space to do this!
      print(" mov RI, FP\n add RI, #8\n");
      for (i = 0; i < NUM_PASSING_REGS; i++) {
         print(" sub BC, #4\n cmp BC, RI wz,wc\n if_ae wrlong r%d, BC ' spill reg (varadic)\n", 
            FIRST_PASSING_REG + i);
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
                  if (out->x.offset < 512) {
                     print(" mov RI, FP\n add RI, #%d\n wrlong %s, RI ' spill reg\n", 
                     out->x.offset, ins);
                  }
                  else {
                     print(" jmp LODF\n long %d\n wrlong %s, RI ' spill reg\n",
                     out->x.offset, ins);
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

   if (!ismain) {
#ifdef DIAGNOSTIC
   printf("' SAVEMASK=%x\n", (saveimask | savefmask) & 0xfffffffe);
#endif
      if (((saveimask | savefmask) & 0xfffffffe) != 0) {
         print (" jmp #POPM ' restore registers\n");
      }
   }
   if (ismain) {
      // main routine never returns - if it never even exits, define 
      // NO_EXIT to disable the generation of the jump to exit.
      print("#ifndef NO_EXIT\n");
      print(" jmp #JMPA\n long @C__exit\n");
      print("#endif\n");
   }
   else {
      if (framesize < 512) {
         if ((framesize > 0) || args_in_frame || varargs || (glevel > 1)) {
            if (framesize > 0) {
               print(" add SP, #%d ' framesize\n", framesize);
            }
            print(" jmp #RETF\n\n");
         }
         else {
            print(" jmp #RETN\n\n");
         }
      }
      else {
         print(" jmp #LODL\n long %d\n add SP, RI ' framesize\n", framesize);
         print(" jmp #RETF\n\n");
      }
   }

#ifdef PRINT_SYMBOL_INFO
   fprintf(stderr, "\n%s done\n", f->x.name);
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
      sprintf(&buf[k], "_L%06d\0", genlabel(1));
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
   print("\n long ' align long\n");
   print("%s ' <symbol:%s>\n", p->x.name, p->name);
}

static void space(int n) {
   print(" byte 0[%d]\n", n);
}


Interface catalina_largeIR = {
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
