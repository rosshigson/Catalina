' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export _sys_errlist

 alignl ' align long
C__sys_errlist ' <symbol:_sys_errlist>
 long @C_sfmk_67caca1f_1_L000002
 long @C_sfmk1_67caca1f_3_L000004
 long @C_sfmk2_67caca1f_5_L000006
 long @C_sfmk3_67caca1f_7_L000008
 long @C_sfmk4_67caca1f_9_L000010
 long @C_sfmk5_67caca1f_11_L000012
 long @C_sfmk6_67caca1f_13_L000014
 long @C_sfmk7_67caca1f_15_L000016
 long @C_sfmk8_67caca1f_17_L000018
 long @C_sfmk9_67caca1f_19_L000020
 long @C_sfmka_67caca1f_21_L000022
 long @C_sfmkb_67caca1f_23_L000024
 long @C_sfmkc_67caca1f_25_L000026
 long @C_sfmkd_67caca1f_27_L000028
 long @C_sfmke_67caca1f_29_L000030
 long @C_sfmkf_67caca1f_31_L000032
 long @C_sfmkg_67caca1f_33_L000034
 long @C_sfmkh_67caca1f_35_L000036
 long @C_sfmki_67caca1f_37_L000038
 long @C_sfmkj_67caca1f_39_L000040
 long @C_sfmkk_67caca1f_41_L000042
 long @C_sfmkl_67caca1f_43_L000044
 long @C_sfmkm_67caca1f_45_L000046
 long @C_sfmkn_67caca1f_47_L000048
 long @C_sfmko_67caca1f_49_L000050
 long @C_sfmkp_67caca1f_51_L000052
 long @C_sfmkq_67caca1f_53_L000054
 long @C_sfmkr_67caca1f_55_L000056
 long @C_sfmks_67caca1f_57_L000058
 long @C_sfmkt_67caca1f_59_L000060
 long @C_sfmku_67caca1f_61_L000062
 long @C_sfmkv_67caca1f_63_L000064
 long @C_sfmk10_67caca1f_65_L000066
 long @C_sfmk11_67caca1f_67_L000068
 long @C_sfmk12_67caca1f_69_L000070

' Catalina Export _sys_nerr

 alignl ' align long
C__sys_nerr ' <symbol:_sys_nerr>
 long 35

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_sfmk12_67caca1f_69_L000070 ' <symbol:69>
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
C_sfmk11_67caca1f_67_L000068 ' <symbol:67>
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
C_sfmk10_67caca1f_65_L000066 ' <symbol:65>
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
C_sfmkv_67caca1f_63_L000064 ' <symbol:63>
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
C_sfmku_67caca1f_61_L000062 ' <symbol:61>
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
C_sfmkt_67caca1f_59_L000060 ' <symbol:59>
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
C_sfmks_67caca1f_57_L000058 ' <symbol:57>
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
C_sfmkr_67caca1f_55_L000056 ' <symbol:55>
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
C_sfmkq_67caca1f_53_L000054 ' <symbol:53>
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
C_sfmkp_67caca1f_51_L000052 ' <symbol:51>
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
C_sfmko_67caca1f_49_L000050 ' <symbol:49>
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
C_sfmkn_67caca1f_47_L000048 ' <symbol:47>
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
C_sfmkm_67caca1f_45_L000046 ' <symbol:45>
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
C_sfmkl_67caca1f_43_L000044 ' <symbol:43>
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
C_sfmkk_67caca1f_41_L000042 ' <symbol:41>
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
C_sfmkj_67caca1f_39_L000040 ' <symbol:39>
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
C_sfmki_67caca1f_37_L000038 ' <symbol:37>
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
C_sfmkh_67caca1f_35_L000036 ' <symbol:35>
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
C_sfmkg_67caca1f_33_L000034 ' <symbol:33>
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
C_sfmkf_67caca1f_31_L000032 ' <symbol:31>
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
C_sfmke_67caca1f_29_L000030 ' <symbol:29>
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
C_sfmkd_67caca1f_27_L000028 ' <symbol:27>
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
C_sfmkc_67caca1f_25_L000026 ' <symbol:25>
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
C_sfmkb_67caca1f_23_L000024 ' <symbol:23>
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
C_sfmka_67caca1f_21_L000022 ' <symbol:21>
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
C_sfmk9_67caca1f_19_L000020 ' <symbol:19>
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
C_sfmk8_67caca1f_17_L000018 ' <symbol:17>
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
C_sfmk7_67caca1f_15_L000016 ' <symbol:15>
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
C_sfmk6_67caca1f_13_L000014 ' <symbol:13>
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
C_sfmk5_67caca1f_11_L000012 ' <symbol:11>
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
C_sfmk4_67caca1f_9_L000010 ' <symbol:9>
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
C_sfmk3_67caca1f_7_L000008 ' <symbol:7>
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
C_sfmk2_67caca1f_5_L000006 ' <symbol:5>
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
C_sfmk1_67caca1f_3_L000004 ' <symbol:3>
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
C_sfmk_67caca1f_1_L000002 ' <symbol:1>
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
