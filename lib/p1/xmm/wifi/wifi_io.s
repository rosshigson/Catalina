' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_s5104_67e4d7e5__printf_pad_L000005 ' <symbol:_printf_pad>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, r17 ' CVI, CVU or LOAD
 cmps r23,  #0 wz,wc
 jmp #BR_A
 long @C_s5104_67e4d7e5__printf_pad_L000005_10 ' GTI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_s5104_67e4d7e5__printf_pad_L000005_9 ' JUMPV addrg
C_s5104_67e4d7e5__printf_pad_L000005_10
 subs r23, r21 ' SUBI/P (1)
 jmp #JMPA
 long @C_s5104_67e4d7e5__printf_pad_L000005_13 ' JUMPV addrg
C_s5104_67e4d7e5__printf_pad_L000005_12
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s510_67e4d7e5__printf_putc_L000001
 add SP, #4 ' CALL addrg
 adds r15, r0 ' ADDI/P (2)
C_s5104_67e4d7e5__printf_pad_L000005_13
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 subs r23, #1 ' SUBI4 coni
 cmps r22,  #0 wz,wc
 jmp #BR_A
 long @C_s5104_67e4d7e5__printf_pad_L000005_12 ' GTI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
C_s5104_67e4d7e5__printf_pad_L000005_9
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s510_67e4d7e5__printf_putc_L000001 ' <symbol:_printf_putc>
 jmp #NEWF
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 jmp #LODL
 long $3000000
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s510_67e4d7e5__printf_putc_L000001_16 ' EQU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_putchar ' CALL addrg
 jmp #JMPA
 long @C_s510_67e4d7e5__printf_putc_L000001_17 ' JUMPV addrg
C_s510_67e4d7e5__printf_putc_L000001_16
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s510_67e4d7e5__printf_putc_L000001_17
 mov r0, #1 ' reg <- coni
' C_s510_67e4d7e5__printf_putc_L000001_15 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_s5108_67e4d7e5_digits_L000018 ' <symbol:digits>
 byte 48
 byte 49
 byte 50
 byte 51
 byte 52
 byte 53
 byte 54
 byte 55
 byte 56
 byte 57
 byte 97
 byte 98
 byte 99
 byte 100
 byte 101
 byte 102

' Catalina Code

DAT ' code segment

 alignl ' align long
C_s5103_67e4d7e5__printf_putl_L000004 ' <symbol:_printf_putl>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $faaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-9)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r15, FP
 sub r15, #-(-10) ' reg <- addrli
 mov r13, r15 ' CVI, CVU or LOAD
 cmps r23,  #0 wz
 jmp #BR_Z
 long @C_s5103_67e4d7e5__printf_putl_L000004_22 ' EQI4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #10 wz
 jmp #BRNZ
 long @C_s5103_67e4d7e5__printf_putl_L000004_22 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 regl
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_s5103_67e4d7e5__printf_putl_L000004_22 ' GEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 regl
 neg r22, r22 ' NEGI4
 mov RI, FP
 add RI, #8
 wrlong r22, RI ' ASGNU4 addrfi reg
 jmp #JMPA
 long @C_s5103_67e4d7e5__printf_putl_L000004_23 ' JUMPV addrg
C_s5103_67e4d7e5__printf_putl_L000004_22
 mov r23, #0 ' reg <- coni
