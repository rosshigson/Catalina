' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export sd_sectread

 alignl ' align long
C_sd_sectread ' <symbol:sd_sectread>
 jmp #NEWF
 jmp #LODL
 long 516
 sub SP, RI
 jmp #PSHM
 long $f80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r2, r21 ' CVI, CVU or LOAD
 jmp #LODF
 long -516
 mov r22, RI ' reg <- addrl
 mov r3, r22 ' CVI, CVU or LOAD
 mov r4, #40 ' reg ARG coni
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__long_service_2
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -520
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r19, #0 ' reg <- coni
C_sd_sectread_3
 mov r22, r19 ' ADDI/P
 adds r22, r23 ' ADDI/P (3)
 jmp #LODF
 long -516
 mov r20, RI ' reg <- addrl
 adds r20, r19 ' ADDI/P (2)
 mov RI, r20
 jmp #RBYT
 mov r20, BC ' reg <- INDIRU1 reg
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
' C_sd_sectread_4 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
 jmp #LODL
 long 512
 mov r22, RI ' reg <- con
 cmps r19, r22 wz,wc
 jmp #BR_B
 long @C_sd_sectread_3 ' LTI4
 jmp #LODF
 long -520
 rdlong r22, RI ' reg <- INDIRI4 addrl
 mov r0, r22 ' CVI, CVU or LOAD
' C_sd_sectread_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #LODL
 long 516
 add SP, RI ' framesize
 jmp #RETF


' Catalina Import _long_service_2
' end
