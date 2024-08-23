' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _plugin_name

 alignl ' align long
C__plugin_name ' <symbol:_plugin_name>
 calld PA,#PSHM
 long $500000 ' save registers
 cmps r2,  #0 wcz
 if_b jmp #\C__plugin_name_3 ' LTI4
 cmps r2,  #33 wcz
 if_a jmp #\C__plugin_name_112 ' GTI4
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C__plugin_name_113_L000115 ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 jmp RI ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__plugin_name_113_L000115 ' <symbol:113>
 long @C__plugin_name_5
 long @C__plugin_name_8
 long @C__plugin_name_11
 long @C__plugin_name_14
 long @C__plugin_name_17
 long @C__plugin_name_20
 long @C__plugin_name_23
 long @C__plugin_name_26
 long @C__plugin_name_29
 long @C__plugin_name_32
 long @C__plugin_name_35
 long @C__plugin_name_38
 long @C__plugin_name_41
 long @C__plugin_name_44
 long @C__plugin_name_47
 long @C__plugin_name_50
 long @C__plugin_name_53
 long @C__plugin_name_56
 long @C__plugin_name_59
 long @C__plugin_name_62
 long @C__plugin_name_65
 long @C__plugin_name_68
 long @C__plugin_name_71
 long @C__plugin_name_74
 long @C__plugin_name_77
 long @C__plugin_name_80
 long @C__plugin_name_83
 long @C__plugin_name_86
 long @C__plugin_name_89
 long @C__plugin_name_92
 long @C__plugin_name_95
 long @C__plugin_name_98
 long @C__plugin_name_101
 long @C__plugin_name_104

' Catalina Code

DAT ' code segment
C__plugin_name_112
 cmps r2,  #255 wz
 if_z jmp #\C__plugin_name_107 ' EQI4
 jmp #\@C__plugin_name_3 ' JUMPV addrg
C__plugin_name_5
 mov r0, ##@C__plugin_name_6_L000007 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_8
 mov r0, ##@C__plugin_name_9_L000010 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_11
 mov r0, ##@C__plugin_name_12_L000013 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_14
 mov r0, ##@C__plugin_name_15_L000016 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_17
 mov r0, ##@C__plugin_name_18_L000019 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_20
 mov r0, ##@C__plugin_name_21_L000022 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_23
 mov r0, ##@C__plugin_name_24_L000025 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_26
 mov r0, ##@C__plugin_name_27_L000028 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_29
 mov r0, ##@C__plugin_name_30_L000031 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_32
 mov r0, ##@C__plugin_name_33_L000034 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_35
 mov r0, ##@C__plugin_name_36_L000037 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_38
 mov r0, ##@C__plugin_name_39_L000040 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_41
 mov r0, ##@C__plugin_name_42_L000043 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_44
 mov r0, ##@C__plugin_name_45_L000046 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_47
 mov r0, ##@C__plugin_name_48_L000049 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_50
 mov r0, ##@C__plugin_name_51_L000052 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_53
 mov r0, ##@C__plugin_name_54_L000055 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_56
 mov r0, ##@C__plugin_name_57_L000058 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_59
 mov r0, ##@C__plugin_name_60_L000061 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_62
 mov r0, ##@C__plugin_name_63_L000064 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_65
 mov r0, ##@C__plugin_name_66_L000067 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_68
 mov r0, ##@C__plugin_name_69_L000070 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_71
 mov r0, ##@C__plugin_name_72_L000073 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_74
 mov r0, ##@C__plugin_name_75_L000076 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_77
 mov r0, ##@C__plugin_name_78_L000079 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_80
 mov r0, ##@C__plugin_name_81_L000082 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_83
 mov r0, ##@C__plugin_name_84_L000085 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_86
 mov r0, ##@C__plugin_name_87_L000088 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_89
 mov r0, ##@C__plugin_name_90_L000091 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_92
 mov r0, ##@C__plugin_name_93_L000094 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_95
 mov r0, ##@C__plugin_name_96_L000097 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_98
 mov r0, ##@C__plugin_name_99_L000100 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_101
 mov r0, ##@C__plugin_name_102_L000103 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_104
 mov r0, ##@C__plugin_name_105_L000106 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_107
 mov r0, ##@C__plugin_name_108_L000109 ' reg <- addrg
 jmp #\@C__plugin_name_2 ' JUMPV addrg
C__plugin_name_3
 mov r0, ##@C__plugin_name_110_L000111 ' reg <- addrg
C__plugin_name_2
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__plugin_name_110_L000111 ' <symbol:110>
 byte 85
 byte 110
 byte 107
 byte 110
 byte 111
 byte 119
 byte 110
 byte 0

 alignl ' align long
