{{
'-------------------------------------------------------------------------------
'
' Catalina_EEPROM_SIO_Loader - loads a Program into EEPROM from Serial IO
'
' This program accepts data from Serial IO, and programs it into EEPROM.
' It can hanlde EEPROMs up to 128k. When loading is completed the program
' restarts the Propeller. This means that the program loaded can be either
' a SPIN program or an LMM program 32k or less, or an LMM or CMM program
' 64k or less, or an XMM program 128k or less. Programs larger than 32Kb
' must be compiled with -C EEPROM.
'
' NOTE This loader does not contain any SIO code - it expects to use 
' the Catalina SIO Plugin (started by a higher level object) which
' uses the shared io block address. It also does not contain any SPI
' code - it uses a version of Mike Green's sdspiFemto to handle the
' SPI bus.
'
' Version 1.0 - Initial version by Ross Higson.
'
'-------------------------------------------------------------------------------
}}
CON

EEPROM_PAGE_SIZE = 32 ' must be a divisor of SECTOR_SIZE (typical page size is 32, 128 or 256) 

' The following symbols should not be set here - they should instead be defined on
' the command line, so that they apply to all files included in the compilation:

'#define HI_SPEED_SPI  ' define for 400Khz SPI bus, otherwise 100Khz
'#define DISPLAY_LOAD  ' display packet Begin/End and CRCs during load
'#define DISPLAY_DATA  ' display packet bytes during load

CON
'
' Sector size is also commonly used as prologue size and I/O page size.
'
SECTOR_SIZE  = Common#FLIST_SSIZ

'
' Set up Proxy, HMI and CACHE symbols and constants:
'
#include "Constants.inc"
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
'#define DEBUG_DATA
'#define DEBUG_LOAD
'#define SLOW_XMIT

'
' determine if we need display support functions included
'
#ifdef DISPLAY_DATA
#ifndef DISPLAY
#define DISPLAY
#endif
#elseifdef DISPLAY_LOAD
#ifndef DISPLAY
#define DISPLAY
#endif
#endif

OBJ
   Common : "Catalina_Common"
   SPI    : "Catalina_sdspiFemto"                      ' SPI (EEPROM) Plugin

PUB Start(Block_Addr, Page_Buffer, Xfer_Buffer, CPU_Num) | Reg, Block, Page, Control, Xfer, CPU, spi_cog
  '
  ' Set up and Start the SPI plugin, and find the control block allocated
  '
  SPI.Setup
  spi_cog := SPI.Start - 1

  '
  ' Initiate the Low Level Loader 
  '
  Reg     := Common#REGISTRY
  Block   := Block_addr
  Page    := Page_Buffer
  Control := Common.GetRequest(spi_cog)
  Xfer    := Xfer_Buffer
  CPU     := CPU_Num

  cognew(@entry, @Reg)
  cogstop(cogid)


DAT
        org 0

entry
        mov    r0,par                           ' point to parameters
        rdlong reg_addr,r0                      ' save registry address
        add    r0,#4
        rdlong SIO_IO_Block,r0                  ' save io block address
        add    r0,#4
        rdlong page_addr,r0                     ' save page buffer address
        add    r0,#4
        rdlong ctrl_addr,r0                     ' save control buffer address
        add    r0,#4
        rdlong xfer_addr,r0                     ' save xfer buffer address
        add    r0,#4
        rdlong cpu_no,r0                        ' save our CPU number

#ifdef DISPLAY_LOAD
        mov    r2,#"A"                          ' for debug only 
        call   #HMI_t_char                      ' for debug only
        call   #HMI_CrLf                        ' for debug only
#endif

wait_loop
        call   #SIO_ReadSync                    ' wait ...
        cmps   r0,#0 wz,wc                      ' ... for ...
  if_be jmp    #wait_loop                       ' ... sync signal

#ifdef DISPLAY_DATA
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
        call   #HMI_space                       ' for debug only
#endif

        cmp    SIO_Addr,SIO_EOP wz              ' all done?
 if_z   jmp    #restart                         ' yes - restart propeller
 
#ifdef DISPLAY_LOAD
        mov    r2,#"E"                          ' for debug only
        call   #HMI_t_char                      ' for debug only
        mov    r2,SIO_Addr
        call   #HMI_t_dec
        call   #HMI_space                       ' for debug only
#endif

        mov    dst_addr,SIO_Addr
        call   #Copy_To_EEPROM                  ' copy page buffer to EEPROM
        call   #ClearPage
        mov    src_addr,SIO_Addr
        call   #Copy_From_EEPROM                ' copy page buffer from EEPROM

        mov    lrc_addr,page_addr

