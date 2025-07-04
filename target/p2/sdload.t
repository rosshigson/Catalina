{{
'-------------------------------------------------------------------------------
'
' Catalina_SD_Loader - loads programs from SD or SDHC Card. Note that this 
'                      is NOT a Catalina plugin, but it does use the 
'                      registry to locate other plugins, such as the SD 
'                      Card plugin.
' 
' The maximum size of programs that can be loaded by Catalyst is determined 
' by the size of the cluster list and the cluster size itself. The size of
' the cluster list is set in constant.inc and catalyst.h (they must
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
' Version 3.15 - Initial P2 version by Ross Higson. This is a stripped-down
'                version of the P1 XMM SD Loader, since we don't (yet) need
'                any of the convoluted loading methods used on the P1. It
'                currently only supports loading from SD Card to Hub RAM.
'
' Version 5.6  - Added in XMM support code - supports only layouts 2 or 5.
'
' Version 5.8  - Use either the PSRAM plugin or the HYPER plugin (only one
'                of these should be loaded, so it uses whichever is found 
'                first).
'
'-------------------------------------------------------------------------------
}}

CON

#include <constant.inc>

' Support FAT32. This file system requires 32 bits to specify each cluster: 

#define ENABLE_FAT32

' Use an existing SD plugin rather than including the code here:

#define USE_SD_PLUGIN

' Use the cache rather than including the XMM access code here
' (not yet working!):

'#define USE_CACHE_PLUGIN

CON
'
' SD Plugin Constants
'
SD_Init   = 1
SD_Read   = 2
SD_Write  = 3
SD_ByteIO = 4
SD_StopIO = 5

' prologue size and Hub RAM offset:

PROLOGUE_SIZE  = FLIST_SSIZ ' prologue size must be one sector
PROLOGUE_ORGH  = $1000      ' must match reserve.inc

' prologue constants (offset into prologue):

LAYOUT_OFF  = $10
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

DAT
        org 0

SD_LOADER_START

mbox_0  mov    r0,PTRA                          ' point to parameters

mbox_1  setd   .ld_reg,#reg_addr                ' starting ... 
mbox_2  mov    r1,#9                            ' ... with reg_addr ... 
        nop                                     ' ... read ...
.ld_reg rdlong 0-0,r0                           ' ... 9 parameters ...
        add    .ld_reg,d_inc                    ' ... into ...
        add    r0,#4                            ' ... consecutive ...
        djnz   r1,#.ld_reg                      ' ... registers

        mov    clust_sects,#1                   ' calculate ...
        shl    clust_sects,clust_shift          ' ... sectors per cluster
        mov    clust_size,sect_size             ' calculate ...
        shl    clust_size,clust_shift           ' ... cluster size

#ifndef USE_SD_PLUGIN
        call    #_SDcard_Init                   ' initialize the SD card
#endif

        mov    r0,load_size                     ' calculate loader size ...
        add    r0,sect_size                     ' ... plus one sector
        cmp    file_size,r0 wcz                 ' if file is smaller ...
   if_b jmp    #.no_xmm                         ' ... than this, no xmm

        ' load the prologue to determine the layout

        mov    src_addr,load_size               ' load ... 
        mov    sect_count,#1                    ' ... the sector ...
        mov    dst_addr,sector_addr             ' ... containing ...
        call   #Copy_SD_To_RAM                  ' ... the prologue

        mov    r0,sector_addr                   ' get ...
        add    r0,#LAYOUT_OFF                   ' ... segment ...
        rdlong layout,r0                        ' ... layout
        cmp    layout,#2 wz                     ' for layout 2  ...
  if_z  jmp    #.load_xmm                       ' ... load xmm segments
        cmp    layout,#5 wz                     ' for layout 5 ...
  if_z  jmp    #.load_xmm                       ' ... load xmm segments
        jmp    #.no_xmm                         ' no xmm for other layouts

.load_xmm

        ' layout 2 or 5 - need to load XMM RAM prologue and segments

#ifdef USE_CACHE_PLUGIN
        call   #XMM_Activate                    ' initialize the XMM RAM Cache
#else
        call   #psram_init
#endif

        ' save xmm prologue into XMM RAM

        mov    src_addr,load_size               ' load prologue ...
        mov    sect_count,#1                    ' ... (one sector) ...
        mov    dst_addr,#0                      ' ... to offset 0
        call   #Copy_SD_To_XMM                  ' ... in XMM RAM

        ' save xmm segments into XMM RAM

        mov    r0,file_size
        sub    r0,load_size                     ' XMM starts after loader ...
        sub    r0,sect_size                     ' ... plus sector/prologue size
        mov    r1,sect_size                     ' calculate ...
        call   #f_d32u                          ' ... number of ...
        mov    sect_count,r0                    ' sectors of data to load ...
        add    sect_count,#1                    ' ... plus 1 !!!
        mov    src_addr,load_size               ' XMM starts after loader ...
        add    src_addr,sect_size               ' ... plus sector/prologue size

        cmp    layout,#2 wz                     ' for layout 2 add back in ...
  if_z  mov    dst_addr,##PROLOGUE_SIZE+PROLOGUE_ORGH ' ... bytes removed
        cmp    layout,#5 wz                     ' for layout 5 ...
  if_z  mov    dst_addr,##PROLOGUE_SIZE         ' ... there are no bytes removed
        call   #Copy_SD_To_XMM                  ' load XMM segments

