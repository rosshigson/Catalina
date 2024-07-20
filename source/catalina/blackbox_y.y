%{

/*
 * Blackbox - Command-line debugger for programs built with the Catalina 
 *            compilation system for the Parallax Propeller. 
 *
 * version 2.4 - initial release (to coincide with Catalina 2.4)
 *
 * version 2.4.1 - Add support for embedded source files (#include "xxx.c").
 *                 Add support for printing and updating bit fields.
 *                 Fix parsing of 'step into', 'step next', 'step out'.
 * 
 * version 2.4.2 - Fix display of signed bit fields.
 * 
 * version 2.5 - Allow 'array' and 'func' as identifiers.
 *               Allow '???' for location.
 * 
 * version 2.6 - Added the ability to "read" from '&function' or '&variable'
 *
 * version 2.7 - just update version number.
 *
 * version 2.8 - just update version number.
 *
 * version 2.9 - fix reduce/reduce conflicts.
 *
 *               replace longs with ints (on a 64 bit platform, longs 
 *               are 64 bits, not 32 - and we want 32!).
 *
 * version 3.0 - just update version number.
 *
 * version 3.0.3 - automatically search for comms port if -p not specified.
 *
 * version 3.0.4 - fix array size in parse_var 
 * 
 * Version 3.1 - just update version number.
 * 
 * Version 3.2 - just update version number.
 *
 * Version 3.3 - just update version number.
 *
 * Version 3.4 - just update version number.
 *
 * Version 3.5 - update offsets for new kernel.
 *
 * Version 3.6 - update offsets & memory mode detection for new image format.
 *
 * Version 3.7 - add compact (CMM) mode support.
 *
 * Version 3.8 - remove extension if ".binary", ".eeprom" or ".bin"
 *               allow for debugging EEPROM modes (for LMM or CMM)
 *               allow for reads of hub ram up to $ffff (instead of only $7fff)
 *
 * Version 3.9 - just update version number.
 *
 * Version 3.10 - just update version number.
 *
 * Version 3.11 - Allow reading structs and variables pointed to by a register
 *                (required now that catdbgfilegen correctly identifies the
 *                type of pointers).
 *                Allow "quit" as a synonym for "exit".
 *                Make list of backslash escaped character literals more 
 *                closely match C (adding \a, \?, \").
 *
 * Version 3.14 - Take relocation into account when printing variable 
 *                addresses.
 *
 * Version 3.15 - Add P2 support.

 * Version 3.16 - Add Lua scripting. The script can be specified on the
 *                command line via the 'L' option.
 *
 *               - Added the option to specify the port in the 
 *                 environment variable BLACKBOX_PORT - e.g:
 *
 *                    set BLACKBOX_PORT=17 (Windows or Linux)
 *                    export BLACKBOX_PORT=/dev/ttyUSB0 (Linux)
 *
 *             - Added "go" as a synonym for "continue"
 *
 *             - Fixed a problem with dereferencing pointers and accessing
 *               elements of structures/unions when printing variables.
 *
 *             - Fixed a problem with updating 1-byte and 2-byte values.
 *
 *             - Character arrays were only printed if the type of the array 
 *               element was type "char" (i.e. not type "unsigned char" or 
 *               "uint8_t" etc).
 *
 *             - Only the first field of a local structure or union (i.e. one 
 *               in the current frame) was being printed correctly.
 *
 *             - Fixed a problem with the P2 NATIVE support - breakpoints
 *               were being deleted after their first use.
 *
 *             - Add timeout to blackbox_open.
 *
 * Version 4.0 - Just update version number.
 *
 * Version 4.2 - fix bug in autoport logic.
 *
 *             - open port with exclusive access on Linux.
 *
 *             - set default timeout on Linux to 1000ms.
 *
 *             - fix print_var and update_expr logic, and allow 
 *               dereferencing of pointer types (including within
 *               structures).
 *
 * Version 4.3  - Just update version number.
 *
 * Version 5.3  - Update Lua to version 5.4.4
 *
 * Version 5.7  - Add support for Propeller 2 XMM modes - SMALL and LARGE.
 *              - updated some information messages to be more accurate.
 *
 * Version 5.7.1  - When duplicate source lines have the same address, keep 
 *                  the address associated with the LAST such line, rather
 *                  than the FIRST such line, because this is the line more
 *                  likely to actually have any code associated with that
 *                  address.
 *
 * Version 6.5.1  - Fix an issue that meant word-sized values (e.g. short or 
 *                  unsigned short) in structures were not displayed correctly.
 *
 *                - Fix an issue with determining the offset of a field within 
 *                  a nested structure or union.
 *
 *                - Fix an issue that meant negative values could not be
 *                  written using the write command.
 *
 *                - Fix an issue with the type search, which was aborting
 *                  the search at the first instance of "<array>" (indicating 
 *                  an anonymous array) instead of reporting "not found"
 *                  when searching for such types. This led to Blackbox
 *                  being unable to determine the type of variables in some
 *                  instances.
 *
 *                - Add support for reading and writing XMM RAM on the 
 *                  Propeller 2, and for specifying Propeller 2 specific
 *                  memory models (e.g. on the command line or using the
 *                  xmm command).
 *
 *                - Add support for (limited) indexing into arrays. 
 *                  The index must be the last element specified, so 
 *                     array[index]           is supported
 *                     array[index].field     is NOT supported
 *
 *                - Add support for (limited) use of the '->' operator on
 *                  pointers. The operator is only suported when the first
 *                  element specified is a pointer. This operator and can only
 *                  be followed by a single field (including optional index), 
 *                  so
 *                     p->elt          is supported 
 *                     p->elt[index]   is supported 
 *                     p->elt1.elt2    is NOT supported.
 *
 *                - Add support for (limited) use of the '*' operator when 
 *                  the first element specified is a pointer, so if p is a 
 *                  pointer then 
 *                     *p              is supported               
 *                  Also, note that '*' can be combined with '->' so if p 
 *                  and q are BOTH pointers then
 *                     *p->q           is supported 
 *                  and means *(p->q)
 *
 *                - Add support for variable names, &variable and &function 
 *                  being used to specify the address in read and write 
 *                  commands.
 *
 * Version 6.5.2  - The printing of the hex values of 1 and 2 byte variables 
 *                  is now more consistent - previously a value like -1 would 
 *                  have been printed as "-1 (0xFFFFFFFF)" even if the type 
 *                  was a 1 or 2 byte variable. Now, these will be printed as 
 *                  "-1 (0xFF)" or "-1 (0xFFFF)" respectively.
 *
 *                - Values specified with a size that is not 4 bytes, such as 
 *                  "byte", "char", "word" or "short" now mask the value to
 *                  the correct size, so "byte -1" is 0xFF and not 0xFFFFFFFF.
 *
 *                - The printing of character values now always includes the 
 *                  decimal value and the character value (if it is printable).
 *                  For example, if variable c contains the character 'x' 
 *                  then it will be printed as "120 ('x' 0x78)". If it
 *                  contains the non-printable character ESC then it will 
 *                  be printed as "27 (0x1B)".
 *
 *                - If the verbose mode is "on", then variables will be
 *                  printed with type and location information as well as 
 *                  their current value. For example, if verbose mode is 
 *                  "off" the command "print i" might print:
 *                     = 1 (0x00000001) 
 *                  but if verbose mode is "on" it might print:
 *                     LOCAL i int <size=4,align=4> @ register 23
 *                     int @ register 23 = 1 (0x00000001)
 *
 *                - Values can now include simple scalar variables or the
 *                  address of a variable, so it is now possible to say
 *                  things like:
 *                     update i = j
 *                     update k = &i
 *                     read i
 *                     read xmm &i
 *                     write hub &i = j
 *                  however, note that the read and write commands ALWAYS
 *                  read and write 4 bytes, even if the expression is a 1
 *                  or 2 byte value, and even if the address being written is 
 *                  the address of a 1 or 2 byte variable!
 *
 *                - It is possible to use size specifiers to convert values,
 *                  so the following are all valid no matter what the type
 *                  of variable x:
 *                     update x = char 'a'
 *                     update x = short 65535
 *                     update x = float 1.234
 *
 *                - The type of a variable was being incorrecty printed as 
 *                  "<anon>" in some circumstances - now, either the correct
 *                  name is printed or no name is printed.
 */

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

#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <signal.h>
#include <stdlib.h>
#include "rs232.h"
#include "printf.h"

#ifdef WIN32_PATHS         /* define this on the command line for Windows */
#include "lua-5.4.4\\src\\lua.h"
#include "lua-5.4.4\\src\\lualib.h"
#include "lua-5.4.4\\src\\lauxlib.h"
#else
#include "lua-5.4.4/src/lua.h"
#include "lua-5.4.4/src/lualib.h"
#include "lua-5.4.4/src/lauxlib.h"
#endif

#define VERSION            "6.5.2"

#define YYMAXDEPTH         20000    // must be this big to debug xvi !!!

#define MAX_NAMELEN        1024
#define MAX_SRC_FILES      250      // arbitrary
#define MAX_LINELEN        1024     // arbitrary

#define MAX_DBG_FILES      1 
#define MIN_BAUDRATE       19200
#define MAX_BAUDRATE       3000000
#define DEFAULT_BAUDRATE   115200
#ifdef _WIN32
#define DEFAULT_TIMEOUT    500 // milliseconds
#else
#define DEFAULT_TIMEOUT    1000 // milliseconds
#endif
#define MAX_TIMEOUT        10000 // milliseconds

#define PAGE_SIZE          20       // arbitrary

#define NO_OPERATION       0x00000000
#define P1_LMM_BREAKPOINT  0x5c7c0002 // used for P1 LMM or P1 XMM
#define P2_LMM_BREAKPOINT  0xFD800000 // used for P2 LMM or P2 XMM
#define CMM_BREAKPOINT     0x0000c001 // used for P1 CMM or P2 CMM
#define P2_NMM_BREAKPOINT  0xfe000000 // used for P2 NMM

#define LUA_TIMEOUT        10000 // milliseconds

#define BLACKBOX_PORT      "BLACKBOX_PORT" // set the port


#define LMM_PC_OFF         0x2b
#define LMM_SP_OFF         0x2c
#define LMM_FP_OFF         0x2d
#define LMM_RI_OFF         0x2e
#define LMM_BC_OFF         0x2f
#define LMM_BA_OFF         0x30
#define LMM_BZ_OFF         0x31
#define LMM_CS_OFF         0x32
#define LMM_R0_OFF         0x33

#define CMM_PC_OFF         0x18
#define CMM_SP_OFF         0x19
#define CMM_FP_OFF         0x1a
#define CMM_RI_OFF         0x1b
#define CMM_BC_OFF         0x1c
#define CMM_BA_OFF         0x1d
#define CMM_BZ_OFF         0x1e
#define CMM_CS_OFF         0x1f
#define CMM_R0_OFF         0x00

#define NMM_PC_OFF         0x1f6 // PA is ~ PC (when at breakpoint)
#define NMM_SP_OFF         0x1f8
#define NMM_FP_OFF         0x1f9
#define NMM_RI_OFF         0x14
#define NMM_BC_OFF         0x15
#define NMM_BA_OFF         -1
#define NMM_BZ_OFF         -1
#define NMM_CS_OFF         -1
#define NMM_R0_OFF         0x16

#define BLACKCAT_COMPATIBLE 0 // 1 for full blackcat compatibility
#define USE_BLACKCAT_BITLEN 1 // 1 to use bit field sizes and offsets

#ifndef _WIN32

#define BAD_SEPARATOR     '\\'
#define GOOD_SEPARATOR    '/'

#endif

enum locn_type { mem, off, reg };

struct location {
   enum locn_type type;  // type of location
   int            value; // address, offset or register number
};

struct reloc {
   unsigned long value;  // address relocation offset
};

struct source {
   char        * name;      // name of file
   unsigned int  start;     // start address
   unsigned int  end;       // end address
   struct node * globals;   // global variables 
   struct node * typedefs;  // typedefs 
   struct node * functions; // functions 
};

struct linenum {
   int               num;
   char            * fname; // name of function
   int               block; // block depth
   struct location * locn;  // location of line
};

struct debug_line {
   int               src;    // source file number
   int               num;    // source line number
   int               virt_b; // 1 = virtual breakpoint set
   int               user_b; // 1 = user breakpoint set
   struct location * locn;   // location of code for line
   struct node     * func;   // pointer to function
   int               inst;   // replacement instruction
};

struct variable {
   char            * fname; // name of function
   int               block; // block depth
   char            * name;  // name of variable
   int               stat;  // variable is static
   struct location * locn;  // location of variable
   struct node     * type;  // pointer to node that defines the type
};

struct function {
   char            * fname; // name of function
   int               src;   // source file number
   int               frame; // 1 if function is framed
   struct node     * lines; // lines in function
   struct node     * locals;// local variables in function
};

enum data_type {
   basic_t, 
   array_t, 
   struct_t, 
   union_t, 
   enum_t, 
   func_t,
};

struct type {
   int            id;     // stabs id (not used)
   char         * name;   // type name - e.g. "* unsigned long", "my_struct"
   char         * type;   // component types
   int            size;   // size in bytes of this element
   int            algn;   // alignment of this type
   int            indx;   // number of elts in arrays, or offset within struct
   int            stat;   // type is static
   int            boff;   // field offset (bits)
   int            blen;   // field size (bits)
   enum data_type d_type; // basic, array, struct etc
};

enum node_type { 
   reloc_t, 
   source_t, 
   incsrc_t, 
   linenum_t, 
   local_t, 
   global_t, 
   typedef_t,
   function_t,    // may be generated or parsed
   debug_t        // only generated, not parsed
};

struct node {
   enum   node_type type;
   union {
      struct type t;
      struct reloc r;
      struct source s;
      struct linenum l;
      struct variable v;
      struct function f;
      struct debug_line d;
   };
   struct node * elts; // pointer to element nodes (if applicable)
   struct node * next; // pointer to next node in list
};

static struct node * node_list;          // holds list of parsed nodes

static int PC_OFF = LMM_PC_OFF;
static int SP_OFF = LMM_SP_OFF;
static int FP_OFF = LMM_FP_OFF;
static int RI_OFF = LMM_RI_OFF;
static int BC_OFF = LMM_BC_OFF;
static int BA_OFF = LMM_BA_OFF;
static int BZ_OFF = LMM_BZ_OFF;
static int CS_OFF = LMM_CS_OFF;
static int R0_OFF = LMM_R0_OFF;

unsigned int reloc_value = 0;            // final reloc value
unsigned int cs_value = 0;               // code segment value
unsigned int source_count = 0;           // number of source files
struct node *source_list[MAX_SRC_FILES]; // pointers to source file nodes
struct node *debug_info[MAX_SRC_FILES];  // debug info for lines of source
FILE *source_handle[MAX_SRC_FILES];      // handles to open files

int    waiting = 0;
int    verbose = 0;
int    diagnose = 0;

static int    auto_port = 1; // 1 means auto (starting at port 0) 
static int    port = 0;
static int    baud = DEFAULT_BAUDRATE;
// mem_model:
//  On P1 0 = TINY LMM, 2 = SMALL XMM, 5 = LARGE XMM, 8 = CMM
//  On P2 100 = TINY LMM, 102 = SMALL XMM, 105 = LARGE_XMM, 108 = CMM, 111 = NMM
static int    mem_model = -1;

static int    breakpoint = P1_LMM_BREAKPOINT; // debug instruction to use

static int    file_count = 0;                  
static char * file_name[MAX_DBG_FILES];

static int    my_timeout = DEFAULT_TIMEOUT;

// the Lua interpreter
lua_State* L;

// the name of the Lua script to execute
static char * lua_script = NULL;

int           current_file = 1;
int           current_line = 1;

struct node * debugger_line = NULL;
struct node * main_line = NULL;
int           at_initial_brkpt = 1;

char * safecpy(char *dst, const char *src, size_t size);
char * safecat(char *dst, const char *src, size_t size);

int maxval (int a, int b);
int minval (int a, int b);
int roundup(unsigned int a, unsigned int b);
int is_command (char *str, char *cmd, int min);
int  blackbox_open(int port, int baud, int timeout);
void blackbox_close();
unsigned int  blackbox_address(int model, unsigned int *addr);
int  blackbox_model();
int  blackbox_go(int model, unsigned int inst);
int  blackbox_statistics(int *nak, int *bel);
int  blackbox_continue(int model, unsigned int inst, unsigned int *addr);
int  blackbox_cog_read(int model, unsigned int addr, unsigned int *value);
int  blackbox_cog_write(int model, unsigned int addr, int new_value, int value_len);
int  blackbox_xmm_read(int model, unsigned int addr, unsigned int *value);
int  blackbox_xmm_write(int model, unsigned int addr, int new_value, int value_len);
int  blackbox_hub_read(unsigned int addr, unsigned int *value);
int  blackbox_hub_write(unsigned int addr, int new_value, int value_len);

int  blackbox_set_inst(
   int model, 
   unsigned int addr, 
   int new_inst, 
   int *old_inst
);

extern int yylex();

int yyerror (char *s);

extern void mdelay(int ms);

extern FILE *yyin, *yyout;

void print_node (struct node * p);
void print_list (struct node *p);

#ifndef _WIN32
void fix_filename(char *fname);
#endif

unsigned int mask[32] = {
   0x00000000,
   0x00000001,
   0x00000003,
   0x00000007,
   0x0000000f,
   0x0000001f,
   0x0000003f,
   0x0000007f,
   0x000000ff,
   0x000001ff,
   0x000003ff,
   0x000007ff,
   0x00000fff,
   0x00001fff,
   0x00003fff,
   0x00007fff,
   0x0000ffff,
   0x0001ffff,
   0x0003ffff,
   0x0007ffff,
   0x000fffff,
   0x001fffff,
   0x003fffff,
   0x007fffff,
   0x00ffffff,
   0x01ffffff,
   0x03ffffff,
   0x07ffffff,
   0x0fffffff,
   0x1fffffff,
   0x3fffffff,
   0x7fffffff
};

%}

%union {
   int    a_number;
   char * a_string;
   struct location * a_addr;
   struct node * a_node;
}

%start lines
%token <a_number> number
%token <a_string> string
%token <a_string> errmsg
%token <a_string> identifier
%type <a_string> dummy_list
%type <a_node> line
%type <a_node> lines
%type <a_node> reloc
%type <a_node> source
%type <a_node> incsrc
%type <a_number> number_or_null
%type <a_node> type
%type <a_node> var_type
%type <a_string> type_list
%type <a_node> field_list
%type <a_node> field
%type <a_string> name_or_num
%type <a_node> framed
%type <a_node> noframe
%type <a_node> globfile
%type <a_node> globvar
%type <a_node> locvar
%type <a_node> linenum
%type <a_node> var_defn
%type <a_node> loc_defn
%type <a_node> loc_list
%type <a_addr> location
%type <a_addr> register_or_number
%type <a_number> var_offs
%type <a_string> ident
%token RELOC SOURCE INCSRC TYPEDEF FRAMED NOFRAME GLOBFILE GLOBVAR LOCVAR LINENUM AT AT_FP
%token STATIC STRUCT UNION ARRAY ENUM FUNC

%%
 
lines  : line {
   $$ = $1;
   if ($1 != NULL) {
      node_list  = $1;
      if (diagnose >= 3) {
         print_node($$);
      }
   }
}
| line lines {
   if ($1 == NULL) {
      $$ = $2;
   }
   else {
      $$ = $1;
      $$->next = $2;
      node_list = $$;
      if (diagnose >= 3) {
         print_node($$);
      }
   }
}


line : reloc 
{
   $$ = $1;
}
| source 
{
   $$ = $1;
}
| incsrc 
{
   $$ = $1;
}
| type 
{
   $$ = $1;
}
| framed 
{
   $$ = $1;
}
| noframe 
{
   $$ = $1;
}
| globfile 
{
   $$ = $1;
}
| globvar 
{
   $$ = $1;
}
| locvar 
{
   $$ = $1;
}
| linenum
{
   $$ = $1;
}

| errmsg
{
   if (diagnose > 0) {
      printf("reported by catdbgfilegen: %s\n", $1);
   }
   $$ = NULL;
}




reloc : RELOC number '(' dummy_list ')' {
   $$ = malloc(sizeof(struct node));
   $$->type = reloc_t;
   $$->elts = NULL;
   $$->next = NULL;
   $$->r.value = $2;
   if (diagnose >= 3) {
      print_node($$);
   }
}


dummy_list : identifier | identifier dummy_list


source : SOURCE string '[' number_or_null '.' '.' number_or_null ']' {
   $$ = malloc(sizeof(struct node));
   $$->type = source_t;
   $$->elts = NULL;
   $$->next = NULL;
   $$->s.name = strdup($2);
#ifndef _WIN32
   fix_filename($$->s.name);
#endif
   $$->s.start = $4;
   $$->s.end = $7;
   $$->s.globals = NULL;
   $$->s.typedefs = NULL;
   $$->s.functions = NULL;
   if (diagnose >= 3) {
      print_node($$);
   }
}


incsrc : INCSRC string {
   $$ = malloc(sizeof(struct node));
   $$->type = incsrc_t;
   $$->elts = NULL;
   $$->next = NULL;
   $$->s.name = strdup($2);
#ifndef _WIN32
   fix_filename($$->s.name);
#endif
   $$->s.start = 0;
   $$->s.end = 0;
   $$->s.globals = NULL;
   $$->s.typedefs = NULL;
   $$->s.functions = NULL;
   if (diagnose >= 3) {
      print_node($$);
   }
}


number_or_null : {
  $$ = 0;                  
}
| number {
  $$ = $1;
}



type : TYPEDEF number var_type {
   $$ = $3;
   $$->t.id = $2;
   if (diagnose >= 3) {
      print_node($$);
   }
}


var_type : {
   $$ = malloc(sizeof(struct node));
   $$->type = typedef_t;
   $$->t.id = 0;
   $$->t.d_type = basic_t;   // basic type
   $$->elts = NULL;
   $$->next = NULL;
   $$->t.type = strdup("<unknown>");
   $$->t.name = strdup("<anon>");
   $$->t.indx = 0;
   $$->t.boff = 0;
   $$->t.blen = 0;
   $$->t.size = 4;
   $$->t.algn = 4;
} 
| type_list {
   $$ = malloc(sizeof(struct node));
   $$->type = typedef_t;
   $$->t.id = 0;
   $$->t.d_type = basic_t;   // basic type
   $$->elts = NULL;
   $$->next = NULL;
   $$->t.type = $1;
   $$->t.name = strdup("<anon>");
   $$->t.indx = 0;
   $$->t.boff = 0;
   $$->t.blen = 0;
   if (strcmp($$->t.type, "char") == 0) {
      $$->t.size = 1;
      $$->t.algn = 1;
   }
   else if (strcmp($$->t.type, "unsigned char") == 0) {
      $$->t.size = 1;
      $$->t.algn = 1;
   }
   else if (strcmp($$->t.type, "short") == 0) {
      $$->t.size = 2;
      $$->t.algn = 2;
   }
   else if (strcmp($$->t.type, "unsigned short") == 0) {
      $$->t.size = 2;
      $$->t.algn = 2;
   }
   else {
      $$->t.size = 4;
      $$->t.algn = 4;
   }
}
/*

| '*' {
   $$ = malloc(sizeof(struct node));
   $$->type = typedef_t;
   $$->t.id = 0;
   $$->t.d_type = basic_t;   // basic type
   $$->t.type = strdup("*"); // pointer type
   $$->t.name = strdup("<anon>");
   $$->t.indx = 0;
   $$->t.boff = 0;
   $$->t.blen = 0;
   $$->t.size = 4;           // all pointers are 4 bytes
   $$->t.algn = 4;
   $$->elts = NULL;
   $$->next = NULL;
}

*/
| '*' var_type {
   char temp[MAX_NAMELEN + 1];
   $$ = $2;
   if ($2->t.d_type != func_t) { // all functions are pointers anyway */
      safecpy(temp, "* ", MAX_NAMELEN);
      safecat(temp, $$->t.type, MAX_NAMELEN);
      free ($$->t.type);
      $$->t.type = strdup(temp);
      $$->t.size = 4; // all pointers are 4 bytes
   }
}

| STATIC var_type {
   $$ = $2;
   $$->t.stat = 1;
}

| STRUCT '[' name_or_num ']' '{' field_list '}' {
   struct node *temp;
   struct node *last;
   int offs;
   $$ = malloc(sizeof(struct node));
   $$->type = typedef_t;
   $$->t.id = 0;
   $$->t.stat = 0;
   $$->t.d_type = struct_t;
   if ($3 == NULL) {
      $$->t.type = strdup("<struct>");
      $$->t.name = strdup("<anon>");
   }
   else {
      $$->t.type = strdup($3);
      $$->t.name = strdup($3);
   }
   $$->elts = $6;
   $$->next = NULL;
   temp = $6;
   $$->t.indx = 0;
   $$->t.boff = 0;
   $$->t.blen = 0;
   $$->t.size = 0;
   $$->t.algn = 1;
   while (temp != NULL) {
      $$->t.algn = maxval($$->t.algn, temp->t.algn);
#if USE_BLACKCAT_BITLEN
      $$->t.size = ((temp->t.boff + temp->t.blen + 7) / 8);
#else
      if (diagnose >= 3) {
         printf("align=%d\n",$$->t.algn);
      }
      $$->t.size = roundup($$->t.size, temp->t.algn);
      $$->t.size = $$->t.size + temp->t.size;
#endif
      if (diagnose >= 3) {
         printf("interim size=%d\n",$$->t.size);
      }
      temp = temp->next;
   }
   $$->t.size = roundup($$->t.size, $$->t.algn);
   if (diagnose >= 3) {
      printf("final size=%d\n",$$->t.size);
   }
   // check our own calculated sizes against bit offset and sizes given in dbg
   // note that mismatches are probably bit fields, which we just treat as 
   // ints
   if (diagnose >= 2) {
      temp = $6;
      last = NULL;
      offs = 0;
      while (temp != NULL) {
         if (temp->t.size * 8 == temp->t.blen) {
            printf("type %s field %s (size=%d bits) ok\n", 
               $$->t.type, temp->t.name, temp->t.blen);
         }
         else {
            printf("type %s field %s (size=%d bits) mismatch (dbg = %d bits)\n",
               $$->t.type, temp->t.name, temp->t.size * 8, temp->t.blen);
         }
         offs = roundup(offs, temp->t.algn);
         if (offs * 8 == temp->t.boff) {
            printf("type %s field %s (offs=%d bits) ok\n", 
               $$->t.type, temp->t.name, temp->t.boff);
         }
         else {
            printf("type %s field %s (offs=%d bits) mismatch (dbg = %d bits)\n",
               $$->t.type, temp->t.name, offs * 8, temp->t.boff);
         }
         offs += temp->t.size;
         last = temp;
         temp = temp->next;
      }
   }
}

| UNION '[' name_or_num ']' '{' field_list '}' {
   struct node *temp;
   $$ = malloc(sizeof(struct node));
   $$->type = typedef_t;
   $$->t.id = 0;
   $$->t.stat = 0;
   $$->t.d_type = union_t;
   if ($3 == NULL) {
      $$->t.type = strdup("<union>");
      $$->t.name = strdup("<anon>");
   }
   else {
      $$->t.type = strdup($3);
      $$->t.name = strdup($3);
   }
   $$->elts = $6;
   $$->next = NULL;
   temp = $6;
   $$->t.indx = 0;
   $$->t.boff = 0;
   $$->t.blen = 0;
   $$->t.size = 0;
   $$->t.algn = 1;
   while (temp != NULL) {
      $$->t.algn = maxval($$->t.algn, temp->t.algn);
      $$->t.size = maxval($$->t.size, temp->t.size);
      temp = temp->next;
   }
   $$->t.size = roundup($$->t.size, $$->t.algn);
   if (diagnose >= 2) {
      // check against bit sizes given in dbg
      temp = $6;
      while (temp != NULL) {
         if (temp->t.size * 8 == temp->t.blen) {
            printf("type %s field %s size ok (%d bits)\n", 
               $$->t.type, temp->t.name, temp->t.blen);
         }
         else {
            printf("type %s field %s (%d bits) size mismatch (dbg = %d bits)\n",
               $$->t.type, temp->t.name, temp->t.size * 8, temp->t.blen);
         }
         temp = temp->next;
      }
   }
}
| ARRAY '[' number ']' '(' var_type ')' {
   $$ = malloc(sizeof(struct node));
   $$->type = typedef_t;
   $$->t.id = 0;
   $$->t.stat = 0;
   $$->t.d_type = array_t;
   $$->t.type = strdup("<array>");
   $$->t.name = strdup("<anon>");
   $$->elts = $6;
   $$->next = NULL;
   $$->t.indx = $3;
   $$->t.boff = 0;
   $$->t.blen = 0;
   $$->t.size = $3 * $6->t.size;
   if (diagnose == 3) {
      printf("array element size = %d, count = %d\n", $6->t.size, $3);
   }
   $$->t.algn = $6->t.algn;
}
| ENUM '[' name_or_num ']' {
   $$ = malloc(sizeof(struct node));
   $$->type = typedef_t;
   $$->t.id = 0;
   $$->t.stat = 0;
   if ($3 == NULL) {
      $$->t.type = strdup("<enum>");
   }
   else {
      $$->t.type = strdup($3);
   }
   $$->t.name = strdup("<anon>");
   $$->t.d_type = enum_t;
   $$->elts = NULL;
   $$->next = NULL;
   $$->t.indx = 0;
   $$->t.boff = 0;
   $$->t.blen = 0;
   $$->t.size = 4; // LCC always uses INT for enums
   $$->t.algn = 4;
}
| FUNC '[' var_type ']' {
   $$ = malloc(sizeof(struct node));
   $$->type = typedef_t;
   $$->t.id = 0;
   $$->t.stat = 0;
   $$->t.d_type = func_t;
   $$->t.type = strdup("<func>");
   $$->t.name = strdup("<anon>");
   $$->elts = $3; // function return type
   $$->next = NULL;
   $$->t.indx = 0;
   $$->t.boff = 0;
   $$->t.blen = 0;
   $$->t.size = 4; // functions are really pointers
   $$->t.algn = 4;
}


