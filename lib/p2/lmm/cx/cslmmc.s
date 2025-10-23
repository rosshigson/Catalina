' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export lmmd_array

 alignl ' align long
C_lmmd_array ' <symbol:lmmd_array>
 long $fd900164
 long $fd900dd0
 long $fd9001cc
 long $fd9001d0
 long $fd9001d8
 long $fd9001e0
 long $fd900274
 long $fd900294
 long $fd9002bc
 long $fd9002d8
 long $fd9002ec
 long $fd9002dc
 long $fd9002ec
 long $fd9002f4
 long $fd9002f8
 long $fd90032c
 long $fd900330
 long $fd900334
 long $fd90033c
 long $fd900340
 long $fd900344
 long $fd900348
 long $fd90034c
 long $fd900350
 long $fd900354
 long $fd90019c
 long $fd90035c
 long $fd900354
 long $fd9003a8
 long $fd9003ec
 long $fd90047c
 long $fd900410
 long $fd90043c
 long $fd90019c
 long $fd9001d8
 long $fd90017c
 long $fd9002a8
 long $fd9002ac
 long $fd9002b0
 long $fd9002b4
 long $fd9002b8
 long $fd9002bc
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
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
 long $fb04a561
 long $fd606a01
 long $f0646a02
 long $f1006a52
 long $fb006835
 long $f5006850
 long $fc606835
 long $fb045761
 long $fb045961
 long $fb046761
 long $fb046961
 long $fb046b61
 long $fd606629
 long $fb020034
 long $fd900018
 long $0
 long $0
 long $0
 long $0
 long $0
 long $f1045604
 long $fd604224
 long $fb00e62b
 long $f1045604
 long $0
 long $0
 long $fd604024
 long $fd9fffe4
 long $fb005c2b
 long $fd9fffd8
 long $fb005c2b
 long $fb005c2e
 long $fd9fffcc
 long $fb005c2b
 long $f1405c2d
 long $fd9fffc0
 long $f1845804
 long $fc605c2c
 long $fd9fffb8
 long $fb005c2b
 long $fd900008
 long $fb005c2b
 long $f1405c2d
 long $fb005c2e
 long $f1845804
 long $fc605c2c
 long $fd9fff94
 long $fb005c2b
 long $f600a62e
 long $f604a839
 long $f0445c06
 long $f7cc5dff
 long $a0445c09
 long $a604a842
 long $f05c5c01
 long $c1845804
 long $c98ca800
 long $cc60002c
 long $f104a801
 long $5d9fffe8
 long $f1845804
 long $fc60a62c
 long $fd9fff54
 long $fb005c2c
 long $f1045804
 long $f604a84a
 long $f0645c08
 long $f07c5c01
 long $c98ca800
 long $cb00002c
 long $c1045804
 long $ad9fff34
 long $f184a801
 long $fd9fffe4
 long $fb005e2b
 long $f1045604
 long $f600aa2f
 long $f104aa03
 long $f524aa03
 long $f1805855
 long $f600a633
 long $f600a82c
 long $fd900010
 long $fb005e2b
 long $f1045604
 long $f600a634
 long $f600a833
 long $fb945fbd
 long $fac0aa53
 long $fc40aa54
 long $f104a601
 long $f104a801
 long $f1845e01
 long $fd9fffe4
 long $f1845804
 long $fc605a2c
 long $f6005a2c
 long $f1045e08
 long $f1005e2d
 long $f1845804
 long $fc60962c
 long $fd9ffebc
 long $f1045804
 long $fb005a2c
 long $f1045804
 long $fb00562c
 long $f1045808
 long $fd9ffea4
 long $fb005c2b
 long $f1045604
 long $f1845808
 long $fc60562c
 long $fd900008
 long $fb00562b
 long $fd9ffe88
 long $f600562e
 long $fd9ffe80
 long $fb005e2e
 long $fd9ffe74
 long $fae05e2e
 long $fd9ffe6c
 long $fac05e2e
 long $fd9ffe64
 long $fc605e2e
 long $fd9ffe5c
 long $fc505e2e
 long $fd9ffe54
 long $fc405e2e
 long $fd9ffe4c
 long $fda00303
 long $fd9ffe48
 long $fda00300
 long $fd9ffe40
 long $fd006634
 long $fd606618
 long $fd9ffe34
 long $ad9fffa0
 long $fd9ffe28
 long $5d9fff98
 long $fd9ffe20
 long $3d9fff90
 long $fd9ffe18
 long $1d9fff88
 long $fd9ffe10
 long $ed9fff80
 long $fd9ffe08
 long $cd9fff78
 long $fd9ffe00
 long $fda00319
 long $fd9ffdfc
 long $200
 long $f560684b
 long $fdb0016c
 long $ed9ffdec
 long $f7cf2c01
 long $56633198
 long $f7cf3201
 long $5663379b
 long $f600a797
 long $f180a79a
 long $f640a653
 long $f324a61f
 long $f25b2f9a
 long $10c33653
 long $40c33053
 long $46032f9a
 long $f103319b
 long $f2573000
 long $c5472c01
 long $35272c01
 long $f6433198
 long $fdb001c8
 long $fd9ffda0
 long $fdb00118
 long $3d900024
 long $f20f2eff
 long $ad900008
 long $f20f34ff
 long $5d9ffd88
 long $f6006792
 long $f5632d99
 long $f7cf2c01
 long $5540664b
 long $fd9ffd74
 long $f5632d99
 long $f1032f9a
 long $fd03319b
 long $fd60a619
 long $f064a603
 long $f6033053
 long $fd9fffb0
 long $fdb000d0
 long $e6006791
 long $ed9ffd4c
 long $f5632d99
 long $f1832f9a
 long $f0473001
 long $fd633028
 long $fd18019b
 long $fd633018
 long $f0473002
 long $fd9fff84
 long $f6032c33
 long $f6046600
 long $f64b3196
 long $ad9ffd1c
 long $f0472c1f
 long $f6072e1f
 long $f0773001
 long $31872e01
 long $3d9ffff4
 long $f0873001
 long $f0473002
 long $fd9fff54
 long $fdb000a4
 long $cd9ffcf4
 long $f0673002
 long $f6046600
 long $f6632f97
 long $f10f2e1f
 long $f2572e21
 long $bd9ffcdc
 long $f1872e01
 long $f0433197
 long $f0473001
 long $f7cf2c01
 long $f3e06798
 long $fd9ffcc4
 long $f600a633
 long $f560a634
 long $f508a64b
 long $ad900018
 long $f600a633
 long $f540a634
 long $f538a64b
 long $ad9ffca4
 long $f7d0664b
 long $fd9ffc9c
 long $f7c8664b
 long $5d900008
 long $f2186634
 long $fd9ffc8c
 long $f2186833
 long $fd9ffc84
 long $f600a633
 long $f6006634
 long $fdb00024
 long $f6006833
 long $f6033396
 long $f6033597
 long $f6033798
 long $f6006653
 long $fdb0000c
 long $37cf3208
 long $1d75e06f
 long $20f3600
 long $f6032c33
 long $f0472c1f
 long $f6033033
 long $f5033194
 long $f6032e33
 long $f0672e01
 long $f04f2e18
 long $ad900014
 long $f20f2eff
 long $5d90003c
 long $f6006791
 long $f5472c08
 long $fd90003c
 long $f600ad98
 long $f548ad97
 long $5d90000c
 long $f5472c02
 long $f6672e96
 long $fd900024
 long $f0673007
 long $f7cb3195
 long $5d900014
 long $f0673001
 long $f1872e01
 long $fd9fffec
 long $f0673006
 long $f5433195
 long $f1872e7f
 long $f7d72c08
 long $20f3000
 long $f20f3000
 long $a6072e00
 long $ad900040
 long $f0773001
 long $31872e01
 long $3d9ffff4
 long $f1072e02
 long $f1173100
 long $c1072e01
 long $f1072e7f
 long $f3432f93
 long $f3672eff
 long $f2572e01
 long $3d900014
 long $f5473001
 long $f0073001
 long $f6632f97
 long $f0433197
 long $f6072e00
 long $f6006798
 long $f0446609
 long $f0672e17
 long $f5406797
 long $f0672c1f
 long $5406796
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
 long $7bde8
 long $7bdec
 long $7bdf0
 long $7bdf4
 long $7bdf8
 long $fd106634
 long $fd606618
 long $d606819
 long $f600aa34
 long $f600ac33
 long $f6406834
 long $f6406633
 long $f560aa56
 long $fda00300
 long $f610ac56
 long $f6806834
 long $f610aa55
 long $6806633
 long $f600a652
 long $f604a800
 long $f21ca810
 long $3d90001c
 long $fb00aa53
 long $f044aa18
 long $f208aa33
 long $ad64002d
 long $f104a801
 long $f104a604
 long $fd9fffdc
 long $66ca801
 long $f604ac10
 long $f6106636
 long $cd90001c
 long $f7cc6680
 long $5d900068
 long $f6006636
 long $fda0030d
 long $5d90009c
 long $f6006654
 long $fd900054
 long $f0646601
 long $f1006652
 long $fae06633
 long $f600a633
 long $f044660c
 long $f504660f
 long $f600a853
 long $f504a67f
 long $f06ca618
 long $ad90006c
 long $f600ac54
 long $f044ac07
 long $f504ac1f
 long $f7ccac10
 long $5d900010
 long $f43bd456
 long $5d70ac06
 long $1403d456
 long $bd9ffff0
 long $f5206a4f
 long $f5406a53
 long $f504660f
 long $f0646602
 long $f1006652
 long $fb006633
 long $f7c8664f
 long $ad900028
 long $f520664f
 long $fc606a33
 long $fb086c33
 long $5d9ffff8
 long $f1046604
 long $fb006633
 long $f21cac10
 long $cd60ac07
 long $c403d456
 long $fd64002d
 long $f6646601
 long $fd9fffe8
 long $f0646802
 long $ff0003df
 long $f10469b0
 long $fb006a34
 long $ff007fff
 long $f5046bff
 long $f0646c18
 long $f5406a36
 long $fc606a34
 long $c606635
 long $fac06c35
 long $fc406c33
 long $f1046601
 long $f1046a01
 long $fb6c69fb
 long $fd64002d
 long $ff000001
 long $faa4a761
 long $f9b8a634
 long $ff000001
 long $fc34a761
 long $fb00a833
 long $0
 long $faa4a600
 long $f208a654
 long $ff000001
 long $faa4a769
 long $f9b0a634
 long $ff000001
 long $fc34a769
 long $fd605c29
 long $b000033
 long $fd606e28
 long $fcf06636
 long $fd9ff408
 long $fd606828
 long $fd406635
 long $fd9ff3fc
 long $fd70681a
 long $fd60661a
 long $fd9ff3f0
 long $fd606828
 long $fd106635
 long $fd9ff3e4
 long $fb645df3
 long $fb645df5
 long $fb645df7
 long $fd9fffe4
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0

