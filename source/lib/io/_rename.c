#include <fs.h>

#if __CATALINA_SDCARD_IO

int _rename(const char *path, const char *newname) {
	uint8_t scratch[SECTOR_SIZE];
   FILEINFO fi;

#if __CATALINA_DEBUG_FS
      t_string(1, "_rename\n");
      catalina_fs_press_to_continue();
#endif
   if (__pstart == -1) {
      if (_mount (0, 0) == -1) {
         return -1;
      }
   }
   if (DFS_RenameFile(&__vi, (unsigned char *)path, (unsigned char *)newname, scratch) != DFS_OK) {
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
