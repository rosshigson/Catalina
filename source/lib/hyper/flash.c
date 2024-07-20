/* 
 * Propeller 2 basic Hyper RAM driver wrapper
 * ==========================================
 * 
 * This software contains a minimal interface layer to use the Hyper RAM driver 
 * from C for a board with 16MB of Hyper RAM such as the Parallax HyperFlash/
 * HyperRAM add-on board on a P2_EVAL, P2_EDGE or a similar setup. 
 *
 * Both RAM and Flash operations are suported. Only a single memory bus is 
 * supported. Polled operations and callbacks are not supported. 
 *
 * The HyperRAM and HyperFlash sizes and addressing are specified in the 
 * appropriate platform.inc file in the target/p2 directory. For example, 
 * in P2_EVAL.inc, P2_EDGE.inc and P2_CUSTOM.inc:
 *
 *    The 16MB HyperRAM is mapped to address space 0-0x0ffffff
 *    The 32MB HyperFlash is mapped to address space 0x2000000-0x3ffffff
 *
 * See also the file HYPER.spin2 in the target/p2 directory for how this
 * configuration data is used to configure the HYPER plugin.
 *
 * This mapping could be altered by modifying the bank array assignments 
 * at setup time. Sometimes is is handy to situate memory at addresses beyond
 * the hub address range so you can easily differentiate between internal 
 * and external addresses and share a "common" address space. However, 
 * note that the Catalina XMM kernel does this automatically when XMM LARGE
 * mode is used, which means the same configuration data can be used for 
 * both XMM SMALL and XMM LARGE programs.
 *
 */

#include <prop.h>
#include <prop2.h>
#include <plugin.h>
#include <hyper.h>

extern int32_t hyper_initialize();
extern int32_t hyper_getDriverLock();
extern int32_t hyper_readRaw(void *addr, int32_t addrhi16, int32_t addrlo32);
extern int32_t hyper_writeRaw(void *addr, int32_t addrhi16, int32_t addrlo32, int32_t value16);
extern int32_t hyper_getFlashSize(void *addr);
extern int32_t hyper_getFlashBurstSize(void *addr);
extern int32_t hyper_modifyBankParams(void *addr, uint32_t andmask, uint32_t ormask);

/*
 * internal method to set the flash bank access protection flag and active COG using it
 */
static int32_t hyper_setFlashAccess(void *addr, int32_t protected) {
   int32_t r;
   int32_t driverlock;
   static int32_t flashCog = -1; // which cog has locked the flash

   driverlock = hyper_getDriverLock(); // this initializes
   if ((r = hyper_getFlashSize(addr)) < 0) {  // ensure we are modifying a flash bank
      return r;
   }

   while (!(_locktry(driverlock))) {
     _waitms(1);
   }
   if (protected) { // COG wants to lock exclusive access to the flash
      if (flashCog < 0) {  // resource is free
         flashCog = _cogid(); // assign it to this COG ID
      }
      else if (flashCog != _cogid()) { // already taken by some other COG
         _lockclr(driverlock);
         return ERR_BUSY; // another COG is using the flash
      }
   }
   else { // COG wants to free the flash
      if (flashCog < 0) { // already free, NOP
         _lockclr(driverlock);
         return 0;
      }
      if (flashCog == _cogid()) {
         flashCog = -1; // only we can free it
      }
      else { 
         _lockclr(driverlock);
         return ERR_INVALID; // we don't have the lock
      }
   }
   r = (hyper_modifyBankParams(addr, 0xFFF8F7FF, (protected) ? (_cogid() << 16) + F_PROTFLAG : 0));
   // driver lock was released by hyper_modifyBankParams unless an error occurred perhaps
   if (r < 0) {
      _lockclr(driverlock);
   }
   return r;
}

/*
 * exclusively locks out the flash for the calling COGs use
 */
int32_t hyper_lockFlashAccess(void *addr) {
   return hyper_setFlashAccess(addr, -1);
}

