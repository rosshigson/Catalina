' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export mbstowcs

 alignl ' align long
C_mbstowcs ' <symbol:mbstowcs>
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_mbstowcs_5 ' JUMPV addrg
C_mbstowcs_4
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
 long @C_mbstowcs_7 ' NEI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov RI, r2
 sub RI, r22
 mov r22, RI ' SUBU (2)
 mov r0, r22
 sub r0, #1 ' SUBU4 coni
 jmp #JMPA
 long @C_mbstowcs_3 ' JUMPV addrg
C_mbstowcs_7
C_mbstowcs_5
 mov r22, r23
 subs r22, #1 ' SUBI4 coni
 mov r23, r22 ' CVI, CVU or LOAD
 cmps r22,  #0 wz,wc
 jmp #BRAE
 long @C_mbstowcs_4 ' GEI4
 mov r22, r23 ' CVI, CVU or LOAD
 mov r0, r2 ' SUBU
 sub r0, r22 ' SUBU (3)
C_mbstowcs_3
 jmp #POPM ' restore registers
 jmp #RETN

' end
