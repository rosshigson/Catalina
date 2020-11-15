{
' This file is a skeleton file that can be used to add XMM support for a
' completely new Propeller platform, or for a memory add-on board to be
' used with multiple Propeller platforms.
'
' The first step is to decide on the Platform or Board name, and the Catalina 
' symbol that will be used to specify it on the command line (using the -C 
' command line option). In this file We will assume the platform is to be 
' called "New_Board", and we will use the symbol NEW_BOARD. 
'
' 1. The first step is to rename this file to be "New_Board_XMM.inc".
' 
' 2. The next step is to update XMM.inc. There are two options - select (a)
'    for new platforms with XMM hardware "built-in", or (b) for new "add-on" 
'    XMM boards (but not both!):
'
' a. If this represents a completely new platform, add the following lines 
'    to the file END of the list in XMM.inc, just before the line that says
'    "#elseifdef CUSTOM":
'
'      #elseifdef NEW_BOARD
'      #include "New_Board_XMM.inc"
'
'    Note that for new platforms, you will also need to update CFG.inc, DEF.inc
'    and HMI.inc in a similar manner.
'
' b. If this is an add-on board that can be used on other platforms, add the
'    above lines to the START of the list in XMM.inc, just above the first
'    platform - i.e. just before the line that says "#elseifdef HYDRA":
'
'      #elseifdef NEW_BOARD
'      #include "New_Board_XMM.inc"
'
' 3. The final step is to add the required code to the API functions below. 
'
'    Note that if you only intend to use this board in conjunction with the 
'    Cache, you only need to implement the "MINIMAL API FUNCTIONS". 
'
'    If you want to use this board WITHOUT the cache, you also need to 
'    implement the "DIRECT API FUNCTIONS". Also, delete the CACHE CHECK
'    code below.
'
'    If your board implelements FLASH RAM, you will also need to implement
'    the "FLASH API FUNCTIONS". Also, delete the FLASH CHECK code below.
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
'   NEED_XMM_READLONG  : defined if XMM_ReadLong (and XMM_ReadMult) required
'
'   NEED_XMM_WRITELONG : defined if XMM_WriteLong (and XMM_WriteMult) required
'
'   NEED_XMM_READPAGE  : defined if XMM_ReadPage required
'
'   NEED_XMM_WRITEPAGE : defined if XMM_WritePage required
}
'=============================== CACHE CHECK ===================================
'
' If this platform does not need the cache enabled, delete the following:
'
#ifndef CACHED
#error : PLATFORM REQUIRES CACHE OPTION (CACHED_1K .. CACHED_8K or CACHED)
#endif
'
'=============================== FLASH CHECK ===================================
'
' If this platform has FLASH RAM, delete the following:
'
#ifdef NEED_FLASH
#error : FLASH NOT SUPPORTED ON THIS PLATFORM
#endif
'
'=========================== MINIMAL API FUNCTIONS =============================
'
DAT
'
' XMM_Activate : Activate the XMM bus.
' On entry:
'    None.
' On exit:
'    None.
'
XMM_Activate
              nop                               ' <== INSERT CODE HERE
XMM_Activate_ret
              ret
'
'
'XMM_Tristate : Give up the XMM bus. Use this to use other hardware that 
'               shares pins with the XMM RAM. To reactivate the XMM bus, 
'               call XMM_Activate. If the platform has only FLASH, this
'               should be the same as XMM_FlashTristate
' On entry:
'    None.
' On exit:
'    None.
'            
XMM_Tristate
              nop                               ' <== INSERT CODE HERE
XMM_Tristate_ret
              ret
