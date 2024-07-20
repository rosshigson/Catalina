#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <hmi.h>

/* 
 * If no file is specified on the command line, this program prompts
 * for one and then passes it to the PINT program
 */

#define MAX_FILENAME_LEN 80

int wait_for_key() {

#ifndef __CATALINA_NO_HMI__   
   printf("\nPress any key to continue ...\n");
   k_wait();
   return 0; 
#endif

}


int redirected_main (int argc, char *argv[]);


void main (int argc, char *argv[]) {
   int i;
   char c;
   char filename [MAX_FILENAME_LEN + 1];
   FILE * source_file;
   FILE * target_file;

   if (argc < 2) {
      for (;;) {
         printf("Enter filename to run: ");
         i = 0;
         for (;;) {
            c = getchar();
            if ((c == '\r') || (c == '\n')) {
               printf("\n");
               break;
            }
            if (i < MAX_FILENAME_LEN) {
               filename[i] = c;
            }
            i++;
         }
         filename[i] = '\0';
         if (strlen(filename) == 0) {
            break;
         }
         source_file = fopen (filename, "r");
         if (source_file != NULL) {
            break;
         }
         printf("Cannot open file %s - try again\n", filename);
      }
      if (source_file != NULL) {
         fclose (source_file);
      }
      else {
         exit(0);
      }
   }
   if (argc < 2) {
      argv[1] = filename;
      argc = 2;
   }

   redirected_main(argc, argv);

   wait_for_key();

}

#define main(a,b) redirected_main(a,b)

#include "pint.c"
