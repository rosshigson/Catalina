#include <stdint.h>
#include <cog.h>
#include <sd.h>
#include "dosfs.h"

#define WRITE_RETRIES 10

#define READ_RETRIES 10

#if __CATALINA_DEBUG_DOSFS

static void press_to_continue() {
   int ch;

   t_string(1, "Press any key to continue\n");
   ch = k_wait();
}
#endif

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
   press_to_continue();
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
   press_to_continue();
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

