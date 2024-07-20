{{
'-------------------------------------------------------------------------------
' Cached_XMM.inc - includes the PASM Code for Cached XMM access (all platforms).
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
'
' We need XMM RAM support if we are using the LARGE memory model, or if 
' we are using the SMALL memory model but FLASH support is not enabled
'
#ifdef LARGE
#ifndef NEED_RAM
#define NEED_RAM
#endif
#else
#ifndef FLASH
#define NEED_RAM
#endif
#endif
'
' we need ReadLong if we need either WritePage or ReadPage:
'
#ifndef NEED_XMM_READLONG
#ifdef NEED_XMM_WRITEPAGE
#define NEED_XMM_READLONG
#elseifdef NEED_XMM_READPAGE
#define NEED_XMM_READLONG
#endif
#endif
'
'we need WriteLong if we need WritePage:
'
#ifndef NEED_XMM_WRITELONG
#ifdef NEED_XMM_WRITEPAGE
#define NEED_XMM_WRITELONG
#endif
#endif
'
' PARANOID makes the code slower but easier to test (and possibly safer!)
'
'#define PARANOID

'
' XMM_Activate : Activate the XMM bus. 
'
'XMM_Tristate : Give up the XMM bus.
'            
XMM_Activate
XMM_Tristate
              nop                               ' nothing (TBD!)
XMM_Activate_ret      
XMM_Tristate_ret
              ret

#ifdef NEED_XMM_READLONG              
'
' XMM_ReadLong : Read long from XMM at address in XMM_Addr into the destination register
'                set up in XMM_Dest. XMM_Activate should be called at least once before
'                this routine is used.
' On entry:
'    XMM_Addr : address to read (up to 30 bits)
'    XMM_Dst  : destination of this instruction set to destination register
' On exit:
'    Destination register contains long read from XMM.
'    XMM_Addr incremented by 4.
'
XMM_ReadLong
              mov     XMM_Tmp1,XMM_Addr         ' get the address to read
              mov     XMM_Tmp2,XMM_Addr         ' same page ...
              andn    XMM_Tmp2,XMM_Msk          ' ... as last ...
              sub     XMM_Tmp2,XMM_Last         ' ... read/written?
              tjz     XMM_Tmp2,#:ReadLong_Line  ' yes - already in Hub
              andn    XMM_Tmp1,#Common#CACHE_CMD_MASK  ' no set command ...
              or      XMM_Tmp1,#Common#CACHE_READ_CMD  ' ... to READ
              wrlong  XMM_Tmp1,XMM_Cmd          ' issue the command
:ReadLong_Wait              
              rdlong  XMM_Tmp1,XMM_Cmd          ' wait till ...
              tjnz    XMM_Tmp1,#:ReadLong_Wait  ' ... command completes
              rdlong  XMM_Line,XMM_Rsp          ' get cache line address
:ReadLong_Line
              mov     XMM_Last,XMM_Addr         ' save page ...
              andn    XMM_Last,XMM_Msk          ' ... as last read
              mov     XMM_Tmp1,XMM_Line         ' get the last line address
              mov     XMM_Tmp2,XMM_Addr         ' calculate ...
              and     XMM_Tmp2,XMM_Msk          ' ... the address ...
              add     XMM_Tmp1,XMM_Tmp2         ' ... within the line
XMM_Dst       rdlong  0-0,XMM_Tmp1              ' read long from address to dst
              add     XMM_Addr,#4               ' update XMM_Addr
XMM_ReadLong_ret
              ret

'
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
'
XMM_ReadMult
              mov     XMM_Tmp1,XMM_Dst          ' get ...
              shr     XMM_Tmp1,#9               ' ... dst register ...
              movd    XMM_Dst2,XMM_Tmp1         ' set as reg to be shifted ...
#ifdef PARANOID              
              movd    XMM_Dst3,XMM_Tmp1         ' ... and register to be masked
#endif              
              call    #XMM_ReadLong             ' read long containing bytes
              sub     XMM_Addr,#4               ' correct XMM_Addr
              mov     XMM_Tmp1,XMM_Addr         ' calculate ...
              and     XMM_Tmp1,#Common#CACHE_CMD_MASK ' ... offset of bytes
              shl     XMM_Tmp1,#3               ' convert to no of bits to shift
XMM_Dst2      shr     0-0,XMM_Tmp1              ' put bytes in correct place
#ifdef PARANOID
              mov     XMM_Tmp1,XMM_Len          ' calculate mask ...
              shl     XMM_Tmp1,#2               ' ... for the bytes we want
              neg     XMM_Tmp2,#1               ' set up ...
              shl     XMM_Tmp2,XMM_Tmp1         ' ... the mask we need ...
              shl     XMM_Tmp2,XMM_Tmp1         ' ... (avoid shifting by 32!)
XMM_Dst3      andn    0-0,XMM_Tmp2              ' mask out unwanted bytes
#endif
              add     XMM_Addr,XMM_Len          ' update XMM_Addr
XMM_ReadMult_ret
              ret
'
#endif          
'
#ifdef NEED_XMM_WRITELONG
'
' XMM_WriteLong : Write long in source register to XMM at address XMM_Addr.
' On entry:
'    XMM_Addr : (32-bit) address to write (up to 30 bits)
'    XMM_Src  : source of this instruction set to source register
' On exit:
'    XMM_Addr incremented by 4.
'
XMM_WriteLong
              movd    XMM_Src1,XMM_Src          ' set src reg as dst reg for hub write
              mov     XMM_Tmp1,XMM_Addr         ' get the address to write
              mov     XMM_Last,XMM_Addr         ' save page ...
              andn    XMM_Last,XMM_Msk          ' ... as last read/written
              andn    XMM_Tmp1,#Common#CACHE_CMD_MASK   ' set command ...
              or      XMM_Tmp1,#Common#CACHE_WRITE_CMD  ' ... to WRITE
              wrlong  XMM_Tmp1,XMM_CMD          ' issue the command
:WriteLong_Wait              
              rdlong  XMM_Tmp1,XMM_Cmd          ' wait till ...
              tjnz    XMM_Tmp1,#:WriteLong_Wait ' ... command completes
              rdlong  XMM_Line,XMM_Rsp          ' get response (cache line address)
              mov     XMM_Tmp1,XMM_Line
              mov     XMM_Tmp2,XMM_Addr         ' calculate ...
              and     XMM_Tmp2,XMM_Msk          ' ... the ...
              add     XMM_Tmp1,XMM_Tmp2         ' ... address
XMM_Src1      wrlong  0-0,XMM_Tmp1              ' write src register to that address 
              add     XMM_Addr,#4               ' update XMM_Addr
XMM_WriteLong_ret
              ret
XMM_Src       long    0                         ' temp storage of src register              
'
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
'
XMM_WriteMult
              movd    XMM_Dst,#XMM_Tmp4         ' read the long ...
              call    #XMM_ReadLong             ' ... containing the bytes we want
              sub     XMM_Addr,#4               ' correct XMM_Addr
              movd    XMM_Src2,XMM_Src          ' set src reg as dst to mask ...
              movs    XMM_Src3,XMM_Src          ' ... and as src to include
              mov     XMM_Tmp2,XMM_Addr         ' calculate ...
              and     XMM_Tmp2,#Common#CACHE_CMD_MASK ' ... offset of bytes we want
              shl     XMM_Tmp2,#3               ' convert to number of bits to shift
              mov     XMM_Tmp1,XMM_Len          ' calculate mask ...
              shl     XMM_Tmp1,#2               ' ... for the bytes we must replace
              neg     XMM_Tmp3,#1               ' set up ...
              shl     XMM_Tmp3,XMM_Tmp1         ' ... the mask ...
              shl     XMM_Tmp3,XMM_Tmp1         ' ... we need (avoid shifting by 32!)
              ror     XMM_Tmp4,XMM_Tmp2         ' move bytes to be replaced to LS bytes
              and     XMM_Tmp4,XMM_Tmp3         ' mask out bytes to be replaced
XMM_Src2      andn    0-0,XMM_Tmp3              ' or in ...
XMM_Src3      or      XMM_Tmp4,0-0              ' ... replacement bytes
              rol     XMM_Tmp4,XMM_Tmp2         ' put bytes back to correct place
              movs    XMM_Src,#XMM_Tmp4         ' write the long ...
              call    #XMM_WriteLong            ' ... containing the replaced bytes 
              sub     XMM_Addr,#4               ' correct XMM_Addr
              add     XMM_Addr,XMM_Len          ' update XMM_Addr
'
XMM_WriteMult_ret
              ret
'XMM_Dst4      long    $0                        ' temp storage for XMM_Dst
'
#endif          
'
#ifdef NEED_XMM_WRITEPAGE              
'
' XMM_WritePage : Write bytes from Hub RAM to XMM RAM
' On entry:
'    XMM_Addr  (32-bit): destination address in sram, 30-bits used
'    Hub_Addr  (32-bit): source address in main memory, 16-bits used
'    XMM_Len   (32-bit): number of bytes to write. 
'
' NOTE : THIS IS A BRAIN-DEAD IMPLEMENTATION THAT SHOULD BE REVISED 
'        TO READ AND WRITE LONGS WHEN WE HAVE ENOUGH SPACE !!!
'
' NOTE : Destroys XMM_Src
'
XMM_WritePage
              mov     XMM_Tmp6,XMM_Len          ' save length
:WriteLoop
              rdbyte  XMM_Tmp5,Hub_Addr         ' read byte from source (Hub)
              add     Hub_Addr,#1               ' inc source address
              movs    XMM_Src,#XMM_Tmp5         ' use this as temp byte
              mov     XMM_Len,#1                ' we write one byte at a time
              call    #XMM_WriteMult            ' write byte to sram
              djnz    XMM_Tmp6,#:WriteLoop      ' repeat till all bytes written
XMM_WritePage_ret
              ret
'
#endif          
'
#ifdef NEED_XMM_READPAGE              
'
' XMM_ReadPage : Read bytes from XMM RAM to Hub RAM.
' On Entry: 
'    XMM_Addr  (32-bit): source address in sram, 30-bits used
'    Hub_Addr  (32-bit): destination address in main memory, 16-bits used
'    XMM_Len   (32-bit): number of bytes to read. 
'
' NOTE : THIS IS A BRAIN-DEAD IMPLEMENTATION THAT SHOULD BE REVISED 
'        TO READ AND WRITE LONGS WHEN WE HAVE ENOUGH SPACE !!!
'
' NOTE : DESTROYS XMM_Dst !!!
'
XMM_ReadPage
              mov     XMM_Tmp6,XMM_Len          ' save length
:ReadLoop
              movd    XMM_Dst,#XMM_Tmp5         ' use this as temp byte
              mov     XMM_Len,#1                ' we read one byte at a time
              call    #XMM_ReadMult             ' read byte from sram
              wrbyte  XMM_Tmp5,Hub_Addr         ' write byte to destination (Hub)
              add     Hub_Addr,#1               ' inc dest address
              djnz    XMM_Tmp6,#:ReadLoop       ' repeat till all bytes read
XMM_ReadPage_ret
              ret
'
#endif
'
' XMM variables
'
XMM_Tmp1      long      $0
XMM_Tmp2      long      $0
XMM_Tmp3      long      $0
XMM_Tmp4      long      $0
XMM_Tmp5      long      $0
XMM_Tmp6      long      $0
'
XMM_Line      long      $0
XMM_Last      long      -1
'
XMM_Cmd       long      Common#XMM_CACHE_CMD
XMM_Rsp       long      Common#XMM_CACHE_RSP
XMM_Msk       long      Common#CACHE_LINE_MASK
'
'------------------------ CODE USED BY FLASH LOADERS ---------------------------
'
#ifdef NEED_XMM_FLASHERASE
#ifndef NEED_XMM_FLASH_COMMAND
#define NEED_XMM_FLASH_COMMAND
#endif
#endif
'
#ifdef NEED_XMM_FLASHBLOCK
#ifndef NEED_XMM_FLASH_COMMAND
#define NEED_XMM_FLASH_COMMAND
#endif
#endif
'
#ifdef NEED_XMM_FLASHWRITE
#ifndef NEED_XMM_FLASH_COMMAND
#define NEED_XMM_FLASH_COMMAND
#endif
#endif
'
#ifdef NEED_XMM_FLASHERASE
'
' XMM_FlashErase : Erase ALL of the Flash RAM
' On Entry:
'    None.
' On Exit:
'    XMM_Len contains result of command.
'
XMM_FlashErase
              mov     XMM_Tmp1,#Common#CACHE_ERASE_CHIP_CMD  ' set command
#endif
'
#ifdef NEED_XMM_FLASH_COMMAND
'
XMM_Flash_Cmd
              wrlong  XMM_Tmp1,XMM_Cmd          ' issue the command
XMM_Flash_Wait              
              rdlong  XMM_Tmp1,XMM_Cmd          ' wait till ...
              tjnz    XMM_Tmp1,#XMM_Flash_Wait  ' ... command completes
              rdlong  XMM_Len,XMM_Rsp           ' read result of command
XMM_FlashErase_ret
XMM_FlashBlock_ret
XMM_FlashWrite_ret
              ret
'
#endif
'
#ifdef NEED_XMM_FLASHBLOCK
'
' XMM_FlashBlock : Erase a 4k Block of Flash RAM
' On Entry:
'    XMM_Addr (32 bit): zero-based offset in FLASH to erase (24 bits used).
' On Exit:
'    XMM_Len contains result of command.
'
XMM_FlashBlock
              mov     XMM_Tmp1,XMM_Addr         ' put address to erase ...
              shl     XMM_Tmp1,#8               ' ... in command
              or      XMM_Tmp1,#Common#CACHE_ERASE_BLOCK_CMD  ' set command
              jmp     #XMM_Flash_Cmd
'
#endif
'
#ifdef NEED_XMM_FLASHWRITE
'
' XMM_FlashWrite : Write to Flash RAM
' On Entry:
'    Hub_Addr (32 bit): Pointer to a 3-long structure in Hub RAM:
'                       buff (LONG): address of Hub RAM buffer containing data
'                       size (LONG): number of bytes to write
'                       offs (LONG): offset in FLASH to write (24 bits used)
' On Exit:
'    XMM_Len contains result of command.
'
'
XMM_FlashWrite
              mov     XMM_Tmp1,Hub_Addr         ' put address of structure ...
              shl     XMM_Tmp1,#8               ' ... in command
              or      XMM_Tmp1,#Common#CACHE_WRITE_DATA_CMD  ' set command
              jmp     #XMM_Flash_Cmd
'
#endif

