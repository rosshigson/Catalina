#include <fs.h>

#if __CATALINA_SDCARD_IO

int _create_directory(const char *path) {
   int i;
	uint8_t scratch[SECTOR_SIZE];
   FILEINFO fi;

#if __CATALINA_DEBUG_FS
   t_string(1, "_create_directory\n");
   catalina_fs_press_to_continue();
#endif
   if (__pstart == -1) {
      if (_mount (0, 0) == -1) {
         return -1;
      }
   }

   if (DFS_OpenFile(&__vi, (uint8_t *)path, DFS_CREATEDIR, scratch, &fi) != DFS_OK) {
#if __CATALINA_DEBUG_FS
      t_string(1, "DFS_OpenFile failed\n");
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
