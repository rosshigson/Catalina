' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _thread_wait

 alignl ' align long
C__thread_wait ' <symbol:_thread_wait>
 jmp #NEWF
 jmp #PSHM
 long $eaa000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 1000
 mov r22, RI ' reg <- con
 mov r0, r15 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C__thread_wait_3 ' JUMPV addrg
C__thread_wait_2
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long 1000
 mov r22, RI ' reg <- con
 cmp r23, r22 wcz 
 jmp #BR_B
 long @C__thread_wait_5' LTU4
 mov r17, r19 ' ADDU
 add r17, r15 ' ADDU (3)
 jmp #LODL
 long 1000
 mov r22, RI ' reg <- con
 sub r23, r22 ' SUBU (1)
 jmp #JMPA
 long @C__thread_wait_6 ' JUMPV addrg
C__thread_wait_5
 mov r0, r23 ' setup r0/r1 (2)
 mov r1, r13 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r17, r19 ' ADDU
 add r17, r0 ' ADDU (3)
 mov r23, #0 ' reg <- coni
C__thread_wait_6
 cmp r17, r19 wcz 
 jmp #BRBE
 long @C__thread_wait_14 ' LEU4
 jmp #JMPA
 long @C__thread_wait_10 ' JUMPV addrg
C__thread_wait_9
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__thread_yield ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C__thread_wait_10
 cmp r21, r19 wcz 
 jmp #BR_B
 long @C__thread_wait_12' LTU4
 cmp r21, r17 wcz 
 jmp #BR_B
 long @C__thread_wait_9' LTU4
C__thread_wait_12
 jmp #JMPA
 long @C__thread_wait_8 ' JUMPV addrg
C__thread_wait_13
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__thread_yield ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C__thread_wait_14
 cmp r21, r19 wcz 
 jmp #BRAE
 long @C__thread_wait_13 ' GEU4
 cmp r21, r17 wcz 
 jmp #BR_B
 long @C__thread_wait_13' LTU4
C__thread_wait_8
C__thread_wait_3
 cmp r23,  #0 wz
 jmp #BRNZ
 long @C__thread_wait_2 ' NEU4
' C__thread_wait_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _thread_yield

' Catalina Import _cnt

' Catalina Import _clockfreq
' end
