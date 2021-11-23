//
// Payload: An LMM/XMM Program Loader for Catalina. This program can be used
//          to load SPIN or LMM programs. In combination with an XMM loader
//          it can be also used to load XMM programs. Normal SPIN or LMM
//          programs are loaded by specifying them as the first (and only) 
//          file - e.g:
//
//             payload  my_SPIN_or_LMM_program.binary
//
//          XMM programs must be loaded by specifying an XMM loader program
//          as the first file, and the program to be loaded as the second
//          file - e.g:
//
//             payload  XMM_LOADER.binary  my_XMM_program.binary
//           
// This version by Ross Higson, partly based on biffprop.c by bifferos, which
// was itself partly based on Loader.py by Remy Blank. 
//
// Version 2.4 - Initial release
//
// Version 2.5 - Add EEPROM programming option (-e).
//               Print message on error responses (load, program or verify).  
//
// Version 2.6 - Just update version number
//
// Version 2.7 - just update version number.
//
// Version 2.8 - use timeout value instead of fixed 250 ms when looking for
//               response, and add -u option to adjust reset time
//
// Version 2.9 - just update version number.
//
// Version 3.0 - look for files in %LCCDIR%\bin if not found locally - this
//               means files such as XMM.binary can be placed in the bin
//               directory and don't need to have the full path specified. 
//
//               Make max_attempts configurable (via -m).
//
// Version 3.0.3 - Fix bug in getting xmm.binary from bin directory.
//               Change terminology - "download" instead of "upload"
//
// Version 3.1 - just update version number.
//
// Version 3.2 - Add Auto-detection of secondary loader port.
//
// Version 3.3 - just update version number.
//
// Version 3.4 - just update version number.
//
// Version 3.5 - Correct bugs in reset_time and interfile_delay defaults.
//               Add option for 'chunking' the lfsr check (default is enabled).
//               To disable chunking use -l, to disable lfsr use -j. 
//
// Version 3.5.1 - Add interactive terminal option (use -i to enable).
//
// Version 3.5.2 - Fix codes for cusror visible/invisible.
//
// Version 3.5.3 - Always Use the first port for interactive mode, not the
//                 port used for second and subsequent downloads.
//
//                 Fixed a bug where interactive mode was not started when 
//                 verbose or diagnose option was also specified.
//
// Version 3.6   - Added -q to set line termination mode (i.e. ignore CR 
//                 and/or LF). For example, when executing programs that use 
//                 DOS line termination, the option -q1 will cause payload to
//                 ignore CRs, preventing the lines of output from vanishing
//                 as soon as they are complete.
//
//                 Payload now corrects the addresses of each page before it
//                 downloads it. This means the address sent to the Propeller
//                 along with the page always represents the actual address at
//                 which the page should be stored. This simplifies the load
//                 process on the Propeller, and makes it easier to change or 
//                 add new binary formats in future.
//
//                 Payload now supports the new (smaller) binary formats.
//                 
//                 Payload now skips empty Hub RAM pages - this requires that
//                 the various loaders zero Hub RAM before the load occurs.
//
// Version 3.7 - just update version number.
//
// Version 3.8 - just update version number.
//
// Version 3.9 - just update version number.
//
// Version 3.10 - allow EMM programs to be downloaded. This is intended to be 
//                used when the new EEPROM primary loader is specified first,
//                such as:
//
//                   catalina program.c -C EEPROM 
//                   payload EEPROM program
//
//                Added "(will retry)" to some warning messages, to indicate
//                that automatic retry will be attempted.
//
// Version 3.11 - extended the -q options. Now the following options ...
//                   1 = ignore CR
//                   2 = ignore LF
//
//                can be combined with ...
//                   4 = translate CR to LF
//                   8 = translate LF to CR
//
//                So (for example) ...
//                   -q6 means ignore LF, but translate CR to LF
//                   -q9 means ignore CR, but translate LF to CR
//                
//                note that combining 3 (i.e. ignore both CR and LF) with either
//                4 or 8 will have no effect.
//
//                Added buffering to improve load times.
//
//                Updated version number.
//
//  Version 3.11.1 - Fix for OS X, and add ability for port names to be
//                   specified on command line via the -p and -s command
//                   line options (e.g. -p /dev/cu.usbserial.12345678).
//
//  Version 3.12 - just update version number.
//
//  Version 3.13 - Just update version number.
//
//  Version 3.14 - Add environment variables and parameters for terminal 
//                 height or width. The precedence is command-line, then 
//                 environment variable, then default (80 x 24). 
//                 The command-line options is -g and accepts rows,cols:
//                    -g rows,cols
//                 The variables are:
//                    PAYLOAD_ROWS
//                    PAYLOAD_COLS
//
//                 e.g:
//
//                    set PAYLOAD_ROWS=50
//                    set PAYLOAD_COLS=120 
//
//  Version 3.15 - Initial Propeller 2 version. Note that the P1 and P2
//                 should both be autodetected, so there is no need for
//                 a command-line switch. If you have both P1 and P2 chips
//                 connected, you will have to specify the port to use.
//
//                 Added the option to specify the baud rate in the 
//                 environment variable PAYLOAD_BAUD - e.g:
//
//                    set PAYLOAD_BAUD=230400
//
//                 Added the possibility of using interactive mode even if
//                 no files are loaded - in this case the port must be
//                 explicitly specified (and some of the other options
//                 are ineffective). For example:
//
//                    payload -i -p3 -b 230400
//
//  Version 3.16 - Add Lua scripting. The script can be specified on the
//                 command line via the 'L' option.
//
//               - Added the -y option to suppress download progress messages.
//               
//               - Added the option to specify the port in the 
//                 environment variable PAYLOAD_PORT - e.g:
//
//                    set PAYLOAD_PORT=17 (Windows or Linux)
//                    export PAYLOAD_PORT=/dev/ttyUSB0 (Linux)
//
// Version 3.18 - accept any Prop2 version string.
//
// Version 4.0  - Just update version number.
//
// Version 4.1  - Make the default read timout 1000ms on Linux.
//
// Version 4.2  - Just update version number.
//
// Version 4.3  - Just update version number.
//
// Version 4.4  - Just update version number.
//
// Version 4.5  - Just update version number.
//
// Version 4.6  - Just update version number.
//
// Version 4.7  - Add -o to override propeller version detection (required
//                on Propeller 2 to program FLASH without needing a switch
//                setting on the P2_EVAL board). This required enabling the
//                -j option (lfsr disable). Also fix port number reported
//                in diagnostic ouptut.
//
// Version 4.8  - Just update version number.
//
// Version 4.9.4  - Minimum baud rate is now 300 baud.
//
//                  Allow -B as a synonym for -b
//
//-----------------------------------------------------------------------------
// Payload is part of Catalina.
//
// This program is free software; you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the
// Free Software Foundation, version 2.
//
// This program is distributed in the hope that it will be useful, but 
// WITHOUT ANY WARRANTY; without even the implied warranty of 
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General 
// Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
// ----------------------------------------------------------------------------

#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <ctype.h>
#include <time.h>
#include <pthread.h>
#include <curses.h>

#include "rs232.h"

#ifdef WIN32_PATHS         /* define this on the command line for Windows */
#include "lua-5.1.4\\src\\lua.h"
#include "lua-5.1.4\\src\\lualib.h"
#include "lua-5.1.4\\src\\lauxlib.h"
#else
#include "lua-5.1.4/src/lua.h"
#include "lua-5.1.4/src/lualib.h"
#include "lua-5.1.4/src/lauxlib.h"
#endif

#define VERSION            "4.9"

#define DEFAULT_LCC_ENV    "LCCDIR" // used to locate binary files if not in current directory

#define PAYLOAD_ROWS       "PAYLOAD_ROWS" // set the terminal height
#define PAYLOAD_COLS       "PAYLOAD_COLS" // set the terminal width

#define PAYLOAD_BAUD       "PAYLOAD_BAUD" // set the baud rate

#define PAYLOAD_PORT       "PAYLOAD_PORT" // set the port

#ifdef WIN32_PATHS         /* define this on the command line for Windows */
#define DEFAULT_SEP        "\\"
#define DEFAULT_LCCDIR     "C:\\Program Files (x86)\\Catalina" // must match default used by LCC
#else
#define DEFAULT_SEP        "/"
#define DEFAULT_LCCDIR     "/opt/catalina" // must match default used by LCC
#endif

#define MAX_FILES          3 // 3 is required only for cpu-to-prop-to-prop loads (using intermediate loader)
#define MAX_LINELEN        1000

#define MAX_P1_PROGRAM_SIZE   32768    // for LMM and SPIN programs, not XMM programs
#define MAX_P2_PROGRAM_SIZE   512*1024 // for all P2 programs

#define CMD_SHUTDOWN       0
#define CMD_LOADRUN        1  // load into RAM
#define CMD_PROGRUN        3  // program into EEPROM

#define MIN_BAUDRATE       300
#define MAX_BAUDRATE       3000000
#define DEFAULT_BAUDRATE   115200

#define MAX_CPU            255
#define DEFAULT_CPU        1

#define DEFAULT_SYNCTIME   100 // milliseconds
#define MAX_TIMEOUT        10000 // milliseconds
#define LUA_TIMEOUT        10000 // milliseconds

#define MAX_ATTEMPTS       5

#define SIO_EOP            0x00FFFFFE

#define INTERCHAR_DELAY    0 // milliseconds
#define INTERPAGE_DELAY    0 // milliseconds

#ifdef _WIN32

// these have been set by trial and error, and may vary on different machines

#define RESET_TIME         15 // milliseconds
#define RESET_DELAY        0 // milliseconds
#define INTERFILE_DELAY    500 // milliseconds
#define DEFAULT_TIMEOUT    250 // milliseconds

#else

// these have been set by trial and error, and may vary on different machines

#define RESET_TIME         15 // milliseconds
#define RESET_DELAY        0 // milliseconds
#define INTERFILE_DELAY    100 // milliseconds
#define DEFAULT_TIMEOUT    1000 // milliseconds

#endif

#define LFSR_CHUNKSIZE     256

#define MAX_LONGS          256 // used for buffering

#define ESC                0x1b
#define VT100_ROWS         24
#define VT100_COLS         80

