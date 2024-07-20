#include <fs.h>

#if __CATALINA_SDCARD_IO

int _close(int d) {
#if __CATALINA_DEBUG_FS
	t_string(1, "_close, fd = ");
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
   free ((void *)__fdtab[d]);
   __fdtab[d] = NULL;
#endif         
   return 0;
}    


#else

int _close(int d) {
   return -1;
}

#endif
