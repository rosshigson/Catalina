' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export t_bin

 alignl ' align long
C_t_bin ' <symbol:t_bin>
 jmp #NEWF
 jmp #PSHM
 long $ea0000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov r19, #0 ' reg <- coni
C_t_bin_3
 jmp #LODL
 long $80000000
 mov r22, RI ' reg <- con
 and r22, r21 ' BANDI/U (2)
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_t_bin_8 ' EQU4
 mov r17, #49 ' reg <- coni
 jmp #JMPA
 long @C_t_bin_9 ' JUMPV addrg
C_t_bin_8
 mov r17, #48 ' reg <- coni
C_t_bin_9
 mov r2, r17 ' CVI, CVU or LOAD
 mov r3, r23 ' CVI, CVU or LOAD
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_t_char
 add SP, #4 ' CALL addrg
 shl r21, #1 ' LSHU4 coni
' C_t_bin_4 ' (symbol refcount = 0)
 adds r19, #1 ' ADDI4 coni
 cmps r19,  #32 wz,wc
 jmp #BR_B
 long @C_t_bin_3 ' LTI4
 mov r0, #0 ' RET coni
' C_t_bin_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import t_char
' end
