' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export setbuf

 alignl ' align long
C_setbuf ' <symbol:setbuf>
 jmp #NEWF
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 jmp #LODL
 long 512
 mov r2, RI ' reg ARG con
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_setbuf_3 ' EQU4
 mov r19, #0 ' reg <- coni
 jmp #JMPA
 long @C_setbuf_4 ' JUMPV addrg
C_setbuf_3
 mov r19, #4 ' reg <- coni
C_setbuf_4
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov r5, r23 ' CVI, CVU or LOAD
 mov BC, #16 ' arg size, rpsize = 16, spsize = 16
 sub SP, #12 ' stack space for reg ARGs
 jmp #CALA
 long @C_setvbuf
 add SP, #12 ' CALL addrg
' C_setbuf_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import setvbuf
' end
