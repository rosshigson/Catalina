' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export isspace

 alignl ' align long
C_isspace ' <symbol:isspace>
 PRIMITIVE(#PSHM)
 long $400000 ' save registers
 PRIMITIVE(#LODL)
 long @C___ctype+1
 mov r22, RI ' reg <- addrg
 adds r22, r2 ' ADDI/P (2)
 rdbyte r22, r22 ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 mov r0, r22
 and r0, #8 ' BANDI4 coni
' C_isspace_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import __ctype
' end
