{{
'-------------------------------------------------------------------------------
'
' This is a proxy plugin that provides SD support in multiple CPU Prop
' systems (e.g. TriBladeProp, Morpheus) where the actual SD hardware is
' physically connected to another CPU. On this CPU we run this proxy SD
' plugin in place of the normal one. This plugin offers a very similar
' interface as the normal SD plugin (see the SD plugin for additional
' details), but sends all SD requests to the other CPU using a simple
' serial protocol. On the other CPU we must run an SD Server program
' which listens for requests and processes them, returning the results
' to this proxy.
'
' Note that this plugin does not contain serial code - it expects
' the SIO plugin to have been loaded.
'
' Note that all requests are initiated by the proxy, and that the server
' can only support a single proxy. This means the SD card can currently
' only be used by one CPU or the other - not by both. A more sophisticated
' proxy and server may do that in future.
'
' The protocol is very simple:
'
' SD         Client                          Server
' Function   Request                         Response
' ========   =======                         ========
'
' SD_Init    FF 02 01                        FF 02 01
'
' SD_Read    FF 02 02 s s s s                FF 02 02 <sector_data>
'                                        or  FF 02 00 (no data)
'        
' SD_Write   FF 02 03 s s s s <sector_data>  FF 02 03
'
' SD_ByteIO  FF 02 04 b                      FF 02 04
'                         
' SD_StopIO  FF 02 05                        FF 02 05
' 
'
' Version 1.0 - initial version by Ross Higson
' Version 1,1 - wait indefinitily for init to succeed - required if
'               the proxy server is being manually loaded.
'
}}
'
' Include debug output
'
'#define DEBUG
'
CON

#include "CFG.inc"

CON

sectorsize  = 512

PAGE_SIZE   = sectorsize

'
' SD support:
'
SD_Init   = 1
SD_Read   = 2
SD_Write  = 3
SD_ByteIO = 4
SD_StopIO = 5

' SD services:
'
' The command to perform is encoded in the top 8 bits of the parameter
' The address of a parameter block is encoded in the bottom 24 bits.
' The parameter block is 2 longs:
'    - the buffer adress to use
'    - the sector number to read/write 

'name: SD_Init - Initialize the driver
'code: 1
'type: long request
'data: parameter block address
'rslt: (none)
'
'name: SD_Read - Read a sector
'code: 2
'type: long request
'data: parameter block address
'rslt: (none)
'
'name: SD_Write - Write a sector
'code: 3 
'type: long request
'data: parameter block address
'rslt: (none)
   
'name: SD_ByteIO - Write a sector
'code: 4 
'type: short request
'data: byte to write
'rslt: (none)

'name: SD_StopIO - disable the SD card (required on the TRIBLADEPROP)
'code: 5 
'type: short request
'data: byte to write
'rslt: (none)
   
LMM_FIL     = common#LMM_FIL
LMM_HMI     = Common#LMM_HMI

obj
   common : "Catalina_Common"

