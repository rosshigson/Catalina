' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export s8_rxtime

 alignl ' align long
C_s8_rxtime ' <symbol:s8_rxtime>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fe0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cnt ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 jmp #\@C_s8_rxtime_3 ' JUMPV addrg
C_s8_rxtime_2
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_s8_rxcheck ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wcz
 if_ae jmp #\C_s8_rxtime_7 ' GEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__clockfreq ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 sub r22, r17 ' SUBU (1)
 mov r18, ##1000 ' reg <- con
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r20, r18 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r22, r0 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 cmp r0, r21 wcz 
 if_be jmp #\C_s8_rxtime_5 ' LEU4
C_s8_rxtime_7
 jmp #\@C_s8_rxtime_4 ' JUMPV addrg
C_s8_rxtime_5
C_s8_rxtime_3
 jmp #\@C_s8_rxtime_2 ' JUMPV addrg
C_s8_rxtime_4
 mov r0, r19 ' CVI, CVU or LOAD
' C_s8_rxtime_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _cnt

' Catalina Import _clockfreq

' Catalina Import s8_rxcheck
' end
