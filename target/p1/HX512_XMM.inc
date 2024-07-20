{
'
'-------------------------- HX512 XMM Support Routines -------------------------
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
#ifdef NEED_FLASH
#error : FLASH NOT SUPPORTED ON THIS PLATFORM
#endif
'
'=========================== MINIMAL API FUNCTIONS =============================
'
CON
'
' HX512 XMM Constants (for Hybrid or Hydra XMM):
'
HX_DBUS_BIT_SHIFT    = 16
HX_CTRL_BIT_SHIFT    = 1
HX_STROBE_BIT_SHIFT  = 30
'
' HX512 commands for controller, pre-shifted to left 1-bit, so we don't have 
' to do it during runtime, small enough to fit in constants
'
HX_CMD_WRITE_SHIFT   = %00000_00_0
HX_CMD_READ_SHIFT    = %00000_01_0
HX_CMD_LOADLO_SHIFT  = %00000_10_0
HX_CMD_LOADHI_SHIFT  = %00000_11_0
'
' HX512 sram commands
'
HX_CMD_WRITE         = %000000_00
HX_CMD_READ          = %000000_01
HX_CMD_LOADLO        = %000000_10
HX_CMD_LOADHI        = %000000_11
'
HX_CTRL_MASK         = %0000_0110 
'
DAT
'
' XMM_Activate : Activate the XMM bus. Setup XMM card for auto increment on read & write.
'
XMM_Activate
              ' set the IO direction and states for SRAM interface
              ' write 1's to interface, control lines only. so we don't accidentally fire a program clock
              mov     outa,#HX_CTRL_MASK
              ' one by one set pin groups to output
              or      dira,HX_OUTPUT_MASK       ' set I/Os for sram interface all to outputs for now
              andn    outa,#HX_CTRL_MASK        ' set control lines to code "00" which means next clock strobe read program
#ifdef ACTIVATE_INITS_XMM
'
' NOTE: This code must be disabled in the Kernel, since the Kernel can never actually initialize the HX512.
'       This is a limitation of the design of the HX512, which can be initialized only once after a reset.
'       Since the program must have been loaded into XMM prior to the Kernel executing, the HX512 must have
'       already been initialized - and attempting to initialize it again can give erroneous results.

              ' initialize the memory controller, need to put the command on the data bus, and pulse strobe
              andn    outa,HX_DBUS_MASK         ' outa = (outa & !HX_DBUS_MASK), make hole for data
              mov     outx,#%0000_1111          ' outx = program code for sram controller
              shl     outx,#HX_DBUS_BIT_SHIFT   ' outx < 16, place data into proper position
              or      outa,outx                 ' finally, outa = (outa & !HX_DBUS_MASK) | outx
              ' now pulse the strobe line
              or      outa,HX_STROBE_MASK       ' strobe = 1
              andn    outa,HX_STROBE_MASK       ' strobe = 0
#endif              
              ' now that we are done, set DBUS to inputs, leave control to outputs.
              andn    outa,HX_OUTPUT_MASK 
              andn    dira,HX_DBUS_MASK
              neg     XMM_Last,#1               ' force call to set XMM_SetAddr
XMM_Activate_ret
              ret
'
'XMM_Tristate : Give up the XMM bus. Call this to allow other cogs to use microSD etc.
'               To activate XMM again, call XMM_Activate.  
'
XMM_Tristate
              nop                               ' TBD
XMM_Tristate_ret
              ret
'
'
#ifdef NEED_XMM_READLONG
'
' XMM_ReadLong : Read long from XMM at address in XMM_Addr into the destination register
'                set up in XMM_Dest. XMM_Activate should be called at least once before
'                this routine is used.
' On entry:
'    XMM_Addr : address to read (up to 19 bits)
'    XMM_Dst  : destination of this instruction set to destination register
' On exit:
'    XMM_Addr and XMM_Page set up for fast access.
'    XMM_Addr incremented by 4.
'    Destination register contains long read from XMM.
'
'
' XMM_ReadMult : Read multiple bytes in source register to XMM at address XMM_Addr.
'                XMM_Activate should be called at least once before this routine is used.
' On entry:
'    XMM_Addr : address to read (up to 19 bits)
'    XMM_Dst  : destination of this instruction set to destination register
'    XMM_Len  : number of bytes to read (usually 1, 2 or 4)
' On exit:
'    XMM_Addr and XMM_Page set up for fast access.
'    XMM_Addr incremented by XMM_Len.
'    Destination register contains bytes read from XMM.
'
XMM_ReadLong
              mov     XMM_Len,#4                ' read 4 bytes
XMM_ReadMult
              call    #XMM_TestAndSetAddr       ' Test address and set if required
              mov     XMM_Temp,#0               '
              mov     XMM_Test,#32              ' set up number of bits to shift result
:XMM_Last_ok
              andn    dira,HX_DBUS_MASK         ' place data bus into read mode  
              ' command lines should already be in output mode,
              ' so only need to write 2-bit command code for read memory
              andn    outa,#HX_CTRL_MASK        ' clear control lines to "00", make hole for command
              or      outa,#HX_CMD_READ_SHIFT   ' outa = (outa & !HX_CTRL_MASK) | (HX_CMD_READ_SHIFT)
              add     XMM_Addr,XMM_Len          ' update XMM_Addr before we destroy XMM_Len 
:ReadLoop
              ' clock the strobe line and tell the sram controller to initiate the read and auto inc
              or      outa,HX_STROBE_MASK     ' strobe = 1
              ' data is now on bus, retrieve it...
              mov     outx,ina                  ' pull data from external pins
              shr     outx,#HX_DBUS_BIT_SHIFT   ' shift  data 16 time to the right [23..16] are data pins
              and     outx,#$FF                 ' mask the data to 8-bits
              or      XMM_Temp,outx
              ror     XMM_Temp,#8
              sub     XMM_Test,#8               ' update number of bits to shift result
              ' finally finish the clocking of the read
              andn    outa,HX_STROBE_MASK       ' strobe = 0
              djnz    XMM_Len,#:ReadLoop        ' repeat while XMM_len <> 0
              ror     XMM_Temp,XMM_Test         ' shift bytes into final position
XMM_Dst       mov     0-0, XMM_Temp             ' save the result
              ' reset data bus to input before leaving
#endif          
'
#ifdef NEED_XMM_READLONG
#ifndef NEED_XMM_RESETBUS
#define NEED_XMM_RESETBUS
#endif
#elseifdef NEED_XMM_WRITELONG
#ifndef NEED_XMM_RESETBUS
#define NEED_XMM_RESETBUS
#endif
#elseifdef NEED_XMM_READMULT
#ifndef NEED_XMM_RESETBUS
#define NEED_XMM_RESETBUS
#endif
#elseifdef NEED_XMM_WRITEMULT
#ifndef NEED_XMM_RESETBUS
#define NEED_XMM_RESETBUS
#endif
#elseifdef NEED_XMM_READPAGE
#ifndef NEED_XMM_RESETBUS
#define NEED_XMM_RESETBUS
#endif
#elseifdef NEED_XMM_WRITEPAGE
#ifndef NEED_XMM_RESETBUS
#define NEED_XMM_RESETBUS
#endif
#endif
'
#ifdef NEED_XMM_RESETBUS
XMM_ResetBus
              andn    outa,HX_OUTPUT_MASK 
              andn    dira,HX_DBUS_MASK
              mov     XMM_Last,XMM_Addr         ' update XMM_Last
XMM_ReadLong_ret
XMM_ReadMult_ret
XMM_ReadPage_ret
XMM_WriteLong_ret
XMM_WriteMult_ret
XMM_WritePage_ret
              ret
#endif              
'
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
' XMM_WriteMult : Write multiple bytes in source register to XMM at address XMM_Addr.
'                 XMM_Activate should be called at least once before this routine is used.
' On entry:
'    XMM_Addr : address to write (up to 19 bits)
'    XMM_Src  : source of this instruction set to source register
'    XMM_Len  : number of bytes to write (usually 1, 2 or 4)
' On exit:
'    XMM_Addr incremented by XMM_Len.
'
XMM_WriteLong
              mov     XMM_Len,#4                ' write 4 bytes
XMM_WriteMult
              call    #XMM_TestAndSetAddr       ' Test address and set if required
XMM_Src       mov     XMM_Temp,0-0              ' save the value
              or      dira,HX_DBUS_MASK         ' place data bus into write mode
              ' command lines should already be in output mode,
              ' so only need to write 2-bit command code for write memory
              andn    outa,#HX_CTRL_MASK        ' clear control lines to "00", make hole for command
              or      outa,#HX_CMD_WRITE_SHIFT  ' outa = (outa & !HX_CTRL_MASK) | (HX_CMD_WRITE_SHIFT)                                          
              add     XMM_Addr,XMM_Len          ' update XMM_Addr before we destroy XMM_Len 
:WriteLoop
              mov     outx,XMM_Temp
              and     outx,#$FF
              shl     outx,#HX_DBUS_BIT_SHIFT   ' shift data into position
              andn    outa,HX_DBUS_MASK         ' outa = (outa & !HX_DBUS_MASK), make hole for data
              or      outa,outx                 ' outa = (outa & !HX_DBUS_MASK) | (r0 << 16)                             
              ' clock the strobe line and tell the sram controller to complete the operation
              or      outa,HX_STROBE_MASK       ' strobe = 1
              andn    outa,HX_STROBE_MASK       ' strobe = 0
              ror     XMM_Temp, #8
              djnz    XMM_Len, #:WriteLoop      ' repeat while XMM_len <> 0
              ' reset data bus to input before leaving
              jmp     #XMM_ResetBus
'
#endif          
'
#ifdef NEED_XMM_WRITEPAGE              
'
' XMM_WritePage : Write bytes from Hub RAM to XMM RAM
' On entry:
'    XMM_Addr  (32-bit): destination address in sram, 19-bits used
'    Hub_Addr  (32-bit): source address in main memory, 16-bits used
'    XMM_Len   (32-bit): number of bytes to write. 
'
XMM_WritePage
              call    #XMM_SetAddr              ' setup ram address
              or      dira,HX_DBUS_MASK         ' place data bus into write mode
              ' command lines should already be in output mode,
              ' so only need to write 2-bit command code for write memory
              andn    outa,#HX_CTRL_MASK        ' clear control lines to "00", make hole for command
              or      outa,#HX_CMD_WRITE_SHIFT  ' outa = (outa & !HX_CTRL_MASK) | (HX_CMD_WRITE_SHIFT)                                          
:WriteLoop
              rdbyte  outx,Hub_Addr
              shl     outx,#HX_DBUS_BIT_SHIFT   ' shift data into position
              andn    outa,HX_DBUS_MASK         ' outa = (outa & !HX_DBUS_MASK), make hole for data
              or      outa,outx                 ' outa = (outa & !HX_DBUS_MASK) | (r0 << 16)                             
              ' clock the strobe line and tell the sram controller to complete the operation
              or      outa,HX_STROBE_MASK       ' strobe = 1
              andn    outa,HX_STROBE_MASK       ' strobe = 0
              add     Hub_Addr,#1               ' inc source address
              add     XMM_Addr,#1               ' inc dest address (XMM address auto increments)
              djnz    XMM_Len, #:WriteLoop      ' repeat while XMM_len <> 0
              ' reset data bus to input before leaving
              jmp     #XMM_ResetBus
'
#endif          
'
#ifdef NEED_XMM_READPAGE              
'
' XMM_ReadPage : Read bytes from XMM RAM to Hub RAM.
' On Entry: 
'    XMM_Addr  (32-bit): source address in sram, 19-bits used
'    Hub_Addr  (32-bit): destination address in main memory, 16-bits used
'    XMM_Len   (32-bit): number of bytes to read. 
'
XMM_ReadPage
              call    #XMM_SetAddr              ' setup ram address
              andn    dira,HX_DBUS_MASK         ' place data bus into read mode
              ' command lines should already be in output mode,
              ' so only need to write 2-bit command code for read memory
              andn    outa,#HX_CTRL_MASK        ' clear control lines to "00", make hole for command
              or      outa,#HX_CMD_READ_SHIFT   ' outa = (outa & !HX_CTRL_MASK) | (HX_CMD_READ_SHIFT)
:ReadLoop
              ' clock the strobe line and tell the sram controller to initiate the read and auto inc
              or      outa,HX_STROBE_MASK       ' strobe = 1
              mov     outx,ina                  ' read byte from source (XMM)
              shr     outx,#HX_DBUS_BIT_SHIFT
              ' finish the clocking of the read
              andn  outa, HX_STROBE_MASK        ' strobe = 0
              wrbyte  outx,Hub_Addr             ' write byte to destination (Hub)
              add     Hub_Addr,#1               ' inc dest address
              add     XMM_Addr,#1               ' inc src address (XMM address auto increments)
              djnz    XMM_Len,#:ReadLoop        ' repeat while XMM_len <> 0
              ' reset data bus to input before leaving
              jmp     #XMM_ResetBus
'
#endif          
'
'XMM_TestAndSetAddr : Setup XMM address if different from last address set.
'                     XMM_Activate should be called at least once before this
'                     routine is used.
'On Entry:
'   XMM_Addr : address to set (up to 19 bits)
'   XMM_Last : last address used
'On Exit:
'   XMM_Addr : preserved
'
'XMM_SetAddr : Setup initial XMM address. XMM_Activate should be called
'              at least once before this routine is used.
'On Entry:
'   XMM_Addr : address to set (up to 19 bits)
'On Exit:
'   XMM_Addr : preserved
'
XMM_TestAndSetAddr
              mov     XMM_Test,XMM_Addr         ' is our current address equal to ...
              sub     XMM_Test,XMM_Last         ' ... our last used XMM address?
              tjz     XMM_Test,#XMM_TestAndSetAddr_ret' yes - no need to set address
XMM_SetAddr
              ' place data bus into output mode
              or      dira,HX_DBUS_MASK
              ' place bits 7 .. 0 of 19-bit address onto data bus
              mov     outx,XMM_Addr
              call    #XMM_SetAddrByte
              or      outa,#HX_CMD_LOADLO_SHIFT ' outa = (outa & !HX_CTRL_MASK) | (HX_CMD_LOADLO_SHIFT)
              ' finally clock the strobe line and tell the sram controller to complete the operation
              or      outa,HX_STROBE_MASK       ' strobe = 1
              andn    outa,HX_STROBE_MASK       ' strobe = 0
              ' place bits 15 .. 8 of 19-bit address onto data bus
              mov     outx,XMM_Addr
              shr     outx,#8                   ' move upper 8-bits into lower 8-bits
              call    #XMM_SetAddrByte
              or      outa,#HX_CMD_LOADHI_SHIFT ' outa = (outa & !HX_CTRL_MASK) | (HX_CMD_LOADHI_SHIFT)
              ' finally clock the strobe line and tell the sram controller to complete the operation
              or      outa,HX_STROBE_MASK       ' strobe = 1
              andn    outa,HX_STROBE_MASK       ' strobe = 0
              ' place upper 19 .. 16 of 19-bit address onto data bus
              mov     outx,XMM_Addr
              shr     outx,#16                  ' move upper 3-bits into lower 3-bits
'             and     outx,#$07                 ' mask lower 3-bits (precaution)
              call    #XMM_SetAddrByte
              or      outa,#HX_CMD_LOADHI_SHIFT ' outa = (outa & !HX_CTRL_MASK) | (HX_CMD_LOADHI_SHIFT)
              ' finally clock the strobe line and tell the sram controller to complete the operation
              or      outa,HX_STROBE_MASK       ' strobe = 1
              andn    outa,HX_STROBE_MASK       ' strobe = 0
XMM_TestAndSetAddr_ret
XMM_SetAddr_ret
              ret

XMM_SetAddrByte
              and     outx,#$FF                 ' mask lower 8-bits
              shl     outx,#HX_DBUS_BIT_SHIFT   ' shift data into position
              andn    outa,HX_DBUS_MASK         ' outa = (outa & !HX_DBUS_MASK), make hole for data
              or      outa,outx                 ' outa = (outa & !HX_DBUS_MASK) | (outc << 16)
              ' command lines should already be in output mode,
              ' so only need to write 2-bit command code for load low address
              andn    outa,#HX_CTRL_MASK        ' clear control lines to "00", make hole for command
XMM_SetAddrByte_ret
              ret
 
'
' XMM variables
'
outx          long    $0
'
XMM_Temp      long    $0
XMM_Last      long    $FFFFFFFF                 ' last Addr used to access XMM
XMM_Test      long    $0
'
' 32-bit constants, masks, anything that is greater than 9-bits and can't be represented as an immediate
'
HX_DBUS_MASK    long      %0000_0000_1111_1111_0000_0000_0000_0000
HX_STROBE_MASK  long      %0100_0000_0000_0000_0000_0000_0000_0000
HX_OUTPUT_MASK  long      %0100_0000_1111_1111_0000_0000_0000_0110
'
'----------------------- End of HX512 XMM Support Routines ---------------------
'
