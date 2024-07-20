{{
'-------------------------------------------------------------------------------
'
'
' Catalina_HUB_XMM_Loader - HUB Loader for use in conjunction with the Catalina
'                           Catalina code generator backend to LCC
'
' Note this loader assumes the Catalina image is already in XMM.
' It leaves the code segment in situ, but moves other segments
' to Hub RAM (x2-x4). Then it loads and starts the kernel. 
'
' Version 1.0 - Initial version by Ross Higson.
' Version 1.1 - Support for large address model (using layout -x5)
' Version 1.2 - Add Morpheus support.
'             - Added Run as an alternative way of starting the loader
' Version 2.5 - Add RamBlade support and minor tweaks to XMM code. 
'
' Version 3.0 - this loader cannot load XMM Layout 3 or 4 - must use the 
'               Catalina_Hub_Flash_Loader instead.
'
' Version 3.6 - Support new binary format.
'
' Version 3.11 - Modified to fix 'order of compilation' issue with spinnaker
'
'
' This program incorporates XMM software derived from:
'
'    TriBladeProp Blade #2 Driver v0.201
'       (c) 2009 "Cluso99" (Ray Rodrick) 
'
'    HX512SRAM_ASM_DRV_101.spin by Andre' LaMothe, 
'       (C) 2007 Nurve Networks LLC
'
'    Morpheus System Architecture and Developer's Guide v0.90
'       (C) 2009 William Henning
'
'    SdramCache
'       (c) 2010 by John Steven Denson (jazzed), as modified by David Betz
'
'-------------------------------------------------------------------------------
}}
CON
'
' Common Constants
'
PAGE_SIZE   = 256  ' Size of page in bytes. Fairly arbitrary,
                   ' but must be at least 64 and divisible by 4.
'
SECTOR_SIZE = Common#FLIST_SSIZ ' also prologue size
'
' Prologue constants (offset from XMM_RO_BASE_ADDRESS)
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
MAX_KERNEL_LONGS = $1f0  ' number of kernel longs to copy

OBJ
  Common   : "Catalina_Common"                  ' Common Definitions
  
