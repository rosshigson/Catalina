{{
'-------------------------------------------------------------------------------
'
' Extras - This object is loaded by all target files, and can be used to 
'          include extra plugins for all targets (this avoids the need to 
'          edit multiple target files). 
'
'          For example it includes the RTC plugin when the 
'          CLOCK symbol is defined on the commmand line, or the 4 port 
'          serial plugin. The 4 port serial plugin uses a slightly 
'          different method - this plugin is enabled by including the 
'          access library - e.g:
'
'             catalina test_serial4.c -lci -lserial4
'
'          Other plugins can be added if required. They may be loaded
'          unconditionally, or depend on a symbol being defined on the 
'          command line.
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
'
' Version 3.1 - Initial Version by Ross Higson
' Version 3.5 - Register services.
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
'
' Select the appropriate plugin objects:
'
OBJ
  Common : "Catalina_Common"
#ifdef RANDOM
  RND    : "Catalina_RND_Plugin"         ' Random Number Generator
#endif  
#ifdef CLOCK
  RTC    : "Catalina_RTC_Plugin"         ' Real-Time Clock
#endif  
#ifdef libserial4
  S4 : "Catalina_FullDuplexSerial4FC"    ' 4 Port Serial
#endif

'
' This function is called by the target to allocate data blocks or set up 
' other details for the extra plugins. If it does not need to do anything
' it can simply be a null routine.

PUB Setup

#ifdef RANDOM
  RND.Setup
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

' This function will be called by the targets to start the plugins:

PUB Start | cog, lock

#ifdef CLOCK
   cog := RTC.Start
   lock := -1
   if cog
     Common.RegisterServiceCog(Common#SVC_RTC_SETFREQ , lock, cog, 6)
     Common.RegisterServiceCog(Common#SVC_RTC_GETCLOCK, lock, cog, 7)
     Common.RegisterServiceCog(Common#SVC_SETTIME ,     lock, cog, 8)
     Common.RegisterServiceCog(Common#SVC_RTC_GETTIME , lock, cog, 9)
#endif

#ifdef RANDOM
  RND.Start
#endif
#ifdef libserial4
  S4.Start
#endif

