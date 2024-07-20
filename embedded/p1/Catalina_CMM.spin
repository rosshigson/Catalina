{{
'------------------------------------------------------------------------------
' Catalina_CMM - Implements a Compact Memory Model Kernel intended
'                for use by the Catalina Code Generator backend 
'                for LCC 
'
' Version 3.7  - initial version - by Ross Higson
' Version 3.13 - combine floating point operations, and add relative jumps
'
'------------------------------------------------------------------------------
'
'    Copyright 2012 Ross Higson
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
CON
'#define DEBUG
'
' The symbol FCACHE_PRIMITIVE adds code to implement FCACHE - this can be done
' outside the kernel, but including it in the kenel is more efficient - but it
' adds 9 longs to the kernel:
'
#define FCACHE_PRIMITIVE
'
' The symbol UNROLL_LMM_LOOP does just what it says - but it adds extra 
' longs to the CMM kernel. The default is to unroll 2 times if this is not
' defined, or to unroll 4 times if it is defined:
'
'#define UNROLL_LMM_LOOP
'
' The symbol EXTERNAL_FLT_CMP forces the flt_cmp operation to the external
' FLOAT32_A plugin. This is because the CMM kernel is slightly too large to
' fit it in (until we manage to save 5 or so longs):
'
#define EXTERNAL_FLT_CMP
'
' The symbol BLACKBOX updates the PC_OFFS on each instruction (whereas the PC
' is only updated after reading each long). This is required for the BlackBox 
' debugger. Normally, this symbol is defined automatically when programs are 
' compiled with -g, so this symbol should not be defined manually:
'
'#define BLACKBOX
'

'
' instruction operand shifts
'
S16A = 1  ' must match catalina_compact.inc
D16A = 6  ' must match catalina_compact.inc
S16B = 2  ' must match catalina_compact.inc
D16B = 2  ' must match catalina_compact.inc
S32  = 2  ' must match catalina_compact.inc
D32  = 11 ' must match catalina_compact.inc
D32S = 21 ' must match catalina_compact.inc

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
PUB Start : cog
  ' Starts the kernel in a new cog and returns
  
  cog := cognew(@entry, Common#REGISTRY)
}  
'{
PUB Run (Initial_BA) : cog
  ' Starts the kernel in the current cog and never returns

  ' set up base address and stack pointer in this cog's request block
  long[Common#REQUESTS][2 * cogid + 1] := long[Common#FREE_MEM]
  long[Common#REQUESTS][2 * cogid]     := Initial_BA
  ' now restart this cog as the kernel
  coginit(cogid, @entry, Common#REGISTRY)
'}
DAT 
         org     0
entry
'
'------------------------------------------------------------------------------
' Register & Relocate are functions used only during Kernel initialization, so
' this code is placed over what will be registers once this initialization has
' completed.
'------------------------------------------------------------------------------
'                          
r0       jmp     #kernel_init   '$00
'
' Register ourselves by zeroing the upper half of our registry enty, 
' and then return the address of our request block in t1. Note that
' we also set up the request block address in xfer, since after
' initialization we use it as a convenient comms block for sending
' requests off to the floating point cogs.
'
' On Entry:
'   t1 : points to our registry entry
' On Exit:
'   t1 : points to our request block
Register
r1       rdword  t2,t1          '$01
r2       wrlong  t2,t1          '$02
r3       mov     t1,t2          '$03
r4       mov     xfer,t1        '$04
Register_ret
r5       ret                    '$05
'
' Relocate - move segments as indicated by the BA. We move all Catalina
'            data (i.e. from BA to BZ) to start at location zero, but do 
'            not overwrite the first 16 bytes of RAM, since they contain
'            special values (clock freq etc). 
'
Relocate
r6       mov     BC,BZ          '$06 ' length of data to be relocated
r7       add     BC,#3          '$07 ' round up ...
r8       andn    BC,#3          '$08 ' ... to a multiple of 4 bytes
r9       sub     BC,#$10        '$09 ' omit first 16 bytes
r10      mov     t2,#$10        '$0a ' destination is byte 16
r11      mov     t1,BA          '$0b ' source is BA ...
r12      add     t1,#$10        '$0c ' ... plus 16 bytes 
reloc_loop
r13      tjz     BC,#Relocate_ret'$0d ' no more to copy
r14      rdlong  t3,t1          '$0e ' read from src to t3
r15      wrlong  t3,t2          '$0f ' write t3 to dst
r16      add     t1,#4          '$10 ' increment source
r17      add     t2,#4          '$11 ' increment destination
r18      sub     BC,#4          '$12 ' decrement count ...
r19      jmp     #reloc_loop    '$13 ' ... and keep copying
Relocate_ret
r20      ret                    '$14
'
r21      long    0              '$15
r22      long    0              '$16
r23      long    0              '$17
'                             
PC       long    0              '$18
SP       long    0              '$19
FP       long    0              '$1a
RI       long    0              '$1b
BC       long    0              '$1c
BA       long    0              '$1d
BZ       long    0              '$1e
CS       long    0              '$1f
'
low8     long   $0000_00FF      '$20
low16    long   $0000_FFFF      '$21
top8     long   $FF00_0000      '$22
low18    long   $0003_FFFF      '$23
sd_mask  long   %000000_0000_0000_000011111_000011111 '$24
INST_OFF                        ' must match INST_OFF in catalina_compact.inc
inst     long   $0000_0000      '$25
dlsb     long   1<<9            '$26
'
FC_TMP                          ' must match FC_TMP in catalina_compact.inc
t1       long   $0000_0000      '$27
t2       long   $0000_0000      '$28
t3       long   $0000_0000      '$29
t4       long   $0000_0000      '$2a
t5       long   $0000_0000      '$2b
t6       long   $0000_0000      '$2c
'
xfer     long   $0000_0000      '$2d set up during initialization
'                             
table_16a
I16A_NOP     nop                '$2e 
I16A_MOV     mov    0,0         '$2f 
I16A_RDBYTE  rdbyte 0,0         '$30   
I16A_RDWORD  rdword 0,0         '$31   
I16A_RDLONG  rdlong 0,0         '$32   
I16A_WRBYTE  wrbyte 0,0         '$33      
I16A_WRWORD  wrword 0,0         '$34      
I16A_WRLONG  wrlong 0,0         '$35      
I16A_ADD     add    0,0         '$36      
I16A_ADDS    adds   0,0         '$37      
I16A_AND     and    0,0         '$38      
I16A_OR      or     0,0         '$39      
I16A_XOR     xor    0,0         '$3a      
I16A_SUB     sub    0,0         '$3b      
I16A_SUBS    subs   0,0         '$3c      
I16A_CMP     cmp    0,0 wz,wc   '$3d 
I16A_CMPS    cmps   0,0 wz,wc   '$3e 
I16A_NEG     neg    0,0         '$3f      
I16A_SHL     shl    0,0         '$41   
I16A_SHR     shr    0,0         '$40   
I16A_SAR     sar    0,0         '$42   
I16A_SHLI    shl    0,#0        '$43   
I16A_SHRI    shr    0,#0        '$44 
I16A_SARI    sar    0,#0        '$45   
I16A_ADDI    add    0,#0        '$46  
I16A_SUBI    sub    0,#0        '$47  
I16A_MOVI    mov    0,#0        '$48 
I16A_ADDSI   adds   0,#0        '$49  
I16A_SUBSI   subs   0,#0        '$4a  
I16A_CMPI    cmp    0,#0 wz,wc  '$4b 
I16A_CMPSI   cmps   0,#0 wz,wc  '$4c 
I16A_NEGI    neg    0,#0        '$4d
'
immi_bit long   %000000_0001_0000_000000000_000000000 '$4e
bit31    long   $8000_0000      '$4f
all_1s   long   $FFFF_FFFF      '$50
'
init_B0                         ' must match cmm_progbeg.s!
'
init_BZ  long   $0000_0000      '$51 end of code / start of heap
init_PC  long   $0000_0000      '$52 the initial PC
'
I16B_BRKP                       ' execute break (when debug overlay loaded)
FC_START                        ' must match FC_START in catalina_compact.inc
kernel_init                     '
         cogid   t1             '$53 1 convert ...
         shl     t1,#2          '$54 2 ... my cog id ...
         add     t1,par         '$55 3 ... to my registration addr
         call    #Register      '$56 4 register ourselves, and get request block
wait
         rdlong  BA,t1 wz       '$57 5 Wait till we are given the base address ...
   if_z  jmp     #wait          '$58 6 .. (required to relocate segments)
         add     t1,#4          '$59 7 Load our initial SP ...
         rdlong  SP,t1          '$5a 8 ... from the request block
         mov     BZ,#(init_BZ-init_B0)<<2+8 '$5b 9 calculate ...
         add     BZ,BA          '$5c 10 ... pointer to initial BZ
         mov     PC,BZ          '$5d 11 load ...
         add     PC,#4          '$5e 12 ... initial  ...
         rdlong  PC,PC          '$5f 13 ... PC and ...
         rdlong  BZ,BZ          '$60 14 ... BZ and ...
         call    #Relocate      '$61 15 ... relocate segments 
         jmp     #read_next     '$62 16 we can now start executing LMM code
         nop                    '$63 17
         nop                    '$64 18
         nop                    '$65 19
         nop                    '$66 20
         nop                    '$67 21
         nop                    '$68 22
         nop                    '$69 23
         nop                    '$6a 24
         nop                    '$6b 25
'
#ifdef BLACKBOX

' when debugging, we have to keep track of offset from current PC

DEBUG_ADJUST
PC_OFFS  long   0               '$6c offset from current PC - i.e. 0 or 2
pasm_16 
         long   0-0             '$6d execute generated instruction 
done_16
         shr    inst,#16        '$6e decode ...
         mov    PC_OFFS,#2      '$6f
         tjnz   inst,#decode    '$70 ... another instruction ?
FC_INLINE                       ' must match FC_INLINE in catalina_compact.inc
done_32
         add    PC,#4           '$71 no - increment PC

EXEC_STOP                       ' must match EXEC_STOP in catalina_compact.inc
read_next
         rdlong inst,PC         '$72 fall through to ...
         mov    PC_OFFS,#0      '
DECODE_OFF                      ' must match DECODE_OFF in catalina_compact.inc
decode
         mov    t1,inst         '$73 test ...

#else

' when NOT debugging, we don't need to keep track of offset from current PC

pasm_16 
         long   0-0             '$6c execute generated instruction 
done_16
         shr    inst,#16        '$6d decode ...
         tjnz   inst,#decode    '$6e ... another instruction ?
FC_INLINE                       ' must match FC_INLINE in catalina_compact.inc
done_32
         add    PC,#4           '$6f no - increment PC

EXEC_STOP                       ' must match EXEC_STOP in catalina_compact.inc
read_next
         rdlong inst,PC         '$70 fall through to ...
DECODE_OFF                      ' must match DECODE_OFF in catalina_compact.inc
decode
         mov    t1,inst         '$71 test ...

#endif

         and    t1,#1           ' ... instruction ...
         tjz    t1,#decode_16a  ' ... type ...
         mov    t1,inst         ' ... to ...
         and    t1,#2           ' ... determine ...
         tjz    t1,#decode_16b  ' ... how to decode
decode_32
         mov    t1,inst         ' extract ...
         shr    t1,#26          ' ... 6 bit opcode
         add    t1,#table_32
         mov    t2,inst         ' extract ...
         shr    t2,#S32         ' ... 24 bits ...
         andn   t2,top8         ' ... of src (or src & dst)
         jmp    t1
table_32
         jmp    #I32_JMPA
         jmp    #I32_CALA
         jmp    #I32_LODI
         jmp    #I32_PSHA
         jmp    #I32_PSHF
         jmp    #I32_PSHM
         jmp    #I32_BR_Z
         jmp    #I32_BRNZ
         jmp    #I32_BRAE
         jmp    #I32_BR_A
         jmp    #I32_BRBE
         jmp    #I32_BR_B
         jmp    #I32_PSHB
         jmp    #I32_CPYB
         jmp    #I32_LODA
         jmp    #I32_NEWF
         jmp    #I32_RETF
         jmp    #I32_LODF
         jmp    #I32_MOV
         jmp    #I32_MOVI
         jmp    #I32_SPILL
         jmp    #I32_CPREP
         jmp    #I32_LODS

pasm_32  long   %000000_0000_1111_000000000_000000000
         jmp    #done_32


' decode 16 bit instruction (set a)
                               
decode_16a
         mov    t2,inst         ' from instruction ....
         shr    t2,#S16A        ' ... extract ...
         movs   pasm_16,t2      ' ... src
         shr    t2,#D16A-S16A   ' ... and ...
         movd   pasm_16,t2      ' ... dst
         shr    t2,#11-D16A     ' extract 5 bits ...
         and    t2,#$1F         ' ... of op code
         add    t2,#table_16a   ' calculate addr of instruction template
         movs   set_inst,t2     ' put addr in setup instruction
         and    pasm_16,sd_mask ' mask src & dst to 5 bits each         
set_inst or     pasm_16,0-0     ' put instruction in place
         jmp    #pasm_16        ' execute instruction


' decode 16 bit instructions (set b)

decode_16b
         mov    t1,inst         ' extract ...
         shr    t1,#11          ' ... 5 bits ... 
         and    t1,#$1f         ' ... of op code
         add    t1,#table_16b   ' calculate jump
         jmp    t1              ' execute primitive
table_16b
         jmp    #I16B_LODF      '
         jmp    #I16B_RETF      '
         jmp    #I16B_RETN      '
         jmp    #I16B_POPM      '
         jmp    #I16B_JMPI      '
         jmp    #I16B_CALI      '
         jmp    #I16B_PSHL      '
         jmp    #I16B_DIVS      '
         jmp    #I16B_DIVU      '
         jmp    #I16B_MULT      '
         jmp    #I16B_FLTP      ' was #I16B_FADD      '
         jmp    #I16B_RJ_Z      ' was #I16B_FSUB      '
         jmp    #I16B_RJNZ      ' was #I16B_FMUL      '
         jmp    #I16B_RJAE      ' was #I16B_FDIV      '
         jmp    #I16B_RJ_A      ' was #I16B_FCMP      '
         jmp    #I16B_RJBE      ' was #I16B_FLIN      '
         jmp    #I16B_RJ_B      ' was #I16B_INFL      '
         jmp    #I16B_SYSP      '
         jmp    #I16B_EXEC      '
         jmp    #I16B_SIGN      ' 
         jmp    #I16B_CPL       ' 
         jmp    #I16B_TRN1      ' 
         jmp    #I16B_TRN2      ' 
         jmp    #I16B_LODL      ' 
         jmp    #I16B_BRKP      '
         jmp    #I16B_FCACHE    '
         jmp    #I16B_PASM      '
         jmp    #I16B_CPREP     '
         jmp    #I16B_JMPR      '

I16B_POPM     
         rdlong RI,SP           ' load ...
         add    SP,#4           ' ... register specification to pop
         movd   :pop_x,#r23     ' start with ...
         shl    RI,#(32-24)     ' ... r23         
:pop_nxt
         shl    RI,#1 wc,wz     ' load rX?
:pop_x                          ' if so ...
   if_c  rdlong 0-0,SP          ' ... load ...
   if_c  add    SP,#4           ' ... the register
   if_nz sub    :pop_x,dlsb     ' point to previous register
   if_nz jmp    #:pop_nxt       ' continue till all registers popped
         mov    t2,inst         ' extract ...
         and    t2,#$1FC wz     ' ... frame size (7 bits, multiple of 4)
         test   inst,frm_bit wz ' pop frame ?
   if_z  jmp    #I32_RETF       ' yes - pop frame (and execute implied return)
         test   inst,ret_bit wz ' no - return ?
   if_z  jmp    #I16B_RETN      ' yes
         jmp    #done_16        ' no - just carry on executing instructions

frm_bit  long   1<<(7+S16B)     ' bit to test for frame pop (pop if zero)
ret_bit  long   1<<(8+S16B)     ' bit to test for return (return if zero)

I16B_PSHL        
         sub    SP,#4           ' decrement SP
         wrlong RI,SP           ' save value on stack
         jmp    #done_16
I16B_JMPI        
         mov    PC,RI
         jmp    #read_next
'
'I16B_DIVS - Signed 32 bit division
'        Divisor  : r1
'        Dividend : r0
'        Result   :
'           Quotient in r0
'           Remainder in r1
'
I16B_DIVS
         mov    t3,r1           ' save sign for later
         mov    t4,r0
         abs    r1,r1
         abs    r0,r0
         xor    t3,t4

         call   #f_d32          ' perform unsigned division
        
         mov    t4,t4 WC        ' get bit #31 into carry
         negc   r1,r1           ' adjust the sign of the remainder
         mov    t3,t3 WC        ' get bit #31 into carry
         negc   r0,r0           ' adjust the sign of the result
         jmp    #done_16
'
'I16B_DIVU - unsigned 32 bit division 
'        Divisor  : r1
'        Dividend : r0
'        Result   :
'           Quotient in r0
'           Remainder in r1
'
I16B_DIVU movs   f_d32_ret,#done_16 ' set return to #done_16 & fall into div
        
'
'f_d32  - 32 bit division (used by signed and unsigned)
'
f_d32
         mov    t1,#32
         mov    t2,#0           ' tmp2 is temp register to hold the remainder
:loop
         shl    r0,#1 WC
         rcl    t2,#1 
         cmpsub t2,r1 WC
   if_c  add    r0,#1
         djnz   t1,#:loop
         mov    r1,t2           ' set remainder
f_d32_ret
         ret
'
' I16B_MULT - multiplication
'        r0 : 1st operand (32 bit)
'        r1 : 2nd operand (32 bit)
'        Result :
'           Product in r0 (<= 32 bit)
'
I16B_MULT
         mov    t1,#0
:start
         cmp    r0,#0 WZ
  if_e   jmp    #:down3
         shr    r0,#1 WC
  if_ae  jmp    #:down2
         add    t1,r1 WC
:down2
         shl    r1,#1 WC
         jmp    #:start
:down3
         mov    r0,t1
         jmp    #done_16
'
'
' I16B_SYSP - call a plugin
' On entry:
'        R3 = code:
'            - cog id if >= 128 (i.e. $80 + cog id)
'            - plugin type if < 128 (i.e. 0 .. 127)
'            - service id if < 0
'        R2 = data (optional pointer)
' 
' NOTES: Locks are currently only supported when invoking via a service id.
'        When using service id, the data should only use the lower 24 bits.
'
' On exit:
'        R0 = result
'
I16B_SYSP
#ifdef DEBUG
#include "debug.inc"
#else
         movs    plugin_ret,#done_16 ' set return to #done_16 & fall into plugin
plugin

         mov     t4,#8          ' t4 stores lock - default to none required
         mov     r0,r3 wc       ' get plugin type or cog id or service id
  if_b   jmp     #psvc          ' if < 0, code is a service id
         test    r0,#$80 wz     ' if bit 7 set ...
  if_nz  jmp     #pcog          ' code is a cog id ...
ptype                           ' ... otherwize it's a plugin type
         mov     t1,par         ' point to registry
         mov     t2,#0          ' start at cog id 0
plgt1
         cmp     t2,#8 wc,wz    ' run out of cogs?
  if_ae  jmp     #plugerr       ' yes - no such plugin
         rdlong  t3,t1          ' no - check cog's plugin type
         shr     t3,#24         ' is it ...
         cmp     t3,r0 wz       ' ... the plugin type what we wanted?
'  if_z   jmp     #plgt2        ' yes - invoke plugin at this cog id
  if_nz  add     t2,#1          ' no - try ...
  if_nz  add     t1,#4          ' ... next ...
  if_nz  jmp     #plgt1         ' ... cog id
plgt2
         mov     r0,t2          ' use the cog where we found the plugin
         jmp     #pcog          ' invoke plugin (via the cog id)
psvc
         shl     r0,#1          ' read entry ...
         add     r0,par         ' ... from ...
         rdword  r0,r0          ' ... the service registry
         mov     t1,r0          ' save in t1 and extract ...
         shr     r0,#12         ' ... cog number to r0
         mov     t4,t1          ' save in t4 and extract ...
         and     t1,#$7f        ' ... 7 bit plugin-specific code ...
         shl     t1,#24 wz      ' ... to t1 (top 8 bits) ...
  if_z   jmp     #plugerr       ' ... or throw error if request code is zero
         shr     t4,#7          ' put lock number in lower 5 bits of t4
         test    t4,#8 wz       ' are we required to use a lock?
'  if_nz  jmp     #no_lock       ' no - just make the request
set_lock
  if_z   lockset t4 wc          ' yes - loop ...
  if_c_and_z jmp     #set_lock  ' ... until we have set the lock
no_lock
'         andn    r2,top8       ' combine data ...
         or      r2,t1          ' ... with request code
pcog
         and     r0,#7          ' mask off cog id to 0 .. 7
         shl     r0,#2          ' point to ...
         add     r0,par         ' ... registry entry for the cog
         rdlong  r0,r0          ' get request block from registry
         test    r0,top8 wz     ' is a plugin registered in this cog?
  if_z   jmp     #plugerr       ' no - throw error 
'        andn     r0,top8       ' yes - write ...
         wrlong  r2,r0          ' ... request 
ploop
         rdlong  r3,r0 wz       ' wait till ...
  if_nz  jmp     #ploop         ' ... request completed
         add     r0,#4          ' get ...
         rdlong  r0,r0          ' ... result
clr_lock
         test    t4,#8 wz       ' did we set a lock?
  if_z   lockclr t4             ' yes - clear the lock we set
plugin_ret
         ret
plugerr 
         neg     r0,#1          ' plugin error (e.g. not registered)
         jmp     #clr_lock      ' done - clear lock if required
#endif
'
' I16B_PASM - Execute one long (starting at next long boundary) as an instruction.
'
I16B_PASM
         andn   PC,#3           ' align PC to long
         add    PC,#4           ' point to next long
         rdlong :exec1,PC       ' fetch the instruction
         add    PC,#4           ' point to next long
:exec1   long   0-0
         jmp    #EXEC_STOP      ' done
'
' I16B_EXEC - Execute multiple longs (starting at next long boundary) as instructions.
'            To exit, execute the instruction "jmp #EXEC_STOP"
I16B_EXEC
         andn   PC,#3           ' align PC to long
         add    PC,#4           ' point to next long
:exec_loop
         rdlong :exec1,PC
         add    PC,#4           ' point to next long
:exec1   long   0-0
         rdlong :exec2,PC
         add    PC,#4           ' point to next long
:exec2   long   0-0
#ifdef UNROLL_LMM_LOOP
         rdlong :exec3,PC
         add    PC,#4           ' point to next long
:exec3   long   0-0
         rdlong :exec4,PC
         add    PC,#4           ' point to next long
:exec4   long   0-0
#endif
         jmp    #:exec_loop
          
'
'------------------------------------------------------------------------------
' Float32 Assembly language routines
'------------------------------------------------------------------------------
'
'------------------------------------------------------------------------------
' I16B_FLTP - invoke the floating point plugin
'
' input:   t1          service to request
'          r0          32-bit floating point value
'          r1          32-bit floating point value 
' output:  r0          32-bit floating point result
'------------------------------------------------------------------------------
'
I16B_FLTP
         mov     t5,r2          ' save r2
         mov     t6,r3          ' save r3
         mov     r3,inst        ' get floating point ...
         shr     r3,#S16B       ' ... operation ...
         and     r3,#$1f        ' ... code
#ifndef EXTERNAL_FLT_CMP
         cmp     r3,#Common#SVC_FLOAT_CMP wz
   if_z  jmp     #I16B_FCMP
#endif
         neg     r3,r3          ' negate it (to call a service)
#ifndef DEBUG
         mov     r2,xfer        ' r2 = data is address of xfer block
         mov     t1,xfer        ' write ...
         wrlong  r0,t1          ' ... first argument to xfer block
         add     t1,#4          ' write ...
         wrlong  r1,t1          ' ... second argument to xfer block
         call    #plugin        ' request the service
         mov     r2,t5          ' restore r2
         mov     r3,t6          ' restore r3
         cmps    r0,#0 wz,wc    ' set C & Z flags according to result
         jmp     #done_16
#endif
'       
#ifndef EXTERNAL_FLT_CMP
I16B_FCMP        
         mov     t1, r0         ' compare signs
         xor     t1, r1
         and     t1, Bit31 wz
  if_z   jmp     #:cmp1         ' same, then compare magnitude

         mov     t1, r0         ' check for +0 or -0
         or      t1, r1
         andn    t1, Bit31 wz,wc
  if_z   jmp     #done_16

         test    r0, Bit31 wc   ' compare signs
         jmp     #done_16

:cmp1    test    r0, Bit31 wz   ' check signs
  if_nz  jmp     #:cmp2
         cmp     r0, r1 wz,wc
         jmp     #done_16
:cmp2    cmp     r1, r0 wz,wc   ' reverse test if negative
         jmp     #done_16
#endif
'
I16B_LODL  
         add    PC,#4           ' point to next long
         rdlong RI,PC           ' read the long
         andn   PC,#3           ' align PC to long boundary
         mov    pasm_16,I16A_MOV ' set up 'mov' instruction
         mov    t3,#RI          ' set up src
I16B_set_src_dst
         mov    t2,inst         ' set up ...
         shr    t2,#D16B        ' ...
         and    t2,#$1FF        ' ... 
         movd   pasm_16,t2      ' ... dst ...
         movs   pasm_16,t3      ' and src 
         jmp    #pasm_16       
I16B_TRN1        
         mov    t3,#low8
         jmp    #I16B_set_and
I16B_TRN2        
         mov    t3,#low16
I16B_set_and 
         mov    pasm_16,I16A_AND ' set up 'and' instruction
         jmp    #I16B_set_src_dst
I16B_SIGN        
         mov    t3,#bit31
         jmp    #I16B_set_xor
I16B_CPL        
         mov    t3,#all_1s
I16B_set_xor
         mov    pasm_16,I16A_XOR ' set up 'xor' instruction
         jmp    #I16B_set_src_dst
'
I16B_LODF
         mov    t2,inst         ' 9 bit src
         shl    t2,#(32-S16B-9) ' sign ...
         sar    t2,#(32-9)      ' ... extend
         mov    RI,FP
         adds   RI,t2    
         jmp    #done_16
'
I16B_FCACHE
#ifdef FCACHE_PRIMITIVE
         mov    t2,inst         ' set up ...
         shr    t2,#S16B        ' ... instruction count ...
         and    t2,#$1FF        ' ... in t2
         movd   :inst,#FC_START ' start at FCACHE cog addr
:loop
         add    PC,#4           ' point to next long
:inst
         rdlong 0-0,PC          ' load inst to FCACHE
         add    :inst,dlsb      ' next cog addr
         djnz   t2,#:loop       ' continue until all inst loaded
         jmp    #FC_START       ' start execution of FCACHE
#endif
'
I16B_CPREP
         mov    BC,inst         ' put ...
         shr    BC,#4-(S16B-2)  ' ... upper 5 bits of src ...
         and    BC,#$7C         ' ... (multiplied by 4) into BC
         mov    t2,inst         ' subtract lower 4 bits of src ...
'         shr    t2,#S16B-2     ' ... (eliminating shift - not required!) ...
         and    t2,#$3C         ' ... (mutltiplied by 4) ... 
         sub    SP,t2           ' ... from SP
         jmp    #done_16

I16B_CALI
         mov    t2,RI           ' fall through to ...
I32_CALA
         add    PC,#4           ' increment PC (this is return address)
         sub    SP,#8           ' save ...
         wrlong PC,SP           ' ... PC 
                                ' fall through to ...
I32_JMPA
         mov    PC,t2     
         jmp    #read_next
I32_LODI  
         rdlong RI,t2   
         jmp    #done_32
I32_PSHF     
         shl    t2,#8           ' sign ...
         sar    t2,#8           ' ... extend
         adds   t2,FP
                                ' fall through to ...
I32_PSHA  
         rdlong RI,t2
         sub    SP,#4
         wrlong RI,SP   
         jmp    #done_32
I32_PSHM     
         mov    t1,t2           ' save register specification for later
         movd   :push_x,#r6     ' start with ...
         shr    t2,#6           ' ... r6 ...
#ifndef BLACKBOX
         test   t2,#$1FF wz     ' ... or ...
  if_z   shr    t2,#9           ' ... with ...
  if_z   movd   :push_x,#r15    ' ... r15 if r6 - r15 not used
#endif
:push_nxt
         shr    t2,#1 wc,wz     ' save rX?
   if_c  sub    SP,#4           ' yes - save ...
:push_x                         ' ... the ...
   if_c  wrlong 0-0,SP          ' ... register
         add    :push_x,dlsb    ' point to next register
   if_nz jmp    #:push_nxt      ' continue till all registers checked
         sub    SP,#4           ' save ...
         wrlong t1,SP           ' .... register specification
         jmp    #done_32
'
I32_BRNZ     
   if_nz jmp    #I32_JMPA
         jmp    #done_32
I32_BR_Z  
   if_z  jmp    #I32_JMPA
         jmp    #done_32
I32_BRAE     
   if_ae jmp    #I32_JMPA
I32_BR_A     
   if_a  jmp    #I32_JMPA
         jmp    #done_32
I32_BRBE     
   if_be jmp    #I32_JMPA
I32_BR_B     
   if_b  jmp    #I32_JMPA
         jmp    #done_32
'
I16B_RJNZ
   if_nz jmp    #I16B_JMPR
         jmp    #done_16
I16B_RJ_Z
   if_z  jmp    #I16B_JMPR
         jmp    #done_16
I16B_RJAE
   if_ae jmp    #I16B_JMPR
I16B_RJ_A
   if_a  jmp    #I16B_JMPR
         jmp    #done_16
I16B_RJBE
   if_be jmp    #I16B_JMPR
I16B_RJ_B
   if_ae jmp    #done_16
I16B_JMPR
         shl    inst,#(32-S16B-9) ' sign ...
         sar    inst,#(32-9)      ' ... extend
         add    PC,inst         ' add relative jump to PC
         jmp    #read_next
'
' I32_PSHB - push a structure (size in bytes at the PC) pointed to by R0
'          onto the stack, decrementing the SP. 
'
I32_PSHB
         mov    t3,t2           ' round up the count ...
         add    t3,#3           ' ... to be ...
         andn   t3,#3           ' ... a multiple of 4
         sub    SP,t3           ' decrement SP by rounded up size
         mov    t1,r0           ' source is in r0
         mov    t4,SP           ' destination is SP
         jmp    #copy_bytes     ' do the copy
'
' I32_CPYB - copy a structure (size in bytes at the PC)
'           from the address in R1 to the address in R0
'
I32_CPYB
         mov    t1,r1           ' source is in r1
         mov    t4,r0           ' destination is in r0
                                ' fall through to ...
copy_bytes
         tjz    t2,#done_32     ' no more to copy
         rdbyte t3,t1           ' read from src to t3
         wrbyte t3,t4           ' write t3 to dst
         add    t1,#1           ' increment source
         add    t4,#1           ' increment destination
         sub    t2,#1           ' decrement count ...
         jmp    #copy_bytes     ' ... and keep copying
'
I32_MOV     
         andn   pasm_32,immi_bit ' clear immediate bit
         jmp    #I32_MOVx
I32_MOVI
         or     pasm_32,immi_bit ' set immediate bit
I32_MOVx
         movi   pasm_32,#%101000_001 ' mov
I32_SD
         andn   pasm_32,low18   ' clear out old src & dst
         or     pasm_32,t2      ' include 9 bits src and 9 bits dst
         jmp    #pasm_32
I32_SPILL
         sub    BC,#4
         cmp    BC,RI wz,wc
   if_b  jmp    #done_32
         andn   pasm_32,immi_bit ' clear immediate bit
         or     t2,#BC          ' set src to BC (dst is ok, src should be zero)
         movi   pasm_32,#%000010_000 ' wrlong
         jmp    #I32_SD
I32_CPREP
         mov    BC,t2           ' put upper 9 bits of src (i.e. dst)
         shr    BC,#9           ' ... in BC
         and    t2,#$1FF        ' subtract lower 9 bits of src ...
         jmp    #I32_SUBSP      ' ... from SP
I32_LODA  
         mov    RI,t2
         jmp    #done_32
I32_LODS
         mov    t1,t2           ' set ...
         shr    t1,#19          ' ... dst register ...
         movd   I32_LODd,t1     ' ... in move instruction
         shl    t2,#13          ' extract ...
         sar    t2,#13          ' src (sign extended immediate)
I32_LODd mov    0-0,t2          ' mov src to dst
         jmp    #done_32
I32_NEWF        
         sub    SP,#4           ' decrement the stack pointer
         wrlong FP,SP           ' save FP to stack
         mov    FP,SP           ' set up new FP
         add    BC,#8           ' calculate what SP was ...
         add    BC,FP           ' ... before arguments were pushed
I32_SUBSP
         sub    SP,t2           ' allocate frame
         jmp    #done_32
I16B_RETF  
         mov    t2,inst         ' extract 9 bit ...
         shr    t2,#S16B        ' ...
         and    t2,#$1FF        ' ... src, and fall through to I32_RETF
I32_RETF  
         add    SP,t2           ' deallocate frame      
         rdlong FP,SP           ' restore previous FP
         add    SP,#4           ' increment the SP
FC_RETURN                       ' must match FC_RETURN in Catalina_Compact.inc
I16B_RETN                     
         rdlong PC,SP           ' read the PC
         add    SP,#8           ' increment the SP
         jmp    #read_next
I32_LODF
         shl    t2,#8           ' sign ...
         sar    t2,#8           ' ... extend
         mov    RI,FP
         adds   RI,t2    
         jmp    #done_32
'
         fit    $1eb            ' last 5 longs reserved for debug vectors
'
         org    $1eb
DEBUG_VECTORS 
         long   0,0,0,0,0
'
         fit    $1f0                  
