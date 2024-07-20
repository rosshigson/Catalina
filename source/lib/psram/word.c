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

extern  int32_t psram_initialize();
extern int32_t *psram_getMailbox(int32_t cog);

/* 
 * psram_readWord(dstHubAddr, srcAddr)
 * 
 * This API will read a word into HUB RAM from external PSRAM
 *   dstHubAddr - HUB address where the data will be written into
 *   srcAddr    - 25 bit source address in PSRAM to be read
 *
 * Returns word on success, negative (bit 31 set) on error.
 *
 * Can call psram_getResult to return last error.
 */
int32_t psram_readWord(void *dstHubAddr, void *srcAddr)
{
  int32_t *mailbox;
  int32_t result = 0;
  int32_t drivercog = -1;

  drivercog = psram_initialize(); // initialize if not already, return drivercog
  if (drivercog == -1) {
    // driver must be running
    return ERR_INACTIVE;
  }
  // compute COG's mailbox address
  mailbox = psram_getMailbox(_cogid());
  if (mailbox[0] < 0) {
    return ERR_MAILBOX_BUSY;
  }
  mailbox[2] = 0; // just read only - no RMW mask
  // trigger burst read operation
  mailbox[0] = R_READWORD + ((uint32_t)srcAddr & 0x1ffffff);
  do {
    result = mailbox[0];
  } while (result < 0);
  // return success or error
  result = mailbox[1];
  *((uint16_t *)dstHubAddr) = result;
  return result;
}

/* 
 * psram_writeWord(srcHubAddr, dstAddr)
 * 
 * This API will write a word from HUB RAM to external PSRAM 
 *     srcHubAddr - HUB address where the data will be read from
 *     dstAddr    - 25 bit source address in PSRAM to be written
 *
 * Returns negative error code on error.
 *
 * Can call psram_getResult to return last error.
 */
int32_t psram_writeWord(void *srcHubAddr, void *dstAddr)
{
  int32_t *mailbox;
  int32_t result = 0;
  int32_t drivercog = -1;

  drivercog = psram_initialize(); // initialize if not already, return drivercog
  if (drivercog == -1) {
    // driver must be running
    return ERR_INACTIVE;
  }
  // compute COG's mailbox address
  mailbox = psram_getMailbox(_cogid());
  if (mailbox[0] < 0) {
    return ERR_MAILBOX_BUSY;
  }
  mailbox[2] = 1;
  mailbox[1] = (uint32_t)(*(uint16_t *)srcHubAddr);
  // trigger burst write operation
  mailbox[0] = R_WRITEWORD + ((uint32_t)dstAddr & 0x1ffffff);
  do {
    result = mailbox[0];
  } while (result < 0);
  // return success or error
  return -result;
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

