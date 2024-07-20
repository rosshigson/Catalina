{
'
'------------------------ RAMBLADE XMM Support Routines ------------------------
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
'
' XMM_Activate : activate the XMM bus - set pin directions and CE for read
'
XMM_Activate
              mov     outa, #0                  ' zero all outputs
              mov     dira, ram_addr_only       ' set address bits as outputs
XMM_Activate_ret
              ret
'
'XMM_Tristate : Give up the XMM bus. Call this to allow other cogs to use other devices.
'
XMM_Tristate
              mov     outa, #0                  ' zero all outputs
              mov     dira, #0                  ' disable all outputs
XMM_Tristate_ret
              ret
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
'    XMM_Addr incremented by XMM_Len.
'    Destination register contains bytes read from XMM.
'
XMM_ReadLong
              mov     XMM_Len,#4                ' read 4 bytes
XMM_ReadMult
              and     XMM_Addr,ram_addr_only    ' mask address to 19 bits
              mov     outa, XMM_Addr            ' output the address (-CE =0 => read)
              mov     XMM_Temp,#0               '
              mov     XMM_Test,#32              ' set up number of bits to shift result
:ReadLoop
              mov     dira,ram_dir_read
              nop                               ' REQUIRED for timing
              mov     outx, ina                 ' read byte from SRAM
              mov     dira,ram_addr_only
              shr     outx, #24                 ' move bits into position
              or      XMM_Temp, outx
              ror     XMM_Temp,#8
              sub     XMM_Test,#8               ' update number of bits to shift result 
              add     outa, #1                  ' inc sram address
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
              and     XMM_Addr,ram_addr_only    ' mask address to 19 bits
              mov     dira,ram_addr_data        ' set bits for write (but -CE -WE =0 => deselect)
XMM_WriteMult
XMM_Src       mov     XMM_Temp,0-0              ' save the value
:WriteLoop
              mov     outx,XMM_Temp             ' set up ...
              shl     outx, #24                 ' ... address ...
              or      outx,XMM_Addr             ' ... and ...
              mov     outa,outx                 ' ... data bits
              mov     dira,ram_dir_write        ' (-CE -WE =1 => write)
              ror     XMM_Temp, #8
              add     Hub_Addr, #1              ' inc source address
              add     XMM_Addr, #1              ' inc XMM address
              mov     dira,ram_addr_only        ' set outputs for address (-CE -WE =0 => deselect)
              djnz    XMM_Len, #:WriteLoop      ' repeat while XMM_len <> 0
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
              and     XMM_Addr,ram_addr_only    ' mask address to 19 bits
              mov     dira,ram_addr_data        ' set bits for write (but -CE -WE =0 => deselect)
:WriteLoop
              rdbyte  outx, Hub_Addr            ' set up ...
              shl     outx, #24                 ' ... address ...
              or      outx,XMM_Addr             ' ... and ...
              mov     outa,outx                 ' ... data bits
              mov     dira,ram_dir_write        ' (-CE -WE =1 => write)
              add     Hub_Addr, #1              ' inc source address
              add     XMM_Addr, #1              ' inc XMM address
              mov     dira,ram_addr_only        ' (-CE -WE =0 => deselect)
              djnz    XMM_Len, #:WriteLoop      ' repeat while XMM_len <> 0
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
              and     XMM_Addr,ram_addr_only    ' mask address to 19 bits
              mov     outa, XMM_Addr            ' output the address (-CE =0 => read)
:ReadLoop
              mov     dira,ram_dir_read
              nop                               ' REQUIRED for timing
              mov     outx, ina                 ' read byte from SRAM
              mov     dira,ram_addr_only
              shr     outx,#24                  ' shift data bits into position
              wrbyte  outx, Hub_Addr            ' write byte to destination (Hub)
              add     outa,#1                   ' inc sram address 
              add     Hub_Addr, #1              ' inc dest address
              djnz    XMM_Len, #:ReadLoop       ' repeat while XMM_len <> 0
XMM_ReadPage_ret
              ret
'
#endif
'
' RamBlade Hardware Access:
'
'       P0-18  = A0-18   SRAM address
'       P19    = -CS     microSD
'       P20    = -CE     SRAM & enable eeprom
'       P21    = -WE     SRAM & enable eeprom
'       P22    = SO      \ not used by this driver
'       P23    = SI      /
'       P24-31 = D0-7    SRAM \ * see below
'                             | P28 = SCL eeprom
'                             | P29 = SDA eeprom
'                             | P30 = prog SO
'                             / P31 = prog SI
'
'         (microSD) DO ---------+
'         (microSD) DI --------+| +--------  SI (P23)
'         (microSD) CLK-------+|| |+-------  SO (P22)
'                             ||| ||
'             (P28) SCL ----+ ||| ||+------ -WE (SRAM & enable eeprom)
'             (P29) SDA ---+| ||| |||+----- -CE (SRAM & enable eeprom)
'             (P30) SO ---+|| ||| ||||+---- -CS (microSD)
'             (P31) SI --+||| ||| |||||
'                        |||| ||| |||||
'          P31...P0 --> %xxxxxxxx_00xxx_xxxxxxxxxxxxxxxxxxx
'       10K pullups -->    ** ***   ***
'                        +------+       +-----------------+
'                        D7....D0       A18..............A0
ram_CE_bit    long      %00000000_00010_0000000000000000000 ' CE bit
ram_WE_bit    long      %00000000_00100_0000000000000000000 ' WE bit
ram_dir_read  long      %00000000_00010_1111111111111111111 ' outputs CE, A0-18, inputs WE(t/s),D0-7
ram_dir_write long      %11111111_00110_1111111111111111111 ' outputs WE, CE, A0-18, D0-7
ram_addr_only long      %00000000_00000_1111111111111111111 ' address bits A0-18
ram_addr_data long      %11111111_00000_1111111111111111111 ' address bits A0-18, data bits D0-7
'
'
'
outx          long      0
'
XMM_Temp      long      0
XMM_Test      long      0
'
'----------------------- End of RAMBLADE XMM Support Routines ------------------
'
