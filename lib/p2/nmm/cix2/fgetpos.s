' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fgetpos

 alignl ' align long
C_fgetpos ' <symbol:fgetpos>
 calld PA,#NEWF
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_ftell ' CALL addrg
 wrlong r0, r21 ' ASGNI4 reg reg
 rdlong r22, r21 ' reg <- INDIRI4 reg
 mov r20, ##-1 ' reg <- con
 cmps r22, r20 wz
 if_nz jmp #\C_fgetpos_2 ' NEI4
 mov r0, ##-1 ' RET con
 jmp #\@C_fgetpos_1 ' JUMPV addrg
C_fgetpos_2
 mov r0, #0 ' reg <- coni
C_fgetpos_1
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import ftell
' end
