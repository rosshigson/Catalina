' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export atexit

 alignl ' align long
C_atexit ' <symbol:atexit>
 calld PA,#PSHM
 long $500000 ' save registers
 mov r22, ##@C___funccnt
 rdlong r22, r22 ' reg <- INDIRI4 addrg
 cmps r22,  #32 wcz
 if_b jmp #\C_atexit_4 ' LTI4
 mov r0, #1 ' reg <- coni
 jmp #\@C_atexit_3 ' JUMPV addrg
C_atexit_4
 mov r22, ##@C___funccnt ' reg <- addrg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, r22
 adds r20, #1 ' ADDI4 coni
 wrlong r20, ##@C___funccnt ' ASGNI4 addrg reg
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___functab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 wrlong r2, r22 ' ASGNP4 reg reg
 mov r0, #0 ' reg <- coni
C_atexit_3
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Import __funccnt

' Catalina Import __functab
' end
