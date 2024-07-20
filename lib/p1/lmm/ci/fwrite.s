' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export fwrite

 alignl ' align long
C_fwrite ' <symbol:fwrite>
 jmp #NEWF
 jmp #PSHM
 long $faa800 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, r23 ' CVI, CVU or LOAD
 mov r11, #0 ' reg <- coni
 cmp r21,  #0 wz
 jmp #BR_Z
 long @C_fwrite_2 ' EQU4
 jmp #JMPA
 long @C_fwrite_5 ' JUMPV addrg
C_fwrite_4
 mov r13, r21 ' CVI, CVU or LOAD
C_fwrite_7
 mov r2, r17 ' CVI, CVU or LOAD
 rdbyte r22, r15 ' reg <- INDIRU1 reg
 mov r3, r22 ' CVUI
 and r3, cviu_m1 ' zero extend
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_putc
 add SP, #4 ' CALL addrg
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BRNZ
 long @C_fwrite_10 ' NEI4
 mov r0, r11 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_fwrite_1 ' JUMPV addrg
C_fwrite_10
 adds r15, #1 ' ADDP4 coni
' C_fwrite_8 ' (symbol refcount = 0)
 mov r22, r13
 sub r22, #1 ' SUBU4 coni
 mov r13, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_fwrite_7 ' NEU4
 add r11, #1 ' ADDU4 coni
C_fwrite_5
 cmp r11, r19 wz,wc 
 jmp #BR_B
 long @C_fwrite_4' LTU4
C_fwrite_2
 mov r0, r11 ' CVI, CVU or LOAD
C_fwrite_1
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import putc
' end
