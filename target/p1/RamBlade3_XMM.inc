'' +--------------------------------------------------------------------------+
'' | Cluso's RamBlade3:  RAMBLADE3 XMM Support Routines                  v0.91|
'' +--------------------------------------------------------------------------+
'' RR20120803   v0.91  for Catalina 3.6 (XMM_Addr, XMM_Len & Hub_Addr now defined in Catalina_XMM.spin)

#ifdef USE_FLASH
  ERROR : FLASH NOT SUPPORTED ON THIS PLATFORM
#endif
'
' XMM_Activate : activate the XMM bus - set pin directions and CE for read
'
XMM_Activate
              mov     outa, ram_chip_enable     ' zero all outputs except ram chip enable
              mov     dira, ram_dir_read        ' set address & -CE & OE bits as outputs
XMM_Activate_ret
              ret
'
'XMM_Tristate : Give up the XMM bus. Call this to allow other cogs to use other devices.
'
XMM_Tristate
              mov     dira, ram_chip_enable    ' disable all outputs except ram chip enable (which will be high)
XMM_Tristate_ret
              ret
'
#ifdef NEED_XMM_READLONG              
'
' XMM_ReadLong : Read long from XMM at address XMM_Addr into the destination register XMM_Dest. 
'                XMM_Activate should be called at least once before this routine is used.
' On entry:
'    XMM_Addr : address to read (up to 19 bits)
'    XMM_Dst  : destination of this instruction set to destination register
' On exit:
'    XMM_Addr incremented by 4.
'    Destination register contains long read from XMM.
'
'
' XMM_ReadMult : Read multiple bytes from XMM at address XMM_Addr into destination register XMM_Dest.
'                XMM_Activate should be called at least once before this routine is used.
' On entry:
'    XMM_Addr : address to read (up to 19 bits)
'    XMM_Dst  : destination of this instruction set to destination register
'    XMM_Len  : number of bytes to read (usually 1, 2 or 4)
' On exit:
'    XMM_Addr incremented by XMM_Len.
'    Destination register contains bytes read from XMM.
'
XMM_ReadLong
              andn    outa, ram_chip_enable
              and     XMM_Addr, ram_addr_only   ' mask address to 19 bits    (required???)
              mov     outa, XMM_Addr            ' output the address (-CE=-WE=-OE=0, -WE is t/s --> Read)
              add     XMM_Addr, #4              ' inc XMM_Addr         (required???)

              mov     XMM_Temp, ina             ' read byte 1 from SRAM
              add     outa, #1                  ' inc sram address
              and     XMM_Temp, ram_data_only   ' clear unwanted bits ...
              shr     XMM_Temp, #19             ' ... shift into position ...

              mov     outx, ina                 ' read byte 2 from SRAM
              add     outa, #1                  ' inc sram address
              and     outx, ram_data_only       ' clear unwanted bits ...
              shr     outx, #11                 ' ... shift into posn 15-8 ...
              or      XMM_Temp, outx            ' ... and add them in

              mov     outx, ina                 ' read byte 3 from SRAM
              add     outa, #1                  ' inc sram address
              and     outx, ram_data_only       ' clear unwanted bits ...
              shr     outx, #3                  ' ... shift into posn 23-16 ...
              or      XMM_Temp, outx            ' ... and add them in

              mov     outx, ina                 ' read byte 4 from SRAM
              and     outx, ram_data_only       ' clear unwanted bits ...
              shl     outx, #5                  ' shift into posn 31-24 ...
              or      XMM_Temp, outx            ' ... and add them in

XMM_Dst       mov     0-0, XMM_Temp             ' save the result
              or      outa, ram_chip_enable
              
XMM_ReadLong_ret
XMM_ReadMult_ret
              ret

'
' XMM_ReadMult : Read multiple bytes from XMM at address XMM_Addr into destination register XMM_Dest.
'                XMM_Activate should be called at least once before this routine is used.
' On entry:
'    XMM_Addr : address to read (up to 19 bits)
'    XMM_Dst  : destination of this instruction set to destination register
'    XMM_Len  : number of bytes to read (usually 1, 2 or 4)
' On exit:
'    XMM_Addr incremented by XMM_Len.
'    Destination register contains bytes read from XMM.
'
XMM_ReadMult
              andn    outa, ram_chip_enable
              and     XMM_Addr, ram_addr_only   ' mask address to 19 bits    (required???)
              mov     outa, XMM_Addr            ' output the address (-CE=-WE=-OE=0, -WE is t/s --> Read)
              add     XMM_Addr, XMM_Len         ' inc XMM_Addr         (required???)
              mov     XMM_Temp,#0               ' clear output
              mov     XMM_Test,#32              ' set up number of bits to shift result
:ReadLoop
              mov     outx, ina                 ' read byte from SRAM
              add     outa, #1                  ' inc sram address
              and     outx, ram_data_only       ' clear unwanted bits ...
              shr     outx, #19                 ' ... shift into position ...
              or      XMM_Temp, outx            ' ... and add them in ...
              ror     XMM_Temp,#8               ' ... then shift for next byte
              sub     XMM_Test,#8               ' update number of bits to shift result 
              djnz    XMM_Len, #:ReadLoop       ' repeat while XMM_len <> 0

              ror     XMM_Temp,XMM_Test         ' shift bytes into final position
              jmp     #XMM_Dst                   ' go save and finish up

