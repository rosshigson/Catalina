/*------------------------------------------------------------------------/
/  Foolproof MMCv3/SDv1/SDv2 (in SPI mode) control module
/-------------------------------------------------------------------------/
/
/  Copyright (C) 2019, ChaN, all right reserved.
/
/ * This software is a free software and there is NO WARRANTY.
/ * No restriction on use. You can use, modify and redistribute it for
/   personal, non-profit or commercial products UNDER YOUR RESPONSIBILITY.
/ * Redistributions of source code must retain the above copyright notice.
/
/-------------------------------------------------------------------------/
  Features and Limitations:

  * Easy to Port Bit-banging SPI
    It uses only four GPIO pins. No complex peripheral needs to be used.

  * Platform Independent
    You need to modify only a few macros to control the GPIO port.

  * Low Speed
    The data transfer rate will be several times slower than hardware SPI.

  * No Media Change Detection
    Application program needs to perform a f_mount() after media change.

/-------------------------------------------------------------------------*/

// Modified for Prop2 by evanh

//#include <sys/ioctl.h>
#include "ff.h"			/* Basic definitions of FatFs */
#include "sdmm_cat.h"
#include <stdlib.h>

#ifdef _DEBUG_SDMM
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#endif

/*-------------------------------------------------------------------------*/
/* Platform dependent macros and functions needed to be modified           */
/*-------------------------------------------------------------------------*/

#ifdef __CATALINA_P2
#include <prop.h>
#include <propeller2.h>
//#include <lut_exec.h>
#include <smartpin.h>
#define _smartpins_mode_eh /* enable Evanh's fast smartpin code */
#endif


// 
// The values here were tested empirically to work at 300 MHz with some cards
// but it would be nice to have some "reason" for them :)
//
#define PAUSE()      (_waitx(16))
#define SHORTPAUSE() (_waitx(8))

#define DO_INIT()	_pinf(PIN_DO)				/* Initialize port for MMC DO as input */
#define DO		(SHORTPAUSE(), (_pinr(PIN_DO) & 1))	/* Test for MMC DO ('H':true, 'L':false) */

#define DI_INIT()	_dirh(PIN_DI)	/* Initialize port for MMC DI as output */
#define DI_H()		(_pinh(PIN_DI))	/* Set MMC DI "high" */
#define DI_L()		(_pinl(PIN_DI))	/* Set MMC DI "low" */

#define CK_INIT()	_dirh(PIN_CLK)	/* Initialize port for MMC SCLK as output */
#define CK_H()		(_pinh(PIN_CLK), PAUSE())	/* Set MMC SCLK "high" */
#define	CK_L()		(_pinl(PIN_CLK), PAUSE())	/* Set MMC SCLK "low" */

#define CS_INIT()	_dirh(PIN_SS)	/* Initialize port for MMC CS as output */
#define	CS_H()		(_pinh(PIN_SS), PAUSE())	/* Set MMC CS "high" */
#define CS_L()		(_pinl(PIN_SS), PAUSE())	/* Set MMC CS "low" */


static
void dly_us (UINT n)	/* Delay n microseconds (avr-gcc -Os) */
{
    _waitus( n );
}



/*--------------------------------------------------------------------------

   Module Private Functions

---------------------------------------------------------------------------*/

