' Catalina kernel functions that are specific to the LMM kernels ...

' avoid including the kernel library functions twice ...

#ifndef XMM_SPECIAL_LIBRARY_INCLUDED
#define XMM_SPECIAL_LIBRARY_INCLUDED

DAT

' do_initcog - cannot be executed via LMM because rdlongs interrupt the setq
'    r4 points to data block (REGISTRY, PC, SP)
'    r0 contains cog id (or ANY_COG)
'    r3 contains pointer to code to load into cog

do_initcog
        setq    r4             ' this will end up in PTRA of new cog
        coginit r0, r3 wc
        jmp     #XMM_Loop

' do_rotxy - cannot be executed via LMM because rdlongs interrupt the setq
'    r1 contains Y
'    r0 contains X
'    r2 contains angle

do_rotxy
        setq    r1
        qrotate r0, r2
        jmp     #XMM_Loop

' do_cnthl - cannot be executed via LMM as the 2 instructions must be adjacent
do_cnthl
        getct   r1 wc
        getct   r0
        jmp     #XMM_Loop

' do_div64 - cannot be executed via LMM because rdlongs interrupt the setq
 ' on entry r0 = lower 32 bits of dividend
 '          r1 = upper 32 bits of dividend
 '          r2 = divisor
 ' on exit  r0 = quotient

do_div64
        setq    r1       ' set upper 32 bits of product to q register
        qdiv    r0, r2   ' divide 64 bit product by 32 bit divisor
        jmp     #XMM_Loop

' do_loadhub
'
' On entry:
'
'       r0 - XMM src addr
'       r1 - LUT dst addr (top 16 bits) || num of longs (lower 16 bits)
'
' On exit:
'       r0 lost
'       r1 lost
'       t1 lost
'       t2 lost
  
do_loadlut_xmm
#ifdef LARGE
        sub     r0,CS          ' correct XMM Addr for LARGE mode
#endif
        mov     t1, r1         ' LUT addr ...
        shr     t1, #16        ' ... is top 16 bits of r1
        rdlut   t1, t1         ' read signature from LUT
        mov     XMM_Addr, r0   ' read ...
        setd    XMM_Dst, #t2   ' ... signature ...
        call    #\XMM_ReadLong ' ... from XMM RAM
        cmp     t1, t2 wz      ' do we need to load?
 if_z   jmp     #XMM_Loop      ' no - nothing to do
        sub     SP, ##$400     ' yes - allocate buffer of $100 longs on stack
        mov     XMM_Len, r1    ' copy ...
        and     XMM_Len, #$1FF ' ... longs ...
        shl     XMM_Len, #2    ' ... from ...
        mov     XMM_Addr, r0   ' ... XXM RAM ...
        mov     HUB_Addr, SP   ' ... to ...
        call    #\XMM_ReadLongPage ' ... stack buffer
        rdlong  t2,SP
        mov     t2, r1         ' set up ...
        and     t2, #$1FF      ' ... number of longs ...
        sub     t2, #1         ' ... minus 1 for setq2
        shr     r1, #16        ' LUT dst addr is top 16 bits of r1
        rdlut   t1, ##.lutdst  ' we can't use setd on code in the LUT ...
        setd    t1, r1         ' ... so we have ...
        wrlut   t1, ##.lutdst  ' ... to do this instead!
        setq2   t2           '
.lutdst
        rdlong  0, SP          ' load from stack buffer to LUT
        add     SP, ##$400     ' restore original SP
        jmp     #XMM_Loop

' special - perform a special operation that cannot be performed via LMM
'    RI contains 1 => do_initcog
'                2 => do_rotxy
'                3 => do_cnthl
'                4 => do_div64
'                5 => do_loadlut_xmm

special
        djz     RI, #do_initcog
        djz     RI, #do_rotxy
        djz     RI, #do_cnthl
        djz     RI, #do_div64
        jmp     #do_loadlut_xmm

#endif


