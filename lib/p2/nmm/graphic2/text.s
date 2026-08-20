' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export g_text

 alignl ' align long
C_g_text ' <symbol:g_text>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r17, FP
 sub r17, #-(-36) ' reg <- addrli
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 wrlong r23, r22 ' ASGNI4 reg reg
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 wrlong r21, r22 ' ASGNI4 reg reg
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 mov r20, r19 ' CVI, CVU or LOAD
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r22, r17 ' CVI, CVU or LOAD
 mov r17, r22
 adds r17, #4 ' ADDP4 coni
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
 mov r2, FP
 sub r2, #-(-20) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-24) ' reg ARG ADDRLi
 mov r4, r19 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_g_justify
 add SP, #8 ' CALL addrg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #11 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__setcommand
 add SP, #4 ' CALL addrg
' C_g_text_4 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


' Catalina Import _setcommand

' Catalina Import g_justify
' end
