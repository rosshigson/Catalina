{
'---------------------- RAMPAGE2 XMM Support Routines ------------------------
'
' This module implements XMM FLASH and SRAM support for the RAMPAGE2 board. 
'
' IMPORTANT NOTES: 
'
'  1. This board requires the CHIP_ERASE option be used when building the load
'     utilities. This is normally added by the CFG file - you don't need to 
'     specify it manually. This is because the BLOCK_ERASE actually erases
'     8k of FLASH, not 4K as the loader generally expects.
'
'  2. This board requires that the Catalina RAM Test program be built with the
'     NO_OVERLAP option. This is normally added by the CFG file - you don't 
'     need to specify it manually. This is because the RamPage2 board works in
'     words, not bytes and therefore cannot cope with a page size which is not 
'     an even number. Catalina generally allocates page sizes of 256 or 512 
'     bytes, so for most purposes this is not a problem - it only affects the 
'     RAM Test program.
'
'  3. Currently, you must use the CACHED driver due to the size of the XMM 
'     access code. 
'
'  4. Define the PARANOID_IO symbol to only toggle one pin at a time - this is
'     required on some platforms (such as the C3) to avoid spurious clock 
'     outputs:
'
'#define PARANOID_IO
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
#include "RP2_XMM_DEF.inc"
'
' FLASH commands:
'
PAGE_PROGRAM  = $02
READ_STATUS   = $05
WRITE_ENABLE  = $06
WRITE_DISABLE = $04
HI_SPEED_READ = $0B
CHIP_ERASE    = $C7
SECTOR_ERASE  = $20
WRITE_BLKPROT = $42
'
' FLASH JEDEC IDs:
'
JDEC_ID_SPI   = $9F
JDEC_ID_SQI   = $AF
'
' SRAM commands:
'
WRITE_SEQ     = $02
READ_SEQ      = $03
WRITE_ST_CMD  = $01
READ_ST_CMD   = $05
'
' Common (SRAM and FLASH) commands:
'
QUAD_ENABLE   = $38
QUAD_RESET    = $FF
'
' These can be enabled to include various tests, but they
' should not be left enabled after testing as they make 
' the code too large:
'
'#define TEST_MODE
'#define TEST_SPI_JDEC
'#define TEST_SQI_JDEC
'#define TEST_RINIT
'#define TEST_RW
'#define TEST_DATA
'#define TEST_ADDR
'#define TEST_WRITE
'
DAT
'
'
' XMM_Activate : Activate the XMM bus. 
' XMM_FlashActivate : activate FLASH bus (equivalent to XMM_Activate for FLASH).
'
XMM_Activate
XMM_FlashActivate
              tjnz    XMM_Quad,#:in_quad_mode   ' do nothing if we are already in quad mode
              mov     outa,ALL_BITS             ' set all output pins high
              or      dira,ALL_BITS             ' set all pins to output
'
              mov     outx,#QUAD_RESET          ' set command to Reset Quad I/O
              mov     oute,SRAM_EN              ' enable SRAM
              or      oute,FLASH_EN             ' enable FLASH
              call    #XMM_OutSByte             ' send command
              or      outa,oute                 ' set chip enable(s) high
'
              mov     XMM_Temp,cnt              ' wait ...
              add     XMM_Temp,delay_time       ' ... 100 ...
              waitcnt XMM_Temp,#0               ' ... msec
'
#ifdef TEST_MODE
' don't normally need this codem since sequential data access is the default after reset
              mov     outx,#WRITE_ST_CMD        ' command is write status
              mov     oute,SRAM_EN              ' enable SRAM
              call    #XMM_OutSByte
              mov     outx,#%01000000           ' seq data access
              call    #XMM_OutSByte
              or      outa,oute                 ' set chip enable high
#endif
'              
#ifdef TEST_RINIT
#ifndef IN_S_BYTE
#define IN_S_BYTE
#endif
#ifndef TEST_LED
#define TEST_LED
#endif
              mov     outx,#READ_ST_CMD         ' command is read status
              mov     oute,SRAM_EN              ' enable SRAM
              call    #XMM_OutSByte
              call    #XMM_InSByte              ' get status of SRAM chips
              or      outa,oute                 ' set chip enable high
              cmp     outx,RINIT_RSLT wz
     if_z     jmp     #:test_ri_ok
:test_ri_err              
              or      dira,LED_BIT
              or      outa,LED_BIT
              jmp     #:test_ri_err
:test_ri_ok              
'
#endif
'
#ifdef TEST_SPI_JDEC
'
#ifndef IN_S_BYTE
#define IN_S_BYTE
#endif
#ifndef TEST_LED
#define TEST_LED
#endif
#define JDEC_SPI_RESPONSE   
              mov     outx,#JDEC_ID_SPI
              mov     oute,FLASH_EN             ' enable FLASH
              call    #XMM_OutSByte
              call    #XMM_InSByte
              cmp     outx,JDEC_ID_S1 wz
     if_nz    jmp     #:spi_jdec_error
              call    #XMM_InSByte
              cmp     outx,JDEC_ID_S2 wz
     if_nz    jmp     #:spi_jdec_error
              call    #XMM_InSByte
              cmp     outx,JDEC_ID_S3 wz
     if_z     jmp     #:spi_jdec_ok
:spi_jdec_error              
              or      dira,LED_BIT
              or      outa,LED_BIT
              jmp     #:spi_jdec_error
:spi_jdec_ok     
              or      outa,oute                 ' set chip enable high
'              
#endif
'
              mov     outx,#QUAD_ENABLE         ' command to Enable Quad I/O
              mov     oute,FLASH_EN             ' enable FLASH
              or      oute,SRAM_EN              ' enable SRAM
              call    #XMM_OutSByte             ' send command
              or      outa,oute                 ' set chip enable(s) high
'              
#ifdef TEST_SQI_JDEC
#ifndef IN_S_BYTE
#define IN_S_BYTE
#endif
#ifndef TEST_LED
#define TEST_LED
#endif
#define JDEC_SQI_RESPONSE   
              mov     outx,#JDEC_ID_SQI
              mov     oute,FLASH_EN             ' enable FLASH
              call    #XMM_OutQNibbles
              call    #XMM_InByte
              cmp     outx,JDEC_ID_Q1 wz
     if_nz    jmp     #:sqi_jdec_error
              call    #XMM_InByte
              cmp     outx,JDEC_ID_Q2 wz
     if_nz    jmp     #:sqi_jdec_error
              call    #XMM_InByte
              cmp     outx,JDEC_ID_Q3 wz
     if_nz    jmp     #:sqi_jdec_error
              call    #XMM_InByte
              cmp     outx,JDEC_ID_Q4 wz
     if_nz    jmp     #:sqi_jdec_error
              call    #XMM_InByte
              cmp     outx,JDEC_ID_Q5 wz
     if_nz    jmp     #:sqi_jdec_error
              call    #XMM_InByte
              cmp     outx,JDEC_ID_Q6 wz
     if_z     jmp     #:sqi_jdec_ok
:sqi_jdec_error              
              or      dira,LED_BIT
              or      outa,LED_BIT
              jmp     #:sqi_jdec_error
:sqi_jdec_ok     
              or      outa,oute                 ' set chip enable high
#endif
'
#ifdef TEST_RW
'        
#ifndef IN_LONG   
#define IN_LONG
#endif
#ifndef OUT_LONG
#define OUT_LONG
#endif
#ifndef TEST_LED
#define TEST_LED
#endif
'
              mov     outc,#WRITE_SEQ           ' command is Write-sequential
              mov     XMM_Addr,TEST_RW_ADDR
              mov     oute,SRAM_EN              ' enable SRAM
              call    #XMM_SetCmdAddr
              mov     outx,TEST_RW_VAL
              call    #XMM_OutLong
              or      outa,oute                 ' set chip enable high
'
              mov     outc,#WRITE_SEQ           ' command is Write-sequential
              mov     XMM_Addr,TEST_RW_ADDR2
              mov     oute,SRAM_EN              ' enable SRAM
              call    #XMM_SetCmdAddr
              mov     outx,TEST_RW_VAL2
              call    #XMM_OutLong
              or      outa,oute                 ' set chip enable high
'
              mov     outc,#READ_SEQ            ' command is Read-sequential
              mov     XMM_Addr,TEST_RW_ADDR
              call    #XMM_SetCmdAddr
              call    #XMM_InWord               ' first byte read is a dummy byte
              call    #XMM_InLong
              or      outa,oute                 ' set chip enable high
              cmp     outx,TEST_RW_VAL wz
'              
     if_nz    jmp     #:test_rw_err
              mov     outc,#READ_SEQ            ' command is Read-sequential
              mov     XMM_Addr,TEST_RW_ADDR2
              call    #XMM_SetCmdAddr
              call    #XMM_InWord               ' first byte read is a dummy byte
              call    #XMM_InLong
              or      outa,oute                 ' set chip enable high
              cmp     outx,TEST_RW_VAL2 wz
'
     if_z     jmp     #:test_rw_ok
:test_rw_err     
              or      dira,LED_BIT
              or      outa,LED_BIT
              jmp     #:test_rw_err
:test_rw_ok              
'
#endif
'
              neg     XMM_Quad,#1               ' remember we are in quad mode
              jmp     #XMM_Activate_ret
:in_quad_mode
              or      dira,ALL_BITS             ' set all pins to output
XMM_Activate_ret
XMM_FlashActivate_ret
              ret
'
#ifdef JDEC_SPI_RESPONSE   
JDEC_ID_S1    long    $BFBF
JDEC_ID_S2    long    $2626
JDEC_ID_S3    long    $0101
#endif
'
#ifdef JDEC_SQI_RESPONSE   
JDEC_ID_Q1    long    $BB
JDEC_ID_Q2    long    $FF
JDEC_ID_Q3    long    $22
JDEC_ID_Q4    long    $66
JDEC_ID_Q5    long    $00
JDEC_ID_Q6    long    $11
#endif
'
#ifdef TEST_RINIT
RINIT_RSLT    long    %0100_0000_0100_0000
#endif
'
#ifdef TEST_RW
TEST_RW_ADDR   long    $1f000
TEST_RW_ADDR2  long    $1f004
TEST_RW_VAL    long    $DEADBEEF
TEST_RW_VAL2   long    $12345678
#endif
'
'
delay_time    long   Common#CLOCKFREQ/10 ' 100 msec
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
              andn    dira,ALL_BITS             ' set all pins to input
XMM_FlashTristate_ret
XMM_Tristate_ret
              ret
'
#ifdef NEED_FLASH
'
'
' XMM_FlashWritePage : Write (program) bytes from Hub RAM to FLASH
' On entry:
'    XMM_Addr  (32-bit): destination address in Flash - must be EVEN
'    Hub_Addr  (32-bit): source address in main memory
'    XMM_Len   (32-bit): number of bytes to write - must be EVEN
'
XMM_FlashWritePage
              shr     XMM_Len,#1                ' words, not bytes
#ifdef TEST_WRITE
              or      dira,LED_BIT
              andn    outa,LED_BIT
#endif   
              mov     outc,#PAGE_PROGRAM        ' Command is Page-Program ...
              call    #XMM_FlashSetCmdAddr      ' ... and Address (and lower CS)
:loop
              rdword  outx,Hub_Addr             ' get byte from Hub
              call    #XMM_OutWord
              add     Hub_Addr,#2               ' inc source address
              add     XMM_Addr,#2               ' inc dest address
              djnz    XMM_Len,#:loop            ' repeat while XMM_len <> 0
              jmp     #XMM_FlashDisable
'
'
' XMM_FlashReadPage : Read bytes from FLASH to Hub RAM.
' On Entry: 
'    XMM_Addr  (32-bit): source address in Flash
'    Hub_Addr  (32-bit): destination address in main memory
'    XMM_Len   (32-bit): number of bytes to read 
'
XMM_FlashReadPage
              mov     oute,FLASH_EN             ' use FLASH
              jmp     #XMM_ReadPage_Loop
'
'
' XMM_FlashCheckEmpty : Check bytes from FLASH are all $FF.
' On Entry: 
'    XMM_Addr  (32-bit): source address in Flash - must be EVEN
'    XMM_Len   (32-bit): number of bytes to read - must be EVEN
' On Exit:
'    Z flag set if all empty, Z flag reset on fail (and failed byte in outx)
'
' XMM_FlashComparePage : Compare bytes from FLASH with Hub RAM.
' On Entry: 
'    XMM_Addr  (32-bit): source address in Flash - MUST BE EVEN
'    Hub_Addr  (32-bit): destination address in main memory
'    XMM_Len   (32-bit): number of bytes to read - MUST BE EVEN
' On Exit:
'    Z flag set if all the same, Z flag reset on fail (and failed byte in outx)
'
XMM_FlashCheckEmpty
              mov     XMM_Tmp5,#1
              jmp     #XMM_CheckOrCompare
XMM_FlashComparePage
              mov     XMM_Tmp5,#0
XMM_CheckOrCompare              
              shr     XMM_Len,#1                ' words, not bytes
              mov     outc,#HI_SPEED_READ       ' Command is High-Speed Read
              call    #XMM_FlashSetCmdAddr      ' send command and address
              call    #XMM_InWord               ' first byte read is a dummy byte
:loop
              call    #XMM_InWord               ' read byte from SQI
              tjz     XMM_Tmp5,#:hub            ' are we comparing with Hub or null?
:null              
              and     outx,NullWord             ' compare ...
              cmp     outx,NullWord wz          ' ... with null
              jmp     #:test
:hub      
              rdword  XMM_Temp,Hub_Addr         ' compare ...
              cmp     XMM_Temp,outx wz          ' ... with hub
:test              
      if_nz   jmp     #XMM_FlashDisable         ' return with Z clr
              add     XMM_Addr,#2               ' inc src address
              add     Hub_Addr,#2               ' inc dest address
              djnz    XMM_Len,#:loop wz         ' repeat if XMM_len <> 0, or return with Z set
XMM_FlashDisable
              or      outa,oute                 ' set chip enable high again
XMM_FlashWritePage_ret
XMM_FlashEraseBlock_ret
XMM_FlashComparePage_ret
XMM_FlashCheckEmpty_ret
XMM_FlashUnprotect_ret
XMM_FlashEraseChip_ret
XMM_FlashWriteEnable_ret
              ret
'
NullWord      long    $0000FFFF
'
'
' XMM_FlashEraseBlock : Erase a 4k block of the FLASH chip
'
XMM_FlashEraseBlock
              mov     outc,#SECTOR_ERASE        ' Command is Sector-Erase
              call    #XMM_FlashSetCmdAddr      ' send command (and address)
              jmp     #XMM_FlashDisable
'
'
' XMM_FlashUnprotect : Unprotect the entire FLASH chip
'
XMM_FlashUnprotect
              mov     oute,FLASH_EN             ' enable FLASH
              mov     outx,#WRITE_BLKPROT       ' Command is Write ...
              call    #XMM_OutQNibbles          ' ... Block-protection register
              mov     outx,#0                   ' write zeroes
              mov     XMM_Len,#6                ' 6 bytes for 2Mb, 10 for 4Mb
:loop
              call    #XMM_OutQNibbles          ' send byte to FLASH
              djnz    XMM_Len,#:loop            ' repeat till all bytes sent
              jmp     #XMM_FlashDisable
'
'
' XMM_FlashEraseChip : Erase the whole FLASH chip
'
XMM_FlashEraseChip
              mov     oute,FLASH_EN             ' enable FLASH
              mov     outx,#CHIP_ERASE          ' Command is Chip-Erase
              jmp     #XMM_FlashNibbleCmd
'
'
' XMM_FlashWriteEnable : Enable Writing to the FLASH chip
'
XMM_FlashWriteEnable
              mov     oute,FLASH_EN             ' enable FLASH
              mov     outx,#WRITE_ENABLE        ' Command is Write-Enable
XMM_FlashNibbleCmd              
              call    #XMM_OutQNibbles          ' send command 
              jmp     #XMM_FlashDisable
'
'
' XMM_FlashWaitUntilDone : Wait until previous FLASH request complete
'
XMM_FlashWaitUntilDone
              mov     oute,FLASH_EN             ' enable FLASH
:loop
              mov     outx,#READ_STATUS         ' Command is Read-Status
              call    #XMM_OutQNibbles          ' send command 
              call    #XMM_InByte               ' read byte from FLASH
              and     outx,#%1000_0000          ' check BUSY bit
              or      outa,oute                 ' set chip enable high again
              tjnz    outx,#:loop               ' repeat until zero
XMM_FlashWaitUntilDone_ret
              ret
#endif
'
'
' XMM_OutSByte - send 8 bits to the FLASH or SRAM chips (or both) in SPI mode
' On entry : byte in outx (lower 8 bits)
'            chip enable mask in oute (i.e. FLASH_EN, SRAM_EN or both)
' On exit  : C flag destroyed!
'
XMM_OutSByte
              andn    outa,MOSI_BITS            ' set MOSI_BITS low
              or      dira,MOSI_BITS            ' set MOSI_BITS to output
              andn    outa,oute                 ' set chip enable(s) low
              mov     XMM_Temp,#8               ' 8 bits
              rol     outx,#24                  ' put first bit in MSB
:loop              
              rol     outx,#1 wc
              muxc    outa,MOSI_BITS
              or      outa,CLK 
              andn    outa,CLK 
              djnz    XMM_Temp,#:loop
XMM_OutSByte_ret
              ret              

#ifdef IN_S_BYTE
'
'
' XMM_InSByte - read one byte (8 bits) from each enabled chip in SPI mode 
' On entry : none.
' On exit  : two bytes (one from each chip) in lower 16 bits
'
XMM_InSByte
              andn    dira,MISO_BITS            ' set MISO_BITS to input
              mov     XMM_Temp,#8               ' 8 bits
              mov     outx,#0
:loop
              shl     outx,#1
              test    MISO_1,ina wc
              muxc    outx,#$100
              test    MISO_2,ina wc
              muxc    outx,#$1
              or      outa,CLK 
              andn    outa,CLK 
              djnz    XMM_Temp,#:loop     
XMM_InSByte_ret
              ret
'
#endif              
'
'
' XMM_OutByte - Write the lower 8 bits of the outx register (XMM_Temp destroyed).
' On entry : outx contains data to write in lower 8 bits (top 24 bits ignored)
' On exit  : XMM_Temp destroyed
'
XMM_OutByte
              or      dira,DATA_BITS            ' set DATA_BITS to output
              mov     XMM_Temp,outx
#ifdef SHIFT_DATA
              shl     XMM_Temp,#(Common#SIO0_PIN) ' shift for output
#endif
'
#ifdef PARANOID_IO
'   
' NOTE - THIS SEEMS LIKE A SILLY WAY TO DO IT - BUT ON SOME PLATFORMS WE
'        CAN ONLY CHANGE ONE PIN AT ONCE WHEN SENDING DATA TO THE FLASH
'        OR WE GET SPURIOUS CLOCK OUTPUTS. FOR EXAMPLE, THIS OCCURS ON
'        THE C3 IF THE FLASH CHIP IS USING PINS 17 .. 23 !!!
'
              test    XMM_Temp,DBIT_0 wz
        if_z  andn    outa,DBIT_0
        if_nz or      outa,DBIT_0
              test    XMM_Temp,DBIT_1 wz
        if_z  andn    outa,DBIT_1
        if_nz or      outa,DBIT_1
              test    XMM_Temp,DBIT_2 wz
        if_z  andn    outa,DBIT_2
        if_nz or      outa,DBIT_2
              test    XMM_Temp,DBIT_3 wz
        if_z  andn    outa,DBIT_3
        if_nz or      outa,DBIT_3
              test    XMM_Temp,DBIT_4 wz
        if_z  andn    outa,DBIT_4
        if_nz or      outa,DBIT_4
              test    XMM_Temp,DBIT_5 wz
        if_z  andn    outa,DBIT_5
        if_nz or      outa,DBIT_5
              test    XMM_Temp,DBIT_6 wz
        if_z  andn    outa,DBIT_6
        if_nz or      outa,DBIT_6
              test    XMM_Temp,DBIT_7 wz
        if_z  andn    outa,DBIT_7
        if_nz or      outa,DBIT_7
#else
              andn    outa,DATA_BITS
              and     XMM_Temp,DATA_BITS
              or      outa,XMM_temp
#endif
              or      outa,CLK 
              andn    outa,CLK 
XMM_OutByte_ret
              ret
'              
'
' XMM_OutWord - write the lower 16 bits of the outx register
' On entry : outx contains data to write in lower 16 bits (top 16 bits ignored)
' On exit  : XMM_Temp destroyed
'
XMM_OutWord
              call    #XMM_OutByte
              ror     outx,#8
              call    #XMM_OutByte
              rol     outx,#8
XMM_OutWord_ret
              ret              
'
#ifdef OUT_LONG
'
'
' XMM_OutLong - send 32 bits to the SRAM
' On entry : outx contains data to write
' On exit  : XMM_Temp destroyed
'
XMM_OutLong
              call    #XMM_OutWord
              ror     outx,#16
              call    #XMM_OutWord
              rol     outx,#16
XMM_OutLong_ret
              ret              
'
#endif
'
'
' XMM_OutQNibbles - write 8 bits in SQI mode as two pairs of nibbles
'
' On entry : outx contains data to write in lower 8 bits (top 24 bits ignored)
'            chip enable mask in oute (i.e. FLASH_EN, SRAM_EN or both)
' On exit  : XMM_Temp, XMM_Tmp2 destroyed
'
XMM_OutQNibbles
              andn    outa,oute                 ' lower chip enable(s)
              mov     XMM_Tmp2,outx             ' save outx
              shr     outx,#4                   ' duplicate ...
              and     outx,#$F                  ' ...
              mov     XMM_Temp,outx             ' ... first ...
              shl     XMM_Temp,#4               ' ...
              or      outx,XMM_Temp             ' ... nibble
              call    #XMM_OutByte              ' send it
              mov     outx,XMM_Tmp2             ' duplicate ... 
              and     outx,#$F                  ' ...           
              mov     XMM_Temp,outx             ' ... second ... 
              shl     XMM_Temp,#4               ' ...           
              or      outx,XMM_Temp             ' ... nibble    
              call    #XMM_OutByte              ' send it
              mov     outx,XMM_Tmp2             ' restore outx
XMM_OutQNibbles_ret
              ret              
'
'
' XMM_InByte - read 8 bits from the FLASH or SRAM in SQI mode
' On entry : none.
' On exit  : outx contains data read in lower 8 bits (top 24 bits undisturbed)
'
XMM_InByte
              andn    dira,DATA_BITS            ' set DATA_BITS to input
              mov     XMM_Temp,ina
              and     XMM_Temp,DATA_BITS
              or      outa,CLK 
              andn    outa,CLK 
#ifdef SHIFT_DATA
              shr     XMM_Temp,#(Common#SIO0_PIN) ' reverse shift for input
#endif
              andn    outx,#$FF
              or      outx,XMM_Temp
XMM_InByte_ret
              ret
'
'
' XMM_InWord - read 16 bits in SQI mode
' On entry : none.
' On exit  : outx contains data read in lower 16 bits (top 16 bits undisturbed)
'
XMM_InWord
              call    #XMM_InByte
              ror     outx,#8
              call    #XMM_InByte
              rol     outx,#8
XMM_InWord_ret
              ret
'
#ifdef IN_LONG
'
'
' XMM_InLong - read 32 bits in SQI mode.
' On entry: none.
' On exit: outx contains 32 bits read
'
XMM_InLong
              call    #XMM_InWord
              ror     outx,#16
              call    #XMM_InWord
              rol     outx,#16
XMM_InLong_ret
              ret
'
#endif              
'
#ifdef NEED_FLASH
'
'
'XMM_FlashSetCmdAddr : Set FLASH command and address in SQI mode (Quad Mode). 
'                      XMM_Activate should be called at least once before this 
'                      routine is used.
'On Entry:
'   outc     : Command to send (lower 8 bits)
'   XMM_Addr : address to set (up to 24 bits)
'On Exit:
'   XMM_Addr : preserved
'   outc     : preserved
'   outx     : destroyed
'
XMM_FlashSetCmdAddr
              mov     oute,FLASH_EN             ' enable FLASH
                                                ' fall through to ...
#endif                                                
'
'XMM_SetCmdAddr : Set SRAM command and address. 
'                 XMM_Activate should be called at least once before this 
'                 routine is used.
'On Entry:
'   outc     : Command to send (lower 8 bits)
'   oute     : chip enable mask (i.e. FLASH_EN, SRAM_EN or both)
'   XMM_Addr : address to send in lower 24 bits (top 8 bits ignored). 
'              NOTE : THE ADDRESS IS DIVIDED BY TWO!!!
'On Exit:
'   XMM_Addr : preserved
'   outx     : destroyed
'
XMM_SetCmdAddr
              mov     outx,outc                 ' send ...
              call    #XMM_OutQNibbles          ' ... command 
              mov     outx,XMM_Addr
              ror     outx,#17                  ' NOTE DIVIDE BY TWO TO GET WORD ADDRESS !!!
              call    #XMM_OutQNibbles          ' send addr bits 23 .. 17
              rol     outx,#8
              call    #XMM_OutQNibbles          ' send addr bits 16 .. 9
              rol     outx,#8
              call    #XMM_OutQNibbles          ' send addr bits 8 .. 1
XMM_FlashSetCmdAddr_ret
XMM_SetCmdAddr_ret
              ret              
'
' XMM_ReadWord : read a single word from SRAM or FLASH and then terminate read 
' On Entry:
'   XMM_Addr : word address in Flash (24 bits) - lower bit is ignored
'   oute     : chip enable mask (i.e. FLASH_EN or SRAM_EN)
' On Exit:
'   outx     : word read
'
XMM_ReadWord
              cmp     oute,FLASH_EN wz          ' set up correct ...
        if_z  mov     outc,#HI_SPEED_READ       ' ... read command ... 
        if_nz mov     outc,#READ_SEQ            ' ... to use
              call    #XMM_SetCmdAddr           ' send command and address
              call    #XMM_InWord               ' first byte read is a dummy byte
              call    #XMM_InByte               ' read lower byte ...
              ror     outx,#8                   ' ... then ...
              call    #XMM_InByte               ' ... read ...
              rol     outx,#8                   ' ... upper byte
              or      outa,oute                 ' set chip enable high again
XMM_ReadWord_ret
              ret
'
'
' XMM_WriteByte : write a single byte to SRAM or FLASH and then terminate write
' On Entry:
'   XMM_Addr : byte address in Flash (24 bits)
'   outx     : byte to write
'   oute     : chip enable mask (i.e. FLASH_EN or SRAM_EN)
'
XMM_WriteByte
              mov     XMM_Tmp3,outx             ' save byte to be written
              call    #XMM_ReadWord             ' read the word containing the byte
              mov     XMM_Temp,XMM_Tmp3         ' isolate ...
              and     XMM_Temp,#$FF             ' ... byte to be written
              test    XMM_Addr,#1 wz            ' is address even?
        if_z  andn    outx,#$FF                 ' yes - replace lower byte
        if_nz and     outx,#$FF                 ' no - replace ...
        if_nz shl     XMM_Temp,#8               ' ... upper byte
              or      outx,XMM_Temp             ' combine bytes
'
' XMM_WriteWord : write a single word to SRAM or FLASH and then terminate write
' On Entry:
'   XMM_Addr : word address in Flash (24 bits) - lower bit is ignored
'   outx     : word to write
'   oute     : chip enable mask (i.e. FLASH_EN or SRAM_EN)
' On Exit:
'
XMM_WriteWord
              mov     outc,#WRITE_SEQ           ' command is Write-sequential
              mov     XMM_Tmp4,outx             ' save outx
              call    #XMM_SetCmdAddr           ' send command and address
              mov     outx,XMM_Tmp4             ' restore outx
              call    #XMM_OutWord              ' write word
              or      outa,oute                 ' set chip enable high again
XMM_WriteByte_ret
XMM_WriteWord_ret
              ret
'
'
' XMM_ReadByte : read a single byte from SRAM or FLASH and then terminate read 
' On Entry:
'   XMM_Addr : byte address in Flash (24 bits)
'   oute     : chip enable mask (i.e. FLASH_EN or SRAM_EN)
' On Exit:
'    outx    : byte read
'
XMM_ReadByte
              call    #XMM_ReadWord             ' read the word
              test    XMM_Addr,#1 wz            ' is address even?
        if_nz shr     outx,#8                   ' yes - return upper byte
              and     outx,#$FF                 ' no - return lower byte
XMM_ReadByte_ret
              ret
'
#ifdef NEED_XMM_READLONG              
'
' XMM_ReadLong : Read long from XMM at address in XMM_Addr into the destination register
'                set up in XMM_Dest. XMM_Activate should be called at least once before
'                this routine is used.
' On entry:
'    XMM_Addr : address to read - MUST BE CORRECTLY ALIGNED
'    XMM_Dst  : destination of this instruction set to destination register
' On exit:
'    XMM_Addr incremented by 4.
'    Destination register contains long read from XMM.
'
'
' XMM_ReadMult : Read multiple bytes in source register to XMM at address XMM_Addr.
'                XMM_Activate should be called at least once before this routine is used.
' On entry:
'    XMM_Addr : address to read - MUST BE CORRECTLY ALIGNED
'    XMM_Dst  : destination of this instruction set to destination register
'    XMM_Len  : number of bytes to read (1, 2 or 4)
' On exit:
'    XMM_Addr incremented by XMM_Len.
'    Destination register contains bytes read from XMM.
'
XMM_ReadLong
              mov     XMM_Len,#4                ' read 4 bytes
XMM_ReadMult
              mov     XMM_Tmp6,#0               '
              mov     XMM_Tmp5,#32              ' set up number of bits to shift result
              mov     oute,SRAM_EN              ' use SRAM
:ReadLoop
              call    #XMM_ReadByte             ' read byte
              or      XMM_Tmp6,outx
              ror     XMM_Tmp6,#8
              sub     XMM_Tmp5,#8               ' update number of bits to shift result 
              add     XMM_Addr,#1               ' inc address
              djnz    XMM_Len,#:ReadLoop        ' repeat while XMM_len <> 0
              ror     XMM_Tmp6,XMM_Tmp5         ' shift bytes into final position
XMM_Dst       mov     0-0,XMM_Tmp6              ' save the result
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
'    XMM_Addr : (32-bit) address to write - MUST BE CORRECTLY ALIGNED
'    XMM_Src  : source of this instruction set to source register
' On exit:
'    XMM_Addr incremented by 4.
'
'
' XMM_WriteMult : Write multiple bytes in source register to XMM at address XMM_Addr.
'                 XMM_Activate should be called at least once before this routine is used.
' On entry:
'    XMM_Addr : address to write - MUST BE CORRECTLY ALIGNED
'    XMM_Src  : source of this instruction set to source register
'    XMM_Len  : number of bytes to write (1, 2 or 4)
' On exit:
'    XMM_Addr incremented by XMM_Len.
'
XMM_WriteLong
              mov     XMM_Len,#4                ' write 4 bytes
XMM_WriteMult
XMM_Src       mov     XMM_Tmp6,0-0              ' save the value
              mov     oute,SRAM_EN              ' use SRAM
:WriteLoop
              mov     outx,XMM_Tmp6             ' write ...
              call    #XMM_WriteByte            ' ... the byte
              ror     XMM_Tmp6,#8               ' shift next byte into position
              add     XMM_Addr,#1               ' inc XMM address
              djnz    XMM_Len,#:WriteLoop       ' repeat while XMM_len <> 0
XMM_WriteLong_ret
XMM_WriteMult_ret
              ret
'
#endif          
'
#ifdef NEED_XMM_WRITEPAGE              
'
' XMM_WritePage : Write bytes from Hub RAM to XMM RAM
' On entry:
'    XMM_Addr  (32-bit): destination address in sram
'    Hub_Addr  (32-bit): source address in main memory
'    XMM_Len   (32-bit): number of bytes to write. 
'
XMM_WritePage
              mov     oute,SRAM_EN              ' use SRAM
:WriteLoop
              rdbyte  outx,Hub_Addr             ' get byte from Hub
              call    #XMM_WriteByte            ' write byte to SRAM
              add     Hub_Addr,#1               ' inc source address
              add     XMM_Addr,#1               ' inc dest address
              djnz    XMM_Len,#:WriteLoop       ' repeat while XMM_len <> 0
XMM_WritePage_ret
              ret
'
#endif          
'
#ifdef NEED_XMM_READPAGE              
'
' XMM_ReadPage : Read bytes from XMM RAM to Hub RAM.
' On Entry: 
'    XMM_Addr  (32-bit): source address in sram
'    Hub_Addr  (32-bit): destination address in main memory
'    XMM_Len   (32-bit): number of bytes to read. 
'
XMM_ReadPage
              mov     oute,SRAM_EN              ' use SRAM
XMM_ReadPage_Loop
              call    #XMM_ReadByte             ' read byte from SRAM
              wrbyte  outx,Hub_Addr             ' write byte to Hub
              add     XMM_Addr,#1               ' inc source address 
              add     Hub_Addr,#1               ' inc dest address
              djnz    XMM_Len,#XMM_ReadPage_Loop ' repeat while XMM_len <> 0
XMM_ReadPage_ret
XMM_FlashReadPage_ret
              ret
'
#endif
'
' XMM variables
'
outx          long    $0
outc          long    $0
oute          long    $0
'
XMM_Quad      long    $0
XMM_Temp      long    $0
XMM_Tmp2      long    $0
XMM_Tmp3      long    $0
XMM_Tmp4      long    $0
XMM_Tmp5      long    $0
XMM_Tmp6      long    $0
'
'     
' RamPage2 (RP2) Hardware Access:
'
ALL_BITS      long      (|<Common#SIO_FLASH_PIN) | (|<Common#SIO_CLK_PIN) | (|<Common#SIO_SRAM_PIN) | {
                      } (|<Common#SIO0_PIN) | (|<Common#SIO1_PIN) | (|<Common#SIO2_PIN) | (|<Common#SIO3_PIN) | {
                      } (|<Common#SIO4_PIN) | (|<Common#SIO5_PIN) | (|<Common#SIO6_PIN) | (|<Common#SIO7_PIN)
DATA_BITS     long      (|<Common#SIO0_PIN) | (|<Common#SIO1_PIN) | (|<Common#SIO2_PIN) | (|<Common#SIO3_PIN) | {
                      } (|<Common#SIO4_PIN) | (|<Common#SIO5_PIN) | (|<Common#SIO6_PIN) | (|<Common#SIO7_PIN)

#ifdef PARANOID_IO
DBIT_0        long    (|<Common#SIO0_PIN)
DBIT_1        long    (|<Common#SIO1_PIN)
DBIT_2        long    (|<Common#SIO2_PIN)
DBIT_3        long    (|<Common#SIO3_PIN)
DBIT_4        long    (|<Common#SIO4_PIN)
DBIT_5        long    (|<Common#SIO5_PIN)
DBIT_6        long    (|<Common#SIO6_PIN)
DBIT_7        long    (|<Common#SIO7_PIN)
#endif
'
CLK           long    (|<Common#SIO_CLK_PIN)
FLASH_EN      long    (|<Common#SIO_FLASH_PIN)
SRAM_EN       long    (|<Common#SIO_SRAM_PIN)
'
MOSI_BITS     long    (|<Common#MOSI1_PIN) | (|<Common#MOSI2_PIN) ' output from Prop
MISO_BITS     long    (|<Common#MISO1_PIN) | (|<Common#MISO2_PIN) ' input from Prop
'
MISO_1        long    (|<Common#MISO1_PIN)
MISO_2        long    (|<Common#MISO2_PIN)
'
#ifdef TEST_LED
LED_BIT       long    |< Common#DEBUG_PIN ' only used when when testing
#endif
'
'-------------------- End of RAMPAGE2 XMM Support Routines -------------------
'
