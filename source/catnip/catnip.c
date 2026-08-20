/*
 * Catnip - PASM level optimizer for the Catalina compilation system.
 *
 * version 8.9   - Initial version, consolidating catoptimize and 
 *                 cmmoptimize into one program, adding a -x command line 
 *                 option to specify CMM (i.e. via -x8, -x9 or -x10).
 *
 *               - For the Propeller 2, replace calls to p2_asm with 
 *                 equivalent calls directly to spp and p2asm.
 *
 *               - When cleaning up, only remove binaries produced by this
 *                 program execution, not both Propeller 1 and Propeller 2 
 *                 binaries (if they both exist).
 *
 */

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>

#include "catnip.h"
#include "version.h"

#define DO_EXECUTE         1 // 0 for debugging (output only, no execute)

#ifdef WIN32_PATHS         /* define this on the command line for Windows */
#define PATH_SEP           "\\"
#define DEFAULT_LCCDIR     "C:\\Program Files (x86)\\Catalina\\" // must match default used by LCC

#else
#define PATH_SEP           "/"
#define DEFAULT_LCCDIR     "/opt/catalina/" // must match default used by LCC
#endif

#define TARGET_NAME        "target"
#define DEFAULT_LCC_ENV    "LCCDIR" 
#define DEFAULT_TGT_ENV    "CATALINA_TARGET" 

#define P1_SUFFIX          "p1"
#define P2_SUFFIX          "p2"

#define MAX_FILES          1
#define MAX_LINELEN        1000
#define MAX_PATHLEN        1000
#define MAX_NAMELEN        1000
#define MAX_SYMBOLS        10000
#define MAX_DEFINES        50

#define DEFAULT_RESULT     "optimized"

#define CMM_PREFIX         "cmm"

#define LMM_PREFIX         "lmm"

#define NMM_PREFIX         "nmm"

#define PREPROCESS_P1      "" /* spinnaker does its own preprocessing */
#define ASSEMBLE_P1        "spinnaker -p -a -D CATALINA_OPTIMIZE "
#define OUTOPT_P1          " -o " /* note - space before, space after */
#define INCOPT_P1          " -I " /* note - space before and after */
#define VERBOSE_P1         " -v " /* note - space before and after */
#define QUIET_P1           " -q " /* note - space before and after */
#define LISTOPT_P1         " -l " /* note - space before and after */
#define EEPROMPT_P1        " -e " /* note - space before and space after */

#define PREPROCESS_P2      "spp "
#define ASSEMBLE_P2        "p2asm -v33 "  /* for Rev B or C Propeller 2 chips */
#define ASSEMBLE_P2_REV_A  "p2asm "       /* for Rev A Propeller 2 chips */
#define LISTOPT_P2         " -l " /* note - space before and after */
#define INCOPT_P2          " -I " /* note - space before and after */

#define OPTIMIZE_FILENAME_P1  "Catalina.spin"
#define OPTIMIZE_FILENAME_P2  "catalina.s"

#define CMD_DEFINE_STRING  "-D " /* note - space after */

#define DEFAULT_PREFIX     "cat"
#define COMPACT_PREFIX     "cmm"

#define TEMP_SUFFIX        "o" // added to bas file names for temp files
                               // (e.g. xxx.s ==> xxx.so)

#define PHASE_0_SUFFIX     "opt_0 "
#define PHASE_1_SUFFIX     "opt_1 "
#define PHASE_2_SUFFIX     "opt_2 "
#define PHASE_3_SUFFIX     "opt_3 "
#define PHASE_4_SUFFIX     "opt_4 "
#define PHASE_5_SUFFIX     "opt_5 "
#define PHASE_6_SUFFIX     "opt_6 "
#define PHASE_7_SUFFIX     "opt_7 "
#define PHASE_8_SUFFIX     "opt_8 "
#define PHASE_9_SUFFIX     "opt_9 "
#define PHASE_10_SUFFIX    "opt_10 "
#define PHASE_11_SUFFIX    "opt_11 "
#define PHASE_12_SUFFIX    "opt_12 "
#define PHASE_13_SUFFIX    "opt_13 "
#define PHASE_14_SUFFIX    "opt_14 "

static char lcc_path[MAX_LINELEN + 1] = "";
static char target_path[MAX_LINELEN + 1] = "";

/* global flags */
static int prop_vers = 1;
static int verbose   = 0;
static int listing   = 0;
static int suppress  = 0;
static int olevel    = 0;
static int cleanup   = 1; 
static int format    = 0; // 0 => binary, 1 => eeprom
static int layout    = 0; // laout specified via -x command line option
static int compact   = 0; // layout = 8, 9 or 10 (i.e. cmm)

static int input_count = 0;
static char * input_file[MAX_FILES];     /* should only need one */

static int define_count = 0;
static char * define_symbol[MAX_DEFINES];

static int undefine_count = 0;
static char * undefine_symbol[MAX_DEFINES];

static int memory = 0;

static char *memory_size;

static char *output_file;

static char *include_path;

static char preprocess_command[MAX_LINELEN + 1] = PREPROCESS_P1;
static char assemble_command[MAX_LINELEN + 1] = ASSEMBLE_P1;

