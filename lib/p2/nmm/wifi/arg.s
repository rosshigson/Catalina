' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export wifi_ARG

 alignl ' align long
C_wifi_A_R_G_ ' <symbol:wifi_ARG>
 calld PA,#NEWF
 sub SP, #260
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, ##@C_wifi_init
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 if_nz jmp #\C_wifi_A_R_G__2 ' NEI4
 mov r0, #16 ' reg <- coni
 jmp #\@C_wifi_A_R_G__1 ' JUMPV addrg
C_wifi_A_R_G__2
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_strlen ' CALL addrg
 cmp r0,  #241 wcz 
 if_be jmp #\C_wifi_A_R_G__4 ' LEU4
 mov r0, #16 ' reg <- coni
 jmp #\@C_wifi_A_R_G__1 ' JUMPV addrg
C_wifi_A_R_G__4
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, ##@C_wifi_A_R_G__6_L000007 ' reg ARG ADDRG
 mov r5, FP
 sub r5, #-(-264) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_isprintf
 add SP, #12 ' CALL addrg
 mov r2, FP
 sub r2, #-(-264) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_wifi_S_end_C_ommand ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wz
 if_nz jmp #\C_wifi_A_R_G__8 ' NEI4
 mov r2, ##512 ' reg ARG con
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_wifi_R_ead_V_alue
 add SP, #4 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C_wifi_A_R_G__8
 mov r0, r17 ' CVI, CVU or LOAD
C_wifi_A_R_G__1
 calld PA,#POPM ' restore registers
 add SP, #260 ' framesize
 calld PA,#RETF


' Catalina Import wifi_Read_Value

' Catalina Import wifi_Send_Command

' Catalina Import wifi_init

' Catalina Import isprintf

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
