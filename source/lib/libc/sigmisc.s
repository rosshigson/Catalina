' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_smro_6188bf7e___testsigset_L000001 ' <symbol:__testsigset>
 PRIMITIVE(#PSHM)
 long $800000 ' save registers
 mov r23, #0 ' reg <- coni
 cmps r23,  #0 wz
 if_z jmp #\C_smro_6188bf7e___testsigset_L000001_4 ' EQI4
 cmps r23,  #1 wz
 if_z jmp #\C_smro_6188bf7e___testsigset_L000001_4 ' EQI4
 jmp #\@C_smro_6188bf7e___testsigset_L000001_3 ' JUMPV addrg
C_smro_6188bf7e___testsigset_L000001_3
C_smro_6188bf7e___testsigset_L000001_4
' C_smro_6188bf7e___testsigset_L000001_2 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export __newsigset

 alignl ' align long
C___newsigset ' <symbol:__newsigset>
 PRIMITIVE(#PSHM)
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, ##0 ' reg ARG con
 mov r4, #2 ' reg ARG coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__sigprocmask
 add SP, #8 ' CALL addrg
' C___newsigset_7 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Export __oldsigset

 alignl ' align long
C___oldsigset ' <symbol:__oldsigset>
 PRIMITIVE(#PSHM)
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##0 ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #2 ' reg ARG coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__sigprocmask
 add SP, #8 ' CALL addrg
' C___oldsigset_8 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import _sigprocmask
' end
