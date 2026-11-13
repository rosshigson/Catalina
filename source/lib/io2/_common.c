#include <ff.h>
#include <stdio.h>
#include <hmi.h>
#include <int64.h>
/*
 * This file is common for Catalina file system functions. If SD Card file
 * system support is required, set the flag __CATALINA_SDCARD_IO to 1,
 * otherwise only trivial read/write support for stdin, stdout and
 * stderr is provided.
 */

#if __CATALINA_DEBUG_FS
extern void catalina_fs_press_to_continue();
#endif

#if __CATALINA_SDCARD_IO

#if STATIC_FILE_BUFFERS
FIL __fdtab[FOPEN_MAX];
#else
FIL* __fdtab[FOPEN_MAX];
#endif

char __vol[] = "0:";
FATFS  __fs; // mounted sd card (__fs.fs_type == 0 if not mounted)

// return true if file represented by f is valid
int __valid(FIL* f) {
  if (f && f->obj.fs && f->obj.fs->fs_type && f->obj.id == f->obj.fs->id) {
    return 1;
  }
  else {
	   return 0;
  }
}

#if __CATALINA_DEBUG_FS

#include <hmi.h>

void catalina_fs_press_to_continue() {
   int ch;

   t_string(1, "Press any key to continue\n");
   ch = k_wait();
}

void dump_fileinfo(FIL* f) {
    t_string(1, "fileinfo: ");
    t_hex(1, (unsigned long)f);
    t_char(1,'\n');
    t_hex(1, (unsigned long)f->obj.fs);
    t_char(1,'\n');
    t_hex(1, (unsigned long)_low(f->fptr));
    t_char(1,'\n');
    t_hex(1, (unsigned long)f->clust);
    t_char(1,'\n');
    t_hex(1, (unsigned long)_low(f->sect));
    t_char(1,'\n');
}

void dumpall() {
   int i;
   for (i = 3; i < FOPEN_MAX; i++) {
#if STATIC_FILE_BUFFERS
      if (__fdtab[i].mode != 0) {
         dump_fileinfo(&__fdtab[i]);
      }
#else
      if (__fdtab[i]) {
         dump_fileinfo(__fdtab[i]);
      }
#endif
   }
}

#endif

#endif
