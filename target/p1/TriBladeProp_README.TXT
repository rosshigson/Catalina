TriBladeProp Catalina Target Package
====================================

This file contains notes specific to the support of the TriBladeProp platform 
provided by this target package.

TriBladeProp support is enabled by either adding the option -C TRIBLADEPROP 
to each catalina command line, or by adding TRIBLADEPROP to the CATALINA_DEFINE 
environment variable. In addition, the CPU must be specified by adding the
option -C CPU_1, -C CPU_2 or -C CPU_3 to the command line, or adding CPU_1,
CPU_2 or CPU_3 to the CATALINA_DEFINE environment variable.

The TriBladeProp is a complex beast since (as the name implies) it has three 
'blades' - each of which contains a Propeller CPU. Each blade can be used 
independently, or they can be used together. Each of the blades also has 
various jumpers that can be used to re-configure how the hardware that is
 connected to the various pins of the Propeller CPU on the blade.

Catalina LMM programs can be run on any CPU, but many of the LMM targets 
assume one or more of the HMI devices (screen, keyboard, mouse) that are only 
directly available directly on CPU #1. Using them from another CPU is possible,
but requires the execution of a proxy server on CPU #1)

Loading and tunning programs on the various CPUs, and/or running XMM programs, 
can be quite complex. From the point of view of Catalina, each CPU has quite 
a different set of capabilities. For example, two of the CPUs (#1 & #2) support 
XMM RAM - but each of these CPUs uses a different XMM implementation. 

Also, each blade's hardware can be reconfigured using various jumpers, so 
there are different options that must be specified to identify the actual
configuration of the blade. For example, on blade #1 it is possible to select 
two different sets of pins for the mouse and keyboard. 

Finally, there are several 'optional' hardware components (such as the XMM RAM 
on blades 1 and 2, or the Flash memory and SD Card adaptor on blade 2). Even 
the EEPROMS are optional - if not present, programs must be either loaded from 
a PC, or they have to be loaded from one CPU to another (utility programs to 
do this are included in this target package).

All this complexity means that unlike simpler platforms (such as the Hydra or 
the Hybrid) there is often no obvious 'default' target on the TriBladeProp - 
at least not for XMM programs. This means it is necessary to differentiate 
between XMM programs intended to be executed on CPU #1 or 2 (CPU #3 does 
not support XMM). 

The Catalyst directory contains an SD Loader program that can be used in 
conjunction with the onboard SD Card to load either normal SPIN programs or 
Catalina programs from an SD Card. Programs that fit into 31k (such as 
Catalina LMM programs) require no special handling. Catalyst also also 
knows how to load Catalina XMM programs into XMM RAM for execution.

Note that the Catalyst SD Loader can use FAT12, Fat16 or FAT32 SD cards 
- but as there is not much call for FAT12 these days, it is currently disabled
to save code space.

Below is a summary of each CPU, and a description of the different possible
configurations of the CPU supported by Catalina. Other configurations are 
also possible, but may require new targets to be created.


CPU #1
======

CPU #1 has both VGA and TV output capabilities, plus a keyboard and mouse
for input. The CPU 1 keyboard and mouse hardware is compatible with various
Parallax boards, but in any case a comboKeyboard driver (written by Mike Green)
is used by all targets offering Keyboard support. The mouse support is provided
by a driver derived from the standard Parallax driver.

The CPU #1 VGA display cannot be used with XMM, since the XMM RAM requires
too many pins. Also if XMM is used the then the mouse and keyboard inputs must
be moved (using jumpers) to the pins previously used by the VGA. 

This means there are two basic hardware configurations supported by Catalina 
for CPU #1:

- VGA display, Kbd, Mouse - but no XMM. Catalina assumes that if the VGA 
  display is used, the keyboard and mouse will use pins P24 - P28.

  LK11 links 5,6,7,8 should be installed, and all LK12 links should be
  on 2-3 and should be connected straight, as shown in the diagram below:

          9  10  11  12  13  14  15  16
       +-------------------------------+
     3 | o   o   o   o   o   o   o   o |
       | |   |   |   |   |   |   |   | |
     2 | o   o   o   o   o   o   o   o |
       |                               |
     1 | o   o   o   o   o   o   o   o |
       +-------------------------------+

- TV display, Kbd, Mouse - with XMM. Catalina assumes that if the TV display is 
  used, the keyboard and mouse will use pins P8 - P12. While it is possible 
  to use the TV display while leaving the keyboard and mouse on pins P24 - 
  P28, no such targets are provided. 

  No links should be installed on LK11 and all lk12 links should be on 1-2, 
  but LINKS 9 & 10, and LINKS 11 & 12 must be CROSSED OVER - i.e. not 
  connected straight - see the diagram and note the positions of the 'X' 
  connections:

          9  10  11  12  13  14  15  16
       +-------------------------------+
     3 | o   o   o   o   o   o   o   o |
       |                               |
     2 | o   o   o   o   o   o   o   o |
       |   X       X     |   |   |   | |
     1 | o   o   o   o   o   o   o   o |
       +-------------------------------+


