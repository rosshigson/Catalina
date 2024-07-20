#include <fs.h>

#if __CATALINA_SDCARD_IO

int _create_unmanaged(const char *path, int mode, PFILEINFO fd) {
#if __CATALINA_DEBUG_FS 
      t_string(1, "_create\n");
      catalina_fs_press_to_continue();
#endif
   _unlink(path);
   return _open_unmanaged(path, mode, fd);
}


#else

int _create_unmanaged(const char *path, int mode, PFILEINFO fd) {
	return -1;
}

#endif
