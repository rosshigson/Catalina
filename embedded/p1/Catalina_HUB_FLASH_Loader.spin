{{
'-------------------------------------------------------------------------------
'
' Catalina_HUB_Flash_Loader - HUB Loader for use in conjunction with the 
'                             Catalina code generator backend to LCC
'
' Note this loader assumes the Catalina image is already in SPI FLASH.
'
' The prologue ($200 bytes) is stored at the start of the FLASH, followed by 
' the read-only segments. Then (on the next $200 byte boundary) the read/write 
' segments are stored.
'
' The read-only segments (e.g. code) are left in situ, but the read-write 
' segments (init & data) are copied to SPI RAM. This means this loader is
' only compatible with Catalina programs compiled with layout 3 or layout 4
' (i.e. using the -x3 or -x4 option) and which have been loaded into Flash
' using the Catalina_XMM_SD_Loader.
'
' Version 3.0 - Initial version.
' 
' Version 3.0.1 - Fix error in calculating segment sizes.
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

#ifndef NEED_FLASH
#define NEED_FLASH              ' include FLASH support
#endif

CON
'
' Common Constants
'
SECTOR_SIZE = 1<<Common#FLIST_LOG2  ' sector size is also page and prologue size
'
MAX_KERNEL_LONGS = $1f0  ' number of kernel longs to copy
                  
CON
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
OBJ
  Common   : "Catalina_Common"                  ' Common Definitions
  
PUB Start(Kernel_Addr) : Cog | Reg, Stack, Kernel, Page

   ' Start the loader in another cog, and return the cog that was used,
   ' or -1 if no cog is available.
   '
   ' Allocate a buffer for the loader (must be long aligned)
   '
   long[Common#FREE_MEM] := long[Common#FREE_MEM] - SECTOR_SIZE

   Page   := long[Common#FREE_MEM] 
   Reg    := Common#REGISTRY
   Stack  := long[Common#FREE_MEM]
   Kernel := Kernel_Addr

   Cog    := cognew(@entry, @Reg)

PUB Run(Kernel_Addr) : Cog | Reg, Stack, Kernel, Page

   ' Run restarts this cog as the loader, and never returns
   '
   ' Allocate a buffer for the loader (must be long aligned)
   '
   long[Common#FREE_MEM] := long[Common#FREE_MEM] - SECTOR_SIZE

   Page   := long[Common#FREE_MEM] 
   Reg    := Common#REGISTRY
   Stack  := long[Common#FREE_MEM]
   Kernel := Kernel_Addr

   coginit(cogid, @entry, @Reg)

DAT
        org    0
entry
        mov    r0,par                           ' point to parameters
        rdlong reg_addr,r0                      ' address of Registry
        add    r0,#4
        rdlong stack_addr,r0                    ' address of top of stack
        add    r0,#4
        rdlong entry_addr,r0                    ' kernel entry address
        add    r0,#4
        rdlong page_addr,r0                     ' address of buffer 

        call   #XMM_Activate

        ' retrieve the initial BZ, PC, layout and segment addresses 
        ' from the prologue (stored at the start of the FLASH RAM)
        '
        ' Note: the initial BZ and PC in the image will be correct    
        ' once the read/write segments are moved - the BZ value
        ' is correct if we load the data segment to the place the
        ' compiler assumed it would be loaded, and the XMM Kernel
        ' adjusts the PC value to subtract the location of the code
        ' segment, assuming it will end up at location zero in XMM.
        ' If this is not the case, the intial PC value will need to
        ' be adjusted. Note all internal code segment references are
        ' relocated "on the fly" by the XMM Kernel.
        '
        call   #ClearPage                       ' ensure page buffer is empty
        mov    XMM_Addr,spi_ro_base             ' read ...
        sub    XMM_Addr,hub_size                '
        mov    Hub_Addr,page_addr               '
        mov    XMM_Len,page_size                '
        call   #XMM_ReadPage                    ' ... prologue

        mov    r0,page_addr                     ' retrieve ... 
        add    r0,#INIT_BZ_OFF                  '
        rdlong Init_BZ,r0                       '
        add    r0,#(LAYOUT_OFF - INIT_BZ_OFF)   '
        rdlong layout,r0                        '
        add    r0,#(ROBA_OFF - LAYOUT_OFF)      '
        rdlong ro_base,r0                       '
        add    r0,#(RWBA_OFF - ROBA_OFF)        '
        rdlong rw_base,r0                       '
        add    r0,#(ROEN_OFF - RWBA_OFF)        '
        rdlong ro_ends,r0                       '
        add    r0,#(RWEN_OFF - ROEN_OFF)        '
        rdlong rw_ends,r0                       ' ... prologue data

        ' Copy the prologue from FLASH to HUB RAM. Note that we don't 
        ' overwrite the first $10 bytes since they're special (i.e.
        ' clock freq etc) so we only copy from byte $10 onwards

        mov    byte_count,page_size
        sub    byte_count,#$10
        mov    src_addr,page_addr
        add    src_addr,#$10 
        mov    dst_addr,#$10
        call   #Copy_RAM_To_RAM_Up

        ' calculate ro size 

        mov    ro_size,ro_ends                  ' calculate ...
        sub    ro_size,ro_base                  ' ... r/o size

        ' calculate rw offset

        mov    rw_offs,ro_size                  ' calculate r/w offset ...
        add    rw_offs,page_size                ' ... round ...
        sub    rw_offs,#1                       ' ... up ...
        shr    rw_offs,#Common#FLIST_LOG2       ' ... to ...
        shl    rw_offs,#Common#FLIST_LOG2       ' ... next sector ...
        add    rw_offs,page_size                ' ... and allow for prologue

        ' calculate r/w source address

        mov    rw_addr,rw_offs                  ' set up  address ...
        add    rw_addr,spi_ro_base              ' ... of r/w segments

        ' calculate rw size

        mov    rw_size,rw_ends                  ' calculate ...
        sub    rw_size,rw_base                  ' ... r/w size

'
' The following code implements XMM layouts 3 & 4 only.
'
' XMM Layout 3 (LARGE):
'   [INIT,DATA,CODE,CNST] => [CODE,CNST] in SPI FLASH & [INIT,DATA] in SPI RAM
'   
'
' XMM Layout 4 (SMALL):
'   [CNST,INIT,DATA,CODE] => [CODE] in SPI FLASH & [CNST,INIT,DATA] in HUB RAM
'
        cmp    layout,#3 wz                     ' is it layout 3?
  if_z  jmp    #load_spi                        ' yes - load it
        cmp    layout,#4 wz                     ' is it layout 4?
  if_nz jmp    #cannot_load                     ' no - cannot load it

load_hub

        add    rw_addr,#$10                     ' (????)

        ' when loading the hub, we must preserve the kernel, so we
        ' move the kernel to a safe place - which is the start of 
        ' free data (which we assume will be large enough!).

        ' Copy MAX_KERNEL_LONGS*4 bytes from entry_addr to straight after
        ' Init_BZ - later, we will overwrite ourselves with this code when
        ' we restart this cog as the kernel.
        
        mov    byte_count,kernel_max
        mov    src_addr,entry_addr
        mov    dst_addr,Init_BZ                 ' copy kernel ...
        add    dst_addr,#$10                    ' ... to Init_BZ (+$0010)

        ' figure out correct copy method in the case of overlap
        
        cmp    src_addr,dst_addr wz,wc
 if_a   jmp    #copy_up
        mov    r0,src_addr
        add    r0,byte_count
        cmp    r0,dst_addr wz,wc          
 if_be  jmp    #copy_up
copy_down        
        call   #copy_RAM_To_RAM_Down
        jmp    #copy_done
copy_up
        call   #Copy_RAM_To_RAM_Up
copy_done
        mov    entry_addr,Init_BZ
        add    entry_addr,#$10        

        ' relocate the read/write segments from FLASH to HUB RAM
         
        mov    src_addr, rw_addr                ' set up addresss
        mov    byte_count,rw_size               ' set up size 
        sub    src_addr,hub_size                ' adjust ...
        add    src_addr,rw_base                 ' ... src addr
        mov    dst_addr,rw_base                 ' set up dst addr

        call   #copy_XMM_To_RAM                 ' copy to Hub RAM
        jmp    #setup_kernel

load_spi

        ' relocate the read/write segments from FLASH to SPI RAM 

        mov    src_addr, rw_addr                ' set up addresss
        mov    byte_count,rw_size               ' set up size 
        sub    src_addr,hub_size                ' adjust src addr
        'add    src_addr,#$10
        mov    dst_addr,rw_base                 ' set ...
        sub    dst_addr,hub_size                ' ... dst addr
        add    dst_addr,#$10
        call   #copy_XMM_To_XMM                 ' copy to SPI RAM

setup_kernel

        ' Set up the Catalina program base address for use by the Kernel.

        cogid   r0                              ' convert ...
        shl     r0,#2                           ' ... my cog id ...
        add     r0,reg_addr                     ' ... to my registration addr
        rdlong  r2,r0                           ' get my request block addr

        add     r2,#4
        wrlong  stack_addr,r2
        sub     r2,#4
        mov     r1,#$10                         ' initial BA is always $10
        wrlong  r1,r2

        ' Then become the Kernel by restarting the cog with the Kernel code.

        cogid   r0                              ' set the cog id
        mov     r1,entry_addr                   
        shl     r1,#2
        or      r0,r1                           ' set the code address
        mov     r1,reg_addr
        shl     r1,#16
        or      r0,r1                           ' set the par address

       ' call XMM_TriState to avoid side effects (e.g. resetting 
       ' other CPUs on the TriBladeProp) while restarting

        call    #XMM_Tristate

        coginit r0

cannot_load 
        jmp    #cannot_load                     ' cannot load the program!

low24   long    $00FFFFFF

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

Copy_RAM_To_RAM_Up
        tjz    byte_count,#Copy_RAM_To_RAM_Up_ret
:Copy_loop
        rdbyte r0,src_addr
        wrbyte r0,dst_addr
        add    src_addr,#1
        add    dst_addr,#1
        djnz   byte_count,#:Copy_loop
Copy_RAM_To_RAM_Up_ret
        ret

Copy_RAM_To_RAM_Down
        tjz    byte_count,#Copy_RAM_To_RAM_Down_ret
        add    src_addr,byte_count
        add    dst_addr,byte_count
:Copy_loop
        sub    src_addr,#1
        sub    dst_addr,#1
        rdbyte r0,src_addr
        wrbyte r0,dst_addr
        djnz   byte_count,#:Copy_loop
Copy_RAM_To_RAM_Down_ret
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
XMM_XMM_Tmp long 0
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

'---------------------------------- Variables ----------------------------------
' Common variables

r0            long      $0
r1            long      $0
r2            long      $0

page_addr     long      $0
page_size     long      SECTOR_SIZE
kernel_max    long      MAX_KERNEL_LONGS*4
reg_addr      long      $0
stack_addr    long      $0
entry_addr    long      $0

Init_BZ       long      $0

hub_size      long      $8000                   ' Hub RAM size 

spi_ro_base   long      Common#XMM_RO_BASE_ADDRESS

layout        long      $0
ro_base       long      $0
rw_base       long      $0
ro_ends       long      $0
rw_ends       long      $0

ro_size       long      $0
rw_size       long      $0 
rw_offs       long      $0
rw_addr       long      $0

src_addr      long      $0
dst_addr      long      $0
byte_count    long      $0
'
'=============================== XMM SUPPORT CODE ==============================
'
' The folling defines determine which XMM functions are included - comment out
' the appropriate lines to exclude the corresponding XMM function:
'
#define NEED_XMM_READLONG
#define NEED_XMM_WRITELONG
#define NEED_XMM_READPAGE
#define NEED_XMM_WRITEPAGE
#define ACTIVATE_INITS_XMM      ' the HX512 does not allow this in the Kernel
'                                    
#ifdef CACHED
' When the cache is in use, all platforms use the same XMM code
#include "Cached_XMM.inc"
#else
' Include XMM API based on platform
#include "XMM.inc"
#endif
'
'#include "debug.inc"
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
