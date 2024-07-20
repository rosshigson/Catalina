/*
 * Bind - binder and library manager for the Catalina compilation system 
 *        for the Parallax Propeller.
 *
 * version 6.0 - initial version - code extracted from catbind.
 *
 * version 6.0.1 - just update version number.
 *
 * version 6.1   - just update version number.
 *
 * version 6.2   - just update version number.
 *
 * version 6.3   - just update version number.
 *
 * version 6.4   - just update version number.
 *
 * version 6.5   - just update version number.
 *
 * version 7.0   - just update version number.
 *
 * Version 7.1   - Tidy up interpretation of -v and -d options -
 *                 they are now disjoint, and one does not imply
 *                 the other. To see all messages, use both.
 *
 * version 7.2   - just update version number.
 *
 * version 7.3   - just update version number.
 *
 * version 7.4   - just update version number.
 *
 * version 7.5   - just update version number.
 *
 * version 7.6   - just update version number.
 *
 */

/*--------------------------------------------------------------------------
    This file is part of Catalina.

    Copyright 2023 Ross Higson

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

#define COMPILE_IN_PLACE   1 /* 0 = compile in target, 1 = compile locally */

#define VERSION            "7.6"

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

#define TARGET_PREFIX      ""
#define TARGET_SUFFIX      ".t"
#define LIB_PREFIX         "lib"
#define LMM_PREFIX         "lmm"
#define EMM_PREFIX         "emm"
#define SMM_PREFIX         "smm"
#define XMM_PREFIX         "xmm"
#define CMM_PREFIX         "cmm"
#define NMM_PREFIX         "nmm"
#define DEFAULT_TARGET     "def"
#define PROGBEG_SUFFIX     "beg"
#define PROGEND_SUFFIX     "end"
#define DEFAULT_RESULT     "a.bin"
#define DEFAULT_INDEX      "catalina.idx"
#define IMPORT_STRING      "' Catalina Import"
#define EXPORT_STRING      "' Catalina Export"
#define SGMT_PREFIX        "Catalina_"
#define SGMT_STRING        "' Catalina "
#define CODE_STRING        "Code"
#define CNST_STRING        "Cnst"
#define INIT_STRING        "Init"
#define DATA_STRING        "Data"
#define ENDS_STRING        "Ends"

#define P1_SUFFIX          "p1"
#define P2_SUFFIX          "p2"

#define PRE_DEFINE_STRING  "#define " /* note - space after */
#define CMD_DEFINE_STRING  "-D "      /* note - space after */

static char lcc_path[MAX_PATHLEN + 1] = "";
static char def_tgt_path[MAX_PATHLEN + 1] = "";
static char def_lib_path[MAX_PATHLEN + 1] = "";
static char target_path[MAX_PATHLEN + 1] = "";
static char library_path[MAX_PATHLEN + 1] = "";

/* global flags */
static int diagnose  = 0;
static int verbose   = 0;
static int import    = 0;
static int export    = 0;
static int cleanup   = 1; 
static int prop_vers = 1; 

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
static char *input_file[MAX_FILES + 3];     /* allow for progbeg, target & progend files */

static int output_count = 0;
static char *output_file[MAX_FILES];

static int lib_count = 0;
static char *input_lib[MAX_LIBS];

static int layout = 0;
static int readonly = 0;
static int readwrite = 0;
static char *target = NULL;
static char *result_file = NULL;
static char *temp_path = NULL;
static char *path_separator = NULL;

static int symbol_count = 0;
static struct symbol_ref symbol[MAX_SYMBOLS];

int print_symbols(int all);

#ifdef __CATALINA__

#include <stdlib.h>
#include <string.h>

int getpid() {
   return 0;
}

char * strdup(const char *str) {
   if (str != NULL) {
      register char *copy = malloc(strlen(str) + 1);
      if (copy != NULL)
         return strcpy(copy, str);
   }
   return NULL;
}

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
   char *tmp = getenv(name);
   if (tmp == NULL) {
      return tmp;
   }
   else {
      return strdup(tmp);
   }
}

