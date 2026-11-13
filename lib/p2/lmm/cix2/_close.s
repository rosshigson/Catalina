' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _close

 alignl ' align long
C__close ' <symbol:_close>
 jmp #NEWF
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C___fdtab
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C___valid ' CALL addrg
 cmps r0,  #0 wz
 jmp #BRNZ
 long @C__close_2 ' NEI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__close_1 ' JUMPV addrg
C__close_2
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C___fdtab
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_f_close ' CALL addrg
 cmp r0,  #0 wz
 jmp #BRNZ
 long @C__close_4 ' NEU4
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C___fdtab
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r2, r22 ' reg <- INDIRP4 reg
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_free ' CALL addrg
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C___fdtab
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r0, #0 ' RET coni
 jmp #JMPA
 long @C__close_1 ' JUMPV addrg
C__close_4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
C__close_1
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import free

' Catalina Import f_close

' Catalina Import __fdtab

' Catalina Import __valid
' end
