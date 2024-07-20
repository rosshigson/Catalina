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

static int32_t *startupData = 0; 
static int32_t *deviceData  = 0;
static int32_t *QosData     = 0; 
static int32_t *mailboxes   = 0; 

static int32_t drivercog    = -1;  // COG id of driver
static int32_t driverlock   = -1;  // LOCK id of driver

static uint32_t delayTable_r[] = {         // delay profile (Hyper RAM)
   6, 92000000, 135000000, 188000000, 234000000, 280000000, 308000000, 0
};

static uint32_t delayTable_f[] = {         // delay profile (Hyper Flash)
   5, 70000000, 110000000, 160000000, 225000000, 277000000, 320000000, 0
};

/* 
 * hyper_getMailbox(cog)
 * 
 * This API return the mailbox start address in HUB RAM for a given cog.
 */
int32_t *hyper_getMailbox(int32_t cog)
{
  return (mailboxes + (cog * 3));
}

/* 
 * hyper_initialize()
 *
 * Note that since we use mailboxes in place of the normal request 
 * mechanism, we can use any allocated lock as our driverlock - we 
 * do not need to allocate a separate one.
 *
 * Returns the driver cog.
 * 
 */
int32_t hyper_initialize(void)
{
   unsigned int request;

   if (startupData == 0) {
      // find HYP - HyperFlash / HyperRAM Memory (if loaded)
      drivercog = _locate_plugin(LMM_HYP);
      if (drivercog >= 0) {
         // fetch our request block entry
         request = (*REQUEST_BLOCK(drivercog)).request;
         // lower 24 bits is our startupData pointer
         startupData = (int32_t *)(request&0x00FFFFFF);
         deviceData  = startupData + 8; // longs
         QosData     = deviceData + 32; // longs
         mailboxes   = QosData + 8; // longs
         // upper 8 bits is our lock (+1) if allocated
         driverlock = request>>24;
         if (driverlock == 0) {
            // no lock allocated yet - so allocate one (if possible)
            driverlock = _locknew();
            if (driverlock >= 0) {
               // store the allocated lock (+1) in our request block entry
               request = request | ((driverlock+1)<<24);
               (*REQUEST_BLOCK(drivercog)).request = request;
            }
         }
         else {
            // a lock has been allocated - so use it (-1)
            driverlock--;
         }
      }
   }
   return drivercog;
}

int32_t hyper_stop(void)
{
   int32_t i = 0;
   int32_t cog = -1;
   int32_t *mailbox;

   cog = hyper_initialize(); // initialize if not already, return drivercog
   if (cog != -1) {
     // a rather brutal stop
     _cogstop(cog);
     for(i = 0; i < 8; i++) {
        mailbox = hyper_getMailbox(i);
       if (mailbox[0] < 0) {
         // abort request
         mailbox[0] = -ERR_ABORTED;
       }
     }
   }
   drivercog = -1;
   if (driverlock != -1) {
     _lockret(driverlock);
     driverlock = -1;
   }
   return i;
}

/* 
 * hyper_getDriverCogId()
 * 
 * This API return the driver cog.

 */
int32_t hyper_getDriverCogId(void)
{
   hyper_initialize(); // initialize if not already
   return drivercog;
}

/* 
 * hyper_getDriverLock()
 * 
 * This API return the driver lock ID which can be taken/released 
 * to protect control mailbox requests.

 */
int32_t hyper_getDriverLock(void)
{
   hyper_initialize(); // initialize if not already
   return driverlock;
}

/*
 * hyper_getStartBank - get the starting bank for the device
 */
static int32_t hyper_getStartBank(void *addr) {
   int32_t size;
   int32_t bank;

   bank = ((uint32_t)addr >> 24) & 0xf;
   size = deviceData[bank] & 0xff;
   if (size == S_32MB) {
      bank = bank & 0xe; // %1110;
   }
   else if (size == S_64MB) {
      bank = bank & 0xc; // %1100;
   }
   else if (size == S_128MB) {
      bank = bank & 0x8; // %1000;
   }
   else if (size == S_256MB) {
      bank = 0;
   }
   else if (size > S_256MB) {
      return ERR_INVALID;
   }
   return bank;
}