Like other Catalina platforms, the pin definitions for the CPUs of the
TriBladeProp are in the TriBladeProp_DEF.inc file. If the pins configuration
of CPU #1 is changed then this file must be edited. The default pin 
definitions assume a TV outpus, with the keyboard and mouse on P8 - P12. 

CPU #1 also has an optional 128K or 512K SRAM that can be used as XMM RAM.
Address pins A0-10 use Propeller pins P16 - P26, with A11-18 latched from 
A0-A7, and D0-D7 using Propeller pins P0 - P7.

CPU #1 has no SD Card, and even the EEPROM is optional, so loading CPU #1 
is normally done from CPU #2. To enable this, the two optional links LK1
and LK2 must be installed. These links allow for serial communications between 
the CPU. A Catalina plugin to support this serial link is provided, and is 
used by the utility programs that allow programs loaded into CPU #1 from 
CPU #2.

In many respects, CPU #1 is quite similar to one of the single Propeller 
platforms such as the Hybrid or Hydra, and most of the configuration options
for the LMM, EMM and XMM Kernels can be used on CPU #1.

The Catalina PC and PROPTERMINAL HMI plugins support the use of serial comms 
in place of any dedicated HMI hardware. This allows the use of a PC terminal 
emulator (such as the Parallax Serial Terminal) as the Catalina HMI, even 
though CPU #1 normally uses an external display, keyboard and mouse. 


CPU #2
======

CPU #2 has no direct access to a display, keyboard or mouse. However, the
Catalina PC and PPROPTERMINAL HMI plugins supports the use of serial comms 
for the HMI in place of such dedicated HMI hardware and can be used for
CPU #2. 

In addition, there are "proxy" HMI drivers that can give programs running
on CPU #2 access to the HMI devices on CPU #1.

CPU #2 has up to 2MB SRAM that can be used as XMM RAM. CPU #2 also has an 
optional SD Card adapter that can be used both to store and load programs, 
and also act as a file system accessible to Catalina C programs. 

Because it has access to the SD card, CPU #2 is typically used for loading 
programs to the other CPUs. Utility programs to allow CPU #2 do this are 
provided. 

To enable CPU #2 to communicate with CPU #1, the two optional links LK1 
and LK2 must be installed on that Blade #1. Similarly, to allow CPU #2 to 
communicate with CPU #3 the optional links LK3, LK4 and LK5 must be intalled 
on blade #3. Install these as follows:

        LK1  LK2                    LK3      LK4    LK5     
       +--------+                +-----------------------+  
       | o   o  |              2 | o   o   o   o   o   o |  
       | |    | |                |                       |  
       | o   o  |              1 | o---o   o---o   o---o |  
       +--------+                +-----------------------+  
                                   A   B   A   B   A   B    

With these links installed CPU #2 can load programs into the either CPU #1
or CPU 3. These links also allow serial communications between each of the 
other CPUs and CPU #2 for other purposes - a Serial I/O Plugin is provided 
(which is also used by the various loader programs) - but no direct C support 
is provided for the serial I/O yet.

CPU #2 also has options for SPI Flash RAM, but no targets are provided for 
this.

Only some of the configuration options for the LMM, EMM and XMM Kernels can 
be used on CPU #2. For example, none of the TV or VGA related options are 
applicable.


CPU #3
======

CPU #3 is intended primarily for I/O use. Like CPU #2, CPU #3 also has 
no direct access to a display, keyboard or mouse, but can use the Catalina 
PC HMI plugin that support the use of serial comms to the PC for the HMI in 
place of dedicated HMI hardware. 

CPU #3 has no XMM, no SD Card and may not even have an EEPROM. CPU #3 may
be loaded from CPU #2 if the links LK3, LK4 and LK5 are installed.

The PC and PROPTERMINAL HMI options are applicable to CPU #3, but this CPU
would normally be used with the NO_HMI option.


For More Information
====================

Refer to the "Getting Started with Catalina" for more information about
using Catalina on a multi-CPU system like the TriBladeProp.


License
=======

This Catalina Target Package (CTP) is provided under the GNU Lesser Public 
License, with the following specific exceptions:

•	Use of the Catalina Binder (or any other tool) to combine application 
   components with Catalina Target Package components does not constitute 
   a derivative work and does not require the author to provide source code 
   for the application, or provide the ability for users to link their 
   applications against a user-supplied version of the CTP.

   However, if you link the application to a modified version of the CTP, 
   then the changes to the CTP must be provided under the terms of the LGPL
   in sections 1, 2, and 4.

•	You do not have to provide a copy of the CTP license with applications
   that incorporate the CTP, nor do you have to identify the CTP license in
   your program or documentation as required by section 6 of the LGPL.

   However, applications must still identify their use of the CTP. The 
   following example statement can be included in user documentation to
   satisfy this requirement:

      [application] incorporates components provided as part of the 
      Catalina C Compiler for the Parallax Propeller.

A full copy of the LGPL is included in the file called COPYING.LESSER, and 
is also available from http://www.gnu.org/licenses.             

