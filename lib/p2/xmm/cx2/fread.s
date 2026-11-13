' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export fread

 alignl ' align long
C_fread ' <symbol:fread>
 jmp #NEWF
 jmp #PSHM
 long $faaa00 ' save registers
 mov r23, r5 ' reg var <- reg arg
 mov r21, r4 ' reg var <- reg arg
 mov r19, r3 ' reg var <- reg arg
 mov r17, r2 ' reg var <- reg arg
 mov r15, r23 ' CVI, CVU or LOAD
 mov r9, #0 ' reg <- coni
 cmp r21,  #0 wz
 jmp #BR_Z
 long @C_fread_2 ' EQU4
 jmp #JMPA
 long @C_fread_5 ' JUMPV addrg
C_fread_4
 mov r11, r21 ' CVI, CVU or LOAD
C_fread_7
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_getc ' CALL addrg
 mov r13, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long -1
 mov r20, RI ' reg <- con
 cmps r0, r20 wz
 jmp #BR_Z
 long @C_fread_10 ' EQI4
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDP4 coni
 mov r20, r13 ' CVI, CVU or LOAD
 mov RI, r22
 mov BC, r20
 jmp #WBYT ' ASGNU1 reg reg
 jmp #JMPA
 long @C_fread_11 ' JUMPV addrg
C_fread_10
 mov r0, r9 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_fread_1 ' JUMPV addrg
C_fread_11
' C_fread_8 ' (symbol refcount = 0)
 mov r22, r11
 sub r22, #1 ' SUBU4 coni
 mov r11, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C_fread_7 ' NEU4
 add r9, #1 ' ADDU4 coni
C_fread_5
 cmp r9, r19 wz,wc 
 jmp #BR_B
 long @C_fread_4' LTU4
C_fread_2
 mov r0, r9 ' CVI, CVU or LOAD
C_fread_1
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import getc
' end
