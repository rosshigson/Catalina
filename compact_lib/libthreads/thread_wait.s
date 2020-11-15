' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _thread_wait

 alignl ' align long
C__thread_wait ' <symbol:_thread_wait>
 alignl ' align long
 long I32_NEWF + 4<<S32
 alignl ' align long
 long I32_PSHM + $fa0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long 1000 ' reg <- con
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_WRLONG + (r0)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_CMPI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__thread_wait_2)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_JMPA + (@C__thread_wait_1)<<S32 ' JUMPV addrg
 alignl ' align long
C__thread_wait_2
 alignl ' align long
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-4)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRU4 addrl16
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r17)<<D16A + (r19)<<S16A ' ADDU
 word I16A_ADD + (r17)<<D16A + (r0)<<S16A ' ADDU (3)
 word I16A_CMP + (r17)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BRBE + (@C__thread_wait_11)<<S32 ' LEU4 reg reg
 alignl ' align long
 long I32_JMPA + (@C__thread_wait_7)<<S32 ' JUMPV addrg
 alignl ' align long
C__thread_wait_6
 alignl ' align long
 long I32_CALA + (@C__thread_yield)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C__thread_wait_7
 word I16A_CMP + (r21)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BR_B + (@C__thread_wait_9)<<S32 ' LTU4 reg reg
 word I16A_CMP + (r21)<<D16A + (r17)<<S16A
 alignl ' align long
 long I32_BR_B + (@C__thread_wait_6)<<S32 ' LTU4 reg reg
 alignl ' align long
C__thread_wait_9
 alignl ' align long
 long I32_JMPA + (@C__thread_wait_5)<<S32 ' JUMPV addrg
 alignl ' align long
C__thread_wait_10
 alignl ' align long
 long I32_CALA + (@C__thread_yield)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C__thread_wait_11
 word I16A_CMP + (r21)<<D16A + (r19)<<S16A
 alignl ' align long
 long I32_BRAE + (@C__thread_wait_10)<<S32 ' GEU4 reg reg
 word I16A_CMP + (r21)<<D16A + (r17)<<S16A
 alignl ' align long
 long I32_BR_B + (@C__thread_wait_10)<<S32 ' LTU4 reg reg
 alignl ' align long
C__thread_wait_5
 alignl ' align long
C__thread_wait_1
 word I16B_POPM + 1<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import _thread_yield

' Catalina Import _cnt

' Catalina Import _clockfreq
' end
