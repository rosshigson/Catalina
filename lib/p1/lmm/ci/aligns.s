' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _align_sbrk

 alignl ' align long
C__align_sbrk ' <symbol:_align_sbrk>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $fa0000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__sbrk ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r23,  #0 wz,wc
 jmp #BRBE
 long @C__align_sbrk_2 ' LEI4
 cmps r23,  #32 wz,wc
 jmp #BRAE
 long @C__align_sbrk_2 ' GEI4
 mov r22, #1 ' reg <- coni
 shl r22, r23 ' LSHI/U (1)
 subs r22, #1 ' SUBI4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, r17 ' ADDU
 add r20, r22 ' ADDU (3)
 xor r22, all_1s ' BCOMU4
 and r22, r20 ' BANDI/U (2)
 sub r22, r17 ' SUBU (1)
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNU4 addrl reg
 mov RI, FP
 sub RI, #-(-12)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__sbrk ' CALL addrg
C__align_sbrk_2
 cmps r21,  #0 wz
 jmp #BR_Z
 long @C__align_sbrk_4 ' EQI4
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__sbrk ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
C__align_sbrk_4
 mov r2, #0 ' reg ARG coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__sbrk ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r19,  #0 wz
 jmp #BR_Z
 long @C__align_sbrk_6 ' EQI4
 jmp #LODL
 long @C__align_sbrk_8_L000009
 mov r2, RI ' reg ARG ADDRG
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_string
 add SP, #4 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_hex
 add SP, #4 ' CALL addrg
 mov r2, #10 ' reg ARG coni
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_char
 add SP, #4 ' CALL addrg
C__align_sbrk_6
 mov r0, #0 ' RET coni
' C__align_sbrk_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF


' Catalina Import t_char

' Catalina Import t_hex

' Catalina Import t_string

' Catalina Import _sbrk

' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C__align_sbrk_8_L000009 ' <symbol:8>
 byte 83
 byte 66
 byte 82
 byte 75
 byte 61
 byte 0

' Catalina Code

DAT ' code segment
' end