/*
 * unlocks the flash for any COG to use
 */
int32_t hyper_unlockFlashAccess(void *addr) {
    return hyper_setFlashAccess(addr, 0);
}

/*
 * hyper_readReg(addr, regAddr) - Read a register from the external memory device
 * 
 * Arguments:
 *   addr - (any) memory address of the device to access
 *   regAddr - word address of the device register to read
 * 
 * Returns: 16 bit register data or a negative error code
 *
 * Note: regAddr is a 16 bit address in the device, not a byte address
 */
int32_t hyper_readReg(void *addr, int32_t regAddr) {
   return hyper_readRaw(addr, 0xE000 + ((uint32_t)regAddr >> 19), ((uint32_t)regAddr & 7) + (((uint32_t)regAddr>>3)<<16));
}

/*
 * hyper_writeReg(addr, regAddr, value16)
 *
 * Read a register from the external memory device
 *
 * Arguments:
 *  addr - (any) memory address of the device to access
 *  regAddr - word address of the device register to write
 *  value16 - data value to write into device register
 *
 * Returns: 0 for success or a negative error code
 *
 * Note: regAddr is a 16 bit address in the device not a byte address
 */
int32_t hyper_writeReg(void *addr, int32_t regaddr, int32_t value16) {
   return hyper_writeRaw(addr, 0x6000 + ((uint32_t)regaddr >> 19), ((uint32_t)regaddr & 7) + (((uint32_t)regaddr>>3)<<16), value16);
}

/*
 * internal method to erase single sector identified by addr or the entire chip
 */
static int32_t erase(void *addr, int32_t flags, int32_t maxWaitMs) {
   int32_t r, sa, starttime, cmd, size, lastval;
   uint32_t elapsed, delta;

   size = hyper_getFlashSize(addr); // this initializes
   if (size < 0) {
      return ERR_NOT_FLASH;
   }
   if (flags & ERASE_SECTOR_256K) {
      sa = ((uint32_t)addr & ((uint32_t)size-1)) >> 1;
      cmd = 0x30;
   }
   else if (flags & ERASE_ENTIRE_FLASH) {
      sa = 0x555;
      cmd = 0x10;
   }
   else {
      return ERR_INVALID;
   }

   // 'fast blank check avoids need to erase sector again if found to already be erased
   if (flags & ERASE_SECTOR_256K) {
      if (r = hyper_writeReg(addr, (sa & ~0x1ffff)+0x555, 0x33)) { // blank check the sector
         return r;
      }
      _waitms(25); // give it enough time to execute, takes 15-17ms according to data sheet
      // check for completion or time out on failure
      if ((r = hyper_writeReg(addr, 0x555, 0x70)) == 0) {
         r = hyper_readReg(addr, 0);
      }
      if (r < 0) {
         return r;
      }
      if ((r & (1<<FLASH_STATUS_DRB)) == 0)  { // not good, we may need a HW reset
         return ERR_FLASH_TIMEOUT;
      }
      if ((r & (1<<FLASH_STATUS_ESB)) == 0) { // check if we are already erased
         return 0; // sector is already erased, so nothing more to do
      }
      else {
         // need to clear the status register
         hyper_writeReg(addr, 0x555, 0x71);
      }
   }

   if ((r = hyper_writeReg(addr, 0x555, 0xAA)) || (r = hyper_writeReg(addr, 0x2AA, 0x55))
   ||  (r = hyper_writeReg(addr, 0x555, 0x80)) || (r = hyper_writeReg(addr, 0x555, 0xAA))
   ||  (r = hyper_writeReg(addr, 0x2AA, 0x55)) || (r = hyper_writeReg(addr, sa, cmd))) {
      return r;
   }

   // poll for completion or time out on failure
   starttime = _cnt(); // get initial starting time
   elapsed = 0;
   lastval = 0;
   do {
      // read flash status 
      if ((r = hyper_writeReg(addr, 0x555, 0x70)) == 0) {
         r = hyper_readReg(addr, 0);
      }
      if (r < 0) {
         return r;
      }
      delta = _cnt() - starttime;  // compute elapsed ticks, need to deal with wraparound 
      if (delta > (_clockfreq()/1000)) { // TODO: this timing code seems messy/overly complex
         elapsed += delta / (_clockfreq()/1000);
         starttime += (delta - (delta%(_clockfreq()/1000)));
      }
      _waitms(10); // be nice and don't just hammer the control mailbox
   } while (!((r & (1 << FLASH_STATUS_DRB)) || (elapsed > maxWaitMs)));

   // Timeout if not completed within the expected time. Something went badly wrong with the flash 
   // access and it may now need a RESET to fix?
   if ((r & (1 << FLASH_STATUS_DRB)) == 0) {
      return ERR_FLASH_TIMEOUT;
   }

   // clear the status register
   hyper_writeReg(addr, 0x555, 0x71);
   // check for successful erasure
   if (r & (1 << FLASH_STATUS_ESB)) {
      if (r & (1 << FLASH_STATUS_SLSB)) {
         return ERR_FLASH_LOCKED;
      }
      return ERR_FLASH_ERASE;
   }
   return 0;
}

