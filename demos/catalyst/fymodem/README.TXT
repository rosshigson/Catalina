YMODEM FOR CATALINA/CATALYST
============================

This folder contains an implementation of the YMODEM file transfer protocol 
for Catalina and Catalyst. It is derived from a free public domain version 
of YMODEM written by Fredrik Hederstierna.

YMODEM can be used to send and receive both text and binary files using the
serial connection from the Propeller to a host PC, or vice-versa. Transfers 
are done in 128 (YModem) or 1024 byte (YModem-1K) packets, and each packet
is protected by a 16 bit CRC, and retried if it fails, so transfers are very 
reliable and transmission errors are extremely rare.

The impetus for this program was that I was damaging my Propeller boards and
also my PC by inserting and removing SD Cards so often - typically because I 
had to update the software on them. Both the Host and the Propeller SD Card 
sockets can eventually be damaged or become unreliable, so I wanted a simple 
file transfer mechanism that would help me reduce the need for doing this - 
and YMODEM (although it dates from the days of modems and bulletin boards) 
does the job nicely!

To execute on the Propeller, the program must be compiled to use a serial 
plugin and library (e.g. using the tty256 serial plugin on the Propeller 1,
or the 2 port serial plugin on the Propeller 2) and cannot also use a serial
HMI option (if this is the default, specify -C NO_HMI). If the plugin supports 
multiple ports then by default the program uses serial port 0.

There is only one YMODEM program file (fymodem.c) plus a serial support file 
(rs232.c) which allows it to be compiled using gcc, but the program can be 
compiled as either a sender or a receiver by defining the symbols YMODEM_SEND
or YMODEM_RECEIVE in the compile commmand. For example, the following commands
might be used to compile a YMODEM receive and YMODEM send program:

   catalina -p2 fymodem.c -D YMODEM_RECEIVE -C NO_HMI -lcx -lserial2 -o receive
   catalina -p2 fymodem.c -D YMODEM_SEND -C NO_HMI -lcx -lserial2 -o send

The programs can be compiled for the Host PC using MinGW under Windows, or 
gcc under Linux. Note that you need to include the rs232.c serial interface
code. For example:

   gcc fymodem.c rs232.c -D YMODEM_RECEIVE -o receive
   gcc fymodem.c rs232.c -D YMODEM_SEND -o send

There is a build_all script provided that does all this for you. For example,
you can just say:

   build_all P2_EDGE
or
   build_all C3 FLASH CACHED_1K

This will build two PC executables:

   send.exe                 <-- or just 'send' for Linux
   receive.exe              <-- or just 'receive' for Linux

which will build two Propeller executables:

   send.bin                 <-- or 'send.binary' for the Propeller 1
   receive.bin              <-- or 'receive.binary' for the Propeller 1

The format of the commands under Windows or Linux is:

  send    [-h] [-v] [-d] [-x] [-p PORT] [-b BAUD] [-t TIMEOUT] [-s DELAY] file
  receive [-h] [-v] [-d] [-x] [-p PORT] [-b BAUD] [-t TIMEOUT] [file]

The format of the commands on the Propeller is similar, except for the baud
rate option. On the Propeller the baud rate cannot be specified on the command
line - it must be pre-configured in the platform configuration files (on the 
Propeller 1, this is the file Extras.spin, on the Propeller 2 it is in the 
platform.inc file - e.g. P2_EDGE.inc). Also note that the Makefile provided 
adds -C NO_HMI when compiling the program for the Propeller, which makes the 
-h, -v and -d options a bit useless. This is because ymodem generally uses 
the same port as a serial HMI (which is often the default HMI), so the HMI 
cannot be used at the same time. However, if your platform can use a
non-serial HMI option (such as VGA) you can edit the Makefile to remove 
the -C NO_HMI option and add your preferred HMI option (e.g. -C VGA).

The default baud rate is 230400 baud. This is fine on the Propeller 2 but is
probably too fast on the Propeller 1, where a baud rate of 115200 is generally
the default. Also, the Propeller 1's smaller serial buffer sizes and slower 
serial plugins means the -s option must usually be specified for the sender 
(the -s option applies ONLY to the sender). This option does two things:

   1. Tells the sender to only send 128 byte blocks, not 1024 byte blocks -
      i.e. use YModem and not YModem-1K.

   2. Adds a delay of the specified number of milliseconds between each
      character sent - often -s0 will work, but if not try -s5, -s10 etc. 

Currently, only one file can be transferred at a time. This may change in
a future release.

The send command must include the name of the file to be sent, but in the 
receive command this is optional. It will be used if specified, but if not 
then the received file will be given the same name as the sent file.

You can terminate an executing receive or send program by entering two
successive [CTRL-X] characters.

From Windows you can use the stand-alone ymodem programs on both the Propeller
and the Host PC, or you can use them only on the Propeller and use payload 
(which now supports YMODEM) on the PC. Start payload as normal in interactive
mode, even if the Propeller uses a non-serial HMI option. Execute the ymodem 
send or receive program on the Propeller first, and then within payload, press
CTRL-A and you will see a menu appear. Press Y for YModem and then either S 
for a YModem Send, T for a YModem-1K Send or R for a YModem Receive. You must
enter a file name when Sending, but this is optional when Receiving.

A terminal emulator program that supports YMODEM may also be used, such as 
Tera Term or ExtraPuTTY (on Windows) or minicom or picocom (on Linux). 
However, note that the Propeller 1 can only support YModem transfers, not 
YModem-1K, and some terminal emulators (e.g. Tera Term and ExtraPuTTY) assume 
they can always use YModem-1K.

When the YMODEM program is started and you are using a terminal emulator, 
you may see 'C' characters being printed repeatedly in the terminal window - 
this is normal, and is how the YMODEM send and receive programs synchronize 
with each other. 

IMPORTANT NOTE WHEN USING WINDOWS:
==================================

Windows recently introduced a new console mode that is very buggy. Programs 
such as payload that use console mode can fail unexpectedly if the new console 
mode is used. This requires more investigation, but until Microsoft fixes the 
issues, it is recommended that the "legacy console mode" be used with payload
and other Catalina programs. To ensure this, select Properties from the system 
menu of any console window and in the Options tab, ensure that the option
to "Use legacy console" is selected.

