' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _waitms

 alignl ' align long
C__waitms ' <symbol:_waitms>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $f00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__clockfreq ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov r22, ##1000 ' reg <- con
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qdiv r21, r22 ' DIVU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov RI, FP
 sub RI, #-(-4)
 wrlong r0, RI ' ASGNU4 addrli reg
 jmp #\@C__waitms_3 ' JUMPV addrg
C__waitms_2
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r21 ' ADDU
 add r2, r22 ' ADDU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__waitcnt ' CALL addrg
 mov r22, ##1000 ' reg <- con
 sub r23, r22 ' SUBU (1)
C__waitms_3
 mov r22, ##1000 ' reg <- con
 cmp r23, r22 wcz 
 if_a jmp #\C__waitms_2 ' GTU4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r23, r22 ' MULU4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__cnt ' CALL addrg
 mov r20, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' ADDU
 add r2, r20 ' ADDU (3)
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 PRIMITIVE(#CALA)
 long @C__waitcnt ' CALL addrg
' C__waitms_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import _clockfreq
' end
