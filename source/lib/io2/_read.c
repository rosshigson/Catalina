#include <ff.h>
#include <stdio.h>
#include <hmi.h>

#if STATIC_FILE_BUFFERS
extern FIL __fdtab[FOPEN_MAX];
#else
extern FIL* __fdtab[FOPEN_MAX];
#endif

extern char __vol[];
extern FATFS  __fs;
extern int __valid(FIL* f);

extern int catalina_getc(FILE *stream);

#if __CATALINA_DEBUG_FS
extern void catalina_fs_press_to_continue();
extern void dump_fileinfo(FIL* f);
#endif

#if __CATALINA_SDCARD_IO

int _read(int d, char *buf, int nbytes) {
   UINT count;
   FRESULT result;
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
   if (!__valid(&__fdtab[d])) {
#if __CATALINA_DEBUG_FS
         t_string(1, "_read - invalid file\n");
#endif
         return -1;
      }
      result = f_read(&__fdtab[d], (void *)buf, (UINT)nbytes, &count);
#else      
   if (!__valid(__fdtab[d])) {
#if __CATALINA_DEBUG_FS
         t_string(1, "_read - invalid file\n");
#endif
         return -1;
      }
      result = f_read(__fdtab[d], (void *)buf, (UINT) nbytes, &count);
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
      if (result == FR_OK) {
         return (int) count;
      }
      else {
         return -1;
      }
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
