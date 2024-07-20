#include <fs.h>

#if __CATALINA_SDCARD_IO

int _read(int d, char *buf, int nbytes) {
   uint8_t scratch[SECTOR_SIZE];
   uint32_t count;
   int i = 0;
   int c;

#if __CATALINA_DEBUG_FS
      t_string(1, "_read, d= ");
      t_integer(1, d);
      t_string(1, ", buf= ");
      t_hex(1, (unsigned long) buf);
      t_string(1, ", nbytes= ");
      t_integer(1, nbytes);
      t_char(1,'\n');
      dump_fileinfo(__fdtab[d]);
      catalina_fs_press_to_continue();
#endif
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
#if STATIC_FILE_BUFFERS
      if (__fdtab[d].mode == 0) {
#if __CATALINA_DEBUG_FS
         t_string(1, "mode == 0!!! ");
#endif
         return -1;
      }
      DFS_ReadFile(&__fdtab[d], scratch, (uint8_t *)buf, &count, (uint32_t) nbytes);
#else      
      if (__fdtab[d] == NULL) {
#if __CATALINA_DEBUG_FS
         t_string(1, "__fdtab[d] == NULL!!! ");
#endif
         return -1;
      }
      DFS_ReadFile(__fdtab[d], scratch, (uint8_t *)buf, &count, (uint32_t) nbytes);
#endif
#if __CATALINA_DEBUG_FS
      {
         int i;
         t_string(1, "read  ");
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