PUB Start(Kernel_Addr) : Cog | Reg, Stack, Kernel, Page

   ' Start the loader in another cog, and return the cog that was used, 
   ' or -1 if no cog is available.
   '
   ' Allocate a page for the loader (must be long aligned)
   '
   long[Common#FREE_MEM] := long[Common#FREE_MEM] - PAGE_SIZE

   Page   := long[Common#FREE_MEM]
   Reg    := Common#REGISTRY
   Stack  := long[Common#FREE_MEM]
   Kernel := Kernel_Addr

   Cog    := cognew(@entry, @Reg)

PUB Run(Kernel_Addr) : Cog | Reg, Stack, Kernel, Page

   ' Run restarts this cog as the loader, and never returns
   '
   ' Allocate a page for the loader (must be long aligned)
   '
   long[Common#FREE_MEM] := long[Common#FREE_MEM] - PAGE_SIZE

   Page   := long[Common#FREE_MEM]
   Reg    := Common#REGISTRY
   Stack  := long[Common#FREE_MEM]
   Kernel := Kernel_Addr

   coginit(cogid, @entry, @Reg)

DAT
        org    0
entry
        mov    r0,par                           ' point to parameters
        rdlong reg_addr,r0                      ' get address of Registry
        add    r0,#4
        rdlong stack_addr,r0                    ' get address of top of stack
        add    r0,#4
        rdlong entry_addr,r0                    ' get kernel entry address
        add    r0,#4
        rdlong page_addr,r0                     ' get address of page buffer

        call   #XMM_Activate

        ' retrieve the initial BZ, PC, layout and segment addresses 
        ' from the image
        '
        ' Note: the initial BZ and PC in the image will be correct    
        ' once the data and code segments are moved - the BZ value
        ' is correct if we load the data segment to the place the
        ' compiler assumed it would be loaded, and the XMM Kernel
        ' adjusts the PC value to subtract the location of the code
        ' segment, assuming it will end up at location zero in XMM.
        ' If this is not the case, the intial PC value will need to
        ' be adjusted. Note all internal code segment references are
        ' relocated "on the fly" by the XMM Kernel.
        '
        call   #ClearPage                       ' ensure page buffer is empty
        mov    XMM_Addr,#INIT_BZ_OFF             ' point to initial BZ
        mov    Hub_Addr,page_addr               ' read ...
        mov    XMM_Len,#PAGE_SIZE               ' ... prologue ...
        call   #XMM_ReadPage                    ' ... from ...
        mov    r0,page_addr                     ' ... initial BZ

        rdlong Init_BZ,r0                       ' retrieve ...
        add    r0,#(LAYOUT_OFF - INIT_BZ_OFF)   '
        rdlong layout,r0                        '
        add    r0,#(ENDS_OFF - LAYOUT_OFF)      '
        rdlong ends_addr,r0                     '
        add    r0,#(ROBA_OFF - ENDS_OFF)        '
        rdlong ro_base,r0                       '
        add    r0,#(RWBA_OFF - ROBA_OFF)        '
        rdlong rw_base,r0                       '
        add    r0,#(RWEN_OFF - RWBA_OFF)        '
        rdlong rw_ends,r0                       ' ... prologue data
'
' NOTE: the following code implements only XMM Layout 2 and 5:
'
' XMM Layout 2:
'   [CNST,INIT,DATA,CODE] => [CODE] in XMM & [CNST,INIT,DATA] in HUB
'
' XMM Layout 5:
'   [CODE,CNST,INIT,DATA] => [CODE,CNST,INIT,DATA] in XMM (stack in HUB)
'
        ' Copy MAX_KERNEL_LONGS*4 bytes from the Kernel entry address  
        ' to ends_addr in XMM RAM - this is just a temporary place to
        ' save the kernel so we don't lose it when we overwrite the Hub
        ' RAM from the XMM RAM. Note that for layout 5 we take into 
        ' account the bytes removed from the image we have in XMM
         
        mov    byte_count,kernel_size
        mov    src_addr,entry_addr
        mov    dst_addr,ends_addr
        add    dst_addr,#$10
        cmp    layout,#5 wz                     ' for layout 5, correct  ...
  if_z  sub    dst_addr,l5size                  ' ... for bytes removed
        call   #Copy_RAM_To_XMM

        ' Copy the prologue from XMM to RAM. Note that we don't overwrite 
        ' the first $10 bytes since they're special (i.e. clock freq etc) 
        ' so we only copy from byte $10 onwards

        mov    byte_count,pr_size               ' size of prologue
        sub    byte_count,#$10
        mov    src_addr,#$10 
        mov    dst_addr,#$10
        call   #Copy_XMM_To_RAM

        ' Check we know how to load the specified layout

        cmp    layout,#5 wz                     ' if layout 5 ...
  if_z  jmp    #reloc_xmm                       ' ... relocate XMM segments
        cmp    layout,#2 wz                     ' if not layout 2 ...
  if_nz jmp    #cannot_load                     ' ... cannot load

reloc_rw

        ' For layout 2, move rw segments from XMM to RAM

        mov    byte_count,rw_ends               ' calculate size ...
        sub    byte_count,rw_base               ' ... of rw segments
        mov    src_addr,rw_base                 ' move rw segments ...
        mov    dst_addr,rw_base                 ' ... from XMM ...
        add    src_addr,#$10                    ' ... correcting src addr
        call   #Copy_XMM_To_RAM

reloc_xmm

        ' Move all XMM resident segments to start at XMM location zero 

        mov    src_addr,ro_base                 ' XMM resident segments ...
        add    src_addr,#$10                    ' ... are moved to ...
        mov    dst_addr,#$0                     ' ... offset 0 
        cmp    layout,#5 wz                     ' for layout 5 correct ...
  if_z  sub    src_addr,l5size                  ' ... for bytes removed ...
        mov    byte_count,ends_addr             ' calculate size ...
        sub    byte_count,ro_base               ' ... of all XMM segments
        call   #Copy_XMM_To_XMM
        
        ' Copy MAX_KERNEL_LONGS*4 bytes from ends_addr to straight after
        ' Init_BZ (layout 2) or after the segment table (layout 5) - this 
        ' is just another temporary place to put the kernel code - later,
        ' we will overwrite ourselves with this code when we restart this
        ' cog.
        
        mov    byte_count,kernel_size
        mov    src_addr,ends_addr
        add    src_addr,#$10
        cmp    layout,#5 wz                     ' for layout 5 correct ...
  if_z  sub    src_addr,l5size                  ' ... for bytes removed ...
  if_z  mov    dst_addr,#TABLE_END              ' ... and copy after seg table
  if_nz mov    dst_addr,Init_BZ                 ' for other layouts ...
  if_nz add    dst_addr,#$10                    ' ... copy to Init_BZ (+$0010)

        call   #Copy_XMM_To_RAM

        ' Set up the Catalina program base address for use by the Kernel

        cogid   r0                              ' convert ...
        shl     r0,#2                           ' ... my cog id ...
        add     r0,reg_addr                     ' ... to my registration addr
        rdlong  r2,r0                           ' get my request block addr

        add     r2,#4
        wrlong  stack_addr,r2
        sub     r2,#4
        mov     r1,#$10                         ' initial BA is always $10
        wrlong  r1,r2

        ' Then become the Kernel by restarting this cog with the Kernel code

        cogid   r0                              ' set the cog id
        cmp     layout,#5 wz                    ' for layout 5 ...
   if_z mov     r1,#TABLE_END                   ' ... kernel is after seg table
  if_nz mov     r1,Init_BZ                      ' for other layouts ...
  if_nz add     r1,#$10                         ' ... it is at Init_BZ (+$0010)
        shl     r1,#2
        or      r0,r1                           ' set the code address
        mov     r1,reg_addr
        shl     r1,#16
        or      r0,r1                           ' set the par address

        wrlong HBRK,#$0c                        ' see hbrk.le

       ' call XMM_TriState to avoid side effects (e.g. resetting 
       ' other CPUs on the TriBladeProp) while restarting

        call    #XMM_Tristate

        ' Restart oursevles as the XMM Kernel

        coginit r0

cannot_load

        jmp     #cannot_load

HBRK    long    SECTOR_SIZE                     ' leave prologue intact

        ' the following constants are used when reconstructing layout 5:

l5size  long    $8000 - SECTOR_SIZE             ' this many bytes removed
pr_size long    SECTOR_SIZE                     ' size of prologue

'-------------------------------- Utility routines -----------------------------
'
Copy_XMM_To_RAM
        tjz    byte_count,#Copy_XMM_To_RAM_ret
        mov    XMM_Addr,src_addr
        mov    Hub_Addr,dst_addr
        mov    XMM_Len,byte_count
        call   #XMM_ReadPage
Copy_XMM_To_RAM_ret
        ret

Copy_RAM_To_XMM
        tjz    byte_count,#Copy_RAM_To_XMM_ret
        mov    XMM_Addr,dst_addr
        mov    Hub_Addr,src_addr
        mov    XMM_Len,byte_count
        call   #XMM_WritePage
Copy_RAM_To_XMM_ret
        ret

Copy_RAM_To_RAM
        tjz    byte_count,#Copy_RAM_To_RAM_ret
:Copy_loop
        rdbyte r0,src_addr
        wrbyte r0,dst_addr
        add    src_addr,#1
        add    dst_addr,#1
        djnz   byte_count,#:Copy_loop
Copy_RAM_To_RAM_ret
        ret

Copy_XMM_To_XMM
        tjz    byte_count,#Copy_XMM_To_XMM_ret
        movd   XMM_Dst,#XMM_XMM_Tmp
        movs   XMM_Src,#XMM_XMM_Tmp
:Copy_loop
        mov    XMM_Addr,src_addr
        call   #XMM_ReadLong
        mov    XMM_Addr,dst_addr
        call   #XMM_WriteLong
        add    src_addr,#4
        add    dst_addr,#4
        sub    byte_count,#4 wz
 if_nz  jmp    #:Copy_loop
Copy_XMM_To_XMM_ret
        ret
'
XMM_XMM_Tmp long 0
'
ClearPage  
        mov    r0,#0
        mov    r1,#PAGE_SIZE
        mov    r2,page_addr
:ClearPage_loop
        wrbyte r0,r2
        add    r2,#1
        djnz   r1,#:ClearPage_loop
ClearPage_ret
        ret
'
' Common variables
'
r0            long      $0
r1            long      $0
r2            long      $0

page_addr     long      $0
reg_addr      long      $0
stack_addr    long      $0
entry_addr    long      $0

Init_BZ       long      $0

layout        long      $0
ro_base       long      $0
rw_base       long      $0
rw_ends       long      $0
ends_addr     long      $0

src_addr      long      $0
dst_addr      long      $0
byte_count    long      $0
'
kernel_size   long      MAX_KERNEL_LONGS*4 ' (max) kernel size in bytes
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
