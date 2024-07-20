' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export pthread_cond_init

 alignl ' align long
C_pthread_cond_init ' <symbol:pthread_cond_init>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C_pthread_cond_init_3 ' EQU4
 rdlong r22, r21 ' reg <- INDIRI4 reg
 wrlong r22, r23 ' ASGNI4 reg reg
 jmp #\@C_pthread_cond_init_4 ' JUMPV addrg
C_pthread_cond_init_3
 mov r22, #0 ' reg <- coni
 wrlong r22, r23 ' ASGNI4 reg reg
C_pthread_cond_init_4
 mov r0, #0 ' reg <- coni
' C_pthread_cond_init_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export pthread_cond_destroy

 alignl ' align long
C_pthread_cond_destroy ' <symbol:pthread_cond_destroy>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__pthread_init_lock_pool ' CALL addrg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_cond_destroy_6  ' NEU4
 mov r22, #22 ' reg <- coni
 wrlong r22, ##@C_errno ' ASGNI4 addrg reg
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_pthread_cond_destroy_5 ' JUMPV addrg
C_pthread_cond_destroy_6
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_pthread_cond_broadcast ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_stall ' CALL addrg
 jmp #\@C_pthread_cond_destroy_9 ' JUMPV addrg
C_pthread_cond_destroy_8
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r21, r22 ' reg <- INDIRP4 reg
 mov r20, r21
 adds r20, #8 ' ADDP4 coni
 rdlong r20, r20 ' reg <- INDIRP4 reg
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_free ' CALL addrg
C_pthread_cond_destroy_9
 mov r22, r23
 adds r22, #4 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_nz jmp #\C_pthread_cond_destroy_8  ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__thread_allow ' CALL addrg
 mov r0, #0 ' reg <- coni
C_pthread_cond_destroy_5
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import free

' Catalina Import _thread_stall

' Catalina Import _pthread_init_lock_pool

' Catalina Import pthread_cond_broadcast

' Catalina Import errno

' Catalina Import _thread_allow
' end
