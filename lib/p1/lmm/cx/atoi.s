' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export atoi

 alignl ' align long
C_atoi ' <symbol:atoi>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $f00000 ' save registers
 mov r23, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 jmp #JMPA
 long @C_atoi_3 ' JUMPV addrg
C_atoi_2
 adds r2, #1 ' ADDP4 coni
C_atoi_3
 rdbyte r22, r2 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 jmp #LODL
 long @C___ctype+1
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_atoi_2 ' NEI4
 rdbyte r22, r2 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #43 wz
 jmp #BRNZ
 long @C_atoi_6 ' NEI4
 adds r2, #1 ' ADDP4 coni
 jmp #JMPA
 long @C_atoi_11 ' JUMPV addrg
C_atoi_6
 rdbyte r22, r2 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #45 wz
 jmp #BRNZ
 long @C_atoi_11 ' NEI4
 mov r22, #1 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 adds r2, #1 ' ADDP4 coni
 jmp #JMPA
 long @C_atoi_11 ' JUMPV addrg
C_atoi_10
 mov r22, #10 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r2 ' CVI, CVU or LOAD
 mov r2, r22
 adds r2, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 adds r23, r22 ' ADDI/P (1)
C_atoi_11
 rdbyte r22, r2 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wz,wc 
 jmp #BR_B
 long @C_atoi_10' LTU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C_atoi_14 ' EQI4
 neg r21, r23 ' NEGI4
 jmp #JMPA
 long @C_atoi_15 ' JUMPV addrg
C_atoi_14
 mov r21, r23 ' CVI, CVU or LOAD
C_atoi_15
 mov r0, r21 ' CVI, CVU or LOAD
' C_atoi_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import __ctype
' end
