/*
 * number of sectors in cache
 */
static int numsect = 0;

#if defined(__CATALINA_PSRAM) || defined(__CATALINA_HYPER)

#include <cache_sd.h>
#include <sd.h>

#define MAX_RETRIES    10

//#define SHOW_PROGRESS    // define this to print brief progress messages
//#define SHOW_DEBUG       // define this to print detailed debug messages
//#define SHOW_WARNINGS    // define this to print read/write warnings
//#define SHOW_STATISTICS  // define this to print statistics on flush
#define SHOW_ERRORS      // define this to print read/write failures


#ifdef SHOW_STATISTICS
static int cache_read_hits    = 0;
static int cache_read_misses  = 0;
static int cache_write_hits   = 0;
static int cache_write_misses = 0;
#endif

/*
 * pointer to the PSRAM sector data
 */
static sector_struct *SectorTable = (sector_struct *)PSRAM_ADDR;

/*
 * local status variables
 */
static int cache_initialized = 0; // 1 if cache has been initialized
static int write_through = 1; // 1 = write-through, 0 = write-back (flush required)

static void WriteHash(uint32_t slot, uint32_t hash) {
   uint32_t local = hash; // local variable ensures it is in Hub RAM
   uint32_t addr = (uint32_t) (SectorTable + slot); // pointer arithmetic!
   ram_writeLong(&local, (void *)addr);
}

static uint32_t ReadHash(uint32_t slot) {
   uint32_t hash; // local variable ensures it is in Hub RAM
   uint32_t addr = (uint32_t) (SectorTable + slot); // pointer arithmetic!
   ram_readLong(&hash, (void *)addr);
   return hash;
}

static void WriteNext(uint32_t slot, uint32_t next) {
   uint32_t local = next; // local variable ensures it is in Hub RAM
   uint32_t addr = (uint32_t) (SectorTable + slot); // pointer arithmetic!
   addr = addr + sizeof(uint32_t);
   ram_writeLong(&local, (void *)addr);
}

static uint32_t ReadNext(uint32_t slot) {
   uint32_t next; // local variable ensures it is in Hub RAM
   uint32_t addr = (uint32_t) (SectorTable + slot); // pointer arithmetic!
   addr = addr + sizeof(uint32_t);
   ram_readLong(&next, (void *)addr);
   return next;
}

static void WriteSect(uint32_t slot, uint32_t sect) {
   uint32_t local = sect; // local variable ensures it is in Hub RAM
   uint32_t addr = (uint32_t) (SectorTable + slot); // pointer arithmetic!
   addr = addr + 2*sizeof(uint32_t);
   ram_writeLong(&local, (void *)addr);
}

static uint32_t ReadSect(uint32_t slot) {
   uint32_t sect; // local variable ensures it is in Hub RAM
   uint32_t addr = (uint32_t) (SectorTable + slot); // pointer arithmetic!
   addr = addr + 2*sizeof(uint32_t);
   ram_readLong(&sect, (void *)addr);
   return sect;
}

static void WriteStat(uint32_t slot, uint32_t stat) {
   uint32_t local = stat; // local variable ensures it is in Hub RAM
   uint32_t addr = (uint32_t) (SectorTable + slot); // pointer arithmetic!
   addr = addr + 3*sizeof(uint32_t);
   ram_writeLong(&local, (void *)addr);
}

static uint32_t ReadStat(uint32_t slot) {
   uint32_t stat; // local variable ensures it is in Hub RAM
   uint32_t addr = (uint32_t) (SectorTable + slot); // pointer arithmetic!
   addr = addr + 3*sizeof(uint32_t);
   ram_readLong(&stat, (void *)addr);
   return stat;
}

static void WriteData(uint32_t slot, uint8_t *data) {
   uint8_t local[SECTOR_SIZE]; // local variable ensures it is in Hub RAM
   uint32_t addr = (uint32_t) (SectorTable + slot); // pointer arithmetic!
   addr = addr + 4*sizeof(uint32_t);
   memcpy(local, data, SECTOR_SIZE);
   ram_write(local, (void *)addr, SECTOR_SIZE);
}

