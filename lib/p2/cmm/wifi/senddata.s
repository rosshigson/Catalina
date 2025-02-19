' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export wifi_SEND_DATA

 alignl ' align long
C_wifi_S_E_N_D__D_A_T_A_ ' <symbol:wifi_SEND_DATA>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $eaac00<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_wifi_init)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_wifi_S_E_N_D__D_A_T_A__2)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_wifi_S_E_N_D__D_A_T_A__1)<<S32 ' JUMPV addrg
 alignl ' align long
C_wifi_S_E_N_D__D_A_T_A__2
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((512)&$7FFFF)<<S32 ' reg <- cons
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_wifi_S_E_N_D__D_A_T_A__4)<<S32 ' GTI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_wifi_R_E_P_L_Y_)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r11)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_wifi_S_E_N_D__D_A_T_A__5)<<S32 ' JUMPV addrg
 alignl ' align long
C_wifi_S_E_N_D__D_A_T_A__4
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((512)&$7FFFF)<<S32 ' reg <- cons
 word I16A_CMPS + (r19)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_wifi_S_E_N_D__D_A_T_A__6)<<S32 ' LEI4 reg reg
 alignl ' align long
 long I32_LODS + (r13)<<D32S + ((512)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r15)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_wifi_S_E_N_D__D_A_T_A__7)<<S32 ' JUMPV addrg
 alignl ' align long
C_wifi_S_E_N_D__D_A_T_A__6
 word I16A_MOV + (r13)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_wifi_S_E_N_D__D_A_T_A__7
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r5)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBI + SP<<D16A + 16<<S16A ' stack space for reg ARGs
 word I16A_MOV + RI<<D16A + (r23)<<S16A
 word I16B_PSHL ' stack ARG
 word I16A_MOVI + BC<<D16A + 20<<S16A ' arg size, rpsize = 0, spsize = 20
 word I16A_ADDI + SP<<D16A + 4<<S16A ' correct for new kernel !!! 
 alignl ' align long
 long I32_CALA + (@C_wifi_R_E_P_L_Y_)<<S32
 word I16A_ADDI + SP<<D16A + 16<<S16A ' CALL addrg
 word I16A_MOV + (r11)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((512)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r10)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_SUBS + (r15)<<D16A + (r22)<<S16A ' SUBI/P (1)
 alignl ' align long
 long I32_JMPA + (@C_wifi_S_E_N_D__D_A_T_A__9)<<S32 ' JUMPV addrg
 alignl ' align long
C_wifi_S_E_N_D__D_A_T_A__8
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((512)&$7FFFF)<<S32 ' reg <- cons
 word I16A_CMPS + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_wifi_S_E_N_D__D_A_T_A__11)<<S32 ' LEI4 reg reg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((512)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r15)<<D16A + (r22)<<S16A ' SUBI/P (1)
 word I16A_MOV + (r13)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_wifi_S_E_N_D__D_A_T_A__12)<<S32 ' JUMPV addrg
 alignl ' align long
C_wifi_S_E_N_D__D_A_T_A__11
 word I16A_MOV + (r13)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_wifi_S_E_N_D__D_A_T_A__12
 word I16A_MOV + (r2)<<D16A + (r10)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r17)<<S16A ' ADDI/P (3)
 word I16A_MOV + (r3)<<D16A + (r13)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r4)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C_wifi_S_E_N_D_)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r11)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_ADDS + (r10)<<D16A + (r13)<<S16A ' ADDI/P (1)
 alignl ' align long
C_wifi_S_E_N_D__D_A_T_A__9
 word I16A_CMPSI + (r11)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_wifi_S_E_N_D__D_A_T_A__13)<<S32 ' NEI4 reg coni
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_wifi_S_E_N_D__D_A_T_A__8)<<S32 ' GTI4 reg coni
 alignl ' align long
C_wifi_S_E_N_D__D_A_T_A__13
 alignl ' align long
C_wifi_S_E_N_D__D_A_T_A__5
 word I16A_MOV + (r0)<<D16A + (r11)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_wifi_S_E_N_D__D_A_T_A__1
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import wifi_init

' Catalina Import wifi_REPLY

' Catalina Import wifi_SEND
' end
