' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export cmmd_array

 alignl_label
C_cmmd_array ' <symbol:cmmd_array>
 long $fd900154
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $ff
 long $ffff
 long $ff000000
 long $3ffff
 long $3e1f
 long $0
 long $200
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $f6000000
 long $fac00000
 long $fae00000
 long $fb000000
 long $fc400000
 long $fc500000
 long $fc600000
 long $f1000000
 long $f1400000
 long $f5000000
 long $f5400000
 long $f5600000
 long $f1800000
 long $f1c00000
 long $f2180000
 long $f2580000
 long $f6600000
 long $f0600000
 long $f0400000
 long $f0c00000
 long $f0640000
 long $f0440000
 long $f0c40000
 long $f1040000
 long $f1840000
 long $f6040000
 long $f1440000
 long $f1c40000
 long $f21c0000
 long $f25c0000
 long $f6640000
 long $40000
 long $80000000
 long $ffffffff
 long $0
 long $0
 long $fb04ab61
 long $fd600401
 long $f0640402
 long $f1000455
 long $fb000202
 long $f5200222
 long $fc600202
 long $fb043161
 long $fb043361
 long $fb040161
 long $fb040361
 long $fb040561
 long $fd600029
 long $fb020001
 long $f1843208
 long $f6005a19
 long $fd800083
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $f0444a10
 long $fb9c4a04
 long $fd604024
 long $f1043004
 long $fd604224
 long $fd604a12
 long $f6004e25
 long $f5044e01
 long $fb944e25
 long $f6004e25
 long $f5044e02
 long $fb944e2f
 long $f6004e25
 long $f0444e1a
 long $f1044e85
 long $f6005025
 long $f0445002
 long $f5205022
 long $fd604e2c
 long $fc780018
 long $fd9fffbc
 long $fd9002fc
 long $fd9002ec
 long $fd9002fc
 long $fd90030c
 long $fd9002fc
 long $fd900314
 long $fd900354
 long $fd900348
 long $fd900354
 long $fd900354
 long $fd900358
 long $fd900358
 long $fd900390
 long $fd9001e8
 long $fd9003ec
 long $fd90040c
 long $fd900438
 long $fd900450
 long $fd900394
 long $fd900398
 long $fd9003a8
 long $fd9003c0
 long $fd9003d4
 long $f0000000
 long $fd9fff50
 long $f6005025
 long $f0445001
 long $f9b8de28
 long $f0445005
 long $f9b0de28
 long $f0445005
 long $f504501f
 long $f1045031
 long $f9b95228
 long $f500de24
 long $0
 long $f540de00
 long $fd9fff10
 long $f6004e25
 long $f0444e0b
 long $f5044e1f
 long $f1044eb0
 long $fd604e2c
 long $fd9001e4
 long $fd9003bc
 long $fd9003d4
 long $fd900064
 long $fd9000bc
 long $fd90022c
 long $fd9000a8
 long $fd9000b8
 long $fd9000bc
 long $fd9000c0
 long $fd900108
 long $fd9002bc
 long $fd9002b0
 long $fd9002bc
 long $fd9002bc
 long $fd9002c0
 long $fd9002c0
 long $fd9000ac
 long $fd9000cc
 long $fd900184
 long $fd900188
 long $fd900168
 long $fd90016c
 long $fd900138
 long $fd9ffe34
 long $fd900198
 long $fd900090
 long $fd9001b8
 long $fd900294
 long $fb003619
 long $f1043204
 long $f6045017
 long $f0643608
 long $f07c3601
 long $c98c5000
 long $cb000019
 long $c1043204
 long $ad900008
 long $f1845001
 long $fd9fffe4
 long $f6005025
 long $f50c51fc
 long $f7c84adf
 long $ad900320
 long $f7c84ae0
 long $ad900328
 long $fd9ffe44
 long $200
 long $400
 long $f1843204
 long $fc603619
 long $fd9ffe30
 long $f600301b
 long $fd9ffe74
 long $fda00303
 long $fd9ffe20
 long $fda00300
 long $fd9ffe18
 long $fd000001
 long $fd600018
 long $fd9ffe0c
 long $fda00319
 long $fd9ffe04
 long $f5243003
 long $f1043004
 long $fb01e818
 long $f1043004
 long $0
 long $0
 long $fd800083
 long $f5243003
 long $f1043004
 long $fb01f618
 long $f1043004
 long $0
 long $0
 long $fd9fffec
 long $f6005602
 long $f6005803
 long $f6000625
 long $f0440602
 long $f504061f
 long $f6600603
 long $f600042d
 long $f6004e2d
 long $fc600027
 long $f1044e04
 long $fc600227
 long $fda00319
 long $f600042b
 long $f600062c
 long $f25c0000
 long $fd9ffd8c
 long $f6004e01
 long $f6005400
 long $fb945162
 long $fac05227
 long $fc40522a
 long $f1044e01
 long $f1045401
 long $f1845001
 long $fd9fffe4
 long $f1043004
 long $fd603612
 long $f5243003
 long $f600de32
 long $f604521b
 long $f6005025
 long $f0445002
 long $f9b0de28
 long $f9b8de29
 long $fd9ffd3c
 long $f6045220
 long $fd900004
 long $f6045221
 long $f600de3b
 long $fd9fffd8
 long $f6045252
 long $fd900004
 long $f6045253
 long $f600de3d
 long $fd9fffc4
 long $f6005025
 long $f0645015
 long $f0c45017
 long $f600361a
 long $f1403628
 long $fd9ffd00
 long $f6005025
 long $f0445002
 long $f50451ff
 long $f9b66c56
 long $0
 long $f1043004
 long $fb000018
 long $f1026c26
 long $fb6c51fc
 long $fd9ffc70
 long $f6003825
 long $f0443804
 long $f504387c
 long $f6005025
 long $f504503c
 long $f1803228
 long $fd9ffcbc
 long $f600501b
 long $f1043004
 long $f1843208
 long $fc603019
 long $f6003028
 long $fd9ffcf0
 long $fb003628
 long $fd9ffca4
 long $f0645008
 long $f0c45008
 long $f140501a
 long $fb003628
 long $f1843204
 long $fc603619
 long $fd9ffc88
 long $f6004e28
 long $f6045206
 long $f0445006
 long $f7cc51ff
 long $a0445009
 long $a604520f
 long $f05c5001
 long $c1843204
 long $c98c5200
 long $cc600019
 long $f1045201
 long $5d9fffe8
 long $f1843204
 long $fc604e19
 long $fd9ffc4c
 long $5d9fff94
 long $fd9ffc44
 long $ad9fff8c
 long $fd9ffc3c
 long $3d9fff84
 long $1d9fff80
 long $fd9ffc30
 long $ed9fff78
 long $cd9fff74
 long $fd9ffc24
 long $5d900020
 long $fd9ffc14
 long $ad900018
 long $fd9ffc0c
 long $3d900010
 long $1d90000c
 long $fd9ffc00
 long $ed900004
 long $3d9ffbf8
 long $f0644a15
 long $f0c44a17
 long $f1003025
 long $fd9ffc34
 long $f6005228
 long $f1045203
 long $f5245203
 long $f1803229
 long $f6004e00
 long $f6005419
 long $fd9ffe48
 long $f5213851
 long $fd900004
 long $f5413851
 long $f9ad38c0
 long $f5213823
 long $f5413828
 long $fd9ffc60
 long $f1843804
 long $f218381b
 long $cd9ffbac
 long $f5213851
 long $f544501c
 long $f9ad398c
 long $fd9fffd8
 long $f6003828
 long $f0443809
 long $f50451ff
 long $fd900038
 long $f6003628
 long $fd9ffb84
 long $f6004e28
 long $f0444e13
 long $f9b32c27
 long $f064500d
 long $f0c4500d
 long $f6000028
 long $fd9ffb68
 long $f1843204
 long $fc603419
 long $f6003419
 long $f1043808
 long $f100381a
 long $f1843204
 long $fc60a419
 long $f1803228
 long $fd9ffb44
 long $f6005025
 long $f0445002
 long $f50451ff
 long $f1003228
 long $f1043204
 long $fb003419
 long $f1043204
 long $fb003019
 long $f1043208
 long $fd9ffb60
 long $f0645008
 long $f0c45008
 long $f600361a
 long $f1403628
 long $fd9ffb08
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $fd600828
 long $cf00003
 long $0
 long $7bde8
 long $7bdec
 long $7bdf0
 long $7bdf4
 long $7bdf8
 long $fd100001
 long $fd600018
 long $d600219
 long $f6005201
 long $f6005400
 long $f6400201
 long $f6400000
 long $f560522a
 long $fda00300
 long $f610542a
 long $f6800201
 long $f6105229
 long $6800000
 long $f6004e55
 long $f6045000
 long $f21c5010
 long $3d90001c
 long $fb005227
 long $f0445218
 long $f2085200
 long $ad64002d
 long $f1045001
 long $f1044e04
 long $fd9fffdc
 long $66c5001
 long $f6045410
 long $f6100003
 long $cd90001c
 long $f7cc0080
 long $5d900068
 long $f6000003
 long $fda0030d
 long $5d90009c
 long $f6000028
 long $fd900054
 long $f0640001
 long $f1000055
 long $fae00000
 long $f6004e00
 long $f044000c
 long $f504000f
 long $f6005027
 long $f5044e7f
 long $f06c4e18
 long $ad90006c
 long $f6005428
 long $f0445407
 long $f504541f
 long $f7cc5410
 long $5d900010
 long $f43bd42a
 long $5d705406
 long $1403d42a
 long $bd9ffff0
 long $f5200422
 long $f5400427
 long $f504000f
 long $f0640002
 long $f1000055
 long $fb000000
 long $f7c80022
 long $ad900028
 long $f5200022
 long $fc600400
 long $fb080600
 long $5d9ffff8
 long $f1040004
 long $fb000000
 long $f21c5410
 long $cd605407
 long $c403d42a
 long $fd64002d
 long $f6640001
 long $fd9fffe8
 long $f0640202
 long $ff0003df
 long $f10403b0
 long $fb000401
 long $ff007fff
 long $f50405ff
 long $f0640618
 long $f5400403
 long $fc600401
 long $c600002
 long $fac00602
 long $fc400600
 long $f1040001
 long $f1040401
 long $fb6c03fb
 long $fd64002d
 long $ff000001
 long $faa44f61
 long $f9b84e01
 long $ff000001
 long $fc344f61
 long $fb005000
 long $0
 long $faa44e00
 long $f2084e28
 long $ff000001
 long $faa44f69
 long $f9b04e01
 long $ff000001
 long $fc344f69
 long $fd603629
 long $b000000
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0

