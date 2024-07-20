{{
'-------------------------------------------------------------------------------
'
' Catalina_HUB_XMM_Loader - HUB Loader for use in conjunction with the Catalina
'                           code generator backend to LCC
'
' Note this loader assumes the Catalina image is already in XMM RAM.
' It supports layouts 2 and 5. It leaves the code segment in situ, but for 
' layout 2 it moves other segments to Hub RAM. Then it loads and starts the 
' XMM kernel. 
'
' Version 5.6 - First Propeller 2 version.
'
' This program incorporates XMM software derived from:
'
'       (c) 2010 by John Steven Denson (jazzed), as modified by David Betz
'
'-------------------------------------------------------------------------------
}}
CON
'
' Common Constants
'
SECTOR_SIZE = FLIST_SSIZ ' also prologue size
'
' Prologue constants (offset from XMM_RO_BASE_ADDRESS)
'
PROLOGUE_SIZE = SECTOR_SIZE ' size of prologue (one sector)
PROLOGUE_ORGH = $1000       ' address of prologue in Hub RAM
PROLOGUE_OFFS = $0000       ' offset of prologue in XMM RAM
LAYOUT_OFFS   = $10         ' offset of layout within prologue

PAGE_SIZE   = PROLOGUE_SIZE ' Size of page in bytes. Fairly arbitrary, but must
                            ' be at least PROLOGUE_SIZE and be divisible by 4.

' define ORIGNAL_CLOCK to use the clock value from the loaded program instead
' of the clock value from the loader. This is not usually what we would want,
' except in cases where the loaded program depends on a specific clock value.

'#define ORIGINAL_CLOCK

CODE_OFF     = LAYOUT_OFFS + 4    
CNST_OFF     = CODE_OFF + 4 
INIT_OFF     = CNST_OFF + 4
DATA_OFF     = INIT_OFF + 4
ENDS_OFF     = DATA_OFF + 4
ROBA_OFF     = ENDS_OFF + 4
RWBA_OFF     = ROBA_OFF + 4
ROEN_OFF     = RWBA_OFF + 4
RWEN_OFF     = ROEN_OFF + 4
INIT_PC_OFF  = RWEN_OFF + 4

MAX_KERNEL_LONGS  = $1f0  ' number of kernel longs to copy
MAX_LIBRARY_LONGS = $200  ' number of library longs to copy

DAT
        org    0

' On the Propeller 2 the XMM loader needs to use the cache, so we need to call 
' _C_init here to load our plugins - we cannot wait till the kernel is loaded. 
' This means that the first $5c longs must be in the same place in this loader
' as in all the kernels, to allow us to execute code that might use these 
' locations. Also, some locations - notably 'reg' - must be initialized to 
' the values expected by such code. We could re-use some of the other longs
' (such as the initial $2b longs which contain the XMM primitive jump table) 
' if we ever need more code space.

HUB_XMM_LOADER_START
        jmp #\HUB_XMM_LOADER_START_2  ' $00
        long 0[$02]                   ' $01 .. $02
_hbrk   long @sbrkinit                ' $03 Hub sbrk (for LARGE programs)
        long 0                        ' $04
_cfreq  long _CLOCKFREQ               ' $05
_cmode  long _CLOCKMODE               ' $06
_baud   long _BAUDRATE                ' $07
        long 0[$52]                   ' $08 .. $59
HUB_XMM_LOADER_START_2                ' $5a
        mov     reg,##REGISTRY        ' 'reg' must point to registry
        hubset  #$F0          
        hubset  ##_CLOCKINIT 
        waitx   ##_CLOCKWAIT
'        mov     r0,##_CLOCKFREQ
'        wrlong  r0,#@_cfreq
        mov     r0,##_CLOCKMODE
