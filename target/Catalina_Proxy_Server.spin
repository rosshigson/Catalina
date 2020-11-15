{{
'-------------------------------------------------------------------------------
'
' Catalina_Proxy_Server - A Proxy Server for SD and/or HMI device access. 
'
' This program is a pure server - it waits for a request to arrive via serial
' I/O, services the rwquest and then waits for another. The client must ensure
' that requests are correctly serialized. The client is normally a Catalina
' program using one or more of the proxy plugins:
'
'  -  Catalina_Proxy_SD_Plugin
'  -  Catalina_Proxy_HMI_Plugin  
' 
' Note that this program can only act as a proxy server for one client CPU.
'
'
' SD/HMI     Client                          Server
' Function   Request                         Response
' ========   =======                         ========
'
' SD_Init    FF 02 01                        FF 02 01
'
' SD_Read    FF 02 02 s s s s                FF 02 02 <sector_data>
'                                       (or) FF 02 00 (no data)
'        
' SD_Write   FF 02 03 s s s s <sector_data>  FF 02 03
'
' SD_ByteIO  FF 02 04 b                      FF 02 04
'                         
' SD_StopIO  FF 02 05                        FF 02 05
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
' Version 1.0 - initial version by Ross Higson
' Version 2.8 - Simplified object selection logic.
' Version 3.0 - clear keyboard on startup to avoid spurious characters.
' Version 3.1 - Simplified version.
'
'-------------------------------------------------------------------------------
}}
'
CON

#include "CFG.inc"

'
' by default, cursor 1 normally scrolls, so it is generally better 
' to use cursor 1 when proxying the screen.
'
#define USE_CURSOR_1
'
' Specify whether to output debugging info (to the local HMI):
'
'#define DEBUG                  ' need this if any others enabled
'#define DEBUG_READ_PAGE
'#define DEBUG_VERBOSE
'#define DEBUG_SIGNAL
'#define DEBUG_MOUSE
'#define DEBUG_SD
'#define DEBUG_TEXT
'#define DEBUG_KEY
'
' comment these out if possible, to save space:
'
#define NEED_SIO_READPAGE
#define NEED_SIO_WRITEPAGE
'
'-------------------------------------------------------------------------------
' Shouldn't normally need to change anything after this line
'-------------------------------------------------------------------------------
'
' Figure out which devices to Proxy, based on these options:                
'
'   NO_SD
'   NO_KEYBOARD
'   NO_MOUSE
'   NO_SCREEN
'
' Figure out if we need the HMI plugin at all:
'
#ifdef DEBUG
#else
#ifdef NO_SCREEN
#ifdef NO_KEYBOARD
#ifdef NO_MOUSE
#ifndef NO_HMI
#define NO_HMI
#endif
#endif
#endif
#endif
#endif
'
' Figure out if we need the SD plugin:
'
#ifndef NO_SD
#ifndef SD
#define SD
#endif
#endif
'
CON
'
' CPU where this proxy server is running 
' (only 2 possibilities are currently supported):
'
#ifdef CPU_1
THIS_CPU  = 1                 ' Server running on CPU #1
#elseifdef CPU_2
THIS_CPU  = 2                 ' Server running on CPU #2
#elseifdef CPU_3
#error : CPU_3 NOT SUPPORTED AS PROXY SERVER
#endif
'
CLOCKFREQ    = Common#CLOCKFREQ
'
SECTOR_SIZE  = Common#FLIST_SSIZ   
'
MODE         = Common#SIO_COMM_MODE
'
BAUD         = Common#SIO_BAUD
'
LMM_FIL      = Common#LMM_FIL
'
LMM_HMI      = Common#LMM_HMI
'
' SD support:
'
SD_Init     = 1
SD_Read     = 2
SD_Write    = 3
SD_ByteIO   = 4
SD_StopIO   = 5
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
OBJ
'
  Common : "Catalina_Common"
'  
  SIO    : "Catalina_SIO_Plugin"
'
  SD     : "SD_Card"
'
  HMI    : "HMI.spin"