/* MMC/SD command (SPI mode) */
#define CMD0	(0)			/* GO_IDLE_STATE */
#define CMD1	(1)			/* SEND_OP_COND */
#define	ACMD41	(0x80+41)	/* SEND_OP_COND (SDC) */
#define CMD8	(8)			/* SEND_IF_COND */
#define CMD9	(9)			/* SEND_CSD */
#define CMD10	(10)		/* SEND_CID */
#define CMD12	(12)		/* STOP_TRANSMISSION */
#define CMD13	(13)		/* SEND_STATUS */
#define ACMD13	(0x80+13)	/* SD_STATUS (SDC) */
#define CMD16	(16)		/* SET_BLOCKLEN */
#define CMD17	(17)		/* READ_SINGLE_BLOCK */
#define CMD18	(18)		/* READ_MULTIPLE_BLOCK */
#define CMD23	(23)		/* SET_BLOCK_COUNT */
#define	ACMD23	(0x80+23)	/* SET_WR_BLK_ERASE_COUNT (SDC) */
#define CMD24	(24)		/* WRITE_BLOCK */
#define CMD25	(25)		/* WRITE_MULTIPLE_BLOCK */
#define CMD32	(32)		/* ERASE_ER_BLK_START */
#define CMD33	(33)		/* ERASE_ER_BLK_END */
#define CMD38	(38)		/* ERASE */
#define CMD55	(55)		/* APP_CMD */
#define CMD58	(58)		/* READ_OCR */


/* MMC card type flags (MMC_GET_TYPE) */
#define CT_MMC		0x01		/* MMC ver 3 */
#define CT_SD1		0x02		/* SD ver 1 */
#define CT_SD2		0x04		/* SD ver 2 */
#define CT_SDC		(CT_SD1|CT_SD2)	/* SD */
#define CT_BLOCK	0x08		/* Block addressing */
#define CT_PINSET	0x80		/* SD slot pins are configured */


DSTATUS Stat /*= STA_NOINIT*/;	/* Disk status */

BYTE CardType;			/* b0:MMC, b1:SDv1, b2:SDv2, b3:Block addressing */
#ifdef _smartpins_mode_eh
unsigned  oldclkfreq, tx_spmode;
#endif



/*-----------------------------------------------------------------------*/
/* Transmit bytes to the card (bitbanging)                               */
/*-----------------------------------------------------------------------*/

static
void xmit_mmc (
	const BYTE* buff,	/* Data to be sent */
	UINT bc				/* Number of bytes to send */
)
{
#ifdef _smartpins_mode_eh
// Smartpin SPI transmitter using "continuous" mode and 32-bit word size
//   NOTE: data out always has at least a 4 sysclock lag
	PASM(
"		dirl	#_SD_DI\n"    // reset tx smartpin, clears excess data
"		setq	#1\n"
"		rdlong	r0, _PASM(buff)\n"    // fetch first data
"		rev	r0\n"
"		movbyts	r0, ##%00011011\n"    // endian swap
"		wypin	r0, #_SD_DI\n"    // first data to tx shifter
"		dirh	#_SD_DI\n"    // liven tx buffer, continuous mode

"		mov	r0, _PASM(bc)\n"
"		shr	_PASM(bc), #2  wz\n"    // longword count (rounded down)
"		shl	r0, #3\n"    // bit count (exact)
"		wypin	r0, #_SD_CK\n"    // begin SPI clocks

"		add	_PASM(buff), #8\n"
"		rev	r1\n"
"		movbyts	r1, ##%00011011\n"    // endian swap
"tx_loop\n"
"	if_nz	wypin	r1, #_SD_DI\n"    // data to tx buffer
"	if_nz	rdlong	r1, _PASM(buff)\n"    // fetch next data
"	if_nz	add	_PASM(buff), #4\n"
"	if_nz	rev	r1\n"
"	if_nz	movbyts	r1, #%00011011\n"    // endian swap
"tx_wait\n"
"	if_nz	testp	#_SD_DI  wc\n"    // wait for tx buffer empty
"if_nc_and_nz	jmp	#tx_wait\n"
"	if_nz	djnz	_PASM(bc), #tx_loop\n"

// Wait for completion
"tx_wait2\n"
"		testp	#_SD_CK  wc\n"
"	if_nc	jmp	#tx_wait2\n"

"		dirl	#_SD_DI\n"    // reset tx smartpin to clear excess data
"		wypin	##-1, #_SD_DI\n"    // TX 0xFF, continuous mode
"		dirh	#_SD_DI"
	);
#else
	int PIN_CLK = PASM("mov r0,#_SD_CK");
	int PIN_DI = PASM("mov r0,#_SD_DI");
	UINT  d;

	do {
		d = *buff++;	/* Get a byte to be sent */
		if (d & 0x80) DI_H(); else DI_L();	/* bit7 */
		CK_H(); CK_L();
		if (d & 0x40) DI_H(); else DI_L();	/* bit6 */
		CK_H(); CK_L();
		if (d & 0x20) DI_H(); else DI_L();	/* bit5 */
		CK_H(); CK_L();
		if (d & 0x10) DI_H(); else DI_L();	/* bit4 */
		CK_H(); CK_L();
		if (d & 0x08) DI_H(); else DI_L();	/* bit3 */
		CK_H(); CK_L();
		if (d & 0x04) DI_H(); else DI_L();	/* bit2 */
		CK_H(); CK_L();
		if (d & 0x02) DI_H(); else DI_L();	/* bit1 */
		CK_H(); CK_L();
		if (d & 0x01) DI_H(); else DI_L();	/* bit0 */
		CK_H(); CK_L();
	} while (--bc);
#endif
}


