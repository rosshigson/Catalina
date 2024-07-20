#include <prop.h>
#include <cog.h>

#include "catalyst.h"

#ifdef __CATALINA_P2
#include "loader_array_p2.h"
#else
#include "loader_array.h"
#endif

void Execute(int CPU_Num, int File_Mode) {

   long Data[10] = {
      REGISTRY,         // 0
      FLIST_ADDRESS,    // 1
      0,                // 2 filled in at run time (see below)
      0,                // 3 filled in at run time (see below)
      0,                // 4 filled in at run time (see below)
      FLIST_BUFF,       // 5
      FLIST_XFER,       // 6
      0,                // 7 filled in at run time (see below)
      0,                // 8 filled in at run time (see below)
      FLIST_SIOB        // 9 
   };

   // fill in run time values set up by the Catalyst program
   Data[2] = *((long *)FLIST_FSIZ),
   Data[3] = *((long *)FLIST_SHFT),
   Data[4] = *((long *)FLIST_SECT),

   // fill in run time values passed in as parameters
   Data[7] = CPU_Num;
   Data[8] = File_Mode;

   // this will overwrite this cog (i.e. the kernel) with the loader
   _coginit((int)Data>>2, (int)LOADER_array>>2, _cogid());
}



