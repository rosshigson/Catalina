' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fputc

 alignl ' align long
C_fputc ' <symbol:fputc>
 jmp #NEWF
 jmp #PSHM
 long $e00000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_putchar ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
' C_fputc_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Data

DAT ' uninitialized data segment

' Catalina Export stdout

 alignl ' align long
C_stdout ' <symbol:stdout>
 byte 0[4]

' Catalina Code

DAT ' code segment

' Catalina Import putchar

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment
' end
