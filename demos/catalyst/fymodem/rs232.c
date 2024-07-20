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

#include "rs232.h"

#define DIAGNOSTICS 0 // 1 means print lots of diagnostic messages

#ifndef _WIN32   /* Linux */

#define PORT_COUNT 22

#define NAME_LENGTH 32 // OS X has long names ("/dev/cu.usbserial.XXXXXXXX")

int Cport[PORT_COUNT];
int error;

struct termios new_port_settings;
struct termios old_port_settings[PORT_COUNT];

char comports[PORT_COUNT][NAME_LENGTH+1]={
   "/dev/ttyS0","/dev/ttyS1","/dev/ttyS2","/dev/ttyS3","/dev/ttyS4","/dev/ttyS5",
   "/dev/ttyS6","/dev/ttyS7","/dev/ttyS8","/dev/ttyS9","/dev/ttyS10","/dev/ttyS11",
   "/dev/ttyS12","/dev/ttyS13","/dev/ttyS14","/dev/ttyS15","/dev/ttyUSB0",
   "/dev/ttyUSB1","/dev/ttyUSB2","/dev/ttyUSB3","/dev/ttyUSB4","/dev/ttyUSB5"
};

int OpenComport(int comport_number, int baudrate, int timeout, int verbose)
{
  int baudr;

  if ((comport_number >= PORT_COUNT)||(comport_number < 0)) {
     if (verbose) {
        printf("illegal comport number\n");
     }
     return(1);
  }

  switch(baudrate)
  {
    case      50 : baudr = B50;
                   break;
    case      75 : baudr = B75;
                   break;
    case     110 : baudr = B110;
                   break;
    case     134 : baudr = B134;
                   break;
    case     150 : baudr = B150;
                   break;
    case     200 : baudr = B200;
                   break;
    case     300 : baudr = B300;
                   break;
    case     600 : baudr = B600;
                   break;
    case    1200 : baudr = B1200;
                   break;
    case    1800 : baudr = B1800;
                   break;
    case    2400 : baudr = B2400;
                   break;
    case    4800 : baudr = B4800;
                   break;
    case    9600 : baudr = B9600;
                   break;
    case   19200 : baudr = B19200;
                   break;
    case   38400 : baudr = B38400;
                   break;
    case   57600 : baudr = B57600;
                   break;
    case  115200 : baudr = B115200;
                   break;
    case  230400 : baudr = B230400;
                   break;
#ifndef __APPLE__
    case  460800 : baudr = B460800;
                   break;
    case  500000 : baudr = B500000;
                   break;
    case  576000 : baudr = B576000;
                   break;
    case  921600 : baudr = B921600;
                   break;
    case 1000000 : baudr = B1000000;
                   break;
#endif
    default      : printf("invalid baudrate\n");
                   return(1);
                   break;
  }

  Cport[comport_number] = open(comports[comport_number], O_RDWR | O_NOCTTY);// | O_NDELAY);
  if (Cport[comport_number] == -1) {
     if (verbose) {
        printf("unable to open comport : %s\n", strerror(errno));
     }
     return(1);
  }

  // get exclusive access (if possible!)
  ioctl(Cport[comport_number], TIOCEXCL);
  error = tcgetattr(Cport[comport_number], &old_port_settings[comport_number]);
  if (error == -1) {
     close(Cport[comport_number]);
     if (verbose) {
        printf("unable to read portsettings : %s\n", strerror(errno));
     }
     return(1);
  }
  memset(&new_port_settings, 0, sizeof(new_port_settings));  /* clear the new struct */

  new_port_settings.c_cflag = CS8 | CLOCAL | CREAD;
  new_port_settings.c_iflag = IGNBRK;
  new_port_settings.c_oflag = 0;
  new_port_settings.c_lflag = 0;
  new_port_settings.c_cc[VMIN] = 0;      /* block untill n bytes are received */
  new_port_settings.c_cc[VTIME] = timeout/100;     /* block untill a timer expires (n * 100 mSec.) */

#if rs232_DTR_FIX
#ifndef __APPLE__
  cfsetispeed(&new_port_settings, B0);
  cfsetospeed(&new_port_settings, B0);
  // first set everything except baud rate (doing this drops DTR)
  error = tcsetattr(Cport[comport_number], TCSANOW, &new_port_settings);
  if (error == -1) {
     close(Cport[comport_number]);
     if (verbose) {
        printf("unable to adjust portsettings : %s\n", strerror(errno));
     }
     return 1;
  }
  // then set baud rate (doing this avoids raising DTR)
#endif
#endif

  cfsetispeed(&new_port_settings, baudr);
  cfsetospeed(&new_port_settings, baudr);
  error = tcsetattr(Cport[comport_number], TCSANOW, &new_port_settings);
  if (error == -1) {
     close(Cport[comport_number]);
     if (verbose) {
        printf("unable to adjust portsettings : %s\n", strerror(errno));
     }
     return 1;
  }
#if DIAGNOSTICS
  printf("opened port on FD %d\n", Cport[comport_number]);
#endif

#if rs232_DTR_FIX
  ClrDTR(comport_number);
#endif

  return 0;
}


