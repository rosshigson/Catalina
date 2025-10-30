/*
 * test the dirent.h functions 
 *
 *    opendir(), nextdir(), closedir()
 */

#include <stdio.h>
#include <prop.h>
#include <dirent.h>

void print_dir(char *name) {
   DIR *d;
   struct dirent *e;

   printf("Directory %s:\n", name);
   if ((d = opendir(name)) != NULL) {
      while ((e = readdir(d)) != NULL) {
         printf("   \"%s\"", e->d_name);
         if (e->d_type == DT_DIR) {
            printf(" is a directory");
         }
         printf("\n");
      }
     closedir(d);
   }
   else {
      printf("cannot open dir %s\n", name);
   }
   printf("\n");
}

void main(void) {
 
   _waitsec(1);

   print_dir("");

   print_dir("bin/");
   
   print_dir("include");

   print_dir("include/sys");
}

