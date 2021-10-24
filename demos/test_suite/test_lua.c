/*
 * A simple program to test payload's new Lua scripting facility.
 *
 * Execute this program with a payload command like the following to 
 * automatically load and start both this program and the Lua script
 * that verifies it generates the correct output:
 *
 *   payload test_lua -z -b230400 -L test_lua.lua
 *
 */

#include <stdio.h>

void main(void) {
   int i;
   char ch;

   do {
      ch = getchar();
   } while (ch !='\n');

   printf("program done!\n");

   while(1) { };
}
