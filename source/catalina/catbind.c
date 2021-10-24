/*
 * Bind - binder and library manager for the Catalina compilation system 
 *        for the Parallax Propeller.
 *
 * version 1.0 - initial beta release
 * version 1.1 - add code to differentiate undefined symbols from multiply
 *               defined symbols, and unmangle C symbol names.
 * version 1.2 - Separate Code, Cnst, Init & Data segments.
 *               Add -x segment layout option (0 for LMM, 1 or 2 for XMM).
 * version 1.3 - Make Homespun the default compiler.
 *               Add -M option to specify XMM memory size.
 *               Allow for XMM or LMM specific progbeg and progend files.
 * version 1.4 - Resolve ALL references in input files, not just 'main'.
 *               Unmangling names is no longer necessary.
 *               Combine the XMM target with the output of the assembler to
 *               make a loadable eeprom or binary file.
 *               Add support for EMM (-x1 now means EMM).
 *               Simplify error messages if not verbose or diagnose mode.
 * Version 1.5 - Add support for XMM Layouts 3, 4 & 5.
 * Version 1.6 - Fixed XMM Layout 5.
 *               Made all copies buffer safe.
 *               Add -D and -U to #define (or undefine) symbols. A default
 *               symbol is initially defined to indicate some default
 *               behaviour - but this can be undefined if required. These
 *               options are intended to allow the default behaviour of 
 *               particular targets to be overridden during the compile
 *               process - but this also means that EMM and XMM targets
 *               now have to be compiled every time they are used. Note
 *               that the ordering of defines and undefines makes no
 *               difference, and that ANY undefine takes precedence over 
 *               ANY define(s) of the same symbol. Also note that NO
 *               #defines (not even the default) are generated if the 
 *               -P option is specified - this is so that Catalina can 
 *               still use SPIN compilers that do not have any #define 
 *               capabilities - of course such a SPIN compiler can only 
 *               be used with targets that themselves contain no #defines.
 *
 * Version 2.0 - Renamed this program to 'bind', to make way for 'catalina'
 *               to be used as the name of the command line wrapper (with 
 *               simpler options).
 *
 *               Preprocess a predefined list of input files, to include
 *               any #defines.
 *
 *               Removed predefined default symbol (no longer needed).
 *
 *               Add ability to interpret 'k' and 'm' suffixes to -M option.
 *
 *               Switch -S renamed to -B (for compatibility with LCC and
 *               catalina).
 *
 *               Allow -F option on LMM as well as EMM/XMM compiles.
 *
 * Version 2.1 - Just update version number.
 *
 * Version 2.2 - Just update version number.
 *
 * Version 2.3 - Allow for spaces in file/path names.
 *               Allow upper or lowercase 'k' or 'm' to -M option.
 *
 * Version 2.4 - Remove quotes from filenames when calling file operations
 *               (e.g. fopen, rename, remove).
 *
 *               Write to final file name even when generating intermediate
 *               output so that Homepun uses the right name for listings.
 *
 *               Generate debug file if '-g' specified (any level).
 *
 *               Do not use tmpfile() - doesn't work on Vista (sigh!).
 *
 *               Clean up preprocessed files before exiting - this is so that
 *               multiple users cans compile programs. All users need write
 *               access to the target directory, but if the compiler cannot
 *               overrwrite existing files, it probably means the files are
 *               in use by another user. If preprocessed files are left in 
 *               the target directory for some reason, they can be cleaned 
 *               out using the 'catalina_clean' batch file or script.
 *
 *               Added -u (untidy mode) to disable cleanup (useful when
 *               debugging)
 *
 * Version 2.5 - just update version number.
 *
 * Version 2.6 - Add Optimizer option (-O).
 *
 * Version 2.7 - just update version number.
 *
 * Version 2.8 - support layout 6 - SMM mode (SDCARD Memory Mode).
 *
 * Version 2.9 - Added -q option (to test the use of command line symbols) 
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
 *               Fixed a problem where compilation was not aborted if one
 *               of the assemble commands failed - this resulted in files
 *               being left undeleted, which could cause the NEXT compile
 *               command to produce invalid results.
 *
 * Version 3.0   Add '-P' option to set base address of read-write segments.
 *               This is similar to the existing '-R' option which sets the
 *               base address of the read-only segments. Also, fixed some
 *               errors in calculating the segment sizes in the presence of
 *               the -P or -R command line options.
 *
 *               Added layout 4. Both layout 3 and 4 are intended for use
 *               by programs executing from SPI FLASH, but layout 3 means 
 *               XMM LARGE and layout 4 means XMM SMALL.
 *
 * Version 3.0.3 Use the same algorithm as LCC to locate a directory to use
 *               for temporary files. Also, like LCC, this can be overridden
 *               by setting the CATALINA_TEMPDIR environment variable.
 *
 * Version 3.0.4 If an extension is specified on the output file, remove it.
 *               Quote filenames containing spaces on unix as well as windows.
 *               
 * Version 3.1 - just update version number.
 *
 * Version 3.2 - Make line size 4096 chars.
 *
 * Version 3.3 - Remove default (C3) values for RO & RW segments - now these
 *               values can be specified in the DEF.inc file, which allows 
 *               support for other FLASH devices (such as the RAMPAGE and 
 *               SUPERQUAD boards). This means that values must now be
 *               specified for XMM_RO_BASE_ADDRESS and XMM_RW_BASE_ADDRESS 
 *               for ALL platforms, not just FLASH platforms - even though
 *               these values are currently used only for modes 3 and 4. 
 *
 * Version 3.4 - make the "default" memory size 16M for XMM and Flash.
 *
 * Version 3.5 - Added -C for defining 'Catalina' symbols (which used to be 
 *               defined using -D). Made -D mean define 'C' symbols. Note that 
 *               catalina now also uses -C but that Homespun still use -D. 
 *
 * Version 3.6 - New Memory layout - eliminates unnecessary prologue from HUB,
 *               RAM for all layouts, and removes padding from FLASH memory 
 *               layouts.
 *
 *               Added "in place" compilation, which means Catalina no longer
 *               writes anything to the target directories.
 *
 *               Clean up intermediate kernel file for layout 6.
 *
 *               Improve memory layout code. 
 *
 * Version 3.7 - Added Compact memory model support (CMM). 
 *               Use cmmoptimize instead of catoptimize when compiling cmm.
 *
 * Version 3.8 - Added Compact Memory Model support (CMM) to EEPROM and
 *               SDCARD loaders.
 *               Eliminated emm_progbeg.s & smm_progbeg.s - now we use only
 *               lmm_progbeg.s, cmm_progbeg.s & xmm_progbeg.s (similarly 
 *               for emm_progend.s & smm_progend.s) 
 *
 * Version 3.9 - just update version number.
 *
 * Version 3.10 - just update version number.
 *
 * Version 3.11 - Add support for using openspin as assembler. This is now
 *                the default. The command line syntax has changed (to -as
 *                or -ah) to match the syntax used in catalina.c
 *                Removed bstc support.
 *                Remove compile-time support for file preprocessing - this 
 *                is no longer required since bstc support has been dropped,
 *                and both openspin and homespun support symbols defined on
 *                the command-line.
 *                Added more control over verbosity - default is now minimal
 *                output messages, -v means verbose, -v -v means very verbose.
 *
 * Version 3.12 - Renamed openspin to spinnaker.
 *
 * Version 3.13 - Just update version number.
 *
 * Version 3.15 - Add P2 support. LMM mode only. Propeller 2 indicated by 
 *                flag -p2
 *
 * Version 3.16 - Remove Homespun support. Now openspin is the only assembler
 *                supported on the P1, and p2asm is the only assembler
 *                supported on the P2.
 *              - Define P2_LAYOUT_OFFS
 *
 * Version 3.17 - Just update verion number.
 *
 * Version 4.0  - Just update version number.
 *
 * Version 4.1  - Allow -M, -P and -R accept hexadecimal constants. The number
 *                is treated as hexadecimal if it starts with 0x or $ such
 *                as -P $ABCD or -R0xFFFF
 *                Note that they already accepted modifiers, such as 1k or 2m,
 *                but not with hexadecimal numbers.
 *
 *              - Fixed a bug in specifying a memory size (via -M) in the
 *                internal assemble command.
 *
 *              - Allow -M to be specified when compiling CMM or LMM programs, 
 *                on the P1, so that they can be compiled with the code segment
 *                in upper Hub RAM for dynamic loading. Do not use this option
 *                with CMM or LMM programs intended for normal use. The -M
 *                option is not passed on the P2, so specifying it makes no
 *                difference.
 *
 *              - Error in processing output filename if ".bin" is specified
 *                as the filename extension (e.g. on the P2).
 *
 * Version 4.2  - Just update version number.
 *
 * Version 4.3  - Just update version number.
 *
 * Version 4.4  - Just update version number.
 *
 * Version 4.5  - Just update version number.
 *
 * Version 4.6  - Just update version number.
 *
 * Version 4.7  - Just update version number.
 *
 * Version 4.8  - Just update version number.
 *
 * Version 4.9  - Remove -F and -B command line options.
 *
 *              - Pass the target name to the Catalina Optimizer.
 *
 * Version 4.9.1 - Just update version number.
 *
 * Version 4.9.2 - Just update version number.
 *
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
#include <string.h>
#include <limits.h>
#include <unistd.h>
#include <sys/stat.h>

#define SHORT_LAYOUT_3     1 /* 1 to remove unused bytes when using layout 3 */
#define SHORT_LAYOUT_4     1 /* 1 to remove unused bytes when using layout 4 */
#define SHORT_LAYOUT_5     1 /* 1 to remove unused bytes when using layout 5 */

#define COMPILE_IN_PLACE   1 /* 0 = compile in target, 1 = compile locally */

#define VERSION            "4.9.2"

#define MAX_FILES          500
#define MAX_LIBS           500
#define MAX_LINELEN        4096
#define MAX_PATHLEN        1000
#define MAX_NAMELEN        1000
#define MAX_SYMBOLS        10000
#define MAX_DEFINES        50

#ifdef WIN32_PATHS         /* define this on the command line for Windows */
#define DEFAULT_SEP        "\\"
#define DEFAULT_LCCDIR     "C:\\Program Files (x86)\\Catalina\\" // must match default used by LCC
#define MULT_PATH_SEP      ";"

#else
#define DEFAULT_SEP        "/"
#define DEFAULT_LCCDIR     "/opt/catalina/" // must match default used by LCC
#define MULT_PATH_SEP      ":"
#endif

#define LIB_SUFFIX         "lib"
#define TGT_SUFFIX         "target"

#define DEFAULT_LCC_ENV    "LCCDIR" // can only display this - cannot set it as an option to LCC

#define DEFAULT_LIB_ENV    "CATALINA_LIBRARY"
#define DEFAULT_TGT_ENV    "CATALINA_TARGET"
#define DEFAULT_TMP_DIR    "CATALINA_TEMPDIR"

#define TARGET_PREFIX      "catalina_"
#define TARGET_SUFFIX      ".s"
#define LMM_PREFIX         "lmm_"
#define EMM_PREFIX         "emm_"
#define SMM_PREFIX         "smm_"
#define XMM_PREFIX         "xmm_"
#define CMM_PREFIX         "cmm_"
#define NMM_PREFIX         "nmm_"
#define LMM_KERNEL         "Catalina_LMM.spin"
#define LMM_ALTERNATE      "Catalina_LMM_alternate.spin"
#define LMM_THREADED       "Catalina_LMM_threaded.spin"
#define LMM_BINARY         "Catalina_LMM.binary"
#define CMM_KERNEL         "Catalina_CMM.spin"
#define CMM_ALTERNATE      "Catalina_CMM_alternate.spin"
#define CMM_THREADED       "Catalina_CMM_threaded.spin"
#define CMM_BINARY         "Catalina_CMM.binary"
#define SMM_OFFSET         0x20 // NOTE : THIS IS KERNEL DEPENDENT!!!
#define DEFAULT_TARGET     "default"
#define PROGBEG_SUFFIX     "progbeg"
#define PROGEND_SUFFIX     "progend"
#define DEFAULT_BIND       "Catalina.spin"
#define DEFAULT_BIND_P2    "Catalina.spin2"
#define DEFAULT_RESULT     "a.out"
#define DEFAULT_INDEX      "catalina.index"
#define IMPORT_STRING      "' Catalina Import"
#define EXPORT_STRING      "' Catalina Export"
#define SGMT_PREFIX        "Catalina_"
#define SGMT_STRING        "' Catalina "
#define CODE_STRING        "Code"
#define CNST_STRING        "Cnst"
#define INIT_STRING        "Init"
#define DATA_STRING        "Data"
#define ENDS_STRING        "Ends"
#define FORMAT_CMD         "srec_cat " /* note - space after */

#define ASSEMBLE_OS        "spinnaker -p -a -b "
#define OUTPUT_OPT_OS      " -o "     /* note - space before, space after */
#define TARGET_OPT_OS      " -e -o "  /* note - space before, space after */
#define VERBOSE_OS         "-v "
#define QUIET_OS           "-q "
#define INC_LIB_OPT_OS    " -I "      /* note - space before and after */

#define ASSEMBLE_P2        "p2_asm "
#define OUTPUT_OPT_P2      " -o "     /* note - space before, space after */
#define TARGET_OPT_P2      " -o "     /* note - space before, space after */
#define VERBOSE_P2         ""
#define QUIET_P2           ""
#define INC_LIB_OPT_P2    " -I "      /* note - space before and after */

#define ASSEMBLE_OPT_LMM   "catoptimize " /* note space after */
#define ASSEMBLE_OPT_NMM   "catoptimize " /* note space after */
#define ASSEMBLE_OPT_CMM   "cmmoptimize " /* note space after */
#define TARGET_OPT         "-T "     /* note space after */
#define P2_OPT             "-p2 "    /* note space after */
#define SUPPRESS_OPT       "-k "     /* note space after */
#define DEFAULT_EMM_MEM    "32768"
#define DEFAULT_SMM_MEM    "32768"
#define DEFAULT_XMM_MEM    "16777216"
#define DEFAULT_FLASH_MEM  "16777216"
#define PRE_DEFINE_STRING  "#define " /* note - space after */
#define CMD_DEFINE_STRING  "-D "      /* note - space after */
#define BLACKCAT_CMD       "catdbgfilegen "

