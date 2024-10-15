' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__getticks_3_L000004 ' <symbol:3>
 long $0
 long $0

' Catalina Export _getticks

' Catalina Code

DAT ' code segment

 alignl ' align long
C__getticks ' <symbol:_getticks>
 calld PA,#NEWF
 sub SP, #12
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r0, FP
 sub r0, #-(-12) ' reg <- addrli
 mov r1, ##@C__getticks_3_L000004 ' reg <- addrg
 calld PA,#CPYB
 long 8 ' ASGNB
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 mov r20, ##16777215 ' reg <- con
 mov r2, r22 ' BANDI/U
 and r2, r20 ' BANDI/U (3)
 mov r3, ##-67 ' reg ARG con
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__sys_plugin
 add SP, #4 ' CALL addrg
 mov RI, FP
 sub RI, #-(-16)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r23 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 wrlong r22, r21 ' ASGNU4 reg reg
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r0, r22 ' CVI, CVU or LOAD
' C__getticks_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #12 ' framesize
 calld PA,#RETF


' Catalina Import _sys_plugin
' end
