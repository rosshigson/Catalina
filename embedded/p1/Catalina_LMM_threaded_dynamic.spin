{{
'------------------------------------------------------------------------------
' Catalina_LMM_threaded_dynamic - Implements a dynamically loadable 
'                         multi-threaded Large Memory Model Kernel
'                         intended for use by the Catalina Code Generator 
'                         backend for LCC 
'
' This kernel has no internal floating point support - the
' floating point routines are sent off to the Float32A plugin.
' This makes this LMM slower, but gives more space.
'
' Version 2.7 - initial version - by Ross Higson
' Version 3.5 - Minor virtual machine changes (e.g. load_i replaced load_a).
'             - Tidy up initialization (no longer need to pass stack) 
' Version 3.6 - New smaller image format. 
'               New smaller division.
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
'
OBJ
   common : "Catalina_Common"
   
PUB Entry_Addr : addr

   addr := @entry ' Kernel Entry Address
  '
  ' NOTE: Start now replaced by Run (below) - and only one of them can be 
  ' compiled at any one time due to assumptions in the loader about how 
  ' many methods the kernel has
  '
{
PUB Base : addr
   addr := @@0 ' Kernel Base Address

PUB Start : cog
  ' Starts the kernel in a new cog and returns

  cog := cognew(@entry, Common#REGISTRY)

}

PUB Run (Initial_BA, Initial_SP) : cog
  ' Starts the kernel in the current cog and never returns

  ' set up base address and stack pointer in this cog's request block
  long[Common#REQUESTS][2 * cogid + 1] := Initial_SP
  long[Common#REQUESTS][2 * cogid]     := Initial_BA
  ' now restart this cog as the kernel
  coginit(cogid, @entry, Common#REGISTRY)

DAT
 org 0
'
entry
'
'--------------------- Start of LMM Kernel ------------------------------------
'
   jmp #INIT            '$00
'
'------------------------------------------------------------------------------
   jmp #INIT            '$01 remove this line when using POD, since it
                        '    adds a jump instruction before the program
'------------------------------------------------------------------------------
'
INIT    jmp #lmm_init   '$02
LODL    jmp #load_l     '$03
LODI    jmp #load_i     '$04
LODF    jmp #fp_ind     '$05
PSHL    jmp #push_l     '$06
PSHB    jmp #push_b     '$07
CPYB    jmp #copy_b     '$08
NEWF    jmp #new_fp     '$09
RETF    jmp #fp_ret     '$0a
CALA    jmp #f_call     '$0b
RETN    jmp #f_ret      '$0c
CALI    jmp #f_cali     '$0d
JMPA    jmp #f_jump     '$0e
JMPI    jmp #f_jmpi     '$0f
DIVS    jmp #f_d32s     '$10
DIVU    jmp #f_d32u     '$11
MULT    jmp #f_m32      '$12
BR_Z    jmp #bra_z      '$13
BRNZ    jmp #bra_nz     '$14
BRAE    jmp #bra_ae     '$15
BR_A    jmp #bra_a      '$16
BRBE    jmp #bra_be     '$17
BR_B    jmp #bra_b      '$18
SYSP    jmp #plugin     '$19
PSHA    jmp #push_a     '$1a
FADD    jmp #flt_add    '$1b
FSUB    jmp #flt_sub    '$1c
FMUL    jmp #flt_mul    '$1d
FDIV    jmp #flt_div    '$1e
FCMP    jmp #flt_cmp    '$1f
FLIN    jmp #flt_int    '$20
INFL    jmp #int_flt    '$21
PSHM    jmp #push_m     '$22
POPM    jmp #pop_m      '$23
PSHF    jmp #push_i     '$24
RLNG    jmp #rd_long    '$25
RWRD    jmp #rd_word    '$26
RBYT    jmp #rd_byte    '$27
WLNG    jmp #wr_long    '$28
WWRD    jmp #wr_word    '$29
WBYT    jmp #wr_byte    '$2a
'                           
PC      long 0          '$2b
SP      long 0          '$2c
FP      long 0          '$2d
RI      long 0          '$2e
BC      long 0          '$2f
BA      long 0          '$30
BZ      long 0          '$31
CS      long 0          '$32
'
r0      long 0          '$33
r1      long 0          '$34
r2      long 0          '$35
r3      long 0          '$36
r4      long 0          '$37
r5      long 0          '$38
r6      long 0          '$39
r7      long 0          '$3a
r8      long 0          '$3b
r9      long 0          '$3c
r10     long 0          '$3d
r11     long 0          '$3e
r12     long 0          '$3f
r13     long 0          '$40
r14     long 0          '$41
r15     long 0          '$42
r16     long 0          '$43
r17     long 0          '$44
r18     long 0          '$45
r19     long 0          '$46
r20     long 0          '$47
r21     long 0          '$48
r22     long 0          '$49
r23     long 0          '$4a
'
Bit31   long  $80000000        '$4b
all_1s  long  $ffffffff        '$4c
cviu_m1 long  $000000ff        '$4d
cviu_m2 long  $0000ffff        '$4e
top8    long  $ff000000        '$4f ' top 8 bits bitmask
low24   long  $00ffffff        '$50 ' low 24 bits bitmask
'                             
init_B0                        ' must match lmm_progbeg.s!
'
init_BZ long  $00000000        '$51 ' end of code / start of heap
init_PC long  $00000000        '$52 ' the initial PC
'
' lmm_init : initialize VM - note that this code is kept 17 longs long
'            to make various offsets match the main kernel, where this
'            code may be overlaid by 17 longs of debug code once 
'            initialization is complete - eventually, the same may be
'            true of this kernel as well.
'
lmm_init
        rdword  reg,par         '1 get registry address (used later)
        cogid   r1              '2 calculate ...
        shl     r1,#2           '3 ... our ...
        add     r1,reg          '4 ... request block address
        rdword  req,r1          '5 ... (used later) ...
        wrlong  req,r1          '6 ... and register ourselves
        mov     r0,par          '7 load my dynamic data block addr
        add     r0,#4           '8 point to initial PC
        rdlong  PC,r0           '9 load initial PC
        add     r0,#4           '10 point to initial SP
        rdlong  SP,r0           '11 load initial SP
        add     r0,#4           '12 point to argc/argv/return address
        call    #LMM_frame      '13 set up initial frame
        mov     r0,#0           '14 zero ...
        wrlong  r0,req          '15 ... our request block  
        call    #LMM_context    '16 initialize threading context  
        jmp     #LMM_loop       '17 we can now start executing LMM code
'
' LMM_next - increment the PC then execute the instruction pointed to by the new PC
'        
LMM_next
        add    PC,#4
'
' LMM_loop - Fetch an instruction from HUB RAM to COG RAM and execute it.
' The basic LMM loop is unrolled 4 times to increase speed.
'
LMM_loop
        rdlong LMM_1,PC
        add    PC,#4
LMM_1
        nop
        rdlong LMM_2,PC
        add    PC,#4
LMM_2
        nop
        rdlong LMM_3,PC
        add    PC,#4
LMM_3
        nop
        rdlong LMM_4,PC
        add    PC,#4
LMM_4
        nop
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
       movd   :push_x,#r6   ' start with ...
       shr    RI,#6         ' ... r6
:push_nxt
       shr    RI,#1 wc,wz   ' save rX?
 if_c  sub    SP,#4         ' yes - save ...
:push_x                     ' ... the ...
 if_c  wrlong 0-0,SP        ' ... register
       add    :push_x,dlsb  ' point to next register
 if_nz jmp    #:push_nxt    ' continue till all registers checked
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
       tjz    BC,#LMM_check ' no more to copy
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
       jmp    #LMM_check    ' execute the next instruction
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
        jmp     #LMM_check
'
'f_d32u - unsigned 32 bit division 
'         Divisor : r1
'         Dividend : r0
'         Result:
'             Quotient in r0
'             Remainder in r1
'
f_d32u  movs    f_d32_ret,#LMM_check ' set return to #LMM_loop & fall into div
        
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
        jmp  #LMM_check
        
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
        jmp #LMM_check
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
        mov ftemp,#0
:start
        cmp r0,#0       WZ
 if_e   jmp #:down3
        shr r0,#1       WC
 if_ae  jmp #:down2
        add ftemp,r1    WC
:down2
        shl r1,#1       WC
        jmp #:start
:down3
        mov r0,ftemp
        jmp #LMM_check
'
' bra_xx - branch if condition is true to the address at the PC,
'          otherwise, just increment the PC by 4
'
'
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
        jmp     #LMM_check
'
plugin2
        mov     ftemp,#8        ' ftemp stores lock - default to none required
        mov     r0,r3 wc        ' get plugin type or cog id or service id
 if_b   jmp     #psvc           ' if < 0, code is a service id
        test    r0,#$80 wz      ' if bit 7 set ...
 if_nz  jmp     #pcog           ' code is a cog id ...
ptype                           ' ... otherwize it's a plugin type
        mov     t1,reg          ' point to registry (NOTE CHANGE!)
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
        add     r0,reg          ' ... from ... (NOTE CHANGE!)
        rdword  r0,r0           ' ... the service registry
        mov     t1,r0           ' save in t1 and extract ...
        shr     r0,#12          ' ... cog number to r0
        mov     ftemp,t1        ' save in ftemp and extract ...
        and     t1,#$7f         ' ... 7 bit plugin-specific code ...
        shl     t1,#24 wz       ' ... to t1 (top 8 bits) ...
  if_z  jmp     #plugerr        ' ... or throw error if request code is zero
        shr     ftemp,#7        ' put lock number in lower 5 bits of ftemp
        test    ftemp,#8 wz     ' are we required to use a lock?
 if_nz  jmp     #no_lock        ' no - just make the request
set_lock
        lockset ftemp wc        ' yes - loop ...
 if_c   jmp     #set_lock       ' ... until we have set the lock
no_lock
'        and     r2,low24        ' combine data ...
        or      r2,t1           ' ... with request code
pcog
        and     r0,#7           ' mask off cog id to 0 .. 7
        shl     r0,#2           ' point to ...
        add     r0,reg          ' ... registry entry for the cog (NOTE CHANGE!)
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
plugin2_ret
        ret
plugerr 
        neg     r0,#1           ' plugin error (e.g. not registered)
        jmp     #clr_lock       ' done - clear lock if required
'
'------------------------------------------------------------------------------
' Float32 Assembly language routines
'------------------------------------------------------------------------------
'
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
        jmp     #LMM_check
'       
'-------------------------- Multi-Threading Support ----------------------------
'
' LMM_context - initalize mult-ithreading by creating our first thread block.
'               Also, since we use our request block for threading, we must
'               allocate a new xfer block for floating point operations.
'
LMM_context
        sub     SP,#8           ' reserve space ...
        mov     xfer,SP         ' .. for xfer block at top of stack
        sub     SP,#Common#THREAD_BLOCK_SIZE*4 ' reserve space at top of stack for thread block
        wrlong  SP,SP           ' make it point to itself
        mov     TP,SP           ' save this as current thread block
        mov     t1,TP           ' initialize ...
        add     t1,#Common#THREAD_AFF_OFF*4 ' ... flags ... 
        cogid   t2              ' ... and ... 
        shl     t2,#8           ' ... set ... 
        wrword  t2,t1           ' ... affinity ...
        add     t1,#2           ' ... and ...
        wrword  ticks,t1        ' ... ticks
LMM_context_ret
        ret
'
' LMM_check - check whether we should context switch (and switch if so)
'                 
LMM_next_chk
        add     PC,#4
LMM_check
        djnz    ticks, #LMM_loop ' if ticks not yet zero, don't context switch
        mov     ticks, #100     ' in case we cannot get lock, set up ticks to wait before retry
        muxc    flags, #1       ' save C ...
        muxnz   flags, #2       ' ... and Z flags
        lockset lock wc         ' have we acquired the context switch lock?
 if_c   jmp     #LMM_resume     ' no - cannot switch, so restore C & Z and resume
        rdlong  t2, TP          ' yes - load next thread block pointer
        rdlong  t1, req wz      ' is there an affinity request oustanding?
 if_nz  jmp     #LMM_affine     ' yes - service it         
        cmp     t2, TP wz       ' no - is there only one thread executing?
 if_z   jmp     #LMM_unlock     ' yes - restore C & Z flags, unlock and resume
LMM_switch
        mov     t3, t2          ' no - get ...
        add     t3, #Common#THREAD_AFF_OFF*4+1 ' ... affinity byte 
        rdbyte  t1, t3          ' ... of proposed next thread
        test    t1, #%11100000 wz ' affinity stop, or thread terminated or completed?
  if_z  jmp     #:next          ' no - switch to next thread
        or      t1, #%10000000  ' yes - make sure ...
        wrbyte  t1, t3          ' ... thread terminated bit of next thread is set
        rdlong  t2, t2          ' remove next thread ...
        wrlong  t2, TP          ' ... from the executing thread list
:next   mov     t1, TP          ' point to ...  
        add     t1, #Common#THREAD_REG_OFF*4 ' ... current thread register save area
        movd    :save, #PC      ' starting from PC 
        mov     t3, #32         ' ... save 32 registers
:save   wrlong  0-0, t1
        add     t1, #4
        add     :save, inc_reg
        djnz    t3, #:save
        wrbyte  flags, t1       ' save C & Z flags
        mov     TP, t2          ' set TP to next thread block
        add     t2, #Common#THREAD_REG_OFF*4 ' point to that thread's register save area
        movd    :load, #PC      ' starting from PC ...
        mov     t3, #32         ' ... load 32 registers
:load   rdlong  0-0, t2
        add     t2, #4
        add     :load, inc_reg
        djnz    t3, #:load
        rdbyte  flags, t2       ' load C & Z flags
        add     t2,#2           ' load ...
        rdword  ticks, t2       ' ... tick count assigned to this thread
LMM_unlock        
        lockclr lock            ' release the context switch lock
LMM_resume
        shr     flags, #1 wc,wz ' restore Z & C flags ...
        jmp     #LMM_loop       ' ... and resume execution
LMM_affine
        cmp     t2, TP wz       ' is there only one thread executing?
 if_nz  rdlong  t3, t2          ' no - get next thread of next thread ...        
 if_nz  wrlong  t3, t1          ' no - ... and make it next thread of new thread
 if_z   wrlong  t2, t1          ' yes - make new thread next thread of current thread 
        wrlong  t1, t2          ' make current thread next thread of new thread 
        mov     ftemp, #Common#THREAD_AFF_OFF*4+1 ' update ...
        add     ftemp, t1       ' ...
        rdbyte  ftmp2, ftemp    ' ...
        cogid   ftmp3           ' ...
        andn    ftmp2, #%111    ' ...
        or      ftmp2, ftmp3    ' ...
        wrbyte  ftmp2, ftemp    ' ... thread affinity
        mov     ftemp, #0       ' zero ...
        wrlong  ftemp, req      ' ... request block
        jmp     #LMM_switch     ' now switch to next thread
'
' IMPORTANT NOTE: The following values must match threads_misc.e:
'
'    LMM_force  = $18d
'    lock       = $195
'    TP         = $196
'    reg        = $199
'
' TO ENSURE THIS, WE DO THE FOLLOWING:
'
LMM_fit0
        long    0[$18d - LMM_fit0]
        fit     $18d
        org     $18d
'
LMM_force                       ' NOTE IF THIS CHANGES, CHANGE threads_misc.e !!
        muxc    flags, #1       ' force context switch - save C ...
        muxnz   flags, #2       ' ... and Z flags
        rdlong  t2, TP          ' load next thread pointer
        cmp     t2, TP wz       ' is there only one thread executing?
 if_nz  jmp     #LMM_switch     ' no - perform context switch
        jmp     #LMM_unlock     ' yes - unlock, restore C & Z amd resume
'
ticks   long    100             ' time till next thread swap (~10 milliseconds)
flags   long    0               ' used for storing flags
' NOTE IF THESE ADDRESSES CHANGE, CHANGE threads_misc.e !!
lock    long    -1              ' lock to use for context switching (default 7)
TP      long    0               ' current thread pointer
inc_reg long    $200            ' used to increment destination register by 1
req     long    0               ' request block address
reg     long    0               ' registry address
'
' Initial thread Frame/arguments set up
'
LMM_frame
        rdlong  r3, r0           ' set up argc
        add     r0, #4           ' set up ...
        rdlong  r2, r0           ' ... argv
        add     r0, #4           ' set up ...
        rdlong  r0, r0           ' read return address
        sub     SP, #12          ' allow space for spilled arguments
        wrlong  r0, SP           ' set up return address
LMM_frame_ret
        ret
'
'--------------------- End of LMM Kernel --------------------------------------

'---------------------------- local constants ---------------------------------

dlsb          long   1<<9

'--------------------- Start of Float32 Components ----------------------------

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
          if_z          jmp     #:cmp1        ' same, then compare magnitude

                        mov     t1, r0        ' check for +0 or -0
                        or      t1, r1
                        andn    t1, Bit31 wz,wc
          if_z          jmp     #LMM_check

                        test    r0, Bit31 wc  ' compare signs
                        jmp     #LMM_check

:cmp1                   test    r0, Bit31 wz  ' check signs
          if_nz         jmp     #:cmp2
                        cmp     r0, r1 wz,wc
                        jmp     #LMM_check
:cmp2                   cmp     r1, r0 wz,wc  ' reverse test if negative
                        jmp     #LMM_check


'-------------------- End of Float32 Components -------------------------------

'---------------------------- local variables ---------------------------------

xfer          res    1                        ' set up during initialization
t1            res    1
t2            res    1
t3            res    1
#ifndef OLD_DIVISION
t4            res    1
#endif
'
' temporary storage used in mul & div calculations
'
ftemp         res    1
ftmp2         res    1
ftmp3         res    1
'
' last 5 longs are reserved for debug overlay vectors
'
LMM_fit1
              long    0[$1eb - LMM_fit1]
              fit    $1eb
              org    $1eb
'
DEBUG_VECTORS long   0,0,0,0,0
              fit    $1f0
