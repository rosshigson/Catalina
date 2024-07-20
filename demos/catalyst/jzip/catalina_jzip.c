#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <hmi.h>

/* 
 * If no file is specified on the command line, this program prompts
 * for one and then passes it to the JZIP program
 */

#define MAX_FILENAME_LEN 80

int redirected_main (int argc, char *argv[]);

void main (int argc, char *argv[]) {
   int i;
   char c;
   int rows;
   int cols;
   char filename [MAX_FILENAME_LEN + 1];
   FILE * source_file;
   FILE * target_file;

#ifdef __CATALINA_VT100
   cols = 80;
   rows = 24;
#else         
   cols = (t_geometry() >> 8) & 0xff;
   rows = (t_geometry() & 0xff);
#endif         

   if (argc < 2) {
      for (;;) {
         printf("Enter game data file name (e.g. zork1.dat): ");
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
         argc = 2;
         argv[0] = "jzip";
         argv[1] = filename;
         redirected_main(argc, argv);
      }
      else {
         exit(0);
      }
   }
   else {
      redirected_main(argc, argv);
   }
}

#define main(a,b) redirected_main(a,b)

#include "jzip.c"