#define OUTPUT_SUFFIX      ".spin"
#define OUTPUT_SUFFIX_P2   ".spin2"
#define TEMP_SUFFIX        "_temp"

#define P1_INIT_B0_OFF 0x51 // must match kernels and *mm_progbeg.s
#define P1_INIT_BZ_OFF 0x51
#define P1_LAYOUT_OFFS (P1_INIT_BZ_OFF - P1_INIT_B0_OFF + 0x10)

#define P2_LAYOUT_OFFS     0x1010 // must match Catalina_reserved.inc

#define KERNEL_SIZE        0x0800 // size of kernel (max - 2048 bytes) 
#define HUB_SIZE           0x8000 // size of HUB RAM
#define SECTOR_SIZE        0x0200 // size of XMM prologue (one sector)

static char assemble_opt[MAX_LINELEN + 1] = "";
static char lcc_path[MAX_LINELEN + 1] = "";
static char def_tgt_path[MAX_LINELEN + 1] = "";
static char def_lib_path[MAX_LINELEN + 1] = "";

/* global flags */
static int diagnose  = 0;
static int verbose   = 0;
static int quiet     = 0;
static int olevel    = 0;
static int import    = 0;
static int export    = 0;
static int assemble  = 1;
static int force     = 0;
static int cleanup   = 1; 
static int prop_vers = 1; 
static int format    = 0; // 0 => binary, 1 => eeprom

enum { Code, Cnst, Init, Data };

enum { undefined, redefined, imported, exported, resolving, resolved };

char *state_names[] = {
   "undefined", 
   "redefined", 
   "imported", 
   "exported", 
   "resolving", 
   "resolved" 
};

struct symbol_ref {
   int    state;
   int    refs;
   char * name;
   char * file;
   int    line;
   char * lib;
};

static int input_count = 2;                  /* always process at least two input files */
static char * input_file[MAX_FILES + 3];     /* allow for progbeg, target & progend files */

static int output_count = 0;
static char * output_file[MAX_FILES];

static int lib_count = 0;
static char * input_lib[MAX_LIBS];

static int define_count = 0;
static char * define_symbol[MAX_DEFINES];

static int undefine_count = 0;
static char * undefine_symbol[MAX_DEFINES];

static int layout = 0;

static int memory = 0;

static int memsize = 0;

static int readonly = 0;

static int readwrite = 0;

static int suppress = 0;

static char *target;

static char *result_file;

static char *target_path;

static char *library_path;

static char *temp_path;

static char *path_separator;

static char *output_format;

static int debug_level = 0; // generate debug output (any level)

static char assemble_command[MAX_LINELEN + 1] = ASSEMBLE_OS;
static char assemble_verbose[MAX_LINELEN + 1] = VERBOSE_OS;
static char assemble_quiet[MAX_LINELEN + 1]   = QUIET_OS;
static char inc_lib_opt[MAX_LINELEN + 1]      = INC_LIB_OPT_OS;
static char output_opt[MAX_LINELEN + 1]       = OUTPUT_OPT_OS;
static char target_opt[MAX_LINELEN + 1]       = TARGET_OPT_OS;
static char memory_size[MAX_LINELEN + 1]      = "";
static char assemble_options[MAX_LINELEN + 1] = "";

static char blackcat_command[MAX_LINELEN + 1] = BLACKCAT_CMD;

static int symbol_count = 0;
static struct symbol_ref symbol[MAX_SYMBOLS];

static int p2asm     = 0;   /* 1 for p2asm assembler*/
static int homespun  = 0;   /* 1 for homespun assembler*/
static int spinnaker = 1;   /* 1 for spinnaker assembler (default) */

int print_symbols(int all);

