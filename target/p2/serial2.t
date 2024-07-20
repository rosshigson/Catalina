{{
'-------------------------------------------------------------------------------
'
' Serial2  - This object is loaded by all target files to include 
'            2 Port Serial support.  
'            The plugin is loaded depending on the following symbols  
'            (the logic is in Catalina_Plugin.inc):
'
'            libserial2 - include 2 Port Serial support
'
' This object is included by the following target files:
'
'   nmm_default.t
'   cmm_default.t
'   lmm_default.t
'   nmm_blackcat.t
'   cmm_blackcat.t
'   lmm_blackcat.t
'
' Version 4.0 - Initial P2 version 
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

CON

S2_BLOCK_SIZE = 32 ' Size in bytes of mailbox to allocate

DAT

#if defined(libserial2)

#include "cogs2.t"

DAT

Serial2_Init
   long 0                ' to be filled with mailbox address
   long _RX1_PIN
   long 7 + ((_CLOCKFREQ /_BAUDRATE1) << 16)
   long _RX1_MODE
   long $00
   long $1FF
   long _TX1_PIN
   long 7 + ((_CLOCKFREQ /_BAUDRATE1) << 16)
   long _TX1_MODE
   long $80
   long $1FF
   long _RX2_PIN
   long 7 + ((_CLOCKFREQ /_BAUDRATE2) << 16)
   long _RX2_MODE
   long $100
   long $1FF
   long _TX2_PIN
   long 7 + ((_CLOCKFREQ /_BAUDRATE2) << 16)
   long _TX2_MODE
   long $180
   long $1FF
   long 100

#endif