/*
 * hyper_eraseFlash - erases either a single sector or the entire HyperFlash memory
 * 
 * Erases a single HyperFlash sector or the entire device.
 *
 * Arguments:
 * addr - (any) address of HyperFlash sector or HyperFlash device memory to be erased
 * flags - indicates how and what to erase based on a selection of these flags:
 *          ERASE_ENTIRE_FLASH - the whole device will be erased (warning very slow)
 *          ERASE_SECTOR_256K - a single 256kB sector will be erased
 *          
 * Returns: 0 on success or negative error code
 *
 * If the non-blocking erase mode is selected, the device must continue to be polled periodially to 
 * check for erase success/failure, by calling pollEraseStatus(addr). 
 */
int32_t hyper_eraseFlash(void *addr, int32_t flags) {
   int32_t r, timeout, offset;

    hyper_initialize(); // initialize if not already
    // lookup execution timing information for typical erase timeout
    offset = ((flags & ERASE_ENTIRE_FLASH) ? 1 : 0);
    if ((r = hyper_readFlashInfo(addr, 0x21+offset)) < 0) {
        return r;
    }

    // ensure erase operation is supported by device
    if (r == 0) {
        return ERR_UNSUPPORTED;
    }

    // lookup max timeout multiplier
    if ((timeout = hyper_readFlashInfo(addr, 0x25+offset)) < 0) {
        return timeout;
    }

    // compute timeout interval in milliseconds
    timeout = (1 << r) * (1 << timeout); 

    // check if we are addressing some HyperFlash and protect it
    if ((r = hyper_lockFlashAccess(addr)) < 0) {
        return r;
    }

    // erase the flash
    r = erase(addr, flags, timeout);

    hyper_unlockFlashAccess(addr);
    return r;
}

/*
 * internal general HyperFlash programming method
 */
