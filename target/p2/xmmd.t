{{
'-------------------------------------------------------------------------------
'
' Catalina_XMM_dynamic - Implements a dynamically loadable External 
'                Memory Model (XMM) Kernel intended for use by the Catalina 
'                Code Generator backend for LCC
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
' Version 5.6  - Modified for Propeller 2. No FLASH or XEPROM support yet.
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

#include <constant.inc>

' NO_INTERRUPTS - if defined, we can the use SKIPF because this code will not  
'                 be used in an interrupt service routine. Can be defined here 
'                 or on the command-line (i.e. -C NO_INTERRUPTS)

'#ifndef NO_INTERRUPTS
'#define NO_INTERRUPTS
'#endif
'
' The symbol EXTERNAL_FLT_CMP forces the flt_cmp operation to the external
' FLOAT32_A plugin. This is because the new kernel is slightly larger than
' the old, so on some platforms, adding the necessary XMM code makes the 
' kernel too large. By default, this symbol is enabled only for LARGE mode. 
' Undefine this symbol if you have enough space on a particular platform.
' Currently, all supported Propeller 2 XMM platforms have enough space
'
#ifdef LARGE
'#define EXTERNAL_FLT_CMP
#endif
'
  
'--------------------- Start of XMM Kernel ------------------------------------

DAT
        org 0

' the first $73 longs must be in the same place in all LMM and XMM kernels,  
' to allow for the separate compilation of code that uses these locations

INIT    jmp #lmm_init           '$00   ' CAN ONLY BE CALLED ONCE !!!
SPEC    jmp #special            '$01  
LODL    jmp #load_l             '$02 
LODI    jmp #load_i             '$03 
LODF    jmp #fp_ind             '$04 
PSHL    jmp #push_l             '$05 
PSHB    jmp #push_b             '$06 
CPYB    jmp #copy_b             '$07 
NEWF    jmp #new_fp             '$08 
RETF    jmp #fp_ret             '$09 
CALA    jmp #f_call             '$0a 
RETN    jmp #f_ret              '$0b 
CALI    jmp #f_cali             '$0c 
JMPA    jmp #f_jump             '$0d 
JMPI    jmp #f_jmpi             '$0e 
DIVS    jmp #f_d32s             '$0f 
DIVU    jmp #f_d32u             '$10 
MULT    jmp #f_m32              '$11 
BR_Z    jmp #bra_z              '$12 
BRNZ    jmp #bra_nz             '$13 
BRAE    jmp #bra_ae             '$14 
BR_A    jmp #bra_a              '$15 
BRBE    jmp #bra_be             '$16 
BR_B    jmp #bra_b              '$17 
SYSP    jmp #plugin             '$18 
PSHA    jmp #push_a             '$19 
FADD    jmp #flt_add            '$1a 
FSUB    jmp #flt_sub            '$1b 
FMUL    jmp #flt_mul            '$1c 
FDIV    jmp #flt_div            '$1d 
FCMP    jmp #flt_cmp            '$1e 
FLIN    jmp #flt_int            '$1f 
INFL    jmp #int_flt            '$20 
PSHM    jmp #push_m             '$21 
POPM    jmp #pop_m              '$22 
PSHF    jmp #push_i             '$23 
RLNG    jmp #rd_long            '$24 
RWRD    jmp #rd_word            '$25 
RBYT    jmp #rd_byte            '$26 
WLNG    jmp #wr_long            '$27 
WWRD    jmp #wr_word            '$28
WBYT    jmp #wr_byte            '$29

XMM_Reg long 0                  '$2a 
                                   
PC      long 0                  '$2b
SP      long 0                  '$2c
FP      long 0                  '$2d
RI      long 0                  '$2e
BC      long 0                  '$2f
DBG1    long 0                  '$30 debug opAddr
DBG2    long 0                  '$31 debug temp
CS      long 0                  '$32
                               
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

Save_PC long  0                 '$51   '
reg     long  0                 '$52   ' registry address

' NOTE - the initial values below are used only during kernel initialization

t1      long  HUB_TOP           '$53
t2      long  FREE_MEM          '$54
t3      long  REQUESTS          '$55
t4      long  REGISTRY          '$56

ct1     long  0                 '$57
ct2     long  0                 '$58
ct3     long  0                 '$59

' lmm_init : initialize VM - note that this code may be overlaid by 
'            26 longs of debug code once initialization is complete  

DEBUG_OVERLAY
lmm_init
        rdlong  reg,PTRA++      '$5a  1 load registry address (used later)   
        cogid   r2              '$5b  2 register ...
        shl     r2,#2           '$5c  3 ... ourselves ...
        add     r2,reg          '$5d  4 ... as ...
        rdlong  r1,r2           '$5e  5 ... a ...
        and     r1,low24        '$5f  6 ... new ...
        wrlong  r1,r2           '$60  7  kernel
        rdlong  PC,PTRA++       '$61  8 load initial PC
        rdlong  SP,PTRA++       '$62  9 load initial SP
        rdlong  r0,PTRA++       '$63 10 load initial LUT library size (-1)
        rdlong  r1,PTRA++       '$64 11 load initial LUT library address
        rdlong  r3,PTRA++       '$65 12 load initial arg1
        rdlong  r2,PTRA++       '$66 13 load initial arg2
        rdlong  CS,PTRA++       '$67 14 load initial CS
        setq2   r0              '$68 15 copy lut library ...
        rdlong  $100,r1         '$69 16 ... to LUT RAM, starting at $100
        sub     CS,##$200       '$6a&6b 17&18 correct CS for proglogue
        sub     PC,CS           '$6c 19 correct PC for XMM
        call    #XMM_Activate   '$6d 20
#if defined(LUT_PAGE) || defined(LUT_CACHE)
        setluts #1              '$6e 21 enable cache to write to our LUT
#else
        nop                     '$6e 21                    
#endif 
        nop                     '$6f 22                    
        nop                     '$70 23                    
        nop                     '$71 24                    
        nop                     '$72 25                    
        nop                     '$73 26                    
        jmp     #LMM_loop       '$74 we can now start executing LMM code
'
' These need to be in fixed locations for the debugger, so we define
' them here (instead of in various platform-dependent XMM.inc files)
'
XMM_Addr    long  0             '$75
Hub_Addr    long  0             '$76
XMM_Len     long  0             '$77
'
' LMM_next - increment the PC then execute the instruction pointed to by the new PC
'        
LMM_next
        add    PC,#4            '$78
'
LMM_loop
        setd   XMM_Dst,#LMM_1   '$79
        call   #XMM_ReadInstr   '$7a
        stalli                  '$7b
LMM_1
        nop                     '$7c
        allowi                  '$7d
        jmp    #LMM_loop        '$7e

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
        setd  XMM_Dst,#XMM_Reg  '$7f
        call  #XMM_ReadLong     '$80
XMM_ReadReg_ret
        ret                     '$81

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
        sets  XMM_Src,#XMM_Reg  '$82
        call  #XMM_WriteLong    '$83
XMM_WriteReg_ret                   
        ret                     '$84
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
  if_c jmp    #LMM_loop
       mov    XMM_Addr,RI   ' read ...
       sub    XMM_Addr,CS   ' ... (correct XMM address) ...
       'setd   XMM_Dst,#RI   ' dest register is RI
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
'       setd   XMM_Dst,#RI   ' dest register is RI
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
       mov    t2, #r6       ' start with ...
       shr    RI,#6         ' ... r6
:push_nxt
       shr    RI,#1 wcz     ' save rX?
 if_c  sub    SP,#4         ' if so ...
 if_c  altd   t2
 if_c  wrlong 0-0,SP        ' ... register
       add    t2,#1         ' point to next register
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
       mov    t2, #r23      ' start with ...
       shl    RI,#(32-24)   ' ... r23         
:pop_nxt
       shl    RI,#1 wcz    ' load rX?
 if_c  altd   t2 
 if_c  rdlong 0-0,SP        ' ... load ...
 if_c  add    SP,#4         ' ... the register
 if_z  jmp    #LMM_loop     ' execute next instruction if all done 
       sub    t2,#1         ' point to previous register
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
       mov     XMM_Len,#1      ' one byte at a time
#ifdef LARGE
       cmp     t1,CS wc        ' large mode - is src Hub Addr?
  if_c rdbyte  t3,t1           ' yes - read HUB RAM to t3 ...
'  if_c jmp     #:write_byte    ' ... and then do write
 if_nc setd    XMM_Dst,#t3     ' no - read from XMM to t3 ...
 if_nc mov     XMM_Addr,t1     ' ... at address in t1
 if_nc sub     XMM_Addr,CS     ' ... XMM address
 if_nc call    #XMM_ReadMult   ' read from XMM to t3
:write_byte
       cmp     t2,CS wc        ' large mode - is dst Hub Addr?
  if_c wrbyte  t3,t2           ' yes - write t3 to Hub RAM ...
'  if_c jmp     #:copy_next     ' ... and do next
 if_nc sets    XMM_Src,#t3     ' no - write to XMM from t3 ...
 if_nc mov     XMM_Addr,t2     ' ... at address in t2
 if_nc sub     XMM_Addr,CS     ' ... XMM address
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
       sub    SP,#4         ' allow for alloca
       wrlong Bit31,SP      ' initialize pre-alloca SP (to a known value)
       jmp    #LMM_loop     ' execute the next instruction
'
' fp_ret - pop current frame, restore previous frame and stack pointers,
'          then restore the previous program counter
'
' f_ret -  just restore the previous program counter
'
fp_ret
       add    SP,#4         ' allow for alloca
       rdlong FP,SP         ' restore previous FP
       add    SP,#4         ' increment the SP
f_ret
       rdlong PC,SP         ' read the PC
#ifdef LARGE
       sub    PC,CS
#endif
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
#ifdef LARGE
       add    PC,CS         ' correct for moved code segment
#endif
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
#ifdef LARGE
       sub    PC,CS         ' correct for moved code segment
#endif
       jmp    #LMM_loop     ' execute next instruction
'

'fd_32s - Signed 32 bit division
'         Divisor --> r1
'         Dividend--> r0
'         Result --> Quotient in r0
'                    Remainder in r1
'
f_d32s
        call    #\signed_d32     ' perform signed division
        jmp     #LMM_loop

'f_d32u - unsigned 32 bit division 
'         Divisor : r1
'         Dividend : r0
'         Result:
'             Quotient in r0
'             Remainder in r1

f_d32u
        call    #\unsigned_d32   ' perform signed division
        jmp     #LMM_loop
        

'f_m32 - multiplication
'        r0 : 1st operand (32 bit)
'        r1 : 2nd operand (32 bit)
'        Result:
'           Product in r0 (<= 32 bit)

f_m32
        qmul   r0,r1
        getqx  r0
        jmp #LMM_loop

' bra_xx - branch if condition is true to the address at the PC,
'          otherwise, just increment the PC by 4

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
        call    #\do_plugin     ' do_plugin does all the work
        jmp     #LMM_loop
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
   if_c jmp     #LMM_loop
#endif
        mov     XMM_Addr,RI     ' address is in RI
#ifdef LARGE
        sub     XMM_Addr,CS     ' correct XMM address
#endif
        setd    XMM_Dst,#BC     ' dest register is BC
        call    #XMM_ReadLong   ' read the long
        jmp     #LMM_loop

rd_word
#ifdef LARGE
        cmp     RI,CS wc
   if_c rdword  BC,RI
   if_c jmp     #LMM_loop
#endif
        mov     XMM_Len,#2
        jmp     #rd_mult

rd_byte
#ifdef LARGE
        cmp     RI,CS wc
   if_c rdbyte  BC,RI
   if_c jmp     #LMM_loop
#endif
        mov     XMM_Len,#1

rd_mult
        mov     XMM_Addr,RI     ' address is in RI
#ifdef LARGE
        sub     XMM_Addr,CS     ' correct XMM address
#endif
        setd    XMM_Dst,#BC     ' dest register is BC
        call    #XMM_ReadMult   ' read the bytes
        jmp     #LMM_loop
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
   if_c jmp     #LMM_loop
#endif
        mov     XMM_Addr,RI     ' address is in RI
#ifdef LARGE
        sub     XMM_Addr,CS     ' correct XMM address
#endif
        sets    XMM_Src,#BC     ' source register is BC
        call    #XMM_WriteLong  ' write the long
        jmp     #LMM_loop

wr_word
#ifdef LARGE
        cmp     RI,CS wc
   if_c wrword  BC,RI
   if_c jmp     #LMM_loop
#endif
        mov     XMM_Len,#2
        jmp     #wr_mult

wr_byte
#ifdef LARGE
        cmp     RI,CS wc
   if_c wrbyte  BC,RI
   if_c jmp     #LMM_loop
#endif
        mov     XMM_Len,#1

wr_mult
        mov     XMM_Addr,RI     ' address is in RI
#ifdef LARGE
        sub     XMM_Addr,CS     ' correct XMM address
#endif
        sets    XMM_Src,#BC     ' source register is BC
        call    #XMM_WriteMult  ' write the bytes
        jmp     #LMM_loop

'------------------------------------------------------------------------------
' Float32 Assembly language jump points
'------------------------------------------------------------------------------

#ifdef EXTERNAL_FLT_CMP
flt_cmp
        neg     t1,#SVC_FLOAT_CMP
        jmp     #fp_service
#endif

flt_add
        neg     t1,#SVC_FLOAT_ADD
        jmp     #fp_service
flt_sub
        neg     t1,#SVC_FLOAT_SUB
        jmp     #fp_service
flt_mul
        neg     t1,#SVC_FLOAT_MUL
        jmp     #fp_service
flt_div
        neg     t1,#SVC_FLOAT_DIV
        jmp     #fp_service
flt_int
        neg     t1,#SVC_FLOAT_FLOAT
        jmp     #fp_service
int_flt
        neg     t1,#SVC_FLOAT_TRUNC
        ' fall through to 
                
'------------------------------------------------------------------------------
' fp_service - request a floating point service
' input:   t2          service to request
'          r0          32-bit floating point value
'          r1          32-bit floating point value 
' output:  r0          32-bit floating point result
'------------------------------------------------------------------------------

fp_service
        mov     ftmp2,r2        ' save r2
        mov     ftmp3,r3        ' save r3
        mov     r3,t1           ' r3 = code of service to request
        mov     r2,xfer         ' r2 = data is address of xfer block
        mov     t1,xfer         ' write ...
        wrlong  r0,t1           ' ... first argument to xfer block
        add     t1,#4           ' write ...
        wrlong  r1,t1           ' ... second argument to xfer block
        call    #\do_plugin     ' request the service
        mov     r2,ftmp2        ' restore r2
        mov     r3,ftmp3        ' restore r3
        cmps    r0,#0 wz,wc     ' set C & Z flags according to result
        jmp     #LMM_loop

#ifndef EXTERNAL_FLT_CMP

'------------------------------------------------------------------------------
' _FCmp    set Z and C flags for r0 - r1
' changes: t1
'------------------------------------------------------------------------------

_FCmp
flt_cmp
         mov     t1, r0         ' compare signs
         xor     t1, r1
         and     t1, Bit31 wz
  if_z   jmp     #cmp1          ' same, then compare magnitude

         mov     t1, r0         ' check for +0 or -0
         or      t1, r1
         andn    t1, Bit31 wcz
  if_z   jmp     #LMM_loop

         test    r0, Bit31 wc   ' compare signs
         jmp     #LMM_loop

cmp1     test    r0, Bit31 wz   ' check signs
  if_nz  jmp     #cmp2
         cmp     r0, r1 wcz
         jmp     #LMM_loop
cmp2     cmp     r1, r0 wcz   ' reverse test if negative
         jmp     #LMM_loop

#endif

xfer          long    $0      ' set up during initialization
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
              setd    XMM_Dst,#BC               ' dest register is BC
              jmp     #XMM_ReadInstr                ' 
XMM_ReadRI
              setd    XMM_Dst,#RI               ' dest register is RI
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
#define NEED_XMM_READPAGE
'#define NEED_XMM_WRITEPAGE
'                                    
#ifdef CACHED
' When the cache is in use, all platforms use the same XMM code
#include "cached.inc"
#else
#error XMM PROGRAMS REQUIRE CACHE OPTION (CACHED_1K .. CACHED_64K or CACHED)
#endif
'============================ END OF XMM SUPPORT CODE ==========================
'
' lockbits must be in the same place in all LMM kernels

         fit    $1ea
         orgf   $1ea

lockbits long   0               ' lockbits used to simulate P1-style locks
                                ' must match xmmd.s and xmmbeg.s

' last 5 longs are reserved for debug overlay vectors (or debug LED)

         fit    $1eb                  
         orgf   $1eb

DEBUG_VECTORS
#ifdef DEBUG_LED
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
         long   DEBUG_BREAK
         long   DEBUG_ADDR
         long   DEBUG_OUT
         long   DEBUG_IN
         long   DEBUG_FLAG
#endif
         fit    $1f0
'
'------------------------- END OF KERNEL --------------------------------------
'
         org $300

' Common Kernel library functions. This code is included only to get the LUT
' offsets correct in the dynamically loaded kernel. The actual LUT code is 
' loaded into LUT from elsewhere. There must be a better way to do this, but I
' can't think of one at the moment :(

#include "klib.inc"

#include "xmmklib.inc"


