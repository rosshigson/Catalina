' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export vsprintf

 alignl ' align long
C_vsprintf ' <symbol:vsprintf>
 jmp #NEWF
 sub SP, #28
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 jmp #LODL
 long -1
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #262 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r23, RI ' ASGNP4 addrli reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r23, RI ' ASGNP4 addrli reg
 jmp #LODL
 long 32767
 mov r22, RI ' reg <- con
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r21 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__doprnt
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-32)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_putc
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-32) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 regl
' C_vsprintf_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #28 ' framesize
 jmp #RETF


' Catalina Import _doprnt

' Catalina Import putc
' end