#ifdef USE_CACHE_PLUGIN
        call   #XMM_TriState                    ' disable XMM RAM
#endif

        mov    r0,load_size                     ' load only the loader ...
        jmp    #.load_hub                       ' ... into hub RAM

.no_xmm

        ' copy from start of image to Hub RAM (stopping at max_hub_load)

        mov    r0,max_hub_load                  ' maximum size we can load

.load_hub                 ' 

        mov    r1,sect_size                     ' calculate ...
        call   #f_d32u                          '
        mov    max_sect_num,r0                  ' ... max sectors to load
        mov    r0,file_size
        add    r0,sect_size
        sub    r0,#1
        mov    r1,sect_size
        call   #f_d32u
        cmp    r0, max_sect_num wcz
  if_a  mov    r0, max_sect_num        
        mov    sect_count,r0
        mov    src_addr,#0                      ' load from start of file ... 
        mov    dst_addr,#0                      ' ... to start of Hub RAM
        call   #Copy_SD_To_RAM
'
        ' stop all cogs other than this one (up to LAST_COG), and
        ' restart this cog to start the program now loaded into 
        ' location $000000 of Hub RAM
'
        cogid   r6                              ' set our cog id
        mov     r1,#LAST_COG+1                  ' don't restart beyond LAST_COG
.stop_cog
        sub     r1,#1
        cmp     r1,r6 wz
 if_nz  cogstop r1
        tjnz    r1,#.stop_cog

        mov     r0, #0
        coginit r0, #0
        cogstop r6                              ' won't get here if we are cog 0

'-------------------------------- Utility routines -----------------------------

'f_d32u - Unsigned 32 bit division
'            Divisor : r1
'            Dividend : r0
'         Result:
'            Quotient in r0
'            Remainder in r1

f_d32u
        qdiv    r0, r1
        getqx   r0
  _ret_ getqy   r1

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

' Copy_SD_To_XMM - copy a number of sectors to XMM.
'   src_addr   : offset within file to start copy from.
'   dst_addr   : XMM address to copy to.
'   sect_count : number of sectors to copy.
'
' NOTE: We start copying after an offset into the first
'       sector, but thereafter copy whole sectors.
'
' NOTE: We assume everything is LONG aligned.

Copy_SD_To_XMM
        tjz    sect_count,#.Copy_SD_To_XMM_ret
.Copy_loop
        mov    r0,src_addr
        call   #CalcSector
        call   #SD_ReadSector
        mov    XMM_Addr,dst_addr
        mov    Hub_Addr,sector_addr
        add    Hub_Addr,sect_off
        mov    XMM_Len,sect_size
        sub    XMM_Len,sect_off
        mov    r4,XMM_Len                       ' save length 
#ifdef USE_CACHE_PLUGIN
        call   #XMM_WriteLongPage
#else
        call   #psram_wrpage
#endif
        add    src_addr,r4
        add    dst_addr,r4
        djnz   sect_count,#.Copy_loop
.Copy_SD_To_XMM_ret
        ret

' Copy_SD_To_RAM - copy a number of sectors to RAM.
' On Entry:
'   src_addr   : offset within file to start copy from.
'   dst_addr   : Hub address to copy to.
'   sect_count : number of sectors to copy.
'
' NOTE: We start copying after an offset into the first
'       sector, but thereafter copy whole sectors.
'
' NOTE: We assume everything is LONG aligned.

Copy_SD_To_RAM
        tjz    sect_count,#.copy_done
.copy_loop
        mov    r0,src_addr
        call   #CalcSector
        call   #SD_ReadSector
        mov    r1,sector_addr
        add    r1,sect_off
        mov    r0,sect_size
        sub    r0,sect_off
        shr    r0,#2                            ' divide by 4 to get longs
.write_loop
        rdlong r2,r1
        wrlong r2,dst_addr
        add    r1,#4
        add    dst_addr,#4
        add    src_addr,#4
        djnz   r0,#.write_loop
        djnz   sect_count,#.copy_loop
.copy_done
        ret

'--------------------------------- SD Card Routines ----------------------------

#ifdef USE_SD_PLUGIN

' SD_ReadSector - send a read request to SD Plugin for execution
' On Entry
'          sector_addr sector buffer
'          sect_num    sector number

SD_ReadSector
        mov     r2,#SD_Read     ' request ... 
        shl     r2,#24          ' ... read  
        mov     r1,xfer_addr    ' get pointer to xfer block 
        or      r2,r1           ' construct request

        wrlong  sector_addr,r1  ' write first argument to xfer block
        add     r1, #4
        wrlong  sect_num,r1     ' write second argument to xfer block

        mov     r0,#LMM_FIL     ' plugin type we want 

        mov     .temp,reg_addr  ' point to registry
        mov     .tmp2,#0        ' start at cog 0
