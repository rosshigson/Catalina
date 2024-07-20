/*
 * Blackbox_comms - comms functions for Blackbox to communicate with the
 *                  BlackCat debugging cog.
 *
 * version 2.4 - initial release (to coincide with Catalina 2.4)
 *
 * version 2.9 - replace longs with ints (on a 64 bit platform, longs 
 *               are 64 bits, not 32 - and we want 32!).
 *
 * Version 3.5 - update offsets for new kernel.
 *
 * Version 3.6 - update offsets & memory mode detection for new image format.
 *
 * Version 3.7 - add compact (CMM) mode support.
 *
 * Version 3.8 - allow for debugging EEPROM modes (for LMM or CMM).
 *
 * Version 3.15 - Add support for P2.
 *
 * Version 3.15 - Add timeout to blackbox_open.
 *
 */

/*--------------------------------------------------------------------------
    This file is part of Catalina.

    Copyright 2009 Ross Higson

    Catalina is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Catalina is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Catalina.  If not, see <http://www.gnu.org/licenses/>.

  -------------------------------------------------------------------------- */

#include <stdio.h>
#include <string.h>
#include "rs232.h"

#ifdef _WIN32

#include <windows.h>

#else

#include <termios.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <limits.h>
#include <errno.h>

#endif

#define MAX_ATTEMPTS    3
#define RETRY_DELAY     250 // milliseconds

#define MAX_VALUES      8   // max number of values in any command or response

#define P1_DEBUG_BREAK  0x7E4C  // Non-zero when at breakpoint and executing debug support code (P1)
#define P2_DEBUG_BREAK  0x7BDE8 // Non-zero when at breakpoint and executing debug support code (P2)

#define LMM_LAYOUT_OFFSET   0x10 // query this address for LMM modes (works on P1 and P2)
#define XMM_LAYOUT_OFFSET   0x20 // query this address for XMM modes (works on P1 only)

#define ACK 0x06
#define NAK 0x15
#define BEL 0x07

#define READ_HUB        'h'  // read 1 value from hub  
#define READ_HUB_8      'H'  // read 8 values from hub 
#define WRITE_HUB       'w'  // write value to hub     
#define READ_COG        'c'  // read value from cog    
#define WRITE_COG       'W'  // write value to cog     
#define READ_XMM        'x'  // read value from xmm    
#define WRITE_XMM       'X'  // write value to xmm     
#define READ_STATS      'C'  // read (and zero) stats 
#define REPLACE         'i'  // replace instruction   
/*
 * REQUEST                         RESPONSE
 * -------                         --------
 * 'h' <add_4> <chk_1>             ACK <val_1> <chk_1>
 * 'H' <add_4> <chk_4>             ACK <val_1> ... <val_8> <chk_1>
 * 'w' <add_4> <val_4> <chk_1>     ACK <chk_1>
 * 'c' <add_4> <chk_1>             ACK <val_1> <chk_1>
 * 'W' <add_4> <val_4> <chk_1>     ACK <chk_1>
 * 'x' <add_4> <chk_1>             ACK <val_1> <chk_1>
 * 'X' <add_4> <val_4> <chk_1>     ACK <chk_1>
 * 'C' <xxx_4> <chk_1>             ACK <val_1> <val_2> <chk_1>
 * 'i' <val_1> <chk_1>             ACK <chk_1>
 *
 *                         or      NAK <chk_1>
 *                         or      BEL <chk_1>
 */

extern int waiting;
extern int diagnose;
extern int verbose;
extern unsigned int reloc_value;
extern unsigned int cs_value;

static int port_in_use = -1;


void mdelay(int ms) {

#ifdef _WIN32
    Sleep(ms);
#else
    usleep(ms*1000);
#endif

}


