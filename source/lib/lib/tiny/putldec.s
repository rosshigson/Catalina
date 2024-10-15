' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export putldec

 alignl ' align long
C_putldec ' <symbol:putldec>
 calld PA,#NEWF
 calld PA,#PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r2, ##$3000000 ' reg ARG con
 mov r3, #32 ' reg ARG coni
 mov r4, #0 ' reg ARG coni
 mov r5, #1 ' reg ARG coni
 sub SP, #16 ' stack space for reg ARGs
 mov RI, #10
 wrlong RI, --PTRA ' stack ARG coni
 mov r22, r23 ' CVI, CVU or LOAD
 mov RI, r22
 wrlong RI, --PTRA ' stack ARG
 mov BC, #24 ' arg size, rpsize = 0, spsize = 24
 add SP, #4 ' correct for new kernel !!! 
 calld PA,#CALA
 long @C__printf_putll
 add SP, #20 ' CALL addrg
' C_putldec_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _printf_putll
' end