/*
static uint32_t  byteswap32( uint32_t val )
{
    PASM("movbyts _PASM(val), #%00011011");

    return val;
}
*/


/*-----------------------------------------------------------------------*/
/* Receive bytes from the card (bitbanging)                              */
/*-----------------------------------------------------------------------*/

static
void rcvr_mmc (
	BYTE *buff,	/* Pointer to read buffer */
	UINT bc		/* Number of bytes to receive */
)
{
#ifdef _smartpins_mode_eh
// Smartpin SPI byte receiver,
//  SPI clock mode is selected in disk_initialize()
//  NOTE: Has hard coded mode select for post-clock "late" sampling
//
	PASM(
"		dirl	#_SD_DO\n"			// clear rx buffer
"		mov	r1, _PASM(bc)\n"
"		dirh	#_SD_DO\n"			// clear rx buffer

// 32-bit rx
"		shr	r1, #2  wz\n"		// number of longwords
"	if_z	jmp	#rx_bytes\n"		// branch if less than 4 bytes

"		mov	r0, r1\n"
"		shl	r0, #5\n"			// bit count
"		wypin	r0, #_SD_CK\n"		// begin SPI clocks
"		wxpin	#31 | 32, #_SD_DO\n"	// 32 bits, sample after rising clock
"rx_loop2\n"
"rx_wait2\n"
"		testp	#_SD_DO  wc\n"		// wait for received byte
"	if_nc	jmp	#rx_wait2\n"

"		rdpin	r0, #_SD_DO\n"		// longword from rx buffer
"		rev	r0\n"
"		movbyts	r0, #%00011011\n"			// endian swap
"		wrlong	r0, _PASM(buff)\n"			// store longword
"		add	_PASM(buff), #4\n"
"		djnz	r1, #rx_loop2\n"

// 8-bit rx
"rx_bytes\n"
"		and	_PASM(bc), #3  wz\n"		// up to 3 bytes
"	if_z	jmp	#rx_exit\n"

"		wxpin	#7 | 32, #_SD_DO\n"		// 8 bits, sample after rising clock
"rx_loop1\n"
"		wypin	#8, #_SD_CK\n"		// begin SPI clocks
"rx_wait1\n"
"		testp	#_SD_DO  wc\n"		// wait for received byte
"	if_nc	jmp	#rx_wait1\n"

"		rdpin	r0, #_SD_DO\n"		// byte from rx buffer
"		rev	r0\n"
"		wrbyte	r0, _PASM(buff)\n"			// store byte
"		add	_PASM(buff), #1\n"
"		djnz	_PASM(bc), #rx_loop1\n"
"rx_exit"
	);
#else
	int PIN_CLK = PASM("mov r0,#_SD_CK");
	int PIN_DI = PASM("mov r0,#_SD_DI");
	int PIN_DO = PASM("mov r0,#_SD_DO");
	UINT  r;

	DI_H();	/* Send 0xFF */
	do {
		r = 0;	 if (DO) r++;	/* bit7 */
		CK_H(); CK_L();
		r <<= 1; if (DO) r++;	/* bit6 */
		CK_H(); CK_L();
		r <<= 1; if (DO) r++;	/* bit5 */
		CK_H(); CK_L();
		r <<= 1; if (DO) r++;	/* bit4 */
		CK_H(); CK_L();
		r <<= 1; if (DO) r++;	/* bit3 */
		CK_H(); CK_L();
		r <<= 1; if (DO) r++;	/* bit2 */
		CK_H(); CK_L();
		r <<= 1; if (DO) r++;	/* bit1 */
		CK_H(); CK_L();
		r <<= 1; if (DO) r++;	/* bit0 */
		CK_H(); CK_L();
		*buff++ = r;			/* Store a received byte */
	} while (--bc);
#endif        
}



