' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export PNut_interpreter_array

 long ' align long
C_P_N_ut_interpreter_array ' <symbol:PNut_interpreter_array>
 long $a0fc0005
 long $a0bc03f0
 long $80fc0202
 long $4bfd601
 long $80fc0700
 long $80fc0700
 long $e4fc0002
 long $cffd201
 long $a0fc0000
 long $bc0bee
 long $80ffdc01
 long $857c0a40
 long $5c4c00ee
 long $a0bc0605
 long $20fc0604
 long $80fc061a
 long $50bc2603
 long $24fc0602
 long $2cfc0603
 long $a0bc081a
 long $28bc0803
 long $60fc08ff
 long $50bc3204
 long $627c0a01
 long $617c0a02
 long $5c7c0000
 long $463e2b1e
 long $7373624a
 long $a1a19a91
 long $d6cfc4b4
 long $68bc0beb
 long $43c0bef
 long $80ffde02
 long $43fd9ef
 long $80ffde02
 long $43fdbef
 long $80ffde02
 long $43fd5ef
 long $a0bfd5ef
 long $80ffde02
 long $5c7c0158
 long $80bfd600
 long $81bfd801
 long $5c48003f
 long $5cd3bddc
 long $bc03ee
 long $80ffdc01
 long $80900200
 long $2cfc0202
 long $80bc03eb
 long $8bc0201
 long $a0bc0001
 long $28fc0210
 long $5e700029
 long $a0bfdbea
 long $4bfd5ea
 long $43fdded
 long $80ffda02
 long $80bfde01
 long $a08fddeb
 long $808fdc00
 long $5c7c0008
 long $5cffbddc
 long $5cfc33cd
 long $84c40001
 long $857c0001
 long $80a7dc06
 long $72fc0a09
 long $5c680158
 long $5c540008
 long $5c48005f
 long $84d3de0c
 long $5c500158
 long $5efc33cd
 long $5ccfbdda
 long $a08c0401
 long $5cf3bdd8
 long $84ffde08
 long $8bc07ef
 long $c13c0401
 long $b0bc0800
 long $988c0803
 long $80b00803
 long $9c8c0801
 long $80b00801
 long $5cffc9df
 long $85280003
 long $80bc0602
 long $84bc0601
 long $85080600
 long $a08c0604
 long $80f00601
 long $627c0a04
 long $82807ef
 long $80ffde0c
 long $5ccbbdda
 long $5c68003b
 long $5c7c0042
 long $5cebbddc
 long $848bde00
 long $a087d1ee
 long $a087dd38
 long $5c4c0008
 long $5cd7bdda
 long $a0bc0400
 long $a4fc0001
 long $bc0602
 long $80fc0401
 long $ec6806cd
 long $940801
 long $80d40201
 long $6c940604
 long $e854072c
 long $ee54092c
 long $e4fc006a
 long $5cffbdd8
 long $5c50008c
 long $ec7c0408
 long $637c0a04
 long $60fc0a03
 long $a0a80601
 long $85140200
 long $a0900802
 long $84d00801
 long $2c900805
 long $80900204
 long $80900004
 long $b0fc0801
 long $2cbc0805
 long $2cfc0a03
 long $58bd1005
 long $68fc0a01
 long $58bd0c05
 long $ffff
 long $8940601
 long $80940204
 long $83c0600
 long $80bc0004
 long $e4fc0486
 long $5c7c0008
 long $617c0401
 long $627c0a04
 long $f0280001
 long $f4140001
 long $5c7c0008
 long $5ccbbdda
 long $c480000
 long $8480200
 long $480004
 long $5cf7bddc
 long $c440003
 long $c600005
 long $f8d00000
 long $5c7c0008
 long $5cd3bdda
 long $fc100001
 long $5c500008
 long $5cffbddc
 long $68fc0010
 long $637c0010
 long $5c7c00da
 long $5c7000ae
 long $5cebbdd8
 long $60a80538
 long $2ce80410
 long $60a80338
 long $2ce80202
 long $68a80202
 long $4ce80008
 long $68a80001
 long $de80002
 long $dd40004
 long $a4f00001
 long $5c7c00b2
 long $5cffbddc
 long $d680006
 long $d540007
 long $70bc01e5
 long $627c0a04
 long $5c7c0044
 long $8a801ed
 long $5cd7bddc
 long $a0bfdfed
 long $84ffde02
 long $4bfddef
 long $84ffde02
 long $4bfdbef
 long $84ffde02
 long $4bfd9ef
 long $84ffde02
 long $4bfd7ef
 long $614fd602
 long $5c4c00b6
 long $627fd601
 long $60bfd738
 long $5c7c0044
 long $a0bc0005
 long $84fc0035
 long $5c6c0158
 long $bc03ee
 long $80ffdc01
 long $24bc0001
 long $617c0220
 long $84f00001
 long $617c0240
 long $6cb001e5
 long $5c7c0158
 long $84fc0a37
 long $bc05ee
 long $80ffdc01
 long $2cfc0008
 long $68bc0002
 long $e4fc0ad0
 long $5c7c0158
 long $bc01ee
 long $80ffdc01
 long $a0bc0a00
 long $28fc0a05
 long $68fc01e0
 long $50bf8200
 long $54bf8600
 long $50bf9000
 long $5c500179
 long $5ccfbddc
 long $a08c0200
 long $5cf3bdda
 long $60fc001f
 long $60fc021f
 long $a0bc0e00
 long $85bc0e01
 long $acbc0e07
 long $84fc0e01
 long $a08fd001
 long $a0b3d000
 long $74bf7fe7
 long $74bf97e7
 long $68fc0a0c
 long $5c7c0179
 long $857c0a80
 long $5c70015d
 long $857c0ae0
 long $5c700162
 long $a2bc0405
 long $60fc041f
 long $20beb802
 long $25beb802
 long $5ccfbddc
 long $5cf3bdda
 long $6cac0001
 long $6cac0200
 long $6cac0001
 long $a0fc0600
 long $627c0410
 long $5c4c013b
 long $5c68012e
 long $617c0408
 long $5c700127
 long $617c0404
 long $864c0000
 long $7c8c01e5
 long $864c0200
 long $7c8c03e5
 long $5c4c0135
 long $a0fc0820
 long $a9bc0000
 long $70fc040c
 long $abbc0201
 long $6cf00404
 long $617c0402
 long $5c50011a
 long $29fc0001
 long $81b00601
 long $31fc0601
 long $31fc0001
 long $e4fc090f
 long $627c0404
 long $a4940603
 long $a6940000
 long $84d40601
 long $627c0401
 long $a0940003
 long $5c7c0158
 long $2bfc0201
 long $30fc0601
 long $e4d4091a
 long $e1bc0003
 long $34fc0201
 long $28fc0601
 long $e4fc091d
 long $617c0408
 long $b0bc0000
 long $617c0404
 long $627c0401
 long $b0a80001
 long $5c7c0158
 long $c33c0001
 long $a0e80004
 long $a0d40002
 long $a0f00001
 long $66bc0002
 long $78bc01e5
 long $5c7c0158
 long $867c040f
 long $a4a80201
 long $a0bc0602
 long $60fc060c
 long $80bc0403
 long $857c041a
 long $84cc0414
 long $2cfc0403
 long $80fc0441
 long $58be7202
 long $fffc
 long $20bc0001
 long $5c7c0158
 long $617c0408
 long $5c540142
 long $627c0401
 long $a48c0001
 long $84c40001
 long $a8b00001
 long $5c7c0158
 long $627c0402
 long $5c70014a
 long $a0e80020
 long $2de80201
 long $e4c80145
 long $a0d40001
 long $2c940001
 long $5c7c0158
 long $a0fc0000
 long $a0e80810
 long $2de80201
 long $34e80601
 long $2de80201
 long $34e80601
 long $2ce80002
 long $68e80001
 long $e1a80600
 long $28e80002
 long $34e80001
 long $e4e8094c
 long $85140001
 long $749401e5
 long $83c01ef
 long $80ffde04
 long $617c0c40
 long $5c7c0008
 long $bf7afe9f
 long $a0fc0202
 long $a0bc0e05
 long $60fc0e1c
 long $627c0a20
 long $5c7c0172
 long $a0bc0205
 long $28fc0205
 long $60fc0203
 long $617c0a10
 long $5cf3bddc
 long $2cb00001
 long $617c0a08
 long $627c0a04
 long $84cbde04
 long $8880fef
 long $58f7a451
 long $5cf433ce
 long $617c0a08
 long $a0b40e06
 long $80bc0e00
 long $80840feb
 long $80a00fec
 long $80900fed
 long $2cfc0203
 long $58bf7001
 long $68fc0201
 long $58bf8c01
 long $60fc0a03
 long $5cfc3217
 long $5c4801c5
 long $5cc7bddc
 long $5c4401b7
 long $a0900007
 long $60900085
 long $5c500158
 long $5cfc33d3
 long $627c0c7e
 long $5cebbddc
 long $5c6801b4
 long $5cfeb7c5
 long $627c0c20
 long $a0b00406
 long $5cf2b6f3
 long $84ffde04
 long $5c7001b4
 long $617c0c10
 long $5c5401ab
 long $627c0c04
 long $5c7001a4
 long $617c0c08
 long $5c70019b
 long $54ffba03
 long $5cffbdd8
 long $54ffba00
 long $80ebde04
 long $a0e80601
 long $5cfc33cd
 long $c13c0401
 long $90bc0003
 long $5cffc9df
 long $808fdc06
 long $5c7c01b6
 long $48fc0001
 long $a0fc0220
 long $a0fc0417
 long $20d40401
 long $613c0002
 long $30e80001
 long $34d40001
 long $e5fc039f
 long $5c7c01b3
 long $617c0c08
 long $2cc80018
 long $38c80018
 long $2cc40010
 long $38c40010
 long $7cb001e5
 long $5c7c01b3
 long $90fc0001
 long $617c0c04
 long $627c0c02
 long $3c880007
 long $3c880007
 long $60c400ff
 long $60a00085
 long $617c0c08
 long $80c01ef
 long $617c0c80
 long $80f3de04
 long $50feb608
 long $637c0a0c
 long $8280007
 long $5c680008
 long $a4cc0401
 long $3c8c0407
 long $2c8c05e8
 long $6c8c05e5
 long $3c8c0007
 long $3c8c0007
 long $2c8c01e8
 long $608c05ff
 long $688c0002
 long $a0bffe00
 long $5c7c0008
 long $637c0a0c
 long $8a80007
 long $5c680158
 long $a0bc01ff
 long $288c01e8
 long $3c8c0007
 long $3c8c0007
 long $5c7c0158
 long $58ffa471
 long $bc0dee
 long $80ffdc01
 long $617c0c80
 long $2cfc0c19
 long $38fc0c19
 long $b009ee
 long $80f3dc01
 long $2cf00c08
 long $68b00c04
 long $5c7c0018
 long $84ffde04
 long $8bc05ef
 long $84ffde04
 long $8bc03ef
 long $84ffde04
 long $8bc01ef
 long $5c7c0000
 long $6cb00401
 long $6cb00202
 long $6cb00401
 long $c13c0001
 long $c10c0400
 long $5c7c0000
 long $ffffffff
 long $80000000
 long $800000

