' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sbm0_67ea424c_K_ernel_lock_L000004 ' <symbol:Kernel_lock>
 long -1

 alignl ' align long
C_sbm01_67ea424c_P_thread_L_ock_L000005 ' <symbol:Pthread_Lock>
 long -1

 alignl ' align long
C_sbm02_67ea424c_P_rintf_L_ock_L000006 ' <symbol:Printf_Lock>
 long -1

 alignl ' align long
C_sbm03_67ea424c_O_nce_L_ock_L000007 ' <symbol:Once_Lock>
 long -1

 alignl ' align long
C_sbm04_67ea424c_concurrency_L000008 ' <symbol:concurrency>
 long 0

' Catalina Code

DAT ' code segment

 alignl ' align long
C_sbm05_67ea424c__ensure_lock_L000009 ' <symbol:_ensure_lock>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_sbm05_67ea424c__ensure_lock_L000009_11)<<S32 ' GTI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C__P_thread_P_ool ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__thread_locknew)<<S32 ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_sbm05_67ea424c__ensure_lock_L000009_11
' C_sbm05_67ea424c__ensure_lock_L000009_10 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export _pthread_init_lock_pool

 alignl ' align long
C__pthread_init_lock_pool ' <symbol:_pthread_init_lock_pool>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sbm0_67ea424c_K_ernel_lock_L000004)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__pthread_init_lock_pool_14)<<S32 ' NEI4 reg reg
 alignl ' align long
 long I32_CALA + (@C__locknew)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODA + (@C_sbm0_67ea424c_K_ernel_lock_L000004)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_LODI + (@C_sbm0_67ea424c_K_ernel_lock_L000004)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__thread_set_lock)<<S32 ' CALL addrg
 alignl ' align long
C__pthread_init_lock_pool_14
 alignl ' align long
 long I32_CALA + (@C__thread_stall)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_sbm01_67ea424c_P_thread_L_ock_L000005)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_NEGI + (r20)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 word I16A_CMPS + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__pthread_init_lock_pool_16)<<S32 ' NEI4 reg reg
 alignl ' align long
 long I32_CALA + (@C__locknew)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODA + (@C_sbm01_67ea424c_P_thread_L_ock_L000005)<<S32
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
 long I32_LODI + (@C_sbm01_67ea424c_P_thread_L_ock_L000005)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 alignl ' align long
 long I32_LODS + (r3)<<D32S + ((1002)&$7FFFF)<<S32 ' reg ARG cons
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C__P_thread_P_ool ' reg ARG ADDRG
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C__thread_init_lock_pool)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 alignl ' align long
C__pthread_init_lock_pool_16
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sbm02_67ea424c_P_rintf_L_ock_L000006 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sbm05_67ea424c__ensure_lock_L000009)<<S32 ' CALL addrg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sbm03_67ea424c_O_nce_L_ock_L000007 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sbm05_67ea424c__ensure_lock_L000009)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C__pthread_init_lock_pool_18)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_sbm05_67ea424c__ensure_lock_L000009)<<S32 ' CALL addrg
 alignl ' align long
C__pthread_init_lock_pool_18
 alignl ' align long
 long I32_CALA + (@C__thread_allow)<<S32 ' CALL addrg
' C__pthread_init_lock_pool_13 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export pthread_yield

 alignl ' align long
C_pthread_yield ' <symbol:pthread_yield>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_CALA + (@C__thread_yield)<<S32 ' CALL addrg
' C_pthread_yield_20 ' (symbol refcount = 0)
 word I16B_RETF + 0<<S32
 alignl ' align long

' Catalina Export pthread_sleep

 alignl ' align long
C_pthread_sleep ' <symbol:pthread_sleep>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((1000)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__thread_wait)<<S32 ' CALL addrg
' C_pthread_sleep_21 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export pthread_msleep

 alignl ' align long