static int32_t programFlashLine(void *addr, void *srcHubAddr, uint32_t count) {
   int32_t r;
   uint32_t bank, starttime, elapsed;

   // check arguments
   if (count == 0) { 
       return 0;
   }
   if (((uint32_t)addr & 1) || (count & 1)) {
      return ERR_ALIGNMENT;    // word addresses and whole word sizes only
   }
   if ((count + ((uint32_t)addr & 0x1ff)) > 512) { 
      return ERR_ALIGNMENT;    // single line writes only
   }

   if ((r = hyper_lockFlashAccess(addr)) < 0) {
      return r;
   }
   // start programming sequence
   if ((r = hyper_writeReg(addr, 0x555, 0xAA)) 
   ||  (r = hyper_writeReg(addr, 0x2AA, 0x55)) 
   ||  (r = hyper_writeReg(addr, 0x555, 0xA0))) {
      hyper_unlockFlashAccess(addr);
      return r;
   }

   // send the data as a burst
   if ((r = hyper_write(srcHubAddr, addr, count)) < 0) {
      hyper_unlockFlashAccess(addr);
      return r; // failing here means we're sort of hosed now, and flash would need to be reset to recover
   }
   
   // poll for completion or time out on failure
   starttime = _cnt(); // get initial starting time
   elapsed = 0;
   do {
      // read flash status 
      if ((r = hyper_writeReg(addr, 0x555, 0x70)) == 0) {
         r = hyper_readReg(addr, 0);
      }
      if (r < 0) {
         hyper_unlockFlashAccess(addr);
         return r;
      }
      elapsed = _cnt() - starttime;  // compute elapsed ticks, no need to worry about timer wrap here
      elapsed = elapsed/(_clockfreq()/1000); // convert to milliseconds
      _waitus(100); // be nice to the shared mailbox
   }
   while (!((r & (1 << FLASH_STATUS_DRB)) || (elapsed > FLASH_PROG_TIMEOUT)));

   // Timeout if not complete within the expected time. Something went badly wrong with the flash access
   // and it may now need a RESET to fix?
   if ((r & (1 << FLASH_STATUS_DRB)) == 0) {
      hyper_unlockFlashAccess(addr);
      return ERR_FLASH_TIMEOUT;
   }

   // clear the status register
   hyper_writeReg(addr, 0x555, 0x71);

   // free up flash
   hyper_unlockFlashAccess(addr);

   // check for successful programming
   if (r & (1 << FLASH_STATUS_PSB)) {
      if (r & (1<< FLASH_STATUS_SLSB)) {
         return ERR_FLASH_LOCKED;
      }
      return ERR_FLASH_PROGRAM;
   }

   return 0;
}

/*
 * eraseFlash(addr, flags)
 *
 * Erases a single HyperFlash sector or the entire device.
 * 
 * Arguments:
 *   addr - (any) address of HyperFlash sector or HyperFlash device memory to be erased
 *   flags - indicates how and what to erase based on a selection of these flags:
 *            ERASE_ENTIRE_FLASH - the whole device will be erased (warning very slow)
 *            ERASE_SECTOR_256K - a single 256kB sector will be erased
 *            
 * Returns: 0 on success or negative error code
 * 
 * If the non-blocking erase mode is selected, the device must continue to be polled periodially to 
 * check for erase success/failure, by calling pollEraseStatus(addr). 
 */
int32_t eraseFlash(void *addr, uint32_t flags) {
    int32_t r, timeout, offset;

    // lookup execution timing information for typical erase timeout
    offset = ((flags & ERASE_ENTIRE_FLASH) ? 1 : 0);
    if ((r = hyper_readFlashInfo(addr, 0x21+offset)) < 0) {
       return r;
    }
    //  ensure erase operation is supported by device
    if (r == 0) { 
       return ERR_UNSUPPORTED;
    }
    //  lookup max timeout multiplier
    if ((timeout = hyper_readFlashInfo(addr, 0x25+offset)) < 0) {
       return timeout;
    }
    //  compute timeout interval in milliseconds
    timeout = (1 << r) * (1 << timeout);

    //  check if we are addressing some HyperFlash and protect it
    if ((r = hyper_lockFlashAccess(addr)) < 0) {
       return r;
    }

    //  erase the flash
    r = erase(addr, flags, timeout);

    //  only remove protection if there was an error
    if (r != 0) {
       hyper_unlockFlashAccess(addr);
    }
   return r;
}

