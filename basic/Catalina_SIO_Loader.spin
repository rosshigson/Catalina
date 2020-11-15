{{
'-------------------------------------------------------------------------------
'
' Catalina_SIO_Loader - loads a Program into RAM from Serial IO
'
' This program accepts data from Serial IO, and loads it into Hub RAM.
' It copies the first 31kb of code from Hub RAM and ignores anything
' above 31kb. When loading is completed the program restarts the
' Propeller. This means that the program loaded should be a self-
' contained LMM program less than 31k.
'
' This program is intended for platforms WITHOUT XMM RAM - for those 
' platforms, use the Catalina_XMM_SIO_Loader. 
'
' NOTE This loader does not contain any SIO code - it expects to use 
' the Catalina SIO Plugin (started by a higher level object) which
' uses the shared io block address.
'
' Version 2.5 - Initial version.
'
' Version 2.8 - Add support for RESERVE_COG
'
' Version 3.0 - display load progress if DISPLAY_LOAD is defined
'               on the command line when the utilities are built.
'               DISPLAY_LOAD_2 adds additional information.
'
' Version 3.1 - Remove RESERVE_COG support.
'
' Version 3.6 - Support new binary format.
'
'-------------------------------------------------------------------------------
}}

'
' comment these out if possible, to save space:
'
#define NEED_SIO_READPAGE
#define NEED_SIO_READLONG
'#define NEED_SIO_WRITEPAGE
'#define NEED_SIO_WRITELONG

'
' debugging options (note that enabling debugging will also require SLOW_XMIT
' to be enabled to avoid comms timeouts):
'
'#define DEBUG_UNSTUFFED_DATA
'#define DEBUG_DATA
'#define SLOW_XMIT

CON

SECTOR_SIZE  = Common#FLIST_SSIZ ' also page size

OBJ
   Common : "Catalina_Common"

PUB Start(Block_Addr, Page_Buffer, Xfer_Buffer, CPU_Num, Max_Load) | Reg, Block, Page, Xfer, CPU
'
' Initiate the Low Level Loader 
'
  Reg    := Common#REGISTRY
  Block  := Block_addr
  Page   := Page_Buffer
  Xfer   := Xfer_Buffer
  CPU    := CPU_Num

  max_hub_load := Max_Load

  cognew(@entry, @Reg)
  cogstop(cogid)


DAT
        org 0

entry
        mov    r0,par                           ' point to parameters
        rdlong reg_addr,r0                      ' registry address
        add    r0,#4
        rdlong SIO_IO_Block,r0                  ' io block address
        add    r0,#4
        rdlong page_addr,r0                     ' page buffer address
        add    r0,#4
        rdlong xfer_addr,r0                     ' xfer buffer address
        add    r0,#4
        rdlong cpu_no,r0                        ' our CPU number

        ' save the current clock freq and mode
        
        rdlong SavedFreq,#0
        rdbyte SavedMode,#4

        ' zero hub RAM from $0 to runtime_end

        mov     r1,#$0
        mov     r2,runtime_end
:zeroRam
        wrlong  Zero,r1
        add     r1,#4
        cmp     r1,r2 wz,wc
  if_b  jmp     #:zeroRam
        
#ifdef DISPLAY_LOAD
        mov    r2,#"A"                          ' for debug only 
        call   #HMI_t_char                      ' for debug only
        call   #HMI_CrLf                        ' for debug only
#endif

wait_loop
        call   #SIO_ReadSync                    ' wait ...
        cmps   r0,#0 wz,wc                      ' ... for ...
  if_be jmp    #wait_loop                       ' ... sync signal

#ifdef DISPLAY_LOAD_2
        mov    r2,#"S"                          ' for debug only
        call   #HMI_t_char                      ' for debug only
        call   #HMI_CrLf                        ' for debug only
#endif

read_page
        call   #ClearPage
        mov    Hub_Addr,page_addr               ' read a page from SIO ...
        call   #SIO_ReadPage                    ' ... to page buffer

