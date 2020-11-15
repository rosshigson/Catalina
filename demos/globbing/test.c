/*
 * simple test of a file 'globbing' type function.
 *
 * NOTES: 
 *
 *    Seems to be case sensitive for file names, but not directory names!
 *
 *    See glob.c for wildcard expression syntax.
 *
 *    Filenames are simply 11 character strings - no attempt is made to insert
 *    the "." before the extension (if any!) - this would need to be done 
 *    manually in the listDir function (which current just uses the raw 
 *    directory entry).
 *
 */

#include "storage.h"

void main() {
   char dirname[256];
   char pattern[256];
   char *name;

   printf("Press a key to start\n");
   k_wait();

   printf("Mounting SD Card\n");
   mountFatVolume();

   while (1) {

      printf("Directory to search (null for root dir):");
      gets(dirname);
      printf("\n");
      printf("File name to match (wildcard expression):");
      gets(pattern);
      printf("\n");

      printf("METHOD 1: USE 'listDir'\n");

      // list subdirectory 'dirname' entries that match 'pattern'
      listDir(dirname, pattern);

      printf("Press a key to continue\n");
      k_wait();

      printf("\nMETHOD 2: USE listDirStart/listDirNext\n");
      
      // list subdirectory 'dirname' entries that match 'pattern'
      // returning one matching entry at a time
      if (listDirStart(dirname) != -1) {
         while ((name = listDirNext(pattern)) != NULL) {
            printf("\tentry: %-11.11s\n",name);
         } 
      }
   }


}