/*-----------------------------------------------------------------------*/
/* Wait for card ready                                                   */
/*-----------------------------------------------------------------------*/

static
int wait_ready (void)	/* 1:OK, 0:Timeout */
{
	BYTE *d = __builtin_alloca(1);
	UINT tmr, tmout;

	tmr = _cnt();
	tmout = _clockfreq() >> 1;  // 500 ms timeout
	for(;;) {
		rcvr_mmc(d, 1);
		if( d[0] == 0xFF )  return 1;
		if( _cnt() - tmr >= tmout )  return 0;
	}
}



/*-----------------------------------------------------------------------*/
/* Deselect the card and release SPI bus                                 */
/*-----------------------------------------------------------------------*/

static
void deselect (void)
{
	BYTE *d = __builtin_alloca(1);
	int PIN_SS = PASM("mov r0,#_SD_CS");

	CS_H();				/* Set CS# high */
	rcvr_mmc(d, 1);	/* Dummy clock (force DO hi-z for multiple slave SPI) */
}



/*-----------------------------------------------------------------------*/
/* Select the card and wait for ready                                    */
/*-----------------------------------------------------------------------*/

static
int select (void)	/* 1:OK, 0:Timeout */
{
	BYTE *d = __builtin_alloca(1);
	int PIN_SS = PASM("mov r0,#_SD_CS");
	
#ifdef _smartpins_mode_eh
	_pinl(PIN_SS);  // Set CS# low
#else
	CS_L();			/* Set CS# low */
	rcvr_mmc(d, 1);	/* Dummy clock (force DO enabled) */
#endif
	if (wait_ready()) return 1;	/* Wait for card ready */

	deselect();
	return 0;			/* Failed */
}



/*-----------------------------------------------------------------------*/
/* Receive a data packet from the card                                   */
/*-----------------------------------------------------------------------*/

static
int rcvr_datablock (	/* 1:OK, 0:Failed */
	BYTE *buff,			/* Data buffer to store received data */
	UINT btr			/* Byte count */
)
{
	BYTE *d = __builtin_alloca(2);
	UINT tmr, tmout;

	tmr = _cnt();
	tmout = _clockfreq() >> 3;  // 125 ms timeout
	for(;;) {
		rcvr_mmc(d, 1);
		if( d[0] != 0xFF )  break;
		if( _cnt() - tmr >= tmout )  break;
	}
	if (d[0] != 0xFE) return 0;		/* If not valid data token, return with error */

	rcvr_mmc(buff, btr);			/* Receive the data block into buffer */
	rcvr_mmc(d, 2);				/* Discard CRC */

	return 1;				/* Return with success */
}



/*-----------------------------------------------------------------------*/
/* Send a data packet to the card                                        */
/*-----------------------------------------------------------------------*/