.send1
        cmp     .tmp2,#8 wcz    ' run out of plugins?
 if_ae  jmp     #.sendErr       ' yes - no such plugin
        rdlong  .tmp3,.temp     ' no - check next plugin type
        shr     .tmp3,#24       ' is it ...
        cmp     .tmp3,r0 wz     ' ... the type what we wanted?
 if_z   jmp     #.send2         ' yes - use this plugin
        add     .tmp2,#1        ' no ...
        add     .temp,#4        ' ... check ...
        jmp     #.send1         ' ... next cog
.send2
        mov     r0,.tmp2        ' use the cog where we found the plugin
        shl     r0,#2           ' multiply plugin (cog) id by 4 ...
        add     r0,reg_addr     ' add registry base to get registry entry
        rdlong  r0,r0           ' get request block from registry
        test    r0,top8 wz      ' plugin registered?
 if_z   jmp     #.sendErr       ' no - return error
        and     r0,low24        ' yes - write request ...
        wrlong  r2,r0           ' ... to request block
.loop2  rdlong  r2,r0   wz      ' wait till ...
 if_nz  jmp     #.loop2         ' ... request completed

  _ret_ mov     r0,#0
.sendErr
  _ret_ neg     r0,#1           ' return -1 on any error
'
' temporary storage 
'
.temp         long      $0
.tmp2         long      $0
.tmp3         long      $0

#else

' SD_ReadSector - use the internal SD code to read a sector
' On Entry
'          sector_addr sector buffer
'          sect_num    sector number

SD_ReadSector
              mov blocknr, sect_num
              mov bufaddr, sector_addr
              call #_readSECTOR
              ret
#endif

' Common variables:

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

reg_addr      long      $0                      ' load ...
list_addr     long      $0                      ' ...
file_size     long      $0                      ' ... 9 ...
clust_shift   long      $0                      ' ...
data_region   long      $0                      ' ... parameters ...
sector_addr   long      $0                      ' ...
xfer_addr     long      $0                      ' ... even if ...
cpu_no        long      $0                      ' ...
load_mode     long      $0                      ' ... they are not all used
sio_block     long      $0                      ' the 10th parameter is not required

clust_sects   long      $0
clust_size    long      $0

sect_size     long      FLIST_SSIZ              ' Sector Size
prog_size     long      256                     ' program 256 bytes each write

layout        long      $0
load_size     long      P2_LOAD_SIZE            ' 64kb
max_hub_load  long      FLIST_PREG              ' address we can load up to
max_sect_num  long      $0                      ' max sector we can load

src_addr      long      $0
dst_addr      long      $0
sect_count    long      $0

sect_num      long      $0
sect_off      long      $0

clus_num      long      $0
clus_off      long      $0

'-------------------------------------------------------------------------------

#ifndef USE_CACHE_PLUGIN

CON

#include <psram.def>

DAT

psram_init
              mov    mbox_0,##REGISTRY   ' point to registry (TBD !!! SHOULD NOT BE HARDCODED HERE !!!)
              mov    mbox_1,#0           ' start at cog id 0
.psa1
              cmp    mbox_1,#MAX_COGS wz ' run out of cogs?
       if_z   mov    mbox_0,#0           ' yes - PSRAM plugin ...
       if_z   hubset  ##%0001 << 28      ' ... not found, hard reset
.psa1x if_z   jmp    #.psa1x
              rdlong mbox_2,mbox_0       ' no - check cog's plugin type
              shr    mbox_2,#24          ' is it ...
              cmp    mbox_2,#LMM_PM1 wz  ' ... the PSRAM plugin?
       if_z   jmp    #.psa2              ' yes - set up mail box etc
              cmp    mbox_2,#LMM_HYP wz  ' ... or the HYPER plugin?
       if_z   jmp    #.psa2              ' yes - set up mail box etc
              add    mbox_1,#1           ' no - try ...
              add    mbox_0,#4           ' ... next ...
              jmp    #.psa1              ' ... cog id
.psa2
              rdlong mbox_0,mbox_0       ' get ...
              and    mbox_0,##$FFFFFF    ' ... request block address
              rdlong mbox_0,mbox_0       ' get pointer to ...
              and    mbox_0,##$FFFFFF    ' ... PSRAM startupData
              add    mbox_0,#192         ' point to mail boxes (+48 longs)
              cogid  mbox_1              ' add ...
              'mov    mbox_1,#7              ' add ...
              shl    mbox_1,#2           ' ... cog * 12 bytes ...
              add    mbox_0,mbox_1       ' ... (i.e. cog * 3 longs) ...
              add    mbox_0,mbox_1       ' ... to point to ...
              add    mbox_0,mbox_1       ' ... OUR mailbox long 0
              mov    mbox_1,mbox_0       ' point to ...
              add    mbox_1,#4           ' ... OUR mailbox long 1
              mov    mbox_2,mbox_1       ' point to ...
              add    mbox_2,#4           ' ... our mailbox long 2
              ret

'  mailbox[2] = 0; // just read only - no RMW mask
'  // trigger burst read operation
'  mailbox[0] = R_READLONG + ((uint32_t)srcAddr & 0x1ffffff);
'  do {
'    result = mailbox[0];
'  } while (result < 0);

psram_rdlong
              mov r0,#0
              wrlong r0,mbox_2

              mov r0,##R_READLONG
              or  r0,XMM_Addr
              wrlong r0,mbox_0
