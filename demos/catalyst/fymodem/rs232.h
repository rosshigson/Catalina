/*
 * Modified for Catalina by Ross Higson. Original license terms below:
 */
/*
***************************************************************************
*
* Author: Teunis van Beelen
*
* Copyright (C) 2005, 2006, 2007, 2008, 2009 Teunis van Beelen
*
* teuniz@gmail.com
*
***************************************************************************
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation version 2 of the License.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with this program; if not, write to the Free Software Foundation, Inc.,
* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*
***************************************************************************
*
* This version of GPL is at http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
*
***************************************************************************
*/


#ifndef rs232_INCLUDED
#define rs232_INCLUDED

#ifdef __cplusplus
extern "C" {
#endif

#include <stdio.h>
#include <string.h>

/*
 * This code originally contained a fix intended to avoid toggling DTR when
 * opening the serial port, but this fix no longer seems to work on Linux, 
 * so it is now disabled by default - if DTR is toggled when the port is
 * opened on your system, then try setting rs232_DTR_FIX to 1.
 */
#define rs232_DTR_FIX 0          /* set to 1 to enable DTR FIX */ 

#ifdef _WIN32

#include <windows.h>

#else

#include <unistd.h>
#include <termios.h>
#include <errno.h>
#include <fcntl.h>
#include <limits.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <sys/time.h>

#endif

int OpenComport(int comport_number, int baudrate, int timeout, int verbose);
int PollComport(int comport_number, unsigned char *buf, int size);
int SendByte(int comport_number, unsigned char byte);
int SendBuf(int comport_number, unsigned char *buf, int size);
int ReceiveByte(int comport_number);
int ByteReady(int comport_number);
int ClearInput(int comport_number);
void CloseComport(int comport_number);
void cprintf(int comport_number, const char *text);
int IsCTSEnabled(int comport_number);

int SetDTR(int comport_number);
int ClrDTR(int comport_number);
int ComportCount();
int SetComportName(char *comport_name, int offset);
char *ComportName(int comport_number);
char *ShortportName(int comport_number);


#ifdef __cplusplus
} /* extern "C" */
#endif

#endif


