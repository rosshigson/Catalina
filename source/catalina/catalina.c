/*
 * Catalina - Simplified command line wrapper for the Catalina compilation 
 *            system for the Parallax Propeller. Turns catalina options
 *            into LCC options, and then invokes lcc.
 *
 * version 2.0 - initial release (to coincide with bind 2.0)
 *
 * version 2.1 - remove duplicate version number output on '-v'
 *
 * version 2.1 - fixed crash if an option that requires a value is not 
 *               followed by one (e.g. -D)
 *
 * version 2.2 - just update version number
 *
 * Version 2.3 - Allow for spaces in file/path names.
 *               Fix bug using incorrect LCCDIR for LARGE memory model.
 *               Allow -o to be used with -c and -S options.
 *               Allow upper or lowercase 'k' or 'm' to -M option.
 *
 * version 2.4 - Add '-g' option (passed to lcc, but enables listing). Also
 *               passed to binder to invoke debug file generator. Also sets
 *               the target.
 *               Add SMALL (and __CATALINA_SMALL) symbol when using SMALL
 *               memory model.
 *
 * version 2.4.1 - make it possible to override the target used when -g or
 *               -g3 is specified. If a different target has already been
 *               specified the -g options will not override it. Also, if a
 *               -t option is subsequently parsed, it takes precedence.
 *
 * Version 2.5 - just update version number.
 *
 * Version 2.6 - Add Optimizer option (-O).
 *
 * version 2.7 - just update version number.
 *
 * version 2.8 - intercept EEPROM and SDCARD and set layout (1 for EEPROM,
 *               6 for SDCARD).
 *
 * version 2.9 - Added -q option (to test the use of command line symbols) 
 *               and also defined the the PREPROCESS symbol to disable all 
 *               preprocessing code altogether (this code may be removed 
 *               altogether later).
 *
 *               Added statistics (segment and file sizes) generation, and
 *               the '-k' option to suppress them.
 *
 *               Added -R option, for setting the size to use for the 
 *               READ-WRITE segments - i.e. the CODE and CNST segments 
 *               will be shifted to begin at this address. This allows 
 *               memory layout 3 to be used with a combination of SPI 
 *               SRAM (Read/Write) and SPI FLASH (Read Only). For example, 
 *               the following command will put the read/write segments at 
 *               0x08000 and the read only segments at 0x10000:
 *
 *                  catalina hello_world.c -x3 -R32k
 *
 * Version 3.0   Add '-P' option to set base address of read-write segments.
 *               This is similar to the existing '-R' option which sets the
 *               base address of the read-only segments. Also, fixed some
 *               errors in calculating the segment sizes in the presence of
 *               the -P or -R command line options.
 *
 *               Added support for memory layout 4 (XMM SMALL). Now layout
 *               3 is for XMM LARGE mode and LAYOUT 4 is for XMM SMALL mode.
 *               Both these layouts are intended to be used for programs 
 *               that execute from using SPI FLASH, so both layout 3 and 
 *               layout 4 imply FLASH - so you don't need to specify FLASH 
 *               separately if you use -x3 or -x4.
 *
 *               However, if FLASH is specified on the command line, the 
 *               layout is set to 3 unless it has already been set to a 
 *               non-zero value. Also, the SDCARD and EEPROM options now 
 *               work the same way - i.e. they only set the layout if it 
 *               has not already been set to a non-zero value.
 *
 *               Also, the TINY, SMALL and LARGE memory model options can
 *               now be specified on the command line. These set the layout 
 *               to 0, 2 and 5 respectively unless the layout has already 
 *               been set to something incompatible with these. Also, if 
 *               the layout is 3 then SMALL will set it to 4, and if the 
 *               layout is 4 then LARGE will set it to 3. 
 *
 *               The effect of all these changes is that you can now use
 *               EITHER the layout option (-x) to specify the layout - OR - 
 *               use a combination of a memory model option (i.e. TINY, 
 *               SMALL or LARGE) and a loader option (i.e. EEPROM, SDCARD,
 *               FLASH). The relationship between the two ways of specifying
 *               the layout is as follows:
 *
 *               -x0    <==> -C TINY                 (this is the default)
 *               -x1    <==> -C TINY  -C EEPROM      (or just -C EEPROM)
 *               -x2    <==> -C SMALL
 *               -x3    <==> -C LARGE -C FLASH       (or just -C FLASH)
 *               -x4    <==> -C SMALL -C FLASH
 *               -x5    <==> -C LARGE 
 *               -x6    <==> -C TINY  -C SDCARD      (or just -C SDCARD)
 *              
 *               The -x option is basically now just a "shorthand" method.
 *               Note that mixing the two methods is NOT recommended. It
 *               may result in defining some command-line symbols twice.
 *               Also note that invalid combinations are NOT guaranteed to
 *               be detected in all cases!
 *
 * Version 3.0.4 Quote filenames containing spaces on unix as well as windows.
 *
 * Version 3.1 - just update version number.
 *
 * Version 3.2 - Make line size 4096 chars.
 *
 * Version 3.3 - just update version number.
 *
 * Version 3.4 - just update version number.
 *
 * Version 3.5 - Added -C for defining 'Catalina' symbols (which used to be 
 *               defined using -D). Made -D mean define 'C' symbols. Note that 
 *               catbind now also uses -C but that Homespun still use -D. 
 *
 * Version 3.6 - Fix up path processing to correctly override defaults in all
 *               cases (LARGE was not working), and redefine LIBRARY_PATH to
 *               mean the path to the libraries exlculding the final "\lib" 
 *               or "\large_lib" (this is determined by the memory mode).
 *
 * Version 3.7 - Added Compact Memory Model support (CMM).
 *               Allow optimization level 0 (to disable optiimization).
 *
 * Version 3.8 - Added Compact Memory Model support (CMM) to EEPROM and
 *               SDCARD loaders. Also added:
 *
 *               -x8    <==> -C COMPACT
 *               -x9    <==> -C COMPACT -C EEPROM
 *               -x10   <==> -C COMPACT -C SDCARD
 *
 * Version 3.9 - just update version number.
 *
 * Version 3.10 - just update version number.
 *
 * Version 3.11 - Add support for using openspin as assembler. This is now
 *                the default. 
 *                Remove bstc support.
 *                Remove compile-time support for file preprocessing - this 
 *                is no longer required since bstc support has been dropped,
 *                and both openspin and homespun support symbols defined on
 *                the command-line.
 *                Define the Catalina symols HOMESPUN__ or OPENSPIN__ (and
 *                the corresponding C symbols __CATALINA_HOMESPUN__ or 
 *                __CATALINA_OPENSPIN__) depending on whether the Homespun
 *                or Openspin assemblers are in use.
 *                Make "FLASH is incompatible with current layout" message
 *                a warning only, and ignore the symbol - this makes the 
 *                compilation of Catalyst utility programs much simpler,
 *                otherwise they would need special compilation options.
 *                Added more control over verbosity - default is now minimal
 *                output messages, -v means verbose, -v -v means very verbose.
 *
 * Version 3.12 - Renamed openspin to spinnaker.
 *
 * Version 3.13 - Just update version number.
 *
 * Version 3.15 - Add P2 support. LMM and NATIVE mode only. 
 *                Propeller 2 indicated by -p2 flag. 
 *                Add p2asm support.
 *                The NATIVE layout is unique to the Propeller 2:
 *
 *               -x11    <==> -C NATIVE
 *
 * Version 3.16 - Option '-k' now also suppresses banners
 *
 *              - Remove Homespun support. Now openspin is the only assembler
 *                supported on the P1, and p2asm is the only assembler
 *                supported on the P2. The '-a' option has been removed.
 *
 * Version 3.17 - Just update version number.
 *
 * Version 4.0  - Just update version number.
 *
 * Version 4.1  - Allow -M, -P and -R accept hexadecimal constants. The number
 *                is treated as hexadecimal if it starts with 0x or $ such
 *                as -P $ABCD or -R0xFFFF
 *                Note that they already accepted modifiers, such as 1k or 2m,
 *                but not with hexadecimal numbers.
 *
 * Version 4.2  - Just update version number.
 *
 * Version 4.3  - Just update version number.
 *
 * Version 4.4  - Just update version number.
 *
 * Version 4.5  - Just update version number.
 *
 * Version 4.6  - Add the -Z and -z command-line options, which enable or 
 *                disable executing the Catalina parallelizer on each input 
 *                file before invoking lcc. For each input file.c for which
 *                the parallelizer is enabled, a file called something like
 *                file_p.c will be generated, and deleted again after lcc
 *                has completed (unless the -u option is also specified).
 *
 *              - implement the -u command-line option, to prevent the
 *                deletion of parallelizer files. This option is also passed 
 *                on to LCC.
 *
 * Version 4.7  - On the P2, NATIVE is now the default memory layout. To
 *                reinstate the previous default of LMM, you have to either
 *                specify -C TINY or use the option -x0
 *
 * Version 4.8  - Updated to fix a bug introduced when making NATIVE the
 *                default memory layout, which defined the symbols for
 *                NATIVE even if another layout was selected.
 *
 * Version 4.9  - Updated to fix a bug in the order of options which meant
 *                that the layout (e.g. -C COMPACT) was being ignored if it 
 *                was specified before -p2 was specified.
 *
 *                Remove -F and -B command line options.
 *
 *                Since the NATIVE memory layout is only supported on a 
 *                Propeller 2, defining the Catalina symbol NATIVE now 
 *                also implies -p2.
 *
 * Version 4.9.1  Just update version number.
 *
 * Version 4.9.2  Just update version number.
 *
 * Version 4.9.3  Add -f, -F and -E command line option (Propeller 2 only):
 *                
 *                   -f requested frequency for which to calculate values
 *                   -F external xtal (XI) frequency
 *                   -E error limit for frequency calculation
 *                
 *                Note that 'm' and 'k' suffix chars mean multiply value by
 *                1,000,000 and 1,000 respectively - i.e. you can say 
 *                -f260Mhz, -f123456kHz, -F25m or -E100k
 *                
 *                Allow complex Catalina symbol definitions on the command 
 *                line, such as:
 *                
 *                   -C "name=value"
 *                
 *                (Note that complex C symbols were already supported via -D).  
 *                
 *                Specifying a frequency defines three Catalina symbols:
 *                
 *                   _CLOCK_XDIV - XI divider (1..64)
 *                   _CLOCK_MULT - XI multiplier (1..1024)
 *                   _CLOCK_DIVP - VCO divider (1, or even numbers up to 30)
 *                
 *                These can also be defined manually, but are only used if all
 *                three are defined. The following Catalina symbols can be 
 *                defined individually:
 *                                
 *                   _CLOCK_OSC - 0=OFF, 1=OSC, 2=15pF, 3=30pF               
 *                   _CLOCK_SEL - 0=rcfast, 1=rcslow, 2=XI, 3=PLL
 *                   _CLOCK_PLL - 0=PLL off, 1=PLL on
 *                                
 *                Specifying complex symbols and clock symbols on the command 
 *                line is only supported on the P2.
 *
 *                The symbols MHZ_260 and MHZ_220 remain supported, but are
 *                now translated into -f260MHz and -f220MHz.                
 *
 * Version 4.9.4  Allow baud rate setting on the command line (P2 only), 
 *                either using the -B command line option, or by defining 
 *                the symbol _BAUDRATE - for example, the following are 
 *                equivalent:
 *                
 *                   -B 9600
 *                   -C "_BAUDRATE=9600"
 *
 * Version 4.9.5 - Add MHZ_300 as a Catalina symbol for -f300Mhz (this 
 *                 allows 300hz to be specified as an option to the 
 *                 build_all batch files and in CATALINA_DEFINE).
 *                 
 *               - Add OPTIMIZE as a Catalina symbol for -O5 (this
 *                 allows optimization to be specified as an option to
 *                 build_all batch files and in CATALINA_DEFINE). Also,
 *                 the default optimization level (i.e. if -O is used
 *                 without a parameter) is now 5 (instead of 1).                 *
 * Version 4.9.6  Just update version number.
 *
 * Version 5.0    Just update version number.
 *
 * Version 5.1    Decoding the CATALINA_DEFINE environment variable was 
 *                taking place AFTER the symbols to specify the clock
 *                frequency were defined, so Catalina symbols MHZ_220, 
 *                MHZ_260 & MHZ_300 only worked when specified on the 
 *                command line, and had no effect if specified using
 *                 CATALINA_DEFINE.
 *
 *                Added MHZ_175 and MHZ_200 as a Catalina symobl, to make it 
 *                easier to build Catalyst using either 175Mhz or 200Mhz on 
 *                the Propeller 2 - 175Mhz is now the recommended frequency 
 *                for Catalyst on the P2, to work around an obscure bug that 
 *                occurs at 180Mhz.
 *                
 * Version 5.1.1  Just update version number - this version was released to
 *                fix a bug in catbind.
 *
 * Version 5.1.2  Just update version number - this version was released to
 *                fix a bug in thread_misc.e.
 *
 * Version 5.2    Just update version number.
 *
 * Version 5.3    Just update version number.
 *
 * Version 5.4    Just update version number.
 *
 * Version 5.5    Just update version number.
 *
 * Version 5.6    Add Propeller 2 XMM support.
 *                Add OPTIMISE as a synonym for OPTIMIZE
 *
 * Version 5.7    Just update version number.
 *
 * Version 5.8    Just update version number.
 *
 * Version 5.9    Just update version number.
 *
 * Version 6.0    Support DOS 8.3 file names.
 *
 * Version 6.0.1  Just update version number.
 *
 * Version 6.1    add _PASM() macro for use in inline PASM.
 *
 * Version 6.1.1  add _PSTR() macro for use in inline PASM.
 *
 * Version 6.2   - just update version number.
 *
 * Version 6.3   - just update version number.
 *
 * Version 6.4   - just update version number.
 *
 * Version 6.5   - just update version number.
 *
 * Version 6.5.2 - just update version number.
 *
 * Version 6.5.3 - just update version number.
 *
 * Version 6.5.4 - just update version number.
 *
 * Version 6.5.5 - just update version number.
 *
 * Version 7.0   - just update version number.
 *
 * Version 7.1   - Add support for Quick Build, which means in cases where
 *                 the target is built separately to the program (i.e. XMM,
 *                 EMM and SMM memory models) then if a target file of the 
 *                 correct name already exists, it is used instead of being
 *                 rebuilt. Quick Build is enabled by adding the command line
 *                 option -q or defining the Catalina symbol QUICKBUILD.
 *               - Add option to use external commands for the binary build
 *                 and statistics commands (see binbuild.c and binstat.c).
 *               - Tidy up interpretation of -v and -d options -
 *                 they are now disjoint, and one does not imply
 *                 the other. To see all messages, use both.
 *
 * Version 7.2   - If the -o option is not specified, and -c or -S is not
 *                 specified, the first filename (minus any extension) is 
 *                 used as the default filename. If -c or -S is specified
 *                 but there is more than one filename then -o is ignored.
 * 
 * Version 7.3   - just update version number.
 *
 * Version 7.4   - just update version number.
 *
 * Version 7.5   - just update version number.
 *
 * Version 7.6   - Add the ability to define the Catalina symbol P2, which 
 *                 means the same specifying option -p2. This allows the 
 *                 Propeller version to be specified using CATALINA_DEFINE 
 *                 (the default remains as -p1, so there is no specific 
 *                 symbol needed for that case).
 *
 * Version 7.7  - Just update the version number.
 *
 * Version 7.8  - Just update the version number.
 *
 * Version 7.9  - Add -H option to specify heap top (+1), which is passed
 *                to catbind. HEAP_TOP is used by _sbrk(), but the actual 
 *                value used will be the LOWER of HEAP_TOP and FREE_MEM.
 *
 * version 8.1   - just update version number.
 *
 * version 8.2   - just update version number.
 *
 * version 8.3   - Defining the Catalina Symbol P2 forced NATIVE mode in
 *                 all cases, whereas it should only have done so if no
 *                 other mode had been specified.
 *
 * version 8.4  - just update version number.
 *
 * version 8.5  - just update version number.
 *
 * version 8.6  - just update version number.
 *
 * version 8.7  - just update version number.
 *
 * version 8.8  - add -Q (and -C QUICKFORCE) to mean enable Qquick Build,
 *                but also rebuild the target file even if it already exists.
 *
 * version 8.8.1 - just update version number.
 * 
 * version 8.8.2 - allow -C to also be used to select either cpp or cake as
 *                 the C precompiler, by specifying the C standard as two 
 *                 numeric digits. If no standard is specfied or -C89 or -C90 
 *                 is specified Catalina will use cpp, otherwise Catalina will 
 *                 use cake. 
 *                    
 *                 Catalina will use cpp as the preprocessor by using the 
 *                 existing lcc command (which is unchanged), whereas -C99 
 *                 etc use a new clcc command which invokes cake in place 
 *                 of cpp. 
 *                 
 *                 A warning will be issued if the debug or parallel options 
 *                 are selected when cake is also selected. 
 *                    
 *                 Note that cake currently always defines __STDC_VERSION__ 
 *                 as 202311L for all standards (94, 95, 99, 11, 17, 18, 23)
 *                 whereas cpp does not define it at all. This may change
 *                 in a future Cake release.
 *                 
 * version 8.8.3 - Add -C CAKE_COLOR, which enables the use of colors by Cake
 *                 in error and warning messages. Does nothing unless Cake is
 *                 enabled (e.g. by also adding -C99 etc).
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
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <math.h>

#define VERSION            "8.8.3"

#define MAX_LINELEN        4096

#ifdef WIN32_PATHS         /* define this on the command line for Windows */
#define DEFAULT_SEP        "\\"
#define DEFAULT_LCCDIR     "C:\\Program Files (x86)\\Catalina" // must match default used by LCC
#define MULT_PATH_SEP      ";"
#else
#define DEFAULT_SEP        "/"
#define DEFAULT_LCCDIR     "/opt/catalina" // must match default used by LCC
#define MULT_PATH_SEP      ":"
#endif

