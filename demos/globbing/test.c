/*
 * simple test of a file 'globbing' type function.
 *
 * NOTES: 
 *
 *    See glob.c for wildcard expression syntax.
 *
 */

#include "storage.h"

/*
 * printFile - just print the name (ignore file attributes and size)
 */
static void printFile(unsigned char *name, 
                      unsigned int   attr, 
                      unsigned long  size) {
   printf("\t%s\n", (char *)name);
}

void main() {
   unsigned char dirname[256];
   unsigned char pattern[256];
   unsigned char *name;
   int count;

   printf("Press a key to start\n");
   k_wait();

   printf("\nMounting SD Card\n");
   if (mountFatVolume() <= 0) {
      printf("File system did not mount properly!\n");
   }

   while (1) {

      printf("\nDirectory to search (null for root dir):");
      gets((char *)dirname);
      printf("\nFile name to match (wildcard expression):");
      gets((char *)pattern);

      printf("\nMETHOD 1: Using 'listDir'\n");

      // print subdirectory 'dirname' entries that match 'pattern'
      // (uses a trivial print function provided by storage.c)
      listDir(dirname, pattern);

      printf("Press a key to continue\n");
      k_wait();

      printf("\nMETHOD 2: Using 'doDir'\n");

      // print subdirectory 'dirname' entries that match 'pattern'
      // using our own print function
      doDir(dirname, pattern, &printFile);

      printf("Press a key to continue\n");
      k_wait();

      printf("\nMETHOD 3: Using 'listDirStart' & 'listDirNext'\n");
      
      // list subdirectory 'dirname' entries that match 'pattern'
      // returning one matching entry at a time so that we can add
      // paging functionality
      count = 0;
      if (listDirStart(dirname) != -1) {
         while ((name = listDirNext(pattern)) != NULL) {
            printFile(name, 0, 0);
            count++;
            if (count == 20) {
               printf("Press a key to continue\n");
               k_wait();
               count = 0;
            }
         } 
      }
   }
}
