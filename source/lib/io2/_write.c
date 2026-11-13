#include <ff.h>
#include <stdio.h>
#include <ctype.h>
#include <hmi.h>

#if STATIC_FILE_BUFFERS
extern FIL __fdtab[FOPEN_MAX];
#else
extern FIL* __fdtab[FOPEN_MAX];
#endif

extern char __vol[];
extern FATFS  __fs;
extern int __valid(FIL* f);

#if __CATALINA_DEBUG_FS
extern void catalina_fs_press_to_continue();
#endif

extern int catalina_putc(int c, FILE *stream);

#if __CATALINA_SDCARD_IO

int _write(int d, const char *buf, int nbytes) {
   UINT count;
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
      if (!__valid(&__fdtab[d])) {
#if __CATALINA_DEBUG_FS
         t_string(1, "_write - invalid file\n");
#endif
         return -1;
      }
      f_write(&__fdtab[d], (const void* )buf,(UINT) nbytes,  &count);
#else      
      if (!__valid(__fdtab[d])) {
#if __CATALINA_DEBUG_FS
         t_string(1, "_write - invalid file\n");
#endif
         return -1;
      }
      f_write(__fdtab[d], (const void* )buf, (UINT) nbytes, &count);
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
