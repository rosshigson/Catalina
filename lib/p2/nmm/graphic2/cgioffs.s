' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export cgi_x_offs

 alignl ' align long
C_cgi_x_offs ' <symbol:cgi_x_offs>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cgi_data ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_cgi_x_offs_4 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Export cgi_y_offs

 alignl ' align long
C_cgi_y_offs ' <symbol:cgi_y_offs>
 calld PA,#NEWF
 sub SP, #4
 calld PA,#PSHM
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cgi_data ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, #4 ' ADDP4 coni
 mov RI, FP
 sub RI, #-(-8)
 wrlong r22, RI ' ASGNP4 addrli reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r0, r22 ' reg <- INDIRI4 reg
' C_cgi_y_offs_5 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #4 ' framesize
 calld PA,#RETF


' Catalina Import _cgi_data
' end
