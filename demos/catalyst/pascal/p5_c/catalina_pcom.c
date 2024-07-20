#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <hmi.h>

/* 
 * If no file is specified on the command line, this program prompts
 * for one and then passes it to the PCOM program
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
   char in_filename [MAX_FILENAME_LEN + 1];
   char out_filename [MAX_FILENAME_LEN + 1];
   FILE * source_file;
   FILE * target_file;

   if (argc < 2) {
      for (;;) {
         printf("Enter filename to compile: ");
         i = 0;
         for (;;) {
            c = getchar();
            if ((c == '\r') || (c == '\n')) {
               printf("\n");
               break;
            }
            if (i < MAX_FILENAME_LEN) {
               in_filename[i] = c;
            }
            i++;
         }
         in_filename[i] = '\0';
         if (strlen(in_filename) == 0) {
            break;
         }
         source_file = fopen (in_filename, "r");
         if (source_file != NULL) {
            break;
         }
         printf("Cannot open file %s - try again\n", in_filename);
      }
      if (strlen(in_filename) == 0) {
         exit(0);
      }
      fclose (source_file);
   }
   if (argc < 3) {
      printf("Enter filename for output: ");
      i = 0;
      for (;;) {
         c = getchar();
         if ((c == '\r') || (c == '\n')) {
            printf("\n");
            break;
         }
         if (i < MAX_FILENAME_LEN) {
            out_filename[i] = c;
         }
         i++;
      }
      out_filename[i] = '\0';
      if (strlen(out_filename) == 0) {
         exit(0);
      }
   }
   if (argc < 2) {
      freopen (in_filename, "r", stdin);
   }
   else {
      freopen (argv[1], "r", stdin);
   }
   if (argc < 3) {
      argv[1] = out_filename;
      argc = 2;
   }
   else {
      argv[1] = argv[2];
      argc = 2;
   }

   redirected_main(argc, argv);

   wait_for_key(); // note - cannot use stdin any more!!!
}

#define main(a,b) redirected_main(a,b)

#include "pcom.c"
