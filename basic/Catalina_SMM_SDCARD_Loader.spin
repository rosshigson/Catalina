'---------------------------------------------------------------
' SMM_SDCARD_Loader - SMM SDCARD Loader for use in conjunction
'                     with the Catalina code generator.
'
' Note that this version only supports programs built using
' the -x6 (XMM Layout 6) option of the Catalina binder. The
' resulting image is assumed to have had its sectors loaded. 
'
' Version 2.8 - initial version by Ross Higson
'
' Version 3.6 - Support new binary format.
' Version 3.11 - Add FAT32 support.
'
'---------------------------------------------------------------
'
CON

'
' The FAT32 file system requires 32 bits to specify each cluster. 
'
#define ENABLE_FAT32

FLIST_ADDRESS  = Common#FLIST_ADDRESS
MAX_FLIST_SIZE = Common#MAX_FLIST_SIZE

FLIST_SSIZ     = Common#FLIST_SSIZ
FLIST_PREG     = Common#FLIST_PREG
FLIST_PSTK     = Common#FLIST_PSTK
FLIST_BUFF     = Common#FLIST_BUFF 
FLIST_FSIZ     = Common#FLIST_FSIZ 
FLIST_SHFT     = Common#FLIST_SHFT 
FLIST_SECT     = Common#FLIST_SECT 
FLIST_XFER     = Common#FLIST_XFER 

LMM_FIL        = Common#LMM_FIL
LMM_HMI        = Common#LMM_HMI

OBJ
  Common : "Catalina_Common"