.psram_rdlong1
              rdlong r0,mbox_0
              cmps   r0,#0 wcz
         if_b jmp    #.psram_rdlong1
              rdlong r0,mbox_1
              add    XMM_Addr,#4
              ret

'  mailbox[2] = count;
'  mailbox[1] = (uint32_t)srcHubAddr;
'  // trigger burst write operation
'  mailbox[0] = R_WRITEBURST + ((uint32_t)dstAddr & 0x1ffffff);
'  do {
'    result = mailbox[0];
'  } while (result < 0);

psram_wrpage
              wrlong XMM_Len,mbox_2
              wrlong Hub_addr,mbox_1
              mov r0,##R_WRITEBURST
              or  r0,XMM_addr
              wrlong r0,mbox_0
.psram_wrpage1
              rdlong r0,mbox_0
              cmps r0,#0 wcz
         if_b jmp #.psram_wrpage1
              ret

#else

#define NEED_XMM_WRITEPAGE

' do not use the LUT during load
#define NO_LUT_LOAD
#include "cached.inc"
#undef NO_LUT_LOAD

reg           long REGISTRY                     ' cache code needs this

#endif

XMM_Addr      long 0
Hub_Addr      long 0
XMM_Len       long 0

'-------------------------------------------------------------------------------

#ifndef USE_SD_PLUGIN

'------------------------------------------------------------------------------------------------
' SD Commands & Responses...
'------------------------------------------------------------------------------------------------
' Command              Argument        Response/Data    Description
  CMD0   = 0  +$40   ' 0               R1       -       GO_IDLE_STATE            *Reqs valid CRC
'  CMD1   = 1  +$40   ' 0               R1       -       SEND_OP_COND
  ACMD41 = 41 +$40   ' $4000_0000      R1       -       APP_SEND_OP_COND         *Reqs CMD55 first
  CMD8   = 8  +$40   ' 0               R1+R7    -       SEND_IF_COND             *Reqs valid CRC
  CMD9   = 9  +$40   ' 0               R1       Y       SEND_CSD
  CMD10  = 10 +$40   ' 0               R1       Y       SEND_CID
'  CMD12  = 12 +$40   ' 0               R2       -       STOP_TRANSMISSION
  CMD16  = 16 +$40   ' BlkLen[31:0]    R1       -       SET_BLOCKLEN
  CMD17  = 17 +$40   ' Addr[31:0]      R1       Y       READ_SINGLE_BLOCK
'  CMD18  = 18 +$40   ' Addr[31:0]      R1       Y       READ_MULTIPLE_BLOCK
'  CMD23  = 23 +$40   ' NoBlks[15:0]    R1       -       SET_BLOCK_COUNT
'  ACMD23 = 23 +$40   ' NoBlks[22:0]    R1       -       SET_WR_BLOCK_ERASE_COUNT *Reqs CMD55 first
  CMD24  = 24 +$40   ' Addr[31:0]      R1       Y*      WRITE_BLOCK
'  CMD25  = 25 +$40   ' Addr[31:0]      R1       Y*      WRITE_MULTIPLE_BLOCK
  CMD55  = 55 +$40   ' 0               R1       -       APP_CMD                  *Prefix for ACMD41/ACMD23
  CMD58  = 58 +$40   ' 0               R1+R3    -       READ_OCR


' R1 response:  $FF = busy/wait (0-8 bytes?)
'               b7: 0 (msb first)
'               b6: Parameter Error
'               b5: Address Error
'               b4: Erase Sequence Error
'               b3: Command CRC Error
'               b2: Illegal Command
'               b1: Erase Reset
'               b0: In Idle State
' R1b response: ???
' R3 response:  R1 + OCR(32b)
' R7 response:  R1($01) + 32b(b11..b0 = $1AA = SDC V2 2V7-3V6, else reject)
'
' DataPacket:   DataToken(1byte) + DataBlock(1-2048bytes) + CRC(2bytes)
'   DataToken:  $FE = CMD17/18/24 (read'1'block/read'n'blocks/write'1'block)
'               $FC = CMD25 (write'n'blocks)
'               $FD = CMD25 StopToken  (Single byte packet without data or CRC)
' ErrorToken:   Single Byte Reply
'               b7-b5: 000
'               b4: Card Locked
'               b3: Out of Range
'               b2: Card ECC failed
'               b1: CC Error
'               b0: Error
' DataResponse:
'               b7-b4: xxx0
'               $x5: Data Accepted
'               $xB: Data Rejected - CRC Error
'               $xD: Data Rejected - Write Error


DAT
'
' Check pin pull-up
'
check_pullup	drvl	pa			'drive pin low
check_pulldn	waitx	##300*1			'wait >1us
		fltl	pa			'float pin
		waitx	##300*5			'wait >5us
	_ret_	testp	pa		wc	'sample pin

'+-------[ SD Card Initialisation ]--------------------------------------------+ <--- SD initialisation --->
'+ On Entry:                                                                   +
'+ Call Format:                                                                +
'+              CALL    #_SDcard_Init                   '                      + < call: sd initialise >
'+ On Return:                                                                  +
'+      hub $0   = CSD[16] + CID[16]                    ' csd/cid data         +
'+      Returns  "Z" if ok, "NZ" if error                                      +
'+-----------------------------------------------------------------------------+