#ifdef DISPLAY_DATA
        mov    r2,#"D"                          ' for debug only
        call   #HMI_t_char                      ' for debug only
        mov    src_addr,page_addr               ' for debug only
        mov    end_addr,page_addr               ' for debug only
        add    end_addr,page_size               ' for debug only
:dumploop                                       ' for debug only
        cmp    src_addr,end_addr wz,wc          ' for debug only
  if_ae jmp    #:enddump                        ' for debug only
        rdbyte r2,src_addr                      ' for debug only
        call   #HMI_t_dec                       ' for debug only
        call   #HMI_space                       ' for debug only
        add    src_addr,#1                      ' for debug only
        jmp    #:dumploop                       ' for debug only
:enddump                                        ' for debug only
#endif

#ifdef DISPLAY_DATA
        mov    r2,#"Z"                          ' for debug only
        call   #HMI_t_char                      ' for debug only
#endif

:send_lrc
        mov    lrc_addr,page_addr               ' return LRC of page buffer                
        mov    lrc_size,page_size
        call   #LrcBuffer
        call   #SIO_WriteSync
        mov    r0,lrc_rslt
        call   #SIO_WriteByte

#ifdef DISPLAY_LOAD
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

        mov     r0,#$80                         ' reset ...
        clkset  r0                              ' ... the Propeller
                
time          long 0
rst_delay     long Common#CLOCKFREQ/10
        
'-------------------------------- Utility routines -----------------------------
'
' Copy_To_EEPROM - write page buffer to EEPROM.
'   dst_addr   : EEPROM address to copy to.
'
'   NOTE: We copy WHOLE PAGES.
'
Copy_To_EEPROM
        mov    r6,#0
:prog_loop
        mov    SPI_Adr,dst_addr
        add    SPI_Adr,r6
        mov    SPI_Buf,page_addr
        add    SPI_Buf,r6
        mov    SPI_Len,prog_size
        call   #SPI_Write_EEPROM
        add    r6,prog_size
        cmp    r6,page_size wz,wc
  if_b  jmp    #:prog_loop
Copy_To_EEPROM_ret
        ret

' Copy_From_EEPROM - read page buffer from EEPROM.
'   src_addr : address to copy from
'
Copy_From_EEPROM
        mov    SPI_Adr,src_addr
        mov    SPI_Buf,page_addr
        mov    SPI_Len,page_size
        call   #SPI_Read_EEPROM
Copy_From_EEPROM_ret
        ret
'
' ClearPage - clear the page buffer
'
ClearPage
        mov    r0,#0
        mov    r1,page_size
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
'-------------------------------- SPI Routines -------------------------------
'
' SPI_Wait - wait till previous SPI operation complete
'
SPI_Wait
        rdlong SPI_Tmp,ctrl_addr
        and    SPI_Tmp,SPI_Rdy wz
  if_nz jmp    #SPI_Wait
SPI_Wait_ret
        ret
'
' SPI_Read_EEPROM - read block from EEPROM to Hub RAM
' On entry:
'   SPI_Len - number of bytes to write
'   SPI_Buf - Hub RAM address of buffer to write
'   SPI_Adr - SPI Address in EEPROM to write 
' On Exit:
'   SPI_Tmp - result (and Z set if no error) 
'
{
PUB readEEPROM(addr,buffer,count) | t                  '' Read a block from EEPROM to RAM
  t := ioReadCmd
  repeat while long[control][0] & ioTestRdy            ' Wait for previous I/O to finish
  long[control][1] := (count << 16) | (buffer & $FFFF)
  long[control][0] := (t << 24) | (addr & $FFFFFF)
  repeat while long[control][0] & ioTestRdy            ' Wait for this to finish
  return (long[control][0] & ioTestErr) <> 0           ' Return any error code
}
SPI_Read_EEPROM
        and    SPI_Buf,low16
        and    SPI_Adr,low19
        call   #SPI_Wait
        mov    SPI_Tmp,SPI_Len
        shl    SPI_Tmp,#16
        or     SPI_Tmp,SPI_Buf
        mov    SPI_Ptr,ctrl_addr
        add    SPI_Ptr,#4
        wrlong SPI_Tmp,SPI_Ptr
        sub    SPI_Ptr,#4
        mov    SPI_Tmp,SPI_Rd
        or     SPI_Tmp,SPI_Adr
        wrlong SPI_Tmp,SPI_Ptr
        call   #SPI_Wait
        rdlong SPI_Tmp,ctrl_addr
        and    SPI_Tmp,SPI_Err wz
SPI_Read_EEPROM_ret
        ret                
