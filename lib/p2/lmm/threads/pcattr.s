' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export pthread_condattr_init

 alignl ' align long
C_pthread_condattr_init ' <symbol:pthread_condattr_init>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_pthread_condattr_init_3 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_condattr_init_2 ' JUMPV addrg
C_pthread_condattr_init_3
 mov r22, #0 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r0, #0 ' RET coni
C_pthread_condattr_init_2
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_condattr_destroy

 alignl ' align long
C_pthread_condattr_destroy ' <symbol:pthread_condattr_destroy>
 mov r0, #0 ' RET coni
' C_pthread_condattr_destroy_5 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Export pthread_condattr_setpshared

 alignl ' align long
C_pthread_condattr_setpshared ' <symbol:pthread_condattr_setpshared>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_pthread_condattr_setpshared_9 ' EQU4
 rdlong r22, r2 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_pthread_condattr_setpshared_7 ' EQI4
 cmps r22,  #1 wz
 jmp #BR_Z
 long @C_pthread_condattr_setpshared_7 ' EQI4
C_pthread_condattr_setpshared_9
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_condattr_setpshared_6 ' JUMPV addrg
C_pthread_condattr_setpshared_7
 mov r0, #0 ' RET coni
C_pthread_condattr_setpshared_6
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_condattr_getpshared

 alignl ' align long
C_pthread_condattr_getpshared ' <symbol:pthread_condattr_getpshared>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, #0 ' reg <- coni
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_pthread_condattr_getpshared_13 ' EQU4
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_pthread_condattr_getpshared_11 ' NEU4
C_pthread_condattr_getpshared_13
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_condattr_getpshared_10 ' JUMPV addrg
C_pthread_condattr_getpshared_11
 mov r22, #0 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r0, #0 ' RET coni
C_pthread_condattr_getpshared_10
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import errno
' end
