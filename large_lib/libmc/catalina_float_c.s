' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export trunc

 long ' align long
C_trunc ' <symbol:trunc>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #6 ' reg ARG coni
 mov r5, #22 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_trunc_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export round

 long ' align long
C_round ' <symbol:round>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #7 ' reg ARG coni
 mov r5, #22 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_round_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export sqrt

 long ' align long
C_sqrt ' <symbol:sqrt>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #8 ' reg ARG coni
 mov r5, #22 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sqrt_6 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export sin

 long ' align long
C_sin ' <symbol:sin>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #10 ' reg ARG coni
 mov r5, #22 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_sin_7 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export cos

 long ' align long
C_cos ' <symbol:cos>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #11 ' reg ARG coni
 mov r5, #22 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_cos_8 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export tan

 long ' align long
C_tan ' <symbol:tan>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #12 ' reg ARG coni
 mov r5, #22 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_tan_9 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export log

 long ' align long
C_log ' <symbol:log>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #13 ' reg ARG coni
 mov r5, #22 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_log_10 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export log10

 long ' align long
C_log10 ' <symbol:log10>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #14 ' reg ARG coni
 mov r5, #22 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_log10_11 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export exp

 long ' align long
C_exp ' <symbol:exp>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #15 ' reg ARG coni
 mov r5, #22 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_exp_12 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export exp10

 long ' align long
C_exp10 ' <symbol:exp10>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #16 ' reg ARG coni
 mov r5, #22 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_exp10_13 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export pow

 long ' align long
C_pow ' <symbol:pow>
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #17 ' reg ARG coni
 mov r5, #22 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_pow_14 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export frac

 long ' align long
C_frac ' <symbol:frac>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #18 ' reg ARG coni
 mov r5, #22 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_frac_15 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export mod

 long ' align long
C_mod ' <symbol:mod>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #19 ' reg ARG coni
 mov r5, #22 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_mod_16 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export asin

 long ' align long
C_asin ' <symbol:asin>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #20 ' reg ARG coni
 mov r5, #22 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_asin_17 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export acos

 long ' align long
C_acos ' <symbol:acos>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #21 ' reg ARG coni
 mov r5, #22 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_acos_18 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export atan

 long ' align long
C_atan ' <symbol:atan>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r22, #22 ' reg <- coni
 mov r4, r22 ' CVI, CVU or LOAD
 mov r5, r22 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_atan_19 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export atan2

 long ' align long
C_atan2 ' <symbol:atan2>
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #23 ' reg ARG coni
 mov r5, #22 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_atan2_20 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export floor

 long ' align long
C_floor ' <symbol:floor>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #24 ' reg ARG coni
 mov r5, #22 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_floor_21 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export ceil

 long ' align long
C_ceil ' <symbol:ceil>
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODI
 long @C_trunc_3_L000004
 mov r2, RI ' reg ARG INDIR ADDRG
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #25 ' reg ARG coni
 mov r5, #22 ' reg ARG coni
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C__float_request
 add SP, #12 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_ceil_22 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import _float_request

' Catalina Cnst

DAT ' const data segment

 long ' align long
C_trunc_3_L000004 ' <symbol:3>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
