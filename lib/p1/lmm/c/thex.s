' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export t_hex

 alignl ' align long
C_t_hex ' <symbol:t_hex>
 jmp #NEWF
 jmp #PSHM
 long $ea8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
C_t_hex_3
 jmp #LODL
 long $f0000000
 mov r22, RI ' reg <- con
 and r22, r21 ' BANDI/U (2)
 shr r22, #28 ' RSHU4 coni
 mov r19, r22 ' CVI, CVU or LOAD
 cmps r19,  #10 wz,wc
 jmp #BRAE
 long @C_t_hex_8 ' GEI4
 mov r15, r19
 adds r15, #48 ' ADDI4 coni
 jmp #JMPA
 long @C_t_hex_9 ' JUMPV addrg
C_t_hex_8
 mov r22, r19
 adds r22, #65 ' ADDI4 coni
 mov r15, r22
 subs r15, #10 ' SUBI4 coni
C_t_hex_9
 mov r2, r15 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_char
 add SP, #4 ' CALL addrg
 shl r21, #4 ' LSHU4 coni
' C_t_hex_4 ' (symbol refcount = 0)
 adds r17, #1 ' ADDI4 coni
 cmps r17,  #8 wz,wc
 jmp #BR_B
 long @C_t_hex_3 ' LTI4
 mov r0, #0 ' RET coni
' C_t_hex_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import t_char
' end