#define TGT_SUFFIX         "target"
#define INC_SUFFIX         "include"
#define LIB_SUFFIX         "lib"
#define SMALL_LIB_SUFFIX   "lmm"
#define LARGE_LIB_SUFFIX   "xmm"
#define COMPACT_LIB_SUFFIX "cmm"
#define NATIVE_LIB_SUFFIX  "nmm"

#define P1_SUFFIX          "p1"
#define P2_SUFFIX          "p2"

#define DEBUG_TARGET       "dbg"

#define DEFAULT_LCC_ENV    "LCCDIR" // can only display this - cannot set it as an option to LCC

#define DEFAULT_LIB_ENV    "CATALINA_LIBRARY"
#define DEFAULT_TGT_ENV    "CATALINA_TARGET"
#define DEFAULT_INC_ENV    "CATALINA_INCLUDE" 
#define DEFAULT_TMP_ENV    "CATALINA_TEMPDIR"
#define DEFAULT_OPT_ENV    "CATALINA_LCCOPT"
#define DEFAULT_DEF_ENV    "CATALINA_DEFINE"

#define PARALLELIZE_SUFFIX "_p"
#define PARALLELIZE_CMD    "parallelize "

/* global variables used when processing options - e.g. to warn about incompatible combinations */

static int verbose    = 0; // 1 => verbose output, 2 => very verbose output
static int diagnose   = 0; // 1 => diagnostic output

static int assembler  = 1; // 1 => open spin (P1), 2 => p2asm (P2)

static int comp_only  = 0; // 0 => -c not specified, 1 => -c specified
static int asm_only   = 0; // 0 => -S not specified, 1 => -S specified

static int format     = 0; // 0 => default, 1 => binary, 2 => eeprom
static int layout     = -1;// 0 .. 6 for LMM, 8..10 for compact, 11 for native 
static int memory     = 0; // max size in bytes 
static int readonly   = 0; // offset of read-only segments
static int readwrite  = 0; // offset of read-write segments
static int heaptop    = 0; // address of top of heap (+1)
static int prop_vers  = 1; // propeller hardware version
static int listing    = 0; // generate listing
static int glevel     = 0; // debug level
static int olevel     = 0; // optimize level
static int suppress   = 0; // suppress banners and statistics
static int bannered   = 0; // banner has been output
static int parallel   = 0; // invoke the parallelizer on the input files
static int untidy     = 0; // untidy (i.e. no cleanup) mode
static int quickbuild = 0; // enable quick build, re-use any existing target
static int quickforce = 0; // enable quick build, always rebuild target
static int cake_color = 0; // enable the use of color by Cake

/* C standard (and precompiler) to use  */

static int standard   = 89; // valid are 89, 90, 94, 95, 99, 11, 17, 18, 23

/* clock calculation parameters */
static int baud_rate  = 0; // baud rate (no default)
static int reqd_freq  = 0; // required clock frequency (no default)
static int reqd_xtal  = 0; // required xtal frequency (no default)
static int xtal_freq  = 20000000; // default xtal frequency
static int err_freq   = 100000; // default frequency error (default 100k)

/* clock calculation result variables */
static uint32_t result_divd = 0;
static uint32_t result_mult = 0;
static uint32_t result_post = 0;
static uint32_t result_pppp = 0;
static uint32_t result_Fpfd = 0;
static uint32_t result_Fvco = 0;
static uint32_t result_Fout = 0;
static uint32_t result_err  = 0;

static int flash  = 0;  // -C FLASH appended
static int sdcard = 0;  // -C SDCARD appended
static int eeprom = 0;  // -C EEPROM appended

static int output_named    = 0; // have name for output
static int output_override = 0; // default output name overridden
static int target_named    = 0; // have name for target

static char tgt_name[MAX_LINELEN + 1] = "";
static char out_name[MAX_LINELEN + 1] = "";

static char tgt_path[MAX_LINELEN + 1] = "";
static char lib_path[MAX_LINELEN + 1] = "";
static char inc_path[MAX_LINELEN + 1] = "";
static char tmp_path[MAX_LINELEN + 1] = "";
static char lcc_path[MAX_LINELEN + 1] = "";

static char def_tgt_path[MAX_LINELEN + 1] = "";
static char def_lib_path[MAX_LINELEN + 1] = "";
static char def_inc_path[MAX_LINELEN + 1] = "";

static char lcc_cmd[MAX_LINELEN + 1] = "";
static char lcc_opt[MAX_LINELEN + 1] = "";

