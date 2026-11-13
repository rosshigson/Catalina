#include <ff.h>
#include <stdio.h>
#include <hmi.h>

#if STATIC_FILE_BUFFERS
extern FIL __fdtab[FOPEN_MAX];
#else
extern FIL* __fdtab[FOPEN_MAX];
#endif

extern char __vol[];
extern FATFS  __fs;

#if __CATALINA_DEBUG_FS
extern void catalina_fs_press_to_continue();
#endif

#if __CATALINA_SDCARD_IO

int _create_directory(const char *path) {
   int i;
   DIR di;

#if __CATALINA_DEBUG_FS
   t_string(1, "_create_directory\n");
   catalina_fs_press_to_continue();
#endif
   if (__fs.fs_type == 0) {
      if (f_mount (&__fs, __vol, 1) != FR_OK) {
#if __CATALINA_DEBUG_FS
         t_string(1, "f_mount failed\n");
         catalina_fs_press_to_continue();
#endif
         return -1;
      }
   }

   if (f_mkdir((const TCHAR* )path) != FR_OK) {
#if __CATALINA_DEBUG_FS
      t_string(1, "f_mkdir failed\n");
      catalina_fs_press_to_continue();
#endif
      return -1;
   }
   return 0;
}  

#else

int _create_directory(const char *path) {
	return -1;
} 

#endif
