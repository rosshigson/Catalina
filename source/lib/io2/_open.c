#include <ff.h>
#include <stdio.h>
#include <hmi.h>
#include <stdlib.h>

#ifdef __CATALINA_HUB_MALLOC

#include <hmalloc.h>

#define malloc  hub_malloc
#define calloc  hub_calloc
#define realloc hub_realloc
#define free    hub_free

#endif

#if STATIC_FILE_BUFFERS
extern FIL __fdtab[FOPEN_MAX];
#else
extern FIL* __fdtab[FOPEN_MAX];
#endif

extern char __vol[];
extern FATFS  __fs;

#if __CATALINA_DEBUG_FS
extern void catalina_fs_press_to_continue();
extern void dump_fileinfo(FIL* f);
#endif

#if __CATALINA_SDCARD_IO

int _open(const char *path, int flags) {
   int i;
   FIL *fd;
   uint8_t mode = 0;

#if __CATALINA_DEBUG_FS
   t_string(1, "_open\n");
   catalina_fs_press_to_continue();
#endif
   if (flags != 1) mode |= FA_READ;
   if (flags != 0) mode |= FA_WRITE|FA_OPEN_ALWAYS;

   if (__fs.fs_type == 0) {
      if (f_mount (&__fs, __vol, 1) != FR_OK) {
         return -1;
      }
   }

#if STATIC_FILE_BUFFERS
	for (i = 3; __fdtab[i].obj != NULL; i++) { // 0, 1 & 2 = stdin, stdout & stderr
		if ( i >= FOPEN_MAX - 1 ) {
			return -1;
      }
   }
	fd = &__fdtab[i];
#else
	for (i = 3; __fdtab[i] != NULL; i++) { // 0, 1 & 2 = stdin, stdout & stderr
		if ( i >= FOPEN_MAX - 1 ) {
			return -1;
      }
   }
	if (( fd = (FIL *)malloc(sizeof(FIL))) == NULL ) {
		return -1;
   }
#endif

#if __CATALINA_DEBUG_FS
   t_string(1, "f_open fd is ");
   t_hex(1,(unsigned long)fd);
   t_string(1, ", path is '");
   t_string(1, path);
   t_string(1, "', mode is ");
   t_hex(1,(unsigned long)mode);
   t_string(1, "\n");
   catalina_fs_press_to_continue();
#endif
   if (f_open(fd, (const TCHAR *)path, mode) != FR_OK) {
#if __CATALINA_DEBUG_FS
      t_string(1, "f_open failed\n");
      catalina_fs_press_to_continue();
#endif
#if STATIC_FILE_BUFFERS
      return -1;
   }
#else      
      free((void *)fd);
      return -1;
   }
   __fdtab[i] = fd;
#endif   
#if __CATALINA_DEBUG_FS
	 t_string(1, "_open, i = ");
   t_integer(1,i);
	 t_string(1, "\n");
#if STATIC_FILE_BUFFERS   
   dump_fileinfo(&__fdtab[i]);
#else   
   dump_fileinfo(__fdtab[i]);
#endif   
   catalina_fs_press_to_continue();
#endif
   return i;
}  

#else

int _open(const char *path, int flags) {
	return -1;
} 

#endif
