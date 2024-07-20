{
  Based on code from VMCOG - virtual memory server for the Propeller
  Copyright (c) February 3, 2010 by William Henning

  and on code from SdramCache
  Copyright (c) 2010 by John Steven Denson (jazzed) and David Betz

  Modified for Catalina by Ross Higson (removal of all VARs and SPIN methods
  other than Start). Also, make cache size fully configurable, using the
  following #defined symbols:

    CACHED_1K : 1K cache
    CACHED_2K : 2K cache
    CACHED_4K : 4k cache
    CACHED_8K : 8k cache 
    CACHED    : 8k cache
 
  NOTE: For Catalina, the Cache always uses cog CACHE_COG 

  Version 3.0   - initial version

  Version 3.0.1 - add ERASE_CHECK and WRITE_CHECK. Note that ERASE_CHECK is 
                  only applied to the whole chip erase, not the block erase.
                  Only the WRITE_CHECK is enabled by default, since the erase
                  check can take around 15 seconds. To enable it, define
                  the symbol ERASE_CHECK when compiling.

  Version 3.3   - Fixed a bug in the cache flushing after FLASH write. 
                  Rewrote the XMM API for FLASH devices.
                  Tidy up platform dependencies.

  Version 3.11  - Wrap the entire package up in a #ifdef CACHED ... #endif

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
}

CON
#include "Constants.inc"

#ifdef CACHED
'
' define this either here or on the command line to enable 
' verifying each FLASH write, and also retrying on failure
'
#define WRITE_CHECK
'
' define this either here or on the command line to enable 
' verifying FLASH chip erase, and also retrying on failure
'
'#define ERASE_CHECK
'
#ifndef NO_FLASH
#ifdef CACHED
#ifdef FLASH
#ifndef NEED_FLASH
#define NEED_FLASH              ' include FLASH support 
#endif
#endif
#else
#ifdef FLASH
#error : FLASH REQUIRES CACHE OPTION (CACHED_1K .. CACHED_8K or CACHED)
#endif
#endif
#endif

CON

  CMD_MASK              = Common#CACHE_CMD_MASK
  ' cache access commands
  WRITE_CMD             = Common#CACHE_WRITE_CMD
  READ_CMD              = Common#CACHE_READ_CMD

  UNIQUE_RESPONSE       = $DEADC0DE

#ifdef NEED_FLASH

  EXTEND_MASK           = Common#CACHE_EXTEND_MASK
  ' extended commands
  ERASE_CHIP_CMD        = Common#CACHE_ERASE_CHIP_CMD
  ERASE_BLOCK_CMD       = Common#CACHE_ERASE_BLOCK_CMD
  WRITE_DATA_CMD        = Common#CACHE_WRITE_DATA_CMD

  ' flash chip commands

  ERASE_RETRY           = 3
  WRITE_RETRY           = 10

#endif

  ' number of entries in index
  CACHE_INDEX           = 1<<Common#CACHE_INDEX_LOG2
  ' width of offset within index 
  DEFAULT_INDEX_WIDTH   = Common#CACHE_INDEX_LOG2
  ' width of offset within line
  DEFAULT_OFFSET_WIDTH  = Common#CACHE_LINE_LOG2
  ' length of each line in cache
  LINELEN               = 1<<DEFAULT_OFFSET_WIDTH

  ' cache line tag flags
  EMPTY_BIT             = 30
  DIRTY_BIT             = 31

OBJ
  Common : "Catalina_Common"


