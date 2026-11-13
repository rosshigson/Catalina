#include <ff.h>
#include <hmi.h>

extern char __vol[];
extern FATFS  __fs;

#if __CATALINA_DEBUG_FS
extern void catalina_fs_press_to_continue();
#endif

#if __CATALINA_SDCARD_IO

/*
 * _mount - mount the sd card volume.
 *
 * returns 0 on success, -1 on failure.
 *
 * The unit and pnum are normally both zero, so partition zero of the sd card 
 * with unit number zero will be mounted automatically if the sd card has not 
 * been mounted when the first file access is opened. To access another 
 * partition or unit, you must explcitly mount it before opening any files.
 */
int _mount(int unit, int pnum) {
#if __CATALINA_DEBUG_FS
   t_string(1, "_mount\n");
   catalina_fs_press_to_continue();
#endif
  __vol[0]='0' + pnum;
	if (f_mount(&__fs, __vol, 1) != FR_OK ) {
#if __CATALINA_DEBUG_FS
		t_string(1, "f_mount failed\n");
      catalina_fs_press_to_continue();
#endif
		return -1;
	}
   return 0;
}

#else

int _mount(int unit, int pnum) {
   return -1;
}

#endif
