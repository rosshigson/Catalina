#include <fs.h>

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
	uint8_t sector[SECTOR_SIZE];
	uint32_t psize, i;
	uint8_t pactive, ptype;

#if __CATALINA_DEBUG_FS
   t_string(1, "_mount\n");
   catalina_fs_press_to_continue();
#endif
	__pstart = DFS_GetPtnStart(unit, sector, pnum, &pactive, &ptype, &psize);
	if (__pstart == -1) {
#if __CATALINA_DEBUG_FS
		t_string(1, "Cannot find first partition\n");
      catalina_fs_press_to_continue();
#endif
		return -1;
	}
	if (DFS_GetVolInfo(unit, sector, __pstart, &__vi)) {
      __pstart = -1;
#if __CATALINA_DEBUG_FS
		t_string(1, "Error getting volume information\n");
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
