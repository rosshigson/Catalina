' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export atoi

 alignl ' align long
C_atoi ' <symbol:atoi>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, #0 ' reg <- coni
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 jmp #\@C_atoi_3 ' JUMPV addrg
C_atoi_2
 adds r2, #1 ' ADDP4 coni
C_atoi_3
 rdbyte r22, r2 ' reg <- CVUI4 INDIRU1 reg
 mov r20, ##@C___ctype+1 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 and r22, #8 ' BANDI4 coni
 cmps r22,  #0 wz
 if_nz jmp #\C_atoi_2 ' NEI4
 rdbyte r22, r2 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #43 wz
 if_nz jmp #\C_atoi_6 ' NEI4
 adds r2, #1 ' ADDP4 coni
 jmp #\@C_atoi_11 ' JUMPV addrg
C_atoi_6
 rdbyte r22, r2 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #45 wz
 if_nz jmp #\C_atoi_11 ' NEI4
 mov r22, #1 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNI4 addrli reg
 adds r2, #1 ' ADDP4 coni
 jmp #\@C_atoi_11 ' JUMPV addrg
C_atoi_10
 mov r22, #10 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r23 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r23, r0 ' CVI, CVU or LOAD
 mov r22, r2 ' CVI, CVU or LOAD
 mov r2, r22
 adds r2, #1 ' ADDP4 coni
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 subs r22, #48 ' SUBI4 coni
 adds r23, r22 ' ADDI/P (1)
C_atoi_11
 rdbyte r22, r2 ' reg <- CVUI4 INDIRU1 reg
 subs r22, #48 ' SUBI4 coni
 cmp r22,  #10 wcz 
 if_b jmp #\C_atoi_10 ' LTU4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wz
 if_z jmp #\C_atoi_14 ' EQI4
 neg r21, r23 ' NEGI4
 jmp #\@C_atoi_15 ' JUMPV addrg
C_atoi_14
 mov r21, r23 ' CVI, CVU or LOAD
C_atoi_15
 mov r0, r21 ' CVI, CVU or LOAD
' C_atoi_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Import __ctype
' end
