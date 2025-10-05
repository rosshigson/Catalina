#include <fs.h>

#if __CATALINA_SDCARD_IO

/*
 * _mkleaf - make a leaf directory (assume all intermediate directories exist)
 */
static unsigned long _mkleaf(const char *path) {
   uint8_t scratch[SECTOR_SIZE];
   FILEINFO fi;

   // see if the path exists already
   if (DFS_OpenFile(&__vi, (uint8_t *)path, DFS_OPENDIR, scratch, &fi) != DFS_NOTFOUND) {
      // it already exists (as a file or directory) so return an error
      return DFS_ERRNAME;
   }
   // if not, create it as a directory
   return DFS_OpenFile(&__vi, (uint8_t *)path, DFS_CREATEDIR, scratch, &fi);
}


/*
 * _mkpath - make a directory path, recursing as necessary if recurse == 1
 */
static unsigned int _mkpath(const char *path, int recurse) {
   int i, len;
   char tmp_path[MAX_PATH + 1];
   FILEINFO fi;
   uint8_t scratch[SECTOR_SIZE];
   unsigned int error;

   // mount file system if not already mounted
   if (__pstart == -1) {
      if (_mount (0, 0) == -1) {
         return -1;
      }
   }

   if (!recurse) {
      // just create final leaf directory (intermediates must all exist)
      error = _mkleaf(path);
      if ((error != DFS_OK) && (error != DFS_ERRNAME)) {
         return error;
      }
      return DFS_OK;
   }

   tmp_path[0] = 0;
   i = 0;
   len = strlen(path);

   while (i < len) {

      while ((i < len) && (path[i] != DIR_SEPARATOR)) {
         tmp_path[i] = path[i];
         i++;
      }
      tmp_path[i] = 0;

      // see if directory exists already
      if (DFS_OpenFile(&__vi, (uint8_t *)tmp_path, DFS_OPENDIR, scratch, &fi) == DFS_NOTFOUND) {
         // no, so create it
         error = _mkleaf(tmp_path);
         if ((error != DFS_OK) && (error != DFS_ERRNAME)) {
            return error;
         }
      }
      else {
         // not finished yet - try next level deeper
         tmp_path[i] = path[i];
         i++;
      }
   }
   return DFS_OK;
}

/*
 * _mkdir - make a leaf directory (no recursion)
 *          NOTE: mode not currently used
 */
int _mkdir(const char *pathname, mode_t mode) {
   return _mkpath(pathname, 0);
}

/*
 * _mkdirr - make a directory, recursing as necessary
 *          NOTE: mode not currently used
 */
int _mkdirr(const char *pathname, mode_t mode) {
   return _mkpath(pathname, 1);
}

#else

int _mkdir(const char *pathname, mode_t mode) {
	return -1;
} 

int _mkdirr(const char *pathname, mode_t mode) {
	return -1;
} 

#endif
