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

int _rename(const char *path, const char *newname) {

#if __CATALINA_DEBUG_FS
      t_string(1, "_rename\n");
      catalina_fs_press_to_continue();
#endif
   if (__fs.fs_type == 0) {
      if (f_mount (&__fs, __vol, 1) != FR_OK) {
         return -1;
      }
   }
   if (f_rename((const TCHAR*)path, (const TCHAR*)newname) != FR_OK) {
      return -1;
   }
   else {
      return 0;
   }

}


#else

int _rename(const char *path, const char *newname) {
	return -1;
}

#endif
