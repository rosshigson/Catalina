' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export clock

 alignl ' align long
C_clock ' <symbol:clock>
 calld PA,#NEWF
 sub SP, #8
 calld PA,#PSHM
 long $500000 ' save registers
 mov r2, FP
 sub r2, #-(-12) ' reg ARG ADDRLi
 mov r3, FP
 sub r3, #-(-8) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__getticks
 add SP, #4 ' CALL addrg
 mov r22, ##1000 ' reg <- con
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 add r0, r22 ' ADDU (1)
' C_clock_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #8 ' framesize
 calld PA,#RETF


' Catalina Import _getticks
' end
