{{
'-------------------------------------------------------------------------------
' cached.inc - includes the PASM Code for Cached XMM access (all platforms).
'
' Version 3.1 - Initial Version.
' Version 3.3 - Simplify symbol handling.
' Version 3.5 - save some space by not restoring XMM_Src & XMM_Dst - programs
'               should not assume these are preserved by calls to XMM functions!
' Version 3.12 - Only query the cache if the cache line changes. This can easily
'               double the speed of XMM programs, but it means only one XMM 
'               kernel can ever access the cache (since the cache line could be
'               changed by another kernel).
' Version 4.0  - Fixed a problem with the initial value of XMM_Last, which
'               would cause some programs to fail with some cache sizes.
'
' Version 5.6 - Modified for P2. No FLASH support.
'
' Version 7.4 - Add suport for using pins to communicate with cache.
'             - Add support for LUT cache (1k only, requires XMM kernel and
'             - cache to be in the same cog pair).
'             - Add ReadLongPage and WriteLongPage for P2 (note these assume
'               long aligned buffers which are a multiple of 4 bytes long, 
'               but this is currently always the case!)
'-------------------------------------------------------------------------------
'
'    Copyright 2011 Ross Higson
'
'    This file is part of the Catalina Target Package.
'
'    The Catalina Target Package is free software: you can redistribute 
'    it and/or modify it under the terms of the GNU Lesser General Public 
'    License as published by the Free Software Foundation, either version 
'    3 of the License, or (at your option) any later version.
'
'    The Catalina Target Package is distributed in the hope that it will
'    be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
'    of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
'    See the GNU Lesser General Public License for more details.
'
'    You should have received a copy of the GNU Lesser General Public 
'    License along with the Catalina Target Package.  If not, see 
'    <http://www.gnu.org/licenses/>.
'
'------------------------------------------------------------------------------
}}
'------------------------ CACHED SPI XMM Support Routines ----------------------

' we need ReadLong if we need either WritePage or ReadPage:

#ifndef NEED_XMM_READLONG
#ifdef NEED_XMM_WRITEPAGE
#define NEED_XMM_READLONG
#else
#ifdef NEED_XMM_READPAGE
#define NEED_XMM_READLONG
#endif
#endif
#endif

'we need WriteLong if we need WritePage:

#ifndef NEED_XMM_WRITELONG
#ifdef NEED_XMM_WRITEPAGE
#define NEED_XMM_WRITELONG
#endif
#endif

' PARANOID makes the code slower but easier to test (and possibly safer!)

'#define PARANOID


' XMM_Activate : Activate the XMM bus. 
'
' XMM_Tristate : Give up the XMM bus.
            
XMM_Activate
XMM_Tristate
              tjnz .XMM_Msk,#.XMM_Activate_done  ' nothing to do if mask already set up
              mov .XMM_Msk,#CACHE_COG*4          ' point to cache cog ...
              add .XMM_Msk,reg                   ' ... registry entry ...
              rdlong .XMM_Msk,.XMM_Msk           ' ... and then its request block
              rdlong .XMM_Msk,.XMM_Msk           ' load the CACHE_LINE_MASK to use
#ifdef CACHE_PINS
              dirh    #CACHE_CMD_PIN             ' set dir of CACHE_CMD_PIN pin to output
              dirl    #CACHE_RSP_PIN             ' set dir of CACHE_RSP_PIN pin to input
              wrpin   #CACHE_PIN_MODE,#CACHE_CMD_PIN ' set mode of CACHE_CMD_PIN pin 
              wrpin   #CACHE_PIN_MODE,#CACHE_RSP_PIN ' set mode of CACHE_RSP_PIN pin
#endif
.XMM_Activate_done
              ret

#ifdef NEED_XMM_READLONG              

