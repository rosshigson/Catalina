/*
 * Volume mapping table (required when FF_MULTI_PARTITION == 1)
 *
 * The default for the library version of FatFs (four partitions on
 * physical drive 0) is defined here - if a different configuration
 * is required, a stand-alone version of FatFs must be used.
 */

#include <ff.h>

PARTITION VolToPart[] = {
    {0, 1},    /* "0:" ==> 1st partition in physical drive 0 */
    {0, 2},    /* "1:" ==> 2nd partition in physical drive 0 */
    {0, 3},    /* "3:" ==> 3rd partition in physical drive 0 */
    {0, 4},    /* "4:" ==> 4th partition in physical drive 0 */
};

