#include <stdio.h>
#include <string.h>

#define FILENAME_SIZE 256

#define PRINT_FILE_SIZE 1

#define LINES 150

int main(void) {
   FILE *my_file;
   int  ch;
   char filename[FILENAME_SIZE+1];
   int i;

   printf("\nTesting C stdio file system\n");

   while (1) {
      printf("\nEnter a file name to read: ");
      for (i = 0; i < FILENAME_SIZE; i++) {
         ch = getchar();
         if ((ch == '\n') || (ch == '\r')) {
            break;
         }
         else {
            filename[i] = ch;
         }
      }
      filename[i] = '\0';

      if (strlen(filename) > 0) {
         printf("\nReading file '%s' ...\n", filename);

         if ((my_file = fopen(filename, "r")) != NULL) {
#if PRINT_FILE_SIZE            
            fseek(my_file, 0L, SEEK_END);
            printf("\nFile Size = %ld\n", ftell(my_file));
            fseek(my_file, 0L, SEEK_SET);
#endif
            while ((ch = fgetc(my_file)) != EOF) {
               putchar(ch);
            }
            printf("\n... EOF!\n");
            fclose(my_file);
         }
         else {
            printf("\nCannot open file for read\n");
         }
      }

      printf("\nEnter a file name to write: ");
      for (i = 0; i < FILENAME_SIZE; i++) {
         ch = getchar();
         if ((ch == '\n') || (ch == '\r')) {
            break;
         }
         else {
            filename[i] = ch;
         }
      }
      filename[i] = '\0';

      if (strlen(filename) > 0) {
         printf("\nWriting file '%s' ...\n", filename);
         if ((my_file = fopen(filename, "w")) != NULL) {
            for (i = 1; i <= LINES; i++) {
               fprintf(my_file, "This is line %d of file %s\n", i, filename);
            }
            fclose(my_file);
         }
         else {
            printf("\nCannot open file for write\n");
         }
      }
   }

   return 0;
}