'+-----------------------------------------------------------------------------+
'+      SD/SDHC/sdxc SPI Initialisation                                        +
'+-----------------------------------------------------------------------------+
'+      Send >74 clocks with /CS=1 & DI=1 starting & ending with CLK=0         +
'+-----------------------------------------------------------------------------+
_SDcard_Init
                mov     _hubdata,         #0            ' init hub data ptr=$0
                callpa	#_SD_CS,          #check_pullup	' check for pull-up on sd_cs
        if_nc   jmp     #_fail '_pullup                 '

                drvh    #_SD_CS                         ' cs=1 & output
                drvl    #_SD_CK                         ' ck=0 & output
                drvh    #_SD_DI                         ' di=1 & output

                mov     ctr1,             #(96*2)
.count          waitx   ##delay5us                      '\ 5us+5us (ie 100KHz)
                outnot  #_SD_CK                         '| CLK=0-->1-->0
                djnz    ctr1,             #.count       '/
                waitx   ##delay5us                      '  CLK=0 (idle) & /CS=1
'+-----------------------------------------------------------------------------+
'+ Software Reset:                                                             +
'+      CMD0,  PAR=$0,        CRC=$95, REPLY=R1($01)                           +
'+-----------------------------------------------------------------------------+
.Command0       getct   ini_time                        '\ set timeout up to CMD9
                mov     time_out,         ##delay10ms   '/
                mov     ctr1,             #10           ' try a few times
.again0         mov     cmdout,           #CMD0
                mov     cmdpar,           #0
                mov     cmdcrc,           #$95
'+-----------------------------------------------------------------------------+
                call    #_cmdR1          ' /CS=0, send cmd, recv R1, /CS=1
'+-----------------------------------------------------------------------------+
  if_nc         mov     time_out,         ##delay1s     ' increase timeout to 1s
                                                        '\ $01(idle): SD/MMC, not fully validated
  if_nc         jmp     #.Command8                      '/ $00(good): (dane card response)
'+-----------------------------------------------------------------------------+
                waitx   ##delay5us                      ' delay 5us
                djnz    ctr1,             #.again0      ' n: try again?
                jmp     #_fail '00                      '

'+=============================================================================+

' we know we now have an SD/MMC card but its not fully validated yet...
'+-----------------------------------------------------------------------------+
'+ Check Voltage:                                                              +
'+      CMD8,  PAR=$1AA,      CRC=$87, REPLY=R1($01)+R7($xx1AA) ($05=try SDV1) +
'+-----------------------------------------------------------------------------+
.Command8       mov     cmdout,           #CMD8
                mov     cmdpar,           #$1AA
                mov     cmdcrc,           #$87
'+-----------------------------------------------------------------------------+
                call    #_cmdR1R7        ' /CS=0, send cmd, recv R1+R7, /CS=1
'+-----------------------------------------------------------------------------+
  if_c_or_z     jmp     #.illegal                       ' j if <> $01 (not idle)
.idle           and     reply,            ##$FFF        '\
                cmp     reply,            #$1AA     wz  '/ R7[11:0]=$1AA ?
                mov     cmdpar2,          ##$40000000   ' preset for SDV2
  if_ne         jmp     #_fail '98                      ' n: unknown R7
                jmp     #.Command55                     ' y: CMD55+ACMD41($4000_0000)

.illegal        cmp     replyR1,          #$05      wz  ' $05(illegal cmd) ?
  if_ne         jmp     #_fail '08                      ' <>$01/$05 (not idle/illegal)
                mov     cmdpar2,          #0            ' try SDV1
                                                        ' CMD55+ACMD41($0) fall thru
'+-----------------------------------------------------------------------------+
'+ Prefix to ACMD41 & ACMD23:                                                  +
'+      CMD55, PAR=$0,        CRC=$xx, REPLY=R1($01)                           +
'+-----------------------------------------------------------------------------+
.Command55      mov     cmdout,           #CMD55        '
                mov     cmdpar,           #0            '
'+-----------------------------------------------------------------------------+
                call    #_cmdRZA41       ' /CS=0, send cmd, recv R1, /CS=0(ena)
'+-----------------------------------------------------------------------------+
  if_c_or_z     jmp     #_fail '55                      ' <>$01 (not idle)
                                                        '              fall thru
'+-----------------------------------------------------------------------------+
'+ Check SDV1/SDV2:  (follows CMD55)                                           +
'+     ACMD41, PAR=$0,        CRC=$xx, REPLY=R1($00) SD-V1                     +
'+     ACMD41, PAR=$40000000, CRC=$xx, REPLY=R1($00) SD-V2                     +
'+-----------------------------------------------------------------------------+
.CommandA41     mov     cmdout,           #ACMD41       '
                mov     cmdpar,           cmdpar2       ' SDV1=0 / SDV2=$40000000
'+-----------------------------------------------------------------------------+
                call    #_cmdR1          ' /CS=0, send cmd, recv R1, /CS=1
