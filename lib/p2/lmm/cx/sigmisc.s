' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_s10ls_67cacaba___testsigset_L000001 ' <symbol:__testsigset>
 jmp #PSHM
 long $800000 ' save registers
 mov r23, #0 ' reg <- coni
 cmps r23,  #0 wz
 jmp #BR_Z
 long @C_s10ls_67cacaba___testsigset_L000001_4 ' EQI4
 cmps r23,  #1 wz
 jmp #BR_Z
 long @C_s10ls_67cacaba___testsigset_L000001_4 ' EQI4
 jmp #JMPA
 long @C_s10ls_67cacaba___testsigset_L000001_3 ' JUMPV addrg
C_s10ls_67cacaba___testsigset_L000001_3
C_s10ls_67cacaba___testsigset_L000001_4
' C_s10ls_67cacaba___testsigset_L000001_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Export __newsigset

 alignl ' align long
C___newsigset ' <symbol:__newsigset>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long 0
 mov r3, RI ' reg ARG con
 mov r4, #2 ' reg ARG coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__sigprocmask
 add SP, #8 ' CALL addrg
' C___newsigset_7 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Export __oldsigset

 alignl ' align long
C___oldsigset ' <symbol:__oldsigset>
 jmp #NEWF
 jmp #PSHM
 long $800000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 jmp #LODL
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov r4, #2 ' reg ARG coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__sigprocmask
 add SP, #8 ' CALL addrg
' C___oldsigset_8 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _sigprocmask
' end
