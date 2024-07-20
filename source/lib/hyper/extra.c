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
extern int32_t *hyper_getMailbox(int32_t cog);

/*
 * hyper_getResult(nonBlocking)
 *
 * Gets the status/result of the last (or current) operation for the 
 * calling COG's mailbox.
 * 
 * Arguments: 
 *    nonBlocking - flag to set true if we don't want to wait for a 
 *                  result if it is still pending
 * 
 * Returns: status of last mailbox operation by this COG or a 
 * negative error code.
 *
 * It will return ERR_WOULD_BLOCK if mailbox is still running when 
 * non-blocking flag is true
 * 
 */
int32_t hyper_getResult(int32_t nonBlocking)
{
   int32_t *mailbox;
   int32_t result = 0;

   hyper_initialize(); // initialize if not already
   // compute COG's mailbox address
   mailbox = hyper_getMailbox(_cogid());
   if (mailbox[0] < 0) {
      if (nonBlocking) {
         return ERR_WOULD_BLOCK; // exit if we don't want to block
      }
      else {
         // wait for result in case a list is running
         while ((result = mailbox[0]) < 0) {
            _waitms(1);
         }
      }
   }
   return -result;         // return whether it was an error case or not
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

