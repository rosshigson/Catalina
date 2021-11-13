' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export abs

 alignl ' align long
C_abs ' <symbol:abs>
 PRIMITIVE(#PSHM)
 long $800000 ' save registers
 cmps r2,  #0 wcz
 if_b jmp #\C_abs_5 ' LTI4
 mov r23, r2 ' CVI, CVU or LOAD
 jmp #\@C_abs_6 ' JUMPV addrg
C_abs_5
 neg r23, r2 ' NEGI4
C_abs_6
 mov r0, r23 ' CVI, CVU or LOAD
' C_abs_3 ' (symbol refcount = 0)
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)

' end
