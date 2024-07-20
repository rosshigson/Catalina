{{
'-------------------------------------------------------------------------------
'
' Catalina_XMM_SIO_Loader - loads a Program into XMM from Serial IO
'
' This program accepts data from Serial IO, and loads it into XMM.
' It copies the first 31kb of code from XMM to Hub RAM and anything
' above 32kb into XMM. When loading is completed the program restarts
' the Propeller. This means that the program loaded should be either
' a SPIN program or self-contained LMM program less than 31k, or an
' XMM program that start with a target that knows how to load the
' actual program from XMM. 
'
' NOTE This loader does not contain any SIO code - it expects to use 
' the Catalina SIO Plugin (started by a higher level object) which
' uses the shared io block address.
'
' Version 1.0 - Initial version by Ross Higson.
'
' Version 1.1 - Add Morpheus support.
'
' Version 1.2 - Add support for single CPU platforms
'
' Version 2.5 - Add RamBlade support, minor improvements to XMM code.
'
' Version 2.8 - Added Reserved cog support
'
' Version 3.0 - Added FLASH Support
'             - display load progress if DISPLAY_LOAD is defined
'               on the command line when the utilities are built.
'               DISPLAY_LOAD_2 adds additional information, but makes
'               this program too large to load on some platforms.
'
' Version 3.0.1 - Use 4k block erase instead of chip erase by default.
'                 The previous behaviour can be reinstated by defining
'                 the symbol CHIP_ERASE
' Version 3.1 - Remove RESERVE_COG support.
'
' Version 3.3 - Tidy up platform depencencies.
'
' Version 3.6 - Support new binary format.
'
' Version 3.11 - Modified to fix 'order of compilation' issue with spinnaker.
'                Fixed a bug in zeroing the RAM - now zeroes from $10, not $0.
'
'
' This program incorporates XMM software derived from:
'
'    Cluso's TriBladeProp Blade #2 Driver v0.201
'
'    HX512SRAM_ASM_DRV_101.spin by Andre' LaMothe, 
'       (C) 2007 Nurve Networks LLC
'
'    Morpheus System Architecture and Developer's Guide v0.90
'       (C) 2009 William Henning
'
'-------------------------------------------------------------------------------
}}
CON
'
' Set up Proxy, HMI and CACHE symbols and constants:
'
#include "Constants.inc"
'
'
' define the following symbol to erase the whole flash chip 
' at once instead of erasing a 4k block at a time:
'
'#define CHIP_ERASE
'
' comment these out if possible, to save space:
'
#define NEED_SIO_READPAGE
#define NEED_SIO_READLONG
'#define NEED_SIO_WRITEPAGE
'#define NEED_SIO_WRITELONG

'
' Include Flash support if required:
'
#ifdef FLASH
#ifndef NEED_FLASH
#define NEED_FLASH              ' include FLASH support 
#endif
#endif
'
' debugging options (note that enabling debugging will also require SLOW_XMIT
' to be enabled to avoid comms timeouts):
'
'#define DEBUG_UNSTUFFED_DATA
'#define DEBUG_DATA
'#define SLOW_XMIT

'
' currently, we do not include the ability to load XMM programs (-x2, -x5)
' if we are using FLASH (-x3, -x4) - this is mainly due to lack of space
'
#ifndef NEED_FLASH
#define INCLUDE_NON_FLASH 
#endif

CON

SECTOR_SIZE  = Common#FLIST_SSIZ ' also prologue size and page size