#ifdef DISPLAY_LOAD
        mov    r2,#"B"                          ' for debug only
        call   #HMI_t_char                      ' for debug only
#endif

        cmp    SIO_Addr,SIO_EOP wz              ' all done?
 if_z   jmp    #restart                         ' yes - restart propeller
        mov    dst_addr,SIO_Addr                ' no - is addr less than ...
        cmp    SIO_Addr,hub_size wz,wc          ' ... than size of hub?
 if_ae  jmp    #:ignore                         ' no - ignore it
        cmp    SIO_Addr,max_hub_load wz,wc      ' yes - addr < max hub addr?
 if_b   jmp    #:copy_page_to_hub               ' yes - copy to hub
:ignore
#ifdef DISPLAY_LOAD
        mov    r2,#"I"                          ' for debug only
        call   #HMI_t_char                      ' for debug only
#endif
 
        mov    lrc_addr,page_addr               ' no - ignore it
#ifdef DISPLAY_LOAD_2
        mov    r2,#"c"                          ' for debug only
        call   #HMI_t_char                      ' for debug only
#endif
        jmp    #:send_lrc                       ' calculate lrc and send back

:copy_page_to_hub
        mov    end_addr,dst_addr
        mov    lrc_addr,dst_addr
        call   #Copy_To_Hub                     ' yes - copy buffer to Hub RAM

#ifdef DISPLAY_LOAD_2
        mov    r2,#"C"                          ' for debug only
        call   #HMI_t_char                      ' for debug only
#endif

        jmp    #:send_lrc                       ' calculate lrc and send back

#ifdef DEBUG_DATA
        mov    r2,#"D"                          ' for debug only
        call   #HMI_t_char                      ' for debug only
        mov    src_addr,page_addr               ' for debug only
        mov    end_addr,page_addr               ' for debug only
        add    end_addr,sect_size               ' for debug only
:dumploop                                       ' for debug only
        cmp    src_addr,end_addr wz,wc          ' for debug only
  if_ae jmp    #:enddump                        ' for debug only
        rdlong r2,src_addr                      ' for debug only
        call   #HMI_t_dec                       ' for debug only
        call   #HMI_space                       ' for debug only
        add    src_addr,#4                      ' for debug only
        jmp    #:dumploop                       ' for debug only
:enddump                                        ' for debug only
#endif

#ifdef DISPLAY_LOAD_2
        mov    r2,#"E"                          ' for debug only
        call   #HMI_t_char                      ' for debug only
#endif

:send_lrc
        mov    r0,lrc_addr                      ' if we didn't copy ...
        add    r0,sect_size                     ' ... the whole sector ..                      
        cmp    r0,max_hub_load wz,wc            ' ... to hub RAM ...
 if_ae  mov    lrc_addr,page_addr               ' ... return LRC of page buffer
        mov    lrc_size,sect_size
        call   #LrcBuffer
        call   #SIO_WriteSync
        mov    r0,lrc_rslt
        call   #SIO_WriteByte

#ifdef DISPLAY_LOAD_2
        mov    r2,#"Y"                          ' for debug only
        call   #HMI_t_char                      ' for debug only
        call   #HMI_space                       ' for debug only
        mov    r2,lrc_rslt                      ' for debug only
        call   #HMI_t_dec                       ' for debug only
        call   #HMI_space                       ' for debug only
        call   #HMI_space                       ' for debug only
:lrc_cr        
        call   #HMI_CrLf                        ' for debug only
#endif

        jmp    #read_page                       ' continue till all pages loaded

restart
        mov     time,cnt
        add     time,rst_delay
        waitcnt time,#0

        ' stop all cogs other than this one (up to LAST_COG), and restart
        ' this cog as a SPIN interpreter to execute the program now 
        ' loaded in Hub RAM.

        cogid   r4                              ' set our cog id
        mov     r1,#Common#LAST_COG+1           ' don't restart beyond LAST_COG
