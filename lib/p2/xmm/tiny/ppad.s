' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _printf_pad

 alignl ' align long
C__printf_pad ' <symbol:_printf_pad>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, r17 ' CVI, CVU or LOAD
 cmps r23,  #0 wz,wc
 jmp #BR_A
 long @C__printf_pad_2 ' GTI4
 mov r0, #0 ' reg <- coni
 jmp #JMPA
 long @C__printf_pad_1 ' JUMPV addrg
C__printf_pad_2
 subs r23, r21 ' SUBI/P (1)
 jmp #JMPA
 long @C__printf_pad_5 ' JUMPV addrg
C__printf_pad_4
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__printf_putc
 add SP, #4 ' CALL addrg
 adds r15, r0 ' ADDI/P (2)
C__printf_pad_5
 mov r22, r23 ' CVI, CVU or LOAD
 mov r23, r22
 subs r23, #1 ' SUBI4 coni
 cmps r22,  #0 wz,wc
 jmp #BR_A
 long @C__printf_pad_4 ' GTI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 sub r22, r20 ' SUBU (1)
 mov r0, r22 ' CVI, CVU or LOAD
C__printf_pad_1
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _printf_putc
' end
