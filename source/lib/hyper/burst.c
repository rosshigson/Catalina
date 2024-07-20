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
 * hyper_read(dstHubAddr, srcAddr, count)
 * 
 * This API will burst read a block into HUB RAM from external Hyper RAM
 *   dstHubAddr - HUB address where the data will be written into
 *   srcAddr    - 25 bit source address in Hyper RAM to be read
 *   count      - number of bytes to read into HUB RAM
 */
int32_t hyper_read(void *dstHubAddr, void *srcAddr, int32_t count)
{
  int32_t *mailbox;
  int32_t result = 0;
  int32_t drivercog = -1;

  drivercog = hyper_initialize(); // initialize if not already, return drivercog
  if (drivercog == -1) {
    // driver must be running
    return ERR_INACTIVE;
  }
  if (count == 0) {
    // don't even bother reading
    return 0;
  }
  // compute COG's mailbox address
  mailbox = hyper_getMailbox(_cogid());
  if (mailbox[0] < 0) {
    return ERR_MAILBOX_BUSY;
  }
  mailbox[2] = count;
  mailbox[1] = (uint32_t)dstHubAddr;
  // trigger burst read operation
  mailbox[0] = R_READBURST + ((uint32_t)srcAddr & 0xfffffff);
  do {
    result = mailbox[0];
  } while (result < 0);
  // return success or error
  return -result;
}

/* 
 * hyper_write(srcHubAddr, dstAddr, count)
 * 
 * This API will burst write a block from HUB RAM to external Hyper RAM 
 *     srcHubAddr - HUB address where the data will be read from
 *     dstAddr    - 25 bit source address in Hyper RAM to be written
 *     count      - number of bytes to write to Hyper RAM
 */
int32_t hyper_write(void *srcHubAddr, void *dstAddr, int32_t count)
{
  int32_t *mailbox;
  int32_t result = 0;
  int32_t drivercog = -1;

  drivercog = hyper_initialize(); // initialize if not already, return drivercog
  if (drivercog == -1) {
    // driver must be running
    return ERR_INACTIVE;
  }
  if (count == 0) {
    // don't even bother writing
    return 0;
  }
  // compute COG's mailbox address
  mailbox = hyper_getMailbox(_cogid());
  if (mailbox[0] < 0) {
    return ERR_MAILBOX_BUSY;
  }
  mailbox[2] = count;
  mailbox[1] = (uint32_t)srcHubAddr;
  // trigger burst write operation
  mailbox[0] = R_WRITEBURST + ((uint32_t)dstAddr & 0xfffffff);
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

