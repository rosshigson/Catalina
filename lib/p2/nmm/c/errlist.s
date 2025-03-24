' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export _sys_errlist

 alignl ' align long
C__sys_errlist ' <symbol:_sys_errlist>
 long @C_sjp4_67da4048_1_L000002
 long @C_sjp41_67da4048_3_L000004
 long @C_sjp42_67da4048_5_L000006
 long @C_sjp43_67da4048_7_L000008
 long @C_sjp44_67da4048_9_L000010
 long @C_sjp45_67da4048_11_L000012
 long @C_sjp46_67da4048_13_L000014
 long @C_sjp47_67da4048_15_L000016
 long @C_sjp48_67da4048_17_L000018
 long @C_sjp49_67da4048_19_L000020
 long @C_sjp4a_67da4048_21_L000022
 long @C_sjp4b_67da4048_23_L000024
 long @C_sjp4c_67da4048_25_L000026
 long @C_sjp4d_67da4048_27_L000028
 long @C_sjp4e_67da4048_29_L000030
 long @C_sjp4f_67da4048_31_L000032
 long @C_sjp4g_67da4048_33_L000034
 long @C_sjp4h_67da4048_35_L000036
 long @C_sjp4i_67da4048_37_L000038
 long @C_sjp4j_67da4048_39_L000040
 long @C_sjp4k_67da4048_41_L000042
 long @C_sjp4l_67da4048_43_L000044
 long @C_sjp4m_67da4048_45_L000046
 long @C_sjp4n_67da4048_47_L000048
 long @C_sjp4o_67da4048_49_L000050
 long @C_sjp4p_67da4048_51_L000052
 long @C_sjp4q_67da4048_53_L000054
 long @C_sjp4r_67da4048_55_L000056
 long @C_sjp4s_67da4048_57_L000058
 long @C_sjp4t_67da4048_59_L000060
 long @C_sjp4u_67da4048_61_L000062
 long @C_sjp4v_67da4048_63_L000064
 long @C_sjp410_67da4048_65_L000066
 long @C_sjp411_67da4048_67_L000068
 long @C_sjp412_67da4048_69_L000070

' Catalina Export _sys_nerr

 alignl ' align long
C__sys_nerr ' <symbol:_sys_nerr>
 long 35

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sjp412_67da4048_69_L000070 ' <symbol:69>
 byte 82
 byte 101
 byte 115
 byte 117
 byte 108
 byte 116
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 108
 byte 97
 byte 114
 byte 103
 byte 101
 byte 0

 alignl ' align long
C_sjp411_67da4048_67_L000068 ' <symbol:67>
 byte 77
 byte 97
 byte 116
 byte 104
 byte 32
 byte 97
 byte 114
 byte 103
 byte 117
 byte 109
 byte 101
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_sjp410_67da4048_65_L000066 ' <symbol:65>
 byte 66
 byte 114
 byte 111
 byte 107
 byte 101
 byte 110
 byte 32
 byte 112
 byte 105
 byte 112
 byte 101
 byte 0

 alignl ' align long
C_sjp4v_67da4048_63_L000064 ' <symbol:63>
 byte 84
 byte 111
 byte 111
 byte 32
 byte 109
 byte 97
 byte 110
 byte 121
 byte 32
 byte 108
 byte 105
 byte 110
 byte 107
 byte 115
 byte 0

 alignl ' align long
C_sjp4u_67da4048_61_L000062 ' <symbol:61>
 byte 82
 byte 101
 byte 97
 byte 100
 byte 45
 byte 111
 byte 110
 byte 108
 byte 121
 byte 32
 byte 102
 byte 105
 byte 108
 byte 101
 byte 32
 byte 115
 byte 121
 byte 115
 byte 116
 byte 101
 byte 109
 byte 0

 alignl ' align long
C_sjp4t_67da4048_59_L000060 ' <symbol:59>
 byte 73
 byte 108
 byte 108
 byte 101
 byte 103
 byte 97
 byte 108
 byte 32
 byte 115
 byte 101
 byte 101
 byte 107
 byte 0

 alignl ' align long
C_sjp4s_67da4048_57_L000058 ' <symbol:57>
 byte 78
 byte 111
 byte 32
 byte 115
 byte 112
 byte 97
 byte 99
 byte 101
 byte 32
 byte 108
 byte 101
 byte 102
 byte 116
 byte 32
 byte 111
 byte 110
 byte 32
 byte 100
 byte 101
 byte 118
 byte 105
 byte 99
 byte 101
 byte 0

 alignl ' align long
