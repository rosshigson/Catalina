' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export cgi_screen_data

 alignl ' align long
C_cgi_screen_data ' <symbol:cgi_screen_data>
 jmp #NEWF
 sub SP, #16
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_x_tiles ' CALL addrg
 jmp #LODF
 long -12
 wrlong r0, RI ' ASGNI4 addrl reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_cgi_y_tiles ' CALL addrg
 jmp #LODF
 long -16
 wrlong r0, RI ' ASGNI4 addrl reg
 mov r22, FP
 sub r22, #-(-12) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-16) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r22, r0
 shl r22, #4 ' LSHI4 coni
 shl r22, #4 ' LSHI4 coni
 shl r22, #1 ' LSHI4 coni
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 jmp #DIVS ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cgi_data ' CALL addrg
 jmp #LODL
 long $ffff
 mov r20, RI ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 jmp #LODF
 long -20
 wrlong r22, RI ' ASGNU4 addrl reg
 cmps r23,  #0 wz
 jmp #BR_Z
 long @C_cgi_screen_data_2 ' EQI4
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-8) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C_cgi_screen_data_1 ' JUMPV addrg
C_cgi_screen_data_2
 mov r22, FP
 sub r22, #-(-20) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r0, r22 ' CVI, CVU or LOAD
C_cgi_screen_data_1
 jmp #POPM ' restore registers
 add SP, #16 ' framesize
 jmp #RETF


' Catalina Import _cgi_data

' Catalina Import cgi_y_tiles

' Catalina Import cgi_x_tiles
' end
