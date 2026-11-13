' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export putc

 alignl ' align long
C_putc ' <symbol:putc>
 jmp #NEWF
 jmp #PSHM
 long $f40000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 mov RI, r21
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_putc_2 ' LTI4
 mov r22, r21
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov r22, r23 ' CVI, CVU or LOAD
 mov RI, r20
 mov BC, r22
 jmp #WBYT ' ASGNU1 reg reg
 mov r0, r22 ' CVUI
 and r0, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_putc_1 ' JUMPV addrg
C_putc_2
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C___flushbuf
 add SP, #4 ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_putc_1
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import __flushbuf
' end