C_pthread_msleep ' <symbol:pthread_msleep>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $800000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__thread_wait)<<S32 ' CALL addrg
' C_pthread_msleep_22 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export pthread_usleep

 alignl ' align long
C_pthread_usleep ' <symbol:pthread_usleep>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((1000)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r2)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__thread_wait)<<S32 ' CALL addrg
' C_pthread_usleep_23 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export pthread_printf

 alignl ' align long
C_pthread_printf ' <symbol:pthread_printf>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 word I16B_LODF + 8<<S16B
 alignl ' align long
 long I32_SPILL + r2<<D32 ' spill reg (varadic)
 alignl ' align long
 long I32_SPILL + r3<<D32 ' spill reg (varadic)
 alignl ' align long
 long I32_SPILL + r4<<D32 ' spill reg (varadic)
 alignl ' align long
 long I32_SPILL + r5<<D32 ' spill reg (varadic)
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sbm02_67ea424c_P_rintf_L_ock_L000006 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__pthread_init_lock_pool)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_pthread_printf_26)<<S32 ' JUMPV addrg
 alignl ' align long
C_pthread_printf_25
 alignl ' align long
 long I32_CALA + (@C__thread_yield)<<S32 ' CALL addrg
 alignl ' align long
C_pthread_printf_26
 alignl ' align long
 long I32_LODI + (@C_sbm02_67ea424c_P_rintf_L_ock_L000006)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C__P_thread_P_ool ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__thread_lockset)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_pthread_printf_25)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_t_vprintf)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_LODI + (@C_sbm02_67ea424c_P_rintf_L_ock_L000006)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C__P_thread_P_ool ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__thread_lockclr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
' C_pthread_printf_24 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export pthread_printf_ln

 alignl ' align long
C_pthread_printf_ln ' <symbol:pthread_printf_ln>
 alignl ' align long
 long I32_NEWF + 8<<S32
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 word I16B_LODF + 8<<S16B
 alignl ' align long
 long I32_SPILL + r2<<D32 ' spill reg (varadic)
 alignl ' align long
 long I32_SPILL + r3<<D32 ' spill reg (varadic)
 alignl ' align long
 long I32_SPILL + r4<<D32 ' spill reg (varadic)
 alignl ' align long
 long I32_SPILL + r5<<D32 ' spill reg (varadic)
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sbm02_67ea424c_P_rintf_L_ock_L000006 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__pthread_init_lock_pool)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_pthread_printf_ln_31)<<S32 ' JUMPV addrg
 alignl ' align long
C_pthread_printf_ln_30
 alignl ' align long
 long I32_CALA + (@C__thread_yield)<<S32 ' CALL addrg
 alignl ' align long
C_pthread_printf_ln_31
 alignl ' align long
 long I32_LODI + (@C_sbm02_67ea424c_P_rintf_L_ock_L000006)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C__P_thread_P_ool ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__thread_lockset)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_pthread_printf_ln_30)<<S32 ' EQI4 reg coni
 word I16B_LODF + ((12)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRLi
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r3)<<D16A + RI<<S16A ' reg ARG INDIR ADDRFi
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_t_vprintf)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_pthread_printf_ln_34_L000035 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_t_printf)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_sbm02_67ea424c_P_rintf_L_ock_L000006)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C__P_thread_P_ool ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__thread_lockclr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
' C_pthread_printf_ln_29 ' (symbol refcount = 0)
 word I16B_POPM + 2<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export pthread_lock_check

 alignl ' align long
C_pthread_lock_check ' <symbol:pthread_lock_check>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 alignl ' align long
 long I32_CALA + (@C__thread_get_lock)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_pthread_lock_check_37_L000038 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_t_printf)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_sbm01_67ea424c_P_thread_L_ock_L000005)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_pthread_lock_check_39)<<S32 ' GEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_pthread_lock_check_41_L000042 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_t_printf)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_pthread_lock_check_40)<<S32 ' JUMPV addrg
 alignl ' align long
