' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export getc

 alignl ' align long
C_getc ' <symbol:getc>
 jmp #NEWF
 jmp #PSHM
 long $d40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRI4 reg
 subs r22, #1 ' SUBI4 coni
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNI4 reg reg
 cmps r22,  #0 wz,wc
 jmp #BR_B
 long @C_getc_2 ' LTI4
 mov r22, r23
 adds r22, #20 ' ADDP4 coni
 mov RI, r22
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20
 adds r18, #1 ' ADDP4 coni
 mov RI, r22
 mov BC, r18
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 mov r0, r22 ' CVUI
 and r0, cviu_m1 ' zero extend
 jmp #JMPA
 long @C_getc_1 ' JUMPV addrg
C_getc_2
 mov r2, r23 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C___fillbuf ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
C_getc_1
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import __fillbuf
' end