' Catalina Export LMM_LUT_LIBRARY_array

 alignl ' align long
C_L_M_M__L_U_T__L_I_B_R_A_R_Y__array ' <symbol:LMM_LUT_LIBRARY_array>
 long $fd106634
 long $fd606618
 long $d606819
 long $f600aa34
 long $f600ac33
 long $f6406834
 long $f6406633
 long $f560aa56
 long $fda00300
 long $f610ac56
 long $f6806834
 long $f610aa55
 long $6806633
 long $f600a652
 long $f604a800
 long $f21ca810
 long $3d90001c
 long $fb00aa53
 long $f044aa18
 long $f208aa33
 long $ad64002d
 long $f104a801
 long $f104a604
 long $fd9fffdc
 long $66ca801
 long $f604ac10
 long $f6106636
 long $cd90001c
 long $f7cc6680
 long $5d900068
 long $f6006636
 long $fda0030d
 long $5d90009c
 long $f6006654
 long $fd900054
 long $f0646601
 long $f1006652
 long $fae06633
 long $f600a633
 long $f044660c
 long $f504660f
 long $f600a853
 long $f504a67f
 long $f06ca618
 long $ad90006c
 long $f600ac54
 long $f044ac07
 long $f504ac1f
 long $f7ccac10
 long $5d900010
 long $f43bd456
 long $5d70ac06
 long $1403d456
 long $bd9ffff0
 long $f5206a4f
 long $f5406a53
 long $f504660f
 long $f0646602
 long $f1006652
 long $fb006633
 long $f7c8664f
 long $ad900028
 long $f520664f
 long $fc606a33
 long $fb086c33
 long $5d9ffff8
 long $f1046604
 long $fb006633
 long $f21cac10
 long $cd60ac07
 long $c403d456
 long $fd64002d
 long $f6646601
 long $fd9fffe8
 long $f0646802
 long $ff0003df
 long $f10469b0
 long $fb006a34
 long $ff007fff
 long $f5046bff
 long $f0646c18
 long $f5406a36
 long $fc606a34
 long $c606635
 long $fac06c35
 long $fc406c33
 long $f1046601
 long $f1046a01
 long $fb6c69fb
 long $fd64002d
 long $ff000001
 long $faa4a761
 long $f9b8a634
 long $ff000001
 long $fc34a761
 long $fb00a833
 long $0
 long $faa4a600
 long $f208a654
 long $ff000001
 long $faa4a769
 long $f9b0a634
 long $ff000001
 long $fc34a769
 long $fd605c29
 long $b000033
 long $fd606e28
 long $fcf06636
 long $fd9ff408
 long $fd606828
 long $fd406635
 long $fd9ff3fc
 long $fd70681a
 long $fd60661a
 long $fd9ff3f0
 long $fd606828
 long $fd106635
 long $fd9ff3e4
 long $fb645df3
 long $fb645df5
 long $fb645df7
 long $fd9fffe4

