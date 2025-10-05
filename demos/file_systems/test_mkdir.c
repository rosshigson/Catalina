#include <stdio.h>
#include <string.h>
#include <sys/stat.h>

#define PATHNAME_SIZE 256

int main(void) {
   FILE *my_file;
   int  ch;
   char pathname[PATHNAME_SIZE+1];
   int i;

   printf("\nTesting mkdir() and mkdirr()\n");

   while (1) {
      printf("\nEnter a path for the new directory: ");
      for (i = 0; i < PATHNAME_SIZE; i++) {
         ch = getchar();
         if ((ch == '\n') || (ch == '\r')) {
            break;
         }
         else {
            pathname[i] = ch;
         }
      }
      pathname[i] = '\0';

      if (strlen(pathname) > 0) {
         printf("\ntrying mkdir '%s' ...\n", pathname);

         if (mkdir(pathname, 0) == 0) {
            printf("\n... mkdir ok!\n");
         }
         else {
            printf("\nCannot create directory with mkdir\n");
            printf("\ntrying mkdirr '%s' ...\n", pathname);
            if (mkdirr(pathname, 0) == 0) {
               printf("\n... mkdirr ok!\n");
            }
            else {
               printf("\nCannot create directory with mkdirr\n");
            }
         }
      }
   }

   return 0;
}