C_sjp4r_67da4048_55_L000056 ' <symbol:55>
 byte 70
 byte 105
 byte 108
 byte 101
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 108
 byte 97
 byte 114
 byte 103
 byte 101
 byte 0

 alignl ' align long
C_sjp4q_67da4048_53_L000054 ' <symbol:53>
 byte 84
 byte 101
 byte 120
 byte 116
 byte 32
 byte 102
 byte 105
 byte 108
 byte 101
 byte 32
 byte 98
 byte 117
 byte 115
 byte 121
 byte 0

 alignl ' align long
C_sjp4p_67da4048_51_L000052 ' <symbol:51>
 byte 78
 byte 111
 byte 116
 byte 32
 byte 97
 byte 32
 byte 116
 byte 121
 byte 112
 byte 101
 byte 119
 byte 114
 byte 105
 byte 116
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_sjp4o_67da4048_49_L000050 ' <symbol:49>
 byte 84
 byte 111
 byte 111
 byte 32
 byte 109
 byte 97
 byte 110
 byte 121
 byte 32
 byte 111
 byte 112
 byte 101
 byte 110
 byte 32
 byte 102
 byte 105
 byte 108
 byte 101
 byte 115
 byte 0

 alignl ' align long
C_sjp4n_67da4048_47_L000048 ' <symbol:47>
 byte 70
 byte 105
 byte 108
 byte 101
 byte 32
 byte 116
 byte 97
 byte 98
 byte 108
 byte 101
 byte 32
 byte 111
 byte 118
 byte 101
 byte 114
 byte 102
 byte 108
 byte 111
 byte 119
 byte 0

 alignl ' align long
C_sjp4m_67da4048_45_L000046 ' <symbol:45>
 byte 73
 byte 110
 byte 118
 byte 97
 byte 108
 byte 105
 byte 100
 byte 32
 byte 97
 byte 114
 byte 103
 byte 117
 byte 109
 byte 101
 byte 110
 byte 116
 byte 0

 alignl ' align long
C_sjp4l_67da4048_43_L000044 ' <symbol:43>
 byte 73
 byte 115
 byte 32
 byte 97
 byte 32
 byte 100
 byte 105
 byte 114
 byte 101
 byte 99
 byte 116
 byte 111
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_sjp4k_67da4048_41_L000042 ' <symbol:41>
 byte 78
 byte 111
 byte 116
 byte 32
 byte 97
 byte 32
 byte 100
 byte 105
 byte 114
 byte 101
 byte 99
 byte 116
 byte 111
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_sjp4j_67da4048_39_L000040 ' <symbol:39>
 byte 78
 byte 111
 byte 32
 byte 115
 byte 117
 byte 99
 byte 104
 byte 32
 byte 100
 byte 101
 byte 118
 byte 105
 byte 99
 byte 101
 byte 0

 alignl ' align long
C_sjp4i_67da4048_37_L000038 ' <symbol:37>
 byte 67
 byte 114
 byte 111
 byte 115
 byte 115
 byte 45
 byte 100
 byte 101
 byte 118
 byte 105
 byte 99
 byte 101
 byte 32
 byte 108
 byte 105
 byte 110
 byte 107
 byte 0

 alignl ' align long
C_sjp4h_67da4048_35_L000036 ' <symbol:35>
 byte 70
 byte 105
 byte 108
 byte 101
 byte 32
 byte 101
 byte 120
 byte 105
 byte 115
 byte 116
 byte 115
 byte 0

 alignl ' align long
C_sjp4g_67da4048_33_L000034 ' <symbol:33>
 byte 77
 byte 111
 byte 117
 byte 110
 byte 116
 byte 32
 byte 100
 byte 101
 byte 118
 byte 105
 byte 99
 byte 101
 byte 32
 byte 98
 byte 117
 byte 115
 byte 121
 byte 0

 alignl ' align long
C_sjp4f_67da4048_31_L000032 ' <symbol:31>
 byte 66
 byte 108
 byte 111
 byte 99
 byte 107
 byte 32
 byte 100
 byte 101
 byte 118
 byte 105
 byte 99
 byte 101
 byte 32
 byte 114
 byte 101
 byte 113
 byte 117
 byte 105
 byte 114
 byte 101
 byte 100
 byte 0

 alignl ' align long
C_sjp4e_67da4048_29_L000030 ' <symbol:29>
 byte 66
 byte 97
 byte 100
 byte 32
 byte 97
 byte 100
 byte 100
 byte 114
 byte 101
 byte 115
 byte 115
 byte 0

 alignl ' align long
