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
 long $fd9003c4
 long $fd9003bc
 long $fd900414
 long $fd90045c
 long $fd9004fc
 long $fd900484
 long $fd9004b4
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
 long $f43bd5e9
 long $5d73d206
 long $1403d5e9
 long $bd9000a0
 long $fb0877e8
 long $ad900090
 long $fb087438
 long $5d9000a0
 long $f20877e8
 long $ad900080
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
 long $f60075e8
 long $f1047486
 long $fae3ce3a
 long $ff00001f
 long $f50475ff
 long $f107ce01
 long $f067ce0e
 long $fd63d207
 long $f403d5e9
 long $f20fce00
 long $5a7081e7
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
 long $f607ce00
 long $f603e3f6
 long $fb0077e8
 long $fb087438
 long $5d9fffac
 long $f20877e8
 long $5d9fff0c
 long $fd9fff88
 long $f5602e32
 long $fd604224
 long $fdb00184
 long $ed9ffda0
 long $f7cf4e01
 long $566353a9
 long $f7cf5401
 long $566359ac
 long $f60075a8
 long $f18075ab
 long $f640743a
 long $f324741f
 long $f25b51ab
 long $10c3583a
 long $40c3523a
 long $460351ab
 long $f10353ac
 long $f2575200
 long $c5474e01
 long $35274e01
 long $f64353a9
 long $fdb001e0
 long $fd9ffd54
 long $fd604224
 long $fdb0012c
 long $3d900024
 long $f20f50ff
 long $ad900008
 long $f20f56ff
 long $5d9ffd38
 long $f6002da3
 long $f5634faa
 long $f7cf4e01
 long $55402c32
 long $fd9ffd24
 long $f5634faa
 long $f10351ab
 long $fd0353ac
 long $fd607419
 long $f0647403
 long $f603523a
 long $fd9fffac
 long $fd604224
 long $fdb000e0
 long $e6002da2
 long $ed9ffcf8
 long $f5634faa
 long $f18351ab
 long $f0475201
 long $fd635228
 long $fd1801ac
 long $fd635218
 long $f0475202
 long $fd9fff7c
 long $fd604224
 long $f6034e16
 long $f6042c00
 long $f64b53a7
 long $ad9ffcc4
 long $f0474e1f
 long $f607501f
 long $f0775201
 long $31875001
 long $3d9ffff4
 long $f0875201
 long $f0475202
 long $fd9fff48
 long $fd604224
 long $f6047400
 long $fdb000a8
 long $cd9ffc94
 long $f0675202
 long $f6042c00
 long $f66351a8
 long $f10f501e
 long $f2575020
 long $bd9ffc7c
 long $f04353a8
 long $f103523a
 long $f0475201
 long $f7cf4e01
 long $f3e02da9
 long $fd9ffc64
 long $fd604224
 long $f6007416
 long $f5607417
 long $f5087432
 long $ad900018
 long $f6007416
 long $f5407417
 long $f5387432
 long $ad9ffc40
 long $f7d02c32
 long $fd9ffc38
 long $f7c82c32
 long $5d900008
 long $f2182c17
 long $fd9ffc28
 long $f2182e16
 long $fd9ffc20
 long $f6007416
 long $f6002c17
 long $fdb00024
 long $f6002e16
 long $f60355a7
 long $f60357a8
 long $f60359a9
 long $f6002c3a
 long $fdb0000c
 long $37cf5408
 long $1d75e06f
 long $20f5800
 long $f6034e16
 long $f0474e1f
 long $f6035216
 long $f50353a5
 long $f6035016
 long $f0675001
 long $f04f5018
 long $ad900014
 long $f20f50ff
 long $5d90003c
 long $f6002da2
 long $f5474e08
 long $fd90003c
 long $f6007ba9
 long $f5487ba8
 long $5d90000c
 long $f5474e02
 long $f6675096
 long $fd900024
 long $f0675207
 long $f7cb53a6
 long $5d900014
 long $f0675201
 long $f1875001
 long $fd9fffec
 long $f0675206
 long $f54353a6
 long $f187507f
 long $f7d74e08
 long $20f5200
 long $f20f5200
 long $a6075000
 long $ad900040
 long $f0775201
 long $31875001
 long $3d9ffff4
 long $f1075002
 long $f1175300
 long $c1075001
 long $f107507f
 long $f34351a4
 long $f36750ff
 long $f2575001
 long $3d900014
 long $f5475201
 long $f0075201
 long $f66351a8
 long $f04353a8
 long $f6075000
 long $f6002da9
 long $f0442c09
 long $f0675017
 long $f5402da8
 long $f0674e1f
 long $5402da7
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
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov RI, FP
 sub RI, #-(-24)
 wrlong r23, RI ' ASGNU4 addrli reg
 mov r22, #104 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, ##@C_N_M_M__L_U_T__L_I_B_R_A_R_Y__array ' reg <- addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r21 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, r19 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, #2 ' reg <- coni
 mov r20, ##@C_N_M_M__threaded_dynamic_array ' reg <- addrg
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