' XMM_ReadLong : Read long from XMM at address in XMM_Addr into the destination register
'                set up in XMM_Dest. XMM_Activate should be called at least once before
'                this routine is used.
' On entry:
'    XMM_Addr : address to read (up to 30 bits)
'    XMM_Dst  : destination of this instruction set to destination register
' On exit:
'    Destination register contains long read from XMM.
'    XMM_Addr incremented by 4.

XMM_ReadLong
              mov     .XMM_Tmp2,XMM_Addr         ' same page ...
              andn    .XMM_Tmp2,.XMM_Msk         ' ... as last ...
              sub     .XMM_Tmp2,.XMM_Last        ' ... read/written?
              tjz     .XMM_Tmp2,#.ReadLong_Line2 ' yes - already in Hub
              mov     .XMM_Tmp1,XMM_Addr         ' no - get the address to read
              andn    .XMM_Tmp1,#CACHE_CMD_MASK  ' set command ...
              or      .XMM_Tmp1,#CACHE_READ_CMD  ' ... to READ
#ifdef CACHE_PINS
              wxpin   .XMM_Tmp1,#CACHE_CMD_PIN
              muxc    .XMM_Tmp3,#1               ' MUST SAVE WC
.ReadLong_Wait2
              testp   #CACHE_RSP_PIN wc  
       if_nc  jmp     #.ReadLong_Wait2
              shr     .XMM_Tmp3,#1 wc            ' MUST RESTORE WC
              rdpin   .XMM_Line,#CACHE_RSP_PIN
#else
              wrlong  .XMM_Tmp1,##XMM_CACHE_CMD  ' issue the command
.ReadLong_Wait              
              rdlong  .XMM_Tmp3,##XMM_CACHE_CMD  ' wait till ...
              tjnz    .XMM_Tmp3,#.ReadLong_Wait  ' ... command completes
              rdlong  .XMM_Line,##XMM_CACHE_RSP  ' get cache line address
#endif
.ReadLong_Line
              mov     .XMM_Last,XMM_Addr         ' save page ...
              andn    .XMM_Last,.XMM_Msk         ' ... as last read
.ReadLong_Line2
              mov     .XMM_Tmp2,XMM_Addr         ' calculate ...
              and     .XMM_Tmp2,.XMM_Msk         ' ... the ...
#ifdef USE_LUT
#if defined(LUT_CACHE)
              mov     .XMM_Tmp1,.XMM_Line
              add     .XMM_Tmp1,.XMM_Tmp2        ' ... Hub cache address
              andn    .XMM_Tmp1,#3               ' read only on long boundary!
              sub     .XMM_Tmp1,##XMM_CACHE      ' convert Hub cache addr ...
              and     .XMM_Tmp1,.XMM_LutMsk
              shr     .XMM_Tmp1,#2               ' ... to LUT address (in longs)
XMM_Dst       rdlut   0-0,.XMM_Tmp1              ' read long from LUT to dst
#else
              shr     .XMM_Tmp2,#2               ' ... to LUT address (in longs)
XMM_Dst       rdlut   0-0,.XMM_Tmp2              ' read long from LUT to dst
#endif
#else
              mov     .XMM_Tmp1,.XMM_Line
              add     .XMM_Tmp1,.XMM_Tmp2        ' ... Hub cache address
              andn    .XMM_Tmp1,#3               ' read only on long boundary!
XMM_Dst       rdlong  0-0,.XMM_Tmp1              ' read long from Hub to dst
#endif
 _ret_        add      XMM_Addr,#4               ' update XMM_Addr


' XMM_ReadMult : Read multiple bytes in source register to XMM at address XMM_Addr.
'                XMM_Activate should be called at least once before this routine is used.
' On entry:
'    XMM_Addr : address to read (up to 30 bits)
'    XMM_Dst  : destination of this instruction set to destination register
'    XMM_Len  : number of bytes to read (usually 1, 2 or 4)
' On exit:
'    Destination register contains bytes read from XMM.
'    XMM_Addr incremented by XMM_Len.
'
' NOTE : IN THE CACHED DRIVER, ALL THE BYTES MUST BE IN THE SAME LONG !!!

