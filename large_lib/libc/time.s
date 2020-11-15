' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export time

 long ' align long
C_time ' <symbol:time>
 jmp #NEWF
 sub SP, #4
 jmp #PSHM
 long $c00000 ' save registers
 mov r23, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_rtc_gettime ' CALL addrg
 mov RI, FP
 sub RI, #-(-4)
 wrlong r0, RI ' ASGNU4 addrli reg
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C_time_3 ' EQU4
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r22, r22 ' reg <- INDIRU4 regl
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNU4 reg reg
C_time_3
 mov r22, FP
 sub r22, #-(-4) ' reg <- addrli
 rdlong r0, r22 ' reg <- INDIRU4 regl
' C_time_2 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 add SP, #4 ' framesize
 jmp #RETF


' Catalina Import rtc_gettime
' end