#endif

void help(char *my_name) {
   fprintf(stderr, "\nusage: %s [options] [files ...]\n\n", my_name);
   fprintf(stderr, "options:  -? or -h  print this helpful message (and exit)\n");
   fprintf(stderr, "          -d        output diagnostic messages (-d again for more messages)\n");
   fprintf(stderr, "          -e        generate export list from input files\n");
   fprintf(stderr, "          -i        generate import list from input files\n");
   fprintf(stderr, "          -L path   path to libraries (default is '%s')\n", def_lib_path);
   fprintf(stderr, "          -l name   search library named 'libname' when binding\n");
   fprintf(stderr, "          -o name   output results to file 'name'\n");
   fprintf(stderr, "          -p ver    Propeller Hardware Version\n");
   fprintf(stderr, "          -P addr   address for Read-Write segments\n");
   fprintf(stderr, "          -R addr   address for Read-Only segments\n");
   fprintf(stderr, "          -t name   use target 'name'\n");
   fprintf(stderr, "          -T path   path to target files (default is '%s')\n", def_tgt_path);
   fprintf(stderr, "          -u        do not remove preprocessed and intermediate output files\n");
   fprintf(stderr, "          -v        verbose (output information messages)\n");
   fprintf(stderr, "          -x layout use specified memory layout (layout = 0 .. 6, 8 .. 10)\n");
   fprintf(stderr, "          -z ch     specify separator char for path names (default is '%s')\n", DEFAULT_SEP);
   fprintf(stderr, " exit code is number of undefined/redefined symbols (-1 for other errors)\n\n");
#ifdef __CATALINA__
   _waitsec(1); // give output a chance to print before exiting!
#endif
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
      if (strlen(argv[0]) == 0) {
         // in case my name was not passed in ...
         fprintf(stderr, "Catalina Bind %s\n", VERSION); 
         help("bind");
      }
      else {
         fprintf(stderr, "Catalina Bind %s\n", VERSION); 
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
                     help("bcc");
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
                     safecpy(library_path, arg, MAX_PATHLEN);
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
                  break;

               case 'd':
                  diagnose++;   /* increase diagnosis level */
                  if ((verbose + diagnose) == 1) {
                     fprintf(stderr, "Catalina Bind %s\n", VERSION); 
                  }
                  fprintf(stderr, "diagnostic level %d\n", diagnose);
                  break;

               case 'o':
                  arg = get_option_argument(&i, &argc, argv);
                  if (arg == NULL) {
                     fprintf(stderr, "option -o requires an argument\n");
                     code = -1;
                  }
                  else {
                     result_file = strdup(arg);
                     if (diagnose) {
                        fprintf(stderr, "output file = %s\n", result_file);
                     }
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
                  if (diagnose) {
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
                     safecpy(target_path, arg, MAX_PATHLEN);
                     if (diagnose) {
                        fprintf(stderr, "target path = %s\n", target_path);
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
                     fprintf(stderr, "Catalina Bind %s\n", VERSION); 
                  }
                  if (diagnose) {
                     fprintf(stderr, "verbosity level %d\n", verbose);
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

void unquote(const char *name, char *unquoted) {
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
FILE *fopen_unquoted(const char *filename, char *mode) {
   char unquoted_filename[MAX_PATHLEN + 1];

   unquote(filename, unquoted_filename);
   if (diagnose) {
      fprintf(stderr, "fopen filename = %s\n", unquoted_filename);
   }
   return fopen(unquoted_filename, mode);
}

int rename_unquoted(const char *old, const char *new) {
   char unquoted_old[MAX_PATHLEN + 1];
   char unquoted_new[MAX_PATHLEN + 1];

   unquote(old, unquoted_old);
   unquote(new, unquoted_new);
   if (diagnose) {
      fprintf(stderr, "rename %s to %s\n", unquoted_old, unquoted_new);
   }
   return rename(unquoted_old, unquoted_new);
}

int remove_unquoted(const char *filename) {
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

int process_input_files(const char *path) {
   FILE *   input;
   int      i;
   int      line_no;
   char     line[MAX_LINELEN + 1];
   int      imp_len;
   int      exp_len;
   char     fullname[MAX_PATHLEN  + 1];


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
         if (diagnose) {
            fprintf(stderr, "processing input file %s\n", fullname);
         }
         if ((input = fopen_unquoted(fullname, "r")) == NULL) {
            fprintf(stderr, "cannot open input file %s\n", fullname);
            return -1;
         }
         else {
            line_no = 1;
            while (!feof(input)) {
               if (fgets(line, MAX_LINELEN, input) != NULL) {
                  if (diagnose > 2) {
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
   char   libname[MAX_PATHLEN + 1];
   char   filename[MAX_PATHLEN + 1];
   char   indexname[MAX_PATHLEN + 1];
   char   line[MAX_LINELEN + 1];
   char * token;

   for (i = 0; i < lib_count; i++) {
      // try name as local library first
      safecpy(indexname, LIB_PREFIX, MAX_PATHLEN);
      safecat(indexname, path_separator, MAX_PATHLEN);
      safecat(indexname, input_lib[i], MAX_PATHLEN);
      safecat(indexname, path_separator, MAX_PATHLEN);
      safecat(indexname, DEFAULT_INDEX, MAX_PATHLEN);
      if (diagnose) {
         fprintf(stderr, "trying local libary %s\n", indexname);
      }
      if ((index = fopen_unquoted(indexname, "r")) != NULL) {
         if (diagnose) {
            fprintf(stderr, "loading local libary index %s\n", indexname);
         }
         safecpy(libname, LIB_PREFIX, MAX_PATHLEN);
         safecat(libname, path_separator, MAX_PATHLEN);
         safecat(libname, input_lib[i], MAX_PATHLEN);
         safecat(libname, path_separator, MAX_PATHLEN);
      }
      else if (strlen(library_path) > 0) {
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
            if (diagnose) {
               fprintf(stderr, "loading system library index %s\n", indexname);
            }
            safecpy(libname, library_path, MAX_PATHLEN);
            safecat(libname, path_separator, MAX_PATHLEN);
            safecat(libname, input_lib[i], MAX_PATHLEN);
            safecat(libname, path_separator, MAX_PATHLEN);
         }
         else {
            fprintf(stderr, "cannot open library index %s\n", indexname);
            return -1;
         }
      }
      if (index != NULL) {
         while (!feof(index)) {
            if (fgets(line, MAX_LINELEN, index) != NULL) {
               if (diagnose > 2) {
                  fprintf(stderr, "read line: %s\n", line);
               }
               if (symbol_count < MAX_SYMBOLS) {
                  if (strlen(line) > 0) {
                     symbol[symbol_count].lib = strdup(input_lib[i]);
                     symbol[symbol_count].name = strdup(strtok(line, " ,:\n\r\t"));
                     safecpy(filename, libname, MAX_PATHLEN);
                     safecat(filename, strtok(NULL, " ,:\n\r\t"), MAX_PATHLEN);
                     symbol[symbol_count].file = strdup(filename);
                     if (diagnose > 2) {
                        fprintf(stderr, "name %s file %s\n", symbol[symbol_count].name, symbol[symbol_count].file);
                     }
                     token = strtok(NULL, " ,:\n\r\t");
                     sscanf(token, "%d", &symbol[symbol_count].line);
                     token = strtok(NULL, " ,:\n\r\t");
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

int find_input_file(const char *name) {
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
      if (diagnose > 2) {
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
   char  fullname[MAX_PATHLEN + 1];

   if (diagnose) {
      fprintf(stderr, "determining files to output\n");
   }
   // all non-null input files are output files
   for (i = 0; i < input_count; i++) {
      if (input_file[i] != NULL) {
         output_file[output_count] = strdup(input_file[i]);
         if (diagnose) {
            fprintf(stderr, "including file %s\n", output_file[output_count]);
         }
         output_count++;
      }
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
   char   fullname[MAX_PATHLEN + 1];

   if (path == NULL) {
      safecpy(fullname, result_file, MAX_PATHLEN);
   }
   else {
      safecpy(fullname, path, MAX_PATHLEN);
      safecat(fullname, path_separator, MAX_PATHLEN);
      safecat(fullname, result_file, MAX_PATHLEN);
   }

   if (diagnose) {
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

void generate_segment(FILE *output, FILE *input, char *segname) {
   char     line[MAX_LINELEN + 1];

   rewind (input);
   if (diagnose) {
      fprintf(stderr, "generating %s segment\n", segname);
   }
   fprintf(output, "\n%s%s\n\n", SGMT_STRING, segname);
   fprintf(output, "DAT ' %s segment\n\n alignl ' align long\n\n", segname);
   fprintf(output, "%s%s\n", SGMT_PREFIX, segname);
   while (!feof(input)) {
      if (fgets(line, MAX_LINELEN, input) != NULL) {
         if (diagnose > 2) {
            fprintf(stderr, "read segment line: %s\n", line);
         }
         fprintf(output, "%s", line);
      }
   }
}

void generate_output(const char *fullname) {
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

   if (diagnose) {
      fprintf(stderr, "bind output file is %s\n", fullname);
   }
   if ((result = fopen_unquoted(fullname, "w")) == NULL) {
      fprintf(stderr, "cannot open output file %s\n", fullname);
   }
   else {
      sprintf(code_name, "%s%sbcc%d%d.tmp", temp_path, DEFAULT_SEP, getpid(), n++);
      sprintf(cnst_name, "%s%sbcc%d%d.tmp", temp_path, DEFAULT_SEP, getpid(), n++);
      sprintf(init_name, "%s%sbcc%d%d.tmp", temp_path, DEFAULT_SEP, getpid(), n++);
      sprintf(data_name, "%s%sbcc%d%d.tmp", temp_path, DEFAULT_SEP, getpid(), n++);
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
                     if (diagnose > 2) {
                        fprintf(stderr, "read input line: %s\n", line);
                     }
                     if (strncmp(line, CODE_MARKER, code_len) == 0) {
                        if (diagnose > 1) {
                           fprintf(stderr, "Code Segment\n");
                        }
                        current = code_file;
                     }
                     else if (strncmp(line, CNST_MARKER, cnst_len) == 0) {
                        if (diagnose > 1) {
                           fprintf(stderr, "Cnst Segment\n");
                        }
                        current = cnst_file;
                     }
                     else if (strncmp(line, INIT_MARKER, init_len) == 0) {
                        if (diagnose > 1) {
                           fprintf(stderr, "Init Segment\n");
                        }
                        current = init_file;
                     }
                     else if (strncmp(line, DATA_MARKER, data_len) == 0) {
                        if (diagnose > 1) {
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
               fprintf(result, "\nDAT\n\n alignl ' long align\nCatalina_RO_Base\n");
               generate_segment(result, code_file, CODE_STRING);
               generate_segment(result, cnst_file, CNST_STRING);
               fprintf(result, "\nDAT\n\n alignl ' long align\nCatalina_RO_Ends\n");
               if (readwrite > 0) {
                  fprintf(result, "\nDAT\n\nCatalina_RW_Pad\n");
                  fprintf(result, "        byte $00[%d - @Catalina_RW_Pad]\n", readwrite);
               }
               fprintf(result, "\nDAT\n\n alignl ' long align\nCatalina_RW_Base\n");
               generate_segment(result, init_file, INIT_STRING);
               generate_segment(result, data_file, DATA_STRING);
               fprintf(result, "\nDAT\n\n alignl ' long align\nCatalina_RW_Ends\n");
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
               fprintf(result, "\nDAT\n\n alignl ' long align\nCatalina_RW_Ends\n");
               if (readonly > 0) {
                  fprintf(result, "        byte $00[%d - @Catalina_RW_Ends]\n", readonly);
               }
               fprintf(result, "\nDAT\n\nCatalina_RO_Base\n");
               generate_segment(result, code_file, CODE_STRING);
               fprintf(result, "\nDAT\n\n alignl ' long align\nCatalina_RO_Ends\n");
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
               fprintf(result, "\nDAT\n\n alignl ' long align\nCatalina_RW_Ends\n");
               fprintf(result, "        byte $00[XMM_RO_BASE_ADDRESS + $200 - $10 - @Catalina_RW_Ends]\n");
               if (readonly > 0) {
                  fprintf(result, "\nDAT\n\nCatalina_RO_Pad\n");
                  fprintf(result, "        byte $00[%d - @Catalina_RO_Pad]\n", readonly);
               }
               fprintf(result, "\nDAT\n\nCatalina_RO_Base\n");
               generate_segment(result, code_file, CODE_STRING);
               generate_segment(result, cnst_file, CNST_STRING);
               fprintf(result, "\nDAT\n\n alignl ' long align\nCatalina_RO_Ends\n");
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
               fprintf(result, "\nDAT\n\n alignl ' long align\nCatalina_RW_Ends\n");
               fprintf(result, "        byte $00[XMM_RO_BASE_ADDRESS + $200 - $10 - @Catalina_RW_Ends]\n");
               if (readonly > 0) {
                  fprintf(result, "\nDAT\n\nCatalina_RO_Pad\n");
                  fprintf(result, "        byte $00[%d - @Catalina_RO_Pad]\n", readonly);
               }
               fprintf(result, "\nDAT\n\nCatalina_RO_Base\n");
               generate_segment(result, code_file, CODE_STRING);
               fprintf(result, "\nDAT\n\n alignl ' long align\nCatalina_RO_Ends\n");
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
               fprintf(result, "\nDAT\n\n alignl ' long align\nCatalina_RO_Ends\n");
               if (readwrite > 0) {
                  fprintf(result, "        byte $00[%d - @Catalina_RO_Ends]\n", readwrite);
               }
               fprintf(result, "\nDAT\n\nCatalina_RW_Base\n");
               generate_segment(result, init_file, INIT_STRING);
               generate_segment(result, data_file, DATA_STRING);
               fprintf(result, "\nDAT\n\n alignl ' long align\nCatalina_RW_Ends\n");
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
               fprintf(result, "\nDAT\n\n alignl ' long align\nCatalina_RO_Ends\n");
               if (readwrite > 0) {
                  fprintf(result, "        byte $00[%d - @Catalina_RO_Ends]\n", readwrite);
               }
               fprintf(result, "\nDAT\n\nCatalina_RW_Base\n");
               generate_segment(result, init_file, INIT_STRING);
               generate_segment(result, data_file, DATA_STRING);
               fprintf(result, "\nDAT\n\n alignl ' long align\nCatalina_RW_Ends\n");
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
               fprintf(result, "\nDAT\n\n alignl ' long align\nCatalina_RO_Ends\n");
               if (readwrite > 0) {
                  fprintf(result, "        byte $00[%d - @Catalina_RO_Ends]\n", readwrite);
               }
               fprintf(result, "\nDAT\n\nCatalina_RW_Base\n");
               generate_segment(result, init_file, INIT_STRING);
               generate_segment(result, data_file, DATA_STRING);
               fprintf(result, "\nDAT\n\n alignl ' long align\nCatalina_RW_Ends\n");
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
               fprintf(result, "\nDAT\n\n alignl ' long align\nCatalina_RO_Ends\n");
               if (readwrite > 0) {
                  fprintf(result, "        byte $00[%d - @Catalina_RO_Ends]\n", readwrite);
               }
               fprintf(result, "\nDAT\n\nCatalina_RW_Base\n");
               generate_segment(result, init_file, INIT_STRING);
               generate_segment(result, data_file, DATA_STRING);
               fprintf(result, "\nDAT\n\n alignl ' long align\nCatalina_RW_Ends\n");
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
      if (cleanup) {
         remove(code_name);
         remove(cnst_name);
         remove(init_name);
         remove(data_name);
      }
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

   if (diagnose) {
      fprintf(stderr, "building export/export list\n");
      print_files();
      print_libs();
      if (diagnose > 1) {
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
       return bin; // p2 assembler always generates .bin files
   }
   else {
       return ((format == 0) ? binary : eeprom);
   }
}

int do_bind() {
   int   code;
   int   i;

   if (diagnose) {
      fprintf(stderr, "binding\n");
   }

   if (process_input_files(NULL) == 0) {
      if (load_indexes() == 0) {
         if (diagnose) {
            print_files();
            print_libs();
            if (diagnose > 1) {
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
         if (diagnose) {
            print_files();
            print_libs();
         }

         code = print_symbols(0);
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
            if (verbose) {
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
            if (verbose) {
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
            if (verbose) {
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
            if (verbose) {
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

void main (int argc, char *argv[]) {
   int   code;
   int   len;
   int   i;
   char  fullname[MAX_PATHLEN + 1];

#if defined(__CATALINA_P2) && defined(__CATALINA_WRITE_BACK)
  CacheWriteThrough(0); // disable write through, which enables write back
#endif

   code = 0;

   safecpy(lcc_path, catalina_getenv(DEFAULT_LCC_ENV), MAX_PATHLEN);

   if (strlen(lcc_path) > 0) {
      safecpy(def_tgt_path, lcc_path, MAX_PATHLEN);
      safecat(def_tgt_path, DEFAULT_SEP, MAX_PATHLEN);
      safecpy(def_lib_path, lcc_path, MAX_PATHLEN);
      safecat(def_lib_path, DEFAULT_SEP, MAX_PATHLEN);
   }
   else {
      safecpy(def_tgt_path, DEFAULT_LCCDIR, MAX_PATHLEN);
      safecpy(def_lib_path, DEFAULT_LCCDIR, MAX_PATHLEN);
   }
   safecat(def_tgt_path, TGT_SUFFIX, MAX_PATHLEN);
   safecat(def_lib_path, LIB_SUFFIX, MAX_PATHLEN);
   
   safecpy(library_path, catalina_getenv(DEFAULT_LIB_ENV), MAX_PATHLEN);
   safecpy(target_path, catalina_getenv(DEFAULT_TGT_ENV), MAX_PATHLEN);
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
   if (strlen(library_path) == 0) {
      safecpy(library_path, def_lib_path, MAX_PATHLEN);
   }
   if (strlen(target_path) == 0) {
      safecpy(target_path, def_tgt_path, MAX_PATHLEN);
   }
   safecat(target_path, path_separator, MAX_PATHLEN);
   if (prop_vers == 1) {
      // propeller 1
      safecat(target_path, P1_SUFFIX, MAX_PATHLEN);
   }
   else {
      // propeller 2
      safecat(target_path, P2_SUFFIX, MAX_PATHLEN);
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
         fprintf(stderr, "first file = %s\n", input_file[0]);
         fprintf(stderr, "second file = %s\n", input_file[1]);
      }
      code = do_bind();
      // use the result filename for the output of the bind
      generate_output(result_file);
   }
   if (diagnose) {
      fprintf(stderr, "\n%s done, result = %d\n", argv[0], code);
   }

#if defined(__CATALINA_P2)
   if (code != 0) {
      setenv("_EXIT_CODE", "1", 1);
   }
   else {
      setenv("_EXIT_CODE", "0", 1);
   }
   _waitms(1000);
#endif
#if defined(__CATALINA_P2) && defined(__CATALINA_WRITE_BACK)
   CacheFlush(); // flush cache to SD
#endif

   exit(code);
}