#define LMM_INIT_B0_OFF    0x51 // must match kernels and *mm_progbeg.s
#define LMM_INIT_BZ_OFF    0x51
#define LMM_LAYOUT_OFFS    (LMM_INIT_BZ_OFF - LMM_INIT_B0_OFF + 0x10)

#define KERNEL_SIZE        0x0800 // size of kernel (max - 2048 bytes) 
#define HUB_SIZE           0x8000 // size of HUB RAM
#define SECTOR_SIZE        0x0200 // size of XMM prologue (one sector)

#define SHORT_LAYOUT_3     1 /* 1 if unused bytes removed from layout 3 */
#define SHORT_LAYOUT_4     1 /* 1 if unused bytes removed from layout 4 */
#define SHORT_LAYOUT_5     1 /* 1 if unused bytes removed from layout 5 */

#define NO_NULL_HUB_PAGES  1 /* 1 to skip null pages - RAM must be zeroed! */

#define MAX_P2_RESPONSE    14 /* size of P2 response string */

#define USE_BASE64         1

typedef unsigned int u32;
typedef unsigned char u8;


static int    auto_port = 1;  // 1 means auto (starting at port 0)
static int    port = 0;
static int    mode = 0;
static int    term = -1;
static int    eeprom = 0;
static int    interactive = 0;
static int    version = 0;
static int    suppress = 0;
static int    lfsr_check = 1;
static int    lfsr_chunking = 1;
static int    cpu = DEFAULT_CPU;
static int    my_baudrate = DEFAULT_BAUDRATE;
static int    my_timeout = DEFAULT_TIMEOUT;
static int    synctime = DEFAULT_SYNCTIME;
static int    max_attempts = MAX_ATTEMPTS;
static int    waitmode = 0;
static int    xmm_only = 0;
static int    double_reset = 0;
static int    reset_delay = RESET_DELAY;
static int    reset_time = RESET_TIME;
static int    interfile_delay = INTERFILE_DELAY;
static int    interpage_delay = INTERPAGE_DELAY;
static int    second_port = -1; // -1 => use first port
static int    verbose = 0;
static int    term_size = 0;
static int    term_cols = 0;
static int    term_rows = 0;
static int    default_cols = VT100_COLS;
static int    default_rows = VT100_ROWS;
static int    diagnose = 0;
static int    override = 0;
static int    file_count = 0;                  
static char * file_name[MAX_FILES];


// the Lua interpreter
lua_State* L;

// the name of the Lua script to execute
static char * lua_script = NULL;

static unsigned char lfsr_data[500];
static unsigned char lfsr_chunk[LFSR_CHUNKSIZE];



// safecpy will never write more than size characters, 
// and is guaranteed to null terminate its result, so
// make sure the buffer passed is at least size + 1
char * safecpy(char *dst, const char *src, size_t size) {
   dst[size] = '\0';
   if (src) {
      return strncpy(dst, src, size - strlen(dst));
   }
   return NULL;
}


// safecat will never write more than size characters, 
// and is guaranteed to null terminate its resul, so
// make sure the buffer passed is at least size + 1
char * safecat(char *dst, const char *src, size_t size) {
   dst[size] = '\0';
   if (src) {
      return strncat(dst, src, size - strlen(dst));
   }
   return NULL;
}


// init the lfsr array
void lfsr_init() {
  int i;
  u8 seed = 'P';
  for (i = 0; i < sizeof(lfsr_data); i++) {
    lfsr_data[i] = seed & 0x01;
    seed = ((seed << 1) & 0xfe) | (((seed >> 7) ^ (seed >> 5) ^ (seed >> 4) ^ (seed >> 1)) & 1);
  }
}

// write a single long (writes a byte at a time, assumes driver buffers)
static void writeLong(int port, u32 value) {
  int i;
  u8 tmp;
  //printf("%8x:",value);
  for (i=0; i<10; i++)
  {
    tmp = 0x92 | (value & 0x01) | ((value & 2) << 2) | ((value & 4) << 4);
    SendByte(port, tmp);
    //printf("%2x ",tmp);
    value >>=3;
  }
  tmp = 0xf2 | (value & 0x01) | ((value & 2) << 2);
  SendByte(port, tmp);
  //printf("%2x\n",tmp);
}


// Write multiple longs in chunks of MAX_LONGS each (better if driver doesn't buffer)
static void writeMultipleLongs(int port, u32 data[], int count) {
  int i, l, c, b;
  u32 value;
  u8 tmp[MAX_LONGS];

  c = 0;
  for (l = 0; l < count; l++) {
     b = 0;
     do {
        value = data[l];
        for (i = 0; i < 10; i++)
        {
          tmp[b++] = 0x92 | (value & 0x01) | ((value & 2) << 2) | ((value & 4) << 4);
          value >>=3;
        }
        tmp[b++] = 0xf2 | (value & 0x01) | ((value & 2) << 2);
        c++;
     } while ((c % MAX_LONGS != 0)  && (c < l));

     if (b > 0) {
        SendBuf(port, tmp, b);
     }
  }
}


void mdelay(u32 ms) {

#ifdef _WIN32
    Sleep(ms);
#else
    usleep(ms*1000);
#endif

}

int send_string(int port, char *str) {
#ifdef DEBUG
   printf("%s", str);
#endif
   while (*str) {
      if (!SendByte(port, *str++)) {
         return -1;
      }
   }
   return 0;
}

int send_command(int port, char *cmd, char *rsp, int count) {
   int i;
#ifdef DEBUG
   printf("sending %s\n", cmd);
#endif
   while (*cmd != 0) {
      if (!SendByte(port, *cmd++)) {
         return -1;
      }
   }
   i = 0;
   while (i < count) {
      if (!(rsp[i++] = ReceiveByte(port))) {
         return -1;
      }
      rsp[i]='\0';
   }
#ifdef DEBUG
   printf("received %s\n", rsp);
#endif
   return 0;
}

void dump_string(char *str) {
   int i;
   while (*str) {
      printf("%02x ", *str++);
   }
}

int prop_connect_2(int port) {
   char p2_response[MAX_P2_RESPONSE + 1];
   if (send_command(port, "> Prop_Chk 0 0 0 0\n", p2_response, MAX_P2_RESPONSE) == 0) {
      if (diagnose) {
         printf("received (");
         dump_string(p2_response);
         printf(")\n");
      }
      if (strncmp(p2_response, "\r\nProp_Ver ", 11) == 0) {
         if (diagnose) {
            printf("identified propeller 2 version %c\n", p2_response[11]);
         }
         return 2;
      }
   }
   if (diagnose) {
      printf("not a propeller 2\n");
   }
   return -1;
}

int prop_connect(int port) {
  int i;
  int received, version;
  int retries;
  
  lfsr_init();

  if (reset_delay > 0) {
     if (verbose) {
        fprintf(stderr, "delaying before reset\n");
     }
     mdelay(reset_delay);
     if (verbose) {
        fprintf(stderr, "reset\n");
     }
  }

#ifdef DEBUG_RESET
  fprintf(stderr, "ready to %sreset - press enter to continue\n", (double_reset ? "double " : ""));
  while ((i = getchar()) != '\n') {
     ;
  }
#endif


  // BradC recommended 'double-reset' routine:
  if (double_reset) {
     SetDTR(port);
     mdelay(reset_time);
     ClrDTR(port);
     mdelay(reset_time);
  }
  SetDTR(port);
  mdelay(reset_time);
  ClrDTR(port);
  if (override == 2) {
     // on the P2 we make this configurable, so we can catch the 100ms serial window
     mdelay(reset_time);
  }
  else {
     // the P1 requires this
     mdelay(95);
  }

  if (override != 2) {
     if (!SendByte(port, 0xf9)) {  // calibration pulse
        return -1;
     }
  }

  ClearInput(port);

  // Connect to the prop
  if (override != 2) {
     for (i = 0; i < sizeof(lfsr_data)/2; i++) {
       lfsr_data[i] |= 0xfe;
     }
     if (!SendBuf(port, lfsr_data, sizeof(lfsr_data)/2)) {
        return -1;
     } 
  }

  if (lfsr_check && (override != 2)) {

     if (lfsr_chunking) {

        for (i = 0; i < LFSR_CHUNKSIZE; i++) {
           lfsr_chunk[i] = 0xf9;
        }

        i = sizeof(lfsr_data)/2;
        while (i < sizeof(lfsr_data)) {
          int j;

          j = sizeof(lfsr_data) - i;
          if (j > LFSR_CHUNKSIZE) {
             j = LFSR_CHUNKSIZE;
          }
          if (!SendBuf(port, lfsr_chunk, j)) {  // for pacing
             // see if it is a Propeller 2
             return prop_connect_2(port);
          }
          if (diagnose > 2) {
             // don't enable this message unless -d -d -d specified - 
             // it seems to interfere with the timing!
             fprintf(stderr, "reading LFSR\n");
          }
          while (j > 0) {
             retries = 0;
             do {
               received = ReceiveByte(port);
               retries++;
               if ((received == 0xff) || (received == 0xfe)) {
                  break;
               }
             } while (retries < max_attempts);

             if (received < 0) {
                if (diagnose) {
                   fprintf(stderr, "Error: no lfsr data received\n");
                }
                // see if it is a Propeller 2
                return prop_connect_2(port);
             }
             if (diagnose > 2) {
                // don't enable this message unless -d -d -d specified - 
                // it seems to interfere with the timing!
                fprintf(stderr, "LFSR read\n");
             }
             // check validity
             if ((lfsr_data[i] | 0xfe) != received) {
                // Just print out the error, don't abort, to see what's going on.
                // Should probably store these up rather than allow the console output to 
                // interfere with timing, after all it might be over a network.
                if (diagnose) {
                   fprintf(stderr, "Error: lfsr data incorrect at %d - received %d (expected %d)\n", i, received, lfsr_data[i] | 0xfe);
                }
                else {
                  // see if it is a Propeller 2
                  return prop_connect_2(port);
                }
             }
             i++;
             j--;
          }
        }
     }
     else {
        i = sizeof(lfsr_data)/2;
        while (i < sizeof(lfsr_data)) {
          if (!SendByte(port, 0xf9)) {  // for pacing
             // see if it is a Propeller 2
             return prop_connect_2(port);
          }
          if (diagnose > 1) {
             fprintf(stderr, "reading LFSR\n");
          }
          retries = 0;
          do {
            received = ReceiveByte(port);
            retries++;
            if ((received == 0xff) || (received == 0xfe)) {
               break;
            }
          } while (retries < max_attempts);

          if (received < 0) {
             if (diagnose) {
                fprintf(stderr, "Error: no lfsr data received\n");
             }
             // see if it is a Propeller 2
             return prop_connect_2(port);
          }
          if (diagnose > 1) {
             fprintf(stderr, "LFSR read\n");
          }
          // check validity
          if ((lfsr_data[i] | 0xfe) != received) {
             // Just print out the error, don't abort, to see what's going on.
             // Should probably store these up rather than allow the console output to 
             // interfere with timing, after all it might be over a network.
             if (diagnose) {
                fprintf(stderr, "Error: lfsr data incorrect at %d - received %d (expected %d)\n", i, received, lfsr_data[i] | 0xfe);
             }
             else {
                // see if it is a Propeller 2
                return prop_connect_2(port);
             }
          }
          i++;
        }
     }
  }
  else if (override != 2) {

     for (i = 0; i < sizeof(lfsr_data)/2; i++) {
       lfsr_data[i] = 0xf9;
     }

     SendBuf(port, lfsr_data, sizeof(lfsr_data)/2);

     mdelay(synctime); // delay a bit to ensure all lfsr characters received

     ClearInput(port);

  }

  // version bit

  version = 0;

  if (override == 2) {
     return prop_connect_2(port);
  }
  else {
     for (i=0; i<8; i++) {
       SendByte(port, 0xf9);
       version >>= 1;
       received = ReceiveByte(port);
       if (received < 0) {
          if (verbose) {
             fprintf(stderr, "Error: no version received\n");
          }
          if (override != 1) {
             // see if it is a Propeller 2
             return prop_connect_2(port);
          }
       }
       version |= (received == 0xff) ? 0x80 : 0;
     }
  }

  return version;
}



