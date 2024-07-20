#include <fs.h>

/*
 * This file is common for Catalina file system functions. If SD Card file
 * system support is required, set the flag __CATALINA_SDCARD_IO to 1,
 * otherwise only trivial read/write support for stdin, stdout and
 * stderr is provided.
 */

#if __CATALINA_SDCARD_IO

#if STATIC_FILE_BUFFERS
FILEINFO __fdtab[FOPEN_MAX];
#else
PFILEINFO __fdtab[FOPEN_MAX];
#endif

uint32_t __pstart = -1;  // will be -1 until an sd card is mounted

VOLINFO  __vi;           // information of mounted sd card

#if __CATALINA_DEBUG_FS

#include <hmi.h>

void catalina_fs_press_to_continue() {
   int ch;

   t_string(1, "Press any key to continue\n");
   ch = k_wait();
}

void dump_fileinfo(PFILEINFO f) {
    t_string(1, "fileinfo: ");
    t_hex(1, (unsigned long)f);
    t_char(1,'\n');
    t_hex(1, (unsigned long)f->volinfo);
    t_char(1,'\n');
    t_hex(1, (unsigned long)f->dirsector);
    t_char(1,'\n');
    t_hex(1, (unsigned long)f->diroffset);
    t_char(1,'\n');
    t_hex(1, (unsigned long)f->mode);
    t_char(1,'\n');
    t_hex(1, (unsigned long)f->firstcluster);
    t_char(1,'\n');
    t_hex(1, (unsigned long)f->filelen);
    t_char(1,'\n');
    t_hex(1, (unsigned long)f->cluster);
    t_char(1,'\n');
    t_hex(1, (unsigned long)f->pointer);
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
