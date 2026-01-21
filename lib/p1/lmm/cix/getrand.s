' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

 alignl ' align long
C_s6c4_696ddd38__seed_L000001 ' <symbol:_seed>
 jmp #PSHM
 long $400000 ' save registers
 mov r22, CNT ' reg <- INDIRU4 addrg special
 mov r0, r22 ' CVI, CVU or LOAD
' C_s6c4_696ddd38__seed_L000001_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_getrand_seeded_L000005 ' <symbol:seeded>
 long 0

' Catalina Export getrand

' Catalina Code

DAT ' code segment

 alignl ' align long
C_getrand ' <symbol:getrand>
 jmp #NEWF
 jmp #PSHM
 long $540000 ' save registers
 jmp #LODI
 long @C_getrand_seeded_L000005
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_getrand_6 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_s6c4_696ddd38__seed_L000001 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srand ' CALL addrg
 mov r22, #1 ' reg <- coni
 jmp #LODL
 long @C_getrand_seeded_L000005
 wrlong r22, RI ' ASGNI4 addrg reg
C_getrand_6
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_rand ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_rand ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_rand ' CALL addrg
 mov r18, r0 ' CVI, CVU or LOAD
 shl r22, #20 ' LSHI4 coni
 shl r20, #10 ' LSHI4 coni
 xor r22, r20 ' BXORI/U (1)
 mov r0, r22 ' BXORI/U
 xor r0, r18 ' BXORI/U (3)
' C_getrand_3 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import rand

' Catalina Import srand
' end
