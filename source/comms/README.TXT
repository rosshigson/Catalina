
About this release:
-------------------

This is release 2.9 of the Ada Terminal Emulator package.

The package is available at: https://ada-terminal-emulator.sourceforge.io/

This file contains some quick instructions to get the package installed and
to try out some of the package features. See the files "Terminal Emulator.doc"
(or "Terminal Emulator.htm") in the doc subirectory for a complete reference 
manual for the package, including information on all the features of the 
package and also detailed instructions on installing and using the package. 

A quick summary of features can also be found in the file doc\SUMMARY.TXT.

A list of changes can be found in doc\CHANGES.TXT.

Requirements:
-------------

The Terminal Emulator runs on Windows. To compile the source version of
this package you must have the GNU Ada Translator Studio (GNAT Studio) 2021
or later, plus GWindows and win32Ada. 

The Terminal Emulator was orginally a 32 bit application developed using 
Ada 95 on Windows 95, but it was also known to run on Windows 95/98/NT/XP.
The current version has been compiled and tested with Ada 2012 on 64 bit
Windows 10.

The version of GNAT Studio used to build and test this release was GNAT Studio 
Community 2021. It is available from https://www.adacore.com/download

The version of GWndows used was released on 23 Nov 2022. It is available from
https://sourceforge.net/projects/gnavi/files/

The version of Win32ada used was 23.0.0. It is available from
https://github.com/AdaCore/win32ada.

Installing and compiling the Terminal Emulator package (including all the 
demo programs) requires about 2Gb of disk space depending on the compiler 
used and the compilation options selected.

The Terminal Emulator requires at least a 300MHz CPU and a reasonably fast 
graphics card to give adequate performance. In particular smooth scrolling 
and the rendering of double-size, graphic or flashing characters can be CPU 
intensive.For applications that use only normal size, non-graphic and 
non-flashing ASCII characters a slower CPU may be adequate.

To Install:
-----------

Choose where you want the package installed. It can be anywhere, but it is 
recommended that the Terminal Emulator package be installed beneath the main 
GNAT directory (probably C:\GNAT or something similar). 

Unzip the distribution. It will create a main directory called "Terminal" 
with a number of subdirectories, including a "bin" subdirectory where all the
executable files will be stored. This directory will contain pre-built
versions of all the demo programs.

Instructions on compiling this package from soure, using the specific package
instances given above, is given in BUILD.TXT. 

To try the Terminal Emulator:
-----------------------------
Run any of the "demo_" programs in the "bin" subdirectory. There is also 
a simple game ("snake.exe") that is quite addictive. If you do not have the 
Wingdings font installed, the snake may look a little strange - in that case 
try the command "snake /nowingdings".

To try the Redirect program:
----------------------------
On Windows, open a command window and execute the command

   redirect cmd.exe

This will run the Windows command interpreter (cmd.exe) inside a terminal 
window that is far more functional than a console window. On some combinations 
of Ada compilers and Windows command interpreters you may have to add the 
/CookOut option to redirect to address some line termination issues - i.e.  

   redirect /cookout cmd.exe

Instead of cmd.exe, you can use the minimal command interpreter included with
the package (minimal.exe). Enter the command "redirect minimal". This will 
run a simple text-based command interpreter written in Ada - redirect adds 
the window, mouse, menus, filename completion, command history and printing 
support. As above, you may need to use the /cookout option - i.e. 

   redirect /cookout minimal.exe

A quick test of the Terminal Emulator's DEC VT100 emulation can be done
using the file "vt100test.dos", which contains a DOS version of the 
"VT100 Torture Test". To perform this test, use redirect as a filter by 
entering the command 

   type vt100test.dos | redirect

If you have a copy of the Cygwin DLL (cygwin1.dll) in your path (see the 
reference manual for more details) then you can run a much more detailed 
test and demonstration of the Terminal Emulator's DEC VTxxx (i.e. VT52/
VT100/VT102/VT220/VT320/VT420) emulation by executing the vttest program 
under the control of redirect - a batch file is provided that sets up 
appropriate redirect options - enter the command "vt_test".

To try the Comms program:
-------------------------
The Comms program must be stated with the serial communications parameters
(such as the com port and baud rate) specified on the command line. For 
instance, enter the folowing command:

   comms /com=1 /baud=9600 /stop=1 /parity=none /data=8

This will open a terminal window that uses port COM1: for input and output, 
with the specified serial communication options. Of course, the port COM1
has to be connected to a suitable serial device via a compatible cable.

To try the Term_IO package:
---------------------------
One of the demo programs ("demo_term_io") demonstrates the Term_IO program.
Additionally. you can compile and run the examples in the "term_IO\example" 
subdirectory. These are the Ada example programs that are distributed with 
GNAT, but some have been modified to use Term_IO in place of Text_IO. To 
compile and run all the examples, use the commands:

   cd term_IO\example
   gnatmake -P examples

