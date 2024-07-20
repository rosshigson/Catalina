#include <prop.h>

static int _seed() {
#ifdef __CATALINA_P2
  return PASM("getct r0\n");
#else
  return CNT;
#endif
}

int getrand() {
   static int seeded = 0;
   if (!seeded) {
      srand(_seed());
      seeded = 1;
   }
   // rand only returns 15 bits, so we need
   // to call it 3 times to get 32 bits!
   return ((rand()<<20) ^ (rand()<<10) ^ rand());
}

