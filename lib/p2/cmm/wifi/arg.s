' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export wifi_ARG

 alignl ' align long
C_wifi_A_R_G_ ' <symbol:wifi_ARG>
 alignl ' align long
 long I32_NEWF + 260<<S32
 alignl ' align long
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODI + (@C_wifi_init)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_wifi_A_R_G__2)<<S32 ' NEI4 reg coni
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_wifi_A_R_G__1)<<S32 ' JUMPV addrg
 alignl ' align long
C_wifi_A_R_G__2
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_strlen)<<S32 ' CALL addrg
 alignl ' align long
 long I32_MOVI + RI<<D32 + (241)<<S32
 word I16A_CMP + (r0)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BRBE + (@C_wifi_A_R_G__4)<<S32 ' LEU4 reg coni
 word I16A_MOVI + R0<<D16A + (16)<<S16A ' RET coni
 alignl ' align long
 long I32_JMPA + (@C_wifi_A_R_G__1)<<S32 ' JUMPV addrg
 alignl ' align long
C_wifi_A_R_G__4
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r4)<<D16B
 alignl ' align long
 long @C_wifi_A_R_G__6_L000007 ' reg ARG ADDRG
 alignl ' align long
 long I32_LODF + ((-264)&$FFFFFF)<<S32 
 word I16A_MOV + (r5)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16B_CPREP + 67<<S16B ' arg size, rpsize = 16, spsize = 16
 alignl ' align long
 long I32_CALA + (@C_isprintf)<<S32
 word I16A_ADDI + SP<<D16A + 12<<S16A ' CALL addrg
 alignl ' align long
 long I32_LODF + ((-264)&$FFFFFF)<<S32 
 word I16A_MOV + (r2)<<D16A + RI<<S16A ' reg ARG ADDRL
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_wifi_S_end_C_ommand)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r17)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_wifi_A_R_G__8)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_LODS + (r2)<<D32S + ((512)&$7FFFF)<<S32 ' reg ARG cons
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C_wifi_R_ead_V_alue)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_wifi_A_R_G__8
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_wifi_A_R_G__1
 word I16B_POPM + 65<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import wifi_Read_Value

' Catalina Import wifi_Send_Command

' Catalina Import isprintf

' Catalina Import wifi_init

' Catalina Import strlen

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_wifi_A_R_G__6_L000007 ' <symbol:6>
 byte 65
 byte 82
 byte 71
 byte 58
 byte 37
 byte 117
 byte 44
 byte 37
 byte 115
 byte 0

' Catalina Code

DAT ' code segment
' end
