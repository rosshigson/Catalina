' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _doprintf_s

 alignl ' align long
C__doprintf_s ' <symbol:_doprintf_s>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C__doprintf_s_3 ' JUMPV addrg
C__doprintf_s_2
 mov r22, #37 ' reg <- coni
 mov r20, r19 ' CVUI
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C__doprintf_s_7 ' NEI4
 mov r20, r23 ' CVI, CVU or LOAD
 mov r23, r20
 adds r23, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 mov r19, r20 ' CVI, CVU or LOAD
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BRNZ
 long @C__doprintf_s_5 ' NEI4
C__doprintf_s_7
 mov r2, r19 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_putchar ' CALL addrg
 jmp #JMPA
 long @C__doprintf_s_3 ' JUMPV addrg
C__doprintf_s_5
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doprintf_s_8 ' NEI4
 jmp #JMPA
 long @C__doprintf_s_4 ' JUMPV addrg
C__doprintf_s_8
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r17, r22 ' CVI, CVU or LOAD
 mov r15, #16 ' reg <- coni
 jmp #JMPA
 long @C__doprintf_s_11 ' JUMPV addrg
C__doprintf_s_10
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r19, r22 ' reg <- INDIRU1 reg
C__doprintf_s_11
 mov r2, r19 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_isdigit ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C__doprintf_s_10 ' NEI4
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #45 wz
 jmp #BR_Z
 long @C__doprintf_s_10 ' EQI4
 mov r13, r19 ' CVUI
 and r13, cviu_m1 ' zero extend
 mov r22, #99 ' reg <- coni
 cmps r13, r22 wz
 jmp #BR_Z
 long @C__doprintf_s_16 ' EQI4
 cmps r13,  #100 wz
 jmp #BR_Z
 long @C__doprintf_s_18 ' EQI4
 cmps r13, r22 wcz
 jmp #BR_B
 long @C__doprintf_s_13 ' LTI4
' C__doprintf_s_23 ' (symbol refcount = 0)
 cmps r13,  #115 wz
 jmp #BR_Z
 long @C__doprintf_s_17 ' EQI4
 cmps r13,  #117 wz
 jmp #BR_Z
 long @C__doprintf_s_18 ' EQI4
 cmps r13,  #120 wz
 jmp #BR_Z
 long @C__doprintf_s_19 ' EQI4
 jmp #JMPA
 long @C__doprintf_s_13 ' JUMPV addrg
C__doprintf_s_16
 mov r22, r17 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 mov r17, r22 ' CVI, CVU or LOAD
C__doprintf_s_17
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_putstr ' CALL addrg
 jmp #JMPA
 long @C__doprintf_s_14 ' JUMPV addrg
C__doprintf_s_18
 mov r15, #10 ' reg <- coni
C__doprintf_s_19
 mov r22, r19 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #100 wz
 jmp #BRNZ
 long @C__doprintf_s_21 ' NEI4
 mov r11, #1 ' reg <- coni
 jmp #JMPA
 long @C__doprintf_s_22 ' JUMPV addrg
C__doprintf_s_21
 mov r11, #0 ' reg <- coni
C__doprintf_s_22
 mov r2, r11 ' CVI, CVU or LOAD
 mov r3, r15 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__printf_putls
 add SP, #8 ' CALL addrg
C__doprintf_s_13
C__doprintf_s_14
C__doprintf_s_3
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 mov r19, r22 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__doprintf_s_2 ' NEI4
C__doprintf_s_4
 mov r0, #1 ' RET coni
' C__doprintf_s_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import _printf_putls

' Catalina Import putstr

' Catalina Import putchar

' Catalina Import isdigit
' end
