#include <fs.h>

#if __CATALINA_SDCARD_IO

off_t _lseek(int d, off_t offset, int whence) {
	uint8_t scratch[SECTOR_SIZE];

#if __CATALINA_DEBUG_FS
   t_string(1, "_lseek\n");
   catalina_fs_press_to_continue();
#endif
#if STATIC_FILE_BUFFERS
   if (__fdtab[d].mode == 0) {
      return -1;
   }
   if (whence == SEEK_SET) {
      DFS_Seek(&__fdtab[d], (uint32_t) offset, scratch);
   }
   else if (whence == SEEK_END) {
      DFS_Seek(&__fdtab[d], __fdtab[d].filelen + (uint32_t) offset, scratch);
   }
   else { // SEEK_CUR
      DFS_Seek(&__fdtab[d], __fdtab[d].pointer + (uint32_t) offset, scratch);
   }
   return (off_t) __fdtab[d].pointer;
#else   
   if (__fdtab[d] == NULL) {
      return -1;
   }
   if (whence == SEEK_SET) {
      DFS_Seek(__fdtab[d], (uint32_t) offset, scratch);
   }
   else if (whence == SEEK_END) {
      DFS_Seek(__fdtab[d], __fdtab[d]->filelen + (uint32_t) offset, scratch);
   }
   else { // SEEK_CUR
      DFS_Seek(__fdtab[d], __fdtab[d]->pointer + (uint32_t) offset, scratch);
   }
   return (off_t) __fdtab[d]->pointer;
#endif   
}

#else

off_t _lseek(int fildes, off_t offset, int whence) {
   return -1;
}

#endif
