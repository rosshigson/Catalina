{{
' Catalina_Proxy_Client - client driver used by the Proxy HMI plugin.
'
' This driver implements proxy keyboard, mouse and screen drivers.
' It is not intended to be used directly, but is instead used by
' the Proxy HMI plugin.
'
' This file implements all HMI drivers as proxy drivers. If one
' or two of the devices are not required (e.g. for programs that
' want to make use of the local screen, but a remote mouse and
' keyboard) it makes no difference to this driver - this decision
' should be made in the Proxy HMI plugin.  
' 
' The protocol is very simple:
'
' SD         Client                          Server
' Function   Request                         Response
' ========   =======                         ========
'
' KB_Reset   FF 02 06                        FF 02 06                       
'
' KB_Data    FF 02 07                        FF 02 07 b
'                                       (or) FF 02 00 (no data)
'
' MS_Data    FF 02 08                        FF 02 08 x x x x y y y y z z z z b (if change detected)
'                                       (or) FF 02 00 (no change)
'
' TV_Data    FF 02 09                        FF 02
'  (then)    b b .. b b                      (up to MAX_TEXT bytes echoed)       
'  (then)    FF 02                           FF 02
'
' Note that the server never initiates requests. However, in order
' to void the need for the client to poll continuously, the server
' monitors whether there is any data that needs to be retreived by
' the client, and indicates this by broadcasting a "data" signal
' until the client retreives the data. Currently the data signal
' is simply a NULL byte - which does not indicate what type of data
' is available - it just tells the client to poll for all data.
' 
}}
CON

' KEYBOARD ... (note this must emulate Catalina_PC_Keyboard structure)

  kb_rxbuffersize = 16          ' rx buffer size(bytes): binary! 16/32/64/128/256
  kb_rxtailmask = kb_rxbuffersize -1 ' mask bits eg $F/1F/3F/7F/FF

  kb_count = 10                 ' 10 contiguous longs

  rx_head   = 0                 ' head of buffer
  rx_tail   = 1                 ' tail of buffer
  rx_pin    = 2                 '   (not used)
  rx_mode   = 3                 '   (not used)
  rx_ticks  = 4                 '   (not used)
  rx_bufptr = 5                 ' pointer to buffer
  rx_buffer = 6                 ' start of buffer (4 longs)

' MOUSE ... (note this must emulate Catalina_PC_Mouse structure)

  m_count    = 20               ' 10 contiguous longs

  par_x      = 9                ' 1 long for abs_x
  par_y      = 10               ' 1 long for abs_y
  par_z      = 11               ' 1 long for abs_z
  par_b      = 12               ' 1 long for button state
  par_p      = 13               ' 1 long for mouse present
  par_d      = 14               '    (not used)
  par_c      = 15               '    (not used)

' TEXT ...  (note this must emulate Catalina_PC_Text structure)

  cols       = 40
  rows       = 13

  BUFFSIZE   = 512              ' buffer must be 512 bytes

  tv_count   = 5                ' 5 contiguous longs

  tx_head   = 0                 ' head of buffer
  tx_tail   = 1                 ' tail of buffer
  tx_pin    = 2                 '    (not used)
  tx_ticks  = 3                 '    (not used)    "
  tx_bufptr = 4                 '  pointer to buffer   

'
' Keyboard support:
'
KB_Reset    = 6
KB_Data     = 7
'
' Mouse support:
'
MS_Data     = 8
'
' Screen support:
'
TV_Data     = 9
'
MAX_CHARS   = 8                 ' this is arbitrary, but should not be more than 16
                                ' (since that is the size of the receive character buffer)
MAX_TEXT    = 4                 ' force a mouse/kbd request after this many text requests

CLOCKFREQ = Common#CLOCKFREQ

SECTOR_SIZE = 512                                 

OBJ
  Common : "Catalina_Common"
  
PUB setup_kbd(kb_block) : okay

  longfill(kb_block, 0, kb_count)
  long[kb_block][rx_bufptr] := kb_block + rx_buffer*4 

PUB setup_mouse(m_block) : okay

  longfill(m_block,0, m_count)

PUB setup_screen(tv_block, buffer) : okay

  longfill(tv_block, 0, tv_count)
  long[tv_block][tx_bufptr] := buffer

PUB start(parameters) : okay | cog
  
  okay := cognew(@entry, parameters) + 1 


DAT
              org       0