static int  file_count = 0;
static int  par_count = 0;
static char par_files[MAX_LINELEN + 1] = "";
static char del_files[MAX_LINELEN + 1] = "";

void banner(void) {
   if (bannered == 0) {
      fprintf(stderr, "Catalina Compiler %s\n", VERSION); 
      bannered = 1;
   }
}

void help(char *my_name) {
   banner();
   fprintf(stderr, "\nusage: %s [option | file] ...\n\n", my_name);
   fprintf(stderr, "options:  -? or -h   print this help (and exit)\n");
   fprintf(stderr, "          -b         generate a binary output file (this is the default)\n");
   fprintf(stderr, "          -B baud    baud rate to use for serial interfaces (P2 only)\n");
   fprintf(stderr, "          -d         output diagnostic messages\n");
   fprintf(stderr, "          -c         compile only (do not bind)\n");
   fprintf(stderr, "          -C symbol  define a Catalina symbol (e.g. -C HYDRA)\n");
   fprintf(stderr, "                     or the C standard to use (e.g. -C99)\n");
   fprintf(stderr, "          -D symbol  define a symbol (e.g. -D printf=tiny_printf)\n");
   fprintf(stderr, "          -e         generate an eeprom output file\n");
   fprintf(stderr, "          -E         allowable frequency error (default is 100k\n");
   fprintf(stderr, "          -f freq    required clock frequency (see also -F & -E\n");
   fprintf(stderr, "          -F freq    crystal frequency (default is 20M)\n");
   fprintf(stderr, "          -g[level]  generate debugging information (default level = 1)\n");
   fprintf(stderr, "          -H addr    address of top of heap\n");
   fprintf(stderr, "          -I path    path to include files (default '%s')\n", def_inc_path);
   fprintf(stderr, "          -k         kill (suppress) banners and statistics output\n");
   fprintf(stderr, "          -l lib     search library lib when binding\n");
   fprintf(stderr, "          -L path    path to libraries (default '%s')\n", def_lib_path);
   fprintf(stderr, "          -M size    maximum memory size (use with -x)\n");
   fprintf(stderr, "          -o name    name of output file (default is first file name)\n");
   fprintf(stderr, "          -O[level]  optimize code (default level = 1)\n");
   fprintf(stderr, "          -p ver     Propeller Hardware Version\n");
   fprintf(stderr, "          -P addr    address for Read-Write segments\n");
   fprintf(stderr, "          -q         enable quick build (re-use any existing target files)\n");
   fprintf(stderr, "          -Q         force quick build (rebuild target files)\n");
   fprintf(stderr, "          -R addr    address for Read-Only segments\n");
   fprintf(stderr, "          -S         compile to assembly code (do not bind)\n");
   fprintf(stderr, "          -t name    name of dedicated target to use\n");
   fprintf(stderr, "          -T path    path to target files (default '%s')\n", def_tgt_path);
   fprintf(stderr, "          -u         untidy (no cleanup) mode\n");
   fprintf(stderr, "          -U symbol  undefine symbol (e.g. -U DEFAULT)\n");
   fprintf(stderr, "          -v         verbose (output information messages)\n");
   fprintf(stderr, "          -v -v      very verbose (more information messages)\n");
   fprintf(stderr, "          -W option  option to pass directly to LCC\n");
   fprintf(stderr, "          -x layout  use specified memory layout (layout = 0 .. 6, 8 .. 11)\n");
   fprintf(stderr, "          -y         generate listing file\n");
   fprintf(stderr, "          -z         don't invoke the parallelizer on input files that follow\n");
   fprintf(stderr, "          -Z         invoke the parallelizer on input files that follow\n\n");
   fprintf(stderr, "NOTE: unrecognized options will be passed on to LCC\n\n");
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

// pathcat will check for paths with spaces and quote
// them if we are using Win32 style path names, otherwise
// it is much the same as two safecats
void pathcat(char *dst, const char *src, const char *sfx, size_t max) {
//#ifdef WIN32_PATHS
   if ((strchr(src, ' ') != NULL) && (src[0] != '\"')) {
      safecat(dst, "\"", max);
      safecat(dst, src, max);
      if (sfx != NULL) {
         safecat(dst, sfx, max);
      }
      safecat(dst, "\"", max);
   }
   else {
      safecat(dst, src, max);
      if (sfx != NULL) {
         safecat(dst, sfx, max);
      }
   }
//#else
//   safecat(dst, src, max);
//   if (sfx != NULL) {
//      safecat(dst, sfx, max);
//   }
//#endif   
}

void unquote(char *name, char *unquoted) {
   int  len, i, j;
   
   len = strlen(name);
   if (len > MAX_LINELEN) {
      len = MAX_LINELEN;
   }
   j = 0;
   for (i = 0; i < len; i++) {
      if (name[i] != '\"') {
         unquoted[j++] = name[i];
      }
   }
   unquoted[j] = '\0';
}

int remove_unquoted(char *filename) {
   char unquoted_filename[MAX_LINELEN + 1];

   unquote(filename, unquoted_filename);
   if (diagnose) {
      fprintf(stderr, "remove %s\n", unquoted_filename);
   }
   return remove(unquoted_filename);
}

#ifdef __CATALINA__

// simulate environment variables if not set
char *catalina_getenv(const char *name) {
   static char lccdir[] = "";
   static char libdir[] = "/lib";
   static char tgtdir[] = "/target";
   static char incdir[] = "/include";
   static char tmpdir[] = "/tmp";
   static char optenv[] = "";
   static char defenv[] = "";

   char *tmp = getenv(name);

   if (tmp != NULL) {
      return strdup(tmp);
   }

   if ((strcmp(name,"TMP") == 0)
   ||  (strcmp(name,"TEMP") == 0) 
   ||  (strcmp(name,"TMPDIR") == 0) 
   ||  (strcmp(name, DEFAULT_TMP_ENV) == 0)) {
      return tmpdir;
   }
   else if (strcmp(name, DEFAULT_LCC_ENV) == 0) {
      return lccdir;
   }
   else if (strcmp(name, DEFAULT_LIB_ENV) == 0) {
      return libdir;
   }
   else if (strcmp(name, DEFAULT_TGT_ENV) == 0) {
      return tgtdir;
   }
   else if (strcmp(name, DEFAULT_INC_ENV) == 0) {
      return incdir;
   }
   else if (strcmp(name, DEFAULT_DEF_ENV) == 0) {
      return defenv;
   }
   else if (strcmp(name, DEFAULT_OPT_ENV) == 0) {
      return optenv;
   }
   else {
	    return (char *)NULL;
   }
}

#else

char * catalina_getenv(char *name) {
   return getenv(name);
}

#endif

/*
 * add the definition of a C preprocessor symbol to the lcc command line,
 * quoting as necessary. The value can be the null string. 
 */
void preprocessor_symboldef(char *name, char *value) {
   if ((value == NULL) || (strcmp(value, "") == 0)) {
      // simple symbol - no need to quote it
      safecat(lcc_opt, "-D", MAX_LINELEN);
      safecat(lcc_opt, name, MAX_LINELEN);
      safecat(lcc_opt, " ", MAX_LINELEN);
   }
   else {
      // complex symbol - must quote it
      safecat(lcc_opt, "-D\"", MAX_LINELEN);
      safecat(lcc_opt, name, MAX_LINELEN);
      safecat(lcc_opt, "=", MAX_LINELEN);
      safecat(lcc_opt, value, MAX_LINELEN);
      safecat(lcc_opt, "\" ", MAX_LINELEN);
   }
}

/*
 * add the definition of a Catalina symbol to the lcc command line,
 * quoting as necessary. Note that we add it as both a Catalina
 * symbol and as a C preprocessor symbol (prefixed with "__CATALINA_"). 
 * The value can be the null string. Note that quoting catalina symbols 
 * only works on the P2, where we use p2_asm as our assembler. On the 
 * P1 the value should always be the null string.
 */
void catalina_symboldef(char *name, char *value) {
   if ((value == NULL) || (strcmp(value, "") == 0)) {
      // simple symbol - no need to quote it (works on P1 or P2)
      safecat(lcc_opt, "-D__CATALINA_", MAX_LINELEN);
      safecat(lcc_opt, name, MAX_LINELEN);
      safecat(lcc_opt, value, MAX_LINELEN);
      safecat(lcc_opt, " -Wl-C", MAX_LINELEN);
      safecat(lcc_opt, name, MAX_LINELEN);
      safecat(lcc_opt, " ", MAX_LINELEN);
   }
   else {
      // complex symbol - must quote it (works on P2 only!)
      safecat(lcc_opt, "-D\"__CATALINA_", MAX_LINELEN);
      safecat(lcc_opt, name, MAX_LINELEN);
      safecat(lcc_opt, value, MAX_LINELEN);
      safecat(lcc_opt, "\" ", MAX_LINELEN);
      safecat(lcc_opt, "-Wl-C\"", MAX_LINELEN);
      safecat(lcc_opt, name, MAX_LINELEN);
      safecat(lcc_opt, "=", MAX_LINELEN);
      safecat(lcc_opt, value, MAX_LINELEN);
      safecat(lcc_opt, "\" ", MAX_LINELEN);
   }
}
/*
 * calc_freq - calculate values to use for clock frequency. Leaves results
 *             in the static result variables, which will be left as 0
 *             if the frequency calculation does not succeed. This is a 
 *             C version of Chip's original SimpleBAsic code.
 */
void calc_freq(uint32_t xinfreq, uint32_t clkfreq, uint32_t errfreq) {

   uint32_t pppp;
   uint32_t post;
   uint32_t divd;
   uint32_t error = errfreq;

   double Fpfd;
   double mult;
   double Fvco;
   double Fout;
   double err;

   for (pppp = 0; pppp <= 15; pppp++) {
     if (pppp == 0) {
       post = 1;
     }
     else {
        post = pppp * 2;
     }
     for (divd = 64; divd >= 1; divd--) {
        Fpfd = round((double)xinfreq / (double)divd);
        mult = round((double)clkfreq * ((double)post * (double)divd) / (double)xinfreq);
        Fvco = round((double)xinfreq * (double)mult / (double)divd);
        Fout = round((double)Fvco / (double)post);
        err = fabs(Fout - (double)clkfreq);
        if ((err <= error) 
        &&  (Fpfd >= 250000) 
        &&  (mult <= 1024) 
        &&  (Fvco >= 99e6) 
        &&  ((Fvco <= 201e6) || (Fvco <= (clkfreq + errfreq)))) {
           result_divd = divd;
           result_mult = mult;
           result_post = post;
           result_pppp = (pppp-1) & 15; //%1111 = /1, %0000..%1110 = /2..30
           result_Fpfd = Fpfd;
           result_Fvco = Fvco;
           result_Fout = Fout;
           result_err  = err;
        }
     }
   } 

   if (diagnose) {
      printf("XINFREQ:   %9u (XI Input Frequency)\n", xtal_freq);
      printf("CLKFREQ:   %9u (PLL Goal Frequency)\n", reqd_freq);
      printf("ERRFREQ:   %9u (Allowable Error)\n\n", err_freq);
      /* 
      printf("Divd: %4u D field = %4u\n", result_divd,  result_divd-1);
      printf("Mult: %4u M field = %4u\n", result_mult, result_mult-1);
      printf("Post: %4u P field = %4u\n\n", result_post, result_pppp);
   
      //printf("setclk(%1_");
      //printf(right(bin(result_divd-1),6); "_");
      //printf(right(bin(result_mult-1),10); "_");
      //printf(right(bin(result_pppp),4); "_10_11, "; clkfreq; ")"
   
      printf("Fpfd:  %u\n", result_Fpfd);
      printf("Fvco:  %u\n\n", result_Fvco);
   
      printf("Fout:  %u\n", result_Fout);
      printf("Error: %d\n\n", result_Fout - clkfreq);
      */
   }
}

/*
 * ajust the name of the last file in dst, adding the PARALLELIZE_SUFFIX 
 * (e.g. from xxx.c, to xxx_p.c) taking into account that it may not have
 * a suffix, and it may be quoted. Do not extend the string beyond max.
 */
void adjust_filename(char *dst, int max) {
   int   len = strlen(dst);
   int   pos = len - 1;
   char *suf = PARALLELIZE_SUFFIX;
   int   adj = strlen(suf);
   int   quoted = 0;
   int   i;

   if ((len > 0) && ((len + adj) < max)) {
      dst[len + adj] = '\0';
      while ((pos > 0) && (dst[pos] != '.') && (dst[pos] != ' ')) {
         pos--;
      }
      if (dst[pos] == '.') {
         // found extension - we add our suffix just before it
         for (i = len; i >= pos; i--) {
            dst[adj + i] = dst[i];
         }
      }
      else {
         // no extension found - we add our suffix to the end
         pos = len;
         if ((pos > 0) && (dst[pos] == '\"')) {
            // remember this was a quoted string
            quoted = 1;
            // suffix goes before quote
            pos--;
         }
      }
      for (i = 0; i < adj; i++) {
         dst[pos + i] = suf[i];
      }
      if (quoted) {
         // restore terminating quote
         dst[pos + adj] = '\"';
      }
   }
}

/*
 * return the filename from the string whose address is pointed to 
 * by 'names'. This function assumes the names are separated by spaces, 
 * but that names may contain spaces if they are quoted. Returns a 
 * pointer to a null terminated string containing the name (or NULL 
 * if there are no more names in the input string, and also updates 
 * the pointer that was passed to it to point to the next name in 
 * the string. Destroys the string whose address is pointed to by 
 * 'names'.
 */
char *next_filename(char **names) {
   char *start;
   char *end;

   if ((names == NULL) || (*names == NULL) || (**names == '\0')) {
      return NULL;
   }
   // find start of next name
   start = *names;
   while (*start == ' ') {
      start++;
   }
   // find end of next name
   end = start;
   if (*end == '\"') {
      end++;
      while ((*end != '\"') && (*end != '\0')) {
         end++;
      }
      if (*end == '\"') {
         end++;
      }
   }
   else {
      while ((*end != ' ') && (*end != '\0')) {
         end++;
      }
   }
   // terminate our string if it is not already
   if (*end != '\0') {
      *end = '\0';
      end++;
   }
   *names = end;
   return start;
}

void parallelize(char *files) {
   char *name = NULL;
   char par_cmd[MAX_LINELEN + 1] = "";
   int result;

   do {
      par_cmd[0]='\0';
      name = next_filename(&files);
      if (name != NULL) {
         safecat(par_cmd, PARALLELIZE_CMD, MAX_LINELEN);
         if (verbose) {
            safecat(par_cmd, "-v ", MAX_LINELEN);
         }
         safecat(par_cmd, name, MAX_LINELEN);
         if (verbose) {
            fprintf(stderr, "%s\n", par_cmd);
         }
         if ((result = system(par_cmd)) != 0) {
            if (diagnose) {
               fprintf(stderr, "parallelize command returned result %d\n", result);
            }
         }
      }
   } while (name != NULL);
}

void delete(char *files) {
   char *name = NULL;

   do {
      name = next_filename(&files);
      if (name != NULL) {
         if (verbose) {
            fprintf(stderr, "delete %s\n", name);
         }
         remove_unquoted(name);
      }
   } while (name != NULL);
}

/*
 * process symbols that have special meanings, and return TRUE 
 * if the symbol is to be passed onto the compiler. Also, return
 * a value of -1 in the "code" integer if we encounter an error
 */
int pass_symbol_to_compiler(char *symbol, int *code) {
   int pass = 1;

   if (isdigit(symbol[0])) {
     pass = 0; // don't pass numeric symbols
     if (strcmp(symbol,"89") == 0) {
        standard = 89;
     }
     else if (strcmp(symbol,"90") == 0) {
        standard = 90;
     }
     else if (strcmp(symbol,"95") == 0) {
        standard = 95;
     }
     else if (strcmp(symbol,"99") == 0) {
        standard = 99;
     }
     else if (strcmp(symbol,"11") == 0) {
        standard = 11;
     }
     else if (strcmp(symbol,"17") == 0) {
        standard = 17;
     }
     else if (strcmp(symbol,"23") == 0) {
        standard = 23;
     }
     else {
       fprintf(stderr, "Uknown C standard specified - ignoring\n");
     }
     if ((standard != 89) && (standard != 90) && ((glevel > 0) || parallel)) {
        fprintf(stderr, "selected C standard is incompatible with -g and -Z - ignoring\n");
        standard = 89;
     }
   }
   else if (strcmp (symbol, "EEPROM") == 0) {
      if ((layout < 0)||(layout == 1)) {
         if (verbose) {
            fprintf(stderr, "EEPROM implies -x1\n");
         }
         layout = 1;
      }
      else if ((layout == 8)||(layout == 9)) {
         if (verbose) {
            fprintf(stderr, "EEPROM implies -x9\n");
         }
         layout = 9;
      }
      else if ((layout == 2)||(layout == 5)) {
         // we detect this later (in the target)
      }
      else {
         fprintf(stderr, "EEPROM is incompatible with current layout\n");
         *code = -1;
      }
   }
   else if (strcmp (symbol, "FLASH") == 0) {
      if ((layout < 0)||(layout == 3)||(layout == 5)) {
         if (verbose) {
            fprintf(stderr, "FLASH implies -x3\n");
         }
         layout = 3;
      }
      else if ((layout == 2)||(layout == 4)) {
         if (verbose) {
            fprintf(stderr, "FLASH implies -x4\n");
         }
         layout = 4;
      }
      else {
         fprintf(stderr, "FLASH is incompatible with current layout - ignoring\n");
      }
   }
   else if (strcmp (symbol, "SDCARD") == 0) {
      if ((layout < 0)||(layout == 6)) {
         if (verbose) {
            fprintf(stderr, "SDCARD implies -x6\n");
         }
         layout = 6;
      }
      else if ((layout == 8)||(layout == 10)) {
         if (verbose) {
            fprintf(stderr, "SDCARD implies -x10\n");
         }
         layout = 10;
      }
      else {
         fprintf(stderr, "SDCARD is incompatible with current layout\n");
         *code = -1;
      }
   }
   else if (strcmp (symbol, "TINY") == 0) {
      pass = 0; // don't pass this symbol yet - we do it later
      if ((layout < 0)||(layout == 2)||(layout == 5)||(layout == 11)) {
         if (verbose) {
            fprintf(stderr, "TINY implies -x0\n");
         }
         layout = 0;
      }
      else if ((layout == 3)||(layout == 4)) {
         fprintf(stderr, "TINY is incompatible with current layout\n");
         *code = -1;
      }
   }
   else if (strcmp (symbol, "SMALL") == 0) {
      pass = 0; // don't pass this symbol yet - we do it later
      if ((layout < 0)||(layout==1)||(layout == 2)||(layout == 5)||(layout == 11)) {
         if (verbose) {
            fprintf(stderr, "SMALL implies -x2\n");
         }
         layout = 2;
      }
      else if ((layout == 3)||(layout == 4)) {
         if (verbose) {
            fprintf(stderr, "SMALL implies -x4\n");
         }
         layout = 4;
      }
      else {
         fprintf(stderr, "SMALL is incompatible with current layout\n");
         *code = -1;
      }
   }
   else if (strcmp (symbol, "LARGE") == 0) {
      pass = 0; // don't pass this symbol yet - we do it later
      if ((layout < 0)||(layout==1)||(layout == 2)||(layout==5)||(layout == 11)) {
         if (verbose) {
            fprintf(stderr, "LARGE implies -x5\n");
         }
         layout = 5;
      }
      else if ((layout == 3)||(layout == 4)) {
         if (verbose) {
            fprintf(stderr, "LARGE implies -x3\n");
         }
         layout = 3;
      }
      else {
         fprintf(stderr, "LARGE is incompatible with current layout\n");
         *code = -1;
      }
   }
   else if (strcmp (symbol, "QUICKBUILD") == 0) {
      quickbuild = 1;
      safecat(lcc_opt, "-Wl-q ", MAX_LINELEN);
   }
   else if (strcmp (symbol, "QUICKFORCE") == 0) {
      quickforce = 1;
      safecat(lcc_opt, "-Wl-Q ", MAX_LINELEN);
   }
   else if (strcmp (symbol, "COMPACT") == 0) {
      pass = 0; // don't pass this symbol yet - we do it later
      if ((layout < 0)||(layout == 11)) {
         if (verbose) {
            fprintf(stderr, "COMPACT implies -x8\n");
         }
         layout = 8;
      }
      else if (layout == 1) {
         if (verbose) {
            fprintf(stderr, "COMPACT implies -x9\n");
         }
         layout = 9;
      }
      else if (layout == 6) {
         if (verbose) {
            fprintf(stderr, "COMPACT implies -x10\n");
         }
         layout = 10;
      }
      else if ((layout != 8)&&(layout != 9)&&(layout != 10)) {
         fprintf(stderr, "COMPACT is incompatible with current layout\n");
         *code = -1;
      }
   }
   else if (strcmp (symbol, "P2") == 0) {
      pass = 0; // don't pass this symbol yet - we do it later
      if (layout < 0) {
         if (verbose) {
            fprintf(stderr, "P2 implies -x11\n");
         }
         layout = 11;
      }
      if (prop_vers != 2) {
         if (verbose) {
            fprintf(stderr, "P2 implies -p2\n");
         }
         prop_vers = 2;
         // The P2 requires the use of p2asm as the assembler
         assembler = 2;
      }
   }
   else if (strcmp (symbol, "NATIVE") == 0) {
      pass = 0; // don't pass this symbol yet - we do it later
      if (layout != 11) {
         if (verbose) {
            fprintf(stderr, "NATIVE implies -x11\n");
         }
         layout = 11;
      }
      if (prop_vers != 2) {
         if (verbose) {
            fprintf(stderr, "NATIVE implies -p2\n");
         }
         prop_vers = 2;
         // The P2 requires the use of p2asm as the assembler
         assembler = 2;
      }
   }
   else if (strcmp (symbol, "OPTIMIZE") == 0) {
      pass = 0; // don't pass this symbol 
      olevel = 5;
   }
   else if (strcmp (symbol, "OPTIMISE") == 0) {
      pass = 0; // don't pass this symbol 
      olevel = 5;
   }
   else if (strcmp (symbol, "CAKE_COLOR") == 0) {
      pass = 0; // don't pass this symbol 
      cake_color = 1;
   }
   else if (strcmp (symbol, "MHZ_300") == 0) {
      pass = 0; // don't pass this symbol 
      reqd_freq = 300000000;
   }
   else if (strcmp (symbol, "MHZ_260") == 0) {
      pass = 0; // don't pass this symbol 
      reqd_freq = 260000000;
   }
   else if (strcmp (symbol, "MHZ_220") == 0) {
      pass = 0; // don't pass this symbol 
      reqd_freq = 220000000;
   }
   else if (strcmp (symbol, "MHZ_200") == 0) {
      pass = 0; // don't pass this symbol 
      reqd_freq = 200000000;
   }
   else if (strcmp (symbol, "MHZ_175") == 0) {
      pass = 0; // don't pass this symbol 
      reqd_freq = 175000000;
   }
   if ((verbose) && (pass == 0)) {
     fprintf(stderr, "Catalina symbol %s recognized\n", symbol);
   }
   return pass;
   
}

/*
 * return a pointer to the value of the argument to the command-line option,
 * with the specified index, or NULL if there is no value, incrementing the 
 * index, and also decrementing argc if we consume a second command-line 
 * argument.
 */
char *get_option_argument(int *index, int *argc, char *argv[]) {
   if (strlen(argv[*index]) == 2) {
      if ((*argc) > 0) {
         (*index)++;
         // use next arg
         (*argc)--;
         return argv[*index];
      }
      else {
         return NULL;
      }
   }
   else {
      // use remainder of this arg
      return &argv[*index][2];
   }
}

/*
 * decode arguments, appending options to lcc command as we go -
 * return -1 if there is no further processing to do
 */
int decode_arguments (int argc, char *argv[]) {
   char   option[MAX_LINELEN + 3 + 1];
   char   optnum[3];
   char   temp_path[MAX_LINELEN + 1];
   int    code = 0;
   int    i = 0;
   int    len = 0;
   char   modifier;
   char * arg;

   if (argc == 1) {
      if (strlen(argv[0]) == 0) {
         // in case my name was not passed in ...
         help("catalina");
      }
      else {
         help(argv[0]);
      }
      code = -1;

   }
   while ((code >= 0) && (argc--)) {
      if (diagnose) {
         banner();
         fprintf(stderr, "arg: %s\n", argv[i]);
      }
      if (i > 0) {
         if (argv[i][0] == '-') {
            if (diagnose) {
               banner();
               fprintf(stderr, "switch: %s\n", argv[i]);
            }
            // it's a command line switch
            switch (argv[i][1]) {
               case 'h':
                  /* fall through to ... */

               case '?':
                  if (strlen(argv[0]) == 0) {
                     // in case my name was not passed in ...
                     help("catalina");
                  }
                  else {
                     help(argv[0]);
                  }
                  code = -1;
                  break;

               case 'b':
                  format = 1;
                  if (verbose) {
                     banner();
                     fprintf(stderr, "binary output format selected\n");
                  }
                  break;

               case 'B':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -B requires an argument\n");
                     code = -1;
                  }
                  else {
                     sscanf(arg, "%d", &baud_rate);
                  }
                  if (verbose) {
                     banner();
                     fprintf(stderr, "baud_rate = %d\n", baud_rate);
                  }
                  break;

               case 'c':
                  comp_only = 1;
                  if (verbose) {
                     banner();
                     fprintf(stderr, "compile only\n");
                  }
                  safecat(lcc_opt, "-c ", MAX_LINELEN);
                  break;

               case 'd':
                  diagnose++;   /* increase diagnosis level */
                  if ((verbose + diagnose) == 1) {
                      banner();
                  }
                  fprintf(stderr, "diagnostic level %d\n", diagnose);
                  break;

               case 'C':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -C requires an argument\n");
                     code = -1;
                  }
                  else {
                     if (pass_symbol_to_compiler(arg, &code)) {
                        catalina_symboldef(arg, "");
                        if (verbose) {
                           banner();
                           fprintf(stderr, "define Catalina symbol %s\n", arg);
                        }
                     }
                  }
                  break;

               case 'D':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -D requires an argument\n");
                     code = -1;
                  }
                  else {
                     safecat(lcc_opt, " -D", MAX_LINELEN);
                     safecat(lcc_opt, arg, MAX_LINELEN);
                     safecat(lcc_opt, " ", MAX_LINELEN);
                     if (verbose) {
                        banner();
                        fprintf(stderr, "define symbol %s\n", arg);
                     }
                  }
                  break;

               case 'e':
                  format = 2;
                  if (verbose) {
                     banner();
                     fprintf(stderr, "eeprom output format selected\n");
                  }
                  break;

               case 'E':
                  modifier = 0;
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -E requires an argument\n");
                     code = -1;
                  }
                  else {
                     if ((arg[0] == '$')) {
                        // hex parameter (such as $ABCD)
                        sscanf(&arg[1], "%x", &err_freq);
                     }
                     else if ((arg[0] == '0')
                     && ((arg[1] == 'x')||(arg[1] == 'X'))) {
                        // hex parameter (such as 0xFFFF or 0XA000)
                        sscanf(&arg[2], "%x", &err_freq);
                     }
                     else {
                        // decimal parameter, perhaps with modifier
                        // (such as 4k or 16m)
                        sscanf(arg, "%d%c", &err_freq, &modifier);
                     }
                  }
                  if (tolower(modifier) == 'k') {
                     if (err_freq < 4294000) {
                        err_freq *= 1000;
                     }
                     else {
                        banner();
                        fprintf(stderr, "error frequency too large\n");
                        code = -1;
                     }
                  }
                  else if (tolower(modifier) == 'm') {
                     if (err_freq < 4294) {
                        err_freq *= 1000 * 1000;
                     }
                     else {
                        banner();
                        fprintf(stderr, "error frequency too large\n");
                        code = -1;
                     }
                  }
                  if (verbose) {
                     banner();
                     fprintf(stderr, "err_freq = %d\n", err_freq);
                  }
                  break;

               case 'f':
                  modifier = 0;
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -E requires an argument\n");
                     code = -1;
                  }
                  else {
                     if ((arg[0] == '$')) {
                        // hex parameter (such as $ABCD)
                        sscanf(&arg[1], "%x", &reqd_freq);
                     }
                     else if ((arg[0] == '0')
                     && ((arg[1] == 'x')||(arg[1] == 'X'))) {
                        // hex parameter (such as 0xFFFF or 0XA000)
                        sscanf(&arg[2], "%x", &reqd_freq);
                     }
                     else {
                        // decimal parameter, perhaps with modifier
                        // (such as 4k or 16m)
                        sscanf(arg, "%d%c", &reqd_freq, &modifier);
                     }
                  }
                  if (tolower(modifier) == 'k') {
                     if (reqd_freq < 4294000) {
                        reqd_freq *= 1000;
                     }
                     else {
                        banner();
                        fprintf(stderr, "required frequency too large\n");
                        code = -1;
                     }
                  }
                  else if (tolower(modifier) == 'm') {
                     if (reqd_freq < 4294) {
                        reqd_freq *= 1000 * 1000;
                     }
                     else {
                        banner();
                        fprintf(stderr, "required frequency too large\n");
                        code = -1;
                     }
                  }
                  if (verbose) {
                     banner();
                     fprintf(stderr, "reqd_freq = %d\n", reqd_freq);
                  }
                  break;

               case 'F':
                  modifier = 0;
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -F requires an argument\n");
                     code = -1;
                  }
                  else {
                     if ((arg[0] == '$')) {
                        // hex parameter (such as $ABCD)
                        sscanf(&arg[1], "%x", &reqd_xtal);
                     }
                     else if ((arg[0] == '0')
                     && ((arg[1] == 'x')||(arg[1] == 'X'))) {
                        // hex parameter (such as 0xFFFF or 0XA000)
                        sscanf(&arg[2], "%x", &reqd_xtal);
                     }
                     else {
                        // decimal parameter, perhaps with modifier
                        // (such as 4k or 16m)
                        sscanf(arg, "%d%c", &reqd_xtal, &modifier);
                     }
                  }
                  if (tolower(modifier) == 'k') {
                     if (reqd_xtal < 4294000) {
                        reqd_xtal *= 1000;
                     }
                     else {
                        banner();
                        fprintf(stderr, "xtal frequency too large\n");
                        code = -1;
                     }
                  }
                  else if (tolower(modifier) == 'm') {
                     if (reqd_xtal < 4294) {
                        reqd_xtal *= 1000 * 1000;
                     }
                     else {
                        banner();
                        fprintf(stderr, "xtal frequency too large\n");
                        code = -1;
                     }
                  }
                  if (verbose) {
                     banner();
                     fprintf(stderr, "reqd_xtal = %d\n", reqd_xtal);
                  }
                  xtal_freq = reqd_xtal;
                  break;

               case 'H':
                  modifier = 0;
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -H requires an argument\n");
                     code = -1;
                  }
                  else {
                     if ((arg[0] == '$')) {
                        // hex parameter (such as $ABCD)
                        sscanf(&arg[1], "%x", &heaptop);
                     }
                     else if ((arg[0] == '0')
                     && ((arg[1] == 'x')||(arg[1] == 'X'))) {
                        // hex parameter (such as 0xFFFF or 0XA000)
                        sscanf(&arg[2], "%x", &heaptop);
                     }
                     else {
                        // decimal parameter, perhaps with modifier
                        // (such as 4k or 16m)
                        sscanf(arg, "%d%c", &heaptop, &modifier);
                     }
                  }
                  if (tolower(modifier) == 'k') {
                     heaptop *= 1024;
                  }
                  else if (tolower(modifier) == 'm') {
                     heaptop *= 1024 * 1024;
                  }
                  if (verbose) {
                     banner();
                     fprintf(stderr, "heaptop address = %d\n", heaptop);
                  }
                  break;

               case 'I':
                  if (strlen(inc_path) != 0) {
                     safecat(inc_path, MULT_PATH_SEP, MAX_LINELEN);
                  }
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -I requires an argument\n");
                     code = -1;
                  }
                  else {
                     safecat(inc_path, arg, MAX_LINELEN);
                     if (verbose) {
                        banner();
                        fprintf(stderr, "adding include path %s\n", arg);
                     }
                  }
                  break;

               case 'k':
                  suppress = 1;
                  if (verbose) {
                     banner();
                     fprintf(stderr, "suppress banners and statistics\n");
                  }
                  break;

               case 'l':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -l requires an argument\n");
                     code = -1;
                  }
                  else {
                     char libstr[MAX_LINELEN] = "";
                     safecat(lcc_opt, "-l", MAX_LINELEN);
                     safecat(lcc_opt, arg, MAX_LINELEN);
                     safecat(lcc_opt, " ", MAX_LINELEN);
                     // Now define a library symbol for LCC and the binder
                     sprintf(libstr,"lib%s", arg);
                     catalina_symboldef(libstr, "");
                     if (verbose) {
                        banner();
                        fprintf(stderr, "search library %s\n", arg);
                     }
                  }
                  break;

               case 'L':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -L requires an argument\n");
                     code = -1;
                  }
                  else {
                     safecpy(lib_path, arg, MAX_LINELEN);
                     banner();
                     fprintf(stderr, "setting library path = %s\n", lib_path);
                  }
                  break;

               case 'M':
                  modifier = 0;
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -M requires an argument\n");
                     code = -1;
                  }
                  else {
                     if ((arg[0] == '$')) {
                        // hex parameter (such as $ABCD)
                        sscanf(&arg[1], "%x", &memory);
                     }
                     else if ((arg[0] == '0')
                     && ((arg[1] == 'x')||(arg[1] == 'X'))) {
                        // hex parameter (such as 0xFFFF or 0XA000)
                        sscanf(&arg[2], "%x", &memory);
                     }
                     else {
                        // decimal parameter, perhaps with modifier
                        // (such as 4k or 16m)
                        sscanf(arg, "%d%c", &memory, &modifier);
                     }
                  }
                  if (tolower(modifier) == 'k') {
                     memory *= 1024;
                  }
                  else if (tolower(modifier) == 'm') {
                     memory *= 1024 * 1024;
                  }
                  if (verbose) {
                     banner();
                     fprintf(stderr, "maximum memory = %d\n", memory);
                  }
                  break;

               case 'p':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -p requires an argument\n");
                     code = -1;
                  }
                  else {
                     sscanf(arg, "%d", &prop_vers);
                  }
                  if (verbose) {
                     banner();
                     fprintf(stderr, "propeller hardware version = %d\n", prop_vers);
                  }
                  if ((prop_vers < 1) || (prop_vers > 2)) {
                     banner();
                     fprintf(stderr, "Unknown propeller hardware version = %d\n", prop_vers);
                     code = -1;
                  }
                  if (prop_vers == 2) {
                     // The P2 requires the use of p2asm as the assembler
                     assembler = 2;
                     if (layout < 0) {
                        layout = 11;
                        if (verbose) {
                           banner();
                           fprintf(stderr, "option -p2 implies -x11\n");
                        }
                     }
                  }
                  break;

               case 'P':
                  modifier = 0;
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -P requires an argument\n");
                     code = -1;
                  }
                  else {
                     if ((arg[0] == '$')) {
                        // hex parameter (such as $ABCD)
                        sscanf(&arg[1], "%x", &readwrite);
                     }
                     else if ((arg[0] == '0')
                     && ((arg[1] == 'x')||(arg[1] == 'X'))) {
                        // hex parameter (such as 0xFFFF or 0XA000)
                        sscanf(&arg[2], "%x", &readwrite);
                     }
                     else {
                        // decimal parameter, perhaps with modifier
                        // (such as 4k or 16m)
                        sscanf(arg, "%d%c", &readwrite, &modifier);
                     }
                  }
                  if (tolower(modifier) == 'k') {
                     readwrite *= 1024;
                  }
                  else if (tolower(modifier) == 'm') {
                     readwrite *= 1024 * 1024;
                  }
                  if (verbose) {
                     banner();
                     fprintf(stderr, "readwrite address = %d\n", readwrite);
                  }
                  break;

               case 'q':
                  quickbuild = 1;   /* enable quick build */
                  catalina_symboldef("QUICKBUILD", "");
                  if (verbose) {
                     fprintf(stderr, "quick build enabled\n");
                  }
                  break;

               case 'Q':
                  quickforce = 1;   /* enable quick force */
                  catalina_symboldef("QUICKFORCE", "");
                  if (verbose) {
                     fprintf(stderr, "quick build forced\n");
                  }
                  break;

               case 'R':
                  modifier = 0;
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -R requires an argument\n");
                     code = -1;
                  }
                  else {
                     if ((arg[0] == '$')) {
                        // hex parameter (such as $ABCD)
                        sscanf(&arg[1], "%x", &readonly);
                     }
                     else if ((arg[0] == '0')
                     && ((arg[1] == 'x')||(arg[1] == 'X'))) {
                        // hex parameter (such as 0xFFFF or 0XA000)
                        sscanf(&arg[2], "%x", &readonly);
                     }
                     else {
                        // decimal parameter, perhaps with modifier
                        // (such as 4k or 16m)
                        sscanf(arg, "%d%c", &readonly, &modifier);
                     }
                  }
                  if (tolower(modifier) == 'k') {
                     readonly *= 1024;
                  }
                  else if (tolower(modifier) == 'm') {
                     readonly *= 1024 * 1024;
                  }
                  if (verbose) {
                     banner();
                     fprintf(stderr, "readonly address = %d\n", readonly);
                  }
                  break;

               case 'o':
                  output_named = 1;
                  output_override = 1;
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -o requires an argument\n");
                     code = -1;
                  }
                  else {
                     safecpy(out_name,"", MAX_LINELEN);
                     pathcat(out_name, arg, NULL, MAX_LINELEN);
                  }
                  if (verbose) {
                     banner();
                     fprintf(stderr, "output file = %s\n", out_name);
                  }
                  break;

               case 'O':
                  if (verbose) {
                     banner();
                     fprintf(stderr, "optimize code - listing selected\n");
                  }
                  listing = 1;
                  if (strlen(argv[i]) == 2) {
                     // no optimization level - assume 5
                     olevel = 5;
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &olevel);
                  }
                  if ((olevel < 0) || (olevel > 9)) {
                     olevel = 1; // olevel must be 0 to 9
                  }
                  if (verbose) {
                     fprintf(stderr, "optimization level %d\n", olevel);
                  }
                  break;

               case 'S':
                  asm_only = 1;
                  if (verbose) {
                     banner();
                     fprintf(stderr, "compile to assembly only\n");
                  }
                  safecat(lcc_opt, "-S ", MAX_LINELEN);
                  break;

               case 't':
                  if (target_named) {
                     banner();
                     fprintf(stderr, "option -t will override current target (%s)\n", tgt_name);
                  }
                  target_named = 1;
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -t requires an argument\n");
                     code = -1;
                  }
                  else {
                     safecpy(tgt_name, arg, MAX_LINELEN);
                  }
                  if (verbose) {
                     banner();
                     fprintf(stderr, "target name = %s\n", tgt_name);
                  }
                  break;

               case 'T':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -T requires an argument\n");
                     code = -1;
                  }
                  else {
                     safecpy(tgt_path, arg, MAX_LINELEN);
                  }
                  if (verbose) {
                     banner();
                     fprintf(stderr, "setting target path = %s\n", tgt_path);
                  }
                  break;

               case 'U':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -U requires an argument\n");
                     code = -1;
                  }
                  else {
                     // Note that we undefine the symbol both for LCC and also for the 
                     // binder, but for LCC we prefix it with "__CATALINA_" to avoid
                     // colliding with user symbols
                     safecat(lcc_opt, "-U__CATALINA_", MAX_LINELEN);
                     safecat(lcc_opt, arg, MAX_LINELEN);
                     safecat(lcc_opt, " -Wl-U", MAX_LINELEN);
                     safecat(lcc_opt, arg, MAX_LINELEN);
                     safecat(lcc_opt, " ", MAX_LINELEN);
                     if (verbose) {
                        banner();
                        fprintf(stderr, "undefine symbol %s\n", arg);
                     }
                  }
                  break;

               case 'u':
                  untidy = 1;
                  if (verbose) {
                     banner();
                     fprintf(stderr, "untidy mode\n");
                     fprintf(stderr, "passing switch %s\n", argv[i]);
                  }
                  pathcat(lcc_opt, argv[i], NULL, MAX_LINELEN);
                  safecat(lcc_opt, " ", MAX_LINELEN);
                  break;

               case 'v':
                  verbose++;
                  if ((verbose + diagnose) == 1) {
                     banner();
                  }
                  if (diagnose) {
                     fprintf(stderr, "verbosity level %d\n", verbose);
                  }
                  break;

               case 'W':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -W requires an argument\n");
                     code = -1;
                  }
                  else {
                     safecat(lcc_opt, arg, MAX_LINELEN);
                     safecat(lcc_opt, " ", MAX_LINELEN);
                     if (verbose) {
                        banner();
                        fprintf(stderr, "passing option %s\n", arg);
                     }
                  }
                  break;

               case 'x':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     banner();
                     fprintf(stderr, "option -x requires an argument\n");
                     code = -1;
                  }
                  else {
                     sscanf(arg, "%d", &layout);
                  }
                  if (diagnose) {
                     banner();
                     fprintf(stderr, "memory layout %d\n", layout);
                  }
                  if ((layout == 7) || (layout > 11)) {
                     banner();
                     fprintf(stderr, "unknown memory layout %d - using layout 0\n", layout);
                     layout = 0;
                  }
                  if (layout == 1) {
                     if (!eeprom) {
                        if (verbose) {
                           banner();
                           fprintf(stderr, "option -x1 implies -C EEPROM\n");
                        }
                        catalina_symboldef("EEPROM", "");
                        eeprom = 1;
                     }
                  }
                  if (layout == 3) {
                     if (!flash) {
                        if (verbose) {
                           banner();
                           fprintf(stderr, "option -x3 implies -C FLASH\n");
                        }
                        catalina_symboldef("FLASH", "");
                        flash = 1;
                     }
                  }
                  if (layout == 4) {
                     if (!flash) {
                        if (verbose) {
                           banner();
                           fprintf(stderr, "option -x4 implies -C FLASH\n");
                        }
                        catalina_symboldef("FLASH", "");
                        flash = 1;
                     }
                  }
                  if (layout == 6) {
                     if (!sdcard) {
                        if (verbose) {
                           banner();
                           fprintf(stderr, "option -x6 implies -C SDCARD\n");
                        }
                        catalina_symboldef("SDCARD", "");
                        sdcard = 1;
                     }
                  }
                  if (layout == 9) {
                     if (!eeprom) {
                        if (verbose) {
                           banner();
                           fprintf(stderr, "option -x9 implies -C EEPROM\n");
                        }
                        catalina_symboldef("EEPROM", "");
                        eeprom = 1;
                     }
                  }
                  if (layout == 10) {
                     if (!sdcard) {
                        if (verbose) {
                           banner();
                           fprintf(stderr, "option -x10 implies -C SDCARD\n");
                        }
                        catalina_symboldef("SDCARD", "");
                        sdcard = 1;
                     }
                  }
                  break;

               case 'g':
                  if (standard > 90) {
                       banner();
                       fprintf(stderr, "debug incompatible with selected C standard - ignoring\n");
                  }
                  else {
                     if (verbose) {
                        banner();
                        fprintf(stderr, "generate debug information - listing selected\n");
                     }
                     listing = 1;
                     if (strlen(argv[i]) == 2) {
                        glevel = 1;
                     }
                     else {
                        // use remainder of this arg
                        sscanf(&argv[i][2], "%d", &glevel);
                     }
                     if ((glevel <= 0) || (glevel > 9)) {
                        glevel = 1; // glevel must be 1 to 9
                     }
                     if (verbose) {
                        fprintf(stderr, "debugging level %d\n", glevel);
                     }
                     optnum[0] = '0' + glevel;
                     optnum[1] = ' ';
                     optnum[2] = '\0';
                     safecat(lcc_opt, argv[i], MAX_LINELEN);
                     safecat(lcc_opt, " -Wl-g", MAX_LINELEN);
                     safecat(lcc_opt, optnum, MAX_LINELEN);
                     safecat(lcc_opt, " -Wf-g", MAX_LINELEN);
                     safecat(lcc_opt, optnum, MAX_LINELEN);
                     catalina_symboldef("BLACKBOX", "");
                     if (target_named) {
                        banner();
                        fprintf(stderr, "option -g will NOT override current target (%s)\n", tgt_name);
                     }
                     else {
                        safecpy(tgt_name, DEBUG_TARGET, MAX_LINELEN);
                        target_named = 1;
                     }
                  }
                  break;

               case 'y':
                  listing = 1;
                  if (verbose) {
                     banner();
                     fprintf(stderr, "listing selected\n");
                  }
                  break;

               case 'Z':
                  if (standard > 90) {
                       banner();
                       fprintf(stderr, "Parallelizer incompatible with selected C standard - ignoring\n");
                  }
                  else {
                     parallel = 1;
                     if (verbose) {
                        banner();
                        fprintf(stderr, "Parallelizer will be invoked on files following '-Z'\n");
                     }
                  }
                  break;

               case 'z':
                  parallel = 0;
                  if (verbose) {
                     banner();
                     fprintf(stderr, "Parallelizer will not be invoked on files following '-z'\n");
                  }
                  break;

               default:
                  // unrecognized switch - just pass it on
                  if (verbose) {
                     banner();
                     fprintf(stderr, "passing switch %s\n", argv[i]);
                  }
                  pathcat(lcc_opt, argv[i], NULL, MAX_LINELEN);
                  safecat(lcc_opt, " ", MAX_LINELEN);
                  break;

            }
         }
         else {
            // assume its a filename
            file_count++;
            if (!output_named) {
               char *dot;
               safecpy(out_name, argv[i], MAX_LINELEN);
               if ((dot = strchr(out_name, '.')) != NULL) {
                  output_named = 1;
                  *dot = '\0';
               }
               if (verbose) {
                  banner();
                  fprintf(stderr, "setting output to %s\n", out_name);
               }
            }
            if (parallel) {
               // remember name of input file (output file is adjusted input file)
               pathcat(par_files, argv[i], NULL, MAX_LINELEN);
               safecat(par_files, " ", MAX_LINELEN);
               // add name of output file (adjusted input file) to lcc command
               pathcat(lcc_opt, argv[i], NULL, MAX_LINELEN);
               adjust_filename(lcc_opt, MAX_LINELEN);
               safecat(lcc_opt, " ", MAX_LINELEN);
               // remember adjusted input file name so we can delete it later
               pathcat(del_files, argv[i], NULL, MAX_LINELEN);
               adjust_filename(del_files, MAX_LINELEN);
               safecat(del_files, " ", MAX_LINELEN);
               // keep count of files to be parallelized
               par_count++;
            }
            else {
               // add input file name to lcc command
               pathcat(lcc_opt, argv[i], NULL, MAX_LINELEN);
               safecat(lcc_opt, " ", MAX_LINELEN);
            }
            if (verbose) {
               banner();
               fprintf(stderr, "passing filename %s\n", argv[i]);
            }
         }
      }
      i++; // next argument
   }

   // now finalize accumulated options 

   // append preset paths
   temp_path[0]='\0';
   safecpy(temp_path, catalina_getenv(DEFAULT_INC_ENV), MAX_LINELEN);
   if (strlen(temp_path) != 0) {
      if (strlen(inc_path) != 0) {
         safecat(inc_path, MULT_PATH_SEP, MAX_LINELEN);
      }
      safecat(inc_path, temp_path, MAX_LINELEN);
   }

   if (verbose > 0) {
      safecat(lcc_opt, "-v ", MAX_LINELEN);
      for (i = 0; i < verbose; i++) {
         safecat(lcc_opt, "-Wl-v ", MAX_LINELEN);
      }
   }
   if (quickbuild) {
      safecat(lcc_opt, "-Wl-q ", MAX_LINELEN);
   }
   if (quickforce) {
      safecat(lcc_opt, "-Wl-Q ", MAX_LINELEN);
   }
   if (suppress == 1) {
      safecat(lcc_opt, "-Wl-k ", MAX_LINELEN);
   }
   if (diagnose > 0) {
      for (i = 0; i < diagnose; i++) {
         safecat(lcc_opt, "-Wl-d ", MAX_LINELEN);
      }
   }
   if (format == 1) {
      safecat(lcc_opt, "-Wl-w-b ", MAX_LINELEN);
   }
   if (format == 2){
      safecat(lcc_opt, "-Wl-w-e ", MAX_LINELEN);
   }
   if (memory > 0) {
      sprintf(option, "-Wl-M%d ", memory);
      safecat(lcc_opt, option, MAX_LINELEN);
   }
   if (readonly > 0) {
      sprintf(option, "-Wl-R%d ", readonly);
      safecat(lcc_opt, option, MAX_LINELEN);
   }
   if (readwrite > 0) {
      sprintf(option, "-Wl-P%d ", readwrite);
      safecat(lcc_opt, option, MAX_LINELEN);
   }
   if (heaptop > 0) {
      sprintf(option, "-Wl-H%d ", heaptop);
      safecat(lcc_opt, option, MAX_LINELEN);
   }
   if (listing == 1) {
      safecat(lcc_opt, "-Wl-w-l ", MAX_LINELEN);
   }
   if (diagnose) {
      banner();
      fprintf(stderr, "executable name = %s\n", argv[0]);
   }
   if (output_named) {
      if (output_override || (!asm_only && !comp_only)) {
         safecat(lcc_opt, "-o ", MAX_LINELEN);
         pathcat(lcc_opt, out_name, NULL, MAX_LINELEN);
         safecat(lcc_opt, " ", MAX_LINELEN);
      }
   }

   if (target_named) {
      safecat(lcc_opt, "-Wl-t", MAX_LINELEN);
      pathcat(lcc_opt, tgt_name, NULL, MAX_LINELEN);
      safecat(lcc_opt, " ", MAX_LINELEN);
   }
   return code;
}