// write_command - including count ints from the value array. Returns
//                 0 if transmitted ok, -1 on timeout or other error
int write_command(int cmd, int count, unsigned int *value) {
   int i;
   int res;
   unsigned int chk;
   unsigned int tmp;
   unsigned int l;

   if (port_in_use >= 0) {
      if (diagnose) {
         fprintf(stderr, "write command '%c', count=%d ", cmd, count);
         for (i = 0; i < count; i++) {
            fprintf(stderr, ", value=0x%08X ", value[i]);
         }
         fprintf(stderr, "\n");
      }
      res = 0;
      chk = cmd & 0xFF;
      if (SendByte(port_in_use, cmd)) {
         if (diagnose > 1) {
            fprintf(stderr, "write <0x%02X> ", cmd);
         }
         for (i = 0; i < count; i++) {
            l = value[i];
            tmp = (l >> 24) & 0xff;
            chk += tmp;
            if (!SendByte(port_in_use, tmp)) {
               res = -1;
               break;
            }
            if (diagnose > 1) {
               fprintf(stderr, "<0x%02X> ", tmp);
            }
            tmp = (l >> 16) & 0xff;
            chk += tmp;
            if (!SendByte(port_in_use, tmp)) {
               res = -1;
               break;
            }
            if (diagnose > 1) {
               fprintf(stderr, "<0x%02X> ", tmp);
            }
            tmp = (l >> 8) & 0xff;
            chk += tmp;
            if (!SendByte(port_in_use, tmp)) {
               res = -1;
               break;
            }
            if (diagnose > 1) {
               fprintf(stderr, "<0x%02X> ", tmp);
            }
            tmp = l & 0xff;
            chk += tmp;
            if (!SendByte(port_in_use, tmp)) {
               res = -1;
               break;
            }  
            if (diagnose > 1) {
               fprintf(stderr, "<0x%02X> ", tmp);
            }
         }
         chk &= 0xff;
         if (!SendByte(port_in_use, chk)) {
            res = -1;
         }  
         if (diagnose > 1) {
            fprintf(stderr, "<0x%02X> ", chk);
         }
      }
      else {
         res = -1;
      }
      if (diagnose) {
         if (diagnose > 1) {
            fprintf(stderr, "\n");
         }
         if (res < 0) {
            fprintf(stderr, "write error %d\n", res);
         }
         else {
            fprintf(stderr, "write completed ok\n");
         }
      }
      return res;
   }
   else {
      fprintf(stderr, "port not open\n");
   }
   return -1;
}

// read_response - returns count ints in the value array, plus a return
//                 value of ACK, NAK or BEL, or -1 on timeout or other error
int read_response(int count, unsigned int *value) {
   int i;
   int rsp;
   int tmp;
   unsigned int chk;
   unsigned int l;

   if (port_in_use >= 0) {
      rsp = ReceiveByte(port_in_use);
      if (diagnose > 1) {
         fprintf(stderr, "read response <0x%02X> ", rsp);
      }
      chk = rsp;
      if (rsp == ACK) {
         for (i = 0; i < count; i++) {
            l = 0;
            tmp = ReceiveByte(port_in_use);
            if (tmp < 0) {
               rsp = -1;
               break;
            }
            chk += tmp;
            if (diagnose > 1) {
               fprintf(stderr, "<0x%02X> ", tmp);
            }
            l |= ((tmp & 0xff) << 24);
            tmp = ReceiveByte(port_in_use);
            if (tmp < 0) {
               rsp = -1;
               break;
            }
            chk += tmp;
            if (diagnose > 1) {
               fprintf(stderr, "<0x%02X> ", tmp);
            }
            l |= ((tmp & 0xff) << 16);
            tmp = ReceiveByte(port_in_use);
            if (tmp < 0) {
               rsp = -1;
               break;
            }
            chk += tmp;
            if (diagnose > 1) {
               fprintf(stderr, "<0x%02X> ", tmp);
            }
            l |= ((tmp & 0xff) << 8);
            tmp = ReceiveByte(port_in_use);
            if (tmp < 0) {
               rsp = -1;
               break;
            }
            chk += tmp;
            if (diagnose > 1) {
               fprintf(stderr, "<0x%02X> ", tmp);
            }
            l |= (tmp & 0xff);
            value[i] = l;
         }
         if (rsp == ACK) {
            tmp = ReceiveByte(port_in_use);
            if (tmp < 0) {
               rsp = -1;
            }
            if (diagnose > 1) {
               fprintf(stderr, "<0x%02X>\n", tmp);
            }
         }
         if ((tmp & 0xff) != (chk & 0xff)) {
            if (diagnose) {
               fprintf(stderr, "chksum error - expected 0x%02X\n", (chk & 0xff));
            }
            rsp = -2;
         }
         if (diagnose) {
            if (rsp == ACK) {
               fprintf(stderr, "read completed ok\n");
            }
            else {
               fprintf(stderr, "read error %d\n", rsp);
            }
         }
      }
      else if (rsp == NAK) {
         tmp = ReceiveByte(port_in_use);
         if (tmp < 0) {
            rsp = -1;
         }
         if (diagnose > 1) {
            fprintf(stderr, "<0x%02X>\n", tmp);
         }
         if ((tmp & 0xff) != (chk & 0xff)) {
            rsp = -2;
         }
      }
      else if (rsp == BEL) {
         tmp = ReceiveByte(port_in_use);
         if (tmp < 0) {
            rsp = -1;
         }
         if (diagnose > 1) {
            fprintf(stderr, "<0x%02X>\n", tmp);
         }
         if ((tmp & 0xff) != (chk & 0xff)) {
            rsp = -2;
         }
      }
      else {
         if (diagnose) {
            fprintf(stderr, "unexpected character <0x%02X>\n", rsp);
         }
      }
      if (rsp == ACK) {
         if (diagnose && (count > 0)) {
            fprintf(stderr, "read %d values ", count);
            for (i = 0; i < count; i++) {
               fprintf(stderr, "<0x%08X> ", value[i]);
            }
            fprintf(stderr, "\n");
         }
      }
      else {
         ClearInput(port_in_use);
         if (diagnose) {
            fprintf(stderr, "receive error %d\n", rsp);
         }
      }
      return rsp;
   }
   else {
      fprintf(stderr, "port not open\n");
   }
   return -1;
}


