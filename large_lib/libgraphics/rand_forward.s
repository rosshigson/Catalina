'#line 1 "rand_forward.e"


' Until we modify the P1 compilation process to include calling spinpp,
' we must explicitly define this here and preprocess all the library
' files to create different libraries for the P1 and the P2. This allows
' us to keep the library source files (mostly) identical for the P1 and P2.





'
' Simulate SPIN ?var operator
'

' Catalina Code

DAT ' code segment

' Catalina Export _rand_forward

 alignl ' align long

'       p00010--        ?var    random forward (long) Z
'       p00011--        var?    random reverse (long) NZ
'
'
'                        test    op2, #%00000100  wz
'        if_c            jmp     #:sxcs
'
'                        test    op2, #%00001000  wc
'        if_c            jmp     #:rnd
'
':rnd                    min     x, #1                    '?var/var?
'                        mov     y, #32
'                        mov     a, #%10111
'        if_nz           ror     a, #1
':rndlp                  test    x, a             wc
'        if_z            rcr     x, #1
'        if_nz           rcl     x, #1
'                        djnz    y, #:rndlp       wc      'c=0
'                        jmp     #:stack
'
' ?var
'
C__rand_forward
 mov r0, r2



 min r0, #1

 mov r1, #32
 mov BC, #%10111
:C__rand_forward_rndlp test r0, BC wc
 rcr r0, #1
 sub r1, #1 wc 'c=0
 cmp r1, #0 wz
 jmp #BR_Z
 long @:C__rand_forward_rndlp
 jmp #RETN
' end