static void ReadData(uint32_t slot, char *data) {
   uint8_t local[SECTOR_SIZE]; // local variable ensures it is in Hub RAM
   uint32_t addr = (uint32_t) (SectorTable + slot); // pointer arithmetic!
   addr = addr + 4*sizeof(uint32_t);
   ram_read(local, (void *)addr, SECTOR_SIZE);
   memcpy(data, local, SECTOR_SIZE);
}

// initialize the sector data (in PSRAM or HYPER RAM)
void CacheInit() {
   sector_struct empty; // local variable ensures it is in Hub RAM`
   uint32_t addr = (uint32_t) SectorTable;
   uint32_t slot;
   int i;

   empty.hash = 0; // hash
   empty.next = 0; // next
   empty.sect = 0xFFFFFFFF; // sect;
   empty.stat = 0; // stat
   for (i = 0; i < SECTOR_SIZE; i++) {
      empty.data[i] = 0;
   }
#ifdef SHOW_DEBUG
   fprintf(stderr, "Initializing sector table ...\n");
#endif
   for (slot = 0; slot <= MAX_SECT; slot++) {
#ifdef SHOW_DEBUG
      // initialize whole record
      ram_write(&empty, (void *)addr, sizeof(sector_struct));
#else
      // initialize status fields only
      ram_write(&empty, (void *)addr, 4*sizeof(uint32_t));
#endif
      addr += sizeof(sector_struct);
   }
#ifdef SHOW_DEBUG
   addr = (uint32_t) SectorTable;
   for (slot = 0; slot <= MAX_SECT; slot++) {
      empty.hash = 1; // hash
      empty.next = 2; // next
      empty.sect = 3; // sect;
      empty.stat = 4; // stat
      ram_read(&empty, (void *)addr, sizeof(sector_struct));
      if ((empty.hash != 0) 
      ||  (empty.next != 0) 
      ||  (empty.sect != 0xFFFFFFFF) 
      ||  (empty.stat != 0)) {
         fprintf(stderr, "Initialization failed, slot = %d\n", slot);
      }
      addr += sizeof(sector_struct);
   }
   fprintf(stderr, "... done\n");
#endif
#ifdef SHOW_STATISTICS
   cache_read_hits    = 0;
   cache_read_misses  = 0;
   cache_write_hits   = 0;
   cache_write_misses = 0;
#ifdef __CATALINA_HUB_MALLOC
   fprintf(stderr, "Initial hbrk = %6X\n", hbrk(0));
#endif
#endif
   cache_initialized = 1;
}