int prop_download(int port, u8* buffer, size_t len) {
  u32* ptr  = (u32*)buffer;
  u32 count = len/4;    // assume this is multiple of 4 and no padding needed.
  int response;

  if (eeprom) {
     writeLong(port, CMD_PROGRUN);
  }
  else {
     writeLong(port, CMD_LOADRUN);
  }
  writeLong(port, count);
  writeMultipleLongs(port, ptr, count);
  
  count = my_timeout/50; // 250 ms    
  while (count-- > 0) {
    SendByte(port, 0xf9);  // wait for the response
    mdelay(50);
    if (ByteReady(port)) break;
  }
  response = ReceiveByte(port);
  if (response < 0) {
     fprintf(stderr, "Error: No response received\n");
     return -1;
  }
  else {
     if (diagnose) {
        fprintf(stderr, "Response = 0x%02x\n", response);
     }
     if (response != 0xFE) {
        fprintf(stderr, "Error loading program\n");
        return -1;
     }
  }

  if (eeprom) {
 
     count = 100; // 5s    
     while (count-- > 0) {
       SendByte(port, 0xf9);  // wait for the response
       mdelay(50);
       if (ByteReady(port)) break;
     }
     response = ReceiveByte(port);
     if (response < 0) {
        fprintf(stderr, "Error: No response received\n");
        return -1;
     }
     else {
        if (diagnose) {
           fprintf(stderr, "Response = 0x%02x\n", response);
        }
     }
     if (response != 0xFE) {
        fprintf(stderr, "Error programming EEPROM\n");
        return -1;
     }

     count = 40; // 2s    
     while (count-- > 0) {
       SendByte(port, 0xf9);  // wait for the response
       mdelay(50);
       if (ByteReady(port)) break;
     }
     response = ReceiveByte(port);
     if (response < 0) {
        fprintf(stderr, "Error: No response received\n");
        return -1;
     }
     else {
        if (diagnose) {
           fprintf(stderr, "Response = 0x%02x\n", response);
        }
     }
     if (response != 0xFE) {
        fprintf(stderr, "Error verifying EEPROM\n");
        return -1;
     }
  }
  return 0;
}

char *base64_encode(const unsigned char *data,
                    size_t input_length,
                    size_t *output_length);

int prop_p2_download(int port, u8* buffer, size_t len) {
  int i;
  char hex[4];
  char *base64;
  size_t base64_len;

#ifdef DEBUG
  printf("sending \n");
#endif
#ifdef USE_BASE64
  send_string(port, "> Prop_Txt 0 0 0 0 ");
  base64 = base64_encode(buffer, len, &base64_len);
  SendBuf(port, base64, strlen(base64));
  send_string(port, " ~");
  free(base64);
#else
  send_string(port, "> Prop_Hex 0 0 0 0 ");
  for (i = 0; i < len; i++) {
      sprintf(hex, "%X ", buffer[i]);
      send_string(port, hex);
  }
  send_string(port, "~");
#endif
#ifdef DEBUG
  printf("\nsend complete\n");
#endif
  return 0;
}


void cat_WriteByte(int port, u8 b) {
   if (diagnose > 1) {
      fprintf(stderr, "Sending byte 0x%02x\n", b);
   }
   if (b == 0xff) {
      SendByte(port, b);
      SendByte(port, 0);
   }
   else {
      SendByte(port, b);
   }
}

void cat_WriteLong(int port, unsigned long l) {
   int i;

   for (i = 0; i < 4; i++) {
      cat_WriteByte(port, l & 0xff);
      l >>= 8;
   }
}

void cat_WriteSync(int port, u8 cpu) {
   SendByte(port, 0xff);
   SendByte(port, cpu);
}

void cat_WritePage(int port, u8 *page, unsigned long addr, u8 cpu) {
   int i;

   if (diagnose) {
      fprintf(stderr, "Sending page %08lX\n", addr);
   }
   cat_WriteLong(port, (cpu << 24) | addr);
   cat_WriteLong(port, SECTOR_SIZE);
   for (i = 0; i < SECTOR_SIZE; i++) {
      cat_WriteByte(port, page[i]);
      if (INTERCHAR_DELAY > 0) {
         mdelay(INTERCHAR_DELAY);
      }
   }

}

int cat_ReadByte(int port, int cpu) {
   int result;
   int i;

   static int save_data = 0;

   if (save_data & 0x100) {
      if (save_data != 0x1ff) {
        result = save_data & 0xff;
        save_data = 0;
        if (diagnose > 1) {
           fprintf(stderr, "Read byte 0x%02x\n", result);
        }
        return result;
      }
   }
   
   while (1) {
      for (i = 0; i < 5; i++) {
         result = ReceiveByte(port);
         if (diagnose > 1) {
            fprintf(stderr, "Read result %d\n", result);
         }
         if (result != -1) {
            break;
         }
      }
      if (result < 0) {
         if (diagnose > 1) {
            fprintf(stderr, "Read result %d\n", result);
         }
         return result;
      }
      if (save_data == 0x1ff) {
        if (result == cpu) {
           if (diagnose > 1) {
              fprintf(stderr, "Read sync for cpu %d\n", cpu);
           }
           return -2;
        }
        if (result == 0) {
           result = 0xff;
           save_data = 0;
        }
        else {
           save_data = result | 0x100;
           result = 0xff;
        }
        if (diagnose > 1) {
           fprintf(stderr, "Read byte 0x%02x\n", result);
        }
        return result;
      }
      else {
         if (result == 0xff) {
            save_data = 0x1ff;
         }
         else {
            save_data = 0;
            if (diagnose > 1) {
               fprintf(stderr, "Read byte 0x%02x\n", result);
            }
            return result;
         }
      }
   }
}

int cat_ReadSync(int port, int cpu) {
   int result;
   int retries;
   retries = 0;
   while (1) {
      result = ReceiveByte(port);
      //if (result < 0) {
         //return result;
      //}
      if (result == 0xff) {
         result = ReceiveByte(port);
         if (result == cpu) {
            return 1;
         }
      }
      retries++;
      if (retries > max_attempts) {
         return 0;
      }
      if (synctime > 0) {
         mdelay (synctime);
      }
   }
}

u8 cat_LRC(u8 *buffer, int size) {
   int i;
   u8 result = 0;

   for (i = 0; i < size; i++) {
      result ^= buffer[i];
   }
   return result;
}

int cat_connect(int port, int cpu) {
  unsigned char buffer[SECTOR_SIZE];
  unsigned int addr;
  int result;
  u8 lrc;
  int i;

  ClearInput(port);
  cat_WriteSync(port, cpu);
  addr = 0;
  // send a dummy page
  for (i = 0; i < SECTOR_SIZE; i++) {
     buffer[i] = i;
  }
  lrc = cat_LRC (buffer, SECTOR_SIZE);
  cat_WritePage(port, buffer, addr, cpu);
  if (cat_ReadSync(port, cpu)) {
     if (diagnose) {
        fprintf(stderr, "Sync received\n");
     }
     if ((result = cat_ReadByte(port, cpu)) == lrc) {
        if (diagnose) {
           fprintf(stderr, "LRC received - 0x%02x\n", lrc);
        }
        return 1;
     }
     else {
        if (diagnose) {
           fprintf(stderr, "Warning: incorrect LRC - expected 0x%02x, received 0x%02x\n", lrc, result);
        }
     }
  }
  else {
     if (diagnose) {
        fprintf(stderr, "Warning: no sync received\n");
     }
  }
  return 0;
}

