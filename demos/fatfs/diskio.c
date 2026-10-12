/*-----------------------------------------------------------------------*/
/* Low level disk I/O module SKELETON for FatFs     (C)ChaN, 2025        */
/*-----------------------------------------------------------------------*/
/* If a working storage control module is available, it should be        */
/* attached to the FatFs via a glue function rather than modifying it.   */
/* This is an example of glue functions to attach various exsisting      */
/* storage control modules to the FatFs module with a defined API.       */
/*-----------------------------------------------------------------------*/

#include "ff.h"			/* Basic definitions of FatFs */
#include "diskio.h"		/* Declarations FatFs MAI */

/* Example: Declarations of the platform and disk functions in the project */
//#include "platform.h"
//#include "storage.h"

/* Example: Mapping of physical drive number for each drive */
#define DEV_MMC		0	/* Map MMC/SD card to physical drive 1 */
//#define DEV_FLASH	1	/* Map FTL to physical drive 0 */
//#define DEV_USB		2	/* Map USB MSD to physical drive 2 */
//#define DEV_RAM		4	/* Map RAM to physical drive 3 */

int SD_disk_status();
int SD_disk_initialize();
int SD_disk_read(BYTE *buff, LBA_t sector, UINT count);
int SD_disk_write(const BYTE *buff, LBA_t sector, UINT count);
int SD_disk_ioctl(const BYTE *buff, UINT pdrv, UINT cmd);


/*-----------------------------------------------------------------------*/
/* Get Drive Status                                                      */
/*-----------------------------------------------------------------------*/

DSTATUS disk_status (
	BYTE pdrv		/* Physical drive nmuber to identify the drive */
)
{
	DSTATUS stat;
	int result;

	switch (pdrv) {
#ifdef DEV_RAM    
	case DEV_RAM :
		result = RAM_disk_status();

		// translate the result code here

		return stat;
#endif
#ifdef DEV_MMC
	case DEV_MMC :
		result = SD_disk_status();

		// translate the result code here
    stat = (result == 0) ? RES_OK : RES_ERROR;

		return stat;
#endif
#ifdef DEV_USB    
	case DEV_USB :
		result = USB_disk_status();

		// translate the result code here

		return stat;
#endif    
	}
	return STA_NOINIT;
}



/*-----------------------------------------------------------------------*/
/* Inidialize a Drive                                                    */
/*-----------------------------------------------------------------------*/

DSTATUS disk_initialize (
	BYTE pdrv				/* Physical drive nmuber to identify the drive */
)
{
	DSTATUS stat;
	int result;

	switch (pdrv) {
#ifdef DEV_RAM    
	case DEV_RAM :
		result = RAM_disk_initialize();

		// translate the result code here

		return stat;
#endif
#ifdef DEV_MMC
	case DEV_MMC :
		result = SD_disk_initialize();

		// translate the result code here
    stat = (result == 0) ? RES_OK : RES_ERROR;

		return stat;
#endif    
#ifdef DEV_USB
	case DEV_USB :
		result = USB_disk_initialize();

		// translate the result code here

		return stat;
#endif    
	}
	return STA_NOINIT;
}



/*-----------------------------------------------------------------------*/
/* Read Sector(s)                                                        */
/*-----------------------------------------------------------------------*/

DRESULT disk_read (
	BYTE pdrv,		/* Physical drive nmuber to identify the drive */
	BYTE *buff,		/* Data buffer to store read data */
	LBA_t sector,	/* Start sector in LBA */
	UINT count		/* Number of sectors to read */
)
{
	DRESULT stat;
	int result;

	switch (pdrv) {
#ifdef DEV_RAM    
	case DEV_RAM :
		// translate the arguments here

		result = RAM_disk_read(buff, sector, count);

		// translate the result code here

		return stat;
#endif
#ifdef DEV_MMC
	case DEV_MMC :
		// translate the arguments here

		result = SD_disk_read(buff, sector, count);

		// translate the result code here
    stat = (result == 0) ? RES_OK : RES_ERROR;

		return stat;
#endif
#ifdef DEV_USB
	case DEV_USB :
		// translate the arguments here

		result = USB_disk_read(buff, sector, count);

		// translate the result code here

		return stat;
#endif    
	}

	return RES_PARERR;
}



/*-----------------------------------------------------------------------*/
/* Write Sector(s)                                                       */
/*-----------------------------------------------------------------------*/

#if FF_FS_READONLY == 0

DRESULT disk_write (
	BYTE pdrv,			/* Physical drive nmuber to identify the drive */
	const BYTE *buff,	/* Data to be written */
	LBA_t sector,		/* Start sector in LBA */
	UINT count			/* Number of sectors to write */
)
{
	DRESULT stat;
	int result;

	switch (pdrv) {
#ifdef DEV_RAM    
	case DEV_RAM :
		// translate the arguments here

		result = RAM_disk_write(buff, sector, count);

		// translate the result code here

		return stat;
#endif
#ifdef DEV_MMC    
	case DEV_MMC :
		// translate the arguments here

		result = SD_disk_write(buff, sector, count);

		// translate the result code here
    stat = (result == 0) ? RES_OK : RES_ERROR;

		return stat;
#endif    
#ifdef DEV_USB
	case DEV_USB :
		// translate the arguments here

		result = USB_disk_write(buff, sector, count);

		// translate the result code here

		return stat;
#endif    
	}

	return RES_PARERR;
}

#endif


/*-----------------------------------------------------------------------*/
/* Miscellaneous Functions                                               */
/*-----------------------------------------------------------------------*/

DRESULT disk_ioctl (
	BYTE pdrv,		/* Physical drive nmuber (0..) */
	BYTE cmd,		/* Control code */
	void *buff		/* Buffer to send/receive control data */
)
{
	DRESULT stat;
  int result;

	switch (pdrv) {
#ifdef DEV_RAM    
	case DEV_RAM :

		// Process of the command for the RAM drive
		stat = RAM_disk_ioctl(buff, pdrv, cmd);

		return stat;
#endif
#ifdef DEV_MMC    
	case DEV_MMC :

		// Process of the command for the MMC/SD card
		stat = SD_disk_ioctl(buff, pdrv, cmd);

		return stat;
#endif    
#ifdef DEV_USB
	case DEV_USB :

		// Process of the command the USB drive
		stat = USB_disk_ioctl(buff, pdrv, cmd);

		return stat;
#endif
	}

	return RES_PARERR;
}

