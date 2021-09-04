' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export NMM_threaded_dynamic_array

 alignl ' align long
C_N_M_M__threaded_dynamic_array ' <symbol:NMM_threaded_dynamic_array>
 long $fd900108
 long $fd9001fc
 long $fd90021c
 long $fd900250
 long $fd900264
 long $fd900278
 long $fd900264
 long $fd90027c
 long $fd90028c
 long $fd900294
 long $fd9003c8
 long $fd9003c0
 long $fd900418
 long $fd900460
 long $fd900500
 long $fd900488
 long $fd9004b8
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
 long $fb043361
 long $fb043161
 long $fb042d61
 long $f184340c
 long $fc602c1a
 long $f6042c00
 long $fc602c38
 long $f1843404
 long $fd607401
 long $f0647408
 long $fc60741a
 long $f1843484
 long $fc60341a
 long $f603d01a
 long $f607e0b2
 long $fd60801a
 long $fa7081e7
 long $fd640627
 long $fd64002d
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
 long $fb042f61
 long $fb043561
 long $fb042d61
 long $fb043161
 long $fd602c29
 long $fb020018
 long $fdbfff28
 long $f603f01a
 long $fd602e2c
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
 long $f1042a03
 long $f5242a03
 long $f183f015
 long $f6007416
 long $f60077f8
 long $fd90001c
 long $fd604224
 long $fb002bf6
 long $f107ec04
 long $f1042a03
 long $f5242a03
 long $f6007417
 long $f6007616
 long $f0442a02
 long $fcd80815
 long $fb00783a
 long $fc60783b
 long $f1047404
 long $f1047604
 long $fd9fff3c
 long $fd604224
 long $fc67f35f
 long $f603f3f8
 long $f1042a08
 long $f1002bf9
 long $fd9fff24
 long $fd604224
 long $fb07f361
 long $fd604224
 long $fb07ed00
 long $f107f008
 long $fd9fff0c
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
 long $fd9ffee0
 long $fd604224
 long $fda0030d
 long $fd9ffed4
 long $fd604224
 long $f6047a01
 long $f43bd5e9
 long $5d73d206
 long $1403d5e9
 long $bd900084
 long $fb0877e8
 long $ad900074
 long $fb087438
 long $5d9000a0
 long $f20877e8
 long $ad900064
 long $f600783b
 long $f1047885
 long $fac0743c
 long $f7cc74e0
 long $ad900010
 long $f5447480
 long $fc40743c
 long $fb00763b
 long $fc6077e8
 long $f60075e8
 long $f1047404
 long $f6005df1
 long $f60063f6
 long $f6005ff9
 long $f60061f8
 long $fd643a28
 long $fc60283a
 long $f603d03b
 long $f1047604
 long $fd643a28
 long $fb00283b
 long $f603f030
 long $f603f22f
 long $f603ec31
 long $f603e22e
 long $fd63d207
 long $f403d5e9
 long $fb947a08
 long $f60075e8
 long $f1047486
 long $fae3ce3a
 long $ff00001f
 long $f50475ff
 long $f107ce01
 long $f067ce0e
 long $fa7081e7
 long $fd604024
 long $fb3bfff1
 long $f20877e8
 long $5b00783b
 long $5c60783a
 long $ac60763a
 long $fc60743b
 long $f6047885
 long $f100783a
 long $fac07a3c
 long $fd607401
 long $f5247a07
 long $f5407a3a
 long $fc407a3c
 long $f6047800
 long $fc607838
 long $fd9fff2c
 long $fd604224
 long $f6047a00
 long $f603e3f6
 long $fb0077e8
 long $fb087438
 long $5d9fffac
 long $f20877e8
 long $5d9fff0c
 long $fd9fff6c
 long $f5602e32
 long $fd604224
 long $fdb00184
 long $ed9ffd9c
 long $f7cf5001
 long $566355aa
 long $f7cf5601
 long $56635bad
 long $f60075a9
 long $f18075ac
 long $f640743a
 long $f324741f
 long $f25b53ac
 long $10c35a3a
 long $40c3543a
 long $460353ac
 long $f10355ad
 long $f2575400
 long $c5475001
 long $35275001
 long $f64355aa
 long $fdb001e0
 long $fd9ffd50
 long $fd604224
 long $fdb0012c
 long $3d900024
 long $f20f52ff
 long $ad900008
 long $f20f58ff
 long $5d9ffd34
 long $f6002da4
 long $f56351ab
 long $f7cf5001
 long $55402c32
 long $fd9ffd20
 long $f56351ab
 long $f10353ac
 long $fd0355ad
 long $fd607419
 long $f0647403
 long $f603543a
 long $fd9fffac
 long $fd604224
 long $fdb000e0
 long $e6002da3
 long $ed9ffcf4
 long $f56351ab
 long $f18353ac
 long $f0475401
 long $fd635428
 long $fd1801ad
 long $fd635418
 long $f0475402
 long $fd9fff7c
 long $fd604224
 long $f6035016
 long $f6042c00
 long $f64b55a8
 long $ad9ffcc0
 long $f047501f
 long $f607521f
 long $f0775401
 long $31875201
 long $3d9ffff4
 long $f0875401
 long $f0475402
 long $fd9fff48
 long $fd604224
 long $f6047400
 long $fdb000a8
 long $cd9ffc90
 long $f0675402
 long $f6042c00
 long $f66353a9
 long $f10f521e
 long $f2575220
 long $bd9ffc78
 long $f04355a9
 long $f103543a
 long $f0475401
 long $f7cf5001
 long $f3e02daa
 long $fd9ffc60
 long $fd604224
 long $f6007416
 long $f5607417
 long $f5087432
 long $ad900018
 long $f6007416
 long $f5407417
 long $f5387432
 long $ad9ffc3c
 long $f7d02c32
 long $fd9ffc34
 long $f7c82c32
 long $5d900008
 long $f2182c17
 long $fd9ffc24
 long $f2182e16
 long $fd9ffc1c
 long $f6007416
 long $f6002c17
 long $fdb00024
 long $f6002e16
 long $f60357a8
 long $f60359a9
 long $f6035baa
 long $f6002c3a
 long $fdb0000c
 long $37cf5608
 long $1d75e06f
 long $20f5a00
 long $f6035016
 long $f047501f
 long $f6035416
 long $f50355a6
 long $f6035216
 long $f0675201
 long $f04f5218
 long $ad900014
 long $f20f52ff
 long $5d90003c
 long $f6002da3
 long $f5475008
 long $fd90003c
 long $f6007baa
 long $f5487ba9
 long $5d90000c
 long $f5475002
 long $f6675296
 long $fd900024
 long $f0675407
 long $f7cb55a7
 long $5d900014
 long $f0675401
 long $f1875201
 long $fd9fffec
 long $f0675406
 long $f54355a7
 long $f187527f
 long $f7d75008
 long $20f5400
 long $f20f5400
 long $a6075200
 long $ad900040
 long $f0775401
 long $31875201
 long $3d9ffff4
 long $f1075202
 long $f1175500
 long $c1075201
 long $f107527f
 long $f34353a5
 long $f36752ff
 long $f2575201
 long $3d900014
 long $f5475401
 long $f0075401
 long $f66353a9
 long $f04355a9
 long $f6075200
 long $f6002daa
 long $f0442c09
 long $f0675217
 long $f5402da9
 long $f067501f
 long $5402da8
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
 long $190000
 long $0
 long $7
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
 long $f6047a08
 long $f6102c19
 long $cd90003c
 long $f7cc2c80
 long $5d900074
 long $f6007439
 long $f6047600
 long $f21c7608
 long $3d9000a0
 long $fb00783a
 long $f0447818
 long $f2087816
 long $ad90000c
 long $51047601
 long $51047404
 long $5d9fffdc
 long $f6002c3b
 long $fd900040
 long $f0642c01
 long $f1002c39
 long $fae02c16
 long $f6007416
 long $f0442c0c
 long $f600763a
 long $f06c7418
 long $ad90005c
 long $f6007a3b
 long $f0447a08
 long $f7cc7a08
 long $5d900008
 long $fd707a06
 long $3d9ffff8
 long $f5203036
 long $f540303a
 long $f5042c07
 long $f0642c02
 long $f1002c39
 long $fb002c16
 long $f7c82c36
 long $ad900024
 long $f5202c36
 long $fc603016
 long $fb083216
 long $5d9ffff8
 long $f1042c04
 long $fb002c16
 long $f7cc7a08
 long $ad607a07
 long $fd64002d
 long $f6642c01
 long $fd9fffec
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
 long $fd604224
 long $f43bd5e9
 long $5d73d206
 long $1403d5e9
 long $bd800350
 long $fd604024
 long $fd64002d
 long $fd604224
 long $fd63d207
 long $f403d5e9
 long $fd604024
 long $fd64002d
 long $fd604224
 long $f43bd5e9
 long $5d702e06
 long $1403d5e9
 long $bd80035c
 long $fd604024
 long $fd64002d
 long $fd604224
 long $fd602e07
 long $f403d5e9
 long $fd604024
 long $fd64002d
 long $0
 long $0
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
 long $f6047a08
 long $f6102c19
 long $cd90003c
 long $f7cc2c80
 long $5d900074
 long $f6007439
 long $f6047600
 long $f21c7608
 long $3d9000a0
 long $fb00783a
 long $f0447818
 long $f2087816
 long $ad90000c
 long $51047601
 long $51047404
 long $5d9fffdc
 long $f6002c3b
 long $fd900040
 long $f0642c01
 long $f1002c39
 long $fae02c16
 long $f6007416
 long $f0442c0c
 long $f600763a
 long $f06c7418
 long $ad90005c
 long $f6007a3b
 long $f0447a08
 long $f7cc7a08
 long $5d900008
 long $fd707a06
 long $3d9ffff8
 long $f5203036
 long $f540303a
 long $f5042c07
 long $f0642c02
 long $f1002c39
 long $fb002c16
 long $f7c82c36
 long $ad900024
 long $f5202c36
 long $fc603016
 long $fb083216
 long $5d9ffff8
 long $f1042c04
 long $fb002c16
 long $f7cc7a08
 long $ad607a07
 long $fd64002d
 long $f6642c01
 long $fd9fffec
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
 long $fd604224
 long $f43bd5e9
 long $5d73d206
 long $1403d5e9
 long $bd800350
 long $fd604024
 long $fd64002d
 long $fd604224
 long $fd63d207
 long $f403d5e9
 long $fd604024
 long $fd64002d
 long $fd604224
 long $f43bd5e9
 long $5d702e06
 long $1403d5e9
 long $bd80035c
 long $fd604024
 long $fd64002d
 long $fd604224
 long $fd602e07
 long $f403d5e9
 long $fd604024
 long $fd64002d

