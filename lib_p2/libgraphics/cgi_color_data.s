' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export cgi_color_data

 alignl ' align long
C_cgi_color_data ' <symbol:cgi_color_data>
 PRIMITIVE(#NEWF)
 sub SP, #8
 PRIMITIVE(#PSHM)
 long $fc0000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_cgi_x_tiles ' CALL addrg
 mov r21, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C_cgi_y_tiles ' CALL addrg
 mov r19, r0 ' CVI, CVU or LOAD
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 mov r22, r0
 shl r22, #4 ' LSHI4 coni
 shl r22, #4 ' LSHI4 coni
 shl r22, #1 ' LSHI4 coni
 mov r20, #8 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r20 ' setup r0/r1 (2)
 PRIMITIVE(#DIVS) ' DIVI
 mov r22, r0 ' CVI, CVU or LOAD
 PRIMITIVE(#LODF)
 long -4
 wrlong r22, RI ' ASGNU4 addrl reg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 PRIMITIVE(#CALA)
 long @C__cgi_data ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r19 ' setup r0/r1 (2)
 PRIMITIVE(#MULT) ' MULT(I/U)
 PRIMITIVE(#LODL)
 long $ffff
 mov r18, RI ' reg <- con
 and r22, r18 ' BANDI/U (1)
 mov r18, FP
 sub r18, #-(-4) ' reg <- addrli
 rdlong r18, r18 ' reg <- INDIRU4 reg
 add r22, r18 ' ADDU (1)
 mov r20, r0
 shl r20, #1 ' LSHI4 coni
 add r22, r20 ' ADDU (1)
 PRIMITIVE(#LODF)
 long -8
 wrlong r22, RI ' ASGNU4 addrl reg
 cmps r23,  #0 wz
 PRIMITIVE(#BR_Z)
 long @C_cgi_color_data_2 ' EQI4
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r20, FP
 sub r20, #-(-4) ' reg <- addrli
 rdlong r20, r20 ' reg <- INDIRU4 reg
 add r22, r20 ' ADDU (1)
 mov r0, r22 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C_cgi_color_data_1 ' JUMPV addrg
C_cgi_color_data_2
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r0, r22 ' CVI, CVU or LOAD
C_cgi_color_data_1
 PRIMITIVE(#POPM) ' restore registers
 add SP, #8 ' framesize
 PRIMITIVE(#RETF)


' Catalina Import _cgi_data

' Catalina Import cgi_y_tiles

' Catalina Import cgi_x_tiles
' end
