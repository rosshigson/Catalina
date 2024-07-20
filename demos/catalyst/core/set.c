/*
 * simple "set" command implemented in C for Catalyst. 
 *
 * Compile with a command like:
 *    catalina -p2 -lcix set.c
 *
 * Version 6.4 - first C version
 *
 */

#if !defined(__CATALINA_P2)
#error THIS PROGRAM MUST BE COMPILED FOR A PROPELLER 2
#endif

#if defined(__CATALINA_PC)||defined(__CATALINA_TTY)||defined(__CATALINA_TTY256)||defined(__CATALINA_SIMPLE)
#define SERIAL_HMI
#endif

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <prop.h>
#include <hmi.h>
#include <ctype.h>

#include "catalyst.h"

static int help = 0;
static int diagnose = 0;
static int name_count = 0;
static int set = 0;
static int unset = 0;
static int set_unset = 0;
static char *names[ARGV_MAX];
static char *values[ARGV_MAX];

static int aborted = 0;

void t_eol() {
   t_string(1, END_OF_LINE);
}

void t_ch(char ch) {
   t_char(1, ch);
}

void t_str(char *str) {
   t_string(1, str);
}

void t_strln(char *str) {
   t_string(1, str);
   t_eol();
}

void do_help(char *my_name) {
   t_eol();
   t_printf("usage %s [options] [ NAME [ = [ VALUE ] ] ... ]\n", my_name);
   t_strln("  to display all variables, do not specify a name");
   t_strln("  to display specific variables, specify names");
   t_strln("  to unset specific variable, specify -u or name=");
   t_eol();
   t_strln("  values that contains spaces must be quoted");
   t_eol();
   t_strln("options:");
   t_strln("  -? or -h  print this message");
   t_strln("  -d        print diagnostics ");
   t_strln("  -u        unset the specified variables ");
}

/*
 * decode_option - decode one option character
 */
void decode_option(char ch) {
   switch (ch) {
      case 'h':
         /* fall through to ... */
      case '?':
         help = 1;
         break;
      case 'd':
         diagnose = 1;
         break;
      case 'u':
         if ((set == 1) && (set_unset == 0)) {
            t_str("cannot set and unset variables in the same command\n");
            set_unset = 1;
         }
         else {
            unset = 1;
         }
         break;
      default:
         t_str("unknown option '");
         t_ch(ch);
         t_str("'");
         help = 1;
         break;
   }
}

/*
 * decode arguments and return 1 if there is no further processing to do
 */
int decode_arguments (int argc, char *argv[]) {
   int    result = 0;
   int    i = 0;
   int    j;

   while ((result >= 0) && (argc--)) {
      if (i > 0) {
         if (argv[i][0] == '-') {
            // it's a command line switch
            int j = 1;
            while (argv[i][j]) {
               decode_option(argv[i][j++]);
            }
         }
         else {
            char ch;
            int len;
            // convert name argument to upper case
            names[name_count] = argv[i];
            values[name_count] = NULL;
            if (!isalpha(names[name_count][0]) 
            &&  (names[name_count][0] != '_')) {
               t_str("variable names must start with a letter or '_'\n");
               i++;
               continue;
            }
            else {
               j = 0;
               while (((ch = names[name_count][j]) != 0) && (ch != '=')) {
                  names[name_count][j] = toupper(ch);
                  j++;
               }
               if (ch == '=') {
                  set = 1;
                  if ((unset == 1) && (set_unset == 0)) {
                     t_str("cannot set and unset variables in the same command\n");
                     set_unset = 1;
                  }
                  names[name_count][j] = '\0';
                  values[name_count] = &names[name_count][j+1];
                  len = strlen(values[name_count]);
                  if ((len > 0)
                  &&  (values[name_count][0] == '"')
                  &&  (values[name_count][len - 1]) == '"') {
                     // remove quotes
                     values[name_count][len - 1] = '\0';
                     values[name_count]++;
                  }
               }
               else {
                  // peek ahead to see if next argument is "=" and if there
                  // is an argument aftet that, which is the value.
                  if ((argc > 1) && (strcmp(argv[i+1], "=") == 0)) {
                     set = 1;
                     if ((unset == 1) && (set_unset == 0)) {
                        t_str("cannot set and unset variables in the same command\n");
                        set_unset = 1;
                     }
                     names[name_count][j] = '\0';
                     // the argument after the "=" is the value
                     values[name_count] = argv[i+2];
                     len = strlen(values[name_count]);
                     if ((len > 0)
                     &&  (values[name_count][0] == '"')
                     &&  (values[name_count][len - 1]) == '"') {
                        // remove quotes
                        values[name_count][len - 1] = '\0';
                        values[name_count]++;
                     }
                     // consume the next two arguments
                     i = i + 2;
                     argc -= 2;
                  }
               }
            }
            name_count++;
         }
      }
      i++; // next argument
   }
   if (help) {
      if (strlen(argv[0]) == 0) {
         // in case my name was not passed in ...
         do_help("set");
      }
      else {
         do_help(argv[0]);
      }
      result = 1;
   }
   return result;
}


