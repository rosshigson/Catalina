' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export tiny_scanf

 alignl ' align long
C_tiny_scanf ' <symbol:tiny_scanf>
 jmp #NEWF
 sub SP, #88
 jmp #PSHM
 long $400000 ' save registers
 mov RI, FP
 add RI, #8
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r2, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r3, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r4, BC ' spill reg (varadic)
 sub BC, #4
 cmp BC, RI wcz
 if_ae wrlong r5, BC ' spill reg (varadic)
 mov r2, #80 ' reg ARG coni
 mov r3, FP
 sub r3, #-(-88) ' reg ARG ADDRLi
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 jmp #CALA
 long @C_safe_gets
 add SP, #4 ' CALL addrg
 mov r22, FP
 add r22, #12 ' reg <- addrfi
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov RI, FP
 sub RI, #-(-8)
 rdlong r2, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #8
 rdlong r3, RI ' reg ARG INDIR ADDRFi
 mov r4, FP
 sub r4, #-(-88) ' reg ARG ADDRLi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 jmp #CALA
 long @C__doscanf
 add SP, #8 ' CALL addrg
 jmp #LODF
 long -92
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-92) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_tiny_scanf_1 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #88 ' framesize
 jmp #RETF


' Catalina Import _doscanf

' Catalina Import safe_gets
' end
