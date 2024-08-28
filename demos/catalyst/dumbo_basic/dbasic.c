#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

#include "basic.h"

#define MAX_COMMAND_LEN 80

#define VERSION "Dumbo BASIC v1.8"
/*
 * check for characters valid in DOS 8.3 filenames
 */
static int file_char(char ch) {
   if (isalnum(ch)) {
         return 1;
   }
   switch (ch) {
      case '!':
      case '#':
      case '$':
      case '%':
      case '&':
      case '(':
      case ')':
      case '-':
      case '@':
      case '_':
      case '.':
      case '`':
      case '{':
      case '}':
      case '~':
      case '\'':
         return 1;
      default:
         break;
   }
   return 0;
}


/*
 * loadfile - function to slurp in an ASCII file
 * Params: path - path to file
 * Returns: malloced string containing whole file
 */
char *loadfile(char *path)
{
   FILE *fp;
   int ch;
   long i = 0;
   long size = 0;
   char *answer;
  
   fp = fopen(path, "r");
   if (!fp) {
     printf("Can't open %s\n", path);
     return 0;
   }

   printf("Loading %s\n", path);

   fseek(fp, 0, SEEK_END);
   size = ftell(fp);
   fseek(fp, 0, SEEK_SET);

   answer = malloc(size + 100);
   if (!answer) {
     printf("Out of memory\n");
     fclose(fp);
     return 0;
   }

   while ( (ch = fgetc(fp)) != EOF) {
     // ignore carriage returns (may be present in DOS file)
     if (ch != '\r') {
        answer[i++] = ch;
     }
   }

   answer[i++] = 0;

   fclose(fp);

   return answer;
}
  
/*
 * execute - call with the name of a Dumbo Basic file
 */
int execute(char *filename)
{
   char *scr;

   scr = loadfile(filename);
   if (scr) {
      basic(scr, stdin, stdout, stderr);
      free(scr);
   }
   else {
      printf("press any key to continue ...");
      getchar();
   }

   return 0;
}

int main (int argc, char *argv[]) {
   int    i;
   char   command_line [MAX_COMMAND_LEN + 1];
   FILE * source_file;

   printf("%s\n\n", VERSION);
   if (argc < 2) {
      printf("usage: dbasic [filename]\n\n");
      printf("See documentation for BASIC syntax\n\n");
   
      do {
         printf("Name of basic file to run: ");
         fgets(command_line, MAX_COMMAND_LEN + 1, stdin);
         printf("\n");
         i = 0;
         while (file_char(command_line[i])) {
           i++;
         }
         if (i == 0) {
            exit(-1);
         }
         command_line[i] = '\0';
         if ((source_file = fopen (command_line, "r")) == NULL) {
            if (strchr(command_line, '.') == NULL) {
                strcat(command_line,".bas");
                source_file = fopen (command_line, "r");
            }
            if (source_file == NULL) {
               printf("Cannot open file %s - try again\n", command_line);
            }
         }
      } while (source_file == NULL);
      fclose(source_file);
      printf("\n");
      execute(command_line);
   }
   else {
      strcpy(command_line, argv[1]);
      if ((source_file = fopen (command_line, "r")) == NULL) {
         if (strchr(command_line, '.') == NULL) {
             strcat(command_line,".bas");
             source_file = fopen (command_line, "r");
         }
         if (source_file == NULL) {
            printf("Cannot open file %s\n", command_line);
            return -1;
         }
      }
      fclose(source_file);
      execute(command_line);
   }
#ifdef __CATALINA__
   _waitms(100); // allow time for output to be printed
#endif
   return 0;
}