:stop_cog
        sub     r1,#1
        cmp     r1,r4 wz
 if_nz  cogstop r1
        tjnz    r1,#:stop_cog

        rdword  r2,#$a                          ' Get dbase 

        sub     r2,#4
        wrlong  StackMark,r2                    ' Place stack marker at dbase
        sub     r2,#4
        wrlong  StackMark,r2
        rdlong  r2,#0
        cmp     r2,SavedFreq wz                 ' Is clock frequency the same?
  if_ne jmp     #:changeClock
        rdbyte  r2,#4                           ' Get the clock mode
        cmp     r2,SavedMode wz                 ' If same, just go start COG
  if_e  jmp     #:justStartUp
:changeClock
        and     r2,#$F8                         ' Use RCFAST clock while
        clkset  r2                              ' letting requested clock start
        mov     r2,XtalTime
:startupDelay
        djnz    r2,#:startupDelay               ' 20ms@20MHz for pll to settle
        rdlong  r2,#4
        and     r2,#$FF                         ' Then switch to selected clock
        clkset  r2
:justStartUp
        or      r4,interpreter
        coginit r4
                
SavedFreq     long      $0
SavedMode     long      $0
StackMark     long      $FFF9FFFF               ' Two of these mark the base of the stack
Zero          long      $0
XtalTime      long      20 * 20000 / 4 / 1      ' 20ms (@20MHz, 1 inst/loop)

time          long      0
rst_delay     long      8000000        
        
'-------------------------------- Utility routines -----------------------------
'
' Copy_To_Hub - copy page buffer to Hub RAM.
' On Entry:
'   dst_addr : address to copy to (note - will not copy beyond max_hub_load)
'
' NOTE: We assume everything is LONG aligned.
'
Copy_To_Hub
        mov    r1,page_addr
        mov    r0,sect_size
        shr    r0,#2                            ' divide by 4 to get longs
:Write_loop
        cmp    dst_addr,max_hub_load wc,wz      ' don't overwrite ...
 if_ae  jmp    #Copy_To_Hub_ret                 ' ... beyond max_hub_load
        rdlong r2,r1
        wrlong r2,dst_addr
        add    r1,#4
        add    dst_addr,#4
        djnz   r0,#:Write_loop
Copy_To_Hub_ret
        ret

'
'f_d32u - Unsigned 32 bit division
'         Divisor : r1
'         Dividend : r0
'         Result:
'             Quotient in r0
'             Remainder in r1

f_d32u
        mov    ftemp,#32
        mov    ftmp2, #0
:up2
        shl    r0,#1       WC
        rcl    ftmp2,#1    WC
        cmp    r1,ftmp2    WC,WZ
 if_a   jmp    #:down
        sub    ftmp2,r1
        add    r0,#1
:down
        sub    ftemp, #1   WZ
 if_ne  jmp    #:up2
        mov    r1,ftmp2
f_d32u_ret
        ret

{
'
'f_m32 - multiplication
'        r0 : 1st operand (32 bit)
'        r1 : 2nd operand (32 bit)
'        Result:
'           Product in r0 (<= 32 bit)
'
f_m32
        mov    ftemp,#0
:start
        cmp    r0,#0       WZ
 if_e   jmp    #:down3
        shr    r0,#1       WC
 if_ae  jmp    #:down2
        add    ftemp,r1    WC
:down2
        shl    r1,#1       WC
        jmp    #:start
:down3
        mov    r0,ftemp
f_m32_ret
        ret
}
'
ClearPage
        mov    r0,#0
        mov    r1,sect_size
        mov    r2,page_addr
:Clear_loop
        wrbyte r0,r2
        add    r2,#1
        djnz   r1,#:Clear_loop
ClearPage_ret
        ret
'
' LrcBuffer - Calculate LRC of buffer
'
' On Entry
'    lrc_size = size of buffer
'    lrc_addr = address of buffer
' On exit:
'    lrc_rslt = result of XOR
'
LrcBuffer
        mov    lrc_rslt,#0
        mov    r1,lrc_size
        mov    r2,lrc_addr
:LrcBuffer_loop
        rdbyte r0,r2
        xor    lrc_rslt,r0
        add    r2,#1
        djnz   r1,#:LrcBuffer_loop