// flush all dirty records in the cache to the SD card
void CacheFlush() {
   uint32_t slot;
   uint32_t hash;
   uint32_t sect;
   uint32_t stat;
   uint8_t data[SECTOR_SIZE];
   int retries;
   unsigned long result;
   int flushed = 0;

#if defined(SHOW_PROGRESS) 
   fprintf(stderr, "flushing %d sectors\n", numsect);
#endif
   for (slot = 1; slot <= MAX_SECT; slot++) {
      hash = ReadHash(slot);
      stat = ReadStat(slot);
      if ((hash != 0) && (stat != 0)) {
         sect = ReadSect(slot);
         ReadData(slot, (char *)data);
#ifdef SHOW_PROGRESS
   fprintf(stderr, "flush %d (%d)\n", slot, sect);
#endif
#ifdef SHOW_DEBUG
     {
        int i;
        for (i = 0; i < SECTOR_SIZE; i++) {
          fprintf(stderr, "%02X ", data[i]);
        }
        fprintf(stderr, "\n");
        for (i = 0; i < SECTOR_SIZE; i++) {
          if (isprint(data[i])) {
            fprintf(stderr, "%c", data[i]);
          }
        }
        fprintf(stderr, "\n");
     }
#endif
         for (retries = 0; retries < MAX_RETRIES; retries++) {
            if ((result = sd_sectwrite((char *)data, sect)) == 0) {
               break;
            }
            else {
               //fprintf(stderr, "write error %d, sector = %d, result = %d\n", 
                   //retries, sect, result);
               _waitms(10*(retries+1));
            }
         }
         if (result == 0) {
            // mark the sector as clean
            WriteStat(slot, 0);
            flushed++;
         }
#ifdef SHOW_ERRORS
         else {
            fprintf(stderr, "ERROR: Write FAILED result = %d, sector=%d\n", result, sect);
         }
#endif
      }
   }
#ifdef SHOW_PROGRESS
   fprintf(stderr, "flush complete\n");
#endif
#ifdef SHOW_STATISTICS
   fprintf(stderr, "Cache read hits = %d, misses = %d\n", 
       cache_read_hits, cache_read_misses);
   fprintf(stderr, "Cache write hits = %d, misses = %d\n", 
       cache_write_hits, cache_write_misses);
   fprintf(stderr, "Flushed %d sectors\n", flushed);
#ifdef __CATALINA_HUB_MALLOC
   fprintf(stderr, "Final hbrk = %6X\n", hbrk(0));
#endif
#endif
   // Do not reboot too quickly or SD will not get written - how long to wait???
   _waitsec(1); 
}

// this hash function is a version of jenkins_one_at_a_time
// (this may not be an appropriate hash function to hash a uint32_t key!!!)
static uint32_t hash_function(uint32_t key) {
  register int i;
  uint32_t h = 0;

  for (i = 0; i < sizeof(key); i++) {
    h += key & 0xff;
    key = key >> 8;
    h += h << 10;
    h ^= h >> 6;
  }
  h += h << 3;
  h ^= h >> 11;
  h += h << 15;
  // return 1 .. MAX_SECT
  return (h % MAX_SECT) + 1;
}

static uint32_t FindSectorSlot(uint32_t sector, int *found, uint32_t *last) {
    uint32_t hash;
    uint32_t first;
    uint32_t current;
    uint32_t current_hash = 0;
    uint32_t current_sect = 0;
    uint32_t current_next = 0;
    int finished = 0;
    int match = 0;
    uint32_t slot;
    uint32_t slot_hash;

    *last  = 0;
    *found = 0;
    hash   = hash_function(sector);

    first = hash;
    current = hash;
    while (!finished && !match) {
       current_hash = ReadHash(current);
       if (current_hash == 0) {
          finished = 1;
       }
       else if (current_hash == hash) {
          match = 1;
       }
       else {
          current = (current % MAX_SECT) + 1;
          if (current == first) {
            // we are back where we started, so no match found
            finished = 1;
          }
       }
    }
    while (!finished) {
       if (current_hash != hash) {
#ifdef SHOW_ERRORS
          fprintf(stderr, "ERROR: Sector table corrupted\n");
#endif
       }
       current_sect = ReadSect(current);
       if (current_sect == sector) {
          *found = 1;
          finished = 1;
       }
       else {
          *last = current;
          current_next = ReadNext(current);
          if (current_next == 0) {
             // just return any free entry
             for (slot = MAX_SECT; slot > 0; slot--) {
                slot_hash = ReadHash(slot);
                if (slot_hash == 0) {
                   current = slot;
                   break;
                }
             }
             finished = 1;
          }
          else {
             current = current_next;
          }
       }
    }
    return current;
}

