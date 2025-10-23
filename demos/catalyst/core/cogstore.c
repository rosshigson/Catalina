#include <prop.h>
#include <cog.h>
#include <plugin.h>

#include "catalyst.h"

#ifdef __CATALINA_P2
#include "cogstore_array_p2.h"
#else
#include "cogstore_array.h"
#endif

#define COGSTORE_RETRIES 10000

#define CMD_READ   0x10000000UL // copy Hub to Cog (address in lower 24 bits)
                                // COGSTORE set to zero when complete

#define CMD_WRITE  0x20000000UL // copy Cog to Hub (address in lower 24 bits)
                                // COGSTORE set to zero when complete

#define CMD_SIZE   0x30000000UL // return size of stored data (in LONGs) - set
                                // lower 24 bits to $FFFFFF on call - lower 24 
                                // bits (set to size when complete)

#define CMD_SETUP  0x40000000UL // setup argc and argv array with the stored 
                                // data (set to zero when complete)

#define CMD_STOP   0x50000000UL // stop the CogStore cog.

#ifdef __CATALINA_P2

#define LUT_READ   0x60000000UL // copy Hub to LUT (address in lower 24 bits)
                                // COGSTORE set to zero when complete

#define LUT_WRITE  0x70000000UL // copy LUT to Hub (address in lower 24 bits)
                                // COGSTORE set to zero when complete

#define LUT_SIZE   0x80000000UL // return size of LUT data (in LONGs) - set
                                // lower 24 bits to $FFFFFF on call - lower 24 
                                // bits (set to size when complete)

#endif

#define CMD_RESPONSE 0xFEEDFACEUL // COGSTORE set to this on any other command


static unsigned long *CogStore = (unsigned long *)COGSTORE;

int StartCogStore() {
   int result;
   result = _coginit(0, (int)COGSTORE_array>>2, STORE_COG);
   if (result > 0) {
      _register_plugin(result, LMM_STO);
   }
   return result;
}

int Valid() {
   int i;
   
   *CogStore = -1; // any invalid command
   for (i = 0; i < COGSTORE_RETRIES; i++) {
      if (*CogStore == CMD_RESPONSE) {
         return -1;
      }
   }
   return 0;
}

int StopCogStore() {
   int i;

   if (Valid()) {
      // stop the COGSTORE  
      *CogStore = CMD_STOP;
      for (i = 0; i < COGSTORE_RETRIES; i++) {
         if (*CogStore == 0) {
            return -1;
         }
      }
   }
   return 0;
}

int WriteCogStore(void *addr) {
   int i;

   if (Valid()) {
      *CogStore = CMD_WRITE | (long)addr;
      for (i = 0; i < COGSTORE_RETRIES; i++) {
         if (*CogStore == 0) {
            return -1;
         }
      }
   }
   return 0;
}


int ReadCogStore(void *addr) {
   int i;

   if (Valid()) {
      *CogStore = CMD_READ | (long)addr;
      for (i = 0; i < COGSTORE_RETRIES; i++) {
         if (*CogStore == 0) {
            return -1;
         }
      }
   }
   return 0;
}

int SizeCogStore() {
   int i;

   if (!Valid()) {
      return -1;
   }
    
   *CogStore = CMD_SIZE | 0xFFFFFFUL;
   for (i = 0; i < COGSTORE_RETRIES; i++) {
     if (*CogStore != (CMD_SIZE | 0xFFFFFFUL)) {
        return *CogStore & 0xFFFFFFUL;
     }
   }
   return -2;
}

#ifdef __CATALINA_P2

int WriteLUTStore(void *addr) {
   int i;

   if (Valid()) {
      *CogStore = LUT_WRITE | (long)addr;
      for (i = 0; i < COGSTORE_RETRIES; i++) {
         if (*CogStore == 0) {
            return -1;
         }
      }
   }
   return 0;
}


int ReadLUTStore(void *addr) {
   int i;

   if (Valid()) {
      *CogStore = LUT_READ | (long)addr;
      for (i = 0; i < COGSTORE_RETRIES; i++) {
         if (*CogStore == 0) {
            return -1;
         }
      }
   }
   return 0;
}

int SizeLUTStore() {
   int i;

   if (!Valid()) {
      return -1;
   }
    
   *CogStore = LUT_SIZE | 0xFFFFFFUL;
   for (i = 0; i < COGSTORE_RETRIES; i++) {
     if (*CogStore != (LUT_SIZE | 0xFFFFFFUL)) {
        return *CogStore & 0xFFFFFFUL;
     }
   }
   return -2;
}

#endif

int SetupCogStore(void *addr) {
   int i;
#ifdef __CATALINA_P2
   long *argc = (long *)ARGC_ADDR;
   long *argv = (long *)ARGV_ADDR;
#else
   short *argc = (short *)ARGC_ADDR;
   short *argv = (short *)ARGV_ADDR;
#endif
   long  *argv_0 = (long *)ARGV_0;

   *argc = 0;
   *argv = ARGV_0;
   for (i = 0; i < ARGV_MAX; i++) {
      argv_0[i] = 0;
   }
   
   if (!Valid()) {
      *argc = 1;
      // use "nul" as name if no arguments
      *argv_0 = (long)ARGV_0 + 4*(ARGV_MAX-2);
      argv_0[ARGV_MAX-2] = 0x006C756EUL; // nul;
   }
   else {
      *CogStore = CMD_SETUP | (long)addr;
      for (i = 0; i < COGSTORE_RETRIES; i++) {
         if (*CogStore == 0) {
            return -1;
         }
      }
   }
   return 0;
}