'
'
'
PUB Run | SIO_BLOCK, SECT_BLOCK, reg,xfr,blk,sec

  ' Set up the Registry - required for Catalina Plugins
  Common.InitializeRegistry

  ' Set up the HMI (if used - no proxying!)
  HMI.Setup( -1, -1, -1)

  ' Set up the SD (if used - no proxying!)
  SD.Setup(-1, -1, -1)

  ' allocate a sector block
  SECT_BLOCK            := long[Common#FREE_MEM] - SECTOR_SIZE
  long[Common#FREE_MEM] := SECT_BLOCK

  ' allocate a serial io block
  SIO_BLOCK             := long[Common#FREE_MEM] - SIO#BLOCK_SIZE
  long[Common#FREE_MEM] := SIO_BLOCK 

  ' Now start the plugins 
  SD.Start

  HMI.Start

  ' Start the Serial IO plugin using the Propeller I/O pins
  ' defined for communicating with other CPUs.
  SIO.Start(SIO_BLOCK, Common#RX_PIN, Common#TX_PIN, MODE, BAUD, TRUE)
  '
  ' start the proxy server
  '
  reg := Common#REGISTRY
  xfr := Common#PROXY_XFER
  blk := SIO_BLOCK
  sec := SECT_BLOCK
  coginit(cogid, @entry, @reg)
'

DAT
              org       0
entry
              mov       r0,par                  ' get parameter address
              rdlong    reg_addr,r0             ' save registry address
              add       r0,#4                   ' save  ...
              rdlong    xfer_addr,r0            ' ... xfer address
              add       r0,#4                   ' save  ...
              rdlong    SIO_IO_Block,r0         ' ... io block address
              add       r0,#4                   ' save  ...
              rdlong    sect_addr,r0            ' ... sector buffer address
#ifndef NO_KEYBOARD
              call      #HMI_k_clear            ' clear the keyboard
#endif
#ifdef DEBUG_VERBOSE
              mov       r2,#65
              call      #HMI_t_char
              call      #HMI_crlf
#endif              

command_loop
              call      #SIO_DataReady          ' any data arrived from client?
        if_nz jmp       #process_command        ' yes - process it
        
#ifndef NO_HMI

#ifndef NO_MOUSE        
              call      #m_data_ready           ' no - any new mouse data ready?
        if_nz jmp       #data_signal            ' yes - send data signal
#endif

#ifndef NO_KEYBOARD        
              call      #HMI_k_ready            ' no - any new keyboard data ready?
        if_nz jmp       #data_signal            ' yes - send data signal
#endif

#endif        

              jmp       #command_loop           ' check for a command

data_signal
#ifdef DEBUG_SIGNAL
              mov       r2,#"D"
              call      #HMI_t_char
#endif              
              mov       r0,#0                   ' send ...
              call      #SIO_WriteByte          ' ... data signal
              jmp       #command_loop           ' wait for a command 

process_command        
              call      #SIO_ReadSync           ' wait ...
              cmps      r0,#0 wz,wc             ' ... for ...
        if_be jmp       #command_loop           ' ... sync 
              call      #SIO_ReadByte           ' read ...
              mov       rqst,r0                 ' ... request
              mov       rslt,rqst               ' default result is just to echo request

#ifdef DEBUG_VERBOSE
              mov       r2,#"S"
              call      #HMI_t_char
              call      #HMI_space
              mov       r2,rqst
              call      #HMI_t_dec
              call      #HMI_space
              mov       r0,rqst
#endif              
              sub       r0,#1 wz                ' 1 = SD_Init?
        if_z  jmp       #do_init                ' yes - initialization
              sub       r0,#1 wz                ' 2 = SD_Read?
        if_z  jmp       #do_read                ' yes - read sector
              sub       r0,#1 wz                ' 3 = SD_Write?
        if_z  jmp       #do_write               ' yes - write sector
              sub       r0,#1 wz                ' 4 = SD_ByteIO?
        if_z  jmp       #do_byte                ' yes - write byte
              sub       r0,#1 wz                ' 5 = SD_Stop?
        if_z  jmp       #send_result            ' yes - nothing required, just return result
              sub       r0,#1 wz                ' 6 = KB_Reset?
        if_z  jmp       #do_k_reset             ' yes - reset keyboard
              sub       r0,#1 wz                ' 7 = KB_Data?
        if_z  jmp       #do_k_data              ' yes - get keyboard data
              sub       r0,#1 wz                ' 8 = MS_Data?
        if_z  jmp       #do_m_data              ' yes - get mouse data
              sub       r0,#1 wz                ' 9 = TV_Data?
        if_z  jmp       #do_t_data              ' yes - output screen data
        
send_zero        
              mov       rslt,#0                 ' unknown command (or other error)
send_result
              call      #SIO_WriteSync          ' send sync ...
              mov       r0,rslt                 ' ... followed by ...
              call      #SIO_WriteByte          ' ... result byte
              call      #SIO_DataReady          ' any data arrived from client?
        if_nz jmp       #process_command        ' yes - process it
              jmp       #command_loop           ' no - wait for next command              
'
#ifndef NO_SD
'
do_init
#ifdef DEBUG_SD
              mov       r2,#"I"
              call      #HMI_t_char
              call      #HMI_space
#endif              
              jmp       #send_result            ' send result and get next command

do_read
#ifdef DEBUG_SD
              mov       r2,#"R"
              call      #HMI_t_char
              call      #HMI_space
#endif              
              call      #SIO_ReadLong           ' read the sector number
              mov       sect_num,SIO_Temp       ' load ...
              call      #SD_ReadSector          ' ... the sector data
#ifdef DEBUG_SD
              mov       r2,sect_num             ' print
              call      #HMI_t_hex              ' ... sector ...
              call      #HMI_crlf               ' ... number
#endif
              call      #SIO_WriteSync          ' send sync ...
              mov       r0,#SD_Read             ' ... followed by ...
              call      #SIO_WriteByte          ' ... SD_Read ...               
              mov       SIO_Addr,cpu_no         ' ... followed ...
              shl       SIO_Addr,#24            ' ... by ...
              mov       Hub_Addr,sect_addr      ' ... the ...
              mov       SIO_Len,sect_size       ' ... sector ...
              call      #SIO_WritePage          ' ... data
              jmp       #command_loop           ' get next command

do_write
#ifdef DEBUG_SD
              mov       r2,#"W"
              call      #HMI_t_char
              call      #HMI_space
#endif              
              call      #SIO_ReadLong           ' read the sector number 
              mov       sect_num,SIO_Temp       ' read ...
              mov       Hub_Addr,sect_addr      ' ... the ...
              mov       SIO_Len,sect_size       ' ... sector ...
              call      #SIO_ReadPage           ' ... data
#ifdef DEBUG_SD
              mov       r2,sect_num
              call      #HMI_t_hex
              call      #HMI_crlf
#endif              
              call      #SD_WriteSector         ' save the sector data
              jmp       #send_result            ' send result and get next command

do_byte              
#ifdef DEBUG_SD
              mov       r2,#"B"
              call      #HMI_t_char
              call      #HMI_crlf
#endif              
              call      #SIO_ReadByte           ' read the byte 
              call      #SD_WriteByte           ' save the byte
              jmp       #send_result            ' send result and get next command
'
#else
'
do_init
do_read
do_write
do_byte
              jmp       #command_loop
'                      
#endif
'
#ifndef NO_HMI
'
do_k_reset
#ifdef DEBUG_VERBOSE
              mov       r2,#"K"
              call      #HMI_t_char
              mov       r2,#"R" 
              call      #HMI_t_char
              call      #HMI_crlf
#endif              
              call      #HMI_k_clear
              jmp       #send_result            ' send result and get next command
'
do_k_data
#ifdef DEBUG_VERBOSE
              mov       r2,#"K"
              call      #HMI_t_char
              mov       r2,#"D"
              call      #HMI_t_char
              call      #HMI_crlf
#endif              
              call      #HMI_k_get
              mov       value,r0 wz             ' save key value
        if_z  jmp       #send_zero              ' if no key, return zero result
#ifdef DEBUG_KEY        
              mov       r2,#"K"
              call      #HMI_t_char
              call      #HMI_space
              mov       r2,value
              call      #HMI_t_dec              ' key value
              call      #HMI_crlf
#endif              
              call      #SIO_WriteSync          ' otherwise, send symc ...
              mov       r0,rslt                 ' ... followed by ...
              call      #SIO_WriteByte          ' ... KB_Data ...
              mov       r0,value                ' ... followed by ...               
              call      #SIO_WriteByte          ' ... key value               
              jmp       #command_loop           ' get next command
'
do_t_data
              call      #SIO_WriteSync          ' send sync in response (indicates we are ready)
#ifdef DEBUG_VERBOSE
              mov       r2,#"T" 
              call      #HMI_t_char
              mov       r2,#"D"
              call      #HMI_t_char
              call      #HMI_crlf
#endif
:t_data_loop              
              call      #SIO_ReadByte           ' got ...
              cmps      r0,#0 wc,wz             ' ... character?
        if_ae jmp       #:t_data_out            ' yes - output it
              add       r0,#1 wz                ' no - timeout?
        if_nz call      #SIO_WriteSync          ' no - must be sync, so send sync in response
              jmp       #command_loop           ' get next command
:t_data_out        
              mov       r2,r0
#ifdef DEBUG_TEXT
              call      #HMI_t_dec              ' character value
              call      #HMI_space
#else              
#ifdef USE_CURSOR_1
              or        r2,curs_1
#endif              
              call      #HMI_t_char             ' send it to HMI
#endif
              jmp       #:t_data_loop           ' see if more to output
#ifdef USE_CURSOR_1              
curs_1        long      1<<23                   ' use cursor 1
#endif                            
'
'
m_data_ready
              mov       rslt,#0                 ' clear result
              call      #HMI_m_abs_x            ' get abs_x
              cmp       r0, last_x wz           ' any change?
        if_nz mov       rslt,#MS_Data           ' yes - must send new values
              mov       this_x,r0              
              call      #HMI_m_abs_y            ' get abs_y                 
              cmp       r0, last_y wz           ' any change?               
        if_nz mov       rslt,#MS_Data           ' yes - must send new values
              mov       this_y,r0              
              call      #HMI_m_abs_z            ' get abs_z                 
              cmp       r0, last_z wz           ' any change?               
        if_nz mov       rslt,#MS_Data           ' yes - must send new values
              mov       this_z,r0              
              call      #HMI_m_buttons          ' get buttons
              and       r0,#%111                ' only support 3 buttons                  
              cmp       r0, last_b wz           ' any change?               
        if_nz mov       rslt,#MS_Data           ' yes - must send new values
              mov       this_b,r0
#ifdef DEBUG_SIGNAL
        if_z  jmp       #:done
              mov       r2,last_b
              call      #HMI_t_dec
              mov       r2,this_b
              call      #HMI_t_dec
:done        
#endif              
              cmp       rslt,#0 wz              ' set Z flag if no new values to send 
m_data_ready_ret
              ret
'
this_x        long 0
this_y        long 0
this_z        long 0
this_b        long 0
'
last_x        long 0
last_y        long 0
last_z        long 0
last_b        long 0
'
do_m_data
#ifdef DEBUG_VERBOSE
              mov       r2,#"M"
              call      #HMI_t_char
              mov       r2,#"D"
              call      #HMI_t_char
              call      #HMI_crlf
#endif
              call      #m_data_ready           ' any new mouse data to send?
        if_z  jmp       #send_zero              ' if no change, return zero      
              call      #SIO_WriteSync          ' send sync ...
              mov       r0,#MS_Data             ' ... followed by ...
              call      #SIO_WriteByte          ' ... MS_Data ...     
              mov       SIO_Temp,this_x         ' ... followed by ...                      
              call      #SIO_WriteLong          ' ... abs_x ...     
              mov       SIO_Temp,this_y         ' ... followed by ...               
              call      #SIO_WriteLong          ' ... abs_y ... 
              mov       SIO_Temp,this_z         ' ... followed by ...               
              call      #SIO_WriteLong          ' ... abs_z ... 
              mov       r0,this_b               ' ... followed by ...               
              call      #SIO_WriteByte          ' ... buttons ...
#ifdef DEBUG_MOUSE
              mov       r2,this_x               ' output ...                      
              call      #HMI_t_hex              ' ... abs_x ...
              call      #HMI_space                  
              mov       r2,this_y               ' output ...               
              call      #HMI_t_hex              ' ... abs_y ... 
              call      #HMI_space                  
              mov       r2,this_z               ' output ...               
              call      #HMI_t_hex              ' ... abs_z ... 
              call      #HMI_space                  
              mov       r2,this_b               ' output ...               
              call      #HMI_t_hex              ' ... buttons ...
              call      #HMI_space                  
#endif
              mov       last_x,this_x           ' remember ...              
              mov       last_y,this_y           ' ... last ...              
              mov       last_z,this_z           ' ... data ...              
              mov       last_b,this_b           ' ... sent              
              jmp       #command_loop           ' wait for next command
'

#else
'
do_k_reset
do_k_data
do_t_data
do_m_data
              jmp       #command_loop
'
#endif
'              
'-------------------------------- HMI Routines -------------------------------
'
#ifndef NO_HMI
'        
' HMI_Command - send a request to HMI Plugin for execution
' On Entry
'    r1 = command
'    r2 = data
' On exit:
'    r0 = result   
'
' HMI_XferCmd - send a request to HMI Plugin for execution
'               using an xfer block to hold the data
' On Entry
'    r1 = command
'    r2 = data
' On Exit:
'    r0 = result
'
HMI_XferCmd
        wrlong r2,xfer_addr                     ' put data in xfer block
        mov    r2,xfer_addr                     ' use xfer block as data
        
HMI_Command

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
        test    r0,top8 wz      ' plugin registered?
 if_z   jmp     #:error         ' no - return error
        and     r0,low24        ' yes - write request ...
        wrlong  r2,r0           ' ... to request block
:loop2  rdlong  r2,r0   wz      ' wait till ...
 if_nz  jmp     #:loop2         ' ... request completed
        add     r0,#4           ' get results ...
        rdlong  r0,r0           ' ... from request block
        jmp     #:done
:error
        neg     r0,#1           ' return -1 on any error
:done

        jmp     #HMI_Command_ret
HMI_Command_ret
HMI_XferCmd_ret
        ret
'
' HMI_t_dec - output a dec value (value in r2)
'
HMI_t_dec
        mov    r1,#24                         
        call   #HMI_XferCmd                   
HMI_t_dec_ret
        ret
'
' HMI_t_hex - output a hex value (value in r2)
'
HMI_t_hex
        mov    r1,#26                         
        call   #HMI_XferCmd                   
HMI_t_hex_ret
        ret
'
' HMI_crlf - output CrLf
'
HMI_crlf
        mov    r2,#13                     
        call   #HMI_t_char                  
        mov    r2,#10                     
        call   #HMI_t_char                  
HMI_CrLf_ret
        ret
'
' HMI_space - output space
'
' HMI_t_char - output a char (char in r2)
'
HMI_Space
        mov    r2,#32                     
HMI_t_char
        mov    r1,#22                     
        call   #HMI_Command               
HMI_t_char_ret
HMI_space_ret
        ret
'
' HMI_k_clear - clear keyboard
'
HMI_k_clear
        mov   r1,#6
        call  #HMI_Command
HMI_k_clear_ret
        ret
'
' HMI_k_get - get a key
'
HMI_k_get
        mov   r1,#2
        call  #HMI_Command
HMI_k_get_ret
        ret
'
' HMI_k_ready - key ready?
'
HMI_k_ready
        mov   r1,#5
        call  #HMI_Command
        cmp   r0,#0 wz
HMI_k_ready_ret
        ret
'
' HMI_m_abs_x - get mouse abs_x data
'
HMI_m_abs_x
        mov   r1,#14
        call  #HMI_Command
HMI_m_abs_x_ret
        ret
'
' HMI_m_abs_y - get mouse abs_y data
'
HMI_m_abs_y
        mov   r1,#15
        call  #HMI_Command
HMI_m_abs_y_ret
        ret
'
' HMI_m_abs_z - get mouse abs_z data
'
HMI_m_abs_z
        mov   r1,#16
        call  #HMI_Command
HMI_m_abs_z_ret
        ret
'
' HMI_m_buttons - get mouse button state data
'
HMI_m_buttons
        mov   r1,#13
        call  #HMI_Command
HMI_m_buttons_ret
        ret
'
#endif
'
#ifndef NO_SD
'
'------------------------------------ SD Routines ------------------------------------

' SD_Command - send a command to SD Plugin for execution
' On Entry
'          r2          request to send
'
SD_Command

              mov       r0,#LMM_FIL             ' plugin type we want 

              mov       ftemp,reg_addr          ' point to registry
              mov       ftmp2,#0                ' start at cog 0
:send1
              cmp       ftmp2,#8 wc,wz          ' run out of plugins?
        if_ae jmp       #:error                 ' yes - no such plugin
              rdlong    ftmp3,ftemp             ' no - check next plugin type
              shr       ftmp3,#24               ' is it ...
              cmp       ftmp3,r0 wz             ' ... the type what we wanted?
        if_z  jmp       #:send2                 ' yes - use this plugin
              add       ftmp2,#1                ' no ...
              add       ftemp,#4                ' ... check ...
              jmp       #:send1                 ' ... next cog
:send2
              mov       r0,ftmp2                ' use the cog where we found the plugin
              shl       r0,#2                   ' multiply plugin (cog) id by 4 ...
              add       r0,reg_addr             ' add registry base to get registry entry
              rdlong    r0,r0                   ' get request block from registry
              test      r0,Top8 wz              ' plugin registered?
        if_z  jmp       #:error                 ' no - return error
              and       r0,low24                ' yes - write request ...
              wrlong    r2,r0                   ' ... to request block
:loop2        rdlong    r2,r0   wz              ' wait till ...
        if_nz jmp       #:loop2                 ' ... request completed

#ifdef STOP_IO_IN_PROXY
              mov       r2,#SD_StopIO           ' write ... 
              shl       r2,#24                  ' ... stop request
              wrlong    r2,r0                   ' ... to request block
:loop3        rdlong    r2,r0   wz              ' wait till ...
        if_nz jmp       #:loop3                 ' ... request completed
#endif

              mov       r0,#0
              jmp       #:done
:error
              neg       r0,#1                   ' return -1 on any error
:done

SD_Command_ret
              ret
        

SD_ReadSector
              mov       r2,#SD_Read             ' construct ...
              shl       r2,#24                  ' ... read request  
              mov       r1,xfer_addr            ' get pointer to xfer block 
              or        r2,r1                   ' construct request
              wrlong    sect_addr,r1            ' write first argument to xfer block
              add       r1, #4
              wrlong    sect_num,r1             ' write second argument to xfer block
              call      #SD_Command             ' send command to SD plugin
SD_ReadSector_ret
              ret                 

SD_WriteSector
              mov       r2,#SD_Write            ' construct
              shl       r2,#24                  ' ... write request  
              mov       r1,xfer_addr            ' get pointer to xfer block 
              or        r2,r1                   ' construct request
              wrlong    sect_addr,r1            ' write first argument to xfer block
              add       r1, #4
              wrlong    sect_num,r1             ' write second argument to xfer block
              call      #SD_Command   
SD_WriteSector_ret
              ret                 

SD_WriteByte              
              mov       r2,#SD_ByteIO            ' construct
              shl       r2,#24                   ' ... byteIO request  
              or        r2, r0
              call      #SD_Command   
SD_WriteByte_ret
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
#ifdef DEBUG_READ_PAGE
              mov       r6,r0                   ' for debug only 
              mov       r2,SIO_Temp             ' for debug only
              call      #HMI_t_hex              ' for debug only
              call      #HMI_space              ' for debug only
              mov       r0,r6
#endif
              call      #SIO_ReadLong           ' read ...
              mov       SIO_Len,SIO_Temp        ' ... size
#ifdef DEBUG_READ_PAGE
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

Hub_Addr      long      0
max_page      long      SECTOR_SIZE
'

reg_addr      long      0
xfer_addr     long      0
cpu_no        long      THIS_CPU
sect_size     long      SECTOR_SIZE
sect_addr     long      0
sect_num      long      0

r0            long      0
r1            long      0
r2            long      0
r3            long      0
r6            long      0

rqst          long      0
rslt          long      0
value         long      0

ftemp         long      $0
ftmp2         long      $0
ftmp3         long      $0

Top8          long      $FF00_0000
Low24         long      $00FF_FFFF


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

