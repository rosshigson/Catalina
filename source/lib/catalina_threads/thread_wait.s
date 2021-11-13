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
 mov r20, ##1000 ' reg <- con
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNU4 addrli reg
 cmp r23,  #0 wz
 if_nz jmp #\C__thread_wait_2  ' NEU4
 jmp #\@C__thread_wait_1 ' JUMPV addrg
C__thread_wait_2
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__cnt ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r23, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r17, r19 ' ADDU
 add r17, r0 ' ADDU (3)
 cmp r17, r19 wcz 
 if_be jmp #\C__thread_wait_11 ' LEU4
 jmp #\@C__thread_wait_7 ' JUMPV addrg
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
 if_b jmp #\C__thread_wait_9 ' LTU4
 cmp r21, r17 wcz 
 if_b jmp #\C__thread_wait_6 ' LTU4
C__thread_wait_9
 jmp #\@C__thread_wait_5 ' JUMPV addrg
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
 if_ae jmp #\C__thread_wait_10 ' GEU4
 cmp r21, r17 wcz 
 if_b jmp #\C__thread_wait_10 ' LTU4
C__thread_wait_5
C__thread_wait_1
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _cnt

' Catalina Import _clockfreq

' Catalina Import _thread_yield
' end