static uint32_t FindNextEmptySectorSlot(uint32_t sector, uint32_t *last) {
    uint32_t hash;
    uint32_t first;
    uint32_t current;
    uint32_t current_hash = 0;
    uint32_t current_sect = 0;
    uint32_t current_next = 0;
    int finished = 0;
    int match = 0;
    uint32_t slot;
    uint32_t slot_hash;

    *last = 0;
    hash  = hash_function(sector);

    first = hash;
    current = hash;
    while (!finished && !match) {
       current_hash = ReadHash(current);
       if (current_hash == 0) {
          finished = 1;
       }
       else if (current_hash == hash) {
          match = 1;
       }
       else {
          current = (current % MAX_SECT) + 1;
          if (current == first) {
            // we are back where we started, so no match found
            finished = 1;
          }
       }
    }
    while (!finished) {
       if (current_hash != hash) {
#ifdef SHOW_ERRORS
          fprintf(stderr, "ERROR: Sector table corrupted\n");
#endif
       }
       *last = current;
       current_next = ReadNext(current);
       if (current_next == 0) {
          // just return any free entry
          for (slot = MAX_SECT; slot > 0; slot--) {
             slot_hash = ReadHash(slot);
             if (slot_hash == 0) {
                current = slot;
                break;
             }
          }
          finished = 1;
       }
       else {
          current = current_next;
       }
    }
    return current;
}

static uint32_t FindSector(uint32_t sector) {
    uint32_t last;
    uint32_t slot;
    int found;

    slot = FindSectorSlot(sector, &found, &last);
    if (found) {
       return slot;
    }
    else {
       return MAX_SECT+1;
    }
}

static uint32_t AddSector(uint32_t sector, uint8_t *data) {
    uint32_t last;
    uint32_t hash;
    uint32_t slot;

    if (numsect >= MAX_SECT) {
#ifdef SHOW_WARNINGS
        fprintf(stderr, "WARNING: Sector table full\n");
#endif
        return MAX_SECT+1;
    }

    hash = hash_function(sector);

    slot = FindNextEmptySectorSlot(sector, &last);
    if (last == slot) {
#ifdef SHOW_WARNINGS
       fprintf(stderr, "WARNING: Sector %d cannot be added\n", sector);
#endif
       return MAX_SECT+1;
    }
#ifdef SHOW_DEBUG
    fprintf(stderr, "Sector %06u - hash was %06u, adding to slot %06u\n", sector, hash, slot);
#endif
    WriteHash(slot, hash);
    if (last != 0) {
       WriteNext(last, slot);
    }
    WriteSect(slot, sector);
    WriteData(slot, data);
    numsect++;
    return slot;
}

