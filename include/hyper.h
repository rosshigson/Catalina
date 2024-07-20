#ifndef _HYPER__H
#define _HYPER__H

#include <stdint.h>
#include <commdrv.h>

#define NEWCOG (16)
// optional FLAGS for driver
#define FLAGS (0)

//flash erase sizes / flags
#define ERASE_SECTOR_256K    0x00040000  // single sector erase, size=256kB
#define ERASE_ENTIRE_FLASH   0x10000000  // entire device erase

#define F_PROTFLAG  (1<< PROT_BIT)
#define F_FLASHFLAG (1<< FLASH_BIT)

// These error codes are compatible with the larger, complete driver
// invalid arguments
#define ERR_INVALID (-6)
// can't send sufficient data at this P2 clock speed
#define ERR_TOO_SLOW (-14)
// driver is not running
#define ERR_INACTIVE (-15)
// driver was shutdown
#define ERR_ABORTED (-16)
// flash erase failure
#define ERR_FLASH_ERASE (-18)
// flash programming failure
#define ERR_FLASH_PROGRAM (-19) 
// flash ready response timed out
#define ERR_FLASH_TIMEOUT (-20)
// flash access sector protected/locked 
#define ERR_FLASH_LOCKED (-21) 
// not a flash device address
#define ERR_NOT_FLASH (-22) 
// not a RAM device address
#define ERR_NOT_RAM (-23) 
// cancelled to avoid blocking during non-blocking request
#define ERR_WOULD_BLOCK (-24)
// no LOCK available for driver
#define ERR_NO_LOCK (-26)
// mailbox still has operation pending
#define ERR_MAILBOX_BUSY (-28)

// flash status register bits
#define FLASH_STATUS_DRB     7  // device ready bit
#define FLASH_STATUS_ESB     5  // erase status bit
#define FLASH_STATUS_PSB     4  // program status bit
#define FLASH_STATUS_SLSB    1  // sector locked bit
#define FLASH_STATUS_ESTAT   0  // sector erase status bit

#define FLASH_PROG_TIMEOUT   2  // in milliseconds

/* 
 * HyperFlash / HyperRAM functions:
 */

extern int32_t hyper_stop(void);

extern int32_t hyper_getResult(int32_t nonBlocking);

extern int32_t hyper_read(void *dstHubAddr, void *srcAddr, int32_t count);

extern int32_t hyper_write(void *srcHubAddr, void *dstAddr, int32_t count);

extern int32_t hyper_readByte(void *dstHubAddr, void *srcAddr);

extern int32_t hyper_writeByte(void *srcHubAddr, void *dstAddr);

extern int32_t hyper_readWord(void *dstHubAddr, void *srcAddr);

extern int32_t hyper_writeWord(void *srcHubAddr, void *dstAddr);

extern int32_t hyper_readLong(void *dstHubAddr, void *srcAddr);

extern int32_t hyper_writeLong(void *srcHubAddr, void *dstAddr);

extern int32_t hyper_fillBytes(void *addr, int32_t pattern, int32_t count, int32_t listPtr);

extern int32_t hyper_fillWords(void *addr, int32_t pattern, int32_t count, int32_t listPtr);

extern int32_t hyper_fillLongs(void *addr, int32_t pattern, int32_t count, int32_t listPtr);

extern int32_t hyper_fill(void *addr, int32_t pattern, int32_t count, int32_t listPtr, int32_t datasize);

extern int32_t hyper_setDelayFrequency(void *addr, int32_t freq, int32_t tempK);

extern int32_t hyper_setDelay(void *addr, int32_t delay);

extern int32_t hyper_getDelay(void *addr);

extern int32_t hyper_setBurst(void *addr, uint32_t burst);

extern int32_t hyper_getBurst(void *addr);

extern int32_t hyper_setQos(int32_t cog, int32_t qos);

extern int32_t hyper_getQos(int32_t cog);

extern int32_t hyper_getDriverLock(void);

extern int32_t hyper_getDriverCogId(void);

extern int32_t hyper_getFlags(void *addr);

extern int32_t hyper_getDriverLatency(void *addr);

extern int32_t hyper_getBankParameters(int32_t bank);

extern int32_t hyper_getPinParameters(int32_t bank);

extern int32_t hyper_readReg(void *addr, int32_t regAddr);

extern int32_t hyper_writeReg(void *addr, int32_t regaddr, int32_t value16);

extern int32_t hyper_readRamIR(void *addr, int32_t ir, int32_t die);

extern int32_t hyper_readRamCR(void *addr, int32_t ir, int32_t die);

/*
 * Hyper Flash specific functions:
 */

extern int32_t hyper_getFlashSize(void *addr);

extern int32_t hyper_getFlashBurstSize(void *addr);

extern int32_t hyper_lockFlashAccess(void *addr);

extern int32_t hyper_unlockFlashAccess(void *addr);

extern int32_t hyper_eraseFlash(void *addr, int32_t flags);

extern int32_t eraseFlash(void *addr, uint32_t flags);

extern int32_t hyper_programFlash(void *addr, void *srcHubAddr, uint32_t byteCount, int32_t flags);

extern int32_t hyper_programFlashByte(void *addr, int32_t data);

extern int32_t hyper_programFlashWord(void *addr, int32_t data);

extern int32_t hyper_programFlashLong(void *addr, int32_t data);

extern int32_t hyper_readFlashInfo(void *addr, int32_t wordoffset);

extern int32_t hyper_readFlashStatus(void *addr);

extern int32_t hyper_clearFlashStatus(void *addr);

extern int32_t hyper_readFlashICR(void *addr);

extern int32_t hyper_readFlashISR(void *addr);

extern int32_t hyper_readFlashNVCR(void *addr);

extern int32_t hyper_readFlashVCR(void *addr);

extern int32_t hyper_writeFlashICR(void *addr, int32_t data);

extern int32_t hyper_writeFlashVCR(void *addr, int32_t data);

#endif // _HYPER__H