int press_key_to_continue() {
   int k;
/*
 * Prompt for a key to continue - set aborted to 1 
 * and return TRUE if ESC is the key
 */
   t_str("Continue? (ESC exits) ...");
   k = k_wait();
   t_eol();
   aborted = (k == 0x1b);
   return aborted;
}

void main(int argc, char *argv[]) {
   int i;
   int n = 0;
   FILE *f;
   int update = 0;
   char environ[MAX_ENV_LEN + 1];
   unsigned long elen;

   if ((decode_arguments(argc, argv) == 0) && (set_unset == 0)) {
      environ[0] = 0;
      // read environment from file to environ
      if ((f = fopen(ENV_FILE, "r")) != NULL) {
         if (diagnose) {
            t_printf("Reading environment file\n");
         }
         elen = fread(environ, 1, MAX_ENV_LEN, f);
         environ[elen] = 0;
         if (diagnose) {
            t_printf("Read %d characters\n", elen);
         }
         fclose(f);
      }
      else {
         if (diagnose) {
            t_printf("Creating environment file\n");
         }
         if ((f = fopen(ENV_FILE, "w")) == NULL) {
            if (diagnose) {
               t_printf("Cannot create environment file\n");
            }
         }
         else {
            fclose(f);
         }
      }

      if (name_count == 0) {
         // print the whole environment file
         t_printf("%s\n", environ);
      }
      else {
         for (i = 0; i < name_count; i++) {
            char *val;
            if ((values[i] == NULL) && (!unset)) {
               if ((val = getenv(names[i])) != NULL) {
                  t_printf("%s=%s\n", names[i], val);
               }
            }
            else {
               // set the new name
               if (unset) {
                  update = 1;
                  if (diagnose) {
                     t_printf("Unsetting %s\n", names[i]);
                  }
               }
               else {
                  if (diagnose) {
                     t_printf("Setting %s\n", names[i]);
                  }
               }
               unsetenv(names[i]);
               if (diagnose) {
                  t_printf("Unset %s\n", names[i]);
               }
               if ((!unset) && (values[i] != NULL)) {
                  update = 1;
                  if (diagnose) {
                     t_printf("Setting %s to %s\n", names[i], values[i]);
                  }
                  if (strlen(values[i]) > 0) {
                     if (setenv(names[i], values[i], 1) < 0) {
                        t_printf("Cannot set %s - Insufficient space\n");
                     }
                  }
               }
            }
         }
      }
   }
   if (f != NULL) {
      fclose(f);
   }

   if (diagnose) {
      t_strln("set done");
   }

#ifdef SERIAL_HMI
   // allow some time for characters to be sent out before terminating
   msleep(250);
#else
   if (!aborted) {
      // wait for the user to press a key before terminating
      press_key_to_continue();
   }
#endif    
}
