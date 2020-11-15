' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export cgi_screen_data

 alignl ' align long
C_cgi_screen_data ' <symbol:cgi_screen_data>
 PRIMITIVE(#NEWF)
 sub SP, #16
 PRIMITIVE(#PSHM)
 long $d00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_cgi_x_tiles ' CALL addrg
 mov RI, FP
 sub RI, #-(-8)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_cgi_y_tiles ' CALL addrg
 mov RI, FP
 sub RI, #-(-12)
 wrlong r0, RI ' ASGNI4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r20, FP
 sub r20, #-(-12) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRI4 reg
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r20 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r22, r0
 shl r22, #4 ' LSHI4 coni
 shl r22, #4 ' LSHI4 coni
 shl r22, #1 ' LSHI4 coni
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-4)
 wrlong r22, RI ' ASGNU4 addrli reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__cgi_data ' CALL addrg
 mov r20, ##$ffff ' reg <- con
 mov r22, r0 ' BANDI/U
 and r22, r20 ' BANDI/U (3)
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov RI, FP
 sub RI, #-(-16)
 wrlong r22, RI ' ASGNU4 addrli reg
 cmps r23,  #0 wz
 if_z jmp #\C_cgi_screen_data_2 ' EQI4
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov r0, r22 ' CVI, CVU or LOAD
 jmp #\@C_cgi_screen_data_1 ' JUMPV addrg
C_cgi_screen_data_2
 mov r22, FP
 sub r22, #-(-16) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r0, r22 ' CVI, CVU or LOAD
C_cgi_screen_data_1
 PRIMITIVE(#POPM) ' restore registers
 add SP, #16 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _cgi_data

' Catalina Import cgi_y_tiles

' Catalina Import cgi_x_tiles
' end