entry
              mov       r0,par                  ' get parameter address
              rdlong    pkbd,r0                 ' save address of keyboard driver block
              add       r0,#4                   ' save  ...
              rdlong    pmouse,r0               ' ... address of mouse driver block
              add       r0,#4                   ' save  ...
              rdlong    pscreen,r0              ' ... address of screen driver block
              add       r0,#4                   ' save  ...
              rdlong    ptext,r0                ' ... address of text driver block
              add       r0,#4                   ' save  ...
              rdlong    SIO_IO_block,r0         ' ... address of io block
              add       r0,#4                   ' save  ...
              rdlong    p_lock,r0               ' ... proxy lock
              add       r0,#4                   ' save  ...
              rdlong    cpu_no,r0               ' ... server CPU no
              mov       r4,pmouse wz            ' are we emulating mouse driver?
        if_z  jmp       #:check_kbd             ' no - check keybaord
              add       r4,#par_p*4             ' yes - set mouse ...
              mov       r0,#1                   ' ... present ...
              wrlong    r0,r4                   ' ... to 1

:check_kbd
              mov       text_count,#MAX_TEXT
              mov       r4,pkbd wz              ' are we proxy for keyboard driver?
        if_z  jmp       #:check_mouse           ' no - check next device
              call      #ProcessKbd             ' yes - process keyboard

:check_mouse        
              mov       r4,pmouse wz            ' are we proxy for mouse driver?
        if_z  jmp       #:check_text            ' no - check next device
              call      #ProcessMouse           ' yes - process mouse

:check_text
              mov       r4,pscreen wz           ' are we proxy for screen driver?
        if_z  jmp       #:check_data            ' no - check if any new data available
              mov       r4,ptext                ' yes - process ...
              call      #ProcessText            ' ... text
        if_nz djnz      text_count,#:check_kbd  ' after MAX_TEXT times sending text, check mouse/kbd  

:check_data
              call      #SIO_DataReady          ' any data from server?
        if_z  jmp       #:check_text            ' no - just check for text to send                    
              jmp       #:check_kbd             ' yes - check for keyboard and mouse data
'
text_count    long      0             
'
' ProcessKbd 
' On entry
'     r4 = pkbd 
'
ProcessKbd
              call      #ProxyLock              ' get exclusive access to to proxy server
        if_nz jmp       #ProcessKbd_ret         ' cannot get exclusive access , so just exit
              rdlong    r1,r4                   ' get ... 
              mov       r2,r4                   ' ... head ...
              add       r2,#rx_tail*4           ' ... and ...
              rdlong    r2,r2                   ' ... tail
              sub       r2,#1                   ' is head ...
              and       r2,#kb_rxtailmask       ' ... equal to ...
              cmp       r1,r2 wz                ' ... tail - 1?
        if_z  jmp       #:key_done              ' yes  - no room for more key data, so just exit
              call      #SIO_WriteSync          ' send sync ...
              mov       r0,#KB_Data             ' ... followed by ...
              call      #SIO_WriteByte          ' ... KB_Data ...
              call      #SIO_ReadSync           ' read sync
              cmps      r0,#0 wz,wc
        if_b  jmp       #:key_done              ' error means no key data, so just exit
              call      #SIO_ReadByte           ' read response
              cmps      r0,#0 wz,wc
        if_be jmp       #:key_done              ' zero or error means no key data, so just exit
              call      #SIO_ReadByte           ' otherwise, read key
              cmps      r0,#0 wz,wc
        if_be jmp       #:key_done              ' error means no key data, so just exit
              mov       r3,r4                   ' get address ...
              add       r3,#rx_bufptr*4         ' ... of ... 
              rdlong    r3,r3                   ' ... keyboard buffer        ' 
              rdlong    r1,r4                   ' get head
              add       r1,r3                   '  save ... 
              wrbyte    r0,r1                   ' ... byte
              sub       r1,r3                   ' increment ...
              add       r1,#1                   ' ... and ...
              and       r1,#kb_rxtailmask       ' ... save ...
              wrlong    r1,r4                   ' ... head
:key_done
              lockclr   p_lock                  ' release exclusive lock                        
ProcessKbd_ret
              ret
'
' ProcessMouse
' On entry
'     r4 = pmouse 
'
ProcessMouse
              call      #ProxyLock              ' get exclusive access to to proxy server
        if_nz jmp       #ProcessMouse_ret       ' cannot get exclusive access, so just exit
              call      #SIO_WriteSync          ' send sync ...
              mov       r0,#MS_Data             ' ... followed by ...
              call      #SIO_WriteByte          ' ... MS_Data ...
              call      #SIO_ReadSync           ' read sync
              cmps      r0,#0 wz,wc
        if_b  jmp       #:mouse_done            ' error means no mouse data, so just exit
              call      #SIO_ReadByte           ' read response byte
              cmps      r0,#0 wz,wc
        if_be jmp       #:mouse_done            ' zero or error means no mouse data, so just exit
              call      #SIO_ReadLong           ' otherwise, read abs_x
              mov       r1,#par_x*4             ' save ...
              add       r1,r4                   ' ... mouse ...
              wrlong    SIO_Temp,r1             ' ... abs_x
              call      #SIO_ReadLong           ' read abs_y
              mov       r1,#par_y*4             ' save ...
              add       r1,r4                   ' ... mouse ...
              wrlong    SIO_Temp,r1             ' ... abs_y
              call      #SIO_ReadLong           ' read abs_z
              mov       r1,#par_z*4             ' save ...
              add       r1,r4                   ' ... mouse ...
              wrlong    SIO_Temp,r1             ' ... abs_z
              call      #SIO_ReadByte           ' read button states
              cmps      r0,#0 wz,wc
        if_b  jmp       #:mouse_done            ' error reading mouse data, so just exit
              mov       r1,#par_b*4             ' save ...
              add       r1,r4                   ' ... button ...
              wrlong    r0,r1                   ' ... states
