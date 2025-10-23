/*
 * This program uses _cogstart_C_cog() to load a new kernel to execute a C
 * function. You can have both execute concurrently, or you can define the 
 * Catalina symbol SAME_COG to make the new kernel replace the current kernel
 *
 * For example:
 *
 *    catalina -p2 -lci ex_cogstart.c -C P2_EDGE
 * or
 *    catalina -p2 -lci -C SAME_COG ex_cogstart.c -C P2_EDGE
 *
 * 
 */
#include <cog.h>
#include <prop.h>
#include <stdio.h>

#define STACK_SIZE 200

void C_function(void *arg) {
   printf("Hello, from C_function!\n");
   while(1); // loop forever
} 

static long stack[STACK_SIZE];

void main(void) {
   int cog = ANY_COG;

#ifdef __CATALINA_SAME_COG
   cog = _cogid();
#endif

   _waitsec(1);
   printf("Starting new Kernel\n");
   _waitsec(1);

   if (_cogstart_C_cog(C_function, NULL, stack, STACK_SIZE, cog) == -1) {
     printf("Failed to start new Kernel\n");
   }
   else {
     printf("Kernel started ok\n");
   }

   while(1); // loop forever
}
