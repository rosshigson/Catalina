' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _thread_wait

 alignl ' align long
C__thread_wait ' <symbol:_thread_wait>
 calld PA,#NEWF
 calld PA,#PSHM
 long $eaa000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockfreq ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r22, ##1000 ' reg <- con
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r15, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #\@C__thread_wait_3 ' JUMPV addrg
C__thread_wait_2
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cnt ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, ##1000 ' reg <- con
 cmp r23, r22 wcz 
 if_b jmp #\C__thread_wait_5 ' LTU4
 mov r17, r19 ' ADDU
 add r17, r15 ' ADDU (3)
 mov r22, ##1000 ' reg <- con
 sub r23, r22 ' SUBU (1)
 jmp #\@C__thread_wait_6 ' JUMPV addrg
C__thread_wait_5
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r23, r13 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r17, r19 ' ADDU
 add r17, r0 ' ADDU (3)
 mov r23, #0 ' reg <- coni
C__thread_wait_6
 cmp r17, r19 wcz 
 if_be jmp #\C__thread_wait_14 ' LEU4
 jmp #\@C__thread_wait_10 ' JUMPV addrg
C__thread_wait_9
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_yield ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cnt ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C__thread_wait_10
 cmp r21, r19 wcz 
 if_b jmp #\C__thread_wait_12 ' LTU4
 cmp r21, r17 wcz 
 if_b jmp #\C__thread_wait_9 ' LTU4
C__thread_wait_12
 jmp #\@C__thread_wait_8 ' JUMPV addrg
C__thread_wait_13
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_yield ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cnt ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C__thread_wait_14
 cmp r21, r19 wcz 
 if_ae jmp #\C__thread_wait_13 ' GEU4
 cmp r21, r17 wcz 
 if_b jmp #\C__thread_wait_13 ' LTU4
C__thread_wait_8
C__thread_wait_3
 cmp r23,  #0 wz
 if_nz jmp #\C__thread_wait_2  ' NEU4
' C__thread_wait_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _thread_yield

' Catalina Import _cnt

' Catalina Import _clockfreq
' end
