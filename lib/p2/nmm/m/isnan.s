' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export __IsNan

 alignl ' align long
C___I_sN_an ' <symbol:__IsNan>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $540000 ' save registers
 mov RI, FP
 sub RI, #-(-8)
 wrlong r2, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, ##2139095040 ' reg <- con
 mov r18, r22 ' BANDI/U
 and r18, r20 ' BANDI/U (3)
 cmps r18, r20 wz
 if_nz jmp #\C___I_sN_an_2 ' NEI4
 mov r20, ##8388607 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 if_z jmp #\C___I_sN_an_2 ' EQI4
 mov r0, #1 ' reg <- coni
 jmp #\@C___I_sN_an_1 ' JUMPV addrg
C___I_sN_an_2
 mov r0, #0 ' reg <- coni
C___I_sN_an_1
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF

' end