LrcBuffer_ret
        ret
'
lrc_addr      long      $0
lrc_size      long      $0
lrc_rslt      long      $0
'
'-------------------------------- HMI Routines -------------------------------
'
#ifdef DISPLAY_LOAD
'
' HMI_Command - send a request to HMI Plugin for execution
' On Entry
'          r1 = command
'          r2 = data
'
HMI_Command

        shl     r1,#24          ' construct ...  
        and     r2,low24        ' ... 
        or      r2,r1           ' ... request

        mov     r0,#Common#LMM_HMI ' plugin type we want 

        mov     ftemp,reg_addr  ' point to registry
        mov     ftmp2,#0        ' start at cog 0
send1
        cmp     ftmp2,#8 wc,wz  ' run out of plugins?
 if_ae  jmp     #sendErr        ' yes - no such plugin
        rdlong  ftmp3,ftemp     ' no - check next plugin type
        shr     ftmp3,#24       ' is it ...
        cmp     ftmp3,r0 wz     ' ... the type what we wanted?
 if_z   jmp     #send2          ' yes - use this plugin
        add     ftmp2,#1        ' no ...
        add     ftemp,#4        ' ... check ...
        jmp     #send1          ' ... next cog
send2
        mov     r0,ftmp2        ' use the cog where we found the plugin
        shl     r0,#2           ' multiply plugin (cog) id by 4 ...
        add     r0,reg_addr     ' add registry base to get registry entry
        rdlong  r0,r0           ' get request block from registry
        test    r0,top8 wz      ' plugin registered?
 if_z   jmp     #sendErr        ' no - return error
        and     r0,low24        ' yes - write request ...
        wrlong  r2,r0           ' ... to request block
loop2   rdlong  r2,r0   wz      ' wait till ...
 if_nz  jmp     #loop2          ' ... request completed
        mov     r0,#0
        jmp     #sendDone
sendErr
        neg     r0,#1           ' return -1 on any error
sendDone

        jmp     #HMI_Command_ret
HMI_Command_ret
HMI_XferCmd_ret
        ret
        
' HMI_XferCmd - send a short request to HMI Plugin for execution
'               using an xfer block to hold the data
' On Entry
'          r1 = command
'          r2 = data
'
HMI_XferCmd
        wrlong r2,xfer_addr                     ' put data in xfer block
        mov    r2,xfer_addr                     ' use xfer block as data
        jmp    #HMI_Command                     ' then same as short command
'
' HMI_t_dec - output a dec value (value in r2)
'
HMI_t_dec
        mov    r1,#24                         
        call   #HMI_XferCmd                   
HMI_t_dec_ret
        ret
'
' HMI_t_hex - print a hex value (value in r2)
'
HMI_t_hex
        mov    r1,#26                           ' for debug only
        call   #HMI_XferCmd                     ' for debug only
HMI_t_hex_ret
        ret
'
' HMI_t_char - send a char (char in r2)
'
HMI_t_char
        mov    r1,#22                           ' for debug only
        call   #HMI_Command                     ' for debug only
HMI_t_char_ret
        ret
'
' HMI_space - send a space
'
HMI_space
        mov    r2,#32                           ' for debug only
        call   #HMI_t_char                      ' for debug only
HMI_space_ret
        ret
'
' HMI_CrLf - send a CRLF
'
HMI_CrLf
        mov    r2,#13                           ' for debug only
        call   #HMI_t_char                      ' for debug only
        mov    r2,#10                           ' for debug only
        call   #HMI_t_char                      ' for debug only
HMI_CrLf_ret
        ret
