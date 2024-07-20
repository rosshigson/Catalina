{
'---------------------- FLASHPOINT XMM Support Routines ------------------------
'
' FLASHPOINT (SUPERQUAD and RAMPAGE) XMM Support routines.
'
' This module works for both the SUPERQUAD and RAMPAGE boards.
'
' For the SUPERQUAD you must define the NO_RAM symbol (done automatically
' if you also use the FlashPoint_CFG.inc configuration file).
'
' NOTE: You must use the CACHED driver due to the size of the XMM access code. 
'
' NOTE: The RAMPAGE supports bothe the LARGE and SMALL memory models, but
'       the SUPERQUAD supports only the SMALL memory model.
'
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
#include "FlashPoint_XMM_DEF.inc"
'
' QUAD FLASH commands (SuperQuad and RamPage):
'
JDEC_ID_SQI   = $AF
JDEC_ID_SPI   = $9F
PAGE_PROGRAM  = $02
READ_STATUS   = $05
WRITE_ENABLE  = $06
WRITE_DISABLE = $04
QUAD_ENABLE   = $38
QUAD_RESET    = $FF
HI_SPEED_READ = $0B
CHIP_ERASE    = $C7
SECTOR_ERASE  = $20
WRITE_BLKPROT = $42
'
' QUAD SRAM commands (RamPage only):
'
WRITE_SPI     = $02
READ_SPI      = $03
WRITE_ST_SPI  = $01
READ_ST_SPI   = $05
'
' These are only for debugging, and should be disabled for normal operation:
'
'#define TEST_SPI
'#define TEST_INIT
'#define TEST_RINIT
'#define TEST_RW
'
DAT
'
'
' XMM_Activate : Activate the XMM bus. If the platform has only FLASH, this 
'                should be the same as XMM_FlashActivate
'
' XMM_FlashActivate : activate FLASH bus (equivalent to XMM_Activate for FLASH).
'
XMM_Activate
XMM_FlashActivate
#ifdef NEED_FLASH
              or      outa,CEN                  ' set chip enable high
#endif
#ifndef NO_RAM
              or      outa,RCEN                 ' set chip enable high
#endif
              or      dira,DIRN                 ' set pin directions
              tjnz    XMM_Quad,#:in_quad_mode   ' done if we are in quad mode
#ifdef QUAD_POWER_PINS
              or      outa,POWER                ' Apply power on
              call    #Wait100msec              ' wait 100 msec
#else
#ifdef NEED_FLASH   
              call    #Wait100msec              ' wait 100 msec
              or      outa,QBITS                ' set all output pins high
              mov     outx,#QUAD_RESET          ' set command to Reset Quad I/O
              call    #XMM_FlashOutSByte        ' send command
              or      outa,CEN                  ' set chip enable high
#endif              
#endif
#ifdef NEED_FLASH
#ifdef TEST_SPI
              mov     outx,#JDEC_ID_SPI
              call    #XMM_FlashOutSByte
              call    #XMM_FlashInSByte
              and     outx,#$FF
              cmp     outx,#$BF wz
     if_z     or      dira,LED_BIT
     if_z     andn    outa,LED_BIT
#endif
              mov     outx,#QUAD_ENABLE         ' command to Enable Quad I/O
              call    #XMM_FlashOutSByte        ' send command
              or      outa,CEN                  ' set chip enable high
#ifdef TEST_INIT
              mov     outx,#JDEC_ID_SQI
              call    #XMM_FlashOutQNibbles
              call    #XMM_FlashInQByte
              and     outx,#$FF
#ifdef QUAD_BITS_REVERSED              
              cmp     outx,#$DF wz
#else
              cmp     outx,#$BF wz
#endif
     if_z     or      dira,LED_BIT
     if_z     andn    outa,LED_BIT
#endif
              or      outa,CEN                  ' set chip enable high
#endif
#ifndef NO_RAM
              mov     outx,#WRITE_ST_SPI        ' command is write status
              call    #XMM_OutSByte
              mov     outx,#%01000001           ' seq data access, no hold
              call    #XMM_OutSByte
              or      outa,RCEN                 ' set chip enable high
#ifdef TEST_RINIT
              mov     outx,#READ_ST_SPI         ' command is read status
              call    #XMM_OutSByte
              call    #XMM_InSLong              ' get status of all 4 RAM chips
              cmp     outx,RINIT_RSLT wz
     if_z     or      dira,LED_BIT
     if_z     andn    outa,LED_BIT
              or      outa,RCEN                 ' set chip enable high
#endif
#ifdef TEST_RW
              mov     outx,#WRITE_SPI
              mov     XMM_Addr,#4
              call    #XMM_SetCmdAddr
              mov     outx,RW_VALUE
              call    #XMM_OutSLong
              or      outa,RCEN                 ' set chip enable high
              mov     outx,#READ_SPI
              mov     XMM_Addr,#4
              call    #XMM_SetCmdAddr
              call    #XMM_InSLong
              cmp     outx,RW_VALUE wz
     if_z     or      dira,LED_BIT
     if_z     andn    outa,LED_BIT
              or      outa,RCEN                 ' set chip enable high
#endif
#endif   
              neg     XMM_Quad,#1               ' remember we are in quad mode
:in_quad_mode
XMM_Activate_ret
XMM_FlashActivate_ret
              ret
'              
#ifdef TEST_RINIT
RINIT_RSLT    long    %0000_1111_0000_0000_0000_0000_0000_1111
#endif
#ifdef TEST_RW
RW_VALUE      long    $DEADBEEF
#endif
'
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
              andn    dira,NONPOWER             ' set non-power pins to input
XMM_FlashTristate_ret
XMM_Tristate_ret
              ret
'
#ifdef NEED_FLASH
'
'
' XMM_FlashWritePage : Write (program) bytes from Hub RAM to FLASH
' On entry:
'    XMM_Addr  (32-bit): destination address in Flash
'    Hub_Addr  (32-bit): source address in main memory
'    XMM_Len   (32-bit): number of bytes to write 
'
XMM_FlashWritePage
              mov     outx,#PAGE_PROGRAM        ' Command is Page-Program ...
              call    #XMM_FlashSetCmdAddr      ' ... and Address (and lower CS)
:loop
              rdbyte  outx,Hub_Addr             ' get byte from Hub
              call    #XMM_FlashOutQByte        ' write byte to SQI
              add     Hub_Addr,#1               ' inc source address
              add     XMM_Addr,#1               ' inc dest address
              djnz    XMM_Len,#:loop            ' repeat while XMM_len <> 0
              or      outa,CEN                  ' set chip enable high again
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
              call    #XMM_FlashInQByte         ' Set to input and clock twice
:loop
              call    #XMM_FlashInQByte         ' read byte from SQI
              wrbyte  outx,Hub_Addr             ' write byte to Hub
              add     Hub_Addr,#1               ' inc dest address
              add     XMM_Addr,#1               ' inc src address
              djnz    XMM_Len,#:loop            ' repeat while XMM_len <> 0
              or      outa,CEN                  ' set chip enable high again
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
              call    #XMM_FlashInQByte         ' Set to input and clock twice
:loop
              call    #XMM_FlashInQByte         ' read byte from SQI
              cmp     outx,#$FF wz
      if_nz   jmp     #:done
              add     XMM_Addr,#1               ' inc src address
              djnz    XMM_Len,#:loop            ' repeat while XMM_len <> 0
              cmp     outx,#$FF wz
:done              
              or      outa,CEN                  ' set chip enable high again
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
              call    #XMM_FlashInQByte         ' Set to input and clock twice
:loop
              call    #XMM_FlashInQByte         ' read byte from SQI
              rdbyte  XMM_Temp,Hub_Addr         ' get hub byte
              cmp     XMM_Temp,outx wz
      if_nz   jmp     #:done
              add     Hub_Addr,#1               ' inc dest address
              add     XMM_Addr,#1               ' inc src address
              djnz    XMM_Len,#:loop            ' repeat while XMM_len <> 0
:done              
              or      outa,CEN                  ' set chip enable high again
XMM_FlashComparePage_ret
              ret
'
'
' XMM_FlashEraseChip : Erase the whole FLASH chip
'
XMM_FlashEraseChip
              mov     outx,#CHIP_ERASE          ' Command is Chip-Erase
              call    #XMM_FlashOutQNibbles     ' send command 
              or      outa,CEN                  ' set chip enable high again
XMM_FlashEraseChip_ret
              ret
'
'
' XMM_FlashEraseBlock : Erase a 4k block of the FLASH chip
'
XMM_FlashEraseBlock
              mov     outx,#SECTOR_ERASE        ' Command is Sector-Erase
              call    #XMM_FlashSetCmdAddr      ' send command (and address)
              or      outa,CEN                  ' set chip enable high again
XMM_FlashEraseBlock_ret
              ret
'
'
' XMM_FlashUnprotect : Unprotect the entire FLASH chip
'
XMM_FlashUnprotect
              mov     outx,#WRITE_BLKPROT       ' Command is Write ...
              call    #XMM_FlashOutQNibbles     ' ... Block-protection register
              mov     outx,#0                   ' write zeroes
              mov     XMM_Len,#6                ' 6 bytes for 2Mb, 10 for 4Mb
:loop
              call    #XMM_FlashOutQNibbles     ' write byte 
              djnz    XMM_Len,#:loop            ' repeat till all bytes sent
              or      outa,CEN                  ' set chip enable high again
XMM_FlashUnprotect_ret
              ret
'
'
' XMM_FlashWriteEnable : Enable Writing to the FLASH chip
'
XMM_FlashWriteEnable
              mov     outx,#WRITE_ENABLE        ' Command is Write-Enable
              call    #XMM_FlashOutQNibbles     ' send command 
              or      outa,CEN                  ' set chip enable high again
XMM_FlashWriteEnable_ret
              ret
'
'
' XMM_FlashWaitUntilDone : Wait until previous FLASH request complete
'
XMM_FlashWaitUntilDone
:loop
              mov     outx,#READ_STATUS         ' Command is Read-Status
              call    #XMM_FlashOutQNibbles     ' send command 
              call    #XMM_FlashInQByte         ' read byte 
              mov     XMM_Temp,outx             ' check ...
#ifdef QUAD_BITS_REVERSED
              and     XMM_Temp,#%0001_0000      ' ... BUSY bit
#else   
              and     XMM_Temp,#%1000_0000      ' ... BUSY bit
#endif                            
              or      outa,CEN                  ' set chip enable high again
              tjnz    XMM_Temp,#:loop           ' repeat until zero
XMM_FlashWaitUntilDone_ret
              ret
'
'
'XMM_FlashSetCmdAddr : Set FLASH command and address in SQI mode (Quad Mode). 
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
              call    #XMM_FlashOutQNibbles     ' send command 
              mov     outx,XMM_Addr
              shr     outx,#16
              call    #XMM_FlashOutQNibbles     ' send addr bits 23 .. 16
              mov     outx,XMM_Addr
              shr     outx,#8
              call    #XMM_FlashOutQNibbles     ' send addr bits 15 .. 8
              mov     outx,XMM_Addr
              call    #XMM_FlashOutQNibbles     ' send addr bits 7 .. 0
XMM_FlashSetCmdAddr_ret
              ret              
'
'
' XMM_FlashOutSByte - send 8 bits to the FLASHFLASH in SPI mode
' On entry: byte in outx (lower 8 bits)
' On exit: C flag destroyed!
'
XMM_FlashOutSByte
              andn    outa,IBIT               ' set IBIT low
              or      dira,IBIT               ' set IBIT to output
              andn    outa,CEN                ' set chip enable low
              mov     XMM_Temp,#8             ' 8 bits
              rol     outx,#24                ' put first bit in MSB
:bit              
              rol     outx,#1 wc
              muxc    outa,IBIT
              or      outa,CLK 
              andn    outa,CLK 
              djnz    XMM_Temp,#:bit
XMM_FlashOutSByte_ret
              ret              
'
'
' XMM_FlashInSByte - read 8 bits from the FLASH in SPI mode
' On exit: outx shifted left 8 bits, new byte in lower 8 bits
' On exit: none.
'
XMM_FlashInSByte
              andn    dira,OBIT               ' set OBIT to input
              mov     XMM_Temp,#8             ' 8 bits
:bit
              test    OBIT,ina wc
              rcl     outx, #1
              or      outa,CLK 
              andn    outa,CLK 
              djnz    XMM_Temp,#:bit      
XMM_FlashInSByte_ret
              ret
'
'
' WriteTemp - Write the data in the XMM_Temp register (in Quad Mode). The
'             data must already be positioned for writing.
'
' WriteTemp_Reverse - Same as above, but used when the FLASH data pins
'             (i.e. QSPI_SIO0 .. QSPI_SI3) are in reverse order.
'
' NOTE - THIS SEEMS LIKE A SILLY WAY TO DO IT - BUT ON SOME PLATFORMS WE
'        CAN ONLY CHANGE ONE PIN AT ONCE WHEN SENDING DATA TO THE FLASH
'        OR WE GET SPURIOUS CLOCK OUTPUTS. FOR EXAMPLE, THIS OCCURS ON
'        THE C3 IF THE FLASH CHIP IS USING PINS 17 .. 23 !!!
'
#ifdef QUAD_BITS_REVERSED
WriteTemp_Reverse
              test    XMM_Temp,QSPI_B0 wz
              muxnz   outa,QSPI_B3
              test    XMM_Temp,QSPI_B1 wz
              muxnz   outa,QSPI_B2
              test    XMM_Temp,QSPI_B2 wz
              muxnz   outa,QSPI_B1
              test    XMM_Temp,QSPI_B3 wz
              muxnz   outa,QSPI_B0
              jmp     #WriteTemp_Common
#endif
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
              or      outa,CLK 
              andn    outa,CLK 
WriteTemp_ret
WriteTemp_Reverse_ret
              ret
'
'
' XMM_FlashOutQNibbles - write 8 address bits to the FLASH in SQI mode 
'                     (i.e. Quad mode). If the FLASH has its pins reversed, 
'                     then we reverse each nibble (this doesn't matter for 
'                     data bytes, but it does matter for flash commands and 
'                     address bytes!)
' On entry: byte in outx (lower 8 bits)
' On exit: none.
'
XMM_FlashOutQNibbles
              or      dira,QBITS              ' set QBITS to output
              andn    outa,CEN                ' lower chip enable
              mov     XMM_Temp,outx
#ifdef QUAD_UPPER_NIBBLE_LEFT
#ifdef QUAD_BITS_REVERSED
              shl     XMM_Temp,#(Common#QSPI_SIO3-4) ' shift for output
              call    #WriteTemp_Reverse
#else   
              shl     XMM_Temp,#(Common#QSPI_SIO0-4) ' shift for output
              call    #WriteTemp
#endif              
#endif
#ifdef QUAD_UPPER_NIBBLE_RIGHT
#ifdef QUAD_BITS_REVERSED
              shr     XMM_Temp,#(4-Common#QSPI_SIO3) ' shift for output
              call    #WriteTemp_Reverse
#else   
              shr     XMM_Temp,#(4-Common#QSPI_SIO0) ' shift for output
              call    #WriteTemp
#endif              
#endif
              mov     XMM_Temp,outx
#ifdef QUAD_LOWER_NIBBLE_LEFT
#ifdef QUAD_BITS_REVERSED
              shl     XMM_Temp,#Common#QSPI_SIO3 ' shift for output
              call    #WriteTemp_Reverse
#else   
              shl     XMM_Temp,#Common#QSPI_SIO0 ' shift for output
              call    #WriteTemp
#endif
#else
#ifdef QUAD_BITS_REVERSED
              call    #WriteTemp_Reverse
#else   
              call    #WriteTemp
#endif
#endif

XMM_FlashOutQNibbles_ret
              ret              
'
'
' XMM_FlashOutQByte - write 8 bits to the FLASH in SQI mode (i.e. Quad mode)
' On entry: byte in outx (lower 8 bits)
' On exit: none.
'
XMM_FlashOutQByte
              or      dira,QBITS              ' set QBITS to output
              andn    outa,CEN                ' lower chip enable
              mov     XMM_Temp,outx
#ifdef QUAD_UPPER_NIBBLE_LEFT
#ifdef QUAD_BITS_REVERSED
              shl     XMM_Temp,#(Common#QSPI_SIO3-4) ' shift for output
#else   
              shl     XMM_Temp,#(Common#QSPI_SIO0-4) ' shift for output
#endif              
#endif
#ifdef QUAD_UPPER_NIBBLE_RIGHT
#ifdef QUAD_BITS_REVERSED
              shr     XMM_Temp,#(4-Common#QSPI_SIO3) ' shift for output
#else   
              shr     XMM_Temp,#(4-Common#QSPI_SIO0) ' shift for output
#endif              
#endif
              call    #WriteTemp
              
              mov     XMM_Temp,outx
#ifdef QUAD_LOWER_NIBBLE_LEFT
#ifdef QUAD_BITS_REVERSED
              shl     XMM_Temp,#Common#QSPI_SIO3 ' shift for output
#else   
              shl     XMM_Temp,#Common#QSPI_SIO0 ' shift for output
#endif
#endif
              call    #WriteTemp

XMM_FlashOutQByte_ret
              ret              
'
'
' ReadTemp - read the data to the XMM_Temp register (in Quad Mode). 
'
ReadTemp
              mov     XMM_Temp,ina
              and     XMM_Temp,QBITS
              or      outa,CLK 
              andn    outa,CLK 
ReadTemp_ret
              ret
'
'
' XMM_FlashInQByte - read 8 bits from the FLASH in SQI mode (i.e. Quad mode)
' On entry: none.
' On exit: byte in lower 8 bits of outx
'
XMM_FlashInQByte
              andn    dira,QBITS              ' set QBITS to input
              call    #ReadTemp
#ifdef QUAD_UPPER_NIBBLE_LEFT
#ifdef QUAD_BITS_REVERSED
              shr     XMM_Temp,#(Common#QSPI_SIO3-4) ' reverse shift for input
#else   
              shr     XMM_Temp,#(Common#QSPI_SIO0-4) ' reverse shift for input
#endif
#endif
#ifdef QUAD_UPPER_NIBBLE_RIGHT
#ifdef QUAD_BITS_REVERSED
              shl     XMM_Temp,#(4-Common#QSPI_SIO3) ' reverse shift for input
#else   
              shl     XMM_Temp,#(4-Common#QSPI_SIO0) ' reverse shift for input
#endif
#endif
              mov     outx,XMM_Temp
              call    #ReadTemp
#ifdef QUAD_LOWER_NIBBLE_LEFT
#ifdef QUAD_BITS_REVERSED
              shr     XMM_Temp,#Common#QSPI_SIO3 ' reverse shift for input
#else   
              shr     XMM_Temp,#Common#QSPI_SIO0 ' reverse shift for input
#endif
#endif
              or      outx,XMM_Temp
XMM_FlashInQByte_ret
              ret
'
#endif
'
#ifndef NO_RAM
'
'
'XMM_SetCmdAddr : Set QUAD SPI RAM command and address. 
'                 XMM_Activate should be called at least once before this 
'                 routine is used.
'On Entry:
'   outx     : Command
'   XMM_Addr : address to set (up to 24 bits, lower 2 bits not used)
'On Exit:
'   XMM_Addr : preserved
'   outx     : destroyed
'
XMM_SetCmdAddr
              call    #XMM_OutSByte             ' send command 
              mov     outx,XMM_Addr
              shr     outx,#10
              call    #XMM_OutSByte             ' send addr bits 17 .. 10
              mov     outx,XMM_Addr
              shr     outx,#2
              call    #XMM_OutSByte             ' send addr bits 9 .. 2
XMM_SetCmdAddr_ret
              ret              
'
'
' XMM_OutSByte - send 8 bits to the QUAD SPI RAM
' On entry: outx contains 8 bits to send
' On exit: outx destroyed, C flag destroyed
'
XMM_OutSByte
              'andn    outa,QBITS              ' set bits low
              or      dira,QBITS              ' set bits to output
              andn    outa,RCEN               ' set chip enable low
              mov     XMM_Temp,#8             ' 8 bits
              rol     outx,#24                ' put first bit in MSB
:bit              
              rol     outx,#1 wc
        if_c  or      outa,QBITS
        if_nc andn    outa,QBITS
              or      outa,RCLK 
              andn    outa,RCLK 
              djnz    XMM_Temp,#:bit
XMM_OutSByte_ret
              ret              
'
'
' XMM_OutSLong - send 32 bits to the QUAD SPI RAM
' On entry: outx contains 32 bits to send
' On exit: outx destroyed
'
' NOTE - THIS SEEMS LIKE A SILLY WAY TO DO IT - BUT ON SOME PLATFORMS WE
'        CAN ONLY CHANGE ONE PIN AT ONCE WHEN SENDING DATA TO THE SRAM
'        OR WE GET SPURIOUS CLOCK OUTPUTS. FOR EXAMPLE, THIS OCCURS ON
'        THE C3 IF THE SRAM CHIPS ARE USING PINS 17 .. 23 !!!
'
XMM_OutSLong
              or      dira,QBITS              ' set bits to output
              andn    outa,RCEN               ' set chip enable low
              mov     XMM_Temp,#8             ' 8 writes
#ifdef QUAD_BITS_REVERSED
              ror     outx,#(31-QSPI_SIO0)
#else
              ror     outx,#(31-QSPI_SIO3)
#endif   
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
              or      outa,RCLK 
              andn    outa,RCLK 
              djnz    XMM_Temp,#:bit
XMM_OutSLong_ret
              ret              
'
'
' XMM_InSLong - read 32 bits from the QUAD SPI RAM
' On entry: none.
' On exit: outx contains 32 bits
'
XMM_InSLong
              andn    dira,QBITS              ' set bits to input
              mov     XMM_Temp,#8             ' 8 reads
              mov     outx,#0
:bit
              mov     XMM_Tmp2,ina
              and     XMM_Tmp2,QBITS             
              rol     outx,#4
              or      outx,XMM_Tmp2
              or      outa,RCLK 
              andn    outa,RCLK 
              djnz    XMM_Temp,#:bit      
#ifdef QUAD_BITS_REVERSED
              ror     outx,#QSPI_SIO3
#else
              ror     outx,#QSPI_SIO0
#endif   
XMM_InSLong_ret
              ret
'
'
' XMM_WritePage : Write (program) bytes from Hub RAM to QUAD SPI RAM. Note that
'                 we can only read and write LONGs, so the Hub address should
'                 be long aligned, and the Len should be a multiple of 4 (this
'                 is guaranteed only if the CACHE is used, so this code MUST
'                 use the CACHE!)..
' On entry:
'    XMM_Addr  (32-bit): destination address in Flash
'    Hub_Addr  (32-bit): source address in main memory
'    XMM_Len   (32-bit): number of bytes to write 
'
XMM_WritePage
              mov     outx,#WRITE_SPI           ' Command is WRITE ...
              call    #XMM_SetCmdAddr           ' ... and Address (and lower CS)
:loop
              rdlong  outx,Hub_Addr             ' get long from Hub
              call    #XMM_OutSLong             ' write long to Quad SPI RAM
              add     Hub_Addr,#4               ' inc source address
              add     XMM_Addr,#4               ' inc dest address
              sub     XMM_Len,#4 wz,wc          ' repeat ...
         if_a jmp     #:loop                    ' ... while XMM_Len > 0
              or      outa,RCEN                 ' set chip enable high again
XMM_WritePage_ret
              ret
'
' XMM_ReadPage : Read bytes from QUAD SPI RAM to Hub RAM. Note that we can only 
'                read and write LONGs, so the Hub address should be long 
'                aligned, and the Len should be a multiple of 4 ( (this
'                is guaranteed only if the CACHE is used, so this code MUST
'                use the CACHE!).
' On Entry: 
'    XMM_Addr  (32-bit): source address in Flash
'    Hub_Addr  (32-bit): destination address in main memory
'    XMM_Len   (32-bit): number of bytes to read 
'
XMM_ReadPage
              mov     outx,#READ_SPI            ' Command is READ ...
              call    #XMM_SetCmdAddr           ' ... and Address (and lower CS)
:loop
              call    #XMM_InSLong              ' read long from Quad SPI RAM
              wrlong  outx,Hub_Addr             ' write long to Hub
              add     Hub_Addr,#4               ' inc dest address
              add     XMM_Addr,#4               ' inc src address
              sub     XMM_Len,#4 wz,wc          ' repeat ...
         if_a jmp     #:loop                    ' ... while XMM_Len > 0
              or      outa,RCEN                 ' set chip enable high again
XMM_ReadPage_ret
              ret
'
#else
'
'
' No RAM Support - but we still need dummy XMM_ReadPage and XMM_WritePage 
'                  routines to allow the code to compile.
'
XMM_ReadPage
XMM_WritePage
              nop
XMM_ReadPage_ret
XMM_WritePage_ret
              ret
#endif
'
'
' XMM variables
'
outx          long    $0
'
XMM_Quad      long    $0
XMM_Flags     long    $0
XMM_Temp      long    $0
'
#ifndef NO_RAM
XMM_Tmp2      long    $0
#endif
'
'     
' FLASHPOINT (SuperQuad and RamPage) Hardware Access:
'
#ifdef QUAD_POWER_PINS

' define pin that must be powered (QSPI_VDD)

POWER         long    (|<Common#QSPI_VDD)

' include power and ground pins (QSPI_VDD and QSPI_VSS) in DIRN

#ifndef NO_RAM
DIRN          long    (|<Common#QSPI_VDD) | (|<Common#QSPI_CEN) | (|<Common#QSPI_SCK) | (|<Common#QSPI_VSS) | (|<Common#QSPI_RCEN) | (|<Common#QSPI_RSCK)
NONPOWER      long    (|<Common#QSPI_CEN) | (|<Common#QSPI_SCK) | (|<Common#QSPI_RCEN) | (|<Common#QSPI_RSCK) | (|<Common#QSPI_SIO0) | (|<Common#QSPI_SIO1) | (|<Common#QSPI_SIO2) | (|<Common#QSPI_SIO3) 
#else
DIRN          long    (|<Common#QSPI_VDD) | (|<Common#QSPI_CEN) | (|<Common#QSPI_SCK) | (|<Common#QSPI_VSS)
NONPOWER      long    (|<Common#QSPI_CEN) | (|<Common#QSPI_SCK) | (|<Common#QSPI_SIO0) | (|<Common#QSPI_SIO1) | (|<Common#QSPI_SIO2) | (|<Common#QSPI_SIO3) 
#endif

#else

' don't need to worry about conrolling power and ground pins

#ifndef NO_RAM
DIRN          long    (|<Common#QSPI_CEN) | (|<Common#QSPI_SCK) | (|<Common#QSPI_RCEN) | (|<Common#QSPI_RSCK)
NONPOWER      long    (|<Common#QSPI_CEN) | (|<Common#QSPI_SCK) | (|<Common#QSPI_RCEN) | (|<Common#QSPI_RSCK) | (|<Common#QSPI_SIO0) | (|<Common#QSPI_SIO1) | (|<Common#QSPI_SIO2) | (|<Common#QSPI_SIO3) 
#else
DIRN          long    (|<Common#QSPI_CEN) | (|<Common#QSPI_SCK) 
NONPOWER      long    (|<Common#QSPI_CEN) | (|<Common#QSPI_SCK) | (|<Common#QSPI_SIO0) | (|<Common#QSPI_SIO1) | (|<Common#QSPI_SIO2) | (|<Common#QSPI_SIO3) 
#endif

#endif


OBIT          long    (|<Common#SSPI_SO)
IBIT          long    (|<Common#SSPI_SI)
QBITS         long    (|<Common#QSPI_SIO0) | (|<Common#QSPI_SIO1) | (|<Common#QSPI_SIO2) | (|<Common#QSPI_SIO3)
CLK           long    (|<Common#QSPI_SCK)
CEN           long    (|<Common#QSPI_CEN)
'
#ifndef NO_RAM
RCLK          long    (|<Common#QSPI_RSCK)
RCEN          long    (|<Common#QSPI_RCEN)
#endif
'
QSPI_B0       long    |< Common#QSPI_SIO0
QSPI_B1       long    |< Common#QSPI_SIO1
QSPI_B2       long    |< Common#QSPI_SIO2
QSPI_B3       long    |< Common#QSPI_SIO3
'
LED_BIT       long    |< Common#DEBUG_PIN ' only used when when testing
'
'-------------------- End of FLASHPOINT XMM Support Routines -------------------
'
