' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_s95k_616ac864_two_digits_L000001 ' <symbol:two_digits>
 PRIMITIVE(#PSHM)
 long $f80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #10 ' reg <- coni
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r20, r0 ' CVI, CVU or LOAD
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r22, r1
 adds r22, #48 ' ADDI4 coni
 wrbyte r22, r23 ' ASGNU1 reg reg
 cmps r19,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_s95k_616ac864_two_digits_L000001_3 ' NEI4
 rdbyte r22, r23 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #48 wz
 PRIMITIVE(#BRNZ)
 long @C_s95k_616ac864_two_digits_L000001_3 ' NEI4
 mov r22, #32 ' reg <- coni
 wrbyte r22, r23 ' ASGNU1 reg reg
C_s95k_616ac864_two_digits_L000001_3
 adds r23, #1 ' ADDP4 coni
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, #10 ' reg <- coni
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r20, r1
 adds r20, #48 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 mov r0, r22 ' CVI, CVU or LOAD
' C_s95k_616ac864_two_digits_L000001_2 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


 alignl ' align long
C_s95k1_616ac864_four_digits_L000005 ' <symbol:four_digits>
 PRIMITIVE(#PSHM)
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 PRIMITIVE(#LODL)
 long 10000
 mov r22, RI ' reg <- con
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r21, r1 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 PRIMITIVE(#LODL)
 long 1000
 mov r20, RI ' reg <- con
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r20, r0
 adds r20, #48 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 PRIMITIVE(#LODL)
 long 1000
 mov r22, RI ' reg <- con
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r21, r1 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, #100 ' reg <- coni
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r20, r0
 adds r20, #48 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, #100 ' reg <- coni
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r21, r1 ' CVI, CVU or LOAD
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, #10 ' reg <- coni
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r20, r0
 adds r20, #48 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 adds r23, #1 ' ADDP4 coni
 mov r20, #10 ' reg <- coni
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r20, r1
 adds r20, #48 ' ADDI4 coni
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r23
 adds r22, #1 ' ADDP4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 mov r0, r22 ' CVI, CVU or LOAD
' C_s95k1_616ac864_four_digits_L000005_6 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


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
 PRIMITIVE(#PSHM)
 long $fa0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODL)
 long @C_asctime_buf_L000009
 mov r21, RI ' reg <- addrg
 PRIMITIVE(#LODL)
 long @C_asctime_10_L000011
 mov r2, RI ' reg ARG ADDRG
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_strcpy
 add SP, #4 ' CALL addrg
 mov r22, r23
 adds r22, #24 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 PRIMITIVE(#LODL)
 long @C__days
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r17, #3 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_asctime_13 ' JUMPV addrg
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
 PRIMITIVE(#BRAE)
 long @C_asctime_12 ' GEI4
 adds r21, #1 ' ADDP4 coni
 mov r22, r23
 adds r22, #16 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 shl r22, #2 ' LSHI4 coni
 PRIMITIVE(#LODL)
 long @C__months
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r19, r22 ' reg <- INDIRP4 reg
 mov r17, #3 ' reg <- coni
 PRIMITIVE(#JMPA)
 long @C_asctime_16 ' JUMPV addrg
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
 PRIMITIVE(#BRAE)
 long @C_asctime_15 ' GEI4
 adds r21, #1 ' ADDP4 coni
 mov r2, #0 ' reg ARG coni
 mov r22, r23
 adds r22, #12 ' ADDP4 coni
 rdlong r3, r22 ' reg <- INDIRI4 reg
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_s95k_616ac864_two_digits_L000001
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r20, r23
 adds r20, #8 ' ADDP4 coni
 rdlong r3, r20 ' reg <- INDIRI4 reg
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_s95k_616ac864_two_digits_L000001
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 mov r20, r23
 adds r20, #4 ' ADDP4 coni
 rdlong r3, r20 ' reg <- INDIRI4 reg
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_s95k_616ac864_two_digits_L000001
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, #1 ' reg ARG coni
 rdlong r3, r23 ' reg <- INDIRI4 reg
 mov r4, r22 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_s95k_616ac864_two_digits_L000001
 add SP, #8 ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODL)
 long 1900
 mov r20, RI ' reg <- con
 mov r2, r22 ' ADDI/P
 adds r2, r20 ' ADDI/P (3)
 mov r3, r21 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_s95k1_616ac864_four_digits_L000005
 add SP, #4 ' CALL addrg
 PRIMITIVE(#LODL)
 long @C_asctime_buf_L000009
 mov r0, RI ' reg <- addrg
' C_asctime_7 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


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
