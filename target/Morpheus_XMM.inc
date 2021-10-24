{
'
'-------------------------- MORPHEUS XMM Support Routines ----------------------
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
'=============================== FLASH CHECK ===================================
'
#ifdef CPU_2
#ifdef NEED_FLASH
#error : FLASH NOT SUPPORTED ON THIS PLATFORM
#endif
#endif
'
'=========================== MINIMAL API FUNCTIONS =============================
'
CON
'
#include "Morpheus_DEF.inc"
#include "Morpheus_XMM_DEF.inc"
'
' SPI SRAM chip commands:
'
  SPI_READ              = $03
  SPI_WRITE             = $02
  SPI_RDSR              = $05
  SPI_WRSR              = $01
'
' SPI FLASH chip commands:
'
  FLASH_READ            = $0B       ' Read 
  FLASH_PROG            = $02       ' Write (Program)
  FLASH_WREN            = $06       ' Write Enable
  FLASH_WRDI            = $04       ' Write Disable
  FLASH_RDSR            = $05       ' Read STATUS register
  FLASH_WRSR            = $01       ' Write STATUS register
  FLASH_BE4K            = $20       ' Block Erase (4k)
  FLASH_CE              = $60       ' Chip Erase
'
DAT
'
#ifdef CPU_1

'------------------- MORPHEUS CPU #1 SPI XMM Support Routines ------------------
'
' XMM_Activate : Activate the XMM bus. 
'
XMM_Activate
              muxc      XMM_Flags,#1            ' save C flag
              andn      dira,MASK               ' set all inputs while initializing
              andn      outa,MASK               ' all outputs zero ... 
              or        outa,CSEL               ' ... except CS
              or        dira,DIRN               ' set pin directions
              andn      outa,CSEL               ' lower CS to initiate command
              mov       outx,#SPI_WRSR          ' set ...
              call      #XMM_OutByte            ' ... SPI chip ...
              mov       outx,#%0100_0000        ' ... to sequential ...
              call      #XMM_OutByte            ' ... mode
              or        outa,CSEL               ' raise CS
              shr       XMM_Flags,#1 wc         ' restore C flag
XMM_Activate_ret
              ret
'
'XMM_Tristate : Give up the XMM bus. Call this to allow other cogs to use 
'               microSD etc. To activate XMM again, call XMM_Activate.  
'
XMM_Tristate
              or      outa,CSEL                 ' raise CS (deselect chip)
XMM_Tristate_ret
              ret
'
#ifdef NEED_XMM_READLONG              
'
' XMM_ReadLong : Read long from XMM at address in XMM_Addr into the destination
'                register set up in XMM_Dest. XMM_Activate should be called at 
'                least once before this routine is used.
' On entry:
'    XMM_Addr : address to read (up to 16 bits)
'    XMM_Dst  : destination of this instruction set to destination register
' On exit:
'    Destination register contains long read from XMM.
'    XMM_Addr incremented by 4.
'
'
' XMM_ReadMult : Read multiple bytes in source register to XMM at address 
'                XMM_Addr. XMM_Activate should be called at least once 
'                before this routine is used.
' On entry:
'    XMM_Addr : address to read (up to 16 bits)
'    XMM_Dst  : destination of this instruction set to destination register
'    XMM_Len  : number of bytes to read (usually 1, 2 or 4)
' On exit:
'    Destination register contains bytes read from XMM.
'    XMM_Addr incremented by XMM_Len.
'
XMM_ReadLong
              mov     XMM_Len,#4                ' read 4 bytes
XMM_ReadMult
              muxc    XMM_Flags,#1              ' save C flag
              muxnz   XMM_Flags,#2              ' save Z flag
              mov     outx,#SPI_READ            ' Set Command to READ ...
              call    #XMM_SetCmdAddr           ' ... and Address (and lower CS)
              add     XMM_Addr,XMM_Len          ' update XMM_Addr
              mov     XMM_Temp,#0
              mov     XMM_Tmp2,#32              ' set up number of bits to shift result
:ReadLoop
              call    #XMM_InByte               ' read next byte from SPI
              and     outx,#$FF
              or      XMM_Temp,outx
              ror     XMM_Temp,#8
              sub     XMM_Tmp2,#8               ' update number of bits to shift result 
              djnz    XMM_Len,#:ReadLoop        ' repeat while XMM_len <> 0
              ror     XMM_Temp,XMM_Tmp2         ' shift bytes into final position
XMM_Dst       mov     0-0,XMM_Temp              ' save the result
              or      outa,CSEL                 ' raise CS to terminate read
              shr     XMM_Flags,#1 wz,wc        ' restore C & Z flag
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
'    XMM_Addr : (32-bit) address to write (up to 16 bits)
'    XMM_Src  : source of this instruction set to source register
' On exit:
'    XMM_Addr incremented by 4.
'
'
' XMM_WriteMult : Write multiple bytes in source register to XMM at address
'                 XMM_Addr. XMM_Activate should be called at least once 
'                 before this routine is used.
' On entry:
'    XMM_Addr : address to write (up to 16 bits)
'    XMM_Src  : source of this instruction set to source register
'    XMM_Len  : number of bytes to write (usually 1, 2 or 4)
' On exit:
'    XMM_Addr incremented by XMM_Len.
'
XMM_WriteLong
              mov     XMM_Len,#4                ' write 4 bytes
XMM_WriteMult
              muxc    XMM_Flags,#1              ' save C flag
              mov     outx,#SPI_WRITE           ' Set Command to WRITE ...
              call    #XMM_SetCmdAddr           ' ... and Address (and lower CS)
              add     XMM_Addr,XMM_Len          ' update XMM_Addr
XMM_Src       mov     XMM_Temp,0-0              ' save the value to write
:WriteLoop
              mov     outx,XMM_Temp
              and     outx,#$FF
              call    #XMM_OutByte              ' write a byte to SPI
              ror     XMM_Temp,#8               ' shift next byte down
              djnz    XMM_Len,#:WriteLoop       ' repeat while XMM_len <> 0
              or      outa,CSEL                 ' raise CS to terminate write
              shr     XMM_Flags,#1 wc           ' restore C flag
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
'    XMM_Addr  (32-bit): destination address in sram, 16-bits used
'    Hub_Addr  (32-bit): source address in main memory, 16-bits used
'    XMM_Len   (32-bit): number of bytes to write. 
'
XMM_WritePage
              muxc    XMM_Flags,#1              ' save C flag
              mov     outx,#SPI_WRITE           ' Set Command to WRITE ... 
              call    #XMM_SetCmdAddr           ' ... and Address (and lower CS)
:WriteLoop
              rdbyte  outx,Hub_Addr             ' get byte from source (Hub)
              call    #XMM_OutByte              ' write byte to SPI
              add     Hub_Addr,#1               ' inc source address
              add     XMM_Addr,#1               ' inc dest address
              djnz    XMM_Len,#:WriteLoop       ' repeat while XMM_len <> 0
              or      outa,CSEL                 ' raise CS to terminate write
              shr     XMM_Flags,#1 wc           ' restore C flag
XMM_WritePage_ret
              ret
'
#endif          
'
#ifdef NEED_XMM_READPAGE              
'
' XMM_ReadPage : Read bytes from XMM RAM to Hub RAM.
' On Entry: 
'    XMM_Addr  (32-bit): source address in sram, 16-bits used
'    Hub_Addr  (32-bit): destination address in main memory, 16-bits used
'    XMM_Len   (32-bit): number of bytes to read. 
'
XMM_ReadPage
              muxc    XMM_Flags,#1              ' save C flag
              muxnz   XMM_Flags,#2              ' save Z flag
              mov     outx,#SPI_READ            ' Set Command to READ ...
              call    #XMM_SetCmdAddr           ' ... and Address (and lower CS)
:ReadLoop
              call    #XMM_InByte               ' read byte from SPI
              wrbyte  outx,Hub_Addr             ' write byte to destination (Hub)
              add     Hub_Addr,#1               ' inc dest address
              add     XMM_Addr,#1               ' inc src address
              djnz    XMM_Len,#:ReadLoop        ' repeat while XMM_len <> 0
              or      outa,CSEL                 ' raise CS to terminate read
              shr     XMM_Flags,#1 wz,wc        ' restore C & Z flag
XMM_ReadPage_ret
              ret
'
#endif          
'
'XMM_SetCmdAddr : Set XMM command and address (and lower CS). XMM_Activate should be called
'                 at least once before this routine is used.
'On Entry:
'   outx     : Command (2 for read, 3 for write)
'   XMM_Addr : address to set (up to 16 bits)
'On Exit:
'   XMM_Addr : preserved
'   C flag destroyed!
'
XMM_SetCmdAddr
              andn      outa,CSEL               ' lower CS to select chip
              mov       XMM_Test,#8             ' 8 bits
              rol       outx,#24                ' put first bit in MSB
:CmdLoop              
              rol       outx,#1 wc
              muxc      outa,IBIT
              or        outa,CLCK
              andn      outa,CLCK
              djnz      XMM_Test,#:CmdLoop      
              mov       XMM_Test,#16            ' 16 address bits
              rol       XMM_Addr,#16            ' put first address bit in MSB
:AddrLoop              
              rol       XMM_Addr,#1 wc
              muxc      outa,IBIT
              or        outa,CLCK
              andn      outa,CLCK
              djnz      XMM_Test,#:AddrLoop      
XMM_SetCmdAddr_ret
              ret              
'
' XMM_OutByte - send 8 bits to the SPI RAM
' On entry: byte in outx (lower 8 bits)
' On exit: C flag destroyed!
'
' XMM_OutBits - send bits the SPI RAM
' On entry: XMM_Test = number of bits to send ("n")
' On entry: outx contains bits (as top "n" bits)
' On exit: C flag destroyed!
'
XMM_OutByte
              mov       XMM_Test,#8             ' 8 bits
              rol       outx,#24                ' put first bit in MSB
XMM_OutBits              
              rol       outx,#1 wc
              muxc      outa,IBIT
              or        outa,CLCK
              andn      outa,CLCK
              djnz      XMM_Test,#XMM_OutBits
XMM_OutByte_ret
XMM_OutBits_ret
              ret              
'
' XMM_InByte - receive a byte from SPI RAM
' On exit: outx shifted left 8 bits, new byte in lower 8 bits
' On exit: Z flag destroyed!
'
XMM_InByte
              mov       XMM_Test,#8             ' 8 bits
:InLoop
              test      OBIT,ina wz
              shl       outx,#1
              muxnz     outx,#1
              or        outa,CLCK
              andn      outa,CLCK
              djnz      XMM_Test,#:InLoop      
XMM_InByte_ret
              ret
{
'
' XMM_GetStat - read status register (for testing only)
'              
XMM_GetStat                            
              andn      outa,CSEL               ' lower CS to initiate command
              mov       outx,#SPI_RDRS          ' get ...
              call      #XMM_OutByte            ' ... SPI chip ...
              mov       outx,#0                 ' ...
              call      #XMM_InByte             ' ... mode
              or        outa,CSEL               ' raise CS
XMM_GetStat_ret
              ret              
}
'
' XMM variables
'
outx          long      $0
'
XMM_Flags     long      $0
XMM_Temp      long      $0
XMM_Tmp2      long      $0
XMM_Test      long      $0
'
'     
' Morpheus CPU #1 Hardware Access:
'
MASK          long      (|<Common#SPI_CS) | (|<Common#SPI_CLK) | (|<Common#SPI_SI) | (|<Common#SPI_SO)| (|<Common#FLASH_CS) | (|<Common#FLASH_CLK) | (|<Common#FLASH_SI) | (|<Common#FLASH_SO)
DIRN          long      (|<Common#SPI_CS) | (|<Common#SPI_CLK) | (|<Common#SPI_SI) | (|<Common#FLASH_CS) | (|<Common#FLASH_CLK) | (|<Common#FLASH_SI)      
CSEL          long      (|<Common#SPI_CS)
OBIT          long      (|<Common#SPI_SO)
IBIT          long      (|<Common#SPI_SI)
CLCK          long      (|<Common#SPI_CLK)     
'
'----------- Additional MORPHEUS CPU #1 SPI FLASH Support Routines -------------
'
' NOTE THAT THE NORMAL XMM KERNEL DOES NOT HAVE SUFFICIENT SPACE AVAILABLE
' TO INLCUDE THE FLASH SUPPORT FUNCTIONS, BUT THE XMM CACHING DRIVER DOES
' - THIS MEANS THAT FLASH IS ONLY SUPPORTED IF THE CACHE IS USED !
'
#ifdef NEED_FLASH
	
'
' XMM_FlashInByte
'
XMM_FlashInByte
              mov       XMM_Test,#8             ' 8 bits
:InLoop
              test      FLASH_OBIT,ina wz
              shl       outx,#1
              muxnz     outx,#1
              or        outa,FLASH_CLCK
              andn      outa,FLASH_CLCK
              djnz      XMM_Test,#:InLoop      
XMM_FlashInByte_ret
              ret
'
' XMM_FlashOutByte
' XMM_FlashOutBits
'
XMM_FlashOutByte 
              mov       XMM_Test,#8             ' 8 bits
              rol       outx,#24                ' put first bit in MSB
XMM_FlashOutBits              
              rol       outx,#1 wc
              muxc      outa,FLASH_IBIT
              or        outa,FLASH_CLCK
              andn      outa,FLASH_CLCK
              djnz      XMM_Test,#XMM_FlashOutBits
XMM_FlashOutByte_ret
XMM_FlashOutBits_ret
        ret
'
' XMM_FlashActivate - select SPI Flash (equivalent to XMM_Activate for FLASH)
'
XMM_FlashActivate
              andn      dira,MASK               ' set all inputs while initializing
              andn      outa,MASK               ' all outputs zero ... 
              or        outa,FLASH_CSEL         ' ... except CS
              or        dira,DIRN               ' set pin directions
              andn      outa,FLASH_CSEL         ' lower CS to select chip
XMM_FlashActivate_ret
        ret
'
' XMM_FlashTristate (equivalent to XMM_Tristate for FLASH)
'
XMM_FlashTristate
              or        outa,FLASH_CSEL         ' raise CS (deselect chip)
XMM_FlashTristate_ret
              ret
'
'
'
' XMM_FlashWritePage : Write (program) bytes from Hub RAM to FLASH
' On entry:
'    XMM_Addr  (32-bit): destination address in Flash
'    Hub_Addr  (32-bit): source address in main memory
'    XMM_Len   (32-bit): number of bytes to write 
'
XMM_FlashWritePage
        call    #XMM_FlashActivate
        mov     outx,#FLASH_PROG
        shl     outx,#24
        or      outx,XMM_Addr
        mov     XMM_Test,#32
        call    #XMM_FlashOutBits
:loop
        rdbyte  outx, Hub_Addr
        call    #XMM_FlashOutByte
        add     Hub_Addr, #1
        add     XMM_Addr, #1
        djnz    XMM_Len, #:loop
        call    #XMM_FlashTristate
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
        call    #XMM_FlashActivate
        mov     outx,#FLASH_READ
        shl     outx,#24
        or      outx,XMM_Addr
        mov     XMM_Test,#40            ' includes 8 dummy bits
        call    #XMM_FlashOutBits
:loop
        call    #XMM_FlashInByte        ' read byte from SPI FLASH
        wrbyte  outx,Hub_Addr           ' write byte to destination (Hub)
        add     Hub_Addr,#1             ' inc dest address
        add     XMM_Addr,#1             ' inc src address
        djnz    XMM_Len,#:loop          ' repeat while XMM_len <> 0
        call    #XMM_FlashTristate
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
        call    #XMM_FlashActivate
        mov     outx,#FLASH_READ
        shl     outx,#24
        or      outx,XMM_Addr
        mov     XMM_Test,#40            ' includes 8 dummy bits
        call    #XMM_FlashOutBits
:loop
        call    #XMM_FlashInByte        ' read byte from SPI FLASH
        and     outx,#$FF
        cmp     outx,#$FF wz
  if_nz jmp     #:done
        add     XMM_Addr,#1             ' inc src address
        djnz    XMM_Len,#:loop          ' repeat while XMM_len <> 0
        cmp     outx,#$FF wz
:done              
        call    #XMM_FlashTristate
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
        call    #XMM_FlashActivate
        mov     outx,#FLASH_READ
        shl     outx,#24
        or      outx,XMM_Addr
        mov     XMM_Test,#40            ' includes 8 dummy bits
        call    #XMM_FlashOutBits
:loop
        call    #XMM_FlashInByte        ' read byte from SPI FLASH
        rdbyte  XMM_Temp,Hub_Addr         ' get hub byte
        and     outx,#$FF
        cmp     XMM_Temp,outx wz
  if_nz jmp     #:done
        add     Hub_Addr,#1             ' inc dest address
        add     XMM_Addr,#1             ' inc src address
        djnz    XMM_Len,#:loop          ' repeat while XMM_len <> 0
:done              
        call    #XMM_FlashTristate
XMM_FlashComparePage_ret
        ret
'
'
' XMM_FlashEraseChip : Erase the whole FLASH chip
'
XMM_FlashEraseChip
        call    #XMM_FlashActivate
        mov     outx, #FLASH_CE         ' Chip Erase
        call    #XMM_FlashOutByte
        call    #XMM_FlashTristate
XMM_FlashEraseChip_ret
        ret
'
'
' XMM_FlashEraseBlock : Erase a 4k block of the FLASH chip
'
XMM_FlashEraseBlock
        call    #XMM_FlashActivate
        mov     outx,#FLASH_BE4K        ' Block Erase (4K)
        shl     outx,#24
        or      outx, XMM_Addr
        mov     XMM_Test,#32
        call    #XMM_FlashOutBits
        call    #XMM_FlashTristate
XMM_FlashEraseBlock_ret
        ret
'
'
' XMM_FlashUnprotect : Unprotect the entire FLASH chip
'
XMM_FlashUnprotect
        call    #XMM_FlashActivate
        mov     outx,#FLASH_WRSR       ' zero ...
        shl     outx,#24
        mov     XMM_Test,#16           ' ... the status register
        call    #XMM_OutBits
        call    #XMM_FlashTristate
XMM_FlashUnprotect_ret
        ret
'
'
' XMM_FlashWriteEnable : Enable Writing to the FLASH chip
'
XMM_FlashWriteEnable
        call    #XMM_FlashActivate
        mov     outx,#FLASH_WREN       ' Flash Write Enable
        call    #XMM_FlashOutByte
        call    #XMM_FlashTristate
XMM_FlashWriteEnable_ret
        ret
'
'
' XMM_FlashWaitUntilDone : Wait until previous FLASH request complete
'
XMM_FlashWaitUntilDone
:loop
        call    #XMM_FlashActivate
        mov     outx,#FLASH_RDSR       ' read status register
        call    #XMM_FlashOutByte
:wait   call    #XMM_FlashInByte
        test    outx,#1 wz
  if_nz jmp     #:wait
        call    #XMM_FlashTristate
        and     outx,#$ff
XMM_FlashWaitUntilDone_ret
        ret
'
FLASH_CSEL    long      (|<Common#FLASH_CS)
FLASH_OBIT    long      (|<Common#FLASH_SO)
FLASH_IBIT    long      (|<Common#FLASH_SI)
FLASH_CLCK    long      (|<Common#FLASH_CLK)     

#endif	
'
'--------------- End of MORPHEUS CPU #1 SPI XMM Support Routines ---------------
'
#elseifdef CPU_2
'
'--------------------- MORPHEUS CPU #2 XMM Support Routines --------------------
'
' XMM_Activate : Activate the XMM bus.
'
XMM_Activate
              neg     XMM_Page, #1     ' force XMM_SetAddr to latch page
              andn    outa, BSEL       ' set all XMM pins to low (to be tidy) 
              andn    dira, BSEL       ' make all XMM pins inputs (float high)      
XMM_Activate_ret
              ret
'
'XMM_Tristate : Give up the XMM bus. Call this to allow other cogs to use 
'               microSD etc. To activate XMM again, call XMM_Activate.
XMM_Tristate
              andn    dira, BSEL       ' make all XMM pins inputs (float high)      
XMM_Tristate_ret
              ret
'
#ifdef NEED_XMM_READLONG              
'
' XMM_ReadLong : Read long from XMM at address in XMM_Addr into the destination
'                register set up in XMM_Dest. XMM_Activate should be called 
'                at least once before this routine is used.
' On entry:
'    XMM_Addr : address to read (up to 22 bits)
'    XMM_Dst  : destination of this instruction set to destination register
' On exit:
'    XMM_Addr and XMM_Page set up for fast access. XMM_Addr incremented by 4.
'    Destination register contains long read from XMM.
'    XMM_Addr incremented by 4.
'
'
' XMM_ReadMult : Read multiple bytes in source register to XMM at address 
'                XMM_Addr. XMM_Activate should be called at least once before 
'                this routine is used.
' On entry:
'    XMM_Addr : address to read (up to 24 bits)
'    XMM_Dst  : destination of this instruction set to destination register
'    XMM_Len  : number of bytes to read (usually 1, 2 or 4)
' On exit:
'    XMM_Addr and XMM_Page set up for fast access. XMM_Addr incremented by 4.
'    Destination register contains long read from XMM.
'    XMM_Addr incremented by XMM_Len.
'
XMM_ReadLong
              mov     XMM_Len,#4       ' read 4 bytes
XMM_ReadMult
              call    #XMM_SetAddr     ' latch page address and set offset
              mov     XMM_Temp,#0      '
              mov     XMM_Test,#32     ' set up number of bits to shift result
:ReadLoop
              mov     dira, OFFRMSK    ' set offset address bits to output,
                                       ' data bits to input, CTRL to RD (float)
              nop                      ' delay (required!!!)
              mov     outx, ina        ' read ...
              and     outx, #$FF       ' ... the byte
              andn    dira, CTRL       ' turn CTRL bits off in DIRA (pull up)
              or      XMM_Temp, outx
              ror     XMM_Temp,#8
              sub     XMM_Test,#8      ' update number of bits to shift result 
              add     outa, XMM_Inc    ' inc sram address (no page change)
              djnz    XMM_Len, #:ReadLoop ' repeat while XMM_len <> 0
              ror     XMM_Temp,XMM_Test   ' shift bytes into final position
XMM_Dst       mov     0-0, XMM_Temp       ' save the result
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
'    XMM_Addr : (32-bit) address to write (up to 22 bits)
'    XMM_Src  : source of this instruction set to source register
' On exit:
'    XMM_Addr incremented by 4.
'
'
' XMM_WriteMult : Write multiple bytes in source register to XMM at address
'                 XMM_Addr. XMM_Activate should be called at least once 
'                 before this routine is used.
' On entry:
'    XMM_Addr : address to write (up to 24 bits)
'    XMM_Src  : source of this instruction set to source register
'    XMM_Len  : number of bytes to write (usually 1, 2 or 4)
' On exit:
'    XMM_Addr incremented by XMM_Len.
'
XMM_WriteLong
              mov     XMM_Len,#4       ' write 4 bytes
XMM_WriteMult
              call    #XMM_SetAddr     ' latch page address and set offset
XMM_Src       mov     XMM_Temp, 0-0    ' save the value
:WriteLoop
              mov     outx, XMM_Temp
              and     outx, #$FF
              or      outa, outx
              mov     dira, OFFWMSK    ' set offset address bits to output, 
                                       ' data bits to output, CTRL to WR (float)
              nop                      ' delay (required!!!)
              andn    dira, CTRL       ' turn CTRL bits off in DIRA (pull up)
              nop                      ' delay (may be required!!!)
              ror     XMM_Temp, #8
              andn    outa, DATAMSK    ' clear data bits for next write
              add     outa, XMM_Inc    ' inc sram address (no page change)
              djnz    XMM_Len, #:WriteLoop  ' repeat while XMM_len <> 0
XMM_WriteLong_ret
XMM_WriteMult_ret
              ret
'
#endif
'
#ifdef NEED_XMM_WRITEPAGE
'
#ifndef NEED_XMM_INCADDR
#define NEED_XMM_INCADDR
#endif
'
' XMM_WritePage : Write bytes from Hub RAM to XMM RAM
' On entry:
'    XMM_Addr  (32-bit): destination address in sram, up to 24-bits used
'    Hub_Addr  (32-bit): source address in main memory, 16-bits used
'    XMM_Len   (32-bit): number of bytes to write. 
'
XMM_WritePage
              call    #XMM_SetAddr     ' latch ram address
:WriteLoop
              rdbyte  outx, Hub_Addr

              or      outa, outx
              mov     dira, OFFWMSK    ' set offset address bits to output, 
                                       ' data bits to output, CTRL to WR (float)
              nop                      ' delay (may be required!!!)
              andn    dira, CTRL       ' turn CTRL bits off in DIRA (pull up)
              nop                      ' delay (may be required!!!)
              add     Hub_Addr, #1     ' inc source address
              andn    outa, DATAMSK    ' clear data bits for next write
              call    #XMM_IncAddr     ' inc sram address  (autoinc page)
              djnz    XMM_Len, #:WriteLoop  ' repeat while XMM_len <> 0
XMM_WritePage_ret
              ret
'
#endif
'
#ifdef NEED_XMM_READPAGE
'
#ifndef NEED_XMM_INCADDR
#define NEED_XMM_INCADDR
#endif
'              
' XMM_ReadPage : Read bytes from XMM RAM to Hub RAM.
' On Entry: 
'    XMM_Addr  (32-bit): source address in sram, up to 24-bits used
'    Hub_Addr  (32-bit): destination address in main memory, 16-bits used
'    XMM_Len   (32-bit): number of bytes to read. 
'
XMM_ReadPage
              call    #XMM_SetAddr     ' latch ram address
:ReadLoop
              mov     dira, OFFRMSK    ' set offset address bits to output, 
                                       ' data bits to input, CTRL to RD (float)
              nop                      ' delay (required!!!)
              mov     outx, ina        ' read byte
              andn    dira, CTRL       ' turn CTRL bits off in DIRA (pull up)
              wrbyte  outx, Hub_Addr   ' write byte to destination (Hub)
              add     Hub_Addr, #1     ' inc dest address
              call    #XMM_IncAddr     ' inc sram address (autoinc page)
              djnz    XMM_Len, #:ReadLoop   ' repeat while XMM_len <> 0
XMM_ReadPage_ret
              ret
'              
#endif
'
'XMM_SetAddr : Setup initial XMM address. XMM_Activate should be called
'              at least once before this routine is used.
'On Entry:
'   XMM_Addr : address to set (up to 24 bits)
'On Exit:
'   XMM_Addr : preserved
'
' NOTE: To save Z & C flags:
'             muxc XMM_Flags, #1
'             muxnz XMM_Flags, #2
'       To restore Z & C flags:
'             shr XMM_Flags,#1 wc,wz

XMM_SetAddr
              muxnz XMM_Flags, #2      ' save Z flag
              and   XMM_Addr,XMM_Low24 ' mask address to 24 bits
              add   XMM_Addr,XMM_Base  ' correct for XMM not starting at 0
              mov   XMM_This, XMM_Addr ' shift upper 16 bits ...
              shr   XMM_This, #8       ' ... into position (zeros in p26&p27, 
                                       '     ready for latch)
              cmp   XMM_Page,XMM_This wz  ' same page ?
         if_z jmp   #:XMM_PageSet     ' yes - no need to set page
              mov   XMM_Page,XMM_This ' no - save new page
              mov   outa,XMM_Page     ' output page address        
              muxnz dira,BSEL         ' set latch to low
              muxz  dira,CTRL         ' release LATCH (floats high)
:XMM_PageSet        
              mov   XMM_Temp,XMM_Addr ' get ...
              and   XMM_Temp,#$FF     ' ... offset in page ...
              shl   XMM_Temp,#8       ' ... into position
              mov   outa,XMM_Temp 
              shr   XMM_Flags, #1 wz  ' restore Z flag
XMM_SetAddr_ret
              ret
tmp long 0              
'
#ifdef NEED_XMM_INCADDR              
'
'XMM_IncAddr : Increment XMM address, changing page if necessary. XMM_SetAddr
'              must be called at least once before this routine is used.
'On Entry:
'   XMM_Addr : 24 bits of address.
'On Exit:
'   XMM_Addr : incremented (wraps within page)
'   XMM_Page : incremented if the page number changes (and latch updated).
'
' NOTES: While slower than incrementing the memory address directly, this
'        routine automatically copes with XMM page changes.
'
XMM_IncAddr
              add     XMM_Addr,#1         ' increment sram address
              mov     XMM_Temp, XMM_Addr  ' is this ...
              and     XMM_Temp, #$FF      ' ... a new page?
              tjnz    XMM_Temp, #:XMM_IncOffs   ' no - just update offset within page
              neg     XMM_Page, #1        ' yes - force latching of new page
              sub     XMM_Addr, XMM_Base  ' correct for XMM not starting at 0
              call    #XMM_SetAddr        ' set new page and offset
              jmp     #XMM_IncAddr_ret    ' done
:XMM_IncOffs
              shl     XMM_Temp, #8        ' move offset into position
              andn    outa, OFFAMSK       ' set offset ...
              or      outa, XMM_Temp      ' ... in page
XMM_IncAddr_ret
              ret
'
#endif              
'
' XMM variables
'
outx          long    $0
'
XMM_Temp      long    $0
XMM_Test      long    $0
XMM_This      long    $0
XMM_Page      long    $0                  ' last page set into latch
XMM_Inc       long    1 << 8              ' 1 shifted for incrementing addr/page
XMM_Base      long    XMM_BASE_ADDRESS    ' physical XMM start address 
XMM_Flags     long    0                   ' place to save flags in XMM routines
XMM_Low24     long    $00FF_FFFF

'     
' Morpheus CPU #2 Hardware Access:
'
'                                  ++++ ++++ ++++ ++++ = A24 .. A8 (latched)
'                                  |||| |||| |||| ||||
'                       A7 .. A0 = ++++ ++++ |||| ||||
'                                  |||| |||| |||| ||||
'                                  |||| |||| ++++ ++++ = D7 .. D0
'                                  |||| |||| |||| ||||
'                                  VVVV VVVV VVVV VVVV
PAGEMSK long  %0000_0000_0000_0000_1111_1111_1111_1111
DATAMSK long  %0000_0000_0000_0000_0000_0000_1111_1111
OFFAMSK long  %0000_0000_0000_0000_1111_1111_0000_0000
OFFRMSK long  %0000_1000_0000_0000_1111_1111_0000_0000
OFFWMSK long  %0000_0100_0000_0000_1111_1111_1111_1111
BSEL    long  %0000_1100_0000_0000_1111_1111_1111_1111 
CTRL    long  %0000_1100_0000_0000_0000_0000_0000_0000
'                   ^^
'                   ||
'      page latch = 00
'     !WE (write) = 01
'     !OE  (read) = 10
'          9-VIA  = 11
'
'----------------- End of MORPHEUS CPU #2 XMM support routines -----------------
'
#endif 
'
'----------------- End of MORPHEUS XMM support routines ------------------------
'
