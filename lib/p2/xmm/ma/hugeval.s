' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export __huge_val

 alignl ' align long
C___huge_val ' <symbol:__huge_val>
 jmp #LODI
 long @C___huge_val_2_L000003
 mov r0, RI ' reg <- INDIRF4 addrg
' C___huge_val_1 ' (symbol refcount = 0)
 jmp #RETN


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C___huge_val_2_L000003 ' <symbol:2>
 long $7f800000 ' float

' Catalina Code

DAT ' code segment
' end
