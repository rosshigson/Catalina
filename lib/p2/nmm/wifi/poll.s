' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001 ' <symbol:wifi_Poll_Response>
 calld PA,#NEWF
 sub SP, #264
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 mov r15, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-268)
 wrlong r22, RI ' ASGNU4 addrli reg
 jmp #\@C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_4 ' JUMPV addrg
C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_3
 mov r2, ##1000 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_wifi_timed_rx ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wcz
 if_ae jmp #\C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_6 ' GEI4
 mov r0, #15 ' reg <- coni
 jmp #\@C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_2 ' JUMPV addrg
C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_6
C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_4
 cmps r17,  #254 wz
 if_nz jmp #\C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_3 ' NEI4
 jmp #\@C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_9 ' JUMPV addrg
C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_8
 mov r2, ##1000 ' reg ARG con
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_wifi_timed_rx ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wcz
 if_ae jmp #\C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_11 ' GEI4
 mov r0, #15 ' reg <- coni
 jmp #\@C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_2 ' JUMPV addrg
C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_11
 cmps r17,  #13 wz
 if_z jmp #\C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_13 ' EQI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 mov r20, FP
 sub r20, #-(-264) ' reg <- addrli
 adds r22, r20 ' ADDI/P (1)
 mov r20, r17 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 jmp #\@C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_14 ' JUMPV addrg
C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_13
 mov r22, FP
 sub r22, #-(-264) ' reg <- addrli
 adds r22, r15 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, ##@C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_17_L000018 ' reg ARG ADDRG
 mov r5, FP
 sub r5, #-(-264) ' reg ARG ADDRLi
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_isscanf
 add SP, #12 ' CALL addrg
 cmps r0,  #2 wz
 if_nz jmp #\C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_15 ' NEI4
 rdbyte r22, r23 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #69 wz
 if_nz jmp #\C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_19 ' NEI4
 rdlong r0, r19 ' reg <- INDIRI4 reg
 jmp #\@C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_2 ' JUMPV addrg
C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_19
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r5, ##@C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_23_L000024 ' reg ARG ADDRG
 sub SP, #16 ' stack space for reg ARGs
 mov RI, FP
 sub RI, #-(-264)
 wrlong RI, --PTRA ' stack ARG ADDRLi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C_isscanf
 add SP, #16 ' CALL addrg
 cmps r0,  #3 wz
 if_nz jmp #\C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_21 ' NEI4
 mov r0, #0 ' reg <- coni
 jmp #\@C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_2 ' JUMPV addrg
C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_21
C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_15
 mov r0, #16 ' reg <- coni
 jmp #\@C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_2 ' JUMPV addrg
C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_14
C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_9
 cmps r15,  #256 wcz
 if_b jmp #\C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_8 ' LTI4
 mov r0, #16 ' reg <- coni
C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_2
 calld PA,#POPM ' restore registers
 add SP, #264 ' framesize
 calld PA,#RETF


' Catalina Export wifi_POLL

 alignl ' align long
C_wifi_P_O_L_L_ ' <symbol:wifi_POLL>
 calld PA,#NEWF
 sub SP, #260
 calld PA,#PSHM
 long $eaa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, ##@C_wifi_init
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 if_nz jmp #\C_wifi_P_O_L_L__26 ' NEI4
 mov r0, #16 ' reg <- coni
 jmp #\@C_wifi_P_O_L_L__25 ' JUMPV addrg
C_wifi_P_O_L_L__26
 cmps r23,  #0 wz
 if_nz jmp #\C_wifi_P_O_L_L__28 ' NEI4
 mov r2, ##@C_wifi_P_O_L_L__30_L000031 ' reg ARG ADDRG
 mov r3, FP
 sub r3, #-(-264) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 jmp #\@C_wifi_P_O_L_L__29 ' JUMPV addrg
