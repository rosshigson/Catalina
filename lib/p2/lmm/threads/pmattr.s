' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export pthread_mutexattr_destroy

 alignl ' align long
C_pthread_mutexattr_destroy ' <symbol:pthread_mutexattr_destroy>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_pthread_mutexattr_destroy_3 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_mutexattr_destroy_2 ' JUMPV addrg
C_pthread_mutexattr_destroy_3
 mov r22, #0 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r0, #0 ' RET coni
C_pthread_mutexattr_destroy_2
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_mutexattr_gettype

 alignl ' align long
C_pthread_mutexattr_gettype ' <symbol:pthread_mutexattr_gettype>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, #0 ' reg <- coni
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_pthread_mutexattr_gettype_8 ' EQU4
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_pthread_mutexattr_gettype_6 ' NEU4
C_pthread_mutexattr_gettype_8
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_mutexattr_gettype_5 ' JUMPV addrg
C_pthread_mutexattr_gettype_6
 rdlong r22, r3 ' reg <- INDIRI4 reg
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r0, #0 ' RET coni
C_pthread_mutexattr_gettype_5
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_mutexattr_init

 alignl ' align long
C_pthread_mutexattr_init ' <symbol:pthread_mutexattr_init>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r2 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_pthread_mutexattr_init_10 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_mutexattr_init_9 ' JUMPV addrg
C_pthread_mutexattr_init_10
 mov r22, #0 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r0, #0 ' RET coni
C_pthread_mutexattr_init_9
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_mutexattr_settype

 alignl ' align long
C_pthread_mutexattr_settype ' <symbol:pthread_mutexattr_settype>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_pthread_mutexattr_settype_13 ' NEU4
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_mutexattr_settype_12 ' JUMPV addrg
C_pthread_mutexattr_settype_13
 wrlong r2, r3 ' ASGNI4 reg reg
 mov r0, #0 ' RET coni
C_pthread_mutexattr_settype_12
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_mutexattr_setpshared

 alignl ' align long
C_pthread_mutexattr_setpshared ' <symbol:pthread_mutexattr_setpshared>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_pthread_mutexattr_setpshared_18 ' EQU4
 rdlong r22, r2 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_pthread_mutexattr_setpshared_16 ' EQI4
 cmps r22,  #1 wz
 jmp #BR_Z
 long @C_pthread_mutexattr_setpshared_16 ' EQI4
C_pthread_mutexattr_setpshared_18
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_mutexattr_setpshared_15 ' JUMPV addrg
C_pthread_mutexattr_setpshared_16
 mov r0, #0 ' RET coni
C_pthread_mutexattr_setpshared_15
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_mutexattr_getpshared

 alignl ' align long
C_pthread_mutexattr_getpshared ' <symbol:pthread_mutexattr_getpshared>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, #0 ' reg <- coni
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_pthread_mutexattr_getpshared_22 ' EQU4
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_pthread_mutexattr_getpshared_20 ' NEU4
C_pthread_mutexattr_getpshared_22
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_mutexattr_getpshared_19 ' JUMPV addrg
C_pthread_mutexattr_getpshared_20
 mov r22, #0 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r0, #0 ' RET coni
C_pthread_mutexattr_getpshared_19
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_mutexattr_getrobust

 alignl ' align long
C_pthread_mutexattr_getrobust ' <symbol:pthread_mutexattr_getrobust>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, #0 ' reg <- coni
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_pthread_mutexattr_getrobust_26 ' EQU4
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_pthread_mutexattr_getrobust_24 ' NEU4
C_pthread_mutexattr_getrobust_26
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_mutexattr_getrobust_23 ' JUMPV addrg
C_pthread_mutexattr_getrobust_24
 mov r22, #1 ' reg <- coni
 wrlong r22, r2 ' ASGNI4 reg reg
 mov r0, #0 ' RET coni
C_pthread_mutexattr_getrobust_23
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pthread_mutexattr_setrobust

 alignl ' align long
C_pthread_mutexattr_setrobust ' <symbol:pthread_mutexattr_setrobust>
 jmp #PSHM
 long $500000 ' save registers
 mov r22, #0 ' reg <- coni
 mov r20, r3 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C_pthread_mutexattr_setrobust_30 ' EQU4
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BRNZ
 long @C_pthread_mutexattr_setrobust_28 ' NEU4
C_pthread_mutexattr_setrobust_30
 mov r22, #22 ' reg <- coni
 jmp #LODL
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_pthread_mutexattr_setrobust_27 ' JUMPV addrg
C_pthread_mutexattr_setrobust_28
 mov r0, #0 ' RET coni
C_pthread_mutexattr_setrobust_27
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import errno
' end