/*
 * hyper_getFlashSize - return size of flash device
 */
int32_t hyper_getFlashSize(void *addr) {
   int32_t size;
   int32_t bank;

   hyper_initialize(); // initialize if not already
   // check if we are addressing some HyperFlash
   bank = ((uint32_t)addr >> 24) & 0xf;
   if ((deviceData[bank] & F_FLASHFLAG) == 0) {
      return ERR_NOT_FLASH;
   }
   size = 2 << (deviceData[bank] & 0xff);
   return size;
}

/*
 * hyper_getFlashBurstSize - return size of burst allowed to flash
 */ 
int32_t hyper_getFlashBurstSize(void *addr) {
   int32_t burstsize;
   int32_t bank;

   hyper_initialize(); // initialize if not already
   // check if we are addressing some HyperFlash
   bank = ((uint32_t)addr >> 24) & 0xf;
   if ((deviceData[bank] & F_FLASHFLAG) == 0) {
      return ERR_NOT_FLASH;
   }
   burstsize = (uint32_t)deviceData[bank] >> 16;
   return burstsize;
}

/*
 * hyper_readRaw - internally used register read method
 */
int32_t hyper_readRaw(void *addr, int32_t addrhi16, int32_t addrlo32) {
   int32_t r;
   int32_t *mailbox;

   hyper_initialize();
   mailbox = hyper_getMailbox(drivercog);
   if (mailbox[0] < 0) {
       return ERR_MAILBOX_BUSY;
   }
   while (!(_locktry(driverlock))) {
     _waitms(1);
   }
   mailbox[2] = addrlo32;
   mailbox[1] = addrhi16;
   mailbox[0] = R_GETREG + ((uint32_t)addr & 0x0f000000) + _cogid();
   do {
       r = mailbox[0];
   } while (r < 0);
   _lockclr(driverlock);
   return ((r > 0) ? -r : mailbox[1]);    // return result or negative error
}

/*
 * hyper_writeRaw - internally used write register method
 */
int32_t hyper_writeRaw(void *addr, int32_t addrhi16, int32_t addrlo32, int32_t value16) {
   int32_t r;
   uint32_t bank;
   int32_t *mailbox;

   hyper_initialize();
   mailbox = hyper_getMailbox(drivercog);
   bank = ((uint32_t)addr >> 24) & 0xf;
   if (mailbox[0] < 0) {
      return ERR_MAILBOX_BUSY;
   }
   while (!(_locktry(driverlock))) {
     _waitms(1);
   }
   mailbox[2] = addrlo32;
   mailbox[1] = (addrhi16 & 0xffff) + (value16 << 16);
   mailbox[0] = R_SETREG + ((bank & 0xf)<<24) + _cogid();
   do {
      r = mailbox[0];
   } while (r < 0);
   _lockclr(driverlock);
   return -r;
}

/*
 * hyper_modifyBankParams - modifies the bank specific parameters for
 *                          the given addr and applies to the driver.
 *                          Note that hyper_initialize() must have been 
 *                          called before this function is used.
 */
int32_t hyper_modifyBankParams(void *addr, uint32_t andmask, uint32_t ormask) {
   int32_t r, value, i, size;
   int32_t *mailbox;
   int32_t bank;

   // driver must be running
   if (drivercog == -1) {
      return ERR_INACTIVE;
   }

   // get starting bank and size used by this address
   bank = hyper_getStartBank(addr);
   if (bank < 0) {
      return ERR_INVALID;
   }
   size = deviceData[bank] & 0xff;

   mailbox = hyper_getMailbox(drivercog);
   while (!(_locktry(driverlock))) {
     _waitms(1);
   }
   // configure parameter(s) over all spanned banks and update local storage also
   for (i = bank; i <= bank + ((size < S_16MB) ? 0 : ((1<<(size - S_16MB)) - 1)); i++) {
      value = (deviceData[i] & andmask) | ormask;
      mailbox[1] = value;
      mailbox[0] = R_SETPARAMS + (i<<24) + _cogid();
      do {  
         r = mailbox[0];
      }
      while (!(r >= 0));
      if (r == 0) {
         deviceData[i] = value;
      }
      else { 
         // error case
         r = -r;
         // TODO: cleanup?, potentially leaves multi-banks
         //       in an inconsistent state
      }
   }

   _lockclr(driverlock);
   return r;
}

