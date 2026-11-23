
#include "diskio.h"		/* Declarations FatFs MAI */

DSTATUS SD_disk_status(void);
DSTATUS SD_disk_initialize(void);
DSTATUS SD_disk_deinitialize(void);

DRESULT SD_disk_read(BYTE *buff, LBA_t blkadr, UINT count);
DRESULT SD_disk_write(const BYTE *buff, LBA_t blkadr, UINT count);
DRESULT SD_disk_ioctl(UINT ctrl, BYTE *buff);