'+-----------------------------------------------------------------------------+
  if_nc_and_nz  jmp     #.Command55                     '  =$01(busy): CMD55+CMD41 again
  if_c          jmp     #_fail '41                      ' <>$00/$01: error

                cmp     cmdpar2,          #0        wz  ' SDV1 ?
        if_z    mov     blocksh,          #9            ' y: #1 SDV1(byte address)
        if_z    jmp     #.Command16                     ' y: SDV1 does not use CMD58
                                                        ' SDV2         fall thru
'+-----------------------------------------------------------------------------+
'+ Check OCR CCS bit:                                                          +
'+      CMD58, PAR=$0,        CRC=$xx, REPLY=R1($00)+R3(b30=1)                 +
'+-----------------------------------------------------------------------------+
.Command58      mov     cmdout,           #CMD58        ' SDHC ?
                mov     cmdpar,           #0            '
'+-----------------------------------------------------------------------------+
                call    #_cmdR1R3        ' /CS=0, send cmd, recv R1+R3, /CS=1
'+-----------------------------------------------------------------------------+
  if_c_or_nz    jmp     #_fail '58                      ' <>$00(good): error
                testbn  reply,            #30       wz  ' bit30=CCS=1? $40000000?
        if_z    mov     blocksh,          #9            ' n: #2 SDV2(byte address)
        if_nz   mov     blocksh,          #0            ' y: #3 SDHC/SDV2(block address)
''      if_nz   jmp     #.Command9x                     ' y: does not req cmd16?                        ?????????
                                                        ' SDV2(byte)   fall thru
'+-----------------------------------------------------------------------------+
'+ Force block size to 512 bytes:                                              +
'+      CMD16, PAR=$200,      CRC=$xx, REPLY=R1($00)                           +
'+-----------------------------------------------------------------------------+
.Command16      mov     cmdout,           #CMD16        ' force blocksize=512bytes
                mov     cmdpar,           ##512         ' 512 bytes
'+-----------------------------------------------------------------------------+
                call    #_cmdR1          ' /CS=0, send cmd, recv R1, /CS=1
'+-----------------------------------------------------------------------------+
  if_nc_and_nz  jmp     #.Command16                     '  =$01(idle): again
  if_c_or_nz    jmp     #_fail '16                      ' <>$00(good): error
'+-----------------------------------------------------------------------------+
.Command9x      mov     bufaddr,          _hubdata      ' where to store CSD/CID
'+-----------------------------------------------------------------------------+
'+ Read CSD register (16 bytes):                                               +
'+      CMD9,  PAR=$0,        CRC=$xx, REPLY=R1($00)                           +
'+-----------------------------------------------------------------------------+
.Command9       mov     cmdout,           #CMD9         ' read CSD register
                call    #_readREG                       '
'+-----------------------------------------------------------------------------+
'+ Read CID register (16 bytes):                                               +
'+      CMD10, PAR=$0,        CRC=$xx, REPLY=R1($00)                           +
'+-----------------------------------------------------------------------------+
.Command10      mov     cmdout,           #CMD10        ' read CID register
                call    #_readREG                       '
'+-----------------------------------------------------------------------------+
        _RET_   MODZ    _set                      wz    ' "Z" = success
'+=============================================================================+

'+-----------------------------------------------------------------------------+
'+ Read Sector:                                                                +
'+-----------------------------------------------------------------------------+
_readSECTOR
'+-----------------------------------------------------------------------------+
'+ Read Block/Sector:  (512 bytes)                                             +
'+      CMD17, PAR=blocknr,   CRC=$xx, REPLY=R1($??) +n*$FF +($FE+block+CRC16) +
'+-----------------------------------------------------------------------------+
.Command17      mov     bytescnt,         ##512         ' read block (no. bytes)
                mov     cmdout,           #CMD17        '
                mov     cmdpar,           blocknr       '
                shl     cmdpar,           blocksh       ' <<0 or <<9
'+-----------------------------------------------------------------------------+
                call    #_readBLOCK                     ' read 512 bytes
'+-----------------------------------------------------------------------------+
                RET                                     ' "Z" = success

{{
'+-----------------------------------------------------------------------------+
'+ Write Sector:                                                               +
'+-----------------------------------------------------------------------------+
_writeSECTOR
'+-----------------------------------------------------------------------------+
'+ Write Block/Sector:  (512 bytes)                                            +
'+      CMD24, PAR=blocknr,   CRC=$xx, REPLY=R1($??) +n*$FF +($FE+block+CRC16) +
'+-----------------------------------------------------------------------------+
.Command24      mov     bytescnt,         ##512         ' write block (no. bytes)
                mov     cmdout,           #CMD24        '
                mov     cmdpar,           blocknr       '
                shl     cmdpar,           blocksh       ' <<0 or <<9
'+-----------------------------------------------------------------------------+
                call    #_writeBLOCK                    ' write 512 bytes
'+-----------------------------------------------------------------------------+
                RET                                     ' "Z" = success
}}

'+=============================================================================+