int read_cog (unsigned int addr, unsigned int *value) {
   int res;
   int try;
   unsigned int params[MAX_VALUES];

   if (port_in_use >= 0) {
      for (try = 0; try < MAX_ATTEMPTS; try++) {
         params[0] = addr;
         res = write_command(READ_COG, 1, params);
         if (res != -1) {
            res = read_response(1, params);
            if (res == ACK) {
               *value = params[0];
               if (diagnose) {
                  fprintf(stderr, "value = 0x%08X\n", *value);
               }
               res = 0;
               break;
            } 
         }
      }
      return res;
   }
   else {
      fprintf(stderr, "port not open\n");
      return -1;
   }           
}


int write_cog (unsigned int addr, unsigned int value) {
   int res;
   int try;
   unsigned int params[MAX_VALUES];

   if (port_in_use >= 0) {
      for (try = 0; try < MAX_ATTEMPTS; try++) {
         params[0] = addr;
         params[1] = value;
         res = write_command(WRITE_COG, 2, params);
         if (res != -1) {
            res = read_response(0, params);
            if (res == ACK) {
               res = 0;
               break;
            } 
         }
      }
      return res;
   }
   else {
      fprintf(stderr, "port not open\n");
      return -1;
   }           
}


int read_hub (unsigned int addr, unsigned int *value) {
   int res;
   int try;
   unsigned int params[MAX_VALUES];

   if (port_in_use >= 0) {
      for (try = 0; try < MAX_ATTEMPTS; try++) {
         params[0] = addr & 0xFFFFFFFC;
         res = write_command(READ_HUB, 1, params);
         if (res != -1) {
            res = read_response(1, params);
            if (res == ACK) {
               *value = params[0];
               if (diagnose) {
                  fprintf(stderr, "value = 0x%08X\n", *value);
               }
               res = 0;
               break;
            } 
         }
      }
      return res;
   }
   else {
      fprintf(stderr, "port not open\n");
      return -1;
   }           
}


int read_hub_8 (unsigned int addr, unsigned int *value) {
   int i;
   int res;
   int try;
   unsigned int params[MAX_VALUES];

   if (port_in_use >= 0) {
      for (try = 0; try < MAX_ATTEMPTS; try++) {
         params[0] = addr & 0xFFFFFFFC;
         res = write_command(READ_HUB_8, 1, params);
         if (res != -1) {
            res = read_response(8, params);
            if (res == ACK) {
               for (i = 0; i < 8; i++) {
                  *value = params[i];
                  value++;
               }
               res = 0;
               break;
            } 
         }
      }
      return res;
   }
   else {
      fprintf(stderr, "port not open\n");
      return -1;
   }           
}


