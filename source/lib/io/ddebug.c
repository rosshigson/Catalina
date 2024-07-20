/*
	DOSFS Embedded FAT-Compatible Filesystem
	(C) 2005 Lewin A.R.W. Edwards (sysadm@zws.com)

	You are permitted to modify and/or use this code in your own projects without
	payment of royalty, regardless of the license(s) you choose for those projects.

	You cannot re-copyright or restrict use of the code as released by Lewin Edwards.
*/

#include <string.h>
#include <stdlib.h>
#include <dosfs.h>

#if __CATALINA_DEBUG_DOSFS
#include <hmi.h>

static void DFS_press_to_continue() {
   int ch;

   t_string(1, "\nPress any key to continue\n");
   ch = k_wait();
}

static void dump_fileinfo(PFILEINFO f) {
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

#endif