C_s5103_67e4d7e5__printf_putl_L000004_23
C_s5103_67e4d7e5__printf_putl_L000004_24
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov r20, FP
 add r20, #12 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 regl
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r11, r1 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov RI, FP
 add RI, #8
 wrlong r0, RI ' ASGNU4 addrfi reg
 mov r22, r13 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 jmp #LODL
 long @C_s5108_67e4d7e5_digits_L000018
 mov r20, RI ' reg <- addrg
 adds r20, r11 ' ADDI/P (2)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_s5103_67e4d7e5__printf_putl_L000004_25 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 regl
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s5103_67e4d7e5__printf_putl_L000004_24 ' NEU4
 cmps r23,  #0 wz
 jmp #BR_Z
 long @C_s5103_67e4d7e5__printf_putl_L000004_27 ' EQI4
 mov r22, r13 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 mov r20, #45 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s5103_67e4d7e5__printf_putl_L000004_27
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r13 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r7, r22 ' CVI, CVU or LOAD
 mov r9, r17 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 cmps r23,  #0 wz
 jmp #BR_Z
 long @C_s5103_67e4d7e5__printf_putl_L000004_29 ' EQI4
 cmp r19,  #32 wz
 jmp #BR_Z
 long @C_s5103_67e4d7e5__printf_putl_L000004_29 ' EQU4
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, #45 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s510_67e4d7e5__printf_putc_L000001
 add SP, #4 ' CALL addrg
 adds r9, r0 ' ADDI/P (2)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 adds r22, #1 ' ADDI4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s5103_67e4d7e5__printf_putl_L000004_29
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r7 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5104_67e4d7e5__printf_pad_L000005
 add SP, #12 ' CALL addrg
 adds r9, r0 ' ADDI/P (2)
 mov r2, r9 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r3, r22 ' ADDI/P
 adds r3, r13 ' ADDI/P (3)
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5101_67e4d7e5__printf_puts_L000002
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 adds r9, r22 ' ADDI/P (2)
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, #32 ' reg ARG coni
 mov r4, r7 ' CVI, CVU or LOAD
 neg r5, r21 ' NEGI4
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5104_67e4d7e5__printf_pad_L000005
 add SP, #12 ' CALL addrg
 adds r9, r0 ' ADDI/P (2)
 mov r22, r9 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
' C_s5103_67e4d7e5__printf_putl_L000004_19 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_s5102_67e4d7e5__printf_putn_L000003 ' <symbol:_printf_putn>
 jmp #NEWF
 jmp #PSHM
 long $faa000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_strlen ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 mov r15, r17 ' CVI, CVU or LOAD
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r13 ' CVI, CVU or LOAD
 neg r5, r21 ' NEGI4
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5104_67e4d7e5__printf_pad_L000005
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 adds r15, r22 ' ADDI/P (2)
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5101_67e4d7e5__printf_puts_L000002
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 adds r15, r22 ' ADDI/P (2)
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r13 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5104_67e4d7e5__printf_pad_L000005
 add SP, #12 ' CALL addrg
 adds r15, r0 ' ADDI/P (2)
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
' C_s5102_67e4d7e5__printf_putn_L000003_31 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s5101_67e4d7e5__printf_puts_L000002 ' <symbol:_printf_puts>
 jmp #NEWF
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s5101_67e4d7e5__printf_puts_L000002_34 ' JUMPV addrg
C_s5101_67e4d7e5__printf_puts_L000002_33
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s510_67e4d7e5__printf_putc_L000001
 add SP, #4 ' CALL addrg
C_s5101_67e4d7e5__printf_puts_L000002_34
 mov RI, r19
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s5101_67e4d7e5__printf_puts_L000002_33 ' NEI4
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r23 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
' C_s5101_67e4d7e5__printf_puts_L000002_32 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s5109_67e4d7e5_charT_oI_nt_L000036 ' <symbol:charToInt>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #10 wz,wc
 jmp #BR_B
 long @C_s5109_67e4d7e5_charT_oI_nt_L000036_38 ' LTI4
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #7 ' SUBI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
C_s5109_67e4d7e5_charT_oI_nt_L000036_38
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #15 wz,wc
 jmp #BRBE
 long @C_s5109_67e4d7e5_charT_oI_nt_L000036_40 ' LEI4
 mov r22, r2 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #32 ' SUBI4 coni
 mov r2, r22 ' CVI, CVU or LOAD
C_s5109_67e4d7e5_charT_oI_nt_L000036_40
 mov r0, r2 ' CVUI
 and r0, cviu_m1 ' zero extend
' C_s5109_67e4d7e5_charT_oI_nt_L000036_37 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s5106_67e4d7e5__scanf_getl_L000007 ' <symbol:_scanf_getl>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $faaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r15, r22 ' CVUI
 and r15, cviu_m1 ' zero extend
 cmps r17,  #0 wz
 jmp #BR_Z
 long @C_s5106_67e4d7e5__scanf_getl_L000007_43 ' EQI4
 cmps r15,  #45 wz
 jmp #BRNZ
 long @C_s5106_67e4d7e5__scanf_getl_L000007_46 ' NEI4
 mov r9, #1 ' reg <- coni
 jmp #JMPA
 long @C_s5106_67e4d7e5__scanf_getl_L000007_47 ' JUMPV addrg
