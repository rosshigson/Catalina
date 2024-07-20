/* 
 * Propeller 2 basic PSRAM driver wrapper
 * ======================================
 * 
 * This software contains a minimal interface layer to use the PSRAM driver 
 * from C for a board with 32MB of PSRAM using a 16 bit data bus 
 * configuration such as the P2-EC32MB EDGE board or a similar setup.
 *
 * The 32MB device is mapped at the address space from 0-$1ffffff and folds
 * over in SPIN2 calls (only 25 LSBs are actively used).  This 32MB is
 * spanning banks 0 and 1.
 *
 * This mapping could be altered by modifying the bank array assignments 
 * at setup time.  Sometimes is is handy to situate memory at addresses beyond
 * the hub address range so you can easily differentiate between internal 
 * and external addresses and share a "common" address space.
 *
 */

#include <prop.h>
#include <prop2.h>
#include <plugin.h>
#include <psram.h>

static int32_t *startupData = 0; 
static int32_t *deviceData  = 0;
static int32_t *QosData     = 0; 
static int32_t *mailboxes   = 0; 

static int32_t drivercog    = -1;  // COG id of driver
static int32_t driverlock   = -1;  // LOCK id of driver

static uint32_t delayTable[] = {         // delay profile
   7, 92000000, 150000000, 206000000, 258000000, 310000000, 333000000, 0
};

/* 
 * psram_getMailbox(cog)
 * 
 * This API return the mailbox start address in HUB RAM for a given cog.
 */
int32_t *psram_getMailbox(int32_t cog)
{
  return (mailboxes + (cog * 3));
}

/* 
 * psram_initialize()
 *
 * Note that since we use mailboxes in place of the normal request 
 * mechanism, we can use any allocated lock as our driverlock - we 
 * do not need to allocate a separate one.
 *
 * Returns the driver cog.
 * 
 */
int32_t psram_initialize()
{
   unsigned int request;

   if (startupData == 0) {
      // find PM1 - P2ASM Memory (16 Bit) - plugin (if loaded)
      drivercog = _locate_plugin(LMM_PM1);
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

int32_t psram_stop(void)
{
  int32_t i = 0;
  int32_t cog = -1;
  int32_t *mailbox;

  cog = psram_initialize(); // initialize if not already, return drivercog
  if (cog != -1) {
    // a rather brutal stop
    _cogstop(cog);
    for(i = 0; i < 8; i++) {
       mailbox = psram_getMailbox(i);
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
 * psram_getDriverLock()
 * 
 * This API return the driver lock ID which can be taken/released 
 * to protect control mailbox requests.

 */
int32_t psram_getDriverLock(void)
{
  psram_initialize(); // initialize if not already
  return driverlock;
}

/* 
 * psram_modifyBankParams(andmask, ormask)
 * 
 * This internal method modifies the bank specific parameters
 * for the given addr and applies to the driver.
 */
static int32_t psram_modifyBankParams(int32_t andmask, int32_t ormask)
{
  int32_t *mailbox;
  int32_t value, i;
  int32_t result = 0;

  // driver must be running
  if (drivercog == -1) {
    return ERR_INACTIVE;
  }
  mailbox = psram_getMailbox(drivercog);
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

/* 
 * psram_lookupDelay(freq)
 * 
 * This internal method looks up delay for given frequency from
 * timing profile table.
 */
static int32_t psram_lookupDelay(int32_t freq)
{
  int32_t delay = 0;
  int32_t i = 0;

  delay = delayTable[i];
  while (delayTable[i+1]) {
    if (freq < delayTable[i+1]) {
      break;
    }
    i++;
    delay++;
  }
  return delay;
}

/* 
 * psram_setDelay(delay)
 * 
 * This API lets you manually adjust the input delay timing directly 
 * (delay from 0-15).
 */
int32_t psram_setDelay(int32_t delay)
{
  psram_initialize(); // initialize if not already
  return psram_modifyBankParams(-61441, (delay & 0xf) << 12);
}

/* 
 * psram_setFrequency(freq)
 * 
 * This API lets you adjust the input delay timing automatically based 
 * on a frequency if it ever changes.
 */
int32_t psram_setFrequency(int32_t freq)
{
  psram_initialize(); // initialize if not already
  if (freq == 0) {
    // use current frequency if unspecified
    freq = _clockfreq();
  }
  return psram_setDelay(psram_lookupDelay(freq));
}

/* 
 * psram_getDelay()
 * 
 * This API returns the device's current input delay.
 */
int32_t psram_getDelay(void)
{
  psram_initialize(); // initialize if not already
  return (((deviceData[0]) >> 12) & 0xf);
}

/* 
 * psram_setBurst(burst)
 * 
 * This API sets up the device's maximum burst limit 
 * (also limited by per cog burst).
 */
int32_t psram_setBurst(int32_t burst)
{
  psram_initialize(); // initialize if not already
  return psram_modifyBankParams(65535, burst << 16);
}

/* 
 * psram_getBurst()
 * 
 * This API Returns the device's current maximum burst size.
 */
int32_t psram_getBurst(void)
{
  psram_initialize(); // initialize if not already
  return ((deviceData[0]) >> 16);
}

/* 
 * psram_setQos(cog, qos)
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
int32_t psram_setQos(int32_t cog, int32_t qos)
{
  int32_t *mailbox;
  int32_t result = 0;
  int32_t drivercog  = -1;
  int32_t driverlock = -1;

  drivercog = psram_initialize(); // initialize if not already, return drivercog
  if (drivercog == -1) {
    // driver must be running
    return ERR_INACTIVE;
  }
  if ((cog < 0) || (cog > 7)) {
    // enforce cog id range
    return ERR_INVALID;
  }
  QosData[cog] = qos & (~0x1ff);
  mailbox = psram_getMailbox(drivercog);
  driverlock = psram_getDriverLock();
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
 * psram_getQos(cog)
 * 
 * This API return the current Qos setting for a cog.
 */
int32_t psram_getQos(int32_t cog)
{
  psram_initialize(); // initialize if not already
  return QosData[(cog & 0x7)];
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

