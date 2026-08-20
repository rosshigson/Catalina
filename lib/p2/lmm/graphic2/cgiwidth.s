' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export cgi_pixel_width

 alignl ' align long
C_cgi_pixel_width ' <symbol:cgi_pixel_width>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $400000 ' save registers
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cgi_data ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 adds r22, #24 ' ADDP4 coni
 jmp #LODF
 long -8
 wrlong r22, RI ' ASGNP4 addrl reg
 mov r22, FP
 sub r22, #-(-8) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRP4 reg
 rdlong r22, r22 ' reg <- INDIRI4 reg
 mov r0, r22 ' CVI, CVU or LOAD
' C_cgi_pixel_width_4 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import _cgi_data
' end
