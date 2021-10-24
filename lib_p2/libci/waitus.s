' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _waitus

 alignl ' align long
C__waitus ' <symbol:_waitus>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__clockfreq ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long 1000000
 mov r22, RI ' reg <- con
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 PRIMITIVE(#LODF)
 long -4
 wrlong r0, RI ' ASGNI4 addrl reg
 PRIMITIVE(#JMPA)
 long @C__waitus_3 ' JUMPV addrg
C__waitus_2
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' ADDI/P
 adds r2, r22 ' ADDI/P (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__waitcnt ' CALL addrg
 PRIMITIVE(#LODL)
 long $f4240
 mov r22, RI ' reg <- con
 sub r23, r22 ' SUBU (1)
C__waitus_3
 PRIMITIVE(#LODL)
 long $f4240
 mov r22, RI ' reg <- con
 cmp r23, r22 wcz 
 PRIMITIVE(#BR_A)
 long @C__waitus_2 ' GTU4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__cnt ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' ADDU
 add r2, r20 ' ADDU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__waitcnt ' CALL addrg
' C__waitus_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import _clockfreq
' end
