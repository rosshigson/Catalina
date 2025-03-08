{{
'-------------------------------------------------------------------------------
'
' Serial8  - This object is loaded by all target files to include 
'            Multi Port Serial (aka 8 Port Serial) support.  
'            The plugin is loaded depending on the following symbols  
'            (the logic is in Catalina_Plugin.inc):
'
'            libserial8 - include Multi Port Serial support
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
' Version 4.7 - Initial P2 version 
'
'-------------------------------------------------------------------------------
'
'    Copyright 2021 Ross Higson
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

S8_BUFF_SIZE  = 1024                  ' size in bytes of each Rx and Tx buffer
                                      ' (NOTE: must match source/lib/serial8/core.c)

S8_BLOCK_SIZE  = 8 * 2 * S8_BUFF_SIZE ' size of data buffer block to allocate (8 ports)

DAT

#if defined(libserial8)

#include "cogs8.t"

DAT

' The following is used to initialize the SX control block so that C can access this data.
' The data is used to "auto-initialize" the ports in C. To disable this, set the pins to -1.
' Then the ports must be manually initialized in C (see the s8_openport() function).
'
' Note that the first long is used by the C code, not the plugin - the C code
' should be passed @Serial8_Init once the value has been filled in, but the 
' plugin does not use that value and should be passed @Serial8_Init + 4

Serial8_Init
    long 0                 ' to be filled in with data buffer block address 
    ' first 16 bytes must be zero initially (to disable the smartpins initially)
    byte 0[16]     
    ' the next 4 longs (per pin) contain values used to initialize the smartpins from C, 
    ' but note that before the smartpins are enabled, these values must be overwritten  
    ' with suitable buffer pointers for each smartpin (i.e. start, start, start, end + 1)
    long _RX1_MULTI_PIN   ' pin to use
    long _RX1_MULTI_MODE  ' mode for pin
    long _RX1_MULTI_BAUD  ' baud rate for pin
    long 0                ' 
    long _TX1_MULTI_PIN   ' pin to use
    long _TX1_MULTI_MODE  ' mode for pin
    long _TX1_MULTI_BAUD  ' baud rate for pin
    long 0                ' 
    long _RX2_MULTI_PIN   ' pin to use
    long _RX2_MULTI_MODE  ' mode for pin
    long _RX2_MULTI_BAUD  ' baud rate for pin
    long 0                ' 
    long _TX2_MULTI_PIN   ' pin to use
    long _TX2_MULTI_MODE  ' mode for pin
    long _TX2_MULTI_BAUD  ' baud rate for pin
    long 0                ' 
    long _RX3_MULTI_PIN   ' pin to use
    long _RX3_MULTI_MODE  ' mode for pin
    long _RX3_MULTI_BAUD  ' baud rate for pin
    long 0                ' 
    long _TX3_MULTI_PIN   ' pin to use
    long _TX3_MULTI_MODE  ' mode for pin
    long _TX3_MULTI_BAUD  ' baud rate for pin
    long 0                ' 
    long _RX4_MULTI_PIN   ' pin to use
    long _RX4_MULTI_MODE  ' mode for pin
    long _RX4_MULTI_BAUD  ' baud rate for pin
    long 0                ' 
    long _TX4_MULTI_PIN   ' pin to use
    long _TX4_MULTI_MODE  ' mode for pin
    long _TX4_MULTI_BAUD  ' baud rate for pin
    long 0                ' 
    long _RX5_MULTI_PIN   ' pin to use
    long _RX5_MULTI_MODE  ' mode for pin
    long _RX5_MULTI_BAUD  ' baud rate for pin
    long 0                ' 
    long _TX5_MULTI_PIN   ' pin to use
    long _TX5_MULTI_MODE  ' mode for pin
    long _TX5_MULTI_BAUD  ' baud rate for pin
    long 0                ' 
    long _RX6_MULTI_PIN   ' pin to use
    long _RX6_MULTI_MODE  ' mode for pin
    long _RX6_MULTI_BAUD  ' baud rate for pin
    long 0                ' 
    long _TX6_MULTI_PIN   ' pin to use
    long _TX6_MULTI_MODE  ' mode for pin
    long _TX6_MULTI_BAUD  ' baud rate for pin
    long 0                ' 
    long _RX7_MULTI_PIN   ' pin to use
    long _RX7_MULTI_MODE  ' mode for pin
    long _RX7_MULTI_BAUD  ' baud rate for pin
    long 0                ' 
    long _TX7_MULTI_PIN   ' pin to use
    long _TX7_MULTI_MODE  ' mode for pin
    long _TX7_MULTI_BAUD  ' baud rate for pin
    long 0                ' 
    long _RX8_MULTI_PIN   ' pin to use
    long _RX8_MULTI_MODE  ' mode for pin
    long _RX8_MULTI_BAUD  ' baud rate for pin
    long 0                ' 
    long _TX8_MULTI_PIN   ' pin to use
    long _TX8_MULTI_MODE  ' mode for pin
    long _TX8_MULTI_BAUD  ' baud rate for pin
    long 0                ' 


#endif
