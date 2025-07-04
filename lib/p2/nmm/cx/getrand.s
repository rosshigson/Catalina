' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_s2ug_6864c61c__seed_L000001 ' <symbol:_seed>
 calld PA,#PSHM
 long $400000 ' save registers
' loading argument C_s2ug_6864c61c__seed_L000001_3_L000004 to PASM eliminated
'START PASM ... 
getct r0

'... END PASM
' call to PASM eliminated
 mov r22, r0 ' CVI, CVU or LOAD
' C_s2ug_6864c61c__seed_L000001_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_getrand_seeded_L000007 ' <symbol:seeded>
 long 0

' Catalina Export getrand

' Catalina Code

DAT ' code segment

 alignl ' align long
C_getrand ' <symbol:getrand>
 calld PA,#NEWF
 calld PA,#PSHM
 long $540000 ' save registers
 mov r22, ##@C_getrand_seeded_L000007
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #0 wz
 if_nz jmp #\C_getrand_8 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_s2ug_6864c61c__seed_L000001 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_srand ' CALL addrg
 mov r22, #1 ' reg <- coni
 wrlong r22, ##@C_getrand_seeded_L000007 ' ASGNI4 addrg reg
C_getrand_8
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_rand ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_rand ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_rand ' CALL addrg
 mov r18, r0 ' CVI, CVU or LOAD
 shl r22, #20 ' LSHI4 coni
 shl r20, #10 ' LSHI4 coni
 xor r22, r20 ' BXORI/U (1)
 mov r0, r22 ' BXORI/U
 xor r0, r18 ' BXORI/U (3)
' C_getrand_5 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import rand

' Catalina Import srand
' end
