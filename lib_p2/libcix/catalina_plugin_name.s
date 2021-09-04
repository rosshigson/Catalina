' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _plugin_name

 alignl ' align long
C__plugin_name ' <symbol:_plugin_name>
 PRIMITIVE(#PSHM)
 long $500000 ' save registers
 cmps r2,  #0 wcz
 PRIMITIVE(#BR_B)
 long @C__plugin_name_3 ' LTI4
 cmps r2,  #25 wcz
 PRIMITIVE(#BR_A)
 long @C__plugin_name_88 ' GTI4
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 PRIMITIVE(#LODL)
 long @C__plugin_name_89_L000091
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong RI, r22
 PRIMITIVE(#JMPI) ' JUMPV INDIR reg

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__plugin_name_89_L000091 ' <symbol:89>
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

' Catalina Code

DAT ' code segment
C__plugin_name_88
 cmps r2,  #255 wz
 PRIMITIVE(#BR_Z)
 long @C__plugin_name_83 ' EQI4
 PRIMITIVE(#JMPA)
 long @C__plugin_name_3 ' JUMPV addrg
C__plugin_name_5
 PRIMITIVE(#LODL)
 long @C__plugin_name_6_L000007
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_8
 PRIMITIVE(#LODL)
 long @C__plugin_name_9_L000010
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_11
 PRIMITIVE(#LODL)
 long @C__plugin_name_12_L000013
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_14
 PRIMITIVE(#LODL)
 long @C__plugin_name_15_L000016
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_17
 PRIMITIVE(#LODL)
 long @C__plugin_name_18_L000019
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_20
 PRIMITIVE(#LODL)
 long @C__plugin_name_21_L000022
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_23
 PRIMITIVE(#LODL)
 long @C__plugin_name_24_L000025
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_26
 PRIMITIVE(#LODL)
 long @C__plugin_name_27_L000028
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_29
 PRIMITIVE(#LODL)
 long @C__plugin_name_30_L000031
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_32
 PRIMITIVE(#LODL)
 long @C__plugin_name_33_L000034
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_35
 PRIMITIVE(#LODL)
 long @C__plugin_name_36_L000037
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_38
 PRIMITIVE(#LODL)
 long @C__plugin_name_39_L000040
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_41
 PRIMITIVE(#LODL)
 long @C__plugin_name_42_L000043
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_44
 PRIMITIVE(#LODL)
 long @C__plugin_name_45_L000046
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_47
 PRIMITIVE(#LODL)
 long @C__plugin_name_48_L000049
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_50
 PRIMITIVE(#LODL)
 long @C__plugin_name_51_L000052
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_53
 PRIMITIVE(#LODL)
 long @C__plugin_name_54_L000055
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_56
 PRIMITIVE(#LODL)
 long @C__plugin_name_57_L000058
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_59
 PRIMITIVE(#LODL)
 long @C__plugin_name_60_L000061
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_62
 PRIMITIVE(#LODL)
 long @C__plugin_name_63_L000064
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_65
 PRIMITIVE(#LODL)
 long @C__plugin_name_66_L000067
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_68
 PRIMITIVE(#LODL)
 long @C__plugin_name_69_L000070
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_71
 PRIMITIVE(#LODL)
 long @C__plugin_name_72_L000073
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_74
 PRIMITIVE(#LODL)
 long @C__plugin_name_75_L000076
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_77
 PRIMITIVE(#LODL)
 long @C__plugin_name_78_L000079
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_80
 PRIMITIVE(#LODL)
 long @C__plugin_name_81_L000082
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_83
 PRIMITIVE(#LODL)
 long @C__plugin_name_84_L000085
 mov r0, RI ' reg <- addrg
 PRIMITIVE(#JMPA)
 long @C__plugin_name_2 ' JUMPV addrg
C__plugin_name_3
 PRIMITIVE(#LODL)
 long @C__plugin_name_86_L000087
 mov r0, RI ' reg <- addrg
C__plugin_name_2
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__plugin_name_86_L000087 ' <symbol:86>
 byte 85
 byte 110
 byte 107
 byte 110
 byte 111
 byte 119
 byte 110
 byte 0

 alignl ' align long
C__plugin_name_84_L000085 ' <symbol:84>
 byte 78
 byte 111
 byte 110
 byte 101
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
