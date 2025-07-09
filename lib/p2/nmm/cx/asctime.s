' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_sa8c_686cc534_two_digits_L000001 ' <symbol:two_digits>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, #10 ' reg <- coni
 mov r0, r3 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r22, r1
 adds r22, #48 ' ADDI4 coni
 wrbyte r22, r4 ' ASGNU1 reg reg
 cmps r2,  #0 wz
 if_nz jmp #\C_sa8c_686cc534_two_digits_L000001_3 ' NEI4
 rdbyte r22, r4 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #48 wz
 if_nz jmp #\C_sa8c_686cc534_two_digits_L000001_3 ' NEI4
 mov r22, #32 ' reg <- coni
 wrbyte r22, r4 ' ASGNU1 reg reg
C_sa8c_686cc534_two_digits_L000001_3
 adds r4, #1 ' ADDP4 coni
 mov r22, r4 ' CVI, CVU or LOAD
 mov r4, r22
 adds r4, #1 ' ADDP4 coni
 mov r20, #10 ' reg <- coni
 mov r0, r3 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r20, r1
 adds r20, #48 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r4
 adds r22, #1 ' ADDP4 coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov r0, r22 ' CVI, CVU or LOAD
' C_sa8c_686cc534_two_digits_L000001_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


 alignl ' align long
C_sa8c1_686cc534_four_digits_L000005 ' <symbol:four_digits>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, ##10000 ' reg <- con
 mov r0, r2 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r2, r1 ' CVI, CVU or LOAD
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r20, ##1000 ' reg <- con
 mov r0, r2 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r20, r0
 adds r20, #48 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, ##1000 ' reg <- con
 mov r0, r2 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r2, r1 ' CVI, CVU or LOAD
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r20, #100 ' reg <- coni
 mov r0, r2 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r20, r0
 adds r20, #48 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #100 ' reg <- coni
 mov r0, r2 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r2, r1 ' CVI, CVU or LOAD
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r20, #10 ' reg <- coni
 mov r0, r2 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r20, r0
 adds r20, #48 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r3 ' CVI, CVU or LOAD
 mov r3, r22
 adds r3, #1 ' ADDP4 coni
 mov r20, #10 ' reg <- coni
 mov r0, r2 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#DIVS ' DIVI
 mov r20, r1
 adds r20, #48 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r3
 adds r22, #1 ' ADDP4 coni
 mov r3, r22 ' CVI, CVU or LOAD
 mov r0, r22 ' CVI, CVU or LOAD
' C_sa8c1_686cc534_four_digits_L000005_6 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Data

DAT ' uninitialized data segment

 alignl ' align long
C_asctime_buf_L000009 ' <symbol:buf>
 byte 0[26]

' Catalina Export asctime

' Catalina Code

DAT ' code segment

 alignl ' align long
C_asctime ' <symbol:asctime>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r21, ##@C_asctime_buf_L000009 ' reg <- addrg
 mov r2, ##@C_asctime_10_L000011 ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C__days ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r17, #3 ' reg <- coni
 jmp #\@C_asctime_13 ' JUMPV addrg
C_asctime_12
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 mov r19, r20
 adds r19, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_asctime_13
 mov r22, r17
 subs r22, #1 ' SUBI4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 if_ae jmp #\C_asctime_12 ' GEI4
 adds r21, #1 ' ADDP4 coni
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C__months ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r17, #3 ' reg <- coni
 jmp #\@C_asctime_16 ' JUMPV addrg
C_asctime_15
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 adds r21, #1 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 mov r19, r20
 adds r19, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
C_asctime_16
 mov r22, r17
 subs r22, #1 ' SUBI4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 if_ae jmp #\C_asctime_15 ' GEI4
 adds r21, #1 ' ADDP4 coni
 mov r2, #0 ' reg ARG coni
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa8c_686cc534_two_digits_L000001
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r3, r20 ' reg <- INDIRI4 reg
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa8c_686cc534_two_digits_L000001
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r3, r20 ' reg <- INDIRI4 reg
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa8c_686cc534_two_digits_L000001
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 rdlong r3, r23 ' reg <- INDIRI4 reg
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa8c_686cc534_two_digits_L000001
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##1900 ' reg <- con
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_sa8c1_686cc534_four_digits_L000005
 add SP, #4 ' CALL addrg
 mov r0, ##@C_asctime_buf_L000009 ' reg <- addrg
' C_asctime_7 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _months

' Catalina Import _days

' Catalina Import strcpy

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_asctime_10_L000011 ' <symbol:10>
 byte 63
 byte 63
 byte 63
 byte 32
 byte 63
 byte 63
 byte 63
 byte 32
 byte 63
 byte 63
 byte 32
 byte 63
 byte 63
 byte 58
 byte 63
 byte 63
 byte 58
 byte 63
 byte 63
 byte 32
 byte 63
 byte 63
 byte 63
 byte 63
 byte 10
 byte 0

' Catalina Code

DAT ' code segment
' end
