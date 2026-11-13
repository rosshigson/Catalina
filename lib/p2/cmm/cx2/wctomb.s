' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export wctomb

 alignl_label
C_wctomb ' <symbol:wctomb>
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_wctomb_4)<<S32 ' NEU4 reg coni
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
 alignl_p1
 long I32_JMPA + (@C_wctomb_3)<<S32 ' JUMPV addrg
 alignl_label
C_wctomb_4
 word I16A_WRBYTE + (r2)<<D16A + (r3)<<S16A ' ASGNU1 reg reg
 word I16A_MOVI + R0<<D16A + (1)<<S16A ' RET coni
 alignl_label
C_wctomb_3
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1
' end
