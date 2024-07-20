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
 word I16B_EXEC
 alignl ' align long
 mov r0, r2
 min r0, #1
 mov r1, #32
 mov BC, #%10111
 jmp #EXEC_STOP
 alignl ' align long
:C__rand_forward_rndlp
 word I16B_EXEC
 alignl ' align long
 test r0, BC wc
 rcr r0, #1
 sub r1, #1 wc 'c=0
 cmp r1, #0 wz
 jmp #EXEC_STOP
 alignl ' align long
 long I32_BR_Z + @:C__rand_forward_rndlp<<S32
 word I16B_RETN

' end

