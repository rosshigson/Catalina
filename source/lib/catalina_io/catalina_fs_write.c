#include <catalina_fs.h>

#if __CATALINA_SDCARD_IO

int _write(int d, const char *buf, int nbytes) {
	uint8_t scratch[SECTOR_SIZE];
   uint32_t count;
   int i = 0;
   if (d == 1) { /* 1 = stdout or 2 = stderr */
      for (i = 0; i < nbytes; i++) {
         catalina_putc(buf[i], stdout);
      }
	   return nbytes;
   }
   else if (d == 2) { /* 1 = stdout or 2 = stderr */
      for (i = 0; i < nbytes; i++) {
         catalina_putc(buf[i], stderr);
      }
	   return nbytes;
   }
   else {
#if __CATALINA_DEBUG_FS
      t_string(1, "_write\n");
      catalina_fs_press_to_continue();
#endif
#if STATIC_FILE_BUFFERS
      if (__fdtab[d].mode == 0) {
         return -1;
      }
      DFS_WriteFile(&__fdtab[d], scratch, (uint8_t *)buf, &count, (uint32_t) nbytes);
#else      
      if (__fdtab[d] == NULL) {
         return -1;
      }
      DFS_WriteFile(__fdtab[d], scratch, (uint8_t *)buf, &count, (uint32_t) nbytes);
#endif      
      return (int) count;
   }
}

#else

int _write(int d, const char *buf, int nbytes) {
   int i = 0;
   if (d == 1) { /* 1 = stdout or 2 = stderr */
      for (i = 0; i < nbytes; i++) {
         catalina_putc(buf[i], stdout);
      }
   }
   else if (d == 2) { /* 1 = stdout or 2 = stderr */
      for (i = 0; i < nbytes; i++) {
         catalina_putc(buf[i], stderr);
      }
   }
	return nbytes;
}

#endif
