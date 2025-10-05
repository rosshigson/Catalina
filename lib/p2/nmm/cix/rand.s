' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_sjfs_68dcc2f5_next_L000003 ' <symbol:next>
 long $1

' Catalina Export rand

' Catalina Code

DAT ' code segment

 alignl ' align long
C_rand ' <symbol:rand>
 calld PA,#PSHM
 long $540000 ' save registers
 mov r22, ##@C_sjfs_68dcc2f5_next_L000003 ' reg <- addrg
 mov r20, ##$41c64e6d ' reg <- con
 rdlong r18, r22 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r20, r18 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, ##12345 ' reg <- con
 add r20, r0 ' ADDU (2)
 wrlong r20, ##@C_sjfs_68dcc2f5_next_L000003 ' ASGNU4 addrg reg
 rdlong r22, r22 ' reg <- INDIRU4 reg
 shr r22, #16 ' RSHU4 coni
 mov r20, ##32767 ' reg <- con
 and r22, r20 ' BANDI/U (1)
 mov r0, r22 ' CVI, CVU or LOAD
' C_rand_4 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export srand

 alignl ' align long
C_srand ' <symbol:srand>
 wrlong r2, ##@C_sjfs_68dcc2f5_next_L000003 ' ASGNU4 addrg reg
' C_srand_5 ' (symbol refcount = 0)
 calld PA,#RETN

' end
