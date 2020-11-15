' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _unmount

 alignl ' align long
C__unmount ' <symbol:_unmount>
 PRIMITIVE(#PSHM)
 long $d00000 ' save registers
 mov r23, #3 ' reg <- coni
C__unmount_3
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 PRIMITIVE(#LODL)
 long @C___fdtab+9
 mov r20, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__unmount_7 ' EQI4
 PRIMITIVE(#LODL)
 long -1
 mov r0, RI ' reg <- con
 PRIMITIVE(#JMPA)
 long @C__unmount_2 ' JUMPV addrg
C__unmount_7
' C__unmount_4 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #8 wcz
 PRIMITIVE(#BR_B)
 long @C__unmount_3 ' LTI4
 PRIMITIVE(#LODL)
 long $ffffffff
 mov r22, RI ' reg <- con
 PRIMITIVE(#LODL)
 long @C___pstart
 wrlong r22, RI ' ASGNU4 addrg reg
 mov r0, #0 ' RET coni
C__unmount_2
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import __pstart

' Catalina Import __fdtab
' end
