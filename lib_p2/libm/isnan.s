' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export __IsNan

 alignl ' align long
C___I_sN_an ' <symbol:__IsNan>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $540000 ' save registers
 PRIMITIVE(#LODF)
 long -4
 wrlong r2, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODL)
 long 2139095040
 mov r20, RI ' reg <- con
 mov r18, r22 ' BANDI/U
 and r18, r20 ' BANDI/U (3)
 cmps r18, r20 wz
 PRIMITIVE(#BRNZ)
 long @C___I_sN_an_2 ' NEI4
 PRIMITIVE(#LODL)
 long 8388607
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C___I_sN_an_2 ' EQI4
 mov r0, #1 ' RET coni
 PRIMITIVE(#JMPA)
 long @C___I_sN_an_1 ' JUMPV addrg
C___I_sN_an_2
 mov r0, #0 ' RET coni
C___I_sN_an_1
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)

' end