int PollComport(int comport_number, unsigned char *buf, int size)
{
  int n;

#ifndef __STRICT_ANSI__                       /* __STRICT_ANSI__ is defined when the -ansi option is used for gcc */
  if(size>SSIZE_MAX)  size = (int)SSIZE_MAX;  /* SSIZE_MAX is defined in limits.h */
#else
  if(size>4096)  size = 4096;
#endif

  n = read(Cport[comport_number], buf, size);

  return(n);
}


int SendByte(int comport_number, unsigned char byte)
{
  int n = 0;

  n = write(Cport[comport_number], &byte, 1);
  return (n > 0);
}


int ReceiveByte(int comport_number) {
   unsigned char x;
   int res = 0;
   
   if ((res = read(Cport[comport_number], &x, 1)  == 1)) {
#if DIAGNOSTICS
      printf("read FD %d : %02x\n", Cport[comport_number], x);
#endif
      return x;
   }
   else {
#if DIAGNOSTICS
      if (res == 0) {
         printf("failed to read FD %d : no data available\n", Cport[comport_number]);
      }
      else {
         printf("failed to read FD %d : %s\n", Cport[comport_number], strerror(errno));
      }
#endif
      return -1;   
   }
}


int ByteReady(int comport_number) {

   struct timeval timeout = {0, 0};
   fd_set fdset;
   int nfds = 0;

   FD_ZERO(&fdset);
   FD_SET(Cport[comport_number], &fdset);
   nfds = Cport[comport_number] + 1;
   select (nfds, &fdset, NULL, NULL, &timeout);
   return FD_ISSET(Cport[comport_number], &fdset);
}

int ClearInput(int comport_number) {
  return tcflush(Cport[comport_number], TCIFLUSH);
}

int SendBuf(int comport_number, unsigned char *buf, int size)
{
  return(write(Cport[comport_number], buf, size));
}


void CloseComport(int comport_number)
{
#if DIAGNOSTICS
  printf("closing port on FD %d\n", Cport[comport_number]);
#endif
  tcsetattr(Cport[comport_number], TCSANOW, &old_port_settings[comport_number]);
  close(Cport[comport_number]);
}

/*
Constant  Description
TIOCM_LE  DSR (data set ready/line enable)
TIOCM_DTR DTR (data terminal ready)
TIOCM_RTS RTS (request to send)
TIOCM_ST  Secondary TXD (transmit)
TIOCM_SR  Secondary RXD (receive)
TIOCM_CTS CTS (clear to send)
TIOCM_CAR DCD (data carrier detect)
TIOCM_CD  Synonym for TIOCM_CAR
TIOCM_RNG RNG (ring)
TIOCM_RI  Synonym for TIOCM_RNG
TIOCM_DSR DSR (data set ready)
*/

int IsCTSEnabled(int comport_number)
{
  int status;

  status = ioctl(Cport[comport_number], TIOCMGET, &status);

  if (status & TIOCM_CTS) {
     return 1;
  }
  else {
     return 0;
  }
}

int SetDTR(int comport_number) {
   int dtr_bit = TIOCM_DTR;

   return ioctl(Cport[comport_number], TIOCMBIS, &dtr_bit);
}

int ClrDTR(int comport_number) {
   int dtr_bit = TIOCM_DTR;

   return ioctl(Cport[comport_number], TIOCMBIC, &dtr_bit);
}

#else         /* windows */

#define PORT_COUNT 32

#define NAME_LENGTH 10

HANDLE Cport[PORT_COUNT];


