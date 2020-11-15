' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export log10

 alignl ' align long
C_log10 ' <symbol:log10>
 PRIMITIVE(#PSHM)
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C___I_sN_an ' CALL addrg
 cmps r0,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_log10_2 ' EQI4
 mov r22, #33 ' reg <- coni
 PRIMITIVE(#LODL)
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r23 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_log10_1 ' JUMPV addrg
C_log10_2
 PRIMITIVE(#LODI)
 long @C_log10_6_L000007
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BRAE)
 long @C_log10_4 ' GEF4
 mov r22, #33 ' reg <- coni
 PRIMITIVE(#LODL)
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C___huge_val ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r22
 xor r0, Bit31 ' NEGF4
 PRIMITIVE(#JMPA)
 long @C_log10_1 ' JUMPV addrg
C_log10_4
 PRIMITIVE(#LODI)
 long @C_log10_6_L000007
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#FCMP)
 PRIMITIVE(#BRNZ)
 long @C_log10_8 ' NEF4
 mov r22, #34 ' reg <- coni
 PRIMITIVE(#LODL)
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C___huge_val ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r22
 xor r0, Bit31 ' NEGF4
 PRIMITIVE(#JMPA)
 long @C_log10_1 ' JUMPV addrg
C_log10_8
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C_log ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODI)
 long @C_log10_10_L000011
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#FDIV) ' DIVF4
C_log10_1
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import errno

' Catalina Import log

' Catalina Import __IsNan

' Catalina Import __huge_val

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_log10_10_L000011 ' <symbol:10>
 long $40135d8e ' float

 alignl ' align long
C_log10_6_L000007 ' <symbol:6>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
