#include <ff.h>
#include <stdio.h>
#include <hmi.h>
#include <sys\types.h>
#include <int64.h>

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

#if __CATALINA_SDCARD_IO

off_t _lseek(int d, off_t offset, int whence) {

#if __CATALINA_DEBUG_FS
   t_string(1, "_lseek\n");
   catalina_fs_press_to_continue();
#endif
#if STATIC_FILE_BUFFERS
   if (!__valid(&__fdtab[d])) {
      return -1;
   }
   if (whence == SEEK_SET) {
      f_lseek(&__fdtab[d], _uint32(offset));
   }
   else if (whence == SEEK_END) {
      f_lseek(&__fdtab[d], f_size(&__fdtab[d]);
   }
   else { // SEEK_CUR
      f_lseek(&__fdtab[d], _add64(f_tell(__fdtab[d]), _uint32(offset)));
   }
   return (off_t) __fdtab[d].pointer;
#else   
   if (!__valid(__fdtab[d])) {
      return -1;
   }
   if (whence == SEEK_SET) {
      f_lseek(__fdtab[d], _uint32(offset));
   }
   else if (whence == SEEK_END) {
      f_lseek(__fdtab[d], f_size(__fdtab[d]));
   }
   else { // SEEK_CUR
      f_lseek(__fdtab[d], _add64(f_tell(__fdtab[d]), _uint32(offset)));
   }
   return _low(f_tell(__fdtab[d]));
#endif   
}

#else

off_t _lseek(int fildes, off_t offset, int whence) {
   return -1;
}

#endif