int cat_download(int port, char *fname, int cpu, int connected) {
  FILE *f;
  char full_name[MAX_LINELEN + 1];
  unsigned char buffer[SECTOR_SIZE];
  unsigned int addr;
  u8 lrc;
  int result;
  int res;
  int i;
  int retries;
  int count;
  int seglayout = -1;
  int code_addr;
  int cnst_addr;
  int init_addr;
  int data_addr;
  int ends_addr;
  int ro_base;
  int rw_base;
  int ro_ends;
  int rw_ends;
  int ro_beg;
  int ro_end;
  int rw_beg;
  int rw_end;
  long fsize;
#if NO_NULL_HUB_PAGES
  int isnull;
#endif

  safecpy(full_name, fname, MAX_LINELEN);
  if ((strstr(full_name, ".bin") == NULL)
  &&  (strstr(full_name, ".eeprom") == NULL)) {
     // try ".bin" first ...
     safecat(full_name, ".bin", MAX_LINELEN);
  }
  if (verbose) {
     fprintf(stderr, "Loading Propeller binary %s\n", fname);
  }

  f = fopen(full_name, "rb");
  if (f == NULL) {
     if (strstr(full_name, ".binary") == NULL) {
        // try adding "ary" ...
        safecat(full_name, "ary", MAX_LINELEN);
        f = fopen(full_name, "rb");
     }
  }

  if (f == NULL) {
     fprintf(stderr, "Error: Unable to open file %s\n", full_name);
     return -1;
  }

  if (!connected) {
     ClearInput(port);
     cat_WriteSync(port, cpu);
  }
  addr = 0;
  fseek(f, 0, SEEK_END);
  fsize = ftell(f); 
  if (diagnose) {
     printf("file = %ld bytes\n", fsize);
  }
  if (fsize <= HUB_SIZE) {
     // must be layout 0 - no other statistics needed
     seglayout = 0;
  }
  fseek(f, 0, SEEK_SET);

  while (1) {
     for (i = 0; i < SECTOR_SIZE; i++) {
        buffer[i] = 0;
     }
     res = fread(buffer, sizeof(char), SECTOR_SIZE, f);

     if (res > 0) {

        if ((seglayout < 0) && (addr == HUB_SIZE)) {
           // not layout 0, so check for EEPROM SDCARD or XMM
           if (diagnose) {
              printf("Descriphering prologue\n");
           }
           count = LMM_LAYOUT_OFFS + 0x10;
           seglayout =  buffer[count+0] 
                     | (buffer[count+1]<<8) 
                     | (buffer[count+2]<<16) 
                     | (buffer[count+3]<<24);
           if ((seglayout == 6) || (seglayout == 10)) {
              // SDCARD program - these cannot be loaded using Payload
              printf("Binary layout %d not supported\n", seglayout);
              return -1;
           }
           count += 4;
   
           if (diagnose) {
              printf("seglayout = %08X\n", seglayout);
           }
   
           // for XMM programs, decode the prologue
           code_addr =  buffer[count+0] 
                     | (buffer[count+1]<<8) 
                     | (buffer[count+2]<<16) 
                     | (buffer[count+3]<<24);
           count += 4;
           if (diagnose) {
              printf("code_addr = %08X\n", code_addr);
           }
           cnst_addr =  buffer[count+0] 
                     | (buffer[count+1]<<8) 
                     | (buffer[count+2]<<16) 
                     | (buffer[count+3]<<24);
           count += 4;
           if (diagnose) {
              printf("cnst_addr = %08X\n", cnst_addr);
           }
           init_addr =  buffer[count+0] 
                     | (buffer[count+1]<<8) 
                     | (buffer[count+2]<<16) 
                     | (buffer[count+3]<<24);
           count += 4;
           if (diagnose) {
              printf("init_addr = %08X\n", init_addr);
           }
           data_addr =  buffer[count+0] 
                     | (buffer[count+1]<<8) 
                     | (buffer[count+2]<<16) 
                     | (buffer[count+3]<<24);
           count += 4;
           if (diagnose) {
              printf("data_addr = %08X\n", data_addr);
           }
           ends_addr =  buffer[count+0] 
                     | (buffer[count+1]<<8) 
                     | (buffer[count+2]<<16) 
                     | (buffer[count+3]<<24);
           count += 4;
           if (diagnose) {
              printf("ends_addr = %08X\n", ends_addr);
           }
           ro_base =    buffer[count+0] 
                     | (buffer[count+1]<<8) 
                     | (buffer[count+2]<<16) 
                     | (buffer[count+3]<<24);
           count += 4;
           if (diagnose) {
              printf("ro_base   = %08X\n", ro_base);
           }
           rw_base =    buffer[count+0] 
                     | (buffer[count+1]<<8) 
                     | (buffer[count+2]<<16) 
                     | (buffer[count+3]<<24);
           count += 4;
           if (diagnose) {
              printf("rw_base   = %08X\n", rw_base);
           }
           ro_ends =    buffer[count+0] 
                     | (buffer[count+1]<<8) 
                     | (buffer[count+2]<<16) 
                     | (buffer[count+3]<<24);
           count += 4;
           if (diagnose) {
              printf("ro_ends   = %08X\n", ro_ends);
           }
           rw_ends =    buffer[count+0] 
                     | (buffer[count+1]<<8) 
                     | (buffer[count+2]<<16) 
                     | (buffer[count+3]<<24);
           count += 4;
           if (diagnose) {
              printf("rw_ends   = %08X\n", rw_ends);
           }
           if (((SHORT_LAYOUT_3 == 1) && (seglayout == 3)) 
           ||  ((SHORT_LAYOUT_4 == 1) && (seglayout == 4))) {
              // Layouts 3 & 4 have additional padding between the RW & RO
              // segments, so calculate the start and end of these segments
              ro_beg = ro_base + 0x10;
              ro_end = ro_ends + 0x10 + SECTOR_SIZE - 1;
              ro_end /= SECTOR_SIZE;
              ro_end *= SECTOR_SIZE;
              if (diagnose) {
                 printf("ro_beg    = %08X\n", ro_beg);
                 printf("ro_end    = %08X\n", ro_end);
              }
              rw_beg = rw_base + 0x10;
              rw_end = rw_ends + 0x10 + SECTOR_SIZE - 1;
              rw_end /= SECTOR_SIZE;
              rw_end *= SECTOR_SIZE;
              if (diagnose) {
                 printf("rw_beg    = %08X\n", rw_beg);
                 printf("rw_end    = %08X\n", rw_end);
              }
           }
        }

        
        if (((SHORT_LAYOUT_3 == 1) && (seglayout == 3)) 
        ||  ((SHORT_LAYOUT_4 == 1) && (seglayout == 4))) {
           if (addr == HUB_SIZE + SECTOR_SIZE) {
              // we removed the padding up to rw_base, so the 
              // next page actually starts at rw_beg
              addr = rw_beg + HUB_SIZE;
           }
        }

        if (((SHORT_LAYOUT_3 == 1) && (seglayout == 3)) 
        ||  ((SHORT_LAYOUT_4 == 1) && (seglayout == 4))) {
           if (addr == rw_end + HUB_SIZE) {
              // we removed the padding up to ro_base, so the 
              // next page actually starts at ro_base
              addr = ro_beg + HUB_SIZE;
           }
        }

        lrc = cat_LRC (buffer, SECTOR_SIZE);
        retries = 0;
        while (retries < max_attempts) {
           if ((retries > 0) && verbose) {           
              fprintf(stderr, "Retry %d\n", retries);
           }
#if NO_NULL_HUB_PAGES
           if (addr < HUB_SIZE) {
              isnull = 0;
              for (i = 0; i < SECTOR_SIZE; i++) {
                 if ((isnull |= buffer[i])) {
                    break;
                 }
              }
              if (isnull == 0) {
                 if (diagnose) {
                    fprintf(stderr, "Skipping null %08X\n", addr);
                 }
                 addr += SECTOR_SIZE;
                 break;
              }
           }
#endif
           cat_WritePage(port, buffer, addr, cpu);
           mdelay (interpage_delay);
           if (verbose && !diagnose) {
              fprintf(stderr, ".");
           }
           if (cat_ReadSync(port, cpu)) {
              if ((result = cat_ReadByte(port, cpu)) >= 0) {
                 if (lrc == result) {
                    addr += SECTOR_SIZE;
                    break;
                 }
                 else {
                    fprintf(stderr, "Warning: incorrect LRC for addr %08x - expected 0x%02x, received 0x%02x (will retry)\n", addr, lrc, result);
                 }
              }
              else {
                 fprintf(stderr, "Warning: no LRC received for addr %08x (will retry)\n", addr);
              }
           }
           else {
              fprintf(stderr, "Warning: no sync received for addr %08x (will retry)\n", addr);
           }
           retries++;
        }
        if (retries == max_attempts) {
           fprintf(stderr, "Error: too many retries for addr %08x\n", addr);
           return -1;
        }
     }
     else {
        break;
     }
  }
  cat_WriteLong(port, SIO_EOP | (cpu << 24));
  cat_WriteLong(port, 0);
  if (verbose) {
     fprintf(stderr, "\n");
  }
  return 0;
}


int prop_open(int port, int my_baudrate, int my_timeout, int verbose) {
  int result;

  result = OpenComport(port, my_baudrate, my_timeout, verbose);
  if (diagnose) {
     if (result == 0) {
        fprintf(stderr, "opened port %d\n", port + 1);
     }
     else {
        fprintf(stderr, "error %d opening port %d\n", result, port + 1);
     }
  }
  // flush input
  //while (ByteReady(port)) {
     //ReceiveByte(port);
  //}
  return result;
}


void prop_close(int port) {
  CloseComport(port);
  // flush input
  //while (ByteReady(port)) {
     //ReceiveByte(port);
  //}
}


int alldigits(char *str) {
   int len = strlen(str);
   int i;

   for (i = 0; i < len; i++) {
      if (!isdigit(str[i])) {
         return 0;
      }
   }
   return 1;
}

// Up to 512k in size (plus 1 so we detect files larger than 512k).
unsigned char buffer[MAX_P2_PROGRAM_SIZE + 1];