:mouse_done
              lockclr   p_lock                  ' release exclusive lock                        
ProcessMouse_ret
              ret
'
' ProcessText
' On entry
'     r4 = ptext
' On exit
'     Z flag set if no text sent 
'
ProcessText
              rdlong    r1,r4                   ' get 
              mov       r2,r4                   ' ... head ...
              add       r2,#tx_tail*4           ' ... and ...
              rdlong    r2,r2                   ' ... tail
              cmp       r1,r2 wz                ' head == tail?
        if_z  jmp       #:notext                ' yes  - no text to send, so just exit
              call      #ProxyLock              ' no - get exclusive access to to proxy server
        if_nz jmp       #:notext                ' cannot get exclusive access - just exit
              call      #SIO_WriteSync          ' send sync ...
              mov       r0,#TV_Data             ' ... followed by ... 
              call      #SIO_WriteByte          ' ... TV_Data          
              call      #SIO_ReadSync           ' read sync
              cmps      r0,#0 wz,wc
        if_be jmp       #:text_done             ' error in response, so just exit
              mov       r5,#MAX_CHARS           ' send up to MAX_CHARS characters in each request                   
:text_loop
              rdlong    r1,r4                   ' get 
              mov       r2,r4                   ' ... head ...
              add       r2,#tx_tail*4           ' ... and ...
              rdlong    r2,r2                   ' ... tail
              cmp       r1,r2 wz                ' head == tail?
        if_z  jmp       #:text_finish           ' yes  - no more text to send, so finish
              mov       r3,r4                   ' no - get address ...
              add       r3,#tx_bufptr*4         ' ... of ... 
              rdlong    r3,r3                   ' ... text buffer        ' 
              add       r3,r2                   '  get ... 
              rdbyte    byte_val,r3             ' ... byte
              add       r2,#1                   ' increment ...
              and       r2,#$1FF                ' ... and ... 
              mov       r1,r4                   ' ... then ...
              add       r1,#tx_tail*4           ' ... save ...
              wrlong    r2,r1                   ' ... tail
              mov       r0,byte_val             ' semd ...                            
              call      #SIO_WriteByte          ' ... the text character
              djnz      r5,#:text_loop          ' check for more to send (up to MAX_TEST)
:text_finish              
              call      #SIO_WriteSync          ' send sync
              call      #SIO_ReadSync           ' read sync
:text_done
              lockclr   p_lock                  ' release exclusive lock
              mov       r0,#1 wz                ' ensure Z flag not set
              jmp       #ProcessText_ret
:notext
              mov       r0,#0 wz                ' ensure Z flag set                                      
ProcessText_ret
              ret
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

'------------------------------------ SIO Routines -----------------------------------
'
#ifdef NEED_SIO_READPAGE
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
#ifdef DEBUG
              mov       r6,r0                   ' for debug only 
              mov       r2,SIO_Temp             ' for debug only
              call      #HMI_t_hex              ' for debug only
              call      #HMI_space              ' for debug only
              mov       r0,r6
#endif
              call      #SIO_ReadLong           ' read ...
              mov       SIO_Len,SIO_Temp        ' ... size
#ifdef DEBUG
              mov       r6,r0                   ' for debug only 
              mov       r2,SIO_Temp             ' for debug only
              call      #HMI_t_hex              ' for debug only
              call      #HMI_space              ' for debug only
              mov       r0,r6
#endif
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
              mov       r0,SIO_Addr             ' yes - remove CPU number ...
              and       r0,Low24                ' ... from ...
              mov       SIO_Addr,r0             ' ... data address
SIO_ReadPage_ret
              ret
'
#endif              
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
ByteDelay long CLOCKFREQ/50
#else
ByteDelay long CLOCKFREQ/6000
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
Hub_Addr      long      $0
max_page      long      SECTOR_SIZE
'
Top8          long      $FF00_0000
Low24         long      $00FF_FFFF
'
r0            long      0
r1            long      0
r2            long      0
r3            long      0
r4            long      0
r5            long      0

pkbd          long      0
pmouse        long      0
pscreen       long      0
ptext         long      0
ptxbuff       long      0
p_lock        long      0
byte_val      long      0
cpu_no        long      0
  
