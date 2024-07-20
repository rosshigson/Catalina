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

extern  int32_t hyper_initialize();
extern int32_t *hyper_getMailbox(int32_t cog);

/* 
 * hyper_fillBytes(addr, pattern, count, listPtr)
 * hyper_fillWords(addr, pattern, count, listPtr)
 * hyper_fillLongs(addr, pattern, count, listPtr)
 * or
 * hyper_fill(addr, pattern, count, listPtr, datasize)
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
int32_t hyper_fill(void *addr, int32_t pattern, int32_t count, int32_t listPtr, int32_t datasize)
{
  int32_t *mailbox;
  int32_t req;
  int32_t r = 0;
  int32_t drivercog = -1;

  drivercog = hyper_initialize(); // initialize if not already, return drivercog
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
  mailbox = hyper_getMailbox(_cogid());
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

int32_t hyper_fillBytes(void *addr, int32_t pattern, int32_t count, int32_t listPtr)
{
  return hyper_fill(addr, pattern, count, listPtr, 1);
}

int32_t hyper_fillWords(void *addr, int32_t pattern, int32_t count, int32_t listPtr)
{
  return hyper_fill(addr, pattern, count, listPtr, 2);
}

int32_t hyper_fillLongs(void *addr, int32_t pattern, int32_t count, int32_t listPtr)
{
  return hyper_fill(addr, pattern, count, listPtr, 4);
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

