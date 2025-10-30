#include <stdint.h>
#include <stdlib.h>
#include <dirent.h>
#include <string.h>

struct TAGDIR
{
   VOLINFO vi;
   DIRINFO di;
   DIRENT  de;
   uint8_t scratch[SECTOR_SIZE];
   uint8_t scratch2[SECTOR_SIZE];
   struct  dirent dirent;
};


/*
 * realpath
 *     If there is no error, realpath() returns a pointer to the
 *     resolved_path. Otherwise, it returns NULL, the contents of 
 *     the array resolved_path are undefined.
 */
char* realpath(const char* path, char* resolved_path) {
    char *p2 = strncat(resolved_path, "/", MAX_PATH);
    p2 = strncat(resolved_path, path, MAX_PATH-1);
    while (*p2)
    {
        if (*p2 == '\\')
            *p2 = '/';
        p2++;
    }
    return resolved_path;
}

DIR* opendir(const char* name) {
   int pstart = 0;
   uint32_t psize;
   uint8_t pactive, ptype;
   char path[MAX_PATH + 1];
   int plen;

   DIR* p;
  
   // allocate a DIR structure
   p = calloc(1, sizeof *p);
   if (p == NULL) {
      // cannot allocate DIR structure
      return NULL;
   }
   // initialize the file system     
   pstart = DFS_GetPtnStart(0, p->scratch, 0, &pactive, &ptype, &psize);
   if (DFS_GetVolInfo(0, p->scratch, pstart, &p->vi) != DFS_OK) {
      // cannot get volume info
      return NULL;
   }
   else {
      strncpy(path, name, MAX_PATH);
      plen = strlen(path);
      // remove trailing separator from path (if there is one)
      if ((plen > 0) && (path[plen - 1] == DIR_SEPARATOR)) {
         path[plen - 1] = 0;
      }

      p->di.scratch = p->scratch2;
      if (DFS_OpenDir(&p->vi, (uint8_t *)path, &p->di) != DFS_OK) {
         // cannot open directory
         free(p);
         return NULL;
      }
   }
   return p;
}

int closedir(DIR* dirp) {
   free(dirp);
   return 0;
}

struct dirent* readdir(DIR* dirp) {
   int i, j;

   while (DFS_GetNext(&dirp->vi, &dirp->di, &dirp->de) == DFS_OK) {
       //printf("name[0]=%d\n", dirp->de.name[0]);
       if ((dirp->de.name[0] != 0) 
       && !(dirp->de.attr & ATTR_VOLUME_ID)
       && !(dirp->de.attr & ATTR_HIDDEN)) {
          //clear
          memset(&dirp->dirent, 0, sizeof(dirp->dirent));
          //printf("attr=%d\n", dirp->de.attr);
          // check for directory entry
          if (dirp->de.attr & ATTR_DIRECTORY) {
             dirp->dirent.d_type |= DT_DIR;
          }
          // decode Nnnnnnnneee filename
          j = 0;
          for (i = 0; i < 8; i++) {
            if ((dirp->de.name[i] == 0) || (dirp->de.name[i] == ' ')) {
               break;
            }
            dirp->dirent.d_name[j++] = dirp->de.name[i];
          }
          for (i = 8; i < 11; i++) {
            if ((dirp->de.name[i] == 0) || (dirp->de.name[i] == ' ')) {
               break;
            }
            if (i == 8) {
               dirp->dirent.d_name[j++] = '.';
            }
            dirp->dirent.d_name[j++] = dirp->de.name[i];
          }
          dirp->dirent.d_name[j] = 0;
          return &dirp->dirent;
       }
   }
   return NULL;
}


