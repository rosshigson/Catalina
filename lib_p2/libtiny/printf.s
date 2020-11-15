' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export tiny_printf

 alignl ' align long
C_tiny_printf ' <symbol:tiny_printf>
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
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNP4 addrl reg
 PRIMITIVE(#LODL)
 long $3000000
 mov r2, RI ' reg ARG con
 mov RI, FP
 sub RI, #-(-4)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__doprintf
 add SP, #8 ' CALL addrg
 PRIMITIVE(#LODF)
 long -8
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_tiny_printf_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #8 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _doprintf
' end