/*
 * hyper_programFlash - writes a block of HUB RAM into HyperFlash memory
 *
 * Programs HyperFlash memory using a block of data in HUB RAM.  Assumes the sectors are already
 * erased by default however this behaviour can be overriden by flags (see below).
 *
 * Arguments:
 *   addr - start address of HyperFlash memory to be programmed
 *   srcHubAddr - start address of HUB RAM block to be programmed into flash
 *   byteCount - number of bytes to program into HyperFlash
 *  
 *     flags   - optional flags can be set to 0 for no erase or to one of the following values
 *               to automatically erase the device:
 *               ERASE_ENTIRE_FLASH - entire chip will be erased first prior to programming
 *               ERASE_SECTOR_256K - any spanned sectors will first be erased as required
 *         
 *  Returns: 0 for success, or negative error code
 *  
 *  Flash will be programmed assuming data is already erased, but if there are binary zeroes in
 *  the address accessed, the new data will be ANDed with the existing value at that address.
 */
int32_t hyper_programFlash(void *addr, void *srcHubAddr, uint32_t byteCount, int32_t flags) {
   int32_t r, size, burst, written, stop;
   void *eraseAddr;
   uint32_t origCount;

   // check arguments
   if (byteCount == 0) { 
      return 0;
   }

   // check for flash address and retrieve its size (and initialize)
   if ((size = hyper_getFlashSize(addr)) < 0) { 
      return size;
   }

   // get current flash maximum burst size
   if ((burst = hyper_getFlashBurstSize(addr)) < 0) { 
      return burst;
   }

   // writes are done at sysclk/2 so halve the maximum burst allowed
   burst = (burst / 2) & ~1;

   // prevent address overflow by limiting to end of flash if the size wraps
   if (byteCount + ((uint32_t)addr & (size-1)) > size) { 
      byteCount = size - ((uint32_t)addr & (size-1));
   }

   // track counts
   origCount = byteCount;
   stop = 0;
   // erase as needed
   flags &= (ERASE_SECTOR_256K | ERASE_ENTIRE_FLASH);
   if (flags & ERASE_SECTOR_256K) {
      eraseAddr = addr; 
      do {
         if (r = eraseFlash(eraseAddr, flags)) {
            return r;
         }
         eraseAddr = (char *)eraseAddr + ERASE_SECTOR_256K;
      }
      while ((uint32_t)eraseAddr < (uint32_t)addr + byteCount);
   }
   else if (flags & ERASE_ENTIRE_FLASH) {
      if (r = eraseFlash(eraseAddr, flags)) {
         return r;
      }
   }

   written = (int32_t)addr & 1;
   // handle odd start address case
   if (written) {
      if ((r = hyper_programFlashByte(addr, *((uint8_t *)srcHubAddr))) < 0) {
         return r;
      }
      if (--byteCount == 0) { 
         return r;
      }
      addr = (char *)addr + 1;
      srcHubAddr = (char *)srcHubAddr + 1;
   }

   // send flash data lines
   do {
      size = 512 - ((uint32_t)addr & 0x1ff); // compute bytes left in line
      if (size > burst) {
         size = burst; // fragment the write burst for QoS
      }
      if (size > byteCount) { 
         size = byteCount & ~1; // don't send more data than required
      }
      if ((r = programFlashLine(addr, srcHubAddr, size)) < 0) {
         return r;
      }
      addr = (char *)addr + size;
      srcHubAddr = (char *)srcHubAddr + size;
      byteCount -= size;
      written += size;
   }
   while (!(byteCount < 2)); 

   // handle last byte if count was odd
   if (byteCount) {
      r = hyper_programFlashByte(addr, *((uint8_t *)srcHubAddr));
      written++;
   }

   return r;
}

/*
 * hyper_programFlashByte - writes a single byte into HyperFlash memory
 *
 * Programs HyperFlash memory with single data elements.
 *
 * Arguments:
 *   addr - address of HyperFlash memory to be programmed
 *   data - data to program into to HyperFlash
 *
 * Returns: 0 for success, or negative error code
 * 
 * Flash will be programmed assuming data is already erased, but if there are binary zeroes in
 * the address accessed, the new data will be ANDed with the existing value at that address.
 */
