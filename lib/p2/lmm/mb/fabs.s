' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fabs

 alignl ' align long
C_fabs ' <symbol:fabs>
 jmp #PSHM
 long $c00000 ' save registers
 jmp #LODI
 long @C_fabs_5_L000006
 mov r22, RI ' reg <- INDIRF4 addrg
 mov r0, r2 ' setup r0/r1 (2)
 mov r1, r22 ' setup r0/r1 (2)
 jmp #FCMP
 jmp #BRAE
 long @C_fabs_3 ' GEF4
 mov r23, r2
 xor r23, Bit31 ' NEGF4
 jmp #JMPA
 long @C_fabs_4 ' JUMPV addrg
C_fabs_3
 mov r23, r2 ' CVI, CVU or LOAD
C_fabs_4
 mov r0, r23 ' CVI, CVU or LOAD
' C_fabs_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_fabs_5_L000006 ' <symbol:5>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