type_list : ident {
   $$ = strdup($1);
}
| ident type_list {
   char temp[MAX_NAMELEN + 1];
   safecpy(temp, $1, MAX_NAMELEN);
   safecat(temp, " ", MAX_NAMELEN);
   safecat(temp, $2, MAX_NAMELEN);
   free ($1);
   free ($2);
   $$ = strdup(temp);
}


field_list : field {
   $$ = $1;           
}
| field field_list {
   $1->next = $2;
   $$ = $1;
}


field : ident '(' var_type ')' {
   $$ = $3;
   $$->t.name = strdup($1);
}
| ident '(' var_type '.' number '.' number ')' {
   $$ = $3;
   $$->t.boff = $5;
   $$->t.blen = $7;
   $$->t.name = strdup($1);
}


name_or_num : {
   $$ = NULL;
}
| ident {
   $$ = strdup($1);
}
| number {
   char temp[MAX_NAMELEN + 1];
   sprintf(temp, "%d", $1);
   if (temp[0] == ' ') {
      $$ = strdup(&temp[1]);
   }
   else {
      $$ = strdup(temp);
   }
}


framed : FRAMED ident {
   $$ = malloc(sizeof(struct node));
   $$->type = function_t;
   $$->elts = NULL;
   $$->next = NULL;
   $$->f.fname = strdup($2);
   $$->f.src = 0;
   $$->f.frame = 1;
   $$->f.lines = NULL;
   $$->f.locals = NULL;
   if (diagnose >= 3) {
      print_node($$);
   }
}


noframe : NOFRAME ident {
   $$ = malloc(sizeof(struct node));
   $$->type = function_t;
   $$->elts = NULL;
   $$->next = NULL;
   $$->f.fname = strdup($2);
   $$->f.src = 0;
   $$->f.frame = 0;
   $$->f.lines = NULL;
   $$->f.locals = NULL;
   if (diagnose >= 3) {
      print_node($$);
   }
}


globfile : GLOBFILE var_defn {
   $$ = $2;
   $$->type = global_t;
   $$->v.stat = 1;
   if (diagnose >= 3) {
      print_node($$);
   }
}


globvar : GLOBVAR var_defn {
   $$ = $2;
   $$->type = global_t;
   $$->v.stat = 0;
   if (diagnose >= 3) {
      print_node($$);
   }
}


var_defn :  ident '(' var_type ')' location {
   $$ = malloc(sizeof(struct node));
   $$->next = NULL;
   $$->elts = NULL;
   $$->v.fname = NULL;
   $$->v.block = 0;
   $$->v.name = strdup($1);
   $$->v.locn = $5;
   $$->v.type = $3;
}
| FUNC '(' var_type ')' location {
   // this appears to be a bug in catdbgfilegen!!!
   $$ = malloc(sizeof(struct node));
   $$->next = NULL;
   $$->elts = NULL;
   $$->v.fname = NULL;
   $$->v.block = 0;
   $$->v.name = strdup("<unknown>");
   $$->v.locn = $5;
   $$->v.type = $3;
}


locvar : LOCVAR ident '[' number ']' var_defn {
   $$ = $6;
   $$->type = local_t;
   $$->v.fname = strdup($2);
   $$->v.block = $4;
   if (diagnose >= 3) {
      print_node($$);
   }
}


linenum : LINENUM number '[' ident ',' number ']' location loc_defn {
   $$ = malloc(sizeof(struct node));
   $$->type = linenum_t;
   $$->l.num = $2;
   $$->l.fname = strdup($4);
   $$->l.block = $6;
   $$->l.locn = $8;
   $$->next = NULL;
   $$->elts = $9;
}


loc_defn : {
  $$ = NULL;
}
| loc_list {
  $$ = $1;
}


loc_list : var_defn {
   $$ = $1;        
   $$->type = local_t;
}
| var_defn '|' loc_list {
   $$ = $1;
   $$->next = $3;
   $$->type = local_t;
}


location : AT register_or_number {
   $$ = $2;
}
| AT_FP '(' var_offs ')' {
   $$ = malloc(sizeof(struct location));
   $$->type = off;
   $$->value = $3;
}


register_or_number : ident {
   $$ = malloc(sizeof(struct location));
   $$->type = reg;
   sscanf($1,"r%d", &($$->value));
}
| number {
   $$ = malloc(sizeof(struct location));
   $$->type = mem;
   $$->value = $1;
}
| '?' '?' '?' {
   if (diagnose > 0) {
      printf("invalid location ??? in dbg file\n");
   }
   $$ = malloc(sizeof(struct location));
   $$->type = mem;
   $$->value = -1;
}


var_offs : '-' number {
   $$ = - ($2);
}
| number {
   $$ = $1;
}


ident : identifier {
   $$ = $1;
}
| ARRAY {
   $$ = strdup("array");
}
| FUNC {
   $$ = strdup("func");
}


%%

/********************
 * PRINTF FUNCTIONS *
 ********************/

#define PC_BUFLEN 10000

char pc_buffer[PC_BUFLEN];
long pc_head = 0;
long pc_tail = 0;

void _putchar(char ch) {
   putchar(ch);
   if (((pc_tail + PC_BUFLEN - pc_head) % (PC_BUFLEN)) < (PC_BUFLEN - 1)) {
      pc_buffer[pc_tail++] = ch;
      if (pc_tail > PC_BUFLEN) {
         pc_tail = 0;
      }
   }
}

int CharReady(void) {
   return (pc_head != pc_tail);
}

int ReceiveChar(void) {
   int ch = -1;
   if (CharReady()) {
      ch = pc_buffer[pc_head++];
      if (pc_head > PC_BUFLEN) {
         pc_head = 0;
      }
   }
   return ch;
}

/*********************
 * UTILITY FUNCTIONS *
 *********************/


#ifndef _WIN32

// fix for catdbgfilegen bug
void fix_filename(char *fname) {
   int len = strlen(fname);
   int i;
   for (i = 0; i < len; i++) {
      if (fname[i] == BAD_SEPARATOR) {
         fname[i] = GOOD_SEPARATOR;
      }
   }
}

#endif


// set up the right breakpoint instruction and cog 
// register offsets for the selected memory model
void set_up_model(int model) {
   if (model == 111) {
      PC_OFF = NMM_PC_OFF;
      SP_OFF = NMM_SP_OFF;
      FP_OFF = NMM_FP_OFF;
      RI_OFF = NMM_RI_OFF;
      BC_OFF = NMM_BC_OFF;
      BA_OFF = NMM_BA_OFF;
      BZ_OFF = NMM_BZ_OFF;
      CS_OFF = NMM_CS_OFF;
      R0_OFF = NMM_R0_OFF;
      breakpoint = P2_NMM_BREAKPOINT;
   }
   else if ((model == 8) || (model == 108)) {
      PC_OFF = CMM_PC_OFF;
      SP_OFF = CMM_SP_OFF;
      FP_OFF = CMM_FP_OFF;
      RI_OFF = CMM_RI_OFF;
      BC_OFF = CMM_BC_OFF;
      R0_OFF = CMM_R0_OFF;
      if (model >= 100) {
         BA_OFF = -1;
         BZ_OFF = -1;
         CS_OFF = -1;
      }
      else {
         BA_OFF = CMM_BA_OFF;
         BZ_OFF = CMM_BZ_OFF;
         CS_OFF = CMM_CS_OFF;
      }
      breakpoint = CMM_BREAKPOINT;
   }
   else {
      PC_OFF = LMM_PC_OFF;
      SP_OFF = LMM_SP_OFF;
      FP_OFF = LMM_FP_OFF;
      RI_OFF = LMM_RI_OFF;
      BC_OFF = LMM_BC_OFF;
      R0_OFF = LMM_R0_OFF;
      CS_OFF = LMM_CS_OFF;
      if (model >= 100) {
         BA_OFF = -1;
         BZ_OFF = -1;
         if ((model != 102) && (model != 105)) {
            CS_OFF = -1;
         }
         breakpoint = P2_LMM_BREAKPOINT;
      }
      else {
         BA_OFF = LMM_BA_OFF;
         BZ_OFF = LMM_BZ_OFF;
         CS_OFF = LMM_CS_OFF;
         breakpoint = P1_LMM_BREAKPOINT;
      }
   }
}

void handler(int sig) {
  waiting = 0;
  signal (SIGINT, handler);
}


// maxval : max of two integers
int maxval (int a, int b) {
   return (a > b ? a : b);
}


// minval : min of two integers
int minval (int a, int b) {
   return (a > b ? b : a);
}


// roundup : round a up to alignment b
int roundup(unsigned int a, unsigned int b) {
   if (b > 0) {
      return (((a % b) == 0) ? a : (a + b - (a % b)));
   }
   else return a;
}


// safecpy will never write more than size characters, 
// and is guaranteed to null terminate its result, so
// make sure the buffer passed is at least size + 1
char * safecpy(char *dst, const char *src, size_t size) {
   dst[size] = '\0';
   if (src) {
      return strncpy(dst, src, size - strlen(dst));
   }
   return NULL;
}


// safecat will never write more than size characters, 
// and is guaranteed to null terminate its resul, so
// make sure the buffer passed is at least size + 1
char * safecat(char *dst, const char *src, size_t size) {
   dst[size] = '\0';
   if (src) {
      return strncat(dst, src, size - strlen(dst));
   }
   return NULL;
}


// case insensitive strcmp
static int strcmp_i(const char *str1, const char *str2) {
   while ((*str1) && (*str2) 
   &&     (toupper(*str1) == toupper(*str2))) {
      str1++;
      str2++;
   }
   return (toupper(*str1) - toupper(*str2));
}


// case insensitive strncmp
static int strncmp_i(const char *str1, const char *str2, int len) {
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


/*******************
 * PRINT FUNCTIONS *
 *******************/


void print_addr(struct location *a, int offs) {
   unsigned int addr;
   unsigned int fp;

   if (a == NULL) {
      printf("NULL! ");
      return;
   }
   switch (a->type) {

      case mem :
         printf("memory addr 0x%X ", a->value + offs);
         break;

      case off :
         printf("frame offset %d ", a->value + offs);
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + a->value + offs;
            printf("= 0x%08X", addr);
         }
         break;

      case reg :
         printf("register %d ", a->value);
         break;

      default :
         printf("unknown addr ");
         break;
   }
}


void print_type (struct node *p) {
   struct node *e;

   if (p == NULL) {
     printf("NULL!");
     return;
   }
   if ((p->t.name != NULL) && (strcmp(p->t.name, "<anon>") != 0)) {
     printf("%s:", p->t.name);
   }
   if (p->t.id != 0) {
     printf("id=%d:", p->t.id);
   }
   switch (p->t.d_type) {

      case basic_t: 
         printf("%s <size=%d,align=%d> ", p->t.type, p->t.size, p->t.algn);
         break;

      case array_t: 
         printf("array[%d] of { ", p->t.indx);
         e = p->elts;
         while (e != NULL) {
            print_type(e);
            e = e->next;
         }
         printf(" } <size=%d,align=%d> ", p->t.size, p->t.algn);
         break;

      case struct_t: 
         printf("struct { ");
         e = p->elts;
         while (e != NULL) {
            print_type(e);
            e = e->next;
         }
         printf(" } <size=%d,align=%d> ", p->t.size, p->t.algn);
         break;

      case union_t: 
         printf("union { ");
         e = p->elts;
         while (e != NULL) {
            print_type(e);
            e = e->next;
         }
         printf(" } <size=%d,align=%d>", p->t.size, p->t.algn);
         break;

      case enum_t: 
         printf("enum <size=%d,align=%d> ", p->t.size, p->t.algn);
         break;

      case func_t: 
         printf("function ( ");
         e = p->elts;
         while (e != NULL) {
            print_type(e);
            e = e->next;
         }
         printf(" ) <size=%d,align=%d> ", p->t.size, p->t.algn);
         break;

      default:
         printf("unknown type");
         break;
   }
}


void print_node (struct node * p) {
   struct node *e;

   switch (p->type) {

      case reloc_t :
         printf("RELOCATE 0x%lX\n", p->r.value);
         break;

      case source_t :
         printf("\nSOURCE \"%s\" from 0x%X to 0x%X\n", 
            p->s.name, p->s.start, p->s.end);
         if (p->s.globals != NULL) {
            print_list (p->s.globals);
         }
         if (p->s.typedefs != NULL) {
            print_list (p->s.typedefs);
         }
         if (p->s.functions != NULL) {
            print_list (p->s.functions);
         }
         if (p->elts != NULL) {
            print_list (p->elts); // source lines
         }
         break;

      case incsrc_t :
         printf("\nINCSRC \"%s\" from 0x%X to 0x%X\n", 
            p->s.name, p->s.start, p->s.end);
         if (p->s.globals != NULL) {
            print_list (p->s.globals);
         }
         if (p->s.typedefs != NULL) {
            print_list (p->s.typedefs);
         }
         if (p->s.functions != NULL) {
            print_list (p->s.functions);
         }
         if (p->elts != NULL) {
            print_list (p->elts); // source lines
         }
         break;

      case linenum_t :
         printf("LINE ");
         printf("%d ", p->l.num);
         if (p->l.fname != NULL) {
            printf("%s:", p->l.fname);
            printf("%d ", p->l.block);
         }
         printf("@ ");
         print_addr(p->l.locn, 0);
         e = p->elts; // locals visible from this line
         if (e != NULL) {
            printf(" {\n");
            while (e != NULL) {
               print_node(e);
               e = e->next;
            }
            printf("}");
         }
         printf("\n");
         break;

      case local_t :
         printf("LOCAL ");
         if (p->v.fname != NULL) {
            printf("%s:", p->v.fname);
            printf("%d:", p->v.block);
         }
         printf("%s ", p->v.name);
         print_type(p->v.type);
         printf("@ ");
         print_addr(p->v.locn, 0);
         printf("\n");
         break;

      case global_t :
         printf("\nGLOBAL %s%s ", (p->v.stat?"static ":""), p->v.name);
         print_type(p->v.type);
         printf("@ ");
         print_addr(p->v.locn, 0);
         printf("\n");
         break;

      case typedef_t :
         printf("TYPEDEF ");
         print_type(p);
         printf("\n");
         break;

      case function_t :
         if (p->f.frame == 1) {
            printf("\nFRAMED ");
         }
         else if (p->f.frame == 0) {
            printf("\nUNFRAMED ");
         }
         else {
            printf("\nUNSPECIFIED ");
         }
         printf("FUNCTION %s {\n", p->f.fname);
         print_list(p->f.locals);
         printf("\n");
         print_list(p->f.lines);
         printf("}\n");
         break;

      case debug_t :
         printf("DEBUG LINE %d @ ", p->d.num);
         print_addr(p->d.locn, 0);
         if ((p->d.func != NULL) && (p->d.func->type == function_t)) {
            printf(" in FUNCTION %s ", p->d.func->f.fname);
         }
         printf("(user_b=%d, virt_b=%d)\n", p->d.user_b, p->d.virt_b);     
         break;

      default :
         printf("UNKNOWN NODE %d\n", p->type);
         break;
   }
}

void print_list (struct node *p) {
   while (p != NULL) {
      print_node(p);
      p = p->next;
   }
}

void print_debug_line (struct node *p) {
   while (p != NULL) {
      if (p->type == debug_t) {
         printf("DEBUG LINE %d @ ", p->d.num);
         print_addr(p->d.locn, 0);
         if ((p->d.func != NULL) && (p->d.func->type == function_t)) {
            printf(" in FUNCTION %s ", p->d.func->f.fname);
         }
         printf("\n");
      }
      p = p->next;
   }
}


/*******************************
 * SOURCE PROCESSING FUNCTIONS *
 *******************************/


// source_node - if src is a valid source file number, return a pointer
// to the source node, otherwise return NULL
struct node *source_node(int src) {
   struct node *s;
   if (((src > 0) && (src <= source_count))
   &&  ((s = source_list[src-1]) != NULL) 
   &&  ((s->type == source_t) || (s->type == incsrc_t))) {
      return s;
   }
   else {
      return NULL;
   }
}


void free_node(struct node *p) {
   if (p == NULL) {
      return;
   }
   free_node (p->elts);
   free_node (p->next);
   switch (p->type) {
      case source_t:
         free_node(p->s.globals);
         free_node(p->s.typedefs);
         free_node(p->s.functions);
         free(p->s.name);
         break;
      case incsrc_t:
         free(p->s.name);
         break;
      case linenum_t:
         free(p->l.locn);
         free(p->l.fname);
         break;
      case local_t:
      case global_t:
         free_node(p->v.type);
         free(p->v.locn);
         free(p->v.fname);
         free(p->v.name);
         break;
      case typedef_t:
         free(p->t.name);
         free(p->t.type);
         break;
      case function_t:
         free_node(p->f.lines);
         free_node(p->f.locals);
         free(p->f.fname);
         break;
      case debug_t:
         break;
      default:
         break;
   }
   free(p);
}

//
// extract source nodes into the source_list array. Discard any RELOC nodes
// after extracting their value.
//
void process_sources (struct node *p) {
   struct node *first;
   struct node *last;
   struct node *end;
   struct node *q;
   struct node *s;
   int current_src;
   int included_src;
   int src;

   current_src = 0;
   included_src = 0;
   first = p;
   last = NULL;
   end = NULL;
   while (p != NULL) {
      switch (p->type) {

         case reloc_t:
            if (diagnose >= 3) {
               printf("reloc\n");
            }
            // remove this node from the node list 
            q = p->next;
            p->next = NULL;
            if (first == p) {
               first = q;
            }
            if (last != NULL) {
               last->next = q;
            }
            // save the reloc value
            if ((reloc_value != 0) && (reloc_value != p->r.value)) {
               printf("warning - multiple RELOC values in dbg file\n");
            }
            reloc_value = p->r.value;
            if (diagnose) {
               printf("relocation offset = %d\n", reloc_value);
            }
            // discard the node
            free_node(p);
            p = q;
            break;

         case typedef_t:
            if (diagnose >= 3) {
               printf("typedef\n");
            }
            // remove this node from the node list 
            q = p->next;
            p->next = NULL;
            if (first == p) {
               first = q;
            }
            if (last != NULL) {
               last->next = q;
            }
            // add to the typedef list of the current source
            if (current_src > 0) {
               p->next = source_list[current_src-1]->s.typedefs;
               source_list[current_src-1]->s.typedefs = p;
            }
            else {
               printf("warning -  no current source file for typedef in dbg file\n");
               free_node(p);
            }
            p = q;
            break;

         case source_t:
            if (diagnose >= 3) {
               printf("source %s\n", p->s.name);
            }
            // remove this node from the node list
            q = p->next;
            p->next = NULL;
            p->elts = NULL;
            // if this is not the first node we have seen,
            // add the list of nodes to the current source
            // (at the end of any existing list of nodes)
            if (first == p) {
               first = q;
               last = NULL;
            }
            else {
               if (current_src > 0) {
                  if (last != NULL) {
                     last->next = NULL;
                  }
                  if (diagnose >= 2) {
                     printf("adding to source %d\n", current_src);
                  }
                  end = source_list[current_src-1]->elts;
                  while ((end != NULL) && (end->next != NULL)) {
                     end = end->next;
                  }
                  if (end == NULL) {
                     source_list[current_src-1]->elts = first;
                  }
                  else {
                     end->next = first;
                  }
               }
               else {
                  printf("warning - no current source file for entries in dbg file\n");
               }
               first = q;
               last = NULL;
            }
            // add this node to source file list  
            // and make it the current source
            current_src = ++source_count;
            source_list[current_src-1] = p;
            p = q;
            break;

         case incsrc_t:

            if (current_src > 0) {
               // copy start and end from current source file
               p->s.start = source_list[current_src-1]->s.start;
               p->s.end   = source_list[current_src-1]->s.end;
            }
            else {
               printf("warning - no current source file for included source file\n");
            }
            
            if (diagnose >= 3) {
               printf("incsrc %s\n", p->s.name);
            }
            // remove this node from the node list
            q = p->next;
            p->next = NULL;
            p->elts = NULL;
            // if this is not the first node we have seen,
            // add the list of nodes to the current source
            // (at the end of any existing list of nodes)
            if (first == p) {
               first = q;
               last = NULL;
            }
            else {
               if (current_src > 0) {
                  if (last != NULL) {
                     last->next = NULL;
                  }
                  if (diagnose >= 2) {
                     printf("adding to source %d\n", current_src);
                  }
                  end = source_list[current_src-1]->elts;
                  while ((end != NULL) && (end->next != NULL)) {
                     end = end->next;
                  }
                  if (end == NULL) {
                     source_list[current_src-1]->elts = first;
                  }
                  else {
                     end->next = first;
                  }
               }
               else {
                  printf("warning - no current source file for entries in dbg file\n");
               }
               first = q;
               last = NULL;
            }
            // see if this is a source file we already know about
            // (which means we must resume adding nodes to it) 
            included_src = 0;
            for (src = 1; src <= source_count; src++) {
               if (((s = source_node(src)) != NULL) 
               &&  (strcmp(s->s.name, p->s.name) == 0)) {
                  included_src = src;
                  break;
               }
            }
            if (included_src == 0) {
               // we don't know about this source file yet - add this 
               // node to source file list and make it the current source
               current_src = ++source_count;
               source_list[current_src-1] = p;
            }
            else {
               // we already know about this source file - this
               // just becomes our current_source
               current_src = included_src;
            }
            p = q;
            break;

         case global_t:
            if (diagnose >= 3) {
               printf("global\n");
            }
            // remove this node from the node list 
            q = p->next;
            p->next = NULL;
            if (first == p) {
               first = q;
            }
            if (last != NULL) {
               last->next = q;
            }
            // add to the global list of the current source
            if (current_src > 0) {
               p->next = source_list[current_src-1]->s.globals;
               source_list[current_src-1]->s.globals = p;
            }
            else {
               printf("warning -  no current source file for global in dbg file\n");
               free_node(p);
            }
            p = q;
            break;

         default:
            if (diagnose >= 3) {
               printf("other - %d\n", p->type);
            }
            last = p;
            p = p->next;
            break;
      }
   }
   if (first != NULL) {
      // if we have a current source file node then add the 
      // node list to the end of its existing list of elts
      if (current_src > 0) {
         if (diagnose >= 2) {
            printf("final add to source %d\n", current_src);
         }
         end = source_list[current_src-1]->elts;
         while ((end != NULL) && (end->next != NULL)) {
            end = end->next;
         }
         if (end == NULL) {
            source_list[current_src-1]->elts = first;
         }
         else {
            end->next = first;
         }
      }
      else {
         printf("warning - no current source file for entries in dbg file\n");
      }
   }
}


//
// locate a function node with the given name in the given node list
//
struct node *find_function_in_list(struct node *p, char *fname) {

   while (p != NULL) {
      if ((p->type == function_t) 
      &&  (strcmp(p->f.fname, fname) == 0)) {
         if (diagnose >= 2) {
            printf("%s FOUND\n", fname);
         }
         return p;
      }
      else {
         p = p->next;
      }
   }
   if (diagnose >= 2) {
      printf("%s NOT FOUND\n", fname);
   }
   return NULL;
}


//
// locate a function node with the given name in any source file
//
struct node *find_function(char *fname) {
   struct node *s;
   struct node *f;
   int src;

   for (src = 1; src <= source_count; src++) {
      if (((s = source_node(src)) != NULL) 
      &&  ((f = find_function_in_list(s->s.functions, fname)) != NULL)) {
         return f;
      }
   }
   return NULL;
}


// prune - remove a function node from its current source list
int prune(struct node *f) {
   struct node *s;
   struct node *g;
   struct node *last;

   if ((s = source_node(f->f.src)) != NULL) {
      last = NULL;
      g = s->s.functions;
      while ((g != NULL) && (g != f)) {
         last = g;
         g = g->next;
      }
      if (last == NULL) {
         s->s.functions = f->next;
      }
      else {
         last->next = f->next;
      }
      return 1;
   }
   else {
      if (diagnose) {
         printf("cannot find source file for function\n");
      }
      return 0;
   }
}

#define fname(p) (((p)->type == linenum_t) ? (p)->l.fname : (p)->v.fname)

//
// create function nodes for all nodes in the given list, extracting both
// local variables (to the f.locals list) and line (to the f.lines list). Put
// the locals in strcmp order, the lines in ascending order and eliminate 
// duplicate addresses for each line (always use the lowest, but collect all 
// the block scope variables). Also, remove any (now redundant) function name.
//
// Note that because of source file embedding, the function may first appear in
// one source file, and have to be transplanted to another embedded source file 
// (which contains the actual lines of the function)
//
void process_functions (int src) {
   struct node *s;
   struct node *last;
   struct node *p;
   struct node *q;
   struct node *f;
   struct node *c;
   struct node *l;

   if ((s = source_node(src)) == NULL) {
      if (diagnose) {
         printf("invalid source file number %d\n", src);
      }
      return;
   }
   last = NULL;
   p = s->elts;
   while (p != NULL) {
      switch (p->type) {

         case function_t :
            // remove this node from the node list
            q = p->next;
            p->next = NULL;
            if (last != NULL) {
               last->next = q;
            }
            else {
               s->elts = q;
            }
            // if the function is not known add it to the source 
            // functions list (otherwise just update its data)
            f = find_function_in_list(s->s.functions, p->f.fname);
            if (f == NULL) {
               // check if the function is known in another file
               if ((f = find_function(p->f.fname)) != NULL) {
                  // function found in another file - transplant required!!!
                  if (diagnose) {
                     printf("transplanting function %s\n", p->f.fname);
                  }
                  if (prune(f)) {
                      // now graft
                      f->f.src = src;
                      f->next = s->s.functions;
                      s->s.functions = f;
                  }
               }
            }
            if (f == NULL) {
               if (diagnose >= 2) {
                  printf("framed/noframe function %s\n", p->f.fname);
               }
               p->f.src = src;
               p->next = s->s.functions;
               s->s.functions = p;
            }
            else {
               if (diagnose >= 2) {
                  printf("updating data of function %s\n", p->f.fname);
               }
               f->f.frame = p->f.frame;
               free_node(p);
            }
            p = q;
            break;

         case linenum_t :
         case local_t :
            // remove this node from the node list
            q = p->next;
            p->next = NULL;
            if (last != NULL) {
               last->next = q;
            }
            else {
               s->elts = q;
            }
            // if the function is not known create a new node for it
            f = find_function_in_list(s->s.functions, (fname(p)));
            if (f == NULL) {
               // check if the function is known in another file
               if ((f = find_function(fname(p))) != NULL) {
                  // function found in another file - transplant required!!!
                  if (diagnose) {
                     printf("transplanting function %s\n", fname(p));
                  }
                  if (prune(f)) {
                      // now graft
                      f->f.src = src;
                      f->next = s->s.functions;
                      s->s.functions = f;
                  }
               }
            }
            if (f == NULL) {
               if (diagnose >= 2) {
                  printf("new function %s created for line\n", fname(p));
               }
               f = malloc(sizeof(struct node));
               f->type = function_t;
               f->f.fname = strdup(fname(p));
               f->f.src = src;
               f->f.frame = -1; // don't know
               f->f.lines = NULL;
               f->f.locals = NULL;
               f->elts = NULL;
               f->next = s->s.functions;
               s->s.functions = f;
            }
            // add this node to the function as a line or a local
            if (p->type == linenum_t) {
               // remove the function name (no longer required)
               free(p->l.fname);
               p->l.fname = NULL;
               // add line to function line list, ensuring there is only 
               // one entry for each line (if there are more, we just 
               // create a single one with the lowest address)
               if (diagnose >= 2) {
                  printf("line %d\n", p->l.num);
               }
               if (f->f.lines == NULL) {
                  p->next = NULL;
                  f->f.lines = p;
               }
               else {
                  l = NULL;
                  c = f->f.lines;
                  while ((c != NULL) && (c->l.num <  p->l.num)) {
                     l = c;
                     c = c->next;
                  }
                  if (diagnose >= 2) {
                     printf("checking addr for line %d\n", p->l.num);
                  }
                  if ((c == NULL) || (c->l.num > p->l.num)) {
                     // new line - insert the line into the line list
                     if (diagnose >= 2) {
                        printf("new line %d\n", p->l.num);
                     }
                     if (l == NULL) {
                        p->next = NULL;
                        f->f.lines = p;
                     }
                     else {
                        p->next = c;
                        l->next = p;
                     } 
                  }
                  else {
                     // duplicate entry for line - this occurs when the block
                     // depth changes - if the block depth of this entry is
                     // lower than our existing entry, we use it instead.
                     // Also, if the address is lower, then use this address 
                     // instead of the existing one. 
                     if (diagnose >= 2) {
                        printf("duplicate for line %d\n", p->l.num);
                     }
                     if (p->l.locn->value < c->l.locn->value) {
                        if (diagnose >= 2) {
                           printf("lower address for line %d\n", p->l.num);
                        }
                        c->l.locn->value = p->l.locn->value;
                     }
                     if (p->l.block < c->l.block) {
                        if (diagnose >= 2) {
                           printf("lower block depth for line %d\n", p->l.num);
                        }
                        c->l.block = p->l.block;
                        free_node (c->elts);
                        c->elts = p->elts;
                        p->elts = NULL;
                     }
                     free_node(p);
                  }
               }
            }
            else {
               // remove the function name (no longer required)
               free(p->v.fname);
               p->v.fname = NULL;
               // add this node to the function local list, ordered by name
               if (diagnose >= 2) {
                  printf("local %s\n", p->v.name);
               }
               l = NULL;
               c = f->f.locals;
               while ((c != NULL)  && (strcmp (p->v.name, c->v.name) > 0)) {
                  l = c;
                  c = c->next;
               }
               if (l == NULL) {
                  p->next = c;
                  f->f.locals = p;
               }
               else {
                  p->next = c;
                  l->next = p;
               }
            }
            p = q;
            break;

         default:
            last = p;
            p = p->next;
            break;
      }
   }
}