' Catalina Export CMM_LUT_LIBRARY_array

 alignl_label
C_C_M_M__L_U_T__L_I_B_R_A_R_Y__array ' <symbol:CMM_LUT_LIBRARY_array>
 long $fd100001
 long $fd600018
 long $d600219
 long $f6005201
 long $f6005400
 long $f6400201
 long $f6400000
 long $f560522a
 long $fda00300
 long $f610542a
 long $f6800201
 long $f6105229
 long $6800000
 long $f6004e55
 long $f6045000
 long $f21c5010
 long $3d90001c
 long $fb005227
 long $f0445218
 long $f2085200
 long $ad64002d
 long $f1045001
 long $f1044e04
 long $fd9fffdc
 long $66c5001
 long $f6045410
 long $f6100003
 long $cd90001c
 long $f7cc0080
 long $5d900068
 long $f6000003
 long $fda0030d
 long $5d90009c
 long $f6000028
 long $fd900054
 long $f0640001
 long $f1000055
 long $fae00000
 long $f6004e00
 long $f044000c
 long $f504000f
 long $f6005027
 long $f5044e7f
 long $f06c4e18
 long $ad90006c
 long $f6005428
 long $f0445407
 long $f504541f
 long $f7cc5410
 long $5d900010
 long $f43bd42a
 long $5d705406
 long $1403d42a
 long $bd9ffff0
 long $f5200422
 long $f5400427
 long $f504000f
 long $f0640002
 long $f1000055
 long $fb000000
 long $f7c80022
 long $ad900028
 long $f5200022
 long $fc600400
 long $fb080600
 long $5d9ffff8
 long $f1040004
 long $fb000000
 long $f21c5410
 long $cd605407
 long $c403d42a
 long $fd64002d
 long $f6640001
 long $fd9fffe8
 long $f0640202
 long $ff0003df
 long $f10403b0
 long $fb000401
 long $ff007fff
 long $f50405ff
 long $f0640618
 long $f5400403
 long $fc600401
 long $c600002
 long $fac00602
 long $fc400600
 long $f1040001
 long $f1040401
 long $fb6c03fb
 long $fd64002d
 long $ff000001
 long $faa44f61
 long $f9b84e01
 long $ff000001
 long $fc344f61
 long $fb005000
 long $0
 long $faa44e00
 long $f2084e28
 long $ff000001
 long $faa44f69
 long $f9b04e01
 long $ff000001
 long $fc344f69
 long $fd603629
 long $b000000

' Catalina Export _cogstart_C_cog

' Catalina Code

DAT ' code segment

 alignl_label
C__cogstart_C__cog ' <symbol:_cogstart_C_cog>
 alignl_p1
 long I32_NEWF + 24<<S32
 alignl_p1
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-24)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r22)<<D16A + (r19)<<S16A ' ADDU (1)
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 alignl_p1
 long I32_MOVI + (r22)<<D32 +(106)<<S32 ' reg <- conli
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_C_M_M__L_U_T__L_I_B_R_A_R_Y__array ' reg <- addrg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_cmmd_array ' reg <- addrg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_SARI + (r3)<<D16A + (2)<<S16A ' SHRI4 reg coni
 word I16B_LODF + ((-28)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A
 word I16A_SARI + (r4)<<D16A + (2)<<S16A ' SHRI4 reg coni
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl_p1
 long I32_CALA + (@C__coginit)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r18)<<D16A + (20)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' ADDU
 word I16A_ADD + (r2)<<D16A + (r0)<<S16A ' ADDU (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__waitcnt)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
' C__cogstart_C__cog_2 ' (symbol refcount = 0)
 word I16B_POPM + 6<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _registry

' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import _coginit

' Catalina Import _clockfreq
' end
