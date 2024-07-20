{{
'-------------------------------------------------------------------------------
'
' Clock   - This object is loaded by all target files to include 
'           a Real-Time Clock, based on the following symbols:
'
'           CLOCK      - include clock plugin
'           RTC        - include RTC support
'
'           Clock support can be included by specifying -C CLOCK or -C RTC on
'           the Catalina Command. Note that the clock support is also 
'           included in the SD Card plugin, and that version will be 
'           used if the SD plugin is loaded (this saves a cog) unless
'           SEPARATE_CLOCK is also defined and RTC is not defined.
'         
' This object is included by the following target files:
'
'   nmm_default.spin2, nmm_blackcat.spin2
'   cmm_default.spin2, cmm_blackcat.spin2
'   lmm_default.spin2, lmm_blackcat.spin2
'   xmm_default.spin2, xmm_blackcat.spin2
'
' Version 3.15 - Initial P2 version 
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

DAT

#if defined(CLOCK) || defined(RTC)

#if defined(SEPARATE_CLOCK) || defined(RTC) || !defined(SD)
#include "cogrtc.t"

' setup function for clock

   orgh
   alignl

Clock_Setup
 mov     r0, ##@Clock_Service_Table
 call    #Register_Services      ' register RTC services
 mov     r0, r6                  ' point ...
 shl     r0, #2                  ' ... to ...
 add     r0, ##REGISTRY          ' RTC registry entry
.wait_for_clock
 rdlong  r1, r0                  ' wait ...
 mov     r2, r1                  ' ... till ...
 shr     r1, #24                 ' ... RTC ...
 cmp     r1, #$FF wz             ' ... is ...
 if_z    jmp #.wait_for_clock    ' ... registered
 mov     r0, ##(RTC_SetFreq<<24 + @CLKFREQ)
 wrlong  r0, r2                  ' set frequency
.wait_for_setfreq
 rdlong  r0, r2 wz               ' wait till ...
 if_nz   jmp #.wait_for_setfreq  ' ... frequency set
         ret

 ' service table for clock

Clock_Service_Table
   byte SVC_RTC_SETFREQ,   6
   byte SVC_RTC_GETCLOCK,  7 
   byte SVC_SETTIME,       8 
   byte SVC_RTC_GETTIME,   9 
   byte SVC_RTC_DEBUG,    10    
   byte SVC_GETTICKS,     11  
   byte 0,                 0

   alignl

#endif

#endif
