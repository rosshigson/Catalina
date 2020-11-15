{
'------------------------- C3 SPI XMM Support Routines -------------------------
'
' NOTE: This non-caching driver currently supports only the SPI SRAM, not FLASH.
'       For FLASH support, you must use the CACHED driver.
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
'
'=========================== MINIMAL API FUNCTIONS =============================
'
CON
'
#include "C3_DEF.inc"
#include "C3_XMM_DEF.inc"
'
' flash chip commands:
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
' XMM_Activate : Activate the XMM bus. 
'
XMM_Activate
              muxc    XMM_Flags,#1              ' save C flag                                        
              andn    dira,MASK                 ' set all as inputs while initializing
              or      dira,DIRN                 ' set pin directions
              mov     XMM_Addr,#0               ' set SPI bank 0 ...
              call    #XMM_ModeSelect           ' ... to sequential mode
              mov     XMM_Addr,BIT15            ' set SPI bank 1 ...
              call    #XMM_ModeSelect           ' ... to sequential mode
'
' XMM_UnselectSPIAndReturn - Common return point (all XMM functions jump here!)
'
XMM_UnselectSPIAndReturn
              andn    outa,CS_CLR               ' Reset SPI Channel ...
              or      outa,CS_CLR               ' ... to deselect SPI SRAMs
              shr     XMM_Flags,#1 wc           ' restore C flag
XMM_Activate_ret      
XMM_ReadPage_ret
XMM_ReadLong_ret
XMM_ReadMult_ret
XMM_WritePage_ret
XMM_WriteLong_ret
XMM_WriteMult_ret
              ret
'
'XMM_Tristate : Give up the XMM bus. Use this to use other hardware that 
'               shares pins with the XMM RAM. To reactivate the XMM bus, 
'               call XMM_Activate.
'
' XMM_FlashTristate : Same as XMM_Tristate.
'            
XMM_Tristate
XMM_FlashTristate
              andn       outa,CS_CLR            ' Reset SPI Channel ...
              or         outa,CS_CLR            ' ... to deselect SPI SRAMs
              andn       dira,DIRN
XMM_Tristate_ret
XMM_FlashTristate_ret
              ret

#ifdef NEED_XMM_READLONG              
'
' XMM_ReadLong : Read long from XMM at address in XMM_Addr into the destination register
'                set up in XMM_Dest. XMM_Activate should be called at least once before
'                this routine is used.
' On entry:
'    XMM_Addr : address to read (up to 16 bits)
'    XMM_Dst  : destination of this instruction set to destination register
' On exit:
'    XMM_Addr incremented by 4.
'    Destination register contains long read from XMM.
'
'
' XMM_ReadMult : Read multiple bytes in source register to XMM at address XMM_Addr.
'                XMM_Activate should be called at least once before this routine is used.
' On entry:
'    XMM_Addr : address to read (up to 16 bits)
'    XMM_Dst  : destination of this instruction set to destination register
'    XMM_Len  : number of bytes to read (usually 1, 2 or 4)
' On exit:
'    XMM_Addr incremented by XMM_Len.
'    Destination register contains bytes read from XMM.
'
XMM_ReadLong
              mov     XMM_Len,#4                ' read 4 bytes
XMM_ReadMult
              mov     outx,#%0000_0011          ' Set Command ...
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
              jmp     #XMM_UnselectSPIAndReturn
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
' XMM_WriteMult : Write multiple bytes in source register to XMM at address XMM_Addr.
'                 XMM_Activate should be called at least once before this routine is used.
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
              mov     outx,#%0000_0010          ' Set Command ...               
              call    #XMM_SetCmdAddr           ' ... and Address (and lower CS)
              add     XMM_Addr,XMM_Len          ' update XMM_Addr
XMM_Src       mov     XMM_Temp,0-0              ' save the value to write
:WriteLoop
              mov     outx,XMM_Temp
'              and     outx,#$FF
              call    #XMM_OutByte              ' write a byte to SPI
              ror     XMM_Temp,#8               ' shift next byte down to prepare
              djnz    XMM_Len,#:WriteLoop       ' repeat while XMM_len <> 0
              jmp     #XMM_UnselectSPIAndReturn
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
              mov     outx,#%0000_0010          ' Set Command ...               
              call    #XMM_SetCmdAddr           ' ... and Address (and lower CS)
:WriteLoop
              rdbyte  outx,Hub_Addr             ' get byte from source (Hub)
              call    #XMM_OutByte              ' write byte to SPI
              add     Hub_Addr,#1               ' inc source address
              add     XMM_Addr,#1               ' inc dest address
              djnz    XMM_Len,#:WriteLoop       ' repeat while XMM_len <> 0
              jmp     #XMM_UnselectSPIAndReturn
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
              mov     outx,#%0000_0011          ' Set Command ...               
              call    #XMM_SetCmdAddr           ' ... and Address (and lower CS)
:ReadLoop
              call    #XMM_InByte               ' read byte from SPI
              wrbyte  outx,Hub_Addr             ' write byte to destination (Hub)
              add     Hub_Addr,#1               ' inc dest address
              add     XMM_Addr,#1               ' inc src address
              djnz    XMM_Len,#:ReadLoop        ' repeat while XMM_len <> 0
              jmp     #XMM_UnselectSPIAndReturn
'
#endif
'
'
'XMM_SetCmdAddr : Set XMM command and address (and lower CS). XMM_Activate should be called
'                 at least once before this routine is used.
'On Entry:
'   outx     : Command (3 for read, 2 for write)
'   XMM_Addr : address to set (up to 16 bits)
'On Exit:
'   XMM_Addr : preserved
'   C flag saved, then destroyed!
'
XMM_SetCmdAddr
              muxc      XMM_Flags,#1            ' save C flag
              call      #XMM_BankSelect         ' select the SPI SRAM bank
              call      #XMM_OutByte            ' send the command
              mov       XMM_Test,#16            ' 16 address bits
              mov       outx,XMM_Addr           ' put address bits ...
              rol       outx,#16                ' ... in top 16 bits
              call      #XMM_OutBits
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
XMM_FlashOutByte
              mov       XMM_Test,#8             ' 8 bits
              rol       outx,#24                ' put first bit in MSB
XMM_OutBits              
XMM_FlashOutBits              
              rol       outx,#1 wc
              muxc      outa,IBIT
              or        outa,CLCK
              andn      outa,CLCK
              djnz      XMM_Test,#XMM_OutBits
XMM_FlashOutByte_ret
XMM_OutByte_ret
XMM_FlashOutBits_ret
XMM_OutBits_ret
              ret              
'
' XMM_InByte - receive a byte from SPI RAM
' On exit: outx shifted left 8 bits, new byte in lower 8 bits
' On exit: C flag destroyed!
'
XMM_InByte
XMM_FlashInByte
              mov       XMM_Test,#8             ' 8 bits
:InLoop
              test      OBIT,ina wc
              shl       outx,#1
              muxc      outx,#1
              or        outa,CLCK
              andn      outa,CLCK
              djnz      XMM_Test,#:InLoop      
XMM_InByte_ret
XMM_FlashInByte_ret
              ret
'
' XMM_BankSelect - select appropriate SPI SRAM bank based on address
' On entry: XMM_Addr bit 15 determines SRAM bank to select (0 or 1)
' On exit:  C flag destroyed!
'
' NOTE: This code assumes SRAM 0 is channel 1, and SRAM 1 is channel 2!
'
XMM_BankSelect
             andn       outa,CS_CLR             ' Reset SPI Channel ...
             or         outa,CS_CLR             ' ... to deselect SPI SRAMs
             andn       outa,CS_CLK             ' toggle SPI Select incrementor ...
             or         outa,CS_CLK             ' ... to select first SRAM (bank 0)
             test       XMM_Addr,BIT15 wc       ' if bit 15 set ...
       if_c  andn       outa,CS_CLK             ' ... toggle SPI Select incrementor ...
       if_c  or         outa,CS_CLK             ' ... to select second SRAM (bank 1)
XMM_BankSelect_ret
             ret
'
' XMM_ModeSelect - select sequential mode on current bank
' On entry: XMM_Addr bit 15 determines SRAM bank to select (0 or 1)
' On exit:  C flag destroyed!
'
XMM_ModeSelect
              call       #XMM_BankSelect        ' select SPI SRAM bank 0 or 1
              mov        outx,#%0000_0001       ' set ...                                            
              call       #XMM_OutByte           ' ... selected SPI SRAM ...                                   
              mov        outx,#%0100_0000       ' ... to sequential ...                              
              call       #XMM_OutByte           ' ... mode
XMM_ModeSelect_ret
              ret
'
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
' C3 Hardware Access:
'
MASK          long      (|<Common#SPI_CS_CLK) | (|<Common#SPI_CS_CLR) | (|<Common#SPI_CLK) | (|<Common#SPI_SI) | (|<Common#SPI_SO)
DIRN          long      (|<Common#SPI_CS_CLK) | (|<Common#SPI_CS_CLR) | (|<Common#SPI_CLK) | (|<Common#SPI_SI)       
CS_CLK        long      (|<Common#SPI_CS_CLK)
CS_CLR        long      (|<Common#SPI_CS_CLR)
OBIT          long      (|<Common#SPI_SO)
IBIT          long      (|<Common#SPI_SI)
CLCK          long      (|<Common#SPI_CLK)
BIT15         long      $8000     

'------------------ Additional C3 SPI FLASH Support Routines -------------------
'
' NOTE THAT THE NORMAL XMM KERNEL DOES NOT HAVE SUFFICIENT SPACE AVAILABLE
' TO INLCUDE THE FLASH SUPPORT FUNCTIONS, BUT THE XMM CACHING DRIVER DOES
' - THIS MEANS THAT FLASH IS ONLY SUPPORTED IF THE CACHE IS USED !
'
#ifdef NEED_FLASH

'
' XMM_FlashActivate - select SPI Flash (equivalent to XMM_Activate for FLASH -
'                     note that it assumes XMM_Activate has already been called)
'
XMM_FlashActivate
        andn    dira,MASK               ' set I/O pins as inputs while initializing
        or      dira,DIRN               ' set pin directions
        andn    outa,CS_CLR             ' Reset  ...
        or      outa,CS_CLR             ' ... SPI Channel Select
        mov     XMM_Temp,#Common#SPI_SELECT_FLASH ' Flash Channel
:loop
        andn    outa,CS_CLK             ' ... toggle SPI Select incrementor ...
        or      outa,CS_CLK             ' ... to select SPI Flash
        djnz    XMM_Temp,#:loop
XMM_FlashActivate_ret
        ret
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
#endif
'
'---------------------- End of C3 SPI XMM Support Routines ---------------------
'
