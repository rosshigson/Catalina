#include <fs.h>

#if __CATALINA_SDCARD_IO

int _unlink(const char *path) {
	uint8_t scratch[SECTOR_SIZE];

#if __CATALINA_DEBUG_FS
      t_string(1, "_unlink\n");
      catalina_fs_press_to_continue();
#endif
   if (__pstart == -1) {
      if (_mount (0, 0) == -1) {
         return -1;
      }
   }
   if (DFS_UnlinkFile(&__vi, (uint8_t *)path, scratch) != DFS_OK) {
   	return -1;
   }
   return 0;
}

#else

int _unlink(const char *path) {
	return -1;
}

#endif