void help(char *my_name) {
   fprintf(stderr, "Catnip Optimizer %s\n", OPTIMIZER_VERSION); 
   fprintf(stderr, "\nusage: %s [options] file\n\n", my_name);
   fprintf(stderr, "options:  -? or -h  print this helpful message (and exit)\n");
   fprintf(stderr, "          -b        binary output (default)\n");
   fprintf(stderr, "          -d        generate listing\n");
   fprintf(stderr, "          -D        define symbol\n");
   fprintf(stderr, "          -e        eeprom output\n");
   fprintf(stderr, "          -I path   path to libraries\n");

   fprintf(stderr, "          -k        suppress banner\n");
   fprintf(stderr, "          -l        generate listing\n");
   fprintf(stderr, "          -L path   path to libraries\n");
   fprintf(stderr, "          -M size   memory size to use (default is 64k)\n");
   fprintf(stderr, "          -o name   output optimized results to file 'name'\n");
   fprintf(stderr, "          -p vers   Propeller version (1 or 2)\n");
   fprintf(stderr, "          -Olevel   optimization level (1 to 5, note no space!)\n");
   fprintf(stderr, "          -T path   path to target to use\n");
   fprintf(stderr, "          -U symbol do not #define 'symbol' before assembling \n");
   fprintf(stderr, "          -u        do not remove intermediate output files\n");
   fprintf(stderr, "          -v        verbose (output information messages)\n");
   fprintf(stderr, "          -v -v     very verbose (more information messages)\n");
   fprintf(stderr, "          -x layout use specified memory layout (layout = 0 .. 6, 8 .. 11)\n");
   fprintf(stderr, "\n exit code is non-zero on error\n\n");
}

// safecpy will never write more than size characters, 
// and is guaranteed to null terminate its result, so
// make sure the buffer passed is at least size + 1
char * safecpy(char *dst, const char *src, size_t size) {
   dst[size] = '\0';
   if (src) {
      return strncpy(dst, src, size - strlen(dst));
   }
}

// safecat will never write more than size characters, 
// and is guaranteed to null terminate its resul, so
// make sure the buffer passed is at least size + 1
char * safecat(char *dst, const char *src, size_t size) {
   dst[size] = '\0';
   if (src) {
      return strncat(dst, src, size - strlen(dst));
   }
}

// pathcat will check for paths with spaces and quote
// them if we are using Win32 style path names, otherwise
// it is much the same as two safecats
void pathcat(char *dst, const char *src, const char *sfx, size_t max) {
#ifdef WIN32_PATHS
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
#else
   safecat(dst, src, max);
   if (sfx != NULL) {
      safecat(dst, sfx, max);
   }
#endif   
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
 * decode arguments, building file and include list - return -1 if
 * there is no further processing to do
 */
int decode_arguments (int argc, char *argv[]) {
   char   libname[MAX_LINELEN + 3 + 1];
   char * symbol;
   int    code = 0;
   int    i = 0;
   int    memsize;
   char   modifier;
   char   memstr[20];
   char   optnum[20];
   char * arg;

   if (argc == 1) {
      if (strlen(argv[0]) == 0) {
         // in case my name was not passed in ...
         help("catoptimize");
      }
      else {
         help(argv[0]);
      }
      code = -1;
   }
   while ((code >= 0) && (argc--)) {
      if (verbose) {
        fprintf(stderr, "arg: %s\n", argv[i]);
      }
      if (i > 0) {
         if (argv[i][0] == '-') {
            if (verbose) {
              fprintf(stderr, "switch: %s\n", argv[i]);
            }
            // it's a command line switch
            switch (argv[i][1]) {
               case 'h':
               case '?':
                  if (strlen(argv[0]) == 0) {
                     // in case my name was not passed in ...
                     help("catoptimize");
                  }
                  else {
                     help(argv[0]);
                  }
                  break;
               case 'b':
                  format = 0;
                  if (verbose) {
                     fprintf(stderr, "binary\n");
                  }
                  break;
               case 'D':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        symbol = strdup(argv[++i]);
                     }
                     else {
                        fprintf(stderr, "option -D requires an argument\n");
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
                     if (verbose) {
                        fprintf(stderr, "defining %s\n", symbol);
                     }
                  }
                  else {
                     fprintf(stderr, "too many defines - option -D ignored\n");
                  }
                  break;
               case 'd':
               case 'l':
                  listing = 1;
                  if (verbose) {
                     fprintf(stderr, "listing\n");
                  }
                  break;
               case 'k':
                  suppress = 1;
                  if (verbose) {
                     fprintf(stderr, "suppress\n");
                  }
                  break;
               case 'e':
                  format = 1;
                  if (verbose) {
                     fprintf(stderr, "eeprom\n");
                  }
                  break;
               case 'o':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        output_file = strdup(argv[++i]);
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
                     output_file = strdup(&argv[i][2]);
                  }
                  if (verbose) {
                    fprintf(stderr, "output file = %s\n", output_file);
                  }
                  break;
               case 'O':
                  if (strlen(argv[i]) == 2) {
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

               case 'I':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        include_path = strdup(argv[++i]);
                     }
                     else {
                       fprintf(stderr, "option -I requires an argument\n");
                        code = -1;
                        break;
                     }
                     argc--;
                  }
                  else {
                     // use remainder of this arg
                     include_path = strdup(&argv[i][2]);
                  }
                  if (verbose) {
                    fprintf(stderr, "include path = %s\n", include_path);
                  }
                  break;
               case 'L':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        include_path = strdup(argv[++i]);
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
                     include_path = strdup(&argv[i][2]);
                  }
                  if (verbose) {
                    fprintf(stderr, "include path = %s\n", include_path);
                  }
                  break;
               case 'M':
                  memory = 1;
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d%c", &memsize, &modifier);
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
                     sscanf(&argv[i][2], "%d%c", &memsize, &modifier);
                  }
                  if (tolower(modifier) == 'k') {
                     memsize *= 1024;
                  }
                  else if (tolower(modifier) == 'm') {
                     memsize *= 1024 * 1024;
                  }
                  sprintf(memstr,"%d", memsize);
                  memory_size = strdup(memstr);
                  if (verbose) {
                    fprintf(stderr, "memory size = %s\n", memory_size);
                  }
                  break;
               case 'T':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        strncpy(target_path, argv[++i], MAX_LINELEN);
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
                     strncpy(target_path, &argv[i][2], MAX_LINELEN);
                  }
                  if (verbose) {
                    fprintf(stderr, "target path = %s\n", target_path);
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
               case 'u':
                  cleanup = 0;
                  if (verbose) {
                     fprintf(stderr, "untidy (no cleanup) mode\n");
                  }
                  break;
               case 'v':
                  verbose++;
                  if (verbose == 1) {
                     fprintf(stderr, "verbose mode\n");
                  }
                  if (verbose > 1) {
                     fprintf(stderr, "very verbose mode\n");
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
                  if (verbose) {
                     fprintf(stderr, "memory layout %d\n", layout);
                  }
                  if ((layout < 0) || (layout == 7) || (layout > 11)) {
                     fprintf(stderr, "unknown memory layout - using layout 0\n");
                     layout = 0;
                  }
                  if ((layout == 8) || (layout == 9) || (layout == 10)) {
                     compact = 1;
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
            if (verbose) {
               printf("input filename = %s\n", argv[i]);
            }
            if (input_count < MAX_FILES) {
               input_file[input_count++] = strdup(argv[i]);
               code = 1; // work to do
            }
            else if (input_count > 1) {
               fprintf(stderr, "too many input files specified\n");
               code = -1; // force exit
            }
         }
      }
      i++; // next argument
   }
   if (verbose) {
      fprintf(stderr, "executable name = %s\n", argv[0]);
   }
   if (input_count == 0) {
      fprintf(stderr, "no input files specified\n");
      code = -1; // force exit
   }
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

