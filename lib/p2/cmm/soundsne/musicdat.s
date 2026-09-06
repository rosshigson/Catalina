' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export noteName

 alignl_label
C_noteN_ame ' <symbol:noteName>
 byte 67
 byte 0
 byte 0[1]
 byte 67
 byte 35
 byte 0
 byte 68
 byte 0
 byte 0[1]
 byte 68
 byte 35
 byte 0
 byte 69
 byte 0
 byte 0[1]
 byte 70
 byte 0
 byte 0[1]
 byte 70
 byte 35
 byte 0
 byte 71
 byte 0
 byte 0[1]
 byte 71
 byte 35
 byte 0
 byte 65
 byte 0
 byte 0[1]
 byte 65
 byte 35
 byte 0
 byte 66
 byte 0
 byte 0[1]

' Catalina Export notes

 alignl_label
C_notes ' <symbol:notes>
 byte $0
 byte 0
 byte -1
 byte 0[1]
 long $4102e148 ' float
 byte $1
 byte 1
 byte -1
 byte 0[1]
 long $410a8f5c ' float
 byte $2
 byte 2
 byte -1
 byte 0[1]
 long $4112e148 ' float
 byte $3
 byte 3
 byte -1
 byte 0[1]
 long $411b851f ' float
 byte $4
 byte 4
 byte -1
 byte 0[1]
 long $4124cccd ' float
 byte $5
 byte 5
 byte -1
 byte 0[1]
 long $412e8f5c ' float
 byte $6
 byte 6
 byte -1
 byte 0[1]
 long $4138f5c3 ' float
 byte $7
 byte 7
 byte -1
 byte 0[1]
 long $41440000 ' float
 byte $8
 byte 8
 byte -1
 byte 0[1]
 long $414fae14 ' float
 byte $9
 byte 9
 byte -1
 byte 0[1]
 long $415c0000 ' float
 byte $a
 byte 10
 byte -1
 byte 0[1]
 long $41691eb8 ' float
 byte $b
 byte 11
 byte -1
 byte 0[1]
 long $4176e148 ' float
 byte $c
 byte 0
 byte 0
 byte 0[1]
 long $4182cccd ' float
 byte $d
 byte 1
 byte 0
 byte 0[1]
 long $418a8f5c ' float
 byte $e
 byte 2
 byte 0
 byte 0[1]
 long $4192cccd ' float
 byte $f
 byte 3
 byte 0
 byte 0[1]
 long $419b999a ' float
 byte $10
 byte 4
 byte 0
 byte 0[1]
 long $41a4cccd ' float
 byte $11
 byte 5
 byte 0
 byte 0[1]
 long $41aea3d7 ' float
 byte $12
 byte 6
 byte 0
 byte 0[1]
 long $41b8f5c3 ' float
 byte $13
 byte 7
 byte 0
 byte 0[1]
 long $41c40000 ' float
 byte $14
 byte 8
 byte 0
 byte 0[1]
 long $41cfae14 ' float
 byte $15
 byte 9
 byte 0
 byte 0[1]
 long $41dc0000 ' float
 byte $16
 byte 10
 byte 0
 byte 0[1]
 long $41e91eb8 ' float
 byte $17
 byte 11
 byte 0
 byte 0[1]
 long $41f6f5c3 ' float
 byte $18
 byte 0
 byte 1
 byte 0[1]
 long $4202cccd ' float
 byte $19
 byte 1
 byte 1
 byte 0[1]
 long $420a999a ' float
 byte $1a
 byte 2
 byte 1
 byte 0[1]
 long $4212d70a ' float
 byte $1b
 byte 3
 byte 1
 byte 0[1]
 long $421b8f5c ' float
 byte $1c
 byte 4
 byte 1
 byte 0[1]
 long $4224cccd ' float
 byte $1d
 byte 5
 byte 1
 byte 0[1]
 long $422e999a ' float
 byte $1e
 byte 6
 byte 1
 byte 0[1]
 long $42390000 ' float
 byte $1f
 byte 7
 byte 1
 byte 0[1]
 long $42440000 ' float
 byte $20
 byte 8
 byte 1
 byte 0[1]
 long $424fa3d7 ' float
 byte $21
 byte 9
 byte 1
 byte 0[1]
 long $425c0000 ' float
 byte $22
 byte 10
 byte 1
 byte 0[1]
 long $4269147b ' float
 byte $23
 byte 11
 byte 1
 byte 0[1]
 long $4276f5c3 ' float
 byte $24
 byte 0
 byte 2
 byte 0[1]
 long $4282d1ec ' float
 byte $25
 byte 1
 byte 2
 byte 0[1]
 long $428a999a ' float
 byte $26
 byte 2
 byte 2
 byte 0[1]
 long $4292d70a ' float
 byte $27
 byte 3
 byte 2
 byte 0[1]
 long $429b8f5c ' float
 byte $28
 byte 4
 byte 2
 byte 0[1]
 long $42a4d1ec ' float
 byte $29
 byte 5
 byte 2
 byte 0[1]
 long $42ae9eb8 ' float
 byte $2a
 byte 6
 byte 2
 byte 0[1]
 long $42b90000 ' float
 byte $2b
 byte 7
 byte 2
 byte 0[1]
 long $42c40000 ' float
 byte $2c
 byte 8
 byte 2
 byte 0[1]
 long $42cfa8f6 ' float
 byte $2d
 byte 9
 byte 2
 byte 0[1]
 long $42dc0000 ' float
 byte $2e
 byte 10
 byte 2
 byte 0[1]
 long $42e9147b ' float
 byte $2f
 byte 11
 byte 2
 byte 0[1]
 long $42f6f0a4 ' float
 byte $30
 byte 0
 byte 3
 byte 0[1]
 long $4302cf5c ' float
 byte $31
 byte 1
 byte 3
 byte 0[1]
 long $430a970a ' float
 byte $32
 byte 2
 byte 3
 byte 0[1]
 long $4312d47b ' float
 byte $33
 byte 3
 byte 3
 byte 0[1]
 long $431b8f5c ' float
 byte $34
 byte 4
 byte 3
 byte 0[1]
 long $4324cf5c ' float
 byte $35
 byte 5
 byte 3
 byte 0[1]
 long $432e9c29 ' float
 byte $36
 byte 6
 byte 3
 byte 0[1]
 long $43390000 ' float
 byte $37
 byte 7
 byte 3
 byte 0[1]
 long $43440000 ' float
 byte $38
 byte 8
 byte 3
 byte 0[1]
 long $434fa666 ' float
 byte $39
 byte 9
 byte 3
 byte 0[1]
 long $435c0000 ' float
 byte $3a
 byte 10
 byte 3
 byte 0[1]
 long $4369147b ' float
 byte $3b
 byte 11
 byte 3
 byte 0[1]
 long $4376f0a4 ' float
 byte $3c
 byte 0
 byte 4
 byte 0[1]
 long $4382d0a4 ' float
 byte $3d
 byte 1
 byte 4
 byte 0[1]
 long $438a970a ' float
 byte $3e
 byte 2
 byte 4
 byte 0[1]
 long $4392d47b ' float
 byte $3f
 byte 3
 byte 4
 byte 0[1]
 long $439b90a4 ' float
 byte $40
 byte 4
 byte 4
 byte 0[1]
 long $43a4d0a4 ' float
 byte $41
 byte 5
 byte 4
 byte 0[1]
 long $43ae9d71 ' float
 byte $42
 byte 6
 byte 4
 byte 0[1]
 long $43b8feb8 ' float
 byte $43
 byte 7
 byte 4
 byte 0[1]
 long $43c40000 ' float
 byte $44
 byte 8
 byte 4
 byte 0[1]
 long $43cfa666 ' float
 byte $45
 byte 9
 byte 4
 byte 0[1]
 long $43dc0000 ' float
 byte $46
 byte 10
 byte 4
 byte 0[1]
 long $43e9147b ' float
 byte $47
 byte 11
 byte 4
 byte 0[1]
 long $43f6f0a4 ' float
 byte $48
 byte 0
 byte 5
 byte 0[1]
 long $4402d000 ' float
 byte $49
 byte 1
 byte 5
 byte 0[1]
 long $440a97ae ' float
 byte $4a
 byte 2
 byte 5
 byte 0[1]
 long $4412d51f ' float
 byte $4b
 byte 3
 byte 5
 byte 0[1]
 long $441b9000 ' float
 byte $4c
 byte 4
 byte 5
 byte 0[1]
 long $4424d0a4 ' float
 byte $4d
 byte 5
 byte 5
 byte 0[1]
 long $442e9d71 ' float
 byte $4e
 byte 6
 byte 5
 byte 0[1]
 long $4438ff5c ' float
 byte $4f
 byte 7
 byte 5
 byte 0[1]
 long $4443ff5c ' float
 byte $50
 byte 8
 byte 5
 byte 0[1]
 long $444fa70a ' float
 byte $51
 byte 9
 byte 5
 byte 0[1]
 long $445c0000 ' float
 byte $52
 byte 10
 byte 5
 byte 0[1]
 long $4469151f ' float
 byte $53
 byte 11
 byte 5
 byte 0[1]
 long $4476f148 ' float
 byte $54
 byte 0
 byte 6
 byte 0[1]
 long $4482d000 ' float
 byte $55
 byte 1
 byte 6
 byte 0[1]
 long $448a975c ' float
 byte $56
 byte 2
 byte 6
 byte 0[1]
 long $4492d51f ' float
 byte $57
 byte 3
 byte 6
 byte 0[1]
 long $449b9052 ' float
 byte $58
 byte 4
 byte 6
 byte 0[1]
 long $44a4d052 ' float
 byte $59
 byte 5
 byte 6
 byte 0[1]
 long $44ae9d1f ' float
 byte $5a
 byte 6
 byte 6
 byte 0[1]
 long $44b8ff5c ' float
 byte $5b
 byte 7
 byte 6
 byte 0[1]
 long $44c3ff5c ' float
 byte $5c
 byte 8
 byte 6
 byte 0[1]
 long $44cfa70a ' float
 byte $5d
 byte 9
 byte 6
 byte 0[1]
 long $44dc0000 ' float
 byte $5e
 byte 10
 byte 6
 byte 0[1]
 long $44e9151f ' float
 byte $5f
 byte 11
 byte 6
 byte 0[1]
 long $44f6f0f6 ' float
 byte $60
 byte 0
 byte 7
 byte 0[1]
 long $4502d000 ' float
 byte $61
 byte 1
 byte 7
 byte 0[1]
 long $450a975c ' float
 byte $62
 byte 2
 byte 7
 byte 0[1]
 long $4512d51f ' float
 byte $63
 byte 3
 byte 7
 byte 0[1]
 long $451b9052 ' float
 byte $64
 byte 4
 byte 7
 byte 0[1]
 long $4524d052 ' float
 byte $65
 byte 5
 byte 7
 byte 0[1]
 long $452e9d48 ' float
 byte $66
 byte 6
 byte 7
 byte 0[1]
 long $4538ff5c ' float
 byte $67
 byte 7
 byte 7
 byte 0[1]
 long $4543ff5c ' float
 byte $68
 byte 8
 byte 7
 byte 0[1]
 long $454fa70a ' float
 byte $69
 byte 9
 byte 7
 byte 0[1]
 long $455c0000 ' float
 byte $6a
 byte 10
 byte 7
 byte 0[1]
 long $456914f6 ' float
 byte $6b
 byte 11
 byte 7
 byte 0[1]
 long $4576f11f ' float
 byte $6c
 byte 0
 byte 8
 byte 0[1]
 long $4582d014 ' float
 byte $6d
 byte 1
 byte 8
 byte 0[1]
 long $458a975c ' float
 byte $6e
 byte 2
 byte 8
 byte 0[1]
 long $4592d51f ' float
 byte $6f
 byte 3
 byte 8
 byte 0[1]
 long $459b903d ' float
 byte $70
 byte 4
 byte 8
 byte 0[1]
 long $45a4d052 ' float
 byte $71
 byte 5
 byte 8
 byte 0[1]
 long $45ae9d33 ' float
 byte $72
 byte 6
 byte 8
 byte 0[1]
 long $45b8ff48 ' float
 byte $73
 byte 7
 byte 8
 byte 0[1]
 long $45c3ff71 ' float
 byte $74
 byte 8
 byte 8
 byte 0[1]
 long $45cfa70a ' float
 byte $75
 byte 9
 byte 8
 byte 0[1]
 long $45dc0000 ' float
 byte $76
 byte 10
 byte 8
 byte 0[1]
 long $45e914f6 ' float
 byte $77
 byte 11
 byte 9
 byte 0[1]
 long $45f6f10a ' float
 byte $78
 byte 0
 byte 9
 byte 0[1]
 long $4602d014 ' float
 byte $79
 byte 1
 byte 9
 byte 0[1]
 long $460a975c ' float
 byte $7a
 byte 2
 byte 9
 byte 0[1]
 long $4612d514 ' float
 byte $7b
 byte 3
 byte 9
 byte 0[1]
 long $461b903d ' float
 byte $7c
 byte 4
 byte 9
 byte 0[1]
 long $4624d052 ' float
 byte $7d
 byte 5
 byte 9
 byte 0[1]
 long $462e9d33 ' float
 byte $7e
 byte 6
 byte 9
 byte 0[1]
 long $4638ff48 ' float
 byte $7f
 byte 7
 byte 9
 byte 0[1]
 long $4643ff66 ' float

' Catalina Code

DAT ' code segment
' end