C_wifi_P_O_L_L__28
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##@C_wifi_P_O_L_L__32_L000033 ' reg ARG ADDRG
 mov r4, FP
 sub r4, #-(-264) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_isprintf
 add SP, #8 ' CALL addrg
C_wifi_P_O_L_L__29
 mov r2, FP
 sub r2, #-(-264) ' reg ARG ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_wifi_S_end_C_ommand ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 if_nz jmp #\C_wifi_P_O_L_L__34 ' NEI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001
 add SP, #8 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 cmps r15,  #0 wz
 if_nz jmp #\C_wifi_P_O_L_L__36 ' NEI4
 rdbyte r13, r21 ' reg <- CVUI4 INDIRU1 reg
 cmps r13,  #78 wz
 if_z jmp #\C_wifi_P_O_L_L__41 ' EQI4
 cmps r13,  #80 wz
 if_z jmp #\C_wifi_P_O_L_L__41 ' EQI4
 mov r22, #83 ' reg <- coni
 cmps r13, r22 wz
 if_z jmp #\C_wifi_P_O_L_L__41 ' EQI4
 cmps r13, r22 wcz
 if_a jmp #\C_wifi_P_O_L_L__43 ' GTI4
' C_wifi_P_O_L_L__42 ' (symbol refcount = 0)
 cmps r13,  #68 wz
 if_z jmp #\C_wifi_P_O_L_L__41 ' EQI4
 cmps r13,  #71 wz
 if_z jmp #\C_wifi_P_O_L_L__41 ' EQI4
 jmp #\@C_wifi_P_O_L_L__38 ' JUMPV addrg
C_wifi_P_O_L_L__43
 cmps r13,  #87 wz
 if_z jmp #\C_wifi_P_O_L_L__41 ' EQI4
 cmps r13,  #88 wz
 if_z jmp #\C_wifi_P_O_L_L__41 ' EQI4
 jmp #\@C_wifi_P_O_L_L__38 ' JUMPV addrg
C_wifi_P_O_L_L__41
 mov r0, #0 ' reg <- coni
 jmp #\@C_wifi_P_O_L_L__25 ' JUMPV addrg
C_wifi_P_O_L_L__38
 mov r0, #16 ' reg <- coni
 jmp #\@C_wifi_P_O_L_L__25 ' JUMPV addrg
C_wifi_P_O_L_L__36
 mov r22, #69 ' reg <- coni
 wrbyte r22, r21 ' ASGNU1 reg reg
 wrlong r15, r17 ' ASGNI4 reg reg
 mov r0, #0 ' reg <- coni
 jmp #\@C_wifi_P_O_L_L__25 ' JUMPV addrg
C_wifi_P_O_L_L__34
 mov r0, #16 ' reg <- coni
C_wifi_P_O_L_L__25
 calld PA,#POPM ' restore registers
 add SP, #260 ' framesize
 calld PA,#RETF


' Catalina Import wifi_Send_Command

' Catalina Import isprintf

' Catalina Import isscanf

' Catalina Import wifi_timed_rx

' Catalina Import wifi_init

' Catalina Import strcpy

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_wifi_P_O_L_L__32_L000033 ' <symbol:32>
 byte 80
 byte 79
 byte 76
 byte 76
 byte 58
 byte 37
 byte 100
 byte 0

 alignl ' align long
C_wifi_P_O_L_L__30_L000031 ' <symbol:30>
 byte 80
 byte 79
 byte 76
 byte 76
 byte 0

 alignl ' align long
C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_23_L000024 ' <symbol:23>
 byte 61
 byte 37
 byte 99
 byte 44
 byte 37
 byte 117
 byte 44
 byte 37
 byte 117
 byte 0

 alignl ' align long
C_sfvk_68dcc32f_wifi_P_oll_R_esponse_L000001_17_L000018 ' <symbol:17>
 byte 61
 byte 37
 byte 99
 byte 44
 byte 37
 byte 117
 byte 0

' Catalina Code

DAT ' code segment
' end
