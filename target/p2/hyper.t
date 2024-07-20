{{
'-------------------------------------------------------------------------------
'
' HYPER  - This object is loaded by all target files to include 
'          HYPER Ram/Hyper Flash Memory support.
'          The plugin is loaded depending on the following symbols  
'          (the logic is in Catalina_Plugin.inc):
'
'            libhyper - include HYPER Ram support
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
' Version 5.8 - Initial P2 version 
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

HYPER_BLOCK_SIZE = 8*4 + 16*2*4 + 8*4 + 8*3*4 ' Size in Bytes to allocate for startupData.

DAT

#if defined(libhyper)

CON

HYPER_OPTIONS = (HYPER_FASTREAD<<FASTREAD_BIT) | (HYPER_FASTWRITE<<FASTWRITE_BIT) | (HYPER_UNREGCLK<<UNREGCLK_BIT)

#include "coghyper.t"

DAT

  orgh

' The following is used to initialize the HYPER Ram driver. 
' The clock frequency must be set before starting the driver.
' The startup data should be copied to a block allocated 
' from FREE_MEM and the address of the block set in the
' registry so that C can access this data. 
'
' The clock frequency, and the device, QoS and mailbox structure
' addresses must be set before startup

HYPER_startupData
    long    0                 ' clock frequency (set before startup)
    long    HYPER_OPTIONS     ' optional flags
    long    HYPER_RST_A_MASK  ' reset pin mask on port A for HYPER
    long    HYPER_RST_B_MASK  ' reset pin mask on port B for HYPER
    long    HYPER_BASE_PIN    ' HYPER data bus start pin
HYPER_addresses
    long    0                 ' address of devices data structure in HUBRAM (dynamically allocated)
    long    0                 ' address of QoS data structure in HUBRAM (dynamically allocated)
    long    0                 ' address of mailbox structure in HUBRAM (dynamically allocated)

HYPER_deviceData
    ' 16 bank parameters follow
    long    (HYPER_BURST_RAM << 16)   | (HYPER_DELAY_RAM << 12)   | (HYPER_RAM_SIZE - 1)                      ' bank 0
    long    0                                                                                                 ' bank 1
    long    (HYPER_BURST_FLASH << 16) | (HYPER_DELAY_FLASH << 12) | (1 << FLASH_BIT) | (HYPER_FLASH_SIZE - 1) ' bank 2
    long    (HYPER_BURST_FLASH << 16) | (HYPER_DELAY_FLASH << 12) | (1 << FLASH_BIT) | (HYPER_FLASH_SIZE - 1) ' bank 3
    long    0[12]                                                                                             ' bank 4-15
    ' 16 banks of pin parameters follow
    long    (HYPER_LATENCY_RAM<<25)   | ((HYPER_BASE_PIN+10) << 16) | ((HYPER_BASE_PIN+8) << 8) | (HYPER_BASE_PIN+12) ' bank 0
    long    -1                                                                                                        ' bank 1
    long    (HYPER_LATENCY_FLASH<<25) | ((HYPER_BASE_PIN+11) << 16) | ((HYPER_BASE_PIN+9) << 8) | (HYPER_BASE_PIN+13) ' bank 2
    long    (HYPER_LATENCY_FLASH<<25) | ((HYPER_BASE_PIN+11) << 16) | ((HYPER_BASE_PIN+9) << 8) | (HYPER_BASE_PIN+13) ' bank 3
    long    -1[12]                                                                                                    ' bank 4-15

HYPER_qosData
    long    $FFF01001       ' cog 0 default QoS parameters
    long    $FFF01001       ' cog 1 default QoS parameters
    long    $FFF01001       ' cog 2 default QoS parameters
    long    $FFF01001       ' cog 3 default QoS parameters
    long    $FFF01001       ' cog 4 default QoS parameters
    long    $FFF01001       ' cog 5 default QoS parameters
    long    $FFF01001       ' cog 6 default QoS parameters
    long    $FFF01001       ' cog 7 default QoS parameters

HYPER_mailbox
    long    0[8*3]          ' 3 longs per mailbox per COG

' HYPER_Setup set up HYPER control block
' On entry - r0 points to memory allocated for control block
' (must be preserved!)

HYPER_Setup
 mov     r2, ##@HYPER_startupData ' copy startup data ...
 mov     r1, ##HYPER_BLOCK_SIZE ' ... to ...
 call    #do_copy               ' our actual HYPER control block
 sub     r0, ##HYPER_BLOCK_SIZE ' restore HYPER control block address
 mov     r1, r0                 ' set ...
 mov     r2, ##_CLOCKFREQ       ' ... clock frequency ...
 wrlong  r2, r1                 ' ... in startup data
 mov     r1, r0                 ' point to addresses ...
 add     r1, ##(HYPER_addresses - HYPER_startupData)  ' ... to be filled in
 mov     r2, r0                 ' calculate address ...
 add     r2, ##(HYPER_deviceData - HYPER_startupData) ' ... of deviceData
 wrlong  r2, r1                 ' put address in startupData
 mov     r2, r0                 ' calculate address ...
 add     r2, ##(HYPER_QosData - HYPER_startupData)    ' ... of QosData
 add     r1, #4                 ' put address ...
 wrlong  r2, r1                 ' ... in startupData
 mov     r2, r0                 ' calculate address ...
 add     r2, ##(HYPER_mailbox - HYPER_startupData)    ' ... of mailboxes
 add     r1, #4                 ' put address ...
 wrlong  r2, r1                 ' ... in startupData
 ret

#endif
