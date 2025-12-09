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
 * Version 4.9.3 - Allow complex symbol definitions on the command line, 
 *                 such as:
 *
 *                    -D "name=value".
 *
 *                 This is only supported when using p2_asm as the assembler.
 *
 * Version 4.9.4 - Just update version number.               
 *
 * Version 4.9.5 - Just update version number.               
 *
 * Version 4.9.6  Just update version number.
 *
 * Version 5.0    Just update version number.
 *
 * Version 5.1    Just update version number.
 *
 * Version 5.1.1  Fixed a bug in argument parsing that meant the "-w"
 *                command line option was not being parsed correctly. In
 *                particular "-w-e" and "-w-b" were not working, which 
 *                prevented the -C EEPROM option to Catalina being used
 *                in conjunction with the -e option (which ends up as 
 *                "-w-e" to catbind) to specify the output file should be 
 *                ".eeprom" rather than ".binary". Affected the Propeller 
 *                1 only, and only Catalina version 4.9.3 or later.
 *
 * Version 5.1.2  Just update version number - this version was released to
 *                fix a bug in thread_misc.e.
 *
 * Version 5.2    Just update version number.
 *
 * Version 5.3    Just update version number.
 *
 * Version 5.4    Remove references to Homespun.
 *
 * Version 5.5    Remove references to Homespun.
 *
 * Version 5.6    Add Propeller 2 XMM support.
 *
 * Version 5.7    Just update version number.
 *
 * Version 5.8    Just update version number.
 *
 * Version 5.9    Just update version number.
 *
 * Version 6.0    Changes to accommodate DOS 8.3 file systems.
 *
 *                Extract bind code to separate executable (bcc.exe).
 *
 *                For Propeller 2, replace calls to p2_asm.bat with 
 *                equivalent calls directly to spp and p2asm.
 *
 *                Catbind has a new option to disable the generation of
 *                commands not supported by revision A of the P2 -
 *                add the command line option -C P2_REV_A
 *
 * Version 6.0.1  Just update version number.
 *
 * Version 6.1    Just update version number.
 *
 * Version 6.2   - just update version number.
 *
 * Version 6.3   - just update version number.
 *
 * Version 6.4   - just update version number.
 *
 * Version 6.5   - just update version number.
 *
 * Version 7.0   - just update version number.
 *
 * Version 7.1   - Add support for Quick Build (-q).
 * 
 *               - Tidy up interpretation of -v and -d options -
 *                 they are now disjoint, and one does not imply
 *                 the other. To see all messages, use both.
 *
 * Version 7.2   - just update version number.
 *
 * Version 7.3   - just update version number.
 *
 * Version 7.4   - just update version number.
 *
 * Version 7.5   - just update version number.
 *
 * Version 7.6   - just update version number.
 *
 * Version 7.9   - Add -H option to specify heap top (+1), which is passed
 *                 to bcc. HEAP_TOP is used by _sbrk(), but the actual value
 *                 used will be the LOWER of HEAP_TOP and FREE_MEM.
 *
 * version 8.1   - just update version number.
 *
 * version 8.2   - just update version number.
 *
 * version 8.3   - just update version number.
 *
 * version 8.4   - just update version number.
 *
 * version 8.5   - just update version number.
 *
 * version 8.6   - just update version number.
 *
 * version 8.7   - just update version number.
 *
 * version 8.8   - add -Q (and -C QUICKFORCE) to mean enable Qquick Build,
 *                 but also rebuild the target file even if it already exists.
 *
 * version 8.8.1 - remove local strdup (now in C libary).
 *
 * version 8.8.4  - use "version.h"
 *
 *                - enable 'globbing'
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

#ifdef __CATALINA__
#include <dosfs.h>
#else
#include <unistd.h>
#include <sys/stat.h>
#endif

#include "version.h"

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

#define LIB_SUFFIX         ""
#define TGT_SUFFIX         "target"

#define DEFAULT_LCC_ENV    "LCCDIR" // can only display this - cannot set it as an option to LCC

#define DEFAULT_LIB_ENV    "CATALINA_LIBRARY"
#define DEFAULT_TGT_ENV    "CATALINA_TARGET"
#define DEFAULT_TMP_ENV    "CATALINA_TEMPDIR"
#define DEFAULT_INC_ENV    "CATALINA_INCLUDE" 
#define DEFAULT_OPT_ENV    "CATALINA_LCCOPT"
#define DEFAULT_DEF_ENV    "CATALINA_DEFINE"

#define TARGET_SUFFIX      ".t"
#define LIB_PREFIX         "lib"
#define LMM_PREFIX         "lmm"
#define EMM_PREFIX         "emm"
#define SMM_PREFIX         "smm"
#define XMM_PREFIX         "xmm"
#define CMM_PREFIX         "cmm"
#define NMM_PREFIX         "nmm"
#define LMM_KERNEL         "Catalina_LMM.spin"           // P1 only
#define LMM_ALTERNATE      "Catalina_LMM_alternate.spin" // P1 only
#define LMM_THREADED       "Catalina_LMM_threaded.spin"  // P1 only
#define LMM_BINARY         "Catalina_LMM.binary"         // P1 only
#define CMM_KERNEL         "Catalina_CMM.spin"           // P1 only
#define CMM_ALTERNATE      "Catalina_CMM_alternate.spin" // P1 only
#define CMM_THREADED       "Catalina_CMM_threaded.spin"  // P1 only
#define CMM_BINARY         "Catalina_CMM.binary"         // P1 only
#define DEFAULT_TARGET     "def"
#define DEFAULT_BIND_P1    "Catalina.spin"
#define DEFAULT_BIND_P2    "catalina.s"
#define DEFAULT_RESULT     "a.bin"
#define DEFAULT_INDEX      "catalina.idx"

#define P1_SUFFIX          "p1"
#define P2_SUFFIX          "p2"