'        wrlong  r0,#@_cmode
        hubset  r0
        mov     .t0,##HUB_TOP         ' initialize ...
        wrlong  .t0,##FREE_MEM        ' ... FREE_MEM
        setq2   #(LUT_LIBRARY_END - LUT_STARTUP - 1) ' load startup code ...
        rdlong  0, ##@LUT_STARTUP     ' ... to LUT RAM
        neg     .t0,#1                ' set ... MEM_LOCK ...
        wrlong  .t0,##MEM_LOCK        ' ... to unused
        call    #_C_init              ' execute startup code (to load plugins)
        rdlong  .sp,##FREE_MEM        ' get initial SP
        wrlong  .sp,##@.sp            ' write SP to Hub RAM
        rdlong .arg1,##ARGC_ADDR      ' get arg1 (argc)
        wrlong .arg1,##@.arg1         ' write arg1 to Hub
        rdlong .arg2,##ARGV_ADDR      ' get arg2 (argv)
        wrlong .arg2,##@.arg2         ' write arg2  to Hub
        mov     .page_addr,.sp        ' set up ...
        sub     .page_addr,##PAGE_SIZE ' ... temporary page buffer
 
        call    #\TMP_Activate        ' activate XMM RAM

        ' retrieve the initial prologue (incl layout, segment addresses, PC) 
        ' from the image (which must already have been loaded into XMM RAM)
        '
        ' Note all internal XMM references are relocated "on the fly" by 
        ' the XMM Kernel by subtracting the address of XMM location zero, 
        ' which it calculates as being $200 less than the address of the
        ' code segment given (to allow for the prologue).
        ' For LARGE XMM) programs this will give it the real XMM address.
        ' For SMALL XMM programs, we pretend the code segment starts at $1210
        ' instead (i.e. the value of PROLOGUE_ORGH + $10 + the prologue size),
        ' which will give it the correct address of the code in XMM RAM
        ' without having to relocate the code segment (which is what we do
        ' on the Propeller 1, for no very good reason!).  
        '
        call   #\ClearPage                      ' ensure page buffer is empty
        mov    TMP_Addr,##PROLOGUE_OFFS         ' point to prologue in XMM RAM
        mov    TMP_Hub_Addr,.page_addr          ' read ...
        mov    TMP_Len,##PROLOGUE_SIZE          ' ... prologue ...
        call   #\TMP_ReadLongPage               ' ... from XMM RAM image
        mov    .t0,.page_addr                   ' retreive ...
        add    .t0,#LAYOUT_OFFS                 ' 
        rdlong .layout,.t0                      '
        add    .t0,#(CODE_OFF - LAYOUT_OFFS)    '
        rdlong .cs,.t0                          '
        add    .t0,#(ENDS_OFF - CODE_OFF)       '
        rdlong .ends_addr,.t0                   '
        add    .t0,#(ROBA_OFF - ENDS_OFF)       '
        rdlong .ro_base,.t0                     '
        add    .t0,#(RWBA_OFF - ROBA_OFF)       '
        rdlong .rw_base,.t0                     '
        add    .t0,#(RWEN_OFF - RWBA_OFF)       '
        rdlong .rw_ends,.t0                     '
        add    .t0,#(INIT_PC_OFF - RWEN_OFF)    '  ... prologue data
        rdlong .pc,.t0                          '
        wrlong .pc,##@.pc                       ' write PC to Hub RAM
        rdlong .pc,##@.pc                       ' write PC to Hub RAM

'
' NOTE: the following code implements only XMM Layout 2 and 5:
'
' XMM Layout 2:
'   [CNST,INIT,DATA,CODE] => [CODE] in XMM & [CNST,INIT,DATA] in HUB
'
' XMM Layout 5:
'   [CODE,CNST,INIT,DATA] => [CODE,CNST,INIT,DATA] in XMM (stack in HUB)
'
        ' Copy the prologue to the correct place in Hub RAM. Note that we
        ' don't overwrite the values before the layout (i.e. clock freq etc)
        ' because we generally want to use the values compiled int the loader, 
        ' not the values compiled into the loaded program - so we only copy 
        ' data from PROLOGUE_ORGH+LAYOUT_OFFS to the end of the prologue.
        ' This can be overriden by defining ORIGINAL_CLOCK if required.

#ifdef ORIGINAL_CLOCK
        mov    .byte_count,##PROLOGUE_SIZE-4
        mov    .src_addr,.page_addr
        add    .src_addr,#4
        mov    .dst_addr,##PROLOGUE_ORGH+4
#else
        mov    .t0,##_CLOCKFREQ
        wrlong .t0,##PROLOGUE_ORGH+4
        mov    .t0,##_CLOCKMODE
        wrlong .t0,##PROLOGUE_ORGH+8
        mov    .t0,##_BAUDRATE
        wrlong .t0,##PROLOGUE_ORGH+12
        mov    .byte_count,##PROLOGUE_SIZE-LAYOUT_OFFS
        mov    .src_addr,.page_addr
        add    .src_addr,#LAYOUT_OFFS
        mov    .dst_addr,##PROLOGUE_ORGH+LAYOUT_OFFS
