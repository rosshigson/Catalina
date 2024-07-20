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
 * psram_fillBytes(addr, pattern, count, listPtr)
 * psram_fillWords(addr, pattern, count, listPtr)
 * psram_fillLongs(addr, pattern, count, listPtr)
 * or
 * psram_fill(addr, pattern, count, listPtr, datasize)
 * 
 * These methods can be used to fill external memory with a data pattern.
 * 
 * Arguments:
 *   addr - the external address to fill with a data pattern
 *   pattern - the data pattern to fill with
 *   count - the number of items (i.e. bytes/words/longs) to fill   
 *   listPtr - optional list pointer (unused by this driver - pass 0)
 *   datasize - (for fill only) the data size to use (1,2,4) during the fill
 * 
 * Returns: 0 for success or a negative error code
 * 
 * If the listPtr is non-zero it will be used as a list pointer and instead
 * of triggering a fill operation, it will build a listItem structure in 
 * HUB RAM at this address to do the fill later. 
 */
// generalized fill
int32_t psram_fill(void *addr, int32_t pattern, int32_t count, int32_t listPtr, int32_t datasize)
{
  int32_t *mailbox;
  int32_t req;
  int32_t r = 0;
  int32_t drivercog = -1;

  drivercog = psram_initialize(); // initialize if not already, return drivercog
  if (drivercog == -1) {
    // driver must be running
    return ERR_INACTIVE;
  }
  switch (datasize) {
     case 1:
        req = R_WRITEBYTE;
        break;
     case 2:
        req = R_WRITEWORD;
        break;
     case 4:
        req = R_WRITELONG;
        break;
     default:
        return ERR_INVALID;
  }
  if (count == 0) {
    // nothing to do
    return 0;
  }
  // get mailbox base address for this COG
  mailbox = psram_getMailbox(_cogid());
  if (mailbox[0] < 0) {
    return ERR_MAILBOX_BUSY;
  }
  mailbox[2] = count;
  mailbox[1] = pattern;
  mailbox[0] = req + ((uint32_t)addr & 0xfffffff);
  do {
    r = mailbox[0];
  } while (r < 0);
  // return 0 for success or negated error code
  return -r;
}

int32_t psram_fillBytes(void *addr, int32_t pattern, int32_t count, int32_t listPtr)
{
  return psram_fill(addr, pattern, count, listPtr, 1);
}

int32_t psram_fillWords(void *addr, int32_t pattern, int32_t count, int32_t listPtr)
{
  return psram_fill(addr, pattern, count, listPtr, 2);
}

int32_t psram_fillLongs(void *addr, int32_t pattern, int32_t count, int32_t listPtr)
{
  return psram_fill(addr, pattern, count, listPtr, 4);
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