char comports[PORT_COUNT][NAME_LENGTH+1]={
   "\\\\.\\COM1",  "\\\\.\\COM2",  "\\\\.\\COM3",  "\\\\.\\COM4",
   "\\\\.\\COM5",  "\\\\.\\COM6",  "\\\\.\\COM7",  "\\\\.\\COM8",
   "\\\\.\\COM9",  "\\\\.\\COM10", "\\\\.\\COM11", "\\\\.\\COM12",
   "\\\\.\\COM13", "\\\\.\\COM14", "\\\\.\\COM15", "\\\\.\\COM16",
   "\\\\.\\COM17", "\\\\.\\COM18", "\\\\.\\COM19", "\\\\.\\COM20",
   "\\\\.\\COM21", "\\\\.\\COM22", "\\\\.\\COM23", "\\\\.\\COM24",
   "\\\\.\\COM25", "\\\\.\\COM26", "\\\\.\\COM27", "\\\\.\\COM28",
   "\\\\.\\COM29", "\\\\.\\COM30", "\\\\.\\COM31", "\\\\.\\COM32"
};

char baudr[64];

int OpenComport(int comport_number, int baudrate, int timeout, int verbose)
{
  if ((comport_number >= PORT_COUNT)||(comport_number < 0)) {
     if (verbose) {
        printf("illegal comport number\n");
     }
     return(1);
  }

  switch(baudrate)
  {
    case     110 : strcpy(baudr, "baud=110 data=8 parity=N stop=1 dtr=off");
                   break;
    case     300 : strcpy(baudr, "baud=300 data=8 parity=N stop=1 dtr=off");
                   break;
    case     600 : strcpy(baudr, "baud=600 data=8 parity=N stop=1 dtr=off");
                   break;
    case    1200 : strcpy(baudr, "baud=1200 data=8 parity=N stop=1 dtr=off");
                   break;
    case    2400 : strcpy(baudr, "baud=2400 data=8 parity=N stop=1 dtr=off");
                   break;
    case    4800 : strcpy(baudr, "baud=4800 data=8 parity=N stop=1 dtr=off");
                   break;
    case    9600 : strcpy(baudr, "baud=9600 data=8 parity=N stop=1 dtr=off");
                   break;
    case   19200 : strcpy(baudr, "baud=19200 data=8 parity=N stop=1 dtr=off");
                   break;
    case   38400 : strcpy(baudr, "baud=38400 data=8 parity=N stop=1 dtr=off");
                   break;
    case   57600 : strcpy(baudr, "baud=57600 data=8 parity=N stop=1 dtr=off");
                   break;
    case  115200 : strcpy(baudr, "baud=115200 data=8 parity=N stop=1 dtr=off");
                   break;
    case  128000 : strcpy(baudr, "baud=128000 data=8 parity=N stop=1 dtr=off");
                   break;
    case  256000 : strcpy(baudr, "baud=256000 data=8 parity=N stop=1 dtr=off");
                   break;
    case  230400 : strcpy(baudr, "baud=230400 data=8 parity=N stop=1 dtr=off");
                   break;
    case  460800 : strcpy(baudr, "baud=460800 data=8 parity=N stop=1 dtr=off");
                   break;
    default      : printf("invalid baudrate\n");
                   return(1);
                   break;
  }

  Cport[comport_number] = CreateFileA(comports[comport_number],
                      GENERIC_READ|GENERIC_WRITE,
                      0,                          /* no share  */
                      NULL,                       /* no security */
                      OPEN_EXISTING,
                      0,                          /* no threads */
                      NULL);                      /* no templates */

  if(Cport[comport_number]==INVALID_HANDLE_VALUE) {
     if (verbose) {
         printf("unable to open comport\n");
     }
     return(1);
  }

  DCB port_settings;
  memset(&port_settings, 0, sizeof(port_settings));  /* clear the new struct  */
  port_settings.DCBlength = sizeof(port_settings);

  if(!BuildCommDCBA(baudr, &port_settings)) {
     if (verbose) {
        printf("unable to set comport dcb settings\n");
     }
     CloseHandle(Cport[comport_number]);
     return(1);
  }

  if(!SetCommState(Cport[comport_number], &port_settings)) {
     if (verbose) {
        printf("unable to set comport cfg settings\n");
     }
     CloseHandle(Cport[comport_number]);
     return(1);
  }

  COMMTIMEOUTS Cptimeouts;

  if (timeout == 0) {
     Cptimeouts.ReadIntervalTimeout         = MAXDWORD;
     Cptimeouts.ReadTotalTimeoutMultiplier  = 0;
     Cptimeouts.ReadTotalTimeoutConstant    = 0;
     Cptimeouts.WriteTotalTimeoutMultiplier = 0;
     Cptimeouts.WriteTotalTimeoutConstant   = 0;
  }
  else {
     Cptimeouts.ReadIntervalTimeout         = timeout;
     Cptimeouts.ReadTotalTimeoutMultiplier  = timeout;
     Cptimeouts.ReadTotalTimeoutConstant    = 0;
     Cptimeouts.WriteTotalTimeoutMultiplier = timeout;
     Cptimeouts.WriteTotalTimeoutConstant   = 0;
  }

  if(!SetCommTimeouts(Cport[comport_number], &Cptimeouts))
  {
     if (verbose) {
        printf("unable to set comport time-out settings\n");
     }
     CloseHandle(Cport[comport_number]);
     return(1);
  }

  return(0);
}


