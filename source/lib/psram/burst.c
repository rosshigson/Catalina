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
 * psram_read(dstHubAddr, srcAddr, count)
 * 
 * This API will burst read a block into HUB RAM from external PSRAM
 *   dstHubAddr - HUB address where the data will be written into
 *   srcAddr    - 25 bit source address in PSRAM to be read
 *   count      - number of bytes to read into HUB RAM
 */
int32_t psram_read(void *dstHubAddr, void *srcAddr, int32_t count)
{
  int32_t *mailbox;
  int32_t result = 0;
  int32_t drivercog = -1;

  drivercog = psram_initialize(); // initialize if not already, return drivercog
  if (drivercog == -1) {
    // driver must be running
    return ERR_INACTIVE;
  }
  if (count == 0) {
    // don't even bother reading
    return 0;
  }
  // compute COG's mailbox address
  mailbox = psram_getMailbox(_cogid());
  if (mailbox[0] < 0) {
    return ERR_MAILBOX_BUSY;
  }
  mailbox[2] = count;
  mailbox[1] = (uint32_t)dstHubAddr;
  // trigger burst read operation
  mailbox[0] = R_READBURST + ((uint32_t)srcAddr & 0x1ffffff);
  do {
    result = mailbox[0];
  } while (result < 0);
  // return success or error
  return -result;
}

/* 
 * psram_write(srcHubAddr, dstAddr, count)
 * 
 * This API will burst write a block from HUB RAM to external PSRAM 
 *     srcHubAddr - HUB address where the data will be read from
 *     dstAddr    - 25 bit source address in PSRAM to be written
 *     count      - number of bytes to write to PSRAM
 */
int32_t psram_write(void *srcHubAddr, void *dstAddr, int32_t count)
{
  int32_t *mailbox;
  int32_t result = 0;
  int32_t drivercog = -1;

  drivercog = psram_initialize(); // initialize if not already, return drivercog
  if (drivercog == -1) {
    // driver must be running
    return ERR_INACTIVE;
  }
  if (count == 0) {
    // don't even bother writing
    return 0;
  }
  // compute COG's mailbox address
  mailbox = psram_getMailbox(_cogid());
  if (mailbox[0] < 0) {
    return ERR_MAILBOX_BUSY;
  }
  mailbox[2] = count;
  mailbox[1] = (uint32_t)srcHubAddr;
  // trigger burst write operation
  mailbox[0] = R_WRITEBURST + ((uint32_t)dstAddr & 0x1ffffff);
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