XMM_ReadMult
              mov     .XMM_Tmp1,XMM_Dst          ' get ...
              shr     .XMM_Tmp1,#9               ' ... dst register ...
              setd    .XMM_Dst2,.XMM_Tmp1        ' set as reg to be shifted ...
#ifdef PARANOID              
              setd    .XMM_Dst3,.XMM_Tmp1        ' ... and register to be masked
#endif              
              call    #XMM_ReadLong              ' read long containing bytes
              sub     XMM_Addr,#4                ' correct XMM_Addr
              mov     .XMM_Tmp1,XMM_Addr         ' calculate ...
              and     .XMM_Tmp1,#CACHE_CMD_MASK  ' ... offset of bytes
              shl     .XMM_Tmp1,#3               ' convert to no of bits to shift
.XMM_Dst2     shr     0-0,.XMM_Tmp1             ' put bytes in correct place
#ifdef PARANOID
              mov     .XMM_Tmp1,XMM_Len          ' calculate mask ...
              shl     .XMM_Tmp1,#2               ' ... for the bytes we want
              neg     .XMM_Tmp2,#1               ' set up ...
              shl     .XMM_Tmp2,.XMM_Tmp1        ' ... the mask we need ...
              shl     .XMM_Tmp2,.XMM_Tmp1        ' ... (avoid shifting by 32!)
.XMM_Dst3     andn    0-0,.XMM_Tmp2              ' mask out unwanted bytes
#endif
 _ret_        add     XMM_Addr,XMM_Len           ' update XMM_Addr

#endif          

#ifdef NEED_XMM_WRITELONG

' XMM_WriteLong : Write long in source register to XMM at address XMM_Addr.
' On entry:
'    XMM_Addr : (32-bit) address to write (up to 30 bits)
'    XMM_Src  : source of this instruction set to source register
' On exit:
'    XMM_Addr incremented by 4.

XMM_WriteLong
              setd    .XMM_Src1,XMM_Src          ' set src reg as dst reg for hub write
#ifdef USE_LUT
              setd    .XMM_Src2,XMM_Src          ' set src reg as dst reg for LUT write
#endif
              mov     .XMM_Last,XMM_Addr         ' save page ...
              andn    .XMM_Last,.XMM_Msk         ' ... as last read/written
              mov     .XMM_Tmp1,XMM_Addr         ' get the address to write
              andn    .XMM_Tmp1,#CACHE_CMD_MASK  ' set command ...
              or      .XMM_Tmp1,#CACHE_WRITE_CMD ' ... to WRITE
#ifdef CACHE_PINS
              wxpin   .XMM_Tmp1,#CACHE_CMD_PIN
              muxc    .XMM_Tmp3,#1               ' MUST SAVE WC
.WriteLong_Wait2
              testp   #CACHE_RSP_PIN wc                '
       if_nc  jmp     #.WriteLong_Wait2
              shr     .XMM_Tmp3,#1 wc            ' MUST RESTORE WC
              rdpin   .XMM_Line,#CACHE_RSP_PIN
#else
              wrlong  .XMM_Tmp1,##XMM_CACHE_CMD  ' issue the command
.WriteLong_Wait              
              rdlong  .XMM_Tmp1,##XMM_CACHE_CMD  ' wait till ...
              tjnz    .XMM_Tmp1,#.WriteLong_Wait ' ... command completes
              rdlong  .XMM_Line,##XMM_CACHE_RSP  ' get response (cache line address)
#endif
              mov     .XMM_Tmp2,XMM_Addr         ' calculate ...
              and     .XMM_Tmp2,.XMM_Msk         ' ... the ...
              mov     .XMM_Tmp1,.XMM_Line
              add     .XMM_Tmp1,.XMM_Tmp2        ' ... address
              andn    .XMM_Tmp1,#3               ' write only on long boundary!
