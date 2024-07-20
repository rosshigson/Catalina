' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _read

 alignl ' align long
C__read ' <symbol:_read>
 calld PA,#NEWF
 calld PA,#PSHM
 long $fa8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r15, #0 ' reg <- coni
 cmps r23,  #0 wz
 if_nz jmp #\C__read_3 ' NEI4
 jmp #\@C__read_6 ' JUMPV addrg
C__read_5
 mov r2, ##@C___stdin ' reg ARG ADDRG
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_catalina_getc ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov r22, ##-1 ' reg <- con
 cmps r17, r22 wz
 if_nz jmp #\C__read_8 ' NEI4
 jmp #\@C__read_7 ' JUMPV addrg
C__read_8
 cmps r17,  #13 wz
 if_nz jmp #\C__read_10 ' NEI4
 mov r17, #10 ' reg <- coni
C__read_10
 mov r22, r15 ' CVI, CVU or LOAD
 mov r15, r22
 adds r15, #1 ' ADDI4 coni
 adds r22, r21 ' ADDI/P (1)
 mov r20, r17 ' CVI, CVU or LOAD
 wrbyte r20, r22 ' ASGNU1 reg reg
 cmps r17,  #10 wz
 if_nz jmp #\C__read_12 ' NEI4
 jmp #\@C__read_7 ' JUMPV addrg
C__read_12
C__read_6
 cmps r15, r19 wcz
 if_b jmp #\C__read_5 ' LTI4
C__read_7
C__read_3
 mov r0, r15 ' CVI, CVU or LOAD
' C__read_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import catalina_getc

' Catalina Import __stdin
' end
