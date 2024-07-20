' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export tty_padchar

 alignl ' align long
C_tty_padchar ' <symbol:tty_padchar>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_tty_padchar_5 ' JUMPV addrg
C_tty_padchar_2
 mov r2, r21 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_tty_tx ' CALL addrg
' C_tty_padchar_3 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
C_tty_padchar_5
 mov r22, r19 ' CVI, CVU or LOAD
 cmp r22, r23 wcz 
 jmp #BR_B
 long @C_tty_padchar_2' LTU4
' C_tty_padchar_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import tty_tx
' end
