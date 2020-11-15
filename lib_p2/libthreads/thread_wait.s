' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _thread_wait

 alignl ' align long
C__thread_wait ' <symbol:_thread_wait>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__clockfreq ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long 1000
 mov r20, RI ' reg <- con
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#DIVU) ' DIVU
 PRIMITIVE(#LODF)
 long -4
 wrlong r0, RI ' ASGNU4 addrl reg
 cmp r23,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__thread_wait_2 ' NEU4
 PRIMITIVE(#JMPA)
 long @C__thread_wait_1 ' JUMPV addrg
C__thread_wait_2
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__cnt ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r17, r19 ' ADDU
 add r17, r0 ' ADDU (3)
 cmp r17, r19 wcz 
 PRIMITIVE(#BRBE)
 long @C__thread_wait_11 ' LEU4
 PRIMITIVE(#JMPA)
 long @C__thread_wait_7 ' JUMPV addrg
C__thread_wait_6
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__thread_yield ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__cnt ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C__thread_wait_7
 cmp r21, r19 wcz 
 PRIMITIVE(#BR_B)
 long @C__thread_wait_9' LTU4
 cmp r21, r17 wcz 
 PRIMITIVE(#BR_B)
 long @C__thread_wait_6' LTU4
C__thread_wait_9
 PRIMITIVE(#JMPA)
 long @C__thread_wait_5 ' JUMPV addrg
C__thread_wait_10
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__thread_yield ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__cnt ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C__thread_wait_11
 cmp r21, r19 wcz 
 PRIMITIVE(#BRAE)
 long @C__thread_wait_10 ' GEU4
 cmp r21, r17 wcz 
 PRIMITIVE(#BR_B)
 long @C__thread_wait_10' LTU4
C__thread_wait_5
C__thread_wait_1
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _thread_yield

' Catalina Import _cnt

' Catalina Import _clockfreq
' end
