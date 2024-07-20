'===============================================================================
' This file contains functions to allow HYPER (e.g. on the P2 EDGE) to be 
' used as XMM RAM. It currently implements only the minimal XMM API functions, 
' which means it must be used in conjunction with the cache.
'
'===============================================================================
{
' This file is a skeleton file that can be used to add XMM support for a
' new Custom Propeller platform.
'
' The required code must be added to the API functions below. 
'
' Note that if you only intend to use this board in conjunction with the 
' Cache, you only need to implement the "MINIMAL API FUNCTIONS". 
'
' If you want to use this board WITHOUT the cache, you also need to 
' implement the "DIRECT API FUNCTIONS". Also, delete the CACHE CHECK
' code below.
'
' If your board implelements FLASH RAM, you will also need to implement
' the "FLASH API FUNCTIONS". Also, delete the FLASH CHECK code below.
}
'===============================================================================
{
' The XMM functions included are controlled via Catalina symbols defined 
' internally as required within various Catalina files:
'
'   CACHED             : defined if CACHE in use (any size)
'
'   NEED_FLASH         : defined if FLASH support required
'
'   NEED_PSR_READLONG  : defined if PSR_ReadLong (and PSR_ReadMult) required
'
'   NEED_PSR_WRITELONG : defined if PSR_WriteLong (and PSR_WriteMult) required
'
'   NEED_PSR_READPAGE  : defined if PSR_ReadPage required
'
'   NEED_PSR_WRITEPAGE : defined if PSR_WritePage required
}
'=============================== CACHE CHECK ===================================
'
' If this platform does not need the cache enabled, delete the following:
'
#ifndef CACHED
#error : HYPER REQUIRES CACHE OPTION (CACHED_1K .. CACHED_64K or CACHED)
#endif
'
'=============================== FLASH CHECK ===================================
'
' If this platform has FLASH RAM, delete the following:
'
#ifdef NEED_FLASH
#error : FLASH NOT SUPPORTED WHEN USING HYPER
#endif
'
'=========================== MINIMAL API FUNCTIONS =============================
'
CON

' psram.def also applies to HYPER RAM:
#include <psram.def>

DAT
'
' PSR_Activate : Activate the XMM bus (set up mailbox for HYPER).
' On entry:
'    None.
' On exit:
'    None.
'
PSR_Activate
              tjnz   mbox_0,#PSR_Activate_ret ' done if already initialized
              mov    mbox_0,##REGISTRY   ' point to registry (TBD !!! SHOULD NOT BE HARDCODED HERE !!!)
              mov    mbox_1,#0           ' start at cog id 0
.psa1
              cmp    mbox_1,#MAX_COGS wz ' run out of cogs?
       if_z   mov    mbox_0,#0           ' yes - HYPER plugin ...
       if_z   ret                        ' ... not found
              rdlong mbox_2,mbox_0       ' no - check cog's plugin type
              shr    mbox_2,#24          ' is it ...
              cmp    mbox_2,#LMM_HYP wz  ' ... the HYPER plugin?
       if_z   jmp    #.psa2              ' yes - set up mail box etc
              add    mbox_1,#1           ' no - try ...
              add    mbox_0,#4           ' ... next ...
              jmp    #.psa1              ' ... cog id
.psa2
              rdlong mbox_0,mbox_0       ' get ...
              and    mbox_0,##$FFFFFF    ' ... request block address
              rdlong mbox_0,mbox_0       ' get pointer to ...
              and    mbox_0,##$FFFFFF    ' ... HYPER startupData
              add    mbox_0,#192         ' point to mail boxes (+48 longs)
              cogid  mbox_1              ' add ...
              shl    mbox_1,#2           ' ... cog * 12 bytes ...
              add    mbox_0,mbox_1       ' ... (i.e. cog * 3 longs) ...
              add    mbox_0,mbox_1       ' ... to point to ...
              add    mbox_0,mbox_1       ' ... OUR mailbox long 0
              mov    mbox_1,mbox_0       ' point to ...
              add    mbox_1,#4           ' ... OUR mailbox long 1
              mov    mbox_2,mbox_1       ' point to ...
              add    mbox_2,#4           ' ... our mailbox long 2
PSR_Activate_ret
              ret
'
'
'PSR_Tristate : Give up the XMM bus. Use this to use other hardware that 
'               shares pins with the XMM RAM. To reactivate the XMM bus, 
'               call PSR_Activate. If the platform has only FLASH, this
'               should be the same as PSR_FlashTristate
' On entry:
'    None.
' On exit:
'    None.
'            
PSR_Tristate
                                                ' <== INSERT CODE HERE
              ret
