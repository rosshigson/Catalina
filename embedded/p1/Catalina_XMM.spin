{{
'-------------------------------------------------------------------------------
'
' Catalina_XMM - Implements an External Memory Model (XMM) Kernel intended
'                for use by the Catalina Code Generator backend for LCC
'
' This kernel has no internal floating point support - the
' floating point routines are sent off to the Float32A plugin.
'
' Version 1.0 - initial version - by Ross Higson
' Version 1.1 - modified for extended addressing
' Version 1.2 - this is now the actual kernel used by XMM programs
' Version 1.3 - Add Morpheus Support
' Version 2.5 - Add Pullmoll's new f_d32s routine, move debug vectors,
'               add RamBlade support and minor tweaks to XMM code. 
' Version 3.0 - Add SPI FLASH support.
' Version 3.0.2 - Fix a bug in the plugin search algorithm (it stopped 
'               when the plugin type = 8, not when cog number = 8!).
' Version 3.5 - Minor virtual machine changes (e.g. load_i replaced load_a)
'             - Tidy up initialization (no longer need to pass stack) 
'             - stop offsets from changing if SHARED_XMM defined.
' Version 3.6 - New smaller image format. 
'               New smaller division.
' Version 3.11 - Modified to fix 'order of compilation' issue with spinnaker.
'
' Version 3.14 - Add support for executing XMM from EEPROM (XEPROM).
'
'------------------------------------------------------------------------------
'
'    Copyright 2009 Ross Higson
'
'    The portion of this file identified as the XMM Kernel is part of the 
'    Catalina Target Package.
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

CON
'
' Set up Proxy, HMI and CACHE symbols and constants:
'
#include "Constants.inc"
'
' if SPI FLASH is in use we need to adjust the CS used by the kernel
'
#ifdef FLASH
#define ADJUST_CS
#endif
'
' The symbol EXTERNAL_FLT_CMP forces the flt_cmp operation to the external
' FLOAT32_A plugin. This is because the new kernel is slightly larger than
' the old, so on some platforms, adding the necessary XMM code makes the 
' kernel too large. By default, this symbol is enabled only for LARGE mode. 
' Undefine this symbol if you have enough space on a particular platform.
'
#ifdef LARGE
#define EXTERNAL_FLT_CMP
#endif
'
OBJ

  common :  "Catalina_Common"
  
PUB Entry_Addr : addr

   addr := @entry ' Kernel Entry Address

PUB Start : cog | i

  cog := cognew(@entry, Common#REGISTRY)

'     
DAT
        org 0
entry
'
'--------------------- Start of XMM Kernel ------------------------------------
'
        jmp #INIT               '$00
'
'------------------------------------------------------------------------------
'
' NOTE this location rerseved for POD, but POD not supported for XMM kernel
'
XMM_Reg long 0                  '$01 
'                          
'------------------------------------------------------------------------------
'
INIT    jmp #lmm_init           '$02
LODL    jmp #load_l             '$03
LODI    jmp #load_i             '$04
LODF    jmp #fp_ind             '$05
PSHL    jmp #push_l             '$06
PSHB    jmp #push_b             '$07
CPYB    jmp #copy_b             '$08
NEWF    jmp #new_fp             '$09
RETF    jmp #fp_ret             '$0a
CALA    jmp #f_call             '$0b
RETN    jmp #f_ret              '$0c
CALI    jmp #f_cali             '$0d
JMPA    jmp #f_jump             '$0e
JMPI    jmp #f_jmpi             '$0f
DIVS    jmp #f_d32s             '$10
DIVU    jmp #f_d32u             '$11
MULT    jmp #f_m32              '$12
BR_Z    jmp #bra_z              '$13
BRNZ    jmp #bra_nz             '$14
BRAE    jmp #bra_ae             '$15
BR_A    jmp #bra_a              '$16
BRBE    jmp #bra_be             '$17
BR_B    jmp #bra_b              '$18
SYSP    jmp #plugin             '$19
PSHA    jmp #push_a             '$1a
FADD    jmp #flt_add            '$1b
FSUB    jmp #flt_sub            '$1c
FMUL    jmp #flt_mul            '$1d
FDIV    jmp #flt_div            '$1e
FCMP    jmp #flt_cmp            '$1f
FLIN    jmp #flt_int            '$20
INFL    jmp #int_flt            '$21
PSHM    jmp #push_m             '$22
POPM    jmp #pop_m              '$23
PSHF    jmp #push_i             '$24
RLNG    jmp #rd_long            '$25
RWRD    jmp #rd_word            '$26
RBYT    jmp #rd_byte            '$27
WLNG    jmp #wr_long            '$28
WWRD    jmp #wr_word            '$29
WBYT    jmp #wr_byte            '$2a
'                                   
PC      long 0                  '$2b
SP      long 0                  '$2c
FP      long 0                  '$2d
RI      long 0                  '$2e
BC      long 0                  '$2f
BA      long 0                  '$30
BZ      long 0                  '$31
CS      long 0                  '$32
'                              
r0      long 0                  '$33
r1      long 0                  '$34
r2      long 0                  '$35
r3      long 0                  '$36
r4      long 0                  '$37
r5      long 0                  '$38
r6      long 0                  '$39
r7      long 0                  '$3a
r8      long 0                  '$3b
r9      long 0                  '$3c
r10     long 0                  '$3d
r11     long 0                  '$3e
r12     long 0                  '$3f
r13     long 0                  '$40
r14     long 0                  '$41
r15     long 0                  '$42
r16     long 0                  '$43
r17     long 0                  '$44
r18     long 0                  '$45
r19     long 0                  '$46
r20     long 0                  '$47
r21     long 0                  '$48
r22     long 0                  '$49
r23     long 0                  '$4a
'                              
Bit31   long  $80000000         '$4b
all_1s  long  $ffffffff         '$4c
cviu_m1 long  $000000ff         '$4d
cviu_m2 long  $0000ffff         '$4e
top8    long  $ff000000         '$4f   ' top 8 bits bitmask
low24   long  $00ffffff         '$50   ' low 24 bits bitmask
'                             
init_B0                         ' must match xmm_progbeg.s!
'
init_BZ long  $00000000         '$51   ' end of code / start of heap
init_PC long  $00000000         '$52   ' the initial PC
'
' lmm_init : initialize VM - note that this code may be overlaid by 
'            26 longs of debug code once initialization is complete  
'
lmm_init
        cogid   r0              '$53 1 convert ...
        shl     r0,#2           '$54 2 ... my cog id ...
        add     r0,par          '$55 3 ... to my registration addr
        rdword  r1,r0           '$56 4 register ...
        wrlong  r1,r0           '$57 5 ... ourselves
        mov     xfer,r1         '$58 6
wait
        rdlong  BA,r1 wz        '$59 7 Wait till we are given the base address ...
  if_z  jmp     #wait           '$5a 8 .. (only used during initialization)
        add     r1,#4           '$5b 9 Load our initial SP ...
        rdlong  SP,r1           '$5c 10 ... from the request block
        mov     BZ,#(init_BZ-init_B0)<<2+8 '$5d 11 calculate ... 
        add     BZ,BA           '$5e 12 ... pointer to initial BZ
        mov     PC,BZ           '$5f 13 load ...
        add     PC,#4           '$60 14 ... initial ...
        rdlong  PC,PC           '$61 15 ... PC and ...
        rdlong  BZ,BZ           '$62 16 ... BZ and ...
        call    #XMM_Activate   '$63 17 Initialize XMM hardware
        rdlong  CS,#$10+(init_PC-init_B0)<<2+8+8 '$64 18 get code segment from RAM
#ifdef ADJUST_CS
        sub     CS,spi_ro       '$65 19
        sub     PC,CS           '$66 20 correct PC for XMM
        jmp     #LMM_loop       '$67 21 we can now start executing LMM code
spi_ro  long    Common#XMM_RO_BASE_ADDRESS + $200 - $8000 '$68 22
#elseifdef XEPROM
        neg     CS,#$10         '$65 19 correct CS for executing XMM from EEPROM
        sub     PC,CS           '$66 20 correct PC                     
        jmp     #LMM_loop       '$67 21 we can now start executing LMM code
        nop                     '$68 22                     
#else
        sub     PC,CS           '$65 19 correct PC for XMM
        jmp     #LMM_loop       '$66 20 we can now start executing LMM code
        nop                     '$67 21                     
        nop                     '$68 22                     
#endif
        nop                     '$69 23                     
        nop                     '$6a 24                     
        nop                     '$6b 25                     
        nop                     '$6c 26                     
'
' XMM_ReadReg - read a long value to a cog address.
' NOTE: this function is specifically for the debugger - it is not 
'       currently used by the normal kernel, but has to be in a 
'       specific and fixed place outside the debug overlay so 
'       that the overlay is NOT dependent on the actual kernel.
' On Entry:
'    XMM_Reg  - contains cog address to place result
'    XMM_Addr - contains address to read
'
XMM_ReadReg
            movd  XMM_Dst,#XMM_Reg '$6d
            call  #XMM_ReadLong    '$6e
XMM_ReadReg_ret
            ret                    '$6f

'
' XMM_WriteReg - write a long value from a cog address
' NOTE: this function is specifically for the debugger - it is not 
'       currently used by the normal kernel, but has to be in a 
'       specific and fixed place outside the debug overlay so 
'       that the overlay is NOT dependent on the actual kernel.
' On Entry:
'    XMM_Reg  - contains cog address to place result
'    XMM_Addr - contains address to read
'
XMM_WriteReg
            movs  XMM_Src,#XMM_Reg '$70
            call  #XMM_WriteLong   '$71
XMM_WriteReg_ret                   
            ret                    '$72
'
' These need to be in fixed locations for the debugger, so we define
' them here (instead of in various platform-dependent XMM.inc files)
'
XMM_Addr    long  0                '$73
Hub_Addr    long  0                '$74
XMM_Len     long  0                '$75
'
' LMM_next - increment the PC then execute the instruction pointed to by the new PC
'        
LMM_next
        add    PC,#4               '$76
'
LMM_loop
        movd   XMM_Dst,#LMM_1      '$77
        call   #XMM_ReadInstr      '$78
LMM_1
        nop                        '$79
'
' No point in unrolling the loop since XMM accesses take too long to hit the Propeller 'sweet spot'
' 
{
        movd   XMM_Dst,#LMM_2
        call   #XMM_ReadInstr
LMM_2
        nop
        movd   XMM_Dst,#LMM_3
        call   #XMM_ReadInstr
LMM_3
        nop
        movd   XMM_Dst,#LMM_4
        call   #XMM_ReadInstr
LMM_4
        nop
}
        jmp    #LMM_loop

'
'load_l - load the long stored at the PC into RI, incrementing the PC
'
load_l
       call   #XMM_ReadRI   ' load the long
       jmp    #LMM_loop     ' execute next instruction
'
'load_i - load the long at the address stored at the PC into RI, 
'         incrementing the PC (i.e. load indirect)
'
load_i
       call   #XMM_ReadRI   ' load the address
#ifdef LARGE
       cmp    RI,CS wc
  if_c rdlong RI,RI
  if_c jmp    #LMM_Loop
       mov    XMM_Addr,RI   ' read ...
       sub    XMM_Addr,CS   ' ... (correct XMM address) ...
       'movd   XMM_Dst,#RI   ' dest register is RI
       call   #XMM_ReadLong ' ... the long at that address
       jmp    #LMM_loop     ' execute next instruction
#else
       rdlong RI,RI         ' read the value at that address
       jmp    #LMM_loop     ' execute next instruction
#endif
'
' fp_ind - load the FP into RI, then add the long at the PC to result, incrementing the PC
'
fp_ind
       call   #XMM_ReadRI   ' load the long value
       adds   RI,FP         ' add the frame pointer
       jmp    #LMM_loop     ' execute next instruction
'
' push_a - push a value whose address is specified indirectly in a global
'          variable onto the stack
'
push_a
       call   #XMM_ReadRI   ' load the address
#ifdef LARGE
       cmp    RI,CS wc
  if_c rdlong RI,RI
  if_c jmp    #push_l
       mov    XMM_Addr,RI   ' address is in RI
       sub    XMM_Addr,CS   ' correct XMM address
'       movd   XMM_Dst,#RI   ' dest register is RI
       call   #XMM_ReadLong ' read the bytes
       jmp    #push_l       ' push the value just read
#else
       jmp    #push_x       
#endif
'
' push_i - push a value whose address is specified indirectly in a frame variable
'          onto the stack
'
' push_l - push a long value onto the stack, decrementing the SP
'
push_i
       call   #XMM_ReadRI   ' load the long value
       adds   RI,FP         ' add the frame pointer
push_x
       rdlong RI,RI         ' read the value at that address
push_l 
       sub    SP,#4         ' decrement SP
       wrlong RI,SP         ' save value on stack
       jmp    #LMM_loop     ' execute next instruction
'
' push_m - push many registers (specified by long at PC) onto the stack,
' decrementing the SP before each one
'
push_m
       call   #XMM_ReadRI   ' load the long value specifying the registers to push
       mov    t1,RI         ' save register specification for later
       movd   :push_x,#r6   ' start with ...
       shr    RI,#6         ' ... r6
:push_nxt
       shr    RI,#1 wc,wz   ' save rX?
 if_c  sub    SP,#4         ' if so ...
:push_x                     ' ... save ...
 if_c  wrlong 0-0,SP        ' ... the register
       add    :push_x,dlsb  ' point to next register
 if_nz jmp    #:push_nxt    ' continue till all registers checked
       sub    SP,#4         ' save ...
       wrlong t1,SP         ' .... register specification
       jmp    #LMM_loop     ' execute next instruction
        
'
' pop_m - pop many registers (specified in RI) from the stack,
' incremening the SP after each one
'
'
pop_m
       rdlong RI,SP         ' load ...
       add    SP,#4         ' ... register specification to pop
       movd   :pop_x,#r23   ' start with ...
       shl    RI,#(32-24)   ' ... r23         
:pop_nxt
       shl    RI,#1 wc,wz   ' load rX?
:pop_x                      ' if so ...
 if_c  rdlong 0-0,SP        ' ... load ...
 if_c  add    SP,#4         ' ... the register
 if_z  jmp    #LMM_loop     ' execute next instruction if all done 
       sub    :pop_x,dlsb   ' point to previous register
       jmp    #:pop_nxt     ' continue till all registers popped
'
' push_b - push a structure (size in bytes at the PC) pointed to by R0
'          onto the stack, decrementing the SP.
'
push_b
       call   #XMM_ReadBC   ' load the byte count from the PC
       mov    t3,BC         ' round up the count ...
       add    t3,#3         ' ... to be ...
       andn   t3,#3         ' ... a multiple of 4
       sub    SP,t3         ' decrement SP by rounded up size
       mov    t1,R0         ' source is in R0
       mov    t2,SP         ' destination is SP
       jmp    #copy_bytes   ' do the copy 
'
' copy_b - copy a structure (size in bytes at the PC)
'          from the address in R1 to the address in R0
'
copy_b
       call   #XMM_ReadBC   ' load the byte count from the PC
       mov    t1,R1         ' source is in R1
       mov    t2,R0         ' destination is in R0
' 
copy_bytes
       tjz     BC,#LMM_Loop    ' no more to copy
#ifdef LARGE
       cmp     t1,CS wc        ' large mode - is src Hub Addr?
  if_c rdbyte  t3,t1           ' yes - read HUB RAM to t3 ...
'  if_c jmp     #:write_byte    ' ... and then do write
 if_nc movd    XMM_Dst,#t3     ' no - read from XMM to t3 ...
 if_nc mov     XMM_Addr,t1     ' ... at address in t1
 if_nc sub     XMM_Addr,CS     ' ... XMM address
 if_nc mov     XMM_Len,#1      ' one byte at a time
 if_nc call    #XMM_ReadMult   ' read from XMM to t3
:write_byte
       cmp     t2,CS wc        ' large mode - is dst Hub Addr?
  if_c wrbyte  t3,t2           ' yes - write t3 to Hub RAM ...
'  if_c jmp     #:copy_next     ' ... and do next
 if_nc movs    XMM_Src,#t3     ' no - write to XMM from t3 ...
 if_nc mov     XMM_Addr,t2     ' ... at address in t2
 if_nc sub     XMM_Addr,CS     ' ... XMM address
 if_nc mov     XMM_Len,#1      ' one byte at a time
 if_nc call    #XMM_WriteMult  ' write the byte
#else
       rdbyte  t3,t1           ' small mode - src and dst ...
       wrbyte  t3,t2           ' ... must both be Hub Addr
#endif
:copy_next
       add     t1,#1           ' increment source
       add     t2,#1           ' increment destination
       sub     BC,#1           ' decrement count ...
       jmp     #copy_bytes     ' ... and keep copying
'
' new_fp - save current frame pointer and set up a new frame pointer
' also calculate what SP was before data was pushed and save it in BC
'
new_fp
       sub    SP,#4         ' decrement the stack pointer
       wrlong FP,SP         ' save FP to stack
       mov    FP,SP         ' set up new FP
       add    BC,#8         ' calculate what SP was ...
       add    BC,FP         ' ... before arguments were pushed
       jmp    #LMM_loop     ' execute the next instruction
'
' fp_ret - pop current frame, restore previous frame and stack pointers,
'          then restore the previous program counter
'
' f_ret -  just restore the previous program counter
'
fp_ret
       rdlong FP,SP         ' restore previous FP
       add    SP,#4         ' increment the SP
f_ret
       rdlong PC,SP         ' read the PC
       sub    PC,CS
       add    SP,#8         ' increment the SP
       jmp    #LMM_loop     ' execute the next instruction
'
' f_call - call the routine at the address pointed to by the PC (increment the PC)
'
f_call
       call   #XMM_ReadRI   ' get the address to call
'       
' f_cali - call the routine whose address is in RI
'
f_cali
       add    PC,CS         ' correct for moved code segment
       sub    SP,#8         ' decrement the SP
       wrlong PC,SP         ' save current PC to stack
       jmp    #f_jmpi       ' go to address in RI
'
' f_jump - jump to the location at the address pointed to by PC (increment the PC)
'
f_jump
       call   #XMM_ReadRI   ' get the address to jump to
'
' f_jmpi - jump to the location whose address in RI
'
f_jmpi
       mov    PC,RI         ' get the address to jump to
       sub    PC,CS         ' correct for moved code segment
       jmp    #LMM_loop     ' execute next instruction
'

#ifndef OLD_DIVISION

'
'fd_32s - Signed 32 bit division
'         Divisor --> r1
'         Dividend--> r0
'         Result --> Quotient in r0
'                    Remainder in r1
'
f_d32s
        mov     t3,r1           ' save sign for later
        mov     t4,r0
        abs     r1,r1
        abs     r0,r0
        xor     t3,t4

        call    #f_d32          ' perform unsigned division
        
        mov     t4,t4 WC        ' get bit #31 into carry
        negc    r1,r1           ' adjust the sign of the remainder
        mov     t3,t3 WC        ' get bit #31 into carry
        negc    r0,r0           ' adjust the sign of the result
        jmp     #LMM_loop
'
'f_d32u - unsigned 32 bit division 
'         Divisor : r1
'         Dividend : r0
'         Result:
'             Quotient in r0
'             Remainder in r1
'
f_d32u  movs    f_d32_ret,#LMM_loop ' set return to #LMM_loop & fall into div
        
'
'f_d32  - 32 bit division (used by signed and unsigned)
'
f_d32
        mov     t1,#32
        mov     t2,#0           ' tmp2 is temp register to hold the remainder
:loop
        shl     r0,#1 WC
        rcl     t2,#1 
        cmpsub  t2,r1 WC
 if_c   add     r0,#1
        djnz    t1,#:loop
        mov     r1,t2           ' set remainder
f_d32_ret
        ret

#else

'
'fd_32s - Signed 32 bit division
'         Divisor --> r1
'         Dividend--> r0
'         Result --> Quotient in r0
'                    Remainder in r1
'                           
' This is Pullmoll's division algorithm

f_d32s
        mov  t1,#32
        mov  t2,#0           ' tmp2 is temp register to hold the remainder
        mov  ftemp,r1
        mov  ftmp2,r0
        abs  r1, r1
        abs  r0, r0
        xor  ftemp, ftmp2
:loop
        shl  r0,#1 WC
        rcl  t2,#1 WC
        cmpsub t2,r1 WC,WZ
 if_be add  r0,#1
        djnz t1,#:loop
        mov  r1,t2
        mov  ftmp2,ftmp2 WC  ' get bit #31 into carry
        negc r1,r1                   ' adjust the sign of the remainder
        mov  ftemp,ftemp WC  ' get bit #31 into carry
        negc r0,r0                   ' adjust the sign of the result
        jmp  #LMM_loop
        
'
'f_d32u - Unsigned 32 bit division
'         Divisor : r1
'         Dividend : r0
'         Result:
'             Quotient in r0
'             Remainder in r1

f_d32u
        mov ftemp,#32
        mov ftmp2, #0
:up2
        shl r0,#1       WC
        rcl ftmp2,#1    WC
        cmp r1,ftmp2    WC,WZ
 if_a   jmp #:down
        sub ftmp2,r1
        add r0,#1
:down
        sub ftemp, #1   WZ
 if_ne  jmp #:up2
        mov r1,ftmp2
        jmp #LMM_loop
'

#endif

'
'f_m32 - multiplication
'        r0 : 1st operand (32 bit)
'        r1 : 2nd operand (32 bit)
'        Result:
'           Product in r0 (<= 32 bit)
'
f_m32
        mov t3,#0
:start
        cmp r0,#0    WZ
 if_e   jmp #:down3
        shr r0,#1    WC
' if_ae  jmp #:down2
 if_b   add t3,r1    WC
:down2
        shl r1,#1    WC
        jmp #:start
:down3
        mov r0,t3
        jmp #LMM_loop
'
' bra_xx - branch if condition is true to the address at the PC,
'          otherwise, just increment the PC by 4
'
'
bra_z
  if_z  jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next     ' increment PC, execute next instruction
bra_nz
 if_nz  jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next     ' increment PC, execute next instruction
bra_ae
 if_ae  jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next     ' increment PC, execute next instruction
bra_a
 if_a   jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next     ' increment PC, execute next instruction
bra_be
 if_be  jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next     ' increment PC, execute next instruction
bra_b
 if_b   jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next     ' increment PC, execute next instruction

'
' plugin - call a plugin
' On entry:
'       R3 = code:
'            - cog id if >= 128 (i.e. $80 + cog id)
'            - plugin type if < 128 (i.e. 0 .. 127)
'            - service id if < 0
'       R2 = data (optional pointer)
'
' NOTES: Locks are currently only supported when invoking via a service id.
'        When using service id, the data should only use the lower 24 bits.
'
' On exit:
'       R0 = result
'
plugin
        call    #plugin2        ' plugin2 does all the work
        jmp     #LMM_loop
'
plugin2
#ifdef SHARED_XMM
        call    #XMM_Tristate   ' disable XMM while calling plugin
#else
        nop                     ' required to make the offsets the same
#endif
        mov     ftemp,#8        ' ftemp stores lock - default to none required
        mov     r0,r3 wc        ' get plugin type or cog id or service id
 if_b   jmp     #psvc           ' if < 0, code is a service id
        test    r0,#$80 wz      ' if bit 7 set ...
 if_nz  jmp     #pcog           ' code is a cog id ...
ptype                           ' ... otherwize it's a plugin type
        mov     t1,par          ' point to registry
        mov     t2,#0           ' start at cog id 0
plgt1
        cmp     t2,#8 wc,wz     ' run out of cogs?
 if_ae  jmp     #plugerr        ' yes - no such plugin
        rdlong  t3,t1           ' no - check cog's plugin type
        shr     t3,#24          ' is it ...
        cmp     t3,r0 wz        ' ... the plugin type what we wanted?
' if_z   jmp     #plgt2          ' yes - invoke plugin at this cog id
 if_nz  add     t2,#1           ' no - try ...
 if_nz  add     t1,#4           ' ... next ...
 if_nz  jmp     #plgt1          ' ... cog id
plgt2
        mov     r0,t2           ' use the cog where we found the plugin
        jmp     #pcog           ' invoke plugin (via the cog id)
psvc
        shl     r0,#1           ' read entry ...
        add     r0,par          ' ... from ...
        rdword  r0,r0           ' ... the service registry
        mov     t1,r0           ' save in t1 and extract ...
        shr     r0,#12          ' ... cog number to r0
        mov     ftemp,t1        ' save in ftemp and extract ...
        and     t1,#$7f         ' ... 7 bit plugin-specific code ...
        shl     t1,#24 wz       ' ... to t1 (top 8 bits) ...
  if_z  jmp     #plugerr        ' ... or throw error if request code is zero
        shr     ftemp,#7        ' put lock number in lower 5 bits of ftemp
        test    ftemp,#8 wz     ' are we required to use a lock?
'  if_nz  jmp     #no_lock       ' no - just make the request
set_lock
  if_z   lockset ftemp wc       ' yes - loop ...
  if_c_and_z jmp     #set_lock  ' ... until we have set the lock
no_lock
'        and     r2,low24        ' combine data ...
        or      r2,t1           ' ... with request code
pcog
        and     r0,#7           ' mask off cog id to 0 .. 7
        shl     r0,#2           ' point to ...
        add     r0,par          ' ... registry entry for the cog
        rdlong  r0,r0           ' get request block from registry
        test    r0,top8 wz      ' is a plugin registered in this cog?
 if_z   jmp     #plugerr        ' no - throw error 
'       and     r0,low24        ' yes - write ...
        wrlong  r2,r0           ' ... request 
ploop
        rdlong  r3,r0   wz      ' wait till ...
 if_nz  jmp     #ploop          ' ... request completed
        add     r0,#4           ' get ...
        rdlong  r0,r0           ' ... result
clr_lock
        test    ftemp,#8 wz     ' did we set a lock?
 if_z   lockclr ftemp           ' yes - clear the lock we set
#ifdef SHARED_XMM
        call    #XMM_Activate   ' re-enable XMM
#else
        nop                     ' required to make the offsets the same
#endif
plugin2_ret
        ret
plugerr 
        neg     r0,#1           ' plugin error (e.g. not registered)
        jmp     #clr_lock       ' done - clear lock if required
'
'
' rd_long/rd_word/rd_byte : Read long/word/byte from memory from address in RI into BC.
'
' On entry:
'    RI : address to read
' On exit:
'    BC : long/word/byte read
'
' NOTE: If we are using the LARGE address model, we accept both HUB and XMM addreses,
'       otherwise we accept only XMM addresses (because we can't tell the difference). 
'
rd_long
#ifdef LARGE
        cmp     RI,CS wc
   if_c rdlong  BC,RI
   if_c jmp     #LMM_Loop
#endif
        mov     XMM_Len,#4
        jmp     #rd_mult

rd_word
#ifdef LARGE
        cmp     RI,CS wc
   if_c rdword  BC,RI
   if_c jmp     #LMM_Loop
#endif
        mov     XMM_Len,#2
        jmp     #rd_mult

rd_byte
#ifdef LARGE
        cmp     RI,CS wc
   if_c rdbyte  BC,RI
   if_c jmp     #LMM_Loop
#endif
        mov     XMM_Len,#1

rd_mult
        mov     XMM_Addr,RI     ' address is in RI
        sub     XMM_Addr,CS     ' correct XMM address
        movd    XMM_Dst,#BC     ' dest register is BC
        call    #XMM_ReadMult   ' read the bytes
        jmp     #LMM_Loop
'
' wr_long/wr_word/wr_byte : Write long/word/byte from BC to memory at address in RI.
'
' On entry:
'    RI : address to write
'    BC : long/word/byte to write
' On exit:
'    (none)
'
' NOTE: If we are using the LARGE address model, we accept both HUB and XMM addreses,
'       otherwise we accept only XMM addresses (because we can't tell the difference). 
'
wr_long
#ifdef LARGE
        cmp     RI,CS wc
   if_c wrlong  BC,RI
   if_c jmp     #LMM_Loop
#endif
        mov     XMM_Len,#4
        jmp     #wr_mult

wr_word
#ifdef LARGE
        cmp     RI,CS wc
   if_c wrword  BC,RI
   if_c jmp     #LMM_Loop
#endif
        mov     XMM_Len,#2
        jmp     #wr_mult

wr_byte
#ifdef LARGE
        cmp     RI,CS wc
   if_c wrbyte  BC,RI
   if_c jmp     #LMM_Loop
#endif
        mov     XMM_Len,#1

wr_mult
        mov     XMM_Addr,RI     ' address is in RI
        sub     XMM_Addr,CS     ' correct XMM address
        movs    XMM_Src,#BC     ' source register is BC
        call    #XMM_WriteMult  ' write the bytes
        jmp     #LMM_Loop

'------------------------------------------------------------------------------
' Float32 Assembly language jump points
'------------------------------------------------------------------------------

#ifdef EXTERNAL_FLT_CMP
flt_cmp
        neg     t1,#Common#SVC_FLOAT_CMP
        jmp     #fp_service
#endif

flt_add
        neg     t1,#Common#SVC_FLOAT_ADD
        jmp     #fp_service
flt_sub
        neg     t1,#Common#SVC_FLOAT_SUB
        jmp     #fp_service
flt_mul
        neg     t1,#Common#SVC_FLOAT_MUL
        jmp     #fp_service
flt_div
        neg     t1,#Common#SVC_FLOAT_DIV
        jmp     #fp_service
flt_int
        neg     t1,#Common#SVC_FLOAT_FLOAT
        jmp     #fp_service
int_flt
        neg     t1,#Common#SVC_FLOAT_TRUNC
        ' fall through to 
'                
'------------------------------------------------------------------------------
' fp_service - request a floating point service
' input:   t2          service to request
'          r0          32-bit floating point value
'          r1          32-bit floating point value 
' output:  r0          32-bit floating point result
'------------------------------------------------------------------------------
'
fp_service
        mov     ftmp2,r2        ' save r2
        mov     ftmp3,r3        ' save r3
        mov     r3,t1           ' r3 = code of service to request
        mov     r2,xfer         ' r2 = data is address of xfer block
        mov     t1,xfer         ' write ...
        wrlong  r0,t1           ' ... first argument to xfer block
        add     t1,#4           ' write ...
        wrlong  r1,t1           ' ... second argument to xfer block
        call    #plugin2        ' request the service
        mov     r2,ftmp2        ' restore r2
        mov     r3,ftmp3        ' restore r3
        cmps    r0,#0 wz,wc     ' set C & Z flags according to result
        jmp     #LMM_loop
'       
'--------------------- End of LMM Kernel --------------------------------------
'
'--------------------- Start of Float32 Components ----------------------------
'
{{
                            TERMS OF USE: MIT License 
              (Float32 Components only - i.e. excludes LMM Kernel)

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

#ifndef EXTERNAL_FLT_CMP

'------------------------------------------------------------------------------
' _FCmp    set Z and C flags for r0 - r1
' changes: t1
'------------------------------------------------------------------------------

flt_cmp
_FCmp                   mov     t1, r0        ' compare signs
                        xor     t1, r1
                        and     t1, Bit31 wz
          if_z          jmp     #:cmp1        ' same, then compare magnitude

                        mov     t1, r0        ' check for +0 or -0
                        or      t1, r1
                        andn    t1, Bit31 wz,wc
          if_z          jmp     #LMM_Loop

                        test    r0, Bit31 wc  ' compare signs
                        jmp     #LMM_Loop

:cmp1                   test    r0, Bit31 wz  ' check signs
          if_nz         jmp     #:cmp2
                        cmp     r0, r1 wz,wc
                        jmp     #LMM_Loop
:cmp2                   cmp     r1, r0 wz,wc  ' reverse test if negative
                        jmp     #LMM_Loop

'-------------------- End of Float32 Components -------------------------------

#endif

'--------------------------------- constant values -----------------------------

dlsb          long    1 << 9
xfer          long    $0                       ' set up during initialization

'------------------------ temporary local variables -----------------------------
'
t1            long    $0
t2            long    $0
t3            long    $0
#ifndef OLD_DIVISION
t4            long    $0
#endif

ftemp         long    $0
ftmp2         long    $0
ftmp3         long    $0
'
'----------------------- Kernel-specific XMM Routines --------------------------
'
' XMM_ReadBC : Read long from XMM memory at address in PC into BC.
'
' On entry: PC (32-bit): address to read from (19-bits used)
' On exit:  BC loaded with long pointed to by PC, PC incremented by 4
'
' XMM_ReadRI : Read long from XMM memory at address in PC into RI.
'
' On entry: PC (32-bit): address to read from (19-bits used)
' On exit:  RI loaded with long pointed to by PC, PC incremented by 4
'
' XMM_ReadInstr : Read instruction from XMM memory at address in PC into a register.
'
' On entry: PC (32-bit): address to read from (19-bits used)
'           XMM_Dst : destination of this instruction set to destination register
' On exit:  destintation register loaded with long pointed to by PC, PC incremented by 4
'
XMM_ReadBC
              movd    XMM_Dst,#BC               ' dest register is BC
              jmp     #XMM_ReadInstr                ' 
XMM_ReadRI
              movd    XMM_Dst,#RI               ' dest register is RI
                                                ' fall through to XMM_ReadInstr
XMM_ReadInstr
              mov     XMM_Addr,PC               ' source address is PC
              call    #XMM_ReadLong             ' read the instuction
              add     PC,#4                     ' increment the PC
XMM_ReadInstr_ret
XMM_ReadRI_ret
XMM_ReadBC_ret
              ret
'----------------------------- End of XMM Kernel -------------------------------

'
'=============================== XMM SUPPORT CODE ==============================
'
' The folling #defines determine which XMM functions are included - comment out
' the appropriate lines to exclude the corresponding XMM function:
'
#define NEED_XMM_READLONG
#define NEED_XMM_WRITELONG
'#define NEED_XMM_READPAGE
'#define NEED_XMM_WRITEPAGE
'#define ACTIVATE_INITS_XMM      ' the HX512 does not allow this in the Kernel
'                                    
#ifdef CACHED
' When the cache is in use, all platforms use the same XMM code
#include "Cached_XMM.inc"
#else
' Include XMM API based on platform
#include "XMM.inc"
#endif
'
'============================ END OF XMM SUPPORT CODE ==========================
'
              fit       $1eb                    ' last 5 longs reserved for debug overlay vectors
'
              org       $1eb
DEBUG_VECTORS long      0,0,0,0,0
'
              fit       $1f0                    ' max size
' 
