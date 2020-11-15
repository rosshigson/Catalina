{
'
'---------------------- TRIBLADEPROP XMM Support Routines ----------------------
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
#ifdef CPU_1

'------------------ TRIBLADEPROP CPU #1 XMM Support Routines -------------------
'
' XMM_Activate : Activate the XMM bus - latches -CE(U23)=0 A19=0 A20=0
'                and makes LE=0 and output. 
'
XMM_Activate
              mov     outa, ram_enable          ' -WE=1 LE=1, -CE = 0 
              mov     dira, ram_dir_read        ' enable bits (for init & wrblock)
              xor     outa, ram_LE_bit          ' LE= 1 -> 0 (latch)
              mov     dira, ram_LE_bit          ' only LE is output
              neg     XMM_Last,#1               ' next call to XMM_SetAddr latches page
XMM_Activate_ret
              ret
'
'XMM_Tristate : Give up the XMM bus. Use this to use other hardware that shares
'               pins with the XMM RAM. To reactivate the XMM bus, call XMM_Activate
'            
XMM_Tristate
              mov     dira, #0                  ' all inputs
              mov     outa, #0                  ' and =0
XMM_Tristate_ret
              ret
'
#ifdef NEED_XMM_READLONG              
'
'
' XMM_ReadLong : Read long from XMM at address in XMM_Addr into the destination register
'                set up in XMM_Dest. XMM_Activate should be called at least once before
'                this routine is used.
' On entry:
'    XMM_Addr : address to read (19 bits)
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
'    XMM_Addr : address to read (19 bits)
'    XMM_Dst  : destination of this instruction set to destination register
'    XMM_Len  : number of bytes to read (usually 1, 2 or 4)
' On exit:
'    XMM_Addr and XMM_Page set up for fast access.
'    XMM_Addr incremented by XMM_Len.
'    Destination register contains long read from XMM.
'
' NOTE:  Does not use XMM_IncAddr, but instead increments address directly -
'        this means this routine will only work for longs entirely WITHIN a
'        page - but this should be true for all properly aligned long values.
'        
XMM_ReadLong
              mov     XMM_Len,#4                ' read 4 bytes
XMM_ReadMult
              call    #XMM_SetAddr              ' latch ram address
              mov     XMM_Temp,#0               '
              mov     XMM_Test,#32              ' set up number of bits to shift result
:ReadLoop
              mov     outx, ina                 ' read byte from SRAM
              and     outx, #$FF                ' mask the data to 8-bits
              or      XMM_Temp,outx
              ror     XMM_Temp,#8
              sub     XMM_Test,#8               ' update number of bits to shift result 
              add     outa,XMM_Inc              ' inc sram address (no page change)
              djnz    XMM_Len, #:ReadLoop       ' repeat while XMM_len <> 0
              ror     XMM_Temp,XMM_Test         ' shift bytes into final position
XMM_Dst       mov     0-0, XMM_Temp             ' save the result
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
'    XMM_Addr : (32-bit) address to write (19 bits)
'    XMM_Src  : source of this instruction set to source register
' On exit:
'    XMM_Addr and XMM_Page shifted into position for fast use. 
'    XMM_Addr incremented by 4.
'
'
' XMM_WriteMult : Write multiple bytes in source register to XMM at address XMM_Addr.
'                 XMM_Activate should be called at least once before this routine is used.
' On entry:
'    XMM_Addr : address to write (19 bits)
'    XMM_Src  : source of this instruction set to source register
'    XMM_Len  : number of bytes to write (usually 1, 2 or 4)
' On exit:
'    XMM_Addr and XMM_Page shifted into position for fast use. 
'    XMM_Addr incremented by XMM_Len.
'
' NOTE:  Does not use XMM_IncAddr, but instead increments address directly -
'        this means this routine will only work for longs entirely WITHIN a
'        page - but this should be true for all properly aligned long values.
'
XMM_WriteLong
              mov     XMM_Len,#4                ' write 4 bytes
XMM_WriteMult
              call    #XMM_SetAddr              ' latch ram address
XMM_Src       mov     XMM_Temp,0-0              ' save the value
              mov     dira, ram_dir_write       ' set outputs for write
:WriteLoop
              mov     outx,XMM_Temp
              and     outx,#$FF
              or      outx,XMM_Addr
              mov     outa, outx                ' write byte to SRAM
              xor     outa, ram_WE_bit          ' -WE= 1 -> 0  \\ write pulse
              nop                               ' sram delay   ||
              xor     outa, ram_WE_bit          ' -WE= 0 -> 1  //
              ror     XMM_Temp, #8
              add     XMM_Addr,XMM_Inc          ' inc sram address (no page change)
              djnz    XMM_Len, #:WriteLoop      ' repeat while XMM_len <> 0
              mov     dira,ram_dir_read         ' set outputs for read again
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
'    XMM_Addr  (32-bit): destination address in sram, 19-bits used
'    Hub_Addr  (32-bit): source address in main memory, 16-bits used
'    XMM_Len   (32-bit): number of bytes to write. 
'
' NOTE:  Uses XMM_IncAddr, which is slower than incrementing the address directly,
'        but it means pages can be correctly read across page boundaries.
'
XMM_WritePage
              call    #XMM_SetAddr              ' latch ram address
              mov     dira, ram_dir_write       ' set outputs for write
:WriteLoop
              rdbyte  outx, Hub_Addr
              or      outx,XMM_Addr
              mov     outa, outx                ' write byte to SRAM
              xor     outa, ram_WE_bit          ' -WE= 1 -> 0  \\ write pulse
              nop                               ' sram delay   ||
              xor     outa, ram_WE_bit          ' -WE= 0 -> 1  //
              add     Hub_Addr, #1              ' inc source address
              call    #XMM_IncAddr              ' inc sram address  (autoinc page)
              djnz    XMM_Len, #:WriteLoop      ' repeat while XMM_len <> 0
              mov     dira,ram_dir_read         ' set outputs for read again
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
'    XMM_Addr  (32-bit): source address in sram, 19-bits used
'    Hub_Addr  (32-bit): destination address in main memory, 16-bits used
'    XMM_Len   (32-bit): number of bytes to read. 
'
' NOTE:  Uses XMM_IncAddr, which is slower than incrementing the address directly,
'        but it means pages can be correctly read across page boundaries.
'
XMM_ReadPage
              call    #XMM_SetAddr              ' latch ram address
:ReadLoop
              mov     outx, ina                 ' read byte from source (XMM)
              wrbyte  outx, Hub_Addr            ' write byte to destination (Hub)
              add     Hub_Addr, #1              ' inc dest address
              call    #XMM_IncAddr              ' inc sram address (autoinc page)
              mov     outx,XMM_Addr
              or      outx,ram_latched         ' -WE=1 LE=0 + address<<16
              mov     outa,outx                ' setup address incl -WE=1 LE=0
              djnz    XMM_Len, #:ReadLoop       ' repeat while XMM_len <> 0
XMM_ReadPage_ret
              ret
'
#endif              
'
'XMM_SetAddr : Setup initial XMM address. XMM_Activate should be called
'              at least once before this routine is used.
'On Entry:
'   XMM_Addr : address to set (19 bits)
'On Exit:
'   XMM_Addr : 19 bits of address, shifted into position for fast use.
'   XMM_Last : 8 bits of page, shifted into position for fast use
'
XMM_SetAddr
              or      dira,ram_dir_read         ' set outputs for read
              mov     XMM_Page,XMM_Addr         ' shift  ...
              shl     XMM_Page,#5               ' ... ram page ...
              and     XMM_Page,ram_page_shft    ' ... into position for latching
              mov     XMM_Test,XMM_Page         ' same page ...
              sub     XMM_Test,XMM_Last         ' ... as last page ?
              tjz     XMM_Test,#XMM_OutAddr     ' yes - just output the address
              mov     XMM_Last,XMM_Page         ' no - save new page
              mov     outx,ram_enable           ' -WE=1 LE=1, -CE = 0
              or      outx,XMM_Page             ' include page 
              mov     outa,outx                 ' -WE=1 LE=1, -CE = 0
              xor     outa,ram_LE_bit           ' LE= 1 -> 0 (latch)
XMM_OutAddr
              shl     XMM_Addr,#16              ' extract address in page ...
              and     XMM_Addr,ram_addr_shft    ' ... and shift into position
              or      XMM_Addr,ram_latched      ' -WE=1 LE=0 + address<<16
              mov     outx,XMM_Addr
              mov     outa,outx                 ' setup address incl -WE=1 LE=0
XMM_SetAddr_ret
              ret
'
#ifdef NEED_XMM_INCADDR              
'
'XMM_IncAddr : Increment XMM address, changing page if necessary. XMM_SetAddr
'              must be called at least once before this routine is used, to
'              separate address bits from page/chip bits, and shift them into
'              the correct position for use.
'On Entry:
'   XMM_Addr : 11 bits of address, shifted into position for fast use.
'   XMM_Last : 8 bits of page, shifted into position for fast use.
'On Exit:
'   XMM_Addr : incremented (wraps within page)
'   XMM_Last : incremented if the page number changes (and latch updated).
'
' NOTES: While slower than incrementing the memory address directly, this
'        routine automatically copes with XMM page changes.
'
XMM_IncAddr
              add     XMM_Addr,XMM_Inc          ' inc shifted sram address
              mov     XMM_Test,XMM_Addr         ' is result of incrementing ...
              and     XMM_Test,ram_addr_shft    ' ... address zero (i.e. on next page)?
              tjnz    XMM_Test,#XMM_IncAddr_ret ' no - done
              add     XMM_Last,XMM_Inc          ' yes - increment ...
              and     XMM_Last,ram_page_shft    ' ... page instead 
              shr     XMM_Last,#5               ' rebuild ...
              mov     XMM_Addr,XMM_Last         ' ... full address ...
              neg     XMM_Last,#1               ' ... and force latching of new page
              call    #XMM_SetAddr              ' set new address and page 
XMM_IncAddr_ret
              ret
'
#endif
'
' TriBladeProp CPU #1 Hardware Access:
'
'               MOUSE ---------+         +-------- VGA/TV                                      
'               MOUSE --------+|         |+------- VGA/TV                  
'                  KB -------+||         ||+------ VGA/TV                   
'     -CE/-CS ---- KB -----+ |||         |||+----- VGA/TV                   
'  LE/CLK/SCL ------------+| |||         ||||+---- VGA/MOUSE    
'     -WE/SDA -----------+|| |||         |||||+--- VGA/MOUSE                                    
'    (P30) SO ----------+||| |||         ||||||+-- VGA/KB                                        
'    (P31) SI ---------+|||| |||         |||||||+- VGA/KB                                     
'                      ||||| |||         ||||||||                                                          
ram_WE_bit    long    %00100_00000000000_00000000_00000000 ' WE bit
ram_LE_bit    long    %00010_00000000000_00000000_00000000 ' LE bit
ram_latched   long    %00100_00000000000_00000000_00000000 ' -WE=1 LE=0
ram_enable    long    %00110_00000000000_00000000_00000000 ' -WE=1 LE=1 + -CE = 0
ram_dir_read  long    %00111_11111111111_00000000_00000000 ' outputs = WE, LE, A0-18, inputs D0-7
ram_dir_write long    %00111_11111111111_00000000_11111111 ' outputs = WE, LE, A0-18, D0-7
ram_addr_shft long    %00000_11111111111_00000000_00000000 ' address in 2k page (shifted into position)
ram_page_shft long    %00000_00011111111_00000000_00000000 ' 2k page (shifted into position)
'                            A10......A0          D7....D0
'                               Q7....Q0
'                               |      |
'                               +------+
'                                  ||
'                             Latched pins
'                             (A18 .. A11)         
'                            passes when LE=1                                            
'                            latches on  LE low going edge
'                            latched on  LE=0             
'
outx          long      0                       ' as a temp address + WE/OE/LE bits
'
XMM_Page      long      0                       ' current page
XMM_Last      long      -1                      ' last page - initially set to impossible value
XMM_Temp      long      0
XMM_Inc       long      1 << 16                 ' 1 shifted for incrementing addr/page
XMM_Test      long      0
'
'--------------- End of TRIBLADEPROP CPU #1 XMM Support Routines --------------
'
#elseifdef CPU_3
'
#error : TRIBLADEPROP HAS NO XMM RAM ON CPU_3
'
#else
'
'------------------ TRIBLADEPROP CPU #2 XMM Support Routines ------------------
'
' XMM_Activate : activate the XMM bus - latches -CE(U23)=0 A19=0 A20=0
'                and makes LE=0 and output. 
'
XMM_Activate
              mov     outa, ram_enable_lo       ' put latch back to SRAM=U23
              mov     dira, ram_dir_read        ' enable bits (for init & wrblock)
              xor     outa, ram_LE_bit          ' LE= 1 -> 0 (latch)
              mov     dira, ram_LE_bit          ' only LE is output
              neg     XMM_Last,#1               ' next call to XMM_SetAddr latches page
XMM_Activate_ret
              ret
'
'XMM_Tristate : Give up the XMM bus. Call this to allow other cogs to use microSD etc.
'               To activate XMM again, call XMM_Activate. Note that to avoid resetting
'               the other CPUs, and also so that the other cogs do not corrupt the
'               XMM RAM, we leave RST1,RST3 and the RAM chip selects high - this means
'               the other cogs cannot use XMM RAM or reset the other CPUs - if this
'               is required then this function may need to be modified - but carefully! 
'
XMM_Tristate
              mov     dira,ram_tristate         ' make sure RST1,RST3,CS(U23) and CS(U24) ...
              mov     outa,ram_tristate         ' ... remain output and high - others are inputs
XMM_Tristate_ret
              ret
'
#ifdef NEED_XMM_READLONG              
'
' XMM_ReadLong : Read long from XMM at address in XMM_Addr into the destination register
'                set up in XMM_Dest. XMM_Activate should be called at least once before
'                this routine is used.
' On entry:
'    XMM_Addr : address to read (up to 21 bits)
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
'    XMM_Addr : address to read (up to 21 bits)
'    XMM_Dst  : destination of this instruction set to destination register
'    XMM_Len  : number of bytes to read (usually 1, 2 or 4)
' On exit:
'    XMM_Addr and XMM_Page set up for fast access.
'    XMM_Addr incremented by XMM_Len.
'    Destination register contains bytes read from XMM.
'
' NOTE:  Does not use XMM_IncAddr, but instead increments address directly -
'        this means this routine will only work for longs entirely WITHIN a
'        page - but this should be true for all properly aligned long values.
'        
XMM_ReadLong
              mov     XMM_Len,#4                ' read 4 bytes
XMM_ReadMult
              call    #XMM_SetAddr              ' latch ram address
              mov     XMM_Temp,#0               '
              mov     XMM_Test,#32              ' set up number of bits to shift result
              xor     outa, ram_OE_bit          ' -OE = 1 -> 0
:ReadLoop
              mov     outx, ina                 ' read byte from SRAM
              and     outx, #$FF                ' mask the data to 8-bits
              or      XMM_Temp,outx
              ror     XMM_Temp,#8
              sub     XMM_Test,#8               ' update number of bits to shift result 
              add     outa,XMM_Inc              ' inc sram address (no page change)
              djnz    XMM_Len, #:ReadLoop       ' repeat while XMM_len <> 0
              ror     XMM_Temp,XMM_Test         ' shift bytes into final position
XMM_Dst       mov     0-0, XMM_Temp             ' save the result
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
'    XMM_Addr : (32-bit) address to write (up to 21 bits)
'    XMM_Src  : source of this instruction set to source register
' On exit:
'    XMM_Addr and XMM_Page shifted into position for fast use. 
'    XMM_Addr incremented by 4.
'
'
' XMM_WriteMult : Write multiple bytes in source register to XMM at address XMM_Addr.
'                 XMM_Activate should be called at least once before this routine is used.
' On entry:
'    XMM_Addr : address to write (up to 21 bits)
'    XMM_Src  : source of this instruction set to source register
'    XMM_Len  : number of bytes to write (usually 1, 2 or 4)
' On exit:
'    XMM_Addr and XMM_Page shifted into position for fast use.
'    XMM_Addr incremented by XMM_Len.
'
' NOTE:  Does not use XMM_IncAddr, but instead increments address directly -
'        this means this routine will only work for longs entirely WITHIN a
'        page - but this should be true for all properly aligned long values.
'
XMM_WriteLong
              mov     XMM_Len,#4                ' write 4 bytes
XMM_WriteMult
              call    #XMM_SetAddr              ' latch ram address
XMM_Src       mov     XMM_Temp,0-0              ' save the value
              mov     dira, ram_dir_write       ' set outputs for write
:WriteLoop
              mov     outx,XMM_Temp
              and     outx,#$FF
              or      outx,XMM_Addr
              mov     outa, outx                ' write byte to SRAM
              xor     outa, ram_WE_bit          ' -WE= 1 -> 0  \\ write pulse
              nop                               ' sram delay   ||
              xor     outa, ram_WE_bit          ' -WE= 0 -> 1  //
              ror     XMM_Temp, #8
              add     XMM_Addr,XMM_Inc          ' inc sram address (no page change)
              djnz    XMM_Len, #:WriteLoop      ' repeat while XMM_len <> 0
              mov     dira,ram_dir_read         ' set outputs for read again
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
'    XMM_Addr  (32-bit): destination address in sram, 21-bits used
'    Hub_Addr  (32-bit): source address in main memory, 16-bits used
'    XMM_Len   (32-bit): number of bytes to write. 
'
' NOTE:  Uses XMM_IncAddr, which is slower than incrementing the address directly,
'        but it means bytes can be correctly read across SRAM page boundaries.
'
XMM_WritePage
              call    #XMM_SetAddr              ' latch ram address
              mov     dira, ram_dir_write       ' set outputs for write
:WriteLoop
              rdbyte  outx, Hub_Addr
              or      outx,XMM_Addr
              mov     outa, outx                ' write byte to SRAM
              xor     outa, ram_WE_bit          ' -WE= 1 -> 0  \\ write pulse
              nop                               ' sram delay   ||
              xor     outa, ram_WE_bit          ' -WE= 0 -> 1  //
              add     Hub_Addr, #1              ' inc source address
              call    #XMM_IncAddr              ' inc sram address  (autoinc page)
              djnz    XMM_Len, #:WriteLoop      ' repeat while XMM_len <> 0
              mov     dira,ram_dir_read         ' set outputs for read again
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
'    XMM_Addr  (32-bit): source address in sram, 21-bits used
'    Hub_Addr  (32-bit): destination address in main memory, 16-bits used
'    XMM_Len   (32-bit): number of bytes to read. 
'
' NOTE:  Uses XMM_IncAddr, which is slower than incrementing the address directly,
'        but it means bytes can be correctly read across SRAM page boundaries.
'
XMM_ReadPage
              call    #XMM_SetAddr              ' latch ram address
              xor     outa, ram_OE_bit          ' -OE = 1 -> 0
:ReadLoop
              mov     outx, ina                 ' read byte from source (XMM)
              wrbyte  outx, Hub_Addr            ' write byte to destination (Hub)
              add     Hub_Addr, #1              ' inc dest address
              call    #XMM_IncAddr              ' inc sram address (autoinc page)
              mov     outa, XMM_Addr            ' setup address incl -WE=1 -OE=1 LE=0
              xor     outa, ram_OE_bit          ' -OE = 1 -> 0
              djnz    XMM_Len, #:ReadLoop       ' repeat while XMM_len <> 0
XMM_ReadPage_ret
              ret
'
#endif
'
'XMM_SetAddr : Setup initial XMM address. XMM_Activate should be called
'              at least once before this routine is used.
'On Entry:
'   XMM_Addr : address to set (up to 21 bits)
'On Exit:
'   XMM_Addr : 19 bits of ram address bits, shifted into position for use.
'   XMM_Last : up to 3 bits of page/chip select bits, shifted into position for use.
'
XMM_SetAddr
              mov     dira, ram_dir_read        ' set outputs
              mov     XMM_Page,XMM_Addr         ' shift ...
              shr     XMM_Page,#11              ' ... SRAM page/chip bits ...
              and     XMM_Page,ram_pacs_shft    ' ... into position
              mov     XMM_Test,XMM_Page         ' same SRAM page/chip ...
              sub     XMM_Test,XMM_Last         ' ... as last used?
              tjz     XMM_Test,#XMM_OutAddr     ' yes - just output the address
              muxnz   XMM_Test,#1               ' no - save Z flag
              test    XMM_Page,ram_chip_shft wz ' test SRAM chip select bit
       if_z   mov     outx, ram_enable_lo       ' -WE=1 -OE=1 LE=1, -CE(U23 SRAM) = 0 (A19-20=0)
       if_nz  mov     outx, ram_enable_hi       ' -WE=1 -OE=1 LE=1, -CE(U24 SRAM) = 0 (A19-20=0)
              cmp     XMM_Test,#0 wz            ' restore Z flag
              mov     XMM_Last,XMM_Page         ' save new SRAM page/chip bits 
              and     XMM_Page,ram_page_shft    ' use SRAM page bits ...
              or      outx, XMM_Page            ' ... for latching
              mov     outa, outx                ' -WE=1 -OE=1 LE=1, -CE(U23)=0 or -CE(U24)= 0 (A19-20= page)
              xor     outa, ram_LE_bit          ' LE= 1 -> 0 (latch)
XMM_OutAddr
              shl     XMM_Addr,#8               ' shift address bits into position ...
              and     XMM_Addr,ram_addr_shft    ' ... and mask off page/chip bits
              or      XMM_Addr, ram_latched     ' -WE=1 -OE=1 LE=0 + address<<8
              mov     outa, XMM_Addr            ' setup address incl -WE=1 -OE=1 LE=0
XMM_SetAddr_ret
              ret
'
#ifdef NEED_XMM_INCADDR              
'
'
'XMM_IncAddr : Increment XMM address, changing page if necessary. XMM_SetAddr
'              must be called at least once before this routine is used, to
'              separate address bits from page/chip bits, and shift them into
'              the correct position for use.
'On Entry:
'   XMM_Addr : 22 bits of address, shifted into position for fast use.
'   XMM_Last : up to 3 bits of page/chip select, shifted into position for fast use
'On Exit:
'   XMM_Addr : incremented (wraps within page)
'   XMM_Page : incremented if the page number changes (and latch updated).
'
' NOTES: While slower than incrementing the memory address directly, this
'        routine automatically copes with XMM page changes.
'
XMM_IncAddr
              add     XMM_Addr,XMM_Inc          ' inc shifted sram address
              mov     XMM_Test,XMM_Addr         ' is result of incrementing ...
              and     XMM_Test,ram_addr_shft    ' ... address zero (i.e. on next page)?
              tjnz    XMM_Test,#XMM_IncAddr_ret ' no - done
              add     XMM_Last,XMM_Inc          ' yes - increment ...
              and     XMM_Last,ram_page_shft    ' ... page instead 
              shl     XMM_Last,#11              ' rebuilt ...
              mov     XMM_Addr,XMM_Last         ' ... full address ...
              neg     XMM_Last,#1               ' ... and force latching of new page
              call    #XMM_SetAddr              ' set new address and page 
XMM_IncAddr_ret
              ret
'
#endif              
'
' TriBladeProp CPU #2 Hardware Access:
'
'                                        +-------- -CS (U26 FLASH)   -+                                    
'                                        |+------- -CS (J22 microSD)  +- Latched pins...                   
'                                        ||+------ -RST3              |    passes when LE=1                
'           (P30) SO ---+                |||+----- -RST1              |    latches on  LE low going edge   
'           (P31) SI --+|                ||||+---- -CE (U24 SRAM-hi)  |    latched on  LE=0                
'                      ||+---- -WE(SDA)  |||||+--- -CE (U23 SRAM-lo)  |                                    
'                      |||+--- -OE(SCL)  ||||||+-- A20                |                                    
'                      ||||+--  LE       |||||||+- A19               -+                                    
'                      |||||             ||||||||                                                          
ram_WE_bit    long    %00100_00000000000_00000000_00000000 ' WE bit
ram_OE_bit    long    %00010_00000000000_00000000_00000000 ' OE bit
ram_LE_bit    long    %00001_00000000000_00000000_00000000 ' LE bit
ram_latched   long    %00110_00000000000_00000000_00000000 ' -WE=1 -OE=1 LE=0                                 
ram_enable_lo long    %00111_00000000000_11111000_00000000 ' -WE=1 -OE=1 LE=1 + -CE(U23 SRAM) = 0 (A19-20=0)
ram_enable_hi long    %00111_00000000000_11110100_00000000 ' -WE=1 -OE=1 LE=1 + -CE(U24 SRAM) = 0 (A19-20=0)
ram_dir_read  long    %00111_11111111111_11111111_00000000 ' outputs = WE, OE, LE, A0-18, inputs D0-7
ram_dir_write long    %00111_11111111111_11111111_11111111 ' outputs = WE, OE, LE, A0-18, D0-7
ram_addr_shft long    %00000_11111111111_11111111_00000000 ' SRAM address bits (any SRAM size), in position
ram_pacs_shft long    %00000_00000000000_00000111_00000000 ' SRAM page/chip bits (any SRAM size), in position
ram_page_shft long    %00000_00000000000_00000011_00000000 ' SRAM page bits only (any SRAM size), in position
ram_tristate  long    %00000_00000000000_00111100_00000000 ' -RST1=1, -RST3=1, -CE(U24)=1, -CE(U23)=1
'                            +---------+ +------+ +------+
'                            A18......A8 A7....A0 D7....D0
'                                        Q7....Q0
'
' The following value depends on the type of RAM chips installed:
'
ram_chip_shft long    %00000_00000000000_00000001_00000000 ' SRAM chip select bit (for 512Kb SRAM), in position 
'
outx          long      0                       ' as a temp address + WE/OE/LE bits
'
XMM_Page      long      0                       ' current page
XMM_Last      long      -1                      ' last page - initially set to impossible value
XMM_Temp      long      0
XMM_Inc       long      1 << 8                  ' 1 shifted for incrementing addr/page
XMM_Test      long      0
'
'----------------- End of TRIBLADEPROP CPU #2 XMM Support Routines -------------
'
#endif
'
'----------------- End of TRIBLADEPROP XMM Support Routines --------------------
'