'
#ifdef NEED_PSR_WRITEPAGE
'
' PSR_WritePage : Write (program) bytes from Hub RAM to XMM RAM. Note that
'                 we can only read and write LONGs, so the Hub address should
'                 be long aligned, and the Len should be a multiple of 4.
' On entry:
'    PSR_Addr  (25-bit): destination address in XMM RAM
'    Hub_Addr  (32-bit): source address in main memory
'    PSR_Len   (32-bit): number of bytes to write 
' On exit:
'    PSR_Addr incremented by the number of bytes written
'
PSR_WritePage
              rdlong  PSR_Temp,mbox_0 wcz       ' wait till ...
        if_b  jmp     #PSR_WritePage_ret        ' ... mailbox not busy
              wrlong  PSR_Len,mbox_2            ' write length to mail box
              wrlong  Hub_Addr,mbox_1           ' write Hub Addr to mail box
              mov     PSR_Temp,PSR_Addr         ' write ...
              and     PSR_Temp,##$1FFFFFF       ' ... XMM Address ...
              or      PSR_Temp,##R_WRITEBURST   ' ... and command ...
              wrlong  PSR_Temp,mbox_0           ' ... to mail box
PSR_WriteWait rdlong  PSR_Temp,mbox_0 wcz       ' wait till ...
        if_b  jmp     #PSR_WriteWait            ' ... operation complete
              add     PSR_Addr,PSR_Len
PSR_WritePage_ret
              ret
'
#endif
'
#ifdef NEED_PSR_READPAGE
'
' PSR_ReadPage : Read bytes from XMM RAM to Hub RAM. Note that we can only 
'                read and write LONGs, so the Hub address should be long 
'                aligned, and the Len should be a multiple of 4.
' On Entry: 
'    PSR_Addr  (25-bit): source address in XMM RAM
'    Hub_Addr  (32-bit): destination address in main memory
'    PSR_Len   (32-bit): number of bytes to read 
' On exit:
'    PSR_Addr incremented by the number of bytes read
'
PSR_ReadPage
              rdlong  PSR_Temp,mbox_0 wcz       ' return if ...
        if_b  jmp     #PSR_ReadPage_ret         ' ... mailbox busy
              wrlong  PSR_Len,mbox_2            ' write length to mail box
              wrlong  Hub_Addr,mbox_1           ' write Hub Addr to mail box
              mov     PSR_Temp,PSR_Addr         ' write ...
              and     PSR_Temp,##$1FFFFFF       ' ... XMM Address ...
              or      PSR_Temp,##R_READBURST    ' ... and command ...
              wrlong  PSR_Temp,mbox_0           ' ... to mail box
PSR_ReadWait  rdlong  PSR_Temp,mbox_0 wcz       ' wait till ...
        if_b  jmp     #PSR_ReadWait             ' ... operation complete
              add     PSR_Addr,PSR_Len
PSR_ReadPage_ret
              ret
'
#endif
'
'============================ DIRECT API FUNCTIONS =============================
'
DAT
'
#ifdef NEED_PSR_READLONG              
'
' PSR_ReadLong : Read long from XMM at address in PSR_Addr into the destination
'                register set up in PSR_Dest. PSR_Activate should be called at
'                least once before this routine is used.
' On entry:
'    PSR_Addr : address to read (up to 24 bits, depending on platform)
'    PSR_Dst  : destination of this instruction set to destination register
' On exit:
'    PSR_Addr incremented by 4.
'    Destination register contains long read from XMM.
'
'
' PSR_ReadMult : Read multiple bytes in source register to XMM at address 
'                PSR_Addr. PSR_Activate should be called at least once before 
'                this routine is used.
' On entry:
'    PSR_Addr : address to read (up to 24 bits, depending on platform)
'    PSR_Dst  : destination of this instruction set to destination register
'    PSR_Len  : number of bytes to read (usually 1, 2 or 4)
' On exit:
'    PSR_Addr incremented by PSR_Len.
'    Destination register contains bytes read from XMM.
'
PSR_ReadLong
PSR_ReadMult
              nop                               ' <== INSERT CODE HERE
PSR_Dst       mov     0-0, PSR_Temp             ' save the value just read
PSR_ReadLong_ret
PSR_ReadMult_ret
              ret
'
#endif          
'
#ifdef NEED_PSR_WRITELONG              
'
' PSR_WriteLong : Write long in source register to XMM at address PSR_Addr.
' On entry:
'    PSR_Addr : (32-bit) address to write (up to 19 bits)
'    PSR_Src  : source of this instruction set to source register
' On exit:
'    PSR_Addr incremented by 4.
'
'
' PSR_WriteMult : Write multiple bytes in source register to XMM at address 
'                 PSR_Addr. PSR_Activate should be called at least once before
'                 this routine is used.
' On entry:
'    PSR_Addr : address to write (up to 19 bits)
'    PSR_Src  : source of this instruction set to source register
'    PSR_Len  : number of bytes to write (usually 1, 2 or 4)
' On exit:
'    PSR_Addr incremented by PSR_Len.
'
PSR_WriteLong
PSR_WriteMult
              nop                               ' <== INSERT CODE HERE
