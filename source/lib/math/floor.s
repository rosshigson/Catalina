' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export floor

 alignl ' align long
C_floor ' <symbol:floor>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-8) ' reg ARG ADDRLi
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_modf
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r20, ##@C_floor_5_L000006
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FCMP
 if_ae jmp #\C_floor_3 ' GEF4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r20, ##@C_floor_7_L000008
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 calld PA,#FSUB ' SUBF4
 mov r21, r0 ' CVI, CVU or LOAD
 jmp #\@C_floor_4 ' JUMPV addrg
C_floor_3
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r21, r22 ' reg <- INDIRF4 reg
C_floor_4
 mov r0, r21 ' CVI, CVU or LOAD
' C_floor_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Import modf

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_floor_7_L000008 ' <symbol:7>
 long $3f800000 ' float

 alignl ' align long
C_floor_5_L000006 ' <symbol:5>
 long $0 ' float

' Catalina Code

DAT ' code segment
' end