C_pthread_lock_check_39
 alignl ' align long
 long I32_LODI + (@C_sbm01_67ea424c_P_thread_L_ock_L000005)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_pthread_lock_check_43_L000044 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_t_printf)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_sbm02_67ea424c_P_rintf_L_ock_L000006)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_pthread_lock_check_45)<<S32 ' GEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_pthread_lock_check_47_L000048 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_t_printf)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_pthread_lock_check_46)<<S32 ' JUMPV addrg
 alignl ' align long
C_pthread_lock_check_45
 alignl ' align long
 long I32_LODI + (@C_sbm02_67ea424c_P_rintf_L_ock_L000006)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C_pthread_lock_check_49_L000050 ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_t_printf)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_sbm02_67ea424c_P_rintf_L_ock_L000006)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C__P_thread_P_ool ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__thread_lockset)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_pthread_lock_check_51)<<S32 ' NEI4 reg coni
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_pthread_lock_check_53_L000054 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_t_printf)<<S32 ' CALL addrg
 alignl ' align long
C_pthread_lock_check_51
 alignl ' align long
 long I32_LODI + (@C_sbm02_67ea424c_P_rintf_L_ock_L000006)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C__P_thread_P_ool ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__thread_lockclr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_pthread_lock_check_46
 alignl ' align long
C_pthread_lock_check_40
' C_pthread_lock_check_36 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export pthread_self

 alignl ' align long
C_pthread_self ' <symbol:pthread_self>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 alignl ' align long
 long I32_CALA + (@C__thread_id)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__thread_extended)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_pthread_self_55 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export pthread_equal

 alignl ' align long
C_pthread_equal ' <symbol:pthread_equal>
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_pthread_equal_58)<<S32 ' NEU4 reg reg
 word I16A_MOVI + (r23)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_pthread_equal_59)<<S32 ' JUMPV addrg
 alignl ' align long
C_pthread_equal_58
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_pthread_equal_59
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
' C_pthread_equal_56 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

 alignl ' align long
C_sbm0d_67ea424c_dummy_function_L000060 ' <symbol:dummy_function>
 alignl ' align long
 long I32_NEWF + 12<<S32
 alignl ' align long
 long I32_PSHM + $f00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 alignl ' align long
 long I32_CALA + (@C__thread_id)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r2)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__thread_set_extended)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 word I16A_MOV + RI<<D16A + (r22)<<S16A
 word I16B_CALI' CALL indirect
 alignl ' align long
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrl16 reg
 alignl ' align long
 long I32_CALA + (@C_pthread_self)<<S32 ' CALL addrg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNP4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 alignl ' align long
 long I32_LODS + (r20)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_sbm0d_67ea424c_dummy_function_L000060_62)<<S32 ' NEI4 reg coni
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_exit)<<S32 ' CALL addrg
 alignl ' align long
C_sbm0d_67ea424c_dummy_function_L000060_62
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_RDLONG + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrl16
' C_sbm0d_67ea424c_dummy_function_L000060_61 ' (symbol refcount = 0)
 word I16B_POPM + 3<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export pthread_create

 alignl ' align long
C_pthread_create ' <symbol:pthread_create>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__pthread_init_lock_pool)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C__thread_stall)<<S32 ' CALL addrg
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (44)<<S32 ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_malloc)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_CALA + (@C__thread_allow)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_pthread_create_65)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_pthread_create_67)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_pthread_attr_init)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_pthread_create_68)<<S32 ' JUMPV addrg
 alignl ' align long
C_pthread_create_67
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_pthread_attr_copy)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_pthread_create_68
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r15)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (20)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r17)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_pthread_create_69)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_CALA + (@C__thread_stall)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (12)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' ADDU
 word I16A_ADD + (r2)<<D16A + (r20)<<S16A ' ADDU (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_malloc)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_CALA + (@C__thread_allow)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_pthread_create_70)<<S32 ' JUMPV addrg
 alignl ' align long