int LoadPropellerFile(const char* fname) {
  char full_name[MAX_LINELEN + 1];
  char alternate_name[MAX_LINELEN + 1] = "";
  FILE *f;
  int res;

  safecpy(full_name, fname, MAX_LINELEN);
  if ((strstr(full_name, ".bin") == NULL)
  &&  (strstr(full_name, ".eeprom") == NULL)) {
     // try ".bin" first ...
     safecat(full_name, ".bin", MAX_LINELEN);
  }
  if (verbose) {
     fprintf(stderr, "Loading Propeller binary %s\n", fname);
  }

  f = fopen(full_name, "rb");
  if (f == NULL) {
    if (strstr(full_name, ".binary") == NULL) {
       // try adding "ary" ...
       safecat(full_name, "ary", MAX_LINELEN);
       f = fopen(full_name, "rb");
    }
  }

  if (f == NULL) {
     if (verbose) {
        fprintf(stderr, "Error: Unable to open local file %s\n - trying bin directory\n", full_name);
     }
     // try bin directory
     safecpy(alternate_name, getenv(DEFAULT_LCC_ENV), MAX_LINELEN);
     if (strlen(alternate_name) == 0) {
         safecpy(alternate_name, DEFAULT_LCCDIR, MAX_LINELEN);
     }
     safecat(alternate_name, DEFAULT_SEP, MAX_LINELEN);
     safecat(alternate_name, "bin", MAX_LINELEN);
     safecat(alternate_name, DEFAULT_SEP, MAX_LINELEN);
     safecat(alternate_name, full_name, MAX_LINELEN);
     f = fopen(alternate_name, "rb");
     if (f == NULL) {
        fprintf(stderr, "Error: Unable to open file %s\n", full_name);
        return 0;
     }
  }
  res = fread(buffer, sizeof(char), sizeof(buffer)/sizeof(char), f);
  if (res == 0) {
    fprintf(stderr, "Error: %s is an empty file\n", fname);
    fclose(f);
    return 0;
  }
  if (version == 1) {
     if (res > MAX_P1_PROGRAM_SIZE) {
       fprintf(stderr, "Error: %s is larger than %d bytes - this is too large to load as the first file\n", fname, MAX_P1_PROGRAM_SIZE);
       fclose(f);
       return 0;
     }
     if ((res % 4)) {
       fprintf(stderr, "Error: %s length (%d) is not a multiple of 4, - check it is a Propeller binary\n", fname, res);
       fclose(f);
       return 0;
     }
  }
  else if (version == 2) {
     if (res == sizeof(buffer)) {
       fprintf(stderr, "Error: %s is larger than %d bytes - this is too large to load as the first file\n", fname, MAX_P2_PROGRAM_SIZE);
       fclose(f);
       return 0;
     }
  }
  fclose(f);
  return res;
}

void help(char *my_name) {
   int i;

   fprintf(stderr, "\nusage: %s [options] propeller_file [catalina_file ...]\n\n", my_name);
   fprintf(stderr, "options:  -? or -h  print this helpful message and exit (-v for more help)\n");
   fprintf(stderr, "          -a port   find ports automatically, starting from specified port\n");
   fprintf(stderr, "          -b baud   use specified baudrate (default is %d)\n", DEFAULT_BAUDRATE);
   fprintf(stderr, "          -B baud   same as -b\n");
   fprintf(stderr, "          -c cpu    cpu destination for catalina download (default is %d)\n", DEFAULT_CPU);
   fprintf(stderr, "          -d        diagnostic mode (-d again for more diagnostics)\n");
   fprintf(stderr, "          -e        program the EEPROM with the program loaded\n");
   fprintf(stderr, "          -f msec   set interfile delay in milliseconds (default is %d)\n", INTERFILE_DELAY);
   fprintf(stderr, "          -g c,r    set terminal columns and rows - default is %d,%d\n", default_cols, default_rows);
   fprintf(stderr, "          -i        interactive mode - act as terminal after load\n");
   fprintf(stderr, "          -j        disable lfsr check altogether\n");
   fprintf(stderr, "          -k msec   set interpage delay in milliseconds (default is %d)\n", INTERPAGE_DELAY);
   fprintf(stderr, "          -l        use old style lfsr check (slower) \n");
   fprintf(stderr, "          -L name   execute the named Lua script after opening the port\n");
   fprintf(stderr, "          -m max    set max_attempts (default is %d)\n", MAX_ATTEMPTS);
   fprintf(stderr, "          -n msec   set sync timeout in milliseconds (default is %d)\n", DEFAULT_SYNCTIME);
   fprintf(stderr, "          -o vers   override Propeller version detection (vers 1 = P1, 2 = P2)\n");
   fprintf(stderr, "          -p port   use port for downloads (just first download if -s used)\n");
   fprintf(stderr, "          -q mode   line mode (1=ignore CR,2=ignore LF,4=LF to CR,8=CR to LF)\n");
   fprintf(stderr, "          -r msec   set reset delay in milliseconds (default is %d)\n", RESET_DELAY);
   fprintf(stderr, "          -s port   switch to port for second and subsequent downloads\n");
   fprintf(stderr, "          -t msec   set read timeout in milliseconds (default is %d)\n", DEFAULT_TIMEOUT);
   fprintf(stderr, "          -u msec   set reset time in milliseconds (default is %d)\n", RESET_TIME);
   fprintf(stderr, "          -v        verbose mode (or include port numbers in help message)\n");
   fprintf(stderr, "          -w        wait for a keypress between each load\n");
   fprintf(stderr, "          -x        do catalina download only (boot loader already loaded)\n");
   fprintf(stderr, "          -y        do not display download progress messages\n");
   fprintf(stderr, "          -z        double reset\n");
   if (verbose) {
      fprintf(stderr, "\nport can be:\n");
      for (i = 0; i < ComportCount(); i++) {
         fprintf(stderr, "          %s%d = %s\n", (i < 9 ? " " : ""), i + 1, ShortportName(i));
      }
   }
}

/*
 * decode arguments, building file list - return -1 if
 * there is no further processing to do
 */