'
#endif        
'
'------------------------------------ SIO Routines -----------------------------------
'
#ifdef NEED_SIO_READPAGE
'
' SIO_ReadPage : Read data from SIO to HUB RAM.
' On Entry: 
'    SIO_Addr  (32-bit): source address (not used, but updated after read)
'    Hub_Addr  (32-bit): destination address in main memory, 16-bits used
'    SIO_Len   (32-bit): number of bytes read, (max SECTOR_SIZE)
'
' NOTE: data packets are:
'    4 bytes CPU + address 
'    4 bytes size (but only a max of SECTOR_SIZE will actually get loaded) 
'    size bytes of data  
'
' NOTE: The top byte of the address ($nn) is the CPU number (1 .. 3).
'
' NOTE ($nn $FF $FF $FF) ($00 $00 $00 $00) indicates end of data
'
' NOTE: to maintain synchronization, all data is read even if the CPU
'       number indicates the packet is not for this CPU.

SIO_ReadPage
              call      #SIO_ReadLong           ' read ...
              mov       SIO_Addr,SIO_Temp       ' ... address
#ifdef DISPLAY_LOAD
              mov       r4,r0                   ' for debug only 
              mov       r2,SIO_Temp             ' for debug only
              call      #HMI_t_dec              ' for debug only
              call      #HMI_space              ' for debug only
              mov       r0,r4
#endif
              call      #SIO_ReadLong           ' read ...
              mov       SIO_Len,SIO_Temp        ' ... size
#ifdef DISPLAY_LOAD
              mov       r4,r0                   ' for debug only 
              mov       r2,SIO_Temp             ' for debug only
              call      #HMI_t_dec              ' for debug only
              call      #HMI_space              ' for debug only
              mov       r0,r4
#endif
              mov       SIO_Cnt1,SIO_Len        ' assume ...
              mov       SIO_Cnt2,#0             ' ... we will not discard data
              tjz       SIO_Len,#:SIO_AddrChk   ' check address if no data to read
              cmp       SIO_Len,sect_size wc,wz ' do we need to discard data?
        if_be jmp       #:SIO_RdLoop1           ' no - just read and save ...
              mov       SIO_Cnt2,SIO_Len        ' yes - calculate size of data to save ...
              sub       SIO_Cnt2,sect_size      ' ... and size of data ...
              mov       SIO_Cnt1,sect_size      ' ... to discard
              mov       SIO_Len,SIO_Cnt1        ' save size of data
:SIO_RdLoop1
              call      #SIO_ReadByte           ' read ...
              wrbyte    r0,Hub_Addr             ' ... and save ...
              add       Hub_Addr,#1             ' ... up to ...
#ifdef DEBUG_UNSTUFFED_DATA
              mov       r4,r0
              mov       r2,r0
              call      #HMI_t_dec
              call      #HMI_space
              mov       r0,r4
#endif              
              djnz      SIO_Cnt1,#:SIO_RdLoop1  ' ... sect_size bytes
              tjz       SIO_Cnt2,#:SIO_AddrChk  ' if no more bytes, check address
:SIO_RdLoop2
              call      #SIO_ReadByte           ' read but discard ...
              djnz      SIO_Cnt2,#:SIO_RdLoop2  ' ... any remaining bytes
:SIO_AddrChk
              mov       r0,SIO_Addr             ' was this packet ...
              shr       r0,#24                  ' ... intended ...
              cmp       r0,cpu_no wz            ' ... for this CPU?
        if_nz jmp       #SIO_ReadPage            ' no - read another packet
              mov       r0,SIO_Addr             ' yes - remove CPU number ...
              and       r0,low24                ' ... from ...
              mov       SIO_Addr,r0             ' ... data address
SIO_ReadPage_ret
              ret
'
#endif

#ifdef NEED_SIO_READLONG
              
'
' SIO_ReadLong : Read 4 bytes from SIO to SIO_Temp
'
SIO_ReadLong
              mov       SIO_Cnt1,#4
:SIO_ReadLoop                       
              call      #SIO_ReadByte
              and       r0,#$FF                 ' mask the data to 8-bits
              andn      SIO_Temp,#$FF           ' combine byte read into SIO_Temp
              or        SIO_Temp,r0
              ror       SIO_Temp,#8
              djnz      SIO_Cnt1,#:SIO_ReadLoop
SIO_ReadLong_ret
              ret

