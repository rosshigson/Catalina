' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export tty_bin

 alignl ' align long
C_tty_bin ' <symbol:tty_bin>
 calld PA,#NEWF
 calld PA,#PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r22, #32 ' reg <- coni
 subs r22, r21 ' SUBI/P (1)
 shl r23, r22 ' LSHI/U (1)
 jmp #\@C_tty_bin_3 ' JUMPV addrg
C_tty_bin_2
 mov r22, ##$80000000 ' reg <- con
 and r22, r23 ' BANDI/U (2)
 cmp r22,  #0 wz
 if_nz jmp #\C_tty_bin_6  ' NEU4
 mov r19, #48 ' reg <- coni
 jmp #\@C_tty_bin_7 ' JUMPV addrg
C_tty_bin_6
 mov r19, #49 ' reg <- coni
C_tty_bin_7
 mov r22, r19 ' CVI, CVU or LOAD
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_tty_tx ' CALL addrg
 shl r23, #1 ' LSHU4 coni
C_tty_bin_3
 mov r22, r21 ' CVI, CVU or LOAD
 mov r21, r22
 subs r21, #1 ' SUBI4 coni
 cmps r22,  #0 wcz
 if_a jmp #\C_tty_bin_2 ' GTI4
' C_tty_bin_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import tty_tx
' end