PSR_Src       mov     PSR_Temp,0-0              ' save the value to be written
PSR_WriteLong_ret
PSR_WriteMult_ret
              ret
'
#endif
'
'============================= FLASH API FUNCTIONS =============================
'
DAT
'
#ifdef NEED_FLASH
'
' PSR_FlashActivate : Activate FLASH bus (equivalent to PSR_Activate for FLASH).
' On entry:
'    None.
' On exit:
'    None.
'
PSR_FlashActivate
              nop                               ' <== INSERT CODE HERE
PSR_FlashActivate_ret
              ret
'            
'PSR_FlashTristate : Give up the FLASH bus. Use this to use other hardware
'                    that shares pins with the FLASH RAM. To reactivate the 
'                    FLASH bus, call PSR_FlashActivate.
' On entry:
'    None.
' On exit:
'    None.
'            
PSR_FlashTristate
              nop                               ' <== INSERT CODE HERE
PSR_FlashTristate_ret
              ret
'
' PSR_FlashWritePage : Write (program) bytes from Hub RAM to FLASH
' On entry:
'    PSR_Addr  (32-bit): destination address in FLASH
'    Hub_Addr  (32-bit): source address in Hub
'    PSR_Len   (32-bit): number of bytes to write 
' On exit:
'    PSR_Addr incremented by the number of bytes written
'
PSR_FlashWritePage
              nop                               ' <== INSERT CODE HERE
PSR_FlashWritePage_ret
              ret
'
' PSR_FlashReadPage : Read bytes from FLASH to Hub RAM.
' On Entry: 
'    PSR_Addr  (32-bit): source address in FLASH
'    Hub_Addr  (32-bit): destination address in Hub
'    PSR_Len   (32-bit): number of bytes to read 
' On exit:
'    PSR_Addr incremented by the number of bytes read
'
PSR_FlashReadPage
              nop                               ' <== INSERT CODE HERE
PSR_FlashReadPage_ret
              ret
'
' PSR_FlashCheckEmpty : Check bytes from FLASH are all $FF.
' On Entry: 
'    PSR_Addr  (32-bit): source address in Flash
'    PSR_Len   (32-bit): number of bytes to read 
' On Exit:
'    Z flag set if all empty, Z flag reset on fail (and failed byte in outx)
'
PSR_FlashCheckEmpty
              nop                               ' <== INSERT CODE HERE
PSR_FlashCheckEmpty_ret
              ret
'
' PSR_FlashComparePage : Compare bytes from FLASH with Hub RAM.
' On Entry: 
'    PSR_Addr  (32-bit): source address in Flash
'    Hub_Addr  (32-bit): destination address in main memory
'    PSR_Len   (32-bit): number of bytes to read 
' On Exit:
'    Z flag set if all the same, Z flag reset on fail (and failed byte in outx)
'
PSR_FlashComparePage
              nop                               ' <== INSERT CODE HERE
PSR_FlashComparePage_ret
              ret
'
' PSR_FlashEraseChip : Erase the whole FLASH chip
' On entry:
'    None.
' On exit:
'    None.
'
PSR_FlashEraseChip
              nop                               ' <== INSERT CODE HERE
PSR_FlashEraseChip_ret
              ret
'
' PSR_FlashEraseBlock : Erase a 4k block of the FLASH chip
' On entry:
'    PSR_Addr  (32-bit): address in FLASH of 4K block to erase.
' On exit:
'    None.
'
PSR_FlashEraseBlock
              nop                               ' <== INSERT CODE HERE
PSR_FlashEraseBlock_ret
              ret
'
' PSR_FlashUnprotect : Unprotect the entire FLASH chip
' On entry:
'    None.
' On exit:
'    None.
'
PSR_FlashUnprotect
              nop                               ' <== INSERT CODE HERE
PSR_FlashUnprotect_ret
              ret
'
' PSR_FlashWriteEnable : Enable Writing to the FLASH chip
' On entry:
'    None.
' On exit:
'    None.
'
PSR_FlashWriteEnable
              nop                               ' <== INSERT CODE HERE
PSR_FlashWriteEnable_ret
              ret
'
' PSR_FlashWaitUntilDone : Wait until previous FLASH request complete
' On entry:
'    None.
' On exit:
'    outx : contents of the FLASH status regiter.
'
PSR_FlashWaitUntilDone
              nop                               ' <== INSERT CODE HERE
PSR_FlashWaitUntilDone_ret
              ret

#endif

'
'=============================== HYPER VARIABLES ===============================
'
DAT

outx          long    $0
PSR_Temp      long    $0
mbox_0        long    $0
mbox_1        long    $0
mbox_2        long    $0
 
PSR_Addr      long 0
PSR_Hub_Addr  long 0
PSR_Len       long 0

'
'===============================================================================
'
