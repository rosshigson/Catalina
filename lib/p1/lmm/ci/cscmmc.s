' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export cmmd_array

 alignl ' align long
C_cmmd_array ' <symbol:cmmd_array>
 long $5c7c0053
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
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
 long $a0bc0000
 long $bc0000
 long $4bc0000
 long $8bc0000
 long $3c0000
 long $43c0000
 long $83c0000
 long $80bc0000
 long $d0bc0000
 long $60bc0000
 long $68bc0000
 long $6cbc0000
 long $84bc0000
 long $d4bc0000
 long $873c0000
 long $c33c0000
 long $a4bc0000
 long $2cbc0000
 long $28bc0000
 long $38bc0000
 long $2cfc0000
 long $28fc0000
 long $38fc0000
 long $80fc0000
 long $84fc0000
 long $a0fc0000
 long $d0fc0000
 long $d4fc0000
 long $877c0000
 long $c37c0000
 long $a4fc0000
 long $400000
 long $80000000
 long $ffffffff
 long $0
 long $0
 long $a0bc01f0
 long $4bfd200
 long $cfc0401
 long $2cfc0402
 long $80bc05e9
 long $8bc0202
 long $64bc0222
 long $83c0202
 long $80fc0004
 long $8bc3000
 long $80fc0004
 long $8bc3200
 long $80fc0004
 long $8bc0400
 long $84fc3208
 long $a0bc5a19
 long $5c7c0070
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $28fc4a10
 long $e87c4a71
 long $80fc3004
 long $8bc4a18
 long $a0bc4e25
 long $60fc4e01
 long $ec7c4e97
 long $a0bc4e25
 long $60fc4e02
 long $ec7c4ea3
 long $a0bc4e25
 long $28fc4e1a
 long $80fc4e7e
 long $a0bc5025
 long $28fc5002
 long $64bc5022
 long $5c3c0027
 long $5c7c0178
 long $5c7c0175
 long $5c7c017a
 long $5c7c017f
 long $5c7c017c
 long $5c7c0181
 long $5c7c0191
 long $5c7c018f
 long $5c7c0193
 long $5c7c0194
 long $5c7c0196
 long $5c7c0197
 long $5c7c01a6
 long $5c7c01ad
 long $5c7c01c8
 long $5c7c01d1
 long $5c7c01dd
 long $5c7c01e4
 long $5c7c01b6
 long $5c7c01b8
 long $5c7c01bd
 long $5c7c01c4
 long $5c7c01ca
 long $3c0000
 long $5c7c006f
 long $a0bc5025
 long $28fc5001
 long $50bcd828
 long $28fc5005
 long $54bcd828
 long $28fc5005
 long $60fc501f
 long $80fc502e
 long $50bd4228
 long $60bcd824
 long $68bcd800
 long $5c7c006c
 long $a0bc4e25
 long $28fc4e0b
 long $60fc4e1f
 long $80fc4ea8
 long $5c3c0027
 long $5c7c015e
 long $5c7c01da
 long $5c7c01e1
 long $5c7c00c5
 long $5c7c00da
 long $5c7c0174
 long $5c7c00d7
 long $5c7c00dc
 long $5c7c00e7
 long $5c7c00f1
 long $5c7c013a
 long $5c7c019b
 long $5c7c0199
 long $5c7c019d
 long $5c7c019e
 long $5c7c01a0
 long $5c7c01a1
 long $5c7c00fb
 long $5c7c0131
 long $5c7c0159
 long $5c7c015b
 long $5c7c0154
 long $5c7c0156
 long $5c7c014a
 long $5c7c0053
 long $5c7c0164
 long $5c7c012b
 long $5c7c016d
 long $5c7c01a2
 long $8bc3619
 long $80fc3204
 long $54fd9417
 long $2cfc3608
 long $2ffc3601
 long $8b00019
 long $80f03204
 long $84959426
 long $5c5400c9
 long $a0bc5025
 long $62fc51fc
 long $623c4ad5
 long $5c6801dd
 long $623c4ad6
 long $5c6801e1
 long $5c7c006d
 long $200
 long $400
 long $84fc3204
 long $83c3619
 long $5c7c006d
 long $a0bc301b
 long $5c7c0070
 long $a0bc5201
 long $a0bc5400
 long $a8bc0201
 long $a8bc0000
 long $6cbc522a
 long $5cfde0e8
 long $a1bc542a
 long $b0bc0201
 long $a1bc5229
 long $b0bc0000
 long $5c7c006d
 long $50fde06d
 long $a0fc4e20
 long $a0fc5000
 long $2dfc0001
 long $34fc5001
 long $e1bc5001
 long $80f00001
 long $e4fc4eea
 long $a0bc0228
 long $5c7c0000
 long $a0fc4e00
 long $867c0000
 long $5c6800f9
 long $29fc0001
 long $5c4c00f7
 long $81bc4e01
 long $2dfc0201
 long $5c7c00f2
 long $a0bc0027
 long $5c7c006d
 long $50fe506d
 long $a0fc5408
 long $a1bc0003
 long $5c70010d
 long $627c0080
 long $5c54011b
 long $a0bc4fe9
 long $a0fc5000
 long $877c5008
 long $5c4c0129
 long $8bc5227
 long $28fc5218
 long $863c5200
 long $80d45001
 long $80d44e04
 long $5c540103
 long $a0bc0028
 long $5c7c011b
 long $2cfc0001
 long $80bc01e9
 long $4bc0000
 long $a0bc4e00
 long $28fc000c
 long $a0bc5427
 long $60fc4e7f
 long $2efc4e18
 long $5c680129
 long $28fc5407
 long $627c5408
 long $d685406
 long $5c600118
 long $68bc0427
 long $60fc0007
 long $2cfc0002
 long $80bc01e9
 long $8bc0000
 long $623c0022
 long $5c680129
 long $83c0400
 long $abc0600
 long $5c540122
 long $80fc0004
 long $8bc0000
 long $627c5408
 long $c685407
 long $5c7c0000
 long $a4fc0001
 long $5c7c0126
 long $64fc3003
 long $80fc3004
 long $8be5e18
 long $80fc3004
 long $0
 long $5c7c0070
 long $64fc3003
 long $80fc3004
 long $8be6a18
 long $80fc3004
 long $0
 long $8be7018
 long $80fc3004
 long $0
 long $5c7c0133
 long $a0bc5602
 long $a0bc5803
 long $a0bc0625
 long $28fc0602
 long $60fc061f
 long $a4bc0603
 long $a0bc042d
 long $a0bc4e2d
 long $83c0027
 long $80fc4e04
 long $83c0227
 long $5cfe50fc
 long $a0bc042b
 long $a0bc062c
 long $c37c0000
 long $5c7c006d
 long $80fc3004
 long $8bc3618
 long $64fc3003
 long $a0bcd82f
 long $a0fc521b
 long $a0bc5025
 long $28fc5002
 long $54bcd828
 long $50bcd829
 long $5c7c006c
 long $a0fc5220
 long $5c7c0157
 long $a0fc5221
 long $a0bcd838
 long $5c7c014f
 long $a0fc524f
 long $5c7c015c
 long $a0fc5250
 long $a0bcd83a
 long $5c7c014f
 long $a0bc5025
 long $2cfc5015
 long $38fc5017
 long $a0bc361a
 long $d0bc3628
 long $5c7c006d
 long $a0bc5025
 long $28fc5002
 long $60fc51ff
 long $54fed253
 long $80fc3004
 long $8bc0018
 long $80bed226
 long $e4fc5168
 long $5c7c0053
 long $a0bc3825
 long $28fc3804
 long $60fc387c
 long $a0bc5025
 long $60fc503c
 long $84bc3228
 long $5c7c006d
 long $a0bc501b
 long $80fc3004
 long $84fc3208
 long $83c3019
 long $a0bc3028
 long $5c7c0070
 long $8bc3628
 long $5c7c006f
 long $2cfc5008
 long $38fc5008
 long $d0bc501a
 long $8bc4e28
 long $5c7c018c
 long $a0bc4e28
 long $54ff1206
 long $28fc5006
 long $627c51ff
 long $28e85009
 long $54eb120f
 long $2bfc5001
 long $84f03204
 long $8300019
 long $80bf1226
 long $5c540187
 long $84fc3204
 long $83c4e19
 long $5c7c006f
 long $5c540178
 long $5c7c006f
 long $5c680178
 long $5c7c006f
 long $5c4c0178
 long $5c440178
 long $5c7c006f
 long $5c780178
 long $5c700178
 long $5c7c006f
 long $5c5401a2
 long $5c7c006d
 long $5c6801a2
 long $5c7c006d
 long $5c4c01a2
 long $5c4401a2
 long $5c7c006d
 long $5c7801a2
 long $5c4c006d
 long $2cfc4a15
 long $38fc4a17
 long $80bc3025
 long $5c7c0070
 long $a0bc5228
 long $80fc5203
 long $64fc5203
 long $84bc3229
 long $a0bc4e00
 long $a0bc5419
 long $5c7c01af
 long $a0bc4e01
 long $a0bc5400
 long $ec7c506f
 long $bc5227
 long $3c522a
 long $80fc4e01
 long $80fc5401
 long $84fc5001
 long $5c7c01af
 long $64bd2a4e
 long $5c7c01b9
 long $68bd2a4e
 long $58fd2b41
 long $64bd2a23
 long $68bd2a28
 long $5c7c0095
 long $84fc3804
 long $873c381b
 long $5c70006f
 long $64bd2a4e
 long $68fc501c
 long $58fd2a10
 long $5c7c01ba
 long $a0bc3828
 long $28fc3809
 long $60fc51ff
 long $5c7c01d6
 long $a0bc3628
 long $5c7c006f
 long $a0bc4e28
 long $28fc4e13
 long $54bf9e27
 long $2cfc500d
 long $38fc500d
 long $a0bc0028
 long $5c7c006f
 long $84fc3204
 long $83c3419
 long $a0bc3419
 long $80fc3808
 long $80bc381a
 long $84fc3204
 long $83c9e19
 long $84bc3228
 long $5c7c006f
 long $a0bc5025
 long $28fc5002
 long $60fc51ff
 long $80bc3228
 long $80fc3204
 long $8bc3419
 long $80fc3204
 long $8bc3019
 long $80fc3208
 long $5c7c0070
 long $2cfc5008
 long $38fc5008
 long $a0bc361a
 long $d0bc3628
 long $5c7c006f
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0

' Catalina Export _cogstart_CMM_cog

' Catalina Code

DAT ' code segment

 alignl ' align long
C__cogstart_C_M_M__cog ' <symbol:_cogstart_CMM_cog>
 jmp #NEWF
 sub SP, #16
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
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 jmp #LODF
 long -16
 wrlong r23, RI ' ASGNU4 addrl reg
 jmp #LODF
 long -12
 wrlong r21, RI ' ASGNU4 addrl reg
 mov r22, r19 ' CVI, CVU or LOAD
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r22, #2 ' reg <- coni
 jmp #LODL
 long @C_cmmd_array
 mov r20, RI ' reg <- addrg
 mov r3, r20 ' RSHI
 sar r3, r22 ' RSHI (3)
 mov r20, FP
 sub r20, #-(-20) ' reg <- addrli
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
' C__cogstart_C_M_M__cog_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Import _registry

' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import _coginit

' Catalina Import _clockfreq
' end