'
' SPI_Write_EEPROM - write block from Hub RAM to EEPROM
' On entry:
'   SPI_Len - number of bytes to read
'   SPI_Buf - pointer to Hub RAM address to read
'   SPI_Adr - SPI Address to read
' On Exit:
'   SPI_Tmp - result (and Z set if no error) 
'
{
PUB writeEEPROM(addr,buffer,count) | t                 '' Write a block to EEPROM from RAM
  t := ioWriteCmd
  repeat while long[control][0] & ioTestRdy            ' Wait for previous I/O to finish
  long[control][1] := (count << 16) | (buffer & $FFFF)
  long[control][0] := (t << 24) | (addr & $FFFFFF)
  repeat while long[control][0] & ioTestRdy            ' Wait for this to finish
  return (long[control][0] & ioTestErr) <> 0           ' Return any error code
}
SPI_Write_EEPROM
        and    SPI_Buf,low16
        and    SPI_Adr,low19
        call   #SPI_Wait
        mov    SPI_Tmp,SPI_Len
        shl    SPI_Tmp,#16
        or     SPI_Tmp,SPI_Buf
        mov    SPI_Ptr,ctrl_addr
        add    SPI_Ptr,#4
        wrlong SPI_Tmp,SPI_Ptr
        sub    SPI_Ptr,#4
        mov    SPI_Tmp,SPI_Wr
        or     SPI_Tmp,SPI_Adr
        wrlong SPI_Tmp,SPI_Ptr
        call   #SPI_Write_Wait
        rdlong SPI_Tmp,ctrl_addr
        and    SPI_Tmp,SPI_Err wz
SPI_Write_EEPROM_ret
        ret                
'
' SPI_Present - return Z set if device present (address 0)
'
{
PUB checkPresence(addr) | t
'' This routine checks to be sure there is an I2C bus and an EEPROM at the
'' specified address.  Note that this routine cannot distinguish between a
'' 32Kx8 and a 64Kx8 EEPROM since the 16th address bit is a "don't care"
'' for the 32Kx8 devices.  Return true if EEPROM present, false otherwise.
  t := ioReadCmd
  repeat while long[control][0] & ioTestRdy            ' Wait for previous I/O to finish
  long[control][1] := 0                                ' Attempt to address the device
  long[control][0] := (t << 24) | (addr & $FFFFFF)
  repeat while long[control][0] & ioTestRdy            ' Wait for this to finish
  return (long[control][0] & ioTestErr) == 0           ' Return false on error
}
SPI_Present
        call   #SPI_Wait
        mov    SPI_Tmp,#0
        mov    SPI_Ptr,ctrl_addr
        add    SPI_Ptr,#4
        wrlong SPI_Tmp,SPI_Ptr
        sub    SPI_Ptr,#4
        mov    SPI_Tmp,SPI_Rd
        wrlong SPI_Tmp,SPI_Ptr
        call   #SPI_Wait
        rdlong SPI_Tmp,ctrl_addr
        and    SPI_Tmp,SPI_Err wz
SPI_Present_ret
        ret                
'
' SPI_WriteWait - do not return until write complete
'
{
PUB writeWait(addr) | t                                '' Wait for EEPROM to complete write
  t := cnt
  repeat until checkPresence(addr)                     ' Maximum wait time is 20ms
    if (cnt - t) > (clkfreq / 50)
      return true                                      ' Return true if a timeout occurred
  return false                                         ' Otherwise return false
}
'
SPI_Write_Wait
        mov    wait,cnt
        add    wait,wait_t
        call   #SPI_Present
  if_z  jmp    #SPI_Write_Wait_ret
        cmp    cnt,wait wz,wc
  if_b  jmp    #SPI_Write_Wait
SPI_Write_Wait_ret
        ret
'
SPI_Delay
        mov      wait,cnt
        add      wait,wait_t
        waitcnt  wait,#0
SPI_Delay_ret
        ret
wait    long   0
wait_t  long Common#CLOCKFREQ/50                       ' 20 ms
                


SPI_Ptr long   0
SPI_Tmp long   0
SPI_Buf long   0
SPI_Len long   0
SPI_Adr long   0
SPI_Rdy long   SPI#ioTestRdy        
SPI_Err long   SPI#ioTestErr

