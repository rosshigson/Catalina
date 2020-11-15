' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export difftime

 alignl ' align long
C_difftime ' <symbol:difftime>
 PRIMITIVE(#NEWF)
 sub SP, #4
 PRIMITIVE(#PSHM)
 long $540000 ' save registers
 cmp r2, r3 wcz 
 PRIMITIVE(#BRBE)
 long @C_difftime_2 ' LEU4
 mov r22, r2 ' SUBU
 sub r22, r3 ' SUBU (3)
 PRIMITIVE(#LODI)
 long @C_difftime_4_L000005
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r18, r22
 shr r18, #1 ' RSHU4 coni
 mov r0, r18 ' CVI, CVU or LOAD
 PRIMITIVE(#FLIN) ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODF)
 long -4
 wrlong r0, RI ' ASGNF4 addrl reg
 and r22, #1 ' BANDU4 coni
 mov r0, r22 ' CVI, CVU or LOAD
 PRIMITIVE(#FLIN) ' CVIF4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 PRIMITIVE(#FADD) ' ADDF4
 xor r0, Bit31 ' NEGF4
 PRIMITIVE(#JMPA)
 long @C_difftime_1 ' JUMPV addrg
C_difftime_2
 mov r22, r3 ' SUBU
 sub r22, r2 ' SUBU (3)
 PRIMITIVE(#LODI)
 long @C_difftime_4_L000005
 mov r20, RI ' reg <- INDIRF4 addrg
 mov r18, r22
 shr r18, #1 ' RSHU4 coni
 mov r0, r18 ' CVI, CVU or LOAD
 PRIMITIVE(#FLIN) ' CVIF4
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r20 ' setup r0/r1 (1)
 PRIMITIVE(#FMUL) ' MULF4
 PRIMITIVE(#LODF)
 long -4
 wrlong r0, RI ' ASGNF4 addrl reg
 and r22, #1 ' BANDU4 coni
 mov r0, r22 ' CVI, CVU or LOAD
 PRIMITIVE(#FLIN) ' CVIF4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRF4 reg
 mov r1, r0 ' setup r0/r1 (1)
 mov r0, r22 ' setup r0/r1 (1)
 PRIMITIVE(#FADD) ' ADDF4
C_difftime_1
 PRIMITIVE(#POPM) ' restore registers
 add SP, #4 ' framesize
 PRIMITIVE(#RETF)


' Catalina Cnst

DAT ' const data segment

 alignl ' align long
C_difftime_4_L000005 ' <symbol:4>
 long $40000000 ' float

' Catalina Code

DAT ' code segment
' end
