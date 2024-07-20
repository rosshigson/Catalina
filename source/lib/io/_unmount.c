#include <fs.h>

#if __CATALINA_SDCARD_IO

/*
 * unmount - unmount the currently mounted sd card.
 *
 * returns 0 on success, -1 on failure (i.e. some files still open).
 *
 * Check that no files are currently open, and (if not) unmount the sd card.
 * All this really means means is that unless another sc card is explicitly 
 * mounted, partition zero of the sd card on unit zero will automatically be
 * mounted next time a file is opened.
 */
int _unmount() {
   int i;

#if __CATALINA_DEBUG_FS
   t_string(1, "_unmount\n");
   catalina_fs_press_to_continue();
#endif
   for (i = 3; i < FOPEN_MAX; i++) { // 0, 1 & 2 mean stdin, stdout & stderr
#if STATIC_FILE_BUFFERS      
      if (__fdtab[i].mode != 0) {
#else      
      if (__fdtab[i] != NULL) {
#endif         
#if __CATALINA_DEBUG_FS
		   t_string(1, "Cannot unmount a volume with files still open\n");
         catalina_fs_press_to_continue();
#endif
         return -1;
      }
   }
   __pstart = -1;
   return 0;
}

#else

int _unmount() {
   return 0;
}

#endif
