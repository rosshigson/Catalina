' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export g_fill

 alignl ' align long
C_g_fill ' <symbol:g_fill>
 jmp #NEWF
 sub SP, #32
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, FP
 sub r15, #-(-36) ' reg <- addrli
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 mov r20, FP
 add r20, #8 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 mov r20, FP
 add r20, #12 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 mov r20, FP
 add r20, #16 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r23
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r19
 jmp #WLNG ' ASGNI4 reg reg
 mov RI, r15
 mov BC, r17
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #14 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
' C_g_fill_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #32 ' framesize
 jmp #RETF


' Catalina Import _setcommand
' end