C_s5106_67e4d7e5__scanf_getl_L000007_46
 mov r9, #0 ' reg <- coni
C_s5106_67e4d7e5__scanf_getl_L000007_47
 mov RI, FP
 sub RI, #-(-8)
 wrlong r9, RI ' ASGNI4 addrli reg
 cmps r15,  #43 wz
 jmp #BR_Z
 long @C_s5106_67e4d7e5__scanf_getl_L000007_50 ' EQI4
 cmps r15,  #45 wz
 jmp #BRNZ
 long @C_s5106_67e4d7e5__scanf_getl_L000007_48 ' NEI4
C_s5106_67e4d7e5__scanf_getl_L000007_50
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #1 ' ADDP4 coni
 mov RI, FP
 add RI, #8
 wrlong r22, RI ' ASGNP4 addrfi reg
C_s5106_67e4d7e5__scanf_getl_L000007_48
C_s5106_67e4d7e5__scanf_getl_L000007_43
 mov r13, #0 ' reg <- coni
 mov r11, #0 ' reg <- coni
 jmp #JMPA
 long @C_s5106_67e4d7e5__scanf_getl_L000007_52 ' JUMPV addrg
C_s5106_67e4d7e5__scanf_getl_L000007_51
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r15, r22 ' CVUI
 and r15, cviu_m1 ' zero extend
 cmps r15,  #48 wz,wc
 jmp #BR_B
 long @C_s5106_67e4d7e5__scanf_getl_L000007_56 ' LTI4
 cmps r15,  #57 wz,wc
 jmp #BRBE
 long @C_s5106_67e4d7e5__scanf_getl_L000007_54 ' LEI4
C_s5106_67e4d7e5__scanf_getl_L000007_56
 cmps r21,  #16 wz
 jmp #BRNZ
 long @C_s5106_67e4d7e5__scanf_getl_L000007_59 ' NEI4
 cmps r15,  #65 wz,wc
 jmp #BR_B
 long @C_s5106_67e4d7e5__scanf_getl_L000007_58 ' LTI4
 cmps r15,  #70 wz,wc
 jmp #BRBE
 long @C_s5106_67e4d7e5__scanf_getl_L000007_54 ' LEI4
C_s5106_67e4d7e5__scanf_getl_L000007_58
 cmps r15,  #97 wz,wc
 jmp #BR_B
 long @C_s5106_67e4d7e5__scanf_getl_L000007_59 ' LTI4
 cmps r15,  #102 wz,wc
 jmp #BRBE
 long @C_s5106_67e4d7e5__scanf_getl_L000007_54 ' LEI4
C_s5106_67e4d7e5__scanf_getl_L000007_59
 cmps r11,  #0 wz
 jmp #BRNZ
 long @C_s5106_67e4d7e5__scanf_getl_L000007_53 ' NEI4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_s5106_67e4d7e5__scanf_getl_L000007_42 ' JUMPV addrg
C_s5106_67e4d7e5__scanf_getl_L000007_54
 mov r11, #1 ' reg <- coni
 mov r22, r15 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s5109_67e4d7e5_charT_oI_nt_L000036 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, r21 ' CVI, CVU or LOAD
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r13 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r13, r0 ' ADDU
 add r13, r22 ' ADDU (3)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, #1 ' ADDP4 coni
 mov RI, FP
 add RI, #8
 wrlong r22, RI ' ASGNP4 addrfi reg
C_s5106_67e4d7e5__scanf_getl_L000007_52
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 sub r19, #1 ' SUBU4 coni
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_s5106_67e4d7e5__scanf_getl_L000007_51 ' NEU4
C_s5106_67e4d7e5__scanf_getl_L000007_53
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s5106_67e4d7e5__scanf_getl_L000007_62 ' EQI4
 mov r22, r13 ' CVI, CVU or LOAD
 neg r22, r22 ' NEGI4
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 jmp #JMPA
 long @C_s5106_67e4d7e5__scanf_getl_L000007_63 ' JUMPV addrg