C_sjp4d_67da4048_27_L000028 ' <symbol:27>
 byte 80
 byte 101
 byte 114
 byte 109
 byte 105
 byte 115
 byte 115
 byte 105
 byte 111
 byte 110
 byte 32
 byte 100
 byte 101
 byte 110
 byte 105
 byte 101
 byte 100
 byte 0

 alignl ' align long
C_sjp4c_67da4048_25_L000026 ' <symbol:25>
 byte 78
 byte 111
 byte 116
 byte 32
 byte 101
 byte 110
 byte 111
 byte 117
 byte 103
 byte 104
 byte 32
 byte 99
 byte 111
 byte 114
 byte 101
 byte 0

 alignl ' align long
C_sjp4b_67da4048_23_L000024 ' <symbol:23>
 byte 78
 byte 111
 byte 32
 byte 109
 byte 111
 byte 114
 byte 101
 byte 32
 byte 112
 byte 114
 byte 111
 byte 99
 byte 101
 byte 115
 byte 115
 byte 101
 byte 115
 byte 0

 alignl ' align long
C_sjp4a_67da4048_21_L000022 ' <symbol:21>
 byte 78
 byte 111
 byte 32
 byte 99
 byte 104
 byte 105
 byte 108
 byte 100
 byte 114
 byte 101
 byte 110
 byte 0

 alignl ' align long
C_sjp49_67da4048_19_L000020 ' <symbol:19>
 byte 66
 byte 97
 byte 100
 byte 32
 byte 102
 byte 105
 byte 108
 byte 101
 byte 32
 byte 110
 byte 117
 byte 109
 byte 98
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_sjp48_67da4048_17_L000018 ' <symbol:17>
 byte 69
 byte 120
 byte 101
 byte 99
 byte 32
 byte 102
 byte 111
 byte 114
 byte 109
 byte 97
 byte 116
 byte 32
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 0

 alignl ' align long
C_sjp47_67da4048_15_L000016 ' <symbol:15>
 byte 65
 byte 114
 byte 103
 byte 32
 byte 108
 byte 105
 byte 115
 byte 116
 byte 32
 byte 116
 byte 111
 byte 111
 byte 32
 byte 108
 byte 111
 byte 110
 byte 103
 byte 0

 alignl ' align long
C_sjp46_67da4048_13_L000014 ' <symbol:13>
 byte 78
 byte 111
 byte 32
 byte 115
 byte 117
 byte 99
 byte 104
 byte 32
 byte 100
 byte 101
 byte 118
 byte 105
 byte 99
 byte 101
 byte 32
 byte 111
 byte 114
 byte 32
 byte 97
 byte 100
 byte 100
 byte 114
 byte 101
 byte 115
 byte 115
 byte 0

 alignl ' align long
C_sjp45_67da4048_11_L000012 ' <symbol:11>
 byte 73
 byte 47
 byte 79
 byte 32
 byte 101
 byte 114
 byte 114
 byte 111
 byte 114
 byte 0

 alignl ' align long
C_sjp44_67da4048_9_L000010 ' <symbol:9>
 byte 73
 byte 110
 byte 116
 byte 101
 byte 114
 byte 114
 byte 117
 byte 112
 byte 116
 byte 101
 byte 100
 byte 32
 byte 115
 byte 121
 byte 115
 byte 116
 byte 101
 byte 109
 byte 32
 byte 99
 byte 97
 byte 108
 byte 108
 byte 0

 alignl ' align long
C_sjp43_67da4048_7_L000008 ' <symbol:7>
 byte 78
 byte 111
 byte 32
 byte 115
 byte 117
 byte 99
 byte 104
 byte 32
 byte 112
 byte 114
 byte 111
 byte 99
 byte 101
 byte 115
 byte 115
 byte 0

 alignl ' align long
C_sjp42_67da4048_5_L000006 ' <symbol:5>
 byte 78
 byte 111
 byte 32
 byte 115
 byte 117
 byte 99
 byte 104
 byte 32
 byte 102
 byte 105
 byte 108
 byte 101
 byte 32
 byte 111
 byte 114
 byte 32
 byte 100
 byte 105
 byte 114
 byte 101
 byte 99
 byte 116
 byte 111
 byte 114
 byte 121
 byte 0

 alignl ' align long
C_sjp41_67da4048_3_L000004 ' <symbol:3>
 byte 78
 byte 111
 byte 116
 byte 32
 byte 111
 byte 119
 byte 110
 byte 101
 byte 114
 byte 0

 alignl ' align long
C_sjp4_67da4048_1_L000002 ' <symbol:1>
 byte 69
 byte 114
 byte 114
 byte 111
 byte 114
 byte 32
 byte 48
 byte 0

' Catalina Code

DAT ' code segment
' end