#endif              
'
' SIO_DataReady - check if SIO data is ready.
' On exit:
'    r1 = rx_head
'    r2 = address of rx_tail
'    r3 = rx_tail
'    Z flag set is no data ready (i.e. rx_tail = rx_head).
'
SIO_DataReady
              rdlong    r1,SIO_IO_Block         ' get rx_head
              mov       r2,SIO_IO_Block         ' get ...
              add       r2,#4                   ' ...
              rdlong    r3,r2                   ' ... rx_tail
              cmp       r1,r3 wz                ' rx_tail = rx_head?
SIO_DataReady_ret
              ret
'               
' SIO_ReadByteRaw : Read byte from SIO to r0, without byte unstuffing
'
SIO_ReadByteRaw
              mov       r0,cnt
              cmp       r0,SIO_StartTime wc
        if_nc sub       r0,SIO_StartTime
        if_c  subs      r0,SIO_StartTime
              cmp       r0,one_sec wz,wc
        if_a  jmp       #SIO_ReadByteRaw_err
              call      #SIO_DataReady          ' any SIO data available?
        if_z  jmp       #SIO_ReadByteRaw        ' no - wait
              mov       r1,SIO_IO_Block         ' yes - get received byte ...
              add       r1,#9*4                 ' ... from ... 
              add       r1,r3                   ' ... rx_buffer ...
              rdbyte    r0,r1                   ' ... [rx_tail] ...
              add       r3,#1                   ' calculate ... 
              and       r3,#$0f                 ' ... (rx_tail + 1) & $0f
              wrlong    r3,r2                   ' rx_tail := (rx_head + 1) & $0f
#ifdef DEBUG_RAW_DATA
              mov       r4,r0
              mov       r2,r0
              call      #HMI_t_dec
              call      #HMI_space
              mov       r0,r4
#endif              
              jmp       #SIO_ReadByteRaw_ret        
SIO_ReadByteRaw_err
              neg       r0,#1               
SIO_ReadByteRaw_ret
              ret
'
' SIO_ReadByte : Read byte from SIO to r0, unstuffing $FF $00 to just $FF
'
'          NOTE: returns -1 if the timeout expires, or -2 if a sync signal
'                (i.e. $FF CPU_no) is detected. Any other $FF $xx sequence
'                just returns as normal. 
'
SIO_ReadByte
              mov       SIO_StartTime,cnt
              test      save_data,#$100 wz      ' have we saved a byte?
        if_z  jmp       #:read_byte             ' no - read a new byte
              cmp       save_data,#$1FF wz      ' yes - was it $FF?
        if_z  jmp       #:read_byte             ' yes - read a new byte
              mov       r0,save_data            ' no - return ...
              and       r0,#$FF                 ' ... saved byte ...
              jmp       #:clear_saved_data      ' ... and clear saved data
:read_byte                      
              call      #SIO_ReadByteRaw        ' read a new byte
              cmps      r0,#0 wz,wc             ' read error?      
        if_b  jmp       #SIO_ReadByte_ret       ' yes - return the error
              cmp       save_data,#$1FF wz      ' have we saved $FF?
        if_nz jmp       #:check_for_ff          ' no - check the byte we just read
              cmp       r0,cpu_no wz            ' yes - did we just read our CPU no?
        if_z  jmp       #:read_sync             ' yes - this is a sync signal
              cmp       r0,#0 wz                ' no - did we just read $00?
        if_z  jmp       #:unstuff_ff            ' yes - unstuff the $FF
              or        r0,#$100                ' no - save ... 
              mov       save_data,r0            ' ... the byte we just read ...
              mov       r0,#$FF                 ' ... and return ...
              jmp       #SIO_ReadByte_ret       ' ... $FF instead 
:unstuff_ff        
              mov       r0,#$FF                 ' return unstuffed $FF
              jmp       #:clear_saved_data
:check_for_ff
              cmp       r0,#$ff wz              ' did we just read $FF?
        if_nz jmp       #:clear_saved_data      ' no - clear saved data and return the byte
              mov       save_data,#$1FF         ' yes - save the $FF ... 
              jmp       #:read_byte             ' ... and read another byte 
