{{
'-------------------------------------------------------------------------------
'
'   Catalina_SD2_Plugin - an alternate SD Card plugin for Catalina.
'
'   Modified to be a Catalina plugin (removal of Vars and replacement
'   with registry, add ability to use non-consecutive pins) by
'   Ross Higson, based on:

  SPI interface routines for SD & SDHC & MMC cards

  Jonathan "lonesock" Dummer
  version 0.3.0  2009 July 19

  Using multiblock SPI mode exclusively.

  This is the "SAFE" version...uses
  * 1 instruction per bit writes
  * 2 instructions per bit reads

  For the fsrw project:
  fsrw.sf.net

'   WARNING: Due to the need to coordinate the enabling and disabling of the
'   SD Card and the XMM RAM on platforms that share pins, this driver can be
'   very fiddly to modify.  
'
' Version 3.11 - First version.
' Version 3.12 - If Catalyst needs XMM_LOADER, it cannot use Asynchronous IO
' Version 5.2  - Disable multi-block writes on platforms which have to 
'                activate the SD Card on each use (i.e. have the symbol
'                ACTIVATE_EACH_USE_SD defined).
'
' Version 5.6  - fixed bugs in set_time, and get_ticks.

}}

CON
  ' possible card types
  type_MMC      = 1
  type_SD       = 2
  type_SDHC     = 3


  SD_Init        = 1  ' enable SD interface
  SD_Read        = 2  ' read sector
  SD_Write       = 3  ' write sector
  SD_Unsupported = 4  ' unsupported (ByteIO)
  SD_StopIO      = 5  ' disable SD interface
  SD_SetTime     = 8  ' set time
  SD_GetTicks    = 11 ' get time 
  
  ' Error codes
  ERR_CARD_NOT_RESET            = -1
  ERR_3v3_NOT_SUPPORTED         = -2
  ERR_OCR_FAILED                = -3
  ERR_BLOCK_NOT_LONG_ALIGNED    = -4
  '...
  ' These errors are for the assembly engine...they are negated inside, and need to be <= 511
  ERR_ASM_NO_READ_TOKEN         = 100
  ERR_ASM_BLOCK_NOT_WRITTEN     = 101
  ' NOTE: errors -128 to -255 are reserved for reporting R1 response errors
  '...
  ERR_SPI_ENGINE_NOT_RUNNING    = -999
  ERR_CARD_BUSY_TIMEOUT          = -1000

  ' SDHC/SD/MMC command set for SPI
  CMD0    = $40+0        ' GO_IDLE_STATE 
  CMD1    = $40+1        ' SEND_OP_COND (MMC) 
  ACMD41  = $C0+41       ' SEND_OP_COND (SDC) 
  CMD8    = $40+8        ' SEND_IF_COND 
  CMD9    = $40+9        ' SEND_CSD 
  CMD10   = $40+10       ' SEND_CID 
  CMD12   = $40+12       ' STOP_TRANSMISSION
  CMD13   = $40+13       ' SEND_STATUS  
  ACMD13  = $C0+13       ' SD_STATUS (SDC)
  CMD16   = $40+16       ' SET_BLOCKLEN 
  CMD17   = $40+17       ' READ_SINGLE_BLOCK 
  CMD18   = $40+18       ' READ_MULTIPLE_BLOCK 
  CMD23   = $40+23       ' SET_BLOCK_COUNT (MMC) 
  ACMD23  = $C0+23       ' SET_WR_BLK_ERASE_COUNT (SDC)
  CMD24   = $40+24       ' WRITE_BLOCK 
  CMD25   = $40+25       ' WRITE_MULTIPLE_BLOCK 
  CMD55   = $40+55       ' APP_CMD 
  CMD58   = $40+58       ' READ_OCR
  CMD59   = $40+59       ' CRC_ON_OFF 

  ' buffer size for my debug cmd log
  'LOG_SIZE = 256<<1

CON
#include "Constants.inc"

#ifndef FULL_LAYER_2
#define FULL_LAYER_2
#endif

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

'name: SD_StopIO - disable the SD card (required on the TRIBLADEPROP and RAMBLADE)
'code: 5 
'type: short request
'data: byte to write
'rslt: (none)

'name: SD_GetTicks - get the time as 2 longs (seconds and ticks)
'code: 11
'type: long request
'data: parameter block address
'rslt: (none)

'
' RTC services:
'
'name: SD_SetTime
'code: 8
'type: long request
'data: the time (in seconds) to set
'rslt: key code

'
' the option to disable PASM_INIT is retained for testing only:
'
#define PASM_INIT
'
' cannot perform I/O asynchronusly if we share pins with XMM RAM and
' XMM RAM is in use, or if the SD CARD requires special processing:
'
#ifdef LARGE
#ifndef SHARED_XMM
#ifndef TRISTATE_SD
#define ASYNCHRONOUS_IO
#endif
#endif
#elseifdef SMALL
#ifndef SHARED_XMM
#ifndef TRISTATE_SD
#define ASYNCHRONOUS_IO
#endif
#endif
#else
#ifndef XMM_LOADER
#ifndef TRISTATE_SD
#define ASYNCHRONOUS_IO
#endif
#endif
#endif
 
obj
   Common : "Catalina_Common"

pub Start | cog, response, card_type

  ' Start from scratch
  'stop

  ' wait ~4 milliseconds
  waitcnt( 500 + (clkfreq>>8) + cnt )

  ' (start with cog variables, _BEFORE_ loading the cog)
  maskDO    := |< Common#SD_DO_PIN
  maskCLK   := |< Common#SD_CLK_PIN
  maskDI    := |< Common#SD_DI_PIN
#ifdef CHANNEL_SELECT_SD
  maskCSCLR := |< Common#SD_CS_CLR
  maskCSCLK := |< Common#SD_CS_CLK
  maskALL   := maskCSCLR | maskCSCLK | maskCLK | maskDI 
