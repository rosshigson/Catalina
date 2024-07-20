' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export tty_hex

 alignl ' align long
C_tty_hex ' <symbol:tty_hex>
 calld PA,#NEWF
 calld PA,#PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 cmps r21,  #1 wcz
 if_ae jmp #\C_tty_hex_2 ' GEI4
 mov r21, #1 ' reg <- coni
C_tty_hex_2
 cmps r21,  #8 wcz
 if_be jmp #\C_tty_hex_4 ' LEI4
 mov r21, #8 ' reg <- coni
C_tty_hex_4
 mov r22, #8 ' reg <- coni
 subs r22, r21 ' SUBI/P (1)
 shl r22, #2 ' LSHI4 coni
 shl r23, r22 ' LSHI/U (1)
 mov r17, #0 ' reg <- coni
 jmp #\@C_tty_hex_9 ' JUMPV addrg
C_tty_hex_6
 mov r22, r23
 shr r22, #28 ' RSHU4 coni
 and r22, #15 ' BANDU4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r19,  #9 wcz
 if_be jmp #\C_tty_hex_10 ' LEI4
 adds r19, #7 ' ADDI4 coni
C_tty_hex_10
 mov r22, r19
 adds r22, #48 ' ADDI4 coni
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_tty_tx ' CALL addrg
 shl r23, #4 ' LSHU4 coni
' C_tty_hex_7 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
C_tty_hex_9
 cmps r17, r21 wcz
 if_b jmp #\C_tty_hex_6 ' LTI4
' C_tty_hex_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import tty_tx
' end
