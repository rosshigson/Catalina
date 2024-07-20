#ifndef _PSRAM__H
#define _PSRAM__H

#include <stdint.h>
#include <commdrv.h>

#define NEWCOG (16)
// optional FLAGS for driver
#define FLAGS (0)
// These error codes are compatible with the larger, complete driver
// invalid arguments
#define ERR_INVALID (-6)
// can't send sufficient data at this P2 clock speed
#define ERR_TOO_SLOW (-14)
// driver is not running
#define ERR_INACTIVE (-15)
// driver was shutdown
#define ERR_ABORTED (-16)
// cancelled to avoid blocking during non-blocking request
#define ERR_WOULD_BLOCK (-24)
// no LOCK available for driver
#define ERR_NO_LOCK (-26)
// mailbox still has operation pending
#define ERR_MAILBOX_BUSY (-28)

extern int32_t psram_stop(void);

extern int32_t psram_getResult(int32_t nonBlocking);

extern int32_t psram_read(void *dstHubAddr, void *srcAddr, int32_t count);

extern int32_t psram_write(void *srcHubAddr, void *dstAddr, int32_t count);

extern int32_t psram_readByte(void *dstHubAddr, void *srcAddr);

extern int32_t psram_writeByte(void *srcHubAddr, void *dstAddrt);

extern int32_t psram_readWord(void *dstHubAddr, void *srcAddrt);

extern int32_t psram_writeWord(void *srcHubAddr, void *dstAddr);

extern int32_t psram_readLong(void *dstHubAddr, void *srcAddr);

extern int32_t psram_writeLong(void *srcHubAddr, void *dstAdd);

extern int32_t psram_fillBytes(void *addr, int32_t pattern, int32_t count, int32_t listPtr);

extern int32_t psram_fillWords(void *addr, int32_t pattern, int32_t count, int32_t listPtr);

extern int32_t psram_fillLongs(void *addr, int32_t pattern, int32_t count, int32_t listPtr);

extern int32_t psram_fill(void *addr, int32_t pattern, int32_t count, int32_t listPtr, int32_t datasize);

extern int32_t psram_setFrequency(int32_t freq);

extern int32_t psram_setDelay(int32_t delay);

extern int32_t psram_getDelay(void);

extern int32_t psram_setBurst(int32_t burst);

extern int32_t psram_getBurst(void);

extern int32_t psram_setQos(int32_t cog, int32_t qos);

extern int32_t psram_getQos(int32_t cog);

extern int32_t psram_getDriverLock(void);

#endif // _PSRAM__H