'
#ifdef NEED_XMM_WRITEPAGE
'
' XMM_WritePage : Write (program) bytes from Hub RAM to XMM RAM. Note that
'                 we can only read and write LONGs, so the Hub address should
'                 be long aligned, and the Len should be a multiple of 4.
' On entry:
'    XMM_Addr  (32-bit): destination address in Flash
'    Hub_Addr  (32-bit): source address in main memory
'    XMM_Len   (32-bit): number of bytes to write 
' On exit:
'    XMM_Addr incremented by the number of bytes written
'
XMM_WritePage
              nop                               ' <== INSERT CODE HERE
XMM_WritePage_ret
              ret
'
#endif
'
#ifdef NEED_XMM_READPAGE
'
' XMM_ReadPage : Read bytes from XMM RAM to Hub RAM. Note that we can only 
'                read and write LONGs, so the Hub address should be long 
'                aligned, and the Len should be a multiple of 4.
' On Entry: 
'    XMM_Addr  (32-bit): source address in Flash
'    Hub_Addr  (32-bit): destination address in main memory
'    XMM_Len   (32-bit): number of bytes to read 
' On exit:
'    XMM_Addr incremented by the number of bytes read
'
XMM_ReadPage
              nop                               ' <== INSERT CODE HERE
XMM_ReadPage_ret
              ret
'
#endif
'
'============================ DIRECT API FUNCTIONS =============================
'
DAT
'
#ifdef NEED_XMM_READLONG              
'
' XMM_ReadLong : Read long from XMM at address in XMM_Addr into the destination
'                register set up in XMM_Dest. XMM_Activate should be called at
'                least once before this routine is used.
' On entry:
'    XMM_Addr : address to read (up to 24 bits, depending on platform)
'    XMM_Dst  : destination of this instruction set to destination register
' On exit:
'    XMM_Addr incremented by 4.
'    Destination register contains long read from XMM.
'
'
' XMM_ReadMult : Read multiple bytes in source register to XMM at address 
'                XMM_Addr. XMM_Activate should be called at least once before 
'                this routine is used.
' On entry:
'    XMM_Addr : address to read (up to 24 bits, depending on platform)
'    XMM_Dst  : destination of this instruction set to destination register
'    XMM_Len  : number of bytes to read (usually 1, 2 or 4)
' On exit:
'    XMM_Addr incremented by XMM_Len.
'    Destination register contains bytes read from XMM.
'
XMM_ReadLong
XMM_ReadMult
              nop                               ' <== INSERT CODE HERE
XMM_Dst       mov     0-0, XMM_Temp             ' save the value just read
XMM_ReadLong_ret
XMM_ReadMult_ret
              ret
'
#endif          
'
#ifdef NEED_XMM_WRITELONG              
'
' XMM_WriteLong : Write long in source register to XMM at address XMM_Addr.
' On entry:
'    XMM_Addr : (32-bit) address to write (up to 19 bits)
'    XMM_Src  : source of this instruction set to source register
' On exit:
'    XMM_Addr incremented by 4.
'
'
' XMM_WriteMult : Write multiple bytes in source register to XMM at address 
'                 XMM_Addr. XMM_Activate should be called at least once before
'                 this routine is used.
' On entry:
'    XMM_Addr : address to write (up to 19 bits)
'    XMM_Src  : source of this instruction set to source register
'    XMM_Len  : number of bytes to write (usually 1, 2 or 4)
' On exit:
'    XMM_Addr incremented by XMM_Len.
'
XMM_WriteLong
XMM_WriteMult
              nop                               ' <== INSERT CODE HERE
XMM_Src       mov     XMM_Temp,0-0              ' save the value to be written
XMM_WriteLong_ret
XMM_WriteMult_ret
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
' XMM_FlashActivate : Activate FLASH bus (equivalent to XMM_Activate for FLASH).
' On entry:
'    None.
' On exit:
'    None.
'
XMM_FlashActivate
              nop                               ' <== INSERT CODE HERE
XMM_FlashActivate_ret
              ret
