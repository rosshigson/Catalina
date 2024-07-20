{{
'-------------------------------------------------------------------------------
'
' PSRAM  - This object is loaded by all target files to include 
'          PSRAM Memory (16 Bit) support.
'          The plugin is loaded depending on the following symbols  
'          (the logic is in Catalina_Plugin.inc):
'
'            libpsram - include PSRAM support
'
' This object is included by the following target files:
'
'   nmm_default.t
'   cmm_default.t
'   lmm_default.t
'   xmm_default.t
'   nmm_blackcat.t
'   cmm_blackcat.t
'   lmm_blackcat.t
'   xmm_blackcat.t
'
' Version 5.4 - Initial P2 version 
'
'-------------------------------------------------------------------------------
'
'    Copyright 2022 Ross Higson
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

PSRAM_BLOCK_SIZE = 8*4 + 16*2*4 + 8*4 + 8*3*4 ' Size in Bytes to allocate for startupData.

DAT

#if defined(libpsram)

#include "cogpsram.t"

DAT

  orgh

' The following is used to initialize the PSRAM driver. 
' The clock frequency must be set before starting the driver.
' The startup data should be copied to a block allocated 
' from FREE_MEM and the address of the block set in the
' registry so that C can access this data. 
'
' The clock frequency, and the device, QoS and mailbox structure
' addresses must be set before startup

PSRAM_startupData
    long    0                 ' clock frequency (set before startup)
    long    PSRAM_OPTIONS     ' optional flags
    long    0                 ' reset pin mask on port A for PSRAM (none)
    long    0                 ' reset pin mask on port B for PSRAM (none)
    long    PSRAM_DATABUS     ' PSRAM data bus start pin
PSRAM_addresses
    long    0                 ' address of devices data structure in HUBRAM (dynamically allocated)
    long    0                 ' address of QoS data structure in HUBRAM (dynamically allocated)
    long    0                 ' address of mailbox structure in HUBRAM (dynamically allocated)

PSRAM_deviceData
    ' 16 bank parameters follow
    long    (PSRAM_MAXBURST << 16) | (PSRAM_DELAY << 12) | (PSRAM_ADDRSIZE - 1)   ' bank 0
    long    (PSRAM_MAXBURST << 16) | (PSRAM_DELAY << 12) | (PSRAM_ADDRSIZE - 1)   ' bank 1
    long    0[14]                                                                 ' bank 2-15
    ' 16 banks of pin parameters follow
    long    (PSRAM_CLK_PIN << 8) | PSRAM_CE_PIN                                   ' bank 0
    long    (PSRAM_CLK_PIN << 8) | PSRAM_CE_PIN                                   ' bank 1
    long    -1[14]                                                                ' bank 2-15

PSRAM_qosData
    long    $FFFF0000       ' cog 0 default QoS parameters
    long    $FFFF0000       ' cog 1 default QoS parameters
    long    $FFFF0000       ' cog 2 default QoS parameters
    long    $FFFF0000       ' cog 3 default QoS parameters
    long    $FFFF0000       ' cog 4 default QoS parameters
    long    $FFFF0000       ' cog 5 default QoS parameters
    long    $FFFF0000       ' cog 6 default QoS parameters
    long    $FFFF0000       ' cog 7 default QoS parameters

PSRAM_mailbox
    long    0[8*3]          ' 3 longs per mailbox per COG

' PSRAM_Setup set up PSRAM control block
' On entry - r0 points to memory allocated for control block
' (must be preserved!)

PSRAM_Setup
 mov     r2, ##@PSRAM_startupData ' copy startup data ...
 mov     r1, ##PSRAM_BLOCK_SIZE ' ... to ...
 call    #do_copy               ' our actual PSRAM control block
 sub     r0, ##PSRAM_BLOCK_SIZE ' restore PSRAM control block address
 mov     r1, r0                 ' set ...
 mov     r2, ##_CLOCKFREQ       ' ... clock frequency ...
 wrlong  r2, r1                 ' ... in startup data
 mov     r1, r0                 ' point to addresses ...
 add     r1, ##(PSRAM_addresses - PSRAM_startupData)  ' ... to be filled in
 mov     r2, r0                 ' calculate address ...
 add     r2, ##(PSRAM_deviceData - PSRAM_startupData) ' ... of deviceData
 wrlong  r2, r1                 ' put address in startupData
 mov     r2, r0                 ' calculate address ...
 add     r2, ##(PSRAM_QosData - PSRAM_startupData)    ' ... of QosData
 add     r1, #4                 ' put address ...
 wrlong  r2, r1                 ' ... in startupData
 mov     r2, r0                 ' calculate address ...
 add     r2, ##(PSRAM_mailbox - PSRAM_startupData)    ' ... of mailboxes
 add     r1, #4                 ' put address ...
 wrlong  r2, r1                 ' ... in startupData
 ret

#endif
