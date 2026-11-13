' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export nmmd_array

 alignl ' align long
C_nmmd_array ' <symbol:nmmd_array>
 long $fd900108
 long $fd9001fc
 long $fd900220
 long $fd900248
 long $fd900264
 long $fd90027c
 long $fd900268
 long $fd900280
 long $fd900290
 long $fd900298
 long $fd9002a4
 long $fd90029c
 long $fd9002f4
 long $fd90033c
 long $fd9003d8
 long $fd900364
 long $fd900394
 long $fd90015c
 long $fd900190
 long $fd900130
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $80000000
 long $ffffffff
 long $ff
 long $ffff
 long $ff000000
 long $ffffff
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $fb047361
 long $fd603001
 long $f0643002
 long $f1003039
 long $fb007018
 long $f5007037
 long $fc607018
 long $fb043361
 long $fb043561
 long $fb042d61
 long $fb042f61
 long $fb043161
 long $fd602c29
 long $fb020017
 long $f603f01a
 long $fd60322c
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $fd604224
 long $fb0029f6
 long $f14029f9
 long $fd604224
 long $fb002814
 long $fc64295f
 long $f107ec04
 long $fd604024
 long $fd63ec2c
 long $fd604224
 long $fb0029f6
 long $f6007414
 long $f0442806
 long $f604781c
 long $f05c2801
 long $c98c7800
 long $cc64015f
 long $f1047801
 long $5d9fffec
 long $fc64755f
 long $f107ec04
 long $fd9fffc4
 long $3ffff
 long $fd604224
 long $fb042961
 long $f604762d
 long $f0642808
 long $f07c2801
 long $c98c7600
 long $cb040161
 long $51847601
 long $5d9fffec
 long $fd9fff98
 long $fd604224
 long $fb002bf6
 long $f107ec04
 long $f6007815
 long $f1047803
 long $f5247803
 long $f183f03c
 long $f6007416
 long $f60077f8
 long $fd900014
 long $fd604224
 long $fb002bf6
 long $f107ec04
 long $f6007417
 long $f6007616
 long $fcd80815
 long $fac0783a
 long $fc40783b
 long $f1047401
 long $f1047601
 long $fd9fff44
 long $fd604224
 long $fc67f35f
 long $f603f3f8
 long $f1042a08
 long $f1002bf9
 long $f187f004
 long $fc646500
 long $fd9fff24
 long $fd604224
 long $f107f004
 long $fb07f361
 long $fd604224
 long $fb07ed00
 long $f107f008
 long $fd9fff08
 long $fd604224
 long $fb0029f6
 long $f107ec04
 long $fd604224
 long $f187f008
 long $fc67ed00
 long $fd604024
 long $fd60282c
 long $fd604224
 long $fda00303
 long $fd9ffedc
 long $fd604224
 long $fda00319
 long $fd9ffed0
 long $f5602e32
 long $fd604224
 long $fdb00180
 long $ed9ffec0
 long $f7cebc01
 long $5662c160
 long $f7cec201
 long $5662c763
 long $f600755f
 long $f1807562
 long $f640743a
 long $f324741f
 long $f25abf62
 long $10c2c63a
 long $40c2c03a
 long $4602bf62
 long $f102c163
 long $f256c000
 long $c546bc01
 long $3526bc01
 long $f642c160
 long $fdb001dc
 long $fd9ffe74
 long $fd604224
 long $fdb00128
 long $3d900024
 long $f20ebeff
 long $ad900008
 long $f20ec4ff
 long $5d9ffe58
 long $f6002d5a
 long $f562bd61
 long $f7cebc01
 long $55402c32
 long $fd9ffe44
 long $f562bd61
 long $f102bf62
 long $fd02c163
 long $fd607419
 long $f0647403
 long $f602c03a
 long $fd9fffac
 long $fd604224
 long $fdb000dc
 long $e6002d59
 long $ed9ffe18
 long $f562bd61
 long $f182bf62
 long $f046c001
 long $fd62c028
 long $fd180163
 long $fd62c018
 long $f046c002
 long $fd9fff7c
 long $fd604224
 long $f602bc16
 long $f6042c00
 long $f64ac15e
 long $ad9ffde4
 long $f046bc1f
 long $f606be1f
 long $f076c001
 long $3186be01
 long $3d9ffff4
 long $f086c001
 long $f046c002
 long $fd9fff48
 long $fd604224
 long $fdb000a8
 long $cd9ffdb8
 long $f066c002
 long $f6042c00
 long $f662bf5f
 long $f10ebe1f
 long $f256be21
 long $bd9ffda0
 long $f186be01
 long $f042c15f
 long $f046c001
 long $f7cebc01
 long $f3e02d60
 long $fd9ffd88
 long $fd604224
 long $f6007416
 long $f5607417
 long $f5087432
 long $ad900018
 long $f6007416
 long $f5407417
 long $f5387432
 long $ad9ffd64
 long $f7d02c32
 long $fd9ffd5c
 long $f7c82c32
 long $5d900008
 long $f2182c17
 long $fd9ffd4c
 long $f2182e16
 long $fd9ffd44
 long $f6007416
 long $f6002c17
 long $fdb00024
 long $f6002e16
 long $f602c35e
 long $f602c55f
 long $f602c760
 long $f6002c3a
 long $fdb0000c
 long $37cec208
 long $1d75e06f
 long $20ec600
 long $f602bc16
 long $f046bc1f
 long $f602c016
 long $f502c15c
 long $f602be16
 long $f066be01
 long $f04ebe18
 long $ad900014
 long $f20ebeff
 long $5d90003c
 long $f6002d59
 long $f546bc08
 long $fd90003c
 long $f6007b60
 long $f5487b5f
 long $5d90000c
 long $f546bc02
 long $f666be96
 long $fd900024
 long $f066c007
 long $f7cac15d
 long $5d900014
 long $f066c001
 long $f186be01
 long $fd9fffec
 long $f066c006
 long $f542c15d
 long $f186be7f
 long $f7d6bc08
 long $20ec000
 long $f20ec000
 long $a606be00
 long $ad900040
 long $f076c001
 long $3186be01
 long $3d9ffff4
 long $f106be02
 long $f116c100
 long $c106be01
 long $f106be7f
 long $f342bf5b
 long $f366beff
 long $f256be01
 long $3d900014
 long $f546c001
 long $f006c001
 long $f662bf5f
 long $f042c15f
 long $f606be00
 long $f6002d60
 long $f0442c09
 long $f066be17
 long $f5402d5f
 long $f066bc1f
 long $5402d5e
 long $7fffffff
 long $7f800000
 long $ffffffe9
 long $7fffff
 long $20000000
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $7bde8
 long $7bdec
 long $7bdf0
 long $7bdf4
 long $7bdf8
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $fd102c17
 long $fd602c18
 long $d602e19
 long $f6007817
 long $f6007a16
 long $f6402e17
 long $f6402c16
 long $f560783d
 long $fda00300
 long $f6107a3d
 long $f6802e17
 long $f610783c
 long $6802c16
 long $f6007439
 long $f6047600
 long $f21c7610
 long $3d90001c
 long $fb00783a
 long $f0447818
 long $f2087816
 long $ad64002d
 long $f1047601
 long $f1047404
 long $fd9fffdc
 long $66c7601
 long $f6047a10
 long $f6102c19
 long $cd90001c
 long $f7cc2c80
 long $5d900068
 long $f6002c19
 long $fda0030d
 long $5d90009c
 long $f6002c3b
 long $fd900054
 long $f0642c01
 long $f1002c39
 long $fae02c16
 long $f6007416
 long $f0442c0c
 long $f5042c0f
 long $f600763a
 long $f504747f
 long $f06c7418
 long $ad90006c
 long $f6007a3b
 long $f0447a07
 long $f5047a1f
 long $f7cc7a10
 long $5d900010
 long $f43bd43d
 long $5d707a06
 long $1403d43d
 long $bd9ffff0
 long $f5203036
 long $f540303a
 long $f5042c0f
 long $f0642c02
 long $f1002c39
 long $fb002c16
 long $f7c82c36
 long $ad900028
 long $f5202c36
 long $fc603016
 long $fb083216
 long $5d9ffff8
 long $f1042c04
 long $fb002c16
 long $f21c7a10
 long $cd607a07
 long $c403d43d
 long $fd64002d
 long $f6642c01
 long $fd9fffe8
 long $f0642e02
 long $ff0003df
 long $f1042fb0
 long $fb003017
 long $ff007fff
 long $f50431ff
 long $f0643218
 long $f5403019
 long $fc603017
 long $c602c18
 long $fac03218
 long $fc403216
 long $f1042c01
 long $f1043001
 long $fb6c2ffb
 long $fd64002d
 long $ff000001
 long $faa47561
 long $f9b87417
 long $ff000001
 long $fc347561
 long $fb007616
 long $0
 long $faa47400
 long $f208743b
 long $ff000001
 long $faa47569
 long $f9b07417
 long $ff000001
 long $fc347569
 long $fd602829
 long $b000016
 long $0
 long $0
 long $0
 long $0

