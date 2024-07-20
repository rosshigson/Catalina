'#line 1 "randf.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












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

