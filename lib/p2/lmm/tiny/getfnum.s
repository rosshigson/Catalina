' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export getfnum

 alignl ' align long
C_getfnum ' <symbol:getfnum>
 jmp #NEWF
 sub SP, #84
 jmp #PSHM
 long $e80000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov r2, #80 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-88) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_safe_gets
 add SP, #4 ' CALL addrg
 cmps r19,  #80 wcz
 jmp #BRBE
 long @C_getfnum_2 ' LEI4
 mov r19, #80 ' reg <- coni
C_getfnum_2
 mov r2, r21 ' CVI, CVU or LOAD
 mov r3, r19 ' CVI, CVU or LOAD
 mov r4, r23 ' CVI, CVU or LOAD
 mov r5, FP
 sub r5, #-(-8) ' reg ARG ADDRLi
 sub SP, #16 ' stack space for reg ARGs
 mov RI, FP
 sub RI, #-(-88)
 jmp #PSHL ' stack ARG ADDRLi
 mov BC, #20 ' arg size, rpsize = 0, spsize = 20
 add SP, #4 ' correct for new kernel !!! 
 jmp #CALA
 long @C__scanf_getl
 add SP, #16 ' CALL addrg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 reg
' C_getfnum_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #84 ' framesize
 jmp #RETF


' Catalina Import _scanf_getl

' Catalina Import safe_gets
' end
