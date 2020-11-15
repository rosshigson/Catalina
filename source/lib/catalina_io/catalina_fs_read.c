#include <catalina_fs.h>

#if __CATALINA_SDCARD_IO

int _read(int d, char *buf, int nbytes) {
   uint8_t scratch[SECTOR_SIZE];
   uint32_t count;
   int i = 0;
   int c;

   if (d == 0) { /* 0 = stdin */
      while (i < nbytes) {
         c = catalina_getc(stdin);
         if (c == -1) { /* EOF */
            break;
         }
         if (c == '\r') {
            c = '\n';
         }
         buf[i++] = c;
         if (c == '\n') {
            break;
         }
      }
      return i;
   }
   else {
#if __CATALINA_DEBUG_FS
      t_string(1, "_read\n");
      dump_fileinfo(__fdtab[d]);
      catalina_fs_press_to_continue();
#endif
#if STATIC_FILE_BUFFERS
      if (__fdtab[d].mode == 0) {
         return -1;
      }
      DFS_ReadFile(&__fdtab[d], scratch, (uint8_t *)buf, &count, (uint32_t) nbytes);
#else      
      if (__fdtab[d] == NULL) {
         return -1;
      }
      DFS_ReadFile(__fdtab[d], scratch, (uint8_t *)buf, &count, (uint32_t) nbytes);
#endif
      return (int) count;
   }
}


#else

int _read(int d, char *buf, int nbytes) {
   int i = 0;
   int c;
   if (d == 0) { /* 0 = stdin */
      while (i < nbytes) {
         c = catalina_getc(stdin);
         if (c == -1) { /* EOF */
            break;
         }
         if (c == '\r') {
            c = '\n';
         }
         buf[i++] = c;
         if (c == '\n') {
            break;
         }
      }
   }
   return i;
}

#endif