C_pthread_create_69
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((40)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r15)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_pthread_create_70
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_pthread_create_71)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r2)<<D16A + (16)<<S16A ' ADDP4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (8)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r4)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16B_LODL + (r5)<<D16B
 alignl ' align long
 long @C_sbm0d_67ea424c_dummy_function_L000060 ' reg ARG ADDRG
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C__thread_start)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r15)<<S16A ' ASGNP4 reg reg
 word I16A_WRLONG + (r15)<<D16A + (r23)<<S16A ' ASGNP4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_pthread_create_73)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (11)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_pthread_create_64)<<S32 ' JUMPV addrg
 alignl ' align long
C_pthread_create_73
 alignl ' align long
 long I32_CALA + (@C__cogid)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r20)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r0)<<D16A + (r20)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (28)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r2)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_RDLONG + (r3)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__thread_ticks)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_pthread_create_64)<<S32 ' JUMPV addrg
 alignl ' align long
C_pthread_create_71
 alignl ' align long
 long I32_CALA + (@C__thread_stall)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_free)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C__thread_allow)<<S32 ' CALL addrg
 alignl ' align long
C_pthread_create_65
 word I16A_MOVI + (r22)<<D16A + (11)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_pthread_create_64
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

 alignl ' align long
C_sbm0e_67ea424c_foreman_L000075 ' <symbol:foreman>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $a00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_sbm0_67ea424c_K_ernel_lock_L000004)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__thread_set_lock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_sbm0e_67ea424c_foreman_L000075_78)<<S32 ' JUMPV addrg
 alignl ' align long
C_sbm0e_67ea424c_foreman_L000075_77
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (100)<<S32 ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__thread_wait)<<S32 ' CALL addrg
 alignl ' align long
C_sbm0e_67ea424c_foreman_L000075_78
 alignl ' align long
 long I32_JMPA + (@C_sbm0e_67ea424c_foreman_L000075_77)<<S32 ' JUMPV addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_sbm0e_67ea424c_foreman_L000075_76 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export pthread_createaffinity

 alignl ' align long
C_pthread_createaffinity ' <symbol:pthread_createaffinity>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__pthread_init_lock_pool)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_pthread_createaffinity_83)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_pthread_createaffinity_81)<<S32 ' NEU4 reg coni
 alignl ' align long
C_pthread_createaffinity_83
 word I16A_MOVI + (r22)<<D16A + (22)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_pthread_createaffinity_80)<<S32 ' JUMPV addrg
 alignl ' align long
C_pthread_createaffinity_81
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long 0 ' reg ARG con
 word I16A_MOVI + (r3)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOV + (r4)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r4)<<D16A + (r23)<<S16A ' ADDI/P (3)
 word I16B_LODL + (r5)<<D16B
 alignl ' align long
 long @C_sbm0e_67ea424c_foreman_L000075 ' reg ARG ADDRG
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C__thread_cog)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 word I16A_WRLONG + (r0)<<D16A + (r19)<<S16A ' ASGNI4 reg reg
 alignl ' align long
 long I32_CALA + (@C__thread_yield)<<S32 ' CALL addrg
 word I16A_RDLONG + (r22)<<D16A + (r19)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_pthread_createaffinity_84)<<S32 ' LTI4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_pthread_createaffinity_80)<<S32 ' JUMPV addrg
 alignl ' align long
C_pthread_createaffinity_84
 word I16A_MOVI + (r22)<<D16A + (11)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_pthread_createaffinity_80
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export pthread_setaffinity

 alignl ' align long
C_pthread_setaffinity ' <symbol:pthread_setaffinity>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_pthread_setaffinity_90)<<S32 ' EQU4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_pthread_setaffinity_90)<<S32 ' LTI4 reg coni
 word I16A_CMPSI + (r21)<<D16A + (16)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_pthread_setaffinity_87)<<S32 ' LTI4 reg coni
 alignl ' align long
