' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _coginit_Spin_cog

 alignl ' align long
C__coginit_S_pin_cog ' <symbol:_coginit_Spin_cog>
 PRIMITIVE(#NEWF)
 sub SP, #12
 PRIMITIVE(#PSHM)
 long $fe0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 PRIMITIVE(#LODL)
 long $fff9ffff
 mov r22, RI ' reg <- con
 wrlong r22, r23 ' ASGNU4 reg reg
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 PRIMITIVE(#LODL)
 long $fff9ffff
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -12
 wrword r22, RI ' ASGNI2 addrl reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 PRIMITIVE(#LODF)
 long -10
 wrword r22, RI ' ASGNI2 addrl reg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 PRIMITIVE(#LODF)
 long -8
 wrword r22, RI ' ASGNI2 addrl reg
 mov r22, r23 ' CVI, CVU or LOAD
 adds r22, #8 ' ADDI4 coni
 PRIMITIVE(#LODF)
 long -6
 wrword r22, RI ' ASGNI2 addrl reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r21 ' ADDI/P (1)
 PRIMITIVE(#LODF)
 long -4
 wrword r22, RI ' ASGNI2 addrl reg
 mov r22, r23 ' CVI, CVU or LOAD
 adds r22, #8 ' ADDI4 coni
 adds r22, r19 ' ADDI/P (1)
 PRIMITIVE(#LODF)
 long -2
 wrword r22, RI ' ASGNI2 addrl reg
 mov r2, r17 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long 15361
 mov r3, RI ' reg ARG con
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 mov r4, r22
 sar r4, #2 ' RSHI4 coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__coginit
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__clockfreq ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r18, #20 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__waitcnt ' CALL addrg
 mov r0, r17 ' CVI, CVU or LOAD
' C__coginit_S_pin_cog_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #12 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _clockfreq

' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import _coginit
' end