'            
'XMM_FlashTristate : Give up the FLASH bus. Use this to use other hardware
'                    that shares pins with the FLASH RAM. To reactivate the 
'                    FLASH bus, call XMM_FlashActivate.
' On entry:
'    None.
' On exit:
'    None.
'            
XMM_FlashTristate
              nop                               ' <== INSERT CODE HERE
XMM_FlashTristate_ret
              ret
'
' XMM_FlashWritePage : Write (program) bytes from Hub RAM to FLASH
' On entry:
'    XMM_Addr  (32-bit): destination address in FLASH
'    Hub_Addr  (32-bit): source address in Hub
'    XMM_Len   (32-bit): number of bytes to write 
' On exit:
'    XMM_Addr incremented by the number of bytes written
'
XMM_FlashWritePage
              nop                               ' <== INSERT CODE HERE
XMM_FlashWritePage_ret
              ret
'
' XMM_FlashReadPage : Read bytes from FLASH to Hub RAM.
' On Entry: 
'    XMM_Addr  (32-bit): source address in FLASH
'    Hub_Addr  (32-bit): destination address in Hub
'    XMM_Len   (32-bit): number of bytes to read 
' On exit:
'    XMM_Addr incremented by the number of bytes read
'
XMM_FlashReadPage
              nop                               ' <== INSERT CODE HERE
XMM_FlashReadPage_ret
              ret
'
' XMM_FlashCheckEmpty : Check bytes from FLASH are all $FF.
' On Entry: 
'    XMM_Addr  (32-bit): source address in Flash
'    XMM_Len   (32-bit): number of bytes to read 
' On Exit:
'    Z flag set if all empty, Z flag reset on fail (and failed byte in outx)
'
XMM_FlashCheckEmpty
              nop                               ' <== INSERT CODE HERE
XMM_FlashCheckEmpty_ret
              ret
'
' XMM_FlashComparePage : Compare bytes from FLASH with Hub RAM.
' On Entry: 
'    XMM_Addr  (32-bit): source address in Flash
'    Hub_Addr  (32-bit): destination address in main memory
'    XMM_Len   (32-bit): number of bytes to read 
' On Exit:
'    Z flag set if all the same, Z flag reset on fail (and failed byte in outx)
'
XMM_FlashComparePage
              nop                               ' <== INSERT CODE HERE
XMM_FlashComparePage_ret
              ret
'
' XMM_FlashEraseChip : Erase the whole FLASH chip
' On entry:
'    None.
' On exit:
'    None.
'
XMM_FlashEraseChip
              nop                               ' <== INSERT CODE HERE
XMM_FlashEraseChip_ret
              ret
'
' XMM_FlashEraseBlock : Erase a 4k block of the FLASH chip
' On entry:
'    XMM_Addr  (32-bit): address in FLASH of 4K block to erase.
' On exit:
'    None.
'
XMM_FlashEraseBlock
              nop                               ' <== INSERT CODE HERE
XMM_FlashEraseBlock_ret
              ret
'
' XMM_FlashUnprotect : Unprotect the entire FLASH chip
' On entry:
'    None.
' On exit:
'    None.
'
XMM_FlashUnprotect
              nop                               ' <== INSERT CODE HERE
XMM_FlashUnprotect_ret
              ret
'
' XMM_FlashWriteEnable : Enable Writing to the FLASH chip
' On entry:
'    None.
' On exit:
'    None.
'
XMM_FlashWriteEnable
              nop                               ' <== INSERT CODE HERE
XMM_FlashWriteEnable_ret
              ret
'
' XMM_FlashWaitUntilDone : Wait until previous FLASH request complete
' On entry:
'    None.
' On exit:
'    outx : contents of the FLASH status regiter.
'
XMM_FlashWaitUntilDone
              nop                               ' <== INSERT CODE HERE
XMM_FlashWaitUntilDone_ret
              ret
'
#endif
'
'================================= XMM VARIABLES ===============================
'
DAT
'
outx          long    $0
XMM_Temp      long    $0
'
'===============================================================================
'
