#include <fs.h>

#if __CATALINA_SDCARD_IO

int _creat(const char *path, int mode) {
#if __CATALINA_DEBUG_FS 
      t_string(1, "_creat\n");
      catalina_fs_press_to_continue();
#endif
   _unlink(path);
   return _open(path, mode);
}


#else

int _creat(const char *path, int mode) {
	return -1;
}

#endif
