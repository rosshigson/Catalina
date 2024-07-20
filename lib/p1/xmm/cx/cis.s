' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _coginit_Spin

 alignl ' align long
C__coginit_S_pin ' <symbol:_coginit_Spin>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODL
 long $fff9ffff
 mov r22, RI ' reg <- con
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 jmp #LODL
 long $fff9ffff
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNU4 reg reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrword r22, RI ' ASGNI2 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, FP
 sub RI, #-(-14)
 wrword r22, RI ' ASGNI2 addrli reg
 mov r22, r23 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 wrword r22, RI ' ASGNI2 addrli reg
 mov r22, r21 ' CVI, CVU or LOAD
 adds r22, #8 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-10)
 wrword r22, RI ' ASGNI2 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, r19 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-8)
 wrword r22, RI ' ASGNI2 addrli reg
 mov r22, r21 ' CVI, CVU or LOAD
 adds r22, #8 ' ADDI4 coni
 adds r22, r17 ' ADDI/P (1)
 mov RI, FP
 sub RI, #-(-6)
 wrword r22, RI ' ASGNI2 addrli reg
 mov r2, #8 ' reg ARG coni
 jmp #LODL
 long 15361
 mov r3, RI ' reg ARG con
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 mov r4, r22
 sar r4, #2 ' RSHI4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__coginit
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r18, #20 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r2, r22 ' ADDU
 add r2, r0 ' ADDU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitcnt ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
' C__coginit_S_pin_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import _coginit

' Catalina Import _clockfreq
' end