#define BIND_P1            "bcc "
#define ASSEMBLE_P1        "spinnaker -p -a -b "
#define OUTPUT_OPT_P1      " -o "         /* note - space before, space after */
#define TARGET_OPT_P1      " -e "         /* note - space before, space after */
#define VERBOSE_P1         "-v "
#define QUIET_P1           "-q "
#define INC_LIB_OPT_P1    " -I "          /* note - space before and after */

#define BIND_P2            "bcc "
#define PREPROCESS_P2      "spp "
#define ASSEMBLE_P2        "p2asm -v33 "  /* for Rev B or C Propeller 2 chips */
#define ASSEMBLE_P2_REV_A  "p2asm "       /* for Rev A Propeller 2 chips */
#define OUTPUT_OPT_P2      " -o "         /* note - space before, space after */
#define TARGET_OPT_P2      ""
#define VERBOSE_P2         ""
#define QUIET_P2           ""
#define INC_LIB_OPT_P2    " -I "          /* note - space before and after */

#define BINSTATS           "binstats "    /* note space after */
#define BINBUILD           "binbuild "    /* note space after */

#define ASSEMBLE_OPT_LMM   "catoptimize " /* note space after */
#define ASSEMBLE_OPT_NMM   "catoptimize " /* note space after */
#define ASSEMBLE_OPT_CMM   "cmmoptimize " /* note space after */
#define TARGET_OPT         "-T "          /* note space after */
#define P2_OPT             "-p2 "         /* note space after */
#define SUPPRESS_OPT       "-k "          /* note space after */
#define DEFAULT_EMM_MEM    "32768"
#define DEFAULT_SMM_MEM    "32768"
#define DEFAULT_XMM_MEM    "16777216"
#define DEFAULT_FLASH_MEM  "16777216"
#define PRE_DEFINE_STRING  "#define "     /* note - space after */
#define CMD_DEFINE_STRING  "-D "          /* note - space after */
#define BLACKCAT_CMD       "catdbgfilegen "

#define OUTPUT_SUFFIX      ".s"

#ifndef SECTOR_SIZE
#define SECTOR_SIZE        0x0200 // size of sector 
#endif

extern int _CRT_glob = 1; /* 0 turns off globbing; 1 turns it on */

static char optimize_assemble[MAX_LINELEN + 1] = "";
static char lcc_path[MAX_LINELEN + 1] = "";
static char def_tgt_path[MAX_LINELEN + 1] = "";
static char def_lib_path[MAX_LINELEN + 1] = "";

/* global flags */
static int diagnose   = 0;
static int verbose    = 0;
static int quiet      = 0;
static int olevel     = 0;
static int import     = 0;
static int export     = 0;
static int assemble   = 1;
static int bind       = 1;
static int force      = 0;
static int cleanup    = 1; 
static int quickforce = 0; 
static int quickbuild = 0; 
static int prop_vers  = 1; 
static int format     = 0; // 0 => binary, 1 => eeprom

enum { Code, Cnst, Init, Data };

enum { undefined, redefined, imported, exported, resolving, resolved };

static int input_count = 0;                  
static char * input_file[MAX_FILES];

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
static int heaptop = 0;
static int suppress = 0;

static char *target;
static char *result_file;
static char *target_path;
static char *library_path;
static char *temp_path;
static char *path_separator;

static int debug_level = 0; // generate debug output (any level)

static char target_with_suffix[MAX_PATHLEN + 1] = "";
static char bind_command[MAX_LINELEN + 1]       = BIND_P1;
static char preprocess_command[MAX_LINELEN + 1] = "";
static char assemble_command[MAX_LINELEN + 1]   = ASSEMBLE_P1;
static char assemble_verbose[MAX_LINELEN + 1]   = VERBOSE_P1;
static char assemble_quiet[MAX_LINELEN + 1]     = QUIET_P1;
static char inc_lib_opt[MAX_LINELEN + 1]        = INC_LIB_OPT_P1;
static char output_opt[MAX_LINELEN + 1]         = OUTPUT_OPT_P1;
static char target_opt[MAX_LINELEN + 1]         = TARGET_OPT_P1;
static char memory_size[MAX_LINELEN + 1]        = "";
static char bind_options[MAX_LINELEN + 1]       = "";
static char assemble_options[MAX_LINELEN + 1]   = "";
static char blackcat_command[MAX_LINELEN + 1]   = BLACKCAT_CMD;

static int p2asm     = 0;   /* 1 for p2asm assembler*/
static int spinnaker = 1;   /* 1 for spinnaker assembler (default) */

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

// return 0 if directory exists
int directory_exists(char *dir) {
   uint8_t sector[SECTOR_SIZE];
   uint32_t pstart, psize;
   uint8_t pactive, ptype;
   VOLINFO vi;
   DIRINFO di;
   pstart = DFS_GetPtnStart(0, sector, 0, &pactive, &ptype, &psize);
   if (pstart == 0xffffffff) {
      // printf("Cannot find first partition - is an SD card inserted?\n");
      return -1;
   }
   if (DFS_GetVolInfo(0, sector, pstart, &vi)) {
      // printf("Error getting volume information\n");
      return -1;
   }
   di.scratch = sector;
   if (DFS_OpenDir(&vi, (uint8_t *)dir, &di)) {
      //printf("Error opening root directory\n");
      return -1;
   }
   else {
      return 0;
   }
}

// we have no process ids!
int getpid() {
   return 0;
}

#else

char * catalina_getenv(char *name) {
   char *tmp = getenv(name);
   if (tmp == NULL) {
      return tmp;
   }
   else {
      return strdup(tmp);
   }
}

int directory_exists(char *dir) {
   struct stat st;
   return stat(dir, &st);
}

#endif

