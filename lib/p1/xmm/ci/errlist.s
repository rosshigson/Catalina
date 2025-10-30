' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export _sys_errlist

 alignl ' align long
C__sys_errlist ' <symbol:_sys_errlist>
 long @C_s80c_68fd7600_1_L000002
 long @C_s80c1_68fd7600_3_L000004
 long @C_s80c2_68fd7600_5_L000006
 long @C_s80c3_68fd7600_7_L000008
 long @C_s80c4_68fd7600_9_L000010
 long @C_s80c5_68fd7600_11_L000012
 long @C_s80c6_68fd7600_13_L000014
 long @C_s80c7_68fd7600_15_L000016
 long @C_s80c8_68fd7600_17_L000018
 long @C_s80c9_68fd7600_19_L000020
 long @C_s80ca_68fd7600_21_L000022
 long @C_s80cb_68fd7600_23_L000024
 long @C_s80cc_68fd7600_25_L000026
 long @C_s80cd_68fd7600_27_L000028
 long @C_s80ce_68fd7600_29_L000030
 long @C_s80cf_68fd7600_31_L000032
 long @C_s80cg_68fd7600_33_L000034
 long @C_s80ch_68fd7600_35_L000036
 long @C_s80ci_68fd7600_37_L000038
 long @C_s80cj_68fd7600_39_L000040
 long @C_s80ck_68fd7600_41_L000042
 long @C_s80cl_68fd7600_43_L000044
 long @C_s80cm_68fd7600_45_L000046
 long @C_s80cn_68fd7600_47_L000048
 long @C_s80co_68fd7600_49_L000050
 long @C_s80cp_68fd7600_51_L000052
 long @C_s80cq_68fd7600_53_L000054
 long @C_s80cr_68fd7600_55_L000056
 long @C_s80cs_68fd7600_57_L000058
 long @C_s80ct_68fd7600_59_L000060
 long @C_s80cu_68fd7600_61_L000062
 long @C_s80cv_68fd7600_63_L000064
 long @C_s80c10_68fd7600_65_L000066
 long @C_s80c11_68fd7600_67_L000068
 long @C_s80c12_68fd7600_69_L000070

' Catalina Export _sys_nerr

 alignl ' align long
C__sys_nerr ' <symbol:_sys_nerr>
 long 35

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_s80c12_68fd7600_69_L000070 ' <symbol:69>
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
C_s80c11_68fd7600_67_L000068 ' <symbol:67>
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
C_s80c10_68fd7600_65_L000066 ' <symbol:65>
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
C_s80cv_68fd7600_63_L000064 ' <symbol:63>
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
C_s80cu_68fd7600_61_L000062 ' <symbol:61>
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
C_s80ct_68fd7600_59_L000060 ' <symbol:59>
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
C_s80cs_68fd7600_57_L000058 ' <symbol:57>
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
C_s80cr_68fd7600_55_L000056 ' <symbol:55>
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
C_s80cq_68fd7600_53_L000054 ' <symbol:53>
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
C_s80cp_68fd7600_51_L000052 ' <symbol:51>
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
C_s80co_68fd7600_49_L000050 ' <symbol:49>
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
C_s80cn_68fd7600_47_L000048 ' <symbol:47>
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
C_s80cm_68fd7600_45_L000046 ' <symbol:45>
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
C_s80cl_68fd7600_43_L000044 ' <symbol:43>
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
C_s80ck_68fd7600_41_L000042 ' <symbol:41>
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
C_s80cj_68fd7600_39_L000040 ' <symbol:39>
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
C_s80ci_68fd7600_37_L000038 ' <symbol:37>
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
C_s80ch_68fd7600_35_L000036 ' <symbol:35>
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
C_s80cg_68fd7600_33_L000034 ' <symbol:33>
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
C_s80cf_68fd7600_31_L000032 ' <symbol:31>
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
C_s80ce_68fd7600_29_L000030 ' <symbol:29>
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
C_s80cd_68fd7600_27_L000028 ' <symbol:27>
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
C_s80cc_68fd7600_25_L000026 ' <symbol:25>
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
C_s80cb_68fd7600_23_L000024 ' <symbol:23>
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
C_s80ca_68fd7600_21_L000022 ' <symbol:21>
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
C_s80c9_68fd7600_19_L000020 ' <symbol:19>
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
C_s80c8_68fd7600_17_L000018 ' <symbol:17>
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
C_s80c7_68fd7600_15_L000016 ' <symbol:15>
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
C_s80c6_68fd7600_13_L000014 ' <symbol:13>
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
C_s80c5_68fd7600_11_L000012 ' <symbol:11>
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
C_s80c4_68fd7600_9_L000010 ' <symbol:9>
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
C_s80c3_68fd7600_7_L000008 ' <symbol:7>
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
C_s80c2_68fd7600_5_L000006 ' <symbol:5>
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
C_s80c1_68fd7600_3_L000004 ' <symbol:3>
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
C_s80c_68fd7600_1_L000002 ' <symbol:1>
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
