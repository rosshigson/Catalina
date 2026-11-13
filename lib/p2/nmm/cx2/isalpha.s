' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export isalpha

 alignl ' align long
C_isalpha ' <symbol:isalpha>
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, ##@C___ctype+1 ' reg <- addrg
 adds r22, r2 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r0, r22
 and r0, #3 ' BANDI4 coni
' C_isalpha_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Import __ctype
' end
