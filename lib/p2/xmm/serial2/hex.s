' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export s2_hex

 alignl ' align long
C_s2_hex ' <symbol:s2_hex>
 jmp #NEWF
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 cmps r19,  #1 wz,wc
 jmp #BRAE
 long @C_s2_hex_2 ' GEI4
 mov r19, #1 ' reg <- coni
C_s2_hex_2
 cmps r19,  #8 wz,wc
 jmp #BRBE
 long @C_s2_hex_4 ' LEI4
 mov r19, #8 ' reg <- coni
C_s2_hex_4
 mov r22, #8 ' reg <- coni
 subs r22, r19 ' SUBI/P (1)
 shl r22, #2 ' LSHI4 coni
 shl r21, r22 ' LSHI/U (1)
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_s2_hex_9 ' JUMPV addrg
C_s2_hex_6
 mov r22, r21
 shr r22, #28 ' RSHU4 coni
 and r22, #15 ' BANDU4 coni
 mov r17, r22 ' CVI, CVU or LOAD
 cmps r17,  #9 wz,wc
 jmp #BRBE
 long @C_s2_hex_10 ' LEI4
 adds r17, #7 ' ADDI4 coni
C_s2_hex_10
 mov r22, r17
 adds r22, #48 ' ADDI4 coni
 mov r2, r22 ' CVUI
 and r2, cviu_m1 ' zero extend
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_s2_tx
 add SP, #4 ' CALL addrg
 shl r21, #4 ' LSHU4 coni
' C_s2_hex_7 ' (symbol refcount = 0)
 adds r15, #1 ' ADDI4 coni
C_s2_hex_9
 cmps r15, r19 wz,wc
 jmp #BR_B
 long @C_s2_hex_6 ' LTI4
' C_s2_hex_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import s2_tx
' end
