' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 long ' align long
C_s19k_619c5623_next_L000003 ' <symbol:next>
 long $1

' Catalina Export rand

' Catalina Code

DAT ' code segment

 long ' align long
C_rand ' <symbol:rand>
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODL
 long $41c64e6d
 mov r22, RI ' reg <- con
 jmp #LODI
 long @C_s19k_619c5623_next_L000003
 mov r20, RI ' reg <- INDIRU4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long 12345
 mov r20, RI ' reg <- con
 mov r22, r0 ' ADDU
 add r22, r20 ' ADDU (3)
 jmp #LODL
 long @C_s19k_619c5623_next_L000003
 mov BC, r22
 jmp #WLNG ' ASGNU4 addrg reg
 jmp #LODI
 long @C_s19k_619c5623_next_L000003
 mov r22, RI ' reg <- INDIRU4 addrg
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

 long ' align long
C_srand ' <symbol:srand>
 jmp #LODL
 long @C_s19k_619c5623_next_L000003
 mov BC, r2
 jmp #WLNG ' ASGNU4 addrg reg
' C_srand_5 ' (symbol refcount = 0)
 jmp #RETN

' end