C_s5106_67e4d7e5__scanf_getl_L000007_62
 mov r22, r13 ' CVI, CVU or LOAD
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
C_s5106_67e4d7e5__scanf_getl_L000007_63
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r0, r22 ' reg <- INDIRP4 regl
C_s5106_67e4d7e5__scanf_getl_L000007_42
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


 alignl ' align long
C_s5105_67e4d7e5__doprintf_L000006 ' <symbol:_doprintf>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $faaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r13, r19 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s5105_67e4d7e5__doprintf_L000006_66 ' JUMPV addrg
C_s5105_67e4d7e5__doprintf_L000006_65
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #37 wz
 jmp #BR_Z
 long @C_s5105_67e4d7e5__doprintf_L000006_68 ' EQI4
 mov r2, r13 ' CVI, CVU or LOAD
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s510_67e4d7e5__printf_putc_L000001
 add SP, #4 ' CALL addrg
 adds r13, r0 ' ADDI/P (2)
 jmp #JMPA
 long @C_s5105_67e4d7e5__doprintf_L000006_66 ' JUMPV addrg
C_s5105_67e4d7e5__doprintf_L000006_68
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r17, BC ' reg <- INDIRU1 reg
 mov r11, #0 ' reg <- coni
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #45 wz
 jmp #BRNZ
 long @C_s5105_67e4d7e5__doprintf_L000006_70 ' NEI4
 mov r22, #1 ' reg <- coni
 mov r11, r22 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r17, BC ' reg <- INDIRU1 reg
C_s5105_67e4d7e5__doprintf_L000006_70
 mov r15, #0 ' reg <- coni
 mov r9, #32 ' reg <- coni
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wz
 jmp #BRNZ
 long @C_s5105_67e4d7e5__doprintf_L000006_75 ' NEI4
 mov r9, #48 ' reg <- coni
 jmp #JMPA
 long @C_s5105_67e4d7e5__doprintf_L000006_75 ' JUMPV addrg
C_s5105_67e4d7e5__doprintf_L000006_74
 mov r22, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r15 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 mov r15, r0 ' ADDI/P
 adds r15, r22 ' ADDI/P (3)
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r17, BC ' reg <- INDIRU1 reg
C_s5105_67e4d7e5__doprintf_L000006_75
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_s5105_67e4d7e5__doprintf_L000006_77 ' EQI4
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_isdigit ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s5105_67e4d7e5__doprintf_L000006_74 ' NEI4
C_s5105_67e4d7e5__doprintf_L000006_77
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s5105_67e4d7e5__doprintf_L000006_78 ' NEI4
 jmp #JMPA
 long @C_s5105_67e4d7e5__doprintf_L000006_67 ' JUMPV addrg
C_s5105_67e4d7e5__doprintf_L000006_78
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #37 wz
 jmp #BRNZ
 long @C_s5105_67e4d7e5__doprintf_L000006_80 ' NEI4
 mov r2, r13 ' CVI, CVU or LOAD
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r3, r22 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s510_67e4d7e5__printf_putc_L000001
 add SP, #4 ' CALL addrg
 adds r13, r0 ' ADDI/P (2)
 jmp #JMPA
 long @C_s5105_67e4d7e5__doprintf_L000006_66 ' JUMPV addrg
C_s5105_67e4d7e5__doprintf_L000006_80
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 mov r21, r22 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r20, RI ' reg <- con
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 mov r7, r22 ' CVI, CVU or LOAD
 mov r22, #16 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r20, #99 ' reg <- coni
 cmps r22, r20 wz
 jmp #BR_Z
 long @C_s5105_67e4d7e5__doprintf_L000006_85 ' EQI4
 cmps r22,  #100 wz
 jmp #BR_Z
 long @C_s5105_67e4d7e5__doprintf_L000006_89 ' EQI4
 cmps r22, r20 wz,wc
 jmp #BR_B
 long @C_s5105_67e4d7e5__doprintf_L000006_82 ' LTI4