:read_sync
              neg       r0,#2                   ' return sync flag
:clear_saved_data              
              mov       save_data,#0            ' clear saved data
SIO_ReadByte_ret
              ret
'              
save_data     long      $0                      ' $100 + byte saved (e.g. $1FF if saved $FF)
'
#ifdef NEED_SIO_WRITEPAGE
'
'
' SIO_WritePage : Write bytes from Hub RAM to SIO
' On entry:
'    SIO_Addr  (32-bit): destination address (passed on)
'    Hub_Addr  (32-bit): source address
'    SIO_Len   (32-bit): number of bytes to write. 
'
SIO_WritePage
              mov       SIO_Temp,SIO_Addr       ' write ...
              call      #SIO_WriteLong          ' ... address
              mov       SIO_Temp,SIO_Len        ' write ...
              call      #SIO_WriteLong          ' ... size
              tjz       SIO_Len,#SIO_WritePage_ret ' done if size is zero 
:SIO_WriteLoop              
              rdbyte    r0,Hub_Addr             ' write ...
              call      #SIO_WriteByte          ' ... all ...
#ifdef DEBUG_SD
              rdbyte    r2,Hub_Addr             ' 
              call      #HMI_t_dec
              call      #HMI_space
#endif              
              add       Hub_Addr,#1             ' ... SIO_Len ...
              djnz      SIO_Len,#:SIO_WriteLoop ' ... bytes
SIO_WritePage_ret
              ret
'
#endif              
'
' SIO_ByteDelay : Time to wait between bytes - this is currently set by
'                 trial and error, but to a fairly conservative value.
'
SIO_ByteDelay
              mov       r1,cnt                   
              add       r1,ByteDelay            
              waitcnt   r1,#0                   
SIO_ByteDelay_ret
              ret
'              
#ifdef SLOW_XMIT              
ByteDelay long Common#CLOCKFREQ/50
#else
ByteDelay long Common#CLOCKFREQ/6000
#endif                      
'
' SIO_WriteByte : Write byte in r0 to SIO, without byte stuffing
'
SIO_WriteByteRaw
              call      #SIO_ByteDelay          ' delay between characters
              mov       r1,SIO_IO_Block         ' get ...
              add       r1,#8                   ' ... 
              rdlong    r1,r1                   ' ... tx_head
              mov       r2,SIO_IO_Block         ' get ...
              add       r2,#12                  ' ... 
              rdlong    r2,r2                   ' ... tx_tail
              mov       r3,r1                   ' calculate
              add       r3,#1                   ' (tx_head + 1) ...
              and       r3,#$0f                 ' ... & $0f
              cmp       r3,r2 wz                ' tx_tail = (tx_head + 1) & $0f ?
        if_z  jmp       #SIO_WriteByteRaw       ' yes - wait
              mov       r2,SIO_IO_Block         ' no ...
              add       r2,#13*4                ' ... tx_buffer ...
              add       r2,r1                   ' ... [tx_head] ...
              wrbyte    r0,r2                   ' ... := r0
              mov       r1,SIO_IO_Block         ' tx_head := 
              add       r1,#8                   ' (tx_head +1) ...
              wrlong    r3,r1                   ' ... & $0f
              mov       r1,SIO_IO_Block         ' should ...
              add       r1,#6*4                 ' ... we ...
              rdlong    r1,r1                   ' ... ignore ...
              and       r1,#%1000 wz            ' ... echo ? 
        if_z  jmp       #SIO_WriteByteRaw_ret   ' no - just return
              call      #SIO_ReadByte           ' yes - recieve echo before returning              
SIO_WriteByteRaw_ret
              ret
'
' SIO_WriteByte : Write byte in r0 to SIO, performing byte stuffing
'                 by converting each $FF into $FF $00 to ensure that
'                 the sync signal of $FF $02 is never transmitted
'                 except when specifically intended.
'
SIO_WriteByte
              and       r0,#$FF
              cmp       r0,#$FF wz
        if_nz jmp       #:no_stuff
              call      #SIO_WriteByteRaw
              mov       r0,#$00