static
int xmit_datablock (	/* 1:OK, 0:Failed */
	const BYTE *buff,	/* 512 byte data block to be transmitted */
	BYTE token			/* Data/Stop token */
)
{
	BYTE *d = __builtin_alloca(2);


	if (!wait_ready()) return 0;

	d[0] = token;
	xmit_mmc(d, 1);				/* Xmit a token */
	if (token != 0xFD) {		/* Is it data token? */
		xmit_mmc(buff, 512);	/* Xmit the 512 byte data block to MMC */
		rcvr_mmc(d, 2);			/* Xmit dummy CRC (0xFF,0xFF) */
		rcvr_mmc(d, 1);			/* Receive data response */
		if ((d[0] & 0x1F) != 0x05)	/* If not accepted, return with error */
			return 0;
	}

	return 1;
}



/*-----------------------------------------------------------------------*/
/* Send a command packet to the card                                     */
/*-----------------------------------------------------------------------*/

static
BYTE send_cmd (		/* Returns command response (bit7==1:Send failed)*/
	BYTE cmd,		/* Command byte */
	DWORD arg		/* Argument */
)
{
	BYTE n, *buf = __builtin_alloca(7);


	if (cmd & 0x80) {	/* ACMD<n> is the command sequense of CMD55-CMD<n> */
		cmd &= 0x7F;
		n = send_cmd(CMD55, 0);
		if (n > 1) return n;
	}

	/* Select the card and wait for ready except to stop multiple block read */
	if (cmd != CMD12) {
		deselect();
		if (!select()) return 0xFF;
	}

	/* Send a command packet */
	buf[0] = 0x40 | cmd;			/* Start + Command index */
#ifdef __CATALINA_P2
	PASM("movbyts _PASM(arg), #%00011011");
	*(DWORD*)(buf+1) = arg;
#else
	buf[1] = (BYTE)(arg >> 24);		/* Argument[31..24] */
	buf[2] = (BYTE)(arg >> 16);		/* Argument[23..16] */
	buf[3] = (BYTE)(arg >> 8);		/* Argument[15..8] */
	buf[4] = (BYTE)arg;				/* Argument[7..0] */
#endif
	n = 0x01;						/* Dummy CRC + Stop */
	if (cmd == CMD0) n = 0x95;		/* (valid CRC for CMD0(0)) */
	if (cmd == CMD8) n = 0x87;		/* (valid CRC for CMD8(0x1AA)) */
	buf[5] = n;
	xmit_mmc(buf, 6);

	/* Receive command response */
	if (cmd == CMD12) rcvr_mmc(buf+6, 1);	/* Skip a stuff byte when stop reading */
	n = 10;								/* Wait for a valid response in timeout of 10 attempts */
	do {
		rcvr_mmc(buf+6, 1);
	} while ((buf[6] & 0x80) && --n);

	return buf[6];			/* Return with the response value */
}



#ifdef _smartpins_mode_eh
static void  set_divider( void )
{
    int  PIN_CLK = PASM("mov r0,#_SD_CK");
    int  PIN_DI = PASM("mov r0,#_SD_DI");
    unsigned  tmr, ck_div, spm_tx = tx_spmode;

    oldclkfreq = _clockfreq();    // remember for comparision

    // NOTE that the boot pins share with flash EEPROM chip.  The SD slot has a 240 Ohm inline resistor to protect
    // against over-current upon data collisions.  40 MHz clock limit is choosen suit this resistor.
    tmr = _clockfreq() / 1000000;    // MHz granular
    ck_div = (tmr + 43) / 45;    // 45 MHz SD clock rate (/4@180 /5@225 /6@270 /7@315 /8@360)
    if( ck_div < 4 )  ck_div = 4;    // minimum divider of sysclock/4.  /3 also works

    if( ck_div <= 6 )  spm_tx |= P_INVERT_B;  // falling clock + 1 + 4 lag
    else if( ck_div <= 9 )  spm_tx |= P_INVERT_B | P_SYNC_IO;  // falling clock + 1 + 4 + 1 lag
    // else default:  rising clock + 1 + 4 lag

    _wxpin( PIN_CLK, ck_div | (ck_div / 2) << 16 );  // update clock smartpin sysclock divider
    _wrpin( PIN_DI, spm_tx );  // update tx smartpin
#ifdef _DEBUG_SDMM
    printf("SPI clock rate = %d/%d MHz = %.2f MHz\n", tmr, ck_div, (float)tmr / (float)ck_div);
#endif
}
#endif


