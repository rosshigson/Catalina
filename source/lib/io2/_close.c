#include <ff.h>
#include <stdio.h>
#include <stdlib.h>
#include <hmi.h>

#ifdef __CATALINA_HUB_MALLOC

#include <hmalloc.h>

#define malloc  hub_malloc
#define calloc  hub_calloc
#define realloc hub_realloc
#define free    hub_free

#endif

#if STATIC_FILE_BUFFERS
extern FIL __fdtab[FOPEN_MAX];
#else
extern FIL* __fdtab[FOPEN_MAX];
#endif

extern int __valid(FIL* f);

#if __CATALINA_DEBUG_FS
extern void catalina_fs_press_to_continue();
#endif

#if __CATALINA_SDCARD_IO

int _close(int d) {
#if __CATALINA_DEBUG_FS
	t_string(1, "_close, fd = ");
   t_integer(1,d);
	t_string(1, "\n");
   catalina_fs_press_to_continue();
#endif
#if STATIC_FILE_BUFFERS      
   if (!__valid(&__fdtab[d])) {
      return -1;
   }
   if (f_close(&__fdtab[d]) == FR_OK) {
      return 0;
   }
   else {
      return -1;
   }
#else      
   if (!__valid(__fdtab[d])) {
      return -1;
   }
   if (f_close(__fdtab[d]) == FR_OK) {
      free ((void *)__fdtab[d]);
      __fdtab[d] = NULL;
      return 0;
   }
   else {
      return -1;
   }
#endif         
}    


#else

int _close(int d) {
   return -1;
}

#endif
