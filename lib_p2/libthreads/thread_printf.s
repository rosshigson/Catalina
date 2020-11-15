' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _thread_printf

 alignl ' align long
C__thread_printf ' <symbol:_thread_printf>
 PRIMITIVE(#NEWF)
 sub SP, #8
 PRIMITIVE(#PSHM)
 long $400000 ' save registers
 mov RI, FP
 add RI, #8
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r2, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r3, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r4, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r5, BC ' spill reg (varadic)
C__thread_printf_3
' C__thread_printf_4 ' (symbol refcount = 0)
 mov RI, FP
 add RI, #12
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__thread_lockset
 add SP, #4 ' CALL addrg
 cmps r0,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C__thread_printf_3 ' EQI4
 mov r22, FP
 add r22, #20 ' reg <- addrfi
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-4)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #16
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_t_vprintf
 add SP, #4 ' CALL addrg
 PRIMITIVE(#LODF)
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov RI, FP
 add RI, #12
 rdlong r2, RI ' reg ARG INDIR ADDRFi
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__thread_lockclr
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C__thread_printf_2 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #8 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import t_vprintf

' Catalina Import _thread_lockset

' Catalina Import _thread_lockclr
' end
