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

extern int32_t *psram_getMailbox(int32_t cog);

/*
 * psram_getResult(nonBlocking)
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
int32_t psram_getResult(int32_t nonBlocking)
{
   int32_t *mailbox;
   int32_t result = 0;

   psram_initialize(); // initialize if not already
   // compute COG's mailbox address
   mailbox = psram_getMailbox(_cogid());
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

