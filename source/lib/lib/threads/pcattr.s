' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export pthread_condattr_init

 alignl ' align long
C_pthread_condattr_init ' <symbol:pthread_condattr_init>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_condattr_init_3  ' NEU4
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_condattr_init_2 ' JUMPV addrg
C_pthread_condattr_init_3
 mov r22, #0 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
C_pthread_condattr_init_2
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export pthread_condattr_destroy

 alignl ' align long
C_pthread_condattr_destroy ' <symbol:pthread_condattr_destroy>
 mov r0, #0 ' reg <- coni
' C_pthread_condattr_destroy_5 ' (symbol refcount = 0)
 calld PA,#RETN


' Catalina Export pthread_condattr_setpshared

 alignl ' align long
C_pthread_condattr_setpshared ' <symbol:pthread_condattr_setpshared>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_pthread_condattr_setpshared_9 ' EQU4
 rdlong r22, r2 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_pthread_condattr_setpshared_7 ' EQI4
 cmps r22,  #1 wz
 if_z jmp #\C_pthread_condattr_setpshared_7 ' EQI4
C_pthread_condattr_setpshared_9
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_condattr_setpshared_6 ' JUMPV addrg
C_pthread_condattr_setpshared_7
 mov r0, #0 ' reg <- coni
C_pthread_condattr_setpshared_6
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export pthread_condattr_getpshared

 alignl ' align long
C_pthread_condattr_getpshared ' <symbol:pthread_condattr_getpshared>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, #0 ' reg <- coni
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C_pthread_condattr_getpshared_13 ' EQU4
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_nz jmp #\C_pthread_condattr_getpshared_11  ' NEU4
C_pthread_condattr_getpshared_13
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_condattr_getpshared_10 ' JUMPV addrg
C_pthread_condattr_getpshared_11
 mov r22, #0 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
C_pthread_condattr_getpshared_10
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Import errno
' end
