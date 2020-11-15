' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _isatty

 long ' align long
C__isatty ' <symbol:_isatty>
 jmp #PSHM
 long $400000 ' save registers
 jmp #LODI
 long @C___iotab+4
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r2, r22 wz
 jmp #BR_Z
 long @C__isatty_10 ' EQI4
 jmp #LODI
 long @C___iotab+24+4
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r2, r22 wz
 jmp #BR_Z
 long @C__isatty_10 ' EQI4
 jmp #LODI
 long @C___iotab+48+4
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r2, r22 wz
 jmp #BRNZ
 long @C__isatty_2 ' NEI4
C__isatty_10
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C__isatty_1 ' JUMPV addrg
C__isatty_2
 mov r0, #0 ' RET coni
C__isatty_1
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import __iotab
' end
