' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _write

 alignl ' align long
C__write ' <symbol:_write>
 PRIMITIVE(#PSHM)
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 cmps r23,  #1 wz
 PRIMITIVE(#BRNZ)
 long @C__write_3 ' NEI4
 mov r17, #0 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C__write_8 ' JUMPV addrg
C__write_5
 PRIMITIVE(#LODL)
 long @C___iotab+24
 mov r2, RI ' reg ARG ADDRG
 mov r22, r17 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_catalina_putc
 add SP, #4 ' CALL addrg
' C__write_6 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C__write_8
 cmps r17, r19 wcz
 PRIMITIVE(#BR_B)
 long @C__write_5 ' LTI4
 PRIMITIVE(#JMPA)
 long @C__write_4 ' JUMPV addrg
C__write_3
 cmps r23,  #2 wz
 PRIMITIVE(#BRNZ)
 long @C__write_10 ' NEI4
 mov r17, #0 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C__write_15 ' JUMPV addrg
C__write_12
 PRIMITIVE(#LODL)
 long @C___iotab+48
 mov r2, RI ' reg ARG ADDRG
 mov r22, r17 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_catalina_putc
 add SP, #4 ' CALL addrg
' C__write_13 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C__write_15
 cmps r17, r19 wcz
 PRIMITIVE(#BR_B)
 long @C__write_12 ' LTI4
C__write_10
C__write_4
 mov r0, r19 ' CVI, CVU or LOAD
' C__write_2 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import catalina_putc

' Catalina Import __iotab
' end
