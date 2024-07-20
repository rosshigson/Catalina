/*
 * Simple PSRAM SD Card Cache functions. Supported only on the Propeller 2.
 *
 * Use -C PSRAM or -C HYPER to indicate the board type you have, and
 * compile the program with -lhyper or -lpsram.
 *
 * By default, uses the top 16Mb of the external 32Mb RAM for the cache,
 * so that it can be used by programs that use the lower 16Mb as XMM RAM.
 *
 */

#if !defined(__CATALINA_P2)

#error THIS PROGRAM MUST BE COMPILED FOR THE PROPELLER 2 (-p2)

#endif

#if !defined(__CATALINA_HYPER) && !defined(__CATALINA_PSRAM) 

#error THIS PROGRAM MUST BE COMPILED WITH EITHER -C HYPER OR -C PSRAM

#else

#if defined(__CATALINA_PSRAM)

#include <psram.h>
#define ram_writeLong psram_writeLong
#define ram_readLong psram_readLong
#define ram_writeWord psram_writeWord
#define ram_readWord psram_readWord
#define ram_writeByte psram_writeByte
#define ram_readByte psram_readByte
#define ram_write psram_write
#define ram_read psram_read

/*
 * base addresses to use - note that to compile this program as an XMM
 * program, these addreses must be above the area the program code is
 * stored in the XMM RAM, or it uses as data or heap space.
 *
 * The P2_EDGE has 32MB of PSRAM, but Catalina can only use 16MB of PSRAM 
 * as XMM RAM, so we are safe to use anything above that as cache - it will 
 * not be overwritten even if the XMM program uses all available XMM memory.
 */
#define PSRAM_ADDR  (16*1024*1024)     // first PSRAM address to use
#define PSRAM_LAST  (32*1024*1024)     // last PSRAM address to use (+1)

#elif defined(__CATALINA_HYPER)

#include <hyper.h>
#define ram_writeLong hyper_writeLong
#define ram_readLong hyper_readLong
#define ram_writeWord hyper_writeWord
#define ram_readWord hyper_readWord
#define ram_writeByte hyper_writeByte
#define ram_readByte hyper_readByte
#define ram_write hyper_write
#define ram_read hyper_read

/*
 * base addresses to use - note that to compile this program as an XMM
 * program, these addreses must be above the area the program code is
 * stored in the XMM RAM, or it uses as data or heap space.
 *
 * The HyperRAM add-on board has 16Mb of PSRAM, so we have to ensure we
 * leave enough space for the XMM programs to run - there is no current
 * mechanism for ensuring the heap does not simply overwrite our cache,
 * so we limit ourselves to the last 4 MB and hope that is ok!
 */
#define PSRAM_ADDR  (12*1024*1024)     // first PSRAM address to use
#define PSRAM_LAST  (16*1024*1024)     // last PSRAM address to use (+1) 

#endif

#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <plugin.h>

#ifndef SECTOR_SIZE
#define SECTOR_SIZE 512
#endif

/*
 * sector struct - combines the sector, plus information about what the
 * entry contains, plus information used by the hashing algorithm:
 */
typedef struct sector_struct {
   uint32_t hash;     // sector hash value (0 means slot is empty)
   uint32_t next;     // linked list for collisions (open addressing)
   uint32_t sect;     // sector number
   uint32_t stat;     // status (0 = clean, 1 = dirty)
   uint8_t  data[SECTOR_SIZE];
} sector_struct;

#define SECT_SIZE  (sizeof(sector_struct))
#define MAX_SECT (((PSRAM_LAST - PSRAM_ADDR)/SECT_SIZE)-1)

// Initialize the cache (in PSRAM or HYPER RAM). Note that this 
// does not usually need to be called manually - it is called 
// automatically on the first cache read or write. 
// The default cache mode will be set to WriteThrough. 
// To set the mode to WriteBack, call CacheWriteThrough(0).
void CacheInit();

// flush all dirty records in the cache to the SD card
void CacheFlush();

// Set/clear write_through mode, and return previous setting.
// new_mode = 0 or 1 to clear/set write_through, or -1 for no change
extern int CacheWriteThrough(int new_mode);

// Perform a cached sector read (intended to be used in 
// place of sd_sectread)
unsigned long cached_sectread(char * buffer, long sector);

// Perform a cached sector read (intended to be used in 
// place of sd_sectwrite)
unsigned long cached_sectwrite(char * buffer, long sector);

// return the number of sectors in the cache. If this number ever reaches
// MAX_SECT thent the cache is full.
int CacheSectors();

#endif
