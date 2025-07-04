' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_s2j8_6864c244_next_L000003 ' <symbol:next>
 long $1

' Catalina Export rand

' Catalina Code

DAT ' code segment

 alignl ' align long
C_rand ' <symbol:rand>
 jmp #PSHM
 long $540000 ' save registers
 jmp #LODL
 long @C_s2j8_6864c244_next_L000003
 mov r22, RI ' reg <- addrg
 jmp #LODL
 long $41c64e6d
 mov r20, RI ' reg <- con
 rdlong r18, r22 ' reg <- INDIRU4 reg
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long 12345
 mov r20, RI ' reg <- con
 add r20, r0 ' ADDU (2)
 jmp #LODL
 long @C_s2j8_6864c244_next_L000003
 wrlong r20, RI ' ASGNU4 addrg reg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #16 ' RSHU4 coni
 jmp #LODL
 long 32767
 mov r20, RI ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r0, r22 ' CVI, CVU or LOAD
' C_rand_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export srand

 alignl ' align long
C_srand ' <symbol:srand>
 jmp #LODL
 long @C_s2j8_6864c244_next_L000003
 wrlong r2, RI ' ASGNU4 addrg reg
' C_srand_5 ' (symbol refcount = 0)
 jmp #RETN

' end
