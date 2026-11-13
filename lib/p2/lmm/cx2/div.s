' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export div

 alignl ' align long
C_div ' <symbol:div>
 jmp #NEWF
 sub SP, #8
 jmp #PSHM
 long $f00000 ' save registers
 mov r0, r3 ' setup r0/r1 (2)
 mov r1, r2 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r0, r3 ' setup r0/r1 (2)
 mov r1, r2 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 jmp #LODF
 long -8
 wrlong r1, RI ' ASGNI4 addrl reg
 mov r22, #0 ' reg <- coni
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 cmps r20, r22 wz
 jmp #BR_Z
 long @C_div_6 ' EQI4
 cmps r3, r22 wcz
 jmp #BRBE
 long @C_div_12 ' LEI4
 mov r23, #1 ' reg <- coni
 jmp #JMPA
 long @C_div_13 ' JUMPV addrg
C_div_12
 mov r23, #0 ' reg <- coni
C_div_13
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 cmps r22,  #0 wcz
 jmp #BRBE
 long @C_div_14 ' LEI4
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C_div_15 ' JUMPV addrg
C_div_14
 mov r21, #0 ' reg <- coni
C_div_15
 cmps r23, r21 wz
 jmp #BR_Z
 long @C_div_6 ' EQI4
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 adds r22, #1 ' ADDI4 coni
 jmp #LODF
 long -12
 wrlong r22, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 subs r22, r2 ' SUBI/P (1)
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNI4 addrl reg
C_div_6
 mov r0, r4 ' CVI, CVU or LOAD
 mov r1, FP
 sub r1, #-(-12) ' reg <- addrli
 jmp #CPYB
 long 8 ' ASGNB
' C_div_3 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #8 ' framesize
 jmp #RETF

' end