int PollComport(int comport_number, unsigned char *buf, int size)
{
  int n;

  if (size > 4096) {
     size = 4096;
  }

/* added the void pointer cast, otherwise gcc will complain about */
/* "warning: dereferencing type-punned pointer will break strict aliasing rules" */

  ReadFile(Cport[comport_number], buf, size, (LPDWORD)((void *)&n), NULL);

  return n;
}


int SendByte(int comport_number, unsigned char byte)
{
  int n = 0;

  return (WriteFile(Cport[comport_number], &byte, 1, (LPDWORD)((void *)&n), NULL) && n > 0);
}

int ReceiveByte(int comport_number) {
   unsigned char x;
   int n = 0;
/*   
   do {
      ReadFile(Cport[comport_number], &x, 1, (LPDWORD)((void *)&n), NULL);
   } while (n == 0);
   return x;   
*/
   
   if (ReadFile(Cport[comport_number], &x, 1, (LPDWORD)((void *)&n), NULL) && (n > 0)) {
#if DIAGNOSTICS
      printf("read FD %d : %02x\n", Cport[comport_number], x);
#endif
      return x;
   }
   else {
      return -1;   
   }
}


int ByteReady(int comport_number) {
  int status;
  COMSTAT comstat;

  return ClearCommError(Cport[comport_number], (LPDWORD)((void *)&status), (LPCOMSTAT)((void *)&comstat)) 
     && (comstat.cbInQue != 0);
}

int ClearInput(int comport_number) {
  return PurgeComm(Cport[comport_number], PURGE_RXCLEAR);
}

int SendBuf(int comport_number, unsigned char *buf, int size)
{
  int n;

  if(WriteFile(Cport[comport_number], buf, size, (LPDWORD)((void *)&n), NULL)) {
    return n;
  }

  return -1;
}


void CloseComport(int comport_number)
{
  CloseHandle(Cport[comport_number]);
}


int IsCTSEnabled(int comport_number)
{
  int status;

  GetCommModemStatus(Cport[comport_number], (LPDWORD)((void *)&status));

  if (status & MS_CTS_ON) {
     return 1;
  }
  else {
     return 0;
  }
}

int SetDTR(int comport_number) {
   return EscapeCommFunction(Cport[comport_number], SETDTR);
}

int ClrDTR(int comport_number) {
   return EscapeCommFunction(Cport[comport_number], CLRDTR);
}

#endif

int ComportCount() {
   return PORT_COUNT;
}

char *ComportName(int comport_number) {
  if ((comport_number >= PORT_COUNT)||(comport_number < 0)) {
    printf("illegal comport number\n");
    return NULL;
  }
  return comports[comport_number];
}


int SetComportName(char *comport_name, int offset) {
  strncpy(comports[PORT_COUNT - offset - 1], comport_name, NAME_LENGTH);
  return PORT_COUNT - offset ;
}


char *ShortportName(int comport_number) {
  if ((comport_number >= PORT_COUNT)||(comport_number < 0)) {
    printf("illegal comport number\n");
    return NULL;
  }
  if (strncmp(comports[comport_number],"\\\\.\\",4) == 0) {
     return &comports[comport_number][4];
  }
  else {
     return comports[comport_number];
  }
}


void cprintf(int comport_number, const char *text)  /* sends a string to serial port */
{
  while (*text != 0) {
    SendByte(comport_number, *(text++));
  }
}