'+-----------------------------------------------------------------------------+
'+ Read Block/Sector:  (512 bytes)                                             +
'+      CMD9,  PAR=$0,        CRC=$xx, REPLY=R1($00)                           +
'+      CMD10, PAR=$0,        CRC=$xx, REPLY=R1($00)                           +
'+      CMD17, PAR=blocknr,   CRC=$xx, REPLY=R1($??) +n*$FF +($FE+block+CRC16) +
'+-----------------------------------------------------------------------------+
_readREG        mov     bytescnt,         #16           ' CMD9,10: CSD,CID register
                mov     cmdpar,           #0            '        PAR=$0,      16 bytes
_readBLOCK                                              ' CMD17: PAR=sector, 512 bytes
                getct   ini_time                        '\ set timeout for cmd9,10,17
                mov     time_out,         ##delay1s     '/
'+-----------------------------------------------------------------------------+
                call    #_cmdRZtoken     ' /CS=0, send cmd, recv R1, /CS=0(ena)
        if_nz   jmp     #_fail '17                      ' <>$00(good): error
'+-----------------------------------------------------------------------------+
                call    #_getreply                      ' n*$FF+$FE
                cmp     reply,            #$FE      wz  ' $FE=valid Data Token
        if_nz   jmp     #_fail '97                      '
'+-----------------------------------------------------------------------------+
.readbyte       call    #_recvbyte                      ' read data byte
                wrbyte  reply,            bufaddr       ' save byte
                add     bufaddr,          #1            ' bufaddr++
                djnz    bytescnt,         #.readbyte    ' byte--
                call    #_recvbyte                      ' read CRC16 1/2
                call    #_recvbyte                      ' read CRC16 2/2
' NOTE: CRC16 not checked - do we want to do this?                                         ??????????
''              outl    #_SD_CK                         ' CLK=0 (idle)          already=0
                outh    #_SD_CS                         ' /CS=1 (disable)
        _RET_   MODZ    _set                        wz  ' "Z" = success
'+=============================================================================+

{{
'+-----------------------------------------------------------------------------+
'+ Write Block/Sector:  (512 bytes)                                            +
'+      CMD24, PAR=blocknr                                                     +
'+-----------------------------------------------------------------------------+
_writeBLOCK                                             ' CMD24: PAR=sector, 512 bytes
                getct   ini_time                        '\ set timeout for cmd24
                mov     time_out,         ##delay1s     '/
'+-----------------------------------------------------------------------------+
                call    #_cmdRZtoken     ' /CS=0, send cmd, recv R1, /CS=0(ena)
        if_nz   jmp     #_fail '24                      ' <>$00(good): error
'+-----------------------------------------------------------------------------+
                mov     dataout,          #$FE          ' start block token
                call    #_sendbyte                      ' write data byte
'+-----------------------------------------------------------------------------+
.writebyte      rdbyte  dataout,          bufaddr       ' load byte
                call    #_sendbyte                      ' write data byte
                add     bufaddr,          #1            ' bufaddr++
                djnz    bytescnt,         #.writebyte   ' byte--
' NOTE: CRC16 is ignored in SPI mode
                call    #_sendFF                        ' CRC16 byte 1/2
                call    #_sendFF                        ' CRC16 byte 2/2
                call    #_getreply                      ' 
                and     reply,            #$1f
                cmp     reply,            #$5 wz
       if_nz    jmp     #_fail
                waitx   ##delay20ms                     ' why is this necessary???
.waitbusy
                call    #_recvbyte                      ' get a byte
                cmp     reply,            #$FF      wz  ' reply=$FF=busy ?
        if_nz   jmp     #.notbusy                       ' n: done
                getct   replyR1                         '\ y: timeout ?
                sub     replyR1,          ini_time      '|
                cmp     replyR1,          time_out  wc  '| c if < timeout
        if_c    jmp     #.waitbusy                      '| n: try again
                jmp     #_fail '90                      '/ y: timed out
.notbusy
''              outl    #_SD_CK                         ' CLK=0 (idle)          already=0
                outh    #_SD_CS                         ' /CS=1 (disable)
       _RET_   MODZ    _set                        wz   ' "Z" = success
}}

'+=============================================================================+
'+-----------------------------------------------------------------------------+
'+      SEND: CMDx, PARx, CRCx, GET REPLY                                      +
'+-----------------------------------------------------------------------------+
_cmdRZA41                                               ' CMD55:       R1 response
_cmdRZtoken                                             ' CMD9,10,17,24: R1+$FE response
                mov     cmdtype,          #1            ' returns w /CS=0(ena)
                jmp     #_cmdxx                         '
_cmdR1R3                                                ' CMD58:    R1+R3 response
_cmdR1R7                                                ' CMD8:     R1+R7 response
_cmdR1                                                  ' CMD0,A41,16: R1 response
                mov     cmdtype,          #0            ' returns w /CS=1(disabled)
_cmdxx                                                  '
'+-----------------------------------------------------------------------------+
                outl    #_SD_CS                         ' /CS=0 (enable)
'+-----------------------------------------------------------------------------+
                call    #_sendFF                        ' send $FF byte first
                mov     dataout,          cmdout        ' CMD
                call    #_sendbyte                      ' send cmd byte
                mov     dataout,          cmdpar        ' Parameter
                call    #_sendlong                      ' send 4 bytes (MSB first)
                mov     dataout,          cmdcrc        ' CRC
                call    #_sendbyte                      ' send crc byte
