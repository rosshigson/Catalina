' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sfgk_6174acf1_next_L000003 ' <symbol:next>
 long $1

' Catalina Export rand

' Catalina Code

DAT ' code segment

 alignl ' align long
C_rand ' <symbol:rand>
 PRIMITIVE(#PSHM)
 long $540000 ' save registers
 PRIMITIVE(#LODL)
 long @C_sfgk_6174acf1_next_L000003
 mov r22, RI ' reg <- addrg
 PRIMITIVE(#LODL)
 long $41c64e6d
 mov r20, RI ' reg <- con
 rdlong r18, r22 ' reg <- INDIRU4 reg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 PRIMITIVE(#LODL)
 long 12345
 mov r18, RI ' reg <- con
 mov r20, r0 ' ADDU
 add r20, r18 ' ADDU (3)
 PRIMITIVE(#LODL)
 long @C_sfgk_6174acf1_next_L000003
 wrlong r20, RI ' ASGNU4 addrg reg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #16 ' RSHU4 coni
 PRIMITIVE(#LODL)
 long 32767
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r0, r22 ' CVI, CVU or LOAD
' C_rand_4 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export srand

 alignl ' align long
C_srand ' <symbol:srand>
 PRIMITIVE(#LODL)
 long @C_sfgk_6174acf1_next_L000003
 wrlong r2, RI ' ASGNU4 addrg reg
' C_srand_5 ' (symbol refcount = 0)
 PRIMITIVE(#RETN)

' end
