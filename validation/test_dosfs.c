/*
 * Simple program to demonstrate some basic DOSFS functionality.
 *
 * Be sure that a suitably formatted SD Card plugin is inserted! 
 *
 * This program uses its own version of DOSFS, so it does not need to be
 * compiled with the extended library. But the SD Card plugin must be loaded.
 * which can be done by defining the symbol SD (this is done automatically
 * by the script included with this test program).
 *
 * NOTE: If too many tests are enabled, the program will be too large to 
 * execute correctly as a TINY or COMPACT program on the Propeller 1, and will
 * have to be compiled and loaded as a SMALL or LARGE program. For example 
 * (asuming you are using a DRACBLADE and have built the utilities for the 
 * DRACBLADE using the 'build_utilies' command):
 *
 *    catalina test_dosfs.c -lci -C DRACBLADE -C TTY -C LARGE
 *    payload xmm test_dosfs
 *
 */
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include <hmi.h>

#include "dosfs.h"

/*
 * Undefine these to disable various tests 
 */ 
#define INFO_TEST
#define ENUMERATION_TEST
#define RENAME_TEST
#define UNLINK_TEST
#define WRITE_TEST
#define READ_TEST

/*
 * Define configuration parameters for various tests
 */
#define RW_FILE         "test.txt"
#define ENUMERATION_DIR "bin"
#define RENAME_FILE     "test.txt"
#define UNLINK_FILE     "test.txt"

#define SECTORS_TO_WRITE 33

/*
 * return a pointer to a formatted filename
 */
char * filename(uint8_t *entry) {
   static char name[12];
   int i;
   int j;
  
   j = 0;

   if (entry[0] != 0) {
      for (i = 0; i < 11; i++) {
         if (entry[i] != ' ') {
            name[j++] = entry[i];
         }
         if ((i == 7) && (strncmp((char *)&entry[8],"   ", 3) != 0)) {
            name[j++] = '.';
         }
      }
   }
   name[j] = 0;
   return name;

}

/******************************************************************************/

#define WRITE_RETRIES 10

#define READ_RETRIES 10

static void press_key_to_continue() {
   int ch;

   t_string(1, "Press any key to continue\n");
   ch = k_wait();
   t_printf("\n\n");
}

static void wait100ms() {
   _waitcnt(_cnt() + _clockfreq()/10);
}

