' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export wctomb

 alignl ' align long
C_wctomb ' <symbol:wctomb>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, r3 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C_wctomb_4  ' NEU4
 mov r0, #0 ' reg <- coni
 jmp #\@C_wctomb_3 ' JUMPV addrg
C_wctomb_4
 wrbyte r2, r3 ' ASGNU1 reg reg
 mov r0, #1 ' reg <- coni
C_wctomb_3
 calld PA,#POPM ' restore registers
 calld PA,#RETN

' end
