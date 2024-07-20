#include <fs.h>

#if __CATALINA_SDCARD_IO

int _close_unmanaged(int d) {
#if __CATALINA_DEBUG_FS
	t_string(1, "_close_unmanaged, fd = ");
   t_integer(1,d);
	t_string(1, "\n");
   catalina_fs_press_to_continue();
#endif
#if STATIC_FILE_BUFFERS      
   if (__fdtab[d].mode == 0) {
      return -1;
   }
   __fdtab[d].mode = 0;
#else      
   if (__fdtab[d] == NULL) {
      return -1;
   }
   __fdtab[d]->mode = 0;
   __fdtab[d] = NULL;
#endif         
   return 0;
}    


#else

int _close_unmanaged(int d) {
   return -1;
}

#endif
