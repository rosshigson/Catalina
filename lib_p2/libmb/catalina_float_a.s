' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export trunc

 alignl ' align long
C_trunc ' <symbol:trunc>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #6 ' reg ARG coni
 mov r5, #3 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_trunc_2 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export round

 alignl ' align long
C_round ' <symbol:round>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #7 ' reg ARG coni
 mov r5, #3 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_round_5 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export sqrt

 alignl ' align long
C_sqrt ' <symbol:sqrt>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #8 ' reg ARG coni
 mov r5, #3 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sqrt_6 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export sin

 alignl ' align long
C_sin ' <symbol:sin>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #10 ' reg ARG coni
 mov r5, #3 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sin_7 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export cos

 alignl ' align long
C_cos ' <symbol:cos>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #11 ' reg ARG coni
 mov r5, #3 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_cos_8 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export tan

 alignl ' align long
C_tan ' <symbol:tan>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #12 ' reg ARG coni
 mov r5, #3 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_tan_9 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export log

 alignl ' align long
C_log ' <symbol:log>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #13 ' reg ARG coni
 mov r5, #3 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_log_10 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export log10

 alignl ' align long
C_log10 ' <symbol:log10>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #14 ' reg ARG coni
 mov r5, #3 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_log10_11 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export exp

 alignl ' align long
C_exp ' <symbol:exp>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #15 ' reg ARG coni
 mov r5, #3 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_exp_12 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export exp10

 alignl ' align long
C_exp10 ' <symbol:exp10>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #16 ' reg ARG coni
 mov r5, #3 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_exp10_13 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export pow

 alignl ' align long
C_pow ' <symbol:pow>
 PRIMITIVE(#PSHM)
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #17 ' reg ARG coni
 mov r5, #3 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_pow_14 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export frac

 alignl ' align long
C_frac ' <symbol:frac>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #18 ' reg ARG coni
 mov r5, #3 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_frac_15 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import _float_request

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_trunc_3_L000004 ' <symbol:3>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