unsigned long cached_sectread(char * buffer, long sector) {
   uint32_t slot;
   uint8_t data[SECTOR_SIZE];
   char check_buffer[SECTOR_SIZE];
   int retries;
   unsigned long result = 0;

   if (!cache_initialized) {
      CacheInit();
   }
   slot = FindSector(sector);
   if ((slot > 0) && (slot <= MAX_SECT)) {
      // in cache - just return the data
#ifdef SHOW_STATISTICS
      cache_read_hits++;
#endif
#ifdef SHOW_PROGRESS
      fprintf(stderr, "cr %d\n", sector);
#endif
      ReadData(slot, (char *)data);
      memcpy(buffer, data, SECTOR_SIZE);
#ifdef SHOW_DEBUG
      for (retries = 0; retries < MAX_RETRIES; retries++) {
         if ((result = sd_sectread(check_buffer, sector)) == 0) {
            break;
         else {
            //fprintf(stderr, "read error %d, sector=%d, result = %d\n", 
                //retries, sector, result);
            _waitms(10*(retries+1));
         }
      }
      if (result != 0) {
#ifdef SHOW_ERRORS
         fprintf(stderr, "ERROR: Read FAILED result=%d, sector=%d\n", result, sector);
#endif
      }
      else {
         if (memcmp(buffer, check_buffer, SECTOR_SIZE) != 0) {
#ifdef SHOW_ERRORS
            uint32_t addr = (uint32_t) (SectorTable + slot);
            int i;
            fprintf(stderr, "ERROR: Data Mismatch sector=%06u, slot=%06u, Addr=%08X\n", sector, slot, addr);
            for (i = 0; i < SECTOR_SIZE; i++) {
               if (check_buffer[i] != buffer[i]) {
                  fprintf(stderr, "%06u: %02X vs %02X\n", i, check_buffer[i], buffer[i]);
                  break;
               }
            }
#endif
         }
      }
#endif
   }
   else {
      // not in cache - read from SD to buffer
#ifdef SHOW_STATISTICS
      cache_read_misses++;
#endif
#ifdef SHOW_PROGRESS
      fprintf(stderr, "dr %d\n", sector);
#endif
      for (retries = 0; retries < MAX_RETRIES; retries++) {
         if ((result = sd_sectread(buffer, sector)) == 0) {
            break;
         }
         else {
            //fprintf(stderr, "read error %d, sector = %d, result = %d\n", 
                //retries, sector, result);
            _waitms(10*(retries+1));
         }
      }
      if (result == 0) {
         // and add buffer to cache (if possible)
         AddSector(sector, (uint8_t *)buffer);
      }
#ifdef SHOW_ERRORS
      else {
         fprintf(stderr, "ERROR: Read FAILED result = %d, sector=%d\n", result, sector);
      }
#endif
   }
   return result;
}

unsigned long cached_sectwrite(char * buffer, long sector) {
   uint32_t slot;
   int retries;
   unsigned long result = 0;

   if (!cache_initialized) {
      CacheInit();
   }
   slot = FindSector(sector);
   if ((slot > 0) && (slot <= MAX_SECT)) {
      // already in cache - update the data
#ifdef SHOW_STATISTICS
      cache_write_hits++;
#endif
#ifdef SHOW_PROGRESS
      fprintf(stderr, "cw %d\n", sector);
#endif
      WriteData(slot, (uint8_t *)buffer);
      if (!write_through) {
         // mark the sector as dirty
         WriteStat(slot, 1);
      }
   }
   else {
      // not in cache - add buffer to cache
#ifdef SHOW_STATISTICS
      cache_write_misses++;
#endif
      slot = AddSector(sector, (uint8_t *)buffer);
      if (!write_through && (slot > 0) && (slot <= MAX_SECT)) {
         // mark the sector as dirty
         WriteStat(slot, 1);
      }
   }
   if (write_through || (slot == 0) || (slot > MAX_SECT)) {
      // write to SD card
#ifdef SHOW_PROGRESS
      fprintf(stderr, "dw %d\n", sector);
#endif
#ifdef SHOW_DEBUG
      {
        int i;
        fprintf(stderr, "write sector= %d., slot=%d\n", sector, slot);
        for (i = 0; i < SECTOR_SIZE; i++) {
          fprintf(stderr, "%02X ", buffer[i]);
        }
        fprintf(stderr, "\n");
        for (i = 0; i < SECTOR_SIZE; i++) {
          if (isprint(buffer[i])) {
            fprintf(stderr, "%c", buffer[i]);
          }
        }
        fprintf(stderr, "\n");
     }
#endif
      for (retries = 0; retries < MAX_RETRIES; retries++) {
         if ((result = sd_sectwrite((char *)buffer, sector)) == 0) {
            break;
         }
         else {
            //fprintf(stderr, "write error %d, sector = %d, result = %d\n", 
                //retries, sector, result);
            _waitms(10*(retries+1));
         }
      }
#ifdef SHOW_ERRORS
      if (result != 0) {
         fprintf(stderr, "ERROR: Write FAILED result = %d, sector=%d\n", result, sector);
      }
#endif
   }
   return result;
}

// initalize the cache if it is not initalized, set/clear write_through, 
// and return previous setting
//    new_mode = 0 or 1 to clear/set write_through, or -1 for no change
int CacheWriteThrough(int new_mode) {
   int old_mode = write_through;
   if (!cache_initialized) {
      CacheInit();
   }
   if (new_mode >= 0) {
      write_through = new_mode;
   }
   return old_mode;
}

// return the number of sectors in the cache. If this number ever reaches
// MAX_SECT thent the cache is full.
int CacheSectors() {
  return numsect;
}

#endif