C_pthread_setaffinity_90
 word I16A_MOVI + (r22)<<D16A + (22)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_pthread_setaffinity_86)<<S32 ' JUMPV addrg
 alignl ' align long
C_pthread_setaffinity_87
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_pthread_setaffinity_91)<<S32 ' EQI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r3)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__thread_affinity_change)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_CMPSI + (r0)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_pthread_setaffinity_93)<<S32 ' EQI4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r19)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_pthread_setaffinity_86)<<S32 ' JUMPV addrg
 alignl ' align long
C_pthread_setaffinity_93
 word I16A_MOVI + (r22)<<D16A + (11)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_pthread_setaffinity_86)<<S32 ' JUMPV addrg
 alignl ' align long
C_pthread_setaffinity_91
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_pthread_setaffinity_86
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export pthread_getaffinity

 alignl ' align long
C_pthread_getaffinity ' <symbol:pthread_getaffinity>
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_pthread_getaffinity_98)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_pthread_getaffinity_96)<<S32 ' NEU4 reg coni
 alignl ' align long
C_pthread_getaffinity_98
 word I16A_MOVI + (r22)<<D16A + (22)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_pthread_getaffinity_95)<<S32 ' JUMPV addrg
 alignl ' align long
C_pthread_getaffinity_96
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (24)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 word I16A_WRLONG + (r22)<<D16A + (r2)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_pthread_getaffinity_95
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Export pthread_once

 alignl ' align long
C_pthread_once ' <symbol:pthread_once>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r2)<<D16B
 alignl ' align long
 long @C_sbm03_67ea424c_O_nce_L_ock_L000007 ' reg ARG ADDRG
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__pthread_init_lock_pool)<<S32 ' CALL addrg
 alignl ' align long
 long I32_LODI + (@C_sbm03_67ea424c_O_nce_L_ock_L000007)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C__P_thread_P_ool ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__thread_lockset)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_pthread_once_100)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (22)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_pthread_once_99)<<S32 ' JUMPV addrg
 alignl ' align long
C_pthread_once_100
 word I16A_RDLONG + (r22)<<D16A + (r23)<<S16A ' reg <- INDIRI4 reg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_pthread_once_102)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRLONG + (r22)<<D16A + (r23)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + RI<<D16A + (r21)<<S16A
 word I16B_CALI' CALL indirect
 alignl ' align long
 alignl ' align long
C_pthread_once_102
 alignl ' align long
 long I32_LODI + (@C_sbm03_67ea424c_O_nce_L_ock_L000007)<<S32
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG INDIR ADDRG
 word I16B_LODL + (r3)<<D16B
 alignl ' align long
 long @C__P_thread_P_ool ' reg ARG ADDRG
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__thread_lockclr)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_pthread_once_99
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export pthread_detach

 alignl ' align long
C_pthread_detach ' <symbol:pthread_detach>
 alignl ' align long
 long I32_PSHM + $500000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_pthread_detach_105)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (22)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_pthread_detach_104)<<S32 ' JUMPV addrg
 alignl ' align long
C_pthread_detach_105
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_MOVI + (r20)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl ' align long
C_pthread_detach_104
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Export pthread_setconcurrency

 alignl ' align long
C_pthread_setconcurrency ' <symbol:pthread_setconcurrency>
 alignl ' align long
 long I32_LODA + (@C_sbm04_67ea424c_concurrency_L000008)<<S32
 word I16A_WRLONG + (r2)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C_pthread_setconcurrency_107 ' (symbol refcount = 0)
 word I16B_RETN
 alignl ' align long
 alignl ' align long

' Catalina Export pthread_getconcurrency

 alignl ' align long
C_pthread_getconcurrency ' <symbol:pthread_getconcurrency>
 alignl ' align long
 long I32_LODI + (@C_sbm04_67ea424c_concurrency_L000008)<<S32
 word I16A_MOV + (r0)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
' C_pthread_getconcurrency_108 ' (symbol refcount = 0)
 word I16B_RETN
 alignl ' align long
 alignl ' align long