' C_s5105_67e4d7e5__doprintf_L000006_98 ' (symbol refcount = 0)
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 cmps r22,  #115 wz
 jmp #BR_Z
 long @C_s5105_67e4d7e5__doprintf_L000006_86 ' EQI4
 cmps r22,  #117 wz
 jmp #BR_Z
 long @C_s5105_67e4d7e5__doprintf_L000006_89 ' EQI4
 cmps r22,  #120 wz
 jmp #BR_Z
 long @C_s5105_67e4d7e5__doprintf_L000006_90 ' EQI4
 jmp #JMPA
 long @C_s5105_67e4d7e5__doprintf_L000006_82 ' JUMPV addrg
C_s5105_67e4d7e5__doprintf_L000006_85
 mov r22, r7 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 mov r7, r22 ' CVI, CVU or LOAD
C_s5105_67e4d7e5__doprintf_L000006_86
 cmps r11,  #0 wz
 jmp #BR_Z
 long @C_s5105_67e4d7e5__doprintf_L000006_87 ' EQI4
 neg r15, r15 ' NEGI4
C_s5105_67e4d7e5__doprintf_L000006_87
 mov r2, r13 ' CVI, CVU or LOAD
 mov r22, r9 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r15 ' CVI, CVU or LOAD
 mov r5, r7 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5102_67e4d7e5__printf_putn_L000003
 add SP, #12 ' CALL addrg
 adds r13, r0 ' ADDI/P (2)
 jmp #JMPA
 long @C_s5105_67e4d7e5__doprintf_L000006_83 ' JUMPV addrg
C_s5105_67e4d7e5__doprintf_L000006_89
 mov r22, #10 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s5105_67e4d7e5__doprintf_L000006_90
 cmps r15,  #0 wz
 jmp #BRNZ
 long @C_s5105_67e4d7e5__doprintf_L000006_91 ' NEI4
 mov r15, #1 ' reg <- coni
C_s5105_67e4d7e5__doprintf_L000006_91
 cmps r11,  #0 wz
 jmp #BR_Z
 long @C_s5105_67e4d7e5__doprintf_L000006_93 ' EQI4
 neg r15, r15 ' NEGI4
C_s5105_67e4d7e5__doprintf_L000006_93
 mov r2, r13 ' CVI, CVU or LOAD
 mov r22, r9 ' CVUI
 and r22, cviu_m1 ' zero extend
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r15 ' CVI, CVU or LOAD
 mov r22, r17 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #100 wz
 jmp #BRNZ
 long @C_s5105_67e4d7e5__doprintf_L000006_96 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s5105_67e4d7e5__doprintf_L000006_97 ' JUMPV addrg
C_s5105_67e4d7e5__doprintf_L000006_96
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s5105_67e4d7e5__doprintf_L000006_97
 mov RI, FP
 sub RI, #-(-20)
 rdlong r5, RI ' reg ARG INDIR ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 jmp #PSHF
 long -8 ' stack ARG INDIR ADDRLi
 mov RI, r7
 jmp #PSHL ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s5103_67e4d7e5__printf_putl_L000004
 add SP, #20 ' CALL addrg
 adds r13, r0 ' ADDI/P (2)
C_s5105_67e4d7e5__doprintf_L000006_82
C_s5105_67e4d7e5__doprintf_L000006_83
C_s5105_67e4d7e5__doprintf_L000006_66
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVI, CVU or LOAD
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s5105_67e4d7e5__doprintf_L000006_65 ' NEI4
C_s5105_67e4d7e5__doprintf_L000006_67
 mov r22, r13 ' CVI, CVU or LOAD
 mov r20, r19 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
' C_s5105_67e4d7e5__doprintf_L000006_64 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


 alignl ' align long
C_s510a_67e4d7e5_isspace_L000099 ' <symbol:isspace>
 jmp #PSHM
 long $800000 ' save registers
 cmps r2,  #0 wz
 jmp #BR_Z
 long @C_s510a_67e4d7e5_isspace_L000099_109 ' EQI4
 cmps r2,  #32 wz
 jmp #BR_Z
 long @C_s510a_67e4d7e5_isspace_L000099_109 ' EQI4
 cmps r2,  #12 wz
 jmp #BR_Z
 long @C_s510a_67e4d7e5_isspace_L000099_109 ' EQI4
 cmps r2,  #11 wz
 jmp #BR_Z
 long @C_s510a_67e4d7e5_isspace_L000099_109 ' EQI4
 cmps r2,  #9 wz
 jmp #BR_Z
 long @C_s510a_67e4d7e5_isspace_L000099_109 ' EQI4
 cmps r2,  #13 wz
 jmp #BR_Z
 long @C_s510a_67e4d7e5_isspace_L000099_109 ' EQI4
 cmps r2,  #10 wz
 jmp #BRNZ
 long @C_s510a_67e4d7e5_isspace_L000099_102 ' NEI4