/*--------------------------------------------------------------------------

   Public Functions

---------------------------------------------------------------------------*/


/*-----------------------------------------------------------------------*/
/* Get Disk Status                                                       */
/*-----------------------------------------------------------------------*/

DSTATUS SD_disk_status ( void )
{
#ifdef _DEBUG_SDMM_ACCESSES
    printf(" sd=%d ",Stat);
#endif
	return Stat;
}



/*-----------------------------------------------------------------------*/
/* Initialize Disk Drive                                                 */
/*-----------------------------------------------------------------------*/

DSTATUS SD_disk_initialize ( void )
{
	int PIN_CLK = PASM("mov r0,#_SD_CK");
	int PIN_DO = PASM("mov r0,#_SD_DO");
	int PIN_DI = PASM("mov r0,#_SD_DI");
	int PIN_SS = PASM("mov r0,#_SD_CS");
	int ty, cmd;
	unsigned tmr;
	DSTATUS s;
	BYTE *buf = __builtin_alloca(10);
	BYTE res;

#ifdef _DEBUG_SDMM
	setvbuf(stdout, NULL, _IONBF, 0);    // disable line buffering
	printf("disk_initialize: PINS=%d %d %d %d\n", PIN_CLK, PIN_SS, PIN_DI, PIN_DO);
#endif

#ifdef _smartpins_mode_eh
	_wrpin( PIN_SS, 0 );
	_pinh( PIN_SS );  // Deselect SD card

	tmr = P_PULSE | P_OE | P_INVERT_OUTPUT | P_SYNC_IO;  // CPOL = 1 (SPI mode 3), P_SYNC_IO for late late rx sampling
	_pinstart(PIN_CLK, tmr, 0x00800100, 0);  // sysclock/256, init speed (400 kHz ideal)

	cmd = PIN_CLK - PIN_DI;  if(abs(cmd) > 3)  return STA_NOINIT;    // clock pin too distant
	tmr = P_SYNC_TX | P_OE | (cmd & 7) << 24;  // tx smartpin mode and clock pin offset
	_pinstart( PIN_DI, tmr | P_SYNC_IO, 31, -1 );  // rising clock + 1 + 4 + 1 lag, 32-bit, continuous mode, initial 0xff
	tx_spmode = tmr;

	cmd = PIN_CLK - PIN_DO;  if(abs(cmd) > 3)  return STA_NOINIT;    // clock pin too distant
	tmr = P_SYNC_RX | (cmd & 7) << 24;  // rx smartpin mode and clock pin offset
	_pinstart(PIN_DO, tmr, 7 | 32, 0);  // 8-bit, late late sampling, NOTE: also hard coded in pasm rx loop
	// late late sampling helps with achieving reliable sysclock/8 divider across the whole spectrum
#else
	CS_INIT(); CS_H();    // Initialize port pin tied to CS
	CK_INIT(); CK_L();    // Initialize port pin tied to SCLK
	DI_INIT();    // Initialize port pin tied to DI
	DO_INIT();    // Initialize port pin tied to DO
#endif

	rcvr_mmc(buf, 10);  // Apply 80 dummy clocks and the card gets ready to receive command
	res = send_cmd(CMD0, 0);  // Enter Idle state
	deselect();
	rcvr_mmc(buf, 10);  // Apply 80 dummy clocks and the card gets ready to receive command

	ty = 0;
	if (send_cmd(CMD0, 0) == 1) {    // Enter Idle state
#ifdef _DEBUG_SDMM
		printf("idle OK\n");
#endif
		if (send_cmd(CMD8, 0x1AA) == 1) {    // SDv2?
			rcvr_mmc(buf, 4);    // Get trailing return value of R7 resp
			if (buf[2] == 0x01 && buf[3] == 0xAA) {    // The card can work at vdd range of 2.7-3.6V
				for (tmr = 1000; tmr; tmr--) {    // Wait for leaving idle state (ACMD41 with HCS bit)
					if (send_cmd(ACMD41, 1UL << 30) == 0) break;
					dly_us(1000);
				}
				if (tmr && send_cmd(CMD58, 0) == 0) {    // Check CCS bit in the OCR
					rcvr_mmc(buf, 4);
					ty = (buf[0] & 0x40) ? CT_SD2 | CT_BLOCK : CT_SD2;    // SDv2
				}
			}
		} else {    // SDv1 or MMCv3
			if (send_cmd(ACMD41, 0) <= 1) {
				ty = CT_SD1; cmd = ACMD41;    // SDv1
			} else {
				ty = CT_MMC; cmd = CMD1;    // MMCv3
			}
			for (tmr = 1000; tmr; tmr--) {    // Wait for leaving idle state
				if (send_cmd(cmd, 0) == 0) break;
				dly_us(1000);
			}
			if (!tmr || send_cmd(CMD16, 512) != 0) {    // Set R/W block length to 512
				//printf("tmr = %d\n", tmr);
				ty = 0;
			}
		}
	}
#ifdef _DEBUG_SDMM
	printf("ty = %d\n", ty);
#endif
	CardType = ty;
	s = ty ? 0 : STA_NOINIT;
	Stat = s;

	deselect();

	return s;
}



