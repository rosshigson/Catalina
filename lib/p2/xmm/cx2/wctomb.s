' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export wctomb

 alignl ' align long
C_wctomb ' <symbol:wctomb>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_wctomb_4 ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C_wctomb_3 ' JUMPV addrg
C_wctomb_4
 mov RI, r3
 mov BC, r2
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
C_wctomb_3
 jmp #POPM ' restore registers
 jmp #RETN

' end