C_s510a_67e4d7e5_isspace_L000099_109
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_s510a_67e4d7e5_isspace_L000099_103 ' JUMPV addrg
C_s510a_67e4d7e5_isspace_L000099_102
 mov r23, #0 ' reg <- coni
C_s510a_67e4d7e5_isspace_L000099_103
 mov r0, r23 ' CVI, CVU or LOAD
' C_s510a_67e4d7e5_isspace_L000099_100 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


 alignl ' align long
C_s510b_67e4d7e5_trim_L000110 ' <symbol:trim>
 jmp #NEWF
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_s510b_67e4d7e5_trim_L000110_113 ' JUMPV addrg
C_s510b_67e4d7e5_trim_L000110_112
 adds r23, #1 ' ADDP4 coni
C_s510b_67e4d7e5_trim_L000110_113
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s510a_67e4d7e5_isspace_L000099 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s510b_67e4d7e5_trim_L000110_112 ' NEI4
 mov r0, r23 ' CVI, CVU or LOAD
' C_s510b_67e4d7e5_trim_L000110_111 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s510c_67e4d7e5__scanf_gets_L000115 ' <symbol:_scanf_gets>
 jmp #NEWF
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #JMPA
 long @C_s510c_67e4d7e5__scanf_gets_L000115_118 ' JUMPV addrg
C_s510c_67e4d7e5__scanf_gets_L000115_117
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, r23 ' CVI, CVU or LOAD
 mov r23, r20
 adds r23, #1 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
C_s510c_67e4d7e5__scanf_gets_L000115_118
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 sub r19, #1 ' SUBU4 coni
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s510c_67e4d7e5__scanf_gets_L000115_120 ' EQU4
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_s510c_67e4d7e5__scanf_gets_L000115_117 ' NEI4
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s510a_67e4d7e5_isspace_L000099 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s510c_67e4d7e5__scanf_gets_L000115_117 ' EQI4
C_s510c_67e4d7e5__scanf_gets_L000115_120
 cmps r17,  #0 wz
 jmp #BRNZ
 long @C_s510c_67e4d7e5__scanf_gets_L000115_121 ' NEI4
 mov r22, #0 ' reg <- coni
 mov RI, r21
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
C_s510c_67e4d7e5__scanf_gets_L000115_121
 mov r0, r23 ' CVI, CVU or LOAD
' C_s510c_67e4d7e5__scanf_gets_L000115_116 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


 alignl ' align long
C_s5107_67e4d7e5__doscanf_L000008 ' <symbol:_doscanf>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $feaa80 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r7, #0 ' reg <- coni
 jmp #JMPA
 long @C_s5107_67e4d7e5__doscanf_L000008_125 ' JUMPV addrg
C_s5107_67e4d7e5__doscanf_L000008_124
 cmps r17,  #37 wz
 jmp #BR_Z
 long @C_s5107_67e4d7e5__doscanf_L000008_127 ' EQI4
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s510a_67e4d7e5_isspace_L000099 ' CALL addrg
 cmps r0,  #0 wz
 jmp #BR_Z
 long @C_s5107_67e4d7e5__doscanf_L000008_129 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s510b_67e4d7e5_trim_L000110 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_s5107_67e4d7e5__doscanf_L000008_125 ' JUMPV addrg
C_s5107_67e4d7e5__doscanf_L000008_129
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22, r17 wz
 jmp #BR_Z
 long @C_s5107_67e4d7e5__doscanf_L000008_125 ' EQI4
 jmp #JMPA
 long @C_s5107_67e4d7e5__doscanf_L000008_126 ' JUMPV addrg
