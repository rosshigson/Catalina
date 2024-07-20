#ifndef _SPI__H
#define _SPI__H

/*
 * This plugin is based on Mike Green's sdspiFemto Spin object, and supports 
 * both an I2C and SPI Bus. The I2C bus is intended for use in communicating 
 * with an EEPROM, and the SPI bus is intended for use communicating with
 * an SD Card. The EEPROM functions should  work on all Propellers, and 
 * the SD Card functions should work with the SD Cards on all Propellers 
 * except the C3 (which requires additional select logic to select amongst 
 * various devices that share the SPI bus). However, the existing Catalina 
 * SD Plugin supprts the C3.
 *
 * These library routines allocate a lock to prevent contention, so they are 
 * safe for use with a multithreading kernel.
 *
 * The following notes are from Mike Green's original Spin version:
 *
 * This object provides an I2C EEPROM read/write routine that can handle both 100KHz and
 * 400KHz bus speeds and EEPROM page sizes of 64, 128, or 256 bytes (or no paging/no delay
 * as with Ramtron serial RAM).  The SPIN interpreter can be started after reading, either
 * in the same COG used by these routines or in a free COG.  The control information is
 * passed in a 2 long parameter block whose address is passed to the COG when it is started.
 * The parameter block is updated when the operation is completed.  Note that these are shown
 * here as they appear in a long value rather than the order of the bytes in memory.
 * 
 * -------------------------------------------------------------------
 * |   cmd/status   |          I/O pin / device / address            |
 * -------------------------------------------------------------------
 * |           byte count           |          HUB address           |
 * -------------------------------------------------------------------
 * 
 * The EEPROM address is in the same format used by other routines with the I/O pin pair
 * in bits 21..19, the device address in bits 18..16, and the 64K address in bits 15..0.
 * Note that the I/O pin pair is the number of the SCL pin divided by 2.  The SDA pin is
 * always the next higher numbered pin.  The command code is in the low order bits of the
 * high order byte of the first long (see ioCmdMask).  This is always non-zero to indicate
 * that a command is to be performed by the COG routines.  When the command is finished,
 * this is set to zero.  The errorFlag bit is set to one if a NAK was read after a write
 * transfer.  This is the only error reported by these routines.  A read operation and
 * zero-length writes do involve several write transfers for addressing, but the data
 * read transfer has no error checking.  When the command is completed, the device address,
 * byte count, and HUB address are all updated to their values at that time.  For the
 * verify operation (ioVerifyCmd), an error is reported if the checksum is not zero and
 * the HUB address field is not incremented.  It may be used for some other checksum
 * reporting in the future.
 * 
 * The pins used for the boot EEPROM I2C bus (at least on Parallax's Demo Board) do not
 * have a pullup on SCL.  This requires that SCL be driven both high and low.  If the bus
 * used is on pins 28 and 29, SCL is actively driven at all times.
 * 
 * These EEPROM read/write routines do not provide for waiting for the write to complete
 * nor do they check for paged writes.  All bytes in a multi-byte write must lie within
 * a single EEPROM page since the EEPROM write address counter wraps around at a page
 * boundary.  Similarly, for multi-byte reads, all requested bytes must lie within the
 * same device since the sequential read counter wraps around at the device boundary.
 * 
 * Command codes are provided for devices with zero, one, or two address bytes following
 * the device selection byte.  As for all I2C devices, addressing is done using write
 * mode and the device is reselected in read mode after the last address byte.  In the
 * case of ioRead0Cmd, the device is initially selected in read mode.  For 8-bit addresses,
 * the device select code is taken from bits 15-8 of the address value.  For the case
 * without address bytes, the device select code is taken from bits 7-0 of the address value.
 * These device select codes must have their least significant bit set to zero (for write
 * mode) except in the case of ioRead0Cmd where it must be set to one for proper operation.
 * 
 * SPI data is handled a little differently.  For ioSpiInit, the 6 bit pin numbers for DO,
 * Clk, DI, and CS are given from MSB to LSB of the 24 bit address field of the command and
 * are used for all further I/O operations (until an ioSpiStop is done).
 */

/*
 *  Command code and error information for SPI/I2C driver
 */

#define ioReadCmd   0x01 // %00000001            // Read from EEPROM to HUB RAM (16 bit addresses)
#define ioWriteCmd  0x02 // %00000010            // Write to EEPROM from HUB RAM (16 bit addresses)
#define ioRead1Cmd  0x03 // %00000011            // Read from a device with only 8-bit addresses
#define ioWrite1Cmd 0x04 // %00000100            // Write to a device with only 8-bit addresses
#define ioRead0Cmd  0x05 // %00000101            // Read from a device without address bytes
#define ioWrite0Cmd 0x06 // %00000110            // Write to a device without address bytes
#define ioBootCmd   0x08 // %00001000            // Read from EEPROM to HUB RAM, then start a
                                                 // new SPIN interpreter in the COG whose ID is
                                                 // supplied in the lower 3 bits of this command
                                                 // This COG is stopped before the read is done
                                                 // unless it's the one used to execute the loader

#define ioSpiInit   0x10 // %00010000            // Initialize the specified SPI bus and SD card
#define ioSpiStop   0x11 // %00010001            // Change all SD card pins to inputs
#define ioSpiRead   0x12 // %00010010            // Read one or more bytes from the SD card
#define ioSpiWrite  0x13 // %00010011            // Write one or more bytes from the SD card
#define ioSpiBoot   0x18 // %00011000            // Like ioBootCmd, but uses ioSpiRead for loading
#define ioCmdMask   0x1F // %00011111            // Used to mask off command bits
#define ioSpiMask   0x10 // %00010000            // Used to test for SPI command codes

