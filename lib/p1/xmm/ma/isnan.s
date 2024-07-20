' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export __IsNan

 alignl ' align long
C___I_sN_an ' <symbol:__IsNan>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $540000 ' save registers
 mov RI, FP
 sub RI, #-(-8)
 wrlong r2, RI ' ASGNF4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 regl
 jmp #LODL
 long 2139095040
 mov r20, RI ' reg <- con
 mov r18, r22 ' BANDI/U
 and r18, r20 ' BANDI/U (3)
 cmps r18, r20 wz
 jmp #BRNZ
 long @C___I_sN_an_2 ' NEI4
 jmp #LODL
 long 8388607
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C___I_sN_an_2 ' EQI4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C___I_sN_an_1 ' JUMPV addrg
C___I_sN_an_2
 mov r0, #0 ' reg <- coni
C___I_sN_an_1
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF

' end
