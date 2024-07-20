{
'
'------------------------ DRACBLADE XMM Support Routines -----------------------
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
'=============================== FLASH CHECK ==================================
'
#ifdef NEED_FLASH
#error : FLASH NOT SUPPORTED ON THIS PLATFORM
#endif
'
'=========================== MINIMAL API FUNCTIONS =============================
'
' XMM_Activate : Activate the XMM bus - set Pin directions, and latch for Read
'
XMM_Activate
              mov     outa,ram_MUX              ' disable mux (latch is active low)
              mov     dira,ram_dir_read         ' set direction bits for read
XMM_Activate_ret
              ret
'
'XMM_Tristate : Give up the XMM bus. To reactivate, call XMM_Activate
'            
XMM_Tristate
              mov     dira,#0                   ' all inputs
              mov     outa,#0                   ' and all zero
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
              mov     XMM_Temp,#0
              mov     XMM_Tmp2,#32              ' set up number of bits to shift result
:ReadLoop
              andn    outa,ram_MUX              ' enable mux
              nop                               ' sram delay              
              nop                               ' sram delay              
              mov     outx,ina                  ' read byte from sram
              or      outa,ram_MUX              ' disable mux
              and     outx,#$FF                 ' mask the data to 8-bits
              or      XMM_Temp,outx             ' ... into ...
              ror     XMM_Temp,#8               ' ... XMM_Temp
              sub     XMM_Tmp2,#8               ' update number of bits to shift result 
              call    #XMM_IncAddr              ' inc sram address
              djnz    XMM_Len,#:ReadLoop        ' repeat while XMM_len <> 0
              ror     XMM_Temp,XMM_Tmp2         ' shift bytes into final position
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
:WriteLoop
              mov     dira, ram_dir_write       ' set outputs for write (to sram)
              mov     outx,XMM_Temp             ' get next ...
              and     outx,#$FF                 ' .. byte to write
              or      outx,ram_WR               ' set write and disable mux 
              mov     outa,outx                 ' write to SRAM
              andn    outa,ram_MUX              ' enable mux
'             nop                               ' sram delay
              or      outa,ram_MUX              ' disable mux
              ror     XMM_Temp,#8               ' prepare to write next byte
              call    #XMM_IncAddr              ' inc sram address (autoinc page)
              djnz    XMM_Len,#:WriteLoop       ' repeat while XMM_len <> 0
              mov     dira,ram_dir_read         ' set outputs for read again
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
'    XMM_Addr  (32-bit): destination address in sram, 21-bits used
'    Hub_Addr  (32-bit): source address in main memory, 16-bits used
'    XMM_Len   (32-bit): number of bytes to write. 
'
' NOTE:  Uses XMM_IncAddr, which is slower than incrementing the address directly,
'        but it means pages can be correctly read across page boundaries.
'
XMM_WritePage
              call    #XMM_SetAddr              ' latch ram address
:WriteLoop
              mov     dira,ram_dir_write        ' set outputs for write (to sram)
              rdbyte  outx,Hub_Addr             ' get byte to write
              or      outx,ram_WR               ' set write and disable mux 
              mov     outa,outx                 ' write byte (to sram)
              andn    outa,ram_MUX              ' enable mux
'             nop                               ' sram delay
              or      outa,ram_MUX              ' disable mux
              add     Hub_Addr,#1               ' inc source address
              call    #XMM_IncAddr              ' inc sram address (autoinc page)
              djnz    XMM_Len,#:WriteLoop       ' repeat while XMM_len <> 0
              mov     dira,ram_dir_read         ' set outputs for read again
XMM_WritePage_ret
              ret
'
#endif          
'
#ifdef NEED_XMM_READPAGE              
'
' XMM_ReadPage : Read bytes from XMM RAM to Hub RAM.
' On Entry: 
'    XMM_Addr  (32-bit): source address in sram, 21-bits used
'    Hub_Addr  (32-bit): destination address in main memory, 16-bits used
'    XMM_Len   (32-bit): number of bytes to read. 
'
' NOTE:  Uses XMM_IncAddr, which is slower than incrementing the address directly,
'        but it means pages can be correctly read across page boundaries.
'
XMM_ReadPage
              call    #XMM_SetAddr              ' latch ram address
:ReadLoop
              andn    outa,ram_MUX              ' enable mux
              nop                               ' sram delay              
              nop                               ' sram delay              
              mov     outx,ina                  ' read byte (from sram)
              or      outa,ram_MUX              ' disable mux
              wrbyte  outx,Hub_Addr             ' write byte to destination (Hub)
              add     Hub_Addr,#1               ' inc dest address
              call    #XMM_IncAddr              ' inc sram address (autoinc page)
              djnz    XMM_Len,#:ReadLoop        ' repeat while XMM_len <> 0
XMM_ReadPage_ret
              ret
'
#endif              
'
'XMM_SetAddr : Setup initial XMM address. XMM_Activate should be called
'              at least once before this routine is used.
'On Entry:
'   XMM_Addr      : address to set (21 bits)
'   XMM_Last0_7   : Last address bits 0 to 7 (or -1 if no last addr) 
'   XMM_Last8_15  : Last address bits 8 to 15 (in bits 0 .. 7, or -1)
'   XMM_Last16_19 : LAst address bits 16 to 19 (in bits 0 .. 7, or -1)
'
'On Exit:
'   latches set
'   XMM_Last0_7, XMM_Last8_15, XMM_Last_16_19 : updated
'
XMM_SetAddr
              mov     dira,ram_dir_write        ' set up for writing (to latch)
              mov     outx,XMM_Addr             ' shift  ...
              shr     outx,#16                  ' addr bits 16 - 19 ...
              and     outx,#$FF                 ' ... into position
              or      outx,ram_A16_A19          ' set mux for bits 16 - 19
              mov     outa,outx                 ' output new bits and enable mux
              andn    outa,ram_MUX              ' enable mux
'             nop                               ' sram delay              
              or      outa,ram_MUX              ' disable mux
XMM_Check8_19
              mov     outx,XMM_Addr             ' shift  ...
              shr     outx,#8                   ' addr bits 8 - 15 ...
              and     outx,#$FF                 ' ... into position
              or      outx,ram_A8_A15           ' set mux for bits 8 - 15
              mov     outa,outx                 ' output new bits and enable mux
              andn    outa,ram_MUX              ' enable mux
'             nop                               ' sram delay              
              or      outa,ram_MUX              ' disable mux
XMM_Check0_7
              mov     outx,XMM_Addr             ' bits 0 - 7 ...
              and     outx,#$FF                 ' ... are already in position
              or      outx,ram_A0_A7            ' set mux for bits 0 - 7 
              mov     outa,outx                 ' output new bits and enable mux
              andn    outa,ram_MUX              ' enable mux
'             nop                               ' sram delay              
              or      outa,ram_MUX              ' set read and disable mux
XMM_Check_Done
              mov     outa,ram_MUX
              mov     dira,ram_dir_read         ' set up for reading
XMM_SetAddr_ret
              ret
'
'
'XMM_IncAddr : Increment XMM address, setting latches as necessary. XMM_Activate
'              must be called at least once before this routine is used.
' On Entry:
'   XMM_Addr      : address to increment (21 bits)
'   XMM_Last0_7   : Last address bits 0 to 7 (or -1 if no last addr) 
'   XMM_Last8_15  : Last address bits 8 to 15 (in bits 0 .. 7, or -1)
'   XMM_Last16_19 : LAst address bits 16 to 19 (in bits 0 .. 7, or -1)
'
'On Exit:
'   latches set
'   XMM_Last0_7, XMM_Last8_15, XMM_Last_16_19 : updated
'
XMM_IncAddr
              add     XMM_Addr,#1               ' inc sram address
              mov     outx,XMM_Addr             ' does result of incrementing ...
              and     outx,#$FF                 ' ... require updating latch 8 - 15 or 16 - 19?
              tjnz    outx,#XMM_Set0_7          ' if not, just set latch for addr bits 0 - 7
              call    #XMM_SetAddr              ' otherwise we must set all latches
              jmp     #XMM_IncAddr_ret          ' done 
XMM_Set0_7
              mov     dira,ram_dir_write        ' set up for writing (to latch)
              or      outx,ram_A0_A7            ' set mux for bits 0 - 7 
              mov     outa,outx                 ' output new bits and enable mux
              andn    outa,ram_MUX              ' enable mux
'             nop                               ' sram delay              
              or      outa,ram_MUX              ' set read and disable mux
              mov     outa,ram_MUX
              mov     dira,ram_dir_read         ' set up for reading
XMM_IncAddr_ret
              ret
'
' DracBlade Hardware Access:
'
'   (P24) M_PORT2-------------+ +-------- VGA (P23)                                             
'   (P25) M_PORT2------------+| |+------- VGA (P22)                          
'   (P26) KB ---------------+|| ||+------ VGA (P21)                           
'   (P27) KB --------------+||| |||+----- VGA (P20)                        
'   (P28) SCL ------------+|||| ||||+---- VGA (P19)            
'   (P29) SDA -----------+||||| |||||+--- VGA (P18)                                               
'   (P30) SO -----------+|||||| ||||||+-- VGA (P17)                                                
'   (P31) SI ----------+||||||| |||||||+- VGA (P16)                                                      
'                      |||||||| ||||||||                                                       
ram_MUX       long    %00000000_00000000_0000_0001_00000000 ' active low                                        
'ram_RD        long    %00000000_00000000_0000_0001_00000000 ' same as ram_MUX
ram_WR        long    %00000000_00000000_0000_0011_00000000
ram_A0_A7     long    %00000000_00000000_0000_0101_00000000
ram_A8_A15    long    %00000000_00000000_0000_0111_00000000
ram_A16_A19   long    %00000000_00000000_0000_1001_00000000
'ram_DATA      long    %00000000_00000000_0000_0000_11111111
ram_dir_read  long    %00000000_00000000_0000_1111_00000000
ram_dir_write long    %00000000_00000000_0000_1111_11111111
'                                        |||| |||| ||||||||
'                         SD CS ---(P15)-+||| |||| |-DATA-|
'                         SD DI ---(P14)--+|| |||| 76543210
'                         SD CLK --(P13)---+| ||||
'                         SD DO ---(P12)----+ |||+--(P8) ---- /mux (active low) 
'                                             ||+---(P9)---+                               
'                                             |+---(P10)--+|                   
'                                             +----(P11)-+|| 
'                                                        |||               
'                                                        |||
'                                                        000 /RD_RAM
'                                                        001 /WR_RAM
'                                                        010 /CS_A0-A7
'                                                        011 /CS_A8-A15
'                                                        100 /CS_A16-A18
'                                                        101 /CS_LCD
'                                                        110 Not connected
'                                                        111 Not connected
'
outx          long      0                       ' as a temp address
'
XMM_Temp      long      0
XMM_Tmp2      long      0
'
'----------------------- End of DRACBLADE XMM Support Routines -----------------
'