C__plugin_name_108_L000109 ' <symbol:108>
 byte 78
 byte 111
 byte 110
 byte 101
 byte 0

 alignl ' align long
C__plugin_name_105_L000106 ' <symbol:105>
 byte 67
 byte 47
 byte 76
 byte 117
 byte 97
 byte 32
 byte 83
 byte 101
 byte 114
 byte 118
 byte 101
 byte 114
 byte 0

 alignl ' align long
C__plugin_name_102_L000103 ' <symbol:102>
 byte 82
 byte 97
 byte 110
 byte 100
 byte 111
 byte 109
 byte 32
 byte 78
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 32
 byte 71
 byte 101
 byte 110
 byte 101
 byte 114
 byte 97
 byte 116
 byte 111
 byte 114
 byte 0

 alignl ' align long
C__plugin_name_99_L000100 ' <symbol:99>
 byte 80
 byte 50
 byte 80
 byte 32
 byte 66
 byte 117
 byte 115
 byte 0

 alignl ' align long
C__plugin_name_96_L000097 ' <symbol:96>
 byte 67
 byte 111
 byte 103
 byte 83
 byte 116
 byte 111
 byte 114
 byte 101
 byte 0

 alignl ' align long
C__plugin_name_93_L000094 ' <symbol:93>
 byte 88
 byte 77
 byte 77
 byte 32
 byte 67
 byte 97
 byte 99
 byte 104
 byte 101
 byte 0

 alignl ' align long
C__plugin_name_90_L000091 ' <symbol:90>
 byte 80
 byte 83
 byte 82
 byte 65
 byte 77
 byte 32
 byte 77
 byte 101
 byte 109
 byte 111
 byte 114
 byte 121
 byte 32
 byte 40
 byte 49
 byte 54
 byte 32
 byte 66
 byte 105
 byte 116
 byte 41
 byte 0

 alignl ' align long
C__plugin_name_87_L000088 ' <symbol:87>
 byte 83
 byte 82
 byte 65
 byte 77
 byte 32
 byte 77
 byte 101
 byte 109
 byte 111
 byte 114
 byte 121
 byte 32
 byte 40
 byte 56
 byte 32
 byte 66
 byte 105
 byte 116
 byte 41
 byte 0

 alignl ' align long
C__plugin_name_84_L000085 ' <symbol:84>
 byte 72
 byte 121
 byte 112
 byte 101
 byte 114
 byte 82
 byte 97
 byte 109
 byte 47
 byte 72
 byte 121
 byte 112
 byte 101
 byte 114
 byte 70
 byte 108
 byte 97
 byte 115
 byte 104
 byte 0

 alignl ' align long
C__plugin_name_81_L000082 ' <symbol:81>
 byte 56
 byte 32
 byte 80
 byte 111
 byte 114
 byte 116
 byte 32
 byte 83
 byte 101
 byte 114
 byte 105
 byte 97
 byte 108
 byte 32
 byte 65
 byte 0

 alignl ' align long
C__plugin_name_78_L000079 ' <symbol:78>
 byte 50
 byte 32
 byte 80
 byte 111
 byte 114
 byte 116
 byte 32
 byte 83
 byte 101
 byte 114
 byte 105
 byte 97
 byte 108
 byte 32
 byte 66
 byte 0

 alignl ' align long
C__plugin_name_75_L000076 ' <symbol:75>
 byte 50
 byte 32
 byte 80
 byte 111
 byte 114
 byte 116
 byte 32
 byte 83
 byte 101
 byte 114
 byte 105
 byte 97
 byte 108
 byte 32
 byte 65
 byte 0

 alignl ' align long
C__plugin_name_72_L000073 ' <symbol:72>
 byte 70
 byte 108
 byte 111
 byte 97
 byte 116
 byte 95
 byte 67
 byte 0

 alignl ' align long
C__plugin_name_69_L000070 ' <symbol:69>
 byte 83
 byte 80
 byte 73
 byte 47
 byte 73
 byte 50
 byte 67
 byte 0

 alignl ' align long
C__plugin_name_66_L000067 ' <symbol:66>
 byte 86
 byte 105
 byte 114
 byte 116
 byte 117
 byte 97
 byte 108
 byte 32
 byte 68
 byte 111
 byte 117
 byte 98
 byte 108
 byte 101
 byte 32
 byte 66
 byte 117
 byte 102
 byte 102
 byte 101
 byte 114
 byte 0

 alignl ' align long