#ifdef HI_SPEED_SPI
SPI_Wr  long   (SPI#ioWriteCmd<<24) | (Common#BOOT_PIN<<18)
SPI_Rd  long   (SPI#ioReadCmd<<24)  | (Common#BOOT_PIN<<18)
#else      
SPI_Wr  long   ((SPI#ioWriteCmd | SPI#ioLowSpeed)<<24) | (Common#BOOT_PIN<<18)
SPI_Rd  long   ((SPI#ioReadCmd  | SPI#ioLowSpeed)<<24) | (Common#BOOT_PIN<<18)
#endif

'
'-------------------------------- HMI Routines -------------------------------
'
#ifdef DISPLAY
'
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

        mov     r0,#Common#LMM_HMI ' plugin type we want 

        mov     tmp1,reg_addr   ' point to registry
        mov     tmp2,#0         ' start at cog 0
send1
        cmp     tmp2,#8 wc,wz   ' run out of plugins?
 if_ae  jmp     #sendErr        ' yes - no such plugin
        rdlong  tmp3,tmp1       ' no - check next plugin type
        shr     tmp3,#24        ' is it ...
        cmp     tmp3,r0 wz      ' ... the type what we wanted?
 if_z   jmp     #send2          ' yes - use this plugin
        add     tmp2,#1         ' no ...
        add     tmp1,#4         ' ... check ...
        jmp     #send1          ' ... next cog
send2
        mov     r0,tmp2         ' use the cog where we found the plugin
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

#ifdef SHARED_XMM
        call    #XMM_Activate   ' enable XMM again
#endif

        jmp     #HMI_Command_ret
HMI_Command_ret
HMI_XferCmd_ret
        ret
'
tmp1    long    $0
tmp2    long    $0
tmp3    long    $0
        
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
        call   #HMI_t_char                       ' for debug only
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
#ifdef DEBUG_LOAD
              mov       r6,r0                   ' for debug only 
              mov       r2,SIO_Temp             ' for debug only
              call      #HMI_t_dec              ' for debug only
              call      #HMI_space              ' for debug only
              mov       r0,r6
#endif
              call      #SIO_ReadLong           ' read ...
              mov       SIO_Len,SIO_Temp        ' ... size
#ifdef DEBUG_DATA
              mov       r6,r0                   ' for debug only 
              mov       r2,SIO_Temp             ' for debug only
              call      #HMI_t_dec              ' for debug only
              call      #HMI_space              ' for debug only
              mov       r0,r6
#endif
              mov       SIO_Cnt1,SIO_Len        ' assume ...
              mov       SIO_Cnt2,#0             ' ... we will not discard data
              tjz       SIO_Len,#:SIO_AddrChk   ' check address if no data to read
              cmp       SIO_Len,page_size wc,wz ' do we need to discard data?
        if_be jmp       #:SIO_RdLoop1           ' no - just read and save ...
              mov       SIO_Cnt2,SIO_Len        ' yes - calculate size of data to save ...
              sub       SIO_Cnt2,page_size      ' ... and size of data ...
              mov       SIO_Cnt1,page_size      ' ... to discard
              mov       SIO_Len,SIO_Cnt1        ' save size of data
:SIO_RdLoop1
              call      #SIO_ReadByte           ' read ...
              wrbyte    r0,Hub_Addr             ' ... and save ...
              add       Hub_Addr,#1             ' ... up to ...
#ifdef DEBUG_DATA
              mov       r6,r0
              mov       r2,r0
              call      #HMI_t_dec
              call      #HMI_space
              mov       r0,r6
#endif              
              djnz      SIO_Cnt1,#:SIO_RdLoop1  ' ... page_size bytes
              tjz       SIO_Cnt2,#:SIO_AddrChk  ' if no more bytes, check address
:SIO_RdLoop2
              call      #SIO_ReadByte           ' read but discard ...
              djnz      SIO_Cnt2,#:SIO_RdLoop2  ' ... any remaining bytes
:SIO_AddrChk
              mov       r0,SIO_Addr             ' was this packet ...
              shr       r0,#24                  ' ... intended ...
              cmp       r0,cpu_no wz            ' ... for this CPU?
        if_nz jmp       #SIO_ReadPage           ' no - read another packet
              mov       r0,SIO_Addr             ' yes - remove CPU number ...
              and       r0,Low24                ' ... from ...
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
              mov       r6,r0
              mov       r2,r0
              call      #HMI_t_dec
              call      #HMI_space
              mov       r0,r6
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
top8          long      $FF000000
low16         long      $0000FFFF
low19         long      $0007FFFF
low24         long      $00FFFFFF

r0            long      $0
r1            long      $0
r2            long      $0
r3            long      $0
r6            long      $0

reg_addr      long      $0
page_addr     long      $0
ctrl_addr     long      $0
xfer_addr     long      $0
cpu_no        long      $0

Hub_Addr      long      $0

prog_size     long      EEPROM_PAGE_SIZE        ' only program this many bytes each write
page_size     long      SECTOR_SIZE             ' also prologue size

src_addr      long      $0
dst_addr      long      $0
end_addr      long      $0

              fit       $1f0                    ' max size
'
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