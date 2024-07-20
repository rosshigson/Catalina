/*
 * Catapult - Simple wrapper for the "catapult_awka" awka script.
 *            Decodes options, executes the awka script, which processes 
 *            the input file and generates a file of commands to execute 
 *            to compile it and (unless told not to) executes the file.
 *
 * Version 7.6 - initial version, to coincide with Catalina 7.6
 *
 * Version 7.6.2 - when -lthreads is specified for a secondary (either in a
 *                 secondary pragma or a common pragma) use COGSTART_THREADED 
 *                 to load the threaded kernel when starting the secondary.
 *
 * Version 7.6.3 - Non-catapult pragams must still be copied to the output 
 *                 files, even though they are ignored. Also, only print
 *                 one warning message, even if there are multiple pragmas.
 *
 *               - When a secondary main function ends, unregister the
 *                 kernel before stopping the cog.
 */

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>

#define VERSION            "7.6.3" 

#ifdef WIN32_PATHS         /* define this on the command line for Windows */
#define PATH_SEP           "\\"
#define EXECUTE_OUTPUT     "\"" // note - must terminate quote!
#define OUTPUT_FILE        "_catapult.bat"
#else
#define PATH_SEP           "/"
#define EXECUTE_OUTPUT     "bash -c \"source " // note - must terminate quote!
#define OUTPUT_FILE        "_catapult.cmd"
#endif

#define MAX_FILES          1
#define MAX_LINELEN        4096
#define MAX_PATHLEN        1000
#define MAX_NAMELEN        1000

#define CATAPULT_CMD       "catapult_awka "

#define DEFAULT_DEF_ENV    "CATALINA_DEFINE"

/* global flags */
static int verbose   = 0;
static int execute   = 1;

static int input_count = 0;

static char catapult_cmd[MAX_LINELEN + 1] = CATAPULT_CMD;
static char output_file[MAX_LINELEN + 1] = OUTPUT_FILE;
static char output_cmd[MAX_LINELEN + 1] = EXECUTE_OUTPUT;

void help(char *my_name) {
   fprintf(stderr, "Catalina Catapult %s\n", VERSION); 
   fprintf(stderr, "\nusage: %s [options] [file]\n\n", my_name);
   fprintf(stderr, "options:  -? or -h  print this helpful message (and exit)\n");
   fprintf(stderr, "          -k        do not execute the output file\n");
   fprintf(stderr, "          -o name   output commands to file 'name'\n");
   fprintf(stderr, "                    instead of default ('%s')\n", OUTPUT_FILE);
   fprintf(stderr, "          -v        verbose (output information messages)\n");
   fprintf(stderr, "exit code is non-zero on error\n");
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
 * decode arguments, build file list - return -1 if
 * no more work to do
 */
int decode_arguments (int argc, char *argv[]) {
   int code = 0;
   int i = 0;

   if (argc == 1) {
      if (strlen(argv[0]) == 0) {
         // in case my name was not passed in ...
         help("catapult");
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
                     help("catapult");
                  }
                  else {
                     help(argv[0]);
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

               case 'v':
                  verbose++;
                  if (verbose > 0) {
                     fprintf(stderr, "verbose mode\n");
                  }
                  break;

               case 'k':
                  execute = 0;
                  if (verbose > 0) {
                     fprintf(stderr, "output will not be executed\n");
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
            pathcat(catapult_cmd, argv[i], NULL, MAX_LINELEN);
            safecat(catapult_cmd, " ", MAX_LINELEN);
            input_count++;
            code = 1; // work to do
         }
      }
      i++; // next argument
   }
   return code;

}

int do_catapult(char *outname) {
   int i;
   int result = 0;

   if ((outname != NULL) && (strlen(outname) > 0)) {
      safecat(catapult_cmd, " >", MAX_LINELEN);
      safecat(catapult_cmd, outname, MAX_LINELEN);
   }
   if (verbose) {
      printf("command = %s\n", catapult_cmd);
   }
   if ((result = system(catapult_cmd)) != 0) {
      if (verbose) {
         fprintf(stderr, "result = %d\n", result);
      }
      return result;
   }
   if (execute) {
      safecat(output_cmd, outname, MAX_LINELEN);
      safecat(output_cmd, "\"", MAX_LINELEN); // terminate quote
      if (verbose) {
         printf("command = %s\n", output_cmd);
      }
      if ((result = system(output_cmd)) != 0) {
         if (verbose) {
            fprintf(stderr, "result = %d\n", result);
         }
      }
   }
   return result;   
}

int main (int argc, char *argv[]) {
   int  code = 0;
   char temp_env[MAX_LINELEN + 1] = "";

   code = decode_arguments(argc, argv);
   if (verbose > 0) {
      fprintf(stderr, "Catalina Catapult %s\n", VERSION); 
   }
   if (code < 0) {
      exit(code);
   }

   // get any Catalina symbols defined by the environment variables
   safecpy(temp_env, getenv(DEFAULT_DEF_ENV), MAX_LINELEN);

   if (strlen(temp_env) > 0) {
      printf("Note: %s is set to %s\n", DEFAULT_DEF_ENV, temp_env);
   }

   code = 0;
   if (input_count > 0) {
      code = do_catapult(output_file);
      if (verbose) {
        fprintf(stderr, "\n%s done, result = %d\n", argv[0], code);
      }
   }
   exit(code);
}
