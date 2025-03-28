' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_s6do_67e4d975___testsigset_L000001 ' <symbol:__testsigset>
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, #0 ' reg <- coni
 cmps r23,  #0 wz
 if_z jmp #\C_s6do_67e4d975___testsigset_L000001_4 ' EQI4
 cmps r23,  #1 wz
 if_z jmp #\C_s6do_67e4d975___testsigset_L000001_4 ' EQI4
 jmp #\@C_s6do_67e4d975___testsigset_L000001_3 ' JUMPV addrg
C_s6do_67e4d975___testsigset_L000001_3
C_s6do_67e4d975___testsigset_L000001_4
' C_s6do_67e4d975___testsigset_L000001_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Export __newsigset

 alignl ' align long
C___newsigset ' <symbol:__newsigset>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##0 ' reg ARG con
 mov r4, #2 ' reg ARG coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sigprocmask
 add SP, #8 ' CALL addrg
' C___newsigset_7 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Export __oldsigset

 alignl ' align long
C___oldsigset ' <symbol:__oldsigset>
 calld PA,#NEWF
 calld PA,#PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #2 ' reg ARG coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sigprocmask
 add SP, #8 ' CALL addrg
' C___oldsigset_8 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _sigprocmask
' end