int write_hub (unsigned int addr, unsigned int value) {
   int res;
   int try;
   unsigned int params[MAX_VALUES];

   if (port_in_use >= 0) {
      for (try = 0; try < MAX_ATTEMPTS; try++) {
         params[0] = addr & 0xFFFFFFFC;
         params[1] = value;
         res = write_command(WRITE_HUB, 2, params);
         if (res != -1) {
            res = read_response(0, params);
            if (res == ACK) {
               res = 0;
               break;
            } 
         }
      }
      return res;
   }
   else {
      fprintf(stderr, "port not open\n");
      return -1;
   }           
}


int read_xmm (unsigned int addr, unsigned int *value) {
   int res;
   int try;
   unsigned int params[MAX_VALUES];

   if (port_in_use >= 0) {
      for (try = 0; try < MAX_ATTEMPTS; try++) {
         params[0] = addr;
         res = write_command(READ_XMM, 1, params);
         if (res != -1) {
            res = read_response(1, params);
            if (res == ACK) {
               *value = params[0];
               res = 0;
               break;
            } 
         }
      }
      return res;
   }
   else {
      fprintf(stderr, "port not open\n");
      return -1;
   }           
}


int write_xmm (unsigned int addr, unsigned int value) {
   int res;
   int try;
   unsigned int params[MAX_VALUES];

   if (port_in_use >= 0) {
      for (try = 0; try < MAX_ATTEMPTS; try++) {
         params[0] = addr;
         params[1] = value;
         res = write_command(WRITE_XMM, 2, params);
         if (res != -1) {
            res = read_response(0, params);
            if (res == ACK) {
               res = 0;
               break;
            }
         }
      }
      return res;
   }
   else {
      fprintf(stderr, "port not open\n");
      return -1;
   }           
}


int replacement_inst (int model, unsigned int inst) {
   int res;
   int try;
   unsigned int params[MAX_VALUES];

   if (port_in_use >= 0) {
      for (try = 0; try < MAX_ATTEMPTS; try++) {
         params[0] = inst;
         res = write_command(REPLACE, 1, params);
         if (res != -1) {
            res = read_response(0, params);
            if (res == ACK) {
               res = 0;
               break;
            } 
         }
      }
      return res;
   }
   else {
      fprintf(stderr, "port not open\n");
      return -1;
   }           
}


void blackbox_close() {
   if (port_in_use >= 0) {
      if (diagnose) {
         fprintf(stderr, "close comms port=%s\n", ComportName(port_in_use));
      }
      CloseComport(port_in_use);
      port_in_use = -1;
   }
}


int blackbox_open(int port, int baud, int timeout) {
   int res;

   if (port_in_use >= 0) {
      blackbox_close();
   }
   if (diagnose) {
      fprintf(stderr, "open comms port=%s, baud=%d\n", ComportName(port-1), baud);
   }
   res = OpenComport(port-1, baud, timeout, verbose);
   if (res == 0) {
      if (diagnose) {
         fprintf(stderr, "opened port\n");
      }
      port_in_use = port-1;
   }
   return res;
}


int blackbox_statistics(int *nak, int *bel) {
   int res;
   int try;
   unsigned int  params[MAX_VALUES];

   if (port_in_use >= 0) {
      for (try = 0; try < MAX_ATTEMPTS; try++) {
         params[0] = 0; // dummy
         res = write_command(READ_STATS, 1, params);
         if (res != -1) {
            res = read_response(2, params);
            if (res == ACK) {
               *nak = params[0];
               *bel = params[1];
               res = 0;
               break;
            }
         }
      }
      return res;
   }
   else {
      fprintf(stderr, "port not open\n");
      return -1;
   }           
}


unsigned int blackbox_address (int model, unsigned int *addr) {
   unsigned int temp;
   unsigned int break_addr = P1_DEBUG_BREAK;

   if (model >= 100) {
      break_addr = P2_DEBUG_BREAK;
   }

   if (read_hub(break_addr, &temp) == 0) {
      if (diagnose) {
         fprintf(stderr, "break_addr value=0x%08X\n", temp);
      }
      if (model == 111) {
         temp &= 0xFFFFFF; // for P2 NATIVE mode, remove flags
      }
      if (temp == 0) {
         *addr = temp;
      }
      else {
         *addr = temp + reloc_value + cs_value;
         if ((model != 8) && (model != 108)) {
            *addr -= 4;
         }
      }
      if (diagnose) {
         fprintf(stderr, "adjusted address value=0x%08X\n", *addr);
      }
      return 0;
   }
   if (diagnose) {
      fprintf(stderr, "hub read failed\n");
   }
   return -1;
}


