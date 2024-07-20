' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export t_string

 alignl ' align long
C_t_string ' <symbol:t_string>
 jmp #NEWF
 sub SP, #104
 jmp #PSHM
 long $fe8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r17, #0 ' reg <- coni
 mov r19, #0 ' reg <- coni
 mov r15, #0 ' reg <- coni
 jmp #JMPA
 long @C_t_string_4 ' JUMPV addrg
C_t_string_3
 mov r22, r19 ' CVI, CVU or LOAD
 mov r19, r22
 adds r19, #1 ' ADDI4 coni
 mov r20, r17 ' CVI, CVU or LOAD
 mov r17, r20
 adds r17, #1 ' ADDI4 coni
 mov r18, FP
 sub r18, #-(-108) ' reg <- addrli
 adds r22, r18 ' ADDI/P (1)
 adds r20, r21 ' ADDI/P (1)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 cmps r19,  #100 wz
 jmp #BRNZ
 long @C_t_string_6 ' NEI4
 mov r22, FP
 sub r22, #-(-108) ' reg <- addrli
 adds r22, r19 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 and r22, #1 ' BANDU4 coni
 shl r22, #23 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-108) ' reg <- addrli
 add r22, r20 ' ADDU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #29 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__short_service
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
 mov r19, #0 ' reg <- coni
C_t_string_6
C_t_string_4
 mov r22, r17 ' ADDI/P
 adds r22, r21 ' ADDI/P (3)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C_t_string_3 ' NEI4
 cmps r19,  #0 wz,wc
 jmp #BRBE
 long @C_t_string_8 ' LEI4
 mov r22, FP
 sub r22, #-(-108) ' reg <- addrli
 adds r22, r19 ' ADDI/P (2)
 mov r20, #0 ' reg <- coni
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 mov r22, r23
 and r22, #1 ' BANDU4 coni
 shl r22, #23 ' LSHU4 coni
 mov r20, FP
 sub r20, #-(-108) ' reg <- addrli
 add r22, r20 ' ADDU (1)
 mov r2, r22 ' CVI, CVU or LOAD
 mov r3, #29 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C__short_service
 add SP, #4 ' CALL addrg
 mov r15, r0 ' CVI, CVU or LOAD
C_t_string_8
 mov r0, r15 ' CVI, CVU or LOAD
' C_t_string_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #104 ' framesize
 jmp #RETF


' Catalina Import _short_service
' end
