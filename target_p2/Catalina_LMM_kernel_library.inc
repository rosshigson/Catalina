' Catalina kernel functions that are specific to the LMM kernels ...

' avoid including the kernel library functions twice ...

#ifndef LMM_SPECIAL_LIBRARY_INCLUDED
#define LMM_SPECIAL_LIBRARY_INCLUDED

DAT

' do_initcog - cannot be executed via LMM because rdlongs interrupt the setq
'    r4 points to data block (REGISTRY, PC, SP)
'    r0 contains cog id (or ANY_COG)
'    r3 contains pointer to code to load into cog

do_initcog
        setq    r4             ' this will end up in PTRA of new cog
        coginit r0, r3 wc
        jmp     #LMM_Loop

' do_rotxy - cannot be executed via LMM because rdlongs interrupt the setq
'    r1 contains Y
'    r0 contains X
'    r2 contains angle

do_rotxy
        setq    r1
        qrotate r0, r2
        jmp     #LMM_Loop

' do_cnthl - cannot be executed via LMM as the 2 instructions must be adjacent
do_cnthl
        getct   r1 wc
        getct   r0
        jmp     #LMM_Loop

' special - perform a special operation that cannot be performed via LMM
'    RI contains 1 => do_initcog
'                2 => do_rotxy
'                3 => do_cnthl

special
        djz     RI, #do_initcog
        djz     RI, #do_rotxy
        jmp     #do_cnthl

#endif