int decode_arguments (int argc, char *argv[]) {
   int  i = 0;
   int  code = 0;
   char filename[MAX_LINELEN + 3 + 1];
   char primary_portname[MAX_LINELEN + 3 + 1];
   char second_portname[MAX_LINELEN + 3 + 1];

   while ((code >= 0) && (argc--)) {
      if (diagnose) {
         fprintf(stderr, "arg: %s\n", argv[i]);
      }
      if (i > 0) {
         if (argv[i][0] == '-') {
            if (diagnose) {
               fprintf(stderr, "switch: %s\n", argv[i]);
            }
            // it's a command line switch
            switch (argv[i][1]) {
               case 'h':
               case '?':
                  if (strlen(argv[0]) == 0) {
                     // in case my name was not passed in ...
                     help("payload");
                  }
                  else {
                     help(argv[0]);
                  }
                  code = -1;
                  break;
               case 'a':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &auto_port);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -a requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &auto_port);
                  }
                  if (port != 0) {
                     fprintf(stderr, "Option -p overrides -a (-a ignored)\n");
                  }
                  else {
                     if ((auto_port < 1) || (auto_port > ComportCount())) {
                        fprintf(stderr, "Error: auto port must be between 1 and %d\n", ComportCount());
                        code = -1;
                        auto_port = 0;
                     }
                     else {
                        if (verbose) {
                           fprintf(stderr, "auto mode will start at port %s\n", ShortportName(auto_port-1));
                        }
                     }
                  }
                  break;
               case 'b':
               case 'B':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &my_baudrate);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -b requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &my_baudrate);
                  }
                  if ((my_baudrate < MIN_BAUDRATE) || (my_baudrate > MAX_BAUDRATE)) {
                     fprintf(stderr, "Error: baudrate must be in the range %d to %d\n", MIN_BAUDRATE, MAX_BAUDRATE);
                  }
                  else {
                     if (verbose) {
                        fprintf(stderr, "using baudrate %d\n", my_baudrate);
                     }
                  }
                  break;
               case 'c':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &cpu);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -c requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &cpu);
                  }
                  if ((cpu < 1) || (cpu > MAX_CPU)) {
                     fprintf(stderr, "Error: cpu must be in the range 1 to %d\n", MAX_CPU);
                     code = -1;
                  }
                  else {
                     if (verbose) {
                        fprintf(stderr, "loading cpu %d\n", cpu);
                     }
                  }
                  break;
               case 'd':
                  diagnose++;   /* increase diagnosis level */
                  verbose = 1;   /* diagnose implies verbose */
                  if (diagnose == 1) {
                     fprintf(stderr, "Catalina Payload %s\n", VERSION); 
                  }
                  fprintf(stderr, "diagnostic level %d\n", diagnose);
                  break;
               case 'e':
                  eeprom = 1;
                  if (verbose) {
                     fprintf(stderr, "eeprom mode\n");
                  }
                  break;
               case 'f':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &interfile_delay);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -f requires a parameter\n");
                     }
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &interfile_delay);
                  }
                  if ((interfile_delay < 0) || (interfile_delay > MAX_TIMEOUT)) {
                     fprintf(stderr, "Error: interfile delay must be in the range 0 to %d\n", MAX_TIMEOUT);
                     code = -1;
                  }
                  else {
                     if (verbose) {
                        fprintf(stderr, "using interfile delay %d\n", interfile_delay);
                     }
                  }
                  break;
               case 'g':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d,%d", &term_cols, &term_rows);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -g requires cols,rows parameter\n");
                     }
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d,%d", &term_cols, &term_rows);
                  }
                  if ((term_rows <= 0) || (term_cols <= 0)) {
                     fprintf(stderr, "Error: rows and columns must both be greater than zero\n");
                     code = -1;
                  }
                  else {
                     term_size = 1;
                     if (verbose) {
                        fprintf(stderr, "using terminal size %d,%d\n", term_cols, term_rows);
                     }
                  }
                  break;
               case 'i':
                  if (lua_script == NULL) {
                     interactive = 1;
                     code = 1; // work to do
                     if (verbose) {
                        fprintf(stderr, "interactive mode\n");
                     }
                  }
                  else {
                     fprintf(stderr, "interactive mode is incompatible with Lua script\n");
                  }
                  break;
               case 'j':
                  lfsr_check = 0;
                  if (verbose) {
                     fprintf(stderr, "lfsr check is disabled\n");
                  }
                  break;
               case 'k':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &interpage_delay);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -k requires a parameter\n");
                     }
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &interpage_delay);
                  }
                  if ((interpage_delay < 0) || (interpage_delay > MAX_TIMEOUT)) {
                     fprintf(stderr, "Error: interpage delay must be in the range 0 to %d\n", MAX_TIMEOUT);
                     code = -1;
                  }
                  else {
                     if (verbose) {
                        fprintf(stderr, "using interpage delay %d\n", interpage_delay);
                     }
                  }
                  break;
               case 'l':
                  lfsr_chunking = 0;
                  if (verbose) {
                     fprintf(stderr, "lfsr check is old style\n");
                  }
                  break;
               case 'L':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        lua_script = strdup(argv[++i]);
                        if (verbose) {
                           fprintf(stderr, "Lua script = %s\n", lua_script);
                        }
                        code = 1; // work to do
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -L requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     lua_script = strdup(&argv[i][2]);
                     if (verbose) {
                        fprintf(stderr, "Lua script = %s\n", lua_script);
                     }
                     code = 1; // work to do
                  }
                  if (interactive) {
                     fprintf(stderr, "Option -L overrides -i\n");
                     interactive = 0;
                  }
                  break;
               case 'm':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &max_attempts);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -m requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &max_attempts);
                  }
                  if (max_attempts < 0) {
                     fprintf(stderr, "Error: max_attempts must be greater than zero\n");
                     code = -1;
                  }
                  else {
                     if (verbose) {
                        fprintf(stderr, "max attempts set to %d\n", max_attempts);
                     }
                  }
                  break;
               case 'n':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &synctime);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -n requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &synctime);
                  }
                  if ((synctime < 0) || (synctime > MAX_TIMEOUT)) {
                     fprintf(stderr, "Error: sync timeout must be in the range 0 to %d\n", MAX_TIMEOUT);
                     code = -1;
                  }
                  else {
                     if (verbose) {
                        fprintf(stderr, "using sync timeout %d\n", synctime);
                     }
                  }
                  break;
               case 'o':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &override);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -o requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &override);
                  }
                  if ((override != 1) && (override != 2)) {
                     fprintf(stderr, "Error: override version must be 1 or 2");
                     code = -1;
                  }
                  if (verbose) {
                     fprintf(stderr, "overriding Propeller version detection, assuming P%1d\n", override);
                  }
                  break;
               case 'p':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        if (alldigits(argv[++i])) {
                           sscanf(argv[i], "%d", &port);
                        }
                        else {
                           sscanf(argv[i],"%s", primary_portname);
                           if (verbose) {
                              fprintf(stderr, "setting port name %s\n", primary_portname);
                           }
                           port = SetComportName(primary_portname, 0);
                        }
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -p requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     if (alldigits(&argv[i][2])) {
                        sscanf(&argv[i][2], "%d", &port);
                     }
                     else {
                        sscanf(&argv[i][2],"%s", primary_portname);
                        if (verbose) {
                           fprintf(stderr, "setting port name %s\n", primary_portname);
                        }
                        port = SetComportName(primary_portname, 0);
                     }
                  }
                  if ((port < 1) || (port > ComportCount())) {
                     fprintf(stderr, "Error: port must be in the range 1 to %d\n", ComportCount());
                     code = -1;
                  }
                  else if ((auto_port == 0) && (port > 0) && (second_port > 0) 
                       &&  strcmp(ComportName(port - 1), ComportName(second_port - 1)) == 0) {
                     fprintf(stderr, "Error: primary and secondary port names cannot be the same\n");
                     code = -1;
                  }
                  else {
                     if ((auto_port > 1) && verbose) {
                        fprintf(stderr, "Option -p overrides -a\n");
                     }
                     auto_port = 0;
                     if (verbose) {
                        fprintf(stderr, "using port %s\n", ShortportName(port-1));
                     }
                  }
                  break;
               case 'q':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &mode);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -q requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &mode);
                  }
                  if ((mode < 0) || (mode > 15)) {
                     fprintf(stderr, "Error: mode must be in the range 0 to 15\n");
                     code = -1;
                  }
                  break;
               case 'u':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &reset_time);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -u requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &reset_time);
                  }
                  if ((reset_time < 0) || (reset_time > MAX_TIMEOUT)) {
                     fprintf(stderr, "Error: reset time must be in the range 0 to %d\n", MAX_TIMEOUT);
                     code = -1;
                  }
                  else {
                     if (verbose) {
                        fprintf(stderr, "using reset time %d\n", reset_time);
                     }
                  }
                  break;
               case 'r':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &reset_delay);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -r requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &reset_delay);
                  }
                  if ((reset_delay < 0) || (reset_delay > MAX_TIMEOUT)) {
                     fprintf(stderr, "Error: reset delay must be in the range 0 to %d\n", MAX_TIMEOUT);
                     code = -1;
                  }
                  else {
                     if (verbose) {
                        fprintf(stderr, "using reset_delay %d\n", reset_delay);
                     }
                  }
                  break;
               case 's':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        if (alldigits(argv[++i])) {
                           sscanf(argv[i], "%d", &second_port);
                        }
                        else {
                           sscanf(argv[i],"%s", second_portname);
                           if (verbose) {
                              fprintf(stderr, "setting port name %s\n", second_portname);
                           }
                           second_port = SetComportName(second_portname, 1);
                        }
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -s requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     if (alldigits(&argv[i][2])) {
                        sscanf(&argv[i][2], "%d", &second_port);
                     }
                     else {
                        sscanf(&argv[i][2],"%s", second_portname);
                        if (verbose) {
                           fprintf(stderr, "setting second port name %s\n", second_portname);
                        }
                        second_port = SetComportName(second_portname, 1);
                     }
                  }
                  if ((second_port < 1) || (second_port > ComportCount())) {
                     fprintf(stderr, "Error: second port must be between 1 and %d\n", ComportCount());
                     code = -1;
                  }
                  else if ((auto_port == 0) && (port > 0) && (second_port > 0) 
                       &&  strcmp(ComportName(port - 1), ComportName(second_port - 1)) == 0) {
                     fprintf(stderr, "Error: primary and secondary port names cannot be the same\n");
                     code = -1;
                  }
                  else {
                     second_port--;
                     if (verbose) {
                        fprintf(stderr, "using %s as second port\n", ShortportName(second_port));
                     }
                  }
                  break;
               case 't':
                  if (strlen(argv[i]) == 2) {
                     // use next arg
                     if (argc > 0) {
                        sscanf(argv[++i], "%d", &my_timeout);
                        argc--;
                     }
                     else {
                        fprintf(stderr, "Option -t requires a parameter\n");
                        code = -1;
                        break;
                     }
                  }
                  else {
                     // use remainder of this arg
                     sscanf(&argv[i][2], "%d", &my_timeout);
                  }
                  if ((my_timeout < 1) || (my_timeout > MAX_TIMEOUT)) {
                     fprintf(stderr, "Error: timeout must be in the range 1 to %d\n", MAX_TIMEOUT);
                     code = -1;
                  }
                  else {
                     if (verbose) {
                        fprintf(stderr, "using timeout %d\n", my_timeout);
                     }
                  }
                  break;
               case 'v':
                  verbose = 1;
                  if (diagnose == 0) {
                     fprintf(stderr, "Catalina Payload %s\n", VERSION); 
                  }
                  fprintf(stderr, "verbose mode\n");
                  break;
               case 'w':
                  waitmode = 1;
                  if (verbose) {
                     fprintf(stderr, "wait mode enabled\n");
                  }
                  break;
               case 'x':
                  xmm_only = 1;
                  fprintf(stderr, "xmm only mode (boot loader already loaded)\n");
                  break;
               case 'y':
                  suppress = 1;
                  if (verbose) {
                     fprintf(stderr, "suppressing download progress messages\n");
                  }
                  break;
               case 'z':
                  double_reset = 1;
                  if (verbose) {
                     fprintf(stderr, "double reset enabled\n");
                  }
                  break;
               default:
                  fprintf(stderr, "\nError: unrecognized switch: %s\n", argv[i]);
                  code = -1; // force exit without further processing
                  break;
            }
         }
         else {
            // assume its a filename
            if (file_count < MAX_FILES) {
               file_name[file_count++] = strdup(argv[i]);
               code = 1; // work to do
            }
            else {
               fprintf(stderr, "\ntoo many files specified - file %s will be ignored\n", argv[i]);
            }
         }
      }
      i++; // next argument
   }
   if (code == -1) {
      return code;
   }
   if (diagnose) {
      fprintf(stderr, "executable name = %s\n", argv[0]);
   }
   if ((argc == 1) || (code == 0)) {
      if (!verbose) {
         fprintf(stderr, "Catalina Payload %s\n", VERSION); 
      }
      if (strlen(argv[0]) == 0) {
         // in case my name was not passed in ...
         help("payload");
      }
      else {
         help(argv[0]);
      }
      code = -1;
   }

   return code;

}

/* Functions that can be called from the lua script */

// delay(msec);
static int lua_delay(lua_State *L) {
   /* get number of arguments */
   int n = lua_gettop(L);
   long msec;

   if ((n != 1) || !lua_isnumber(L, 1)) {
      lua_pushstring(L, "Incorrect arguments to 'delay'");
      lua_error(L);
   }
   msec = lua_tonumber(L, 1);
   mdelay(msec);
}

// send(string ...);
static int lua_send(lua_State *L) {
   /* get number of arguments */
   int n = lua_gettop(L);
   int i;
   
   /* loop through each argument */
   for (i = 1; i <= n; i++)
   {
      if (!lua_isstring(L, i)) 
      {
         lua_pushstring(L, "Incorrect argument to 'send'");
         lua_error(L);
      }
      send_string(port, (char *)lua_tostring(L, i));
   }
   
   /* return the number of results */
   return 0;
}

// result = receive(count, timeout, termchar);
static int lua_receive(lua_State *L) {
   /* get number of arguments */
   int n = lua_gettop(L);
   int i = 0;
   int count = MAX_LINELEN;
   long timeout = LUA_TIMEOUT;
   char str[MAX_LINELEN + 1];
   char *termstr = NULL;
   char termchar = '\n';

   if (n > 3) {
      lua_pushstring(L, "Incorrect arguments to 'receive'");
      lua_error(L);
   }
   if (n > 2) {
      if (!lua_isstring(L, 3)) {
         lua_pushstring(L, "Incorrect arguments to 'receive'");
         lua_error(L);
      }
      else {
         termstr = (char *)lua_tostring(L, 3);
         if (strlen(termstr) > 0) {
            termchar = *termstr;
         }
         else {
            termchar = '\0';
         }
      }
   }
   if (n > 1) {
      if (!lua_isnumber(L, 2)) {
         lua_pushstring(L, "Incorrect arguments to 'receive'");
         lua_error(L);
      }
      else {
         timeout = lua_tonumber(L, 2);
         if (timeout <= 0) {
            timeout = LUA_TIMEOUT;
         }
      }
   }
   if (n > 0) {
      if (!lua_isnumber(L, 1)) {
         lua_pushstring(L, "Incorrect arguments to 'receive'");
         lua_error(L);
      }
      else {
         count = lua_tonumber(L, 1);
         if ((count < 1)|| (count > MAX_LINELEN)) {
            count = MAX_LINELEN;
         }
      }
   }
   while (1) {
      if (ByteReady(term)) {
        str[i++] = (char)ReceiveByte(term);
        if (i >= count) {
           break;
        }
        if (str[i-1] == termchar) {
           break;
        }
      }
      else {
         mdelay(10);
         if (timeout > 0) {
            timeout -= 10;
            if (timeout <= 0) {
               break;
            }
         }
      }
   }
   str[i] = '\0';

   lua_pushstring(L, str);
   /* return the number of results */
   return 1;
}


