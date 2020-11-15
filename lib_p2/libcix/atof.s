' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export atof

 alignl ' align long
C_atof ' <symbol:atof>
 PRIMITIVE(#NEWF)
 sub SP, #8
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODI)
 long @C_errno
 mov r22, RI ' reg <- INDIRI4 addrg
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#LODL)
 long 0
 mov r2, RI ' reg ARG con
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_strtod
 add SP, #4 ' CALL addrg
 PRIMITIVE(#LODF)
 long -4
 wrlong r0, RI ' ASGNF4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 PRIMITIVE(#LODL)
 long @C_errno
 wrlong r22, RI ' ASGNI4 addrg reg
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRF4 reg
' C_atof_3 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #8 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import errno

' Catalina Import strtod
' end
