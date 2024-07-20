{{
'------------------------------------------------------------------------------
' Catalina_LMM_threaded - Implements a multi-threaded Large Memory Model Kernel
'                         intended for use by the Catalina Code Generator 
'                         backend for LCC 
'
' This kernel has no internal floating point support - the
' floating point routines are sent off to the Float32A plugin.
' This makes this LMM slower, but gives more space.
'
' Version 2.7 - initial version - by Ross Higson
' Version 3.5 - Minor virtual machine changes (e.g. load_i replaced load_a)
'             - Tidy up initialization (no longer need to pass stack) 
' Version 3.6 - New smaller image format. 
'               New smaller division.
' Version 3.15 - Modified for P2.
'
'
' This file incorporates software derived from:
'    Float_32A by Cam Thompson, Micromega Corporation, 
'              Copyright (c) 2006-2007 Parallax, Inc.
'
'------------------------------------------------------------------------------
'
'    Copyright 2009 Ross Higson
'
'    The portion of this file identified as the LMM Kernel is part of the 
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

#ifdef BLACKBOX
#error : THREADED KERNEL DOES NOT CURRENTLY SUPPORT THE BLACKBOX DEBUGGER
#endif

CON

#include <constant.inc>

' NO_INTERRUPTS - if defined, we can the use SKIPF because this code will not  
'                 be used in an interrupt service routine. Can be defined here 
'                 or on the command-line (i.e. -C NO_INTERRUPTS)

'#ifndef NO_INTERRUPTS
'#define NO_INTERRUPTS
'#endif

'--------------------- Start of LMM Kernel ------------------------------------

DAT

        org 0
KERNEL_START

' the first $73 longs must be in the same place in all LMM and XMM kernels,  
' to allow for the separate compilation of code that uses these locations

INIT    jmp #lmm_init          '$00 ' CAN ONLY BE CALLED ONCE !!!
SPEC    jmp #special           '$01
LODL    jmp #load_l            '$02
LODI    jmp #load_i            '$03
LODF    jmp #fp_ind            '$04
PSHL    jmp #push_l            '$05
PSHB    jmp #push_b            '$06
CPYB    jmp #copy_b            '$07
NEWF    jmp #new_fp            '$08
RETF    jmp #fp_ret            '$09
CALA    jmp #f_call            '$0a
RETN    jmp #f_ret             '$0b
CALI    jmp #f_cali            '$0c
JMPA    jmp #f_jump            '$0d
JMPI    jmp #f_jmpi            '$0e
DIVS    jmp #f_d32s            '$0f
DIVU    jmp #f_d32u            '$10
MULT    jmp #f_m32             '$11
BR_Z    jmp #bra_z             '$12
BRNZ    jmp #bra_nz            '$13
BRAE    jmp #bra_ae            '$14
BR_A    jmp #bra_a             '$15
BRBE    jmp #bra_be            '$16
BR_B    jmp #bra_b             '$17
SYSP    jmp #plugin            '$18
PSHA    jmp #push_a            '$19
FADD    jmp #flt_add           '$1a
FSUB    jmp #flt_sub           '$1b
FMUL    jmp #flt_mul           '$1c
FDIV    jmp #flt_div           '$1d
FCMP    jmp #flt_cmp           '$1e
FLIN    jmp #flt_int           '$1f
INFL    jmp #int_flt           '$20
PSHM    jmp #push_m            '$21
POPM    jmp #pop_m             '$22
PSHF    jmp #push_i            '$23
RLNG    jmp #rd_long           '$24
RWRD    jmp #rd_word           '$25
RBYT    jmp #rd_byte           '$26
WLNG    jmp #wr_long           '$27
WWRD    jmp #wr_word           '$28
WBYT    jmp #wr_byte           '$29

req     long  0                '$2a request block address

#ifdef QUICKBUILD
PC      long 0                 '$2b
#else
PC      long @C_main           '$2b
#endif
SP      long 0                 '$2c set up during initialization
FP      long 0                 '$2d
RI      long 0                 '$2e
BC      long 0                 '$2f
DBG1    long 0                 '$30 debug opAddr
DBG2    long 0                 '$31 debug temp
        long 0                 '$32 spare

r0      long 0                 '$33
r1      long 0                 '$34 
r2      long 0                 '$35 
r3      long 0                 '$36 
r4      long 0                 '$37 
r5      long 0                 '$38 
r6      long 0                 '$39 
r7      long 0                 '$3a 
r8      long 0                 '$3b 
r9      long 0                 '$3c 

extra_init
r10     call #INITIALIZE_THREAD '$3d
r11     rdlong r3,r14           '$3e
r12     rdlong r2,r15           '$3f
r13     ret                     '$40 
r14     long ARGC_ADDR          '$41 
r15     long ARGV_ADDR          '$42

r16     long 0                 '$43 
r17     long 0                 '$44 
r18     long 0                 '$45 
r19     long 0                 '$46
r20     long 0                 '$47
r21     long 0                 '$48
r22     long 0                 '$49
r23     long 0                 '$4a
'                             
Bit31   long  $80000000        '$4b
all_1s  long  $ffffffff        '$4c
cviu_m1 long  $000000ff        '$4d
cviu_m2 long  $0000ffff        '$4e
top8    long  $ff000000        '$4f ' top 8 bits bitmask
low24   long  $00ffffff        '$50 ' low 24 bits bitmask

Save_PC long  0                '$51
reg     long  0                '$52 registry address

' NOTE - the initial values below are used only during kernel initialization

t1      long  HUB_TOP          '$53
t2      long  FREE_MEM         '$54
t3      long  REQUESTS         '$55
t4      long  REGISTRY         '$56

ct1     long  0                '$57
ct2     long  0                '$58
ct3     long  0                '$59

' lmm_init : initialize VM - note that this code may be overlaid by 
'            17 longs of debug code once initialization is complete  
'            It must be kept the same length as the main kernel.

DEBUG_OVERLAY
lmm_init
#ifdef QUICKBUILD
        rdlong  reg,PTRA++      '$5a  1 load registry address (used later)   
        cogid   r2              '$5b  2 register ...
        shl     r2,#2           '$5c  3 ... ourselves ...
        add     r2,reg          '$5d  4 ... as ...
        rdlong  req,r2          '$5e  5 ... a ...
        and     req,low24       '$5f  6 ... new ...
        wrlong  req,r2          '$60  7  kernel
        rdlong  PC,PTRA++       '$61  8 load initial PC
        rdlong  SP,PTRA++       '$62  9 load initial SP
        rdlong  r0,PTRA++       '$63 10 load initial LUT library size (-1)
        rdlong  r1,PTRA++       '$64 11 load initial LUT library address
        rdlong  r3,PTRA++       '$65 12 load initial arg1
        rdlong  r2,PTRA++       '$66 13 load initial arg2
        setq2   r0              '$67 14 copy lut library ...
        rdlong  $100,r1         '$68 15 ... to LUT RAM, starting at $100
        mov     t1,#0           '$69 16 zero ...
        wrlong  t1,req          '$6a 17 ... our request block
        call    #INITIALIZE_THREAD '$6b 18 set up initial thread
        jmp     #LMM_Loop       '$6c 19 start executing C code
        long    0               '$6d 20
#else
        wrlong  t1,t2           '$5a 1 set up free memory pointer
        mov     reg,t4          '$5b 2 point to registry
        cogid   t3              '$5c 3 get our cog id
        shl     t3,#2           '$5d 4 point to ...
        add     t4,t3           '$5e 5 ... our registry entry
        rdlong  req,t4          '$5f 6 get our request block
        andn    req,top8        '$60 7 register ...    
        wrlong  req,t4          '$61 8 ... this kernel
        setq2   #(LUT_LIBRARY_END - LUT_STARTUP - 1) '$62 9 load start/library code ...
        rdlong  0, ##@LUT_STARTUP '$63&64 10&11 ... to LUT RAM
        mov     t1,#0           '$65 12 zero ...
        wrlong  t1,req          '$66 13 ... our request block
        neg     t1,#1           '$67 14 set ... MEM_LOCK ...
        wrlong  t1,##MEM_LOCK   '$68&69 15&16 ... to unused
        rdlong  SP,t2           '$6a 17 set up initial stack pointer
        call    #_C_init        '$6b 18 execute C startup code
        call    #extra_init     '$6c 19 execute additional startup code
        jmp     #LMM_Loop       '$6d 20 start executing C code
#endif
'
' LMM_next - increment the PC then execute the instruction pointed to by the new PC
'        
LMM_next
        add    PC,#4            '$6e
'
' LMM_loop - Fetch an instruction from HUB RAM to COG RAM and execute it.
' The basic LMM loop is unrolled 4 times to increase speed.
'
LMM_loop
        stalli                  '$6f
        rdlong LMM_1,PC         '$70
        add    PC,#4            '$71
        nop                     '$72 P2 needs an extra NOP
LMM_1
        nop                     '$73
        allowi
        jmp    #LMM_check       ' check if context switch is due yet
'
'load_l - load the long stored at the PC into RI, incrementing the PC
'
load_l
       rdlong RI,PC         ' load the address
       jmp    #LMM_next_chk ' increment PC, execute next instruction
'
'load_i - load the long at the address stored at the PC into RI, 
'         incrementing the PC (i.e. load indirect)
'
load_i
       rdlong RI,PC         ' load the address
       rdlong RI,RI         ' load the long at that address
       jmp    #LMM_next_chk ' increment PC, execute next instruction
'
' fp_ind - load the FP into RI, then add the long at the PC to result, incrementing the PC
'
fp_ind
       rdlong RI,PC         ' load the long value
       adds   RI,FP         ' add the frame pointer
       jmp    #LMM_next_chk ' increment PC, execute next instruction
'
' push_l - push a long value in RI onto the stack, decrementing the SP
'
push_l
       sub    SP,#4         ' decrement SP
       wrlong RI,SP         ' save value on stack
       jmp    #LMM_check    ' increment PC, execute next instruction
'
' push_a - push a value whose address is specified indirectly in a global
'          variable onto the stack
'
push_a
       rdlong RI,PC         ' load the address
       jmp    #push_x       ' use the result as an address of the value to push
'
' push_i - push a value whose address is specified indirectly in a frame variable
'          onto the stack
'
push_i
       rdlong RI,PC         ' load the long value
       adds   RI,FP         ' add the frame pointer
push_x
       rdlong RI,RI         ' read the value at that address
       sub    SP,#4         ' decrement SP
       wrlong RI,SP         ' save value on stack
       jmp    #LMM_next_chk ' increment PC, execute next instruction
'
' push_m - push many registers (specified by long at PC) onto the stack,
' decrementing the SP before each one
'
push_m
       rdlong RI,PC         ' load the long value specifying the registers to push
       mov    t1,RI         ' save register specification for later
       mov    t2, #r6       ' start with ...
       shr    RI,#6         ' ... r6 ...
       test   RI,#$1FF wz   ' ... or ...
  if_z shr    RI,#9         ' ... with ...
  if_z mov    t2,#r15       ' ... r15 if r6 - r15 not used
push_nxt
       shr    RI,#1 wcz     ' save rX?
 if_c  sub    SP,#4         ' yes - save ...
 if_c  altd   t2
 if_c  wrlong 0-0,SP        ' ... register
       add    t2,#1         ' point to next register
 if_nz jmp    #push_nxt    ' continue till all registers checked
       sub    SP,#4         ' save ...
       wrlong t1,SP         ' .... register specification
       jmp    #LMM_next     ' increment PC, execute next instruction
'
' pop_m - pop many registers (specified by the long on top of stack) 
' from the stack, incremening the SP after each one
'
pop_m
       rdlong RI,SP         ' load ...
       add    SP,#4         ' ... register specification to pop
       mov    t2, #r23      ' start with ...
       shl    RI,#(32-24)   ' ... r23         
pop_nxt
       shl    RI,#1 wcz     ' load rX?
 if_c  altd   t2 
 if_c  rdlong 0-0,SP        ' ... load ...
 if_c  add    SP,#4         ' ... the register
 if_z  jmp    #LMM_loop     ' execute next instruction if all done
       sub    t2,#1         ' point to previous register
       jmp    #pop_nxt      ' continue till all registers popped
'
' push_b - push a structure (size in bytes at the PC) pointed to by R0
'          onto the stack, decrementing the SP.
'
push_b
       rdlong BC,PC         ' load the byte count
       add    PC,#4         ' increment the PC
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
       rdlong BC,PC         ' load the byte count
       add    PC,#4         ' increment the PC
       mov    t1,R1         ' source is in R1
       mov    t2,R0         ' destination is in R0
'
copy_bytes
       tjz    BC,#LMM_loop  ' no more to copy
       rdbyte t3,t1         ' read from src to t3
       wrbyte t3,t2         ' write t3 to dst
       add    t1,#1         ' increment source
       add    t2,#1         ' increment destination
       sub    BC,#1         ' decrement count ...
       jmp    #copy_bytes   ' ... and keep copying
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
       jmp    #LMM_check    ' execute the next instruction
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
       add    SP,#8         ' increment the SP
       jmp    #LMM_check    ' execute the next instruction
'
' f_call - call the routine at the address pointed to by the PC (increment the PC)
' f_cali - call the routine whose address is in RI
'
f_call                    
       rdlong RI,PC         ' get the address to call
       add    PC,#4         ' increment the PC (this is the return address)
f_cali
       sub    SP,#8         ' decrement the SP
       wrlong PC,SP         ' save current PC to stack
       jmp    #f_jmpi       ' jump to location in RI
'
' f_jump - jump to the location at the address pointed to by PC (increment the PC)
'
f_jump
       rdlong PC,PC         ' get the address to jump to
       jmp    #LMM_check    ' execute next instruction
'
' f_jmpi - jump to the location whose address in RI
'
f_jmpi
       mov    PC,RI         ' get the address to jump to
       jmp    #LMM_check    ' execute next instruction
'
' rd_long/rd_word/rd_byte : Read long/word/byte from HUB memory at address in RI into BC.
'
' On entry:
'    RI : address to read
' On exit:
'    BC : long/word/byte read
'
rd_long
        rdlong  BC,RI
        jmp     #LMM_next_chk
rd_word
        rdword  BC,RI
        jmp     #LMM_next_chk
rd_byte
        rdbyte  BC,RI
        jmp     #LMM_next_chk
'
' wr_long/wr_word/wr_byte : Write long/word/byte to HUB memory at address in RI into BC.
'
' On entry:
'    RI : address to write
'    BC : long/word/byte to write
' On exit:
'    (none)
'
wr_long
        wrlong  BC,RI
        jmp     #LMM_next_chk
wr_word
        wrword  BC,RI
        jmp     #LMM_next_chk
wr_byte
        wrbyte  BC,RI
        jmp     #LMM_next_chk

'f_d32s - Signed 32 bit division
'         Divisor --> r1
'         Dividend--> r0
'         Result --> Quotient in r0
'                    Remainder in r1

f_d32s
        call    #\signed_d32     ' perform signed division
        jmp     #LMM_check

'f_d32u - unsigned 32 bit division 
'         Divisor : r1
'         Dividend : r0
'         Result:
'             Quotient in r0
'             Remainder in r1

f_d32u
        call    #\unsigned_d32   ' perform signed division
        jmp     #LMM_check
        

'f_m32 - multiplication
'        r0 : 1st operand (32 bit)
'        r1 : 2nd operand (32 bit)
'        Result:
'           Product in r0 (<= 32 bit)

f_m32
        qmul   r0,r1
        getqx  r0
        jmp    #LMM_check

' bra_xx - branch if condition is true to the address at the PC,
'          otherwise, just increment the PC by 4

bra_z
  if_z  jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next_chk ' increment PC, execute next instruction
bra_nz
 if_nz  jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next_chk ' increment PC, execute next instruction
bra_ae
 if_ae  jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next_chk ' increment PC, execute next instruction
bra_a
 if_a   jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next_chk ' increment PC, execute next instruction
bra_be
 if_be  jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next_chk ' increment PC, execute next instruction
bra_b
 if_b   jmp    #f_jump       ' if condition true, branch is equiv to jump
        jmp    #LMM_next_chk ' increment PC, execute next instruction

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

plugin
        call    #\do_plugin     ' do_plugin does all the work
        jmp     #LMM_check

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
        call    #\do_plugin     ' request the service
        mov     r2,ftmp2        ' restore r2
        mov     r3,ftmp3        ' restore r3
#ifdef P2
        cmps    r0,#0 wcz       ' set C & Z flags according to result
#else
        cmps    r0,#0 wz,wc     ' set C & Z flags according to result
#endif
        jmp     #LMM_check
'       
'-------------------------- Multi-Threading Support ----------------------------
'
' LMM_check - check whether we should context switch (and switch if so)
'                 
LMM_next_chk
        add     PC,#4
LMM_check
        stalli
        djnz    ticks, #LMM_loop ' if ticks not yet zero, don't context switch
        mov     ticks, #100      ' in case we cannot get lock, set up ticks to wait before retry
        muxc    flags, #1        ' save C ...
        muxnz   flags, #2        ' ... and Z flags
        cmps    lock,#0 wcz      ' lock set yet?
  if_b  jmp     #LMM_resume      ' no - cannot switch yet
#ifdef P2
        bith    lockbits,lock wcz    ' have we acquired ...              
 if_nz  locktry lock wc              ' ... both intra-cog and inter-cog locks?
 if_nc_and_nz  bitl lockbits,lock    ' true = if_c_and_nz, false = if_nc_or_z
 if_nc_or_z  jmp #LMM_resume    ' no - cannot switch - restore C & Z and resume
#else
        lockset lock wc         ' have we acquired the context switch lock?
 if_c   jmp     #LMM_resume     ' no - cannot switch - restore C & Z and resume
#endif
        rdlong  t2, TP          ' yes - load next thread block pointer
        rdlong  t1, req wz      ' is there an affinity request oustanding?
 if_nz  jmp     #LMM_affine     ' yes - service it         
        cmp     t2, TP wz       ' no - is there only one thread executing?
 if_z   jmp     #LMM_unlock     ' yes - restore C & Z flags, unlock and resume
LMM_switch
        mov     t3, t2          ' no - get ...
        add     t3, #THREAD_AFF_OFF*4+1 ' ... affinity byte 
        rdbyte  t1, t3          ' ... of proposed next thread
        test    t1, #%11100000 wz ' affinity stop, or thread terminated or completed?
  if_z  jmp     #:next          ' no - switch to next thread
        or      t1, #%10000000  ' yes - make sure ...
        wrbyte  t1, t3          ' ... thread terminated bit of next thread is set
        rdlong  t2, t2          ' remove next thread ...
        wrlong  t2, TP          ' ... from the executing thread list
:next   mov     t1, TP          ' point to ...  
        add     t1, #THREAD_REG_OFF*4 ' ... current thread register save area
#ifdef P2
        setq    #32-1           ' save 32 registers ...
        wrlong  PC,t1           ' ... to register save area
        add     t1,#(THREAD_AFF_OFF-THREAD_REG_OFF)*4 ' point to flag save area
#else
        movd    :save, #PC      ' starting from PC 
        mov     t3, #32         ' ... save 32 registers
:save   wrlong  0-0, t1
        add     t1, #4
        add     :save, dlsb
        djnz    t3, #:save
#endif
        wrbyte  flags, t1       ' save C & Z flags
        mov     TP, t2          ' set TP to next thread block
        add     t2, #THREAD_REG_OFF*4 ' point to that thread's register save area
#ifdef P2
        setq    #32-1           ' load 32 registers ...
        rdlong  PC,t2           ' ... from register save area
        add     t2,#(THREAD_AFF_OFF-THREAD_REG_OFF)*4 ' point to flag save area
#else
        movd    :load, #PC      ' starting from PC ...
        mov     t3, #32         ' ... load 32 registers
:load   rdlong  0-0, t2
        add     t2, #4
        add     :load, dlsb
        djnz    t3, #:load
#endif
        rdbyte  flags, t2       ' load C & Z flags
        add     t2,#2           ' load ...
        rdword  ticks, t2       ' ... tick count assigned to this thread
LMM_unlock        
#ifdef P2
        lockrel lock                 ' release inter-cog lock
        bitl    lockbits,lock        ' release intra-cog lock
LMM_resume
        shr     flags, #1 wcz   ' restore Z & C flags ...
#else        
        lockclr lock            ' release the context switch lock
LMM_resume
        shr     flags, #1 wc,wz ' restore Z & C flags ...
#endif
        allowi
        jmp     #LMM_loop       ' ... and resume execution
LMM_affine
        cmp     t2, TP wz       ' is there only one thread executing?
 if_nz  rdlong  t3, t2          ' no - get next thread of next thread ...        
 if_nz  wrlong  t3, t1          ' no - ... and make it next thread of new thread
 if_z   wrlong  t2, t1          ' yes - make new thread next thread of current thread 
        wrlong  t1, t2          ' make current thread next thread of new thread 
        mov     ftemp, #THREAD_AFF_OFF*4+1  ' update ...
        add     ftemp, t1       ' ...
        rdbyte  ftmp2, ftemp    ' ...
        cogid   ftmp3           ' ...
        andn    ftmp2, #%111    ' ...
        or      ftmp2, ftmp3    ' ...
        wrbyte  ftmp2, ftemp    ' ... thread affinity
        mov     ftemp, #0       ' zero ...
        wrlong  ftemp, req      ' ... request block
        jmp     #LMM_switch     ' now switch to next thread
LMM_force                       ' NOTE IF THIS CHANGES, CHANGE threads_misc.e !!
        stalli
        muxc    flags, #1       ' force context switch - save C ...
        muxnz   flags, #2       ' ... and Z flags
        rdlong  t2, TP          ' load next thread pointer
        rdlong  t1, req wz      ' is there an affinity request oustanding?
 if_nz  jmp     #LMM_affine     ' yes - service it         
        cmp     t2, TP wz       ' is there only one thread executing?
 if_nz  jmp     #LMM_switch     ' no - perform context switch
        jmp     #LMM_unlock     ' yes - unlock, restore C & Z amd resume

'--------------------- End of LMM Kernel --------------------------------------

'---------------------------- local constants ---------------------------------

#ifndef P2
dlsb          long   1<<9
#endif

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

'------------------------------------------------------------------------------
' _FCmp    set Z and C flags for r0 - r1
' changes: t1
'------------------------------------------------------------------------------

flt_cmp
_FCmp                   mov     t1, r0        ' compare signs
                        xor     t1, r1
                        and     t1, Bit31 wz
          if_z          jmp     #cmp1                  ' same, then compare magnitude

                        mov     t1, r0               ' check for +0 or -0
                        or      t1, r1
                        andn    t1, Bit31 wcz
          if_z          jmp     #LMM_check

                        test    r0, Bit31 wc         ' compare signs
                        jmp     #LMM_check

cmp1                    test    r0, Bit31 wz         ' check signs
          if_nz         jmp     #cmp2
                        cmp     r0, r1 wcz
                        jmp     #LMM_check
cmp2                    cmp     r1, r0 wcz           ' reverse test if negative
                        jmp     #LMM_check


'-------------------- End of Float32 Components -------------------------------

'---------------------------- local variables ---------------------------------

xfer                    long    0

' temporary storage used in mul & div calculations

ftemp                   long    0
ftmp2                   long    0
ftmp3                   long    0

'-------------------------- Multi-Threading Support ----------------------------

' These must be in the same place in all the threaded kernels of the 
' same 'flavor' (i.e. CMM, LMM, NMM etc). 

         fit    $1e6
         orgf   $1e6

ticks    long   100             ' time till next thread swap (~10 milliseconds)
flags    long   0               ' used for storing flags
TP       long   0               ' current thread pointer
lock     long   -1              ' lock to use for context switching)
lockbits long   0               ' lockbits used to simulate P1-style locks

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

'------------------------- END OF KERNEL --------------------------------------