/* 
 * hyper_modifyBankParams(andmask, ormask)
 * 
 * This internal method modifies the bank specific parameters
 * for the given addr and applies to the driver. Note that 
 * hyper_initialize() must have been called before this function
 * is used.
 */

/*
static int32_t hyper_modifyBankParams(int32_t andmask, int32_t ormask)
{
  int32_t *mailbox;
  int32_t value, i;
  int32_t result = 0;

  // driver must be running
  if (drivercog == -1) {
    return ERR_INACTIVE;
  }
  mailbox = hyper_getMailbox(drivercog);
  while (!(_locktry(driverlock))) {
    _waitms(1);
  }
  // configure parameter(s) over all spanned banks and update local
  // storage also
  for(i = 0; i < 2; i++) {
    value = (deviceData[i] & andmask) | ormask;
    mailbox[1] = value;
    mailbox[0] = (R_SETPARAMS + (i << 24)) + _cogid();
    do {
      result = mailbox[0];
    } while (!(result >= 0));
    if (result == 0) {
      deviceData[i] = value;
    } else {
      // error case
      result = -result;
      // TODO: cleanup?, failure potentially leaves first bank 
      //       in an inconsistent state
      break;
    }
  }
  _lockclr(driverlock);
  return result;
}
*/

/*
 * internal method obtains the current bank parameter field for a device mapped to the given address
 */
static int32_t getBankParams(void *addr, int fieldType) {
   int32_t *mailbox;
   int32_t r, p;

   mailbox = hyper_getMailbox(drivercog);
   while (!(_locktry(driverlock))) {
     _waitms(1);
   }
   mailbox[0] = R_GETPARAMS + ((uint32_t)addr & 0x0f000000) + _cogid();
   do {
      r = mailbox[0];
   } while (r < 0);
        
   if (r > 0) { // driver error case
      r = -r;
      _lockclr(driverlock);
      return r;
   }

   if (fieldType == FIELD_BURST) { // read burst field
      r = (uint32_t)mailbox[1] >> 16;
   }
   else if (fieldType == FIELD_DELAY) { // read delay field
      r = ((uint32_t)mailbox[1] >> 12) & 0xf;
   }
   else if (fieldType == FIELD_FLAGS) { // read flag field
      r = ((uint32_t)mailbox[1] >> 8) & 0xf;
   }
   else if (fieldType == FIELD_PROTECTION) { // read COG id & protection state (bit11)
      if ((uint32_t)mailbox[1] & F_PROTFLAG) {
         r = (((uint32_t)mailbox[1] >> 16) & 7) + F_PROTFLAG;
      }
      else {
         r = 0;
      }
   }
   else {
      r = ERR_INVALID;
   }
   _lockclr(driverlock);
   return r;
}

/*
 * validHyperRAM(addr)
 *
 * internal routine to check addr is not Flash
 */
static int32_t validHyperRAM(void *addr) {
   uint32_t bank;

   bank = ((uint32_t)addr >> 24) & 0xf;
   if (deviceData[bank] & F_FLASHFLAG) {
      return ERR_NOT_RAM;
   }
   return 0;
}

/* 
 * hyper_lookupDelay(freq)
 * 
 * This internal method looks up delay for given frequency from
 * timing profile table. The profile is determined by whether or
 * not the address is Flash or RAM
 */
static int32_t hyper_lookupDelay(void *addr, int32_t freq)
{
  int32_t delay = 0;
  int32_t i = 0;

  if (validHyperRAM(addr) == 0) {
     // RAM
     delay = delayTable_r[i];
     while (delayTable_r[i+1]) {
       if (freq < delayTable_r[i+1]) {
         break;
       }
       i++;
       delay++;
     }
  }
  else {
     // assume Flash
     delay = delayTable_f[i];
     while (delayTable_f[i+1]) {
       if (freq < delayTable_f[i+1]) {
         break;
       }
       i++;
       delay++;
     }
  }
  return delay;
}

