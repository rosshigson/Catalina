#include <stdio.h>
#include <prop.h>

#include "catalyst.h"

void *registry() {
  return _registry();
}

void main() {
   char *store[1200+1] = { '\0' };
   int size;

   printf("Press a key to start Cogstore\n");
   k_wait();
   StartCogStore();
   // delay to allow cogstore to start
   _waitcnt(_cnt()+_clockfreq()/10);
   if (Valid()) {
      printf("Cogstore is running! :)\n");
      printf("Press a key to write to Cogstore\n");
      k_wait();
      WriteCogStore("test : This Is a CogStore Test String!");
      printf("Press a key to get the size of the Cogstore\n");
      k_wait();
      size = SizeCogStore();
      printf("Size = %d (longs)\n", size);
      printf("Press a key to read from Cogstore\n");
      k_wait();
      ReadCogStore((void*)store);
      printf("result = %s\n", store);
      printf("Press a key to stop Cogstore\n");
      k_wait();
      StopCogStore();
      if (Valid()) {
          printf("Cogstore is still running! :(\n");
      }
      else {
         printf("Cogstore stopped ok! :)\n");
      }
   }
   else {
       printf("Cogstore did not start! :(\n");
   }
   while(1) { };
}
