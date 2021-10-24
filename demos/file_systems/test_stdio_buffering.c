#include <stdio.h>
#include <string.h>

/*
 * This program can be used to demonstrate the effectiveness in using setcbuf
 * to provide buffers for I/O under the new Catalina sdio model where there
 * is only one buffer shared by all streams - if you want buffered I/O for
 * multiple streams then you need to use setvbuf or setcbuf to specify them -
 * but setcbuf never dynamically allocates buffers, whereas setvbuf may - this 
 * means using setcbuf saves around 2kb of Hub RAM.
 */
#define ENABLE_BUFFERS 1 // 0 to disable buffering, 1 to enable
#define ENABLE_WRITE   0 // 0 to enable writing files, 1 to enable

#define FILENAME_SIZE 256
#define BUFFER_SIZE 128

char filename[FILENAME_SIZE+1];

void get_filename() {
   int i;
   int  ch;
   
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
}


int main(void) {
   FILE *my_file_1 = NULL;
   FILE *my_file_2 = NULL;
   int  ch;
   char my_buffer_1[BUFFER_SIZE];
   char my_buffer_2[BUFFER_SIZE];

   printf("\nTesting C stdio file system\n");

   while (1) {
      printf("\nEnter file name 1 to read: ");
      get_filename();

      if (strlen(filename) > 0) {
         printf("\nReading file '%s' ...\n", filename);

         if ((my_file_1 = fopen(filename, "r")) == NULL) {
            printf("\nCannot open file 1 for read\n");
         }
         else {
#if ENABLE_BUFFERS            
            setcbuf(my_file_1, my_buffer_1, _IOLBF, BUFFER_SIZE);
#endif            
         }
      }

      printf("\nEnter file name 2 to read: ");
      get_filename();

      if (strlen(filename) > 0) {
         printf("\nReading file '%s' ...\n", filename);

         if ((my_file_2 = fopen(filename, "r")) == NULL) {
            printf("\nCannot open file 2 for read\n");
         }
         else {
#if ENABLE_BUFFERS            
            setcbuf(my_file_2, my_buffer_2, _IOLBF, BUFFER_SIZE);
#endif            
         }
      }

      while ((my_file_1 != NULL) && (my_file_2 != NULL)) {
         if (my_file_1 != NULL) {
            while (((ch = fgetc(my_file_1)) != EOF) && (ch != '\n')) {
                printf("%c", ch);
            }
            printf("\n");
            if (ch == EOF) {
               printf("...EOF!\n");
               fclose(my_file_1);
               my_file_1 = NULL;
            }
         }
         if (my_file_2 != NULL) {
            while (((ch = fgetc(my_file_2)) != EOF) && (ch != '\n')) {
                printf("%c", ch);
            }
            printf("\n");
            if (ch == EOF) {
               printf("...EOF!\n");
               fclose(my_file_2);
               my_file_2 = NULL;
            }
         }
      }

#if ENABLE_WRITE      
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
         if ((my_file_1 = fopen(filename, "w")) != NULL) {
            for (i = 1; i <= 1000; i++) {
               fprintf(my_file_1, "This is line %d of file %s\n", i, filename);
            }
            fclose(my_file_1);
         }
         else {
            printf("\nCannot open file for write\n");
         }
      }
#endif      
   }

   return 0;
}
