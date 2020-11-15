' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_getenv_timezone_L000005 ' <symbol:timezone>
 byte 71
 byte 77
 byte 84
 byte 0

' Catalina Export getenv

' Catalina Code

DAT ' code segment

 alignl ' align long
C_getenv ' <symbol:getenv>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODL)
 long @C_getenv_8_L000009
 mov r2, RI ' reg ARG ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_strcmp
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C_getenv_6 ' NEI4
 PRIMITIVE(#LODL)
 long @C_getenv_timezone_L000005
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C_getenv_3 ' JUMPV addrg
C_getenv_6
 PRIMITIVE(#LODL)
 long 0
 mov r0, RI ' reg <- con
C_getenv_3
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import strcmp

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_getenv_8_L000009 ' <symbol:8>
 byte 84
 byte 90
 byte 0

' Catalina Code

DAT ' code segment
' end
