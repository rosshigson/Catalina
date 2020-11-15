' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export putldec

 alignl ' align long
C_putldec ' <symbol:putldec>
 PRIMITIVE(#PSHM)
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 PRIMITIVE(#LODL)
 long $3000000
 mov r2, RI ' reg ARG con
 mov r3, #32 ' reg ARG coni
 mov r4, #0 ' reg ARG coni
 mov r5, #1 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #10
 PRIMITIVE(#PSHL) ' stack ARG coni
 mov r22, r23 ' CVI, CVU or LOAD
 mov RI, r22
 PRIMITIVE(#PSHL) ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 PRIMITIVE(#CALA)
 long @C__printf_putll
 add SP, #20 ' CALL addrg
' C_putldec_1 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import _printf_putll
' end
