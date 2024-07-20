/*
 * definition common to PSRAM and hyperRAM drivers
 */

#if	!defined(_COMMONDRV_H)
#define	_COMMONDRV_H

// standard memory request masks
// read (or RMW) a byte from device address
#define R_READBYTE ((8 << 28))
// read (or RMW) a word from device address
#define R_READWORD ((9 << 28))
// read (or RMW) a long from device address
#define R_READLONG ((10 << 28))
// read a burst of data from device into HUB RAM
#define R_READBURST ((11 << 28))
// write byte(s) into device
#define R_WRITEBYTE ((12 << 28))
// write word(s) into device
#define R_WRITEWORD ((13 << 28))
// write long(s) into device
#define R_WRITELONG ((14 << 28))
// write a burst of HUB RAM data into device
#define R_WRITEBURST ((15 << 28))

// control request masks
// read driver's latency for a bank
#define R_GETLATENCY ((128 << 24))
// read device register
#define R_GETREG ((144 << 24))
// read a bank parameter long
#define R_GETPARAMS ((160 << 24))
// dump COG+LUT RAM areas into HUB RAM for debug
#define R_DUMPSTATE ((176 << 24))
// write driver's latency for a bank
#define R_SETLATENCY ((192 << 24))
// write device register
#define R_SETREG ((208 << 24))
// write a bank parameter long
#define R_SETPARAMS ((224 << 24))
// reconfigure COG QoS settings & poller code
#define R_CONFIG ((240 << 24))

// memory device sizes (for mapping the 8MB or smaller devices, 
// you will use a 16MB boundary with foldover)
#define S_1KB   10
#define S_2KB   11
#define S_4KB   12
#define S_8KB   13
#define S_16KB  14
#define S_32KB  15
#define S_64KB  16
#define S_128KB 17
#define S_256KB 18
#define S_512KB 19
#define S_1MB   20
#define S_2MB   21
#define S_4MB   22
#define S_8MB   23
#define S_16MB  24
#define S_32MB  25
#define S_64MB  26 
#define S_128MB 27
#define S_256MB 28

// field identifiers 
#define FIELD_BURST      1
#define FIELD_DELAY      2
#define FIELD_PROTECTION 3
#define FIELD_FLAGS      4

// errors returned by driver
// invalid bank is accessed
#define ERR_INVALID_BANK ((-1))
// operation not supported
#define ERR_UNSUPPORTED ((-2))
// invalid request in list
#define ERR_INVALID_LIST ((-3))
// address is not aligned for type of request
#define ERR_ALIGNMENT ((-4))
// flash is busy
#define ERR_BUSY ((-5))

// flag bits per COG
// COG is strict priority polled if set
#define PRIORITY_BIT (15)
// COG is also notified with COGATN if set
#define NOTIFY_BIT (11)
// COG's transfers are bus locked if set
#define LOCKED_BIT (10)
// COG is executing a list when set
#define LIST_BIT (9)

// flag type bits per bank
// bit is set if HyperFlash bank is exclusively protected by a COG
#define PROT_BIT (11)
// bit is set for HyperFlash, cleared for RAM
#define FLASH_BIT (10)
// driver configuration flag bits
// bit set when reads are done at sysclk/1 transfer rate instead of sysclk/2
#define FASTREAD_BIT (31)
// (reserved for future sysclk/1 writes)
#define FASTWRITE_BIT (30)
// bit set when unregistered clock pins are enabled (experimental only)
#define UNREGCLK_BIT (29)
// bit set to expand driver to run HUB exec code
#define EXPANSION_BIT (28)

#endif