#endif
        call   #\Copy_RAM_To_RAM

        ' Check we know how to load the specified layout

        cmp    .layout,#5 wz                    ' if layout 5 ...
  if_z  jmp    #.start_kernel                   ' ... we are good to go
        cmp    .layout,#2 wz                    ' if not layout 2 ...
  if_nz jmp    #.cannot_load                    ' ... cannot load

        ' For layout 2 (SMALL XMM) we copy MAX_KERNEL_LONGS*4 bytes from 
        ' LUT_LIBRARY to after rw_ends + the kernel size, so that the kernel 
        ' can load the library code after starting. Note that we only want 
        ' the library code, not the startup code, which we have already 
        ' loaded and executed ourselves. Note that we do this copy first,
        ' because when we copy the kernel itself it might end up here!

        mov    .byte_count,##(LUT_LIBRARY_END - LUT_STARTUP)*4
        mov    .src_addr,.laddr                 ' old LUT LIBRARY ADDRESS
        mov    .dst_addr,.rw_ends               ' 
        add    .dst_addr,##MAX_KERNEL_LONGS*4           '
        mov    .laddr,.dst_addr                 ' new LUT LIBRARY address
        call   #\Copy_RAM_To_RAM
        wrlong .laddr,##@.laddr                 ' write LUT address to Hub RAM

        ' For layout 2 (SMALL XMM) we copy MAX_KERNEL_LONGS*4 bytes from 
        ' XMM_START to straight after rw_ends - this prevents it being 
        ' overwritten when we copy the rw segments to Hub RAM. We will 
        ' overwrite ourselves with this code when we restart this cog.
        ' Note that we must have already copied the library code, which 
        ' this copy might otherwise overwrite.
        
        mov    .byte_count,##MAX_KERNEL_LONGS*4
        mov    .src_addr,##@XMM_START
        mov    .dst_addr,.rw_ends               ' 
        call   #\Copy_RAM_To_RAM

        ' For layout 2 (SMALL XMM), move rw segments from XMM to RAM

        mov    .byte_count,.rw_ends             ' calculate size ...
        sub    .byte_count,.rw_base             ' ... of rw segments
        mov    .src_addr,.rw_base               ' move rw segments ...
        mov    .dst_addr,.rw_base               ' ... from XMM ...

        call   #\Copy_XMM_To_RAM                ' ... to Hub RAM

        ' For layout 2 (SMALL XMM), set the Catalina code segment address
        ' used by the Kernel to $200 (note that for layout 5 it is always 
        ' XMM_BASE_ADDRESS + $200).

        mov     .cs,##$200                ' correct ... 
        wrlong  .cs,##@.cs                 ' ... code segment address

        ' Then become the Kernel by restarting this cog with the Kernel code

.start_kernel
        cmp     .layout,#5 wz            ' for layout 5 ...
   if_z mov     .t1,##@XMM_START         ' ... we did not move kernel
  if_nz mov     .t1,.rw_ends             ' for layout 2 it is after rw segments

       ' call TMP_TriState to avoid side effects (e.g. resetting 
       ' other CPUs) while restarting

        call    #\TMP_Tristate
        ' Restart oursevles as the XMM Kernel (note the following code is
        ' intended to reproduce what the P2 boot code does when it executes
        ' a program it just loaded into RAM ...
        setint1 #0
        mov     dira,#0
        mov     dirb,#0
        'wrpin   #0,#62 ' but don't ...
        'wrpin   #0,#63 ' ... do this - it disrupts the serial HMI!
        cogid   .t0
        setq    ##@.reg_addr
        coginit .t0,.t1

.cannot_load
        hubset  ##%0001 << 28            ' hard reset

'-------------------------------- Utility routines -----------------------------
'
Copy_XMM_To_RAM
        tjz    .byte_count,#.Copy_XMM_To_RAM_ret
        mov    TMP_Addr,.src_addr
        mov    TMP_Hub_Addr,.dst_addr
        mov    TMP_Len,.byte_count
        call   #\TMP_ReadLongPage
.Copy_XMM_To_RAM_ret
        ret

{
Copy_RAM_To_XMM
        tjz    .byte_count,#.Copy_RAM_To_XMM_ret
        mov    TMP_Addr,.dst_addr
        mov    TMP_Hub_Addr,.src_addr
        mov    TMP_Len,.byte_count
        call   #\TMP_WriteLongPage
.Copy_RAM_To_XMM_ret
        ret
}

Copy_RAM_To_RAM
        tjz    .byte_count,#.Copy_RAM_To_RAM_ret
.Copy_loop
        rdbyte .t0,.src_addr
        wrbyte .t0,.dst_addr
        add    .src_addr,#1
        add    .dst_addr,#1
        djnz   .byte_count,#.Copy_loop
.Copy_RAM_To_RAM_ret
        ret

