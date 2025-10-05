' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export sprintf

 alignl ' align long
C_sprintf ' <symbol:sprintf>
 calld PA,#NEWF
 sub SP, #32
 calld PA,#PSHM
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
 mov r22, FP
 add r22, #16 ' reg <- addrfi
 mov RI, FP
 sub RI, #-(-32)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##-1 ' reg <- con
 mov RI, FP
 sub RI, #-(-24)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, #262 ' reg <- coni
 mov RI, FP
 sub RI, #-(-20)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 add r22, #8 ' reg <- addrfi
 rdlong r22, r22 ' reg <- INDIRP4 reg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, ##2147483647 ' reg <- con
 mov RI, FP
 sub RI, #-(-28)
 wrlong r22, RI ' ASGNI4 addrli reg
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov RI, FP
 sub RI, #-(-32)
 rdlong r3, RI ' reg ARG INDIR ADDRLi
 mov RI, FP
 add RI, #12
 rdlong r4, RI ' reg ARG INDIR ADDRFi
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__doprnt
 add SP, #8 ' CALL addrg
 mov RI, FP
 sub RI, #-(-36)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r2, FP
 sub r2, #-(-28) ' reg ARG ADDRLi
 mov r3, #0 ' reg ARG coni
 mov BC, #8 ' arg size, rpsize = 8, spsize = 8
 sub SP, #4 ' stack space for reg ARGs
 calld PA,#CALA
 long @C_putc
 add SP, #4 ' CALL addrg
 mov r22, FP
 sub r22, #-(-36) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_sprintf_1 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #32 ' framesize
 calld PA,#RETF


' Catalina Import _doprnt

' Catalina Import putc
' end