void help(char *my_name) {
   fprintf(stderr, "\nusage: %s [options] [files ...]\n\n", my_name);
   fprintf(stderr, "options:  -? or -h  print this helpful message (and exit)\n");
   fprintf(stderr, "          -a        no assembly (output bound source files only)\n");
   fprintf(stderr, "          -as       use spinnaker as assembler (default)\n");
   fprintf(stderr, "          -ap       use p2asm as assembler\n");
   fprintf(stderr, "          -C symbol #define Catalina 'symbol' before assembling\n");
   fprintf(stderr, "          -d        output diagnostic messages\n");
   fprintf(stderr, "          -e        generate export list from input files\n");
   fprintf(stderr, "          -f        force (continue even if errors occur)\n");
   fprintf(stderr, "          -g[level] generate debuging output (default level = 1)\n");
   fprintf(stderr, "          -H addr   address of top of heap\n");
   fprintf(stderr, "          -i        generate import list from input files\n");
   fprintf(stderr, "          -k        kill (suppress) statistics output\n");
   fprintf(stderr, "          -L path   path to libraries (default is '%s')\n", def_lib_path);
   fprintf(stderr, "          -l name   search library named 'libname' when binding\n");
   fprintf(stderr, "          -M size   memory size to use (used with -x, default is 16M)\n");
   fprintf(stderr, "          -o name   output results (generate, bind or assemble) to file 'name'\n");
   fprintf(stderr, "          -p ver    Propeller Hardware Version\n");
   fprintf(stderr, "          -P addr   address for Read-Write segments\n");
   fprintf(stderr, "          -q        enable quick build (re-use any existing target files)\n");
   fprintf(stderr, "          -R addr   address for Read-Only segments\n");
   fprintf(stderr, "          -O[level] optimize code (default level = 1)\n");
   fprintf(stderr, "          -t name   use target 'name'\n");
   fprintf(stderr, "          -T path   path to target files (default is '%s')\n", def_tgt_path);
   fprintf(stderr, "          -u        do not remove preprocessed and intermediate output files\n");
   fprintf(stderr, "          -U symbol do not #define 'symbol' before assembling \n");
   fprintf(stderr, "          -v        verbose (output information messages)\n");
   fprintf(stderr, "          -w opt    pass option 'opt' to the assembler (e.g. -w-l, -w-b, -w-e)\n");
   fprintf(stderr, "          -x layout use specified memory layout (layout = 0 .. 6, 8 .. 11)\n");
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
 * process symbols that have special meanings
 */
void process_special_symbols() {
   int i;

   for (i = 0; i < define_count; i++) {
      if (strcmp(define_symbol[i], "P2_REV_A") == 0) {
         if (prop_vers == 2) {
            safecpy(assemble_command, ASSEMBLE_P2_REV_A, MAX_LINELEN);
            if (verbose) {
               fprintf(stderr, "Propeller 2 REV A instructions will be generated\n");
            }
         }
         else {
            fprintf(stderr, "P2_REV_A is meaningful only on the Propeller 2\n");
         }
      }
   }
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
   char   optnum[20];
   char * arg;

   if (argc == 1) {
      fprintf(stderr, "Catalina Binder %s\n", CATALINA_VERSION); 
      if (strlen(argv[0]) == 0) {
         // in case my name was not passed in ...
         help("bind");
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
                     fprintf(stderr, "note: option -e implies -a (no assembly)\n");
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
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     fprintf(stderr, "option -L requires an argument\n");
                     code = -1;
                  }
                  else {
                     library_path = strdup(arg);
                     if (diagnose) {
                        fprintf(stderr, "library path = %s\n", library_path);
                     }
                  }
                  break;

               case 'l':
                  if (import||export) {
                     fprintf(stderr, "cannot use -l with -i or -e\n");
                     code = -1; // force exit
                  }
                  if (lib_count < MAX_LIBS) {
                     arg = get_option_argument(&i, &argc, argv);
                     if (arg == NULL) {
                        fprintf(stderr, "option -l requires an argument\n");
                        code = -1;
                     }
                     else {
                        safecpy(libname, LIB_SUFFIX, MAX_LINELEN + 3);
                        safecat(libname, arg, MAX_LINELEN + 3);
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
                  if (diagnose) {
                     fprintf(stderr, "debug level %d\n", debug_level);
                  }
                  break;

               case 'H':
                  modifier = 0;
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
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
                     fprintf(stderr, "heaptop address = %d\n", heaptop);
                  }
                  break;

               case 'x':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     fprintf(stderr, "option -x requires an argument\n");
                     code = -1;
                  }
                  else {
                     sscanf(arg, "%d", &layout);
                  }
                  if (diagnose) {
                     fprintf(stderr, "memory layout %d\n", layout);
                  }
                  if ((layout < 0) || (layout == 7) || (layout > 11)) {
                     fprintf(stderr, "unknown memory layout - using layout 0\n");
                     layout = 0;
                  }
                  if ((layout == 8) || (layout == 9) || (layout == 10)) {
                     safecpy(optimize_assemble, ASSEMBLE_OPT_CMM, MAX_LINELEN);
                  }
                  if ((layout == 11)) {
                     safecpy(optimize_assemble, ASSEMBLE_OPT_NMM, MAX_LINELEN);
                  }
                  if (diagnose) {
                     fprintf(stderr, "using optimizer %s\n", optimize_assemble);
                  }
                  break;

               case 'd':
                  diagnose++;   /* increase diagnosis level */
                  if ((verbose + diagnose) == 1) {
                     fprintf(stderr, "Catalina Binder %s\n", CATALINA_VERSION); 
                  }
                  fprintf(stderr, "diagnostic level %d\n", diagnose);
                  break;

               case 'a':
                  if (strlen(argv[i]) == 3) {
                     // use next char
                     if (argv[i][2] == 'p') {
                        p2asm = 1;
                        spinnaker = 0;
                        if (diagnose) {
                           fprintf(stderr, "using p2asm\n");
                        }
                        safecpy(bind_command, BIND_P2, MAX_LINELEN);
                        safecpy(preprocess_command, PREPROCESS_P2, MAX_LINELEN);
                        safecpy(assemble_command, ASSEMBLE_P2, MAX_LINELEN);
                        safecpy(assemble_verbose, VERBOSE_P2, MAX_LINELEN);
                        safecpy(assemble_quiet, QUIET_P2, MAX_LINELEN);
                        safecpy(inc_lib_opt, INC_LIB_OPT_P2, MAX_LINELEN);
                        safecpy(output_opt, OUTPUT_OPT_P2, MAX_LINELEN);
                        safecpy(target_opt, TARGET_OPT_P2, MAX_LINELEN);
                     } 
                     else if (argv[i][2] == 's') {
                        p2asm = 0;
                        spinnaker = 1;
                        if (diagnose) {
                           fprintf(stderr, "using spinnaker\n");
                        }
                        safecpy(bind_command, BIND_P1, MAX_LINELEN);
                        safecpy(preprocess_command, "", MAX_LINELEN);
                        safecpy(assemble_command, ASSEMBLE_P1, MAX_LINELEN);
                        safecpy(assemble_verbose, VERBOSE_P1, MAX_LINELEN);
                        safecpy(assemble_quiet, QUIET_P1, MAX_LINELEN);
                        safecpy(inc_lib_opt, INC_LIB_OPT_P1, MAX_LINELEN);
                        safecpy(output_opt, OUTPUT_OPT_P1, MAX_LINELEN);
                        safecpy(target_opt, TARGET_OPT_P1, MAX_LINELEN);
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
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     fprintf(stderr, "option -o requires an argument\n");
                     code = -1;
                  }
                  else {
                     result_file = strdup(arg);
                     if (verbose) {
                        fprintf(stderr, "output file = %s\n", result_file);
                     }
                  }
                  break;

               case 'O':
                  if (strlen(argv[i]) == 2) {
                     // no optimizaton level - assume level 1
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
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     fprintf(stderr, "option -M requires an argument\n");
                     code = -1;
                  }
                  else {
                     if ((arg[0] == '$')) {
                        // hex parameter (such as $ABCD)
                        sscanf(&arg[1], "%x", &memsize);
                     }
                     else if ((arg[0] == '0')
                     && ((arg[1] == 'x')||(arg[1] == 'X'))) {
                        // hex parameter (such as 0xFFFF or 0XA000)
                        sscanf(&arg[2], "%x", &memsize);
                     }
                     else {
                        // decimal parameter, perhaps with modifier
                        // (such as 4k or 16m)
                        sscanf(arg, "%d%c", &memsize, &modifier);
                     }
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
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     fprintf(stderr, "option -p requires an argument\n");
                     code = -1;
                  }
                  else {
                     sscanf(arg, "%d", &prop_vers);
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
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
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
                     fprintf(stderr, "readwrite address = %d\n", readwrite);
                  }
                  break;

               case 'q':
                  quickbuild = 1;   /* enable quick build */
                  if (verbose) {
                     fprintf(stderr, "Quick Build enabled\n");
                  }
                  break;

               case 'Q':
                  quickforce = 1;   /* force quick build */
                  if (verbose) {
                     fprintf(stderr, "Quick Build forced\n");
                  }
                  break;

               case 'R':
                  modifier = 0;
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
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
                     fprintf(stderr, "readonly address = %d\n", readonly);
                  }
                  break;

               case 'T':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     fprintf(stderr, "option -T requires an argument\n");
                     code = -1;
                  }
                  else {
                     target_path = strdup(arg);
                     if (diagnose) {
                        fprintf(stderr, "target path = %s\n", target_path);
                     }
                  }
                  break;

               case 'C':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     fprintf(stderr, "option -C requires an argument\n");
                     code = -1;
                  }
                  else {
                     if (define_count < MAX_DEFINES) {
                        if (diagnose) {
                           fprintf(stderr, "defining %s\n", arg);
                        }
                        define_symbol[define_count++] = strdup(arg);
                     }
                     else {
                        fprintf(stderr, "too many defines - option -C ignored\n");
                     }
                  }
                  break;

               case 'U':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     fprintf(stderr, "option -U requires an argument\n");
                     code = -1;
                  }
                  else {
                     if (undefine_count < MAX_DEFINES) {
                        if (verbose) {
                           fprintf(stderr, "undefining %s\n", arg);
                        }
                        undefine_symbol[undefine_count++] = strdup(arg);
                     }
                     else {
                        fprintf(stderr, "too many undefines - option -U ignored\n");
                     }
                  }
                  break;

               case 't':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     fprintf(stderr, "option -t requires an argument\n");
                     code = -1;
                  }
                  else {
                     target = strdup(arg);
                     if (verbose) {
                        fprintf(stderr, "target name = %s\n", target);
                     }
                  }
                  break;

               case 'u':
                  cleanup = 0;
                  fprintf(stderr, "untidy (no cleanup) mode\n");
                  break;

               case 'v':
                  verbose++;
                  if ((verbose + diagnose) == 1) {
                     fprintf(stderr, "Catalina Binder %s\n", CATALINA_VERSION); 
                  }
                  if (diagnose) {
                     fprintf(stderr, "verbosity level %d\n", verbose);
                  }
                  break;

               case 'w':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     fprintf(stderr, "option -w requires an argument\n");
                     code = -1;
                  }
                  else {
                     safecat(assemble_options, arg, MAX_LINELEN);
                     safecat(assemble_options, " ", MAX_LINELEN);
                     // check for eeprom or binary requests
                     if (strncmp(arg, "-e", 2) == 0) {
                        format = 1; // eeprom
                     }
                     else if (strncmp(arg, "-b", 2) == 0) {
                        format = 0; // binary
                     }
                  }
                  if (diagnose) {
                     fprintf(stderr, "assemble options = %s\n", assemble_options);
                  }
                  break;

               case 'z':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     fprintf(stderr, "option -z requires an argument\n");
                     code = -1;
                  }
                  else {
                     path_separator = strdup(arg);
                     if (verbose) {
                        fprintf(stderr, "path separator = %s\n", path_separator);
                     }
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
   process_special_symbols();
   return code;

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

int defined(char *symbol) {
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
      if (diagnose > 1) {
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
      if (diagnose > 1) {
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
         if ((strchr(define_symbol[i], '=') != NULL) || (strchr(define_symbol[i], ' ') != NULL)) {
            // complex symbol definition - must quote it (only works on P2)
            safecat(to_string, "\"", size);
            safecat(to_string, define_symbol[i], size);
            safecat(to_string, "\"", size);
         }
         else {
            // simple symbol definition (works on P1 or P2)
            safecat(to_string, define_symbol[i], size);
         }
         safecat(to_string, " ", size);
      }
      else {
         if (diagnose) {
            fprintf(stderr, "undefined %s\n", define_symbol[i]);
         }
      }
   }
}

char *output_suffix(int prop_vers, int format) {
   static char bin[]=".bin";
   static char binary[]=".binary";
   static char eeprom[]=".eeprom";

   if (prop_vers == 2) {
       return bin; // p2 assembler always generates .bin files
   }
   else {
       return ((format == 0) ? binary : eeprom);
   }
}

/* preprocess and assemble src, putting output in dst
 * On the Propeller 1, the preprocessing is done by the 
 * spinnaker spin compiler, but on the Propeller 2 it 
 * is a separate step.
 * The extra_options parameter can be used to pass 
 * options (to the assembler only)
 * */
int preprocess_assemble(char *src, char *dst, char *extra_options) {
   char     preprocess[MAX_LINELEN + 1] = "";
   char     assemble[MAX_LINELEN + 1] = "";
   int      result = 0;

   if (diagnose) {
      fprintf(stderr, "preprocess assemble src = %s\n", src);
      fprintf(stderr, "preprocess assemble dst = %s\n", dst);
   }
   safecpy(preprocess, preprocess_command, MAX_LINELEN);
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
      if (verbose) {
         safecat(assemble, assemble_verbose, MAX_LINELEN);
      }
      else {
         safecat(assemble, assemble_quiet, MAX_LINELEN);
      }
   }
   if (prop_vers == 1) {
      // assembler also preprocesses
      command_defines(assemble, MAX_LINELEN);
      safecat(assemble, inc_lib_opt, MAX_LINELEN);
      pathcat(assemble, target_with_suffix, NULL, MAX_LINELEN);
      safecat(assemble, " ", MAX_LINELEN);
      if (memory) {
         safecat(assemble, " -M ", MAX_LINELEN);
         sprintf(memory_size, "%d ", memsize);
         safecat(assemble, memory_size, MAX_LINELEN);
      }
      pathcat(assemble, src, NULL, MAX_LINELEN);
      safecat(assemble, " ", MAX_LINELEN);
      safecat(assemble, output_opt, MAX_LINELEN);
      pathcat(assemble, dst, NULL, MAX_LINELEN);
      safecat(assemble, " ", MAX_LINELEN);
      safecat(assemble, assemble_options, MAX_LINELEN);
      safecat(assemble, extra_options, MAX_LINELEN);
      safecat(assemble, inc_lib_opt, MAX_LINELEN);
      safecat(assemble, ". ", MAX_LINELEN);
      if (verbose) {
         fprintf(stderr, "assemble command = %s\n", assemble);
      }
      if ((result = system(assemble)) != 0) {
         if (diagnose) {
            fprintf(stderr, "assemble command returned result %d\n", result);
         }
      }
   }
   else {
      // preprocessor is separate to assembler
      command_defines(preprocess, MAX_LINELEN);
      safecat(preprocess, inc_lib_opt, MAX_LINELEN);
      pathcat(preprocess, target_with_suffix, NULL, MAX_LINELEN);
      safecat(preprocess, " ", MAX_LINELEN);
      safecat(preprocess, inc_lib_opt, MAX_LINELEN);
      safecat(preprocess, ". ", MAX_LINELEN);
      pathcat(preprocess, src, NULL, MAX_LINELEN);
      safecat(preprocess, " ", MAX_LINELEN);
      pathcat(preprocess, dst, NULL, MAX_LINELEN);
      pathcat(preprocess, OUTPUT_SUFFIX, NULL, MAX_LINELEN);
      pathcat(assemble, dst, NULL, MAX_LINELEN);
      pathcat(assemble, OUTPUT_SUFFIX, NULL, MAX_LINELEN);
      if (olevel > 0) {
         safecat(assemble, output_opt, MAX_LINELEN);
         safecat(assemble, dst, MAX_LINELEN);
         safecat(assemble, " ", MAX_LINELEN);
      }
      safecat(assemble, " ", MAX_LINELEN);
      safecat(assemble, assemble_options, MAX_LINELEN);
      safecat(assemble, extra_options, MAX_LINELEN);
      if (verbose) {
         fprintf(stderr, "preprocess command = %s\n", preprocess);
         fprintf(stderr, "assemble command = %s\n", assemble);
      }
      if ((result = system(preprocess)) != 0) {
         if (diagnose) {
            fprintf(stderr, "preprocess command returned result %d\n", result);
         }
      }
      else {
         if ((result = system(assemble)) != 0) {
            if (diagnose) {
               fprintf(stderr, "assemble command returned result %d\n", result);
            }
         }
      }
   }
   return result;
}

