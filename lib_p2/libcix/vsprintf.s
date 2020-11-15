' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export vsprintf

 alignl ' align long
C_vsprintf ' <symbol:vsprintf>
 PRIMITIVE(#NEWF)
 sub SP, #28
 PRIMITIVE(#PSHM)
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 PRIMITIVE(#LODL)
 long -1
 mov r22, RI ' reg <- con
 PRIMITIVE(#LODF)
 long -20
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, #262 ' reg <- coni
 PRIMITIVE(#LODF)
 long -16
 wrlong r22, RI ' ASGNI4 addrl reg
 PRIMITIVE(#LODF)
 long -8
 wrlong r23, RI ' ASGNP4 addrl reg
 PRIMITIVE(#LODF)
 long -4
 wrlong r23, RI ' ASGNP4 addrl reg
 PRIMITIVE(#LODL)
 long 32767
 mov r22, RI ' reg <- con
 PRIMITIVE(#LODF)
 long -24
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C__doprnt
 add SP, #8 ' CALL addrg
 PRIMITIVE(#LODF)
 long -28
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r2, FP
 sub r2, #-(-24) ' reg ARG ADDRLi
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_putc
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-28) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_vsprintf_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 add SP, #28 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _doprnt

' Catalina Import putc
' end
