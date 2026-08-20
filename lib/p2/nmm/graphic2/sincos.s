' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_saj8_6a858bf3_sin_table_L000004 ' <symbol:sin_table>
 word $0
 word $0
 word $477
 word $8ef
 word $8ef
 word $d65
 word $11db
 word $11db
 word $164f
 word $1ac2
 word $1f32
 word $1f32
 word $23a0
 word $280c
 word $280c
 word $2c74
 word $30d8
 word $30d8
 word $3539
 word $3996
 word $3dee
 word $3dee
 word $4241
 word $4690
 word $4690
 word $4ad8
 word $4f1b
 word $4f1b
 word $5358
 word $578e
 word $5bbe
 word $5bbe
 word $5fe6
 word $6406
 word $6406
 word $681f
 word $6c30
 word $7039
 word $7039
 word $7438
 word $782f
 word $782f
 word $7c1c
 word $8000
 word $8000
 word $83d9
 word $87a8
 word $8b6d
 word $8b6d
 word $8f27
 word $92d5
 word $92d5
 word $9679
 word $9a10
 word $9a10
 word $9d9b
 word $a11b
 word $a48d
 word $a48d
 word $a7f3
 word $ab4c
 word $ab4c
 word $ae97
 word $b1d5
 word $b504
 word $b504
 word $b826
 word $bb39
 word $bb39
 word $be3e
 word $c134
 word $c134
 word $c41b
 word $c6f3
 word $c9bb
 word $c9bb
 word $cc73
 word $cf1b
 word $cf1b
 word $d1b3
 word $d43b
 word $d43b
 word $d6b3
 word $d919
 word $db6f
 word $db6f
 word $ddb3
 word $dfe7
 word $dfe7
 word $e208
 word $e419
 word $e419
 word $e617
 word $e803
 word $e9de
 word $e9de
 word $eba6
 word $ed5b
 word $ed5b
 word $eeff
 word $f08f
 word $f20d
 word $f20d
 word $f378
 word $f4d0
 word $f4d0
 word $f615
 word $f746
 word $f746
 word $f865
 word $f970
 word $fa67
 word $fa67
 word $fb4b
 word $fc1c
 word $fc1c
 word $fcd9
 word $fd82
 word $fd82
 word $fe17
 word $fe98
 word $ff06
 word $ff06
 word $ff60
 word $ffa6
 word $ffa6
 word $ffd8
 word $fff6
 word $ffff

' Catalina Export g_sin

' Catalina Code

DAT ' code segment

 alignl ' align long
C_g_sin ' <symbol:g_sin>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, ##8191 ' reg <- con
 and r2, r22 ' BANDI/U (1)
 mov r22, ##4096 ' reg <- con
 cmp r2, r22 wcz 
 if_b jmp #\C_g_sin_6 ' LTU4
 mov r22, ##4095 ' reg <- con
 and r2, r22 ' BANDI/U (1)
 mov r22, ##2048 ' reg <- con
 cmp r2, r22 wcz 
 if_b jmp #\C_g_sin_8 ' LTU4
 mov r22, ##4096 ' reg <- con
 mov RI, r22
 sub RI, r2
 mov r2, RI ' SUBU (2)
C_g_sin_8
 shr r2, #4 ' RSHU4 coni
 mov r22, r2
 shl r22, #1 ' LSHU4 coni
 mov r20, ##@C_saj8_6a858bf3_sin_table_L000004 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 neg r22, r22 ' NEGI4
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_g_sin_5 ' JUMPV addrg
C_g_sin_6
 mov r22, ##2048 ' reg <- con
 cmp r2, r22 wcz 
 if_b jmp #\C_g_sin_10 ' LTU4
 mov r22, ##4096 ' reg <- con
 mov RI, r22
 sub RI, r2
 mov r2, RI ' SUBU (2)
C_g_sin_10
 mov r22, ##4095 ' reg <- con
 and r2, r22 ' BANDI/U (1)
 shr r2, #4 ' RSHU4 coni
 mov r22, r2
 shl r22, #1 ' LSHU4 coni
 mov r20, ##@C_saj8_6a858bf3_sin_table_L000004 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 mov r0, r22 ' CVI, CVU or LOAD
C_g_sin_5
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export g_cos

 alignl ' align long
C_g_cos ' <symbol:g_cos>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, ##2048 ' reg <- con
 mov r2, r23 ' ADDU
 add r2, r22 ' ADDU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_g_sin ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_g_cos_12 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF

' end