' Catalina Export _cogstart_LMM_cog

' Catalina Code

DAT ' code segment

 alignl ' align long
C__cogstart_L_M_M__cog ' <symbol:_cogstart_LMM_cog>
 jmp #NEWF
 sub SP, #24
 jmp #PSHM
 long $fe0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__registry ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -28
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #LODF
 long -24
 wrlong r23, RI ' ASGNU4 addrl reg
 jmp #LODF
 long -20
 wrlong r21, RI ' ASGNU4 addrl reg
 mov r22, #122 ' reg <- coni
 jmp #LODF
 long -16
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #LODL
 long @C_L_M_M__L_U_T__L_I_B_R_A_R_Y__array
 mov r22, RI ' reg <- addrg
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, r19 ' CVI, CVU or LOAD
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, #2 ' reg <- coni
 jmp #LODL
 long @C_lmmd_array
 mov r20, RI ' reg <- addrg
 mov r3, r20 ' RSHI
 sar r3, r22 ' RSHI (3)
 mov r20, FP
 sub r20, #-(-28) ' reg <- addrli
 mov r4, r20 ' RSHI
 sar r4, r22 ' RSHI (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__coginit
 add SP, #8 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r17, r22 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__clockfreq ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r18, #20 ' reg <- coni
 mov r0, r20 ' setup r0/r1 (2)
 mov r1, r18 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 mov r2, r22 ' ADDU
 add r2, r0 ' ADDU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__waitcnt ' CALL addrg
 mov r0, r17 ' CVI, CVU or LOAD
' C__cogstart_L_M_M__cog_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #24 ' framesize
 jmp #RETF


' Catalina Import _registry

' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import _coginit

' Catalina Import _clockfreq
' end