// add debug lines to all sources, sorted by line number. Each line entry 
// will point to the function it belongs to. 
void process_lines (int src) {
   struct node *s;
   struct node *p;
   struct node *f;
   struct node *l;
   struct node *c;
   struct node *last;

   if ((s = source_node(src)) == NULL) {
      if (diagnose) {
         printf("invalid source file number %d\n", src);
      }
      return;
   }
   
   f = s->s.functions;

   while (f != NULL) {

      if (f->type == function_t) {
   
         p = f->f.lines;

         while (p != NULL) {
            if (p->type == linenum_t) {
               // create a debug node for this line, with d.func
               // pointing to the function the line belongs to
               l = malloc (sizeof(struct node));
               l->type = debug_t;
               l->d.src = src;
               l->d.num = p->l.num;
               l->d.locn = p->l.locn;
               l->d.user_b = 0;
               l->d.virt_b = 0;
               l->d.inst = breakpoint;
               l->next = NULL;
               l->d.func = f;
               l->elts = NULL;
               // add the line to the debug_info list (in order)
               c = debug_info[src-1];
               last = NULL;
               while ((c != NULL) 
               &&  (c->d.num < l->d.num) 
               &&  (c->d.locn->value != l->d.locn->value)) {
                  last = c;
                  c = c->next;
               }
               if ((c != NULL) && (c->d.locn->value == l->d.locn->value)) {
                  // if the line we are inserting has the same address as
                  // the the line we are inserting it after, but goes 
                  // BEFORE the next line ALREADY in the list, then don't 
                  // insert it, just update the line number of the existing 
                  // line. This is a quirk of the way the C compiler handles 
                  // blocks, because it adds a line for the block with the 
                  // same address as the first statement in the block, but 
                  // it is the statement we want to add, not the block. 
                  // A side-effect of this is that we can end up with a 
                  // breakpoint added for the last statement in an empty
                  // block if the line following it is a while statement. 
                  // But this is ok because of the way code for while 
                  // statements is generated.
                  if ((c->next != NULL) && (l->d.num < (c->next)->d.num)) { 
                     if (diagnose) {
                        printf("update file %d, line %d - same addr as line %d\n",
                           l->d.src, c->d.num, l->d.num);
                     }
                     c->d.num = l->d.num;
                     free(l);
                  }
               }
               else {
                  if (last == NULL) {
                     l->next = debug_info[src-1];
                     debug_info[src-1] = l;
                  }
                  else {
                     l->next = c;
                     last->next = l;
                  }
               }
            }
            p = p->next;
         }
      }
      f = f->next;
   }
}


/********************
 * SEARCH FUNCTIONS *
 ********************/


// find the source file containing the address. 
// Return -1 if there is no such source file.
int find_source(unsigned int addr) {
   struct node *s;
   int src;

   for (src = 1; src <= source_count; src++) {
      if ((s = source_node(src)) != NULL) {
        if ((s->s.start <= addr) 
        &&  (s->s.end >= addr)) {
           return src;
        }
      }
   }
   return 0;
}


// find the line with the specified address in the debug lines for 
// all the known source files. Update debug file and line. Return
// NULL if no exact match found.
struct node *find_debug_line_by_addr(unsigned int addr) {
   int src;
   struct node *d;
   struct node *l;

   if (diagnose >= 2) {
      printf("looking for debug line with addr 0x%08X\n", addr);
   }
   for (src = 1; src <= source_count; src++) {
      if (diagnose >= 2) {
         printf("trying file %d\n", src);
      }
      if ((d = debug_info[src-1]) != NULL) {
         l = NULL;
         while (d != NULL) {
            if (d->type == debug_t) {
              if (diagnose >= 2) {
                 printf("trying file %d, line %d\n", d->d.src, d->d.num);
              }
              if (d->d.locn->value == addr) {
                 break;
              }
           }
           l = d;
           d = d->next;
         }
         if ((d != NULL) && (d->d.locn->value == addr)) {
            break;
         }
      }
   }
   if (d == NULL) {
      return NULL;
   }
   debugger_line = d;
   return d;
}


// find the line containing the specified address in the debug lines for 
// all the known source files. Return the node.
struct node *find_debug_line_containing_addr(unsigned int addr) {
   int src;
   struct node *s;
   struct node *d;
   struct node *l;
   struct node *try;

   if (diagnose >= 2) {
      printf("looking for addr 0x%08X\n", addr);
   }
   try = NULL;
   for (src = 1; src <= source_count; src++) {
      if (((s = source_node(src)) != NULL) 
      &&  (s->s.start <= addr)
      &&  (s->s.end >= addr)) {
         if (diagnose >= 2) {
            printf("trying file %d\n", src);
         }
         if ((d = debug_info[src-1]) != NULL) {
            l = NULL;
            while (d != NULL) {
               if (d->type == debug_t) {
                  if (diagnose >= 2) {
                     printf("trying file %d, line %d, addr 0x%X\n", 
                        d->d.src, d->d.num, d->d.locn->value);
                  }
                  if (d->d.locn->value >= addr) {
                     break;
                  }
               }
               l = d;
               d = d->next;
            }
            if ((d != NULL) && (d->d.locn->value == addr)) {
               // found an exact match
               return d;
            }
            if (l != NULL) {
               // not an exact match, but remember this match
               // in case we do not find an exact match
               try = l;
            }
         }
      }
   }
   if (try != NULL) {
      // no exact match - return best match
      return try;
   }
   else {
      // no match found
      return NULL;
   }
}


// find the line with the specified number in the debug lines for 
// the specified source file. 
// If no exact line match is found, return the line just prior to
// the specified line number (if any).
struct node *find_debug_line_by_number(int src, int line) {
   struct node *p;
   struct node *l;

   if ((src < 1) || src > source_count) {
      return NULL;
   }
   if ((p = debug_info[src-1]) == NULL) {
      return NULL;
   }
   l = NULL;
   while (p != NULL) {
     if (p->type == debug_t) {
        if (p->d.num == line) {
           return p;
        }
        if (p->d.num > line) {
           return l;
        }
     }
     l = p;
     p = p->next;
   }
   return NULL;
}


// find name in the locals visible from the specified line. 
// If not found in the line, look in the locals defined in 
// the current function. Note that we return the first 
// matching local found.
struct node *find_local(struct node *d, char *name) {
   int n;
   struct node *f;
   struct node *p;

   if (d == NULL) {
      return NULL;
   }
   n = d->d.num;
   // point to the function
   f = d->d.func;
   if ((f == NULL) || (f->type != function_t)) {
      if (diagnose) {
         printf("line not in function\n");
      }
      return NULL;
   }
   if (diagnose) {
      printf("line is in function %s\n", f->f.fname);
   }
   p = f->f.lines;
   // find the same line number in the function
   while ((p != NULL) && (p->type == linenum_t) && (p->l.num < n)) {
      if (diagnose) {
         printf("considering line %d\n", p->l.num);
      }
      p = p->next;
   }
   if ((p != NULL) && (p->l.num == n)) {
      // found the line - try the locals defined for that line
      if (diagnose) {
         printf("looking in line locals\n");
      }
      p = p->elts;
      if ((p != NULL) && (diagnose > 1)) {
         print_list (p);
      }
      while ((p != NULL) && (p->type == local_t) 
      && (strcmp(p->v.name, name) != 0)) {
         p = p->next;
      }
   }
   if ((p != NULL) && (p->type == local_t) && strcmp(p->v.name, name) == 0) {
      // found the variable
      if (diagnose) {
         printf("found variable in line locals\n");
      }
      return p;
   }
   if (diagnose) {
      printf("look in function locals\n");
   }
   // next try the function locals
   p = f->f.locals;
   while (p != NULL) {
      if ((p->type == local_t) && (strcmp(p->v.name, name) == 0)) {
         if (diagnose) {
            printf("found variable in function locals\n");
         }
         return p;
      }
      p = p->next;
   }
   // not found
   return NULL;
}


// find name in the list of globals defined as being visible
// from the specified source file. Note that we always return the
// first matching name found (and hope the first one is correct!).
struct node *find_global(int src, char *name) {
   struct node *p;
   struct node *s;

   if ((s = source_node(src)) == NULL) {
      return NULL;
   }
   p = s->s.globals;
   while (p != NULL) {
     if (p->type == global_t) {
        if (strcmp(p->v.name, name) == 0) {
           return p;
        }
     }
     p = p->next;
   }
   return NULL;
}


// find the variable (by name) visible from the source file 
// and line number given. To do this, this routine must look 
// first at locals visible from the specified line, then locals
// in the current function, then static globals visible from 
// the specified file, then non-static globals from other files.
struct node *find_variable(int src, int line, char *name) {
   struct node *p;
   struct node *q;
   int i;

   p = find_debug_line_by_number(src, line);
   if (p != NULL) {
      if (diagnose) {
         printf("line = %d\n", p->l.num);
      }
      // try locals visible from this line
      if (diagnose) {
         printf("trying local scope\n");
      }
      q = find_local(p, name);
      if (q != NULL) {
         return q;
      }
      // try globals visible in this file
      if (diagnose) {
         printf("trying file scope\n");
      }
      q = find_global (src, name);
      if (q != NULL) {
         return q;
      }
      // try non-static globals visible from other files
      for (i = 1; i <= source_count; i++) {
         if (i != src) {
            if (diagnose) {
               printf("trying externs, file %d\n", i);
            }
            q = find_global (i, name);
            if ((q != NULL) && (q->v.stat == 0)) {
               return q;
            }
         }
      }
   }
   else {
      printf("cannot find line\n");
   }
   return NULL;
}


// find type in the list of typedefs defined as being visible
// from the specified source file. Note that we always return the
// first matching type found (and hope the first one is correct!).
struct node *find_type(int src, char *type) {
   struct node *p;
   struct node *s;

   if ((s = source_node(src)) == NULL) {
      return NULL;
   }
   if (strcmp(type, "<array>") == 0) {
      // anonymous arrays can never be "found" using this function!
      return NULL;
   }
   p = s->s.typedefs;
   while (p != NULL) {
     if (p->type == typedef_t) {
        if (strcmp(p->t.type, type) == 0) {
           return p;
        }
     }
     p = p->next;
   }
   return NULL;
}


// getsymbol - copy a symbol from the string, and also return its length
int getsymbol(char *str, char *sym) {
   int n = 0;
   while ((isalnum(*str)) || (*str == '_')) {
      *(sym++) = *(str++);
      n++;
   }
   *sym = '\0';
   return n;
}


/******************************
 * PRINT AND UPDATE FUNCTIONS *
 ******************************/


// eval_index - get the value of a basic short or integer type to use as an 
// index to an array (note we don't differentiate signed and unsigned, because
// array indexes must be greater than or equal to zero)
int eval_index(struct node *base, struct node *leaf, int offs) {
   unsigned int value;
   unsigned int addr;
   unsigned int fp;
   struct location index_locn;

   if (base == NULL) {
      return -1;
   }

   index_locn.type  = base->v.locn->type;
   index_locn.value = base->v.locn->value + offs;


   switch (index_locn.type) {
      case mem :
         addr = index_locn.value - reloc_value;
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_read(mem_model, addr, &value) == 0) {
               if ((strcmp(leaf->t.type, "short") == 0)
               ||  (strcmp(leaf->t.type, "unsigned short") == 0)) {
                  value = (value >> ((addr & 2)<<4)) & 0xffff;
               }
               else if ((strcmp(leaf->t.type, "char") == 0)
               ||  (strcmp(leaf->t.type, "signed char") == 0)
               ||  (strcmp(leaf->t.type, "unsigned char") == 0)) {
                  value = (value >> ((addr & 3)<<3)) & 0xff;
               }
               return value;
            }
         }
         else {
            if (blackbox_hub_read(addr, &value) == 0) {
               if ((strcmp(leaf->t.type, "short") == 0)
               ||  (strcmp(leaf->t.type, "unsigned short") == 0)) {
                  value = (value >> ((addr & 2)<<4)) & 0xffff;
               }
               else if ((strcmp(leaf->t.type, "char") == 0)
               ||  (strcmp(leaf->t.type, "signed char") == 0)
               ||  (strcmp(leaf->t.type, "unsigned char") == 0)) {
                  value = (value >> ((addr & 3)<<3)) & 0xff;
               }
               return value;
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + index_locn.value + offs;
            if (blackbox_hub_read(addr, &value) == 0) {
               if ((strcmp(leaf->t.type, "short") == 0)
               ||  (strcmp(leaf->t.type, "unsigned short") == 0)) {
                  value = (value >> ((addr & 2)<<4)) & 0xffff;
               }
               else if ((strcmp(leaf->t.type, "char") == 0)
               ||  (strcmp(leaf->t.type, "signed char") == 0)
               ||  (strcmp(leaf->t.type, "unsigned char") == 0)) {
                  value = (value >> ((addr & 3)<<3)) & 0xff;
               }
               return value;
            }
         }
         break;
      case reg :
         if (blackbox_cog_read(mem_model, R0_OFF + index_locn.value, &value) == 0) {
            if ((strcmp(leaf->t.type, "short") == 0)
            ||  (strcmp(leaf->t.type, "unsigned short") == 0)) {
               value &= 0xffff;
            }
            else if ((strcmp(leaf->t.type, "char") == 0)
            ||  (strcmp(leaf->t.type, "signed char") == 0)
            ||  (strcmp(leaf->t.type, "unsigned char") == 0)) {
               value &= 0xff;
            }
            return value;
         }
         break;
   }
   return -1;
}

char *parse_var(
   int file, 
   int line, 
   char *str, 
   struct node **base, 
   struct node **leaf, 
   int *offs,
   int *indir
);

// parse an optional index specified for node p - if an index is present, 
// update index with the index value, update p with the pointer to the 
// array element type, and increment the offset to point to the specified 
// element of the array. Allow simple local variables to be used as index.
// Returns a pointer to the next character after the array index (if present).
char *parse_index(
   int file, 
   int line,
   char *name, 
   char *str,
   struct node **p, 
   int *offs,
   int *index
) {
   struct node *index_base = NULL;
   struct node *index_leaf = NULL;
   char indx[MAX_LINELEN+1];
   int index_offs = 0;
   int n;

   str++;
   if (isdigit(*str)) {
      n = getsymbol(str, indx);
      str += n;
      if (*str != ']') {
         printf("expected ']' to follow index '%s'\n", indx);
         *index = -1;
         return str;
      }
      str++;
      if (sscanf(indx, "%d", index) == 1) {
         if (diagnose) {
            printf("index = %d\n", *index);
         }
      }
      else {
         printf("index '%s' is invalid\n", indx);
         *index = -1;
         return str;
      }
   }
   else {
      int indir = 0;
      str = parse_var(file, line, str, 
               &index_base, &index_leaf, &index_offs, &indir);
      if (*str != ']') {
         printf("expected ']' to follow index to '%s'\n", name);
         *index = -1;
         return str;
      }
      if (indir != 0) {
         printf("Cannot use '->' in index\n");
         *index = -1;
         return str;
      }
      str++;
      if (diagnose) {
         print_node (index_base);
         print_node (index_leaf);
      }
      if ((index_base == NULL) 
      ||  (index_leaf == NULL) 
      ||  (index_leaf->type != typedef_t)
      ||  (index_leaf->t.d_type != basic_t)
      ||  (strcmp(index_leaf->t.type, "*") == 0)
      ||  (strcmp(index_leaf->t.type, "float") == 0)
      ||  (strcmp(index_leaf->t.type, "double") == 0)
      ||  (strcmp(index_leaf->t.type, "long double") == 0)) {
         printf("variable type not valid as array index\n");
         *index = -1;
         return str;
      }
      else {
         if (diagnose) {
            printf("evaluating index, offs = %d...\n", index_offs);
         }
         *index = eval_index(index_base, index_leaf, index_offs);
         if (*index < 0) {
            printf("index evaluation error, or index less than 0\n");
            *index = -1;
            return str;
         }
         if (diagnose) {
            printf("... = %d\n", *index);
         }
      }
   }
   if ((*index >= 0) && (*index < (*p)->t.indx)) {
      if ((*p)->elts != NULL) {
         if (diagnose) {
            printf("index = %d, size of elts = %d\n", 
               *index, (*p)->elts->t.size);
         }
         (*offs) += (*index)*((*p)->elts->t.size);
      }
      else {
         printf("size of array elements unknown\n");
         *index = -1;
         return str;
      }
   }
   else {
      printf("index to '%s' is outside the bounds of the array\n",
         name);
      *index = -1;
      return str;
   }
   (*p) = (*p)->elts;
   if (diagnose > 1) {
      print_node(*p);
   }
   return str;
}


// parse_var - parse a variable name and return a pointer to its base node, 
// a pointer to its leaf node, and the offset of the leaf from the base.
// the actual function return is the next character in the string.
// set indir = 1 if '->' is used (only valid on first element!).
char *parse_var(
   int file, 
   int line, 
   char *str, 
   struct node **base, 
   struct node **leaf, 
   int *offs,
   int *indir
) {
   struct node *p;
   struct node *q;
   int n = 0;
   int index = 0;
   char name[MAX_LINELEN+1];
   char *type = NULL;
   int done = 0;
   int elt = 0;

   n = getsymbol(str, name);
   str += n;
   (*base) = find_variable(file, line, name);
   if ((*base) != NULL) {
      if (diagnose > 1) {
         print_node(*base);
      }
      p = (*base)->v.type;
      while (done == 0) {
         elt++; // keep count of elements parsed

         switch (p->t.d_type) {

            case basic_t:
               // check for a pointer type, in which case "->" is ok!
               type = p->t.type;
               if ((*type == '*') 
               &&  ((*str == '-') && (*(str+1) == '>'))) {
                  if (elt == 1) {
                     type += 2;
                     str += 2;
                  }
                  else {
                     printf("operator \"->\" only valid for first identifier\n");
                     done = -1;
                     break;
                  }
               }
               else {
                  // simple pointer type
                  done = 1;
                  break;
               } 
               if (diagnose) {
                  printf("looking for type %s\n", type);
               }
               p = find_type(file, type);
               if (p != NULL) {
                  if (diagnose) {
                     printf("type found:\n");
                     print_node(p);
                  }
               }
               else {
                  if (diagnose) {
                     printf("type not found\n");
                  }
                  done = -1;
                  break;
               }

               n = getsymbol(str, name);
               str += n;
               q = p->elts;
               while (q != NULL) {
#if USE_BLACKCAT_BITLEN
                  if (strcmp(q->t.name, name) == 0) {
                     (*offs) += (q->t.boff / 8);
                     break;
                  }
#else
                  if (strcmp(q->t.name, name) == 0) {
                     (*offs) = roundup((*offs), p->t.algn);
                     break;
                  }
                  (*offs) = roundup((*offs), p->t.algn);
                  (*offs) += q->t.size;
#endif
                  q = q->next;
               }
               if (q == NULL) {
                  printf("component %s unknown\n", name);
                  done = -1;
                  break;
               }
               p = q;
               *indir = 1;
               if (*str != '[') {
                  done = 1;
                  break;
               }
               str=parse_index(file, line, name, str, &p, offs, &index);
               done = 1;
               break;

            case enum_t:
            case func_t:
               // cannot parse any further
               done = 1;
               break;

            case array_t:
               if (*str != '[') {
                  done = 1;
                  break;
               }
               str = parse_index(file, line, name, str, &p, offs, &index);
               done = 1;
               break;

            case struct_t:
               if (*str != '.') {
                  done = 1;
                  break;
               }
               str++;
               n = getsymbol(str, name);
               str += n;
               q = p->elts;
               while (q != NULL) {
#if USE_BLACKCAT_BITLEN
                  if (strcmp(q->t.name, name) == 0) {
                     (*offs) += (q->t.boff / 8);
                     break;
                  }
#else
                  if (strcmp(q->t.name, name) == 0) {
                     (*offs) = roundup((*offs), p->t.algn);
                     break;
                  }
                  (*offs) = roundup((*offs), p->t.algn);
                  (*offs) += q->t.size;
#endif
                  q = q->next;
               }
               if (q == NULL) {
                  printf("component %s unknown\n", name);
                  done = -1;
                  break;
               }
               p = q;
               break;

            case union_t:
               if (*str != '.') {
                  done = 1;
                  break;
               }
               str++;
               n = getsymbol(str, name);
               str += n;
               q = p->elts;
               while (q != NULL) {
                  if (strcmp(q->t.name, name) == 0) {
                     break;
                  }
                  q = q->next;
               }
               if (q == NULL) {
                  printf("component %s unknown\n", name);
                  done = -1;
                  break;
               }
               p = q;
               break;

            default:
               printf("data type of %s unknown\n", name);
               done = -1;
               break;
         }
         if (done == 1) {
            (*leaf) = p;
            if (diagnose > 1) {
               print_node(p);
               printf("offset = 0x%X\n", (*offs));
            }
            return str;
         }
      }
   }
   else {
      printf("variable %s not found in current context\n", name);
   }
   (*leaf) = NULL;
   (*base) = NULL;
   return str;
}


int dereference (struct location *locn, int offs, int relocate) {
   unsigned int addr;
   unsigned int deref;
   unsigned int fp;

   deref = 0;
   switch (locn->type) {
      case mem :
         addr = locn->value + offs;
         if (relocate) {
            addr -= reloc_value;
         }
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_read(mem_model, addr, &deref) == 0) {
               return deref;
            }
         }
         else {
            if (blackbox_hub_read(addr, &deref) == 0) {
               return deref;
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + locn->value + offs;
            if (blackbox_hub_read(addr, &deref) == 0) {
               return deref;
            }
         }
         break;
      case reg :
         if (blackbox_cog_read(mem_model, R0_OFF + locn->value, &deref) == 0) {
            return deref;
         }
         break;
   }
   printf("dereferencing failed - program not stopped at breakpoint?\n");
   return 0;
}

void print_integer_1(struct location *locn, int offs, int relocate) {
   int value = 0;
   int value_1;
   unsigned int addr;
   unsigned int fp;
   switch (locn->type) {
      case mem :
         addr = locn->value + offs;
         if (relocate) {
            addr -= reloc_value;
         }
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_read(mem_model, addr, &value) == 0) {
               value_1 = (value >> ((addr & 3)<<3)) & 0xff;
               if (isprint(value_1)) {
                  printf("= %d ('%c' 0x%02X)\n", value_1, value_1, value_1);
               }
               else {
                  printf("= %d (0x%02X)\n", value_1, value_1);
               }
               return;
            }
         }
         else {
            if (blackbox_hub_read(addr, &value) == 0) {
               value_1 = (value >> ((addr & 3)<<3)) & 0xff;
               if (isprint(value_1)) {
                  printf("= %d ('%c' 0x%02X)\n", value_1, value_1, value_1);
               }
               else {
                  printf("= %d (0x%02X)\n", value_1, value_1);
               }
               return;
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + locn->value + offs;
            if (blackbox_hub_read(addr, &value) == 0) {
               value_1 = (value >> ((addr & 3)<<3)) & 0xff;
               if (isprint(value_1)) {
                  printf("= %d ('%c' 0x%02X)\n", value_1, value_1, value_1);
               }
               else {
                  printf("= %d (0x%02X)\n", value_1, value_1);
               }
               return;
            }
         }
         break;
      case reg :
         if (blackbox_cog_read(mem_model, R0_OFF + locn->value, &value) == 0) {
            value_1 = value & 0xff;
            if (isprint(value_1)) {
               printf("= '%c' (0x%02X)\n", value_1, value_1);
            }
            else {
               printf("= 0x%02X\n", value_1);
            }
            return;
         }
         break;
   }
   printf("read failed - program not stopped at breakpoint?\n");
}


void print_unsigned_1(struct location *locn, int offs, int relocate) {
   unsigned int value = 0;
   unsigned int value_1;
   unsigned int addr;
   unsigned int fp;
   switch (locn->type) {
      case mem :
         addr = locn->value + offs;
         if (relocate) {
            addr -= reloc_value;
         }
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_read(mem_model, addr, &value) == 0) {
               value_1 = (value >> ((addr & 3)<<3)) & 0xff;
               if (isprint(value_1)) {
                  printf("= '%c' (0x%02X)\n", value_1, value_1);
               }
               else {
                  printf("= %d (0x%02X)\n", value_1, value_1);
               }
               return;
            }
         }
         else {
            if (blackbox_hub_read(addr, &value) == 0) {
               value_1 = (value >> ((addr & 3)<<3)) & 0xff;
               if (isprint(value_1)) {
                  printf("= %d ('%c' 0x%02X)\n", value_1, value_1, value_1);
               }
               else {
                  printf("= %d (0x%02X)\n", value_1, value_1);
               }
               return;
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + locn->value + offs;
            if (blackbox_hub_read(addr, &value) == 0) {
               value_1 = (value >> ((addr & 3)<<3)) & 0xff;
               if (isprint(value_1)) {
                  printf("= %d ('%c' 0x%02X)\n", value_1, value_1, value_1);
               }
               else {
                  printf("= %d (0x%02X)\n", value_1, value_1);
               }
               return;
            }
         }
         break;
      case reg :
         if (blackbox_cog_read(mem_model, R0_OFF + locn->value, &value) == 0) {
            value_1 = value & 0xff;
            if (isprint(value_1)) {
               printf("= '%c' (0x%02X)\n", value_1, value_1);
            }
            else {
               printf("= 0x%02X\n", value_1);
            }
            return;
         }
         break;
   }
   printf("read failed - program not stopped at breakpoint?\n");
}


void print_integer_2(struct location *locn, int offs, int relocate) {
   int value = 0;
   int value_2;
   unsigned int addr;
   unsigned int fp;
   switch (locn->type) {
      case mem :
         addr = locn->value + offs;
         if (relocate) {
            addr -= reloc_value;
         }
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_read(mem_model, addr, (unsigned int*)&value) == 0) {
               value_2 = (value >> ((addr & 2)<<3)) & 0xffff;
               printf("= %hd (0x%04X)\n", value_2, value_2);
               return;
            }
         }
         else {
            if (blackbox_hub_read(addr, (unsigned int*)&value) == 0) {
               value_2 = (value >> ((addr & 2)<<3)) & 0xffff;
               printf("= %hd (0x%04X)\n", value_2, value_2);
               return;
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + locn->value + offs;
            if (blackbox_hub_read(addr, (unsigned int*)&value) == 0) {
               value_2 = (value >> ((addr & 2)<<3)) & 0xffff;
               printf("= %hd (0x%04X)\n", value_2, value_2);
               return;
            }
         }
         break;
      case reg :
         if (blackbox_cog_read(mem_model, R0_OFF + locn->value, (unsigned int*)&value) == 0) {
            value_2 = value & 0xffff;
            printf(" = %hd (0x%04X)\n", value_2, value_2);
            return;
         }
         break;
   }
   printf("read failed - program not stopped at breakpoint?\n");
}


void print_unsigned_2(struct location *locn, int offs, int relocate) {
   unsigned int value = 0;
   unsigned int value_2;
   unsigned int addr;
   unsigned int fp;
   switch (locn->type) {
      case mem :
         addr = locn->value + offs;
         if (relocate) {
            addr -= reloc_value;
         }
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_read(mem_model, addr, &value) == 0) {
               value_2 = (value >> ((addr & 2)<<3)) & 0xffff;
               printf("= %hu (0x%04X)\n", value_2, value_2);
               return;
            }
         }
         else {
            if (blackbox_hub_read(addr, &value) == 0) {
               value_2 = (value >> ((addr & 2)<<3)) & 0xffff;
               printf("= %hu (0x%04X)\n", value_2, value_2);
               return;
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + locn->value + offs;
            if (blackbox_hub_read(addr, &value) == 0) {
               value_2 = (value >> ((addr & 2)<<3)) & 0xffff;
               printf("= %hu (0x%04X)\n", value_2, value_2);
               return;
            }
         }
         break;
      case reg :
         if (blackbox_cog_read(mem_model, R0_OFF + locn->value, &value) == 0) {
            value_2 = value & 0xffff;
            printf(" = %hu (0x%04X)\n", value_2, value_2);
            return;
         }
         break;
   }
   printf("read failed - program not stopped at breakpoint?\n");
}


// print signed bits (if not 32!)
void print_signed_bits(int value, int boff, int blen) {
   unsigned int uvalue = 0;
   if ((blen != 0) && (blen != 32)) {
      uvalue = (value >> (boff % 32)) & mask[blen % 32];
      // check for sign bit!
      if (uvalue & (1 << (blen-1))) {
         value = uvalue - (1<<blen);
      }
      else {
         value = uvalue;
      }
      printf("= %d (0x%08X)\n", value, uvalue);
   }
   else {
      printf("= %d (0x%08X)\n", value, value);
   }
}


