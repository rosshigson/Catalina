' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_s7es_66950845_digits_L000001 ' <symbol:digits>
 byte 48
 byte 49
 byte 50
 byte 51
 byte 52
 byte 53
 byte 54
 byte 55
 byte 56
 byte 57
 byte 97
 byte 98
 byte 99
 byte 100
 byte 101
 byte 102

' Catalina Export putlhex

' Catalina Code

DAT ' code segment

 alignl ' align long
C_putlhex ' <symbol:putlhex>
 calld PA,#NEWF
 sub SP, #20
 calld PA,#PSHM
 long $f40000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, #0 ' reg <- coni
 mov RI, FP
 sub RI, #-(-8)
 wrbyte r22, RI ' ASGNU1 addrli reg
 mov r21, FP
 sub r21, #-(-9) ' reg <- addrli
C_putlhex_5
 mov r22, r21 ' CVI, CVU or LOAD
 mov r20, ##-1 ' reg <- con
 mov r21, r22 ' ADDI/P
 adds r21, r20 ' ADDI/P (3)
 mov r20, r23
 and r20, #15 ' BANDU4 coni
 mov r18, ##@C_s7es_66950845_digits_L000001 ' reg <- addrg
 adds r20, r18 ' ADDI/P (1)
 rdbyte r20, r20 ' reg <- INDIRU1 reg
 wrbyte r20, r22 ' ASGNU1 reg reg
 shr r23, #4 ' RSHU4 coni
' C_putlhex_6 ' (symbol refcount = 0)
 cmp r23,  #0 wz
 if_nz jmp #\C_putlhex_5  ' NEU4
 mov r2, r21
 adds r2, #1 ' ADDP4 coni
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_putstr ' CALL addrg
' C_putlhex_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #20 ' framesize
 calld PA,#RETF


' Catalina Import putstr
' end
