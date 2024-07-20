' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _plugin_name

 alignl ' align long
C__plugin_name ' <symbol:_plugin_name>
 jmp #PSHM
 long $500000 ' save registers
 cmps r2,  #0 wz,wc
 jmp #BR_B
 long @C__plugin_name_3 ' LTI4
 cmps r2,  #32 wz,wc
 jmp #BR_A
 long @C__plugin_name_109 ' GTI4
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C__plugin_name_110_L000112
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov RI, BC
 jmp #JMPI ' JUMPV reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__plugin_name_110_L000112 ' <symbol:110>
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

' Catalina Code

DAT ' code segment
C__plugin_name_109
 cmps r2,  #255 wz
 jmp #BR_Z
 long @C__plugin_name_104 ' EQI4
 jmp #JMPA
 long @C__plugin_name_3 ' JUMPV addrg
C__plugin_name_5
 jmp #LODL
 long @C__plugin_name_6_L000007
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_8
 jmp #LODL
 long @C__plugin_name_9_L000010
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_11
 jmp #LODL
 long @C__plugin_name_12_L000013
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_14
 jmp #LODL
 long @C__plugin_name_15_L000016
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_17
 jmp #LODL
 long @C__plugin_name_18_L000019
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_20
 jmp #LODL
 long @C__plugin_name_21_L000022
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_23
 jmp #LODL
 long @C__plugin_name_24_L000025
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_26
 jmp #LODL
 long @C__plugin_name_27_L000028
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_29
 jmp #LODL
 long @C__plugin_name_30_L000031
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_32
 jmp #LODL
 long @C__plugin_name_33_L000034
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_35
 jmp #LODL
 long @C__plugin_name_36_L000037
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_38
 jmp #LODL
 long @C__plugin_name_39_L000040
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_41
 jmp #LODL
 long @C__plugin_name_42_L000043
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_44
 jmp #LODL
 long @C__plugin_name_45_L000046
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_47
 jmp #LODL
 long @C__plugin_name_48_L000049
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_50
 jmp #LODL
 long @C__plugin_name_51_L000052
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_53
 jmp #LODL
 long @C__plugin_name_54_L000055
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_56
 jmp #LODL
 long @C__plugin_name_57_L000058
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_59
 jmp #LODL
 long @C__plugin_name_60_L000061
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_62
 jmp #LODL
 long @C__plugin_name_63_L000064
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_65
 jmp #LODL
 long @C__plugin_name_66_L000067
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_68
 jmp #LODL
 long @C__plugin_name_69_L000070
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_71
 jmp #LODL
 long @C__plugin_name_72_L000073
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_74
 jmp #LODL
 long @C__plugin_name_75_L000076
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_77
 jmp #LODL
 long @C__plugin_name_78_L000079
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_80
 jmp #LODL
 long @C__plugin_name_81_L000082
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_83
 jmp #LODL
 long @C__plugin_name_84_L000085
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_86
 jmp #LODL
 long @C__plugin_name_87_L000088
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_89
 jmp #LODL
 long @C__plugin_name_90_L000091
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_92
 jmp #LODL
 long @C__plugin_name_93_L000094
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_95
 jmp #LODL
 long @C__plugin_name_96_L000097
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_98
 jmp #LODL
 long @C__plugin_name_99_L000100
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_101
 jmp #LODL
 long @C__plugin_name_102_L000103
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_104
 jmp #LODL
 long @C__plugin_name_105_L000106
 mov r0, RI ' reg <- addrg
 jmp #JMPA
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_3
 jmp #LODL
 long @C__plugin_name_107_L000108
 mov r0, RI ' reg <- addrg
C__plugin_name_2
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__plugin_name_107_L000108 ' <symbol:107>
 byte 85
 byte 110
 byte 107
 byte 110
 byte 111
 byte 119
 byte 110
 byte 0

 alignl ' align long
C__plugin_name_105_L000106 ' <symbol:105>
 byte 78
 byte 111
 byte 110
 byte 101
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
