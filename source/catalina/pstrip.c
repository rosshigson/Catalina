/*
 * Strip - remove unnecessary blank lines and comments from PASM source
 *
 * version 6.0 - initial release (to coincide with catalina 6.0
 *
 * version 8.8.1 - remove local strdup (now in C libary).
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
#include <stdint.h>
#include <string.h>
#include <math.h>

#define VERSION            "8.8.1"

#define MAX_LINELEN        4096
#define MAX_PATHLEN        1024
#define MAX_FILES          128

#define TEMP_NAME          "____temp.tmp"

#ifdef WIN32_PATHS         /* define this on the command line for Windows */
#define DEFAULT_SEP        "\\"
#else
#define DEFAULT_SEP        "/"
#endif

/* global variables used when processing options - e.g. to warn about incompatible combinations */

static int untidy    = 0;
static int verbose   = 0;
static int diagnose  = 0;
static int bannered  = 0;

static int input_count = 0;                  
static char * input_file[MAX_FILES];

void banner(void) {
   if (bannered == 0) {
      fprintf(stderr, "Catalina Strip Utility %s\n", VERSION); 
      bannered = 1;
   }
}

void help(char *my_name) {
   banner();
   fprintf(stderr, "\nusage: %s [option ] file ...\n\n", my_name);
   fprintf(stderr, "options:  -? or -h   print this help (and exit)\n");
   fprintf(stderr, "          -d         output diagnostic messages\n");
   fprintf(stderr, "          -v         verbose (output information messages)\n");
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
   int    code = 0;
   int    i = 0;
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

               case 'd':
                  diagnose++;   /* increase diagnosis level */
                  verbose = 1;   /* diagnose implies verbose */
                  banner();
                  fprintf(stderr, "diagnostic level %d\n", diagnose);
                  break;

/*                  
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
*/
               case 'u':
                  untidy = 1;
                  if (verbose) {
                     banner();
                     fprintf(stderr, "untidy mode\n");
                  }
                  break;

               case 'v':
                  verbose++;
                  if (verbose == 1) {
                     banner();
                     fprintf(stderr, "verbose mode\n");
                  }
                  else {
                     banner();
                     fprintf(stderr, "very verbose mode\n");
                  }
                  break;

               default:
                  // unrecognized switch
                  if (verbose) {
                     banner();
                     fprintf(stderr, "unrecognized switch %s\n", argv[i]);
                  }
                  break;

            }
         }
         else {
            // assume its a filename
            if (input_count < MAX_FILES) {
               input_file[input_count++] = strdup(argv[i]);
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
      banner();
      fprintf(stderr, "executable name = %s\n", argv[0]);
   }
   return code;
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

// case insensitive strcmp
static int strcmp_i(const char *str1, const char *str2) {
   while ((*str1) && (*str2) 
   &&     (toupper(*str1) == toupper(*str2))) {
      str1++;
      str2++;
   }
   return (toupper(*str1) - toupper(*str2));
}

int blank(char *line) {
   while (*line == ' ') {
      line++;
   }
   return ((*line == '\r') || (*line == '\n') || (*line == 0));
}

char *first_non_blank(char *line) {
   while (*line == ' ') {
      line++;
   }
   return line;
}

void add_line(FILE *file, char *line) {
   if (fputs(line, file) == EOF) {
      fprintf(stderr, "cannot write to temporary file");
   } 
}

void main(int argc, char *argv[]) {
   int  result = 0;
   char line[MAX_LINELEN + 1];
   FILE *input;
   FILE *output;
   int  i;
   char *quote;
   char *first;
   char *fresult;

#if defined(__CATALINA_P2) && defined(__CATALINA_WRITE_BACK)
   CacheWriteThrough(0); // disable write through, which enables write back
#endif

   // decode the arguments 
   result = decode_arguments(argc, argv);
   if (diagnose) {
      fprintf(stderr, "result of decoding arguments = %d\n", result);
   }
   if (result < 0) {
#if defined(__CATALINA_P2)
      setenv("_EXIT_CODE", "1", 1);
      _waitms(1000);
#endif
#if defined(__CATALINA_P2) && defined(__CATALINA_WRITE_BACK)
      CacheFlush(); // flush cache to SD
#endif
      exit(result);
   }

   // print banner now if verbose and not already printed
   if (verbose) {
      banner();
   }

   if (input_count == 0) {
      fprintf(stderr, "no input files specified\n");
#if defined(__CATALINA_P2)
      setenv("_EXIT_CODE", "1", 1);
      _waitms(1000);
#endif
#if defined(__CATALINA_P2) && defined(__CATALINA_WRITE_BACK)
      CacheFlush(); // flush cache to SD
#endif
      exit(-1);
   }
   if ((output = fopen_unquoted(TEMP_NAME, "w")) == NULL) {
      fprintf(stderr, "cannot open temporary file\n");
#if defined(__CATALINA_P2)
      setenv("_EXIT_CODE", "1", 1);
      _waitms(1000);
#endif
#if defined(__CATALINA_P2) && defined(__CATALINA_WRITE_BACK)
      CacheFlush(); // flush cache to SD
#endif
      exit(-1);
   }
   for (i = 0; i < input_count; i++) {
      if ((input = fopen_unquoted(input_file[i], "r")) == NULL) {
         fprintf(stderr, "cannot open input file %s\n", input_file[i]);
      }
      else {
         if (verbose) {
             fprintf(stderr, "processing input file %s\n", input_file[i]);
         }
         fseek(input, 0L, SEEK_SET);
         while ((fgets(line, MAX_LINELEN + 1, input)) != NULL) {
            if (!blank(line)) {
               if (line[0]=='{') {
                  do {
                     fresult = fgets(line, MAX_LINELEN + 1, input);
                  } while ((fresult != NULL) && (line[0] != '}'));
               }
               else if (line[0] == '\'') {
                  if ((strncmp(line, "' Catalina ", 10) == 0)
                  ||  (strncmp(line, "' ends", 6) == 0)) {
                     add_line(output, line);
                  }
               }
               else {
                  first = first_non_blank(line);
                  if (*first != '\'') {
                     if (((quote = strchr(line, '\'')) != NULL) 
                     &&  (quote > line + 1)
                     &&  (*(quote - 1) == ' ')) {
                         *(quote-1) = '\n'; // terminate line ...
                         *(quote) = '\0'; // ... at quote-1
                     }
                     add_line(output, line);
                  }
               }
            }
         }
         fclose(input);
      }
   }
   fclose(output);
   if (untidy) {
      if (verbose) {
          fprintf(stderr, "output is in file %s\n", TEMP_NAME);
      }
   }
   else {
      if (verbose) {
          fprintf(stderr, "output is in file %s\n", input_file[0]);
      }
      remove_unquoted(input_file[0]);
      rename_unquoted(TEMP_NAME, input_file[0]);
   }
#if defined(__CATALINA_P2)
   setenv("_EXIT_CODE", "0", 1);
   _waitms(1000);
#endif
#if defined(__CATALINA_P2) && defined(__CATALINA_WRITE_BACK)
   CacheFlush(); // flush cache to SD
#endif
   exit(0);
}
