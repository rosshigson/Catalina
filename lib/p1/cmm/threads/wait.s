' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _thread_wait

 alignl_label
C__thread_wait ' <symbol:_thread_wait>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $eaa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 1000 ' reg <- con
 word I16A_MOV + (r0)<<D16A + (r15)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r13)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_JMPA + (@C__thread_wait_3)<<S32 ' JUMPV addrg
 alignl_label
C__thread_wait_2
 alignl_p1
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 1000 ' reg <- con
 word I16A_CMP + (r23)<<D16A + (r22)<<S16A
 alignl_p1
 long I32_BR_B + (@C__thread_wait_5)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r17)<<D16A + (r19)<<S16A ' ADDU
 word I16A_ADD + (r17)<<D16A + (r15)<<S16A ' ADDU (3)
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long 1000 ' reg <- con
 word I16A_SUB + (r23)<<D16A + (r22)<<S16A ' SUBU (1)
 alignl_p1
 long I32_JMPA + (@C__thread_wait_6)<<S32 ' JUMPV addrg
 alignl_label
C__thread_wait_5
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r13)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r17)<<D16A + (r19)<<S16A ' ADDU
 word I16A_ADD + (r17)<<D16A + (r0)<<S16A ' ADDU (3)
 word I16A_MOVI + (r23)<<D16A + (0)<<S16A ' reg <- coni
 alignl_label
C__thread_wait_6
 word I16A_CMP + (r17)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BRBE + (@C__thread_wait_14)<<S32 ' LEU4 reg reg
 alignl_p1
 long I32_JMPA + (@C__thread_wait_10)<<S32 ' JUMPV addrg
 alignl_label
C__thread_wait_9
 alignl_p1
 long I32_CALA + (@C__thread_yield)<<S32 ' CALL addrg
 alignl_p1
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C__thread_wait_10
 word I16A_CMP + (r21)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BR_B + (@C__thread_wait_12)<<S32 ' LTU4 reg reg
 word I16A_CMP + (r21)<<D16A + (r17)<<S16A
 alignl_p1
 long I32_BR_B + (@C__thread_wait_9)<<S32 ' LTU4 reg reg
 alignl_label
C__thread_wait_12
 alignl_p1
 long I32_JMPA + (@C__thread_wait_8)<<S32 ' JUMPV addrg
 alignl_label
C__thread_wait_13
 alignl_p1
 long I32_CALA + (@C__thread_yield)<<S32 ' CALL addrg
 alignl_p1
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_label
C__thread_wait_14
 word I16A_CMP + (r21)<<D16A + (r19)<<S16A
 alignl_p1
 long I32_BRAE + (@C__thread_wait_13)<<S32 ' GEU4 reg reg
 word I16A_CMP + (r21)<<D16A + (r17)<<S16A
 alignl_p1
 long I32_BR_B + (@C__thread_wait_13)<<S32 ' LTU4 reg reg
 alignl_label
C__thread_wait_8
 alignl_label
C__thread_wait_3
 word I16A_CMPI + (r23)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__thread_wait_2)<<S32 ' NEU4 reg coni
' C__thread_wait_1 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _thread_yield

' Catalina Import _cnt

' Catalina Import _clockfreq
' end
