#include <stdio.h>
#include <stdlib.h>

/* Simple function to check the return code and exit the program
   if the function call failed
   */
static void compResults(char *string, int rc) {
  if (rc) {
    printf("Error on : %s, rc=%d\n", string, rc);
    exit(EXIT_FAILURE);
  }
  return;
}