'
' Prologue constants (offset from file location $8000)
'
INIT_BZ_OFF = $10 + (Common#LMM_INIT_BZ_OFF-Common#LMM_INIT_B0_OFF)<<2 + 8
INIT_PC_OFF = INIT_BZ_OFF + 4
LAYOUT_OFF  = INIT_PC_OFF + 4
CODE_OFF    = LAYOUT_OFF + 4    
CNST_OFF    = CODE_OFF + 4 
INIT_OFF    = CNST_OFF + 4
DATA_OFF    = INIT_OFF + 4
ENDS_OFF    = DATA_OFF + 4
ROBA_OFF    = ENDS_OFF + 4
RWBA_OFF    = ROBA_OFF + 4
ROEN_OFF    = RWBA_OFF + 4
RWEN_OFF    = ROEN_OFF + 4
TABLE_END   = RWEN_OFF + 4
'
FLIST_LOG2  = Common#FLIST_LOG2

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
#ifdef DISPLAY_LOAD
        rdlong reg_addr,r0                      ' save registry address
#endif
        add    r0,#4
        rdlong SIO_IO_Block,r0                  ' get io block address
        add    r0,#4
        rdlong page_addr,r0                     ' get page buffer address
        add    r0,#4
        rdlong xfer_addr,r0                     ' get xfer buffer address
        add    r0,#4
        rdlong cpu_no,r0                        ' get our CPU number

        ' save the current clock freq and mode
        
        rdlong SavedFreq,#0
        rdbyte SavedMode,#4

        ' zero hub RAM from $0 to max_hub_load

        mov     r1,#$10
        mov     r2,max_hub_load
:zeroRam
        wrlong  Zero,r1
        add     r1,#4
        cmp     r1,r2 wz,wc
  if_b  jmp     #:zeroRam

        call   #XMM_Activate                    ' Set up the XMM hardware
        
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
        mov    dst_addr,SIO_Addr                ' no - is this ...
        cmp    SIO_Addr,hub_size wz,wc          ' ... a hub address?
 if_ae  jmp    #:copy_page_to_xmm               ' no - copy to xmm
        cmp    SIO_Addr,max_hub_load wz,wc      ' yes - less than maximum loadable hub addr?
 if_b   jmp    #:copy_page_to_hub               ' yes - copy to hub
        mov    lrc_addr,page_addr               ' no - ignore it (just calculate LRC)
#ifdef DISPLAY_LOAD_2
        mov    r2,#"I"                          ' for debug only
        call   #HMI_t_char                      ' for debug only
#endif
        jmp    #:send_lrc                       ' calculate lrc and send back

:copy_page_to_hub
        mov    end_addr,dst_addr
        mov    lrc_addr,dst_addr
        call   #Copy_To_Hub                     ' copy page buffer to Hub RAM

#ifdef DISPLAY_LOAD_2
        mov    r2,#"C"                          ' for debug only
        call   #HMI_t_char                      ' for debug only
#endif

        jmp    #:send_lrc                       ' calculate lrc and send back

:copy_page_to_xmm

#ifdef NEED_FLASH

        cmp    dst_addr,hub_size wz             ' did we just receive the prologue?
  if_nz jmp    #:not_prologue                   ' no - process the page just read

        mov    layout,page_addr                 ' yes - get ...
        add    layout,#LAYOUT_OFF               ' ... segment layout ...
        rdlong layout,layout                    ' ... from prologue
        cmp    layout,#3 wz                     ' layout 3 ?
  if_z  jmp    #:load_flash                     ' yes
        cmp    layout,#4 wz                     ' layout 4 ?
        
#ifdef INCLUDE_NON_FLASH 
  if_nz jmp    #:load_xmm                       ' no - process it as xmm
#else
:cannot_load
  if_nz jmp    #:cannot_load                    ' no - can't load it
#endif

:load_flash
#ifdef CHIP_ERASE
        call   #XMM_FlashErase                  ' erase entire flash chip
#endif
        mov    r0,page_addr                     ' calculate ...
        add    r0,#ROBA_OFF                     ' ... 
        rdlong ro_base,r0                       ' ... size ... 
        add    r0,#(ROEN_OFF - ROBA_OFF)        ' ... 
        rdlong ro_ends,r0                       ' ... and base ...
        mov    ro_size,ro_ends                  ' ... 
        sub    ro_size,ro_base                  ' ... of ...   
        add    ro_base,#$10                     ' ... ro ...  
        add    ro_base,hub_size                 ' ... segments

        mov    rw_offs,ro_size                  ' convert ro size ...
        add    rw_offs,page_size                ' ... to ...
        sub    rw_offs,#1                       ' ... offset ...
        shr    rw_offs,#FLIST_LOG2              ' ... for ...
        shl    rw_offs,#FLIST_LOG2              ' ... r/w segments ...
        add    rw_offs,page_size                ' ... allowing for prologue
#ifndef CHIP_ERASE
        mov    XMM_Addr,rw_offs                 ' because packets do not arrive in order ...
        andn   XMM_Addr,block_mask              ' ... remember the block that may contain ...
        mov    ro_rw_blk,XMM_Addr               ' ... both ro and rw segments and erase now ...
        call   #XMM_FlashBlock                  ' ... (we must not erase it again later)
#endif

        mov    dst_addr,#0                      ' write prologue ...
        call   #Copy_To_FLASH                   ' to start of flash
        cmp    layout,#4 wz                     ' layout 4 ?
  if_nz jmp    #:next_xmm_page                  ' no - done 
        mov    dst_addr,hub_size                ' yes - also write as rw segment (????)

:not_prologue

        cmp    dst_addr,ro_base wz,wc           ' is this r/o segment?
 if_ae  jmp    #:write_ro                       ' yes - write it to flash

:write_rw
        sub    dst_addr,hub_size                ' correct destination addr ...           
        cmp    layout,#4 wz                     ' layout 4?
  if_nz jmp    #:ignore_hub_rw                  ' no - any hub data is just padding
        cmp    dst_addr,hub_size wz,wc          ' yes - hub data is rw segment 
  if_a  jmp    #:next_xmm_page                  ' only write ...
        jmp    #:write_hub_rw                   ' ... up to hub ram size
        
:ignore_hub_rw  
        cmp    dst_addr,hub_size wz,wc          ' is this padding?
 if_b   jmp    #:next_xmm_page                  ' yes - ignore it        
        sub    dst_addr,hub_size                ' no - calculate FLASH address
:write_hub_rw                   
        add    dst_addr,rw_offs                 ' store rw segment after ro    
        jmp    #:write_to_flash
:write_ro
        sub    dst_addr,ro_base                 ' adjust ...
        add    dst_addr,page_size               ' ... FLASH addr for ro segment ...
        cmp    dst_addr,rw_offs wz,wc           ' ... but don't overwrite ...
 if_ae  jmp    #:next_xmm_page                  ' ... r/w segments
 
:write_to_flash
        call   #Copy_To_FLASH

        jmp    #:next_xmm_page

#endif

#ifdef INCLUDE_NON_FLASH

:load_xmm

        sub    dst_addr,hub_size
        mov    end_addr,dst_addr
        mov    src_addr,dst_addr
        call   #Copy_To_XMM                     ' copy to page buffer to XMM RAM
        call   #ClearPage
        call   #Copy_From_XMM

#endif
        mov    lrc_addr,page_addr

:next_xmm_page

#ifdef DEBUG_DATA
        mov    r2,#"D"                          ' for debug only
        call   #HMI_t_char                      ' for debug only
        mov    src_addr,page_addr               ' for debug only
        mov    end_addr,page_addr               ' for debug only
        add    end_addr,page_size               ' for debug only
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
#ifdef TRUE_LRC
        mov    r0,lrc_addr                      ' if we didn't copy ...
        add    r0,page_size                     ' ... the whole sector ..                      
        cmp    r0,max_hub_load wz,wc            ' ... to hub RAM ...
 if_ae  mov    lrc_addr,page_addr               ' ... then return LRC of page buffer                
#else
        mov    lrc_addr,page_addr               ' return LRC of page buffer                
#endif
        mov    lrc_size,page_size
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

        ' stop all cogs other than this one (up to LAST_COG), then restart
        ' this cog as a SPIN interpreter to execute the program now 
        ' loaded in Hub RAM.

        cogid   r6                              ' set our cog id
        mov     r1,#Common#LAST_COG+1           ' don't restart beyond LAST_COG
:stop_cog
        sub     r1,#1
        cmp     r1,r6 wz
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
        rdbyte  r2,#4                           ' Then switch to selected clock
        clkset  r2
:justStartUp
        or      r6,interpreter
        coginit r6
                
SavedFreq     long      $0
SavedMode     long      $0
StackMark     long      $FFF9FFFF               ' Two of these mark the base of the stack
Zero          long      $0
XtalTime      long      20 * 20000 / 4 / 1      ' 20ms (@20MHz, 1 inst/loop)

time          long 0
rst_delay     long Common#CLOCKFREQ/10
        
'-------------------------------- Utility routines -----------------------------

#ifdef NEED_FLASH

' Copy_To_FLASH - copy page buffer to FLASH.
'   dst_addr   : FLASH address to copy to.
'
' NOTE: We only copy WHOLE PAGES.
'
' NOTE: We assume everything is LONG aligned.
'
Copy_To_FLASH
#ifndef CHIP_ERASE
        mov    XMM_Addr,dst_addr                ' if this block contains ...
        cmp    XMM_Addr,ro_rw_blk wz            ' ... ro and rw segments ....
  if_z  jmp    #:no_erase                       ' ... do not erase it again!
        test   XMM_Addr,block_mask wz           ' if this is start of block ...
  if_z  call   #XMM_FlashBlock                  ' ... then erase before write
:no_erase
#endif
        mov    r6,#0

:prog_loop
        mov    Hub_Addr, xfer_addr
        mov    r5,page_addr
        add    r5,r6
        wrlong r5,Hub_Addr
        add    Hub_Addr,#4
        wrlong prog_size,Hub_Addr
        add    Hub_Addr,#4
        mov    r5,dst_addr
        add    r5,r6
        wrlong r5,Hub_Addr
        mov    Hub_Addr, xfer_addr
        call   #XMM_FlashWrite
        add    r6,prog_size
        cmp    r6,page_size wz,wc
  if_b  jmp    #:prog_loop

Copy_To_FLASH_ret
        ret

#endif

#ifdef INCLUDE_NON_FLASH

' Copy_To_XMM - copy page buffer to XMM RAM.
'   dst_addr : address to copy to
'
' NOTE: We assume everything is LONG aligned.
'
Copy_To_XMM
        mov    XMM_Addr,dst_addr
        mov    Hub_Addr,page_addr
        mov    XMM_Len,page_size
        call   #XMM_WritePage
Copy_To_XMM_ret
        ret

' Copy_From_XMM - copy page buffer from XMM RAM.
'   src_addr : address to copy from
'
' NOTE: We assume everything is LONG aligned.
'
Copy_From_XMM
        mov    XMM_Addr,src_addr
        mov    Hub_Addr,page_addr
        mov    XMM_Len,page_size
        call   #XMM_ReadPage
Copy_From_XMM_ret
        ret

#endif                

'
' Copy_To_Hub - copy page buffer to Hub RAM.
' On Entry:
'   dst_addr : address to copy to (note - will not copy beyond max_hub_load).
'
' NOTE: We assume everything is LONG aligned.
'
Copy_To_Hub
        mov    r1,page_addr
        mov    r0,page_size
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
#ifdef DISPLAY_LOAD_2
'
' HMI_t_dec - output a dec value (value in r2)
'
HMI_t_dec
        mov    r1,#24                         
        call   #HMI_XferCmd                   
HMI_t_dec_ret
        ret
#endif
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
#ifdef DISPLAY_LOAD
              mov       r6,r0                   ' for debug only 
              mov       r2,SIO_Temp             ' for debug only
              call      #HMI_t_hex              ' for debug only
              call      #HMI_space              ' for debug only
              mov       r0,r6
#endif
              call      #SIO_ReadLong           ' read ...
              mov       SIO_Len,SIO_Temp        ' ... size
#ifdef DISPLAY_LOAD_2
              mov       r6,r0                   ' for debug only 
              mov       r2,SIO_Temp             ' for debug only
              call      #HMI_t_hex              ' for debug only
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
#ifdef DEBUG_UNSTUFFED_DATA
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
low24         long      $00FFFFFF

r0            long      $0
r1            long      $0
r2            long      $0
r3            long      $0
r4            long      $0
r5            long      $0
r6            long      $0

#ifdef DISPLAY_LOAD
reg_addr      long      $0
#endif

page_addr     long      $0
page_end      long      $0
xfer_addr     long      $0
cpu_no        long      $0

prog_size     long      256                     ' only program 256 bytes each write
page_size     long      SECTOR_SIZE             ' also prologue size
hub_size      long      $8000                   ' Hub RAM size is 32k
max_hub_load  long      $8000                   ' address we can load up to

#ifdef NEED_FLASH

layout        long      $0
ro_base       long      $0
ro_ends       long      $0
ro_size       long      $0
rw_offs       long      $0
block_mask    long      (1024*4)-1                ' 4k mask
ro_rw_blk     long      $0

#endif

src_addr      long      $0
dst_addr      long      $0
end_addr      long      $0
sect_count    long      $0

' see http://forums.parallax.com/forums/default.aspx?f=25&m=363100
interpreter   long    ($0004 << 16) | ($F004 << 2) | %0000

'
'=============================== XMM SUPPORT CODE ==============================
'
' The folling defines determine which XMM functions are included - comment out
' the appropriate lines to exclude the corresponding XMM function:
'
'#define NEED_XMM_READLONG
'#define NEED_XMM_WRITELONG
#define NEED_XMM_READPAGE
#define NEED_XMM_WRITEPAGE
#define ACTIVATE_INITS_XMM      ' the HX512 does not allow this in the Kernel
'
#define NEED_XMM_FLASHWRITE
'
#ifdef CHIP_ERASE
#define NEED_XMM_FLASHERASE
#else
#define NEED_XMM_FLASHBLOCK
#endif
'                                    
#ifdef CACHED
' When the cache is in use, all platforms use the same XMM code
#include "Cached_XMM.inc"
#else
' Include XMM API based on platform
#include "XMM.inc"
#endif
'
XMM_Addr      long 0
Hub_Addr      long 0
XMM_Len       long 0
'
'============================ END OF XMM SUPPORT CODE ==========================
'
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
