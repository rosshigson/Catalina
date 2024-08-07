// include some standard header files
#include <stdlib.h>

// include some useful utilities
#include "utilities.h"

// include the Spin KB_TV program (as generated by the SpinC utility)
#include "kb_tv.c"

// define the KB_TV commands (must match those in the Spin KB_TV program)
#define KEY_WAIT  1
#define KEY_READY 2
#define PUT_CHR   3
#define PUT_STR   4

// define a macro to simplify execution of KB_TV commands
#define KB_TV_CMD(c, d) *data = (long)(d); *command = (c); while (*command) ;

#ifdef __CATALINA_P2
#error THIS PROGRAM REQUIRES A PROPELLER 1
#endif

int main(void) {

   // declare some local variables
   char welcome_msg[] = "Welcome to Catalina\r";
   long *command;
   long *data;

   // declare local storage for the Spin KB_TV program
   char prog[KB_TV_PROG_SIZE];
   char var[KB_TV_VAR_SIZE];
   char stack[KB_TV_STACK_SIZE];

   // point to the locations of the Spin variables
   // which we will use to communicate with the KB_TV program
   command = (long *)(&var[0]); // 'command' is the first long in VAR 
   data = (long *)(&var[4]);    // 'data' is the second long in VAR

   // start the Spin KB_TV program (which in turns start the tv and keyboard)
   start_KB_TV(prog, var, stack);

   // print a welcome message 
   KB_TV_CMD(PUT_STR, welcome_msg)

   // now read and process characters using the KB_TV program
   while (1) {

      // wait for a key
      KB_TV_CMD(KEY_WAIT, *data);
      *data = *data & 0xFF;

      // interpret keys '0' .. '9' specially, otherwise
      // just echo each key we read (as upper case)
      switch (*data) {
         case '1': KB_TV_CMD(PUT_STR, " one ");   break;
         case '2': KB_TV_CMD(PUT_STR, " two ");   break;
         case '3': KB_TV_CMD(PUT_STR, " three "); break;
         case '4': KB_TV_CMD(PUT_STR, " four ");  break;
         case '5': KB_TV_CMD(PUT_STR, " five ");  break;
         case '6': KB_TV_CMD(PUT_STR, " six ");   break;
         case '7': KB_TV_CMD(PUT_STR, " seven "); break;
         case '8': KB_TV_CMD(PUT_STR, " eight "); break;
         case '9': KB_TV_CMD(PUT_STR, " nine ");  break;
         case '0': KB_TV_CMD(PUT_STR, " zero ");  break;
         default:  KB_TV_CMD(PUT_CHR, toupper(*data)); break;
      }

   }

   return 0;
}
