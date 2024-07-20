' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export fgetc

 alignl ' align long
C_fgetc ' <symbol:fgetc>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $c00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C_getchar)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_fgetc_1 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Data

DAT ' uninitialized data segment

' Catalina Export stdin

 alignl ' align long
C_stdin ' <symbol:stdin>
 byte 0[4]

' Catalina Code

DAT ' code segment

' Catalina Import getchar

' Catalina Data

DAT ' uninitialized data segment

' Catalina Code

DAT ' code segment
' end
