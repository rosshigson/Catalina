/*
  Driver file for DUMBO BASIC.
*/

#include <stdio.h>
#include <stdlib.h>

#include "basic.h"

char *loadfile(char *path);

void usage(void)
{
  printf("Dumbo BASIC : a BASIC interpreter\n");
  printf("usage:\n");
  printf("dbasic <filename>\n");
  printf("See documentation for BASIC syntax.\n");
  printf("\nPress enter to continue");
  getchar();
  exit(EXIT_FAILURE);
}

/*
  call with the name of the Dumbo Basic file
*/
int main(int argc, char **argv)
{
  char *scr;

  if (argc == 1) {
	/* comment out usage call to run test script */
	usage();
  }
  else {
    printf("Starting DUMBO BASIC ...\n");
	 scr = loadfile(argv[1]);
	 if(scr) {
	   basic(scr, stdin, stdout, stderr);
	   free(scr);
	 }
  }

  return 0;
}

/*
  function to slurp in an ASCII file
  Params: path - path to file
  Returns: malloced string containing whole file
*/
char *loadfile(char *path)
{
  FILE *fp;
  int ch;
  long i = 0;
  long size = 0;
  char *answer;
  
  fp = fopen(path, "r");
  if(!fp)
  {
    printf("Can't open %s\n", path);
	return 0;
  }

  fseek(fp, 0, SEEK_END);
  size = ftell(fp);
  fseek(fp, 0, SEEK_SET);

  answer = malloc(size + 100);
  if(!answer)
  {
    printf("Out of memory\n");
    fclose(fp);
	return 0;
  }

  while ( (ch = fgetc(fp)) != EOF) {
    // convert carriage returns to newlines (DOS file)
    if (ch == '\r') {
       answer[i++] = '\n';
    }
    else {
       answer[i++] = ch;
    }
  }

  answer[i++] = 0;

  fclose(fp);

  return answer;
}

