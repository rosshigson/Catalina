' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export difftime

 alignl ' align long
C_difftime ' <symbol:difftime>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $540000 ' save registers
 cmp r2, r3 wcz 
 if_be jmp #\C_difftime_2 ' LEU4
 mov r22, r2 ' SUBU
 sub r22, r3 ' SUBU (3)
 mov r20, ##@C_difftime_4_L000005
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r18, r22
 shr r18, #1 ' RSHU4 coni
 mov r0, r18 ' CVI, CVU or LOAD
 calld PA,#FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 calld PA,#FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 and r22, #1 ' BANDU4 coni
 mov r0, r22 ' CVI, CVU or LOAD
 calld PA,#FLIN ' CVIF4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 calld PA,#FADD ' ADDF4
 xor r0, Bit31 ' NEGF4
 jmp #\@C_difftime_1 ' JUMPV addrg
C_difftime_2
 mov r22, r3 ' SUBU
 sub r22, r2 ' SUBU (3)
 mov r20, ##@C_difftime_4_L000005
 rdlong r20, r20 ' reg <- INDIRF4 addrg
 mov r18, r22
 shr r18, #1 ' RSHU4 coni
 mov r0, r18 ' CVI, CVU or LOAD
 calld PA,#FLIN ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 calld PA,#FMUL ' MULF4
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNF4 addrli reg
 and r22, #1 ' BANDU4 coni
 mov r0, r22 ' CVI, CVU or LOAD
 calld PA,#FLIN ' CVIF4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 calld PA,#FADD ' ADDF4
C_difftime_1
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_difftime_4_L000005 ' <symbol:4>
 long $40000000 ' float

' Catalina Code

DAT ' code segment
' end
