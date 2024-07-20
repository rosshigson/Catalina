#include <fs.h>

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
#if __CATALINA_DEBUG_FS
      {
         int i;
         t_string(1, "wrote  ");
         t_integer(1, count);
         t_string(1, "bytes\n ");
         for (i = 0; i < count; i++) {
            if (isprint(buf[i])) {
               t_char(1, buf[i]);
            }
            else {
               t_char(1, '<');
               t_integer(1, buf[i]);
               t_char(1, '>');
            }
         }
      }
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