C_s5107_67e4d7e5__doscanf_L000008_127
 mov RI, r21
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_isdigit ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C_s5107_67e4d7e5__doscanf_L000008_133 ' NEI4
 jmp #LODL
 long 2147483647
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s5107_67e4d7e5__doscanf_L000008_134 ' JUMPV addrg
C_s5107_67e4d7e5__doscanf_L000008_133
 mov r2, #0 ' reg ARG coni
 mov r3, #11 ' reg ARG coni
 mov r4, #10 ' reg ARG coni
 mov r5, FP
 sub r5, #-(-8) ' reg ARG ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r21
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s5106_67e4d7e5__scanf_getl_L000007
 add SP, #16 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
C_s5107_67e4d7e5__doscanf_L000008_134
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r17, r22 ' CVUI
 and r17, cviu_m1 ' zero extend
 cmps r17,  #99 wz
 jmp #BR_Z
 long @C_s5107_67e4d7e5__doscanf_L000008_135 ' EQI4
 cmps r17,  #37 wz
 jmp #BR_Z
 long @C_s5107_67e4d7e5__doscanf_L000008_135 ' EQI4
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_s510b_67e4d7e5_trim_L000110 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov RI, r23
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_s5107_67e4d7e5__doscanf_L000008_137 ' NEI4
 jmp #JMPA
 long @C_s5107_67e4d7e5__doscanf_L000008_126 ' JUMPV addrg
C_s5107_67e4d7e5__doscanf_L000008_137
C_s5107_67e4d7e5__doscanf_L000008_135
 mov r13, #16 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov r11, r22 ' CVI, CVU or LOAD
 mov r20, r19
 adds r20, #4 ' ADDP4 coni
 mov r19, r20 ' CVI, CVU or LOAD
 jmp #LODL
 long -4
 mov r18, RI ' reg <- con
 adds r20, r18 ' ADDI/P (1)
 mov RI, r20
 jmp #RLNG
 mov r20, BC ' reg <- INDIRI4 reg
 mov r9, r20 ' CVI, CVU or LOAD
 mov r15, r22 ' CVI, CVU or LOAD
 cmps r17,  #99 wz
 jmp #BR_Z
 long @C_s5107_67e4d7e5__doscanf_L000008_144 ' EQI4
 mov r22, #100 ' reg <- coni
 cmps r17, r22 wz
 jmp #BR_Z
 long @C_s5107_67e4d7e5__doscanf_L000008_150 ' EQI4
 cmps r17, r22 wz,wc
 jmp #BR_A
 long @C_s5107_67e4d7e5__doscanf_L000008_158 ' GTI4
' C_s5107_67e4d7e5__doscanf_L000008_157 ' (symbol refcount = 0)
 cmps r17,  #37 wz
 jmp #BR_Z
 long @C_s5107_67e4d7e5__doscanf_L000008_141 ' EQI4
 jmp #JMPA
 long @C_s5107_67e4d7e5__doscanf_L000008_139 ' JUMPV addrg
C_s5107_67e4d7e5__doscanf_L000008_158
 cmps r17,  #115 wz
 jmp #BR_Z
 long @C_s5107_67e4d7e5__doscanf_L000008_147 ' EQI4
 cmps r17,  #117 wz
 jmp #BR_Z
 long @C_s5107_67e4d7e5__doscanf_L000008_150 ' EQI4
 cmps r17,  #120 wz
 jmp #BR_Z
 long @C_s5107_67e4d7e5__doscanf_L000008_151 ' EQI4
 jmp #JMPA
 long @C_s5107_67e4d7e5__doscanf_L000008_139 ' JUMPV addrg
C_s5107_67e4d7e5__doscanf_L000008_141
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #37 wz
 jmp #BR_Z
 long @C_s5107_67e4d7e5__doscanf_L000008_140 ' EQI4
 mov r15, #1 ' reg <- coni
 jmp #JMPA
 long @C_s5107_67e4d7e5__doscanf_L000008_140 ' JUMPV addrg
C_s5107_67e4d7e5__doscanf_L000008_144
 mov r11, #1 ' reg <- coni
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long 2147483647
 mov r20, RI ' reg <- con
 cmps r22, r20 wz
 jmp #BRNZ
 long @C_s5107_67e4d7e5__doscanf_L000008_145 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s5107_67e4d7e5__doscanf_L000008_145