int32_t hyper_programFlashByte(void *addr, int32_t data) {
    int32_t r;
    // check if we are addressing some HyperFlash (and initialize)
    if ((r = hyper_getFlashSize(addr)) < 0) {
        return r;
    } 
    if ((uint32_t)addr & 1) { // odd address
        data = (data << 8) | 0xff;
        addr = (char *)addr - 1;
    }
    else {
        data = data | 0xff00;
    }
    return programFlashLine(addr, &data, 2);
}

/*
 * hyper_programFlashWord - writes a single word into HyperFlash memory
 *
 * Programs HyperFlash memory with single data elements.
 *
 * Arguments:
 *   addr - address of HyperFlash memory to be programmed
 *   data - data to program into to HyperFlash
 *
 * Returns: 0 for success, or negative error code
 * 
 * Flash will be programmed assuming data is already erased, but if there are binary zeroes in
 * the address accessed, the new data will be ANDed with the existing value at that address.
 */
int32_t hyper_programFlashWord(void *addr, int32_t data) {
   int32_t r;
   // check if we are addressing some HyperFlash (and initialize)
   if ((r = hyper_getFlashSize(addr)) < 0) {
      return r;
   } 
   if ((uint32_t)addr & 1) { // writing word to an odd address
      data = 0xff000000 | ((data & 0xffff) << 8) | 0xff;
      addr = (char *)addr - 1;
      // splitting this will account for any 512 byte line wrap possibility
      if ((r = programFlashLine(addr, &data, 2)) || (r = programFlashLine((char *)addr+2, ((char *)&data)+2, 2))) {
         return r;
      }
   }
   else {
      r = programFlashLine(addr, &data, 2);
   }
   return r;
}

/*
 * hyper_programFlashLong - writes a single long into HyperFlash memory
 *
 * Programs HyperFlash memory with single data elements.
 *
 * Arguments:
 *   addr - address of HyperFlash memory to be programmed
 *   data - data to program into to HyperFlash
 *
 * Returns: 0 for success, or negative error code
 * 
 * Flash will be programmed assuming data is already erased, but if there are binary zeroes in
 * the address accessed, the new data will be ANDed with the existing value at that address.
 */
int32_t hyper_programFlashLong(void *addr, int32_t data) {
   int32_t r;
   // split into two word writes in case data crosses a boundary
   if ((r = hyper_programFlashWord(addr, (uint32_t)data & 0xffff)) 
   ||  (r = hyper_programFlashWord((char *)addr+2, (uint32_t)data >> 16))) {
      return r;
   }
  return r; 
}

/*
 * internal general method to read special HyperFlash registers
 */
static int32_t readFlashSR(void *addr, int32_t cmd) {
   int32_t r;
   // check if we are addressing some HyperFlash and protect it (and initialize)
   if ((r = hyper_lockFlashAccess(addr)) < 0) {
      return r;
   }
   // send ICR read sequence
   if ((r = hyper_writeReg(addr, 0x555, 0xAA)) == 0) {
      if ((r = hyper_writeReg(addr, 0x2AA, 0x55)) == 0) {
         if ((r = hyper_writeReg(addr, 0x555, cmd)) == 0) {
            r = hyper_readReg(addr, 0);
         }
      }
   }
   hyper_unlockFlashAccess(addr);
   return r;
}

/*
 * hyper_readFlashInfo - reads HyperFlash device information
 *
 * method to read HyperFlash device information word, returns ERR_BUSY if some other COG is also accessing it
 * addr - identifies HyperFlash device
 * wordoffset - offset or information word to read from ID-CFI overlay
 * returns 16 bit data or negative error code
 */
int32_t hyper_readFlashInfo(void *addr, int32_t wordoffset) {
   int32_t r, i;

   // check if we are addressing some HyperFlash and protect it (and initialize)
   if ((r = hyper_lockFlashAccess(addr)) < 0) {
      return r;
   }
   // enable ID-CFI overlay starting at word 0
   if ((r = hyper_writeReg(addr, 0x555, 0x98)) == 0) {
      r = hyper_readReg(addr, wordoffset);
   }
   // exit ASO Map
   hyper_writeReg(addr, 0, 0xf0);
   hyper_unlockFlashAccess(addr);
   return r;
}

