{{
'-------------------------------------------------------------------------------
'
' Catalina_XMM_SD_Loader - loads programs from SD or SDHC Card. Note that this 
'                          is NOT a Catalina plugin, but it does use the 
'                          registry to locate other plugins, such as the SD 
'                          Card plugin.
'
' 
' The maximum size of programs that can be loaded by Catalyst is determined 
' by the size of the cluster list and the cluster size itself. The size of
' the cluster list is set in Catalina_Common.spin and catalyst.h (they must
' match!) for a maximum program size of 4Mb but this will only be achieved
' when using a cluster size of 32k. For other cluster sizes, see the table
' below:
' 
' Cluster Size    Max Program Size
' ============    ================
' 512 bytes        64 kbyte
'   1 kbyte       128 kbyte
'   2 kbyte       256 kbyte
'   4 kbyte       512 kbyte
'   8 kbyte         1 Mbyte
'  16 kbyte         2 Mbyte
'  32 kbyte         4 Mbyte
' 
'
' Note that since each entry in the cluster list takes 32 bits instead of 16
' when FAT32 is specified, the size of the list is larger when using FAT32 to
' load program files of the same size - this can impact the Hub RAM required,
' so if maximum Hub RAM is needed, it may be better to use FAT32, and also
' change the maximum size of the loadable files in 
'
' NOTE: This loader does not contain any SD code - it assumes that the Catalina
'       SD Plugin has already been loaded and started by a higher level object.
'
' Version 3.11 - Initial version by Ross Higson.
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
' Set up symbols and constants:
'
#include "Constants.inc"
'
' define the following symbol to erase the whole flash chip at once
' instead of erasing each 4k block just before programming:
'
'#define CHIP_ERASE

'
' these are for debugging:
'
'#define SLOW_XMIT               ' REQUIRED WHEN DEBUGGING SLAVE SIO LOADER
'
'#define DISPLAY_PROGRESS        ' Display load progress (needs lots of space!)
'
' comment these out if possible, to save space:
'
'#define NEED_SIO_READPAGE
'#define NEED_SIO_READLONG
#define NEED_SIO_WRITEPAGE
#define NEED_SIO_WRITELONG
'
' The FAT32 file system requires 32 bits to specify each cluster. 
'
#define ENABLE_FAT32
'
CON

#ifdef FLASH
#ifndef CACHED
#error : FLASH REQUIRES CACHE OPTION (CACHED_1K .. CACHED_8K or CACHED)
#endif
#endif

'
' Currently, we do not include support for the XMM layouts (-x2, -x5) when
' compiling the loader to support the FLASH layouts (-x3, -x4). Of course,
' all loaders must support the LMM (-x0) format, and the SDCARD (-x6) format.
'
' This is mainly due to a lack of space (10 longs or so), and means that
' on some platforms (such as the C3) which have both SPI FLASH and SPI
' RAM, we may need to have two binaries of the loader if we sometimes
' want to use the SPI RAM but not the SPI FLASH. 
'
#ifndef FLASH
#define INCLUDE_NON_FLASH
#endif
'
OBJ
  Common   : "Catalina_Common"

'
' This function is called by the target to allocate data blocks or set up 
' other details for the extra plugins. If it does not need to do anything
' it can simply be a null routine.
'   
PUB Setup

'
' Call this function to start the Loader from Spin (from C, we will
' have to provide an equivalent function).
'
PUB Execute(CPU_Num, File_Mode) | Reg, Flist, Size, Shift, DSect, Sector, Xfer, CPU, FMode, Block
'
' Initiate the Low Level Loader (never returns) 
'
  ' For this Loader, we always start allocating down from
  ' LOADTIME_ALLOC (instead of the RUNTIME_ALLOC) - this is
  ' because the load process is not yet complete and needs
  ' to use that space. This also means programs can be no
  ' larger than around 31k).

  Reg      := Common#REGISTRY
  Flist    := Common#FLIST_ADDRESS
  Size     := long[Common#FLIST_FSIZ] ' LoadSize
  Shift    := long[Common#FLIST_SHFT] ' LoadShift
  DSect    := long[Common#FLIST_SECT] ' LoadSect
  Sector   := Common#FLIST_BUFF
  Xfer     := Common#FLIST_XFER
  CPU      := CPU_Num
  FMode    := File_Mode
  Block    := Common#FLIST_SIOB

  ' overwrite this cog with the loader
  coginit(cogid, @entry, @reg)

  ' start the low level loader
  'cognew(@entry, @Reg)

  ' stop our own cog
  'cogstop(cogid)

CON
'
' SD Plugin Constants
'
SD_Init   = 1
SD_Read   = 2
SD_Write  = 3
SD_ByteIO = 4
SD_StopIO = 5
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
DAT
        org 0

entry
        mov    r0,par                           ' point to parameters

        movd   :ld_reg,#reg_addr                ' starting ... 
        mov    r1,#9                            ' ... with reg_addr ... 
:ld_reg rdlong 0-0,r0                           ' ... read 9 parameters ...
        add    :ld_reg,d_inc                    ' ... into ...
        add    r0,#4                            ' ... consecutive ...
        djnz   r1,#:ld_reg                      ' ... registers

#ifdef MULTI_CPU_LOADER
        rdlong SIO_IO_Block,r0                  ' address of serial io block
#endif

        mov    clust_sects,#1                   ' calculate ...
        shl    clust_sects,clust_shift          ' ... sectors per cluster
        mov    clust_size,sect_size             ' calculate ...
        shl    clust_size,clust_shift           ' ... cluster size

#ifdef DISPLAY_PROGRESS
        mov r6,list_addr
loop
        rdlong r2,r6 wz
   if_z jmp #done_loop
        call #HMI_t_hex
        call #HMI_space
        add r6,#4
        jmp #loop
done_loop
#endif
       
#ifdef XMM_LOADER
        call   #XMM_Activate
#endif        

#ifdef MULTI_CPU_LOADER
        cmp    cpu_no, #0 wz                    ' CPU specified?
 if_z   mov    cpu_no,#Common#DEFAULT_CPU       ' no - this means default CPU
        cmp    cpu_no,#Common#DEFAULT_CPU wz    ' are we loading default CPU?
 if_z   jmp    #load_myself                     ' yes - load our own RAM
'
' load a program into a different CPU using serial I/O
'        
load_another
        mov    r0,file_size
        add    r0,sect_size
        sub    r0,#1
        shr    r0,#Common#FLIST_LOG2
        mov    sect_count,r0

        call   #SIO_WriteSync
        
        mov    src_addr,#0                      ' load from addr 0 of file ...
        mov    dst_addr,cpu_no                  ' ... to offset 0 in XMM ...
        shl    dst_addr,#24                     ' ... on ...
        call   #Copy_SPI_To_SIO                 ' ... the destination CPU
        
        mov    SIO_Temp,cpu_no                  ' send ...
        shl    SIO_Temp,#24                     ' ... CPU ...
        or     SIO_Temp,SIO_EOP                 ' .. an
        call   #SIO_WriteLong                   ' ... EOP packet ...
        mov    SIO_Temp,#0                      ' ... of size ...
        call   #SIO_WriteLong                   ' ... zero

        mov    r0,cnt                           ' a small delay is required ...
        add    r0,:flushdelay                   ' ... to make sure ...
        waitcnt r0,#0                           ' .. all bytes are sent
        clkset :resetmode                       ' restart this program
                  
:flushdelay   long Common#CLOCKFREQ / 1000      ' time to allow for flush
:resetmode    long $80

#endif
'
' load a program into this CPU
'
load_myself

        ' save the current clock freq and mode
        
        rdlong SavedFreq,#0
        rdbyte SavedMode,#4

        ' check if the file has an XMM section
        
        cmp    file_size,hub_size wz,wc         ' file size <= hub size ?
 if_be  jmp    #done_xmm                        ' yes - no XMM section to load
        cmp    load_mode,#6 wz                  ' no - load mode 6 (SMM) ?
 if_z   jmp    #done_xmm                        ' yes - no XMM section to load


#ifdef FLASH

        ' load the prologue to determine the layout

        mov    src_addr,hub_size                ' load ... 
        mov    sect_count,#1                    ' ... the sector ...
        mov    dst_addr,sector_addr             ' ... containing ...
        call   #Copy_SPI_To_RAM                 ' ... the prologue

        mov    r0,sector_addr                   ' get ...
        add    r0,#LAYOUT_OFF                   ' ... segment ...
        rdlong layout,r0 wz                     ' ... layout
 if_z   jmp    #done_xmm                        ' no xmm section for layout 0
        cmp    layout,#6 wz                     ' no xmm section ...
 if_z   jmp    #done_xmm                        ' ... for layout 6
        cmp    layout,#4 wz                     ' if layout 4 ...
 if_z   jmp    #load_flash                      ' ... load to Flash
        cmp    layout,#3 wz                     ' if not layout 3 ...
 if_nz  jmp    #load_xmm                        ' .. then load to XMM

        ' layout 3 or 4 - load program into FLASH

load_flash
#ifdef CHIP_ERASE
        call   #XMM_FlashErase                  ' erase entire flash chip
#else
        mov    XMM_Addr,#0
        call   #XMM_FlashBlock                  ' erase first 4k block
#endif
        mov    dst_addr,#0                      ' copy prologue ...
        call   #Copy_To_FLASH                   ' ... to start of flash

        mov    r0,sector_addr                   ' retrieve ...
        add    r0,#ROBA_OFF                     ' ... 
        rdlong ro_base,r0                       ' ... base ... 
        add    r0,#(RWBA_OFF - ROBA_OFF)        ' ... 
        rdlong rw_base,r0                       ' ... and ...
        add    r0,#(ROEN_OFF - RWBA_OFF)        ' ... 
        rdlong ro_ends,r0                       ' ... ends ...
        add    r0,#(RWEN_OFF - ROEN_OFF)        ' ... 
        rdlong rw_ends,r0                       ' ... of ro & rw segments 

        mov    ro_size,ro_ends                  ' calculate ...
        sub    ro_size,ro_base                  ' ... 
        mov    rw_size,rw_ends                  ' ... 
        sub    rw_size,rw_base                  ' ... sizes

        mov    r0,rw_size                       ' convert r/w size ...
        add    r0,sect_size                     ' ... to number ...
        sub    r0,#1                            ' ... of sectors ...
        shr    r0,#Common#FLIST_LOG2            ' ... occupied by ...
        mov    rw_sect,r0                       ' ... r/w segments

        mov    r0,ro_size                       ' convert r/o size ...
        add    r0,sect_size                     ' ... to number ...
        sub    r0,#1                            ' ... of sectors ...
        shr    r0,#Common#FLIST_LOG2            ' ... occupied by ...
        mov    ro_sect,r0                       ' ... r/o segments

        mov    rw_offs,ro_sect                  ' calculate offset for ...
        shl    rw_offs,#Common#FLIST_LOG2       ' ... rw segments, after ...
        add    rw_offs,sect_size                ' ... ro segments and prologue

#ifndef CHIP_ERASE
        mov    XMM_Addr,rw_offs                 ' because we may not write every block bounday ...
        andn   XMM_Addr,block_mask              ' ... remember the block that may contain ...
        mov    ro_rw_blk,XMM_Addr wz            ' ... both ro and rw segments, and erase it ...
 if_nz call   #XMM_FlashBlock                   ' ... now (we must not erase it again later)
#endif

        mov    src_addr,hub_size                ' copy ...
        add    src_addr,sect_size               ' ... ro ...
        mov    r0,rw_sect                       ' ... segments ...
        shl    r0,#Common#FLIST_LOG2            ' ... from ...
        add    src_addr,r0                      ' ... hub_size ...
        mov    dst_addr,sect_size               ' ... plus prologue ...
        mov    sect_count,ro_sect               ' ... to flash ...
        call   #Copy_SPI_To_FLASH               ' ... plus prologue

        mov    src_addr,hub_size                ' copy ...
        add    src_addr,sect_size               ' ... rw ...
        mov    dst_addr,rw_offs                 ' ... sectors ...
        cmp    layout, #4 wz                    ' ... (adjusting offset ...
 if_z   add    dst_addr,sect_size               ' ... for small rw segments) ...
        mov    sect_count,rw_sect               ' ... after ...
        call   #Copy_SPI_To_FLASH               ' ... ro segments and prologue

        jmp    #done_xmm                        ' now start target

load_xmm

#endif

#ifdef INCLUDE_NON_FLASH

        ' mode 2 or 5 - load program into XMM RAM
        mov    r0,file_size
        sub    r0,hub_size
        add    r0,sect_size
        sub    r0,#1
        mov    r1,sect_size
        call   #f_d32u
        mov    sect_count,r0
        mov    src_addr,hub_size                ' load file data from 32k ...
        mov    dst_addr,#0                      ' ... to offset 0 in XMM
        call   #Copy_SPI_To_XMM
#endif

done_xmm

        ' copy data from start of image to Hub RAM (stopping at max_hub_load)
        mov    r0, max_hub_load                 ' calculate ...
        mov    r1,sect_size                     '
        call   #f_d32u                          '
        mov    max_sect_num,r0                  ' ... max sectors we can load
        mov    r0,file_size
        add    r0,sect_size
        sub    r0,#1
        mov    r1,sect_size
        call   #f_d32u
        cmp    r0, max_sect_num wc,wz
  if_a  mov    r0, max_sect_num        
        mov    sect_count,r0
        mov    src_addr,#0                      ' load from start of file ... 
        mov    dst_addr,#0                      ' ... to start of Hub RAM
        call   #Copy_SPI_To_RAM
'
        ' stop all cogs other than this one (up to LAST_COG), and
        ' restart this cog as a SPIN interpreter to execute the
        ' program now loaded in Hub RAM.
'
restart

#ifdef DISPLAY_PROGRESS 
 call #HMI_k_ready
 if_z jmp #restart
#endif
 
        cogid   r6                              ' set our cog id
        mov     r1,#Common#LAST_COG+1           ' don't restart beyond LAST_COG
:stop_cog
        sub     r1,#1
        cmp     r1,r6 wz
 if_nz  cogstop r1
        tjnz    r1,#:stop_cog

        rdword  r3,#8                           ' Get vbase value
{
        ' calculate checksum (should be zero)
        
        mov     start_pos,#0                        
        mov     end_pos,r3
        call    #calc_checksum
        mov     hex_value,checksum
        call    #Flash_Hex
}
        ' zero hub RAM from vbase to hub_size, unless this is
        ' an SMM load - then we only zero up to max_hub_load
        ' in order to preserve the FLIST, which will be used 
        ' by the phase 2 loader. 

        cmp     load_mode, #6 wz
  if_z  mov     r5, max_hub_load
  if_nz mov     r5, hub_size
        mov     r4,r3
        
:zeroRam
        wrlong  Zero,r4
        add     r4,#4
        cmp     r4,r5 wz,wc
  if_b  jmp     #:zeroRam
  
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
        rdlong  r2,#4
        and     r2,#$FF                         ' Then switch to selected clock
        clkset  r2
:justStartUp
#ifdef XMM_LOADER
        call   #XMM_TriState
#endif        
        mov     r0,interpreter
        coginit r0
        cogstop r6                              ' won't get here if we are cog 0

SavedFreq     long      $0
SavedMode     long      $0
StackMark     long      $FFF9FFFF               ' Two of these mark the base of the stack
Zero          long      $0
XtalTime      long      20 * 20000 / 4 / 1      ' 20ms (@20MHz, 1 inst/loop)

'-------------------------------- Utility routines -----------------------------
'
#ifdef FLASH

' Copy_SPI_To_FLASH - copy a number of sectors to FLASH.
'   src_addr   : offset within file to start copy from.
'   dst_addr   : FLASH address to copy to.
'   sect_count : number of sectors to copy.
'
' NOTE: We only copy WHOLE SECTORS, and we only copy them
'       to WHOLE PAGES.
'
' NOTE: We assume everything is LONG aligned.
'
' NOTE: We assume sectors are an exact multiple of FLASH_PAGE size
'
Copy_SPI_To_FLASH
        tjz    sect_count,#Copy_SPI_To_FLASH_ret
:Copy_loop
        mov    r0,src_addr
        call   #CalcSector
        call   #SPI_ReadSector
#ifndef CHIP_ERASE
        mov    XMM_Addr,dst_addr                ' if this block contains ...
        cmp    XMM_Addr,ro_rw_blk wz            ' ... ro and rw segments ....
  if_z  jmp    #:no_erase                       ' ... do not erase it again!
        test   XMM_Addr,block_mask wz           ' if this is start of block ...
  if_z  call   #XMM_FlashBlock                  ' ... then erase before write
:no_erase
#endif
        call   #Copy_To_FLASH
        add    src_addr,sect_size
        add    dst_addr,sect_size
        djnz   sect_count,#:Copy_loop
Copy_SPI_To_FLASH_ret
        ret
'
' Copy_To_FLASH - copy sector buffer to FLASH.
'   dst_addr   : FLASH address to copy sector_buffer.
'
' NOTE: We only copy WHOLE PAGES.
'
' NOTE: We assume everything is LONG aligned.
'
Copy_To_FLASH
        mov    r6,#0
:prog_loop
        mov    Hub_Addr,xfer_addr
        mov    r5,sector_addr
        add    r5,r6
        wrlong r5,Hub_Addr
        add    Hub_Addr,#4
        wrlong prog_size,Hub_Addr
        add    Hub_Addr,#4
        mov    r5,dst_addr
        add    r5,r6
        wrlong r5,Hub_Addr
        mov    Hub_Addr,xfer_addr
        call   #XMM_FlashWrite
        add    r6,prog_size
        cmp    r6,sect_size wz,wc
  if_b  jmp    #:prog_loop
Copy_To_FLASH_ret
        ret

#endif                

#ifdef INCLUDE_NON_FLASH

'
' Copy_SPI_To_XMM - copy a number of sectors to XMM.
'   src_addr   : offset within file to start copy from.
'   dst_addr   : XMM address to copy to.
'   sect_count : number of sectors to copy.
'
' NOTE: We start copying after an offset into the first
'       sector, but thereafter copy whole sectors.
'
' NOTE: We assume everything is LONG aligned.
'
Copy_SPI_To_XMM
#ifdef XMM_LOADER
        tjz    sect_count,#Copy_SPI_To_XMM_ret
:Copy_loop
        mov    r0,src_addr
        call   #CalcSector
        call   #SPI_ReadSector
        mov    XMM_Addr,dst_addr
        mov    Hub_Addr,sector_addr
        add    Hub_Addr,sect_off
        mov    XMM_Len,sect_size
        sub    XMM_Len,sect_off
        mov    r4,XMM_Len                       ' save length 
        call   #XMM_WritePage
        add    src_addr,r4
        add    dst_addr,r4
        djnz   sect_count,#:Copy_loop
#endif                
Copy_SPI_To_XMM_ret
        ret

#endif
'
' Copy_SPI_To_RAM - copy a number of sectors to RAM.
' On Entry:
'   src_addr   : offset within file to start copy from.
'   dst_addr   : Hub address to copy to.
'   sect_count : number of sectors to copy.
'
' NOTE: We start copying after an offset into the first
'       sector, but thereafter copy whole sectors.
'
' NOTE: We assume everything is LONG aligned.
'
Copy_SPI_To_RAM

#ifdef DISPLAY_PROGRESS
        mov    r2,#"F"                          
        call   #HMI_t_char                      
        call   #HMI_CrLf
#endif

        tjz    sect_count,#Copy_SPI_To_RAM_ret
:Copy_loop
        mov    r0,src_addr
        call   #CalcSector
        call   #SPI_ReadSector
#ifdef DISPLAY_PROGRESS
        mov    r2,sect_num
        call   #HMI_t_hex
        call   #HMI_space
#endif
        mov    r1,sector_addr
        add    r1,sect_off
        mov    r0,sect_size
        sub    r0,sect_off
        shr    r0,#2                            ' divide by 4 to get longs
:Write_loop
        rdlong r2,r1
        wrlong r2,dst_addr
        add    r1,#4
        add    dst_addr,#4
        add    src_addr,#4
        djnz   r0,#:Write_loop
        djnz   sect_count,#:Copy_loop
Copy_SPI_To_RAM_ret
        ret

#ifdef MULTI_CPU_LOADER        

' Copy_SPI_To_SIO - copy a number of sectors to SIO.
'   src_addr   : address within file to start copy from.
'   dst_addr   : address to copy to (this is passed on).
'   sect_count : number of sectors to copy.
'
' NOTE: We start copying after an offset into the first
'       sector, but thereafter copy whole sectors.
'
' NOTE: We assume everything is LONG aligned.
'
Copy_SPI_To_SIO
        tjz    sect_count,#Copy_SPI_To_SIO_ret
:Copy_loop
        mov    r0,src_addr
        call   #CalcSector
        call   #SPI_ReadSector
        mov    SIO_Addr,dst_addr
        mov    Hub_Addr,sector_addr
        add    Hub_Addr,sect_off
        mov    SIO_Len,sect_size
        sub    SIO_Len,sect_off
        mov    r4,SIO_Len                       ' save length 
#ifdef DISPLAY_PROGRESS
        mov    r2,#"B"                          ' display ...
        call   #HMI_t_char                      ' ... progress
#endif
        call   #SIO_WritePage                   ' send the sector
#ifdef  PROCESS_MULTI_CPU_REPLIES_LOADER        
        mov    lrc_addr,sector_addr             ' calculate ...
        mov    lrc_size,sect_size               ' ... LRC ...
        call   #LrcBuffer                       ' ... of sector
        call   #SIO_ReadSync                    ' yes - read sync from target
        cmps   r0,#0 wz,wc                      ' on error ...
  if_b  jmp    #:Copy_loop                      ' ... try again
        call   #SIO_ReadByte                    ' read lrc value from target
        cmps   r0,#0 wz,wc                      ' on error ...
  if_b  jmp    #:Copy_loop                      ' ... try again
        cmp    r0,lrc_rslt wz                   ' was LRC ok?
  if_z  jmp    #:Lrc_ok                         ' yes - do next sector
#ifdef DISPLAY_PROGRESS
        mov    r2,#"X"                          ' display ...
        call   #HMI_t_char                      ' ... LRC failure
        call   #HMI_CrLf
#endif
        jmp    #:Copy_loop                      ' try again on error
:Lrc_ok
#ifdef DISPLAY_PROGRESS
        mov    r2,#"Y"                          ' display ...
        call   #HMI_t_char                      ' ... LRC valid
        call   #HMI_CrLf
#endif
#endif

:Copy_Next
        mov    sect_off,#0
        add    src_addr,r4
        add    dst_addr,r4
        djnz   sect_count,#:Copy_loop
Copy_SPI_To_SIO_ret
        ret
'
#endif        
'
'f_d32u - Unsigned 32 bit division
'         Divisor : r1
'         Dividend : r0
'         Result:
'             Quotient in r0
'             Remainder in r1

f_d32u
        mov    ftemp,#32
        mov    ftmp2, #0
:up2
        shl    r0,#1       WC
        rcl    ftmp2,#1    WC
        cmp    r1,ftmp2    WC,WZ
 if_a   jmp    #:down
        sub    ftmp2,r1
        add    r0,#1
:down
        sub    ftemp, #1   WZ
 if_ne  jmp    #:up2
        mov    r1,ftmp2
f_d32u_ret
        ret

{
ClearSector
        mov    r0,#0
        mov    r1,sect_size
        mov    r2,sector_addr
:Clear_loop
        wrbyte r0,r2
        add    r2,#1
        djnz   r1,#:Clear_loop
ClearSector_ret
        ret
}
'
' LrcBuffer - Calculate LRC of buffer
'
' On Entry
'    lrc_size = size of buffer
'    lrc_addr = address of buffer
' On exit:
'    lrc_rslt = result of LRC
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
' CalcSector - Calculate cluster and sector numbers and offsets
' of a given address (using the file cluster list)
'
' On entry:
'    r0 : the address
' On exit:
'    clus_num  : the cluster number containing the address
'    clus_off  : the offset into the cluster of the address
'    sect_num  : the sector number containing the address
'    sect_off  : the offset into the sector of the address
'
' NOTE: This routine does not check that the address is
'       actually WITHIN the file.
' 
CalcSector
        mov    r1,clust_size
        call   #f_d32u
        mov    clus_num,r0
        mov    clus_off,r1
#ifdef ENABLE_FAT32
        shl    r0,#2
        add    r0,list_addr
        rdlong r0,r0
#else
        shl    r0,#1
        add    r0,list_addr
        rdword r0,r0
#endif
        shl    r0,clust_shift
        add    r0,data_region
        mov    sect_num,r0
        mov    r0,clus_off
        mov    r1,sect_size
        call   #f_d32u
        add    sect_num,r0
        mov    sect_off,r1   
CalcSector_ret
        ret

#ifdef MULTI_CPU_LOADER
'--------------------------------- SIO Routines --------------------------------
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
              call      #SIO_ReadLong           ' read ...
              mov       SIO_Len,SIO_Temp        ' ... size
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
#ifdef DISPLAY_PROGRESS
              mov       r6,r0                   ' display ... 
              mov       r2,SIO_Addr             ' ...
              call      #HMI_t_dec              ' ... address ...
              call      #HMI_space              ' ... 
              mov       r2,SIO_Len              ' ...
              call      #HMI_t_dec              ' ...
              call      #HMI_space              ' ...
              mov       r0,r6                   ' ... and length
#endif
              mov       SIO_Temp,SIO_Addr       ' write ...
              call      #SIO_WriteLong          ' ... address
              mov       SIO_Temp,SIO_Len        ' write ...
              call      #SIO_WriteLong          ' ... size
              tjz       SIO_Len,#SIO_WritePage_ret ' done if size is zero 
:SIO_WriteLoop              
              rdbyte    r0,Hub_Addr             ' write ...
              call      #SIO_WriteByte          ' ... all ...
              add       Hub_Addr,#1             ' ... SIO_Len ...
              djnz      SIO_Len,#:SIO_WriteLoop ' ... bytes
SIO_WritePage_ret
              ret
'
#endif
'
' SIO_WriteByte : Write byte in r0 to SIO, without byte stuffing
'
SIO_WriteByteRaw
              mov       r1,cnt                  ' delay ...                   
              add       r1,ByteDelay            ' ... between ...            
              waitcnt   r1,#0                   ' ... characters                   
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
              add       r1,#6*4-8               ' should we ...
              rdlong    r1,r1                   ' ... ignore ...
              and       r1,#%1000 wz            ' ... echo ? 
        if_nz call      #SIO_ReadByte           ' no - recieve echo before returning              
SIO_WriteByteRaw_ret
              ret
'              
#ifdef SLOW_XMIT              
ByteDelay long Common#CLOCKFREQ/50
#else
ByteDelay long Common#CLOCKFREQ/6000
#endif                      
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
'    CPU_no : CPU number (must be non zero!)
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
'-------------------------------- HMI Routines -------------------------------
'
#ifdef DISPLAY_PROGRESS
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

        mov     r0,#Common#LMM_HMI ' plugin type we want 

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
'----------------------------- SPI SD Card Routines ----------------------------

' SPI_ReadSector - send a read request to SD Plugin for execution
' On Entry
'          sector_addr sector buffer
'          sect_num    sector number
'
SPI_ReadSector

#ifdef SHARED_XMM
#ifdef XMM_LOADER
        call    #XMM_Tristate   ' Disable XMM while using SD
#endif        
#endif

        mov     r2,#SD_Read     ' request ... 
        shl     r2,#24          ' ... read  
        mov     r1,xfer_addr    ' get pointer to xfer block 
        or      r2,r1           ' construct request

        wrlong  sector_addr,r1  ' write first argument to xfer block
        add     r1, #4
        wrlong  sect_num,r1     ' write second argument to xfer block

        mov     r0,#Common#LMM_FIL ' plugin type we want 

        mov     ftemp,reg_addr  ' point to registry
        mov     ftmp2,#0        ' start at cog 0
send1
        cmp     ftmp2,#8 wc,wz  ' run out of plugins?
 if_ae  jmp     #sendErr        ' yes - no such plugin
        rdlong  ftmp3,ftemp     ' no - check next plugin type
        shr     ftmp3,#24       ' is it ...
        cmp     ftmp3,r0 wz     ' ... the type what we wanted?
 if_z   jmp     #send2          ' yes - use this plugin
        add     ftmp2,#1        ' no ...
        add     ftemp,#4        ' ... check ...
        jmp     #send1          ' ... next cog
send2
        mov     r0,ftmp2        ' use the cog where we found the plugin
        shl     r0,#2           ' multiply plugin (cog) id by 4 ...
        add     r0,reg_addr     ' add registry base to get registry entry
        rdlong  r0,r0           ' get request block from registry
        test    r0,top8 wz      ' plugin registered?
 if_z   jmp     #sendErr        ' no - return error
        and     r0,low24        ' yes - write request ...
        wrlong  r2,r0           ' ... to request block
loop2   rdlong  r2,r0   wz      ' wait till ...
 if_nz  jmp     #loop2          ' ... request completed

#ifdef SHARED_XMM
        mov     r2,#SD_StopIO   ' write ... 
        shl     r2,#24          ' ... stop request
        wrlong  r2,r0           ' ... to request block
loop3   rdlong  r2,r0   wz      ' wait till ...
 if_nz  jmp     #loop3          ' ... request completed
#endif

        mov     r0,#0
        jmp     #sendDone
sendErr
        neg     r0,#1           ' return -1 on any error
sendDone

#ifdef SHARED_XMM
#ifdef XMM_LOADER
        call    #XMM_Activate   ' re-enable XMM
#endif        
#endif

SPI_ReadSector_ret
        ret
'
' Common variables
'
top8          long      $FF000000
low24         long      $00FFFFFF
d_inc         long      1<<9

r0            long      $0
r1            long      $0
r2            long      $0
r3            long      $0
r4            long      $0
r5            long      $0
r6            long      $0

reg_addr      long      $0
list_addr     long      $0
file_size     long      $0
clust_shift   long      $0
data_region   long      $0
sector_addr   long      $0
xfer_addr     long      $0
cpu_no        long      $0
load_mode     long      $0

clust_sects   long      $0
clust_size    long      $0

layout        long      $0

max_page                                        ' page size equals sector size
sect_size     long      Common#FLIST_SSIZ       ' Sector Size
prog_size     long      256                     ' program 256 bytes each write

hub_size      long      $8000                   ' Hub RAM size 
max_hub_load  long      Common#FLIST_PREG       ' address we can load up to
max_sect_num  long      $0                      ' max sector we can load

src_addr      long      $0
dst_addr      long      $0
sect_count    long      $0

sect_num      long      $0
sect_off      long      $0

clus_num      long      $0
clus_off      long      $0
'
#ifdef FLASH

ro_base       long      $0
ro_ends       long      $0
ro_size       long      $0
ro_sect       long      $0

rw_base       long      $0
rw_ends       long      $0 
rw_size       long      $0 
rw_sect       long      $0
rw_offs       long      $0
block_mask    long      (1024*4)-1                ' 4k mask
ro_rw_blk     long      $0

#endif

' see http://forums.parallax.com/forums/default.aspx?f=25&m=363100
interpreter   long    ($0004 << 16) | ($F004 << 2) | %0000
'
' temporary storage used in mul & div calculations
'
ftemp         long      $0
ftmp2         long      $0
ftmp3         long      $0
'
#ifdef XMM_LOADER
'
'=============================== XMM SUPPORT CODE ==============================
'
' The folling defines determine which XMM functions are included - comment out
' the appropriate lines to exclude the corresponding XMM function:
'
'#define NEED_XMM_READLONG
'#define NEED_XMM_WRITELONG
'#define NEED_XMM_READPAGE
#define NEED_XMM_FLASHBLOCK
#define NEED_XMM_FLASHWRITE

#define NEED_XMM_WRITEPAGE
#define ACTIVATE_INITS_XMM      ' the HX512 does not allow this in the Kernel
'                                    
#ifdef CHIP_ERASE
#ifndef NEED_XMM_FLASHERASE
#define NEED_XMM_FLASHERASE
#endif
#else
#ifndef NEED_XMM_FLASHBLOCK
#define NEED_XMM_FLASHBLOCK
#endif
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
#else
'
HUB_Addr      long      $0
'
#endif
'              
              fit       $1f0                    ' max size
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
