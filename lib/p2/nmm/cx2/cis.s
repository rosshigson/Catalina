' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _coginit_Spin

 alignl ' align long
C__coginit_S_pin ' <symbol:_coginit_Spin>
 calld PA,#NEWF
 sub SP, #16
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, ##$fff9ffff ' reg <- con
 wrlong r22, r21 ' ASGNU4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r20, ##$fff9ffff ' reg <- con
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrword r22, RI ' ASGNI2 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
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
 rdlong r22, r22 ' reg <- INDIRP4 reg
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
 mov r2, #16 ' reg ARG coni
 mov r3, ##15361 ' reg ARG con
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 mov r4, r22
 sar r4, #2 ' RSHI4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__coginit
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-20)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockfreq ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r18, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r18 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r22 ' ADDU
 add r2, r0 ' ADDU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__waitcnt ' CALL addrg
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C__coginit_S_pin_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #16 ' framesize
 calld PA,#RETF


' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import _coginit

' Catalina Import _clockfreq
' end