uint32_t DOSFS_WriteSector(uint8_t unit, uint8_t *buffer, uint32_t sector, uint32_t count)
{
   int result;
   int i, j;

#if __CATALINA_DEBUG_DOSFS
   t_string(1, "\nDSF_WriteSector ");
   t_integer(1, sector);
   t_string(1, "\n");
   press_key_to_continue();
#endif

#if DOSFS_CAN_COUNT
   if (count == 1) {
      result = sd_sectwrite((char *)buffer, sector);
   }
   else {
      for (i = 0; i < count; i++) {
         for (j = 0; j < WRITE_RETRIES; j++) {
            if ((result = sd_sectwrite((char *)(buffer + 512*i), sector + i)) == 0) {
               break;
            }
            else {
#if __CATALINA_DEBUG_DOSFS
               t_printf("WRITE ERROR = %X\n", result);
#endif
               wait100ms();
            }
      }
   }
#else
   for (j = 0; j < WRITE_RETRIES; j++) {
      if ((result = sd_sectwrite((char *)buffer, sector)) == 0) {
          break;
      }
      else {
#if __CATALINA_DEBUG_DOSFS
         t_printf("WRITE ERROR = %X\n", result);
#endif
         wait100ms();
      }

   }
#endif
   return result;
}

uint32_t DOSFS_ReadSector(uint8_t unit, uint8_t *buffer, uint32_t sector, uint32_t count)
{
   int i, j;
   int result;

#if __CATALINA_DEBUG_DOSFS
   t_string(1, "\nDOSFS_ReadSector ");
   t_integer(1, sector);
   t_string(1, "\n");
   press_key_to_continue();
#endif

#if DOSFS_CAN_COUNT
   if (count == 1) {
      result = sd_sectread((char *)buffer, sector);
   }
   else {
      for (i = 0; i < count; i++) {
         for (j = 0; i < READ_RETRIES; i++) {
            if ((result = sd_sectread((char *)(buffer + 512*i), sector + i)) == 0) {
               break;
            }
            else {
#if __CATALINA_DEBUG_DOSFS
               t_printf("READ ERROR = %X\n", result);
#endif
               wait100ms();
            }
         }
      }
   }
#else
   for (j = 0; j < READ_RETRIES; j++) {
      if ((result = sd_sectread((char *)buffer, sector)) == 0) {
          break;
      }
      else {
#if __CATALINA_DEBUG_DOSFS
         t_printf("READ ERROR = %X\n", result);
#endif
         wait100ms();
      }
   }
#endif
   return result;
}

uint8_t *DOSFS_CanonicalToDir(uint8_t *dest, uint8_t *src);

/*
   Rename a file. You supply populated VOLINFO, a path to the file, a new name
   for the file (just the filename, no path). 
   You also need to provide a pointer to a sector-sized scratch buffer.
   Returns various DOSFS_* error states. If the result is DOSFS_OK, the file
   was successfully found and renamed.
*/
uint32_t DOSFS_RenameFile(PVOLINFO volinfo, uint8_t *path, uint8_t *newname, uint8_t *scratch)
{
   uint8_t tmppath[MAX_PATH];
   uint8_t filename[12];
   uint8_t newfilename[12];
   uint8_t *p;
   uint32_t dirsector = 0;
   DIRINFO di;
   DIRENT de;

   // Get a local copy of the path. If it's longer than MAX_PATH, abort.
   strncpy((char *) tmppath, (char *) path, MAX_PATH);
   tmppath[MAX_PATH - 1] = 0;
   if (strcmp((char *) path,(char *) tmppath)) {
      return DOSFS_PATHLEN;
   }

   // strip leading path separators
   while (tmppath[0] == DIR_SEPARATOR)
      strcpy((char *) tmppath, (char *) tmppath + 1);

   // Parse filename off the end of the supplied path
   p = tmppath;
   while (*(p++));

   p--;
   while (p > tmppath && *p != DIR_SEPARATOR) // larwe 9/16/06 ">=" to ">" bugfix
      p--;
   if (*p == DIR_SEPARATOR)
      p++;

   DOSFS_CanonicalToDir(filename, p);

   DOSFS_CanonicalToDir(newfilename, newname);
   
   if (p > tmppath)
      p--;
   if (*p == DIR_SEPARATOR || p == tmppath) // larwe 9/16/06 +"|| p == tmppath" bugfix
      *p = 0;

   // At this point, if our path was MYDIR/MYDIR2/FILE.EXT, 
   // filename = "FILE    EXT",
   // newfilename = "FILE    EXT"
   // and tmppath = "MYDIR/MYDIR2".
   di.scratch = scratch;
   
   // first check the new name doesn't exist
   if (DOSFS_OpenDir(volinfo, tmppath, &di))
      return DOSFS_NOTFOUND;

   while (!DOSFS_GetNext(volinfo, &di, &de)) {
      if (!memcmp(de.name, newfilename, 11)) {
         // the new name already exists
         return DOSFS_ERRNAME;
      }
   }
   // re-open the directory to look for the old name
   if (DOSFS_OpenDir(volinfo, tmppath, &di))
      return DOSFS_NOTFOUND;

   while (!DOSFS_GetNext(volinfo, &di, &de)) {
      if (!memcmp(de.name, filename, 11)) {
         // You can't use this function call to rename a directory.
         if (de.attr & ATTR_DIRECTORY)
            return DOSFS_NOTFOUND;

         // put new name in the directory entry
         memcpy(de.name, newfilename, 11);
         de.lstaccdate_l = 0x11;
         de.lstaccdate_h = 0x34;
         de.wrttime_l = 0x20;
         de.wrttime_h = 0x08;
         de.wrtdate_l = 0x11;
         de.wrtdate_h = 0x34;
         if (di.currentcluster == 0)
            dirsector = volinfo->rootdir + di.currentsector;
         else
            dirsector = volinfo->dataarea + ((di.currentcluster - 2) * volinfo->secperclus) + di.currentsector;
         //copy the directory entry back into the sector and write it
         memcpy(&(((PDIRENT) scratch)[di.currententry-1]), &de, sizeof(DIRENT));
         if (DOSFS_WriteSector(volinfo->unit, scratch, dirsector, 1))
            return DOSFS_ERRMISC;

         return DOSFS_OK;
      }
   }

   return DOSFS_NOTFOUND;
}

/******************************************************************************/

/*
   DOSFS Embedded FAT-Compatible Filesystem
   (C) 2005 Lewin A.R.W. Edwards (sysadm@zws.com)

   You are permitted to modify and/or use this code in your own projects without
   payment of royalty, regardless of the license(s) you choose for those projects.

   You cannot re-copyright or restrict use of the code as released by Lewin Edwards.
*/

#define APPLY_PATCHES 1
/*
   Get starting sector# of specified partition on drive #unit
   NOTE: This code ASSUMES an MBR on the disk.
   scratchsector should point to a SECTOR_SIZE scratch area
   Returns 0xffffffff for any error.
   If pactive is non-NULL, this function also returns the partition active flag.
   If pptype is non-NULL, this function also returns the partition type.
   If psize is non-NULL, this function also returns the partition size.
*/
uint32_t DOSFS_GetPtnStart(uint8_t unit, uint8_t *scratchsector, uint8_t pnum, uint8_t *pactive, uint8_t *pptype, uint32_t *psize)
{
   uint32_t result;
   PMBR mbr = (PMBR) scratchsector;

   // DOS ptable supports maximum 4 partitions
   if (pnum > 3)
      return DOSFS_ERRMISC;

   // Read MBR from target media
   if (DOSFS_ReadSector(unit,scratchsector,0,1)) {
      return DOSFS_ERRMISC;
   }

   result = (uint32_t) mbr->ptable[pnum].start_0 |
     (((uint32_t) mbr->ptable[pnum].start_1) << 8) |
     (((uint32_t) mbr->ptable[pnum].start_2) << 16) |
     (((uint32_t) mbr->ptable[pnum].start_3) << 24);

   if (pactive)
      *pactive = mbr->ptable[pnum].active;

   if (pptype)
      *pptype = mbr->ptable[pnum].type;

   if (psize)
      *psize = (uint32_t) mbr->ptable[pnum].size_0 |
        (((uint32_t) mbr->ptable[pnum].size_1) << 8) |
        (((uint32_t) mbr->ptable[pnum].size_2) << 16) |
        (((uint32_t) mbr->ptable[pnum].size_3) << 24);

   return result;
}


/*
   Retrieve volume info from BPB and store it in a VOLINFO structure
   You must provide the unit and starting sector of the filesystem, and
   a pointer to a sector buffer for scratch
   Attempts to read BPB and glean information about the FS from that.
   Returns 0 OK, nonzero for any error.
*/
uint32_t DOSFS_GetVolInfo(uint8_t unit, uint8_t *scratchsector, uint32_t startsector, PVOLINFO volinfo)
{
   PLBR lbr = (PLBR) scratchsector;
   volinfo->unit = unit;
   volinfo->startsector = startsector;

   if(DOSFS_ReadSector(unit,scratchsector,startsector,1))
      return DOSFS_ERRMISC;

// tag: OEMID, refer dosfs.h
//   strncpy(volinfo->oemid, lbr->oemid, 8);
//   volinfo->oemid[8] = 0;

   volinfo->secperclus = lbr->bpb.secperclus;
   volinfo->reservedsecs = (uint16_t) lbr->bpb.reserved_l |
        (((uint16_t) lbr->bpb.reserved_h) << 8);

   volinfo->numsecs =  (uint16_t) lbr->bpb.sectors_s_l |
        (((uint16_t) lbr->bpb.sectors_s_h) << 8);

   if (!volinfo->numsecs)
      volinfo->numsecs = (uint32_t) lbr->bpb.sectors_l_0 |
        (((uint32_t) lbr->bpb.sectors_l_1) << 8) |
        (((uint32_t) lbr->bpb.sectors_l_2) << 16) |
        (((uint32_t) lbr->bpb.sectors_l_3) << 24);

   // If secperfat is 0, we must be in a FAT32 volume; get secperfat
   // from the FAT32 EBPB. The volume label and system ID string are also
   // in different locations for FAT12/16 vs FAT32.
   volinfo->secperfat =  (uint16_t) lbr->bpb.secperfat_l |
        (((uint16_t) lbr->bpb.secperfat_h) << 8);
   if (!volinfo->secperfat) {
      volinfo->secperfat = (uint32_t) lbr->ebpb.ebpb32.fatsize_0 |
        (((uint32_t) lbr->ebpb.ebpb32.fatsize_1) << 8) |
        (((uint32_t) lbr->ebpb.ebpb32.fatsize_2) << 16) |
        (((uint32_t) lbr->ebpb.ebpb32.fatsize_3) << 24);

      memcpy(volinfo->label, lbr->ebpb.ebpb32.label, 11);
      volinfo->label[11] = 0;
   
// tag: OEMID, refer dosfs.h
//      memcpy(volinfo->system, lbr->ebpb.ebpb32.system, 8);
//      volinfo->system[8] = 0; 
   }
   else {
      memcpy(volinfo->label, lbr->ebpb.ebpb.label, 11);
      volinfo->label[11] = 0;
   
// tag: OEMID, refer dosfs.h
//      memcpy(volinfo->system, lbr->ebpb.ebpb.system, 8);
//      volinfo->system[8] = 0; 
   }

   // note: if rootentries is 0, we must be in a FAT32 volume.
   volinfo->rootentries =  (uint16_t) lbr->bpb.rootentries_l |
        (((uint16_t) lbr->bpb.rootentries_h) << 8);

   // after extracting raw info we perform some useful precalculations
   volinfo->fat1 = startsector + volinfo->reservedsecs;

   // The calculation below is designed to round up the root directory size for FAT12/16
   // and to simply ignore the root directory for FAT32, since it's a normal, expandable
   // file in that situation.
   if (volinfo->rootentries) {
      volinfo->rootdir = volinfo->fat1 + (volinfo->secperfat * 2);
      volinfo->dataarea = volinfo->rootdir + (((volinfo->rootentries * 32) + (SECTOR_SIZE - 1)) / SECTOR_SIZE);
   }
   else {
      volinfo->dataarea = volinfo->fat1 + (volinfo->secperfat * 2);
      volinfo->rootdir = (uint32_t) lbr->ebpb.ebpb32.root_0 |
        (((uint32_t) lbr->ebpb.ebpb32.root_1) << 8) |
        (((uint32_t) lbr->ebpb.ebpb32.root_2) << 16) |
        (((uint32_t) lbr->ebpb.ebpb32.root_3) << 24);
   }

   // Calculate number of clusters in data area and infer FAT type from this information.
   volinfo->numclusters = (volinfo->numsecs - volinfo->dataarea) / volinfo->secperclus;
   if (volinfo->numclusters < 4085)
      volinfo->filesystem = FAT12;
   else if (volinfo->numclusters < 65525)
      volinfo->filesystem = FAT16;
   else
      volinfo->filesystem = FAT32;

   return DOSFS_OK;
}

/*
   Fetch FAT entry for specified cluster number
   You must provide a scratch buffer for one sector (SECTOR_SIZE) and a populated VOLINFO
   Returns a FAT32 BAD_CLUSTER value for any error, otherwise the contents of the desired
   FAT entry.
   scratchcache should point to a UINT32. This variable caches the physical sector number
   last read into the scratch buffer for performance enhancement reasons.
*/
uint32_t DOSFS_GetFAT(PVOLINFO volinfo, uint8_t *scratch, uint32_t *scratchcache, uint32_t cluster)
{
   uint32_t offset, sector, result;

   if (volinfo->filesystem == FAT12) {
      offset = cluster + (cluster / 2);
   }
   else if (volinfo->filesystem == FAT16) {
      offset = cluster * 2;
   }
   else if (volinfo->filesystem == FAT32) {
      offset = cluster * 4;
   }
   else
      return 0x0ffffff7;   // FAT32 bad cluster   

   // at this point, offset is the BYTE offset of the desired sector from the start
   // of the FAT. Calculate the physical sector containing this FAT entry.
   sector = ldiv(offset, SECTOR_SIZE).quot + volinfo->fat1;

   // If this is not the same sector we last read, then read it into RAM
   if (sector != *scratchcache) {
      if(DOSFS_ReadSector(volinfo->unit, scratch, sector, 1)) {
         // avoid anyone assuming that this cache value is still valid, which
         // might cause disk corruption
         *scratchcache = 0;
         return 0x0ffffff7;   // FAT32 bad cluster   
      }
      *scratchcache = sector;
   }

   // At this point, we "merely" need to extract the relevant entry.
   // This is easy for FAT16 and FAT32, but a royal PITA for FAT12 as a single entry
   // may span a sector boundary. The normal way around this is always to read two
   // FAT sectors, but that luxury is (by design intent) unavailable to DOSFS.
   offset = ldiv(offset, SECTOR_SIZE).rem;

   if (volinfo->filesystem == FAT12) {
      // Special case for sector boundary - Store last byte of current sector.
      // Then read in the next sector and put the first byte of that sector into
      // the high byte of result.
      if (offset == SECTOR_SIZE - 1) {
         result = (uint32_t) scratch[offset];
         sector++;
         if(DOSFS_ReadSector(volinfo->unit, scratch, sector, 1)) {
            // avoid anyone assuming that this cache value is still valid, which
            // might cause disk corruption
            *scratchcache = 0;
            return 0x0ffffff7;   // FAT32 bad cluster   
         }
         *scratchcache = sector;
         // Thanks to Claudio Leonel for pointing out this missing line.
         result |= ((uint32_t) scratch[0]) << 8;
      }
      else {
         result = (uint32_t) scratch[offset] |
           ((uint32_t) scratch[offset+1]) << 8;
      }
      if (cluster & 1)
         result = result >> 4;
      else
         result = result & 0xfff;
   }
   else if (volinfo->filesystem == FAT16) {
      result = (uint32_t) scratch[offset] |
        ((uint32_t) scratch[offset+1]) << 8;
   }
   else if (volinfo->filesystem == FAT32) {
      result = ((uint32_t) scratch[offset] |
        ((uint32_t) scratch[offset+1]) << 8 |
        ((uint32_t) scratch[offset+2]) << 16 |
        ((uint32_t) scratch[offset+3]) << 24) & 0x0fffffff;
   }
   else
      result = 0x0ffffff7;   // FAT32 bad cluster   
   return result;
}


/*
   Set FAT entry for specified cluster number
   You must provide a scratch buffer for one sector (SECTOR_SIZE) and a populated VOLINFO
   Returns DOSFS_ERRMISC for any error, otherwise DOSFS_OK
   scratchcache should point to a UINT32. This variable caches the physical sector number
   last read into the scratch buffer for performance enhancement reasons.

   NOTE: This code is HIGHLY WRITE-INEFFICIENT, particularly for flash media. Considerable
   performance gains can be realized by caching the sector. However this is difficult to
   achieve on FAT12 without requiring 2 sector buffers of scratch space, and it is a design
   requirement of this code to operate on a single 512-byte scratch.

   If you are operating DOSFS over flash, you are strongly advised to implement a writeback
   cache in your physical I/O driver. This will speed up your code significantly and will
   also conserve power and flash write life.
*/
uint32_t DOSFS_SetFAT(PVOLINFO volinfo, uint8_t *scratch, uint32_t *scratchcache, uint32_t cluster, uint32_t new_contents)
{
   uint32_t offset, sector, result;
   if (volinfo->filesystem == FAT12) {
      offset = cluster + (cluster / 2);
      new_contents &=0xfff;
   }
   else if (volinfo->filesystem == FAT16) {
      offset = cluster * 2;
      new_contents &=0xffff;
   }
   else if (volinfo->filesystem == FAT32) {
      offset = cluster * 4;
      new_contents &=0x0fffffff;   // FAT32 is really "FAT28"
   }
   else
      return DOSFS_ERRMISC;   

   // at this point, offset is the BYTE offset of the desired sector from the start
   // of the FAT. Calculate the physical sector containing this FAT entry.
   sector = ldiv(offset, SECTOR_SIZE).quot + volinfo->fat1;

   // If this is not the same sector we last read, then read it into RAM
   if (sector != *scratchcache) {
      if(DOSFS_ReadSector(volinfo->unit, scratch, sector, 1)) {
         // avoid anyone assuming that this cache value is still valid, which
         // might cause disk corruption
         *scratchcache = 0;
         return DOSFS_ERRMISC;
      }
      *scratchcache = sector;
   }

   // At this point, we "merely" need to extract the relevant entry.
   // This is easy for FAT16 and FAT32, but a royal PITA for FAT12 as a single entry
   // may span a sector boundary. The normal way around this is always to read two
   // FAT sectors, but that luxury is (by design intent) unavailable to DOSFS.
   offset = ldiv(offset, SECTOR_SIZE).rem;

   if (volinfo->filesystem == FAT12) {

      // If this is an odd cluster, pre-shift the desired new contents 4 bits to
      // make the calculations below simpler
      if (cluster & 1)
         new_contents = new_contents << 4;

      // Special case for sector boundary
      if (offset == SECTOR_SIZE - 1) {

         // Odd cluster: High 12 bits being set
         if (cluster & 1) {
            scratch[offset] = (scratch[offset] & 0x0f) | new_contents & 0xf0;
         }
         // Even cluster: Low 12 bits being set
         else {
            scratch[offset] = new_contents & 0xff;
         }
         result = DOSFS_WriteSector(volinfo->unit, scratch, *scratchcache, 1);
         // mirror the FAT into copy 2
         if (DOSFS_OK == result)
            result = DOSFS_WriteSector(volinfo->unit, scratch, (*scratchcache)+volinfo->secperfat, 1);

         // If we wrote that sector OK, then read in the subsequent sector
         // and poke the first byte with the remainder of this FAT entry.
         if (DOSFS_OK == result) {
            (*scratchcache)++;
            result = DOSFS_ReadSector(volinfo->unit, scratch, *scratchcache, 1);
            if (DOSFS_OK == result) {
               // Odd cluster: High 12 bits being set
               if (cluster & 1) {
                  scratch[0] = new_contents & 0xff00;
               }
               // Even cluster: Low 12 bits being set
               else {
                  scratch[0] = (scratch[0] & 0xf0) | new_contents & 0x0f;
               }
               result = DOSFS_WriteSector(volinfo->unit, scratch, *scratchcache, 1);
               // mirror the FAT into copy 2
               if (DOSFS_OK == result)
                  result = DOSFS_WriteSector(volinfo->unit, scratch, (*scratchcache)+volinfo->secperfat, 1);
            }
            else {
               // avoid anyone assuming that this cache value is still valid, which
               // might cause disk corruption
               *scratchcache = 0;
            }
         }
      } // if (offset == SECTOR_SIZE - 1)

      // Not a sector boundary. But we still have to worry about if it's an odd
      // or even cluster number.
      else {
         // Odd cluster: High 12 bits being set
         if (cluster & 1) {
            scratch[offset] = (scratch[offset] & 0x0f) | new_contents & 0xf0;
            scratch[offset+1] = new_contents & 0xff00;
         }
         // Even cluster: Low 12 bits being set
         else {
            scratch[offset] = new_contents & 0xff;
            scratch[offset+1] = (scratch[offset+1] & 0xf0) | new_contents & 0x0f;
         }
         result = DOSFS_WriteSector(volinfo->unit, scratch, *scratchcache, 1);
         // mirror the FAT into copy 2
         if (DOSFS_OK == result)
            result = DOSFS_WriteSector(volinfo->unit, scratch, (*scratchcache)+volinfo->secperfat, 1);
      }
   }
   else if (volinfo->filesystem == FAT16) {
      scratch[offset] = (new_contents & 0xff);
      scratch[offset+1] = (new_contents & 0xff00) >> 8;
      result = DOSFS_WriteSector(volinfo->unit, scratch, *scratchcache, 1);
      // mirror the FAT into copy 2
      if (DOSFS_OK == result)
         result = DOSFS_WriteSector(volinfo->unit, scratch, (*scratchcache)+volinfo->secperfat, 1);
   }
   else if (volinfo->filesystem == FAT32) {
      scratch[offset] = (new_contents & 0xff);
      scratch[offset+1] = (new_contents & 0xff00) >> 8;
      scratch[offset+2] = (new_contents & 0xff0000) >> 16;
      scratch[offset+3] = (scratch[offset+3] & 0xf0) | ((new_contents & 0x0f000000) >> 24);
      // Note well from the above: Per Microsoft's guidelines we preserve the upper
      // 4 bits of the FAT32 cluster value. It's unclear what these bits will be used
      // for; in every example I've encountered they are always zero.
      result = DOSFS_WriteSector(volinfo->unit, scratch, *scratchcache, 1);
      // mirror the FAT into copy 2
      if (DOSFS_OK == result)
         result = DOSFS_WriteSector(volinfo->unit, scratch, (*scratchcache)+volinfo->secperfat, 1);
   }
   else
      result = DOSFS_ERRMISC;

   return result;
}

/*
   Convert a filename element from canonical (8.3) to directory entry (11) form
   src must point to the first non-separator character.
   dest must point to a 12-byte buffer.
*/
uint8_t *DOSFS_CanonicalToDir(uint8_t *dest, uint8_t *src)
{
   uint8_t *destptr = dest;

   memset(dest, ' ', 11);
   dest[11] = 0;

   while (*src && (*src != DIR_SEPARATOR) && (destptr - dest < 11)) {
      if (*src >= 'a' && *src <='z') {
         *destptr++ = (*src - 'a') + 'A';
         src++;
      }
      else if (*src == '.') {
         src++;
         destptr = dest + 8;
      }
      else {
         *destptr++ = *src++;
      }
   }

   return dest;
}

/*
   Find the first unused FAT entry
   You must provide a scratch buffer for one sector (SECTOR_SIZE) and a populated VOLINFO
   Returns a FAT32 BAD_CLUSTER value for any error, otherwise the contents of the desired
   FAT entry.
   Returns FAT32 bad_sector (0x0ffffff7) if there is no free cluster available
*/
uint32_t DOSFS_GetFreeFAT(PVOLINFO volinfo, uint8_t *scratch)
{
   uint32_t i, result = 0xffffffff, scratchcache = 0;
   
   // Search starts at cluster 2, which is the first usable cluster
   // NOTE: This search can't terminate at a bad cluster, because there might
   // legitimately be bad clusters on the disk.
   for (i=2; i < volinfo->numclusters; i++) {
      result = DOSFS_GetFAT(volinfo, scratch, &scratchcache, i);
      if (!result) {
         return i;
      }
   }
   return 0x0ffffff7;      // Can't find a free cluster
}


/*
   Open a directory for enumeration by DOSFS_GetNextDirEnt
   You must supply a populated VOLINFO (see DOSFS_GetVolInfo)
   The empty string or a string containing only the directory separator are
   considered to be the root directory.
   Returns 0 OK, nonzero for any error.
*/
uint32_t DOSFS_OpenDir(PVOLINFO volinfo, uint8_t *dirname, PDIRINFO dirinfo)
{
   // Default behavior is a regular search for existing entries
   dirinfo->flags = 0;

   if (!strlen((char *) dirname) || (strlen((char *) dirname) == 1 && dirname[0] == DIR_SEPARATOR)) {
      if (volinfo->filesystem == FAT32) {
         dirinfo->currentcluster = volinfo->rootdir;
         dirinfo->currentsector = 0;
         dirinfo->currententry = 0;

         // read first sector of directory
         return DOSFS_ReadSector(volinfo->unit, dirinfo->scratch, volinfo->dataarea + ((volinfo->rootdir - 2) * volinfo->secperclus), 1);
      }
      else {
         dirinfo->currentcluster = 0;
         dirinfo->currentsector = 0;
         dirinfo->currententry = 0;

         // read first sector of directory
         return DOSFS_ReadSector(volinfo->unit, dirinfo->scratch, volinfo->rootdir, 1);
      }
   }

   // This is not the root directory. We need to find the start of this subdirectory.
   // We do this by devious means, using our own companion function DOSFS_GetNext.
   else {
      uint8_t tmpfn[12];
      uint8_t *ptr = dirname;
      uint32_t result;
      DIRENT de;

      if (volinfo->filesystem == FAT32) {
         dirinfo->currentcluster = volinfo->rootdir;
         dirinfo->currentsector = 0;
         dirinfo->currententry = 0;

         // read first sector of directory
         if (DOSFS_ReadSector(volinfo->unit, dirinfo->scratch, volinfo->dataarea + ((volinfo->rootdir - 2) * volinfo->secperclus), 1))
            return DOSFS_ERRMISC;
      }
      else {
         dirinfo->currentcluster = 0;
         dirinfo->currentsector = 0;
         dirinfo->currententry = 0;

         // read first sector of directory
         if (DOSFS_ReadSector(volinfo->unit, dirinfo->scratch, volinfo->rootdir, 1))
            return DOSFS_ERRMISC;
      }

      // skip leading path separators
      while (*ptr == DIR_SEPARATOR && *ptr)
         ptr++;

      // Scan the path from left to right, finding the start cluster of each entry
      // Observe that this code is inelegant, but obviates the need for recursion.
      while (*ptr) {
         DOSFS_CanonicalToDir(tmpfn, ptr);

         de.name[0] = 0;

         do {
            result = DOSFS_GetNext(volinfo, dirinfo, &de);
         } while (!result && memcmp(de.name, tmpfn, 11));

         if (!memcmp(de.name, tmpfn, 11) && ((de.attr & ATTR_DIRECTORY) == ATTR_DIRECTORY)) {
            if (volinfo->filesystem == FAT32) {
               dirinfo->currentcluster = (uint32_t) de.startclus_l_l |
                 ((uint32_t) de.startclus_l_h) << 8 |
                 ((uint32_t) de.startclus_h_l) << 16 |
                 ((uint32_t) de.startclus_h_h) << 24;
            }
            else {
               dirinfo->currentcluster = (uint32_t) de.startclus_l_l |
                 ((uint32_t) de.startclus_l_h) << 8;
            }
            dirinfo->currentsector = 0;
            dirinfo->currententry = 0;

            if (DOSFS_ReadSector(volinfo->unit, dirinfo->scratch, volinfo->dataarea + ((dirinfo->currentcluster - 2) * volinfo->secperclus), 1))
               return DOSFS_ERRMISC;
         }
         else if (!memcmp(de.name, tmpfn, 11) && !(de.attr & ATTR_DIRECTORY))
            return DOSFS_NOTFOUND;

         // seek to next item in list
         while (*ptr != DIR_SEPARATOR && *ptr)
            ptr++;
         if (*ptr == DIR_SEPARATOR)
            ptr++;
      }

      if (!dirinfo->currentcluster)
         return DOSFS_NOTFOUND;
   }
   return DOSFS_OK;
}

/*
   Get next entry in opened directory structure. Copies fields into the dirent
   structure, updates dirinfo. Note that it is the _caller's_ responsibility to
   handle the '.' and '..' entries.
   A deleted file will be returned as a NULL entry (first char of filename=0)
   by this code. Filenames beginning with 0x05 will be translated to 0xE5
   automatically. Long file name entries will be returned as NULL.
   returns DOSFS_EOF if there are no more entries, DOSFS_OK if this entry is valid,
   or DOSFS_ERRMISC for a media error
*/
uint32_t DOSFS_GetNext(PVOLINFO volinfo, PDIRINFO dirinfo, PDIRENT dirent)
{
   uint32_t tempint;   // required by DOSFS_GetFAT

   // Do we need to read the next sector of the directory?
   if (dirinfo->currententry >= SECTOR_SIZE / sizeof(DIRENT)) {
      dirinfo->currententry = 0;
      dirinfo->currentsector++;

      // Root directory; special case handling 
      // Note that currentcluster will only ever be zero if both:
      // (a) this is the root directory, and
      // (b) we are on a FAT12/16 volume, where the root dir can't be expanded
      if (dirinfo->currentcluster == 0) {
         // Trying to read past end of root directory?
         if (dirinfo->currentsector * (SECTOR_SIZE / sizeof(DIRENT)) >= volinfo->rootentries)
            return DOSFS_EOF;

         // Otherwise try to read the next sector
         if (DOSFS_ReadSector(volinfo->unit, dirinfo->scratch, volinfo->rootdir + dirinfo->currentsector, 1))
            return DOSFS_ERRMISC;
      }

      // Normal handling
      else {
         if (dirinfo->currentsector >= volinfo->secperclus) {
            dirinfo->currentsector = 0;
            if ((dirinfo->currentcluster >= 0xff7 &&  volinfo->filesystem == FAT12) ||
              (dirinfo->currentcluster >= 0xfff7 &&  volinfo->filesystem == FAT16) ||
              (dirinfo->currentcluster >= 0x0ffffff7 &&  volinfo->filesystem == FAT32)) {
              
                 // We are at the end of the directory chain. If this is a normal
                 // find operation, we should indicate that there is nothing more
                 // to see.
                 if (!(dirinfo->flags & DOSFS_DI_BLANKENT))
                  return DOSFS_EOF;
               
               // On the other hand, if this is a "find free entry" search,
               // we need to tell the caller to allocate a new cluster
               else
                  return DOSFS_ALLOCNEW;
            }
            dirinfo->currentcluster = DOSFS_GetFAT(volinfo, dirinfo->scratch, &tempint, dirinfo->currentcluster);
         }
         if (DOSFS_ReadSector(volinfo->unit, dirinfo->scratch, volinfo->dataarea + ((dirinfo->currentcluster - 2) * volinfo->secperclus) + dirinfo->currentsector, 1))
            return DOSFS_ERRMISC;
      }
   }

   memcpy(dirent, &(((PDIRENT) dirinfo->scratch)[dirinfo->currententry]), sizeof(DIRENT));

   if (dirent->name[0] == 0) {      // no more files in this directory
      // If this is a "find blank" then we can reuse this name.
      if (dirinfo->flags & DOSFS_DI_BLANKENT) {
#if APPLY_PATCHES
         dirinfo->currententry++;
#endif
         return DOSFS_OK;
      }
      else
         return DOSFS_EOF;
   }

   if (dirent->name[0] == 0xe5)   // handle deleted file entries
      dirent->name[0] = 0;
   else if ((dirent->attr & ATTR_LONG_NAME) == ATTR_LONG_NAME)
      dirent->name[0] = 0;
   else if (dirent->name[0] == 0x05)   // handle kanji filenames beginning with 0xE5
      dirent->name[0] = 0xe5;

   dirinfo->currententry++;

   return DOSFS_OK;
}

/*
   INTERNAL
   Find a free directory entry in the directory specified by path
   This function MAY cause a disk write if it is necessary to extend the directory
   size.
   Note - di.scratch must be preinitialized to point to a sector scratch buffer
   de is a scratch structure
   Returns DOSFS_ERRMISC if a new entry could not be located or created
   de is updated with the same return information you would expect from DOSFS_GetNext
*/
uint32_t DOSFS_GetFreeDirEnt(PVOLINFO volinfo, uint8_t *path, PDIRINFO di, PDIRENT de)
{
   uint32_t tempclus,i;

   if (DOSFS_OpenDir(volinfo, path, di))
      return DOSFS_NOTFOUND;

   // Set "search for empty" flag so DOSFS_GetNext knows what we're doing
   di->flags |= DOSFS_DI_BLANKENT;

   // We seek through the directory looking for an empty entry
   // Note we are reusing tempclus as a temporary result holder.
   tempclus = 0;   
   do {
      tempclus = DOSFS_GetNext(volinfo, di, de);

      // Empty entry found
      if (tempclus == DOSFS_OK && (!de->name[0])) {
         return DOSFS_OK;
      }

      // End of root directory reached
      else if (tempclus == DOSFS_EOF)
         return DOSFS_ERRMISC;
         
      else if (tempclus == DOSFS_ALLOCNEW) {
         tempclus = DOSFS_GetFreeFAT(volinfo, di->scratch);
         if (tempclus == 0x0ffffff7)
            return DOSFS_ERRMISC;

         // write out zeroed sectors to the new cluster
         memset(di->scratch, 0, SECTOR_SIZE);
         for (i=0;i<volinfo->secperclus;i++) {
            if (DOSFS_WriteSector(volinfo->unit, di->scratch, volinfo->dataarea + ((tempclus - 2) * volinfo->secperclus) + i, 1))
               return DOSFS_ERRMISC;
         }
         // Point old end cluster to newly allocated cluster
         i = 0;
         DOSFS_SetFAT(volinfo, di->scratch, &i, di->currentcluster, tempclus);

         // Update DIRINFO so caller knows where to place the new file         
         di->currentcluster = tempclus;
         di->currentsector = 0;
#if APPLY_PATCHES
         di->currententry = 0; // tempclus is not zero but contains fat entry, so next loop will call
                               // DFS_GetNext(), which will increment currententry
                               // This is OK for for the code coming after this, which  expects to subtract 1
                               // Starting with 1 would cause a 'hole' in the dir.
#else
         di->currententry = 1;   // since the code coming after this expects to subtract 1
#endif         
         
         // Mark newly allocated cluster as end of chain         
         switch(volinfo->filesystem) {
            case FAT12:      tempclus = 0xff8;   break;
            case FAT16:      tempclus = 0xfff8;   break;
            case FAT32:      tempclus = 0x0ffffff8;   break;
            default:      return DOSFS_ERRMISC;
         }
         DOSFS_SetFAT(volinfo, di->scratch, &i, di->currentcluster, tempclus);
      }
   } while (!tempclus);

   // We shouldn't get here
   return DOSFS_ERRMISC;
}

/*
   Open a file for reading or writing. You supply populated VOLINFO, a path to the file,
   mode (DOSFS_READ or DOSFS_WRITE) and an empty fileinfo structure. You also need to
   provide a pointer to a sector-sized scratch buffer.
   Returns various DOSFS_* error states. If the result is DOSFS_OK, fileinfo can be used
   to access the file from this point on.
*/
uint32_t DOSFS_OpenFile(PVOLINFO volinfo, uint8_t *path, uint8_t mode, uint8_t *scratch, PFILEINFO fileinfo)
{
   uint8_t tmppath[MAX_PATH];
   uint8_t filename[12];
   uint8_t *p;
   DIRINFO di;
   DIRENT de;

   // larwe 2006-09-16 +1 zero out file structure
   memset(fileinfo, 0, sizeof(FILEINFO));

   // save access mode
   fileinfo->mode = mode;

   // Get a local copy of the path. If it's longer than MAX_PATH, abort.
   strncpy((char *) tmppath, (char *) path, MAX_PATH);
   tmppath[MAX_PATH - 1] = 0;
   if (strcmp((char *) path,(char *) tmppath)) {
      return DOSFS_PATHLEN;
   }

   // strip leading path separators
   while (tmppath[0] == DIR_SEPARATOR)
      strcpy((char *) tmppath, (char *) tmppath + 1);

   // Parse filename off the end of the supplied path
   p = tmppath;
   while (*(p++));

   p--;
   while (p > tmppath && *p != DIR_SEPARATOR) // larwe 9/16/06 ">=" to ">" bugfix
      p--;
   if (*p == DIR_SEPARATOR)
      p++;

   DOSFS_CanonicalToDir(filename, p);

   if (p > tmppath)
      p--;
   if (*p == DIR_SEPARATOR || p == tmppath) // larwe 9/16/06 +"|| p == tmppath" bugfix
      *p = 0;

   // At this point, if our path was MYDIR/MYDIR2/FILE.EXT, filename = "FILE    EXT" and
   // tmppath = "MYDIR/MYDIR2".
   di.scratch = scratch;
   if (DOSFS_OpenDir(volinfo, tmppath, &di))
      return DOSFS_NOTFOUND;

   while (!DOSFS_GetNext(volinfo, &di, &de)) {
      if (!memcmp(de.name, filename, 11)) {
         // You can't use this function call to open a directory.
         if (de.attr & ATTR_DIRECTORY)
            return DOSFS_NOTFOUND;

         fileinfo->volinfo = volinfo;
         fileinfo->pointer = 0;
         // The reason we store this extra info about the file is so that we can
         // speedily update the file size, modification date, etc. on a file that is
         // opened for writing.
         if (di.currentcluster == 0)
            fileinfo->dirsector = volinfo->rootdir + di.currentsector;
         else
            fileinfo->dirsector = volinfo->dataarea + ((di.currentcluster - 2) * volinfo->secperclus) + di.currentsector;
         fileinfo->diroffset = di.currententry - 1;
         if (volinfo->filesystem == FAT32) {
            fileinfo->cluster = (uint32_t) de.startclus_l_l |
              ((uint32_t) de.startclus_l_h) << 8 |
              ((uint32_t) de.startclus_h_l) << 16 |
              ((uint32_t) de.startclus_h_h) << 24;
         }
         else {
            fileinfo->cluster = (uint32_t) de.startclus_l_l |
              ((uint32_t) de.startclus_l_h) << 8;
         }
         fileinfo->firstcluster = fileinfo->cluster;
         fileinfo->filelen = (uint32_t) de.filesize_0 |
           ((uint32_t) de.filesize_1) << 8 |
           ((uint32_t) de.filesize_2) << 16 |
           ((uint32_t) de.filesize_3) << 24;

         return DOSFS_OK;
      }
   }

   // At this point, we KNOW the file does not exist. If the file was opened
   // with write access, we can create it.
   if (mode & DOSFS_WRITE) {
      uint32_t cluster, temp;

      // Locate or create a directory entry for this file
      if (DOSFS_OK != DOSFS_GetFreeDirEnt(volinfo, tmppath, &di, &de))
         return DOSFS_ERRMISC;

      // put sane values in the directory entry
      memset(&de, 0, sizeof(de));
      memcpy(de.name, filename, 11);
      de.crttime_l = 0x20;   // 01:01:00am, Jan 1, 2006.
      de.crttime_h = 0x08;
      de.crtdate_l = 0x11;
      de.crtdate_h = 0x34;
      de.lstaccdate_l = 0x11;
      de.lstaccdate_h = 0x34;
      de.wrttime_l = 0x20;
      de.wrttime_h = 0x08;
      de.wrtdate_l = 0x11;
      de.wrtdate_h = 0x34;

      // allocate a starting cluster for the directory entry
      cluster = DOSFS_GetFreeFAT(volinfo, scratch);

      de.startclus_l_l = cluster & 0xff;
      de.startclus_l_h = (cluster & 0xff00) >> 8;
      de.startclus_h_l = (cluster & 0xff0000) >> 16;
      de.startclus_h_h = (cluster & 0xff000000) >> 24;

      // update FILEINFO for our caller's sake
      fileinfo->volinfo = volinfo;
      fileinfo->pointer = 0;
      // The reason we store this extra info about the file is so that we can
      // speedily update the file size, modification date, etc. on a file that is
      // opened for writing.
      if (di.currentcluster == 0)
         fileinfo->dirsector = volinfo->rootdir + di.currentsector;
      else
         fileinfo->dirsector = volinfo->dataarea + ((di.currentcluster - 2) * volinfo->secperclus) + di.currentsector;
      fileinfo->diroffset = di.currententry - 1;
      fileinfo->cluster = cluster;
      fileinfo->firstcluster = cluster;
      fileinfo->filelen = 0;
      
      // write the directory entry
      // note that we no longer have the sector containing the directory entry,
      // tragically, so we have to re-read it
      if (DOSFS_ReadSector(volinfo->unit, scratch, fileinfo->dirsector, 1))
         return DOSFS_ERRMISC;
      memcpy(&(((PDIRENT) scratch)[di.currententry-1]), &de, sizeof(DIRENT));
      if (DOSFS_WriteSector(volinfo->unit, scratch, fileinfo->dirsector, 1))
         return DOSFS_ERRMISC;

      // Mark newly allocated cluster as end of chain         
      switch(volinfo->filesystem) {
         case FAT12:      cluster = 0xff8;   break;
         case FAT16:      cluster = 0xfff8;   break;
         case FAT32:      cluster = 0x0ffffff8;   break;
         default:      return DOSFS_ERRMISC;
      }
      temp = 0;
      DOSFS_SetFAT(volinfo, scratch, &temp, fileinfo->cluster, cluster);

      return DOSFS_OK;
   }

   return DOSFS_NOTFOUND;
}

/*
   Read an open file
   You must supply a prepopulated FILEINFO as provided by DOSFS_OpenFile, and a
   pointer to a SECTOR_SIZE scratch buffer.
   Note that returning DOSFS_EOF is not an error condition. This function updates the
   successcount field with the number of bytes actually read.
*/
uint32_t DOSFS_ReadFile(PFILEINFO fileinfo, uint8_t *scratch, uint8_t *buffer, uint32_t *successcount, uint32_t len)
{
   uint32_t remain;
   uint32_t result = DOSFS_OK;
   uint32_t sector;
   uint32_t bytesread;

   // Don't try to read past EOF
   if (len > fileinfo->filelen - fileinfo->pointer)
      len = fileinfo->filelen - fileinfo->pointer;

   remain = len;
   *successcount = 0;

   while (remain && result == DOSFS_OK) {
      // This is a bit complicated. The sector we want to read is addressed at a cluster
      // granularity by the fileinfo->cluster member. The file pointer tells us how many
      // extra sectors to add to that number.
      sector = fileinfo->volinfo->dataarea +
        ((fileinfo->cluster - 2) * fileinfo->volinfo->secperclus) +
        div(div(fileinfo->pointer,fileinfo->volinfo->secperclus * SECTOR_SIZE).rem, SECTOR_SIZE).quot;

      // Case 1 - File pointer is not on a sector boundary
      if (div(fileinfo->pointer, SECTOR_SIZE).rem) {
         uint16_t tempreadsize;

         // We always have to go through scratch in this case
         result = DOSFS_ReadSector(fileinfo->volinfo->unit, scratch, sector, 1);

         // This is the number of bytes that we actually care about in the sector
         // just read.
         tempreadsize = SECTOR_SIZE - (div(fileinfo->pointer, SECTOR_SIZE).rem);
               
         // Case 1A - We want the entire remainder of the sector. After this
         // point, all passes through the read loop will be aligned on a sector
         // boundary, which allows us to go through the optimal path 2A below.
            if (remain >= tempreadsize) {
            memcpy(buffer, scratch + (SECTOR_SIZE - tempreadsize), tempreadsize);
            bytesread = tempreadsize;
            buffer += tempreadsize;
            fileinfo->pointer += tempreadsize;
            remain -= tempreadsize;
         }
         // Case 1B - This read concludes the file read operation
         else {
            memcpy(buffer, scratch + (SECTOR_SIZE - tempreadsize), remain);

            buffer += remain;
            fileinfo->pointer += remain;
            bytesread = remain;
            remain = 0;
         }
      }
      // Case 2 - File pointer is on sector boundary
      else {
         // Case 2A - We have at least one more full sector to read and don't have
         // to go through the scratch buffer. You could insert optimizations here to
         // read multiple sectors at a time, if you were thus inclined (note that
         // the maximum multi-read you could perform is a single cluster, so it would
         // be advantageous to have code similar to case 1A above that would round the
         // pointer to a cluster boundary the first pass through, so all subsequent
         // [large] read requests would be able to go a cluster at a time).
         if (remain >= SECTOR_SIZE) {
            result = DOSFS_ReadSector(fileinfo->volinfo->unit, buffer, sector, 1);
            remain -= SECTOR_SIZE;
            buffer += SECTOR_SIZE;
            fileinfo->pointer += SECTOR_SIZE;
            bytesread = SECTOR_SIZE;
         }
         // Case 2B - We are only reading a partial sector
         else {
            result = DOSFS_ReadSector(fileinfo->volinfo->unit, scratch, sector, 1);
            memcpy(buffer, scratch, remain);
            buffer += remain;
            fileinfo->pointer += remain;
            bytesread = remain;
            remain = 0;
         }
      }

      *successcount += bytesread;

      // check to see if we stepped over a cluster boundary
      if (div(fileinfo->pointer - bytesread, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot !=
        div(fileinfo->pointer, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot) {
         // An act of minor evil - we use bytesread as a scratch integer, knowing that
         // its value is not used after updating *successcount above
         bytesread = 0;
         if (((fileinfo->volinfo->filesystem == FAT12) && (fileinfo->cluster >= 0xff8)) ||
           ((fileinfo->volinfo->filesystem == FAT16) && (fileinfo->cluster >= 0xfff8)) ||
           ((fileinfo->volinfo->filesystem == FAT32) && (fileinfo->cluster >= 0x0ffffff8)))
            result = DOSFS_EOF;
         else
            fileinfo->cluster = DOSFS_GetFAT(fileinfo->volinfo, scratch, &bytesread, fileinfo->cluster);
      }
   }
   
   return result;
}

/*
   Seek file pointer to a given position
   This function does not return status - refer to the fileinfo->pointer value
   to see where the pointer wound up.
   Requires a SECTOR_SIZE scratch buffer
*/
void DOSFS_Seek(PFILEINFO fileinfo, uint32_t offset, uint8_t *scratch)
{
   uint32_t tempint;
#if APPLY_PATCHES
   uint16_t endcluster=0;  //canny/reza 5/7 fixed
#endif

   // larwe 9/16/06 bugfix split case 0a/0b and changed fallthrough handling
   // Case 0a - Return immediately for degenerate case
   if (offset == fileinfo->pointer) {
      return;
   }
   
   // Case 0b - Don't allow the user to seek past the end of the file
   if (offset > fileinfo->filelen) {
      offset = fileinfo->filelen;
      // NOTE NO RETURN HERE!
   }

   // Case 1 - Simple rewind to start
   // Note _intentional_ fallthrough from Case 0b above
   if (offset == 0) {
      fileinfo->cluster = fileinfo->firstcluster;
      fileinfo->pointer = 0;
      return;      // larwe 9/16/06 +1 bugfix
   }
   // Case 2 - Seeking backwards. Need to reset and seek forwards
   else if (offset < fileinfo->pointer) {
      fileinfo->cluster = fileinfo->firstcluster;
      fileinfo->pointer = 0;
      // NOTE NO RETURN HERE!
   }

   // Case 3 - Seeking forwards
   // Note _intentional_ fallthrough from Case 2 above

   // Case 3a - Seek size does not cross cluster boundary - 
   // very simple case
   // larwe 9/16/06 changed .rem to .quot in both div calls, bugfix
   if (div(fileinfo->pointer, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot ==
     div(fileinfo->pointer + offset, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot) {
      fileinfo->pointer = offset;
   }
   // Case 3b - Seeking across cluster boundary(ies)
   else {
      // round file pointer down to cluster boundary
      fileinfo->pointer = div(fileinfo->pointer, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot *
        fileinfo->volinfo->secperclus * SECTOR_SIZE;

      // seek by clusters
      // larwe 9/30/06 bugfix changed .rem to .quot in both div calls
#if APPLY_PATCHES
      // canny/reza 5/7  added endcluster related code
      endcluster = div(offset, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot;
      while (div(fileinfo->pointer, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot !=endcluster) {
#else
      while (div(fileinfo->pointer, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot !=
        div(fileinfo->pointer + offset, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot) {
#endif
         fileinfo->cluster = DOSFS_GetFAT(fileinfo->volinfo, scratch, &tempint, fileinfo->cluster);
         // Abort if there was an error
         if (fileinfo->cluster == 0x0ffffff7) {
            fileinfo->pointer = 0;
            fileinfo->cluster = fileinfo->firstcluster;
            return;
         }
         fileinfo->pointer += SECTOR_SIZE * fileinfo->volinfo->secperclus;
      }

      // since we know the cluster is right, we have no more work to do
      fileinfo->pointer = offset;
   }
}

/*
   Delete a file
   scratch must point to a sector-sized buffer
*/
uint32_t DOSFS_UnlinkFile(PVOLINFO volinfo, uint8_t *path, uint8_t *scratch)
{
   PDIRENT de = (PDIRENT) scratch;
   FILEINFO fi;
   uint32_t cache = 0;
   uint32_t tempclus;

   // DOSFS_OpenFile gives us all the information we need to delete it
   if (DOSFS_OK != DOSFS_OpenFile(volinfo, path, DOSFS_READ, scratch, &fi))
      return DOSFS_NOTFOUND;

   // First, read the directory sector and delete that entry
   if (DOSFS_ReadSector(volinfo->unit, scratch, fi.dirsector, 1))
      return DOSFS_ERRMISC;
   ((PDIRENT) scratch)[fi.diroffset].name[0] = 0xe5;
   if (DOSFS_WriteSector(volinfo->unit, scratch, fi.dirsector, 1))
      return DOSFS_ERRMISC;

   // Now follow the cluster chain to free the file space
   while (!((volinfo->filesystem == FAT12 && fi.firstcluster >= 0x0ff7) ||
     (volinfo->filesystem == FAT16 && fi.firstcluster >= 0xfff7) ||
     (volinfo->filesystem == FAT32 && fi.firstcluster >= 0x0ffffff7))) {
      tempclus = fi.firstcluster;

      fi.firstcluster = DOSFS_GetFAT(volinfo, scratch, &cache, fi.firstcluster);
      DOSFS_SetFAT(volinfo, scratch, &cache, tempclus, 0);

   }
   return DOSFS_OK;
}


/*
   Write an open file
   You must supply a prepopulated FILEINFO as provided by DOSFS_OpenFile, and a
   pointer to a SECTOR_SIZE scratch buffer.
   This function updates the successcount field with the number of bytes actually written.
*/
uint32_t DOSFS_WriteFile(PFILEINFO fileinfo, uint8_t *scratch, uint8_t *buffer, uint32_t *successcount, uint32_t len)
{
   uint32_t remain;
   uint32_t result = DOSFS_OK;
   uint32_t sector;
   uint32_t byteswritten;

   // Don't allow writes to a file that's open as readonly
   if (!(fileinfo->mode & DOSFS_WRITE))
      return DOSFS_ERRMISC;

   remain = len;
   *successcount = 0;

   while (remain && result == DOSFS_OK) {
      // This is a bit complicated. The sector we want to read is addressed at a cluster
      // granularity by the fileinfo->cluster member. The file pointer tells us how many
      // extra sectors to add to that number.
      sector = fileinfo->volinfo->dataarea +
        ((fileinfo->cluster - 2) * fileinfo->volinfo->secperclus) +
        div(div(fileinfo->pointer,fileinfo->volinfo->secperclus * SECTOR_SIZE).rem, SECTOR_SIZE).quot;

      // Case 1 - File pointer is not on a sector boundary
      if (div(fileinfo->pointer, SECTOR_SIZE).rem) {
         uint16_t tempsize;

         // We always have to go through scratch in this case
         result = DOSFS_ReadSector(fileinfo->volinfo->unit, scratch, sector, 1);

         // This is the number of bytes that we don't want to molest in the
         // scratch sector just read.
         tempsize = div(fileinfo->pointer, SECTOR_SIZE).rem;
               
         // Case 1A - We are writing the entire remainder of the sector. After
         // this point, all passes through the read loop will be aligned on a
         // sector boundary, which allows us to go through the optimal path
         // 2A below.
            if (remain >= SECTOR_SIZE - tempsize) {
            memcpy(scratch + tempsize, buffer, SECTOR_SIZE - tempsize);
            if (!result) {
               result = DOSFS_WriteSector(fileinfo->volinfo->unit, scratch, sector, 1);
            }
            byteswritten = SECTOR_SIZE - tempsize;
            buffer += SECTOR_SIZE - tempsize;
            fileinfo->pointer += SECTOR_SIZE - tempsize;
            if (fileinfo->filelen < fileinfo->pointer) {
               fileinfo->filelen = fileinfo->pointer;
            }
            remain -= SECTOR_SIZE - tempsize;
         }
         // Case 1B - This concludes the file write operation
         else {
            memcpy(scratch + tempsize, buffer, remain);
            if (!result) {
               result = DOSFS_WriteSector(fileinfo->volinfo->unit, scratch, sector, 1);
            }
            buffer += remain;
            fileinfo->pointer += remain;
            if (fileinfo->filelen < fileinfo->pointer) {
               fileinfo->filelen = fileinfo->pointer;
            }
            byteswritten = remain;
            remain = 0;
         }
      } // case 1
      // Case 2 - File pointer is on sector boundary
      else {
         // Case 2A - We have at least one more full sector to write and don't have
         // to go through the scratch buffer. You could insert optimizations here to
         // write multiple sectors at a time, if you were thus inclined. Refer to
         // similar notes in DOSFS_ReadFile.
         if (remain >= SECTOR_SIZE) {
            result = DOSFS_WriteSector(fileinfo->volinfo->unit, buffer, sector, 1);
            remain -= SECTOR_SIZE;
            buffer += SECTOR_SIZE;
            fileinfo->pointer += SECTOR_SIZE;
            if (fileinfo->filelen < fileinfo->pointer) {
               fileinfo->filelen = fileinfo->pointer;
            }
            byteswritten = SECTOR_SIZE;
         }
         // Case 2B - We are only writing a partial sector and potentially need to
         // go through the scratch buffer.
         else {
            // If the current file pointer is not yet at or beyond the file
            // length, we are writing somewhere in the middle of the file and
            // need to load the original sector to do a read-modify-write.
            if (fileinfo->pointer < fileinfo->filelen) {
               result = DOSFS_ReadSector(fileinfo->volinfo->unit, scratch, sector, 1);
               if (!result) {
                  memcpy(scratch, buffer, remain);
                  result = DOSFS_WriteSector(fileinfo->volinfo->unit, scratch, sector, 1);
               }
            }
            else {
               result = DOSFS_WriteSector(fileinfo->volinfo->unit, buffer, sector, 1);
            }

            buffer += remain;
            fileinfo->pointer += remain;
            if (fileinfo->filelen < fileinfo->pointer) {
               fileinfo->filelen = fileinfo->pointer;
            }
            byteswritten = remain;
            remain = 0;
         }
      }

      *successcount += byteswritten;

      // check to see if we stepped over a cluster boundary
      if (div(fileinfo->pointer - byteswritten, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot !=
        div(fileinfo->pointer, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot) {
           uint32_t lastcluster;

           // We've transgressed into another cluster. If we were already at EOF,
           // we need to allocate a new cluster.
         // An act of minor evil - we use byteswritten as a scratch integer, knowing
         // that its value is not used after updating *successcount above
         byteswritten = 0;

         lastcluster = fileinfo->cluster;
         fileinfo->cluster = DOSFS_GetFAT(fileinfo->volinfo, scratch, &byteswritten, fileinfo->cluster);

         // Allocate a new cluster?
         if (((fileinfo->volinfo->filesystem == FAT12) && (fileinfo->cluster >= 0xff8)) ||
           ((fileinfo->volinfo->filesystem == FAT16) && (fileinfo->cluster >= 0xfff8)) ||
           ((fileinfo->volinfo->filesystem == FAT32) && (fileinfo->cluster >= 0x0ffffff8))) {
              uint32_t tempclus;

            tempclus = DOSFS_GetFreeFAT(fileinfo->volinfo, scratch);
            byteswritten = 0; // invalidate cache
            if (tempclus == 0x0ffffff7)
               return DOSFS_ERRMISC;

            // Link new cluster onto file
            DOSFS_SetFAT(fileinfo->volinfo, scratch, &byteswritten, lastcluster, tempclus);
            fileinfo->cluster = tempclus;

            // Mark newly allocated cluster as end of chain         
            switch(fileinfo->volinfo->filesystem) {
               case FAT12:      tempclus = 0xff8;   break;
               case FAT16:      tempclus = 0xfff8;   break;
               case FAT32:      tempclus = 0x0ffffff8;   break;
               default:      return DOSFS_ERRMISC;
            }
            DOSFS_SetFAT(fileinfo->volinfo, scratch, &byteswritten, fileinfo->cluster, tempclus);

            result = DOSFS_OK;
         }
         // No else clause is required.
      }
   }
   
   // Update directory entry
      if (DOSFS_ReadSector(fileinfo->volinfo->unit, scratch, fileinfo->dirsector, 1))
         return DOSFS_ERRMISC;
      ((PDIRENT) scratch)[fileinfo->diroffset].filesize_0 = fileinfo->filelen & 0xff;
      ((PDIRENT) scratch)[fileinfo->diroffset].filesize_1 = (fileinfo->filelen & 0xff00) >> 8;
      ((PDIRENT) scratch)[fileinfo->diroffset].filesize_2 = (fileinfo->filelen & 0xff0000) >> 16;
      ((PDIRENT) scratch)[fileinfo->diroffset].filesize_3 = (fileinfo->filelen & 0xff000000) >> 24;
      if (DOSFS_WriteSector(fileinfo->volinfo->unit, scratch, fileinfo->dirsector, 1))
         return DOSFS_ERRMISC;
   return result;
}


int main() {

   uint8_t sector[SECTOR_SIZE], sector2[SECTOR_SIZE];
   uint32_t pstart, psize, i, j, count;
   uint8_t pactive, ptype;
   VOLINFO vi;
   DIRINFO di;
   DIRENT de;
   uint32_t cache;
   FILEINFO fi;
   uint8_t *p;
 
   t_printf("DOSFS Test Program\n");
   press_key_to_continue();

   // Obtain pointer to first partition on first (only) unit
   pstart = DOSFS_GetPtnStart(0, sector, 0, &pactive, &ptype, &psize);
   if (pstart == 0xffffffff) {
      t_printf("Cannot find first partition - is an SD card inserted?\n");
      return -1;
   }

   t_printf("Partition 0 start sector 0x%X active %X type %X size %X\n", pstart, pactive, ptype, psize);

   if (DOSFS_GetVolInfo(0, sector, pstart, &vi)) {
      t_printf("Error getting volume information\n");
      return -1;
   }

#ifdef INFO_TEST  
//------------------------------------------------------------
// Information Test
   t_printf("\nInformation test\n");
   press_key_to_continue();

   t_printf("Volume label '%s'\n", vi.label);
   t_printf("%d sector/s per cluster, %d reserved sector/s, volume total %d sectors.\n", vi.secperclus, vi.reservedsecs, vi.numsecs);
   t_printf("%d sectors per FAT, first FAT at sector #%d, root dir at #%d.\n",vi.secperfat,vi.fat1,vi.rootdir);
   t_printf("(For FAT32, the root dir is a CLUSTER number, FAT12/16 it is a SECTOR number)\n");
   t_printf("%d root dir entries, data area commences at sector #%d.\n",vi.rootentries,vi.dataarea);
   t_printf("%u clusters (%u bytes) in data area, filesystem is ", vi.numclusters, vi.numclusters * vi.secperclus * SECTOR_SIZE);
   if (vi.filesystem == FAT12)
      t_printf("FAT12.\n");
   else if (vi.filesystem == FAT16)
      t_printf("FAT16.\n");
   else if (vi.filesystem == FAT32)
      t_printf("FAT32.\n");
   else
      t_printf("[unknown]\n");

#endif

#ifdef WRITE_TEST   
//------------------------------------------------------------
// File write test
   t_printf("\nFile Write test\n");
   press_key_to_continue();

   if (DOSFS_OpenFile(&vi, (uint8_t *)RW_FILE, DOSFS_WRITE, sector, &fi)) {
      t_printf("Error opening file\n");
   }
   else {
      for (i=0;i<SECTORS_TO_WRITE;i++) {
         memset(sector2, (128+i)%256, SECTOR_SIZE);
         DOSFS_WriteFile(&fi, sector, sector2, &cache, SECTOR_SIZE/2);
         memset(sector2+256, (255-i)%256, SECTOR_SIZE/2);
         DOSFS_WriteFile(&fi, sector, sector2+256, &cache, SECTOR_SIZE/2);
         t_printf("sector %d\n",i);
      }
      memcpy(sector2, "test string at the end...\0", 26);
      DOSFS_WriteFile(&fi, sector, sector2, &cache, 26);
   }

#endif

#ifdef READ_TEST   

//------------------------------------------------------------
// File read test
   t_printf("\nFile Read test\n");

   if (DOSFS_OpenFile(&vi, (uint8_t *)RW_FILE, DOSFS_READ, sector, &fi)) {
      t_printf("Error opening file\n");
   }
   else { 
      t_printf("File opened, length = %d\n", fi.filelen);
      p = (void *) malloc(SECTOR_SIZE);
      if (p == NULL) {
         t_printf("Error allocating buffer\n");
      }
      else {
         for (i = 0; i < SECTORS_TO_WRITE; i++) {
            memset(p, 0xaa, SECTOR_SIZE);
            DOSFS_ReadFile(&fi, sector, p, &count, SECTOR_SIZE);
            for (j = 0; j < 256; j++) {
                if (p[j] != (128+i)%256) {
                   printf("error in read at %d - expected %d, got %d\n",j , (128+i)%256, (p[j]));
                   press_key_to_continue();
                }
            }
            for (j = 256; j < SECTOR_SIZE; j++) {
                if (p[j] != (255-i)%256) {
                   printf("error in read at %d - expected %d, got %d\n", j , (255-i)%256, (p[j]));
                   press_key_to_continue();
                }
            }
         }
         memset(p, 0xaa, SECTOR_SIZE);
         DOSFS_ReadFile(&fi, sector, p, &count, fi.filelen - SECTORS_TO_WRITE*SECTOR_SIZE);
         t_printf("read complete %d bytes (expected %d) pointer %d\n", count, fi.filelen - SECTORS_TO_WRITE*SECTOR_SIZE, fi.pointer);
         if (strncmp((const char *)p, "test string at the end...\0", 26) == 0) {
            printf("Test string at end of file is ok.\n");
         }
         else {
            printf("Test string at end of file INCORRECT.\n");
            for (i = 0; i < 26; i++) {
               printf("char = %2X\n", p[i]);
            }
         }
      }
   }

#endif
   
#ifdef RENAME_TEST
//------------------------------------------------------------
// Simple rename test
   t_printf("\nRename test\n");
   press_key_to_continue();

   i = DOSFS_RenameFile(&vi, (unsigned char *)RENAME_FILE, (unsigned char *)"ROSS.TXT",sector);
   t_printf("Rename result = %d\n", i);
   i = DOSFS_RenameFile(&vi, (unsigned char *)"ROSS.TXT", (unsigned char *)RENAME_FILE,sector);
   t_printf("Rename result = %d\n", i);

#endif
   
#ifdef ENUMERATION_TEST   

//------------------------------------------------------------
// Directory enumeration test
   t_printf("\nDirectory Enumeration test\n");
   press_key_to_continue();

   di.scratch = sector;
   if (DOSFS_OpenDir(&vi, (uint8_t *)"", &di)) {
      t_printf("Error opening root directory\n");
   }
   else {
      t_printf("\nRoot directory:\n");
      while (!DOSFS_GetNext(&vi, &di, &de)) {
         if (de.name[0] != 0)
            t_printf("file: %s\n", filename(de.name));
      }
   }
      t_printf("\nDirectory %s:\n", ENUMERATION_DIR);
   if (DOSFS_OpenDir(&vi, (uint8_t *)ENUMERATION_DIR, &di)) {
      t_printf("Error opening subdirectory\n");
   }
   else {
      while (!DOSFS_GetNext(&vi, &di, &de)) {
         if (de.name[0])
            t_printf("file: %s\n", filename(de.name));
      }
   }

#endif

#ifdef UNLINK_TEST
//------------------------------------------------------------
// Unlink test
   t_printf("\nUnlink test\n");
   press_key_to_continue();

   cache = 0;
   //t_printf("*** FAT BEFORE ***\n");
   //for (i=0;i<vi.numclusters;i++) {
      //t_printf("entry %x, %X\n", i, DOSFS_GetFAT(&vi, sector, &cache, i));
   //}
   if (DOSFS_UnlinkFile(&vi, (uint8_t *)UNLINK_FILE, sector)) {
      t_printf("Error unlinking file\n");
   }
   //t_printf("*** FAT AFTER ***\n");
   //for (i=0;i<vi.numclusters;i++) {
      //t_printf("entry %x, %X\n", i, DOSFS_GetFAT(&vi, sector, &cache, i));
   //}
   di.scratch = sector;
   if (DOSFS_OpenDir(&vi, (uint8_t *)"", &di)) {
      t_printf("Error opening root directory\n");
   }
   else {
      while (!DOSFS_GetNext(&vi, &di, &de)) {
         if (de.name[0] != 0)
            t_printf("file: %s\n", filename(de.name));
      }
   }
#endif

   t_printf("\nAll tests done!\n");

   while(1) ;

   return 0;
}