:no_stuff
              call      #SIO_WriteByteRaw
SIO_WriteByte_ret
              ret
'
' SIO_WriteSync : Write the Sync signal ($FF $01 for CPU #1, or $FF $03 for CPU #3).
'                 These sequences can never be generated accidentally because during
'                 normal sending $FF is stuffed to $FF $00
' On Entry:
'    cpu_no : CPU number (must be non zero!)
'              
SIO_WriteSync
              mov       r0,#$FF
              call      #SIO_WriteByteRaw
              mov       r0,cpu_no
              call      #SIO_WriteByteRaw
SIO_WriteSync_ret
              ret
'
' SIO_ReadSync : Wait for the Sync Signal ($FF $01 for CPU #1, or $FF $03 for CPU #3).
'                These sequences can never be generated accidentally because during
'                normal sending $FF is stuffed to $FF $00, so we can wait for this
'                without the risk of accidentally being triggered by a program being
'                sent to another CPU.
'
'                NOTE: ReadByteRaw returns failure if timeout expires
'
SIO_ReadSync
              mov       SIO_StartTime,cnt
:read_loop
              mov       r0,cnt
              cmp       r0,SIO_StartTime wc
        if_nc sub       r0,SIO_StartTime
        if_c  subs      r0,SIO_StartTime
              cmp       r0,one_sec wz,wc
        if_a  jmp       #:read_err
              call      #SIO_ReadByteRaw
              cmp       r0,#$FF wz
        if_nz jmp       #:read_loop
:check_cpu
              call      #SIO_ReadByteRaw
              cmp       r0,cpu_no wz
        if_z  jmp       #SIO_ReadSync_ret
              cmp       r0,#$FF wz
        if_z  jmp       #:check_cpu
              jmp       #:read_loop
:read_err
              neg       r0,#1               
SIO_ReadSync_ret
              ret

#ifdef NEED_SIO_WRITELONG                              
'
' SIO_WriteLong : Write 4 bytes from SIO_Temp to SIO
'
SIO_WriteLong
              mov       SIO_Cnt1,#4
:SIO_WriteLoop
              mov       r0,SIO_Temp                       
              call      #SIO_WriteByte
              ror       SIO_Temp,#8
              djnz      SIO_Cnt1,#:SIO_WriteLoop
SIO_WriteLong_ret
              ret

#endif
              
'
' SIO data
'
SIO_Addr      long      $0
SIO_Len       long      $0
SIO_Cnt1      long      $0
SIO_Cnt2      long      $0
SIO_Temp      long      $0
SIO_IO_Block  long      $0                      ' address of shared I/O block
SIO_EOP       long      $00FFFFFE               ' end of page marker
SIO_StartTime long      $0
one_sec       long      Common#CLOCKFREQ
'
'------------------------------- Common Variables ------------------------------
'
#ifdef DISPLAY_LOAD
top8          long      $FF000000
#endif
low24         long      $00FFFFFF

r0            long      $0
r1            long      $0
r2            long      $0
r3            long      $0
r4            long      $0

reg_addr      long      $0
page_addr     long      $0
xfer_addr     long      $0
cpu_no        long      $0

sect_size     long      SECTOR_SIZE
hub_size      long      $8000                   ' Hub RAM size 
max_hub_load  long      $8000                   ' address we can load up to
runtime_end   long      Common#RUNTIME_ALLOC    ' address we can zero up to

src_addr      long      $0
dst_addr      long      $0
end_addr      long      $0

' see http://forums.parallax.com/forums/default.aspx?f=25&m=363100
interpreter   long    ($0004 << 16) | ($F004 << 2) | %0000

'
' temporary storage used in mul & div calculations
'
ftemp         long      $0
ftmp2         long      $0
ftmp3         long      $0
'
Hub_Addr      long      $0
'
              fit       $1f0                    ' max size

{{
                            TERMS OF USE: MIT License                                                           

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
}}