void print_integer_4(struct location *locn, int offs, int relocate, int boff, int blen) {
   int value = 0;
   unsigned int addr;
   unsigned int fp;
   switch (locn->type) {
      case mem :
         addr = locn->value + offs;
         if (relocate) {
            addr -= reloc_value;
         }
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_read(mem_model, addr, (unsigned int *)&value) == 0) {
               print_signed_bits (value, boff, blen);
               return;
            }
         }
         else {
            if (blackbox_hub_read(addr, (unsigned int *)&value) == 0) {
               print_signed_bits (value, boff, blen);
               return;
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + locn->value + offs;
            if (blackbox_hub_read(addr, (unsigned int *)&value) == 0) {
               print_signed_bits (value, boff, blen);
               return;
            }
         }
         break;
      case reg :
         if (blackbox_cog_read(mem_model, R0_OFF + locn->value, (unsigned int *)&value) == 0) {
            print_signed_bits (value, boff, blen);
            return;
         }
         break;
   }
   printf("read failed - program not stopped at breakpoint?\n");
}


// print unsigned bits (if not 32!)
void print_unsigned_bits(unsigned int value, int boff, int blen) {
   if ((blen != 0) && (blen != 32)) {
      value = (value >> (boff % 32)) & mask[blen % 32];
   }
   printf("= %u (0x%08X)\n", value, value);
}


void print_unsigned_4(struct location *locn, int offs, int relocate, int boff, int blen) {
   unsigned int value = 0;
   unsigned int addr;
   unsigned int fp;
   switch (locn->type) {
      case mem :
         addr = locn->value + offs;
         if (relocate) {
            addr -= reloc_value;
         }
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_read(mem_model, addr, &value) == 0) {
               print_unsigned_bits(value, boff, blen);
               return;
            }
         }
         else {
            if (blackbox_hub_read(addr, &value) == 0) {
               print_unsigned_bits(value, boff, blen);
               return;
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + locn->value + offs;
            if (blackbox_hub_read(addr, &value) == 0) {
               print_unsigned_bits(value, boff, blen);
               return;
            }
         }
         break;
      case reg :
         if (blackbox_cog_read(mem_model, R0_OFF + locn->value, &value) == 0) {
            print_unsigned_bits(value, boff, blen);
            return;
         }
         break;
   }
   printf("read failed - program not stopped at breakpoint?\n");
}


void print_float_4(struct location *locn, int offs, int relocate) {
   float value = 0.0;
   unsigned int addr;
   unsigned int fp;
   switch (locn->type) {
      case mem :
         addr = locn->value + offs;
         if (relocate) {
            addr -= reloc_value;
         }
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_read(mem_model, addr, (unsigned int *)&value) == 0) {
               printf("= %g\n", value);
               return;
            }
         }
         else {
            if (blackbox_hub_read(addr, (unsigned int *)&value) == 0) {
               printf("= %g\n", value);
               return;
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + locn->value + offs;
            if (blackbox_hub_read(addr, (unsigned int *)&value) == 0) {
               printf("= %g\n", value);
               return;
            }
         }
         break;
      case reg :
         if (blackbox_cog_read(mem_model, R0_OFF + locn->value, (unsigned int *)&value) == 0) {
            printf(" = %g\n", value);
            return;
         }
         break;
   }
   printf("read failed - program not stopped at breakpoint?\n");
}


void print_scalar(
   struct node *leaf, 
   struct location *locn,
   int offs,
   int relocate
) {

   if (leaf->t.d_type == func_t) {
     if (verbose) {
        printf("function @ ");
        print_addr (locn, offs);
        printf(" ");
     }
     print_unsigned_4 (locn, offs, relocate, leaf->t.boff, leaf->t.blen);
   }
   else if (leaf->t.d_type == enum_t) {
     if (verbose) {
        printf("enum @ ");
        print_addr (locn, offs);
        printf(" ");
     }
     print_integer_4 (locn, offs, relocate, leaf->t.boff, leaf->t.blen);
   }
   else if (leaf->t.d_type == basic_t) {
     if (strncmp(leaf->t.type, "*", 1) == 0) {
        if (verbose) {
           printf("pointer @ ");
           print_addr (locn, offs);
           printf(" ");
        }
        print_unsigned_4 (locn, offs, relocate, leaf->t.boff, leaf->t.blen);
     }
     else if (strcmp(leaf->t.type, "float") == 0) {
        if (verbose) {
           printf("float @ ");
           print_addr (locn, offs);
           printf(" ");
        }
        print_float_4 (locn, offs, relocate);
     }
     else if (strcmp(leaf->t.type, "double") == 0) {
        if (verbose) {
           printf("double @ ");
           print_addr (locn, offs);
           printf(" ");
        }
        print_float_4 (locn, offs, relocate);
     }
     else if (strcmp(leaf->t.type, "long double") == 0) {
        if (verbose) {
           printf("long double @ ");
           print_addr (locn, offs);
           printf(" ");
        }
        print_float_4 (locn, offs, relocate);
     }
     else if (strcmp(leaf->t.type, "char") == 0) {
        if (verbose) {
           printf("char @ ");
           print_addr (locn, offs);
           printf(" ");
        }
        print_integer_1 (locn, offs, relocate);
     }
     else if (strcmp(leaf->t.type, "signed char") == 0) {
        if (verbose) {
           printf("signed char @ ");
           print_addr (locn, offs);
           printf(" ");
        }
        print_integer_1 (locn, offs, relocate);
     }
     else if (strcmp(leaf->t.type, "unsigned char") == 0) {
        if (verbose) {
           printf("unsigned char @ ");
           print_addr (locn, offs);
           printf(" ");
        }
        print_unsigned_1 (locn, offs, relocate);
     }
     else if (strcmp(leaf->t.type, "short") == 0) {
        if (verbose) {
           printf("short @ ");
           print_addr (locn, offs);
           printf(" ");
        }
        print_integer_2 (locn, offs, relocate);
     }
     else if (strcmp(leaf->t.type, "unsigned short") == 0) {
        if (verbose) {
           printf("unsigned short @ ");
           print_addr (locn, offs);
           printf(" ");
        }
        print_unsigned_2 (locn, offs, relocate);
     }
     else if (strcmp(leaf->t.type, "int") == 0) {
        if (verbose) {
           printf("int @ ");
           print_addr (locn, offs);
           printf(" ");
        }
        print_integer_4 (locn, offs, relocate, leaf->t.boff, leaf->t.blen);
     }
     else if (strcmp(leaf->t.type, "unsigned int") == 0) {
        if (verbose) {
           printf("unsigned int @ ");
           print_addr (locn, offs);
           printf(" ");
        }
        print_unsigned_4 (locn, offs, relocate, leaf->t.boff, leaf->t.blen);
     }
     else if (strcmp(leaf->t.type, "long") == 0) {
        if (verbose) {
           printf("long @ ");
           print_addr (locn, offs);
           printf(" ");
        }
        print_integer_4 (locn, offs, relocate, leaf->t.boff, leaf->t.blen);
     }
     else if (strcmp(leaf->t.type, "long int") == 0) {
        if (verbose) {
           printf("long int @ ");
           print_addr (locn, offs);
           printf(" ");
        }
        print_integer_4 (locn, offs, relocate, leaf->t.boff, leaf->t.blen);
     }
     else if (strcmp(leaf->t.type, "unsigned long") == 0) {
        if (verbose) {
           printf("unsigned long @ ");
           print_addr (locn, offs);
           printf(" ");
        }
        print_unsigned_4 (locn, offs, relocate, leaf->t.boff, leaf->t.blen);
     }
     else if (strcmp(leaf->t.type, "long long") == 0) {
        if (verbose) {
           printf("long long @ ");
           print_addr (locn, offs);
           printf(" ");
        }
        print_integer_4 (locn, offs, relocate, leaf->t.boff, leaf->t.blen);
     }
     else if (strcmp(leaf->t.type, "long long int") == 0) {
        if (verbose) {
           printf("long long int @ ");
           print_addr (locn, offs);
           printf(" ");
        }
        print_integer_4 (locn, offs, relocate, leaf->t.boff, leaf->t.blen);
     }
     else if (strcmp(leaf->t.type, "unsigned long long") == 0) {
        if (verbose) {
           printf("unsigned long long @ ");
           print_addr (locn, offs);
           printf(" ");
        }
        print_unsigned_4 (locn, offs, relocate, leaf->t.boff, leaf->t.blen);
     }
     else {
        // could be a void *
        if (verbose) {
           printf("%s @ ", leaf->t.type);
           print_addr (locn, offs);
           printf(" ");
        }
        print_unsigned_4 (locn, offs, relocate, leaf->t.boff, leaf->t.blen);
     }
   }
   else {
      printf("error - scalar cannot be printed\n");
   }
}


int get_string_char(struct location *locn, int n, char *c, int relocate) {
   unsigned int value;
   unsigned int addr;
   unsigned int fp;
   switch (locn->type) {
      case mem :
         addr = locn->value + n;
         if (relocate) {
            addr -= reloc_value;
         }
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_read(mem_model, (addr & ~3), &value) == 0) {
               *c = (value >> ((addr & 3)<<3)) & 0xff;
               return 0;
            }
         }
         else {
            if (blackbox_hub_read((addr & ~3), &value) == 0) {
               *c = (value >> ((addr & 3)<<3)) & 0xff;
               return 0;
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + locn->value + n;
            if (blackbox_hub_read((addr & ~3), &value) == 0) {
               *c = (value >> ((addr & 3)<<3)) & 0xff;
               return 0;
            }
         }
         break;
      default :
         printf("error - string char cannot be in a register\n");
         return -1;
         break;
   }
   printf("read failed - program not stopped at breakpoint?\n");
   return -1;
}


void print_string(
   struct node *leaf, 
   struct location *addr, 
   int offs,
   int relocate
) {
   char c;
   int i;

   printf("\"");
   for (i = 0; i < leaf->t.size; i++) {
      if (get_string_char(addr, offs + i, &c, relocate) == 0) {
          if (c == 0) {
             break;
          }
          else {
             printf("%c", c);
          }
      }
      else {
         break;
      }
   }
   printf("\"\n");
}


// forward declaration only
void print_leaf (
   struct node *leaf, 
   struct location * locn, 
   int offs,
   int nest,
   unsigned int addr,
   int relocate
);


// print aggregate (struct or union)
void print_aggr(
   struct node *leaf, 
   struct location * locn, 
   int offs,
   int nest,
   int deref,
   unsigned int addr,
   int relocate
) {
   struct node *p;
   int n;

   p = leaf->elts;
   n = 0;
   printf(" { \n");
   while (p != NULL) {
      printf("   %s ",p->t.name);
#if USE_BLACKCAT_BITLEN
      print_leaf(p, locn, offs + (p->t.boff / 8), ++nest, addr, relocate);
#else
      n = roundup(n, p->t.algn);
      print_leaf(p, locn, offs + n, ++nest, addr, relocate);
      n = n + p->t.size;
#endif
      p = p->next;
   }
   printf(" }\n");
}


void print_leaf (
   struct node *leaf, 
   struct location * locn, 
   int offs,
   int nest,
   unsigned int addr,
   int relocate
) {
   if ((*leaf->t.type == '*') & (nest > 0)) {
      // the type being pointed to is a nested pointer so just print its value
      if (verbose) {
         printf("%s @ ", leaf->t.type);
         print_addr(locn, offs);
      }
      print_unsigned_4 (locn, offs, relocate, 0, 32);
      return;
   }
   if (leaf->type == typedef_t) {
      switch (leaf->t.d_type) {
         case basic_t:
         case func_t:
         case enum_t:
            if (addr) {
               print_addr(locn, offs);
               break;
            }
            print_scalar(leaf, locn, offs, relocate);
            break;
         case struct_t:
            if (addr) {
               print_addr(locn, offs);
               break;
            }
            if (nest > 0) {
               printf("<struct>\n");
               break;
            }
            print_aggr(leaf, locn, offs, ++nest, 0, addr, relocate);
            break;
         case union_t:
            if (addr) {
               print_addr(locn, offs);
               break;
            }
            if (nest > 0) {
               printf("<union>\n");
               break;
            }
            print_aggr(leaf, locn, offs, ++nest, 0, addr, relocate);
            break;
         case array_t:
            if (addr) {
               print_addr(locn, offs);
               break;
            }
            if ((leaf->elts != NULL) && (leaf->elts->type == typedef_t)
            &&  (leaf->elts->t.d_type == basic_t) 
            &&  (strcmp(leaf->elts->t.type, "char") == 0)) {
               if (verbose) {
                  printf("array of char @ ");
                  print_addr(locn, offs);
               }
               printf(" = ");
               print_string(leaf, locn, offs, relocate);
            }
            else if ((leaf->elts != NULL) && (leaf->elts->type == typedef_t)
            &&  (leaf->elts->t.d_type == basic_t) 
            &&  (strcmp(leaf->elts->t.type, "uint8_t") == 0)) {
               if (verbose) {
                  printf("array of uint8_t @ ");
                  print_addr(locn, offs);
               }
               printf(" = ");
               print_string(leaf, locn, offs, relocate);
            }
            else if ((leaf->elts != NULL) && (leaf->elts->type == typedef_t)
            &&  (leaf->elts->t.d_type == basic_t) 
            &&  (strcmp(leaf->elts->t.type, "unsigned char") == 0)) {
               if (verbose) {
                  printf("array of unsigned char @ ");
                  print_addr(locn, offs);
               }
               printf(" = ");
               print_string(leaf, locn, offs, relocate);
            }
            else if ((leaf->elts != NULL) && (leaf->elts->type == typedef_t)
            &&  (leaf->elts->t.d_type == basic_t) 
            &&  (strcmp(leaf->elts->t.type, "int8_t") == 0)) {
               if (verbose) {
                  printf("array of int8_t @ ");
                  print_addr(locn, offs);
               }
               printf(" = ");
               print_string(leaf, locn, offs, relocate);
            }
            else {
               if (nest == 0) {
                  printf("only char (or int8_t) arrays can be printed whole - for "); 
                  printf("other arrays specify the element\n");
               }
               else {
                   printf("<array>\n");
               }
            }
            break;
         default:
            if (nest == 0) {
               printf("error - variable type cannot be printed\n");
            }
            else {
               printf("error - type cannot be printed\n");
            }
            break;
      }
   }
}


// print the variable expression.
// the expresion can be:
//       variable
//     * variable
//     & variable
// the variable can be:
//    name
//    name[number]
//    name1.name2
//    name1->name2 (only if name1 is a pointer!)
//
struct node *print_var(int file, int line, char *str, int relocate) {
   char fname[MAX_LINELEN+1];
   struct node *base;
   struct node *leaf;
   struct node *type;
   struct node *f;
   int deref = 0;
   int indir = 0;
   int addr  = 0;
   int offs = 0;
   char *end;
   int i;
   char *t;
   struct location locn;


   while (isspace(*str)) {
      str++;
   }
   while (*str == '*') {
      deref++;
      str++;
   }
   if (*str == '&') {
      addr++;
      str++;
   }
   while (isspace(*str)) {
      str++;
   }
   if ((*str == '\0') || (*str == '\n')) {
      printf("no variable specified to print\n");
      return NULL;
   }
   if (addr == 1) {
      // might be a request to print address of function
      i = 0;
      while (isalnum(str[i]) || (str[i] == '_')) {
         fname[i] = str[i]; 
         i++; 
      }
      fname[i] = '\0';
      f = find_function(fname);
      if (f != NULL) {
          printf("function %s @ ", f->f.fname);
          leaf = f->f.lines;
          if (leaf != NULL) {
             print_addr(leaf->l.locn, 0);
          }
          else {
             printf("NULL!");
          }
          printf("\n");
          return f;
      }
   }
   end = parse_var(file, line, str, &base, &leaf, &offs, &indir);
   if ((*end != '\0') && (*end != ' ') && (*end != '\n')) {
      printf("unexpected characters after variable (\"%s\") ignored\n", end);
   }

   if (base != NULL) {
      if (diagnose) {
         printf("variable = %s%s \n", base->v.name, 
            (addr ? " (address)": ((deref || indir) ? " (dereferenced)" : "")));
         printf("address = ");
         print_addr(base->v.locn, 0);
         printf("\noffset  = 0x%X\n", offs);
         printf("base name  = %s\n", base->v.type->t.name);
         printf("base type  = %s\n", base->v.type->t.type);
         print_node(base);
         printf("leaf name  = %s\n", leaf->t.name);
         printf("leaf type  = %s\n", leaf->t.type);
         print_node(leaf);
      }
      else if (verbose) {
         print_node(base);
      }

      if (leaf != NULL) {
         if (diagnose > 1) {
            print_node(leaf);
         }
         locn = *base->v.locn;

         if ((base->type == local_t) 
         &&  (base->v.type->type == typedef_t)
         &&  ((base->v.type->t.d_type == struct_t) 
           || (base->v.type->t.d_type == union_t))
         &&  (base->v.locn->type == reg)) {
            if (*base->v.type->t.type != '*') {
               // This is a structure, not a pointer to a structure.
               // Catalina passes struct parameters via a pointer 
               // in a register - so we need to dereference this
               // (this is the only time structs should appear in
               //  a register!)
               if (diagnose) {
                  printf("variable is a structure passed as a pointer\n");
               }
               locn.value = dereference(&locn, 0, relocate);
               locn.type = mem; // dereferenced pointers always point to memory
               relocate = 0;
            }
         }

         t = leaf->t.type;

         // indirection means we dereference the base, with no offset
         if (indir) {
            if (verbose) {
               printf("pointer at ");
               print_addr(&locn, 0);
            }
            locn.value = dereference(&locn, 0, relocate);
            locn.type = mem; // dereferenced pointers always point to memory
            if (verbose) {
               printf(" dereferenced is ");
               print_addr(&locn, offs);
               printf("\n");
            }
            if (locn.value == 0) {
                printf("variable is a NULL pointer\n");
                return base;
            }
         }

         // dereference as many times as requested, provided the type
         // we are pointing to supports being dereferenced that many times
         while ((deref > 0) && (*t == '*')) {
            t++;
            while (*t == ' ') {
              t++;
            }
            deref--;
            if (verbose) {
               printf("pointer at ");
               print_addr(&locn, offs);
            }
            locn.value = dereference(&locn, offs, relocate);
            locn.type = mem; // dereferenced pointers always point to memory
            offs = 0;
            relocate = 0;
            if (verbose) {
               printf(" dereferenced is ");
               print_addr(&locn, offs);
               printf("\n");
            }
            if (locn.value == 0) {
                printf("variable is a NULL pointer\n");
                return base;
            }
         }
      
         if (deref > 0) {
            printf("error - cannot dereference a non-pointer type\n");
            return base;
         }

         if (diagnose) {
            printf("looking for type %s\n", t);
         }
         type = find_type(file, t);
         if (type != NULL) {
            if (diagnose) {
               printf("type found:\n");
               print_node(type);
               print_addr(&locn, offs);
               print_leaf(type, &locn, offs, 0, addr, relocate);
            }
            leaf = type;
         }
         else {
            if (diagnose) {
               printf("type not found\n");
            }
         }

         if (*t == '*') {
            // the base type is still a pointer (i.e. we have not
            // completely defererenced it) so just printing its value
            // (or address) is all we need to do
            if (addr) {
               // print address
               if (verbose) {
                  printf("value is address\n");
               }
               print_addr(&locn, offs);
               printf("\n");
            }
            else {
               // print value
               print_unsigned_4 (&locn, offs, relocate, 0, 32);
            }
            return base;
         }

         if ((leaf != base->v.type) && (*leaf->t.type == '*')) {
            // the leaf is a pointer, so just print its value
            print_unsigned_4 (&locn, offs, relocate, 0, 32);
            return base;
         }

         if (diagnose) {
            printf("printing leaf\n");
         }
         print_leaf(leaf, &locn, offs, 0, addr, relocate);
         printf("\n");
      }
      else {
         if (verbose) {
            printf("cannot parse variable\n");
         }
      } 
      return base;
   }
   else {
      if (verbose) {
         printf("cannot parse variable\n");
      }
   }
   return NULL;
}

// return the value of a location (i.e. it's address) if possible
// returns 1 if this is an address location, 0 otherwise
int locn_value(struct location *locn, int *value) {
   unsigned int fp;

   switch (locn->type) {
      case mem :
         *value = locn->value;
         return 1;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            *value = fp + locn->value;
            return 1;
         }
         else {
            printf("location is an offset but frame pointer cannot be read\n");
         }
         break;
      case reg :
         printf("location is a register\n");
         break;
      default :
         printf("location unknown\n");
         break;
   }
   return 0;
}

// read a 4 byte scalar value (of any 4 byte type) if possible
// returns 1 if the scalar value could be read, 0 if not
int scalar_read_4 (
   struct location * locn,
   int offs,
   int relocate,
   int *value
) {
   unsigned int addr;
   unsigned int fp;
   switch (locn->type) {
      case mem :
         addr = locn->value;
         if (relocate) {
            addr -= reloc_value;
         }
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_read(mem_model, addr, value) == 0) {
               return 1;
            }
         }
         else {
            if (blackbox_hub_read(addr, value) == 0) {
               return 1;
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + locn->value + offs;
            if (blackbox_hub_read(addr, value) == 0) {
               return 1;
            }
         }
         break;
      case reg :
         if (blackbox_cog_read(mem_model, R0_OFF + locn->value, value) == 0) {
            return 1;
         }
         break;
   }
   printf("variable read failed - program not stopped at breakpoint?\n");
   return 0;
}

// read a 2 byte scalar value (of any 2 byte type) if possible
// returns 1 if the scalar value could be read, 0 if not
int scalar_read_2 (
   struct location * locn,
   int offs,
   int relocate,
   int *value
) {
   unsigned int tmp_value;
   unsigned int addr;
   unsigned int fp;
   switch (locn->type) {
      case mem :
         addr = locn->value;
         if (relocate) {
            addr -= reloc_value;
         }
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_read(mem_model, addr, &tmp_value) == 0) {
               *value = (tmp_value >> ((addr & 2)<<3)) & 0xffff;
               return 1;
            }
         }
         else {
            if (blackbox_hub_read(addr, &tmp_value) == 0) {
               *value = (tmp_value >> ((addr & 2)<<3)) & 0xffff;
               return 1;
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + locn->value + offs;
            if (blackbox_hub_read(addr, &tmp_value) == 0) {
               *value = (tmp_value >> ((addr & 2)<<3)) & 0xffff;
               return 1;
            }
         }
         break;
      case reg :
         if (blackbox_cog_read(mem_model, R0_OFF + locn->value, &tmp_value) == 0) {
            *value = (tmp_value >> ((addr & 2)<<3)) & 0xffff;
            return 1;
         }
         break;
   }
   printf("variable read failed - program not stopped at breakpoint?\n");
   return 0;
}

// read a 1 byte scalar value (of any 1 byte type) if possible
// returns 1 if the scalar value could be read, 0 if not
int scalar_read_1 (
   struct location * locn,
   int offs,
   int relocate,
   int *value
) {
   unsigned int tmp_value;
   unsigned int addr;
   unsigned int fp;
   switch (locn->type) {
      case mem :
         addr = locn->value;
         if (relocate) {
            addr -= reloc_value;
         }
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_read(mem_model, addr, &tmp_value) == 0) {
               *value = (tmp_value >> ((addr & 3)<<3)) & 0xff;
               return 1;
            }
         }
         else {
            if (blackbox_hub_read(addr, &tmp_value) == 0) {
               *value = (tmp_value >> ((addr & 3)<<3)) & 0xff;
               return 1;
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + locn->value + offs;
            if (blackbox_hub_read(addr, &tmp_value) == 0) {
               *value = (tmp_value >> ((addr & 3)<<3)) & 0xff;
               return 1;
            }
         }
         break;
      case reg :
         if (blackbox_cog_read(mem_model, R0_OFF + locn->value, &tmp_value) == 0) {
            *value = (tmp_value >> ((addr & 3)<<3)) & 0xff;
            return 1;
         }
         break;
   }
   printf("variable read failed - program not stopped at breakpoint?\n");
   return 0;
}

// read a scalar value of any size and type if possible
// returns 1 if it could be read, 0 otherwise
int scalar_read (
   struct node *leaf, 
   struct location * locn,
   int offs,
   int relocate,
   int *value
) {
   if ((strncmp(leaf->t.type, "*", 1) == 0)
   || (strcmp(leaf->t.type, "float") == 0)
   || (strcmp(leaf->t.type, "double") == 0)
   || (strcmp(leaf->t.type, "long double") == 0)
   || (strcmp(leaf->t.type, "int") == 0)
   || (strcmp(leaf->t.type, "unsigned int") == 0)
   || (strcmp(leaf->t.type, "long") == 0)
   || (strcmp(leaf->t.type, "long int") == 0)
   || (strcmp(leaf->t.type, "unsigned long") == 0)
   || (strcmp(leaf->t.type, "long long") == 0)) {
      return scalar_read_4(locn, offs, relocate, value);
   }
   else if ((strcmp(leaf->t.type, "short") == 0)
   || (strcmp(leaf->t.type, "unsigned short") == 0)) {
      return scalar_read_2(locn, offs, relocate, value);
   }
   else if ((strcmp(leaf->t.type, "char") == 0)
   || (strcmp(leaf->t.type, "signed char") == 0)
   || (strcmp(leaf->t.type, "unsigned char") == 0)) {
      return scalar_read_1(locn, offs, relocate, value);
   }
   printf("variable is not a simple scalar\n");
   return 0;
}

char *get_value(
   int file, 
   int line, 
   char *str, 
   int *new_value, 
   int *value_len, 
   int relocate
) {
   char *start;
   char *end;
   int i;
   int float_flag = 0;
   char name[MAX_LINELEN+1];
   struct node *base;
   struct node *leaf;
   struct node *type;
   struct node *f;
   struct location locn;
   int offs = 0;
   int indir = 0;

   *value_len = 4;
   start = str;
   while (isspace(*str)) {
      str++;
   }
   if ((*str == '\n') || (*str == '\0')) {
      printf("no value specified\n");
      return start;  // no value to parse
   }
   if (diagnose) {
      printf("decoding value = %s\n", str);
   }
   if ((i = is_command(str, "byte", 4))) {
      str += i;
      *value_len = 1;
   }
   if ((i = is_command(str, "char", 4))) {
      str += i;
      *value_len = 1;
   }
   else if ((i = is_command(str, "word", 4))) {
      str += i;
      *value_len = 2;
   }
   else if ((i = is_command(str, "short", 5))) {
      str += i;
      *value_len = 2;
   }
   else if ((i = is_command(str, "long", 4))) {
      str += i;
      *value_len = 4;
   }
   else if ((i = is_command(str, "float", 5))) {
      str += i;
      *value_len = 4;
      float_flag = 1; // decode as float
   }
   else if ((i = is_command(str, "double", 6))) {
      str += i;
      *value_len = 4;
      float_flag = 1; // decode as float
   }
   while (isspace(*str)) {
      str++;
   }
   if ((float_flag == 1) || (strchr(str, '.') != NULL)) {
      if (sscanf(str, "%f", (float *)new_value) == 1) {
         while (isxdigit(*str) || (*str == '.') 
         || (*str == '+') || (*str == '-') || (tolower(*str) == 'e')) {
            str++;
         }
         if (*value_len == 1) {
            *new_value &= 0xFF;
         }
         else if (*value_len == 2) {
            *new_value &= 0xFFFF;
         }
         return str;
      }
      else {
         return start;
      }
   }
   else if (*str == '\'') {
      str++;
      if (*str == '\\') {
         str++;
         switch (*str) {
             case '\\' :
                *new_value = (int)'\\';
                break;
             case '\'' :
                *new_value = (int)'\'';
                break;
             case '\"' :
                *new_value = (int)'\"';
                break;
             case '\?' :
                *new_value = (int)'\?';
                break;
             case '0' :
                *new_value = (int)'\0';
                break;
             case 'a' :
                *new_value = (int)'\a';
                break;
             case 'b' :
                *new_value = (int)'\b';
                break;
             case 'f' :
                *new_value = (int)'\f';
                break;
             case 'n' :
                *new_value = (int)'\n';
                break;
             case 'r' :
                *new_value = (int)'\r';
                break;
             case 't' :
                *new_value = (int)'\t';
                break;
             case 'v' :
                *new_value = (int)'\v';
                break;
             default :
                *new_value = *str;
         }
         str++;
      }
      else {
        *new_value = (int)*str++;
      }
      if (*str == '\'') {
        str++;
      }
      if (*value_len == 1) {
         *new_value &= 0xFF;
      }
      else if (*value_len == 2) {
         *new_value &= 0xFFFF;
      }
      return str;
   }
   if (strncmp_i(str, "0x", 2) == 0) {
      str += 2;
      if (sscanf(str, "%x", new_value) == 1) {
         while (isxdigit(*str)) {
            str++;
         }
         if (*value_len == 1) {
            *new_value &= 0xFF;
         }
         else if (*value_len == 2) {
            *new_value &= 0xFFFF;
         }
         return str;
      }
      else {
         return start;
      }
   }
   else if (strncmp(str, "$",1) == 0) {
      str++;
      if (sscanf(str, "%x", new_value) == 1) {
         while (isxdigit(*str)) {
            str++;
         }
         if (*value_len == 1) {
            *new_value &= 0xFF;
         }
         else if (*value_len == 2) {
            *new_value &= 0xFFFF;
         }
         return str;
      }
      else {
         return start;
      }
   }
   if (isdigit(*str) || (*str == '-') || (*str == '+')) {
      if (sscanf(str, "%d", new_value) == 1) {
         if ((*str == '-') || (*str == '+')) {
            str++;
         }
         while (isdigit(*str)) {
            str++;
         }
         if (*value_len == 1) {
            *new_value &= 0xFF;
         }
         else if (*value_len == 2) {
            *new_value &= 0xFFFF;
         }
         return str;
      }
      else {
         return start;
      }
   }
   if (isdigit(*str) || (*str == '-') || (*str == '+')) {
      if (sscanf(str, "%d", new_value) == 1) {
         if ((*str == '-') || (*str == '+')) {
            str++;
         }
         while (isdigit(*str)) {
            str++;
         }
         if (*value_len == 1) {
            *new_value &= 0xFF;
         }
         else if (*value_len == 2) {
            *new_value &= 0xFFFF;
         }
         return str;
      }
      else {
         return start;
      }
   }
   else if (strncmp(str, "&", 1) == 0) {
      str++;
      i = 0;
      while (isalnum(*str) || (*str == '_')) {
         name[i++] = *str; 
         str++; 
      }
      name[i] = '\0';
      // might be a request to print address of function
      if (diagnose) {
         printf("looking for variable or function \"%s\"\n", name);
      }
      f = find_function(name);
      if (f != NULL) {
         leaf = f->f.lines;
         if (leaf != NULL) {
            if (!locn_value(leaf->l.locn, new_value)) {
               return start;
            }
         }
         else {
            printf("function has no lines\n");
            return start;
         }
      }
      else {
         // return the address of a variable
         end = parse_var(file, line, name, &base, &leaf, &offs, &indir);
         if ((*end != '\0') && (*end != ' ') && (*end != '\n')) {
            printf("unexpected characters after variable (\"%s\") ignored\n", end);
            return end;
         }
         if (indir) {
            printf("operator '->' cannot be used here\n");
            return end;
         }
         else {
            if ((base != NULL) && (leaf != NULL)) {
               if (diagnose) {
                  printf("variable = %s \n", base->v.name);
                  printf("address = ");
                  print_addr(base->v.locn, 0);
                  printf("\noffset  = 0x%X\n", offs);
               }
               if (locn_value(base->v.locn, new_value)) {
                  new_value += offs;
                  if (*value_len == 1) {
                     *new_value &= 0xFF;
                  }
                  else if (*value_len == 2) {
                     *new_value &= 0xFFFF;
                  }
                  return end;
               }
               else {
                  return start;
               }
            }
            else {
               printf("cannot find address of variable \"%s\"\n", name);
               return start;
            }
         }
      }
   }      
   else {
      i = 0;
      while (isalnum(*str) || (*str == '_')) {
         name[i++] = *str; 
         str++; 
      }
      name[i] = '\0';
      if (diagnose) {
         printf("looking for variable \"%s\"\n", name);
      }
      // return the value of a variable (if it is a simple scalar)
      end = parse_var(file, line, name, &base, &leaf, &offs, &indir);
      if ((*end != '\0') && (*end != ' ') && (*end != '\n')) {
         printf("unexpected characters after variable (\"%s\") ignored\n", end);
         return end;
      }
      if (indir) {
         printf("operator '->' cannot be used here\n");
         return end;
      }
      if ((base != NULL) && (leaf != NULL)) {
         if (diagnose) {
            printf("variable = %s \n", base->v.name);
            printf("address = ");
            print_addr(base->v.locn, 0);
            printf("\noffset  = 0x%X\n", offs);
         }
         scalar_read(leaf, base->v.locn, offs, relocate, new_value);
         if (*value_len == 1) {
            *new_value &= 0xFF;
         }
         else if (*value_len == 2) {
            *new_value &= 0xFFFF;
         }
         return end;
      }
      else {
         printf("cannot read value of variable \"%s\"\n", name);
         return start;
      }
   }
   return str;
}


