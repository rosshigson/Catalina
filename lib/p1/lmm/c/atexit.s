' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export atexit

 alignl ' align long
C_atexit ' <symbol:atexit>
 jmp #PSHM
 long $500000 ' save registers
 jmp #LODI
 long @C___funccnt
 mov r22, RI ' reg <- INDIRI4 addrg
 cmps r22,  #32 wz,wc
 jmp #BR_B
 long @C_atexit_4 ' LTI4
 mov r0, #1 ' RET coni
 jmp #JMPA
 long @C_atexit_3 ' JUMPV addrg
C_atexit_4
 jmp #LODL
 long @C___funccnt
 mov r22, RI ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r22
 adds r20, #1 ' ADDI4 coni
 jmp #LODL
 long @C___funccnt
 wrlong r20, RI ' ASGNI4 addrg reg
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C___functab
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 wrlong r2, r22 ' ASGNP4 reg reg
 mov r0, #0 ' RET coni
C_atexit_3
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import __funccnt

' Catalina Import __functab
' end