PUB Start : okay | init_mbox, init_cache, init_iwidth, init_owidth

    if Common#CACHE_COG > 0 

      if not Running
        init_mbox := Common#XMM_CACHE_CMD
        init_cache := Common#XMM_CACHE
        init_iwidth := DEFAULT_INDEX_WIDTH
        init_owidth := DEFAULT_OFFSET_WIDTH
        long[Common#XMM_CACHE_CMD] := $ffffffff
        coginit(Common#CACHE_COG, @init_vm, @init_mbox)
        repeat while long[Common#XMM_CACHE_CMD]

      Common.Register(Common#CACHE_COG, Common#LMM_XCH)
      okay := TRUE

    else

      okay := FALSE


PUB Running : okay

    long[Common#XMM_CACHE_CMD] := $fffffffe
    repeat 1000
       if long[Common#XMM_CACHE_CMD] == 0
          quit
    okay := (long[Common#XMM_CACHE_RSP] == UNIQUE_RESPONSE)
   

{
pub readWord(madr)
    long[vm_mbox][0] := (madr&!3) | READ_CMD
    repeat while long[vm_mbox][0]
    madr &= LINELEN-1
    return word[long[vm_mbox][1]+madr]

pub readLong(madr)
    long[vm_mbox][0] := (madr&!3) | READ_CMD
    repeat while long[vm_mbox][0]
    madr &= LINELEN-1
    return long[long[vm_mbox][1]+madr]

pub writeLong(madr, val)
    long[vm_mbox][0] := (madr&!3) | WRITE_CMD
    repeat while long[vm_mbox][0]
    madr &= LINELEN-1
    long[long[vm_mbox][1]+madr] := val

pub readByte(madr)
    long[vm_mbox][0] := (madr&!3) | READ_CMD
    repeat while long[vm_mbox][0]
    madr &= LINELEN-1
    return byte[long[vm_mbox][1]+madr]

pub writeByte(madr, val)
    long[vm_mbox][0] := (madr&!3) | WRITE_CMD
    repeat while long[vm_mbox][0]
    madr &= LINELEN-1
    byte[long[vm_mbox][1]+madr] := val

pub eraseFlashBlock(madr)
    long[vm_mbox][0] := ERASE_BLOCK_CMD | (madr << 8)
    repeat while long[vm_mbox][0] <> 0
    return long[vm_mbox][1]

pub writeFlash(madr, buf, count_) | pbuf, pcnt, paddr
    pbuf := buf
    pcnt := count_
    paddr := madr
    long[vm_mbox][0] := WRITE_DATA_CMD | (@pbuf << 8)
    repeat while long[vm_mbox][0] <> 0
    return long[vm_mbox][1]
}
DAT
        org   $0

' initialization structure offsets
' $0: pointer to a two word mailbox
' $4: pointer to where to store the cache lines in hub ram
' $8: number of bits in the cache line index if non-zero (default is DEFAULT_INDEX_WIDTH)
' $a: number of bits in the cache line offset if non-zero (default is DEFAULT_OFFSET_WIDTH)
' note that $4 must be at least 2^($8+$a)*2 bytes in size on the C3
'                   or at least 2^($8+$a) bytes in size on the DRACBLADE
' the cache line mask is returned in $0

init_vm mov     t1, par             ' get the address of the initialization structure
        rdlong  pvmcmd, t1          ' pvmcmd is a pointer to the virtual address and read/write bit
        mov     pvmaddr, pvmcmd     ' pvmaddr is a pointer into the cache line on return
        add     pvmaddr, #4
        add     t1, #4
        rdlong  cacheptr, t1        ' cacheptr is the base address in hub ram of the cache
        add     t1, #4
        rdlong  t2, t1 wz
  if_nz mov     index_width, t2     ' override the index_width default value
        add     t1, #4
        rdlong  t2, t1 wz
  if_nz mov     offset_width, t2    ' override the offset_width default value

        mov     index_count, #1
        shl     index_count, index_width
        mov     index_mask, index_count
        sub     index_mask, #1

        mov     line_size, #1
        shl     line_size, offset_width
        mov     t1, line_size
        sub     t1, #1
        wrlong  t1, par
        
#ifdef NEED_FLASH

        call    #XMM_FlashActivate
        call    #XMM_FlashWriteEnable
        call    #XMM_FlashUnprotect     ' unprotect entire Flash chip
        call    #XMM_FlashTristate

#endif

        jmp     #vmflush

fillme  long    0[CACHE_INDEX-fillme]   ' first cog locations are used for a direct mapped page table

        fit     CACHE_INDEX

        ' initialize the cache lines
vmflush movd    :flush, #0
        mov     t1, index_count

:flush  mov     0-0, empty_mask
        add     :flush, dstinc
        djnz    t1, #:flush

        ' start the command loop
waitcmd wrlong  zero, pvmcmd
:wait   rdlong  vmpage, pvmcmd wz 
  if_z  jmp     #:wait
        cmps    vmpage,#0 wc            ' if it is just a ping (cmd < 0) ...
  if_c  jmp     #ping                   ' ... then respond

#ifdef NEED_FLASH  

        test    vmpage, #EXTEND_MASK wz ' test for an extended command
  if_z  jmp     #extend

#endif

        shr     vmpage, offset_width wc ' carry is now one for read and zero for write
        mov     set_dirty_bit, #0       ' make mask to set dirty bit on writes
        muxnc   set_dirty_bit, dirty_mask
        
        mov     line, vmpage            ' get the cache line index

        and     line, index_mask

        mov     hubaddr, line
        shl     hubaddr, offset_width
        add     hubaddr, cacheptr       ' get the address of the cache line
        wrlong  hubaddr, pvmaddr        ' return the address of the cache line
        movs    :ld, line
        movd    :st, line
:ld     mov     vmcurrent, 0-0          ' get the cache line tag
        and     vmcurrent, tag_mask
        cmp     vmcurrent, vmpage wz    ' z set means there was a cache hit
  if_nz call    #miss                   ' handle a cache miss
:st     or      0-0, set_dirty_bit      ' set the dirty bit on writes
        jmp     #waitcmd                ' wait for a new command

ping
        wrlong  ping_response, pvmaddr
        jmp     #waitcmd
        

' line is the cache line index
' vmcurrent is current page
' vmpage is new page
' hubaddr is the address of the cache line
miss
        call    #XMM_Activate
        movd    :test, line
        movd    :st, line
:test   test    0-0, dirty_mask wz
  if_z  jmp     #:rd                    ' current page is clean, just read new page
        mov     Hub_Addr, hubaddr
        mov     XMM_Len, line_size
        mov     XMM_Addr, vmcurrent
        shl     XMM_Addr, offset_width
        call    #BWRITE                 ' write current page
:rd     mov     Hub_Addr, hubaddr
        mov     XMM_Len, line_size
        mov     XMM_Addr, vmpage
        shl     XMM_Addr, offset_width
        call    #BREAD                  ' read new page
:st     mov     0-0, vmpage
        call    #XMM_Tristate
miss_ret ret

#ifdef NEED_FLASH

extend  mov     XMM_Addr, vmpage
        shr     XMM_Addr, #8
        shr     vmpage, #2
        and     vmpage, #3
        add     vmpage, #dispatch
        jmp     vmpage

dispatch
        jmp     #erase_chip_handler
        jmp     #erase_4k_block_handler
        jmp     #write_data_handler
        jmp     #waitcmd

erase_chip_handler
        call    #XMM_FlashActivate
        call    #XMM_FlashWriteEnable
        call    #XMM_FlashEraseChip
        call    #XMM_FlashWaitUntilDone
        call    #XMM_FlashTristate
#ifdef ERASE_CHECK
        mov     XMM_Addr,#0
        mov     XMM_Len,Erase_Len
        mov     Erase_Cnt,#ERASE_RETRY
        call    #XMM_FlashActivate      ' select flash chip
        call    #XMM_FlashCheckEmpty
  if_nz mov     outx,#1
  if_z  mov     outx,#0
#endif
        wrlong  outx, pvmaddr
        jmp     #flash_cache_init

erase_4k_block_handler
        call    #XMM_FlashActivate
        call    #XMM_FlashWriteEnable
        call    #XMM_FlashEraseBlock
        call    #XMM_FlashWaitUntilDone
        call    #XMM_FlashTristate
        wrlong  outx, pvmaddr
        jmp     #flash_cache_init

write_data_handler
        rdlong  Hub_Addr,XMM_Addr ' get the buffer pointer
        add     XMM_Addr,#4
        rdlong  XMM_Len,XMM_Addr wz ' get the byte count
  if_z  jmp     #:cont
        add     XMM_Addr,#4
        rdlong  XMM_Addr,XMM_Addr ' get the flash address (zero based) 

#ifdef WRITE_CHECK
        mov     Chk_Hub,Hub_Addr
        mov     Chk_XMM,XMM_Addr
        mov     Chk_Len,XMM_Len
        mov     Chk_Cnt,#WRITE_RETRY
#endif
        call    #XMM_FlashActivate
:write
        call    #XMM_FlashWriteEnable
        call    #XMM_FlashWritePage
        call    #XMM_FlashWaitUntilDone
        
#ifdef WRITE_CHECK
        mov     Hub_Addr,Chk_Hub
        mov     XMM_Addr,Chk_XMM
        mov     XMM_Len,Chk_Len
:chk_loop
        call    #XMM_FlashComparePage
  if_nz jmp     #:fail
        mov     outx,#0
        jmp     #:cont
:fail         
        djnz    Chk_Cnt,#:retry
        mov     outx,#1
        jmp     #:cont
:retry
        mov     Hub_Addr,Chk_Hub
        mov     XMM_Addr,Chk_XMM
        mov     XMM_Len,Chk_Len
        jmp     #:write
#endif
:cont
        call    #XMM_FlashTristate
        wrlong  outx, pvmaddr

flash_cache_init
        ' initialize any FLASH cache lines
        movs    :ld, #0                          
        movd    :st, #0
        mov     t1, index_count
:ld     mov     t2, 0-0
        and     t2, address_mask
        shl     t2, offset_width
        cmp     t2, fbase wc
   if_b jmp     #:next         
:st     mov     0-0, empty_mask
:next   add     :ld, #1
        add     :st, dstinc
        djnz    t1, #:ld

        jmp     #waitcmd                ' wait for a new command

#endif

' pointers to mailbox entries
pvmcmd          long    0       ' on call this is the virtual address and read/write bit
pvmaddr         long    0       ' on return this is the address of the cache line containing the virtual address

cacheptr        long    0       ' address in hub ram where cache lines are stored
vmpage          long    0       ' page containing the virtual address
vmcurrent       long    0       ' current page in selected cache line (same as vmpage on a cache hit)
line            long    0       ' current cache line index
set_dirty_bit   long    0       ' DIRTY_BIT set on writes, clear on reads

zero            long    0       ' zero constant
dstinc          long    1<<9    ' increment for the destination field of an instruction
t1              long    0       ' temporary variable
t2              long    0       ' temporary variable

tag_mask        long    !(1<<DIRTY_BIT) ' includes EMPTY_BIT
address_mask    long    !(1<<DIRTY_BIT | 1<<EMPTY_BIT)
index_width     long    DEFAULT_INDEX_WIDTH
index_mask      long    0
index_count     long    0
offset_width    long    DEFAULT_OFFSET_WIDTH
line_size       long    0                       ' line size in longs
empty_mask      long    (1<<EMPTY_BIT)
dirty_mask      long    (1<<DIRTY_BIT) 
ping_response   long    UNIQUE_RESPONSE

' platform specific stuff ...

'-------------------------------------------------------------------------------
'
' BREAD
'
BREAD
#ifdef NEED_FLASH
' With FLASH, we read from Flash addresses differently
        cmp     XMM_Addr,fbase wc,wz
  if_b  jmp     #:BREAD_SPI
        sub     XMM_Addr,fbase
        call    #XMM_FlashReadPage
        jmp     #:BREAD_DONE
:BREAD_SPI
#endif
        call    #XMM_ReadPage
:BREAD_DONE
BREAD_ret
        ret
'
' BWRITE
'
BWRITE
#ifdef NEED_FLASH
' With FLASH, we ignore writes to Flash addresses
        cmp     XMM_Addr,fbase wc,wz
  if_b  call    #XMM_WritePage
#else
        call    #XMM_WritePage
#endif
BWRITE_ret
        ret
'
#ifdef NEED_FLASH

fbase   long    Common#XMM_RO_BASE_ADDRESS - Common#HUB_SIZE ' XMM addr of FLASH

#endif
'
hubaddr long $0
'
#ifdef WRITE_CHECK
Chk_Hub long $0
Chk_XMM long $0
Chk_Len long $0
Chk_Cnt long $0
#endif
'
#ifdef ERASE_CHECK
Erase_Cnt long $0
Erase_Len long 1024*1024
#endif
'
#ifndef NEED_XMM_READPAGE
#define NEED_XMM_READPAGE
#endif
'
#ifndef NEED_XMM_WRITEPAGE
#define NEED_XMM_WRITEPAGE
#endif
'
' Include XMM API based on platform
#include "XMM.inc"
'
XMM_Addr      long 0
Hub_Addr      long 0
XMM_Len       long 0
'
'-------------------------------------------------------------------------------

            FIT     496             ' out of 496

#else

PUB Start

#endif            