int get_address(char **str, int *location) {
   while (isspace(**str)) {
      (*str)++;
   }
   if ((**str == '\n') || (**str == '\0')) {
      printf("no address specified\n");
      return 0;
   }
   if (strncmp_i(*str, "0x", 2) == 0) {
      *str += 2;
      if (sscanf(*str, "%x", location) != 1) {
         printf("invalid address specified\n");
         return 0;
      }
      else {
         while (isxdigit(**str)) {
            (*str)++;
         }
      }
   }
   else if (strncmp_i(*str, "$", 1) == 0) {
      *str += 1;
      if (sscanf(*str, "%x", location) != 1) {
         printf("invalid address specified\n");
         return 0;
      }
      else {
         while (isxdigit(**str)) {
            (*str)++;
         }
      }
   }
   else {
      if (sscanf(*str, "%d", location) != 1) {
         return 0;
      }
      else {
         while (isdigit(**str)) {
            (*str)++;
         }
      }
   }
   return 1;
}


char *len_name(int len) {
   char *b = "byte";
   char *s = "word";
   char *l = "long";
   char *u = "unknown";
   if (len == 1) {
      return b;
   }
   if (len == 2) {
      return s;
   }
   if (len == 4) {
      return l;
   }
   return u;
}


void update_integer_1(struct location *locn, int offs, int val, int len, int relocate) {
   int value = 0;
   int value_1 = val & 0xFF;
   unsigned int addr;
   unsigned int fp;

   switch (locn->type) {
      case mem :
         addr = locn->value + offs;
         if (relocate) {
            addr -= reloc_value;
         }
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_read(mem_model, addr, &value) == 0) {
               value &= ~(0xff << ((addr & 3)<<3));
               val = (val & 0xff) << ((addr & 3)<<3);
               value |= val;
               if (blackbox_xmm_write(mem_model, addr, value, 4) == 0) {
                  if (verbose) {
                     printf("(0x%06X) ", addr);
                  }
                  if (isprint(value_1)) {
                     printf("= %d ('%c' 0x%02X)\n", value_1, value_1, value_1);
                  }
                  else {
                     printf("= %d (0x%02X)\n", value_1, value_1);
                  }
                  return;
               }
            }
         }
         else {
            if (blackbox_hub_read(addr, &value) == 0) {
               value &= ~(0xff << ((addr & 3)<<3));
               val = (val & 0xff) << ((addr & 3)<<3);
               value |= val;
               if (blackbox_hub_write(addr, value, 4) == 0) {
                  if (verbose) {
                     printf("(0x%06X) ", addr);
                  }
                  if (isprint(value_1)) {
                     printf("= %d ('%c' 0x%02X)\n", value_1, value_1, value_1);
                  }
                  else {
                     printf("= %d (0x%02X)\n", value_1, value_1);
                  }
                  return;
               }
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + locn->value + offs;
            if (blackbox_hub_read(addr, &value) == 0) {
               value &= ~(0xff << ((addr & 3)<<3));
               val = (val & 0xff) << ((addr & 3)<<3);
               value |= val;
               if (blackbox_hub_write(addr, value, 4) == 0) {
                  if (verbose) {
                     printf("(0x%06X) ", addr);
                  }
                  if (isprint(value_1)) {
                     printf("= %d ('%c' 0x%02X)\n", value_1, value_1, value_1);
                  }
                  else {
                     printf("= %d (0x%02X)\n", value_1, value_1);
                  }
                  return;
               }
            }
         }
         break;
      case reg :
         if (blackbox_cog_read(mem_model, R0_OFF + locn->value, &value) == 0) {
            value = val & 0xff;
            value_1 = value;
            if (blackbox_cog_write(mem_model, R0_OFF + locn->value, value, 4) == 0) {
               if (isprint(value_1)) {
                  printf("= %d ('%c' 0x%02X)\n", value_1, value_1, value_1);
               }
               else {
                  printf("= %d (0x%02X)\n", value_1, value_1);
               }
               return;
            }
         }
         break;
   }
   printf("update failed - program not stopped at breakpoint?\n");
}

void update_unsigned_1(struct location *locn, int offs, int val, int len, int relocate) {
   unsigned int value = 0;
   unsigned int value_1 = val & 0xFF;
   unsigned int addr;
   unsigned int fp;

   switch (locn->type) {
      case mem :
         addr = locn->value + offs;
         if (relocate) {
            addr -= reloc_value;
         }
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_read(mem_model, addr, &value) == 0) {
               value &= ~(0xff << ((addr & 3)<<3));
               val = (val & 0xff) << ((addr & 3)<<3);
               value |= val;
               if (blackbox_xmm_write(mem_model, addr, value, 4) == 0) {
                  if (verbose) {
                     printf("(0x%06X) ", addr);
                  }
                  if (isprint(value_1)) {
                     printf("= %d ('%c' 0x%02X)\n", value_1, value_1, value_1);
                  }
                  else {
                     printf("= %d (0x%02X)\n", value_1, value_1);
                  }
                  return;
               }
            }
         }
         else {
            if (blackbox_hub_read(addr, &value) == 0) {
               value &= ~(0xff << ((addr & 3)<<3));
               val = (val & 0xff) << ((addr & 3)<<3);
               value |= val;
               if (blackbox_hub_write(addr, value, 4) == 0) {
                  if (verbose) {
                     printf("(0x%06X) ", addr);
                  }
                  if (isprint(value_1)) {
                     printf("= %d ('%c' 0x%02X)\n", value_1, value_1, value_1);
                  }
                  else {
                     printf("= %d (0x%02X)\n", value_1, value_1);
                  }
                  return;
               }
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + locn->value + offs;
            if (blackbox_hub_read(addr, &value) == 0) {
               value &= ~(0xff << ((addr & 3)<<3));
               val = (val & 0xff) << ((addr & 3)<<3);
               value |= val;
               if (blackbox_hub_write(addr, value, 4) == 0) {
                  if (verbose) {
                     printf("(0x%06X) ", addr);
                  }
                  if (isprint(value_1)) {
                     printf("= %d ('%c' 0x%02X)\n", value_1, value_1, value_1);
                  }
                  else {
                     printf("= %d (0x%02X)\n", value_1, value_1);
                  }
                  return;
               }
            }
         }
         break;
      case reg :
         if (blackbox_cog_read(mem_model, R0_OFF + locn->value, &value) == 0) {
            value = val & 0xff;
            value_1 = value;
            if (blackbox_cog_write(mem_model, R0_OFF + locn->value, value, 4) == 0) {
               if (isprint(value_1)) {
                  printf("= %d ('%c' 0x%02X)\n", value_1, value_1, value_1);
               }
               else {
                  printf("= %d (0x%02X)\n", value_1, value_1);
               }
               return;
            }
         }
         break;
   }
   printf("update failed - program not stopped at breakpoint?\n");
}

void update_integer_2(struct location *locn, int offs, int val, int len, int relocate) {
   int value = 0;
   int value_2 = val & 0xFFFF;
   unsigned int addr;
   unsigned int fp;

   switch (locn->type) {
      case mem :
         addr = locn->value + offs;
         if (relocate) {
            addr -= reloc_value;
         }
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_read(mem_model, addr, (unsigned int *)&value) == 0) {
               value &= ~(0xffff << ((addr & 2)<<3));
               val = (val & 0xffff) << ((addr & 2)<<3);
               value |= val;
               value |= val;
               if (blackbox_xmm_write(mem_model, addr, value, 4) == 0) {
                  if (verbose) {
                     printf("(0x%06X) ", addr);
                  }
                  printf("= %hd (0x%04X)\n", value_2, value_2);
                  return;
               }
            }
         }
         else {
            if (blackbox_hub_read(addr, (unsigned int *)&value) == 0) {
               value &= ~(0xffff << ((addr & 2)<<3));
               val = (val & 0xffff) << ((addr & 2)<<3);
               value |= val;
               if (blackbox_hub_write(addr, value, 4) == 0) {
                  if (verbose) {
                     printf("(0x%06X) ", addr);
                  }
                  printf("= %hd (0x%04X)\n", value_2, value_2);
                  return;
               }
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + locn->value + offs;
            if (blackbox_hub_read(addr, (unsigned int *)&value) == 0) {
               value &= ~(0xffff << ((addr & 2)<<3));
               val = (val & 0xffff) << ((addr & 2)<<3);
               value |= val;
               if (blackbox_hub_write(addr, value, 4) == 0) {
                  if (verbose) {
                     printf("(0x%06X) ", addr);
                  }
                  printf("= %hd (0x%04X)\n", value_2, value_2);
                  return;
               }
            }
         }
         break;
      case reg :
         if (blackbox_cog_read(mem_model, R0_OFF + locn->value, (unsigned int *)&value) == 0) {
            value = val & 0xFFFF;
            value_2 = value;
            if (blackbox_cog_write(mem_model, R0_OFF + locn->value, value, 4) == 0) {
               printf("= %hd (0x%04X)\n", value_2, value_2);
               return;
            }
         }
         break;
   }
   printf("update failed - program not stopped at breakpoint?\n");
}


void update_unsigned_2(struct location *locn, int offs, int val, int len, int relocate) {
   unsigned int value = 0;
   unsigned int value_2 = val & 0xFFFF;
   unsigned int addr;
   unsigned int fp;

   switch (locn->type) {
      case mem :
         addr = locn->value + offs;
         if (relocate) {
            addr -= reloc_value;
         }
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_read(mem_model, addr, &value) == 0) {
               value &= ~(0xffff << ((addr & 2)<<3));
               val = (val & 0xffff) << ((addr & 2)<<3);
               value |= val;
               if (blackbox_xmm_write(mem_model, addr, value, 4) == 0) {
                  if (verbose) {
                     printf("(0x%06X) ", addr);
                  }
                  printf("= %hu (0x%04X)\n", value_2, value_2);
                  return;
               }
            }
         }
         else {
            if (blackbox_hub_read(addr, &value) == 0) {
               value &= ~(0xffff << ((addr & 2)<<3));
               val = (val & 0xffff) << ((addr & 2)<<3);
               value |= val;
               if (blackbox_hub_write(addr, value, 4) == 0) {
                  if (verbose) {
                     printf("(0x%06X) ", addr);
                  }
                  printf("= %hu (0x%04X)\n", value_2, value_2);
                  return;
               }
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + locn->value + offs;
            if (blackbox_hub_read(addr, &value) == 0) {
               value &= ~(0xffff << ((addr & 2)<<3));
               val = (val & 0xffff) << ((addr & 2)<<3);
               value |= val;
               if (blackbox_hub_write(addr, value, 4) == 0) {
                  if (verbose) {
                     printf("(0x%06X) ", addr);
                  }
                  printf("= %hu (0x%04X)\n", value_2, value_2);
                  return;
               }
            }
         }
         break;
      case reg :
         if (blackbox_cog_read(mem_model, R0_OFF + locn->value, &value) == 0) {
            value = val & 0xFFFF;
            value_2 = value;
            if (blackbox_cog_write(mem_model, R0_OFF + locn->value, value, 4) == 0) {
               printf("= %hu (0x%04X)\n", value_2, value_2);
               return;
            }
         }
         break;
   }
   printf("update failed - program not stopped at breakpoint?\n");
}


void update_bits(int *value, int val, int boff, int blen) {
   if ((blen != 0) && (blen != 32)) {
      *value = (*value & (~(mask[blen % 32] << (boff %32)))) | ((val & mask[blen % 32]) << (boff % 32));
   }
   else {
      *value = val;
   }
}


void update_integer_4(struct location *locn, int offs, int val, int len, int relocate, int boff, int blen) {
   unsigned int addr;
   int value = 0;
   unsigned int fp;

   switch (locn->type) {
      case mem :
         addr = locn->value + offs;
         if (relocate) {
            addr -= reloc_value;
         }
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_read(mem_model, addr, (unsigned int *)&value) == 0) {
               update_bits(&value, val, boff, blen);
               if (blackbox_xmm_write(mem_model, addr, value, 4) == 0) {
                  if (verbose) {
                     printf("(0x%06X) ", addr);
                  }
                  print_signed_bits (value, boff, blen);
                  return;
               }
            }
         }
         else {
            if (blackbox_hub_read(addr, (unsigned int *)&value) == 0) {
               update_bits(&value, val, boff, blen);
               if (blackbox_hub_write(addr, value, 4) == 0) {
                  if (verbose) {
                     printf("(0x%06X) ", addr);
                  }
                  print_signed_bits (value, boff, blen);
                  return;
               }
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + locn->value + offs;
            if (blackbox_hub_read(addr, (unsigned int *)&value) == 0) {
               update_bits(&value, val, boff, blen);
               if (blackbox_hub_write(addr, value, 4) == 0) {
                  if (verbose) {
                     printf("(0x%06X) ", addr);
                  }
                  print_signed_bits (value, boff, blen);
                  return;
               }
            }
         }
         break;
      case reg :
         if (blackbox_cog_read(mem_model, R0_OFF + locn->value, (unsigned int *)&value) == 0) {
            update_bits(&value, val, boff, blen);
            if (blackbox_cog_write(mem_model, R0_OFF + locn->value, value, 4) == 0) {
               print_signed_bits (value, boff, blen);
               return;
            }
         }
         break;
   }
   printf("update failed - program not stopped at breakpoint?\n");
}


void update_unsigned_4(struct location *locn, int offs, int val, int len, int relocate, int boff, int blen) {
   unsigned int addr;
   unsigned int value = 0;
   unsigned int fp;

   switch (locn->type) {
      case mem :
         addr = locn->value + offs;
         if (relocate) {
            addr -= reloc_value;
         }
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_read(mem_model, addr, (unsigned int *)&value) == 0) {
               update_bits(&value, val, boff, blen);
               if (blackbox_xmm_write(mem_model, addr, value, 4) == 0) {
                  if (verbose) {
                     printf("(0x%06X) ", addr);
                  }
                  print_unsigned_bits (value, boff, blen);
                  return;
               }
            }
         }
         else {
            if (blackbox_hub_read(addr, (unsigned int *)&value) == 0) {
               update_bits(&value, val, boff, blen);
               if (blackbox_hub_write(addr, value, 4) == 0) {
                  if (verbose) {
                     printf("(0x%06X) ", addr);
                  }
                  print_unsigned_bits (value, boff, blen);
                  return;
               }
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + locn->value + offs;
            if (blackbox_hub_read(addr, (unsigned int *)&value) == 0) {
               update_bits(&value, val, boff, blen);
               if (blackbox_hub_write(addr, value, 4) == 0) {
                  if (verbose) {
                     printf("(0x%06X) ", addr);
                  }
                  print_unsigned_bits (value, boff, blen);
                  return;
               }
            }
         }
         break;
      case reg :
         if (blackbox_cog_read(mem_model, R0_OFF + locn->value, (unsigned int *)&value) == 0) {
            update_bits(&value, val, boff, blen);
            if (blackbox_cog_write(mem_model, R0_OFF + locn->value, value, 4) == 0) {
               print_unsigned_bits (value, boff, blen);
            }
         }
         break;
   }
   printf("update failed - program not stopped at breakpoint?\n");
}


void update_float_4(struct location *locn, int offs, int val, int len, int relocate) {
   unsigned int addr;
   unsigned int fp;

   switch (locn->type) {
      case mem :
         addr = locn->value + offs;
         if (relocate) {
            addr -= reloc_value;
         }
         if ((mem_model == 5) || (mem_model == 105)) {
            if (blackbox_xmm_write(mem_model, addr, val, 4) == 0) {
               if (verbose) {
                  printf("(0x%06X) ", addr);
               }
               printf("= %g\n", *((float *)&val));
               return;
            }
         }
         else {
            if (blackbox_hub_write(addr, val, 4) == 0) {
               if (verbose) {
                  printf("(0x%06X) ", addr);
               }
               printf("= %g\n", *((float *)&val));
               return;
            }
         }
         break;
      case off :
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            addr = fp + locn->value + offs;
            if (blackbox_hub_write(addr, val, 4) == 0) {
               if (verbose) {
                  printf("(0x%06X) ", addr);
               }
               printf("= %g\n", *((float *)&val));
               return;
            }
         }
         break;
      case reg :
         if (blackbox_cog_write(mem_model, R0_OFF + locn->value, val, 4) == 0) {
            printf(" = %g\n", *((float *)&val));
         }
         break;
   }
   printf("update failed - program not stopped at breakpoint?\n");
}


void update_scalar(
   struct node *leaf, 
   struct location *locn,
   int offs,
   int new_value,
   int value_len,
   int relocate
) {
   if (leaf->t.d_type == func_t) {
      if (verbose) {
         printf("function @ ");
         print_addr (locn, offs);
      }
      update_integer_4 (locn, offs, new_value, value_len, relocate, leaf->t.boff, leaf->t.blen);
   }
   else if (leaf->t.d_type == enum_t) {
      if (verbose) {
         printf("enum @ ");
         print_addr (locn, offs);
      }
      update_integer_4 (locn, offs, new_value, value_len, relocate, leaf->t.boff, leaf->t.blen);
   }
   else if (leaf->t.d_type == basic_t) {
      if (strncmp(leaf->t.type, "*", 1) == 0) {
         if (verbose) {
            printf("pointer @ ");
            print_addr (locn, offs);
         }
         update_unsigned_4 (locn, offs, new_value, value_len, relocate, leaf->t.boff, leaf->t.blen);
      }
      else if (strcmp(leaf->t.type, "float") == 0) {
         if (verbose) {
            printf("float ");
            print_addr (locn, offs);
         }
         update_float_4 (locn, offs, new_value, value_len, relocate);
      }
      else if (strcmp(leaf->t.type, "double") == 0) {
         if (verbose) {
            printf("double @ ");
            print_addr (locn, offs);
         }
         update_float_4 (locn, offs, new_value, value_len, relocate);
      }
      else if (strcmp(leaf->t.type, "long double") == 0) {
         if (verbose) {
            printf("long double @ ");
            print_addr (locn, offs);
         }
         update_float_4 (locn, offs, new_value, value_len, relocate);
      }
      else if (strcmp(leaf->t.type, "char") == 0) {
         if (verbose) {
            printf("char @ ");
            print_addr (locn, offs);
         }
         update_integer_1 (locn, offs, new_value, value_len, relocate);
      }
      else if (strcmp(leaf->t.type, "signed char") == 0) {
         if (verbose) {
            printf("signed char @ ");
            print_addr (locn, offs);
         }
         update_integer_1 (locn, offs, new_value, value_len, relocate);
      }
      else if (strcmp(leaf->t.type, "unsigned char") == 0) {
         if (verbose) {
            printf("unsigned char @ ");
            print_addr (locn, offs);
         }
         update_unsigned_1 (locn, offs, new_value, value_len, relocate);
      }
      else if (strcmp(leaf->t.type, "short") == 0) {
         if (verbose) {
            printf("short @ ");
            print_addr (locn, offs);
         }
         update_integer_2 (locn, offs, new_value, value_len, relocate);
      }
      else if (strcmp(leaf->t.type, "unsigned short") == 0) {
         if (verbose) {
            printf("unsigned short @ ");
            print_addr (locn, offs);
         }
         update_unsigned_2 (locn, offs, new_value, value_len, relocate);
      }
      else if (strcmp(leaf->t.type, "int") == 0) {
         if (verbose) {
            printf("int @ ");
            print_addr (locn, offs);
         }
         update_integer_4 (locn, offs, new_value, value_len, relocate, leaf->t.boff, leaf->t.blen);
      }
      else if (strcmp(leaf->t.type, "unsigned int") == 0) {
         if (verbose) {
            printf("unsigned int @ ");
            print_addr (locn, offs);
         }
         update_unsigned_4 (locn, offs, new_value, value_len, relocate, leaf->t.boff, leaf->t.blen);
      }
      else if (strcmp(leaf->t.type, "long") == 0) {
         if (verbose) {
            printf("long @ ");
            print_addr (locn, offs);
         }
         update_integer_4 (locn, offs, new_value, value_len, relocate, leaf->t.boff, leaf->t.blen);
      }
      else if (strcmp(leaf->t.type, "long int") == 0) {
         if (verbose) {
            printf("long int @ ");
            print_addr (locn, offs);
         }
         update_integer_4 (locn, offs, new_value, value_len, relocate, leaf->t.boff, leaf->t.blen);
      }
      else if (strcmp(leaf->t.type, "unsigned long") == 0) {
         if (verbose) {
            printf("unsigned long @ ");
            print_addr (locn, offs);
         }
         update_unsigned_4 (locn, offs, new_value, value_len, relocate, leaf->t.boff, leaf->t.blen);
      }
      else if (strcmp(leaf->t.type, "long long") == 0) {
         printf("<long long>");
         if (verbose) {
            printf("long long int @ ");
            print_addr (locn, offs);
         }
         update_integer_4 (locn, offs, new_value, value_len, relocate, leaf->t.boff, leaf->t.blen);
      }
      else if (strcmp(leaf->t.type, "long long int") == 0) {
         if (verbose) {
            printf("long long int @ ");
            print_addr (locn, offs);
         }
         update_integer_4 (locn, offs, new_value, value_len, relocate, leaf->t.boff, leaf->t.blen);
      }
      else if (strcmp(leaf->t.type, "unsigned long long") == 0) {
         if (verbose) {
            printf("unsigned long long @ ");
            print_addr (locn, offs);
         }
         update_unsigned_4 (locn, offs, new_value, value_len, relocate, leaf->t.boff, leaf->t.blen);
      }
   }
   else {
      printf("error - cannot update this variable type\n");
   }
}


void update_leaf (
   struct node *leaf, 
   struct location * locn, 
   int offs,
   int nest,
   int value,
   int len,
   int relocate
) {
   if (leaf->type == typedef_t) {
      switch (leaf->t.d_type) {
         case basic_t:
         case func_t:
         case enum_t:
            update_scalar(leaf, locn, offs, value, len, relocate);
            break;
         case struct_t:
            if (nest == 0) {
               printf("cannot update a whole struct - ");
               printf("specify field to update\n");
            }
            break;
         case union_t:
            if (nest == 0) {
               printf("cannot update a whole union - ");
               printf("specify field to update\n");
            }
            break;
         case array_t:
            if (nest == 0) {
               printf("cannot update a whole array - ");
               printf("specify element to update\n");
            }
            break;
         default:
            if (nest == 0) {
               printf("this variable cannot be updated\n");
            }
            break;
      }
   }
}


// update the expression to a value. 
// the expression can be
//       variable
//     * variable
// the variable can be:
//    name
//    name[number]
//    name.name
// the value can be
//    'c'
//    nnn
//    0xnnn
//
struct node *update_expr(int file, int line, char *str, int relocate) {
   struct node *base;
   struct node *leaf;
   int deref  = 0;
   int indir  = 0;
   int offs = 0;
   char *tok;
   char *end;
   int new_value;
   int value_len;
   char *t;
   struct location locn;

   while (isspace(*str)) {
      str++;
   }
   while (*str == '*') {
      deref++;
      str++;
   }
   if (*str == '&') {
      printf("addresses cannot be updated\n");
      return NULL;
   }
   while (isspace(*str)) {
      str++;
   }
   if ((*str == '\0') || (*str == '\n')) {
      printf("no variable specified to update\n");
      return NULL;
   }
   end = parse_var(file, line, str, &base, &leaf, &offs, &indir);
   if ((*end == '\0') || (*end == '\n')) {
      printf("no value specified after variable\n");
      return NULL;
   }
   if (base != NULL) {
      if (diagnose) {
         printf("variable = %s%s \n", base->v.name, 
            (deref ? " (dereferenced)": ""));
         printf("address = ");
         print_addr(base->v.locn, 0);
         printf("\noffset  = 0x%X\n", offs);
      }
      while (isspace(*end)) {
         end++;
      }
      if (*end == '=') {
         end++;
      }
      tok = get_value(file, line, end, &new_value, &value_len, relocate);
      if (tok == end) {
         printf("invalid value specified\n");
         return NULL;
      }
      if ((*tok != '\0') && (*end != ' ') && (*tok != '\n')) {
         printf("unexpected characters after value (\"%s\") ignored\n", tok);
         return NULL;
      }
      if (diagnose) {
        printf("new value = %d (%X)\n", new_value, new_value);
      }
      locn = *base->v.locn;

      if ((base->type == local_t) 
      &&  (base->v.type->type == typedef_t)
      &&  ((base->v.type->t.d_type == struct_t) 
        || (base->v.type->t.d_type == union_t))
      &&  (base->v.locn->type == reg)) {
         if (*base->v.type->t.type != '*') {
            // This is a structure, not a pointer to a structure.
            // Catalina passes struct parameters via a pointer 
            // in a register - so we need to dereference this
            // (this is the only time structs should appear in
            //  a register!)
            if (diagnose) {
               printf("variable is a structure passed as a pointer\n");
            }
            locn.value = dereference(&locn, 0, relocate);
            locn.type = mem; // dereferenced pointers always point to memory
            relocate = 0;
         }
      }

      t = leaf->t.type;

      // indirection means we dereference the base, with no offset
      if (indir) {
         if (verbose) {
            printf("pointer at ");
            print_addr(&locn, 0);
         }
         locn.value = dereference(&locn, 0, relocate);
         locn.type = mem; // dereferenced pointers always point to memory
         if (verbose) {
            printf(" dereferenced is ");
            print_addr(&locn, offs);
            printf("\n");
         }
         if (locn.value == 0) {
             printf("variable is a NULL pointer\n");
             return base;
         }
      }

      // dereference as many times as requested, provided the type
      // we are pointing to supports being dereferenced that many times
      while ((deref > 0) && (*t == '*')) {
         t++;
         while (*t == ' ') {
           t++;
         }
         deref--;
         if (verbose) {
            printf("pointer at ");
            print_addr(&locn, 0);
         }
         locn.value = dereference(&locn, 0, relocate);
         locn.type = mem; // dereferenced pointers always point to memory
         offs = 0;
         relocate = 0;
         if (verbose) {
            printf(" dereferenced is ");
            print_addr(&locn, 0);
            printf("\n");
         }
         if (locn.value == 0) {
             printf("variable is a NULL pointer\n");
             return base;
         }
      }
     
      if (deref > 0) {
         printf("error - cannot dereference a non-pointer type\n");
         return base;
      }

      update_leaf(leaf, &locn, offs, 0, new_value, value_len, relocate);
      printf("\n");
      return base;
   }
   return NULL;
}