// fetch memory model from hub RAM
//    On the P1, return 0 (TINY), 2 (SMALL), 5 (LARGE) or 8 (COMPACT)
//    On the P2, return 100 (TINY), 102 (SMALL), 105 (LARGE), 108 (COMPACT) or 111 (NATIVE)
//    Return -1 on error or unsupported mode
int blackbox_model() {
   unsigned int value;

   // try LMM and CMM first
   if (read_hub(LMM_LAYOUT_OFFSET, &value) == 0) {
      if ((value == 0) || (value == 1)) {
         return 0; // P1 TINY
      }
      else if ((value == 8) || (value == 9) || (value == 10)) {
         return 8; // P1 COMPACT
      }
      else if (value == 100) {
         return 100; // P2 TINY
      } 
      else if (value == 102) {
         return 102; // P2 SMALL
      } 
      else if (value == 105) {
         return 105; // P2 LARGE
      } 
      else if (value == 108) {
         return 108; // P2 COMPACT
      } 
      else if (value == 111) {
         return 111; // P2 NATIVE
      } 
      // not LMM, or CMM, try XMM
      if (read_hub(XMM_LAYOUT_OFFSET, &value) == 0) {
         if (value == 2) {
            return 2; // SMALL
         }
         else if (value == 3) {
            fprintf(stderr, "Unsupported memory model (LARGE FLASH)\n");
            return -1; // LARGE FLASH
         }
         else if (value == 4) {
            fprintf(stderr, "Unsupported memory model (SMALL FLASH)\n");
            return -1; // SMALL FLASH
         }
         else if (value == 5) {
            return 5; // LARGE
         }
      }
   }
   return -1;
}





int blackbox_continue(int model, unsigned int inst, unsigned int *addr) {
   int tmp_diagnose;

   waiting = 1;
   tmp_diagnose = diagnose; // save diagnose flag
   if (replacement_inst(model, inst) == 0) {
      diagnose = 0; // turn diagnosis messages off while waiting
      *addr = 0;
      do {
         if (blackbox_address (model, addr) != 0) {
            diagnose = tmp_diagnose; // restore diagnose flag
            return -1;
         }
      } while ((*addr == 0) && waiting);
      if (!waiting) {
         fprintf(stderr, "INTERRUPTED\n");
      }
      diagnose = tmp_diagnose; // restore diagnose flag
      return 0;
   }
   else {
      diagnose = tmp_diagnose; // restore diagnose flag
      return -1;
   }
}


int blackbox_go(int model, int inst) {
   if (replacement_inst(model, inst) == 0) {
      return 0;
   }
   else {
      return -1;
   }
}


int blackbox_cog_read(int model, unsigned int addr, unsigned int *value) {
   unsigned int temp;
   unsigned int break_addr = P1_DEBUG_BREAK;

   if (model >= 100) {
      break_addr = P2_DEBUG_BREAK;
   }

   if (read_hub(break_addr, &temp) == 0) {
      if (temp != 0) {
         if (read_cog(addr, value) == 0) {
            return 0;
         }
         else {
            if (diagnose) {
               fprintf(stderr, "cog read failed\n");
            }
            return -1;
         }
      }
      else {
         if (diagnose) {
            fprintf(stderr, "program not stopped at breakpoint\n");
         }
         return -1;
      }
   }
   if (diagnose) {
      fprintf(stderr, "cannot determine program status\n");
   }
   return -1;
}


int blackbox_hub_read(unsigned int addr, unsigned int *value) {
   if (read_hub(addr, value) == 0) {
      return 0;
   }
   else {
      if (diagnose) {
         fprintf(stderr, "hub read failed\n");
      }
      return -1;
   }
}