' Catalina Export NMM_LUT_LIBRARY_array

 alignl ' align long
C_N_M_M__L_U_T__L_I_B_R_A_R_Y__array ' <symbol:NMM_LUT_LIBRARY_array>
 long $fd102c17
 long $fd602c18
 long $d602e19
 long $f6007817
 long $f6007a16
 long $f6402e17
 long $f6402c16
 long $f560783d
 long $fda00300
 long $f6107a3d
 long $f6802e17
 long $f610783c
 long $6802c16
 long $f6007439
 long $f6047600
 long $f21c7610
 long $3d90001c
 long $fb00783a
 long $f0447818
 long $f2087816
 long $ad64002d
 long $f1047601
 long $f1047404
 long $fd9fffdc
 long $66c7601
 long $f6047a10
 long $f6102c19
 long $cd90001c
 long $f7cc2c80
 long $5d900068
 long $f6002c19
 long $fda0030d
 long $5d90009c
 long $f6002c3b
 long $fd900054
 long $f0642c01
 long $f1002c39
 long $fae02c16
 long $f6007416
 long $f0442c0c
 long $f5042c0f
 long $f600763a
 long $f504747f
 long $f06c7418
 long $ad90006c
 long $f6007a3b
 long $f0447a07
 long $f5047a1f
 long $f7cc7a10
 long $5d900010
 long $f43bd43d
 long $5d707a06
 long $1403d43d
 long $bd9ffff0
 long $f5203036
 long $f540303a
 long $f5042c0f
 long $f0642c02
 long $f1002c39
 long $fb002c16
 long $f7c82c36
 long $ad900028
 long $f5202c36
 long $fc603016
 long $fb083216
 long $5d9ffff8
 long $f1042c04
 long $fb002c16
 long $f21c7a10
 long $cd607a07
 long $c403d43d
 long $fd64002d
 long $f6642c01
 long $fd9fffe8
 long $f0642e02
 long $ff0003df
 long $f1042fb0
 long $fb003017
 long $ff007fff
 long $f50431ff
 long $f0643218
 long $f5403019
 long $fc603017
 long $c602c18
 long $fac03218
 long $fc403216
 long $f1042c01
 long $f1043001
 long $fb6c2ffb
 long $fd64002d
 long $ff000001
 long $faa47561
 long $f9b87417
 long $ff000001
 long $fc347561
 long $fb007616
 long $0
 long $faa47400
 long $f208743b
 long $ff000001
 long $faa47569
 long $f9b07417
 long $ff000001
 long $fc347569
 long $fd602829
 long $b000016

' Catalina Export _cogstart_C_cog

' Catalina Code

DAT ' code segment

 alignl ' align long
C__cogstart_C__cog ' <symbol:_cogstart_C_cog>
 calld PA,#NEWF
 sub SP, #24
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__registry ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r21 ' CVI, CVU or LOAD
 add r22, r19 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, #106 ' reg <- coni
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, ##@C_N_M_M__L_U_T__L_I_B_R_A_R_Y__array ' reg <- addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r23 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, #2 ' reg <- coni
 mov r20, ##@C_nmmd_array ' reg <- addrg
 mov r3, r20 ' RSHI
 sar r3, r22 ' RSHI (3)
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 mov r4, r20 ' RSHI
 sar r4, r22 ' RSHI (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__coginit
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockfreq ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r18, #20 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r18 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r2, r22 ' ADDU
 add r2, r0 ' ADDU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__waitcnt ' CALL addrg
 mov r0, r17 ' CVI, CVU or LOAD
' C__cogstart_C__cog_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #24 ' framesize
 calld PA,#RETF


' Catalina Import _registry

' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import _coginit

' Catalina Import _clockfreq
' end