// Options for commands

#define ioNoStore   0x20 // %00100000            // If set, data is not stored into main memory
                                                 // If ioBootCmd or ioSpiBoot, no cogs are
                                                 // stopped and a new cog is not started.
#define ioLowSpeed  0x40 // %01000000            // If set, I2C runs at 100KHz rather than 400KHz
#define ioStopLdr   0x80 // %10000000            // If set, the loader's cog is stopped after a boot

// Return status

#define ioWriteErr  0x80 // %10000000            // An error occurred during an I2C write (NAK)

#define ioTestRdy   (ioCmdMask << 24)            // Used to test 1st control long for ready
#define ioTestErr   (ioWriteErr << 24)           // Used to test 1st control long for write error

// Other constants

#define i2cBootSCL  28                           // Boot EEPROM SCL pin
#define bootAddr    (i2cBootSCL << 18)           // Address of boot EEPROM
#define clkfreqVal  0x0000                       // Current CLKFREQ value stored here
#define clksetVal   0x0004                       // Current CLKSET value stored here
#define chksumVal   0x0005                       // Checksum over memory stored here
#define vbase       0x0008                       // Length of Spin program loaded (# longs * 4)
#define dbase       0x000A                       // Address of start of stack (marker below)

// Macro to create EEPROM addr by combining SCL Pin with up to 19 bits of address
// Use this macro in the EEPROM functions to generate the address

#define EEPROM_ADDR(SCL_PIN, ADDR) ((SCL_PIN<<18)|(ADDR & 0x7FFFF))

/*
 * spi_bootEEPROM - load and run a program from EEPROM.
 *
 *  addr : the address in EEPROM (use the EEPROM_ADDR macro!)
 *
 *  NOTE: This function will return any lock allocated by the SPI code
 *        to the pool of unused locks, but it is the caller's 
 *        responsibility to ensure that any OTHER locks checked out 
 *        are returned before calling the boot function - otherwise
 *        if the program being booted uses locks, it might not be able 
 *        to allocate one! 
 */ 
extern int spi_bootEEPROM(unsigned int addr);

/*
 * spi_readEEPROM - read from EEPROM To buffer
 *
 *  addr   : address in EEPROM (use the EEPROM_ADDR macro!)
 *  buffer : buffer to read
 *  count  : count of bytes to read 
 *
 */
extern int spi_readEEPROM(unsigned int addr, void *buffer, int count);

/*
 * spi_writeEEPROM - write from buffer to EEPROM
 * 
 *  addr   : address in EEPROM (use the EEPROM_ADDR macro!)
 *  buffer : buffer to write
 *  count  : count of bytes to write 
 *
 */
extern int spi_writeEEPROM(unsigned int addr, void *buffer, int count);

/*
 * spi_checkPResence - check there is an I2C bus and EEPROM at the 
 *                     specified address. Note that this routine cannot 
 *                     distinguish between a 32Kx8 and a 64Kx8 EEPROM 
 *                     since the 16th address bit is a "don't care" for 
 *                     the 32Kx8 devices.  
 *
 *  Return true if EEPROM present, false otherwise.
 *
 *  addr   : address in EEPROM to check (use the EEPROM_ADDR macro!)
 *
 */
extern int spi_checkPresence(unsigned int addr);

/*
 * spi_writeWait - wait for EEPROM Write to finish
 *
 *  addr   : address to check
 *
 *  Return true if EEPROM present, false otherwise.
 *
 */
extern int spi_writeWait(unsigned int addr);

/*
 * spi_initSDCard - Initialize SD Card
 *
 *   DO, Clk, DI, CS : Pin numbers to use
 */
extern int spi_initSDCard(int DO, int Clk, int DI, int CS);

/*
 * spi_stopSDCard - Stop SD Card access
 */
extern int spi_stopSDCard(void);

/*
 * spi_bootSDCard - boot from an SD Card
 *
 *  addr : the address on the SDCard.
 *  count : the count of bytes to load (must be at least 16)
 *
 *  NOTE: This function will return any lock allocated by the SPI code
 *        to the pool of unused locks, but it is the caller's 
 *        responsibility to ensure that any OTHER locks checked out 
 *        are returned before calling the boot function - otherwise
 *        if the program being booted uses locks, it might not be able 
 *        to allocate one! 
 */
extern int spi_bootSDCard(unsigned int addr, int count);

/*
 * spi_readSdCard - read from SDCard to buffer
 *
 *  addr   : address on SDCard
 *  buffer : buffer to read
 *  count  : count of bytes to read 
 *
 */
extern int spi_readSDCard(unsigned int addr, void *buffer, int count);

/*
 * spi_writeSDCard - write from buffer to SDCard
 * 
 *  addr   : address on SDCard
 *  buffer : buffer to write
 *  count  : count of bytes to write 
 *
 */
extern int spi_writeSDCard(unsigned int addr, void *buffer, int count);

/*
 * spi_getControl - get an unsigned int from the control block
 *
 *    i : control block index             
 */
extern unsigned int spi_getControl(int i);

/*
 * spi_setControl - set a value in the control block
 *
 *    i : control block index
 *    value : value to set
 */
extern void spi_setControl(int i, unsigned int value);


#endif //_SPI__H
