' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _waitsec

 alignl ' align long
C__waitsec ' <symbol:_waitsec>
 alignl ' align long
 long I32_PSHM + $e00000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C__clockfreq)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__waitsec_3)<<S32 ' JUMPV addrg
 alignl ' align long
C__waitsec_2
 alignl ' align long
 long I32_CALA + (@C__cnt)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' ADDI/P
 word I16A_ADDS + (r2)<<D16A + (r22)<<S16A ' ADDI/P (3)
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__waitcnt)<<S32 ' CALL addrg
 word I16A_SUBI + (r23)<<D16A + (1)<<S16A ' SUBU4 reg coni
 alignl ' align long
C__waitsec_3
 word I16A_CMPI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__waitsec_2)<<S32 ' NEU4 reg coni
' C__waitsec_1 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Import _cnt

' Catalina Import _waitcnt

' Catalina Import _clockfreq
' end
