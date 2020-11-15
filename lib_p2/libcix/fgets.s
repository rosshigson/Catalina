' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fgets

 alignl ' align long
C_fgets ' <symbol:fgets>
 PRIMITIVE(#PSHM)
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r15, r23 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_fgets_3 ' JUMPV addrg
C_fgets_2
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, r17 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 cmps r17,  #10 wz
 PRIMITIVE(#BRNZ)
 long @C_fgets_5 ' NEI4
 PRIMITIVE(#JMPA)
 long @C_fgets_4 ' JUMPV addrg
C_fgets_5
C_fgets_3
 mov r22, r21
 subs r22, #1 ' SUBI4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 PRIMITIVE(#BRBE)
 long @C_fgets_7 ' LEI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_getc ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 PRIMITIVE(#BRNZ)
 long @C_fgets_2 ' NEI4
C_fgets_7
C_fgets_4
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 cmps r17, r22 wz
 PRIMITIVE(#BRNZ)
 long @C_fgets_8 ' NEI4
 mov r22, r19
 adds r22, #8 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 and r22, #16 ' BANDI4 coni
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_fgets_10 ' EQI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r23 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 PRIMITIVE(#BRNZ)
 long @C_fgets_11 ' NEU4
 PRIMITIVE(#LODL)
 long 0
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_fgets_1 ' JUMPV addrg
C_fgets_10
 PRIMITIVE(#LODL)
 long 0
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C_fgets_1 ' JUMPV addrg
C_fgets_11
C_fgets_8
 mov r22, #0 ' reg <- coni
 wrbyte r22, r15 ' ASGNU1 reg reg
 mov r0, r23 ' CVI, CVU or LOAD
C_fgets_1
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import getc
' end