// result = wait_for(prompt, timeout);
static int lua_wait_for(lua_State *L) {
   /* get number of arguments */
   int n = lua_gettop(L);
   int i = 0;
   int j = 0;
   int len;
   long timeout = LUA_TIMEOUT;
   char *prompt = NULL;
   char str[MAX_LINELEN + 1];

   if (n > 2) {
      lua_pushstring(L, "Incorrect arguments to 'wait_for'");
      lua_error(L);
   }
   if (n > 1) {
      if (!lua_isnumber(L, 2)) {
         lua_pushstring(L, "Incorrect arguments to 'wait_for'");
         lua_error(L);
      }
      else {
         timeout = lua_tonumber(L, 2);
         if (timeout <= 0) {
            timeout = LUA_TIMEOUT;
         }
      }
   }
   if ((n < 1) || (!lua_isstring(L, 1))) {
      lua_pushstring(L, "Incorrect arguments to 'wait_for'");
      lua_error(L);
   }
   prompt = (char *)lua_tostring(L, 1);
   len = strlen(prompt);
   if (len > MAX_LINELEN) {
      len = MAX_LINELEN;
   }
   while (1) {
      if (ByteReady(term)) {
        str[i++] = (char)ReceiveByte(term);
        str[i]='\0';
        if (len == 0) {
           break;
        }
        if (i > len) {
           for (j = 0; j <= len; j++) {
              str[j] = str[j + 1];
           }
           i--;
        }
        if (i == len) {
           if (strcmp(prompt, str) == 0) {
              break;
           }
        }
      }
      else {
         mdelay(10);
         if (timeout > 0) {
            timeout -= 10;
            if (timeout <= 0) {
               break;
            }
         }
      }
   }
   str[i] = '\0';

   lua_pushstring(L, str);
   /* return the number of results */
   return 1;
}


static int lua_report (lua_State *L, int status) {
  if (status && !lua_isnil(L, -1)) {
    const char *msg = lua_tostring(L, -1);
    if (msg == NULL) msg = "(error object is not a string)";
    fprintf(stderr, "Lua: %s\n", msg);
    fflush(stderr);
    lua_pop(L, 1);
  }
  return status;
}