' Catalina Export _threadstart_NMM_cog

' Catalina Code

DAT ' code segment

 alignl ' align long
C__threadstart_N_M_M__cog ' <symbol:_threadstart_NMM_cog>
 PRIMITIVE(#NEWF)
 sub SP, #32
 PRIMITIVE(#PSHM)
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__registry ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODF)
 long -32
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 reg
 PRIMITIVE(#LODF)
 long -28
 wrlong r22, RI ' ASGNU4 addrl reg
 PRIMITIVE(#LODF)
 long -24
 wrlong r23, RI ' ASGNU4 addrl reg
 mov r22, #104 ' reg <- coni
 PRIMITIVE(#LODF)
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 PRIMITIVE(#LODL)
 long @C_N_M_M__L_U_T__L_I_B_R_A_R_Y__array
 mov r22, RI ' reg <- addrg
 PRIMITIVE(#LODF)
 long -16
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r21 ' CVI, CVU or LOAD
 PRIMITIVE(#LODF)
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r19 ' CVI, CVU or LOAD
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, #0 ' reg <- coni
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, #2 ' reg <- coni
 PRIMITIVE(#LODL)
 long @C_N_M_M__threaded_dynamic_array
 mov r20, RI ' reg <- addrg
 mov r3, r20 ' RSHI
 sar r3, r22 ' RSHI (3)
 mov r20, FP
 sub r20, #-(-32) ' reg <- addrli
 mov r4, r20 ' RSHI
 sar r4, r22 ' RSHI (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__coginit
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 mov r2, #50 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__thread_wait ' CALL addrg
 mov r0, r17 ' CVI, CVU or LOAD
' C__threadstart_N_M_M__cog_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #32 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _registry

' Catalina Import _coginit

' Catalina Import _thread_wait
' end