int rename_unquoted(char *old, char *new) {
   char unquoted_old[MAX_PATHLEN + 1];
   char unquoted_new[MAX_PATHLEN + 1];

   unquote(old, unquoted_old);
   unquote(new, unquoted_new);
   if (verbose) {
      fprintf(stderr, "rename %s to %s\n", unquoted_old, unquoted_new);
   }
#if DO_EXECUTE   
   return rename(unquoted_old, unquoted_new);
#else
   return 0;
#endif   
}

int remove_unquoted(char *filename) {
   char unquoted_filename[MAX_PATHLEN + 1];

   unquote(filename, unquoted_filename);
   if (verbose) {
      fprintf(stderr, "remove %s\n", unquoted_filename);
   }
#if DO_EXECUTE   
   return remove(unquoted_filename);
#else
   return 0;
#endif   
}
   
void command_defines(char *to_string, int size) {
   int i, j;
   int defined = 0;

   for (i = 0; i < define_count; i++) {
      defined = 1;
      // check symbol has not been undefined
      for (j = 0; j < undefine_count; j++) {
         if (strcmp(define_symbol[i], undefine_symbol[j]) == 0) {
            defined = 0;
         }
      }
      if (defined) {
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
         // process symbols that have special meanings
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
}

int do_assemble(char *fullname, char *outname, int listing, char *include) {
   char     preprocess[MAX_LINELEN + 1] = "";
   char     assemble[MAX_LINELEN + 1] = "";
   char     tempname[MAX_LINELEN + 1] = "";
   int      result = 0;
   char     number_string[MAX_LINELEN + 1] = "";

   if (verbose) {
     fprintf(stderr, "assembling %s\n", fullname);
   }
   safecpy(preprocess, preprocess_command, MAX_LINELEN);
   safecpy(assemble, assemble_command, MAX_LINELEN);
   if (prop_vers == 1) {
      // the assembler also preprocesses, so we define
      // symbols on the assemble command line
      command_defines(assemble, MAX_LINELEN);
      if (listing) {
         safecat(assemble, LISTOPT_P1, MAX_LINELEN);
      }
      if (verbose <= 1) {
         safecat(assemble, QUIET_P1, MAX_LINELEN);
      }
      if (verbose > 1) {
         safecat(assemble, VERBOSE_P1, MAX_LINELEN);
      }
      if (memory) {
         safecat(assemble, " -M ", MAX_LINELEN);
         safecat(assemble, memory_size, MAX_LINELEN);
         safecat(assemble, " ", MAX_LINELEN);
      }
      if (format) {
         safecat(assemble, EEPROMPT_P1, MAX_LINELEN);
      }
      // use the full name of the file to assemble
      safecat(assemble, "\"", MAX_LINELEN);
      safecat(assemble, fullname, MAX_LINELEN);
      safecat(assemble, "\"", MAX_LINELEN);
      // put "include" options on assemble command line
      if (include != NULL) {
         safecat(assemble, INCOPT_P1, MAX_LINELEN);
         safecat(assemble, "\"", MAX_LINELEN);
         safecat(assemble, include, MAX_LINELEN);
         safecat(assemble, "\"", MAX_LINELEN);
      }
      else {
         if (include_path != NULL) {
            safecat(assemble, INCOPT_P1, MAX_LINELEN);
            safecat(assemble, "\"", MAX_LINELEN);
            safecat(assemble, include_path, MAX_LINELEN);
            safecat(assemble, "\"", MAX_LINELEN);
         }
      }
      safecat(assemble, INCOPT_P1, MAX_LINELEN);
      safecat(assemble, ". ", MAX_LINELEN);
      if (outname) {
         safecat(assemble, OUTOPT_P1, MAX_LINELEN);
         safecat(assemble, "\"", MAX_LINELEN);
         safecat(assemble, outname, MAX_LINELEN);
         safecat(assemble, "\"", MAX_LINELEN);
      }
   }
   else {
      // separate preprocessor, so we need a temporary 
      // file name, created from the full name
      safecat(tempname, "\"", MAX_LINELEN);
      safecat(tempname, fullname, MAX_LINELEN);
      safecat(tempname, TEMP_SUFFIX, MAX_LINELEN);
      safecat(tempname, "\"", MAX_LINELEN);
      // define symbols on preprocess command line
      command_defines(preprocess, MAX_LINELEN);
      if (listing) {
         safecat(assemble, LISTOPT_P2, MAX_LINELEN);
      }
      // put "include" options on preprocessor command line
      if (include != NULL) {
         safecat(preprocess, INCOPT_P2, MAX_LINELEN);
         safecat(preprocess, "\"", MAX_LINELEN);
         safecat(preprocess, include, MAX_LINELEN);
         safecat(preprocess, "\"", MAX_LINELEN);
      }
      else {
         if (include_path != NULL) {
            safecat(preprocess, INCOPT_P2, MAX_LINELEN);
            safecat(preprocess, "\"", MAX_LINELEN);
            safecat(preprocess, include_path, MAX_LINELEN);
            safecat(preprocess, "\"", MAX_LINELEN);
         }
      }
      safecat(preprocess, INCOPT_P2, MAX_LINELEN);
      safecat(preprocess, "\".\" ", MAX_LINELEN);
      // the input to the preprocessor is the full name
      safecat(preprocess, "\"", MAX_LINELEN);
      safecat(preprocess, fullname, MAX_LINELEN);
      safecat(preprocess, "\"", MAX_LINELEN);
      // the output of the preprocessor is the temp name
      safecat(preprocess, " > ", MAX_LINELEN);
      safecat(preprocess, tempname, MAX_LINELEN);
      // the input name of the assembler is the temp name
      safecat(assemble, tempname, MAX_LINELEN);
   }

   if (verbose) {
      if (prop_vers == 2) {
         fprintf(stderr, "preprocess command = %s\n", preprocess);
      }
      fprintf(stderr, "assemble command = %s\n", assemble);
   }
#if DO_EXECUTE
   if (prop_vers == 2) {
      // preprocess and assemble separately
      if ((result = system(preprocess)) != 0) {
         if (verbose) {
           fprintf(stderr, "preprocess result = %d\n", result);
         }
      }
      else {
         if ((result = system(assemble)) != 0) {
            if (verbose) {
              fprintf(stderr, "assemble result = %d\n", result);
            }
         }
      }
      // remove the temporary file
      if (verbose) {
        fprintf(stderr, "removing temporary file %s\n", tempname);
      }
      remove_unquoted(tempname);
   }
   else {
      // assembler also preprocesses
      if ((result = system(assemble)) != 0) {
         if (verbose) {
           fprintf(stderr, "assemble result = %d\n", result);
         }
      }
   }
#endif
   return result;
}

int do_phase_0(char *fullname) {
   char optimize[MAX_LINELEN + 1] = "";
   int result = 0;

   if (verbose) {
     fprintf(stderr, "phase 0\n");
   }
   safecpy(optimize, (compact?COMPACT_PREFIX:DEFAULT_PREFIX), MAX_LINELEN);
   safecat(optimize, PHASE_0_SUFFIX , MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, fullname, MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, " >", MAX_LINELEN);
   safecat(optimize, PHASE_0_OUTPUT_NAME, MAX_LINELEN);
   if (verbose) {
      printf("command = %s\n", optimize);
   }
#if DO_EXECUTE
   if ((result = system(optimize)) != 0) {
      if (verbose) {
         fprintf(stderr, "result = %d\n", result);
      }
   }
#endif   
   return result;   
}

int dummy_phase_0(char *fullname) {
   char optimize[MAX_LINELEN + 1] = "";
   int result = 0;

   remove_unquoted(PHASE_0_OUTPUT_NAME);
   if (verbose) {
     fprintf(stderr, "phase 0 %s\n", fullname);
   }
#if DO_EXECUTE
   if (result = rename_unquoted(fullname, PHASE_0_OUTPUT_NAME) != 0) {
      if (verbose) {
         fprintf(stderr, "result = %d\n", result);
      }
   }
#endif   
   return result;   
}

int do_phase_1(char *fullname) {
   char optimize[MAX_LINELEN + 1] = "";
   int result = 0;

   if (verbose) {
     fprintf(stderr, "phase 1 %s\n", fullname);
   }
   safecpy(optimize, (compact?COMPACT_PREFIX:DEFAULT_PREFIX), MAX_LINELEN);
   safecat(optimize, PHASE_1_SUFFIX , MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, fullname, MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, " >", MAX_LINELEN);
   safecat(optimize, PHASE_1_OUTPUT_NAME, MAX_LINELEN);
   if (verbose) {
      printf("command = %s\n", optimize);
   }
#if DO_EXECUTE
   if ((result = system(optimize)) != 0) {
      if (verbose) {
         fprintf(stderr, "result = %d\n", result);
      }
   }
#endif
   return result;   
}

int do_phase_2(char *fullname) {
   char optimize[MAX_LINELEN + 1] = "";
   int result = 0;

   if (verbose) {
     fprintf(stderr, "phase 2 %s\n", fullname);
   }
   safecpy(optimize, (compact?COMPACT_PREFIX:DEFAULT_PREFIX), MAX_LINELEN);
   safecat(optimize, PHASE_2_SUFFIX , MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, fullname, MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   if (verbose) {
      printf("command = %s\n", optimize);
   }
#if DO_EXECUTE
   if ((result = system(optimize)) != 0) {
      if (verbose) {
         fprintf(stderr, "result = %d\n", result);
      }
   }
#endif   
   return result;   
}

int do_phase_3(char *fullname) {
   char optimize[MAX_LINELEN + 1] = "";
   int result = 0;

   if (verbose) {
     fprintf(stderr, "phase 3 %s\n", fullname);
   }
   safecpy(optimize, (compact?COMPACT_PREFIX:DEFAULT_PREFIX), MAX_LINELEN);
   safecat(optimize, PHASE_3_SUFFIX , MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, fullname, MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, " >", MAX_LINELEN);
   safecat(optimize, PHASE_3_OUTPUT_TEMP, MAX_LINELEN);
   if (verbose) {
      printf("command = %s\n", optimize);
   }
#if DO_EXECUTE
   if ((result = system(optimize)) != 0) {
      if (verbose) {
         fprintf(stderr, "result = %d\n", result);
      }
   }
#endif
   // We must run phase 3 twice - to make sure all calls are 
   // processed correctly, even if they are on consecutive lines
   if (result == 0) {
      safecpy(optimize, (compact?COMPACT_PREFIX:DEFAULT_PREFIX), MAX_LINELEN);
      safecat(optimize, PHASE_3_SUFFIX , MAX_LINELEN);
      safecat(optimize, "\"", MAX_LINELEN);
      safecat(optimize, PHASE_3_OUTPUT_TEMP, MAX_LINELEN);
      safecat(optimize, "\"", MAX_LINELEN);
      safecat(optimize, " >", MAX_LINELEN);
      safecat(optimize, PHASE_3_OUTPUT_NAME, MAX_LINELEN);
      if (verbose) {
         printf("command = %s\n", optimize);
      }
#if DO_EXECUTE
      if ((result = system(optimize)) != 0) {
         if (verbose) {
            fprintf(stderr, "result = %d\n", result);
         }
      }
#endif   
   }
   return result;   
}


int dummy_phase_1_to_3(char *fullname) {
   char optimize[MAX_LINELEN + 1] = "";
   int result = 0;

   remove_unquoted(PHASE_3_OUTPUT_TEMP);
   remove_unquoted(PHASE_3_OUTPUT_NAME);
   if (verbose) {
     fprintf(stderr, "phase 1-3 %s\n", fullname);
   }
#if DO_EXECUTE
   if (result = rename_unquoted(fullname, PHASE_3_OUTPUT_NAME) != 0) {
      if (verbose) {
         fprintf(stderr, "result = %d\n", result);
      }
   }
#endif   
   return result;   
}

int do_phase_4(char *fullname) {
   char optimize[MAX_LINELEN + 1] = "";
   int result = 0;

   if (verbose) {
     fprintf(stderr, "phase 4\n");
   }
   safecpy(optimize, (compact?COMPACT_PREFIX:DEFAULT_PREFIX), MAX_LINELEN);
   safecat(optimize, PHASE_4_SUFFIX , MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, fullname, MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, " >", MAX_LINELEN);
   safecat(optimize, PHASE_4_OUTPUT_NAME, MAX_LINELEN);
   if (verbose) {
      printf("command = %s\n", optimize);
   }
#if DO_EXECUTE
   if ((result = system(optimize)) != 0) {
      if (verbose) {
         fprintf(stderr, "result = %d\n", result);
      }
      return result;
   }
#endif   
   return result;   
}

int do_phase_5(char *fullname) {
   char optimize[MAX_LINELEN + 1] = "";
   int result = 0;

   if (verbose) {
     fprintf(stderr, "phase 5\n");
   }
   safecpy(optimize, (compact?COMPACT_PREFIX:DEFAULT_PREFIX), MAX_LINELEN);
   safecat(optimize, PHASE_5_SUFFIX , MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, fullname, MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, " >", MAX_LINELEN);
   safecat(optimize, PHASE_5_OUTPUT_NAME, MAX_LINELEN);
   if (verbose) {
      printf("command = %s\n", optimize);
   }
#if DO_EXECUTE
   if ((result = system(optimize)) != 0) {
      if (verbose) {
         fprintf(stderr, "result = %d\n", result);
      }
   }
#endif   
   return result;   
}

int do_phase_6(char *fullname) {
   char optimize[MAX_LINELEN + 1] = "";
   int result = 0;

   if (verbose) {
     fprintf(stderr, "phase 6\n");
   }
   safecpy(optimize, (compact?COMPACT_PREFIX:DEFAULT_PREFIX), MAX_LINELEN);
   safecat(optimize, PHASE_6_SUFFIX , MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, fullname, MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, " >", MAX_LINELEN);
   safecat(optimize, PHASE_6_OUTPUT_NAME, MAX_LINELEN);
   if (verbose) {
      printf("command = %s\n", optimize);
   }
#if DO_EXECUTE
   if ((result = system(optimize)) != 0) {
      if (verbose) {
         fprintf(stderr, "result = %d\n", result);
      }
   }
#endif   
   return result;   
}

int do_phase_7(char *fullname) {
   char optimize[MAX_LINELEN + 1] = "";
   int result = 0;

   if (verbose) {
     fprintf(stderr, "phase 7\n");
   }
   safecpy(optimize, (compact?COMPACT_PREFIX:DEFAULT_PREFIX), MAX_LINELEN);
   safecat(optimize, PHASE_7_SUFFIX , MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, fullname, MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, " >", MAX_LINELEN);
   safecat(optimize, PHASE_7_OUTPUT_NAME, MAX_LINELEN);
   if (verbose) {
      printf("command = %s\n", optimize);
   }
#if DO_EXECUTE
   if ((result = system(optimize)) != 0) {
      if (verbose) {
         fprintf(stderr, "result = %d\n", result);
      }
   }
#endif   
   return result;   
}

int do_phase_8(char *fullname) {
   char optimize[MAX_LINELEN + 1] = "";
   int result = 0;

   if (verbose) {
     fprintf(stderr, "phase 8\n");
   }
   safecpy(optimize, (compact?COMPACT_PREFIX:DEFAULT_PREFIX), MAX_LINELEN);
   safecat(optimize, PHASE_8_SUFFIX , MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, fullname, MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   if (verbose) {
      printf("command = %s\n", optimize);
   }
#if DO_EXECUTE
   if ((result = system(optimize)) != 0) {
      if (verbose) {
         fprintf(stderr, "result = %d\n", result);
      }
   }
#endif   
   return result;   
}

int do_phase_9(char *fullname) {
   char optimize[MAX_LINELEN + 1] = "";
   int result = 0;

   if (verbose) {
     fprintf(stderr, "phase 9\n");
   }
   safecpy(optimize, (compact?COMPACT_PREFIX:DEFAULT_PREFIX), MAX_LINELEN);
   safecat(optimize, PHASE_9_SUFFIX , MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, fullname, MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, " >", MAX_LINELEN);
   safecat(optimize, PHASE_9_OUTPUT_NAME, MAX_LINELEN);
   if (verbose) {
      printf("command = %s\n", optimize);
   }
#if DO_EXECUTE
   if ((result = system(optimize)) != 0) {
      if (verbose) {
        fprintf(stderr, "result = %d\n", result);
      }
   }
#endif   
   return result;   
}

int do_phase_10(char *fullname) {
   char optimize[MAX_LINELEN + 1] = "";
   int result = 0;

   if (verbose) {
     fprintf(stderr, "phase 10\n");
   }
   safecpy(optimize, (compact?COMPACT_PREFIX:DEFAULT_PREFIX), MAX_LINELEN);
   safecat(optimize, PHASE_10_SUFFIX , MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, fullname, MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, " >", MAX_LINELEN);
   safecat(optimize, PHASE_10_OUTPUT_NAME, MAX_LINELEN);
   if (verbose) {
      printf("command = %s\n", optimize);
   }
#if DO_EXECUTE
   if ((result = system(optimize)) != 0) {
      if (verbose) {
        fprintf(stderr, "result = %d\n", result);
      }
   }
#endif   
   return result;   
}

int do_phase_11(char *fullname) {
   char optimize[MAX_LINELEN + 1] = "";
   int result = 0;

   if (verbose) {
     fprintf(stderr, "phase 11\n");
   }
   safecpy(optimize, (compact?COMPACT_PREFIX:DEFAULT_PREFIX), MAX_LINELEN);
   safecat(optimize, PHASE_11_SUFFIX , MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, fullname, MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, " >", MAX_LINELEN);
   safecat(optimize, PHASE_11_OUTPUT_NAME, MAX_LINELEN);
   if (verbose) {
      printf("command = %s\n", optimize);
   }
#if DO_EXECUTE
   if ((result = system(optimize)) != 0) {
      if (verbose) {
         fprintf(stderr, "result = %d\n", result);
      }
   }
#endif   
   return result;   
}

int do_phase_12(char *fullname) {
   char optimize[MAX_LINELEN + 1] = "";
   int result = 0;

   if (verbose) {
     fprintf(stderr, "phase 12\n");
   }
   safecpy(optimize, (compact?COMPACT_PREFIX:DEFAULT_PREFIX), MAX_LINELEN);
   safecat(optimize, PHASE_12_SUFFIX , MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, fullname, MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   if (verbose) {
      printf("command = %s\n", optimize);
   }
#if DO_EXECUTE
   if ((result = system(optimize)) != 0) {
      if (verbose) {
         fprintf(stderr, "result = %d\n", result);
      }
   }
#endif   
   return result;   
}

int do_phase_13(char *fullname) {
   char optimize[MAX_LINELEN + 1] = "";
   int result = 0;

   if (verbose) {
     fprintf(stderr, "phase 13\n");
   }
   safecpy(optimize, (compact?COMPACT_PREFIX:DEFAULT_PREFIX), MAX_LINELEN);
   safecat(optimize, PHASE_13_SUFFIX , MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, fullname, MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, " >", MAX_LINELEN);
   safecat(optimize, PHASE_13_OUTPUT_NAME, MAX_LINELEN);
   if (verbose) {
      printf("command = %s\n", optimize);
   }
#if DO_EXECUTE
   if ((result = system(optimize)) != 0) {
      if (verbose) {
         fprintf(stderr, "result = %d\n", result);
      }
   }
#endif   
   return result;   
}

int do_phase_14(char *fullname) {
   char optimize[MAX_LINELEN + 1] = "";
   int result = 0;

   if (verbose) {
     fprintf(stderr, "phase 14\n");
   }
   safecpy(optimize, (compact?COMPACT_PREFIX:DEFAULT_PREFIX), MAX_LINELEN);
   safecat(optimize, PHASE_14_SUFFIX, MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, fullname, MAX_LINELEN);
   safecat(optimize, "\"", MAX_LINELEN);
   safecat(optimize, " >", MAX_LINELEN);
   safecat(optimize, PHASE_14_OUTPUT_NAME, MAX_LINELEN);
   if (verbose) {
      printf("command = %s\n", optimize);
   }
#if DO_EXECUTE
   if ((result = system(optimize)) != 0) {
      if (verbose) {
         fprintf(stderr, "result = %d\n", result);
      }
   }
#endif   
   return result;   
}

int do_optimize(char *fullname) {
   int   code;

   if (verbose) {
     fprintf(stderr, "optimizing, file name = %s\n", fullname);
   }

   if (olevel >= 5) {
      code = do_phase_0(fullname);
      if (code != 0) {
         return code;
      }
   }
   else {
      code = dummy_phase_0(fullname);
      if (code != 0) {
         return code;
      }
   }
   if (olevel >= 3) {
      code = do_phase_1(PHASE_0_OUTPUT_NAME);
      if (code != 0) {
         return code;
      }
      code = do_phase_2(PHASE_0_OUTPUT_NAME);
      if (code != 0) {
         return code;
      }
      code = do_phase_3(PHASE_0_OUTPUT_NAME);
      if (code != 0) {
         return code;
      }
   }
   else {
      code = dummy_phase_1_to_3(PHASE_0_OUTPUT_NAME);
      if (code != 0) {
         return code;
      }
   }
   code = do_phase_4(PHASE_3_OUTPUT_NAME);
   if (code != 0) {
      return code;
   }
   if (compact) {
      code = do_phase_14(PHASE_4_OUTPUT_NAME);
      if (code != 0) {
         return code;
      }
      remove_unquoted(PHASE_4_OUTPUT_NAME);
      code = rename_unquoted(PHASE_14_OUTPUT_NAME, PHASE_4_OUTPUT_NAME);
      code = do_assemble(PHASE_4_OUTPUT_NAME, NULL, 1, target_path); 
      if (code != 0) {
         return code;
      }
   }
   else {
      code = do_assemble(PHASE_4_OUTPUT_NAME, NULL, 1, target_path); 
      if (code != 0) {
         return code;
      }
   }
   code = do_phase_5(PHASE_4_LISTING_NAME);
   if (code != 0) {
      return code;
   }
   code = do_phase_6(PHASE_4_OUTPUT_NAME);
   if (code != 0) {
      return code;
   }
   code = do_phase_7(PHASE_6_OUTPUT_NAME);
   if (code != 0) {
      return code;
   }
   code = do_phase_8(PHASE_6_OUTPUT_NAME);
   if (code != 0) {
      return code;
   }
   code = do_phase_9(PHASE_6_OUTPUT_NAME);
   if (code != 0) {
      return code;
   }
   code = do_phase_10(PHASE_9_OUTPUT_NAME);
   if (code != 0) {
      return code;
   }
   if (olevel > 1) {
      remove_unquoted(fullname);
      code = rename_unquoted(PHASE_10_OUTPUT_NAME, fullname);
      if (code != 0) {
         return code;
      }
      if (!compact) {
         code = do_assemble(input_file[0], output_file, listing, target_path); 
         if (code != 0) {
            return code;
         }
      }
      code = dummy_phase_1_to_3(fullname);
      if (code != 0) {
         return code;
      }
      code = do_phase_4(PHASE_3_OUTPUT_NAME);
      if (code != 0) {
         return code;
      }
      if (compact) {
         code = do_phase_14(PHASE_4_OUTPUT_NAME);
         if (code != 0) {
            return code;
         }
         remove_unquoted(PHASE_4_OUTPUT_NAME);
         code = rename_unquoted(PHASE_14_OUTPUT_NAME, PHASE_4_OUTPUT_NAME);
      }
      code = do_assemble(PHASE_4_OUTPUT_NAME, NULL, 1, target_path); 
      if (code != 0) {
         return code;
      }
      code = do_phase_5(PHASE_4_LISTING_NAME);
      if (code != 0) {
         return code;
      }
      code = do_phase_6(PHASE_4_OUTPUT_NAME);
      if (code != 0) {
         return code;
      }
      remove_unquoted(fullname);
      if (olevel >= 4) {
         code = do_phase_11(PHASE_6_OUTPUT_NAME);
         if (code != 0) {
            return code;
         }
         code = do_phase_12(PHASE_6_OUTPUT_NAME);
         if (code != 0) {
            return code;
         }
         code = do_phase_13(PHASE_6_OUTPUT_NAME);
         if (code != 0) {
            return code;
         }
         if (compact) {
            code = do_phase_14(PHASE_13_OUTPUT_NAME);
            if (code != 0) {
               return code;
            }
            code = rename_unquoted(PHASE_14_OUTPUT_NAME, fullname);
         }
         else {
            code = rename_unquoted(PHASE_13_OUTPUT_NAME, fullname);
         }
      }
      else {
         if (compact) {
            code = do_phase_14(PHASE_6_OUTPUT_NAME);
            if (code != 0) {
               return code;
            }
            code = rename_unquoted(PHASE_14_OUTPUT_NAME, fullname);
         }
         else {
            code = rename_unquoted(PHASE_6_OUTPUT_NAME, fullname);
         }
      }
      code = do_assemble(input_file[0], output_file, listing, target_path); 
      if (code != 0) {
         return code;
      }
   }
   else {
      if (compact) {
         code = do_phase_14(PHASE_10_OUTPUT_NAME);
         if (code != 0) {
            return code;
         }
         remove_unquoted(fullname);
         code = rename_unquoted(PHASE_14_OUTPUT_NAME, fullname);
         if (code != 0) {
            return code;
         }
      }
      else {
         remove_unquoted(fullname);
         code = rename_unquoted(PHASE_10_OUTPUT_NAME, fullname);
         if (code != 0) {
            return code;
         }
      }
      code = do_assemble(input_file[0], output_file, listing, target_path); 
      if (code != 0) {
         return code;
      }
   }

   if (cleanup) {
      if (verbose) {
        fprintf(stderr, "cleaning up intermediate files\n");
      }
      // delete preprocessed files
      remove_unquoted(PHASE_0_OUTPUT_NAME);
      remove_unquoted(PHASE_1_OUTPUT_NAME);
      remove_unquoted(PHASE_2_OUTPUT_NAME);
      remove_unquoted(PHASE_3_OUTPUT_TEMP);
      remove_unquoted(PHASE_3_OUTPUT_NAME);
      remove_unquoted(PHASE_4_OUTPUT_NAME);
      if (prop_vers == 1) {
         remove_unquoted(PHASE_4_BINARY_NAME_P1);
      }
      else {
         remove_unquoted(PHASE_4_BINARY_NAME_P2);
      }
      remove_unquoted(PHASE_4_LISTING_NAME);
      remove_unquoted(PHASE_5_OUTPUT_NAME);
      remove_unquoted(PHASE_6_OUTPUT_NAME);
      remove_unquoted(PHASE_7_OUTPUT_NAME);
      remove_unquoted(PHASE_8_OUTPUT_NAME);
      remove_unquoted(PHASE_9_OUTPUT_NAME);
      remove_unquoted(PHASE_11_OUTPUT_NAME);
      remove_unquoted(PHASE_12_OUTPUT_NAME);
      if (compact) {
         remove_unquoted(PHASE_13_OUTPUT_NAME);
      }
   }
   return 0;
}

int main(int argc, char *argv[]) {
   char *name;
   char *sep = PATH_SEP;
   int code = 0;
   int optimize = 0;

   include_path = NULL;

   if (decode_arguments(argc, argv) <= 0) {
      if (verbose) {
        fprintf(stderr, "%s exiting\n", argv[0]);
      }
      exit(0);
   }

   safecpy(lcc_path, getenv(DEFAULT_LCC_ENV), MAX_LINELEN);

   // if no target specified on command line, get it from the
   // environment variable
   if (strlen(target_path) == 0) {
      safecpy(target_path, getenv(DEFAULT_TGT_ENV), MAX_LINELEN);
   }

   if (suppress == 0) {
      fprintf(stderr, "Catnip Optimizer %s\n", OPTIMIZER_VERSION); 
   }

   if (strlen(target_path) == 0) {
      if (strlen(lcc_path) > 0) {
         safecpy(target_path, lcc_path, MAX_LINELEN);
         safecat(target_path, PATH_SEP, MAX_LINELEN);
      }
      else {
         safecpy(target_path, DEFAULT_LCCDIR, MAX_LINELEN);
      }
      safecat(target_path, TARGET_NAME, MAX_LINELEN);
   }

   if (prop_vers == 2) {
      safecat(target_path, PATH_SEP, MAX_LINELEN);
      safecat(target_path, P2_SUFFIX, MAX_LINELEN);
   }
   else {
      safecat(target_path, PATH_SEP, MAX_LINELEN);
      safecat(target_path, P1_SUFFIX, MAX_LINELEN);
   }

   if (prop_vers == 1) {
       strcpy(preprocess_command, PREPROCESS_P1);
       strcpy(assemble_command, ASSEMBLE_P1);
   }
   else if (prop_vers == 2) {
       strcpy(preprocess_command, PREPROCESS_P2);
       strcpy(assemble_command, ASSEMBLE_P2);
   }

   if (include_path == NULL) {
      include_path = target_path;
   }
   
   if (output_file == NULL) {
      output_file = DEFAULT_RESULT;
      if (verbose) {
        fprintf(stderr, "output file = %s\n", output_file);
      }
   }

   if (prop_vers == 1) {
      // check if we are compiling a file that should be optimized,
      // or which includes a file that should be optimized
      // (a bit of a hack for the Propeller 1)
      name = strrchr(input_file[0], sep[0]);
      if (name != NULL) {
         name++;
      }
      else {
         name = input_file[0];
      }
      if (name != NULL) {
         if (verbose) {
            printf ("base file name =  %s\n", name); 
         }
         if (strcmp(name, OPTIMIZE_FILENAME_P1) == 0) {
            optimize = 1;
         }
         if (compact) {
            if (strncmp(name, CMM_PREFIX, 3) == 0) {
               optimize = 1;
            }
         }
         else {
            if (strncmp(name, LMM_PREFIX, 3) == 0) {
               optimize = 1;
            }
            if (strncmp(name, NMM_PREFIX, 3) == 0) {
               optimize = 1;
            }
         }
      }

      if (optimize) {
         code = do_optimize(OPTIMIZE_FILENAME_P1);
      }
      else {
         code = do_assemble(input_file[0], output_file, listing, target_path); 
      }
   }
   else {
      code = do_optimize(input_file[0]);
   }

   if (verbose) {
     fprintf(stderr, "\n%s done, result = %d\n", argv[0], code);
   }
   exit(code);
}