'
#endif          
'
#ifdef NEED_XMM_WRITELONG              
'
' XMM_WriteLong : Write long in source register to XMM at address XMM_Addr.
'                 XMM_Activate should be called at least once before this routine is used.
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
              mov     XMM_Len, #4               ' write 4 bytes
XMM_WriteMult
              andn    outa, ram_chip_enable
              and     XMM_Addr, ram_addr_only   ' mask address to 19 bits    (required???)
XMM_Src       mov     XMM_Temp, 0-0             ' get the value to write
              mov     dira, ram_dir_write       ' set bits for write (addr, data, -CE; but -WE=t/s)
:WriteLoop
              mov     outx, XMM_Temp            ' set up output ...
              and     outx, #$FF                ' ... extract 8 data bits ...
              shl     outx, #19                   ' ... shift into posn ...
              or      outx, XMM_Addr            ' ... add addr bits
              mov     outa, outx
              nop                               ' delay may not be required

              mov     dira, ram_dir_wstrobe     ' now -WE->0 for write strobe
              shr     XMM_Temp, #8              ' prepare for next set of data bits
              add     XMM_Addr, #1              ' inc XMM address       
              mov     dira, ram_dir_write       ' set bits for write (addr, data, -CE; but -WE=t/s)
              djnz    XMM_Len, #:WriteLoop      ' repeat while XMM_len <> 0

              mov     dira, ram_dir_read        ' set default back to read
              or      outa, ram_chip_enable
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
'    XMM_Addr  (32-bit): destination address in sram, 19-bits used
'    Hub_Addr  (32-bit): source address in main memory, 16-bits used
'    XMM_Len   (32-bit): number of bytes to write. 
'
XMM_WritePage
              andn    outa, ram_chip_enable
              and     XMM_Addr, ram_addr_only   ' mask address to 19 bits    (required???)
              mov     dira, ram_dir_write       ' set bits for write (addr, data, -CE; but -WE=t/s)
:WriteLoop
              rdbyte  outx, Hub_Addr            ' set up output...
              shl     outx, #19                 ' ... shift into posn ...
              or      outx, XMM_Addr            ' ... add addr bits ...
              mov     outa,outx                 ' ... and output
              nop                               ' delay may not be required

              mov     dira, ram_dir_wstrobe     ' now -WE->0 for write strobe
              add     Hub_Addr, #1              ' inc source address
              add     XMM_Addr, #1              ' inc XMM address
              mov     dira, ram_dir_write       ' set bits for write (addr, data, -CE; but -WE=t/s)
              djnz    XMM_Len, #:WriteLoop      ' repeat while XMM_len <> 0

              mov     dira, ram_dir_read        ' set default back to read
              or      outa, ram_chip_enable
XMM_WritePage_ret
              ret

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
              andn    outa ,ram_chip_enable
              and     XMM_Addr, ram_addr_only   ' mask address to 19 bits    (required???)
              mov     outa, XMM_Addr            ' output the address (-CE=-WE=-OE=0, -WE is t/s --> Read)
              add     XMM_Addr, XMM_Len         ' inc XMM_Addr         (required???)      
:ReadLoop
              mov     outx, ina                 ' read byte from SRAM
              add     outa, #1                  ' inc sram address 
              shr     outx, #19                 ' move bits into position
              wrbyte  outx, Hub_Addr            ' write byte to destination (Hub)
              add     Hub_Addr, #1              ' inc dest address
              djnz    XMM_Len, #:ReadLoop       ' repeat while XMM_len <> 0

              or      outa, ram_chip_enable
XMM_ReadPage_ret
              ret
'
#endif
'
'
'' +--------------------------------------------------------------------------+
'' | Cluso's RamBlade3:  Hardware Access                                      |
'' +--------------------------------------------------------------------------+
'
'                  SRAM           +-------  -CS (microSD) (P23)
'                   -CE -----+    |+-------  DI (microSD) (P22)
'       (P28) SCL & -OE ----+|    ||+------ CLK (microSD) (P21) 
'       (P29) SDA & -WE ---+||    |||+-----  DO (microSD) (P20)
'       (P30) SO ---------+|||    ||||    
'       (P31) SI --------+||||    |||| 
'                        ||||| ||||||||
'          P31...P0 --> %00xxx_xxxxxxxx_xxxxxxxxxxxxxxxxxxx
'          10K pullups     yyy    y                         ' y=yes
'                              +------+ +-----------------+
'                        xxWRE D7....D0 A18..............A0
'ram_dir_disable long   %00000_00000000_0000000000000000000 ' disabled (all inputs) Use #0
ram_chip_enable long    %00001_00000000_0000000000000000000 ' outputs CE
ram_dir_read    long    %00011_00000000_1111111111111111111 ' outputs CE,     OE, A0-18, inputs D0-7, WE   (t/s)
ram_dir_write   long    %00001_11111111_1111111111111111111 ' outputs CE,         A0-18, D0-7, inputs WE=OE(t/s)
ram_dir_wstrobe long    %00101_11111111_1111111111111111111 ' outputs CE, WE,     A0-18, D0-7, inputs    OE(t/s)
ram_addr_only   long    %00000_00000000_1111111111111111111 ' address bits A0-18
ram_data_only   long    %00000_11111111_0000000000000000000 ' data bits D0-7

outx          long      0
XMM_Temp      long      0
XMM_Test      long      0

'
'--------------------- End of RAMBLADE3 XMM Support Routines -------------------
'