void help(char *my_name) {
   fprintf(stderr, "\nusage: %s [options] [files ...]\n\n", my_name);
   fprintf(stderr, "options:  -? or -h  print this helpful message (and exit)\n");
   fprintf(stderr, "          -a        no assembly (output bound source files only)\n");
   fprintf(stderr, "          -as       use spinnaker as assembler (default)\n");
   fprintf(stderr, "          -ap       use p2asm as assembler\n");
   fprintf(stderr, "          -C symbol #define Catalina 'symbol' before assembling\n");
   fprintf(stderr, "          -d        output diagnostic messages (-d -d for even more messages)\n");
   fprintf(stderr, "          -e        generate export list from input files\n");
   fprintf(stderr, "          -f        force (continue even if errors occur)\n");
   fprintf(stderr, "          -i        generate import list from input files\n");
   fprintf(stderr, "          -k        kill (suppress) statistics output\n");
   fprintf(stderr, "          -L path   path to libraries (default is '%s')\n", def_lib_path);
   fprintf(stderr, "          -l name   search library named 'libname' when binding\n");
   fprintf(stderr, "          -M size   memory size to use (used with -x, default is 16M)\n");
   fprintf(stderr, "          -o name   output results (generate, bind or assemble) to file 'name'\n");
   fprintf(stderr, "          -p ver    Propeller Hardware Version\n");
   fprintf(stderr, "          -P addr   address for Read-Write segments\n");
   fprintf(stderr, "          -R addr   address for Read-Only segments\n");
   fprintf(stderr, "          -O[level] optimize code (default level = 1)\n");
   fprintf(stderr, "          -t name   use target 'name'\n");
   fprintf(stderr, "          -T path   path to target files (default is '%s')\n", def_tgt_path);
   fprintf(stderr, "          -u        do not remove preprocessed and intermediate output files\n");
   fprintf(stderr, "          -U symbol do not #define 'symbol' before assembling \n");
   fprintf(stderr, "          -v        verbose (output information messages)\n");
   fprintf(stderr, "          -v -v     very verbose (more information messages))\n");
   fprintf(stderr, "          -w opt    pass option 'opt' to the assembler (e.g. -w-l, -w-b, -w-e)\n");
   fprintf(stderr, "          -x layout use specified memory layout (layout = 0 .. 6, 8 .. 10)\n");
   fprintf(stderr, "          -z ch     specify separator char for path names (default is '%s')\n", DEFAULT_SEP);
   fprintf(stderr, " exit code is number of undefined/redefined symbols (-1 for other errors)\n");
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


/*
 * decode arguments, building file and library list - return -1 if
 * there is no further processing to do
 */
int decode_arguments (int argc, char *argv[]) {
   char   libname[MAX_LINELEN + 3 + 1];
   char * symbol;
   int    code = 0;
   int    i = 0;
   char   modifier;
   char   memstr[20];
   char   optnum[20];

   if (argc == 1) {
      if (strlen(argv[0]) == 0) {
         // in case my name was not passed in ...
         fprintf(stderr, "Catalina Binder %s\n", VERSION); 
         help("bind");
      }
      else {
         fprintf(stderr, "Catalina Binder %s\n", VERSION); 
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
                  /* fall through to ... */
               case '?':
                  if (strlen(argv[0]) == 0) {
                     // in case my name was not passed in ...
                     help("bind");
                  }
                  else {
                     help(argv[0]);
                  }
                  break;

               case 'i':
                  import = 1;
                  if (verbose) {
                     fprintf(stderr, "note: option -i implies -a (no assembly)\n");
                  }
                  assemble = 0;
                  if (lib_count > 0) {
                     fprintf(stderr, "cannot use -i with -l\n");
                     code = -1; // force exit
                  }
                  if (result_file == NULL) {
                     result_file = DEFAULT_INDEX;
                  }
                  break;

               case 'e':
                  export = 1;
                  if (verbose) {
                     fprintf(stderr, "note: option -i implies -a (no assembly)\n");
                  }
                  assemble = 0;
                  if (lib_count > 0) {
                     fprintf(stderr, "cannot use -e with -l\n");
                     code = -1; // force exit
                  }
                  if (result_file == NULL) {
                     result_file = DEFAULT_INDEX;
                  }
                  break;

               case 'L':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        library_path = strdup(argv[++i]);
                     }
                     else {
                        fprintf(stderr, "option -L requires an argument\n");
                        code = -1;
                        break;
                     }
                     argc--;
                  }
                  else {
                     // use remainder of this arg
                     library_path = strdup(&argv[i][2]);
                  }
                  if (verbose > 1) {
                     fprintf(stderr, "library path = %s\n", library_path);
                  }
                  break;

               case 'l':
                  if (import||export) {
                     fprintf(stderr, "cannot use -l with -i or -e\n");
                     code = -1; // force exit
                  }
                  if (lib_count < MAX_LIBS) {
                     if (strlen(argv[i]) == 2) {
                        // use next arg - prefix with "lib"
                        if (argc > 0) {
                           safecpy(libname, "lib", MAX_LINELEN + 3);
                           safecat(libname, argv[++i], MAX_LINELEN + 3);
                           input_lib[lib_count++] = strdup(libname);
                        }
                        else {
                           fprintf(stderr, "option -l requires an argument\n");
                           code = -1;
                           break;
                        }
                        argc--;
                     }
                     else {
                        // use remainder of this arg - prefix with "lib"
                        safecpy(libname, "lib", MAX_LINELEN + 3);
                        safecat(libname, &argv[i][2], MAX_LINELEN + 3);
                        input_lib[lib_count++] = strdup(libname);
                     }
                  }
                  else {
                     fprintf(stderr, "too many libraries specified\n");
                     code = -1; // force exit
                  }
                  break;

               case 'g':
                  if (strlen(argv[i]) == 2) {
                     debug_level = 1;
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &debug_level);
                  }
                  if (verbose > 1) {
                     fprintf(stderr, "debug level %d\n", debug_level);
                  }
                  break;

               case 'x':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &layout);
                     }
                     else {
                        fprintf(stderr, "option -x requires an argument\n");
                        code = -1;
                        break;
                     }
                     argc--;
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &layout);
                  }
                  if (verbose > 1) {
                     fprintf(stderr, "memory layout %d\n", layout);
                  }
                  if ((layout < 0) || (layout == 7) || (layout > 11)) {
                     fprintf(stderr, "unknown memory layout - using layout 0\n");
                     layout = 0;
                  }
                  if ((layout == 8) || (layout == 9) || (layout == 10)) {
                     safecpy(assemble_opt, ASSEMBLE_OPT_CMM, MAX_LINELEN);
                  }
                  if ((layout == 11)) {
                     safecpy(assemble_opt, ASSEMBLE_OPT_NMM, MAX_LINELEN);
                  }
                  if (verbose > 1) {
                     fprintf(stderr, "using optimizer %s\n", assemble_opt);
                  }
                  break;

               case 'd':
                  diagnose++;   /* increase diagnosis level */
                  if (verbose == 0) {
                     verbose = 1;   /* diagnose implies verbose */
                  }
                  if (diagnose == 1) {
                     fprintf(stderr, "Catalina Binder %s\n", VERSION); 
                  }
                  fprintf(stderr, "diagnostic level %d\n", diagnose);
                  break;

               case 'a':
                  if (strlen(argv[i]) == 3) {
                     // use next char
                     if (argv[i][2] == 'p') {
                        p2asm = 1;
                        homespun = 0;
                        spinnaker = 0;
                        if (verbose > 1) {
                           fprintf(stderr, "using p2asm\n");
                        }
                        safecpy(assemble_command, ASSEMBLE_P2, MAX_LINELEN);
                        safecpy(assemble_verbose, VERBOSE_P2, MAX_LINELEN);
                        safecpy(assemble_quiet, QUIET_P2, MAX_LINELEN);
                        safecpy(inc_lib_opt, INC_LIB_OPT_P2, MAX_LINELEN);
                        safecpy(output_opt, OUTPUT_OPT_P2, MAX_LINELEN);
                        safecpy(target_opt, TARGET_OPT_P2, MAX_LINELEN);
                     } 
                     else if (argv[i][2] == 's') {
                        p2asm = 0;
                        homespun = 0;
                        spinnaker = 1;
                        if (verbose > 1) {
                           fprintf(stderr, "using spinnaker\n");
                        }
                        safecpy(assemble_command, ASSEMBLE_OS, MAX_LINELEN);
                        safecpy(assemble_verbose, VERBOSE_OS, MAX_LINELEN);
                        safecpy(assemble_quiet, QUIET_OS, MAX_LINELEN);
                        safecpy(inc_lib_opt, INC_LIB_OPT_OS, MAX_LINELEN);
                        safecpy(output_opt, OUTPUT_OPT_OS, MAX_LINELEN);
                        safecpy(target_opt, TARGET_OPT_OS, MAX_LINELEN);
                     }
                     else {
                        fprintf(stderr, "unrecognized assembler option - using spinnaker\n");
                     }
                  }
                  else {
                     if (force == 1) {
                        if (verbose) {
                          fprintf(stderr, "note: option -f overrides -a\n");
                        }
                        fprintf(stderr, "option -a ignored\n");
                     }
                     else {
                        assemble = 0;
                        if (verbose) {
                           fprintf(stderr, "no assembly (bind only)\n");
                        }
                     }
                  }
                  break;

               case 'f':
                  force = 1;
                  assemble = 1;
                  if (verbose) {
                     fprintf(stderr, "forcing assembly (even if errors occur)\n");
                  }
                  break;

               case 'o':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        result_file = strdup(argv[++i]);
                     }
                     else {
                        fprintf(stderr, "option -o requires an argument\n");
                        code = -1;
                        break;
                     }
                     argc--;
                  }
                  else {
                     // use remainder of this arg
                     result_file = strdup(&argv[i][2]);
                  }
                  if (verbose) {
                     fprintf(stderr, "output file = %s\n", result_file);
                  }
                  break;

               case 'O':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     olevel = 1;
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &olevel);
                  }
                  if (verbose) {
                     fprintf(stderr, "optimize level %d\n", olevel);
                  }
                  break;

               case 'k':
                  suppress = 1;
                  if (verbose) {
                     fprintf(stderr, "suppress statistics\n");
                  }
                  break;

               case 'M':
                  memory = 1;
                  modifier = 0;
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        i++;
                        if ((argv[i][0] == '$')) {
                           // hex parameter (such as $ABCD)
                           sscanf(&argv[i][1], "%x", &memsize);
                        }
                        else if ((argv[i][0] == '0')
                        && ((argv[i][1] == 'x')||(argv[i][1] == 'X'))) {
                           // hex parameter (such as 0xFFFF or 0XA000)
                           sscanf(&argv[i][2], "%x", &memsize);
                        }
                        else {
                           // decimal parameter, perhaps with modifier
                           // (such as 4k or 16m)
                           sscanf(argv[i], "%d%c", &memsize, &modifier);
                        }
                     }
                     else {
                        fprintf(stderr, "option -M requires an argument\n");
                        code = -1;
                        break;
                     }
                     argc--;
                  }
                  else {
                     // use remainder of this arg
                     if ((argv[i][1] == '$')) {
                        // hex parameter (such as $ABCD)
                        sscanf(&argv[i][2], "%x", &memsize);
                     }
                     else if ((argv[i][1] == '0')
                     && ((argv[i][2] == 'x')||(argv[i][2] == 'X'))) {
                        // hex parameter (such as 0xFFFF or 0XA000)
                        sscanf(&argv[i][3], "%x", &memsize);
                     }
                     else {
                        // decimal parameter, perhaps with modifier
                        // (such as 4k or 16m)
                        sscanf(argv[i], "%d%c", &memsize, &modifier);
                     }
                     sscanf(&argv[i][2], "%d%c", &memsize, &modifier);
                  }
                  if (tolower(modifier) == 'k') {
                     memsize *= 1024;
                  }
                  else if (tolower(modifier) == 'm') {
                     memsize *= 1024 * 1024;
                  }
                  if (verbose) {
                     fprintf(stderr, "memory size = %d\n", memsize);
                  }
                  break;

               case 'p':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &prop_vers);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "option -p requires an argument\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &prop_vers);
                  }
                  if (verbose) {
                     fprintf(stderr, "propeller hardware version = %d\n", prop_vers);
                  }
                  if ((prop_vers < 1) || (prop_vers > 2)) {
                     fprintf(stderr, "Unknown propeller hardware version = %d\n", prop_vers);
                     code = -1;
                  }
                  break;

               case 'P':
                  modifier = 0;
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        i++;
                        if ((argv[i][0] == '$')) {
                           // hex parameter (such as $ABCD)
                           sscanf(&argv[i][1], "%x", &readwrite);
                        }
                        else if ((argv[i][0] == '0')
                        && ((argv[i][1] == 'x')||(argv[i][1] == 'X'))) {
                           // hex parameter (such as 0xFFFF or 0XA000)
                           sscanf(&argv[i][2], "%x", &readwrite);
                        }
                        else {
                           // decimal parameter, perhaps with modifier
                           // (such as 4k or 16m)
                           sscanf(argv[i], "%d%c", &readwrite, &modifier);
                        }
                     }
                     else {
                        fprintf(stderr, "option -P requires an argument\n");
                        code = -1;
                        break;
                     }
                     argc--;
                  }
                  else {
                     // use remainder of this arg
                     if ((argv[i][2] == '$')) {
                        // hex parameter (such as $ABCD)
                        sscanf(&argv[i][3], "%x", &readwrite);
                     }
                     else if ((argv[i][2] == '0')
                     && ((argv[i][3] == 'x')||(argv[i][3] == 'X'))) {
                        // hex parameter (such as 0xFFFF or 0XA000)
                        sscanf(&argv[i][4], "%x", &readwrite);
                     }
                     else {
                        // decimal parameter, perhaps with modifier
                        // (such as 4k or 16m)
                        sscanf(&argv[i][2], "%d%c", &readwrite, &modifier);
                     }
                  }
                  if (tolower(modifier) == 'k') {
                     readwrite *= 1024;
                  }
                  else if (tolower(modifier) == 'm') {
                     readwrite *= 1024 * 1024;
                  }
                  if (verbose) {
                     fprintf(stderr, "readwrite address = %d\n", readwrite);
                  }
                  break;

               case 'R':
                  modifier = 0;
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        i++;
                        if ((argv[i][0] == '$')) {
                           // hex parameter (such as $ABCD)
                           sscanf(&argv[i][1], "%x", &readonly);
                        }
                        else if ((argv[i][0] == '0')
                        && ((argv[i][1] == 'x')||(argv[i][1] == 'X'))) {
                           // hex parameter (such as 0xFFFF or 0XA000)
                           sscanf(&argv[i][2], "%x", &readonly);
                        }
                        else {
                           // decimal parameter, perhaps with modifier
                           // (such as 4k or 16m)
                           sscanf(argv[i], "%d%c", &readonly, &modifier);
                        }
                     }
                     else {
                        fprintf(stderr, "option -R requires an argument\n");
                        code = -1;
                        break;
                     }
                     argc--;
                  }
                  else {
                     // use remainder of this arg
                     if ((argv[i][2] == '$')) {
                        // hex parameter (such as $ABCD)
                        sscanf(&argv[i][3], "%x", &readonly);
                     }
                     else if ((argv[i][2] == '0')
                     && ((argv[i][3] == 'x')||(argv[i][3] == 'X'))) {
                        // hex parameter (such as 0xFFFF or 0XA000)
                        sscanf(&argv[i][4], "%x", &readonly);
                     }
                     else {
                        // decimal parameter, perhaps with modifier
                        // (such as 4k or 16m)
                        sscanf(&argv[i][2], "%d%c", &readonly, &modifier);
                     }
                  }
                  if (tolower(modifier) == 'k') {
                     readonly *= 1024;
                  }
                  else if (tolower(modifier) == 'm') {
                     readonly *= 1024 * 1024;
                  }
                  if (verbose) {
                     fprintf(stderr, "readonly address = %d\n", readonly);
                  }
                  break;

               case 'T':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        target_path = strdup(argv[++i]);
                     }
                     else {
                        fprintf(stderr, "option -T requires an argument\n");
                        code = -1;
                        break;
                     }
                     argc--;
                  }
                  else {
                     // use remainder of this arg
                     target_path = strdup(&argv[i][2]);
                  }
                  if (verbose > 1) {
                     fprintf(stderr, "target path = %s\n", target_path);
                  }
                  break;

               case 'C':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        symbol = strdup(argv[++i]);
                     }
                     else {
                        fprintf(stderr, "option -C requires an argument\n");
                        code = -1;
                        break;
                     }
                     argc--;
                  }
                  else {
                     // use remainder of this arg
                     symbol = strdup(&argv[i][2]);
                  }
                  if (define_count < MAX_DEFINES) {
                     define_symbol[define_count++] = symbol;
                     if (verbose > 1) {
                        fprintf(stderr, "defining %s\n", symbol);
                     }
                  }
                  else {
                     fprintf(stderr, "too many defines - option -C ignored\n");
                  }
                  break;

               case 'U':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        symbol = strdup(argv[++i]);
                     }
                     else {
                        fprintf(stderr, "option -U requires an argument\n");
                        code = -1;
                        break;
                     }
                     argc--;
                  }
                  else {
                     // use remainder of this arg
                     symbol = strdup(&argv[i][2]);
                  }
                  if (undefine_count < MAX_DEFINES) {
                     undefine_symbol[undefine_count++] = symbol;
                     if (verbose) {
                        fprintf(stderr, "undefining %s\n", symbol);
                     }
                  }
                  else {
                     fprintf(stderr, "too many undefines - option -U ignored\n");
                  }
                  break;

               case 't':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        target = strdup(argv[++i]);
                     }
                     else {
                        fprintf(stderr, "option -t requires an argument\n");
                        code = -1;
                        break;
                     }
                     argc--;
                  }
                  else {
                     // use remainder of this arg
                     target = strdup(&argv[i][2]);
                  }
                  if (verbose) {
                     fprintf(stderr, "target name = %s\n", target);
                  }
                  break;

               case 'u':
                  cleanup = 0;
                  fprintf(stderr, "untidy (no cleanup) mode\n");
                  break;

               case 'v':
                  verbose++;
                  if (verbose == 1) {
                     fprintf(stderr, "Catalina Binder %s\n", VERSION); 
                     fprintf(stderr, "verbose mode\n");
                  }
                  else {
                     fprintf(stderr, "very verbose mode\n");
                  }
                  break;

               case 'w':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        safecat(assemble_options, argv[++i], MAX_LINELEN);
                        safecat(assemble_options, " ", MAX_LINELEN);
                        // check for eeprom or binary requests
                        if (strcmp(&argv[i][2], "-e") == 0) {
                           format = 1; // eeprom
                        }
                        else if (strcmp(&argv[i][2], "-b") == 0) {
                           format = 0; // binary
                        }
                     }
                     else {
                        fprintf(stderr, "option -w requires an argument\n");
                        code = -1;
                        break;
                     }
                     argc--;
                  }
                  else {
                     // use remainder of this arg
                     safecat(assemble_options, &argv[i][2], MAX_LINELEN);
                     safecat(assemble_options, " ", MAX_LINELEN);
                     // check for eeprom or binary requests
                     if (strcmp(&argv[i][2], "-e") == 0) {
                        format = 1; // eeprom
                     }
                     else if (strcmp(&argv[i][2], "-b") == 0) {
                        format = 0; // binary
                     }
                  }
                  if (verbose > 1) {
                     fprintf(stderr, "assemble options = %s\n", assemble_options);
                  }
                  break;

               case 'z':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        path_separator = strdup(argv[++i]);
                     }
                     else {
                        fprintf(stderr, "option -z requires an argument\n");
                        code = -1;
                        break;
                     }
                     argc--;
                  }
                  else {
                     // use remainder of this arg
                     path_separator = strdup(&argv[i][2]);
                  }
                  if (verbose) {
                     fprintf(stderr, "path separator = %s\n", path_separator);
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
            if (input_count < MAX_FILES) {
               input_file[input_count++] = strdup(argv[i]);
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
   if (olevel > 0) {
      safecpy(assemble_command, assemble_opt, MAX_LINELEN);
      safecat(assemble_command, TARGET_OPT, MAX_LINELEN);
      safecat(assemble_command, "\"", MAX_LINELEN);
      safecat(assemble_command, target_path, MAX_LINELEN);
      safecat(assemble_command, "\" ", MAX_LINELEN);
      if (prop_vers == 2) {
         if (verbose > 1) {
            fprintf(stderr, "using p2 optimizer\n");
         }
         safecat(assemble_command, P2_OPT, MAX_LINELEN);
      }
      if (suppress != 0) {
         safecat(assemble_command, SUPPRESS_OPT, MAX_LINELEN);
      }
      sprintf(optnum, "-O%d ", olevel);
      safecat(assemble_command, optnum, MAX_LINELEN);
      if (verbose > 1) {
         fprintf(stderr, "optimizing assemble command = %s\n", assemble_command);
      }
   }
   return code;

}

void print_files() {
   int i;
   fprintf(stderr, "files to process:\n");
   for (i = 0; i < input_count; i++) {
      fprintf(stderr, " %s\n", input_file[i]);
   }
   fprintf(stderr, "files to include in output:\n");
   for (i = 0; i < output_count; i++) {
      fprintf(stderr, " %s\n", output_file[i]);
   }
}

void print_libs() {
   int i;
   fprintf(stderr, "input libraries:\n");
   for (i = 0; i < lib_count; i++) {
      fprintf(stderr, " %s\n", input_lib[i]);
   }
}

void unquote(char *name, char *unquoted) {
   int  len, i, j;
   
   len = strlen(name);
   if (len > MAX_PATHLEN) {
      len = MAX_PATHLEN;
   }
   j = 0;
   for (i = 0; i < len; i++) {
      if (name[i] != '\"') {
         unquoted[j++] = name[i];
      }
   }
   unquoted[j] = '\0';
}
FILE *fopen_unquoted(char *filename, char *mode) {
   char unquoted_filename[MAX_PATHLEN + 1];

   unquote(filename, unquoted_filename);
   if (diagnose) {
      fprintf(stderr, "fopen filename = %s\n", unquoted_filename);
   }
   return fopen(unquoted_filename, mode);
}

int rename_unquoted(char *old, char *new) {
   char unquoted_old[MAX_PATHLEN + 1];
   char unquoted_new[MAX_PATHLEN + 1];

   unquote(old, unquoted_old);
   unquote(new, unquoted_new);
   if (diagnose) {
      fprintf(stderr, "rename %s to %s\n", unquoted_old, unquoted_new);
   }
   return rename(unquoted_old, unquoted_new);
}

int remove_unquoted(char *filename) {
   char unquoted_filename[MAX_PATHLEN + 1];

   unquote(filename, unquoted_filename);
   if (diagnose) {
      fprintf(stderr, "remove %s\n", unquoted_filename);
   }
   return remove(unquoted_filename);
}
   
char *get_target_prefix(int layout) {
   switch (layout) {
      case 0  : return LMM_PREFIX;
      case 1  : return EMM_PREFIX;
      case 6  : return SMM_PREFIX;
      case 8  : return CMM_PREFIX;
      case 9  : return EMM_PREFIX;
      case 10 : return SMM_PREFIX;
      case 11 : return NMM_PREFIX;
      default : return XMM_PREFIX;               
   }
}

char *get_model_prefix(int layout) {
   switch (layout) {
      case 0  : return LMM_PREFIX;
      case 1  : return LMM_PREFIX;
      case 6  : return LMM_PREFIX;
      case 8  : return CMM_PREFIX;
      case 9  : return CMM_PREFIX;
      case 10 : return CMM_PREFIX;
      case 11 : return NMM_PREFIX;
      default : return XMM_PREFIX;               
   }
}

int process_input_files(char *path) {
   FILE *    input;
   int       i;
   int       line_no;
   char     line[MAX_LINELEN + 1];
   int      imp_len;
   int   exp_len;
   char   fullname[MAX_PATHLEN * 2 + 2];


   imp_len = strlen(IMPORT_STRING);
   exp_len = strlen(EXPORT_STRING);

   for (i = 0; i < input_count; i++) {
      if (input_file[i] != NULL) {
         if (path == NULL) {
            safecpy(fullname, input_file[i], MAX_PATHLEN);
         }
         else {
            safecpy(fullname, path, MAX_PATHLEN);
            safecat(fullname, path_separator, MAX_PATHLEN);
            safecat(fullname, input_file[i], MAX_PATHLEN);
         }
         if (verbose > 1) {
            fprintf(stderr, "processing input file %s\n", fullname);
         }
         if ((input = fopen_unquoted(fullname, "r")) == NULL) {
            fprintf(stderr, "cannot open input file %s\n", fullname);
            if (force == 0) {
               return -1;
            }
         }
         else {
            line_no = 1;
            while (!feof(input)) {
               if (fgets(line, MAX_LINELEN, input) != NULL) {
                  if (diagnose == 2) {
                     fprintf(stderr, "read line: %s\n", line);
                  }
                  if (strncmp(line, IMPORT_STRING, imp_len) == 0) {
                     if (symbol_count < MAX_SYMBOLS) {
                        if (strlen(line) >= imp_len) {
                           symbol[symbol_count].name = strdup(strtok(&line[imp_len], " ,:\n\r\t"));
                           symbol[symbol_count].refs = 1; // required by definition
                           symbol[symbol_count].state = imported;
                           symbol[symbol_count].file = strdup(input_file[i]);
                           symbol[symbol_count].line = line_no;
                           if (path == NULL) {
                              symbol[symbol_count].lib = NULL;
                           }
                           else {
                              symbol[symbol_count].lib = strdup(path);
                           }
                           if (diagnose) {
                              fprintf(stderr, "import %s\n", symbol[symbol_count].name);
                           }
                           symbol_count++;
                        }
                     }
                     else {
                        fprintf(stderr, "too many symbols\n");
                     }
                  }
                  else if (strncmp(line, EXPORT_STRING, exp_len) == 0) {
                     if (symbol_count < MAX_SYMBOLS) {
                        if (strlen(line) >= exp_len) {
                           symbol[symbol_count].name = strdup(strtok(&line[exp_len], " ,:\n\r\t"));
                           symbol[symbol_count].refs = 1; // required by definition
                           symbol[symbol_count].state = exported;
                           symbol[symbol_count].file = strdup(input_file[i]);
                           symbol[symbol_count].line = line_no;
                           if (path == NULL) {
                              symbol[symbol_count].lib = NULL;
                           }
                           else {
                              symbol[symbol_count].lib = strdup(path);
                           }
                           if (diagnose) {
                              fprintf(stderr, "export %s\n", symbol[symbol_count].name);
                           }
                           symbol_count++;
                        }
                     }
                     else {
                        fprintf(stderr, "too many symbols\n");
                     }
                  }
               }
               line_no++;
            }
            if (diagnose) {
               fprintf(stderr, "finished input file %s\n", input_file[i]);
            }
            fclose(input);
         }
      }
   }
   return 0;
}

int load_indexes() {
   FILE * index;
   int    i;
   char   libname[MAX_PATHLEN * 2 + 2];
   char   filename[MAX_PATHLEN * 2 + 2];
   char   indexname[MAX_PATHLEN * 2 + 2];
   char   line[MAX_LINELEN + 1];
   char * token;

   for (i = 0; i < lib_count; i++) {
      // try name as local library first
      safecpy(indexname, input_lib[i], MAX_PATHLEN);
      safecat(indexname, path_separator, MAX_PATHLEN);
      safecat(indexname, DEFAULT_INDEX, MAX_PATHLEN);
      if (diagnose==3) {
         fprintf(stderr, "trying local libary %s\n", indexname);
      }
      if ((index = fopen_unquoted(indexname, "r")) != NULL) {
         if ((verbose > 1)||diagnose) {
            fprintf(stderr, "loading local libary index %s\n", indexname);
         }
         safecpy(libname, input_lib[i], MAX_PATHLEN);
         safecat(libname, path_separator, MAX_PATHLEN);
      }
      else if (library_path != NULL) {
         // try name as a system library library
         safecpy(indexname, library_path, MAX_PATHLEN);
         safecat(indexname, path_separator, MAX_PATHLEN);
         safecat(indexname, input_lib[i], MAX_PATHLEN);
         safecat(indexname, path_separator, MAX_PATHLEN);
         safecat(indexname, DEFAULT_INDEX, MAX_PATHLEN);
         if (diagnose) {
            fprintf(stderr, "not a local library - trying system library %s\n", indexname);
         }
         if ((index = fopen_unquoted(indexname, "r")) != NULL) {
            if ((verbose > 1)||diagnose) {
               fprintf(stderr, "loading system library index %s\n", indexname);
            }
            safecpy(libname, library_path, MAX_PATHLEN);
            safecat(libname, path_separator, MAX_PATHLEN);
            safecat(libname, input_lib[i], MAX_PATHLEN);
            safecat(libname, path_separator, MAX_PATHLEN);
         }
         else {
            fprintf(stderr, "cannot open library index %s\n", indexname);
            if (force == 0) {
               return -1;
            }
         }
      }
      if (index != NULL) {
         while (!feof(index)) {
            if (fgets(line, MAX_LINELEN, index) != NULL) {
               if (diagnose == 2) {
                  fprintf(stderr, "read line: %s\n", line);
               }
               if (symbol_count < MAX_SYMBOLS) {
                  if (strlen(line) > 0) {
                     symbol[symbol_count].lib = strdup(input_lib[i]);
                     symbol[symbol_count].name = strdup(strtok(line, " ,:\n\r\t"));
                     safecpy(filename, libname, MAX_PATHLEN);
                     safecat(filename, strtok(NULL, " ,:\n\r\t"), MAX_PATHLEN);
                     symbol[symbol_count].file = strdup(filename);
                     if (diagnose==3) {
                        fprintf(stderr, "name %s file %s\n", symbol[symbol_count].name, symbol[symbol_count].file);
                     }
                     token = strtok(NULL, " ,:\n\r\t");
                     sscanf(token, "%d", &symbol[symbol_count].line);
                     token = strtok(NULL, " ,:\n\n\t");
                     symbol[symbol_count].state = undefined;
                     if (strcmp (token, "export") == 0) {
                        symbol[symbol_count].state = exported;
                     }
                     if (strcmp (token, "import") == 0) {
                        symbol[symbol_count].state = imported;
                     }
                     symbol[symbol_count].refs = 0;
                     symbol_count++;
                  }
               }
               else {
                  fprintf(stderr, "too many symbols\n");
               }
            }
         }
         fclose (index);
      }
   }
   return 0;
}

int find_input_file(char *name) {
   int i;

   for (i = 0; i < input_count; i++) {
      if (strcmp(input_file[i], name) == 0) {
         return i;
      }
   }
   return 0;
}

char *state_name(int state) {
   switch (state) {
      case undefined: return state_names[undefined];
      case redefined: return state_names[redefined];
      case imported:  return state_names[imported];
      case exported:  return state_names[exported];
      case resolving: return state_names[resolving];
      case resolved:  return state_names[resolved];
      default: return "state unknown";
   }
}

void resolve_references(int sym) {
   int   i;
   int   j;
   int   defs;


   if (diagnose) {
      fprintf(stderr, "resolving symbol %s\n", symbol[sym].name);
   }
   defs = 0;
   symbol[sym].state = resolving;
   for (i = 0; i < symbol_count; i++) {
      if (diagnose == 2) {
         fprintf(stderr, "trying %s in file %s\n", symbol[i].name, symbol[i].file);
      }
      if ((strcmp(symbol[i].name, symbol[sym].name) == 0)) {
         if (diagnose) {
            fprintf(stderr, "%s %s in file %s\n", symbol[i].name, state_name(symbol[i].state), symbol[i].file);
         }
         if (symbol[i].state == exported) {
            defs++;
            symbol[i].refs++;
            // must resolve all other symbols imported by the file that exported the symbol being resolved
            for (j = 0; j < symbol_count; j++) {
               if ((strcmp(symbol[i].file, symbol[j].file) == 0) && (symbol[j].state == imported)) {
                  symbol[j].refs++;
                  if (diagnose) {
                     fprintf(stderr, "recursing on symbol %s\n", symbol[j].name);
                  }
                  resolve_references(j);
               }
            }
         }
      }
   }
   if (defs == 0) {
      symbol[sym].state = undefined;
      if (diagnose) {
         fprintf(stderr, "%s undefined\n", symbol[sym].name);
      }
      // since there is no exported symbol, increment the reference count of the import
      symbol[sym].refs++;
   }
   else if (defs > 1) {
      symbol[sym].state = redefined;
      if (diagnose) {
         fprintf(stderr, "%s redefined\n", symbol[sym].name);
      }
   }
   else {
      symbol[sym].state = resolved;
   }
}

void determine_output() {
   int   i;
   int   j;
   int   included;
   char  fullname[MAX_PATHLEN * 2 + 2];

   if (diagnose) {
      fprintf(stderr, "determining files to output\n");
   }
   // all input files are output files
   for (i = 0; i < input_count; i++) {
      output_file[output_count] = strdup(input_file[i]);
      if (diagnose) {
         fprintf(stderr, "including file %s\n", output_file[output_count]);
      }
      output_count++;
   }
   // then all library files that contain referenced symbols are output files
   for (i = 0; i < symbol_count; i++) {
      if (symbol[i].refs > 0) {
         if (diagnose) {
            fprintf(stderr, "require symbol %s\n", symbol[i].name);
         }
/*
         if (symbol[i].lib != NULL) {
            safecpy(fullname, symbol[i].lib, MAX_PATHLEN);
            safecat(fullname, path_separator, MAX_PATHLEN);
            safecat(fullname, symbol[i].file, MAX_PATHLEN);
         }
         else {
            safecpy(fullname, symbol[i].file, MAX_PATHLEN);
         }
*/
         safecpy(fullname, symbol[i].file, MAX_PATHLEN);
         if (diagnose) {
            fprintf(stderr, "require file %s\n", fullname);
         }
         included = 0;
         for (j = 0; j < output_count; j++) {
            if (strcmp(fullname, output_file[j]) == 0) {
               included = 1;
            }
         }
         if (included == 0) {
            output_file[output_count] = strdup(fullname);
            if (diagnose) {
               fprintf(stderr, "including file %s\n", output_file[output_count]);
            }
            output_count++;
         }
         else {
            if (diagnose) {
               fprintf(stderr, "file %s already included\n", fullname);
            }
         }
      }
   }
   // the last output file is the progend file
   safecpy(fullname, target_path, MAX_PATHLEN);
   safecat(fullname, path_separator, MAX_PATHLEN);
   safecat(fullname, get_model_prefix(layout), MAX_PATHLEN);
   safecat(fullname, PROGEND_SUFFIX, MAX_PATHLEN);
   safecat(fullname, TARGET_SUFFIX, MAX_PATHLEN);
   output_file[output_count++] = strdup(fullname);
}

void generate_import_export(char *path) {
   FILE * result;
   int    i;
   char   fullname[MAX_PATHLEN * 2 + 2];

   if (path == NULL) {
      safecpy(fullname, result_file, MAX_PATHLEN);
   }
   else {
      safecpy(fullname, path, MAX_PATHLEN);
      safecat(fullname, path_separator, MAX_PATHLEN);
      safecat(fullname, result_file, MAX_PATHLEN);
   }

   if (verbose > 1) {
      fprintf(stderr, "import/export output file is %s\n", fullname);
   }
   if ((result = fopen_unquoted(fullname, "w")) == NULL) {
      fprintf(stderr, "cannot open output file %s\n", fullname);
   }
   else {
      for (i = 0; i < symbol_count; i++) {
         if (import && (symbol[i].state == imported)) {
            fprintf(result, "%s %s %d import\n",
               symbol[i].name, symbol[i].file, symbol[i].line);
         }
         if (export && (symbol[i].state == exported)) {
            fprintf(result, "%s %s %d export\n",
               symbol[i].name, symbol[i].file, symbol[i].line);
         }
      }
   }
   fclose(result);
}

void generate_segment (FILE *output, FILE *input, char *segname) {
   char     line[MAX_LINELEN + 1];

   rewind (input);
   if (verbose > 1) {
      fprintf(stderr, "generating %s segment\n", segname);
   }
   fprintf(output, "\n%s%s\n\n", SGMT_STRING, segname);
   fprintf(output, "DAT ' %s segment\n\n alignl ' align long\n\n", segname);
   fprintf(output, "%s%s\n", SGMT_PREFIX, segname);
   while (!feof(input)) {
      if (fgets(line, MAX_LINELEN, input) != NULL) {
         if (diagnose == 2) {
            fprintf(stderr, "read segment line: %s\n", line);
         }
         fprintf(output, "%s", line);
      }
   }
}

int defined (char *symbol) {
   int i;

   for (i = 0; i < undefine_count; i++) {
      if (strcmp(undefine_symbol[i], symbol) == 0) {
         return 0;
      }
   }
   for (i = 0; i < define_count; i++) {
      if (strcmp(define_symbol[i], symbol) == 0) {
         return -1;
      }
   }
   return 0;
}

void preprocess_defines(FILE *to_file) {
   int i, j;
   int defined = 0;
   int header = 0;

   for (i = 0; i < define_count; i++) {
      defined = 1;
      // check symbol has not been undefined
      if (diagnose == 2) {
         fprintf(stderr, "checking %s\n", define_symbol[i]);
      }
      for (j = 0; j < undefine_count; j++) {
         if (strcmp(define_symbol[i], undefine_symbol[j]) == 0) {
            defined = 0;
         }
      }
      if (defined) {
         if (diagnose) {
            fprintf(stderr, "defined %s\n", define_symbol[i]);
         }
         if (!header) {
            fprintf(to_file, "'\n' Definitions added by Catalina:\n'\n");
            header = 1;
         }
         fprintf(to_file, "%s%s\n", PRE_DEFINE_STRING, define_symbol[i]);
      }
      else {
         if (diagnose) {
            fprintf(stderr, "undefined %s\n", define_symbol[i]);
         }
      }
   }
   if (header) {
      fprintf(to_file, "'\n' End of definitions added by Catalina\n'\n");
      header = 1;
   }
}

void command_defines(char *to_string, int size) {
   int i, j;
   int defined = 0;

   for (i = 0; i < define_count; i++) {
      defined = 1;
      // check symbol has not been undefined
      if (diagnose == 2) {
         fprintf(stderr, "checking %s\n", define_symbol[i]);
      }
      for (j = 0; j < undefine_count; j++) {
         if (strcmp(define_symbol[i], undefine_symbol[j]) == 0) {
            defined = 0;
         }
      }
      if (defined) {
         if (diagnose) {
            fprintf(stderr, "defined %s\n", define_symbol[i]);
         }
         safecat(to_string, CMD_DEFINE_STRING, size);
         safecat(to_string, define_symbol[i], size);
         safecat(to_string, " ", size);
      }
      else {
         if (diagnose) {
            fprintf(stderr, "undefined %s\n", define_symbol[i]);
         }
      }
   }
}

void generate_output(char *fullname) {
   static int n = 0;
   int      code_len, cnst_len, init_len, data_len;
   FILE *   code_file;
   FILE *   cnst_file;
   FILE *   init_file;
   FILE *   data_file;
   FILE *   result;
   FILE *   current;
   FILE *   input;
   int      i;
   char     line[MAX_LINELEN + 1];
   char     CODE_MARKER[MAX_LINELEN + 1];
   char     CNST_MARKER[MAX_LINELEN + 1];
   char     INIT_MARKER[MAX_LINELEN + 1];
   char     DATA_MARKER[MAX_LINELEN + 1];

   char     code_name[MAX_LINELEN + 1] = "\0";
   char     cnst_name[MAX_LINELEN + 1] = "\0";
   char     init_name[MAX_LINELEN + 1] = "\0";
   char     data_name[MAX_LINELEN + 1] = "\0";

   safecpy(CODE_MARKER, SGMT_STRING, MAX_LINELEN); safecat(CODE_MARKER, CODE_STRING, MAX_LINELEN);
   safecpy(CNST_MARKER, SGMT_STRING, MAX_LINELEN); safecat(CNST_MARKER, CNST_STRING, MAX_LINELEN);
   safecpy(INIT_MARKER, SGMT_STRING, MAX_LINELEN); safecat(INIT_MARKER, INIT_STRING, MAX_LINELEN);
   safecpy(DATA_MARKER, SGMT_STRING, MAX_LINELEN); safecat(DATA_MARKER, DATA_STRING, MAX_LINELEN);
   code_len = strlen(CODE_MARKER);
   cnst_len = strlen(CNST_MARKER);
   init_len = strlen(INIT_MARKER);
   data_len = strlen(DATA_MARKER);

   if (verbose > 1) {
      fprintf(stderr, "bind output file is %s\n", fullname);
   }
   if ((result = fopen_unquoted(fullname, "w")) == NULL) {
      fprintf(stderr, "cannot open output file %s\n", fullname);
   }
   else {
      sprintf(code_name, "%s%scatbind%d%d.tmp", temp_path, DEFAULT_SEP, getpid(), n++);
      sprintf(cnst_name, "%s%scatbind%d%d.tmp", temp_path, DEFAULT_SEP, getpid(), n++);
      sprintf(init_name, "%s%scatbind%d%d.tmp", temp_path, DEFAULT_SEP, getpid(), n++);
      sprintf(data_name, "%s%scatbind%d%d.tmp", temp_path, DEFAULT_SEP, getpid(), n++);
      code_file = fopen(code_name,"w+");
      cnst_file = fopen(cnst_name,"w+");
      init_file = fopen(init_name,"w+");
      data_file = fopen(data_name,"w+");
      if ((strlen(code_name) == 0) || (strlen(cnst_name) == 0) 
      ||  (strlen(init_name) == 0) || (strlen(data_name) == 0) 
      ||  (code_file == NULL) || (cnst_file == NULL) 
      ||  (init_file == NULL) || (cnst_file == NULL)) {
         fprintf(stderr, "cannot open temporary files\n");
      }
      else {
         if (diagnose) {
            fprintf(stderr, "temporary code file name = %s\n", code_name);
            fprintf(stderr, "temporary cnst file name = %s\n", cnst_name);
            fprintf(stderr, "temporary init file name = %s\n", init_name);
            fprintf(stderr, "temporary data file name = %s\n", data_name);
         }
         for (i = 0; i < output_count; i++) {
            if (diagnose) {
               fprintf(stderr, "copying file %s\n", output_file[i]);
            }
            if ((input = fopen_unquoted(output_file[i], "r")) == NULL) {
               fprintf(stderr, "cannot open input file %s\n", output_file[i]);
            }
            else {
               if (i > 0) {
                  fprintf(result, "' input file %s \n\n", output_file[i]);
               }
               current = result;
               while (!feof(input)) {
                  if (fgets(line, MAX_LINELEN, input) != NULL) {
                     if (diagnose == 2) {
                        fprintf(stderr, "read input line: %s\n", line);
                     }
                     if (strncmp(line, CODE_MARKER, code_len) == 0) {
                        if (diagnose == 2) {
                           fprintf(stderr, "Code Segment\n");
                        }
                        current = code_file;
                     }
                     else if (strncmp(line, CNST_MARKER, cnst_len) == 0) {
                        if (diagnose == 2) {
                           fprintf(stderr, "Cnst Segment\n");
                        }
                        current = cnst_file;
                     }
                     else if (strncmp(line, INIT_MARKER, init_len) == 0) {
                        if (diagnose == 2) {
                           fprintf(stderr, "Init Segment\n");
                        }
                        current = init_file;
                     }
                     else if (strncmp(line, DATA_MARKER, data_len) == 0) {
                        if (diagnose == 2) {
                           fprintf(stderr, "Data Segment\n");
                        }
                        current = data_file;
                     }
                     else {
                        fprintf(current, "%s", line);
                     }
                  }
               }
               fclose(input);
            }
         }
         switch (layout) {
            case 1:
               fprintf(result, "\nCON\n\nSEGMENT_LAYOUT=1 ' EMM memory layout 1 (Code, Cnst, Init, Data)\n\n");
               if (readonly > 0) {
                  fprintf(result, "\nDAT\n\nCatalina_RO_Pad\n");
                  fprintf(result, "        byte $00[%d - @Catalina_RO_Pad]\n", readonly);
               }
               fprintf(result, "\nDAT\n\nCatalina_RO_Base\n");
               generate_segment(result, code_file, CODE_STRING);
               generate_segment(result, cnst_file, CNST_STRING);
               fprintf(result, "\nDAT\n\nCatalina_RO_Ends\n");
               if (readwrite > 0) {
                  fprintf(result, "\nDAT\n\nCatalina_RW_Pad\n");
                  fprintf(result, "        byte $00[%d - @Catalina_RW_Pad]\n", readwrite);
               }
               fprintf(result, "\nDAT\n\nCatalina_RW_Base\n");
               generate_segment(result, init_file, INIT_STRING);
               generate_segment(result, data_file, DATA_STRING);
               fprintf(result, "\nDAT\n\nCatalina_RW_Ends\n");
               break;
            case 2:
               fprintf(result, "\nCON\n\nSEGMENT_LAYOUT=2 ' XMM memory layout 2 (Cnst, Init, Data, Code)\n\n");
               if (readwrite > 0) {
                  fprintf(result, "\nDAT\n\nCatalina_RW_Pad\n");
                  fprintf(result, "        byte $00[%d - @Catalina_RW_Pad]\n", readwrite);
               }
               fprintf(result, "\nDAT\n\nCatalina_RW_Base\n");
               generate_segment(result, cnst_file, CNST_STRING);
               generate_segment(result, init_file, INIT_STRING);
               generate_segment(result, data_file, DATA_STRING);
               fprintf(result, "\nDAT\n\nCatalina_RW_Ends\n");
               if (readonly > 0) {
                  fprintf(result, "        byte $00[%d - @Catalina_RW_Ends]\n", readonly);
               }
               fprintf(result, "\nDAT\n\nCatalina_RO_Base\n");
               generate_segment(result, code_file, CODE_STRING);
               fprintf(result, "\nDAT\n\nCatalina_RO_Ends\n");
               break;
            case 3:
               fprintf(result, "\nCON\n\nSEGMENT_LAYOUT=3 ' XMM memory layout 3 (Init, Data, Code, Cnst)\n\n");
               fprintf(result, "\nDAT\n\nCatalina_Pad\n");
               fprintf(result, "        byte $00[XMM_RW_BASE_ADDRESS - $10 - @Catalina_Pad]\n");
               if (readwrite > 0) {
                  fprintf(result, "\nDAT\n\nCatalina_RW_Pad\n");
                  fprintf(result, "        byte $00[%d - @Catalina_RW_Pad]\n", readwrite);
               }
               fprintf(result, "\nDAT\n\nCatalina_RW_Base\n");
               generate_segment(result, init_file, INIT_STRING);
               generate_segment(result, data_file, DATA_STRING);
               fprintf(result, "\nDAT\n\nCatalina_RW_Ends\n");
               fprintf(result, "        byte $00[XMM_RO_BASE_ADDRESS + $200 - $10 - @Catalina_RW_Ends]\n");
               if (readonly > 0) {
                  fprintf(result, "\nDAT\n\nCatalina_RO_Pad\n");
                  fprintf(result, "        byte $00[%d - @Catalina_RO_Pad]\n", readonly);
               }
               fprintf(result, "\nDAT\n\nCatalina_RO_Base\n");
               generate_segment(result, code_file, CODE_STRING);
               generate_segment(result, cnst_file, CNST_STRING);
               fprintf(result, "\nDAT\n\nCatalina_RO_Ends\n");
               break;
            case 4:
               fprintf(result, "\nCON\n\nSEGMENT_LAYOUT=4 ' XMM memory layout 4 (Cnst, Init, Data, Code)\n\n");
               fprintf(result, "\nDAT\n\nCatalina_Pad\n");
               fprintf(result, "        byte $00[$200 - $10 - @Catalina_Pad]\n");
               if (readwrite > 0) {
                  fprintf(result, "\nDAT\n\nCatalina_RW_Pad\n");
                  fprintf(result, "        byte $00[%d - @Catalina_RW_Pad]\n", readwrite);
               }
               fprintf(result, "\nDAT\n\nCatalina_RW_Base\n");
               generate_segment(result, cnst_file, CNST_STRING);
               generate_segment(result, init_file, INIT_STRING);
               generate_segment(result, data_file, DATA_STRING);
               fprintf(result, "\nDAT\n\nCatalina_RW_Ends\n");
               fprintf(result, "        byte $00[XMM_RO_BASE_ADDRESS + $200 - $10 - @Catalina_RW_Ends]\n");
               if (readonly > 0) {
                  fprintf(result, "\nDAT\n\nCatalina_RO_Pad\n");
                  fprintf(result, "        byte $00[%d - @Catalina_RO_Pad]\n", readonly);
               }
               fprintf(result, "\nDAT\n\nCatalina_RO_Base\n");
               generate_segment(result, code_file, CODE_STRING);
               fprintf(result, "\nDAT\n\nCatalina_RO_Ends\n");
               break;
            case 5:
               fprintf(result, "\nCON\n\nSEGMENT_LAYOUT=5 ' XMM memory layout 5 (Code, Cnst, Init, Data)\n\n");
               if (readonly > 0) {
                  fprintf(result, "\nDAT\n\nCatalina_RO_Pad\n");
                  fprintf(result, "        byte $00[%d - @Catalina_RO_Pad]\n", readonly);
               }
               fprintf(result, "\nDAT\n\nCatalina_RO_Base\n");
               generate_segment(result, code_file, CODE_STRING);
               generate_segment(result, cnst_file, CNST_STRING);
               fprintf(result, "\nDAT\n\nCatalina_RO_Ends\n");
               if (readwrite > 0) {
                  fprintf(result, "        byte $00[%d - @Catalina_RO_Ends]\n", readwrite);
               }
               fprintf(result, "\nDAT\n\nCatalina_RW_Base\n");
               generate_segment(result, init_file, INIT_STRING);
               generate_segment(result, data_file, DATA_STRING);
               fprintf(result, "\nDAT\n\nCatalina_RW_Ends\n");
               break;
            case 6:
               fprintf(result, "\nCON\n\nSEGMENT_LAYOUT=6 ' SMM memory layout 6 (Code, Cnst, Init, Data)\n\n");
               if (readonly > 0) {
                  fprintf(result, "\nDAT\n\nCatalina_RO_Pad\n");
                  fprintf(result, "        byte $00[%d - @Catalina_RO_Pad]\n", readonly);
               }
               fprintf(result, "\nDAT\n\nCatalina_RO_Base\n");
               generate_segment(result, code_file, CODE_STRING);
               generate_segment(result, cnst_file, CNST_STRING);
               fprintf(result, "\nDAT\n\nCatalina_RO_Ends\n");
               if (readwrite > 0) {
                  fprintf(result, "        byte $00[%d - @Catalina_RO_Ends]\n", readwrite);
               }
               fprintf(result, "\nDAT\n\nCatalina_RW_Base\n");
               generate_segment(result, init_file, INIT_STRING);
               generate_segment(result, data_file, DATA_STRING);
               fprintf(result, "\nDAT\n\nCatalina_RW_Ends\n");
               break;
            case 11:
               fprintf(result, "\nCON\n\nSEGMENT_LAYOUT=11 ' NMM memory layout 11 (Code, Cnst, Init, Data)\n\n");
               if (readonly > 0) {
                  fprintf(result, "\nDAT\n\nCatalina_RO_Pad\n");
                  fprintf(result, "        byte $00[%d - @Catalina_RO_Pad]\n", readonly);
               }
               fprintf(result, "\nDAT\n\nCatalina_RO_Base\n");
               generate_segment(result, code_file, CODE_STRING);
               generate_segment(result, cnst_file, CNST_STRING);
               fprintf(result, "\nDAT\n\nCatalina_RO_Ends\n");
               if (readwrite > 0) {
                  fprintf(result, "        byte $00[%d - @Catalina_RO_Ends]\n", readwrite);
               }
               fprintf(result, "\nDAT\n\nCatalina_RW_Base\n");
               generate_segment(result, init_file, INIT_STRING);
               generate_segment(result, data_file, DATA_STRING);
               fprintf(result, "\nDAT\n\nCatalina_RW_Ends\n");
               break;
            default:
               fprintf(result, "\nCON\n\nSEGMENT_LAYOUT=%d ' %cMM memory layout %d (Code, Cnst, Init, Data)\n\n", 
                     layout, (layout==0?'L':'C'), layout);
               if (readonly > 0) {
                  fprintf(result, "\nDAT\n\nCatalina_RO_Pad\n");
                  fprintf(result, "        byte $00[%d - @Catalina_RO_Pad]\n", readonly);
               }
               fprintf(result, "\nDAT\n\nCatalina_RO_Base\n");
               generate_segment(result, code_file, CODE_STRING);
               generate_segment(result, cnst_file, CNST_STRING);
               fprintf(result, "\nDAT\n\nCatalina_RO_Ends\n");
               if (readwrite > 0) {
                  fprintf(result, "        byte $00[%d - @Catalina_RO_Ends]\n", readwrite);
               }
               fprintf(result, "\nDAT\n\nCatalina_RW_Base\n");
               generate_segment(result, init_file, INIT_STRING);
               generate_segment(result, data_file, DATA_STRING);
               fprintf(result, "\nDAT\n\nCatalina_RW_Ends\n");
               break;
         }
         fprintf(result, "\n\n alignl ' align long\n%s%s ' end of segments\n", 
                 SGMT_PREFIX, ENDS_STRING);
      }
      fclose(result);
      fclose(code_file);
      fclose(cnst_file);
      fclose(init_file);
      fclose(data_file);
      remove(code_name);
      remove(cnst_name);
      remove(init_name);
      remove(data_name);
   }
}

void free_symbols() {
   int i;

   for (i = 0; i < symbol_count; i++) {
      free (symbol[i].name);
      free (symbol[i].file);
      free (symbol[i].lib);
   }
   symbol_count = 0;
}

int do_import_export() {
   int   i;
   int   code;

   if (verbose > 1) {
      fprintf(stderr, "building export/export list\n");
      print_files();
      print_libs();
      if (diagnose == 2) {
         code = print_symbols(1);
      }
   }
   if (input_count > 0) {
      // process any local files
      if (process_input_files(NULL) == 0) {
         generate_import_export(NULL);
         free_symbols();
      }
   }
   return 0;
}

char *output_suffix(int prop_vers, int format) {
   static char bin[]=".bin";
   static char binary[]=".binary";
   static char eeprom[]=".eeprom";

   if (prop_vers == 2) {
       return ((format == 0) ? bin : eeprom);
   }
   else {
       return ((format == 0) ? binary : eeprom);
   }
}
void do_assemble(char *fullname) {
   char     assemble[MAX_LINELEN + 1] = "";
   char     optimize[MAX_LINELEN + 1] = "";
   char     reformat[MAX_LINELEN + 1] = FORMAT_CMD;
   char     blackcat[MAX_LINELEN + 1] = "";
   char     number_string[MAX_LINELEN + 1] = "";
   unsigned char  prologue[SECTOR_SIZE];
   int      result;
   char     output_name[MAX_PATHLEN * 2 + 10] = "";
   char     program_name[MAX_PATHLEN * 2 + 10] = "";
   char     path_sfx[MAX_PATHLEN + 1] = "";
   char     target_output_name[MAX_PATHLEN * 2 + 10] = "";
   char     temp_name_1[MAX_PATHLEN * 2 + 10] = "";
   char     temp_name_2[MAX_PATHLEN * 2 + 10] = "";
   char *   target_name;
   FILE *   output_file;
   FILE *   program_file;
   FILE *   target_file;
   FILE *   smm_kernel_file;
   char     c;
   int      count;
   struct   stat st;
   int      lval;
   int      seglayout;
   int      code_addr;
   int      cnst_addr;
   int      init_addr;
   int      data_addr;
   int      ends_addr;
   int      ro_base;
   int      rw_base;
   int      ro_ends;
   int      rw_ends;
   int      ro_beg;
   int      rw_beg;
   int      ro_end;
   int      rw_end;

   if (verbose > 1) {
      fprintf(stderr, "assembling %s\n", fullname);
   }
      if ((layout == 0) || (layout == 8) || (layout == 11)) {
         // for these layouts, the target file includes the output of the Binder,
         // so it is straightforward to just assemble the target file
         safecpy(assemble, assemble_command, MAX_LINELEN);
         if (olevel) {
            if (!cleanup) {
               safecat(assemble, "-u ", MAX_LINELEN);
            }
            if (verbose) {
               safecat(assemble, "-v ", MAX_LINELEN);
            }
         }
         else {
            if (verbose == 0) {
               safecat(assemble, assemble_quiet, MAX_LINELEN);
            }
            if (verbose > 1) {
               safecat(assemble, assemble_verbose, MAX_LINELEN);
            }
         }
         if ((prop_vers == 1) && (memory)) {
            safecat(assemble, " -M ", MAX_LINELEN);
            sprintf(memory_size, "%d ", memsize);
            safecat(assemble, memory_size, MAX_LINELEN);
         }
         command_defines(assemble, MAX_LINELEN);
         target_name = malloc(MAX_LINELEN + 1);
         safecpy(target_name, target_path, MAX_LINELEN);
         safecat(target_name, path_separator, MAX_LINELEN);
         safecat(target_name, get_target_prefix(layout), MAX_LINELEN);
         safecat(target_name, target, MAX_PATHLEN);
         if (prop_vers == 2) {
            safecat(target_name, OUTPUT_SUFFIX_P2, MAX_LINELEN);
         }
         else {
            safecat(target_name, OUTPUT_SUFFIX, MAX_LINELEN);
         }
         if (verbose > 1) {
            fprintf(stderr, "target name = %s\n", target_name);
         }
         if (target_name != NULL) {
            if (prop_vers == 2) {
               safecat(assemble, inc_lib_opt, MAX_LINELEN);
               pathcat(assemble, target_path, NULL, MAX_LINELEN);
               safecat(assemble, " ", MAX_LINELEN);
            }
            pathcat(assemble, target_name, NULL, MAX_LINELEN);
            safecat(assemble, output_opt, MAX_LINELEN);
            pathcat(assemble, fullname, NULL, MAX_LINELEN);
            safecat(assemble, " ", MAX_LINELEN);
            safecat(assemble, assemble_options, MAX_LINELEN);
#if COMPILE_IN_PLACE            
            safecat(assemble, inc_lib_opt, MAX_LINELEN);
            safecat(assemble, ". ", MAX_LINELEN);
#endif            
            if (verbose > 1) {
               fprintf(stderr, "assemble command = %s\n", assemble);
            }
            pathcat(output_name, fullname, output_suffix(prop_vers, format), MAX_LINELEN);
            if ((result = system(assemble)) != 0) {
               if (verbose > 1) {
                  fprintf(stderr, "assemble command returned result %d\n", result);
               }
            }
         }
         if ((result == 0) && (!suppress)) {
            if (prop_vers == 1) {
               // print Propeller 1 memory layout and size statistics
               if ((output_file = fopen_unquoted(output_name, "rb")) == NULL) {
                  fprintf(stderr, "cannot open output file %s\n",output_name);
               }
               else {
                  fseek(output_file, 0x10, SEEK_SET);
                  lval = getc(output_file) | (getc(output_file) << 8);
                  //printf("offset = %08X\n", lval);
                  fseek(output_file, lval + 0x10 + P1_LAYOUT_OFFS, SEEK_SET);
                  seglayout =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("seglayout = %08X\n", seglayout);
                  code_addr =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("code_addr = %08X\n", code_addr);
                  cnst_addr =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("cnst_addr = %08X\n", cnst_addr);
                  init_addr =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("init_addr = %08X\n", init_addr);
                  data_addr =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("data_addr = %08X\n", data_addr);
                  ends_addr =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("ends_addr = %08X\n", ends_addr);
                  ro_base   =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("ro_base = %08X\n", ro_base);
                  rw_base   =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("rw_base = %08X\n", rw_base);
                  ro_ends   =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("ro_ends = %08X\n", ro_ends);
                  rw_ends   =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("rw_ends = %08X\n", rw_ends);
                  printf("\n");
                  printf("code = %d bytes\n", cnst_addr - code_addr);
                  printf("cnst = %d bytes\n", rw_base   - cnst_addr);
                  printf("init = %d bytes\n", data_addr - init_addr);
                  printf("data = %d bytes\n", ends_addr - data_addr);
                  fseek(output_file, 0, SEEK_END);
                  printf("file = %ld bytes\n", ftell(output_file));
                  printf("\n");
                  fclose(output_file);
               }
            }
            else {
               // print Propeller 2 memory layout and size statistics
               if ((output_file = fopen_unquoted(output_name, "rb")) == NULL) {
                  fprintf(stderr, "cannot open output file %s\n",output_name);
               }
               else {
                  fseek(output_file, P2_LAYOUT_OFFS, SEEK_SET);
                  seglayout =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("seglayout = %08X\n", seglayout);
                  code_addr =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("code_addr = %08X\n", code_addr);
                  cnst_addr =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("cnst_addr = %08X\n", cnst_addr);
                  init_addr =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("init_addr = %08X\n", init_addr);
                  data_addr =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("data_addr = %08X\n", data_addr);
                  ends_addr =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("ends_addr = %08X\n", ends_addr);
                  ro_base   =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("ro_base = %08X\n", ro_base);
                  rw_base   =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("rw_base = %08X\n", rw_base);
                  ro_ends   =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("ro_ends = %08X\n", ro_ends);
                  rw_ends   =  getc(output_file) 
                            | (getc(output_file)<<8) 
                            | (getc(output_file)<<16) 
                            | (getc(output_file)<<24);
                  //printf("rw_ends = %08X\n", rw_ends);
                  printf("\n");
                  printf("code = %d bytes\n", cnst_addr - code_addr);
                  printf("cnst = %d bytes\n", rw_base   - cnst_addr);
                  printf("init = %d bytes\n", data_addr - init_addr);
                  printf("data = %d bytes\n", ends_addr - data_addr);
                  fseek(output_file, 0, SEEK_END);
                  printf("file = %ld bytes\n", ftell(output_file));
                  printf("\n");
                  fclose(output_file);
               }
            }
         }
      }
      else {
         // for EMM, SMM or XMM, the target file is just a loader which does not
         // directly include the output of the Binder. So for these modes 
         // we first compile the target file and then compile the output of 
         // the Binder - then we combine the two.
   
         safecpy(assemble, assemble_command, MAX_LINELEN);
         if (olevel) {
            if (!cleanup) {
               safecat(assemble, "-u ", MAX_LINELEN);
            }
            if (verbose) {
               safecat(assemble, "-v ", MAX_LINELEN);
            }
         }
         else {
            if (verbose == 0) {
               safecat(assemble, assemble_quiet, MAX_LINELEN);
            }
            if (verbose > 1) {
               safecat(assemble, assemble_verbose, MAX_LINELEN);
            }
         }
         command_defines(assemble, MAX_LINELEN);
         target_name = malloc(MAX_LINELEN + 1);
         safecpy(target_name, target_path, MAX_LINELEN);
         safecat(target_name, path_separator, MAX_LINELEN);
         safecat(target_name, get_target_prefix(layout), MAX_LINELEN);
         safecat(target_name, target, MAX_PATHLEN);
         if (prop_vers == 2) {
            safecat(target_name, OUTPUT_SUFFIX_P2, MAX_LINELEN);
         }
         else {
            safecat(target_name, OUTPUT_SUFFIX, MAX_LINELEN);
         }
         if (verbose > 1) {
            fprintf(stderr, "target name = %s\n", target_name);
         }
         if (target_name != NULL) {
            pathcat(assemble, target_name, NULL, MAX_LINELEN);
            safecat(assemble, target_opt, MAX_LINELEN);
#ifdef COMPILE_IN_PLACE
            safecat(assemble, get_target_prefix(layout), MAX_LINELEN);
            safecat(assemble, target, MAX_PATHLEN);
#else
            sprintf(path_sfx, "%s%s%s", path_separator, get_target_prefix(layout), target);
            pathcat(assemble, target_path, path_sfx, MAX_LINELEN);
#endif            

            safecat(assemble, inc_lib_opt, MAX_LINELEN);
#ifdef WIN32_PATHS
            safecat(assemble, ". ", MAX_LINELEN);
#else
            safecat(assemble, "$(pwd) ", MAX_LINELEN);
#endif
            if (verbose > 1) {
               fprintf(stderr, "assemble command (target) = %s\n", assemble);
            }
            if ((result = system(assemble)) != 0) {
               if (verbose > 1) {
                  fprintf(stderr, "assemble command returned result %d\n", result);
               }
            }
            if (result == 0) {
               safecpy(assemble, assemble_command, MAX_LINELEN);
               if (olevel) {
                  if (!cleanup) {
                     safecat(assemble, "-u ", MAX_LINELEN);
                  }
                  if (verbose) {
                     safecat(assemble, "-v ", MAX_LINELEN);
                  }
               }
               else {
                  if (verbose == 0) {
                     safecat(assemble, assemble_quiet, MAX_LINELEN);
                  }
                  if (verbose > 1) {
                     safecat(assemble, assemble_verbose, MAX_LINELEN);
                  }
               }
               command_defines(assemble, MAX_LINELEN);
#if COMPILE_IN_PLACE
               safecat(assemble, DEFAULT_BIND, MAX_LINELEN);
               safecat(assemble, inc_lib_opt, MAX_LINELEN);
               pathcat(assemble, target_path, NULL, MAX_LINELEN);
#else
               sprintf(path_sfx, "%s%s", path_separator, DEFAULT_BIND);
               pathcat(assemble, target_path, path_sfx, MAX_LINELEN);
#endif               
               safecat(assemble, " -M ", MAX_LINELEN);
               if (memory) {
                  sprintf(memory_size, "%d", memsize);
                  safecat(assemble, memory_size, MAX_LINELEN);
               }
               else {
                  if (layout == 1) {
                     safecat(assemble, DEFAULT_EMM_MEM, MAX_LINELEN);
                  }
                  else if (layout == 3) {
                     safecat(assemble, DEFAULT_FLASH_MEM, MAX_LINELEN);
                  }
                  else if (layout == 4) {
                     safecat(assemble, DEFAULT_FLASH_MEM, MAX_LINELEN);
                  }
                  else if (layout == 6) {
                     safecat(assemble, DEFAULT_SMM_MEM, MAX_LINELEN);
                  }
                  else if (layout == 9) {
                     safecat(assemble, DEFAULT_EMM_MEM, MAX_LINELEN);
                  }
                  else if (layout == 10) {
                     safecat(assemble, DEFAULT_SMM_MEM, MAX_LINELEN);
                  }
                  else {
                     safecat(assemble, DEFAULT_XMM_MEM, MAX_LINELEN);
                  }
               }
               safecat(assemble, output_opt, MAX_LINELEN);
               // Use the final file name even though this is a temporary output
               // file
               pathcat(assemble, fullname, NULL, MAX_LINELEN);
               safecat(assemble, " ", MAX_LINELEN);
               safecat(assemble, assemble_options, MAX_LINELEN);
               if (verbose > 1) {
                  fprintf(stderr, "assemble command (emm, smm or xmm) = %s\n", assemble);
               }
               if ((result =-system(assemble)) == 0) {
                  sprintf(path_sfx, "%s%s", TEMP_SUFFIX, output_suffix(prop_vers, format));
                  // rename the output file as a temporary so we can write the real output file
                  temp_name_1[0] = '\0';
                  pathcat(temp_name_1, fullname, output_suffix(prop_vers, format), MAX_LINELEN);
                  temp_name_2[0] = '\0';
                  pathcat (temp_name_2, fullname, path_sfx, MAX_LINELEN);
                  remove_unquoted(temp_name_2);
                  if (verbose > 1) {
                     fprintf(stderr, "renaming output file from %s to %s\n", temp_name_1, temp_name_2);
                  }
                  rename_unquoted(temp_name_1, temp_name_2);
                  // now combine the temporary file with the target file
                  pathcat(output_name, fullname, output_suffix(prop_vers, format), MAX_LINELEN); 
                  if (verbose > 1) {
                     fprintf(stderr, "combining target and program to %s\n", output_name);
                  }
                  if ((output_file = fopen_unquoted(output_name, "wb")) == NULL) {
                     fprintf(stderr, "cannot open output file %s\n",output_name);
                  }
                  else {
                     pathcat(program_name, fullname, path_sfx, MAX_LINELEN); 
      
                     if (verbose > 1) {
                        fprintf(stderr, "using program file %s\n", program_name);
                     }
                     if ((program_file = fopen_unquoted(program_name, "rb")) == NULL) {
                        fprintf(stderr, "cannot open program file %s\n",program_name);
                     }
                     else {
#if COMPILE_IN_PLACE
                        safecpy(target_output_name, get_target_prefix(layout), MAX_PATHLEN);
#else
                        safecpy(target_output_name, target_path, MAX_PATHLEN);
                        safecat(target_output_name, path_separator, MAX_PATHLEN);
                        safecat(target_output_name, get_target_prefix(layout), MAX_PATHLEN);
#endif
                        safecat(target_output_name, target, MAX_LINELEN);
                        safecat(target_output_name, ".eeprom", MAX_LINELEN); // targets are always eeprom
                        if (verbose > 1) {
                           fprintf(stderr, "using target file %s\n", target_output_name);
                        }
                        if ((target_file = fopen_unquoted(target_output_name, "rb")) == NULL) {
                           fprintf(stderr, "cannot open target file %s\n",target_output_name);
                        }
                        else {
                           // first, copy the first 32K from target file
                           for (count = 0; count < HUB_SIZE; count++) {
                              c = getc(target_file);
                              putc(c, output_file);
                           }
                           // then copy the prologue from the program file (and save it)
                           for (count = 0; count < SECTOR_SIZE; count++) {
                              c = getc(program_file);
                              prologue[count] = c;
                              putc(c, output_file);
                           }
                           // then extract statistics from the prologue
                           count = P1_LAYOUT_OFFS + 0x10;
                           seglayout =  prologue[count+0] 
                                     | (prologue[count+1]<<8) 
                                     | (prologue[count+2]<<16) 
                                     | (prologue[count+3]<<24);
                           count += 4;
                           //printf("seglayout = %08X\n", seglayout);
                           code_addr =  prologue[count+0] 
                                     | (prologue[count+1]<<8) 
                                     | (prologue[count+2]<<16) 
                                     | (prologue[count+3]<<24);
                           count += 4;
                           //printf("code_addr = %08X\n", code_addr);
                           cnst_addr =  prologue[count+0] 
                                     | (prologue[count+1]<<8) 
                                     | (prologue[count+2]<<16) 
                                     | (prologue[count+3]<<24);
                           count += 4;
                           //printf("cnst_addr = %08X\n", cnst_addr);
                           init_addr =  prologue[count+0] 
                                     | (prologue[count+1]<<8) 
                                     | (prologue[count+2]<<16) 
                                     | (prologue[count+3]<<24);
                           count += 4;
                           //printf("init_addr = %08X\n", init_addr);
                           data_addr =  prologue[count+0] 
                                     | (prologue[count+1]<<8) 
                                     | (prologue[count+2]<<16) 
                                     | (prologue[count+3]<<24);
                           count += 4;
                           //printf("data_addr = %08X\n", data_addr);
                           ends_addr =  prologue[count+0] 
                                     | (prologue[count+1]<<8) 
                                     | (prologue[count+2]<<16) 
                                     | (prologue[count+3]<<24);
                           count += 4;
                           //printf("ends_addr = %08X\n", ends_addr);
                           ro_base =    prologue[count+0] 
                                     | (prologue[count+1]<<8) 
                                     | (prologue[count+2]<<16) 
                                     | (prologue[count+3]<<24);
                           count += 4;
                           //printf("ro_base = %08X\n", ro_base);
                           rw_base =    prologue[count+0] 
                                     | (prologue[count+1]<<8) 
                                     | (prologue[count+2]<<16) 
                                     | (prologue[count+3]<<24);
                           count += 4;
                           //printf("rw_base = %08X\n", rw_base);
                           ro_ends =    prologue[count+0] 
                                     | (prologue[count+1]<<8) 
                                     | (prologue[count+2]<<16) 
                                     | (prologue[count+3]<<24);
                           count += 4;
                           //printf("ro_ends = %08X\n", ro_ends);
                           rw_ends =    prologue[count+0] 
                                     | (prologue[count+1]<<8) 
                                     | (prologue[count+2]<<16) 
                                     | (prologue[count+3]<<24);
                           count += 4;
                           //printf("rw_ends = %08X\n", rw_ends);

                           count = SECTOR_SIZE;

                           if (((SHORT_LAYOUT_3 == 1) && (layout == 3)) 
                           ||  ((SHORT_LAYOUT_5 == 1) && (layout == 5))) {
                              // when producing short layouts 3 & 5, then
                              // skip until we get to 32k - this is all zeros
                              // anyway and is only required to generate the 
                              // correct addresses during assembly.
                              for (count = SECTOR_SIZE; count < HUB_SIZE; count++) {
                                 c = getc(program_file);
                              }
                              count = HUB_SIZE;
                           }   
                           if (((SHORT_LAYOUT_3 == 1) && (layout == 3)) 
                           ||  ((SHORT_LAYOUT_4 == 1) && (layout == 4))) {
                              // Layouts 3 & 4 have additional padding between the RW & RO segments,
                              // so calculate the start and end of these segments, and skip the rest
                              ro_beg = ro_base + 0x10;
                              ro_end = ro_ends + 0x10 + SECTOR_SIZE - 1;
                              ro_end /= SECTOR_SIZE;
                              ro_end *= SECTOR_SIZE;
                              //printf("ro_beg = %08X\n", ro_beg);
                              //printf("ro_end = %08X\n", ro_end);
                              rw_beg = rw_base + 0x10;
                              rw_end = rw_ends + 0x10 + SECTOR_SIZE - 1;
                              rw_end /= SECTOR_SIZE;
                              rw_end *= SECTOR_SIZE;
                              //printf("rw_beg = %08X\n", rw_beg);
                              //printf("rw_end = %08X\n", rw_end);
                           }
                           else {
                              // copy everything
                              ro_beg = 0;
                              ro_end = INT_MAX;
                              rw_beg = 0;
                              rw_end = INT_MAX;
                           }
                           // copy remainder of program file, skipping any padding between segments
                           c = getc(program_file);
                           while (!feof(program_file)) {
                              if (((count >= ro_beg) && (count < ro_end)) 
                              ||  ((count >= rw_beg) && (count < rw_end))) {
                                 putc(c, output_file);
                              }
                              count++;
                              c = getc(program_file);
                           }
                           if (layout == 6) {
                              // for SMM, always pad output file to exactly 64K, since we want to
                              // add the kernel to a known location (i.e. at the end of the program)
                              c = 0;
                              if (count > HUB_SIZE) {
                                 fprintf(stderr, "NOTE: program too large for SMM format - file will not be loadable!\n");
                              }
                              while (count < HUB_SIZE) {
                                 putc(c, output_file);
                                 count++;
                              }
                              // now assemble the kernel file
                              safecpy(assemble, assemble_command, MAX_LINELEN);
                              if (olevel) {
                                 if (!cleanup) {
                                    safecat(assemble, "-u ", MAX_LINELEN);
                                 }
                                 if (verbose) {
                                    safecat(assemble, "-v ", MAX_LINELEN);
                                 }
                              }
                              command_defines(assemble, MAX_LINELEN);
                              pathcat(assemble, target_path, NULL, MAX_LINELEN);
                              safecat(assemble, path_separator, MAX_LINELEN);
                              if (defined ("libthreads")) {
                                 // use threaded kernel
                                 safecat(assemble, LMM_THREADED, MAX_LINELEN);
                              }
                              else if (defined ("ALTERNATE")) {
                                 // use alternate kernel
                                 safecat(assemble, LMM_ALTERNATE, MAX_LINELEN);
                              }
                              else {
                                 // use normal kernel
                                 safecat(assemble, LMM_KERNEL, MAX_LINELEN);
                              } 
                              safecat(assemble, output_opt, MAX_LINELEN);
                              safecat(assemble, LMM_BINARY, MAX_LINELEN);
                              if (verbose > 1) {
                                 fprintf(stderr, "assemble command (kernel) = %s\n", assemble);
                              }
                              if ((result = system(assemble)) != 0) {
                                 if (verbose > 1) {
                                    fprintf(stderr, "assemble command returned result %d\n", result);
                                 }
                              }
                              else {
                                 fprintf(stderr, "adding kernel to %s\n", output_name);
                                 if ((smm_kernel_file = fopen(LMM_BINARY, "rb")) == NULL) {
                                    fprintf(stderr, "cannot open kernel file %s\n", LMM_BINARY);
                                 }
                                 else {
                                    // skip the first few bytes (note that the offset of the 
                                    // LMM kernel must be the same for all variants)
                                    for (count = 0; count < SMM_OFFSET; count++) {
                                       c = getc(smm_kernel_file);
                                    }
                                    // copy remainder of kernel file, but only copy a maximum
                                    // of 2k - a kernel can't be any bigger than this!
                                    count = 0;
                                    c = getc(smm_kernel_file);
                                    while (!feof(smm_kernel_file) && (count < KERNEL_SIZE)) {
                                       putc(c, output_file);
                                       count++;
                                       c = getc(smm_kernel_file);
                                    }
                                    // pad output file to 2k if it is any smaller
                                    c = 0;
                                    while (count < KERNEL_SIZE) {
                                       putc(c, output_file);
                                       count++;
                                    }
                                    fclose(smm_kernel_file);
                                 }
                              }
                              if (cleanup) {
                                 // delete the kernel output file
                                 if (diagnose) {
                                    fprintf(stderr, "cleaning up intermediate kernel file %s\n", LMM_BINARY);
                                 }
                                 remove_unquoted(LMM_BINARY);
                              }
                           }
                           else if (layout == 10) {
                              // for SMM, always pad output file to exactly 64K, since we want to
                              // add the kernel to a known location (i.e. at the end of the program)
                              c = 0;
                              if (count > HUB_SIZE) {
                                 fprintf(stderr, "NOTE: program too large for SMM format - file will not be loadable!\n");
                              }
                              while (count < HUB_SIZE) {
                                 putc(c, output_file);
                                 count++;
                              }
                              // now assemble the kernel file
                              safecpy(assemble, assemble_command, MAX_LINELEN);
                              if (olevel) {
                                 if (!cleanup) {
                                    safecat(assemble, "-u ", MAX_LINELEN);
                                 }
                                 if (verbose) {
                                    safecat(assemble, "-v ", MAX_LINELEN);
                                 }
                              }
                              command_defines(assemble, MAX_LINELEN);
                              pathcat(assemble, target_path, NULL, MAX_LINELEN);
                              safecat(assemble, path_separator, MAX_LINELEN);
                              if (defined ("libthreads")) {
                                 // use threaded kernel
                                 safecat(assemble, CMM_THREADED, MAX_LINELEN);
                              }
                              else if (defined ("ALTERNATE")) {
                                 // use alternate kernel
                                 safecat(assemble, CMM_ALTERNATE, MAX_LINELEN);
                              }
                              else {
                                 // use normal kernel
                                 safecat(assemble, CMM_KERNEL, MAX_LINELEN);
                              } 
                              safecat(assemble, output_opt, MAX_LINELEN);
                              safecat(assemble, CMM_BINARY, MAX_LINELEN);
                              if (verbose > 1) {
                                 fprintf(stderr, "assemble command (kernel) = %s\n", assemble);
                              }
                              if ((result = system(assemble)) != 0) {
                                 if (verbose > 1) {
                                    fprintf(stderr, "assemble command returned result %d\n", result);
                                 }
                              }
                              else {
                                 fprintf(stderr, "adding kernel to %s\n", output_name);
                                 if ((smm_kernel_file = fopen(CMM_BINARY, "rb")) == NULL) {
                                    fprintf(stderr, "cannot open kernel file %s\n", CMM_BINARY);
                                 }
                                 else {
                                    // skip the first few bytes (note that the offset of the 
                                    // CMM kernel must be the same for all variants)
                                    for (count = 0; count < SMM_OFFSET; count++) {
                                       c = getc(smm_kernel_file);
                                    }
                                    // copy remainder of kernel file, but only copy a maximum
                                    // of 2k - a kernel can't be any bigger than this!
                                    count = 0;
                                    c = getc(smm_kernel_file);
                                    while (!feof(smm_kernel_file) && (count < KERNEL_SIZE)) {
                                       putc(c, output_file);
                                       count++;
                                       c = getc(smm_kernel_file);
                                    }
                                    // pad output file to 2k if it is any smaller
                                    c = 0;
                                    while (count < KERNEL_SIZE) {
                                       putc(c, output_file);
                                       count++;
                                    }
                                    fclose(smm_kernel_file);
                                 }
                              }
                              if (cleanup) {
                                 // delete the kernel output file
                                 if (diagnose) {
                                    fprintf(stderr, "cleaning up intermediate kernel file %s\n", CMM_BINARY);
                                 }
                                 remove_unquoted(CMM_BINARY);
                              }
                           }
                           fclose(output_file);
                           if (!suppress) {
                              // print memory layout and size statistics
                              if ((output_file = fopen_unquoted(output_name, "rb")) == NULL) {
                                 fprintf(stderr, "cannot open output file %s\n",output_name);
                              }
                              else {
                                 printf("\n");
                                 if ((layout == 2) || (layout == 4)) {
                                    printf("code = %d bytes\n", ro_ends   - code_addr);
                                    printf("cnst = %d bytes\n", init_addr - cnst_addr);
                                    printf("init = %d bytes\n", data_addr - init_addr);
                                    printf("data = %d bytes\n", rw_ends   - data_addr);
                                 }
                                 else {
                                    printf("code = %d bytes\n", cnst_addr - code_addr);
                                    printf("cnst = %d bytes\n", ro_ends   - cnst_addr);
                                    printf("init = %d bytes\n", data_addr - init_addr);
                                    printf("data = %d bytes\n", rw_ends   - data_addr);
                                 }
                                 fseek(output_file, 0, SEEK_END);
                                 printf("file = %ld bytes\n", ftell(output_file));
                                 fclose(output_file);
                              }
                           }
                           fclose(target_file);
                           fclose(program_file);
                           if (cleanup) {
                              if (diagnose) {
                                 fprintf(stderr, "cleaning up temporary program file %s\n", program_name);
                              }
                              remove_unquoted(program_name);
                              if (diagnose) {
                                 fprintf(stderr, "cleaning up temporary target file %s\n", target_output_name);
                              }
                              remove_unquoted(target_output_name);
                           }
                        }
                     }
                  }
               }
               else {
                  if (verbose > 1) {
                     fprintf(stderr, "assemble command returned result %d\n", result);
                     fprintf(stderr, "output will not be combined with target\n");
                  }
               }
            }
            else {
               if (verbose > 1) {
                  fprintf(stderr, "assemble command returned result %d\n", result);
                  fprintf(stderr, "output files will not be generated\n");
               }
            }
         }
      }
      if (debug_level > 0) {
         safecpy(blackcat, blackcat_command, MAX_LINELEN);
         pathcat(blackcat, fullname, ".lst", MAX_LINELEN);
         safecat(blackcat, " -d . ", MAX_LINELEN);
         for (count = 0; count < lib_count; count++) {
            // check local libraries first, then system libraries
            if (stat(input_lib[count], &st) == 0) {
               if (verbose > 1) {
                  fprintf(stderr, "local directory %s exists - using it to locate debug files\n",input_lib[count]);
               }
               safecat(blackcat, "-d .", MAX_LINELEN);
               safecat(blackcat, path_separator, MAX_LINELEN);
               safecat(blackcat, input_lib[count], MAX_LINELEN);
               safecat(blackcat, " ", MAX_LINELEN);
            }
            else {
               if (verbose > 1) {
                  fprintf(stderr, "local directory %s does not exist - using library path to locate debug files\n",input_lib[count]);
               }
               safecat(blackcat, "-d ", MAX_LINELEN);
               if (strlen(library_path) > 0) {
#ifdef WIN32_PATHS         
                  if ((strchr(library_path, ' ') != NULL) && (library_path[0] != '\"')) {
                     safecat(blackcat, "\"", MAX_LINELEN);
                     safecat(blackcat, library_path, MAX_LINELEN);
                     safecat(blackcat, path_separator, MAX_LINELEN);
                     safecat(blackcat, input_lib[count], MAX_LINELEN);
                     safecat(blackcat, "\"", MAX_LINELEN);
                  }
                  else {
                     safecat(blackcat, library_path, MAX_LINELEN);
                     safecat(blackcat, path_separator, MAX_LINELEN);
                     safecat(blackcat, input_lib[count], MAX_LINELEN);
                  }
#else
                  safecat(blackcat, library_path, MAX_LINELEN);
                  safecat(blackcat, path_separator, MAX_LINELEN);
                  safecat(blackcat, input_lib[count], MAX_LINELEN);
#endif         
               }
            }
            safecat(blackcat, " ", MAX_LINELEN);
         }
         safecat (blackcat, " -n -s ", MAX_LINELEN); // should really be optional
#ifndef WIN32_PATHS
         safecat (blackcat, " -n -s -linux", MAX_LINELEN); 
#endif      
         if (verbose > 1) {
            fprintf(stderr, "blackcat command = %s\n", blackcat);
         }
         if ((result = system(blackcat)) != 0) {
            if (verbose > 1) {
               fprintf(stderr, "blackcat command returned result %d\n", result);
               fprintf(stderr, "blackcat output file may be corrupt\n");
            }
         }
      }
}

int do_bind() {
   int   code;
   char  fullname[MAX_PATHLEN * 2 + 2] = "";
   char  path_sfx[MAX_PATHLEN + 1] = "";
   int   len;
   int   i;

   if (verbose > 1) {
      fprintf(stderr, "binding\n");
   }

   if (process_input_files(NULL) == 0) {
      if (load_indexes() == 0) {
         if (diagnose) {
            print_files();
            print_libs();
            if (diagnose == 2) {
               code = print_symbols(1);
            }
         }

         if (diagnose) {
            fprintf(stderr, "resolving\n");
         }
         // resolve is recursive - first attempt to resolve
         // symbol 0, which in C should always be the "main" 
         // function (or its equivalent) - this should
         // resolve most (if not all) of the symbols - but 
         // continue with any other 'imported' symbols that
         // are referenced, noting note that every time we
         // resolve one, we have to go back because there
         // may be new symbols referenced by the symbol we
         // have just resolved.
         if (symbol_count > 0) {
            for (i = 0; i < symbol_count; i++) {
               if ((symbol[i].state == imported) && (symbol[i].refs > 0)) {
                  resolve_references(i);
                  // every time we resolve a symbol, we must 
                  // start all over again!
                  i = 0;
               }
            }
            if (diagnose) {
               fprintf(stderr, "resolving complete\n");
            }
         }
         else {
            if (diagnose) {
               fprintf(stderr, "no symbols to resolve\n");
            }
         }

         determine_output();
         if (verbose > 1) {
            print_files();
            print_libs();
         }

         code = print_symbols(0);

         if (((assemble) && (code == 0)) || force) {
            // if we are assembling, use the default bind name
            // for the output of the bind, and the result
            // filename for the output of the assembler
#if COMPILE_IN_PLACE            
            if (prop_vers == 2) {
               safecat(fullname, DEFAULT_BIND_P2, MAX_PATHLEN);
            }
            else {
               safecat(fullname, DEFAULT_BIND, MAX_PATHLEN);
            }
#else            
            safecpy(fullname, target_path, MAX_PATHLEN);
            safecat(fullname, path_separator, MAX_PATHLEN);
            if (prop_vers == 2) {
               safecat(fullname, DEFAULT_BIND_P2, MAX_PATHLEN);
            }
            else {
               safecat(fullname, DEFAULT_BIND, MAX_PATHLEN);
            }
#endif            
            generate_output(fullname);
            len = strlen(result_file);
            if ((len > 7) 
            &&  (((format == 0) && strcmp_i(&result_file[len-7], ".binary") == 0)
              || ((format != 0) && strcmp_i(&result_file[len-7], ".eeprom") == 0))) {
               result_file[len-7] = '\0'; // remove extension if specified for result file
            }
            else if ((len >4) && ((format == 0) && strcmp_i(&result_file[len-4], ".bin") == 0)) {
               result_file[len-4] = '\0'; // remove extension if specified for result file
            }
            do_assemble(result_file);
#if COMPILE_IN_PLACE
            if (cleanup) {
               // delete the temporary Spin file
               if (diagnose) {
                  fprintf(stderr, "cleaning up temporary Spin file %s\n", fullname);
               }
               remove_unquoted(fullname);
            }
#endif
         }
         else {
            // if we are not assembling, use the result
            // filename for the output of the bind (and
            // do not delete it)
            generate_output(result_file);
         }
          return code;
      }
      else {
         return -1;
      }
   }
   else {
      return -1;
   }
}

int print_symbols(int all) {
   int   i;
   int   undef;
   int   error_title = 0;

   undef = 0;
   if (verbose) {
      fprintf(stderr, "%s symbols:\n", (all == 1 ? "all" : "Undefined or Redefined"));
   }
   for (i = 0; i < symbol_count; i++) {
      if ((symbol[i].state == undefined) || (symbol[i].state == resolving)) {
         undef++;
         if (symbol[i].lib == NULL) {
            if (!verbose && !error_title++) {
               fprintf(stderr, "\nUndefined or Redefined symbols:\n");
            }
            if (verbose || diagnose) {
               fprintf(stderr, " %s undefined (file %s, line %d)\n",
                       symbol[i].name,
                       symbol[i].file,
                       symbol[i].line);
            }
            else {
               fprintf(stderr, " %s undefined\n", symbol[i].name);
            }
         }
         else {
            if (!verbose && !error_title++) {
               fprintf(stderr, "\nUndefined or Redefined symbols:\n");
            }
            if (verbose || diagnose) {
               fprintf(stderr, " %s undefined (library %s file %s, line %d)\n",
                       symbol[i].name,
                       symbol[i].lib,
                       symbol[i].file,
                       symbol[i].line);
            }
            else {
               fprintf(stderr, " %s undefined\n", symbol[i].name);
            }
         }
      }
      else if (symbol[i].state == redefined) {
         undef++;
         if (symbol[i].lib == NULL) {
            if (!verbose && !error_title++) {
               fprintf(stderr, "\nUndefined or Redefined symbols:\n");
            }
            if (verbose || diagnose) {
               fprintf(stderr, " %s redefined (file %s, line %d)\n",
                       symbol[i].name,
                       symbol[i].file,
                       symbol[i].line);
            }
            else {
               fprintf(stderr, " %s redefined\n", symbol[i].name);
            }
         }
         else {
            if (!verbose && !error_title++) {
               fprintf(stderr, "\nUndefined or Redefined symbols:\n");
            }
            if (verbose || diagnose) {
               fprintf(stderr, " %s redefined (library %s file %s, line %d)\n",
                       symbol[i].name,
                       symbol[i].lib,
                       symbol[i].file,
                       symbol[i].line);
            }
            else {
               fprintf(stderr, " %s redefined\n", symbol[i].name);
            }
         }
      }
      else {
         if (all) {
            if (symbol[i].lib == NULL) {
               fprintf(stderr, " %s %s in file %s at line %d\n",
                      symbol[i].name,
                      state_name(symbol[i].state),
                      symbol[i].file,
                      symbol[i].line);
            }
            else {
               fprintf(stderr, " %s %s in libray %s file %s at line %d\n",
                      symbol[i].name,
                      state_name(symbol[i].state),
                      symbol[i].lib,
                      symbol[i].file,
                      symbol[i].line);
            }
         }
      }
   }
   if ((verbose) && (undef == 0)) {
      fprintf(stderr, " (none)\n");
   }
   return undef;
}

int main (int argc, char *argv[]) {
   int   code;
   char  fullname[MAX_PATHLEN * 2 + 2];

   code = 0;
   target = NULL;
   result_file = NULL;
   target_path = NULL;
   library_path = NULL;
   path_separator = NULL;

   safecpy(assemble_opt, ASSEMBLE_OPT_LMM, MAX_LINELEN);
   safecpy(lcc_path, getenv(DEFAULT_LCC_ENV), MAX_LINELEN);

   if (strlen(lcc_path) > 0) {
      safecpy(def_tgt_path, lcc_path, MAX_LINELEN);
      safecat(def_tgt_path, DEFAULT_SEP, MAX_LINELEN);
      safecpy(def_lib_path, lcc_path, MAX_LINELEN);
      safecat(def_lib_path, DEFAULT_SEP, MAX_LINELEN);
   }
   else {
      safecpy(def_tgt_path, DEFAULT_LCCDIR, MAX_LINELEN);
      safecpy(def_lib_path, DEFAULT_LCCDIR, MAX_LINELEN);
   }
   safecat(def_tgt_path, TGT_SUFFIX, MAX_LINELEN);
   safecat(def_lib_path, LIB_SUFFIX, MAX_LINELEN);
   
   library_path = getenv(DEFAULT_LIB_ENV);
   target_path = getenv(DEFAULT_TGT_ENV);
   temp_path = getenv(DEFAULT_TMP_DIR);

   if (temp_path == NULL) {
      if (getenv("TMP"))
         temp_path = getenv("TMP");
      else if (getenv("TEMP"))
         temp_path = getenv("TEMP");
      else if (getenv("TMPDIR"))
         temp_path = getenv("TMPDIR");
      else {
#ifdef WIN32_PATHS         
         temp_path = "\\";   // last resort - use root directory!
#else
         temp_path = "/tmp"; // last resort - use /tmp directory!
#endif            
      }
   }
   if (decode_arguments(argc, argv) <= 0) {
      if (diagnose) {
         fprintf(stderr, "%s exiting\n", argv[0]);
      }
      exit(0);
   }

   if (verbose > 1) {
      fprintf(stderr, "using temp dir %s\n", temp_path);
   }
   
   if (target == NULL) {
      target = DEFAULT_TARGET;
   }
   if (library_path == NULL) {
      library_path = def_lib_path;
   }
   if (target_path == NULL) {
      target_path = def_tgt_path;
   }
   if (path_separator == NULL) {
      path_separator = DEFAULT_SEP;
   }
   if (result_file == NULL) {
      result_file = DEFAULT_RESULT;
      if (diagnose) {
         fprintf(stderr, "output file = %s\n", result_file);
      }
   }
   if (import||export) {
      // when not binding, do not include progbeg or target file
      input_file[0] = NULL;
      input_file[1] = NULL;
      code = do_import_export();
   }
   else {
      // when binding, first input file is progbeg file
      safecpy(fullname, target_path, MAX_PATHLEN);
      safecat(fullname, path_separator, MAX_PATHLEN);
      safecat(fullname, get_model_prefix(layout), MAX_PATHLEN);
      safecat(fullname, PROGBEG_SUFFIX, MAX_PATHLEN);
      safecat(fullname, TARGET_SUFFIX, MAX_PATHLEN);
      input_file[0] = strdup(fullname);
      // when binding, second input file is target file
      safecpy(fullname, target_path, MAX_PATHLEN);
      safecat(fullname, path_separator, MAX_PATHLEN);
      safecat(fullname, TARGET_PREFIX, MAX_PATHLEN);
      safecat(fullname, target, MAX_PATHLEN);
      safecat(fullname, TARGET_SUFFIX, MAX_PATHLEN);
      input_file[1] = strdup(fullname);
      if (diagnose) {
         fprintf(stderr, "initial file = %s\n", input_file[0]);
      }
      code = do_bind();
   }
   if (diagnose) {
      fprintf(stderr, "\n%s done\n", argv[0]);
   }
   exit(code);
}