void main(int argc, char *argv[]) {
   int  result = 0;
   char temp_env[MAX_LINELEN + 1] = "";
   char option[MAX_LINELEN + 3 + 1];
   char path_sfx[MAX_LINELEN + 1];
   char optnum[3];
   char *define;

   // get default path values from the environment
   safecpy(lcc_path, catalina_getenv(DEFAULT_LCC_ENV), MAX_LINELEN);
   safecpy(lib_path, catalina_getenv(DEFAULT_LIB_ENV), MAX_LINELEN);
   safecpy(tmp_path, catalina_getenv(DEFAULT_TMP_ENV), MAX_LINELEN);
   safecpy(tgt_path, catalina_getenv(DEFAULT_TGT_ENV), MAX_LINELEN);

   // set the default LCC path if not set from the environment
   if (strlen(lcc_path) == 0) {
      safecpy(lcc_path, DEFAULT_LCCDIR, MAX_LINELEN);
   }

   // set up the default path (also used to display the help defaults)
   safecpy(def_tgt_path, lcc_path, MAX_LINELEN);
   safecat(def_tgt_path, DEFAULT_SEP, MAX_LINELEN);
   safecat(def_tgt_path, TGT_SUFFIX, MAX_LINELEN);
   safecpy(def_lib_path, lcc_path, MAX_LINELEN);
   safecpy(def_inc_path, lcc_path, MAX_LINELEN);
   safecat(def_inc_path, DEFAULT_SEP, MAX_LINELEN);
   safecat(def_inc_path, INC_SUFFIX, MAX_LINELEN);

   // decode the arguments (which may override the default paths)
   if (result = decode_arguments(argc, argv) != 0) {
      if (verbose) {
         fprintf(stderr, "decoding arguments returned result %d\n", result);
      }
   }

   // set up the LCC command with any default options from the environment
   if ((standard == 89) || (standard == 90)) {
      // use cpp as our preprocessor (by using the command lcc)
      safecpy(lcc_cmd, "lcc ", MAX_LINELEN);
   }
   else {
      // use cake as our preprocessor (by using the command clcc)
      if (cake_color) {
         // allow Cake to use colors 
         safecpy(lcc_cmd, "clcc ", MAX_LINELEN);
      }
      else {
         // disable Cake's use of color
         safecpy(lcc_cmd, "clcc -Wp-fdiagnostics-format=msvc ", MAX_LINELEN);
      }
   }

   // print banner now if not suppressed and not already printed
   if (suppress == 0) {
      banner();
   }

   if (diagnose) {
      fprintf(stderr, "result of decoding arguments = %d\n", result);
   }

   // get any Catalina symbols defined by the environment variables
   safecpy(temp_env, catalina_getenv(DEFAULT_DEF_ENV), MAX_LINELEN);
   define = strtok(temp_env, " :;,");
   while (define != NULL) {
      // Note that we define the Catalina symbol both for LCC and also for
      // the binder, but for LCC we preceed the symbol with "__CATALINA_"
      // to avoid colliding with any user symbols
      if (pass_symbol_to_compiler(define, &result)) {
         catalina_symboldef(define, "");
         if (verbose) {
            fprintf(stderr, "define symbol %s\n", define);
         }
      }
      define = strtok(NULL, " :;,");
   }
   if (diagnose) {
      fprintf(stderr, "result of decoding %s = %d\n", DEFAULT_DEF_ENV, result);
   }
   if (result < 0) {
      if (diagnose) {
         fprintf(stderr, "%s exiting\n", argv[0]);
      }
      exit(result);
   }

   // calculate clock frequency if requested (via -f)
   if (reqd_freq != 0) {
      if (prop_vers != 2) {
         fprintf(stderr, "Clock setting (via -f, -F & -E) is only supported on the Propeller 2\n");
      }
      else {
         calc_freq(xtal_freq, reqd_freq, err_freq);
         if  (result_Fout == 0) {
            fprintf(stderr, "Required frequency not possible within error limit - defaults will be used\n");
         }
      }
   }

   // output the xtal frequency if we used it to calculate clock parameters, 
   // or it was specified separately on the command line
   if ((result_Fout != 0) || (reqd_xtal != 0)) {
      char clockstr[12] = "";

      // note that while we check reqd_extal, we actually send xtal_freq
      sprintf(clockstr, "%u", xtal_freq);
      if (verbose) {
         printf("_CLOCK_XTAL = %s\n",clockstr); 
      }
      catalina_symboldef("_CLOCK_XTAL", clockstr);
   }

   // output the three clock parameters if we calculated them
   if (result_Fout != 0) {
      char clockstr[12] = "";

      sprintf(clockstr, "%u", result_divd);
      if (verbose) {
         printf("_CLOCK_XDIV = %s\n",clockstr); 
      }
      catalina_symboldef("_CLOCK_XDIV", clockstr);
      
      sprintf(clockstr, "%u", result_mult);
      if (verbose) {
         printf("_CLOCK_MULT = %s\n",clockstr); 
      }
      catalina_symboldef("_CLOCK_MULT", clockstr);
      
      sprintf(clockstr, "%u", result_post);
      if (verbose) {
         printf("_CLOCK_DIVP = %s\n",clockstr); 
      }
      catalina_symboldef("_CLOCK_DIVP", clockstr);
      
   }

   // pass baud rate if requested (via -B)
   if (baud_rate != 0) {
      if (prop_vers != 2) {
         fprintf(stderr, "Baud Rate setting (via -B) is only supported on the Propeller 2\n");
      }
      else {
         char baudstr[12] = "";
         sprintf(baudstr, "%u", baud_rate);
         catalina_symboldef("_BAUDRATE", baudstr);
      }
   }

   // if the paths have not been set from the environment 
   // or on the command line, then use the defaults

   if (diagnose) {
      printf("lcc path = %s\n", lcc_path);
   }

   if (strlen(lib_path) == 0) {
      safecpy(lib_path, def_lib_path, MAX_LINELEN);
      if (diagnose) {
         printf("library path = %s\n", lib_path);
      }
   }
   if (strlen(tgt_path) == 0) {
      // if no path specified, set up default target path 
      safecpy(tgt_path, def_tgt_path, MAX_LINELEN);
      if (diagnose) {
         printf("target path = %s\n", tgt_path);
      }
   }
   if (strlen(inc_path) == 0) {
      safecpy(inc_path, def_inc_path, MAX_LINELEN);
      if (diagnose) {
         printf("include path = %s\n", inc_path);
      }
   }

   // add optimization level to the LCC command if specified
   if (olevel != 0) {
      optnum[0] = '0' + olevel;
      optnum[1] = ' ';
      optnum[2] = '\0';
      safecat(lcc_opt, " -Wl-O", MAX_LINELEN);
      safecat(lcc_opt, optnum, MAX_LINELEN);
   }


   // add the paths to the LCC command
   if (strlen(tgt_path) > 0) {
      safecat(lcc_opt, "-Wl-T", MAX_LINELEN);
      pathcat(lcc_opt, tgt_path, NULL, MAX_LINELEN);
      safecat(lcc_opt, " ", MAX_LINELEN);
   }
   if (strlen(tmp_path) > 0) {
      safecat(lcc_opt, "-tempdir=", MAX_LINELEN);
      pathcat(lcc_opt, tmp_path, NULL, MAX_LINELEN);
      safecat(lcc_opt, " ", MAX_LINELEN);
   }
   if (strlen(inc_path) > 0) {
      safecat(lcc_opt, "-I", MAX_LINELEN);
      pathcat(lcc_opt, inc_path, NULL, MAX_LINELEN);
      safecat(lcc_opt, " ", MAX_LINELEN);
   }

   // specify layout and library path
   if (layout < 0) {
      // no layout specified - use layout 0
      layout = 0;
   }
   sprintf(option, "-Wl-x%d ", layout);
   safecat(lcc_opt, option, MAX_LINELEN);

   // specify assembler
   if (assembler == 1) {
      catalina_symboldef("OPENSPIN__", "");
      safecat(lcc_opt, "-Wl-as ", MAX_LINELEN);
   }
   if (assembler == 2) {
      catalina_symboldef("P2PASM__", "");
      safecat(lcc_opt, "-Wl-ap ", MAX_LINELEN);
   }

   if (layout == 11) {
      if (prop_vers == 1) {
         // Propeller 1 (note - NATIVE mode on P1 not supported yet!)
         safecat(lcc_opt, "-target=catalina_native/win32 ", MAX_LINELEN);
         catalina_symboldef("NATIVE", "");
         if ((asm_only == 0) && (comp_only == 0)) {
            safecat(lcc_opt, "-L", MAX_LINELEN);
            pathcat(lcc_opt, lib_path, NULL, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, P1_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, NATIVE_LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, " ", MAX_LINELEN);
         }
      }
      else {
         // Propeller 2
         safecat(lcc_opt, "-target=catalina_native_p2/win32 -Wl-p2 ", MAX_LINELEN);
         catalina_symboldef("NATIVE", "");
         catalina_symboldef("P2", "");
         if ((asm_only == 0) && (comp_only == 0)) {
            safecat(lcc_opt, "-L", MAX_LINELEN);
            pathcat(lcc_opt, lib_path, NULL, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, P2_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, NATIVE_LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, " ", MAX_LINELEN);
         }
      }
   }  
   else if ((layout == 0) || (layout == 1) || (layout == 6)) {
      // use normal model code generator, and indicate LMM (TINY)
      if (prop_vers == 1) {
         // Propeller 1
         catalina_symboldef("TINY", "");
         if ((asm_only == 0) && (comp_only == 0)) {
            safecat(lcc_opt, "-L", MAX_LINELEN);
            pathcat(lcc_opt, lib_path, NULL, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, P1_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, SMALL_LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, " ", MAX_LINELEN);
         }
      }
      else {
         // Propeller 2
         safecat(lcc_opt, "-target=catalina_p2/win32 -Wl-p2 ", MAX_LINELEN);
         catalina_symboldef("TINY", "");
         catalina_symboldef("P2", "");
         if ((asm_only == 0) && (comp_only == 0)) {
            safecat(lcc_opt, "-L", MAX_LINELEN);
            pathcat(lcc_opt, lib_path, NULL, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, P2_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, SMALL_LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, " ", MAX_LINELEN);
         }
      }
   }
   else if ((layout == 2) || (layout == 4)) {
      if (prop_vers == 1) {
         // Propeller 1
         // use normal model code generator, but indicate XMM (SMALL)
         catalina_symboldef("SMALL", "");
         if ((asm_only == 0) && (comp_only == 0)) {
            safecat(lcc_opt, "-L", MAX_LINELEN);
            pathcat(lcc_opt, lib_path, NULL, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, P1_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, SMALL_LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, " ", MAX_LINELEN);
         }
      }
      else {
         // Propeller 2
         // use normal model code generator, but indicate XMM (SMALL)
         catalina_symboldef("SMALL", "");
         catalina_symboldef("P2", "");
         safecat(lcc_opt, "-Wl-p2 ", MAX_LINELEN);
         if ((asm_only == 0) && (comp_only == 0)) {
            safecat(lcc_opt, "-L", MAX_LINELEN);
            pathcat(lcc_opt, lib_path, NULL, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, P2_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, SMALL_LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, " ", MAX_LINELEN);
         }
      } 
   }
   else if ((layout == 3) || (layout == 5)) {
      if (prop_vers == 1) {
         // Propeller 1
         // use large model code generator, and indicate XMM (LARGE)
         safecat(lcc_opt, "-target=catalina_large/win32 ", MAX_LINELEN);
         catalina_symboldef("LARGE", "");
         if ((asm_only == 0) && (comp_only == 0)) {
            safecat(lcc_opt, "-L", MAX_LINELEN);
            pathcat(lcc_opt, lib_path, NULL, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, P1_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, LARGE_LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, " ", MAX_LINELEN);
         }
      }
      else {
         // Propeller 2
         // use large model code generator, and indicate XMM (LARGE)
         safecat(lcc_opt, "-target=catalina_large/win32 -Wl-p2 ", MAX_LINELEN);
         catalina_symboldef("LARGE", "");
         catalina_symboldef("P2", "");
         if ((asm_only == 0) && (comp_only == 0)) {
            safecat(lcc_opt, "-L", MAX_LINELEN);
            pathcat(lcc_opt, lib_path, NULL, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, P2_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, LARGE_LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, " ", MAX_LINELEN);
         }
      }
   }
   else if ((layout == 8) || (layout == 9) || (layout == 10)) {
      // use compact code generator, and indicate CMM (COMPACT)
      if (prop_vers == 1) {
         // Propeller 1
         safecat(lcc_opt, "-target=catalina_compact/win32 ", MAX_LINELEN);
         catalina_symboldef("COMPACT", "");
         if ((asm_only == 0) && (comp_only == 0)) {
            safecat(lcc_opt, "-L", MAX_LINELEN);
            pathcat(lcc_opt, lib_path, NULL, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, P1_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, COMPACT_LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, " ", MAX_LINELEN);
         }
      }
      else {
         // Propeller 2
         safecat(lcc_opt, "-target=catalina_compact/win32 -Wl-p2 ", MAX_LINELEN);
         catalina_symboldef("COMPACT", "");
         catalina_symboldef("P2", "");
         if ((asm_only == 0) && (comp_only == 0)) {
            safecat(lcc_opt, "-L", MAX_LINELEN);
            pathcat(lcc_opt, lib_path, NULL, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, P2_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, DEFAULT_SEP, MAX_LINELEN);
            safecat(lcc_opt, COMPACT_LIB_SUFFIX, MAX_LINELEN);
            safecat(lcc_opt, " ", MAX_LINELEN);
         }
      }
   }
   else {
      fprintf(stderr, "Unknown memory layout %d\n", layout);
      exit(-1);
   }

   temp_env[0]='\0';
   safecpy(temp_env, catalina_getenv(DEFAULT_INC_ENV), MAX_LINELEN);
   if (diagnose && strlen(temp_env) > 0) {
      fprintf(stderr, "%s = %s\n", DEFAULT_INC_ENV, temp_env);
   }
   temp_env[0]='\0';
   safecpy(temp_env, catalina_getenv(DEFAULT_LIB_ENV), MAX_LINELEN);
   if (diagnose && strlen(temp_env) > 0) {
      fprintf(stderr, "%s = %s\n", DEFAULT_LIB_ENV, temp_env);
   }
   temp_env[0]='\0';
   safecpy(temp_env, catalina_getenv(DEFAULT_TMP_ENV), MAX_LINELEN);
   if (diagnose && (strlen(temp_env) > 0)) {
      fprintf(stderr, "%s = %s\n", DEFAULT_TMP_ENV, temp_env);
   }
   temp_env[0]='\0';
   safecpy(temp_env, catalina_getenv(DEFAULT_TGT_ENV), MAX_LINELEN);
   if (diagnose && (strlen(temp_env) > 0)) {
      fprintf(stderr, "%s = %s\n", DEFAULT_TGT_ENV, temp_env);
   }
   temp_env[0]='\0';
   safecpy(temp_env, catalina_getenv(DEFAULT_LCC_ENV), MAX_LINELEN);
   if (diagnose && (strlen(temp_env) > 0)) {
      fprintf(stderr, "%s = %s\n", DEFAULT_LCC_ENV, temp_env);
   }
   temp_env[0]='\0';
   safecpy(temp_env, catalina_getenv(DEFAULT_OPT_ENV), MAX_LINELEN);
   if (diagnose && (strlen(temp_env) > 0)) {
      fprintf(stderr, "%s = %s\n", DEFAULT_OPT_ENV, temp_env);
   }
   
   if (result < 0) {
      if (diagnose) {
         fprintf(stderr, "%s exiting\n", argv[0]);
      }
      exit(result);
   }

   safecat(lcc_cmd, lcc_opt, MAX_LINELEN);
   safecat(lcc_cmd, " ", MAX_LINELEN);
   safecat(lcc_cmd, catalina_getenv(DEFAULT_OPT_ENV), MAX_LINELEN);
   safecat(lcc_cmd, " ", MAX_LINELEN);

   if (verbose && (file_count > 0)) {
      fprintf(stderr, "lcc command = %s\n", lcc_cmd);
   }

   if (par_count > 0) {
      // generate parallelized files
      parallelize(par_files);
   
   }
   if ((result = system(lcc_cmd)) != 0) {
      if (diagnose) {
         fprintf(stderr, "lcc command returned result %d\n", result);
      }
   }
   if ((par_count > 0) && (!untidy)) {
      // delete parallelized files
      delete(del_files);
   }

   if (diagnose) {
      fprintf(stderr, "\n%s done\n", argv[0]);
   }
   exit(result);
}