PUB Run
'
' Initiate the values required by the Phase 2 Loader - note that the values 
' stored at FLIST_FSIZ, FLIST_SHFT, FLST_SECT must have already been initialized. 
'
  long[FLIST_PREG] := Common#REGISTRY
  long[FLIST_PSTK] := long[Common#FREE_MEM]

  ' point to initialization data and stack pointer in this cog's request block
  long[Common#REQUESTS][2 * cogid + 1] := long[Common#FREE_MEM]
  long[Common#REQUESTS][2 * cogid]     := FLIST_PREG
  ' now start the phase 2 loader
  coginit(cogid, @entry, Common#REGISTRY)

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
DAT
'
              org       $0
entry
              cogid     r0                      ' convert ...
              shl       r0,#2                   ' ... my cog id ...
              add       r0,par                  ' ... to my registration addr
              rdlong    r0,r0                   ' get my request block addr
              mov       req_addr, r0            ' save for later
              rdlong    r0,r0                   ' get pointer to phase 2 load parameters 

              movd      :ld_reg,#reg_addr       ' starting ... 
              mov       r1,#5                   ' ... with reg_addr ... 
:ld_reg       rdlong    0-0,r0                  ' ... read 5 parameters ...
              add       :ld_reg,d_inc           ' ... into ...
              add       r0,#4                   ' ... consecutive ...
              djnz      r1,#:ld_reg             ' ... registers

              mov       clust_sects,#1          ' calculate ...
              shl       clust_sects,clust_shift ' ... sectors per cluster
              mov       clust_size,sect_size    ' calculate ...
              shl       clust_size,clust_shift  ' ... cluster size
'
              mov       r0, kb_32               ' read ...
              call      #CalcSector             ' ... the ...
              mov       hub_addr,sector_addr    ' ... first ...
              call      #SPI_Read               ' ... sector ...
              mov       r0, sector_addr         ' ... to ...
              add       r0, #6                  ' ... get ...
              rdword    r0, r0                  ' ... application base address ...
              wrlong    r0, req_addr            ' ... and save in request block (for restart)
'              
' Copy up to 31kb (64 sectors) from 32kb boundary to Hub RAM
'
              mov       src_addr, kb_32         ' copy from 32kb boundary in file ...
              add       src_addr, #$10          ' ... plus $10 ...
              mov       dst_addr, #$10          ' ... to #$10 in hub RAM ...
              mov       r0, stk_addr            ' calculate ...
              mov       r1, sect_size           ' ... maximum number of sectors
              call      #f_d32u                 ' ... the program can occupy
              mov       sect_count, r0          ' load ...
              call      #Copy_SPI_TO_RAM        ' ... that many sectors to Hub RAM
              mov       r0, stk_addr            ' calculate ...
              call      #CalcSector             ' ... amount used ...
              cmp       sect_off, #0 wz         ' ... of last sector
        if_z  jmp       #no_more                ' if none, we are done
              mov       hub_addr, sector_addr   ' otherwise ... 
              call      #SPI_Read               ' ... load the last sector
              mov       r0, stk_addr            ' calculate ...
              mov       r1, sect_size           ' ... hub 
              call      #f_d32u                 ' ... offset ...
              mov       r1, sect_size           ' ... of ...
              call      #f_m32                  ' ... the last sector
              mov       hub_addr, r0            ' save as hub addr
              mov       r1, sector_addr              
:wr_loop      rdbyte    r0, r1
              wrbyte    r0, hub_addr
              add       r1, #1
              add       hub_addr, #1
              djnz      sect_off, #:wr_loop
no_more
'
' Set up for copying the kernel by calculating the sector numbers of the 4 sectors
' that the kernel occupies, and then load kernel into this cog
'
' NOTE !!! THIS CODE CURRENTLY ASSUMES 512 byte SECTORS !!!
'
              mov       r0, kb_64               ' calculate the 4 sectors ...
              call      #CalcSector             '
              mov       kernel_sect_1, sect_num '
              add       kb_64, sect_size        '
              mov       r0, kb_64               '
              call      #CalcSector             '
              mov       kernel_sect_2, sect_num '
              add       kb_64, sect_size        '
              mov       r0, kb_64               '
              call      #CalcSector             '
              mov       kernel_sect_3, sect_num '
              add       kb_64, sect_size        '
              mov       r0, kb_64               '
              call      #CalcSector             '
              mov       kernel_sect_4, sect_num ' ... containing the kernel
              jmp       #Load_Kernel
'              
kb_32         long      32*1024                 ' offset of application program
kb_64         long      64*1024                 ' offset of kernel
'-------------------------- SD READ SUPPORT ROUTINES ---------------------------
'
'f_d32u - Unsigned 32 bit division
'         Divisor : r1
'         Dividend : r0
'         Result:
'             Quotient in r0
'             Remainder in r1

f_d32u
              mov       ftemp,#32
              mov       ftmp2, #0
:up2
              shl       r0,#1       WC
              rcl       ftmp2,#1    WC
              cmp       r1,ftmp2    WC,WZ
        if_a  jmp       #:down
              sub       ftmp2,r1
              add       r0,#1
:down
              sub       ftemp, #1   WZ
        if_ne jmp       #:up2
              mov       r1,ftmp2
f_d32u_ret
              ret
'
'f_m32 - multiplication
'        r0 : 1st operand (32 bit)
'        r1 : 2nd operand (32 bit)
'        Result:
'           Product in r0 (<= 32 bit)
'
f_m32
        mov    ftemp,#0
:start
        cmp    r0,#0       WZ
 if_e   jmp    #:down3
        shr    r0,#1       WC
 if_ae  jmp    #:down2
        add    ftemp,r1    WC
:down2
        shl    r1,#1       WC
        jmp    #:start
:down3
        mov    r0,ftemp
f_m32_ret
        ret
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
'
' Copy_SPI_To_RAM - copy a number of sectors to RAM.
' On Entry:
'   src_addr   : address within file to start copy from.
'   dst_addr   : address to copy to.
'   sect_count : number of sectors to copy.
'
' NOTE: We start copying after an offset into the first
'       sector, but thereafter copy whole sectors.
'
' NOTE: We assume everything is LONG aligned.
'
Copy_SPI_To_RAM
              tjz       sect_count,#Copy_SPI_To_RAM_ret
:Copy_loop
              mov       r0,src_addr
              call      #CalcSector
              call      #SPI_Read
              mov       r1,sector_addr
              add       r1,sect_off
              mov       r0,sect_size
              sub       r0,sect_off
              shr       r0,#2                   ' divide by 4 to get longs
:Write_loop
              rdlong    r2,r1
              wrlong    r2,dst_addr
              add       r1,#4
              add       dst_addr,#4
              add       src_addr,#4
              djnz      r0,#:Write_loop
              djnz      sect_count,#:Copy_loop
Copy_SPI_To_RAM_ret
              ret
'
'-------------------------------------------------------------------------------
'
' Load_Kernel - This code loads the first three sectors of the
' kernel from the sector buffer into this cog. It must run entirely
' above $180. The code that calculates the sectors can be lower than
' this - it should put the first sector number into Sector_Num - the
' next three sectors are assumed to be contguous with the first.
' After loading three sectors, and reading the fourth, it jumps to
' Load_Last_Sector
'
'
              fit       $180
:dummy        long      0[$180-:dummy]              
'
Load_Kernel


              mov       sect_num, kernel_sect_1
              call      #SPI_Read
              mov       hub_addr, sector_addr
              mov       cog_addr, #$000
              call      #Sector_Load
              mov       sect_num, kernel_sect_2
              call      #SPI_Read
              mov       hub_addr, sector_addr
              mov       cog_addr, #$080
              call      #Sector_Load
              mov       sect_num, kernel_sect_3
              call      #SPI_Read
              mov       hub_addr, sector_addr
              mov       cog_addr, #$100
              call      #Sector_Load
              mov       sect_num, kernel_sect_4
              call      #SPI_Read
              mov       hub_addr, sector_addr
              mov       cog_addr, #$180
              jmp       #Load_Last_Sector
'
'-------------------------------- SPI SD Card Routines -------------------------------

' SPI_Read - send a read request to SD Plugin for execution
' On Entry
'          sector_addr sector buffer
'          sect_num    sector number
'
SPI_Read
              mov     r2,#SD_Read               ' request ... 
              shl     r2,#24                    ' ... read  
              mov     r1,xfer_addr              ' get pointer to xfer block 
              or      r2,r1                     ' construct request
'
              wrlong  sector_addr,r1            ' write first argument to xfer block
              add     r1, #4
              wrlong  sect_num,r1               ' write second argument to xfer block
'
              mov     r0,#LMM_FIL               ' plugin type we want 
'
              mov     ftemp,reg_addr            ' point to registry
              mov     ftmp2,#0                  ' start at cog 0
send1
              cmp     ftmp2,#8 wc,wz            ' run out of plugins?
       if_ae  jmp     #sendErr                  ' yes - no such plugin
              rdlong  ftmp3,ftemp               ' no - check next plugin type
              shr     ftmp3,#24                 ' is it ...
              cmp     ftmp3,r0 wz               ' ... the type what we wanted?
        if_z  jmp     #send2                    ' yes - use this plugin
              add     ftmp2,#1                  ' no ...
              add     ftemp,#4                  ' ... check ...
              jmp     #send1                    ' ... next cog
send2
              mov     r0,ftmp2                  ' use the cog where we found the plugin
              shl     r0,#2                     ' multiply plugin (cog) id by 4 ...
              add     r0,reg_addr               ' add registry base to get registry entry
              rdlong  r0,r0                     ' get request block from registry
              test    r0,top8 wz                ' plugin registered?
        if_z  jmp     #sendErr                  ' no - return error
              and     r0,low24                  ' yes - write request ...
              wrlong  r2,r0                     ' ... to request block
loop2         rdlong  r2,r0   wz                ' wait till ...
        if_nz jmp     #loop2                    ' ... request completed
              mov     r0,#0
              jmp     #sendDone
sendErr                               
              neg     r0,#1                     ' return -1 on any error
              jmp     #sendDone
sendDone
SPI_Read_ret
              ret              
'
Sector_Load
              movd      :dst, cog_addr          ' starting at Cog_Addr ...          
              mov       cog_count, #$80         ' .. load 128 longs (512 bytes)         
:dst          rdlong    0-0, hub_addr           
              add       hub_addr, #4            
              add       :dst, d_inc           
              djnz      cog_count, #:dst        
Sector_Load_ret
              ret              
'
' Common variables
'
top8          long      $FF000000
low24         long      $00FFFFFF
'
r0            long      $0
r1            long      $0
r2            long      $0
r3            long      $0
'
req_addr      long      $0
reg_addr      long      $0
stk_addr      long      $0
file_size     long      $0
clust_shift   long      $0
data_region   long      $0

sect_size     long      FLIST_SSIZ              ' Sector Size
sector_addr   long      FLIST_BUFF              ' Address of sector buffer
list_addr     long      FLIST_ADDRESS           ' Address of sector list
xfer_addr     long      FLIST_XFER              ' Address of xfer block


clust_sects   long      $0                      
clust_size    long      $0

src_addr      long      $0
dst_addr      long      $0
sect_count    long      $0

sect_num      long      $0
sect_off      long      $0

clus_num      long      $0
clus_off      long      $0
'
' temporary storage used in mul & div calculations
'
ftemp         long      $0
ftmp2         long      $0
ftmp3         long      $0
'
kernel_sect_1 long      $0
kernel_sect_2 long      $0
kernel_sect_3 long      $0
kernel_sect_4 long      $0
'
'-------------------------------------------------------------------------------
'
' Load_Last_Sector - This code loads the last sector from the sector
' buffer - once this code is initiated, everything up to ":dst" can be
' overwritten - this code requires that the kernel only use $1e8 .. $1ef
' as uninitialized storage (which is the case in all current LMM Kernels,
' including the threaded kernels). This code is "stand alone" even though
' it is very similar to Sector_Load (above) in order to maximize the amount
' of longs the kernel can occupy (currently $1e8 longs - i.e. $000 .. $1e7). 
'
              fit       $1e5
:dummy        long      0[$1e5-:dummy]              
'
'              
cog_addr      long      $0                      '$1e5
'
Load_Last_Sector
              movd      :dst, cog_addr          '$1e6
              mov       cog_count, #$68         '$1e7  can load up to here
'--------------------------------<<SNIP>>---------------------------------------              
:dst          rdlong    0-0, hub_addr           '$1e8  
              add       hub_addr, #4            '$1e9
              add       :dst, d_inc             '$1ea
              djnz      cog_count, #:dst        '$1eb
              jmp       #0                      '$1ec  now restart this cog
'              
d_inc         long      $200                    '$1ed
hub_addr      long      $0                      '$1ee
cog_count     long      $0                      '$1ef
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