{
Copy_XMM_To_XMM
        tjz    .byte_count,#.Copy_XMM_To_XMM_ret
        setd   TMP_Dst,#.XMM_XMM_Tmp
        sets   TMP_Src,#.XMM_XMM_Tmp
.Copy_loop_2
        mov    TMP_Addr,.src_addr
        call   #\TMP_ReadLong
        mov    TMP_Addr,.dst_addr
        call   #\TMP_WriteLong
        add    .src_addr,#4
        add    .dst_addr,#4
        sub    .byte_count,#4 wz
 if_nz  jmp    #.Copy_loop_2
.Copy_XMM_To_XMM_ret
        ret
'
.XMM_XMM_Tmp long 0
'
}
ClearPage  
        mov    .t0,#0
        mov    .t1,##PAGE_SIZE
        mov    .t2,.page_addr
.ClearPage_loop
        wrbyte .t0,.t2
        add    .t2,#1
        djnz   .t1,#.ClearPage_loop
ClearPage_ret
        ret
'
' local variables
'
.t0           long      $0
.t1           long      $0
.t2           long      $0
.page_addr    long      $0

' the layout of these has to remain as is (and match cogstart_XMM_cog.c):
.reg_addr     long      REGISTRY
.pc           long      0                       ' must be set for layout 2 & 5
.sp           long      0                       ' must be set for layout 2 & 5
.lsize        long      LUT_LIBRARY_END - LUT_LIBRARY - 1
.laddr        long      @LUT_LIBRARY            ' must be set for layout 2
.arg1         long      0                       ' must be set for layout 2 & 5
.arg2         long      0                       ' must be set for layout 2 & 5
.cs           long      XMM_BASE_ADDRESS + $200 ' must be set for layout 2

.layout       long      $0
.ro_base      long      $0
.rw_base      long      $0
.rw_ends      long      $0
.ends_addr    long      $0

.src_addr     long      $0
.dst_addr     long      $0
.byte_count   long      $0
'
'=============================== XMM SUPPORT CODE ==============================
'
' The folling defines determine which XMM functions are included - comment out
' the appropriate lines to exclude the corresponding XMM function:
'
#ifndef NEED_XMM_READLONG
#define NEED_XMM_READLONG
#endif
#ifndef NEED_XMM_WRITELONG
#define NEED_XMM_WRITELONG
#endif
#ifndef NEED_XMM_READPAGE
#define NEED_XMM_READPAGE
#endif
#ifndef NEED_XMM_WRITEPAGE
#define NEED_XMM_WRITEPAGE
#endif
#ifndef ACTIVATE_INITS_XMM
#define ACTIVATE_INITS_XMM      ' the HX512 does not allow this in the Kernel
#endif
'                                    
' When the cache is in use, all platforms use the same XMM code
' NOTE: these #define and /#undef statements allow us to include 
'       this code multiple times in the same file without having
'       the symbols multiply defined - in this file, we should
'       always refer to the TMP_ versions.
#define XMM_Addr          TMP_Addr
#define XMM_Len           TMP_Len
#define Hub_Addr          TMP_Hub_Addr
#define XMM_Src           TMP_Src
#define XMM_Dst           TMP_Dst
#define XMM_Activate      TMP_Activate
#define XMM_Tristate      TMP_Tristate
#define XMM_ReadLong      TMP_ReadLong
#define XMM_WriteLong     TMP_WriteLong
#define XMM_ReadMult      TMP_ReadMult
#define XMM_WriteMult     TMP_WriteMult
#define XMM_ReadPage      TMP_ReadPage
#define XMM_WritePage     TMP_WritePage
#define XMM_ReadLongPage  TMP_ReadLongPage
#define XMM_WriteLongPage TMP_WriteLongPage
#include "cached.inc"
#undef XMM_Addr
#undef XMM_Len
#undef Hub_Addr
#undef XMM_Src
#undef XMM_Dst
#undef XMM_Activate
#undef XMM_Tristate
#undef XMM_ReadLong
#undef XMM_WriteLong
#undef XMM_ReadMult
#undef XMM_WriteMult
#undef XMM_ReadPage
#undef XMM_WritePage
#undef XMM_ReadLongPage
#undef XMM_WriteLongPage

TMP_Addr      long 0
TMP_Len       long 0
TMP_Hub_Addr  long 0

#ifdef ENABLE_DEBUG 

#include <debugled.inc>

         fit    $1f0

led_mask
         long   |< (_DEBUG_PIN-32)    
hex_value
         long   $10203040
hex_count
         long   $0
flash_count
         long   $0
         long   $0
#else
         long   $0
         long   $0
         long   $0
         long   $0
         long   $0
#endif


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