/* 
 * hyper_setDelay(delay)
 * 
 * This API lets you manually adjust the input delay timing directly 
 * (delay from 0-15).
 */
int32_t hyper_setDelay(void *addr, int32_t delay)
{
  hyper_initialize(); // initialize if not already
  if (delay > 15) {
     return ERR_INVALID;
  }
  //return hyper_modifyBankParams((void *)0, -61441, (delay & 0xf) << 12);
  return hyper_modifyBankParams(addr, 0xFFFF0FFF, (delay & 0xf) << 12);
}

/* 
 * setDelayFrequency(addr, freq, tempK)
 * 
 * Sets the frequency of operation and updates the input delay parameter for a given device's bank(s)
 * Uses the input timing/temperature profile for the device that operates at the address.
 * 
 * Arguments:
 *    addr - (any) address of device to setup input delay
 *    freq - current operating frequency in Hz
 *    tempK - (future use) temperature in Kelvin.  Pass 0 for now to ignore.
 * 
 * Returns: delay to use or negative error code
 */
int32_t hyper_setDelayFrequency(void *addr, int32_t freq, int32_t tempK) {
  uint32_t bank;

  hyper_initialize(); // initialize if not already
  bank = ((uint32_t)addr)>>24;
  if (freq == 0) {
    // use current frequency if unspecified
    freq = _clockfreq();
  }
  return hyper_setDelay(addr, hyper_lookupDelay(addr, freq));
}

/* 
 * hyper_getDelay(void *addr)
 * 
 * This API returns the device's current input delay.
 */
int32_t hyper_getDelay(void *addr)
{
  hyper_initialize(); // initialize if not already
  return getBankParams(addr, FIELD_DELAY);
}

/* 
 * hyper_setBurst(burst)
 * 
 * This API sets up the device's maximum burst limit 
 * (also limited by per cog burst).
 */
int32_t hyper_setBurst(void *addr, uint32_t burst)
{
  hyper_initialize(); // initialize if not already
  if (burst < 8) {
     return ERR_INVALID;
  }
  if (burst > 0xFFF0) {
     burst = 0xFFF0;
  }
  burst &= ~7;
  //return hyper_modifyBankParams((void *)0, 65535, burst << 16);
  return hyper_modifyBankParams(addr, 0x0000FFF8, burst << 16);
}

/* 
 * hyper_getBurst(addr)
 * 
 * This API Returns the device's current maximum burst size.
 */
int32_t hyper_getBurst(void *addr)
{
  hyper_initialize(); // initialize if not already
  return getBankParams(addr, FIELD_BURST);
}

/* 
 * hyper_getFlags(addr)
 * 
 * This API Returns the device's current flags.
 */
int32_t hyper_getFlags(void *addr)
{
  hyper_initialize(); // initialize if not already
  return getBankParams(addr, FIELD_FLAGS);
}

/* 
 * hyper_setQos(cog, qos)
 * 
 * This API lets you adjust the request servicing policy per COG in the driver.
 * It sets up a COG's maximum burst size (also still limited by device's 
 * max burst setting), * and the optional priority & flags.
 *     cog - cog ID to change from 0-7
 *     qos - qos parameters for the cog (set to 0 to remove COG from polling)
 * Use this 32 bit format for qos data
 *   Bit
 *   31-16: maximum burst size allowed for this COG in bytes before 
 *          fragmenting (bursts also limited by device burst size)
 *   15   : 1 = COG has a polling priority assigned, 
 *          0 = round robin polled after prioritized COGs get serviced first
 *   14-12: 3 bit priority COGs polling order when bit15 = 1, 
 *             %111 = highest, %000 = lowest
 *   11   : 1 = additional ATN notification to COG after request is serviced, 
 *          0 = mailbox nofication only
 *   10   : 1 = Locked transfer completes even after burst size fragmentation, 
 *          0 = COGs are repolled
 *   9-0  : reserved (0)
 */