int main(int argc, char* argv[]) {
  int i;
  char c;
  int res = 0;
  int length = 0;
  int connected = 0;
  pthread_t input_thread;
  pthread_t output_thread;
  void *status;
  char *str;
  int lua_status;
  char portname[MAX_LINELEN + 3 + 1];

   // get default terminal size (if set in environment)
   str = getenv(PAYLOAD_ROWS);
   if (str != NULL) {
      sscanf(str,"%d", &default_rows);
      if (default_rows <= 0) {
         default_rows = VT100_ROWS;
      }
   }
   str = getenv(PAYLOAD_COLS);
   if (str != NULL) {
      sscanf(str,"%d", &default_cols);
      if (default_cols <= 0) {
         default_cols = VT100_COLS;
      }
   }

   str = getenv(PAYLOAD_BAUD);
   if (str != NULL) {
      sscanf(str,"%d", &my_baudrate);
      if ((my_baudrate < MIN_BAUDRATE)||(my_baudrate > MAX_BAUDRATE)) {
         my_baudrate = DEFAULT_BAUDRATE;
      }
      if (diagnose) {
         fprintf(stderr, "baudrate=%d\n", my_baudrate);
      }
   }

   str = getenv(PAYLOAD_PORT);
   if (str != NULL) {
      if (alldigits(str)) {
         sscanf(str, "%d", &port);
         if ((port < 1)||(port > ComportCount())) {
            fprintf(stderr, "%s specifies invalid_port %d\n", PAYLOAD_PORT, port);
         }
         else {
            auto_port = 0;
         }
      }
      else {
          sscanf(str,"%s", portname);
          if (verbose) {
             fprintf(stderr, "setting port name %s\n", portname);
          }
          port = SetComportName(portname, 0);
          auto_port = 0;
      }
      if (diagnose) {
         fprintf(stderr, "port=%d\n", port);
      }
   }

   if (decode_arguments(argc, argv) <= 0) {
      if (diagnose) {
         fprintf(stderr, "%s exiting\n", argv[0]);
      }
      exit(0);
   }

   if ((file_count == 0) && ((interactive == 0) && (lua_script == NULL))) {
      fprintf(stderr, "\nNo input files specified, and not interactive or script mode - exiting\n");
      exit(1);
   }

   if ((file_count != 0) && (!xmm_only)) {
      length = LoadPropellerFile(file_name[0]);
      if (!length) {
         exit(1);
      }
      if (diagnose) {
         fprintf(stderr, "File size = %d\n", length);
      }
   }

   if (diagnose) {
      fprintf(stderr, "baudrate = %d\n", my_baudrate);
      fprintf(stderr, "timeout = %d\n", my_timeout);
      fprintf(stderr, "sync timeout = %d\n", synctime);
      fprintf(stderr, "reset delay = %d\n", reset_delay);
      fprintf(stderr, "interfile delay = %d\n", interfile_delay);
   }

   if (file_count != 0) { 
      if (auto_port) {
         port = auto_port - 1;
         while (port < ComportCount()) {
            if (diagnose) {
               fprintf(stderr, "Trying %s ... ", ShortportName(port));
            }
            res = prop_open(port, my_baudrate, my_timeout, diagnose);
            if (res == 0) {
               if (xmm_only) {
                  if (suppress == 0) {
                     fprintf(stderr, "Using Secondary Loader on port %s for %sdownload\n", ShortportName(port), (file_count == 1 ? "" : "first "));
                  }
                  break;
               }
               else {
                  version = prop_connect(port);
                  if (version > 0) {
                     if (suppress == 0) {
                        fprintf(stderr, "Using Propeller (version %d) on port %s for %sdownload\n", version, ShortportName(port), (file_count == 1 ? "" : "first "));
                     }
                     break;
                  }
                  else {
                     prop_close(port);
                     res = -1;
                  }
               }
            }
            else {
               prop_close(port);
               res = -1;
            }
            port++;
         }
         if (res != 0) {
            if (override > 0) {
               fprintf(stderr, "No Propeller %d found on any port\n", override);
            }
            else {
               fprintf(stderr, "No Propeller found on any port\n");
            }
            exit(1);
         }
      }
      else {
         if (port) {
            port--;
            res = prop_open(port, my_baudrate, my_timeout, 1);
            if (res) {
              fprintf(stderr, "Error: Unable to initialize Propeller - check connections\n");
              exit(1);
            }
            if (xmm_only) {
               if (suppress == 0) {
                  fprintf(stderr, "Using Secondary Loader on port %s for %sdownload\n", ShortportName(port), (file_count == 1 ? "" : "first "));
               }
            }
            else {
               version = prop_connect(port);
               if (version > 0) {
                  if (suppress == 0) {
                     fprintf(stderr, "Using Propeller (version %d) on port %s for %sdownload\n", version, ShortportName(port), (file_count == 1 ? "" : "first "));
                  }
               }
               else {
                  if (override > 0) {
                     fprintf(stderr, "No Propeller %d found on port %s\n", override, ShortportName(port));
                  }
                  else {
                     fprintf(stderr, "No Propeller found on port %s\n", ShortportName(port));
                  }
                  prop_close(port);
                  exit(1);
               }
            }
         }
         else {
            // should never happen, but ...
            fprintf(stderr, "No port specified, and auto port mode not enabled\n");
         }
      }

      if (xmm_only || (version == 1)) {
   
         if (!xmm_only) {
            // Download a normal (<=32kb) binary file to the Propeller using the Parallax protocol
            if (verbose) {
               fprintf(stderr, "Downloading normal binary file %s\n", file_name[0]);
            }
            if (prop_download(port, buffer, length) != 0) {
               exit(1);
            }
            if ((interactive || (lua_script != NULL)) && (term == -1)) {
               term = port; // remember this port and use it for interactive or Lua mode
               if (verbose) {
                  fprintf(stderr, "Remembering port %s for interactive/script mode\n", ShortportName(term));
               }
            }
         }
         // if more files are specifed, download subsequent files using the Catalina protocol
         for (i = (xmm_only ? 0 : 1); i < file_count; i++) {
            if (waitmode) {
               fprintf(stderr, "\nWaiting before loading next file - press ENTER to proceed ...\n");
               while ((c = getchar()) != '\n') {
                  ;
               }
            }
            else {
               if (interfile_delay > 0) {
                  mdelay (interfile_delay);
               }
            }
            if (auto_port || ((port != second_port) && (second_port != -1))) {
               // switch to second port for all subsequent files
               if (port != term) {
                  prop_close(port);
               }
               if (auto_port) {
                  res = 0;
                  port = auto_port - 1;
                  while (port < ComportCount()) {
                     if (diagnose) {
                        fprintf(stderr, "Trying %s ... ", ShortportName(port));
                     }
                     if (port != term) {
                        res = prop_open(port, my_baudrate, my_timeout, diagnose);
                     }
                     else {
                        res = 0; // port is still open
                     }
                     if (res == 0) {
                        if (cat_connect(port, cpu) > 0) {
                           if (suppress == 0) {
                              fprintf(stderr, "Using Secondary Loader on port %s for %sdownload\n", ShortportName(port), (file_count == 1 ? "" : "subsequent "));
                           }
                           connected = 1; // do not reconnect, just start downloading
                           break;
                        }
                        else {
                           if (port != term) {
                              prop_close(port);
                           }
                           res = -1;
                        }
                     }
                     port++;
                  }
                  if (res != 0) {
                     fprintf(stderr, "No Secondary Loader found on any port\n");
                     exit(1);
                  }
               }
               else {
                  port = second_port;
                  res = prop_open(port, my_baudrate, my_timeout, diagnose);
                  if (res == 0) {
                     if (suppress == 0) {
                        fprintf(stderr, "Using Secondary Loader on port %s for %sdownload\n", ShortportName(port), (file_count == 1 ? "" : "subsequent "));
                     }
                  }
                  else {
                     fprintf(stderr, "Error: cannot open second port\n");
                     exit(1);
                  }
               }
            }
            else {
               if (suppress == 0) {
                  fprintf(stderr, "Using Secondary Loader on port %s for %sdownload\n", ShortportName(port), (file_count == 1 ? "" : "subsequent "));
               }
            }
   
            if (verbose) {
               fprintf(stderr, "Downloading Catalina binary file %s\n", file_name[i]);
            }
            if (cat_download(port, file_name[i], cpu, connected) != 0) {
               exit (1);
            }
            if (port != term) {
               prop_close(port);
            }
         }
      }
      else if (version == 2) {
         // Download a normal P2 binary file to the Propeller using the Parallax protocol
         if (verbose) {
           fprintf(stderr, "Downloading normal binary file %s\n", file_name[0]);
         }
         if (prop_p2_download(port, buffer, length) != 0) {
            exit(1);
         }
         if ((interactive || (lua_script != NULL)) && (term == -1)) {
            term = port; // remember this port and use it for interactive or Lua mode
            if (verbose) {
               fprintf(stderr, "Remembering port %s for interactive/script mode\n", ShortportName(term));
            }
         }
      }
      else {
        fprintf(stderr, "Error: Unknown Propeller version\n");
      }
   }
   else {
      if (!port) {
         fprintf(stderr, "A port must be specified for interactive mode when no files are loaded\n");
         exit(1);
      }
      else {
         port--;
         term = port;
         res = prop_open(term, my_baudrate, my_timeout, 1);
         if (res) {
           fprintf(stderr, "Error: Unable to open port - check connections\n");
           exit(1);
         }
      }
   }

   if (diagnose) {
      printf("Press a key to continue\n");
      getch();
   }

   if (lua_script != NULL) {
      /* initialize Lua */
      L = luaL_newstate();
      if (L == NULL) {
         printf("%s cannot create Lua state: not enough memory", argv[0]);
         return -1;
      }
      luaL_openlibs(L);
      
      lua_register(L, "delay", lua_delay);
      lua_register(L, "send", lua_send);
      lua_register(L, "receive", lua_receive);
      lua_register(L, "wait_for", lua_wait_for);
      if ((lua_status = luaL_dofile(L, lua_script)) != 0) {
         lua_report(L, lua_status);
      }      
      
      /* cleanup Lua */
      lua_close(L);
   }
   else if (interactive && (term != -1)) {
     if (term_size == 0) {
        term_cols = default_cols;
        term_rows = default_rows;
     }
     initscr();
     savetty();
     resize_term(term_rows, term_cols);
     clear();
     refresh();
     cbreak();
     noecho();
     nl();
     refresh();
     nodelay(stdscr, TRUE);
     scrollok(stdscr, TRUE);
     keypad(stdscr, TRUE);
     printw("Entering interactive mode on port ");
     printw(ShortportName(term));
     printw(" - press CTRL+D to exit\n\n");

     {
        // simple VT100 emulator

        #define EscO(a) SendByte(term,ESC);SendByte(term,'O');SendByte(term,a);

        int ch;
        int r = 0;
        int c = 0;
        int esc = 0;
        int rcvd = 0;

        while (interactive) {
      
           ch = getch();
           if (ch != ERR) {
//printw("<%02X>", ch);
              switch (ch) {
#ifdef __PDCURSES__
                 case KEY_A2:
#endif
                 case KEY_UP:
                    EscO('A');
                    break;
#ifdef __PDCURSES__
                 case KEY_C2:
#endif
                 case KEY_DOWN:
                    EscO('B');
                    break;
#ifdef __PDCURSES__
                 case KEY_B3:
#endif
                 case KEY_RIGHT:
                    EscO('C');
                    break;
#ifdef __PDCURSES__
                 case KEY_B1:
#endif
                 case KEY_LEFT:
                    EscO('D');
                    break;
                 case KEY_A1:
                 case KEY_HOME:
                    EscO('w');
                    break;
                 case KEY_C1:
                 case KEY_END:
                    EscO('q');
                    break;
                 case KEY_HELP:
                    EscO('p');
                    break;
                 case KEY_A3:
                 case KEY_PPAGE:   
                    EscO('y');
                    break;
                 case KEY_C3:
                 case KEY_NPAGE:
                    EscO('s');
                    break;
                 default:
                    SendByte(term, ch);
                    if (ch == 0x04) {
                       interactive = 0;
                    }
                    break;
              }
           }
           rcvd = 0;
           while (ByteReady(term)) {
              ch = ReceiveByte(term);
              if (esc == 1) {
                 // already saw ESC
//printw("<1>");
//printw("%c", ch);
                 if (ch == '[') {
                    esc = 2;
                 }
                 else if (ch == 'c') {
//printw("<SYS_INIT>");
                    clear(); // sys_init;
                    refresh();
                    esc = 0;
                 }
                 else {
                    addch(ESC);
                    addch(ch);
                    esc = 0;
                 }
              }
              else if (esc == 2) {
                 // already saw ESC [
//printw("<2>");
//printw("%c", ch);
                 if (ch == '?') {
                    esc = 8;
                 }
                 else if (ch == '2') {
                    r = 2;
                    c = 0;
                    esc = 3;
                 }
                 else if (isdigit(ch)) {
                    r = ch - '0';
                    c = 0;
                    esc = 4;
                 }
                 else if (ch == 'H') {
//printw("<HOME>");
                    move(0,0); // home
                    refresh();
                    esc = 0;
                 }
                 else if (ch == 'K') {
//printw("<CLREOL>");
                    clrtoeol(); // erase_line
                    refresh();
                    esc = 0;
                 }
                 else {
                    addch(ESC);
                    addch('[');
                    addch(ch);
                    esc = 0;
                 }
              }
              else if (esc == 3) {
                 // already saw ESC [ 2
//printw("<3>");
//printw("%c", ch);
                 if (ch == 'J') {
//printw("<CLREOS>"); 
                    clrtobot(); // erase_display
                    refresh();
                    esc = 0;
                 }
                 else if (ch == '5') {
                    r = 25;
                    esc = 5;
                 }
                 else if (ch == ';') {
                    esc = 6;
                 }
                 else if (isdigit(ch)) {
                    r = 10 * r + (ch - '0');
                 }
                 else {
                    addch(ESC);
                    addch('[');
                    addch('2');
                    addch(ch);
                    esc = 0;
                 }
              }
              else if (esc == 4) {
                 // already saw ESC [ <r>
//printw("<4>");
//printw("%c", ch);
                 if (ch == ';') {
                    esc = 6;
                 }
                 else if (isdigit(ch)) {
                    r = 10 * r + (ch - '0');
                 }
                 else {
                    addch(ESC);
                    addch('[');
                    printw("%d",r);
                    addch(ch);
                    esc = 0;
                 }
              }
              else if (esc == 5) {
//printw("<5>");
//printw("%c", ch);
                 // already saw ESC [ 2 5
                 if (ch == ';') {
                    r = 25;
                    esc = 6;
                 }
                 else if (ch == 'h') {
                    curs_set(0); // invis_cursor
                    refresh();
                    esc = 0;
                 }
                 else if (ch == 'l') {
                    curs_set(1); // vis_cursor
                    refresh();
                    esc = 0;
                 }
                 else if (isdigit(ch)) {
                    r = 10 * r + (ch - '0');
                    esc = 4;
                 }
                 else {
                    addch(ESC);
                    addch('[');
                    addch('2');
                    addch('5');
                    addch(ch);
                    esc = 0;
                 }
              }
              else if (esc == 6) {
                 // already saw ESC [ <r> ;
//printw("<6>");
//printw("%c", ch);
                 if (isdigit(ch)) {
                    c = ch - '0';
                    esc = 7;
                 }
                 else {
                    addch(ESC);
                    addch('[');
                    printw("%d", r);
                    addch(';');
                    addch(ch);
                    esc = 0;
                 }
              }
              else if (esc == 7) {
                 // already saw ESC [ <r> ; <c>
//printw("<7>");
//printw("%c", ch);
                 if (isdigit(ch)) {
                    c = 10 * c + (ch - '0');
                 }
                 else if (ch == 'H') {
//printw("<move %d,%d>",r,c);
                    if ((r > 0) && (c > 0)) {
                       move(r - 1, c - 1); // tty_goto
                       refresh();
                    }
                    else {
                       addch(ESC);
                       addch('[');
                       printw("%d;%d", r,c);
                       addch(ch);
                    }
                    esc = 0;
                 }
                 else {
                    addch(ESC);
                    addch('[');
                    printw("%d", r);
                    addch(';');
                    addch(ch);
                    esc = 0;
                 }
              }
              else if (esc == 8) {
                 // already saw ESC [ ? 
                 if (ch == '2') {
                    esc = 9;
                 }
                 else {
                    addch(ESC);
                    addch('[');
                    addch('?');
                    addch(ch);
                    esc = 0;
                 }
              }
              else if (esc == 9) {
                 // already saw ESC [ ? 2
                 if (ch == '5') {
                    esc = 10;
                 }
                 else {
                    addch(ESC);
                    addch('[');
                    addch('?');
                    addch('2');
                    addch(ch);
                    esc = 0;
                 }
              }
              else if (esc == 10) {
                 // already saw ESC [ ? 2 5
                 if (ch == 'h') {
                    curs_set(0); // invis_cursor
                    refresh();
                    esc = 0;
                 }
                 else if (ch == 'l') {
                    curs_set(1); // vis_cursor
                    refresh();
                    esc = 0;
                 }
                 else {
                    addch(ESC);
                    addch('[');
                    addch('?');
                    addch('2');
                    addch('5');
                    addch(ch);
                    esc = 0;
                 }
              }
              else {
                 if (ch >= 0) {
                    if (ch == ESC) {
//printw("<E>");
                       esc = 1;
                    }
                    else {
                       if (((ch != 0x0d) || !(mode & 1)) && ((ch != 0x0a) || !(mode & 2))) {
                          rcvd = 1;
                          if ((ch == 0x0d) && (mode & 4)) {
                             addch(0x0a);
                          }
                          else if ((ch == 0x0a) && (mode & 8)) {
                             addch(0x0d);
                          }
                          else {
                             addch(ch);
                          }
                       }
                    }
                 }
              }
           }
           if (rcvd) {
              refresh();
           }
           else {
              mdelay(10);
           }
        }
     }

     printw("\nExiting interactive mode\n");

     prop_close(term);
     nocbreak();
     resetty();
     endwin();

   }
   return 0;

}



