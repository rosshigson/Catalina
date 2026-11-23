#include <ff.h>

#if FF_MULTI_PARTITION

   /* Volume mapping table defined by user (required when FF_MULTI_PARTITION == 1) */
   PARTITION VolToPart[] = {
       {0, 1},    /* "0:" ==> 1st partition in physical drive 0 */
       {0, 2},    /* "1:" ==> 2nd partition in physical drive 0 */
   };

#endif

