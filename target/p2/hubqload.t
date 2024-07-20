{{
'-------------------------------------------------------------------------------
'
' Catalina_HUB_QUICK_Loader - HUB Quick Loader for use in conjunction with the 
'                             Catalina code generator backend to LCC
'
' Note this loader assumes the Catalina image is already in Hub RAM at
' address $10000. It supports layouts 0, 8 and 11. 
' All it does is transfer data from the prologue information from the compiled 
' program code (at $10000) to where the program expects to find it. 
'
' Version 7.1 - First Propeller 2 version.
'
'-------------------------------------------------------------------------------
}}
DAT
        org    0

HUB_QUICK_LOAD_START
        jmp #\HUB_QUICK_LOAD_START_2  ' $00
        long 0[$02]                   ' $01 .. $02
_hbrk   long 0                        ' $03 Hub sbrk (for LARGE programs)
        long 0                        ' $04
_cfreq  long _CLOCKFREQ               ' $05
_cmode  long _CLOCKMODE               ' $06
_baud   long _BAUDRATE                ' $07
        long 0[$52]                   ' $08 .. $59
HUB_QUICK_LOAD_START_2                ' $5a
        mov     reg,##REGISTRY        ' 'reg' must point to registry
        hubset  #$F0          
        hubset  ##_CLOCKINIT 
        waitx   ##_CLOCKWAIT
        mov     r0,##_CLOCKMODE
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
        rdlong  .pc,##@init_PC        ' write PC to Hub RAM
        wrlong  .pc,##@.pc            ' write PC to Hub RAM
        rdlong .arg1,##ARGC_ADDR      ' get arg1 (argc)
        wrlong .arg1,##@.arg1         ' write arg1 to Hub
        rdlong .arg2,##ARGV_ADDR      ' get arg2 (argv)
        wrlong .arg2,##@.arg2         ' write arg2  to Hub

        ' Restart oursevles as the NMM Kernel (note the following code is
        ' intended to reproduce what the P2 boot code does when it executes
        ' a program it just loaded into RAM ...
        mov     .t1,##@KERNEL_START
        setint1 #0
        mov     dira,#0
        mov     dirb,#0
        'wrpin   #0,#62 ' but don't ...
        'wrpin   #0,#63 ' ... do this - it disrupts the serial HMI!
        cogid   .t0
        setq    ##@.rg
        coginit .t0,.t1

' local variables
.t0           long      $0
.t1           long      $0
.t2           long      $0

' the layout of these has to remain as is (and match nmm.t):
.rg           long      REGISTRY
.pc           long      init_PC      ' will be overwritten later 
.sp           long      0                       ' 
.lsize        long      LUT_LIBRARY_END - LUT_LIBRARY - 1
.laddr        long      @LUT_LIBRARY            ' 
.arg1         long      0                       ' 
.arg2         long      0                       ' 

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
