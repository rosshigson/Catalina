' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export wcstombs

 alignl ' align long
C_wcstombs ' <symbol:wcstombs>
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_wcstombs_5 ' JUMPV addrg
C_wcstombs_4
 mov r22, r4 ' CVI, CVU or LOAD
 mov r4, r22
 adds r4, #1 ' ADDP4 coni
 mov r20, r3 ' CVI, CVU or LOAD
 mov r3, r20
 adds r3, #1 ' ADDP4 coni
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 mov r22, r20 ' CVUI
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_wcstombs_7 ' NEI4
 jmp #JMPA
 long @C_wcstombs_6 ' JUMPV addrg
C_wcstombs_7
C_wcstombs_5
 mov r22, r23
 subs r22, #1 ' SUBI4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wcz
 jmp #BRAE
 long @C_wcstombs_4 ' GEI4
C_wcstombs_6
 mov r22, r23 ' CVI, CVU or LOAD
 mov RI, r2
 sub RI, r22
 mov r22, RI ' SUBU (2)
 mov r0, r22
 sub r0, #1 ' SUBU4 coni
' C_wcstombs_3 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN

' end