/*-----------------------------------------------------------------------*/
/* Read Sector(s)                                                        */
/*-----------------------------------------------------------------------*/

DRESULT SD_disk_read (
	BYTE *buff,			/* Pointer to the data buffer to store read data */
	LBA_t blkadr,		/* Start block number (LBA) */
	UINT count			/* Sector count (1..128) */
)
{
	DWORD  blknum = _low(blkadr);
	BYTE cmd;
	BYTE res;

#ifdef _DEBUG_SDMM_ACCESSES
	printf(" sdrd=%lu ",blknum);
#endif
	if (SD_disk_status() & STA_NOINIT) return RES_NOTRDY;
	if (!(CardType & CT_BLOCK)) blknum *= 512;	/* Convert LBA to byte address if needed */
#ifdef _smartpins_mode_eh
	if( _clockfreq() != oldclkfreq )  set_divider();
#endif

	cmd = count > 1 ? CMD18 : CMD17;			/*  READ_MULTIPLE_BLOCK : READ_SINGLE_BLOCK */
	if (send_cmd(cmd, blknum) == 0) {
		do {
			if (!rcvr_datablock(buff, 512)) break;
			buff += 512;
		} while (--count);
		if (cmd == CMD18) res = send_cmd(CMD12, 0);	/* STOP_TRANSMISSION */
	}
	deselect();

	return count ? RES_ERROR : RES_OK;
}



/*-----------------------------------------------------------------------*/
/* Write Sector(s)                                                       */
/*-----------------------------------------------------------------------*/

