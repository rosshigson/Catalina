/*
 * Parallelize - Simple wrapper for the "parallelize" awka script.
 *               Decodes options and executes the compiled awka script.
 *
 * Version 4.6 - initial version, to coincide with Catalina 4.6
 *
 * Version 4.7 - Just update version number.
 *
 * Version 4.8 - Just update version number.
 *
 * Version 4.9 - Just update version number.
 *
 * Version 5.0 - Just update version number.
 *
 * Version 5.1 - Just update version number.
 *
 * Version 6.2 - Just update version number.
 *
 * Version 6.3 - Just update version number.
 *
 * Version 6.4 - Just update version number.
 *
 * Version 6.5 - Just update version number.
 *
 * Version 7.0 - Just update version number.
 *
 * Version 7.6.3 - When terminating a factory cog, also unregister it.
 *
 * Version 7.9 - Just update version number.
 *
 * version 8.1 - just update version number.
 *
 * version 8.2 - just update version number.
 *
 * version 8.3 - just update version number.
 *
 * version 8.4 - just update version number.
 *
 * version 8.5  - just update version number.
 *
 * version 8.6  - just update version number.
 *
 * version 8.7  - just update version number.
 *
 * version 8.8  - just update version number.
 *
 */

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>

#define DO_EXECUTE         1 // 0 for debugging (output only, no execute)

#define VERSION            "8.8" 

#ifdef WIN32_PATHS         /* define this on the command line for Windows */
#define PATH_SEP           "\\"
#else
#define PATH_SEP           "/"
#endif

#define MAX_FILES          1
#define MAX_LINELEN        4096
#define MAX_PATHLEN        1000
#define MAX_NAMELEN        1000

#define PARALLELIZE_CMD    "parallelize_awka "

#define PARALLELIZE_SUFFIX "_p"

/* global flags */
static int prop_vers = 1;
static int quiet     = 0;
static int verbose   = 0;
static int warning   = 0;
static int suppress  = 0;

static int input_count = 0;

static char parallel_cmd[MAX_LINELEN + 1] = "";
static char output_file[MAX_LINELEN + 1] = "";

void help(char *my_name) {
   fprintf(stderr, "Catalina Parallelizer %s\n", VERSION); 
   fprintf(stderr, "\nusage: %s [options] [file ...]\n\n", my_name);
   fprintf(stderr, "options:  -? or -h  print this helpful message (and exit)\n");
   fprintf(stderr, "          -k        suppress banner\n");
   fprintf(stderr, "          -o name   output parallelized results to file 'name'\n");
   fprintf(stderr, "          -p vers   Propeller version (1 or 2)\n");
   fprintf(stderr, "          -q        quiet output\n");
   fprintf(stderr, "          -u        do not remove intermediate output files\n");
   fprintf(stderr, "          -v        verbose (output information messages)\n");
   fprintf(stderr, "          -v -v     very verbose (more information messages)\n");
   fprintf(stderr, "          -w        enable warnings\n");
   fprintf(stderr, " exit code is non-zero on error)\n");
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
 * decode arguments, building file and library list - return -1 if
 * there is no further processing to do
 */
int decode_arguments (int argc, char *argv[]) {
   int    code = 0;
   int    i = 0;

   if (argc == 1) {
      if (strlen(argv[0]) == 0) {
         // in case my name was not passed in ...
         help("parallelizer");
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
                     help("parallelizer");
                  }
                  else {
                     help(argv[0]);
                  }
                  break;
               case 'k':
                  suppress = 1;
                  if (verbose) {
                     fprintf(stderr, "suppress\n");
                  }
                  break;
               case 'o':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        output_file[0] = '\0';
                        pathcat(output_file, argv[++i], NULL, MAX_LINELEN);
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
                     output_file[0] = '\0';
                     pathcat(output_file, &argv[i][2], NULL, MAX_LINELEN);
                  }
                  if (verbose) {
                    fprintf(stderr, "output file = %s\n", output_file);
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

               case 'q':
                  quiet = 1;
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
               case 'w':
                  warning = 1;
                  if (verbose) {
                     fprintf(stderr, "warning\n");
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
            pathcat(parallel_cmd, argv[i], NULL, MAX_LINELEN);
            safecat(parallel_cmd, " ", MAX_LINELEN);
            if (input_count == 0) {
                pathcat(output_file, argv[i], NULL, MAX_LINELEN);
                adjust_filename(output_file, MAX_LINELEN);
            }
            input_count++;
            code = 1; // work to do
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
   
int do_parallelize(char *outname) {
   int i;
   int result = 0;

   safecat(parallel_cmd, " >", MAX_LINELEN);
   if (outname == NULL) {
   }
   else {
      safecat(parallel_cmd, outname, MAX_LINELEN);
   }
   if (verbose) {
      printf("command = %s\n", parallel_cmd);
   }
#if DO_EXECUTE
   if ((result = system(parallel_cmd)) != 0) {
      if (verbose) {
         fprintf(stderr, "result = %d\n", result);
      }
   }
#endif   
   return result;   
}

int main (int argc, char *argv[]) {
   int  code = 0;

   safecpy(parallel_cmd, PARALLELIZE_CMD, MAX_LINELEN);

   if (decode_arguments(argc, argv) <= 0) {
      if (verbose) {
        fprintf(stderr, "%s exiting\n", argv[0]);
      }
      exit(0);
   }

   if (suppress == 0) {
      fprintf(stderr, "Catalina Parallelizer %s\n", VERSION); 
   }

   if (input_count == 0) {
        fprintf(stderr, "Error: no input file specified\n");
   }
   else {
      code = do_parallelize(output_file);
   }

   if (verbose) {
     fprintf(stderr, "\n%s done, result = %d\n", argv[0], code);
   }
   exit(code);
}