'+-----------------------------------------------------------------------------+
                call    #_getreply                      ' recv R1/R1+R3/R1+R7/RZ..+Token
'+-----------------------------------------------------------------------------+
''              outl    #_SD_CK                         ' CLK=0 (idle)           already=0

                skip    cmdtype                         '\ skips next instr if #1
                outh    #_SD_CS                         '| /CS=1(disable) if reqd
              RET                                       '/ else /CS=0 cmdRZA41/cmdRZtoken
'+=============================================================================+

'+-----------------------------------------------------------------------------+
'+      READ REPLY: R1/R1+R3/R1+R7/R1+token                                    +
'+-----------------------------------------------------------------------------+
_getreply       call    #_recvbyte                      ' recv R1 byte
                cmp     reply,            #$FF      wz  ' reply=$FF=busy ?
        if_nz   jmp     #.doneR1                        ' n:

' timeout set in CMD0(for CMD0,8,55,A41,58,16) and CMD9,10,17(readblock)
                getct   replyR1                         '\ timeout ?
                sub     replyR1,          ini_time      '|
                cmp     replyR1,          time_out  wc  '| c if < timeout
        if_c    jmp     #_getreply                      '| n: try again
                jmp     #_fail '90                      '/ timeout:

.doneR1         mov     replyR1,          reply         ' save R1/Token reply
'+-----------------------------------------------------------------------------+
                cmp     cmdout,           #CMD8     wz
        if_nz   cmp     cmdout,           #CMD58    wz
        if_nz   jmp     #.end                           ' ret if not CMD8/CMD58
'+-----------------------------------------------------------------------------+
                call    #_recvlong                      ' R7=CMD8=volts/R3=CMD58=OCR
'+-----------------------------------------------------------------------------+
.end                                                    '\ returns with...
                                                        '| nc+z  replyR1=$00(success)
                test    replyR1,          #1        wz  '| nc+nz replyR1=$01(idle)
        _RET_   cmpr    replyR1,          #$01      wc  '/  c    replyR1>$01(error)
'+=============================================================================+

'+-----------------------------------------------------------------------------+
'+      SD SPI Send/Recv Routines... (write/read byte/long simultaneously)     +
'+              /CS=0 & CLK=0 on both entry and exit                           +
'+-----------------------------------------------------------------------------+
_recvlong       neg     dataout,          #1            ' call here to Recv a Long (+send 1's)
_sendlong       mov     bitscnt,          #32           ' call here to Send a Long (long=32bits)
                jmp     #_sendrecv                      '
_sendFF                                                 ' call here to Send $FF Byte
_recvbyte       neg     dataout,          #1            ' call here to Recv a Byte (+send 1's)
_sendbyte       rol     dataout,          #24           ' call here to Send a Byte (msbit first)
                mov     bitscnt,          #8            '                          (byte=8bits)
_sendrecv       mov     reply,            #0            ' clear reply
' 8+15 low/high clk cycles (8.7MHz@200MHz, 1.3MHz@30MHz)
.nextbit        rol     dataout,          #1        wc  ' \ prepare output bit (DI=0/1)..
                outl    #_SD_CK                         ' | CLK=0  (already 0 first time)
                outc    #_SD_DI                         ' / write output bit: output on CLK falling edge
                waitx   #2                              ' |   setup time to be safe
                outh    #_SD_CK                         ' \ CLK=1
                waitx   #3                              ' |   setup time to be safe
                testp   #_SD_DO                     wc  ' | read input bit:   sample on CLK rising edge
                rcl     reply,            #1            ' / accum DO input bits
                djnz    bitscnt,          #.nextbit     '   8/32 bits?
        _RET_   outl    #_SD_CK                         ' CLK=0 on exit
'+=============================================================================+

'+-----------------------------------------------------------------------------+
_fail           outh    #_SD_CS                         ' /CS=1 (disable)
        _RET_   MODCZ   _set,_clr                   wcz ' C & NZ = fail
'+=============================================================================+

cmdout          long    0                       ' The 8b CMDxx | $40
cmdpar          long    0                       ' The 32b parameters
cmdcrc          long    0                       ' The 8b CRC (must be valid for CMD0 & CMD8)
cmdpar2         long    0                       ' SDV1=$0, SDV2=$40000000
cmdtype         long    0                       ' reply is R1=1, R3=3, R7=7, else 0
reply           long    0                       ' R1 reply (moved to replyR1 when R3/R7 32b reply here)
replyR1         long    0                       ' R1 reply (8b saved when R3/R7 32b reply follows)
dataout         long    0                       ' 8/32 bit data being shifted out
bytescnt        long    0                       ' #bytes to send/recv
bitscnt         long    0                       ' #bits to be shifted in/out
ctr1            long    0
ini_time        long    0                       ' initial time
time_out        long    0                       ' length of timeout
                                                '\ 1=SDV1, 2=SDV2(byte address), 3=SDHC/SDV2(block address)
blocksh         long    0                       '/ block shift 0/9 bits

bufaddr         long    0                       ' ptr sector buffer
blocknr         long    0                       ' sector#
_hubdata        long    0

#endif

'-------------------------------------------------------------------------------

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