#else 
  maskCS    := |< Common#SD_CS_PIN
  maskAll   := maskCS | maskCLK | maskDI
#endif  
  adrShift := 9 ' block = 512 * index, and 512 = 1<<9

  ' set my counter modes for super fast SPI operation
  ' writing: NCO single-ended mode, output on DI
  writeMode := (%00100 << 26) | (Common#SD_DI_PIN << 0)
  ' reading
  'readMode := (%11000 << 26) | (Common#SD_DO_PIN << 0) | (Common#SD_CLK_PIN << 9)
  ' clock
  clockLineMode := (%00100 << 26) | (Common#SD_CLK_PIN << 0) ' NCO, 50% duty cycle
  ' how many bytes (8 clocks, >>3) fit into 1/2 of a second (>>1), 4 clocks per instruction (>>2)?
  N_in8_500ms := clkfreq >> constant(1+2+3)
  ' how long should we wait before auto-exiting any multiblock mode?
  idle_limit := 125 ' ms, NEVER make this > 1000
  idle_limit := clkfreq / (1000 / idle_limit) ' convert to counts

#ifndef PASM_INIT
  card_type := Start_Internal
#endif  
           
  ' start my driver cog and wait till I hear back that it's done 
  cog := cognew( @SPI_engine_entry, Common#REGISTRY)
  if( cog => 0 )
    
    Common.Register(cog, Common#LMM_FIL) 
    ' give the cog a chance to start up
    waitcnt (clkfreq>>4 + cnt)
 
    response := Common.SendInitializationDataAndWait(cog, SD_Init<<24, 0)

#ifdef PASM_INIT
    card_type := response
#endif  

  ' the return variable is card_type
    return cog + 1

#ifndef PASM_INIT

VAR
  long Start_Cnt  

PUB Start_Internal : card_type | tmp, i 
{{
   This should really be done in PASM
}}  
  dira |= maskAll 
  ' get the card in a ready state: set DI and CS high, send => 74 clocks
  Select_SD
  repeat 4096
    outa[Common#SD_CLK_PIN]~~
    outa[Common#SD_CLK_PIN]~
  ' time-hack
  Start_Cnt := cnt
  ' reset the card
  tmp~
  repeat i from 0 to 9
    if tmp <> 1
      tmp := send_cmd_slow( CMD0, 0, $95 )
      if (tmp & 4)
        ' the card said CMD0 ("go idle") was invalid, so we're possibly stuck in read or write mode
        if i & 1
          ' exit multiblock read mode
          repeat 4
            read_32_slow        ' these extra clocks are required for some MMC cards
          send_slow( $FD, 8 )   ' stop token
          read_32_slow
          repeat while read_slow <> $FF
        else
          ' exit multiblock read mode
          send_cmd_slow( CMD12, 0, $61 )           
  if tmp <> 1
    ' the reset command failed!
    crash( ERR_CARD_NOT_RESET )
  ' Is this a SD type 2 card?
  if send_cmd_slow( CMD8, $1AA, $87 ) == 1
    ' Type2 SD, check to see if it's a SDHC card
    tmp := read_32_slow
  ' check the supported voltage
    if (tmp & $1FF) <> $1AA
      crash( ERR_3v3_NOT_SUPPORTED )
    ' try to initialize the type 2 card with the High Capacity bit
    repeat while send_cmd_slow( ACMD41, |<30, $77 )
    ' the card is initialized, let's read back the High Capacity bit
    if send_cmd_slow( CMD58, 0, $FD ) <> 0
      crash( ERR_OCR_FAILED )
    ' get back the data
    tmp := read_32_slow
    ' check the bit
    if tmp & |<30
      card_type := type_SDHC
      adrShift := 0
    else
      card_type := type_SD
  else
    ' Either a type 1 SD card, or it's MMC, try SD 1st
    if send_cmd_slow( ACMD41, 0, $E5 ) < 2
      ' this is a type 1 SD card (1 means busy, 0 means done initializing)
      card_type := type_SD
      repeat while send_cmd_slow( ACMD41, 0, $E5 )
    else
      ' mark that it's MMC, and try to initialize
      card_type := type_MMC
      repeat while send_cmd_slow( CMD1, 0, $F9 )
    ' some SD or MMC cards may have the wrong block size, set it here
    send_cmd_slow( CMD16, 512, $15 )
  ' card is mounted, make sure the CRC is turned off
  send_cmd_slow( CMD59, 0, $91 )
  '  check the status
  'send_cmd_slow( CMD13, 0, $0D )    
  ' done with the SPI bus for now
  Unselect_SD
  dira &= !maskAll

PUB Select_SD
{
On boards that use channel select (such as the C3) this function sets the active
SPI channel chip select on the SPI mux, this is accomplished by first resetting the
SPI counter that feeds the SPI select decoder, then up counting the requested number
of channels.
On other boards, it just lowers chip select.
}
#ifdef CHANNEL_SELECT_SD

  Unselect_SD
  repeat Common#SPI_SELECT_SD
    outa |= maskCSCLK
    outa &= !maskCSCLK
    
#else

  outa |= maskCS
  outa &= !maskCS
  
#endif

PUB Unselect_SD
{
On boards that use channel select (such as the C3) this function unselects the 
SD by resetting the SPI select decoder. On other boards, it just raises chip select.
}
#ifdef CHANNEL_SELECT_SD
  outa &= !maskCSCLR
  outa |= maskCSCLR
#else
  outa |= maskCS
#endif

PUB readblock( block_index, buffer_address ) | cog 
  cog := Common.LocatePlugin(Common#LMM_FIL)
  if cog < 0
    abort ERR_SPI_ENGINE_NOT_RUNNING
  if (buffer_address & 3)
    abort ERR_BLOCK_NOT_LONG_ALIGNED
  Common.WaitforCompletion(cog)
  if Common.LongPluginRequest_2(Common#LMM_FIL, SD_Read, buffer_address, block_index) < 0
    abort SD_Read
  
PUB writeblock( block_index, buffer_address ) | cog
  cog := Common.LocatePlugin(Common#LMM_FIL)
  if cog < 0
    abort ERR_SPI_ENGINE_NOT_RUNNING
  if (buffer_address & 3)
    abort ERR_BLOCK_NOT_LONG_ALIGNED
  Common.WaitforCompletion(cog)
  if Common.LongPluginRequest_2(Common#LMM_FIL, SD_Write, buffer_address, block_index) < 0
    abort SD_Write

PUB get_seconds : s | secs, msecs, cog
  cog := Common.LocatePlugin(Common#LMM_FIL) < 0
  if cog < 0
    abort ERR_SPI_ENGINE_NOT_RUNNING
  Common.WaitforCompletion(cog)
  if Common.LongPluginRequest_2(Common#LMM_FIL, SD_GetTicks, @secs, 0) < 0
    abort SD_GetTicks
  s := secs

PUB get_milliseconds : ms | secs, msecs, cog
  cog := Common.LocatePlugin(Common#LMM_FIL) < 0
  if cog < 0
    abort ERR_SPI_ENGINE_NOT_RUNNING
  Common.WaitforCompletion(cog)
  if Common.LongPluginRequest_2(Common#LMM_FIL, SD_GetTicks, @secs, 0) < 0
    abort SD_GetTicks
  ' secods are in SPI_block_index, remainder is in SPI_buffer_address
  ms := secs * 1000
  ms += msecs / (clkfreq / 1000)
  
PUB acquire | cog
  cog := Common.LocatePlugin(Common#LMM_FIL)
  if cog => 0
    Common.WaitforCompletion(cog)
    Common.PerformRequest(cog, SD_Init<<24)
  else
    abort ERR_SPI_ENGINE_NOT_RUNNING
    
PUB release | cog
{{
  I do not want to abort if the cog is not
  running, as this is called from stop, which
  is called from start/ [8^)  
}}
  cog := Common.LocatePlugin(Common#LMM_FIL)
  if cog => 0
    Common.WaitforCompletion(cog)
    Common.PerformRequest(cog, SD_StopIO<<24)
    
PUB stop | cog
{{
  kill the assembly driver cog.
}}
  cog := Common.LocatePlugin(Common#LMM_FIL)
  if cog => 0
    Common.WaitforCompletion(cog)
    Common.PerformRequest(cog, SD_StopIO<<24)
    cogstop( cog )
    Common.UnRegister(cog)

PRI crash( abort_code )
{{
  In case of Bad Things(TM) happening,
  exit as gracefully as possible.
}}
  ' and we no longer need to control any pins from here
  dira &= !maskAll
  ' and report our error
  abort abort_code

PRI send_cmd_slow( cmd, val, crc ) : reply | time_stamp
{{
  Send down a command and return the reply.
  Note: slow is an understatement!
  Note: this uses the assembly DAT variables for pin IDs,
  which means that if you run this multiple times (say for
  multiple SD cards), these values will change for each one.
  But this is OK as all of these functions will be called
  during the initialization only, before the PASM engine is
  running.
}}
  ' if this is an application specific command, handle it
  if (cmd & $80)
    ' ACMD<n> is the command sequense of CMD55-CMD<n>
      cmd &= $7F
      reply := send_cmd_slow( CMD55, 0, $65 )
      if (reply > 1)
        return reply  
  ' the CS line needs to go low during this operation
  select_SD
  ' give the card a few cocks to finish whatever it was doing
  read_32_slow
  ' send the command byte
  send_slow( cmd, 8 )
  ' send the value long
  send_slow( val, 32 )   
  ' send the CRC byte
  send_slow( crc, 8 )
  ' is this a CMD12?, if so, stuff byte
  if cmd == CMD12
    read_slow
  ' read back the response (spec declares 1-8 reads max for SD, MMC is 0-8)
  time_stamp := 9
  repeat
    reply := read_slow
  while( reply & $80 ) and ( time_stamp-- )
  ' done, and 'reply' is already pre-loaded
  {
  if dbg_ptr < (dbg_end-1)
    byte[dbg_ptr++] := cmd
    byte[dbg_ptr++] := reply
    if (cmd&63) == 13
      ' get the second byte
      byte[dbg_ptr++] := cmd
      byte[dbg_ptr++] := read_slow
  '}  

PRI send_slow( value, bits_to_send )
  value ><= bits_to_send
  repeat bits_to_send
    outa[Common#SD_CLK_PIN]~
    outa[Common#SD_DI_PIN] := value
    value >>= 1
    outa[Common#SD_CLK_PIN]~~

PRI read_32_slow : r
  repeat 4
    r <<= 8
    r |= read_slow
  
PRI read_slow : r 
{{
  Read back 8 bits from the card
}}
  ' we need the DI line high so a read can occur
  outa[Common#SD_DI_PIN]~~
  ' get 8 bits (remember, r is initialized to 0 by SPIN)
  repeat 8
    outa[Common#SD_CLK_PIN]~
    outa[Common#SD_CLK_PIN]~~
    r += r + ina[Common#SD_DO_PIN]
  ' error check
  if( (cnt - Start_Cnt) > (clkfreq << 2) )
    crash( ERR_CARD_BUSY_TIMEOUT )

#endif
   
DAT
{{
        This is the assembly engine for doing fast block
        reads and writes.  This is *ALL* it does!
}}
ORG 0
SPI_engine_entry
tmp1         cogid   tmp1                       ' get ...
tmp2         shl     tmp1,#2                    ' ... our ...
rqstptr      add     tmp1,par                   ' ... registry block entry
rsltptr      rdlong  rqstptr,tmp1               ' get our request block address
user_request mov     rsltptr,rqstptr            ' set up a pointer to ...
user_result  add     rsltptr,#4                 ' ... our result address
             ' start my seconds' counter here
d1           mov last_time,cnt
             ' Counter A drives data out
d2           mov ctra,writeMode
             ' Counter B will always drive my clock line
user_cmd     mov ctrb,clockLineMode
{
#ifdef CHANNEL_SELECT_SD
        mov outa,maskCSCLR
#else
        mov outa,maskCS 
#endif        
}
#ifndef SHARED_XMM
        mov dira,maskALL                        ' need only do this once
#endif

command_complete
        wrlong user_result,rsltptr        
        mov user_request,#0
        wrlong user_request,rqstptr
        
waiting_for_command
        ' update my seconds counter, but also track the idle 
        ' time so we can to release the card after timeout.
        call #handle_time
        ' read the command, and make sure it's from the user (> 0)
        rdlong user_request,rqstptr wz
if_z    jmp #waiting_for_command 
        mov user_result,#0
        rdlong bufAdr,user_request
        add user_request,#4
        rdlong user_idx,user_request
        shr user_request,#24
        ' handle our card based commands
        cmp user_request,#SD_Read wz
if_z    jmp #read_ahead
        cmp user_request,#SD_Write wz
if_z    jmp #write_behind
        cmp user_request,#SD_Init wz
if_z    jmp #acquire_card
        cmp user_request,#SD_StopIO wz
if_z    jmp #release_card
        cmp user_request,#SD_SetTime wz
if_z    jmp #set_time
        cmp user_request,#SD_GetTicks wz
if_z    jmp #get_ticks
        ' in all other cases, just clear the user's request to indicate completion
command_unknown
if_nz   neg user_result,#1      ' command not recognized - return an error
        jmp #command_complete        

acquire_card
        ' set our output pins to match the pin mask
        call #activate_SD
#ifdef PASM_INIT        
        cmp si_cnt1,#0 wz       ' this long will be zero after initialization
if_nz   call #pasm_start_internal
#endif
        jmp #done_with_card
        
release_card
        call #handle_stop       ' request a release
        
done_with_card        
        call #deactivate_SD 
        jmp #command_complete        

read_ahead
#ifdef ACTIVATE_EACH_USE_SD
        call #activate_SD
#endif
        ' if the correct block is not already loaded, load it
        mov tmp1,user_idx
        add tmp1,#1
        cmp tmp1,lastIndexPlus wz
if_z    cmp lastCommand,#SD_Read wz
if_z    jmp #:get_on_with_it
        mov user_cmd,#SD_Read
        call #handle_command
:get_on_with_it
        ' copy the data up into Hub RAM
        movi transfer_long,#%000010_000 'set to wrlong
#ifdef ASYNCHRONOUS_IO        
        call #do_transfer
        ' request the next block
        mov user_cmd,#SD_Read
        add user_idx,#1
        jmp #do_command
#else
        call #hub_cog_transfer
        jmp #done_command
#endif

write_behind
#ifdef ACTIVATE_EACH_USE_SD
        call #activate_SD
#endif
        ' copy data in from Hub RAM
        movi transfer_long,#%000010_001 'set to rdlong
#ifdef ASYNCHRONOUS_IO        
        call #do_transfer
#else
        call #hub_cog_transfer
#endif        
        ' write out the block
        mov user_cmd,#SD_Write
do_command        
        call #handle_command
        ' done
done_command        
#ifdef ASYNCHRONOUS_IO        
        jmp #waiting_for_command
#else
#ifdef CHANNEL_SELECT_SD
        call    #deactivate_SD
        mov     tmp1,sd_wait                    ' on some platforms, we must not let the 
        add     tmp1,cnt                        ' kernel resume until we have paused for
        waitcnt tmp1,#0                         ' a short period after disabling the SD
#elseifdef SHARED_XMM
        call    #deactivate_SD
        mov     tmp1,sd_wait                    ' on some platforms, we must not let the 
        add     tmp1,cnt                        ' kernel resume until we have paused for
        waitcnt tmp1,#0                         ' a short period after disabling the SD
#elseifdef TRISTATE_SD
        call    #deactivate_SD
#endif
        jmp #command_complete
#endif

sd_wait long Common#CLOCKFREQ/1000

#ifdef ASYNCHRONOUS_IO
do_transfer
        call #hub_cog_transfer
        ' signify that the data is ready, Spin can continue
        mov user_request,#0
        wrlong user_result,rsltptr        
        wrlong user_request,rqstptr
do_transfer_ret
        ret
#endif
        
{{
  Set user_cmd and user_idx before calling this
}}
handle_command
' cannot use multiple block reads if we have to re-activate the SD Card each time.
#ifndef ACTIVATE_EACH_USE_SD
        ' Can we stay in the old mode? (address = old_address+1) && (old mode == new_mode)
        cmp lastIndexPlus,user_idx wz
if_z    cmp user_cmd,lastCommand wz
if_z    jmp #:execute_block_command
#endif
        ' we fell through, must exit the old mode! (except if the old mode was "release")
#ifndef ACTIVATE_EACH_USE_SD
        cmp lastCommand,#SD_Write wz
if_z    call #stop_mb_write
#endif
        cmp lastCommand,#SD_Read wz  
if_z    call #stop_mb_read
        ' and start up the new mode!
        cmp user_cmd,#SD_Write wz
if_z    call #start_mb_write
        cmp user_cmd,#SD_Read wz
if_z    call #start_mb_read
        cmp user_cmd,#SD_StopIO wz
if_z    call #release_DO
:execute_block_command
        ' track the (new) last index and command
        mov lastIndexPlus,user_idx
        add lastIndexPlus,#1
        mov lastCommand,user_cmd
        ' do the block read or write or terminate!
        cmp user_cmd,#SD_Write wz
if_z    call #write_single_block
        cmp user_cmd,#SD_Read wz
if_z    call #read_single_block
        ' done
#ifdef ACTIVATE_EACH_USE_SD
        call #stop_mb_read
#endif
handle_command_ret
        ret

deactivate_SD
#ifdef CHANNEL_SELECT_SD
        andn outa,maskCSCLR
        or outa,maskCSCLR
#else
        or outa,maskCS     ' deselect SD
#endif
        andn outa,maskCLK  ' toggle ...
        or outa,maskCLK    ' ... clock ...
        andn outa,maskCLK  ' ... to release DO
#ifdef SHARED_XMM
#ifdef SHARED_SD_CS
        mov dira,maskCS    ' leave CS high, disable other pins
#else
        mov dira,#0        ' disable all pins
#endif        
#elseifdef TRISTATE_SD
        mov dira,#0
        mov outa,#0
#endif
deactivate_SD_ret
        ret        

activate_SD 
#ifdef SHARED_XMM
        mov dira,maskAll
#elseifdef TRISTATE_SD        
        mov dira,maskAll
#endif        
#ifdef CHANNEL_SELECT_SD
        call #deactivate_SD
#ifdef SHARED_XMM
        mov dira,maskAll
#elseifdef TRISTATE_SD        
        mov dira,maskAll
#endif        
        mov tmp1,#Common#SPI_SELECT_SD
:cs_loop                        
        or outa,maskCSCLK
        andn outa,maskCSCLK
        djnz tmp1,#:cs_loop
#else        
#ifdef DISABLE_XMM_SD
        or outa,ram_disable
        or dira,ram_disable
#endif
        or outa,maskCS  
        andn outa,maskCS
#endif        
activate_SD_ret
        ret  
        
        
{=== these PASM functions get me in and out of multiblock mode ===}
release_DO
        ' we're already out of multiblock mode, so
        ' deselect the card and send out some clocks
        call #deactivate_SD
        call #in8
        call #in8
release_DO_ret
        ret
        
start_mb_read  
        movi block_cmd,#CMD18<<1
        call #send_SPI_command_fast       
start_mb_read_ret
        ret

stop_mb_read
        movi block_cmd,#CMD12<<1
        call #send_SPI_command_fast
        call #busy_fast
stop_mb_read_ret
        ret

start_mb_write  
#ifndef ACTIVATE_EACH_USE_SD
        movi block_cmd,#CMD25<<1
#else
        movi block_cmd,#CMD24<<1
#endif
        call #send_SPI_command_fast
start_mb_write_ret
        ret

#ifndef ACTIVATE_EACH_USE_SD
stop_mb_write
        call #busy_fast
        ' only some cards need these extra clocks
        mov tmp1,#16
:loopity
        call #in8         
        djnz tmp1,#:loopity
        ' done with hack
        movi phsa,#$FD<<1
        call #out8
        call #in8       ' stuff byte
        call #busy_fast
stop_mb_write_ret
        ret
#endif

send_SPI_command_fast
        ' make sure we have control of the output lines
        or dira,maskAll
        ' make sure the CS line transitions low
        call #deactivate_SD
        call #activate_SD
        ' 8 clocks
        call #in8 
        ' send the data
        mov phsa,block_cmd                      ' do which ever block command this is (already in the top 8 bits)
        call #out8                               ' write the byte
        mov phsa,user_idx                       ' read in the desired block index
        shl phsa,adrShift                       ' this will multiply by 512 (bytes/sector) for MMC and SD
        call #out8                               ' move out the 1st MSB                              '
        rol phsa,#1
        call #out8                               ' move out the 1st MSB                              '
        rol phsa,#1
        call #out8                               ' move out the 1st MSB                              '
        rol phsa,#1
        call #out8                               ' move out the 1st MSB                              '
        ' bogus CRC value
        call #in8                                ' in8 looks like out8 with $FF
        ' CMD12 requires a stuff byte
        shr block_cmd,#24
        cmp block_cmd,#CMD12 wz
if_z    call #in8                               ' 8 clocks
        ' get the response
        mov tmp1,#9
:cmd_response
        call #in8
        test readback,#$80 wc,wz
if_c    djnz tmp1,#:cmd_response
if_nz   neg user_cmd,readback
        ' done        
send_SPI_command_fast_ret
        ret    
                        
        
busy_fast
        mov tmp1,N_in8_500ms
:still_busy
        call #in8
        cmp readback,#$FF wz
if_nz   djnz tmp1,#:still_busy
busy_fast_ret
        ret

out8
        andn outa,maskDI 
        'movi phsb,#%11_0000000
        mov phsb,#0
        movi frqb,#%01_0000000        
        rol phsa,#1
        rol phsa,#1
        rol phsa,#1
        rol phsa,#1
        rol phsa,#1
        rol phsa,#1
        rol phsa,#1
        mov frqb,#0
        ' don't shift out the final bit...already sent, but be aware 
        ' of this when sending consecutive bytes (send_cmd, for e.g.) 
out8_ret
        ret

in8
        neg phsa,#1' DI high
        mov readback,#0
        ' set up my clock, and start it
        movi phsb,#%011_000000
        movi frqb,#%001_000000
        ' keep reading in my value
        test maskDO,ina wc
        rcl readback,#1
        test maskDO,ina wc
        rcl readback,#1
        test maskDO,ina wc
        rcl readback,#1
        test maskDO,ina wc
        rcl readback,#1
        test maskDO,ina wc
        rcl readback,#1
        test maskDO,ina wc
        rcl readback,#1
        test maskDO,ina wc
        rcl readback,#1
        test maskDO,ina wc
        mov frqb,#0 ' stop the clock
        rcl readback,#1
        mov phsa,#0 'DI low
in8_ret
        ret
        

'
' set_time : set the current time, and reset the time counters
'
set_time
        mov seconds,bufAdr ' the parameter is not a bufAdr, it is the new time
        mov dtime,#0
        mov idle_time,last_time
        jmp #command_complete

'
'get_ticks
'
get_ticks
        rdlong bufAdr,rqstptr
        wrlong seconds,bufAdr   ' seconds goes into the buffer address register
        add bufAdr,#4
        mov    tmp1,dtime
        mov    tmp2,sd_wait
        call   #d32u
        wrlong tmp1,bufAdr     ' the remainder goes into the buffer address register + 4
        jmp #command_complete

'd32u - Unsigned 32 bit division
' On entry:
'    tmp2 = divisor
'    tmp1 = dividend
' On exit:
'    tmp1 = quotient (i.e. tmp1/tmp2)
'    tmp2 = remainder

d32u
        mov d1,#32
        mov d2, #0
:d32up
        shl tmp1,#1    WC
        rcl d2,#1    WC
        cmp tmp2,d2    WC,WZ
 if_be  sub d2,tmp2
 if_be  add tmp1,#1
:d32down
        sub d1, #1   WZ
 if_ne  jmp #:d32up
        mov tmp2,d2
d32u_ret
        ret

' this is called more frequently than 1 Hz, and
' is only called when the user command is 0.
handle_time
        mov tmp1,cnt            ' get the current timestamp
        add idle_time,tmp1      ' add the current time to my idle time counter
        sub idle_time,last_time ' subtract the last time from my idle counter (hence delta)    
        add dtime,tmp1          ' add to my accumulator, 
        sub dtime,last_time     ' and subtract the old (adding delta)
        mov last_time,tmp1      ' update my "last timestamp"        
        rdlong tmp1,#0          ' what is the clock frequency?
        cmpsub dtime,tmp1 wc    ' if I have more than a second in my accumulator
        addx seconds,#0         ' then add it to "seconds"
'}

#ifdef ASYNCHRONOUS_IO        
        ' this part is to auto-release the card after a timeout
        cmp idle_time,idle_limit wz,wc
if_b    jmp #handle_time_ret    ' don't clear if we haven't hit the limit
#else
        jmp #handle_time_ret
#endif
handle_stop
        mov user_cmd,#SD_StopIO ' we can't overdo it, the command handler makes sure
        neg lastIndexPlus,#1    ' reset the last block index 
        neg user_idx,#1         ' and make this match it 
        call #handle_command    ' release the card, but don't mess with the user's request register
handle_time_ret
handle_stop_ret
        ret

hub_cog_transfer
' setup for all 4 passes        
        mov ctrb,clockXferMode
        mov frqb,#1 
        mov buf_ptr,bufAdr
        mov ops_left,#4
        movd transfer_long,#speed_buf
four_transfer_passes
        ' sync to the Hub RAM access
        rdlong tmp1,tmp1
        ' how many long to move on this pass? (512 bytes / 4)longs / 4 passes
        mov tmp1,#(512 / 4 / 4)
        ' get my starting address right (phsb is incremented 1 per clock, so 16 each Hub access)
        mov phsb,buf_ptr
        ' write the longs, stride 4...low 2 bits of phsb are ignored
transfer_long
        rdlong 0-0,phsb
        add transfer_long,incDest4
        djnz tmp1,#transfer_long
        ' go back to where I started, but advanced 1 long
        sub transfer_long,decDestNminus1
        ' offset my Hub pointer by one long per pass
        add buf_ptr,#4
        ' do all 4 passes
        djnz ops_left,#four_transfer_passes
        ' restore the counter mode
        mov frqb,#0
        mov phsb,#0
        mov ctrb,clockLineMode
hub_cog_transfer_ret
        ret
        

read_single_block
        ' where am I sending the data?
        movd :store_read_long,#speed_buf
        mov ops_left,#128
        ' wait until the card is ready
        mov tmp1,N_in8_500ms
:get_resp
        call #in8
        cmp readback,#$FE wz        
if_nz   djnz tmp1,#:get_resp
if_nz   neg user_cmd,#ERR_ASM_NO_READ_TOKEN  
if_nz   jmp #read_single_block_ret
        ' set DI high
        neg phsa,#1
        ' read the data
        mov ops_left,#128
:read_loop        
        mov tmp1,#4
        movi phsb,#%011_000000
:in_byte        
        ' Start my clock
        movi frqb,#%001_000000
        ' keep reading in my value, BACKWARDS!  (Brilliant idea by Tom Rokicki!)
        test maskDO,ina wc
        rcl readback,#8
        test maskDO,ina wc
        muxc readback,#2
        test maskDO,ina wc
        muxc readback,#4
        test maskDO,ina wc
        muxc readback,#8
        test maskDO,ina wc
        muxc readback,#16
        test maskDO,ina wc
        muxc readback,#32
        test maskDO,ina wc
        muxc readback,#64
        test maskDO,ina wc
        mov frqb,#0 ' stop the clock
        muxc readback,#128
        ' go back for more
        djnz tmp1,#:in_byte
        ' make it...NOT backwards [8^)
        rev readback,#0
:store_read_long
        mov 0-0,readback       ' due to some counter weirdness, we need this mov
        add :store_read_long,const512
        djnz ops_left,#:read_loop

        ' set DI low
        mov phsa,#0
        
        ' now read 2 trailing bytes (CRC)
        call #in8      ' out8 is 2x faster than in8
        call #in8      ' and I'm not using the CRC anyway
        ' give an extra 8 clocks in case we pause for a long time
        call #in8       ' in8 looks like out8($FF)
        
        ' all done successfully
        mov idle_time,#0
        mov user_cmd,#0               
read_single_block_ret
        ret          
        
write_single_block               
        ' where am I getting the data? (all 512 bytes / 128 longs of it?)
        movs :write_loop,#speed_buf
        ' read in 512 bytes (128 longs) from Hub RAM and write it to the card
        mov ops_left,#128        
        ' just hold your horses  
        call #busy_fast 
        ' $FC for multiblock, $FE for single block
#ifndef ACTIVATE_EACH_USE_SD
        movi phsa,#$FC<<1
#else
        movi phsa,#$FE<<1
#endif
        call #out8
        mov phsb,#0             ' make sure my clock accumulator is right
        'movi phsb,#%11_0000000
:write_loop
        ' read 4 bytes
        mov phsa,speed_buf
        add :write_loop,#1
        ' a long in LE order is DCBA
        rol phsa,#24            ' move A7 into position, so I can do the swizzled version
        movi frqb,#%010000000   ' start the clock (remember A7 is already in place)
        rol phsa,#1             ' A7 is going out, at the end of this instr, A6 is in place
        rol phsa,#1             ' A5
        rol phsa,#1             ' A4
        rol phsa,#1             ' A3
        rol phsa,#1             ' A2
        rol phsa,#1             ' A1
        rol phsa,#1             ' A0
        rol phsa,#17            ' B7
        rol phsa,#1             ' B6
        rol phsa,#1             ' B5
        rol phsa,#1             ' B4
        rol phsa,#1             ' B3
        rol phsa,#1             ' B2
        rol phsa,#1             ' B1
        rol phsa,#1             ' B0
        rol phsa,#17            ' C7
        rol phsa,#1             ' C6
        rol phsa,#1             ' C5
        rol phsa,#1             ' C4
        rol phsa,#1             ' C3
        rol phsa,#1             ' C2
        rol phsa,#1             ' C1
        rol phsa,#1             ' C0
        rol phsa,#17            ' D7
        rol phsa,#1             ' D6
        rol phsa,#1             ' D5
        rol phsa,#1             ' D4
        rol phsa,#1             ' D3
        rol phsa,#1             ' D2
        rol phsa,#1             ' D1
        rol phsa,#1             ' D0 will be in place _after_ this instruction
        mov frqb,#0             ' shuts the clock off, _after_ this instruction
        djnz ops_left,#:write_loop
        ' write out my two (bogus, using $FF) CRC bytes
        call #in8
        call #in8
        ' now read response (I need this response, so can't spoof using out8)
        call #in8
        and readback,#$1F
        cmp readback,#5 wz
if_z    mov user_cmd,#0 ' great
if_nz   neg user_cmd,#ERR_ASM_BLOCK_NOT_WRITTEN ' oops
        ' send out another 8 clocks
        call #in8 
        ' all done
        mov idle_time,#0
write_single_block_ret
        ret

'#include "debug.inc"
        
{=== Assembly Interface Variables ===}
maskDO        long 0    ' mask for reading the DO line from the card
maskDI        long 0    ' mask for setting the pin high while reading
maskCLK       long 0    ' mask for toggling the CLK pin  
#ifdef CHANNEL_SELECT_SD
maskCSCLR     long 0
maskCSCLK     long 0
#else 
maskCS        long 0    ' mask = (1<<pin), and is controlled directly
#endif  
maskAll       long 0
adrShift      long 9    ' will be 0 for SDHC, 9 for MMC & SD
bufAdr        long 0    ' where in Hub RAM is the buffer to copy to/from?
writeMode     long 0    ' the counter setup in NCO single ended, clocking data out on pinDI
N_in8_500ms   long Common#CLOCKFREQ>>(1+2+3) ' used for timeout checking in PASM
'readMode      long 0
clockLineMode long 0
clockXferMode long %11111 << 26
const512      long 512
'const1024     long 1024
bit30         long |<30
incDest4      long 4 << 9
decDestNminus1 long (512 / 4 - 1) << 9         

'rqstptr       long 0
'rsltptr       long 0

#ifdef DISABLE_XMM_SD
ram_disable long    Common#XMM_DISABLE
#endif
 
{=== Initialized PASM Variables ===}
seconds       long 0
dtime         long 0
idle_time     long 0
idle_limit    long 0

{=== Multiblock State Machine ===}
lastIndexPlus long -1   ' state handler will check against lastIndexPlus, which will not have been -1
lastCommand   long 0    ' this will never be the last command.

si_cnt1       long 4096

{=== Debug Logging Pointers ===}
{
dbg_ptr       long 0
dbg_end       long 0
'}

{=== Assembly Scratch Variables ===}
ops_left      long 0     ' used as a counter for bytes, words, longs, whatever (start w/ # byte clocks out)
readback      long 0     ' all reading from the card goes through here
'tmp1          long 0     ' this may get used in all subroutines...don't use except in lowest 
'user_request  long 0     ' the main command variable, read in from Hub
'user_result   long 0     ' the response to return to the command
'user_cmd      long 0     ' used internally to handle actual commands to be executed
user_idx      long 0     ' the pointer to the Hub RAM where the data block is/goes
block_cmd     long 0     ' one of the SD/MMC command codes, no app-specific allowed
buf_ptr       long 0     ' moving pointer to the Hub RAM buffer
last_time     long 0     ' tracking the timestamp

{{
  496 longs is my total available space in the cog,
  and I want 128 longs for eventual use as one 512-
  byte buffer.   This gives me a total of 368 longs
  to use for umount, and a readblock and writeblock
  for both Hub RAM and Cog buffers.
}}
FIT 354
filler long 0[354-filler] 
FIT 368
ORG 368
speed_buf   ' 512 bytes to be used for read-ahead / write-behind

{{
   The following code is used only during initialization, and then the space used is
   used as the 512 byte speed_buf.     
}}
'ORG 368
ORG 354

pasm_start_internal
        'or outa,maskDI
        'call #activate_SD
si_init_loop1
        or outa,maskCLK
        andn outa,maskCLK
        djnz si_cnt1,#si_init_loop1
        mov si_tmp,#0
si_init_loop2
        cmp si_tmp,#1 wz
if_z    jmp #si_end_loop2
        mov scs_cmd,#CMD0
        mov scs_val,#0
        mov scs_crc,#$95
        call #pasm_send_cmd_slow
        mov si_tmp,readback
        test si_tmp,#$4 wz
if_z    jmp #si_end_loop2
        test si_cnt2,#$1 wz
if_z    jmp #si_exit_mr_mode
        call #pasm_read_128_slow
        mov readback,#$FD
        call #pasm_send_8_slow
        call #pasm_read_32_slow
si_init_loop3
        call #pasm_read_8_slow  
        and readback,#$FF
        cmp readback,#$FF wz
if_nz   djnz si_cnt3,#si_init_loop3
        jmp #si_end_loop2
si_exit_mr_mode
        mov scs_cmd,#CMD12
        mov scs_val,#0
        mov scs_crc,#$61
        call #pasm_send_cmd_slow
si_end_loop2        
        djnz si_cnt2,#si_init_loop2
si_check_reset
        cmp si_tmp,#1 wz
if_nz   jmp #si_init_reset_failed
        mov scs_cmd,#CMD8
        mov scs_val,#$1AA
        mov scs_crc,#$87
        call #pasm_send_cmd_slow
        cmp readback,#1 wz
if_nz   jmp #si_not_type2
        call #pasm_read_32_slow
        cmp readback,#$1AA wz
if_nz   jmp #si_type_not_supported
si_init_loop4a
        call #pasm_send_acmd41_bit30
        cmp readback,#0 wz
if_nz   djnz si_cnt4,#si_init_loop4a
        mov scs_cmd,#CMD58
        mov scs_val,#0
        mov scs_crc,#$FD
        call #pasm_send_cmd_slow
        cmp readback,#0 wz
if_nz   jmp #si_ocr_failure
        call #pasm_read_32_slow
        test readback,bit30 wz
if_nz   mov user_result,#type_SDHC
if_nz   mov adrShift,#0
if_z    mov user_result,#type_SD
        jmp #si_turn_off_crc                     
si_not_type2
 ' Either a type 1 SD card, or it's MMC, try SD 1st
        call #pasm_send_acmd41_zero
        cmp readback,#2 wz,wc
if_ae   jmp #si_mmc
        mov user_result,#type_SD                
si_init_loop4b
        call #pasm_send_acmd41_zero
        cmp readback,#0 wz
if_nz   djnz si_cnt4,#si_init_loop4b
        jmp #si_set__block_size
si_mmc
        mov user_result,#type_MMC                
si_init_loop4c
        mov scs_cmd,#CMD1
        mov scs_val,#0
        mov scs_crc,#$F9
        call #pasm_send_cmd_slow
        cmp readback,#0 wz
if_nz   djnz si_cnt4,#si_init_loop4c
si_set__block_size
        mov scs_cmd,#CMD16
        mov scs_val,const512
        mov scs_crc,#$15
        call #pasm_send_cmd_slow
si_turn_off_crc
        ' card is mounted, make sure the CRC is turned off
        mov scs_cmd,#CMD59
        mov scs_val,#0
        mov scs_crc,#$91
        call #pasm_send_cmd_slow
        'call #deactivate_SD
         'mov outa,#0
#ifdef CHANNEL_SELECT_SD
        or outa,maskCSCLR
#else
        or outa,maskCS 
#endif        
        andn outa,maskCLK             ' C3 needs this
        jmp #pasm_start_internal_ret
si_ocr_failure
'        neg user_result,#3            ' save space - just return -1 on any error
'        jmp #pasm_start_internal_ret  
si_type_not_supported
'        neg user_result,#2            ' save space - just return -1 on any error
'        jmp #pasm_start_internal_ret  
si_init_reset_failed
        neg user_result,#1             ' return -1 if reset failed
pasm_start_internal_ret                
        ret

si_cnt2 long 1024  ' retries (need lots in PASM!)
si_cnt3 long 1024  ' retries
si_cnt4 long 20000 ' retries (need lots in PASM!)
si_tmp  long 0  

pasm_send_acmd41_zero
        mov user_cmd,#0
        mov user_idx,#$E5
        jmp #pasm_send_acmd41        
pasm_send_acmd41_bit30
        mov user_cmd,bit30
        mov user_idx,#$77
pasm_send_acmd41        
        mov scs_cmd,#CMD55
        mov scs_val,#0
        mov scs_crc,#$65
        call #pasm_send_cmd_slow
        mov scs_cmd,#ACMD41&$7F
        mov scs_val,user_cmd
        mov scs_crc,user_idx
        call #pasm_send_cmd_slow
pasm_send_acmd41_zero_ret
pasm_send_acmd41_bit30_ret
        ret
'scs_crc2 long 0 ' save space by usimg user_idx                
'scs_val2 long 0 ' save space by using user_cmd                

pasm_send_cmd_slow
        call #activate_SD
        call #pasm_read_32_slow ' give the card a few clocks to finish
        mov readback,scs_cmd
        call #pasm_send_8_slow
        mov readback,scs_val
        mov tmp1,#32
        call #pasm_send_slow
        mov readback,scs_crc
        call #pasm_send_8_slow
        cmp scs_cmd,#CMD12 wz
if_z    call #pasm_read_8_slow
        mov scs_val,#10
scs2_loop
        call #pasm_read_8_slow
        test readback,#$80 wz
if_nz   djnz scs_val,#scs2_loop                    
pasm_send_cmd_slow_ret
        ret

scs_cmd  long 0
scs_val  long 0
scs_crc  long 0

pasm_send_8_slow
        mov tmp1,#8        
pasm_send_slow
        ror readback,tmp1
ss_loop         
        rol readback,#1
        test readback,#$1 wc
        andn outa,maskCLK
        muxc outa,maskDI
        or outa,maskCLK
        djnz tmp1,#ss_loop
pasm_send_slow_ret
pasm_send_8_slow_ret
        ret

pasm_read_128_slow
        mov tmp1,#128
        jmp #pasm_read_slow_go
pasm_read_32_slow
        mov tmp1,#32
        jmp #pasm_read_slow_go
pasm_read_8_slow
        mov tmp1,#8
pasm_read_slow_go        
        mov readback,#0        
        or outa,maskDI
rs_loop
        andn outa,maskCLK
        or outa,maskCLK
        test maskDO,ina wc
        rcl readback,#1
        djnz tmp1,#rs_loop
pasm_read_128_slow_ret
pasm_read_32_slow_ret
pasm_read_8_slow_ret
        ret

FIT 496

''      MIT LICENSE
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