/* print file statistics */
void do_binbuild(char *fullname, int prop_vers, int layout, int format) {
  
   int result;
   char bin_opt[32];
   char binbuild[MAX_LINELEN + 1] = BINBUILD;

   // now generate binbuild command
   sprintf(bin_opt, "-p%d -x%d ", prop_vers, layout);
   safecat(binbuild, bin_opt, MAX_LINELEN);
   if (format) {
     safecat(binbuild, "-e ", MAX_LINELEN);
   }
   if (quickbuild) {
     safecat(binbuild, "-q ", MAX_LINELEN);
   }
   if (quickforce) {
     safecat(binbuild, "-Q ", MAX_LINELEN);
   }
   if (diagnose) {
     safecat(binbuild, "-d ", MAX_LINELEN);
   }
   if (verbose) {
     safecat(binbuild, "-v ", MAX_LINELEN);
   }
   if (!cleanup) {
     safecat(binbuild, "-u ", MAX_LINELEN);
   }
   if (strcmp(target, DEFAULT_TARGET) != 0) {
     safecat(binbuild, "-t", MAX_LINELEN);
     safecat(binbuild, target, MAX_LINELEN);
     safecat(binbuild, " ", MAX_LINELEN);
   }
   safecat(binbuild, fullname, MAX_LINELEN);
   if (diagnose || verbose) {
      printf("binbuild command = %s\n", binbuild);
   }
   if ((result = system(binbuild)) != 0) {
      if (diagnose) {
         printf("binbuild command returned result %d\n", result);
      }
   }
}