C_s5107_67e4d7e5__doscanf_L000008_147
 mov r2, r11 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r9 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_s510c_67e4d7e5__scanf_gets_L000115
 add SP, #12 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s5107_67e4d7e5__doscanf_L000008_140 ' EQU4
 adds r7, #1 ' ADDI4 coni
 jmp #JMPA
 long @C_s5107_67e4d7e5__doscanf_L000008_140 ' JUMPV addrg
C_s5107_67e4d7e5__doscanf_L000008_150
 mov r13, #10 ' reg <- coni
C_s5107_67e4d7e5__doscanf_L000008_151
 cmps r17,  #100 wz
 jmp #BRNZ
 long @C_s5107_67e4d7e5__doscanf_L000008_155 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #JMPA
 long @C_s5107_67e4d7e5__doscanf_L000008_156 ' JUMPV addrg
C_s5107_67e4d7e5__doscanf_L000008_155
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNI4 addrli reg
C_s5107_67e4d7e5__doscanf_L000008_156
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, r13 ' CVI, CVU or LOAD
 mov r5, r9 ' CVI, CVU or LOAD
 sub SP, #16 ' stack space for reg ARGs
 mov RI, r23
 jmp #PSHL ' stack ARG
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C_s5106_67e4d7e5__scanf_getl_L000007
 add SP, #16 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r0 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s5107_67e4d7e5__doscanf_L000008_140 ' EQU4
 adds r7, #1 ' ADDI4 coni
 jmp #JMPA
 long @C_s5107_67e4d7e5__doscanf_L000008_140 ' JUMPV addrg
C_s5107_67e4d7e5__doscanf_L000008_139
 mov r15, #1 ' reg <- coni
C_s5107_67e4d7e5__doscanf_L000008_140
 cmps r15,  #0 wz
 jmp #BR_Z
 long @C_s5107_67e4d7e5__doscanf_L000008_159 ' EQI4
 jmp #JMPA
 long @C_s5107_67e4d7e5__doscanf_L000008_126 ' JUMPV addrg
C_s5107_67e4d7e5__doscanf_L000008_159
C_s5107_67e4d7e5__doscanf_L000008_125
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_s5107_67e4d7e5__doscanf_L000008_162 ' EQU4
 mov r22, #0 ' reg <- coni
 mov RI, r23
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_s5107_67e4d7e5__doscanf_L000008_162 ' EQI4
 mov r20, r21 ' CVI, CVU or LOAD
 mov r21, r20
 adds r21, #1 ' ADDP4 coni
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 and r20, cviu_m1 ' zero extend
 mov r17, r20 ' CVI, CVU or LOAD
 cmps r20, r22 wz
 jmp #BRNZ
 long @C_s5107_67e4d7e5__doscanf_L000008_124 ' NEI4
C_s5107_67e4d7e5__doscanf_L000008_162
C_s5107_67e4d7e5__doscanf_L000008_126
 mov r0, r7 ' CVI, CVU or LOAD
' C_s5107_67e4d7e5__doscanf_L000008_123 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export isscanf

 alignl ' align long
C_isscanf ' <symbol:isscanf>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $400000 ' save registers
 mov RI, FP
 add RI, #8
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r2, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r3, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r4, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r5, BC ' spill reg (varadic)
 mov r22, FP
 add r22, #16 ' reg <- addrfi
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22 , RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #12
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5107_67e4d7e5__doscanf_L000008
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
' C_isscanf_163 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Export isprintf

 alignl ' align long
C_isprintf ' <symbol:isprintf>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $d00000 ' save registers
 mov RI, FP
 add RI, #8
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r2, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r3, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r4, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wz,wc
 if_ae wrlong r5, BC ' spill reg (varadic)
 mov r22, FP
 add r22, #16 ' reg <- addrfi
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22 , RI ' ASGNP4 addrli reg
 mov RI, FP
 add RI, #8
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 sub RI, #-(-8)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #12
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_s5105_67e4d7e5__doprintf_L000006
 add SP, #8 ' CALL addrg
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 regl
 adds r22, r23 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, r23 ' CVI, CVU or LOAD
' C_isprintf_165 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import isdigit

' Catalina Import putchar

' Catalina Import strlen
' end