int blackbox_xmm_read(int model, unsigned int addr, unsigned int *value) {
   unsigned int temp;
   unsigned int break_addr = P1_DEBUG_BREAK;

   if (model >= 100) {
      break_addr = P2_DEBUG_BREAK;
   }

   if (read_hub(break_addr, &temp) == 0) {
      if (temp != 0) {
         if (read_xmm(addr, value) == 0) {
            return 0;
         }
         else {
            if (diagnose) {
               fprintf(stderr, "xmm read failed\n");
            }
            return -1;
         }
      }
      else {
         if (diagnose) {
            fprintf(stderr, "program not stopped at breakpoint\n");
         }
         return -1;
      }
   }
   if (diagnose) {
      fprintf(stderr, "cannot determine program status\n");
   }
   return -1;
}


int blackbox_cog_write(int model, unsigned int addr, unsigned int new_value, int value_len) {
   unsigned int temp;
   unsigned int break_addr = P1_DEBUG_BREAK;

   if (model >= 100) {
      break_addr = P2_DEBUG_BREAK;
   }

   if (value_len != 4) {
      if (diagnose) {
         fprintf(stderr, "warning - value length not 4!\n");
      }
   }
   if (read_hub(break_addr, &temp) == 0) {
      if (temp != 0) {
         if (write_cog(addr, new_value) == 0) {
            return 0;
         }
         else {
            if (diagnose) {
               fprintf(stderr, "cog write failed\n");
            }
            return -1;
         }
      }
      else {
         if (diagnose) {
            fprintf(stderr, "program not stopped at breakpoint\n");
         }
         return -1;
      }
   }
   if (diagnose) {
      fprintf(stderr, "cannot determine program status\n");
   }
   return -1;
}


int blackbox_hub_write(unsigned int addr, unsigned int new_value, int value_len) {

   if (value_len != 4) {
      if (diagnose) {
         fprintf(stderr, "warning - value length not 4!\n");
      }
   }
   if (write_hub(addr, new_value) == 0) {
      return 0;
   }
   else {
      if (diagnose) {
         fprintf(stderr, "hub write failed\n");
      }
      return -1;
   }
   return -1;
}


int blackbox_xmm_write(int model, unsigned int addr, unsigned int new_value, int value_len) {
   unsigned int temp;
   unsigned int break_addr = P1_DEBUG_BREAK;

   if (model >= 100) {
      break_addr = P2_DEBUG_BREAK;
   }

   if (value_len != 4) {
      if (diagnose) {
         fprintf(stderr, "warning - value length not 4!\n");
      }
   }
   if (read_hub(break_addr, &temp) == 0) {
      if (temp != 0) {
         if (write_xmm(addr, new_value) == 0) {
            return 0;
         }
         else {
            if (diagnose) {
               fprintf(stderr, "cog write failed\n");
            }
            return -1;
         }
      }
      else {
         if (diagnose) {
            fprintf(stderr, "program not stopped at breakpoint\n");
         }
         return -1;
      }
   }
   if (diagnose) {
      fprintf(stderr, "cannot determine program status\n");
   }
   return -1;
}

int blackbox_set_inst(
   int model, 
   unsigned int addr,
   unsigned int new_inst, 
   unsigned int *old_inst
) {
   if ((model == 0) || (model == 100)|| (model == 111)) {
      if (read_hub(addr - reloc_value, old_inst) == 0) {
         return write_hub (addr - reloc_value, new_inst);
      }
   }
   else if ((model == 2) || (model == 5) || (model == 102) || (model == 105)) {
      if (read_xmm(addr - reloc_value, old_inst) == 0) {
         return write_xmm(addr - reloc_value, new_inst);
      }
   }
   else if ((model == 8) || (model == 108)) {
      unsigned int long_addr = addr & 0xfffffffc;
      if (read_hub(long_addr - reloc_value, old_inst) == 0) {
         if (addr == long_addr) {
            // instr is lower word
            new_inst = ((*old_inst) & 0xffff0000) | new_inst;
            *old_inst &= 0x0000ffff;
         }
         else {
            // instr is upper word
            new_inst = ((*old_inst) & 0x0000ffff) | (new_inst<<16);
            *old_inst >>= 16;
         }
         return write_hub (long_addr - reloc_value, new_inst);
      }
   }
   else {
      if (diagnose) {
         fprintf(stderr, "cannot set instruction - unknown memory model\n");
      }
   }
   return -1;
}