/* print file statistics */
void do_binstats (char *output_name, int prop_vers) {
   int result;
   char bin_opt[32];
   char binstats[MAX_LINELEN + 1] = BINSTATS;

   // now generate binstats command
   if (prop_vers == 1) {
     sprintf(bin_opt, "-p1 -x%d ", layout);
     safecat(binstats, bin_opt, MAX_LINELEN);
   }
   if (diagnose) {
     safecat(binstats, "-d ", MAX_LINELEN);
   }
   if (verbose) {
     safecat(binstats, "-v ", MAX_LINELEN);
   }
   safecat(binstats, output_name, MAX_LINELEN);
   if (diagnose || verbose) {
      printf("binstats command = %s\n", binstats);
   }
   if ((result = system(binstats)) != 0) {
      if (diagnose) {
         printf("binstats command returned result %d\n", result);
      }
   }
}

/* assemble the file fullname */
void do_assemble(char *fullname) {

   char     preprocess[MAX_LINELEN + 1] = "";
   char     assemble[MAX_LINELEN + 1] = "";
   char     extras[MAX_LINELEN + 1] = "";
   char     blackcat[MAX_LINELEN + 1] = "";
   char     number_string[MAX_LINELEN + 1] = "";
   int      result;
   char     output_name[MAX_LINELEN] = "";
   char     target_output_name[MAX_PATHLEN * 2 + 10] = "";
   FILE *   target_file;
   char     path_sfx[MAX_PATHLEN + 1] = "";
   char     target_name[MAX_PATHLEN + 1] = "";;
   int      count;

   if (diagnose) {
      fprintf(stderr, "assembling %s\n", fullname);
   }
   if (!quickbuild && !quickforce && 
       ((layout == 0) || (layout == 8) || (layout == 11))) {
      // for these layouts, the target file includes the output of the Binder,
      // so it is straightforward to just assemble the target file, using
      // the name of file as both the source and destination
      safecpy(target_name, target_with_suffix, MAX_LINELEN);
      safecat(target_name, path_separator, MAX_LINELEN);
      safecat(target_name, get_target_prefix(layout), MAX_LINELEN);
      safecat(target_name, target, MAX_PATHLEN);
      safecat(target_name, TARGET_SUFFIX, MAX_PATHLEN);
      result = preprocess_assemble(target_name, fullname, "");
      if ((result == 0) && (!suppress)) {
         safecpy(output_name, "", MAX_LINELEN);
         pathcat(output_name, fullname, output_suffix(prop_vers, format), MAX_LINELEN);
         do_binstats(output_name, prop_vers);
      }
   }
   else {
      // when quick build is enabled, or for EMM, SMM or XMM, the target file 
      // is just a loader which does not directly include the output of the 
      // Binder. So for these modes we first compile the target file and then 
      // compile the output of the Binder - then we combine the two.

      safecpy(target_name, target_with_suffix, MAX_LINELEN);
      safecat(target_name, path_separator, MAX_LINELEN);
      safecat(target_name, get_target_prefix(layout), MAX_LINELEN);
      safecat(target_name, target, MAX_PATHLEN);
      safecat(target_name, TARGET_SUFFIX, MAX_PATHLEN);
      safecpy(output_name, get_target_prefix(layout), MAX_LINELEN);
      safecat(output_name, target, MAX_LINELEN);
      if (quickbuild) {
         // see if there is an existing target file
         safecpy(target_output_name, get_target_prefix(layout), MAX_PATHLEN);
         safecat(target_output_name, target, MAX_LINELEN);
         if (prop_vers == 2) {
            safecat(target_output_name, ".bin", MAX_LINELEN); // .bin on P2
         }
         else {
            safecat(target_output_name, ".eeprom", MAX_LINELEN); // .eeprom on P1
         }
         if ((target_file = fopen_unquoted(target_output_name, "rb")) != NULL) {
            if (!suppress) {
               // this Quick Build message is important enough that we issue 
               // it unless messages are explicitly suppressed - it tells us
               // that we are NOT going to rebuild the target file ...
               fprintf(stderr, "Quick Build - Using existing target file %s\n", target_output_name);
            }
            fclose(target_file);
            result = 0;
         }
         else {
            if (verbose) {
               fprintf(stderr, "Quick Build - No existing target file %s - rebuilding it\n",target_output_name);
            }
            result = preprocess_assemble(target_name, output_name, target_opt);
         }
      }
      else if (quickforce) {
         if (verbose) {
            fprintf(stderr, "Quick Build - building target file %s\n",target_output_name);
         }
         result = preprocess_assemble(target_name, output_name, target_opt);
      }
      else {
         result = preprocess_assemble(target_name, output_name, target_opt);
      }
      if (result == 0) {
         if (prop_vers == 1) {
            if (!memory) {
               // if memory not specified, use appropriate default
               safecpy(extras, " -M ", MAX_LINELEN);
               if (layout == 1) {
                  safecat(extras, DEFAULT_EMM_MEM, MAX_LINELEN);
               }
               else if (layout == 3) {
                  safecat(extras, DEFAULT_FLASH_MEM, MAX_LINELEN);
               }
               else if (layout == 4) {
                  safecat(extras, DEFAULT_FLASH_MEM, MAX_LINELEN);
               }
               else if (layout == 6) {
                  safecat(extras, DEFAULT_SMM_MEM, MAX_LINELEN);
               }
               else if (layout == 9) {
                  safecat(extras, DEFAULT_EMM_MEM, MAX_LINELEN);
               }
               else if (layout == 10) {
                  safecat(extras, DEFAULT_SMM_MEM, MAX_LINELEN);
               }
               else {
                  safecat(extras, DEFAULT_XMM_MEM, MAX_LINELEN);
               }
            }
            result = preprocess_assemble(DEFAULT_BIND_P1, fullname, extras);
         }
         else {
            result = preprocess_assemble(DEFAULT_BIND_P2, fullname, "");
         }
         if (result == 0) {
            if (layout == 6) {
               // now assemble the kernel file
               safecpy(assemble, assemble_command, MAX_LINELEN);
               if (verbose) {
                  safecat(assemble, assemble_verbose, MAX_LINELEN);
               }
               else {
                  safecat(assemble, assemble_quiet, MAX_LINELEN);
               }
               command_defines(assemble, MAX_LINELEN);
               pathcat(assemble, target_with_suffix, NULL, MAX_LINELEN);
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
               if (verbose) {
                  fprintf(stderr, "assemble command (kernel) = %s\n", assemble);
               }
               if ((result = system(assemble)) != 0) {
                  if (diagnose) {
                     fprintf(stderr, "assemble command returned result %d\n", result);
                  }
               }
            }
            else if (layout == 10) {
               // now assemble the kernel file
               safecpy(assemble, assemble_command, MAX_LINELEN);
               if (verbose) {
                  safecat(assemble, assemble_verbose, MAX_LINELEN);
               }
               else {
                  safecat(assemble, assemble_quiet, MAX_LINELEN);
               }
               command_defines(assemble, MAX_LINELEN);
               pathcat(assemble, target_with_suffix, NULL, MAX_LINELEN);
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
               if (verbose) {
                  fprintf(stderr, "assemble command (kernel) = %s\n", assemble);
               }
               if ((result = system(assemble)) != 0) {
                  if (diagnose) {
                     fprintf(stderr, "assemble command returned result %d\n", result);
                  }
               }
            }
            // combine the target, the program (and the kernel file if SMM).
            do_binbuild(fullname, prop_vers, layout, format);
            if (!suppress) {
               strcpy(output_name, "");
               pathcat(output_name, fullname, output_suffix(prop_vers, format), MAX_LINELEN); 
               do_binstats(output_name, prop_vers);
            }
         }
         else {
            if (diagnose) {
               fprintf(stderr, "assemble command returned result %d\n", result);
               fprintf(stderr, "output will not be combined with target\n");
            }
         }
      }
      else {
         if (diagnose) {
            fprintf(stderr, "assemble command returned result %d\n", result);
            fprintf(stderr, "output files will not be generated\n");
         }
      }
   }
   if (debug_level > 0) {
      safecpy(blackcat, blackcat_command, MAX_LINELEN);
      pathcat(blackcat, fullname, ".lst", MAX_LINELEN);
      safecat(blackcat, " -d . ", MAX_LINELEN);
      for (count = 0; count < lib_count; count++) {
         // check local libraries first, then system libraries
         if (directory_exists(input_lib[count]) == 0) {
            if (diagnose) {
               fprintf(stderr, "local directory %s exists - using it to locate debug files\n",
                  input_lib[count]);
            }
            safecat(blackcat, "-d .", MAX_LINELEN);
            safecat(blackcat, path_separator, MAX_LINELEN);
            safecat(blackcat, input_lib[count], MAX_LINELEN);
            safecat(blackcat, " ", MAX_LINELEN);
         }
         else {
            if (diagnose) {
               fprintf(stderr, "local directory %s does not exist - using library path to locate debug files\n",
                  input_lib[count]);
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
      if (verbose) {
         fprintf(stderr, "blackcat command = %s\n", blackcat);
      }
      if ((result = system(blackcat)) != 0) {
         if (diagnose) {
            fprintf(stderr, "blackcat command returned result %d\n", result);
            fprintf(stderr, "blackcat output file may be corrupt\n");
         }
      }
   }
}

void main (int argc, char *argv[]) {
   int   code;
   int   len;
   int   i;
   char  bind_outname[MAX_PATHLEN + 1] = "";
   char  assemble_outname[MAX_PATHLEN + 1] = "";
   char  option[MAX_LINELEN + 1] = "";

   code = 0;
   target = NULL;
   result_file = NULL;
   target_path = NULL;
   library_path = NULL;
   path_separator = NULL;

   safecpy(optimize_assemble, ASSEMBLE_OPT_LMM, MAX_LINELEN);
   safecpy(lcc_path, catalina_getenv(DEFAULT_LCC_ENV), MAX_LINELEN);

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
   
   library_path = catalina_getenv(DEFAULT_LIB_ENV);
   target_path = catalina_getenv(DEFAULT_TGT_ENV);
   temp_path = catalina_getenv(DEFAULT_TMP_ENV);

   if (temp_path == NULL) {
      if (catalina_getenv("TMP"))
         temp_path = catalina_getenv("TMP");
      else if (catalina_getenv("TEMP"))
         temp_path = catalina_getenv("TEMP");
      else if (catalina_getenv("TMPDIR"))
         temp_path = catalina_getenv("TMPDIR");
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

   if (diagnose) {
      fprintf(stderr, "using temp dir %s\n", temp_path);
   }
   
   if (path_separator == NULL) {
      path_separator = DEFAULT_SEP;
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
   safecpy(target_with_suffix, target_path, MAX_PATHLEN);
   safecat(target_with_suffix, path_separator, MAX_LINELEN);
   if (prop_vers == 1) {
      // propeller 1
      safecat(target_with_suffix, P1_SUFFIX, MAX_LINELEN);
   }
   else {
      // propeller 2
      safecat(target_with_suffix, P2_SUFFIX, MAX_LINELEN);
   }
   if (olevel > 0) {
      safecpy(assemble_command, optimize_assemble, MAX_LINELEN);
      safecat(assemble_command, TARGET_OPT, MAX_LINELEN);
      safecat(assemble_command, "\"", MAX_LINELEN);
      safecat(assemble_command, target_path, MAX_LINELEN);
      safecat(assemble_command, "\" ", MAX_LINELEN);
      if (prop_vers == 2) {
         if (diagnose) {
            fprintf(stderr, "using p2 optimizer\n");
         }
         safecat(assemble_command, P2_OPT, MAX_LINELEN);
      }
      if (suppress != 0) {
         safecat(assemble_command, SUPPRESS_OPT, MAX_LINELEN);
      }
      sprintf(option, "-O%d ", olevel);
      safecat(assemble_command, option, MAX_LINELEN);
      if (verbose) {
         fprintf(stderr, "optimizing assemble command = %s\n", assemble_command);
      }
   }
   if (result_file == NULL) {
      result_file = DEFAULT_RESULT;
      if (diagnose) {
         fprintf(stderr, "output file = %s\n", result_file);
      }
   }
   if (import||export) {
      // when not binding, do not include progbeg or target file
      safecat(bind_options, "-i -e ", MAX_LINELEN);
      if (verbose) {
         safecat(bind_options, "-v ", MAX_LINELEN);
      }
      if (diagnose) {
         safecat(bind_options, "-d ", MAX_LINELEN);
      }
      for (i = 0; i < input_count; i++) {
         safecat(bind_options, "\"", MAX_LINELEN);
         safecat(bind_options, input_file[i], MAX_LINELEN);
         safecat(bind_options, "\" ", MAX_LINELEN);
      }
      safecpy(bind_outname, result_file, MAX_PATHLEN);
      safecat(bind_options, "-o \"", MAX_LINELEN);
      safecat(bind_options, bind_outname, MAX_LINELEN);
      safecat(bind_options, "\" ", MAX_LINELEN);
      safecat(bind_command, bind_options, MAX_LINELEN);
      if (verbose) {
         fprintf(stderr, "bind command = %s\n", bind_command);
      }
      if ((code = system(bind_command)) != 0) {
         if (diagnose) {
            fprintf(stderr, "bind command returned result %d\n", code);
         }
      }
   }
   else {
      if (verbose) {
         safecat(bind_options, "-v ", MAX_LINELEN);
      }
      if (diagnose) {
         safecat(bind_options, "-d ", MAX_LINELEN);
      }
      safecat(bind_options, "-L \"", MAX_LINELEN);
      safecat(bind_options, library_path, MAX_LINELEN);
      safecat(bind_options, "\" ", MAX_LINELEN);
      safecat(bind_options, "-T \"", MAX_LINELEN);
      safecat(bind_options, target_path, MAX_LINELEN);
      safecat(bind_options, "\" ", MAX_LINELEN);
      safecat(bind_options, "-t ", MAX_LINELEN);
      safecat(bind_options, target, MAX_LINELEN);
      safecat(bind_options, " ", MAX_LINELEN);
      sprintf(option, "-x%d ", layout);
      safecat(bind_options, option, MAX_LINELEN);
      sprintf(option, "-p%d ", prop_vers);
      safecat(bind_options, option, MAX_LINELEN);
      if (readonly > 0) {
         sprintf(option, "-R 0x%X ", readonly);
         safecat(bind_options, option, MAX_LINELEN);
      }
      if (readwrite > 0) {
         sprintf(option, "-P 0x%X ", readwrite);
         safecat(bind_options, option, MAX_LINELEN);
      }
      if (heaptop > 0) {
         sprintf(option, "-H 0x%X ", heaptop);
         safecat(bind_options, option, MAX_LINELEN);
      }
      for (i = 0; i < lib_count; i++) {
         safecat(bind_options, "-l", MAX_LINELEN);
         safecat(bind_options, input_lib[i], MAX_LINELEN);
         safecat(bind_options, " ", MAX_LINELEN);
      }
      for (i = 0; i < input_count; i++) {
         safecat(bind_options, "\"", MAX_LINELEN);
         safecat(bind_options, input_file[i], MAX_LINELEN);
         safecat(bind_options, "\" ", MAX_LINELEN);
      }
      if ((assemble) || force) {
         if (prop_vers == 2) {
            safecpy(bind_outname, DEFAULT_BIND_P2, MAX_PATHLEN);
         }
         else {
            safecpy(bind_outname, DEFAULT_BIND_P1, MAX_PATHLEN);
         }
      }
      else {
         // if we are not assembling, use the result
         // filename for the output of the bind (and
         // do not delete it)
         safecpy(bind_outname, result_file, MAX_LINELEN);
      }
      safecat(bind_options, "-o \"", MAX_LINELEN);
      safecat(bind_options, bind_outname, MAX_LINELEN);
      safecat(bind_options, "\" ", MAX_LINELEN);
      safecat(bind_options, option, MAX_LINELEN);
      safecat(bind_command, bind_options, MAX_LINELEN);
      if (verbose) {
         fprintf(stderr, "bind command = %s\n", bind_command);
      }
      if ((code = system(bind_command)) != 0) {
         if (diagnose) {
            fprintf(stderr, "bind command returned result %d\n", code);
         }
      }
      if (((code == 0) && assemble) || force) {
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
         if (cleanup) {
            // delete the temporary file
            if (diagnose) {
               fprintf(stderr, "cleaning up temporary file %s\n", bind_outname);
            }
            remove_unquoted(bind_outname);
            safecpy(assemble_outname, result_file, MAX_PATHLEN);
            safecat(assemble_outname, OUTPUT_SUFFIX, MAX_PATHLEN);
            if (diagnose) {
               fprintf(stderr, "cleaning up temporary file %s\n", assemble_outname);
            }
            remove_unquoted(assemble_outname);
         }
      }
   }
   if (diagnose) {
      fprintf(stderr, "\n%s done, result = %d\n", argv[0], code);
   }
   exit(code);
}