' Catalina Export coginit_PNut

' Catalina Code

DAT ' code segment

 long ' align long
C_coginit_P_N_ut ' <symbol:coginit_PNut>
 jmp #NEWF
 jmp #LODL
 long 1968
 sub SP, RI
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 jmp #LODL
 long $fff9ffff
 mov r22, RI ' reg <- con
 wrlong r22, r21 ' ASGNU4 reg reg
 mov r22, r21
 adds r22, #4 ' ADDP4 coni
 jmp #LODL
 long $fff9ffff
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -12
 wrword r22, RI ' ASGNI2 addrl reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 jmp #LODF
 long -10
 wrword r22, RI ' ASGNI2 addrl reg
 mov r22, r23 ' CVI, CVU or LOAD
 jmp #LODF
 long -8
 wrword r22, RI ' ASGNI2 addrl reg
 mov r22, r21 ' CVI, CVU or LOAD
 adds r22, #8 ' ADDI4 coni
 jmp #LODF
 long -6
 wrword r22, RI ' ASGNI2 addrl reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 adds r22, r19 ' ADDI/P (1)
 jmp #LODF
 long -4
 wrword r22, RI ' ASGNI2 addrl reg
 mov r22, r21 ' CVI, CVU or LOAD
 adds r22, #8 ' ADDI4 coni
 adds r22, r17 ' ADDI/P (1)
 jmp #LODF
 long -2
 wrword r22, RI ' ASGNI2 addrl reg
 jmp #LODL
 long 1952
 mov r2, RI ' reg ARG con
 jmp #LODL
 long @C_P_N_ut_interpreter_array
 mov r3, RI ' reg ARG ADDRG
 jmp #LODF
 long -1964
 mov r4, RI ' reg ARG ADDRL
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C_memcpy
 add SP, #8 ' CALL addrg
 mov r2, #8 ' reg ARG coni
 mov r22, #2 ' reg <- coni
 jmp #LODF
 long -1964
 mov r20, RI ' reg <- addrl
 mov r3, r20 ' RSHI
 sar r3, r22 ' RSHI (3)
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 mov r4, r20 ' RSHI
 sar r4, r22 ' RSHI (3)
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__coginit
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -1968
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r2, #50 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_wait ' CALL addrg
 jmp #LODF
 long -1968
 rdlong r0, RI ' reg <- INDIRI4 addrl
' C_coginit_P_N_ut_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #LODL
 long 1968
 add SP, RI ' framesize
 jmp #RETF


' Catalina Import memcpy

' Catalina Import wait

' Catalina Import _coginit
' end
