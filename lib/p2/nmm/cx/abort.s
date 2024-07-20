' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export abort

 alignl ' align long
C_abort ' <symbol:abort>
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, ##@C__clean
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 cmp r22,  #0 wz
 if_z jmp #\C_abort_4 ' EQU4
 mov r22, ##@C__clean
 rdlong r22, r22 ' reg <- INDIRP4 addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 mov RI, r22
 calld PA,#CALI ' CALL indirect
C_abort_4
 mov r2, #6 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_raise ' CALL addrg
' C_abort_3 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _clean

' Catalina Import raise
' end