.XMM_Src1     wrlong   0-0,.XMM_Tmp1             ' write long from src to Hub  
#ifdef USE_LUT
#if defined(LUT_CACHE)
              sub     .XMM_Tmp1,##XMM_CACHE      ' convert Hub cache addr ...
              and     .XMM_Tmp1,.XMM_LutMsk
              shr     .XMM_Tmp1,#2              ' ... to LUT address (in longs)
.XMM_Src2     wrlut   0-0,.XMM_Tmp1             ' write long from src to LUT
#else
              shr     .XMM_Tmp2,#2               ' ... to LUT address (in longs)
.XMM_Src2     wrlut   0-0,.XMM_Tmp2              ' write long from src to LUT
#endif
#endif
 _ret_        add      XMM_Addr,#4               ' update XMM_Addr

XMM_Src       long    0                          ' temp storage of src register              

' XMM_WriteMult : Write multiple bytes in source register to XMM at address XMM_Addr.
'                 XMM_Activate should be called at least once before this routine is used.
' On entry:
'    XMM_Addr : address to write (up to 30 bits)
'    XMM_Src  : source of this instruction set to source register
'    XMM_Len  : number of bytes to write (usually 1, 2 or 4)
' On exit:
'    XMM_Addr incremented by XMM_Len.
'
' NOTE : IN THE CACHED DRIVER, ALL THE BYTES MUST BE IN THE SAME LONG !!!
'
' NOTE : DESTROYS XMM_Dst & XMM_Src !!!

XMM_WriteMult
              setd    XMM_Dst,#.XMM_Tmp4         ' read the long ...
              call    #XMM_ReadLong              ' ... containing the bytes we want
              sub     XMM_Addr,#4                ' correct XMM_Addr
              setd    .XMM_Src2,XMM_Src          ' set src reg as dst to mask ...
              sets    .XMM_Src3,XMM_Src          ' ... and as src to include
              mov     .XMM_Tmp2,XMM_Addr         ' calculate ...
              and     .XMM_Tmp2,#CACHE_CMD_MASK  ' ... offset of bytes we want
              shl     .XMM_Tmp2,#3               ' convert to number of bits to shift
              mov     .XMM_Tmp1,XMM_Len          ' calculate mask ...
              shl     .XMM_Tmp1,#2               ' ... for the bytes we must replace
              neg     .XMM_Tmp3,#1               ' set up ...
              shl     .XMM_Tmp3,.XMM_Tmp1        ' ... the mask ...
              shl     .XMM_Tmp3,.XMM_Tmp1        ' ... we need (avoid shifting by 32!)
              ror     .XMM_Tmp4,.XMM_Tmp2        ' move bytes to be replaced to LS bytes
              and     .XMM_Tmp4,.XMM_Tmp3        ' mask out bytes to be replaced
.XMM_Src2     andn    0-0,.XMM_Tmp3              ' or in ...
.XMM_Src3     or      .XMM_Tmp4,0-0              ' ... replacement bytes
              rol     .XMM_Tmp4,.XMM_Tmp2        ' put bytes back to correct place
              sets    XMM_Src,#.XMM_Tmp4         ' write the long ...
              call    #XMM_WriteLong             ' ... containing the replaced bytes 
              sub     XMM_Addr,#4                ' correct XMM_Addr
 _ret_        add     XMM_Addr,XMM_Len           ' update XMM_Addr

#endif          

#ifdef NEED_XMM_WRITEPAGE              
'
' XMM_WritePage : Write bytes from Hub RAM to XMM RAM
' On entry:
'    XMM_Addr  (32-bit): destination address in sram, 30-bits used
'    Hub_Addr  (32-bit): source address in main memory, 16-bits used
'    XMM_Len   (32-bit): number of bytes to write. 
'
' NOTE : IF PAGE IS A LONG ALIGNED MULTIPLE OF 4 BYTES, USE XMM_WritePageLong
'
' NOTE : Destroys XMM_Src !!!