/*********************
 * COMMAND FUNCTIONS *
 *********************/


// match a command - must match at least min chars, and every char specified
// must also match. Returns zero on no match or number of matched characters
int is_command (char *str, char *cmd, int min) {
   int l = strlen(str);
   int i;
   int j;
   int c = strlen(cmd);
   int n;

   for (i = 0; i < l; i++) {
      if (!isspace(str[i])) {
         break;
      }
   } 
   for (j = i; j < l; j++) {
      if (isspace(str[j])) {
         break;
      }
   }
   n = (c < (j-i) ? c : (j-i));
   if (strncmp_i(&str[i], cmd, min) == 0) {
      if (strncmp_i(&str[i], cmd, n) == 0) {
         if (str[i+n] == '\0' || isspace(str[i+n])) {
            return n;
         }
      }
   }
   return 0;
}


// source_file - return a handle to the source file, opening it if required
FILE *source_file(int src) {
   struct node *s;
   if ((s = source_node(src)) != NULL) {
      if (source_handle[src-1] == NULL) {
         source_handle[src-1] = fopen(s->s.name,"r");
         if (source_handle[src-1] == NULL) {
            printf("cannot open file %d (%s)\n", src, s->s.name);
         }
      }
      return (source_handle[src-1]);
   }
   else {
      printf("invalid source file number (%d) specified\n", src);
      return NULL;
   }
}

void file_cmd(char *args) {
   int src = 0;
   int i = 0;
   char *tok = NULL;
   char *delim = " \n\t,:-=";
   struct node *s;

   printf("\n");
   tok = strtok(args, delim);
   if (tok != NULL) {
      if (strcmp(tok, ".") == 0) {
         if (debugger_line != NULL) {
            current_file = debugger_line->d.src;
            current_line = debugger_line->d.num;
            printf("\nlist file = %d\n", current_file);
            printf("list line = %d\n\n", current_line);
         }
         else {
            printf("no current debug line - source file and line not set\n");
            return;
         }
      }
      else if ((sscanf(tok, "%d", &src) == 1)) {
         if (source_file(src) != NULL) {
            current_file = src;
            tok = strtok(NULL, delim);
            if ((tok != NULL) && (sscanf(tok, "%d", &i) == 1)) {
               current_line = i;
            }
            else {
               current_line = 1;
            }
         }
         else {
            return;
         }
      }
      else {
         printf("invalid source file number\n");
         return;
      }
   }
   if ((s = source_node(src)) != NULL) {
      printf("list file = %d : %s\n", src, s->s.name);
   }
   else {
      for (src = 1; src <= source_count; src++) {
         if ((s = source_node(src)) != NULL) {
            printf("%2d : %s\n", src, s->s.name);
         }
      }
      printf("\nlist file = %d\n", current_file);
   }
   printf("list line = %d\n\n", current_line);
   if (debugger_line != NULL) {
      printf("debug file = %d : %s\n", debugger_line->d.src, 
         source_list[debugger_line->d.src-1]->s.name);
      printf("debug line = %d\n\n", debugger_line->d.num);
   }
}


// list_line : include breakpoint markers
void list_line(int src, int l, char *str, struct node **d) {
   if (*d == NULL) {
      *d = debug_info[src-1];
   }
   while ((*d != NULL) && ((*d)->type == debug_t) && ((*d)->d.num < l)) {
      *d = (*d)->next;
   }
   if (*d != NULL) {
      if ((*d)->d.num == l) {
         if ((*d)->d.user_b) {
            printf("*");
         }
         else if ((*d)->d.virt_b) {
            printf("+");
         }
         else {
            printf("-");
         }
      }
      else {
         printf(" ");
      }
   }
   else {
      printf(" ");
   }
   if ((debugger_line != NULL) 
   &&  (debugger_line->d.src == src)
   &&  (debugger_line->d.num == l)) {
      printf("@ ");
   }
   else {
      printf("  ");
   }
   printf("%05d %s", l, str);
}


void list_cmd(char *args) {
   int i = 0;
   int src = current_file;
   int first = current_line;
   struct node *d = NULL;
   struct node *f = NULL;
   int last  = -1;
   char *tok = NULL;
   char *delim = " \n\t,:-=";
   char line[MAX_LINELEN+1];

   tok = strtok(args, delim);
   if (tok != NULL) {
      if (diagnose) {
         printf("from line %s\n", tok);
      }
      if (strcmp(tok, ".") == 0) {
         if (debugger_line != NULL) {
            current_file = src = debugger_line->d.src;
            first = maxval (1, debugger_line->d.num - PAGE_SIZE/2);
            last  = maxval (first + PAGE_SIZE, debugger_line->d.num + PAGE_SIZE/2);
         }
         else {
            printf("no current debug line - listing last source line instead\n");
            first = maxval (1, current_line - PAGE_SIZE/2);
            last  = maxval (first + PAGE_SIZE, current_line + PAGE_SIZE/2);
         }
      }
      f = find_function(tok);
      if ((f != NULL) && (f->f.lines != NULL)) {
         current_file = src = f->f.src;
         first = f->f.lines->l.num;
      }
      else {
         if (sscanf(tok, "%d", &first) == 1) {
            tok = strtok(NULL, delim);
            if (tok == NULL) {
               first = maxval (1, first - PAGE_SIZE/2);
            }
            else {
               if (diagnose) {
                  printf("to line %s\n", tok);
               }
               sscanf(tok, "%d", &last);
            }
         }
      }
   }
   if (source_file(src) != NULL) {
      fseek(source_handle[src-1],0L, SEEK_SET);
      clearerr(source_handle[src-1]);
      i = 1;
      if (last == -1) {
          last = first + PAGE_SIZE;
      }
      while (!feof(source_handle[src-1]) && (i < first)) {
         fgets(line, MAX_LINELEN, source_handle[src-1]);
         i++;
      }
      while (!feof(source_handle[src-1]) && ((last == -1) || (i <= last))) {
         line[0]='\0';
         fgets(line, MAX_LINELEN, source_handle[src-1]);
         if (!feof(source_handle[src-1])) { 
            list_line(src, i, line, &d);
         }
         i++;
      }
      if (diagnose) {
         printf("setting current line to %d\n", i);
      }
      current_line = i;
   }
}


// load_and_list - list a single line
void load_and_list(int src, int l) {
   struct node *d = NULL;
   int i;
   char line[MAX_LINELEN+1] = {'\0'};
   
   if (source_file(src) != NULL) {
      fseek(source_handle[src-1], 0L, SEEK_SET);
      clearerr(source_handle[src-1]);
      i = 1;
      while (!feof(source_handle[src-1]) && (i < l)) {
         fgets(line, MAX_LINELEN, source_handle[src-1]);
         i++;
      }
      fgets(line, MAX_LINELEN, source_handle[src-1]);
      if (i < l) {
         printf("cannot list line %d - file has only %d lines\n", l, i);
      }
      else {
         list_line(src, i, line, &d);
      }
   }
}


void load_and_list_debug_line(unsigned int addr) {
   if (verbose) {
      printf("looking for a line at address 0x%06X\n", addr);
   }
   if (find_debug_line_by_addr (addr) != NULL) {
      current_file = debugger_line->d.src;
      current_line = debugger_line->d.num;
      load_and_list(current_file, current_line);
   }
   else {
      printf("error - location <0x%06X> is not a breakpoint\n", addr);
   }
}


char * lookup_register(char *str, int *reg) {
   int r = 0;

   if (strncmp_i(str,"PC", 2) == 0) {
      *reg = PC_OFF;
      str += 2;
   }
   else if (strncmp_i(str, "SP", 2) == 0) {
      *reg = SP_OFF;
      str += 2;
   }
   else if (strncmp_i(str, "FP", 2) == 0) {
      *reg = FP_OFF;
      str += 2;
   }
   else if (strncmp_i(str, "RI", 2) == 0) {
      *reg = RI_OFF;
      str += 2;
   }
   else if (strncmp_i(str, "BC", 2) == 0) {
      *reg = BC_OFF;
      str += 2;
   }
   else if (strncmp_i(str, "BA", 2) == 0) {
      *reg = BA_OFF;
      str += 2;
   }
   else if (strncmp_i(str, "BZ", 2) == 0) {
      *reg = BZ_OFF;
      str += 2;
   }
   else if (strncmp_i(str, "CS", 2) == 0) {
      *reg = CS_OFF;
      str += 2;
   }
   else if (toupper(*str) == 'R') {
      str++;
      if ((sscanf(str, "%d", &r) == 1) && (r >= 0) && (r <= 23)) {
         *reg = R0_OFF + r;
         while (isdigit(*str)) {
            str++;
         }
      }
   }
   if ((*str != ' ') && (*str != '\t') && (*str != '\0') && (*str != '=')) {
      *reg = -1;
   }
   return str;
}

// get a memory addr, which may be specified using XXXXXX, 0xXXXXXX, $XXXXXX, 
// or as a variable name or as &variable.
// return the mem_type, or -1 on any error, but note that while the address
// is assumed to be a hub address, in some contexts it is an xmm address.
int get_mem_addr(char **str, int *location) {
   int i = 0;
   int mem_type = 0; // 0 = cog, 1 = hub, 2 = xmm
   char name[MAX_LINELEN+1];
   unsigned int fp;
   struct location locn;
   struct node *leaf;
   struct node *v;
   struct node *f;
   char *t;

   while (isspace(**str)) {
      (*str)++;
   }
   if (**str == '&') {
      (*str)++;
      while (isspace(**str)) {
         (*str)++;
      }
      if ((**str == '\0') || (**str == '\n')) {
         printf("no variable or function specified\n");
         return -1;
      }
      // request to read from address of function or variable
      i = 0;
      while (isalnum(**str) || (**str == '_')) {
         name[i] = **str; 
         (*str)++; 
         i++;
      }
      name[i] = '\0';
      if ((**str != ' ') && (**str != '\0') && (**str != '\n')) {
         printf("unexpected characters after variable (\"%s\")\n", name);
         return -1;
      }
      f = find_function(name);
      if (f != NULL) {
         leaf = f->f.lines;
         if (leaf != NULL) {
            locn = *(leaf->l.locn);
         }
         if (verbose) {
            printf("function %s @ ", f->f.fname);
            if (leaf != NULL) {
               print_addr(&locn, 0);
               printf("\n");
            }
         }
         else {
            printf("function is NULL!\n");
         }
      }
      else {
         v = find_variable(debugger_line->d.src, debugger_line->d.num, name);
         if (v != NULL) {
            locn = *(v->v.locn);
            if (verbose) {
               printf("variable %s @ ", v->v.name);
               print_addr(&locn, 0);
               printf("\n");
            }
         }
         else {
            printf("variable or function %s not found\n", name);
            return -1;
         }
      }

      if (locn.type == reg) {
         mem_type = 0;
         *location = R0_OFF + locn.value;
      }
      else if (locn.type == off) {
         mem_type = 1;
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            *location = fp + locn.value;
         }
         else {
            return -1;
         }
      }
      else {
         mem_type = 1; // assume hub RAM
         *location = locn.value;
      }
   }
   else {
      mem_type = 1; // assume hub RAM
      if (!get_address(str, location)) {
         while (isspace(**str)) {
            (*str)++;
         }
         if ((**str == '\0') || (**str == '\n')) {
            printf("no address or variable specified\n");
            return -1;
         }
         if (**str == '*') {
            printf("dereferencing not allowed here\n");
            return -1;
         }
         // request to read from address specified by value of pointer variable
         i = 0;
         while (isalnum(**str) || (**str == '_')) {
            name[i] = **str; 
            (*str)++; 
            i++;
         }
         name[i] = '\0';
         v = find_variable(debugger_line->d.src, debugger_line->d.num, name);
         if (v != NULL) {
            locn = *(v->v.locn);
            if (verbose) {
               printf("variable %s @ ", v->v.name);
               print_addr(&locn, 0);
               printf("\n");
            }
         }
         else {
            printf("variable %s not found\n", name);
            return -1;
         }
   
         t = v->v.type->t.type;
         if (*t != '*') {
            printf("variable %s is not a pointer\n", name);
         }
         locn.value = dereference(&locn, 0, 1);
         locn.type = mem; // dereferenced pointers always point to memory
         if (verbose) {
            printf(" dereferenced is ");
            print_addr(&locn, 0);
            printf("\n");
         }
         if (locn.value == 0) {
             printf("variable is a NULL pointer\n");
             return -1;
         }
         *location = locn.value;
      }
   }
   return mem_type;
}

void read_expr(int file, int line, char *str, int relocate) {
   int i = 0;
   char *end = NULL;
   char *delim = " \n\t,:=";
   int location;
   int value = 0;
   int mem_type = 0; // 0 = cog, 1 = hub, 2 = xmm
   int count = 1;
   int count_len;
   char *t;
  
   end = str + strlen(str);
   while (isspace(*str)) {
      str++;
   }
   if (str != end) {
      str = lookup_register(str, &location);
      if (location < 0) {
         if ((i = is_command(str, "cog", 1))) {
            str += i;
            if (str == end) {
               printf("no cog location specified\n");
               return;
            }
            mem_type = 0;
            if (!get_address(&str, &location)) {
               printf("invalid cog location specified\n");
               return;
            }
         }
         else if ((i = is_command(str, "hub", 1))) {
            str += i;
            if (str == end) {
               printf("no hub location specified\n");
               return;
            }
            mem_type = get_mem_addr(&str, &location);
            if (mem_type != 1) {
               printf("location is not a hub address\n");
               return;
            }
         }
         else if ((i = is_command(str, "xmm", 1))) {
            str += i;
            if (str == end) {
               printf("no XMM location specified\n");
               return;
            }
            mem_type = get_mem_addr(&str, &location);
            if (mem_type != 1) {
               printf("location is not an XMM address\n");
               return;
            }
            // assume it is an XMM address
            mem_type = 2;
         }
         else if (*str == '*') {
            printf("dereferencing operator not allowed here\n");
            return;
         }
         else {
            mem_type = get_mem_addr(&str, &location);
            if (mem_type != 1) {
               printf("location is not an address\n");
               return;
            }
         }
      }
   }
   else {
      printf("no read location specified\n");
      return;
   }
   while (isspace(*str)) {
      str++;
   }
   if (diagnose) {
     printf("decoding read count = %s\n", str);
   }
   if ((str != end) && (*str != '\n') && (*str != '\0')) {
      str = get_value(file, line, str, &count, &count_len, relocate);
      if ((*end != '\0') && (*end != ' ') && (*end != '\n')) {
         printf("invalid read count\n");
         return;
      }
      count = maxval(count, 1);
   }
   if (mem_type == 0) {
      if (location > 0x1ff) {
         printf("cog location must be a register name, or from 0 to 0x1ff\n");
         return;
      }
      count = minval(count, 0x200 - location);
      if (diagnose) {
         printf("cog read from location 0x%03X, count = %d\n", location, count);
      }
      for (i = 0; i < count; i++) {
         if (blackbox_cog_read(mem_model, location, (unsigned int *)&value) == 0) {
            printf("cog location 0x%03X = 0x%08X\n", location, value);
         }
        else {
            printf("cog read of location 0x%03X failed - not at breakpoint?\n", location);
            return;
         }
         location += 1;
      }
   }
   else if (mem_type == 1) {
      if (location > 0xffffff) {
         printf("hub location must be from 0 to 0xffffff\n");
         return;
      }
      count = minval(count, 0x1000000 - location);
      if (diagnose) {
         printf("hub read from location 0x%06X, count = %d\n", location, count);
      }
      for (i = 0; i < count; i++) {
         if (blackbox_hub_read(location, (unsigned int *)&value) == 0) {
            printf("hub location 0x%06X = 0x%08X\n", location, value);
         }
         else {
            printf("hub read of location 0x%06X failed - not at breakpoint?\n", location);
            return;
         }
         location += 4;
      }
   }
   else {
      if (location > 0xffffff) {
         printf("xmm location must be from 0 to 0xffffff\n");
         return;
      }
      count = minval(count, 0x1000000 - location);
      if (diagnose) {
         printf("xmm read from location 0x%06X, count = %d\n", location, count);
      }
      for (i = 0; i < count; i++) {
         if (blackbox_xmm_read(mem_model, location, (unsigned int *)&value) == 0) {
            printf("xmm location 0x%06X = 0x%08X\n", location, value);
         }
         else {
            printf("xmm read of location 0x%06X failed - not at breakpoint?\n", location);
            return;
         }
         location += 4;
      }
   }
}


void write_expr(int file, int line, char *str, int relocate) {
   int i = 0;
   char *end = NULL;
   char *delim = " \n\t,:=";
   int location;
   int new_value = 0;
   int value_len = 0;
   int mem_type = 0; // 0 = cog, 1 = hub, 2 = xmm
   
   end = str + strlen(str);
   while (isspace(*str)) {
      str++;
   }
   if (str != end) {
      str = lookup_register(str, &location);
      if (location < 0) {
         if ((i = is_command(str, "cog", 1))) {
            str += i;
            if (str == end) {
               printf("no cog location specified\n");
               return;
            }
            mem_type = 0;
            if (!get_address(&str, &location)) {
               printf("invalid cog location specified\n");
               return;
            }
         }
         else if ((i = is_command(str, "hub", 1))) {
            str += i;
            if (str == end) {
               printf("no hub location specified\n");
               return;
            }
            mem_type = get_mem_addr(&str, &location);
            if (mem_type != 1) {
               printf("location is not a hub address\n");
               return;
            }
         }
         else if ((i = is_command(str, "xmm", 1))) {
            str += i;
            if (str == end) {
               printf("no XMM location specified\n");
               return;
            }
            mem_type = get_mem_addr(&str, &location);
            if (mem_type != 1) {
               printf("location is not an XMM address\n");
               return;
            }
            // assume it is an XMM address
            mem_type = 2;
         }
         else if (*str == '*') {
            printf("dereferencing operator not allowed here\n");
            return;
         }
         else {
            mem_type = get_mem_addr(&str, &location);
            if (mem_type != 1) {
               printf("location is not a hub address\n");
               return;
            }
         }
      }
      while (isspace(*str)) {
         str++;
      }
      if (*str == '=') {
         str++;
      }
      if ((str == end) || (*str == '\n') || (*str == '\0')) {
         printf("no value specified\n");
         return;
      }
      if (diagnose) {
        printf("decoding value = %s\n", str);
      }
      str = get_value(file, line, str, &new_value, &value_len, relocate);
      if ((*str != '\0') && (*str != ' ') && (*str != '\n')) {
         printf("unexpected characters after value (\"%s\") ignored\n", end);
         return;
      }
      if (diagnose) {
        printf("new value = %d (%X)\n", new_value, new_value);
      }
   }
   else {
      printf("no write location specified\n");
      return;
   }
   if (mem_type == 0) {
      if (location > 0x1ff) {
         printf("cog location must be a register name, or from 0 to 0x1ff\n");
         return;
      }
      if (value_len != 4) {
         printf("cannot write values with size %d to cog RAM\n", value_len);
      }
      if (diagnose) {
         printf("cog write %s 0x%X to 0x%03X\n", 
            len_name(value_len), new_value, location);
      }
      if (blackbox_cog_write(mem_model, location, new_value, value_len) == 0) {
         new_value = 0;
         if (blackbox_cog_read(mem_model, location, (unsigned int *)&new_value) == 0) {
            printf("cog location 0x%03X = 0x%08X\n", location, new_value);
         }
         else {
            printf("cog read failed\n");
         }
      }
      else {
         printf("cog write failed - program not stopped at breakpoint?\n");
      }
   }
   else if (mem_type == 1) {
      if (location > 0xffffff) {
         printf("hub location must be from 0 to 0xffffff\n");
         return;
      }
      if (diagnose) {
         printf("hub write %s 0x%X to 0x%06X\n", 
            len_name(value_len), new_value, location);
      }
      if (blackbox_hub_write(location, new_value, value_len) == 0) {
         new_value = 0;
         if (blackbox_hub_read(location, (unsigned int *)&new_value) == 0) {
            printf("hub location 0x%03X = 0x%08X\n", location, new_value);
         }
         else {
            printf("hub read failed\n");
         }
      }
      else {
         printf("hub write failed - program not stopped at breakpoint?\n");
      }
   }
   else {
      if (location > 0xffffff) {
         printf("xmm location must be from 0 to 0xffffff\n");
         return;
      }
      if (diagnose) {
         printf("xmm write %s 0x%X to 0x%06X\n", 
            len_name(value_len), new_value, location);
      }
      blackbox_xmm_write(mem_model, location, new_value, value_len);
      if (blackbox_xmm_write(mem_model, location, new_value, value_len) == 0) {
         new_value = 0;
         if (blackbox_xmm_read(mem_model, location, (unsigned int *)&new_value) == 0) {
            printf("xmm location 0x%03X = 0x%08X\n", location, new_value);
         }
         else {
            printf("xmm read failed\n");
         }
      }
      else {
         printf("xmm write failed - location invalid, or program not stopped at breakpoint?\n");
      }
   }
}


void print_cmd(char *args) {

   if (debugger_line != NULL) {
      print_var(debugger_line->d.src, debugger_line->d.num, args, 1);
   }
   else {
      printf("error - no current context\n");
   }
}


void update_cmd(char *args) {

   if (debugger_line != NULL) {
      update_expr(debugger_line->d.src, debugger_line->d.num, args, 1);
   }
   else {
      printf("error - no current context\n");
   }
}

void read_cmd(char *args) {

   if (debugger_line != NULL) {
      read_expr(debugger_line->d.src, debugger_line->d.num, args, 1);
   }
   else {
      printf("error - no current context\n");
   }
}

void write_cmd(char *args) {

   if (debugger_line != NULL) {
      write_expr(debugger_line->d.src, debugger_line->d.num, args, 1);
   }
   else {
      printf("error - no current context\n");
   }
}


/*
 * On the P2 in native mode, we cannot put a breakpoint in place of a relative 
 * addressing mode instruction, so we need to identify all such instructions
 * by their bit patterns ...
 * 
 * XXXX 1101011 00X XXXXXXXXX 000110000
 * XXXX 1011001 XX1 XXXXXXXXX XXXXXXXXX
 * XXXX 1011010 XX1 XXXXXXXXX XXXXXXXXX
 * XXXX 1011011 XX1 XXXXXXXXX XXXXXXXXX
 * XXXX 1011100 XX1 XXXXXXXXX XXXXXXXXX
 * XXXX 1011101 XX1 XXXXXXXXX XXXXXXXXX
 * XXXX 1011110 0X1 XXXXXXXXX XXXXXXXXX
 * XXXX 11011XX 1XX XXXXXXXXX XXXXXXXXX
 * XXXX 1110XXX 1XX XXXXXXXXX XXXXXXXXX
 * 
 * ... regrouped as hex digits ...
 * 
 * XXXX 1101 0110 0XXX XXXX XXX0 0011 0000 
 * XXXX 1011 001X X1XX XXXX XXXX XXXX XXXX 
 * XXXX 1011 010X X1XX XXXX XXXX XXXX XXXX 
 * XXXX 1011 011X X1XX XXXX XXXX XXXX XXXX 
 * XXXX 1011 100X X1XX XXXX XXXX XXXX XXXX 
 * XXXX 1011 101X X1XX XXXX XXXX XXXX XXXX 
 * XXXX 1011 1100 X1XX XXXX XXXX XXXX XXXX 
 * XXXX 1101 1XX1 XXXX XXXX XXXX XXXX XXXX 
 * XXXX 1110 XXX1 XXXX XXXX XXXX XXXX XXXX 
 * 
 * ... and converted to mask and value ...
 * 
 * MASK=0x0FF801FF VAL=0x0D000030
 * MASK=0x0FE40000 VAL=0x0B240000
 * MASK=0x0FE40000 VAL=0x0B440000
 * MASK=0x0FE40000 VAL=0x0B640000
 * MASK=0x0FE40000 VAL=0x0B840000
 * MASK=0x0FE40000 VAL=0x0BA40000
 * MASK=0x0FF40000 VAL=0x0BC40000
 * MASK=0x0F900000 VAL=0x0D900000
 * MASK=0x0F100000 VAL=0x0E100000
 *
 */
int is_relative(unsigned int instr) {

   if (((instr & 0x0FF801FF) == 0x0D000030)
   ||  ((instr & 0x0FE40000) == 0x0B240000)
   ||  ((instr & 0x0FE40000) == 0x0B440000)
   ||  ((instr & 0x0FE40000) == 0x0B640000)
   ||  ((instr & 0x0FE40000) == 0x0B840000)
   ||  ((instr & 0x0FE40000) == 0x0BA40000)
   ||  ((instr & 0x0FE40000) == 0x0BC40000)
   ||  ((instr & 0x0F900000) == 0x0D900000)
   ||  ((instr & 0x0F100000) == 0x0E100000)) {
      return 1;
   }
   else {
      return 0;
   }
}

int add_user_brkpt(struct node *d) {
   unsigned int inst;

   if (d == NULL) {
      return 0;
   }
   if (d->d.user_b == 0) {
      d->d.user_b = 1;
      if (d->d.virt_b == 0) {
         if (mem_model == 111) {
            if (blackbox_hub_read(d->d.locn->value, &inst) == 0) {
               if (is_relative(inst)) {
                  printf("error - could not set user breakpoint (instruction is relative)\n");
                  d->d.user_b = 0;
                  return -1;
               }
            }
            else {
               printf("error - could not set user breakpoint (hub read failed)\n");
               d->d.user_b = 0;
               return -1;
            }
         }
         if (blackbox_set_inst(mem_model, d->d.locn->value, breakpoint, &d->d.inst) == 0) {
            if (verbose) {
               printf("user breakpoint added to file %d, line %d, addr 0x%X\n", 
               d->d.src, d->d.num, d->d.locn->value);
            }
         }
         else {
            printf("error - could not set user breakpoint (set instruction failed)\n");
            d->d.user_b = 0;
            return -1;
         }
      }
   }
   else {
      printf("user breakpoint already exists on file %d, line %d\n", 
         d->d.src, d->d.num);
   }
   return 0;
}


int add_virtual_brkpt(struct node *d) {
   unsigned int inst;

   if (d == NULL) {
      return 0;
   }
   if (d->d.virt_b == 0) {
      d->d.virt_b = 1;
      if (d->d.user_b == 0) {
         if (mem_model == 111) {
            if (blackbox_hub_read(d->d.locn->value, &inst) == 0) {
               if (is_relative(inst)) {
                  printf("error - could not set virtual breakpoint (instruction is relative)\n");
                  d->d.virt_b = 0;
               }
            }
            else {
               printf("error - could not set virtual breakpoint (hub read failed)\n");
               d->d.virt_b = 0;
               return -1;
            }
         }
         if (blackbox_set_inst(mem_model, d->d.locn->value, breakpoint, &d->d.inst) == 0) {
            if (diagnose) {
               printf("virtual breakpoint added, file %d, line %d, addr 0x%X\n", 
                  d->d.src, d->d.num, d->d.locn->value);
            }
         }
         else {
            printf("error - could not set virtual breakpoint (set instruction failed)\n");
            d->d.virt_b = 0;
            return -1;
         }
      }
   }
   return 0;
}


int remove_user_brkpt(struct node *d) {
   int tmp;

   if (d == NULL) {
      return 0;
   }
   if (d->d.user_b == 1) {
      d->d.user_b = 0;
      if (d->d.virt_b == 0) {
         if (blackbox_set_inst(mem_model, d->d.locn->value, d->d.inst, &tmp) == 0) {
            if (verbose) {
               printf("user breakpoint removed, file %d, line %d, addr 0x%X\n", 
                  d->d.src, d->d.num, d->d.locn->value);
            }
         }
         else {
            printf("error - could not remove user breakpoint\n");
            d->d.user_b = 1;
            return -1;
         }
      }
   }
   else {
      printf("no user breakpoint at file %d line %d\n", d->d.src, d->d.num);
   }
   return 0;
}


int remove_virtual_brkpt(struct node *d) {
   int tmp;

   if (d == NULL) {
      return 0;
   }
   if (d->d.virt_b == 1) {
      d->d.virt_b = 0;
      if (d->d.user_b == 0) {
         if (blackbox_set_inst(mem_model, d->d.locn->value, d->d.inst, &tmp) == 0) {
            if (diagnose) {
               printf("virtual breakpoint removed, file %d, line %d, addr=0x%X\n",
                  d->d.src, d->d.num, d->d.locn->value);
            }
         }
         else {
            printf("error - could not remove virtual breakpoint\n");
            d->d.virt_b = 1;
            return -1;
         }
      }
   }
   return 0;
}


int remove_any_brkpt(struct node *d) {
   if (d == NULL) {
      return 0;
   }
   if (d->d.user_b == 1) {
      if (remove_user_brkpt(d) != 0) {
        return -1;
      }
   }
   if (d->d.virt_b == 1) {
      if (remove_virtual_brkpt(d) != 0) {
         return -1;
      }
   }
   return 0;
}

int remove_all_brkpts() {
   int src;
   struct node *d;

   for (src = 1; src <= source_count; src++) {
      d = debug_info[src-1];
      while (d != NULL) {
         if (remove_any_brkpt(d) != 0) {
            return -1;
         }
         d = d->next;
      }
   }
   return 0;
}


int remove_virtual_brkpts() {
   int src;
   struct node *d;

   for (src = 1; src <= source_count; src++) {
      d = debug_info[src-1];
      while (d != NULL) {
         if (remove_virtual_brkpt(d) != 0) {
            return -1;
         }
         d = d->next;
      }
   }
   return 0;
}


