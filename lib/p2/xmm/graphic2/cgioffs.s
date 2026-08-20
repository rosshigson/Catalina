' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export cgi_x_offs

 alignl ' align long
C_cgi_x_offs ' <symbol:cgi_x_offs>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cgi_data ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
' C_cgi_x_offs_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Export cgi_y_offs

 alignl ' align long
C_cgi_y_offs ' <symbol:cgi_y_offs>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cgi_data ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 regl
 mov RI, r22
 jmp #RLNG
 mov r0, BC ' reg <- INDIRI4 reg
' C_cgi_y_offs_5 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import _cgi_data
' end