' Catalina Export pthread_getcpuclockid

 alignl ' align long
C_pthread_getcpuclockid ' <symbol:pthread_getcpuclockid>
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_pthread_getcpuclockid_112)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_pthread_getcpuclockid_110)<<S32 ' NEU4 reg coni
 alignl ' align long
C_pthread_getcpuclockid_112
 word I16A_MOVI + (r22)<<D16A + (22)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_pthread_getcpuclockid_109)<<S32 ' JUMPV addrg
 alignl ' align long
C_pthread_getcpuclockid_110
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_errno)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_pthread_getcpuclockid_109
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Import pthread_attr_copy

' Catalina Import _thread_stall

' Catalina Import _locknew

' Catalina Data

DAT ' uninitialized data segment

' Catalina Export _Pthread_Pool

 alignl ' align long
C__P_thread_P_ool ' <symbol:_Pthread_Pool>
 byte 0[1007]

' Catalina Code

DAT ' code segment

' Catalina Import _thread_cog

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _cogid

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import t_vprintf

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import t_printf

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import malloc

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import free

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_attr_init

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import pthread_exit

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import errno

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_allow

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_wait

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_lockset

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_lockclr

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_locknew

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_init_lock_pool

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_yield

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_start

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_affinity_change

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_set_extended

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_extended

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_id

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_ticks

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_set_lock

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment

' Catalina Import _thread_get_lock

' Catalina Data

DAT ' uninitialized data segment

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_pthread_lock_check_53_L000054 ' <symbol:53>
 byte 80
 byte 82
 byte 73
 byte 78
 byte 84
 byte 70
 byte 32
 byte 76
 byte 79
 byte 67
 byte 75
 byte 32
 byte 70
 byte 65
 byte 73
 byte 76
 byte 69
 byte 68
 byte 33
 byte 10
 byte 0

 alignl ' align long
C_pthread_lock_check_49_L000050 ' <symbol:49>
 byte 80
 byte 82
 byte 73
 byte 78
 byte 84
 byte 70
 byte 32
 byte 76
 byte 79
 byte 67
 byte 75
 byte 32
 byte 105
 byte 115
 byte 32
 byte 37
 byte 100
 byte 10
 byte 0

 alignl ' align long
C_pthread_lock_check_47_L000048 ' <symbol:47>
 byte 78
 byte 79
 byte 32
 byte 80
 byte 82
 byte 73
 byte 78
 byte 84
 byte 70
 byte 32
 byte 76
 byte 79
 byte 67
 byte 75
 byte 33
 byte 10
 byte 0

 alignl ' align long
C_pthread_lock_check_43_L000044 ' <symbol:43>
 byte 80
 byte 84
 byte 72
 byte 82
 byte 69
 byte 65
 byte 68
 byte 32
 byte 76
 byte 79
 byte 67
 byte 75
 byte 32
 byte 105
 byte 115
 byte 32
 byte 37
 byte 100
 byte 10
 byte 0

 alignl ' align long
C_pthread_lock_check_41_L000042 ' <symbol:41>
 byte 78
 byte 79
 byte 32
 byte 80
 byte 84
 byte 72
 byte 82
 byte 69
 byte 65
 byte 68
 byte 32
 byte 76
 byte 79
 byte 67
 byte 75
 byte 33
 byte 10
 byte 0

 alignl ' align long
C_pthread_lock_check_37_L000038 ' <symbol:37>
 byte 75
 byte 69
 byte 82
 byte 78
 byte 69
 byte 76
 byte 32
 byte 76
 byte 79
 byte 67
 byte 75
 byte 32
 byte 105
 byte 115
 byte 32
 byte 37
 byte 100
 byte 10
 byte 0

 alignl ' align long
C_pthread_printf_ln_34_L000035 ' <symbol:34>
 byte 10
 byte 0

' Catalina Code

DAT ' code segment
' end