XMM_WritePage
              mov     .XMM_Tmp6,XMM_Len          ' save length
              mov     XMM_Len,#1                 ' we write one byte at a time
.WriteLoop
              rdbyte  .XMM_Tmp5,Hub_Addr         ' read byte from source (Hub)
              add     Hub_Addr,#1                ' inc source address
              sets    XMM_Src,#.XMM_Tmp5         ' use this as temp byte
              call    #XMM_WriteMult             ' write byte to sram (this updates XMM_Addr)
              djnz    .XMM_Tmp6,#.WriteLoop      ' repeat till all bytes written
              ret

' As above, except we assume the page consists of longs rather than byes, so:
'    - it is long aligned; and
'    - the length is a multiple of 4 (bytes)
XMM_WriteLongPage
              mov     .XMM_Tmp6,XMM_Len          ' save length
              shr     .XMM_Tmp6,#2               ' we write longs
.WriteLoopLong
              rdlong  .XMM_Tmp5,Hub_Addr         ' read long from source (Hub)
              add     Hub_Addr,#4                ' inc source address
              sets    XMM_Src,#.XMM_Tmp5         ' use this as temp byte
              call    #XMM_WriteLong             ' write long to sram (this updates XMM_Addr)
              djnz    .XMM_Tmp6,#.WriteLoopLong  ' repeat till all longs written
              ret

#endif          

#ifdef NEED_XMM_READPAGE              

' XMM_ReadPage : Read bytes from XMM RAM to Hub RAM.
' On Entry: 
'    XMM_Addr  (32-bit): source address in sram, 30-bits used
'    Hub_Addr  (32-bit): destination address in main memory, 16-bits used
'    XMM_Len   (32-bit): number of bytes to read. 
'
' NOTE : IF PAGE IS A LONG ALIGNED MULTIPLE OF 4 BYTES, USE XMM_ReadPageLong
'
' NOTE : DESTROYS XMM_Dst !!!

XMM_ReadPage
              mov     .XMM_Tmp6,XMM_Len          ' save length
              mov     XMM_Len,#1                 ' we read one byte at a time
.ReadLoop
              setd    XMM_Dst,#.XMM_Tmp5         ' use this as temp byte
              call    #XMM_ReadMult              ' read byte from sram
              wrbyte  .XMM_Tmp5,Hub_Addr         ' write byte to destination (Hub)
              add     Hub_Addr,#1                ' inc dest address (this updates XMM_Addr)
              djnz    .XMM_Tmp6,#.ReadLoop       ' repeat till all bytes read
              ret
'
' As above, except we assume the page consists of longs rather than byes, so:
'    - it is long aligned; and
'    - the length is a multiple of 4 (bytes)
XMM_ReadLongPage
              mov     .XMM_Tmp6,XMM_Len          ' save length
              shr     .XMM_Tmp6,#2              ' we read longs
.ReadLoopLong
              setd    XMM_Dst,#.XMM_Tmp5         ' use this as temp long
              call    #XMM_ReadLong              ' read long from sram
              wrlong  .XMM_Tmp5,Hub_Addr         ' write byte to destination (Hub)
              add     Hub_Addr,#4                ' inc dest address (this updates XMM_Addr)
              djnz    .XMM_Tmp6,#.ReadLoopLong   ' repeat till all longs read
              ret

#endif

' local variables:

.XMM_Tmp1      long      $0
.XMM_Tmp2      long      $0
.XMM_Tmp3      long      $0
.XMM_Tmp4      long      $0
.XMM_Tmp5      long      $0
.XMM_Tmp6      long      $0
.XMM_Line      long      $0
.XMM_Last      long      -1     ' should be an invalid address
.XMM_Msk       long      $0     ' now set up on first Activate
#ifdef USE_LUT
.XMM_LutMsk    long      (1<<CACHE_BYTES_LOG2) - 1
#endif

