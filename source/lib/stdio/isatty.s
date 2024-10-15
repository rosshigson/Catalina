' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _isatty

 alignl ' align long
C__isatty ' <symbol:_isatty>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, ##@C___stdin+4
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r2, r22 wz
 if_z jmp #\C__isatty_8 ' EQI4
 mov r22, ##@C___stdout+4
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r2, r22 wz
 if_z jmp #\C__isatty_8 ' EQI4
 mov r22, ##@C___stderr+4
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r2, r22 wz
 if_nz jmp #\C__isatty_2 ' NEI4
C__isatty_8
 mov r0, #1 ' reg <- coni
 jmp #\@C__isatty_1 ' JUMPV addrg
C__isatty_2
 mov r0, #0 ' reg <- coni
C__isatty_1
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Import __stderr

' Catalina Import __stdout

' Catalina Import __stdin
' end
