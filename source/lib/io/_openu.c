#include <fs.h>

#if __CATALINA_SDCARD_IO

int _open_unmanaged(const char *path, int flags, PFILEINFO fd) {
   int i;
   uint8_t mode = 0;
	uint8_t scratch[SECTOR_SIZE];

#if __CATALINA_DEBUG_FS
   t_string(1, "_open_unmanaged\n");
   catalina_fs_press_to_continue();
#endif
   if (flags != 1) mode |= DFS_READ;
   if (flags != 0) mode |= DFS_WRITE;

   if (__pstart == -1) {
      if (_mount (0, 0) == -1) {
         return -1;
      }
   }

#if STATIC_FILE_BUFFERS
	for (i = 3; __fdtab[i].mode != 0; i++) { // 0, 1 & 2 = stdin, stdout & stderr
		if ( i >= FOPEN_MAX - 1 ) {
			return -1;
      }
   }
#else
   for (i = 3; __fdtab[i] != NULL ; i++) { // 0, 1 & 2 = stdin, stdout & stderr
		if ( i >= FOPEN_MAX - 1 ) {
			return -1;
      }
   }
   if (fd == NULL ) {
		return -1;
   }
#endif

#if __CATALINA_DEBUG_FS
   t_string(1, "DFS_OpenFile fd is ");
   t_hex(1,(unsigned long)fd);
   catalina_fs_press_to_continue();
#endif
#if STATIC_FILE_BUFFERS
   if (DFS_OpenFile(&__vi, (uint8_t *)path, mode, scratch, &__fdtab[i]) != DFS_OK) {
#else      
   if (DFS_OpenFile(&__vi, (uint8_t *)path, mode, scratch, fd) != DFS_OK) {
#endif      
#if __CATALINA_DEBUG_FS
      t_string(1, "DFS_OpenFile failed\n");
      catalina_fs_press_to_continue();
#endif
      return -1;
   }
#if !STATIC_FILE_BUFFERS   
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

int _open_unmanaged(const char *path, int flags, PFILEINFO fd) {
	return -1;
} 

#endif
