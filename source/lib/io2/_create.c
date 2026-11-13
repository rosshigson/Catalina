#include <ff.h>
#include <hmi.h>

extern int _open(const char *path, int flags);
extern int _unlink(const char *path);

#if __CATALINA_DEBUG_FS
extern void catalina_fs_press_to_continue();
#endif

#if __CATALINA_SDCARD_IO

/*
 *  Note - _create() is the same as _creat 
 */ 

int _create(const char *path, int mode) {
#if __CATALINA_DEBUG_FS 
      t_string(1, "_create\n");
      catalina_fs_press_to_continue();
#endif
   _unlink(path);
   return _open(path, mode);
}


#else

int _create(const char *path, int mode) {
	return -1;
}

#endif
