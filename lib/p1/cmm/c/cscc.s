' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
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

' Catalina Export _cogstart_C_cog

' Catalina Code

DAT ' code segment

 alignl ' align long
C__cogstart_C__cog ' <symbol:_cogstart_C_cog>
 alignl ' align long
 long I32_NEWF + 16<<S32
 alignl ' align long
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((8)&$1FF)<<S16B
 word I16A_RDLONG + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrl16
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_ADD + (r22)<<D16A + (r19)<<S16A ' ADDU (1)
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long @C_cmmd_array ' reg <- addrg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_SARI + (r3)<<D16A + (2)<<S16A ' SHRI4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- addrl16
 word I16A_MOV + (r4)<<D16A + (r22)<<S16A
 word I16A_SARI + (r4)<<D16A + (2)<<S16A ' SHRI4 reg coni
 word I16B_CPREP + 50<<S16B ' arg size, rpsize = 12, spsize = 12
 alignl ' align long
 long I32_CALA + (@C__coginit)<<S32
 word I16A_ADDI + SP<<D16A + 8<<S16A ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r18)<<D16A + (20)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' ADDU
 word I16A_ADD + (r2)<<D16A + (r0)<<S16A ' ADDU (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__waitcnt)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
' C__cogstart_C__cog_1 ' (symbol refcount = 0)
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import _registry

' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import _coginit

' Catalina Import _clockfreq
' end
