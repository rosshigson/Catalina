#include <ff.h>
#include <stdio.h>
#include <hmi.h>
#include <string.h>
#include <sys/types.h>

#if STATIC_FILE_BUFFERS
extern FIL __fdtab[FOPEN_MAX];
#else
extern FIL* __fdtab[FOPEN_MAX];
#endif

extern char __vol[];
extern FATFS  __fs;

#define MAX_PATH        1024  // ???
#define DIR_SEPARATOR   '/'   // character separating directory components

#if __CATALINA_DEBUG_FS
extern void catalina_fs_press_to_continue();
#endif

#if __CATALINA_SDCARD_IO

/*
 * _mkleaf - make a leaf directory (assume all intermediate directories exist)
 */
static unsigned long _mkleaf(const char *path) {
   DIR dp;

   // see if the path exists already
   if (f_opendir(&dp, (const TCHAR*)path) == FR_OK) {
      // it already exists so return an error
      f_closedir(&dp);
      return FR_EXIST;
   }
   // if not, create it as a directory
   return (f_mkdir((const TCHAR*)path) == FR_OK);
}


/*
 * _mkpath - make a directory path, recursing as necessary if recurse == 1
 */
static unsigned int _mkpath(const char *path, int recurse) {
   int i, len;
   char tmp_path[MAX_PATH + 1];
   DIR dp;
   unsigned int error;

   if (__fs.fs_type == 0) {
      if (f_mount (&__fs, __vol, 1) != FR_OK) {
#if __CATALINA_DEBUG_FS
         t_string(1, "f_mount failed\n");
         catalina_fs_press_to_continue();
#endif
         return -1;
      }
   }
   if (!recurse) {
      // just create final leaf directory (intermediates must all exist)
      error = _mkleaf(path);
      if (error != FR_OK) {
         return error;
      }
      return FR_OK;
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
      if (f_opendir(&dp, (const TCHAR*)tmp_path) != FR_OK) {
         // no, so create it
         error = _mkleaf(tmp_path);
         if (error != FR_OK) {
            return error;
         }
      }
      else {
         f_closedir(&dp);
         // not finished yet - try next level deeper
         tmp_path[i] = path[i];
         i++;
      }
   }
   return FR_OK;
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