int add_function_brkpts(struct node *f) {
   struct node *d;

   if (diagnose) {
      if (f != NULL) {
         printf("adding virtual breakpoints to lines within function %s\n", 
            f->f.fname);
      }
      else {
         printf("error - NULL function\n");
         return -1;
      }
   }
   d = debug_info[f->f.src - 1];
   while (d != NULL) {
      if (d->d.func == f) {
         if (add_virtual_brkpt(d) != 0) {
            return -1;
         }
      }
      d = d->next;
   }
   return 0;
}


int has_user_brkpts(struct node *f) {
   struct node *d;

   if (diagnose) {
      if (f != NULL) {
         printf("checking for user breakpoints in function %s\n", 
            f->f.fname);
      }
      else {
         printf("error - NULL function\n");
         return -1;
      }
   }
   d = debug_info[f->f.src - 1];
   while (d != NULL) {
      if ((d->d.func == f) && (d->d.user_b == 1)) {
         return 1;
      }
      d = d->next;
   }
   return 0;
}


int remove_all_function_brkpts(struct node *f) {
   struct node *d;

   if (diagnose) {
      if (f != NULL) {
         printf("removing all breakpoints from lines within function %s\n", 
            f->f.fname);
      }
      else {
         printf("error - NULL function\n");
         return -1;
      }
   }
   d = debug_info[f->f.src - 1];
   while (d != NULL) {
      if (d->d.func == f) {
         if (remove_any_brkpt(d) != 0) {
            return -1;
         }
      }
      d = d->next;
   }
   return 0;
}


int remove_virtual_function_brkpts(struct node *f) {
   struct node *d;

   if (diagnose) {
      if (f != NULL) {
         printf("removing virtual breakpoints from lines within function %s\n", 
            f->f.fname);
      }
      else {
         printf("error - NULL function\n");
         return -1;
      }
   }
   d = debug_info[f->f.src - 1];
   while (d != NULL) {
      if (d->d.func == f) {
         if (remove_virtual_brkpt(d) != 0) {
            return -1;
         }
      }
      d = d->next;
   }
   return 0;
}


int add_external_brkpts(struct node *f) {
   struct node *d;
   int src;

   if (diagnose) {
      if (f != NULL) {
         printf("adding virtual breakpoints to lines outside function %s\n", 
            f->f.fname);
      }
      else {
         printf("error - NULL function\n");
         return -1;
      }
   }
   for (src = 1; src <= source_count; src++) {
      d = debug_info[src-1];
      while (d != NULL) {
         if (d->d.func != f) {
            if (add_virtual_brkpt(d) != 0) {
               return -1;
            }
         }
         d = d->next;
      }
   }
   return 0;
}


int remove_other_brkpts(struct node *f) {
   struct node *d;
   int src;

   if (diagnose) {
      if (f != NULL) {
         printf("removing virtual breakpoints from lines outside function %s\n",
            f->f.fname);
      }
      else {
         printf("error - NULL function\n");
         return -1;
      }
   }
   for (src = 1; src <= source_count; src++) {
      d = debug_info[src-1];
      while (d != NULL) {
         if (d->d.func != f) {
            if (remove_virtual_brkpt(d) != 0) {
               return -1;
            }
         }
         d = d->next;
      }
   }
   return 0;
}


int add_entry_brkpts() {
   int src;
   struct node *d;
   struct node *f;
   struct node *s;

   if (diagnose) {
      printf("adding virtual breakpoints to entries to all functions\n");
   }
   for (src = 1; src <= source_count; src++) {
      if ((s = source_node(src)) != NULL) { 
         f = s->s.functions;
         while (f != NULL) {
            if (f->type == function_t) {
               d = debug_info[src-1];
               while (d != NULL) {
                  if (d->d.func == f) {
                     if (add_virtual_brkpt(d) != 0) {
                        return -1;
                     }
                     break;
                  }
                  d = d->next;
               }
            }
            f = f->next;
         }
      }
   }
   return 0;
}

// remove entry breakpoints except for those in function ff
int remove_entry_brkpts(struct node *ff) {
   int src;
   struct node *d;
   struct node *f;
   struct node *s;

   if (diagnose) {
      printf("removing virtual breakpoints from entries to all functions\n");
   }
   for (src = 1; src <= source_count; src++) {
      if ((s = source_node(src)) != NULL) { 
         f = s->s.functions;
         while ((f != NULL) && (f != ff)) {
            if (f->type == function_t) {
               d = debug_info[src-1];
               while (d != NULL) {
                  if (d->d.func == f) {
                     if (remove_virtual_brkpt(d) != 0) {
                        return -1;
                     }
                     break;
                  }
                  d = d->next;
               }
            }
            f = f->next;
         }
      }
   }
   return 0;
}


// continue - remove all virtual breakpoints (but not user breakpoints), 
//            then continue
void continue_cmd(char *args) {
   unsigned int addr;

   while (isspace(*args)) {
      args++;
   }
   if ((*args != '\0') && (*args != ' ') && (*args != '\n')) {
      printf("unexpected characters after command\n");
      return;
   }
   if (blackbox_address(mem_model, &addr) == 0) {
      if (at_initial_brkpt) {
         remove_virtual_brkpts();
         if (verbose) {
            printf("continuing from initial breakpoint\n");
         }
         if (blackbox_continue(mem_model, NO_OPERATION, &addr) == 0) {
            at_initial_brkpt = 0;
            load_and_list_debug_line(addr);
         }
         else {
            printf("program not responding - it may have exited\n");
         }
      }
      else if (addr != 0) {
         if (find_debug_line_by_addr (addr) != NULL) {
            remove_virtual_brkpts();
            if (verbose) {
               printf("continuing from line %d\n", debugger_line->d.num);
            }     
            if (blackbox_continue(mem_model, debugger_line->d.inst, &addr) == 0) {
               at_initial_brkpt = 0;
               load_and_list_debug_line(addr);
            }
            else {
               printf("program not responding - it may have exited\n");
            }
         }
         else {
            printf("error - location <0x%06X> is not a breakpoint\n", addr);
         }
      }
   }
   else {
      printf("error - no current context\n");
   }
}


// next - remove entry virual breakpoints on all other functions, add
//        virtual breakpoints to the current function, then continue
void next_cmd(char *args) {
   unsigned int addr;

   while (isspace(*args)) {
      args++;
   }
   if ((*args != '\0') && (*args != ' ') && (*args != '\n')) {
      printf("unexpected characters after command\n");
      return;
   }
   if (verbose) {
      printf("Fetching current address, model = %d, CS_OFF=%d\n", mem_model, CS_OFF);
   }
   if (blackbox_address(mem_model, &addr) == 0) {
      if (verbose) {
         printf("current addr = %X\n", addr);
      }
      if (at_initial_brkpt) {
         remove_entry_brkpts(main_line->d.func);
         add_function_brkpts(main_line->d.func);
         if (verbose) {
            printf("step next from initial breakpoint\n");
         }
         if (blackbox_continue(mem_model, NO_OPERATION, &addr) == 0) {
            at_initial_brkpt = 0;
            load_and_list_debug_line(addr);
         }
         else {
            printf("step next failed - program not responding\n");
         }
      }
      else if (addr != 0) {
         if (find_debug_line_by_addr (addr) != NULL) {
            remove_entry_brkpts(debugger_line->d.func);
            add_function_brkpts(debugger_line->d.func);
            if (verbose) {
               printf("step next from line %d\n", debugger_line->d.num);
            }     
            if (blackbox_continue(mem_model, debugger_line->d.inst, &addr) == 0) {
               at_initial_brkpt = 0;
               load_and_list_debug_line(addr);
            }
            else {
               printf("step next failed - program not responding\n");
            }
         }
         else {
            printf("error - location <0x%06X> is not a breakpoint\n", addr);
         }
      }
   }
   else {
      printf("error - no current context\n");
   }
}


// into - add entry breakpoints to all functions, then continue
void into_cmd(char *args) {
   unsigned int addr;

   while (isspace(*args)) {
      args++;
   }
   if ((*args != '\0') && (*args != ' ') && (*args != '\n')) {
      printf("unexpected characters after command\n");
      return;
   }
   if (blackbox_address(mem_model, &addr) == 0) {
      if (at_initial_brkpt) {
         add_entry_brkpts();
         if (verbose) {
            printf("step into from initial breakpoint\n");
         }
         if (blackbox_continue(mem_model, NO_OPERATION, &addr) == 0) {
            at_initial_brkpt = 0;
            load_and_list_debug_line(addr);
#if BLACKCAT_COMPATIBLE == 0
            // once we are in a function, remove all other 
            // entry breakpoints
            remove_entry_brkpts(NULL);
#endif
         }
         else {
            printf("step into failed - program not responding\n");
         }
      }
      else if (addr != 0) {
         if (find_debug_line_by_addr (addr) != NULL) {
            add_entry_brkpts();
            if (verbose) {
               printf("step into from line %d\n", debugger_line->d.num);
            }     
            if (blackbox_continue(mem_model, debugger_line->d.inst, &addr) == 0) {
               at_initial_brkpt = 0;
               load_and_list_debug_line(addr);
#if BLACKCAT_COMPATIBLE == 0
               // once we are in a function, remove all other 
               // entry breakpoints
               remove_entry_brkpts(NULL);
#endif
            }
            else {
               printf("step into failed - program not responding\n");
            }
         }
         else {
            printf("error - location <0x%06X> is not a breakpoint\n", addr);
         }
      }
   }
   else {
      printf("error - no current context\n");
   }
}


// out -  remove virtual breakpoints from current function, then add
//        entry breakpoints to all functions except the current 
//        function, then continue
void out_cmd(char *args) {
   unsigned int addr;

   while (isspace(*args)) {
      args++;
   }
   if ((*args != '\0') && (*args != ' ') && (*args != '\n')) {
      printf("unexpected characters after command\n");
      return;
   }
   if (blackbox_address(mem_model, &addr) == 0) {
      if (at_initial_brkpt) {
         printf("cannot step out from initial breakpoint\n");
      }
      else if (addr != 0) {
         if (find_debug_line_by_addr (addr) != NULL) {
            remove_virtual_function_brkpts(debugger_line->d.func);
            add_entry_brkpts();
            if (verbose) {
               printf("step out from line %d\n", debugger_line->d.num);
            }     
            if (blackbox_continue(mem_model, debugger_line->d.inst, &addr) == 0) {
               at_initial_brkpt = 0;
               load_and_list_debug_line(addr);
#if BLACKCAT_COMPATIBLE == 0
               // once we are out of the function, remove all other 
               // entry breakpoints
               remove_entry_brkpts(NULL);
#endif
            }
            else {
               printf("step out failed - program not responding\n");
            }
         }
         else {
            printf("error - location <0x%06X> is not a breakpoint\n", addr);
         }
      }
   }
   else {
      printf("error - no current context\n");
   }
}


int ok_to_remove_user_brkpts(struct node * f) {
   char command_line[MAX_LINELEN+1] = { '\0' };

   if (has_user_brkpts(f) && (lua_script == NULL)) {
      printf("the current function has one or more user breakpoints set\n");
      printf("\ndelete them before proceeding? ");
      if ((fgets(command_line, MAX_LINELEN, stdin) == NULL)) {
         printf("command error\n");
         return 0;
      }
      else if (tolower(command_line[0]) == 'y') {
         return 1;
      }
      else {
         return 0;
      }
   }
   else {
      return 1;
   }
}


// external -  remove ALL breakpoints from current function, then add
//             virtual breakpoints to all lines except for those in the 
//             current function, then continue
void external_cmd(char *args) {
   unsigned int addr;

   if (blackbox_address(mem_model, &addr) == 0) {
      if (at_initial_brkpt) {
         printf("cannot step external from initial breakpoint\n");
      }
      else if (addr != 0) {
         if (find_debug_line_by_addr (addr) != NULL) {
            if (ok_to_remove_user_brkpts(debugger_line->d.func)) {
               remove_all_function_brkpts(debugger_line->d.func);
            }
            else {
               remove_virtual_function_brkpts(debugger_line->d.func);
            }
            add_external_brkpts(debugger_line->d.func);
            if (verbose) {
               printf("step external from line %d\n", debugger_line->d.num);
            }     
            if (blackbox_continue(mem_model, debugger_line->d.inst, &addr) == 0) {
               at_initial_brkpt = 0;
               load_and_list_debug_line(addr);
            }
            else {
               printf("step external failed - program not responding\n");
            }
         }
         else {
            printf("error - location <0x%06X> is not a breakpoint\n", addr);
         }
      }
   }
   else {
      printf("error - no current context\n");
   }
}


// up  -  remove ALL breakpoints from the current function, then add
//        virtual breakpoints to the function that called the function
//        that built the current frame (if there was one), then continue.
//        If we are at the topmost frame already, do nothing. 
//
//        Note that if -g3 was not used to compile the program, the function
//        that built the current frame may not be the current function!
//
void up_cmd(char *args) {
   struct node *d;
   unsigned int fp;
   unsigned int ret;
   unsigned int addr;

   if (blackbox_address(mem_model, &addr) == 0) {
      if (at_initial_brkpt) {
         printf("cannot step up from initial breakpoint\n");
      }
      else if (addr != 0) {
         if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
            if (fp != 0) {
               if (blackbox_hub_read(fp+4, &ret) == 0) {
                  if (mem_model == 111) {
                     ret &= 0xFFFFFFF; // for P2 NATIVE mode, remove flags
                  }
                  d = find_debug_line_containing_addr (ret + reloc_value - 4);
                  if (d != NULL) {
                     remove_virtual_brkpts();
                     if (ok_to_remove_user_brkpts(debugger_line->d.func)) {
                        remove_all_function_brkpts(debugger_line->d.func);
                     }
                     else {
                        remove_virtual_function_brkpts(debugger_line->d.func);
                     }
                     add_function_brkpts(d->d.func);
                     if (verbose) {
                        printf("step up from line %d\n", 
                           debugger_line->d.num);
                     }     
                     if (blackbox_continue(mem_model, debugger_line->d.inst, &addr) == 0) {
                        at_initial_brkpt = 0;
                        load_and_list_debug_line(addr);
                     }
                     else {
                        printf("step up failed - program not responding\n");
                     }
                  }
                  else {
                     printf("calling function unknown - already at topmost frame?\n");
                  }
               }
               else {
                  printf("error - cannot read frame data\n");
               }
            }
            else {
               // at topmost frame, no NEWF emitted for main() - program
               // must have been compiled wth -g but without -g3
               printf("cannnot step up from topmost frame\n");
            }
         }
         else {
            printf("error - location <0x%06X> is not a breakpoint\n", addr);
         }
      }
   }
   else {
      printf("error - no current context\n");
   }
}


void trace_cmd(char *args) {
   unsigned int addr;
   unsigned int fp;
   unsigned int ret;
   struct node *d;

   while (isspace(*args)) {
      args++;
   }
   if ((*args != '\0') && (*args != ' ') && (*args != '\n')) {
      printf("unexpected characters after command\n");
      return;
   }
   if (blackbox_address(mem_model, &addr) == 0) {
      printf("\nstack trace:\n\n");
      printf("file %d ", debugger_line->d.src);
      load_and_list_debug_line(addr); // print current line first
      if (blackbox_cog_read(mem_model, FP_OFF, &fp) == 0) {
         while (fp != 0) {
            if ((blackbox_hub_read(fp+4, &ret) == 0)
            &&  (blackbox_hub_read(fp, &fp) == 0)) {
               if (mem_model == 111) {
                  ret &= 0xFFFFFF; // for P2 NATIVE, remove flags
               }
               d = find_debug_line_containing_addr(ret + reloc_value - 4);
               if (d != NULL) {
                  printf("file %d ", d->d.src);
                  load_and_list(d->d.src, d->d.num);
               }
            }
         }
         if (verbose) {
            printf("\nend of stack trace\n\n");
            printf("note that functions without a frame ");
            printf("will not appear in the trace - to ensure\n");
            printf("all functions have frames, compile with option -g3\n\n");
         }
      }
   }
   else {
      printf("error - no current context\n");
   }
}


void breakpoint_cmd(char *args) {
   int src;
   int f = current_file - 1;
   int l = current_line;
   int i;
   struct node *d = NULL;
   struct node *p;
   char *tok = NULL;
   char *delim = " \n\t";
   char line[MAX_LINELEN+1] = {'\0'};
   int b_count = 0;

   if (source_handle[f] != NULL) {
      fseek(source_handle[f],0L, SEEK_SET);
      clearerr(source_handle[f]);
      tok = strtok(args, delim);
      if (tok != NULL) {
         if ((!isdigit(*tok) && (source_list[f] != NULL))) {
            d = find_function(tok);
            if (d != NULL) {
               f = d->f.src - 1;
               if (source_file(d->f.src) != NULL) {
                  if (current_file != d->f.src) {
                     current_file = d->f.src;
                     fseek(source_handle[f],0L, SEEK_SET);
                     clearerr(source_handle[f]);
                  }
               }
               else {
                  return;
               }
               if (d->f.lines != NULL) {
                  l = d->f.lines->l.num;
               }
               else {
                  printf("error - function %s (in file %d) has no lines!\n", 
                     tok, d->f.src);
                  if (diagnose) {
                     print_node(d);
                  }
                  l = -1;
               }
            }
            else {
               printf("function %s not found\n", tok);
               l = -1;
            }
         }
         else if (sscanf(tok, "%d", &l) != 1) {
            printf("invalid line specified\n");
         }
      }
      else {
         l = -1;
      }
      if ((l != -1) && (source_handle[f] != NULL)) {
         i = 1;
         while (!feof(source_handle[f]) && (i < l)) {
            fgets(line, MAX_LINELEN, source_handle[f]);
            i++;
         }
         fgets(line, MAX_LINELEN, source_handle[f]);
         if (i < l) {
            printf("file has only %d lines\n", i);
         }
         if (diagnose) {
            printf("setting current line to %d\n", i);
         }
         current_line = i;
      }
   }
   else {
      printf("file %d could not be opened\n", current_file);
   }
   if (l == -1) {
      for (src = 1; src <= source_count; src++) {
         p = debug_info[src-1];
         while (p != NULL) {
            if (p->d.user_b == 1) {
               if (b_count == 0) {
                  printf("\ncurrent user breakpoints:\n");
               }
               printf("file %d line %d\n", src, p->d.num);
               b_count++;
            }
            p = p->next;
         }
      }
      if (b_count == 0) {
         printf("\nno user breakpoints set\n");
      }
   }
   else if (i == l) {
      if (((p = find_debug_line_by_number (f+1, i)) == NULL)
      ||  (p->d.num != current_line)) {
         printf("no code on line %d - cannot add breakpoint\n", i);
      }
      else {
         add_user_brkpt(p);
         d = NULL;
         list_line(f+1, i, line, &d);
      }
   }
}


void delete_cmd(char *args) {
   int i = 0;
   int f = current_file - 1;
   int l = current_line;
   char *tok = NULL;
   char *delim = " \n\t,:-=";
   struct node *d = NULL;
   char line[MAX_LINELEN+1] = {'\0'};
   struct node *p;

   if (source_handle[f] != NULL) {
      fseek(source_handle[f],0L, SEEK_SET);
      clearerr(source_handle[f]);
      tok = strtok(args, delim);
      if (tok != NULL) {
         if (strcmp(tok, "all") == 0) {
            l = -1;
         }
         else if (sscanf(tok, "%d", &l) != 1) {
            printf("no line (or \"all\") specified\n");
         }
      }
      if (l != -1) {
         i = 1;
         while (!feof(source_handle[f]) && (i < l)) {
            fgets(line, MAX_LINELEN, source_handle[f]);
            i++;
         }
         fgets(line, MAX_LINELEN, source_handle[f]);
         if (i < l) {
            printf("file has only %d lines\n", i);
         }
         if (diagnose) {
            printf("setting current line to %d\n", i);
         }
         current_line = i;
      }
   }
   else {
      printf("file %d could not be opened\n", current_file);
   }
   if (l == -1) {
      remove_all_brkpts();
   }
   else if (i == l) {
      if (((p = find_debug_line_by_number (f+1, i)) == NULL)
      ||  (p->d.num != current_line)) {
         printf("no code on line %d - line cannot have breakpoint\n", i);
      }
      else {
         remove_user_brkpt(p);
         list_line(f+1, i, line, &d);
      }
   }
}


void print_memory_model() {
   printf("\nmemory model = %d ", mem_model);
   if (mem_model == 0) {
      printf("(tiny)\n");
   }
   else if (mem_model == 2) {
      printf("(small)\n");
   }
   else if (mem_model == 5) {
      printf("(large)\n");
   }
   else if (mem_model == 8) {
      printf("(compact)\n");
   }
   else if (mem_model == 100) {
      printf("(p2_tiny)\n");
   }
   else if (mem_model == 102) {
      printf("(p2_small)\n");
   }
   else if (mem_model == 105) {
      printf("(p2_large)\n");
   }
   else if (mem_model == 108) {
      printf("(p2_compact)\n");
   }
   else if (mem_model == 111) {
      printf("(p2_native)\n");
   }
   else {
      printf("(unknown)\n");
   }
}


void mode_cmd(char *args) {
   char *tok = NULL;
   char *delim = " \n\t,:-=";
   int  i;
   int  new_port = 0;
   int  new_baud = DEFAULT_BAUDRATE;
   int  actual_model = -1;
   int nak;
   int bel;

   tok = strtok(args, delim);
   if ((tok != NULL) && (sscanf(tok, "%d", &new_port) == 1)) {
      tok = strtok(NULL, delim);
      if (tok != NULL) {
         if (sscanf(tok, "%d", &new_baud) != 1) {
            new_baud = DEFAULT_BAUDRATE;
         }
      }
   }
   else {
      print_memory_model();
      printf("relocation offset   = %d (0x%X)\n", reloc_value, reloc_value);
      printf("code segment offset = %d (0x%X)\n", cs_value, cs_value);

      if (port > 0) {
         printf("port = %d\n", port);
         printf("baud = %d\n", baud);
         nak = 0;
         bel = 0;
         if (blackbox_statistics(&nak, &bel) == 0) {
            printf("nak count = %d\nbel count = %d\n", nak, bel);
         }
         else {
            printf("cannot read statistics\n");
         }
      }
      else {
         printf("no comm port open - specify port and baudrate\n");
         printf("\nport can be:\n");
         for (i = 0; i < ComportCount(); i++) {
            printf("  %s%d = %s\n", (i < 9 ? " " : ""), i+1, ShortportName(i));
         }
         printf("\n");
      }
      return;
   }

   if ((new_port < 1) || (new_port > ComportCount())) {
      printf("error - port must be between 1 and %d\n", ComportCount());
   }
   else {
      printf("using port %d\n", new_port);
   }
   if ((new_baud < MIN_BAUDRATE) || (new_baud > MAX_BAUDRATE)) {
      printf("error - baudrate must be in the range %d to %d\n", 
         MIN_BAUDRATE, MAX_BAUDRATE);
      return;
   }
   else {
      printf("using baudrate %d\n", new_baud);
   }

   if ((port != new_port) || (baud != new_baud)) {
      if (blackbox_open(new_port, new_baud, my_timeout) != 0) {
         printf("failed to open port %d\n", new_port); 
         new_port = 0;
      }
      if ((port == 0) && (new_port != 0)) {
         // check memory model
         actual_model = blackbox_model();
         if (mem_model == -1) {
            mem_model = actual_model;
         }
         else if (actual_model == -1) {
            printf("warning - cannot determine memory model\n");
         }
         else if (actual_model != mem_model) {
            printf("warning - memory model mismatch (%d vs %d)\n", 
               mem_model, actual_model);
         }
         set_up_model(mem_model);
         if (CS_OFF >= 0) {
            // get code segment offset
            if (blackbox_cog_read(mem_model, CS_OFF, &cs_value) != 0) {
              printf("\ncommunications error - check port and baudrate, and that\n");
              printf("the binary program loaded was compiled with -g or -g3\n\n");
              return;
            }     
            else {
               if (verbose) {
                  printf("Got CS value 0x%X from offset 0x%2X\n", cs_value, CS_OFF);
               }
            }
         }
         else {
            cs_value = 0;
         }
         if (mem_model == actual_model) {
            // set up initial breakpoints
            if (verbose) {
               printf("setting up virtual breakpoints\n");
            }
            add_function_brkpts(debugger_line->d.func);
         }
         print_memory_model();
         printf("relocation offset   = %d (0x%X)\n", reloc_value, reloc_value);
         printf("code segment offset = %d (0x%X)\n", cs_value, cs_value);
         nak = 0;
         bel = 0;
         if (blackbox_statistics(&nak, &bel) == 0) {
            printf("nak count = %d\nbel count = %d\n", nak, bel);
         }
         else {
            printf("cannot read statistics\n");
         }
      }
      port = new_port;
   }
   else {
      print_memory_model();
      printf("relocation offset   = %d (0x%X)\n", reloc_value, reloc_value);
      printf("code segment offset = %d (0x%X)\n", cs_value, cs_value);
      nak = 0;
      bel = 0;
      if (blackbox_statistics(&nak, &bel) == 0) {
         printf("nak count = %d\nbel count = %d\n", nak, bel);
      }
      else {
         printf("cannot read statistics\n");
      }
   }
}


void xmm_cmd(char *args) {
   char *tok = NULL;
   char *delim = " \n\t,:=";
   int  actual_model = -1;

   tok = strtok(args, delim);
   if (tok != NULL) {
      if ((isdigit(*tok) && (sscanf(tok, "%d", &mem_model) == 1))) {
         if ((mem_model != 0)
         &&  (mem_model != 2) 
         &&  (mem_model != 5)
         &&  (mem_model != 8)
         &&  (mem_model != 100)
         &&  (mem_model != 102)
         &&  (mem_model != 105)
         &&  (mem_model != 108)
         &&  (mem_model != 111)) {
            printf("invalid mode specified\n"); 
            mem_model = 0;
         }
      }
      else if (strcmp_i(tok, "tiny") == 0) {
         mem_model = 0;
      }
      else if (strcmp_i(tok, "small") == 0) {
         mem_model = 2;
      }
      else if (strcmp_i(tok, "large") == 0) {
         mem_model = 5;
      }
      else if (strcmp_i(tok, "compact") == 0) {
         mem_model = 8;
      }
      else if (strcmp_i(tok, "p2_tiny") == 0) {
         mem_model = 0;
      }
      else if (strcmp_i(tok, "p2_small") == 0) {
         mem_model = 102;
      }
      else if (strcmp_i(tok, "p2_large") == 0) {
         mem_model = 105;
      }
      else if (strcmp_i(tok, "p2_compact") == 0) {
         mem_model = 108;
      }
      else if (strcmp_i(tok, "p2_native") == 0) {
         mem_model = 111;
      }
      else {
         printf("invalid mode specified\n"); 
         mem_model = 0;
      }
   }

   printf("\nmemory model = %d ", mem_model);
   if (mem_model == 0) {
      printf("(tiny)\n");
   }
   else if (mem_model == 2) {
      printf("(small)\n");
   }
   else if (mem_model == 5) {
      printf("(large)\n");
   }
   else if (mem_model == 8) {
      printf("(compact)\n");
   }
   else if (mem_model == 100) {
      printf("(p2_tiny)\n");
   }
   else if (mem_model == 102) {
      printf("(p2_small)\n");
   }
   else if (mem_model == 105) {
      printf("(p2_large)\n");
   }
   else if (mem_model == 108) {
      printf("(p2_compact)\n");
   }
   else if (mem_model == 111) {
      printf("(p2_native)\n");
   }
   else {
      printf("(unknown)\n");
   }

   if (port > 0) {
      // check memory model
      actual_model = blackbox_model();
      if (mem_model == -1) {
         mem_model = actual_model;
      }
      else if (actual_model == -1) {
         printf("warning - cannot determine memory model\n");
      }
      else if (actual_model != mem_model) {
         printf("warning - memory model mismatch (%d vs %d)\n", 
               mem_model, actual_model);
      }
   }
   set_up_model(mem_model);
}


void step_cmd(char *args) {
   int len2;
   char *tok = NULL;
   char *delim = " \n\t,:-=";

   tok = strtok(args, delim);
   if (tok != NULL) {
      if ((len2 = is_command(tok, "next", 1))) {
         next_cmd (args + (tok - args) + len2);
      }
      else if ((len2 = is_command(tok, "into", 1))) {
         into_cmd (args + (tok - args) + len2);
      }
      else if ((len2 = is_command(tok, "out", 1))) {
         out_cmd (args + (tok - args) + len2);
      }
      else if ((len2 = is_command(tok, "up", 1))) {
         up_cmd (args + (tok - args) + len2);
      }
      else if ((len2 = is_command(tok, "external", 1))) {
         external_cmd (args + (tok - args) + len2);
      }
      else {
         printf("invalid step command\n");
      }
   }
   else {
      next_cmd (args);
   }
}


void verbose_cmd(char *args) {
   int i;
   char *tok = NULL;
   char *delim = " \n\t,:-=";

   tok = strtok(args, delim);
   if (tok != NULL) {
      if ((i = is_command(tok, "off", 2))) {
         verbose = 0;
         diagnose = 0;
      }
      else if ((i = is_command(tok, "on", 2))) {
         verbose = 1;
         diagnose = 0;
      }
      else if ((i = is_command(tok, "d1", 2))) {
         printf("diagnose mode 1\n");
         verbose = 1;
         diagnose = 1;
      }
      else if ((i = is_command(tok, "d2", 2))) {
         printf("diagnose mode 2\n");
         verbose = 1;
         diagnose = 2;
      }
      else if ((i = is_command(tok, "d3", 3))) {
         printf("diagnose mode 3\n");
         verbose = 1;
         diagnose = 3;
      }
   }
   if (verbose == 0) {
      printf("verbose mode is off\n");
   }
   else {
      printf("verbose mode is on\n");
   }   
}