pub Start(io_block, proxy_lock, server_cpu)  : cog | reg, xfr, blk, lck, cpu
'
  reg := Common#REGISTRY
  xfr := Common#PROXY_XFER
  blk := io_block
  lck := proxy_lock
  cpu := server_cpu
  
  cog := cognew(@entry, @reg)          
  
  if cog => 0
  
    ' wait till the sd proxy plugin has registered
    repeat until long[Common#REGISTRY][cog] & $FF000000 <> 0

    ' initialize the proxy sd plugin, and wait for intialization to
    ' complete (which indicates comms has been established with the server)
    common.SendInitializationDataAndWait(cog, SD_Init<<24, 0)
    
  cog += 1
  
dat
        org
entry
              mov       r0,par                  ' save ...
              rdlong    reg_addr,r0             ' ... registry address
              add       r0,#4                   ' save ...
              rdlong    xfer_addr,r0            ' ... xfer address
              add       r0,#4                   ' save ...
              rdlong    SIO_IO_Block,r0         ' ... io block address
              add       r0,#4                   ' save ...
              rdlong    p_lock,r0               ' ... proxy lock to use
              add       r0,#4                   ' save ...
              rdlong    cpu_no,r0               ' ... server cpu to use
              cogid     r0                      ' get ...
              shl       r0,#2                   ' ... our ...
              add       r0,reg_addr             ' ... registry block entry
              rdlong    rqstptr,r0              ' register ...
              and       rqstptr,Low24           ' ... this ...
              mov       r1,#LMM_FIL             ' ... plugin ...
              shl       r1,#24                  ' ... as the ...
              or        r1,rqstptr              ' ... appropriate ...
              wrlong    r1,r0                   ' ... type
              mov       rsltptr,rqstptr         ' set up a pointer to ...
              add       rsltptr,#4              ' ... our result address

#ifdef DEBUG
              mov       SIO_StartTime,cnt
              add       SIO_StartTime,one_sec
              waitcnt   SIO_StartTime,#0
              mov       r0,#67
              call      #SIO_WriteByte
              mov       r0,#68
              call      #SIO_WriteByte
              mov       r0,#69
              call      #SIO_WriteByte
#endif

waitloop      rdlong    r0,rqstptr wz           ' request ?
        if_z  jmp       #waitloop               ' no - continue waiting
              mov       r1,r0                   ' yes - upper 8 bits ...
              shr       r1,#24                  ' ... is command
              and       r0,Low24                ' lower 24 bits is parameter                
              sub       r1,#1 wz                ' SD_init?
        if_z  jmp       #initialize             ' yes - initialize
              sub       r1,#1 wz                ' no - SD_Read?
        if_z  jmp       #read_sect              ' yes - read sector
              sub       r1,#1 wz                ' no - SD_Write?
        if_z  jmp       #write_sect             ' yes - write sector
              sub       r1,#1 wz                ' no - SD_ByteIO
        if_z  jmp       #byte_io                ' yes - write byte
              jmp       #waitloop               ' no - ignore request

initialize
              call      #ProxyLock              ' get exclusive access to proxy
        if_nz jmp       #initialize             ' try again if cannot lock                   
#ifdef DEBUG
              mov       r0,#73                  ' I
              call      #SIO_WriteByte
#endif
              call      #SIO_WriteSync          ' send sync ...
              mov       r0,#SD_Init             ' ... followed by ...
              call      #SIO_WriteByte          ' ... SD_Init
read_response              
              call      #SIO_ReadSync           ' wait for response sync
              cmps      r0,#0 wz,wc             ' if error ...
        if_b  jmp       #init_retry             ' ... retry                    
              call      #SIO_ReadByte           ' read ...
              mov       rslt,r0 wz,wc           ' ... result
        if_ae jmp       #done_ok               
init_retry
              lockclr   p_lock                  ' release exclusive access to proxy
              jmp       #initialize             ' keep trying until we initialize ok

done_err
#ifdef DEBUG
              mov       r0,#88                  ' X
              call      #SIO_WriteByte
#endif
              neg       rslt,#1 wz,wc           ' return ...
              jmp       #done                   ' ... bad result                        

done_ok
#ifdef DEBUG
              mov       r0,#89                  ' Y
              call      #SIO_WriteByte
#endif
              mov       rslt,#0                 ' return good result
done
              lockclr   p_lock                  ' release exclusive access to proxy
              wrlong    rslt,rsltptr            ' set result 
              mov       r0,#0                   ' indicate ...              
              wrlong    r0,rqstptr              ' ... request complete ...
              jmp       #waitloop               ' wait for another request

read_sect
              rdlong    Hub_Addr,r0             ' get hub ram buffer address
              add       r0,#4                   ' get ...
              rdlong    sector,r0               ' ... sector to read
              call      #ProxyLock              ' get exclusive access to proxy
        if_nz jmp       #done_err               ' error if cannot lock                   
#ifdef DEBUG
              mov       r0,#90 '#82             'Z     ' R 
              call      #SIO_WriteByte
#endif              
              call      #SIO_WriteSync          ' send sync ...              
              mov       r0,#SD_Read             ' ... followed by ...
              call      #SIO_WriteByte          ' ... read request ...
              mov       SIO_Temp,sector         ' ... followed by ...
              call      #SIO_WriteLong          ' ... sector number
              call      #SIO_ReadSync           ' read response sync
              cmps      r0,#0 wz,wc             ' if error ...
        if_b  jmp       #done_err               ' ... just finish read                    
              call      #SIO_ReadByte           ' read ...
              mov       rslt,r0 wz,wc           ' ... result byte
        if_be jmp       #done_err               ' if error or no data, just finish read                    
              call      #SIO_ReadPage           ' othewrwise, read page
#ifdef DEBUG
              mov       r0,#90 '#82             'Z     ' R 
              call      #SIO_WriteByte
#endif              
              jmp       #done_ok                ' done                         

write_sect
              rdlong    Hub_Addr,r0             ' get hub ram buffer address
              add       r0,#4                   ' get ...
              rdlong    sector,r0               ' ... sector to read
              call      #ProxyLock              ' get exclusive access to proxy
        if_nz jmp       #done_err               ' error if cannot lock                   
#ifdef DEBUG
              mov       r0,#87                  ' W
              call      #SIO_WriteByte
#endif
              call      #SIO_WriteSync          ' send sync ...              
              mov       r0,#SD_Write            ' ... followed by ...
              call      #SIO_WriteByte          ' ... SD_Write request ...
              mov       SIO_Temp,sector         ' ... followed by ...
              call      #SIO_WriteLong          ' ... sector number ...
              mov       SIO_Addr,cpu_no         ' ... followed ...
              shl       SIO_Addr,#24            ' ... by ...
              mov       SIO_Len,max_page        ' ... the ...
              call      #SIO_WritePage          ' ... sector data
              jmp       #read_response          ' read the response

byte_io
              and       r0,#$FF                 ' save the byte ...
              mov       byte_val,r0             ' ... to send
              call      #ProxyLock              ' get exclusive access to proxy
        if_nz jmp       #done_err               ' error if cannot lock                   
#ifdef DEBUG
              mov       r0,#66                  ' B
              call      #SIO_WriteByte
#endif
              call      #SIO_WriteSync          ' send sync ...              
              mov       r0,#SD_ByteIO           ' ... followed by ...
              call      #SIO_WriteByte          ' ... byte io request
              mov       r0,byte_val             ' ... followed by ...
              call      #SIO_WriteByte          ' ... the byte itself
              jmp       #read_response          ' read the response
'
' ProxyLock - set the proxy lock, or return an error if it cannot be set after one second 
'
ProxyLock
              mov       lock_start,cnt
:lock_loop
              mov       r0,cnt
              cmp       r0,lock_start wc
        if_nc sub       r0,lock_start
        if_c  subs      r0,lock_start
              cmp       r0,one_sec wz,wc
        if_a  jmp       #:lock_error
              lockset   p_lock wc
        if_c  jmp       #:lock_loop
              mov       r0,#0 wz
              jmp       #ProxyLock_ret  
:lock_error   neg       r0,#1 wz
ProxyLock_ret
              ret
lock_start    long      0                            

'-------------------------------- HMI Routines -------------------------------
'
#ifdef DEBUG
' HMI_Command - send a request to HMI Plugin for execution
' On Entry
'          r1 = command
'          r2 = data
'
HMI_Command

#ifdef SHARED_XMM
        call    #XMM_Tristate   ' disable XMM while using HMI
#endif

        shl     r1,#24          ' construct ...  
        and     r2,Low24        ' ... 
        or      r2,r1           ' ... request

        mov     r0,#LMM_HMI     ' plugin type we want 

        mov     ftemp,reg_addr  ' point to registry
        mov     ftmp2,#0        ' start at cog 0
:send1
        cmp     ftmp2,#8 wc,wz  ' run out of plugins?
 if_ae  jmp     #:error         ' yes - no such plugin
        rdlong  ftmp3,ftemp     ' no - check next plugin type
        shr     ftmp3,#24       ' is it ...
        cmp     ftmp3,r0 wz     ' ... the type what we wanted?
 if_z   jmp     #:send2         ' yes - use this plugin
        add     ftmp2,#1        ' no ...
        add     ftemp,#4        ' ... check ...
        jmp     #:send1         ' ... next cog
:send2
        mov     r0,ftmp2        ' use the cog where we found the plugin
        shl     r0,#2           ' multiply plugin (cog) id by 4 ...
        add     r0,reg_addr     ' add registry base to get registry entry
        rdlong  r0,r0           ' get request block from registry
        test    r0,Top8 wz      ' plugin registered?
 if_z   jmp     #:error         ' no - return error
        and     r0,low24        ' yes - write request ...
        wrlong  r2,r0           ' ... to request block
:loop2  rdlong  r2,r0   wz      ' wait till ...
 if_nz  jmp     #:loop2         ' ... request completed
        mov     r0,#0
        jmp     #:done
:error
        neg     r0,#1           ' return -1 on any error
:done

#ifdef SHARED_XMM
        call    #XMM_Activate   ' enable XMM again
#endif

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
' HMI_Hex - print a hex value (value in r2)
'
HMI_Hex
        mov    r1,#26                           ' for debug only
        call   #HMI_XferCmd                     ' for debug only
HMI_Hex_ret
        ret
'
' HMI_Char - send a char (char in r2)
'
HMI_Char
        mov    r1,#22                           ' for debug only
        call   #HMI_Command                     ' for debug only
HMI_Char_ret
        ret
'
' HMI_Space - send a space
'
HMI_Space
        mov    r2,#32                           ' for debug only
        call   #HMI_Char                         ' for debug only
HMI_Space_ret
        ret
'
' HMI_CrLf - send a CRLF
'
HMI_CrLf
        mov    r2,#13                           ' for debug only
        call   #HMI_Char                        ' for debug only
        mov    r2,#10                           ' for debug only
        call   #HMI_Char                        ' for debug only
HMI_CrLf_ret
        ret
'
#endif
'------------------------------------ SIO Routines -----------------------------------
'
' SIO_ReadPage : Read data from SIO to HUB RAM.
' On Entry: 
'    SIO_Addr  (32-bit): source address (not used, but updated after read)
'    Hub_Addr  (32-bit): destination address in main memory, 16-bits used
'    SIO_Len   (32-bit): number of bytes read, (max PAGE_SIZE)
'
' NOTE: data packets are:
'    4 bytes CPU + address 
'    4 bytes size (but only a max of PAGE_SIZE will actually get loaded) 
'    size bytes of data  
'
' NOTE: The top byte of the address ($nn) is the CPU number (1 .. 3).
'
' NOTE ($nn $FF $FF $FF) ($00 $00 $00 $00) indicates end of data
'
' NOTE: to maintain synchronization, all data is read even if the CPU
'       address indicates the packet is not for this CPU.

SIO_ReadPage
              call      #SIO_ReadLong           ' read ...
              mov       SIO_Addr,SIO_Temp       ' ... address
{                     
              mov       r6,r0                   ' for debug only 
              mov       r2,SIO_Temp             ' for debug only
              call      #HMI_Hex                ' for debug only
              call      #HMI_Space              ' for debug only
              mov       r0,r6
}        
              call      #SIO_ReadLong           ' read ...
              mov       SIO_Len,SIO_Temp        ' ... size
{
              mov       r6,r0                   ' for debug only 
              mov       r2,SIO_Temp             ' for debug only
              call      #HMI_Hex                ' for debug only
              call      #HMI_Space              ' for debug only
              mov       r0,r6
}        
              mov       SIO_Cnt1,SIO_Len        ' assume ...
              mov       SIO_Cnt2,#0             ' ... we will not discard data
              tjz       SIO_Len,#:SIO_AddrChk   ' check address if no data to read
              cmp       SIO_Len,max_page wc,wz  ' do we need to discard data?
        if_be jmp       #:SIO_RdLoop1           ' no - just read and save ...
              mov       SIO_Cnt2,SIO_Len        ' yes - calculate size of data to save ...
              sub       SIO_Cnt2,max_page       ' ... and size of data ...
              mov       SIO_Cnt1,max_page       ' ... to discard
              mov       SIO_Len,SIO_Cnt1        ' save size of data
:SIO_RdLoop1
              call      #SIO_ReadByte           ' read ...
              wrbyte    r0,Hub_Addr             ' ... and save ...
              add       Hub_Addr,#1             ' ... up to ...
              djnz      SIO_Cnt1,#:SIO_RdLoop1  ' ... max_page bytes
              tjz       SIO_Cnt2,#:SIO_AddrChk  ' if no more bytes, check address
:SIO_RdLoop2
              call      #SIO_ReadByte           ' read but discard ...
              djnz      SIO_Cnt2,#:SIO_RdLoop2  ' ... any remaining bytes
:SIO_AddrChk
              mov       r0,SIO_Addr             ' was this packet ...
              shr       r0,#24                  ' ... intended ...
              cmp       r0,cpu_no wz            ' ... for this CPU?
        if_nz jmp       #SIO_ReadPage            ' no - read another packet
              mov       r0,SIO_Addr             ' yes - remove CPU address ...
              and       r0,Low24                ' ... from ...
              mov       SIO_Addr,r0             ' ... data address
SIO_ReadPage_ret
              ret
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
              rdlong    r1,SIO_IO_Block         ' get rx_head
              mov       r2,SIO_IO_Block         ' get ...
              add       r2,#4                   ' ...
              rdlong    r3,r2                   ' ... rx_tail
              cmp       r1,r3 wz                ' rx_tail = rx_head?
        if_z  jmp       #SIO_ReadByteRaw        ' yes - wait
              mov       r1,SIO_IO_Block         ' no - get received byte ...
              add       r1,#9*4                 ' ... from ... 
              add       r1,r3                   ' ... rx_buffer ...
              rdbyte    r0,r1                   ' ... [rx_tail] ...
              add       r3,#1                   ' calculate ... 
              and       r3,#$0f                 ' ... (rx_tail + 1) & $0f
              wrlong    r3,r2                   ' rx_tail := (rx_head + 1) & $0f
{
              mov       r6,r0
              mov       r1,#24                  ' for debug only
              mov       r2,r0                   ' for debug only
              call      #HMI_XferCmd            ' for debug only
              mov       r1,#22                  ' for debug only
              mov       r2,#$20                 ' for debug only
              call      #HMI_Command            ' for debug only
              mov       r0,r6
}
              jmp       #SIO_ReadByteRaw_ret        
SIO_ReadByteRaw_err
              neg       r0,#1               
SIO_ReadByteRaw_ret
              ret
'
' SIO_ReadByte : Read byte from SIO to r0, unstuffing $FF $00 to just $FF
'
'          NOTE: ReadByteRaw returns -1 if the timeout expires, or -2 if a 
'                sync signal (i.e. $FF CPU_no) is detected. Any other
'                $FF $xx sequence just returns as normal. 
'
SIO_ReadByte
              mov       SIO_StartTime,cnt
SIO_ReadByte_loop
              call      #SIO_ReadByteRaw
              cmps      r0,#0 wz,wc
        if_b  jmp       #:read_err
              tjz       last_was_ff,#:check_for_ff
              cmp       r0,cpu_no wz
        if_z  jmp       #:read_sync
              cmp       r0,#0 wz
        if_z  mov       last_was_ff,#0               
        if_z  jmp       #SIO_ReadByte_loop      ' unstuff
:check_for_ff
              cmp       r0,#$ff wz
        if_nz jmp       #:clr_last_was_ff
              mov       last_was_ff,#1
              jmp       #SIO_ReadByte_ret
:read_err
              neg       r0,#1
              jmp       #:clr_last_was_ff
:read_sync
              neg       r0,#2
:clr_last_was_ff              
              mov       last_was_ff,#0               
SIO_ReadByte_ret
              ret
'              
last_was_ff   long      $0   
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
              add       Hub_Addr,#1             ' ... SIO_Len ...
              djnz      SIO_Len,#:SIO_WriteLoop ' ... bytes
SIO_WritePage_ret
              ret
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
ByteDelay long 80_000_000/8000                      
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
        if_z  jmp       #SIO_WriteByteRaw_ret      ' no - just return
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

reg_addr      long      0
xfer_addr     long      0
cpu_no        long      0
max_page      long      PAGE_SIZE
Hub_Addr      long      0
p_lock        long      0

rqstptr       long      0
rsltptr       long      0

r0            long      0
r1            long      0
r2            long      0
r3            long      0

ftemp         long      $0
ftmp2         long      $0
ftmp3         long      $0

byte_val      long      0
rslt          long      0

sector        long      0

Top8          long      $FF00_0000
Low24         long      $00FF_FFFF

{{
'  Permission is hereby granted, free of charge, to any person obtaining
'  a copy of this software and associated documentation files
'  (the "Software"), to deal in the Software without restriction,
'  including without limitation the rights to use, copy, modify, merge,
'  publish, distribute, sublicense, and/or sell copies of the Software,
'  and to permit persons to whom the Software is furnished to do so,
'  subject to the following conditions:
'
'  The above copyright notice and this permission notice shall be included
'  in all copies or substantial portions of the Software.
'
'  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
'  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
'  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
'  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
'  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
'  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
'  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
}}