DRESULT SD_disk_write (
	const BYTE *buff,	/* Pointer to the data to be written */
	LBA_t blkadr,		/* Start block number (LBA) */
	UINT count			/* Sector count (1..128) */
)
{
	DWORD  blknum = _low(blkadr);
	BYTE res;

#ifdef _DEBUG_SDMM_ACCESSES
	printf(" sdwr=%lu ",blknum);
#endif
	if (SD_disk_status() & STA_NOINIT) return RES_NOTRDY;
	if (!(CardType & CT_BLOCK)) blknum *= 512;	/* Convert LBA to byte address if needed */
#ifdef _smartpins_mode_eh
	if( _clockfreq() != oldclkfreq )  set_divider();
#endif

	if (count == 1) {	/* Single block write */
		if ((send_cmd(CMD24, blknum) == 0)	/* WRITE_BLOCK */
			&& xmit_datablock(buff, 0xFE))
			count = 0;
	}
	else {				/* Multiple block write */
		if (CardType & CT_SDC) res = send_cmd(ACMD23, count);
		if (send_cmd(CMD25, blknum) == 0) {	/* WRITE_MULTIPLE_BLOCK */
			do {
				if (!xmit_datablock(buff, 0xFC)) break;
				buff += 512;
			} while (--count);
			if (!xmit_datablock(0, 0xFD))	/* STOP_TRAN token */
				count = 1;
		}
	}
	deselect();

	return count ? RES_ERROR : RES_OK;
}


/*-----------------------------------------------------------------------*/
/* Miscellaneous Functions                                               */
/*-----------------------------------------------------------------------*/

static DWORD  disc_size(
    uint8_t *csd
)
{
    DWORD cs;
    UINT n;

    if( csd[0]>>6 == 1) { // SDC ver 2.00
        cs = ((DWORD)(csd[7] & 63) << 16) + ((WORD)csd[8] << 8) + csd[9] + 1;    // CSIZE + 1
        n = 10;
    } else {    // SDC ver 1.00
        cs = ((WORD)(csd[6] & 3) << 10) + ((WORD)csd[7] << 2) + (csd[8] >> 6) + 1;    // CSIZE + 1
        n = (csd[5] & 15) + ((csd[9] & 3) << 1) + ((csd[10] & 128) >> 7) + 2 - 9;
    }
    return cs << n;    // 32-bit block count
}



DRESULT SD_disk_ioctl (
	UINT ctrl,		/* Control code */
	BYTE *buff		/* Buffer to send/receive control data */
)
{
	DRESULT res;
	BYTE n, csd[16];
	DWORD status = SD_disk_status();

#ifdef _DEBUG_SDMM
	printf(" sdio=%d ",ctrl);
#endif
	if (status & STA_NOINIT) return RES_NOTRDY;	/* Check if card is in the socket */
#ifdef _smartpins_mode_eh
	if( _clockfreq() != oldclkfreq )  set_divider();
#endif

	res = RES_ERROR;
	switch (ctrl) {
		case CTRL_SYNC :		/* Make sure that no pending write process */
			if (select()) res = RES_OK;
			break;

		case GET_SECTOR_COUNT :	/* Get number of sectors on the disk (DWORD) */
			if ((send_cmd(CMD9, 0) == 0) && rcvr_datablock(csd, 16)) {
               			*(DWORD *)buff = disc_size(csd);
				res = RES_OK;
			}
			break;

		case GET_BLOCK_SIZE :	/* Get erase block size in unit of sector (DWORD) */
			*(DWORD*)buff = 128;
			res = RES_OK;
			break;

		default:
			res = RES_PARERR;
	}

	deselect();

	return res;
}



//
// new routine: deinitialize (clean up pins, if necessary)
//
DSTATUS SD_disk_deinitialize( void )
{
#ifdef _smartpins_mode_eh
	int PIN_CLK = PASM("mov r0,#_SD_CK");
	int PIN_DO = PASM("mov r0,#_SD_DO");
	int PIN_DI = PASM("mov r0,#_SD_DI");
	int PIN_SS = PASM("mov r0,#_SD_CS");

#ifdef _DEBUG_SDMM
    printf("clear pins %d %d %d %d\n", PIN_CLK, PIN_SS, PIN_DI, PIN_DO);
#endif
    deselect();
    _pinclear(PIN_DO);
    _pinclear(PIN_DI);
    _pinclear(PIN_CLK);
    _pinh(PIN_CLK);
    _waitus(1);
    _pinf(PIN_CLK);
    _pinf(PIN_SS);
#endif

    return 0;
}