int32_t hyper_setQos(int32_t cog, int32_t qos)
{
  int32_t *mailbox;
  int32_t result = 0;
  int32_t drivercog  = -1;
  int32_t driverlock = -1;

  drivercog = hyper_initialize(); // initialize if not already, return drivercog
  if (drivercog == -1) {
    // driver must be running
    return ERR_INACTIVE;
  }
  if ((cog < 0) || (cog > 7)) {
    // enforce cog id range
    return ERR_INVALID;
  }
  QosData[cog] = qos & (~0x1ff);
  mailbox = hyper_getMailbox(drivercog);
  driverlock = hyper_getDriverLock();
  while (!(_locktry(driverlock))) {
    _waitms(1);
  }
  mailbox[0] = R_CONFIG + _cogid();
  while (mailbox[0] < 0) {
    _waitms(1);
  }
  _lockclr(driverlock);
  return result;
}

/* 
 * hyper_getQos(cog)
 * 
 * This API return the current Qos setting for a cog.
 */
int32_t hyper_getQos(int32_t cog)
{
  hyper_initialize(); // initialize if not already
  return QosData[(cog & 0x7)];
}

/* 
 * hyper_getBankParameters(bank)
 * 
 * This API return the current parameters setting for a bank.
 */
int32_t hyper_getBankParameters(int32_t bank)
{
  hyper_initialize(); // initialize if not already
  if (bank > 15) {
     return 0;
  }
  return deviceData[bank];
}

/* 
 * hyper_getPinParameters(bank)
 * 
 * This API return the current pin setting for a bank.
 */
int32_t hyper_getPinParameters(int32_t bank)
{
  hyper_initialize(); // initialize if not already
  if (bank > 15) {
     return 0;
  }
  return deviceData[bank + 16];
}

/*
 * hyper_readRAMIR(addr, ir, die)
 *
 * method to read HyperRAM Identification registers IR0 or IR1
 * addr - identifies memory region containing HyperRAM device to access
 * ir - pass in 0 or 1 for IR0, IR1 register selection
 * die - pass in 0 or 1 for selecting which die to read in an MCP device (use 0 for non MCP devices)
 * returns IRx register value or negative error code
*/
int32_t hyper_readRamIR(void *addr, int32_t ir, int32_t die) {
   int32_t r;
   r = validHyperRAM(addr);
   if (r == 0) {
      r = hyper_readRaw(addr, 0xE000 + ((die & 1) << 3), ir & 1);
   }
   return r;
}

/*
 * hyper_readRAMCR(addr, ir, die)
 *
 * method to read HyperRAM control registers CR0 or CR1
 * addr - identifies memory region containing HyperRAM device to access
 * cr - pass in 0 or 1 for CR0, CR1 register selection
 * die - pass in 0 or 1 for selecting which die to read in an MCP device (use 0 for non MCP devices)
 * returns CRx register value or negative error code
 */ 
int32_t hyper_readRamCR(void *addr, int32_t ir, int32_t die) {
   int32_t r;
   r = validHyperRAM(addr);
   if (r == 0) {
      r = hyper_readRaw(addr, 0xE000 + ((die & 1) << 3), 0x01000000 + (ir & 1));
   }
   return r;
}

/*
 * method to read the driver latency for the device mapped to the provided address
 * addr - address of the Hyper device to configure
 * returns current latency or negative error code
 */
int32_t hyper_getDriverLatency(void *addr) {
  int32_t r;
  int32_t *mailbox;

   mailbox = hyper_getMailbox(drivercog);
   while (!(_locktry(driverlock))) {
     _waitms(1);
   }
   mailbox[0] = R_GETLATENCY + ((uint32_t)addr & 0x0f000000) + _cogid();
   do { 
      r = mailbox[0];
   }
   while (r < 0);

   if (r > 0) { // error case
       r = -r;
   }          
   else {
       r = (uint32_t)mailbox[1] >> 1; // convert from transitions to clocks
   }
   _lockclr(driverlock);
   return r;
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

