' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export t_unsigned

 alignl ' align long
C_t_unsigned ' <symbol:t_unsigned>
 calld PA,#NEWF
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov RI, FP
 add RI, #12
 wrlong r2, RI ' spill reg
 mov r22, r23
 and r22, #1 ' BANDU4 coni
 shl r22, #23 ' LSHU4 coni
 mov r20, FP
 add r20, #12 ' reg <- addrfi
 add r22, r20 ' ADDU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #31 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__short_service
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_t_unsigned_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _short_service
' end