int continue_or_exit() {
   char ch;

   printf("\nContinue (Y/n)? ");
   ch = getchar();
   printf("\n");
   if (tolower(ch) == 'n') {
      return 0;
   }
   return 1;
}

void help_cmd(char *args) {

   printf("\nCatalina BlackBox Debugger %s\n", VERSION); 
   printf("\n");
   printf("breakpoint [fname | line]   - show/set breakpoint at function or line\n");
   printf("continue                    - continue to next user breakpoint\n");
   printf("delete [line | all]         - delete breakpoint from line or all lines\n");
   printf("exit (or quit)              - terminate program\n");
   printf("file [filenum [linenum] ]   - show/set listing and debug file and line\n");
   printf("go                          - go to next user breakpoint (same as continue)\n");
   printf("help (or ?)                 - print this help\n");
   printf("into                        - step into functions in current line\n");
   printf("list .                      - list current debug line\n");
   printf("list fname                  - list the named function\n");
   printf("list [line [ [-] line] ]    - list source line(s) in current file\n");
   printf("mode [port [baud] ]         - display memory mode, or set port and baud rate\n");
   printf("next                        - step to the next line\n");
   printf("out                         - step out of the current function\n");
   printf("print varname               - print the value of the named variable\n");
   if (continue_or_exit() == 0) {
      printf("\n");
      return;
   }
   printf("read location [ count ]     - read register, cog, hub or xmm RAM locations\n");
   printf("step [next | into | out]    - same as next, into or out commands\n");
   printf("step external               - step to any line outside the current function\n");
   printf("step up                     - step up (to function with previous frame)\n");
   printf("trace                       - display stack frame trace\n");
   printf("update varname [=] value    - set the named variable to the value\n");
   printf("verbose [off | on]          - show/set verbose mode (print more detail)\n");
   printf("write location [=] value    - write reg, cog, hub or xmm RAM location\n");
   printf("xmm [tiny | small | large]  - set memory mode\n");
   printf(".                           - repeat last command\n");
   if (continue_or_exit() == 0) {
      printf("\n");
      return;
   }
   printf("NOTES:\n\n");
   printf("  - All commands can be abbreviated (e.g. l for list, s u for step up)\n");
   printf("\n");
   printf("  - A location can be a register (e.g. SP, FP, R1 .. R23 etc) or\n");
   printf("    a reference to cog, hub or xmm RAM (e.g cog 0x100 or hub 0x6000)\n");
   printf("    or as &variable or &function. As a special case, if a variable is\n");
   printf("    a pointer type, it can be used directly in a read hub command. E.g:\n\n");
   printf("       read hub my_pointer\n");
   printf("\n");
   printf("  - A value can be decimal (dddd), hex (0xHHHH or $HHHH) or char ('c')\n");
   printf("    A size of byte, word or long can also be included (default is long)\n");
   printf("    For example, a completely specified write command might look like:\n\n");
   printf("       write hub 0x6fff = byte \'\\n\'\n");
   if (continue_or_exit() == 0) {
      printf("\n");
      return;
   }
   printf("  - When listed, each line may be preceeded with special characters:\n");
   printf("     ' ' (i.e. blank - no code has been generated for this line)\n");
   printf("     '-' (a breakpoint can be placed on this line)\n");
   printf("     '+' (a virtual breakpoint exists on this line)\n");
   printf("     '*' (a user breakpoint exists on this line)\n");
   printf("     '@' (the program is currently stopped at this line)\n");
   printf("\n");
}

char command_line[MAX_LINELEN+1] = { '\0' };
char last_command[MAX_LINELEN+1] = { '\0' };
int  len = 0;
int  last_len = 0;
int  save = 0;

int process_one_command(int confirm_exit_command) {
   int exit_confirmed = 0;
   char *command = command_line;

   while (*command == ' ') {
      command++;
   }
   if ((len = is_command(command,".",1))) {
      save = 0;
      if (last_len == 0) {
         printf("no previous command to repeat\n");
         return 0;
      }
      else {
         len = last_len;
         strncpy(command, last_command, MAX_LINELEN);
      }
   }
   else {
      save = 1;
   }
   if ((len = is_command(command,"breakpoint",1))) {
      breakpoint_cmd(command+len);
   }
   else if ((len = is_command(command,"continue",1))
   ||  (len = is_command(command,"go",1))) {
      continue_cmd(command+len);
   }
   else if ((len = is_command(command,"delete",1))) {
      delete_cmd(command+len);
   }
   else if ((len = is_command(command,"exit",1))
   ||  (len = is_command(command,"quit",1))) {
      if (confirm_exit_command) {
         printf("\nare you sure you want to exit? ");
         if ((fgets(command, MAX_LINELEN, stdin) == NULL)) {
            printf("command error\n");
            command[0]='\0';
         }
         else if (tolower(command[0]) == 'y') {
            exit_confirmed =1;
         }
      }
      else {
         exit_confirmed = 1;
      }
      if (exit_confirmed) {
         remove_all_brkpts();
         if (at_initial_brkpt) {
            if (blackbox_go(mem_model, NO_OPERATION) != 0) {
               printf("program not responding - it may have exited\n");
            }
         }
         else {
            if (blackbox_go(mem_model, debugger_line->d.inst) != 0) {
               printf("program not responding - it may have exited\n");
            }
         }
         return -1;
      }
   }
   else if ((len = is_command(command,"file",1))) {
      file_cmd(command+len);
   }
   else if ((len = is_command(command,"help",1))) {
      help_cmd(command+len);
   }
   else if ((len = is_command(command,"?",1))) {
      help_cmd(command+len);
   }
   else if ((len = is_command(command,"into",1))) {
      into_cmd(command+len);
   }
   else if ((len = is_command(command,"list",1))) {
      list_cmd(command+len);
   }
   else if ((len = is_command(command,"mode",1))) {
      mode_cmd(command+len);
   }
   else if ((len = is_command(command,"next",1))) {
      next_cmd(command+len);
   }
   else if ((len = is_command(command,"out",1))) {
      out_cmd(command+len);
   }
   else if ((len = is_command(command,"print",1))) {
      print_cmd(command+len);
   }
   else if ((len = is_command(command,"read",1))) {
      read_cmd(command+len);
   }
   else if ((len = is_command(command,"step",1))) {
      step_cmd(command+len);
   }
   else if ((len = is_command(command,"trace",1))) {
      trace_cmd(command+len);
   }
   else if ((len = is_command(command,"update",1))) {
      update_cmd(command+len);
   }
   else if ((len = is_command(command,"write",1))) {
      write_cmd(command+len);
   }
   else if ((len = is_command(command,"verbose",1))) {
      verbose_cmd(command+len);
   }
   else if ((len = is_command(command,"xmm",1))) {
      xmm_cmd(command+len);
   }
   else {
      printf("unknown command - type ? for help\n");
   }
   if (save) {
      strncpy(last_command, command, MAX_LINELEN);
      last_len = len;
   }
   return 0;
}

void process_commands() {

   do {
      do {
         printf("> ");
         if ((fgets(command_line, MAX_LINELEN, stdin) == NULL)) {
            printf("command error\n");
            command_line[0]='\0';
         }
         else if ((len = strlen(command_line)) > 0) {
            if (command_line[len-1] == '\n') {
               command_line[len-1]='\0';
               len--;
            }
         }
      } while (len == 0);
      
   } while (process_one_command(1) >= 0);
}


int alldigits(char *str) {
   int len = strlen(str);
   int i;

   for (i = 0; i < len; i++) {
      if (!isdigit(str[i])) {
         return 0;
      }
   }
   return 1;
}

/******************
 * MAIN FUNCTIONS *
 ******************/


void help(char *my_name) {
   int i;

  fprintf(stderr, "usage: %s [options] filename[.dbg]\n\n", my_name);
  fprintf(stderr, "options:  -? or -h  print this helpful message and exit (-v -h for more help)\n");
  fprintf(stderr, "          -a port   find propeller port automatically, starting at port\n");
  fprintf(stderr, "          -b baud   baudrate to use\n");
  fprintf(stderr, "          -d        diagnostic mode (-d again for even more diagnostics)\n");
  fprintf(stderr, "          -L name   execute the named Lua script after opening the port\n");
  fprintf(stderr, "          -p port   port to use\n");
  fprintf(stderr, "          -t msec   timeout to use when opening port (default is %d msec)\n", DEFAULT_TIMEOUT);
  fprintf(stderr, "          -v        verbose mode (and include port numbers in help message)\n");
  fprintf(stderr, "          -x model  memory model (0 or tiny, 2 or small, 5 or large)\n");
   if (verbose) {
     fprintf(stderr, "\nport can be:\n");
      for (i = 0; i < ComportCount(); i++) {
        fprintf(stderr, "          %s%d = %s\n", (i < 9 ? " " : ""), i + 1, ShortportName(i));
      }
   }
}


/*
 * decode arguments, building file and library list - return -1 if
 * there is no further processing to do
 */
int decode_arguments (int argc, char *argv[]) {
   char   primary_portname[MAX_LINELEN + 3 + 1];
   int    code = 0;
   int    i = 0;

   if (argc == 1) {
      if (strlen(argv[0]) == 0) {
         // in case my name was not passed in ...
         help("blackbox");
      }
      else {
         help(argv[0]);
      }
      code = -1;
   }
   while ((code >= 0) && (argc--)) {
      if (diagnose) {
        fprintf(stderr, "arg: %s\n", argv[i]);
      }
      if (i > 0) {
         if (argv[i][0] == '-') {
            if (diagnose) {
              fprintf(stderr, "switch: %s\n", argv[i]);
            }
            // it's a command line switch
            switch (argv[i][1]) {
               case 'h':
               case '?':
                  if (strlen(argv[0]) == 0) {
                     // in case my name was not passed in ...
                     help("bind");
                  }
                  else {
                     help(argv[0]);
                  }
                  code = -1;
                  break;
               case 'a':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &auto_port);
                     }
                     else {
                        fprintf(stderr, "Option -a requires a parameter\n");
                        code = -1;
                        break;
                     }
                     argc--;
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &auto_port);
                  }
                  if (port != 0) {
                     fprintf(stderr, "Option -p overrides -a (-a ignored)\n");
                  }
                  else {
                     if ((auto_port < 1) || (auto_port > ComportCount())) {
                        fprintf(stderr, "Error: auto port must be between 1 and %d\n", ComportCount());
                        code = -1;
                        auto_port = 0;
                     }
                     else {
                        if (verbose) {
                           fprintf(stderr, "auto mode will start at port %s\n", ShortportName(auto_port-1));
                        }
                     }
                  }
                  break;
               case 'b':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &baud);
                     }
                     else {
                       fprintf(stderr, "Option -b requires a parameter\n");
                        code = -1;
                        break;
                     }
                     argc--;
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &baud);
                  }
                  if ((baud < MIN_BAUDRATE) || (baud > MAX_BAUDRATE)) {
                    fprintf(stderr, "error - baudrate must be in the range %d to %d\n", 
                        MIN_BAUDRATE, MAX_BAUDRATE);
                  }
                  else {
                     if (verbose) {
                       fprintf(stderr, "using baudrate %d\n", baud);
                     }
                  }
                  break;
               case 'd':
                  diagnose++;   /* increase diagnosis level */
                  verbose = 1;   /* diagnose implies verbose */
                 fprintf(stderr, "diagnostic level %d\n", diagnose);
                  break;
               case 'L':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        lua_script = strdup(argv[++i]);
                        if (verbose) {
                           fprintf(stderr, "Lua script = %s\n", lua_script);
                        }
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -L requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     lua_script = strdup(&argv[i][2]);
                     if (verbose) {
                        fprintf(stderr, "Lua script = %s\n", lua_script);
                     }
                  }
                  break;
               case 'p':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        if (alldigits(argv[++i])) {
                           sscanf(argv[i], "%d", &port);
                        }
                        else {
                           sscanf(argv[i],"%s", primary_portname);
                           if (verbose) {
                              fprintf(stderr, "setting port name %s\n", primary_portname);
                           }
                           port = SetComportName(primary_portname, 0);
                        }
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -p requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     if (alldigits(&argv[i][2])) {
                        sscanf(&argv[i][2], "%d", &port);
                     }
                     else {
                        sscanf(&argv[i][2],"%s", primary_portname);
                        if (verbose) {
                           fprintf(stderr, "setting port name %s\n", primary_portname);
                        }
                        port = SetComportName(primary_portname, 0);
                     }
                  }
                  if ((port < 1) || (port > ComportCount())) {
                    fprintf(stderr, "error - port must be between 1 and %d\n",
                        ComportCount());
                     code = -1;
                  }
                  else {
                     if ((auto_port > 1) && verbose) {
                        fprintf(stderr, "Option -p overrides -a\n");
                     }
                     auto_port = 0;
                     if (verbose) {
                        fprintf(stderr, "using port %s\n", ShortportName(port-1));
                     }
                  }
                  break;
               case 't':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &my_timeout);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -t requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &my_timeout);
                  }
                  if ((my_timeout < 1) || (my_timeout > MAX_TIMEOUT)) {
                     fprintf(stderr, "Error: timeout must be in the range 1 to %d\n", MAX_TIMEOUT);
                     code = -1;
                  }
                  else {
                     if (verbose) {
                        fprintf(stderr, "using timeout %d\n", my_timeout);
                     }
                  }
                  break;
               case 'v':
                  verbose = 1;
                 fprintf(stderr, "verbose mode\n");
                  break;
               case 'x':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        i++;
                        if (strcmp_i(argv[i], "tiny") == 0) {
                           mem_model = 0;
                        }
                        else if (strcmp_i(argv[i], "small") == 0) {
                           mem_model = 2;
                        }
                        else if (strcmp_i(argv[i], "large") == 0) {
                           mem_model = 5;
                        }
                        else if (strcmp_i(argv[i], "compact") == 0) {
                           mem_model = 8;
                        }
                        else if (strcmp_i(argv[i], "p2_tiny") == 0) {
                           mem_model = 100;
                        }
                        else if (strcmp_i(argv[i], "p2_small") == 0) {
                           mem_model = 102;
                        }
                        else if (strcmp_i(argv[i], "p2_large") == 0) {
                           mem_model = 105;
                        }
                        else if (strcmp_i(argv[i], "p2_compact") == 0) {
                           mem_model = 108;
                        }
                        else if (strcmp_i(argv[i], "p2_native") == 0) {
                           mem_model = 111;
                        }
                        else {
                           sscanf(argv[i], "%d", &mem_model);
                        }
                     }
                     else {
                       fprintf(stderr, "Option -x requires a parameter\n");
                        code = -1;
                     }
                     argc--;
                  }
                  else {
                     // use remainder of this arg
                     if (strcmp_i(&argv[i][2], "tiny") == 0) {
                        mem_model = 0;
                     }
                     else if (strcmp_i(&argv[i][2], "small") == 0) {
                        mem_model = 2;
                     }
                     else if (strcmp_i(&argv[i][2], "large") == 0) {
                        mem_model = 5;
                     }
                     else if (strcmp_i(&argv[i][2], "compact") == 0) {
                        mem_model = 8;
                     }
                     else if (strcmp_i(&argv[i][2], "p2_tiny") == 0) {
                        mem_model = 100;
                     }
                     else if (strcmp_i(&argv[i][2], "p2_small") == 0) {
                        mem_model = 102;
                     }
                     else if (strcmp_i(&argv[i][2], "p2_large") == 0) {
                        mem_model = 105;
                     }
                     else if (strcmp_i(&argv[i][2], "p2_compact") == 0) {
                        mem_model = 108;
                     }
                     else if (strcmp_i(&argv[i][2], "p2_native") == 0) {
                        mem_model = 111;
                     }
                     else {
                        sscanf(&argv[i][2], "%d", &mem_model);
                     }
                  }
                  if ((mem_model != 0)
                  &&  (mem_model != 2) 
                  &&  (mem_model != 5)
                  &&  (mem_model != 8)
                  &&  (mem_model != 100)
                  &&  (mem_model != 102) 
                  &&  (mem_model != 105)
                  &&  (mem_model != 108)
                  &&  (mem_model != 111)) {
                    fprintf(stderr, "invalid mode specified\n"); 
                     mem_model = 0;
                     code = -1;
                  }
                  break;

               default:
                 fprintf(stderr, "unrecognized switch: %s\n", argv[i]);
                  code = -1; // force exit without further processing
                  break;
            }
         }
         else {
            // assume its a filename
            if (file_count < MAX_DBG_FILES) {
               file_name[file_count++] = strdup(argv[i]);
               code = 1; // work to do
            }
            else {
              fprintf(stderr, "too many input files specified\n");
               code = -1; // force exit
            }
         }
      }
      i++; // next argument
   }
   if (diagnose) {
     fprintf(stderr, "executable name = %s\n", argv[0]);
   }
   if ((file_count == 0) && (code != -1)) {
     fprintf(stderr, "no input file specified\n");
      code = -1;
   }

   return code;

}


/* Functions that can be called from the lua script */

// delay(msec);
static int lua_delay(lua_State *L) {
   /* get number of arguments */
   int n = lua_gettop(L);
   long msec;

   if ((n != 1) || !lua_isnumber(L, 1)) {
      lua_pushstring(L, "Incorrect arguments to 'delay'");
      lua_error(L);
   }
   msec = lua_tonumber(L, 1);
   mdelay(msec);
}

// send(string ...);
static int lua_send(lua_State *L) {
   /* get number of arguments */
   int n = lua_gettop(L);
   char *command;
   int len;
   int i;
   int j;
   
   /* loop through each argument */
   for (i = 1; i <= n; i++) {
      if (!lua_isstring(L, i)) {
         lua_pushstring(L, "Incorrect argument to 'send'");
         lua_error(L);
      }
      command = (char *)lua_tostring(L, i);
      len = strlen(command);
      if (len > MAX_LINELEN) {
         len = MAX_LINELEN;
      }
      for (j = 0; j < len; j++) {
         command_line[j] = command[j];
      }
      command_line[j]='\0';
      process_one_command(0);
   }
   
   /* return the number of results */
   return 0;
}

// clear();
static int lua_clear(lua_State *L) {
   /* get number of arguments */
   int n = lua_gettop(L);
   char *command;
   int len;
   int i;
   int j;
   
   if (n > 0) {
      lua_pushstring(L, "Incorrect arguments to 'clear'");
      lua_error(L);
   }
   pc_head = 0;
   pc_tail = 0;
   /* return the number of results */
   return 0;
}

// result = receive(count, timeout, termchar);
static int lua_receive(lua_State *L) {
   /* get number of arguments */
   int n = lua_gettop(L);
   int i = 0;
   int count = MAX_LINELEN;
   long timeout = LUA_TIMEOUT;
   char str[MAX_LINELEN + 1];
   char *termstr = NULL;
   char termchar = '\n';

   if (n > 3) {
      lua_pushstring(L, "Incorrect arguments to 'receive'");
      lua_error(L);
   }
   if (n > 2) {
      if (!lua_isstring(L, 3)) {
         lua_pushstring(L, "Incorrect arguments to 'receive'");
         lua_error(L);
      }
      else {
         termstr = (char *)lua_tostring(L, 3);
         if (strlen(termstr) > 0) {
            termchar = *termstr;
         }
         else {
            termchar = '\0';
         }
      }
   }
   if (n > 1) {
      if (!lua_isnumber(L, 2)) {
         lua_pushstring(L, "Incorrect arguments to 'receive'");
         lua_error(L);
      }
      else {
         timeout = lua_tonumber(L, 2);
         if (timeout <= 0) {
            timeout = LUA_TIMEOUT;
         }
      }
   }
   if (n > 0) {
      if (!lua_isnumber(L, 1)) {
         lua_pushstring(L, "Incorrect arguments to 'receive'");
         lua_error(L);
      }
      else {
         count = lua_tonumber(L, 1);
         if ((count < 1)|| (count > MAX_LINELEN)) {
            count = MAX_LINELEN;
         }
      }
   }
   while (1) {
      if (CharReady()) {
        str[i++] = (char)ReceiveChar();
        if (i >= count) {
           break;
        }
        if (str[i-1] == termchar) {
           break;
        }
      }
      else {
         mdelay(10);
         if (timeout > 0) {
            timeout -= 10;
            if (timeout <= 0) {
               break;
            }
         }
      }
   }
   str[i] = '\0';

   lua_pushstring(L, str);
   /* return the number of results */
   return 1;
}


// result = wait_for(prompt, timeout);
static int lua_wait_for(lua_State *L) {
   /* get number of arguments */
   int n = lua_gettop(L);
   int i = 0;
   int j = 0;
   int len;
   long timeout = LUA_TIMEOUT;
   char *prompt = NULL;
   char str[MAX_LINELEN + 1];

   if (n > 2) {
      lua_pushstring(L, "Incorrect arguments to 'wait_for'");
      lua_error(L);
   }
   if (n > 1) {
      if (!lua_isnumber(L, 2)) {
         lua_pushstring(L, "Incorrect arguments to 'receive'");
         lua_error(L);
      }
      else {
         timeout = lua_tonumber(L, 2);
         if (timeout <= 0) {
            timeout = LUA_TIMEOUT;
         }
      }
   }
   if ((n < 1) || (!lua_isstring(L, 1))) {
      lua_pushstring(L, "Incorrect arguments to 'receive'");
      lua_error(L);
   }
   prompt = (char *)lua_tostring(L, 1);
   len = strlen(prompt);
   if (len > MAX_LINELEN) {
      len = MAX_LINELEN;
   }
   while (1) {
      if (CharReady()) {
        str[i++] = (char)ReceiveChar();
        str[i]='\0';
        if (len == 0) {
           break;
        }
        if (i > len) {
           for (j = 0; j <= len; j++) {
              str[j] = str[j + 1];
           }
           i--;
        }
        if (i == len) {
           if (strcmp(prompt, str) == 0) {
              break;
           }
        }
      }
      else {
         mdelay(10);
         if (timeout > 0) {
            timeout -= 10;
            if (timeout <= 0) {
               break;
            }
         }
      }
   }
   str[i] = '\0';

   lua_pushstring(L, str);
   /* return the number of results */
   return 1;
}


static int lua_report (lua_State *L, int status) {
  if (status && !lua_isnil(L, -1)) {
    const char *msg = lua_tostring(L, -1);
    if (msg == NULL) msg = "(error object is not a string)";
    fprintf(stderr, "Lua: %s\n", msg);
    fflush(stderr);
    lua_pop(L, 1);
  }
  return status;
}


int main (int argc, char *argv[]) {
   int src;
   int res;
   int line;
   int yyresult;
   int actual_model;
   struct node *f = NULL;
   char full_name[MAX_LINELEN+1] = { '\0' };
   int len;
   int lua_status;
   char *str;
   char portname[MAX_LINELEN + 3 + 1];

   str = getenv(BLACKBOX_PORT);
   if (str != NULL) {
      if (alldigits(str)) {
         sscanf(str, "%d", &port);
         if ((port < 1)||(port > ComportCount())) {
            fprintf(stderr, "%s specifies invalid_port %d\n", BLACKBOX_PORT, port);
         }
         else {
            auto_port = 0;
         }
      }
      else {
          sscanf(str,"%s", portname);
          if (verbose) {
             fprintf(stderr, "setting port name %s\n", portname);
          }
          port = SetComportName(portname, 0);
          auto_port = 0;
      }
      if (diagnose) {
         fprintf(stderr, "port=%d\n", port);
      }
   }


   fprintf(stderr, "Catalina BlackBox Debugger %s\n\n", VERSION); 
   if (decode_arguments(argc, argv) <= 0) {
      if (diagnose) {
         printf("%s exiting\n", argv[0]);
      }
      exit(0);
   }

   signal(SIGINT, handler);
   
   safecpy(full_name, file_name[0], MAX_LINELEN);
   len = strlen(full_name); 
   if ((len > 7) && (strcmp(&full_name[len-7], ".binary") == 0)) {
      full_name[len-7]='\0';
   }
   if ((len > 7) && (strcmp(&full_name[len-7], ".eeprom") == 0)) {
      full_name[len-7]='\0';
   }
   if ((len > 4) && (strcmp(&full_name[len-4], ".bin") == 0)) {
      full_name[len-4]='\0';
   }

   if (strstr(full_name, ".dbg") == NULL) {
      safecat(full_name, ".dbg", MAX_LINELEN);
   }
   if ((yyin = fopen(full_name, "r")) == NULL) {
      fprintf(stderr, "error - cannnot open dbg file \"%s\"\n", full_name);
      return -1;
   }  
   else {

      yyresult = yyparse ();
      if (yyresult != 0) {
         exit(-1);
      }
      if (diagnose >= 3) {
         printf("\nparsed list:\n\n");
         print_list (node_list);
      }

      if (diagnose) {
         printf("\nRELOC %0X\n", reloc_value);
      }
      process_sources (node_list);
      for (src = 1; src <= source_count; src++) {
         process_functions (src);
         if (diagnose) {
            printf("\nFILE %d:\n", src);
            print_list (source_list[src-1]);
         }
         process_lines (src);
         if (diagnose) {
            printf("\nLINES %d:\n", src);
            print_debug_line (debug_info[src-1]);
         }
      }

      if (auto_port) {
         port = auto_port;
         while (port <= ComportCount()) {
            if (verbose) {
               fprintf(stderr, "Trying port %s\n", ShortportName(port-1));
            }
            res = blackbox_open(port, baud, my_timeout);
            if (res == 0) {
               if (diagnose) {
                  fprintf(stderr, "opened port %s\n", ShortportName(port-1));
               }
               // try and get memory model
               actual_model = blackbox_model();
               if ((actual_model != -1) && (mem_model == -1)) {
                  mem_model = actual_model;
               }
               set_up_model(mem_model);
               if (CS_OFF >= 0) {
                  if ((actual_model != -1) 
                  && (blackbox_cog_read(mem_model, CS_OFF, &cs_value) == 0)) {
                     if (verbose) {
                       printf("Got CS value 0x%X from offset 0x%2X\n", cs_value, CS_OFF);
                     }
                     printf("Debug program found on port %s\n", ShortportName(port-1));
                     break;
                  }
                  else {
                     blackbox_close(port);
                     res = -1;
                  }
               }
               else {
                  cs_value = 0;
                  break;
               }
            }
            else {
               blackbox_close(port);
               res = -1;
            }
            if (verbose) {
               fprintf(stderr, "No response on port %s\n", ShortportName(port-1));
            }
            port++;
         }
         if (res != 0) {
            printf("No response to the debugger on any port - check that the\n");
            printf("binary program loaded was compiled with -g or -g3\n\n");
            exit(1);
         }
      }
      else {
         if (port > 0) {
            if (blackbox_open(port, baud, my_timeout) == 0) {
               // try and get memory model
               actual_model = blackbox_model();
               if ((actual_model != -1) && (mem_model == -1)) {
                  mem_model = actual_model;
               }
               set_up_model(mem_model);
               if (CS_OFF >= 0) {
                  if ((actual_model != -1) 
                  && (blackbox_cog_read(mem_model, CS_OFF, &cs_value) == 0)) {
                     if (verbose) {
                        printf("Got CS value 0x%X from offset 0x%2X\n", cs_value, CS_OFF);
                     }
                     printf("Debug program found on port %s\n", ShortportName(port-1));
                  }
                  else {
                     printf("\ncommunications error - check port and baudrate, and that\n");
                     printf("the binary program loaded was compiled with -g or -g3\n\n");
                     blackbox_close(port);
                     res = -1;
                  }
               }
               else {
                  cs_value = 0;
               }
            }
            else {
               printf("failed to open port %d\n", port); 
               port = 0;
            }
         }
      }

      // open the file containing 'main()' (if possible)
      if (diagnose) {
         printf("looking for main()\n");
      }
      f = find_function("main");
      if (f != NULL) {
         src  = f->f.src;
         if (f->f.lines != NULL) {
            line = f->f.lines->l.num;
            if (diagnose) {
               printf("found main(), file %d at line %d\n", src, line);
            }
            main_line = find_debug_line_by_number(src, line);
            debugger_line = main_line;
            if (port > 0) {
               // first port opening - check memory model
               actual_model = blackbox_model();
               if (mem_model == -1) {
                  mem_model = actual_model;
               }
               else if (actual_model == -1) {
                  printf("warning - cannot determine memory model\n");
               }
               else if (actual_model != mem_model) {
                  printf("warning - memory model mismatch (%d vs %d)\n", 
                        mem_model, actual_model);
               } 
               set_up_model(mem_model);
               if (mem_model == actual_model) {
                  if (verbose) {
                     printf("setting up virtual breakpoints\n");
                  }
                  add_function_brkpts(debugger_line->d.func);
               }
            }
            current_file = src;
            current_line = line;
            load_and_list(current_file, current_line);
         }
         else {
            printf("error - cannot find any lines in main()\n");
         }
      }
      if (f == NULL) {
         printf("error - cannot find entry point for function main()\n");
      }

      if (lua_script != NULL) {
         /* initialize Lua */
         L = luaL_newstate();
         if (L == NULL) {
            printf("%s cannot create Lua state: not enough memory", argv[0]);
            return -1;
         }
         luaL_openlibs(L);
         
         lua_register(L, "delay", lua_delay);
         lua_register(L, "send", lua_send);
         lua_register(L, "clear", lua_clear);
         lua_register(L, "receive", lua_receive);
         lua_register(L, "wait_for", lua_wait_for);
         if ((lua_status = luaL_dofile(L, lua_script)) != 0) {
            lua_report(L, lua_status);
         }      
         
         /* cleanup Lua */
         lua_close(L);
      }
      else {
         process_commands();
      }

      return 0;
   }
}


int yyerror (char *s) {
   return fprintf(stderr, "%s - check .dbg file is valid\n", s);
}

