' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_smnc_670edb12_digits_L000001 ' <symbol:digits>
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

' Catalina Export _printf_putl

' Catalina Code

DAT ' code segment

 alignl ' align long
C__printf_putl ' <symbol:_printf_putl>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $faaa80 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -9
 wrbyte r22, RI ' ASGNU1 addrl reg
 mov r15, FP
 sub r15, #-(-10) ' reg <- addrli
 mov r13, r15 ' CVI, CVU or LOAD
 cmps r23,  #0 wz
 jmp #BR_Z
 long @C__printf_putl_5 ' EQI4
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #10 wz
 jmp #BRNZ
 long @C__printf_putl_5 ' NEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C__printf_putl_5 ' GEI4
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 reg
 neg r22, r22 ' NEGI4
 jmp #LODF
 long 8
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #JMPA
 long @C__printf_putl_6 ' JUMPV addrg
C__printf_putl_5
 mov r23, #0 ' reg <- coni
C__printf_putl_6
C__printf_putl_7
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 add r20, #12 ' reg <- addrfi
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r11, r1 ' CVI, CVU or LOAD
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 jmp #LODF
 long 8
 wrlong r0, RI ' ASGNU4 addrl reg
 mov r22, r13 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 jmp #LODL
 long @C_smnc_670edb12_digits_L000001
 mov r20, RI ' reg <- addrg
 adds r20, r11 ' ADDI/P (2)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
' C__printf_putl_8 ' (symbol refcount = 0)
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 reg
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C__printf_putl_7 ' NEU4
 cmps r23,  #0 wz
 jmp #BR_Z
 long @C__printf_putl_10 ' EQI4
 mov r22, r13 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 mov r13, r22 ' ADDI/P
 adds r13, r20 ' ADDI/P (3)
 mov r20, #45 ' reg <- coni
 wrbyte r20, r22 ' ASGNU1 reg reg
C__printf_putl_10
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r13 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r7, r22 ' CVI, CVU or LOAD
 mov r9, r17 ' CVI, CVU or LOAD
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 cmps r23,  #0 wz
 jmp #BR_Z
 long @C__printf_putl_12 ' EQI4
 cmp r19,  #32 wz
 jmp #BR_Z
 long @C__printf_putl_12 ' EQU4
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, #45 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__printf_putc
 add SP, #4 ' CALL addrg
 adds r9, r0 ' ADDI/P (2)
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C__printf_putl_12
 mov r2, r9 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r7 ' CVI, CVU or LOAD
 mov r5, r21 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__printf_pad
 add SP, #12 ' CALL addrg
 adds r9, r0 ' ADDI/P (2)
 mov r2, r9 ' CVI, CVU or LOAD
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r3, r22 ' ADDI/P
 adds r3, r13 ' ADDI/P (3)
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__printf_puts
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
 long @C__printf_pad
 add SP, #12 ' CALL addrg
 adds r9, r0 ' ADDI/P (2)
 mov r22, r9 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
' C__printf_putl_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Import _printf_pad

' Catalina Import _printf_puts

' Catalina Import _printf_putc
' end