/*
 * hyper_readFlashStatus - reads the HyperFlash status register
 *
 * method to read HyperFlash status register or ERR_BUSY if some other COG is also accessing it
 * addr - external address identifies HyperFlash device
 * returns 16 bit status register or negative error code
 */
int32_t hyper_readFlashStatus(void *addr) {
   int32_t r;
   if ((r = hyper_lockFlashAccess(addr)) < 0) { // this initializes
      return r;
   }
   if ((r = hyper_writeReg(addr, 0x555, 0x70)) == 0) {
      r = hyper_readReg(addr, 0);
   }
   hyper_unlockFlashAccess(addr);
   return r;
}

/*
 * hyper_clearFlashStatus - clears the HyperFlash status register
 *
 * method to clear HyperFlash status register, returns ERR_BUSY if some other COG is also accessing it
 * addr - external address identifies HyperFlash device
 * returns 0 for success or negative error code
 */
int32_t hyper_clearFlashStatus(void *addr) {
   int32_t r;
   if ((r = hyper_lockFlashAccess(addr)) < 0) { // this initializes
      return r;
   }
   r = hyper_writeReg(addr, 0x555, 0x71);
   hyper_unlockFlashAccess(addr);
   return r;
}

/*
 * hyper_readFlashICR - reads Interrupt Configuration Register in HyperFlash
 */
int32_t hyper_readFlashICR(void *addr) {
   return readFlashSR(addr, 0xC4);
}

/*
 * hyper_readFlashISR - reads Interrupt Status Register in HyperFlash
 */
int32_t hyper_readFlashISR(void *addr) {
   return readFlashSR(addr, 0xC5);
}

/*
 * hyper_readFlashNVCR - reads Non-Volatile Configuration Register in HyperFlash
 */
int32_t hyper_readFlashNVCR(void *addr) {
   return readFlashSR(addr, 0xC6);
}

/*
 * hyper_readFlashVCR - reads Volatile Configuration Register in HyperFlash
 */
int32_t hyper_readFlashVCR(void *addr) {
   return readFlashSR(addr, 0xC7);
}

/*
 * internal general method to write HyperFlash registers
 */
static int32_t writeFlashSR(void *addr, int32_t cmd, int32_t data) {
   int32_t r;
   // check if we are addressing some HyperFlash and protect it (and initialize)
   if ((r = hyper_lockFlashAccess(addr)) < 0) {
      return r;
   }
   // send VCR read sequence
   if ((r = hyper_writeReg(addr, 0x555, 0xAA)) == 0) {
      if ((r = hyper_writeReg(addr, 0x2AA, 0x55)) == 0) {
         if ((r = hyper_writeReg(addr, 0x555, cmd)) == 0) {
            r = hyper_writeReg(addr, 0, data);
         }
      }
   }
   hyper_unlockFlashAccess(addr);
   return r;
}

/*
 * hyper_writeFlashICR - writes Interrupt Configuration Register in HyperFlash
 */
int32_t hyper_writeFlashICR(void *addr, int32_t data) {
   return writeFlashSR(addr, 0x36, data);
}

/*
 * hyper_writeFlashISR - writes Interrupt Status Register in HyperFlash
 */
int32_t hyper_writeFlashISR(void *addr, int32_t data) {
   return writeFlashSR(addr, 0x37, data);
}

/*
 * hyper_writeFlashVCR - writes Volatile Configuration Register in HyperFlash
 */
int32_t hyper_writeFlashVCR(void *addr, int32_t data) {
   return writeFlashSR(addr, 0x38, data);
}

/* 
 * -------------
 * LICENSE TERMS
 * -------------
 * Copyright 2020, 2021 Roger Loh
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in 
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
 * THE SOFTWARE.
 */

