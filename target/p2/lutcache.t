{
  Based on code from VMCOG - virtual memory server for the Propeller
  Copyright (c) February 3, 2010 by William Henning

  and on code from SdramCache
  Copyright (c) 2010 by John Steven Denson (jazzed) and David Betz

  Modified for Catalina by Ross Higson (removal of all VARs and SPIN methods
  other than Start). This plugin is enabled by defining one of the following 
  Catalina symbols:

    !NO_LUT   : use up to 1K of LUT ($000 - $0FF) as a cache page.

    LUT_CACHE : use 1K of LUT ($000 - $0FF) for the whole cache.
 
  NOTES:
     1. This plugin responds to both mailbox commands and pin requests. 
     2. To use LUT sharing, the LUT cache must use one cog of a LUT-shared 
        cog pair, with the other cog used by the XMM kernel.
     3. The hub cache is still used as interim storage between the LUT
        and XMM RAM, and the line address passed back in the LUT response
        is the correct Hub RAM address of the data. But all data is read and 
        written only to/from the LUT unless WRITE_HUB is defined (e.g. for
        testing), but Hub RAM buffer is used when a page must be transferred 
        between the LUT and XMM RAM. The LUT RAM address is the lower 11 bits
        of the Hub RAM address minus XMM_CACHE.

  Version 6.6   - Initial release

  Version 8.7   - Support read-only LUT (LARGE mode only)
                - Remove FLASH CACHE code (not supported on Propeller 2)

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

#include <constant.inc>

#ifdef CACHED

#define XMM_Activate      PSR_Activate
#define XMM_Tristate      PSR_Tristate
#define XMM_ReadPage      PSR_ReadPage
#define XMM_WritePage     PSR_WritePage
#define XMM_ReadLongPage  PSR_ReadPage
#define XMM_WriteLongPage PSR_WritePage
#define Hub_Addr          PSR_Hub_Addr
#define XMM_Addr          PSR_Addr
#define XMM_Len           PSR_Len

CON

  CMD_MASK              = CACHE_CMD_MASK
  ' cache access commands
  WRITE_CMD             = CACHE_WRITE_CMD
  READ_CMD              = CACHE_READ_CMD
#if !defined(NO_LUT) && defined(LARGE)
  CODE_CMD              = CACHE_CODE_CMD
  CODE_MASK             = CACHE_CODE_MASK
#endif

  UNIQUE_RESPONSE       = $DEADC0DE

  ' number of entries in index
  CACHE_INDEX           = 1<<CACHE_INDEX_LOG2
  ' width of offset within index 
  DEFAULT_INDEX_WIDTH   = CACHE_INDEX_LOG2
  ' width of offset within line
  DEFAULT_OFFSET_WIDTH  = CACHE_LINE_LOG2
  ' length of each line in cache
  LINELEN               = 1<<DEFAULT_OFFSET_WIDTH

  ' cache line tag flags
  EMPTY_BIT             = 30
  DIRTY_BIT             = 31

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

CACHE_driver_start
init_vm 
#ifdef CACHE_PINS
        dirl    #CACHE_CMD_PIN       ' set dir of CACHE_CMD_PIN pin to input
        dirh    #CACHE_RSP_PIN       ' set dir of CACHE_RSP_PIN pin to output
        wrpin   #CACHE_PIN_MODE, #CACHE_CMD_PIN ' set mode of CACHE_CMD_PIN pin 
        wrpin   #CACHE_PIN_MODE, #CACHE_RSP_PIN ' set mode of CACHE_RSP_PIN pin
#endif                
        fit     CACHE_INDEX

fillme  long    0[CACHE_INDEX-fillme]   ' first cog locations are used for a direct mapped page table

        setluts #1                   ' enable kernel to write to our LUT
        mov     .t1, PTRA            ' get the address of the initialization structure
        rdlong  pvmcmd, .t1          ' pvmcmd is a pointer to the virtual address and read/write bit
        mov     pvmaddr, pvmcmd      ' pvmaddr is a pointer into the cache line on return
        add     pvmaddr, #4
        add     .t1, #4
        rdlong  cacheptr, .t1        ' cacheptr is the base address in hub ram of the cache
        add     .t1, #4
        rdlong  .t2, .t1 wz
  if_nz mov     index_width, .t2     ' override the index_width default value
        add     .t1, #4
        rdlong  .t2, .t1 wz
  if_nz mov     offset_width, .t2    ' override the offset_width default value

        mov     index_count, #1
        shl     index_count, index_width
        mov     index_mask, index_count
        sub     index_mask, #1

        mov     line_size, #1
        shl     line_size, offset_width
        mov     line_mask, line_size
        sub     line_mask, #1
        mov     lut_setq2, line_size  ' calculate ...
        shr     lut_setq2, #2         ' ... setq2 ...
        sub     lut_setq2, #1         ' ... value (longs)
        wrlong  line_mask, PTRA       ' ... actual line mask
        jmp     #vmflush

        ' initialize the cache lines
vmflush setd    .flush, #0
        nop
        mov     .t1, index_count

.flush  mov     0-0, empty_mask
        add     .flush, .dstinc
        nop
        djnz    .t1, #.flush

        wrlong  #0, pvmcmd              ' indicate cache is ready!

        ' start the command loop
waitcmd 
#ifdef CACHE_PINS
        testp   #CACHE_CMD_PIN wc       ' if pin command available ...
  if_c  mov     vmcmd, #0               ' ... remember it is a pin command ...
  if_c  jmp     #.pincmd                ' ... and process it
        rdlong  vmpage, pvmcmd wz       ' if hub command available ...
  if_nz mov     vmcmd, vmpage           ' ... remember it is a hub command ...
  if_nz jmp     #.cmd                   ' ... and process it 
        jmp     #waitcmd                ' wait for next command
.pincmd rdpin   vmpage, #CACHE_CMD_PIN  ' process pin command
#else
        rdlong  vmpage, pvmcmd wz       ' wait for ...
  if_z  jmp     #waitcmd                ' ...hub command
#endif
.cmd    cmps    vmpage, #0 wc           ' if it is just a ping (cmd < 0) ...
  if_c  jmp     #ping                   ' ... then respond
        mov     set_dirty_bit,#0
        test    vmpage, #1 wz           ' is it a write command?
 if_z   mov     set_dirty_bit, dirty_mask  ' yes - writes make the page dirty
#if !defined(NO_LUT) && defined(LARGE)
        mov     copy_to_lut,#0
        test    vmpage, #CODE_MASK wz    ' is this a CODE command?
 if_z   mov     copy_to_lut,#1           ' yes - copy page to LUT
#endif
        shr     vmpage, offset_width
        mov     .line, vmpage            ' get the cache line index
        and     .line, index_mask
        mov     hubaddr, .line
        shl     hubaddr, offset_width
        add     hubaddr, cacheptr       ' get the address of the cache line
        mov     vmrsp, hubaddr
        sets    .ld, .line
        setd    .st, .line
        nop
.ld     mov     vmcurrent, 0-0          ' get the cache line tag
        and     vmcurrent, tag_mask
        cmp     vmcurrent, vmpage wz    ' z set means there was a cache hit
  if_nz call    #miss                   ' handle a cache miss
#if !defined(NO_LUT) && defined(SMALL)
        setq2   lut_setq2               ' read line ...
        rdlong  0, hubaddr               ' ... from Hub to LUT address 0
#elif !defined(NO_LUT) && defined(LARGE)
        test    copy_to_lut,#1 wz       ' was this a CODE command?
  if_z  jmp     #.st                    ' no - don't read page to LUT
        setq2   lut_setq2               ' yes - read line ...
        rdlong  0, hubaddr               ' ... from Hub to LUT address 0
#endif
.st     or      0-0, set_dirty_bit      ' set the dirty bit on writes
        call    #respond                ' return the address of the cache line
        jmp     #waitcmd                ' wait for a new command

ping
        mov     vmrsp, ping_response
        call    #respond
        jmp     #waitcmd

respond
#ifdef CACHE_PINS
        cmp     vmcmd, #0 wz            ' hub mailbox command?
 if_z   wxpin   vmrsp, #CACHE_RSP_PIN   ' no - respond using pin
 if_z   ret
#endif
        wrlong  vmrsp, pvmaddr          ' yes - respond using hub mailbox
        wrlong  #0, pvmcmd
        ret
        

' line is the cache line index
' vmcurrent is current page
' vmpage is new page
' hubaddr is the address of the cache line
miss
        call    #XMM_Activate
        setd    .test, .line
        setd    .st2, .line
        nop
.test   test    0-0, dirty_mask wz
  if_z  jmp     #.rd2                   ' current page is clean, just read new page
        mov     Hub_Addr, hubaddr
        mov     XMM_Len, line_size
        mov     XMM_Addr, vmcurrent
        shl     XMM_Addr, offset_width
        call    #XMM_WriteLongPage       ' write current page
.rd2    mov     Hub_Addr, hubaddr
        mov     XMM_Len, line_size
        mov     XMM_Addr, vmpage
        shl     XMM_Addr, offset_width
        call    #XMM_ReadLongPage       ' read new page
.st2    mov     0-0, vmpage
        call    #XMM_Tristate
#if defined(LUT_CACHE)
' load page from HUB to correct place in LUT
        mov     lutaddr, hubaddr        ' convert Hub addr ...
        sub     lutaddr, cacheptr       ' ... to ...
        shr     lutaddr, #2             ' ...  LUT addr
        setd    .lutdst, lutaddr
        nop                             ' (required by setd)
        setq2   lut_setq2               ' read line ...
.lutdst rdlong  0-0, hubaddr            ' ... from Hub to LUT
#endif
        ret

' pointers to mailbox entries
pvmcmd          long    0       ' on call this is the virtual address and read/write bit
pvmaddr         long    0       ' on return this is the address of the cache line containing the virtual address

cacheptr        long    0       ' address in hub ram where cache lines are stored
vmcmd           long    0       ' command (if hub command) or zero (if pin cmd)
vmrsp           long    0       ' response to send (pin or hub command)
vmpage          long    0       ' page containing the virtual address
vmcurrent       long    0       ' current page in selected cache line (same as vmpage on a cache hit)
.line           long    0       ' current cache line index
set_dirty_bit   long    0       ' DIRTY_BIT set on writes, clear on reads

.dstinc         long    1<<9    ' increment for the destination field of an instruction
.t1             long    0       ' temporary variable
.t2             long    0       ' temporary variable

tag_mask        long    !(1<<DIRTY_BIT) ' includes EMPTY_BIT
address_mask    long    !(1<<DIRTY_BIT | 1<<EMPTY_BIT)
index_width     long    DEFAULT_INDEX_WIDTH
index_mask      long    0
index_count     long    0
offset_width    long    DEFAULT_OFFSET_WIDTH
line_size       long    0                       ' line size in bytes
line_mask       long    0                       ' line mask
lut_setq2       long    0                       ' line size in longs - 1
#if !defined(NO_LUT) && defined(LARGE)
copy_to_lut     long    0
#endif
empty_mask      long    (1<<EMPTY_BIT)
dirty_mask      long    (1<<DIRTY_BIT) 
ping_response   long    UNIQUE_RESPONSE
hubaddr         long    0
lutaddr         long    0
lutcheck        long    0
lutval          long    0
hubval          long    0
lutcount        long    0

'-------------------------------------------------------------------------------
' platform specific stuff ...

#ifndef NEED_PSR_READPAGE
#define NEED_PSR_READPAGE
#endif
'
#ifndef NEED_PSR_WRITEPAGE
#define NEED_PSR_WRITEPAGE
#endif
'
' Include XMM API - supports PSRAM and Hyper RAM:
#include <psram.inc>
'
#undef XMM_Activate 
#undef XMM_Tristate 
#undef XMM_ReadPage 
#undef XMM_WritePage
#undef XMM_ReadLongPage 
#undef XMM_WriteLongPage
#undef Hub_Addr 
#undef XMM_Addr     
#undef XMM_Len      
'
'-------------------------------------------------------------------------------

            FIT     496             ' out of 496

#endif            