C__plugin_name_63_L000064 ' <symbol:63>
 byte 86
 byte 105
 byte 114
 byte 116
 byte 117
 byte 97
 byte 108
 byte 32
 byte 71
 byte 114
 byte 97
 byte 112
 byte 104
 byte 105
 byte 99
 byte 115
 byte 0

 alignl ' align long
C__plugin_name_60_L000061 ' <symbol:60>
 byte 70
 byte 117
 byte 108
 byte 108
 byte 32
 byte 68
 byte 117
 byte 112
 byte 108
 byte 101
 byte 120
 byte 32
 byte 83
 byte 101
 byte 114
 byte 105
 byte 97
 byte 108
 byte 0

 alignl ' align long
C__plugin_name_57_L000058 ' <symbol:57>
 byte 52
 byte 32
 byte 80
 byte 111
 byte 114
 byte 116
 byte 32
 byte 83
 byte 101
 byte 114
 byte 105
 byte 97
 byte 108
 byte 0

 alignl ' align long
C__plugin_name_54_L000055 ' <symbol:54>
 byte 65
 byte 47
 byte 68
 byte 32
 byte 67
 byte 111
 byte 110
 byte 118
 byte 101
 byte 114
 byte 116
 byte 101
 byte 114
 byte 0

 alignl ' align long
C__plugin_name_51_L000052 ' <symbol:51>
 byte 83
 byte 111
 byte 117
 byte 110
 byte 100
 byte 0

 alignl ' align long
C__plugin_name_48_L000049 ' <symbol:48>
 byte 71
 byte 97
 byte 109
 byte 101
 byte 112
 byte 97
 byte 100
 byte 0

 alignl ' align long
C__plugin_name_45_L000046 ' <symbol:45>
 byte 80
 byte 114
 byte 111
 byte 120
 byte 121
 byte 0

 alignl ' align long
C__plugin_name_42_L000043 ' <symbol:42>
 byte 77
 byte 111
 byte 117
 byte 115
 byte 101
 byte 0

 alignl ' align long
C__plugin_name_39_L000040 ' <symbol:39>
 byte 83
 byte 99
 byte 114
 byte 101
 byte 101
 byte 110
 byte 0

 alignl ' align long
C__plugin_name_36_L000037 ' <symbol:36>
 byte 75
 byte 101
 byte 121
 byte 98
 byte 111
 byte 97
 byte 114
 byte 100
 byte 0

 alignl ' align long
C__plugin_name_33_L000034 ' <symbol:33>
 byte 71
 byte 114
 byte 97
 byte 112
 byte 104
 byte 105
 byte 99
 byte 115
 byte 0

 alignl ' align long
C__plugin_name_30_L000031 ' <symbol:30>
 byte 68
 byte 117
 byte 109
 byte 109
 byte 121
 byte 0

 alignl ' align long
C__plugin_name_27_L000028 ' <symbol:27>
 byte 83
 byte 101
 byte 114
 byte 105
 byte 97
 byte 108
 byte 32
 byte 73
 byte 47
 byte 79
 byte 0

 alignl ' align long
C__plugin_name_24_L000025 ' <symbol:24>
 byte 83
 byte 68
 byte 32
 byte 70
 byte 105
 byte 108
 byte 101
 byte 32
 byte 83
 byte 121
 byte 115
 byte 116
 byte 101
 byte 109
 byte 0

 alignl ' align long
C__plugin_name_21_L000022 ' <symbol:21>
 byte 82
 byte 101
 byte 97
 byte 108
 byte 45
 byte 84
 byte 105
 byte 109
 byte 101
 byte 32
 byte 67
 byte 108
 byte 111
 byte 99
 byte 107
 byte 0

 alignl ' align long
C__plugin_name_18_L000019 ' <symbol:18>
 byte 70
 byte 108
 byte 111
 byte 97
 byte 116
 byte 95
 byte 66
 byte 0

 alignl ' align long
C__plugin_name_15_L000016 ' <symbol:15>
 byte 70
 byte 108
 byte 111
 byte 97
 byte 116
 byte 95
 byte 65
 byte 0

 alignl ' align long
C__plugin_name_12_L000013 ' <symbol:12>
 byte 76
 byte 105
 byte 98
 byte 114
 byte 97
 byte 114
 byte 121
 byte 0

 alignl ' align long
C__plugin_name_9_L000010 ' <symbol:9>
 byte 72
 byte 77
 byte 73
 byte 0

 alignl ' align long
C__plugin_name_6_L000007 ' <symbol:6>
 byte 75
 byte 101
 byte 114
 byte 110
 byte 101
 byte 108
 byte 0

' Catalina Code

DAT ' code segment
' end
