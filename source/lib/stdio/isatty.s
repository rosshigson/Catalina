' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _isatty

 alignl ' align long
C__isatty ' <symbol:_isatty>
 PRIMITIVE(#PSHM)
 long $400000 ' save registers
 mov r22, ##@C___iotab+4
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r2, r22 wz
 if_z jmp #\C__isatty_10 ' EQI4
 mov r22, ##@C___iotab+24+4
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r2, r22 wz
 if_z jmp #\C__isatty_10 ' EQI4
 mov r22, ##@C___iotab+48+4
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r2, r22 wz
 if_nz jmp #\C__isatty_2 ' NEI4
C__isatty_10
 mov r0, #1 ' reg <- coni
 jmp #\@C__isatty_1 ' JUMPV addrg
C__isatty_2
 mov r0, #0 ' reg <- coni
C__isatty_1
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import __iotab
' end
