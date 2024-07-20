{{
'-------------------------------------------------------------------------------
'
' Extras - This object is loaded by all target files, and can be used to 
'          include extra plugins for all targets (this avoids the need to 
'          edit multiple target files). 
'
'          For example it includes the Catalina Gamepad and 4 port serial 
'          plugins. These plugins could also have been loaded and started 
'          directly in the target files themselves (as is done for some
'          of the other plugins supplied with Catalina), but adding them
'          here is easier. 
'
'          For the Gamepad:
'
'          The association between the GAMEPAD symbol and the inclusion of 
'          the Gamepad plugin is only known in this file. This is what allows 
'          the Gamepad plugin to be included by using a command such as:
'
'             catalina test_gamepad.c -lci -C GAMEPAD
'
'          For the 4 port serial plugin:
'    
'          The 4 port serial plugin uses a slightly different method - this
'          plugin is enabled by including the access library - e.g:
'
'             catalina test_serial4.c -lci -lserial4
'
'          Two variations of the "Full Duplex Serial" plugin are enabled in 
'          a similar manner - e.g:
'
'             catalina test_tty.c -lci -ltty
'             catalina test_tty.c -lci -ltty256
'
' This file is included by the following target files:
'
'   lmm_default.spin
'   cmm_default.spin
'   emm_default.spin
'   smm_default.spin
'   xmm_default.spin
'   lmm_blackcat.spin
'   cmm_blackcat.spin
'   emm_blackcat.spin
'   smm_blackcat.spin
'   xmm_blackcat.spin
'   Catalina_LMM_pod.spin
'
' Version 3.1 - Initial Version by Ross Higson
' Version 3.5 - Add 4 port serial plugin (S4)
' Version 3.6 - Add Full Duplex serial plugin (TTY)
' Version 3.8 - Add Virtual Graphics
' Version 3.9 - Add Sound
' Version 3.11 - Add padding (used for Catalyst only).
' Version 7.3  - Add Random
'
'-------------------------------------------------------------------------------
'
'    Copyright 2011 Ross Higson
'
'    This file is part of the Catalina Target Package.
'
'    The Catalina Target Package is free software: you can redistribute 
'    it and/or modify it under the terms of the GNU Lesser General Public 
'    License as published by the Free Software Foundation, either version 
'    3 of the License, or (at your option) any later version.
'
'    The Catalina Target Package is distributed in the hope that it will
'    be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
'    of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
'    See the GNU Lesser General Public License for more details.
'
'    You should have received a copy of the GNU Lesser General Public 
'    License along with the Catalina Target Package.  If not, see 
'    <http://www.gnu.org/licenses/>.
'
'------------------------------------------------------------------------------
}}

#ifdef CATALYST
'
' This Padding ensure that when Catalyst is compiled, there is enough
' space below the HMI plugin to use for HMI buffer space - a total of 660
' longs is enough to allow every HMI option except HiRes VGA. However, if
' the minimal set of plugins is loaded, we are still around 40 longs short,
' unless we use EEPROM mode, so we add that many longs here. 
' Note that Catalyst must be compiled in COMPACT mode - the cmm_default.spin 
' file has had the startup sequence altered to include this Extras object just
' before the HMI object, and to setup and start the HMI plugin LAST, allowing 
' it to use space that was formerly occupied by other spin objects to be 
' re-used by the HMI.
'
#ifndef EEPROM
#define CATALYST_KLUDGE
#endif

#endif

DAT

#ifdef CATALYST_KLUDGE

Padding long 0[40]

#endif

OBJ
  Common : "Catalina_Common"

'
' Select the appropriate plugin objects:
'

#ifdef RANDOM
  RND : "Catalina_RND_Plugin"
#endif

#ifdef GAMEPAD
  GP : "Catalina_GamePad"
#endif

#ifdef libserial4
  S4 : "Catalina_FullDuplexSerial4FC"
#endif

#ifdef libtty
  TTY : "Catalina_FullDuplexSerial"
#endif

#ifdef libtty256
  TTY : "Catalina_FullDuplexSerial256"
#endif

#ifdef libvgraphic
  VGI : "Virtual_Graphics"
#endif

#ifdef libspi
  SPI : "Catalina_sdspiFemto"
#endif

#ifdef libsound
  SND : "Catalina_Sound_drv_052_22khz_16bit"
#endif

'
' This function is called by the target to allocate data blocks or set up 
' other details for the extra plugins. If it does not need to do anything
' it can simply be a null routine.
   
PUB Setup

#ifdef RANDOM
  RND.Setup
#endif

#ifdef GAMEPAD
  GP.Setup
#endif

#ifdef libserial4
  S4.Setup

  ' Edit the following AddPort statements to suit your Propeller platform.
  ' By default, they add a single serial port, at 115200 baud, usng the 
  ' normal Parallax serial pins (30 & 31):

  S4.AddPort(0,31,30,-1,-1,0,0,115200)
  'S4.AddPort(0,rx,tx,cts,rts,threshold,mode,baud)
  'S4.AddPort(1,rx,tx,cts,rts,threshold,mode,baud)
  'S4.AddPort(2,rx,tx,cts,rts,threshold,mode,baud)
  'S4.AddPort(3,rx,tx,cts,rts,threshold,mode,baud)
#endif

#ifdef libtty
  TTY.Setup

  ' Edit the following Configure statement to suit your Propeller platform.
  ' By default, it configures the serial port at 115200 baud, usng the 
  ' normal Parallax serial pins (30 & 31):

  TTY.Configure(31,30,0,115200)
#endif

#ifdef libtty256
  TTY.Setup

  ' Edit the following Configure statement to suit your Propeller platform.
  ' By default, it configures the serial port at 115200 baud, usng the 
  ' normal Parallax serial pins (30 & 31):

  TTY.Configure(31,30,0,115200)
#endif

#ifdef libvgraphic
  VGI.Setup
#endif

#ifdef libspi
  SPI.Setup
#endif

#ifdef libsound
  SND.Setup
  SND.Configure(Common#Sound_PIN)
#endif

' This function will be called by the targets to start the plugins:

PUB Start

#ifdef RANDOM
  RND.Start
#endif

#ifdef GAMEPAD
  GP.Start
#endif

#ifdef libserial4
  S4.Start
#endif

#ifdef libtty
  TTY.Start
#endif

#ifdef libtty256
  TTY.Start
#endif

#ifdef libvgraphic
  VGI.Start
#endif

#ifdef libspi
  SPI.Start
#endif

#ifdef libsound
  SND.Start
#endif


