' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export lmmd_array

 alignl_label
C_lmmd_array ' <symbol:lmmd_array>
 long $5c7c0002
 long $5c7c0002
 long $5c7c0053
 long $5c7c0072
 long $5c7c0074
 long $5c7c0077
 long $5c7c007a
 long $5c7c009e
 long $5c7c00a7
 long $5c7c00b2
 long $5c7c00ba
 long $5c7c00c0
 long $5c7c00bd
 long $5c7c00c2
 long $5c7c00c5
 long $5c7c00c7
 long $5c7c00d5
 long $5c7c00e0
 long $5c7c00ea
 long $5c7c00f4
 long $5c7c00f6
 long $5c7c00f8
 long $5c7c00fa
 long $5c7c00fc
 long $5c7c00fe
 long $5c7c0100
 long $5c7c007d
 long $5c7c0132
 long $5c7c0131
 long $5c7c0147
 long $5c7c0156
 long $5c7c0181
 long $5c7c0166
 long $5c7c0173
 long $5c7c0085
 long $5c7c0094
 long $5c7c007f
 long $5c7c00c9
 long $5c7c00cb
 long $5c7c00cd
 long $5c7c00cf
 long $5c7c00d1
 long $5c7c00d3
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
 long $0
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
 long $a0bc67f0
 long $4bcc433
 long $cfc6a01
 long $2cfc6a02
 long $80bc6a62
 long $8bc6835
 long $60bc6850
 long $83c6835
 long $80fc6604
 long $8bc5633
 long $80fc6604
 long $8bc5833
 long $80fc6604
 long $8bc6a33
 long $5c7c0065
 long $0
 long $0
 long $80fc5604
 long $8bcce2b
 long $80fc5604
 long $0
 long $8bcd42b
 long $80fc5604
 long $0
 long $8bcda2b
 long $80fc5604
 long $0
 long $8bce02b
 long $80fc5604
 long $0
 long $5c7c0065
 long $8bc5c2b
 long $5c7c0064
 long $8bc5c2b
 long $8bc5c2e
 long $5c7c0064
 long $8bc5c2b
 long $d0bc5c2d
 long $5c7c0064
 long $84fc5804
 long $83c5c2c
 long $5c7c0065
 long $8bc5c2b
 long $5c7c0081
 long $8bc5c2b
 long $d0bc5c2d
 long $8bc5c2e
 long $84fc5804
 long $83c5c2c
 long $5c7c0064
 long $8bc5c2b
 long $a0bfbc2e
 long $54fd1c39
 long $28fc5c06
 long $627c5dff
 long $28e85c09
 long $54e91c42
 long $2bfc5c01
 long $84f05804
 long $830002c
 long $80bd1d30
 long $5c54008c
 long $84fc5804
 long $83fbc2c
 long $5c7c0064
 long $8bc5c2c
 long $80fc5804
 long $54fd324a
 long $2cfc5c08
 long $2ffc5c01
 long $8b0002c
 long $80f05804
 long $5c680065
 long $84bd3330
 long $5c7c0098
 long $8bc5e2b
 long $80fc5604
 long $a0bfc02f
 long $80ffc003
 long $64ffc003
 long $84bc59e0
 long $a0bfbc33
 long $a0bfbe2c
 long $5c7c00ab
 long $8bc5e2b
 long $80fc5604
 long $a0bfbc34
 long $a0bfbe33
 long $ec7c5e65
 long $bfc1de
 long $3fc1df
 long $80ffbc01
 long $80ffbe01
 long $84fc5e01
 long $5c7c00ab
 long $84fc5804
 long $83c5a2c
 long $a0bc5a2c
 long $80fc5e08
 long $80bc5e2d
 long $84fc5804
 long $83c962c
 long $5c7c0065
 long $80fc5804
 long $8bc5a2c
 long $80fc5804
 long $8bc562c
 long $80fc5808
 long $5c7c0065
 long $8bc5c2b
 long $80fc5604
 long $84fc5808
 long $83c562c
 long $5c7c00c7
 long $8bc562b
 long $5c7c0065
 long $a0bc562e
 long $5c7c0065
 long $8bc5e2e
 long $5c7c0064
 long $4bc5e2e
 long $5c7c0064
 long $bc5e2e
 long $5c7c0064
 long $83c5e2e
 long $5c7c0064
 long $43c5e2e
 long $5c7c0064
 long $3c5e2e
 long $5c7c0064
 long $a0bfc034
 long $a0bfc233
 long $a8bc6834
 long $a8bc6633
 long $6cbfc1e1
 long $5cfdd2e1
 long $a1bfc3e1
 long $b0bc6834
 long $a1bfc1e0
 long $b0bc6633
 long $5c7c0065
 long $50fdd265
 long $a0ffbc20
 long $a0ffbe00
 long $2dfc6601
 long $34ffbe01
 long $e1bfbe34
 long $80f06601
 long $e4ffbce3
 long $a0bc69df
 long $5c7c0000
 long $a0ffc800
 long $867c6600
 long $5c6800f2
 long $29fc6601
 long $5c4c00f0
 long $81bfc834
 long $2dfc6801
 long $5c7c00eb
 long $a0bc67e4
 long $5c7c0065
 long $5c6800c5
 long $5c7c0064
 long $5c5400c5
 long $5c7c0064
 long $5c4c00c5
 long $5c7c0064
 long $5c4400c5
 long $5c7c0064
 long $5c7800c5
 long $5c7c0064
 long $5c7000c5
 long $5c7c0064
 long $a0ffc808
 long $a1bc6636
 long $5c700111
 long $627c6680
 long $5c540120
 long $a0bfbc62
 long $a0ffbe00
 long $877fbe08
 long $5c4c012e
 long $8bfc1de
 long $28ffc018
 long $863fc033
 long $80d7be01
 long $80d7bc04
 long $5c540107
 long $a0bc67df
 long $5c7c0120
 long $2cfc6601
 long $80bc6662
 long $4bc6633
 long $a0bfbc33
 long $28fc660c
 long $a0bfc9de
 long $60ffbc7f
 long $2effbc18
 long $5c68012e
 long $28ffc807
 long $627fc808
 long $5c54011f
 long $d7fc806
 long $5c70011d
 long $68bc6bde
 long $60fc6607
 long $2cfc6602
 long $80bc6662
 long $8bc6633
 long $623c664f
 long $5c68012e
 long $83c6a33
 long $abc6c33
 long $5c540127
 long $80fc6604
 long $8bc6633
 long $627fc808
 long $c6bc807
 long $5c7c0065
 long $a4fc6601
 long $5c7c012b
 long $200
 long $6cbc684b
 long $5cff3991
 long $5c780065
 long $627fb001
 long $a497b5da
 long $627fb601
 long $a497bbdd
 long $a0bfbdd9
 long $84bfbddc
 long $a8bfbdde
 long $4cffbc1f
 long $c33fb3dc
 long $3887bbde
 long $3893b5de
 long $a093b3dc
 long $80bfb5dd
 long $c17fb400
 long $68f3b001
 long $64cfb001
 long $a8bfb5da
 long $5cffa7bb
 long $5c7c0065
 long $5cff3991
 long $5c700065
 long $6cbfb1db
 long $80bfb3dc
 long $a0ffbc00
 long $a0ffbe20
 long $29ffba01
 long $81b3bdda
 long $31ffbc01
 long $31ffba01
 long $e4ffbf4e
 long $2cffbc03
 long $a0bfb5de
 long $5cffa7bb
 long $5c7c0065
 long $5cff3991
 long $a0b867d4
 long $5c780065
 long $6cbfb1db
 long $84bfb3dc
 long $a0ffbc00
 long $a0ffbe1e
 long $2cffbc01
 long $c33fb5dd
 long $84afb5dd
 long $80efbc01
 long $2cffb401
 long $e4ffbf5d
 long $a0bfb5de
 long $5cffa7bb
 long $5c7c0065
 long $a0bfb033
 long $a0fc6600
 long $aabfb5d8
 long $5c680065
 long $28ffb01f
 long $a0ffb21f
 long $2dffb401
 long $84cfb201
 long $5c4c016c
 long $30ffb401
 long $28ffb402
 long $5cffa7bb
 long $5c7c0065
 long $5cff759d
 long $5c700065
 long $2cffb402
 long $a0fc6600
 long $a4bfb3d9
 long $82ffb21f
 long $c17fb221
 long $5c6c0065
 long $84ffb201
 long $28bfb5d9
 long $28ffb401
 long $627fb001
 long $9cbc67da
 long $5c7c0065
 long $a0bfbc33
 long $6cbfbc34
 long $62bfbc4b
 long $5c68018b
 long $a0bfbc33
 long $68bfbc34
 long $67bfbc4b
 long $5c680065
 long $613c664b
 long $5c7c0065
 long $623c664b
 long $5c54018f
 long $873c6634
 long $5c7c0065
 long $873c6833
 long $5c7c0065
 long $a0bfbc33
 long $a0bc6634
 long $5cff759d
 long $5c70019c
 long $a0bc6833
 long $a0bfb7d8
 long $a0bfb9d9
 long $a0bfbbda
 long $a0bc67de
 long $5cff759d
 long $867fba00
 long $5c7c0000
 long $a0bfb033
 long $28ffb01f
 long $a0bfb433
 long $60bfb5d6
 long $a0bfb233
 long $2cffb201
 long $2affb218
 long $5c6801aa
 long $867fb2ff
 long $5c5401b5
 long $a0bc67d4
 long $a0ffb008
 long $5c7c01b8
 long $6a3fb5d9
 long $5c5401af
 long $68ffb002
 long $a4ffb296
 long $5c7c01b8
 long $2cffb407
 long $623fb5d7
 long $5c5401b7
 long $2cffb401
 long $84ffb201
 long $5c7c01b0
 long $2cffb406
 long $68bfb5d7
 long $84ffb27f
 long $617fb008
 long $867fb400
 long $5c7c0000
 long $867fb400
 long $a0ebb200
 long $5c6801ce
 long $2dffb401
 long $84cfb201
 long $5c4c01be
 long $80ffb202
 long $81ffb500
 long $80f3b201
 long $80ffb27f
 long $40bfb3d5
 long $44ffb2ff
 long $c17fb201
 long $5c4c01ce
 long $68ffb401
 long $20ffb401
 long $a4bfb3d9
 long $28bfb5d9
 long $a0ffb200
 long $a0bc67da
 long $28fc6609
 long $58bc67d9
 long $2cffb01f
 long $68bc67d8
 long $5c7c0000
 long $7fffffff
 long $ffffffe9
 long $7fffff
 long $20000000
 long $0
 long $0
 long $0
 long $0
 long $0

' Catalina Export _cogstart_LMM_cog

' Catalina Code

DAT ' code segment

 alignl_label
C__cogstart_L_M_M__cog ' <symbol:_cogstart_LMM_cog>
 alignl_p1
 long I32_NEWF + 16<<S32
 alignl_p1
 long I32_PSHM + $fe0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r5)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r17)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_CALA + (@C__registry)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-20)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-16)&$1FF)<<S16B
 word I16A_WRLONG + (r23)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16B_LODF + ((-12)&$1FF)<<S16B
 word I16A_WRLONG + (r21)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16B_LODF + ((-8)&$1FF)<<S16B
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNU4 addrl16 reg
 word I16A_MOV + (r2)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_LODL + (r22)<<D16B
 alignl_p1
 long @C_lmmd_array ' reg <- addrg
 word I16A_MOV + (r3)<<D16A + (r22)<<S16A
 word I16A_SARI + (r3)<<D16A + (2)<<S16A ' SHRI4 reg coni
 word I16B_LODF + ((-20)&$1FF)<<S16B
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
' C__cogstart_L_M_M__cog_1 ' (symbol refcount = 0)
 word I16B_POPM + 4<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _registry

' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import _coginit

' Catalina Import _clockfreq
' end
