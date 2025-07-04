' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export pthread_rwlock_init

 alignl_label
C_pthread_rwlock_init ' <symbol:pthread_rwlock_init>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_pthread_rwlock_init_3)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (22)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_pthread_rwlock_init_2)<<S32 ' JUMPV addrg
 alignl_label
C_pthread_rwlock_init_3
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__pthread_init_lock_pool)<<S32 ' CALL addrg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_A + (@C_pthread_rwlock_init_5)<<S32 ' GTI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (11)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_pthread_rwlock_init_2)<<S32 ' JUMPV addrg
 alignl_label
C_pthread_rwlock_init_5
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_pthread_rwlock_init_2
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export pthread_rwlock_destroy

 alignl_label
C_pthread_rwlock_destroy ' <symbol:pthread_rwlock_destroy>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl_p1
 long 0 ' reg ARG con
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__pthread_init_lock_pool)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_pthread_rwlock_destroy_8)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (22)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_pthread_rwlock_destroy_7)<<S32 ' JUMPV addrg
 alignl_label
C_pthread_rwlock_destroy_8
 alignl_p1
 long I32_CALA + (@C__thread_stall)<<S32 ' CALL addrg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRBE + (@C_pthread_rwlock_destroy_10)<<S32 ' LEI4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16B_LODL + (r3)<<D16B
 alignl_p1
 long @C__P_thread_P_ool ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl_p1
 long I32_CALA + (@C__thread_lockret)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl_label
C_pthread_rwlock_destroy_10
 word I16A_NEGI + (r22)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl_p1
 long I32_CALA + (@C__thread_allow)<<S32 ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_pthread_rwlock_destroy_7
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Export pthread_rwlockattr_init

 alignl_label
C_pthread_rwlockattr_init ' <symbol:pthread_rwlockattr_init>
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_pthread_rwlockattr_init_13)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (22)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_pthread_rwlockattr_init_12)<<S32 ' JUMPV addrg
 alignl_label
C_pthread_rwlockattr_init_13
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r2)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_pthread_rwlockattr_init_12
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export pthread_rwlockattr_destroy

 alignl_label
C_pthread_rwlockattr_destroy ' <symbol:pthread_rwlockattr_destroy>
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_pthread_rwlockattr_destroy_15 ' (symbol refcount = 0)
 word I16B_RETN
 alignl_p1
 alignl_p1

' Catalina Export pthread_rwlockattr_setpshared

 alignl_label
C_pthread_rwlockattr_setpshared ' <symbol:pthread_rwlockattr_setpshared>
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_pthread_rwlockattr_setpshared_19)<<S32 ' EQU4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r2)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_pthread_rwlockattr_setpshared_17)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (1)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_pthread_rwlockattr_setpshared_17)<<S32 ' EQI4 reg coni
 alignl_label
C_pthread_rwlockattr_setpshared_19
 word I16A_MOVI + (r22)<<D16A + (22)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_pthread_rwlockattr_setpshared_16)<<S32 ' JUMPV addrg
 alignl_label
C_pthread_rwlockattr_setpshared_17
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_pthread_rwlockattr_setpshared_16
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Export pthread_rwlockattr_getpshared

 alignl_label
C_pthread_rwlockattr_getpshared ' <symbol:pthread_rwlockattr_getpshared>
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_pthread_rwlockattr_getpshared_23)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_pthread_rwlockattr_getpshared_21)<<S32 ' NEU4 reg coni
 alignl_label
C_pthread_rwlockattr_getpshared_23
 word I16A_MOVI + (r22)<<D16A + (22)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C_pthread_rwlockattr_getpshared_20)<<S32 ' JUMPV addrg
 alignl_label
C_pthread_rwlockattr_getpshared_21
 word I16A_MOVI + (r22)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r2)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_label
C_pthread_rwlockattr_getpshared_20
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Import _thread_stall

' Catalina Import _pthread_init_lock_pool

' Catalina Import _Pthread_Pool

' Catalina Import errno

' Catalina Import _thread_allow

' Catalina Import _thread_lockret
' end
