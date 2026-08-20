' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export g_text

 alignl ' align long
C_g_text ' <symbol:g_text>
 jmp #NEWF
 sub SP, #32
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, FP
 sub r17, #-(-36) ' reg <- addrli
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r23
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 mov RI, r22
 mov BC, r21
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22
 add r2, #1 ' ADDU4 coni
' call to alloca replaced with ...
 mov RI, FP         ' if ...
 sub RI, #4         ' ... we have not yet ...
 rdlong r0, RI      ' ... saved a pre-alloca SP ...
 cmp r0, Bit31 wz   ' ... then ...
 if_z wrlong SP, RI ' ... save it now (first alloca)
 add r2, #3         ' round up size in r2 ...
 andn r2, #3        ' ... to be a multiple of 4 bytes
 sub SP, r2         ' allocate space on stack ...
 mov r0, SP         ' ... and return its addr in r0
 mov r15, r0 ' CVI, CVU or LOAD
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_strcpy
 add SP, #8 ' CALL addrg
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 mov r20, r15 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNI4 reg reg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_g_justify
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #11 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
' C_g_text_4 ' (symbol refcount = 0)
 mov RI, FP    ' restore SP ... 
 sub RI, #4    ' ... from SP stored in frame ...
 rdlong SP, RI ' ... because alloca was used
 jmp #POPM ' restore registers
 add SP, #32 ' framesize
 jmp #RETF


' Catalina Import _setcommand

' Catalina Import strlen

' Catalina Import strcpy

' Catalina Import g_justify
' end
