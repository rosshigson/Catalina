{
' This file contains XMM Definitions and API functions for the Parallax 
' Propeller Memory Card.
'
' To use this code, the Catalina symbol PMC should be defined on the command
' line. This will need to be done in addition to any other symbols used to
' define the platform. To use the Propeller Memory Card in conjunction with 
' an existing platform such as the QuickStart, define both QUICKSTART and PMC.
' For example:
'
'   catalina hello_world.c -lc -C QUICKSTART -C PMC -C LARGE -C CACHED
'
' The above program will use the SRAM only. To use the PMC FLASH, also define
' the FLASH symbol - e.g:
'
'   catalina hello_world.c -lc -C QUICKSTART -C PMC -C LARGE -C CACHED -C FLASH
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
#ifndef CACHED
#error : PLATFORM REQUIRES CACHE OPTION (CACHED_1K .. CACHED_8K or CACHED)
#endif
'
'=========================== MINIMAL API FUNCTIONS =============================
'
CON
'
#include "PMC_XMM_DEF.inc"
'
' QUAD FLASH commands:
'
JDEC_ID       = $9F
PAGE_PROGRAM  = $02
RD_STATUS_1   = $05
RD_STATUS_2   = $35
RD_STATUS_3   = $15
WR_STATUS_1   = $01
WR_STATUS_2   = $31
WR_STATUS_3   = $11
WRITE_ENABLE  = $06
WRITE_DISABLE = $04
QUAD_ENABLE   = $38
QUAD_RESET    = $FF
HI_SPEED_READ = $0B
CHIP_ERASE    = $C7
SECTOR_ERASE  = $20
GLOBAL_UNPROT = $98
ENABLE_RESET  = $66
RESET_DEVICE  = $99
QUAD_EXIT     = $FF
'
' QUAD SRAM commands:
'
WRITE_RAM      = $02
READ_RAM       = $03
WR_STATUS_RAM  = $01
RD_STATUS_RAM  = $05
'
' To Use QPI mode for FLASH Program and Erase, uncomment the following line 
' (but be aware that programming in QPI mode is unreliable, and Chip Erase 
' can take hours in QPI mode!):
'
#define USE_SPI_FOR_FLASH_WRITE
'
' To Read/Write longs instead of bytes, uncomment the following line
' (note that this requires the CACHE_INDEX_LOG2 to be reduced to 5
'  in the file PMC_XMM_DEF.inc):
'
'#define QUAD_LONGS
'
' The following are for debugging purposes only, and 
' should all be commented out for normal operation:
'
'#define TEST_SPI
'#define TEST_WENABLE
'#define TEST_QENABLE
'#define TEST_INIT
'#define TEST_RINIT
'#define TEST_RW
'
DAT
'
' XMM_Activate : Activate the XMM bus. If the platform has only FLASH, this 
'                should be the same as XMM_FlashActivate
'
' XMM_FlashActivate : activate FLASH bus (equivalent to XMM_Activate for FLASH).
'
XMM_Activate
XMM_FlashActivate
#ifdef NEED_FLASH
#endif
              or      outa,FCEN                 ' set FLASH chip enable high
              or      outa,SCEN                 ' set SRAM chip enable high
              or      dira,DIR_ACTIVE           ' set active pin directions
              tjnz    XMM_Quad,#:in_quad_mode   ' done if we are in quad mode
#ifdef QUAD_POWER_PINS
              or      outa,POWER                ' Apply power on
              call    #Wait100msec              ' wait 100 msec
#endif
#ifdef NEED_FLASH
              'call    #Wait100msec              ' wait 100 msec
              or      outa,QBITS                ' set all data pins high
              mov     XMM_Enab,FCEN             ' use FLASH chip
              mov     outx,#ENABLE_RESET        ' command is Reset Enable
              call    #XMM_SendQuadCmdFinish    ' send byte and finish command
              mov     outx,#RESET_DEVICE        ' command is Reset 
              call    #XMM_SendQuadCmdFinish    ' send byte and finish command
#ifdef TEST_SPI
              mov     outx,#JDEC_ID
              call    #XMM_OutSByte
              call    #XMM_InSByte
              or      outa,XMM_Enab             ' set chip enable high
              and     outx,#$FF
              cmp     outx,#$EF wz
     if_z     or      dira,LED_BIT
     if_z     or      outa,LED_BIT
#endif
              mov     outx,#WRITE_ENABLE        ' command is write enable chip
              call    #XMM_OutSByte
              or      outa,XMM_Enab             ' set chip enable high
#ifdef TEST_WENABLE
              mov     outx,#RD_STATUS_1         ' command is read status-register-1
              call    #XMM_OutSByte
              call    #XMM_InSByte
              or      outa,XMM_Enab             ' set chip enable high
              test    outx,#%0000_0010 wz       ' test WRITE ENABLE bit
     if_nz    or      dira,LED_BIT
     if_nz    or      outa,LED_BIT
#endif
              mov     outx,#RD_STATUS_2         ' command is read status-register-2
              call    #XMM_OutSByte
              call    #XMM_InSByte
              or      outa,XMM_Enab             ' set chip enable high
              or      outx,#%0000_0010          ' set QUAD ENABLE bit
              mov     XMM_Tmp2,outx             ' save it
              mov     outx,#WR_STATUS_1         ' command is write status-register-1 (& 2)
              call    #XMM_OutSByte
              mov     outx,#0
              call    #XMM_OutSByte
              mov     outx,XMM_Tmp2
              call    #XMM_OutSByte
              or      outa,XMM_Enab             ' set chip enable high
#ifdef TEST_QENABLE
              mov     outx,#RD_STATUS_2         ' command is read status-register-2
              call    #XMM_OutSByte
              call    #XMM_InSByte
              or      outa,XMM_Enab             ' set chip enable high
              test    outx,#%0000_0010 wz       ' test QUAD ENABLE bit
     if_nz    or      dira,LED_BIT
     if_nz    or      outa,LED_BIT
#endif
              'call    #Wait100msec              ' wait 100 msec
              call    #XMM_FlashWaitUntilDone_SPI
              call    #XMM_EnterQuadMode
#ifdef TEST_INIT
              mov     outx,#JDEC_ID
              call    #XMM_OutQByte   
              call    #XMM_InQByte
              or      outa,XMM_Enab             ' set chip enable high
              and     outx,#$FF
              cmp     outx,#$EF wz
     if_z     or      dira,LED_BIT
     if_z     or      outa,LED_BIT
#endif
#endif
              'call    #Wait100msec              ' wait 100 msec
              mov     XMM_Enab,SCEN             ' use SRAM chip
              mov     outx,QUAD_EXIT            ' command is exit quad mode
              call    #XMM_SendQuadCmdFinish    ' send byte and finish command

#ifdef TEST_RINIT
              mov     outx,#RD_STATUS_RAM       ' command is read status
              call    #XMM_OutSByte
              mov     outx,#0
              call    #XMM_InSByte              ' 
              cmp     outx,#%01000000 wz
     if_z     or      dira,LED_BIT
     if_z     or      outa,LED_BIT
              or      outa,XMM_Enab             ' set chip enable high
#endif
              call    #XMM_EnterQuadMode
#ifdef TEST_RW
              mov     outx,#WRITE_RAM
              mov     XMM_Addr,#$38
              call    #XMM_SramSetCmdAddr
              mov     outx,RW_VALUE
              call    #XMM_OutQLong
              or      outa,XMM_Enab             ' set chip enable high
              mov     outx,#READ_RAM
              mov     XMM_Addr,#$38
              call    #XMM_SramSetCmdAddr
              call    #XMM_InQByte              ' dummy byte
              mov     outx,#0
              call    #XMM_InQLong
              cmp     outx,RW_VALUE wz
     if_z     or      dira,LED_BIT
     if_z     or      outa,LED_BIT
              or      outa,XMM_Enab             ' set chip enable high
#endif   
              neg     XMM_Quad,#1               ' remember we are in quad mode
:in_quad_mode
XMM_Activate_ret
XMM_FlashActivate_ret
              ret
'              
#ifdef TEST_RW
RW_VALUE      long    $DEADBEEF
#endif
'
#ifdef QUAD_POWER_PINS
'
Wait100msec
              mov     XMM_Temp,cnt
              add     XMM_Temp,delay_time
              waitcnt XMM_Temp,#0
Wait100msec_ret
              ret
'
delay_time    long   Common#CLOCKFREQ/10
'
#endif
'
'
'XMM_Tristate : Give up the XMM bus. Use this to use other hardware that 
'               shares pins with the XMM RAM. To reactivate the XMM bus, 
'               call XMM_Activate. If the platform has only FLASH, this
'               should be the same as XMM_FlashTristate
'            
'XMM_FlashTristate : Give up the FLASH bus. Use this to use other hardware
'                    that shares pins with the FLASH RAM. To reactivate the 
'                    FLASH bus, call XMM_FlashActivate.
'            
XMM_Tristate
XMM_FlashTristate
              andn    dira,DIR_INACTIVE         ' set inactive pin directions
XMM_FlashTristate_ret
XMM_Tristate_ret
              ret
'
'
'XMM_SramSetCmdAddr : Set SRAM command and address (Quad mode). 
'                     XMM_Activate should be called at least once before this 
'                     routine is used.
'On Entry:
'   outx     : Command
'   XMM_Addr : address to set (up to 24 bits)
'On Exit:
'   XMM_Addr : preserved
'   outx     : destroyed
'
'XMM_SetCmdAddr : Set FLASH or SRAM command and address (Quad mode). 
'                 XMM_Activate should be called at least once before this 
'                 routine is used.
'On Entry:
'   outx     : Command
'   XMM_Addr : address to set (up to 24 bits)
'   XMM_Enab : mask for chip enable
'On Exit:
'   XMM_Addr : preserved
'   outx     : destroyed
'
XMM_SramSetCmdAddr
              mov     XMM_Enab,SCEN             ' use SRAM chip
XMM_SetCmdAddr
              call    #XMM_OutQByte             ' send command 
              mov     outx,XMM_Addr
              shr     outx,#16
              call    #XMM_OutQByte             ' send addr bits 23 .. 16
              mov     outx,XMM_Addr
              shr     outx,#8
              call    #XMM_OutQByte             ' send addr bits 15 .. 8
              mov     outx,XMM_Addr
              call    #XMM_OutQByte             ' send addr bits 7 .. 0
XMM_SetCmdAddr_ret
XMM_SramSetCmdAddr_ret
              ret              
'
#ifdef QUAD_LONGS
'
'
' XMM_OutQLong - send 32 bits in Quad Mode.
' On entry: outx contains 32 bits to send
'           chip enable mask in XMM_Enab
' On exit: outx destroyed
'
' NOTE - THIS SEEMS LIKE A SILLY WAY TO DO IT - BUT ON SOME PLATFORMS WE
'        CAN ONLY CHANGE ONE PIN AT ONCE WHEN SENDING DATA TO THE SRAM
'        OR WE GET SPURIOUS CLOCK OUTPUTS. FOR EXAMPLE, THIS OCCURS ON
'        THE QUICKSTART/HUMAN INTERFACE BOARD COMBINATION
'
XMM_OutQLong
              or      dira,QBITS              ' set bits to output
              andn    outa,XMM_Enab           ' set chip enable low
              mov     XMM_Temp,#8             ' 8 writes
              ror     outx,#(31-QSPI_SIO3)
:bit
              mov     XMM_Tmp2,outx
              and     XMM_Tmp2,QBITS
              rol     outx,#4
              'andn    outa,QBITS             ' this is what we want to do ...
              'or      outa,XMM_Tmp2          ' ... but we can't!!!
              test    XMM_Tmp2,QSPI_B0 wz
              muxnz   outa,QSPI_B0
              test    XMM_Tmp2,QSPI_B1 wz
              muxnz   outa,QSPI_B1
              test    XMM_Tmp2,QSPI_B2 wz
              muxnz   outa,QSPI_B2
              test    XMM_Tmp2,QSPI_B3 wz
              muxnz   outa,QSPI_B3
              call    #ClockPulse
              djnz    XMM_Temp,#:bit
XMM_OutQLong_ret
              ret              
'   
'
' XMM_InQLong - read 32 bits in Quad Mode.
' On entry: none.
' On exit: outx contains 32 bits
'
XMM_InQLong
              andn    dira,QBITS              ' set bits to input
              mov     XMM_Temp,#8             ' 8 reads
              mov     outx,#0
:bit
              mov     XMM_Tmp2,ina
              and     XMM_Tmp2,QBITS             
              rol     outx,#4
              or      outx,XMM_Tmp2
              call    #ClockPulse
              djnz    XMM_Temp,#:bit      
              ror     outx,#QSPI_SIO0
XMM_InQLong_ret
              ret
'
#endif
'
#ifdef NEED_XMM_WRITEPAGE
'
' XMM_WritePage : Write (program) bytes from Hub RAM to SRAM. Note that
'                 we can only read and write LONGs, so the Hub address should
'                 be long aligned, and the Len should be a multiple of 4 (this
'                 is guaranteed only if the CACHE is used, so this code MUST
'                 use the CACHE!).
' On entry:
'    XMM_Addr  (32-bit): destination address in Flash
'    Hub_Addr  (32-bit): source address in main memory
'    XMM_Len   (32-bit): number of bytes to write 
'
XMM_WritePage
              mov     outx,#WRITE_RAM           ' Command is WRITE ...
              call    #XMM_SramSetCmdAddr       ' ... and Address (and lower CS)
:loop
#ifdef QUAD_LONGS
              rdlong  outx,Hub_Addr             ' get long from Hub
              call    #XMM_OutQLong             ' write long to Quad SPI RAM
              add     Hub_Addr,#4               ' inc source address
              add     XMM_Addr,#4               ' inc dest address
              sub     XMM_Len,#4 wz,wc          ' repeat ...
#else
              rdbyte  outx,Hub_Addr             ' get byte from Hub
              call    #XMM_OutQByte             ' write byte to Quad SPI RAM
              add     Hub_Addr,#1               ' inc source address
              add     XMM_Addr,#1               ' inc dest address
              sub     XMM_Len,#1 wz,wc          ' repeat ...
#endif              
         if_a jmp     #:loop                    ' ... while XMM_Len > 0
              or      outa,XMM_Enab             ' set chip enable high again
XMM_WritePage_ret
              ret
'
#endif
'
#ifdef NEED_XMM_READPAGE
'
' XMM_ReadPage : Read bytes from SRAM to Hub RAM. Note that we can only 
'                read and write LONGs, so the Hub address should be long 
'                aligned, and the Len should be a multiple of 4 (this
'                is guaranteed only if the CACHE is used, so this code MUST
'                use the CACHE!)..
' On Entry: 
'    XMM_Addr  (32-bit): source address in Flash
'    Hub_Addr  (32-bit): destination address in main memory
'    XMM_Len   (32-bit): number of bytes to read 
'
XMM_ReadPage
              mov     outx,#READ_RAM            ' Command is READ ...
              call    #XMM_SramSetCmdAddr       ' ... and Address (and lower CS)
              call    #XMM_InQByte              ' dummy byte
:loop
#ifdef QUAD_LONGS
              call    #XMM_InQLong              ' read long from Quad SPI RAM
              wrlong  outx,Hub_Addr             ' write long to Hub
              add     Hub_Addr,#4               ' inc dest address
              add     XMM_Addr,#4               ' inc src address
              sub     XMM_Len,#4 wz,wc          ' repeat ...
#else
              call    #XMM_InQByte              ' read byte from Quad SPI RAM
              wrbyte  outx,Hub_Addr             ' write byte to Hub
              add     Hub_Addr,#1               ' inc dest address
              add     XMM_Addr,#1               ' inc src address
              sub     XMM_Len,#1 wz,wc          ' repeat ...
#endif
         if_a jmp     #:loop                    ' ... while XMM_Len > 0
              or      outa,XMM_Enab             ' set chip enable high again
XMM_ReadPage_ret
              ret
'
#endif
'
'============================ DIRECT API FUNCTIONS =============================
'
'               NOTE: DIRECT API IS NOT SUPPORTED ON THE PMC !!!
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
'XMM_ReadLong
'XMM_ReadMult
'              nop                               ' <== INSERT CODE HERE
'XMM_Dst       mov     0-0, XMM_Temp             ' save the value just read
'XMM_ReadLong_ret
'XMM_ReadMult_ret
'              ret
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
'XMM_WriteLong
'XMM_WriteMult
'              nop                               ' <== INSERT CODE HERE
'XMM_Src       mov     XMM_Temp,0-0              ' save the value to be written
'XMM_WriteLong_ret
'XMM_WriteMult_ret
'              ret
'
#endif
'
'============================= FLASH API FUNCTIONS =============================
'
DAT
'
#ifdef NEED_FLASH
'
' XMM_FlashWritePage : Write (program) bytes from Hub RAM to FLASH
' On entry:
'    XMM_Addr  (32-bit): destination address in Flash
'    Hub_Addr  (32-bit): source address in main memory
'    XMM_Len   (32-bit): number of bytes to write 
'
XMM_FlashWritePage
#ifdef USE_SPI_FOR_FLASH_WRITE
              mov     XMM_Enab,FCEN             ' use FLASH chip
              call    #XMM_ExitQuadMode         ' Exit QPI Mode

              mov     outx,#PAGE_PROGRAM        ' Command is Sector-Erase
              call    #XMM_OutSByte             ' send command 
              mov     outx,XMM_Addr
              shr     outx,#16
              call    #XMM_OutSByte             ' send addr bits 23 .. 16
              mov     outx,XMM_Addr
              shr     outx,#8
              call    #XMM_OutSByte             ' send addr bits 15 .. 8
              mov     outx,XMM_Addr
              call    #XMM_OutSByte             ' send addr bits 7 .. 0
:loop
              rdbyte  outx,Hub_Addr             ' get byte from Hub
              call    #XMM_OutSByte             ' write byte to SQI
              add     Hub_Addr,#1               ' inc source address
              add     XMM_Addr,#1               ' inc dest address
              djnz    XMM_Len,#:loop            ' repeat while XMM_len <> 0
              or      outa,XMM_Enab             ' set chip enable high again
              
              call    #XMM_FlashWaitUntilDone_SPI
              call    #XMM_EnterQuadMode        ' re-enter QPI Mode
#else
              mov     outx,#PAGE_PROGRAM        ' Command is Page-Program ...
              call    #XMM_FlashSetCmdAddr      ' ... and Address (and lower CS)
:loop
              rdbyte  outx,Hub_Addr             ' get byte from Hub
              call    #XMM_OutQByte             ' write byte to SQI
              add     Hub_Addr,#1               ' inc source address
              add     XMM_Addr,#1               ' inc dest address
              djnz    XMM_Len,#:loop            ' repeat while XMM_len <> 0
              or      outa,XMM_Enab             ' set chip enable high again
#endif              
XMM_FlashWritePage_ret
              ret
'
'
' XMM_FlashReadPage : Read bytes from FLASH to Hub RAM.
' On Entry: 
'    XMM_Addr  (32-bit): source address in Flash
'    Hub_Addr  (32-bit): destination address in main memory
'    XMM_Len   (32-bit): number of bytes to read 
'
XMM_FlashReadPage
              mov     outx,#HI_SPEED_READ       ' Command is High-Speed Read ...
              call    #XMM_FlashSetCmdAddr      ' ... and Address (and lower CS)
              call    #XMM_InQByte              ' Set to input and clock twice
:loop
              call    #XMM_InQByte              ' read byte from SQI
              wrbyte  outx,Hub_Addr             ' write byte to Hub
              add     Hub_Addr,#1               ' inc dest address
              add     XMM_Addr,#1               ' inc src address
              djnz    XMM_Len,#:loop            ' repeat while XMM_len <> 0
              or      outa,XMM_Enab             ' set chip enable high again
XMM_FlashReadPage_ret
              ret
'
'
' XMM_FlashCheckEmpty : Check bytes from FLASH are all $FF.
' On Entry: 
'    XMM_Addr  (32-bit): source address in Flash
'    XMM_Len   (32-bit): number of bytes to read 
' On Exit:
'    Z flag set if all empty, Z flag reset on fail (and failed byte in outx)
'
XMM_FlashCheckEmpty
              mov     outx,#HI_SPEED_READ       ' Command is High-Speed Read ...
              call    #XMM_FlashSetCmdAddr      ' ... and Address (and lower CS)
              call    #XMM_InQByte              ' Set to input and clock twice
:loop
              call    #XMM_InQByte              ' read byte from SQI
              cmp     outx,#$FF wz
      if_nz   jmp     #:done
              add     XMM_Addr,#1               ' inc src address
              djnz    XMM_Len,#:loop            ' repeat while XMM_len <> 0
              cmp     outx,#$FF wz
:done              
              or      outa,XMM_Enab             ' set chip enable high again
XMM_FlashCheckEmpty_ret
              ret
'
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
              mov     outx,#HI_SPEED_READ       ' Command is High-Speed Read ...
              call    #XMM_FlashSetCmdAddr      ' ... and Address (and lower CS)
              call    #XMM_InQByte              ' Set to input and clock twice
:loop
              call    #XMM_InQByte              ' read byte from SQI
              rdbyte  XMM_Temp,Hub_Addr         ' get hub byte
              cmp     XMM_Temp,outx wz
      if_nz   jmp     #:done
              add     Hub_Addr,#1               ' inc dest address
              add     XMM_Addr,#1               ' inc src address
              djnz    XMM_Len,#:loop            ' repeat while XMM_len <> 0
:done              
              or      outa,XMM_Enab             ' set chip enable high again
XMM_FlashComparePage_ret
              ret
'
'
' XMM_FlashEraseChip : Erase the whole FLASH chip
'
XMM_FlashEraseChip
#ifdef USE_SPI_FOR_FLASH_WRITE
              mov     XMM_Enab,FCEN             ' use FLASH chip
              call    #XMM_ExitQuadMode         ' Exit QPI Mode

              mov     outx,#CHIP_ERASE          ' Command is Chip-Erase
              call    #XMM_OutSByte             ' send command 
              or      outa,XMM_Enab             ' set chip enable high again

              call    #XMM_FlashWaitUntilDone_SPI
              call    #XMM_EnterQuadMode        ' re-enter QPI Mode
#else
              mov     outx,#CHIP_ERASE          ' Command is Chip-Erase
              mov     XMM_Enab,FCEN             ' use FLASH chip
              call    #XMM_SendQuadCmdFinish    ' send byte and finish command
#endif
XMM_FlashEraseChip_ret
              ret
'
'
' XMM_FlashEraseBlock : Erase a 4k block of the FLASH chip
'
XMM_FlashEraseBlock
#ifdef USE_SPI_FOR_FLASH_WRITE
              mov     XMM_Enab,FCEN             ' use FLASH chip
              call    #XMM_ExitQuadMode         ' Exit QPI Mode

              mov     outx,#SECTOR_ERASE        ' Command is Sector-Erase
              call    #XMM_OutSByte             ' send command 
              mov     outx,XMM_Addr
              shr     outx,#16
              call    #XMM_OutSByte             ' send addr bits 23 .. 16
              mov     outx,XMM_Addr
              shr     outx,#8
              call    #XMM_OutSByte             ' send addr bits 15 .. 8
              mov     outx,XMM_Addr
              call    #XMM_OutSByte             ' send addr bits 7 .. 0
              or      outa,XMM_Enab             ' set chip enable high again
              
              call    #XMM_FlashWaitUntilDone_SPI
              call    #XMM_EnterQuadMode        ' re-enter QPI Mode
#else
              mov     outx,#SECTOR_ERASE        ' Command is Sector-Erase
              call    #XMM_FlashSetCmdAddr      ' send command (and address)
              or      outa,XMM_Enab             ' set chip enable high again
#endif
XMM_FlashEraseBlock_ret
              ret
'
#ifdef USE_SPI_FOR_FLASH_WRITE
'
'
' XMM_ExitQuadMode : Exit QPI Mode (i.e. go back to SPI Mode)
'
XMM_ExitQuadMode
              mov     outx,#QUAD_EXIT           ' command is Exit QPI Mode
              call    #XMM_SendQuadCmdFinish    ' send byte and finish command
XMM_ExitQuadMode_ret
              ret
'
#endif
'
'
' XMM_FlashUnprotect : Unprotect the entire FLASH chip
'
XMM_FlashUnprotect
              mov     outx,#WR_STATUS_3         ' command is write status-register-3
              call    #XMM_OutQByte   
              mov     outx,#%0110_0100          ' set DRV = default, WPS = 1
              call    #XMM_SendQuadCmdFinish    ' send byte and finish command
              call    #xMM_FlashWriteEnable     ' enable FLASH Write
              mov     outx,#GLOBAL_UNPROT       ' Command is Global-Unprotect ...
              call    #XMM_SendQuadCmdFinish    ' send byte and finish command
XMM_FlashUnprotect_ret
              ret
'
'
' XMM_FlashWriteEnable : Enable Writing to the FLASH chip
' XMM_SendQuadCmdFinish : Send a Quad byte to the FLASH or SRAM chip and set chip enable high
'
XMM_FlashWriteEnable
              mov     outx,#WRITE_ENABLE        ' Command is Write-Enable
              mov     XMM_Enab,FCEN             ' use FLASH chip
                                                ' fall through to ...
XMM_SendQuadCmdFinish
              call    #XMM_OutQByte             ' send command 
              or      outa,XMM_Enab             ' set chip enable high again
XMM_FlashWriteEnable_ret
XMM_SendQuadCmdFinish_ret
              ret
'
'
' XMM_FlashWaitUntilDone : Wait until previous FLASH request complete
'
XMM_FlashWaitUntilDone
:loop
              mov     outx,#RD_STATUS_1         ' Command is Read-Status-Register 1
              mov     XMM_Enab,FCEN             ' use FLASH chip
              call    #XMM_OutQByte             ' send command 
              call    #XMM_InQByte              ' read byte 
              or      outa,XMM_Enab             ' set chip enable high again
              mov     XMM_Temp,outx             ' check ...
              and     XMM_Temp,#%0000_0001      ' ... BUSY bit
              tjnz    XMM_Temp,#:loop           ' repeat until zero
XMM_FlashWaitUntilDone_ret
              ret
'
'
' XMM_FlashWaitUntilDone_SPI : Wait until previous FLASH request complete
'
XMM_FlashWaitUntilDone_SPI
:loop              
              mov     outx,#RD_STATUS_1         ' command is read status-register-1
              mov     XMM_Enab,FCEN             ' use FLASH chip
              call    #XMM_OutSByte
              call    #XMM_InSByte
              or      outa,XMM_Enab             ' set chip enable high
              test    outx,#%0000_0001 wz       ' test WRITE ENABLE bit
     if_nz    jmp #:loop
XMM_FlashWaitUntilDone_SPI_ret
              ret
'
'
'XMM_FlashSetCmdAddr : Set FLASH command and address in Quad Mode. 
'                 XMM_Activate should be called at least once before this 
'                 routine is used.
'On Entry:
'   outx     : Command
'   XMM_Addr : address to set (up to 24 bits)
'On Exit:
'   XMM_Addr : preserved
'   outx     : destroyed
'
XMM_FlashSetCmdAddr
              mov     XMM_Enab,FCEN             ' use FLASH chip
              call    #XMM_SetCmdAddr           ' Set command and address
XMM_FlashSetCmdAddr_ret
              ret
'
#else
'
'
' XMM_SendQuadCmdFinish : Send a Quad byte to the FLASH or SRAM chip and set chip enable high
'
XMM_SendQuadCmdFinish
              call    #XMM_OutQByte             ' send command 
              or      outa,XMM_Enab             ' set chip enable high again
XMM_SendQuadCmdFinish_ret
              ret
'
#endif
'
'
' XMM_OutSByte - send 8 bits in SPI mode
' On entry: byte in outx (lower 8 bits)
'           chip enable mask in XMM_Enab
' On exit: C flag destroyed!
'
XMM_OutSByte
              'andn    outa,IBIT               ' set IBIT low
              or      dira,IBIT               ' set IBIT to output
              andn    outa,XMM_Enab           ' set chip enable low
              mov     XMM_Temp,#8             ' 8 bits
              rol     outx,#24                ' put first bit in MSB
:bit              
              rol     outx,#1 wc
              muxc    outa,IBIT
              call    #ClockPulse
              djnz    XMM_Temp,#:bit
XMM_OutSByte_ret
              ret              
'
'
' XMM_InSByte - read 8 bits in SPI mode
' On exit: outx shifted left 8 bits, new byte in lower 8 bits
' On exit: none.
'
XMM_InSByte
              andn    dira,OBIT               ' set OBIT to input
              mov     XMM_Temp,#8             ' 8 bits
:bit
              test    OBIT,ina wc
              rcl     outx, #1
              call    #ClockPulse
              djnz    XMM_Temp,#:bit      
XMM_InSByte_ret
              ret
'
'
' WriteTemp - Write the data in the XMM_Temp register (in Quad Mode). The
'             data must already be positioned for writing.
'
' NOTE - THIS SEEMS LIKE A SILLY WAY TO DO IT - BUT ON SOME PLATFORMS WE
'        CAN ONLY CHANGE ONE PIN AT ONCE WHEN SENDING DATA TO THE FLASH
'        OR WE GET SPURIOUS CLOCK OUTPUTS. FOR EXAMPLE, THIS OCCURS ON
'        THE QUICKSTART/HUMAN INTERFACE BOARD COMBINATION
'
WriteTemp
              test    XMM_Temp,QSPI_B0 wz
              muxnz   outa,QSPI_B0
              test    XMM_Temp,QSPI_B1 wz
              muxnz   outa,QSPI_B1
              test    XMM_Temp,QSPI_B2 wz
              muxnz   outa,QSPI_B2
              test    XMM_Temp,QSPI_B3 wz
              muxnz   outa,QSPI_B3
WriteTemp_Common        
              call    #ClockPulse
WriteTemp_ret
              ret
'
'
' XMM_OutQByte - write 8 bits in Quad mode
' On entry: byte in outx (lower 8 bits)
'           chip enable mask in XMM_Enab
' On exit: none.
'
XMM_OutQByte
              or      dira,QBITS              ' set QBITS to output
              andn    outa,XMM_Enab           ' lower chip enable
              mov     XMM_Temp,outx
#ifdef QUAD_UPPER_NIBBLE_LEFT
              shl     XMM_Temp,#(QSPI_SIO0-4) ' shift for output
#endif
#ifdef QUAD_UPPER_NIBBLE_RIGHT
              shr     XMM_Temp,#(4-QSPI_SIO0) ' shift for output
#endif
              call    #WriteTemp
              
              mov     XMM_Temp,outx
#ifdef QUAD_LOWER_NIBBLE_LEFT
              shl     XMM_Temp,#QSPI_SIO0 ' shift for output
#endif
              call    #WriteTemp

XMM_OutQByte_ret
              ret
'
'
' ReadTemp - read the data to the XMM_Temp register (in Quad Mode). 
'
ReadTemp
              mov     XMM_Temp,ina
              and     XMM_Temp,QBITS
              call    #ClockPulse
ReadTemp_ret
              ret
'
' ClockPulse - should really calculate this based on clock speed!
'
ClockPulse
              or      outa,CLK 
              nop                             ' clock pulse needs extra time
              nop                             ' clock pulse needs extra time
              nop                             ' clock pulse needs extra time
              andn    outa,CLK 
              nop                             ' clock pulse needs extra time
ClockPulse_ret
              ret
'
' XMM_InQByte - read 8 bits in Quad mode
' On entry: none.
' On exit: byte in lower 8 bits of outx
'
XMM_InQByte
              andn    dira,QBITS              ' set QBITS to input
              call    #ReadTemp
#ifdef QUAD_UPPER_NIBBLE_LEFT
              shr     XMM_Temp,#(QSPI_SIO0-4) ' reverse shift for input
#endif
#ifdef QUAD_UPPER_NIBBLE_RIGHT
              shl     XMM_Temp,#(4-QSPI_SIO0) ' reverse shift for input
#endif
              mov     outx,XMM_Temp
              call    #ReadTemp
#ifdef QUAD_LOWER_NIBBLE_LEFT
              shr     XMM_Temp,#QSPI_SIO0 ' reverse shift for input
#endif
              or      outx,XMM_Temp
XMM_InQByte_ret              
              ret
'
'
' XMM_EnterQuadMode : Enter QPI Mode (i.e. exit SPI mode)
'
XMM_EnterQuadMode
              mov     outx,#QUAD_ENABLE         ' command is Enable Quad I/O
              call    #XMM_OutSByte             ' send command
              or      outa,XMM_Enab             ' set chip enable high
XMM_EnterQuadMode_ret
              ret
'
'
'================================= XMM VARIABLES ===============================
'
DAT
'
' General variables:
'
outx          long    $0
XMM_Temp      long    $0
XMM_Tmp2      long    $0
XMM_Quad      long    $0
XMM_Flags     long    $0
XMM_Enab      long    $0
'     
' PMC Hardware Access:
'
#ifdef QUAD_POWER_PINS
'
' define pin that must be powered (QSPI_VDD)
POWER         long    (|<QSPI_VDD)
' include power and ground pins (QSPI_VDD and QSPI_VSS) in DIR_ACTIVE
DIR_ACTIVE    long    (|<QSPI_VDD) | (|<QSPI_FCEN) | (|<QSPI_CLK) | (|<QSPI_VSS) | (|<QSPI_SCEN) 
'
#else
'   
' don't need to worry about conrolling power and ground pins
DIR_ACTIVE    long    (|<QSPI_FCEN) | (|<QSPI_CLK) | (|<QSPI_SCEN) 
'
#endif
'
DIR_INACTIVE  long    (|<QSPI_CLK) | (|<QSPI_SIO0) | (|<QSPI_SIO1) | (|<QSPI_SIO2) | (|<QSPI_SIO3) 
'
OBIT          long    (|<SSPI_SO)
IBIT          long    (|<SSPI_SI)
'
QBITS         long    (|<QSPI_SIO0) | (|<QSPI_SIO1) | (|<QSPI_SIO2) | (|<QSPI_SIO3)
'
CLK           long    (|<QSPI_CLK)
FCEN          long    (|<QSPI_FCEN)
SCEN          long    (|<QSPI_SCEN)
'
QSPI_B0       long    |< QSPI_SIO0
QSPI_B1       long    |< QSPI_SIO1
QSPI_B2       long    |< QSPI_SIO2
QSPI_B3       long    |< QSPI_SIO3
'
LED_BIT       long    |< XMM_DEBUG_PIN ' only used when when testing
'
'===============================================================================
'

