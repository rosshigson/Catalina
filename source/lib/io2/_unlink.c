#include <ff.h>
#include <hmi.h>

extern char __vol[];
extern FATFS  __fs;

#if __CATALINA_DEBUG_FS
extern void catalina_fs_press_to_continue();
#endif

#if __CATALINA_SDCARD_IO

int _unlink(const char *path) {

#if __CATALINA_DEBUG_FS
      t_string(1, "_unlink\n");
      catalina_fs_press_to_continue();
#endif
   if (__fs.fs_type == 0) {
      if (f_mount (&__fs, __vol, 1) != FR_OK) {
         return -1;
      }
   }
   if (f_unlink((const TCHAR*)path) != FR_OK) {
   	return -1;
   }
   return 0;
}

#else

int _unlink(const char *path) {
	return -1;
}

#endif
