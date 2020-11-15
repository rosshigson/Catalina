' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export catalina_putc

 alignl ' align long
C_catalina_putc ' <symbol:catalina_putc>
 PRIMITIVE(#PSHM)
 long $f00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, r21 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long @C___iotab+24
 mov r20, RI ' reg <- addrg
 cmp r22, r20 wz
 PRIMITIVE(#BRNZ)
 long @C_catalina_putc_3 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_t_char
 add SP, #4 ' CALL addrg
 PRIMITIVE(#JMPA)
 long @C_catalina_putc_4 ' JUMPV addrg
C_catalina_putc_3
 mov r22, r21 ' CVI, CVU or LOAD
 PRIMITIVE(#LODL)
 long @C___iotab+48
 mov r20, RI ' reg <- addrg
 cmp r22, r20 wz
 PRIMITIVE(#BRNZ)
 long @C_catalina_putc_6 ' NEU4
 mov r2, r23 ' CVI, CVU or LOAD
 mov r3, #1 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 PRIMITIVE(#CALA)
 long @C_t_char
 add SP, #4 ' CALL addrg
C_catalina_putc_6
C_catalina_putc_4
 mov r0, r23 ' CVI, CVU or LOAD
' C_catalina_putc_2 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import t_char

' Catalina Import __iotab
' end
