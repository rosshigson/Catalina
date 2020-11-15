' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _unmount

 long ' align long
C__unmount ' <symbol:_unmount>
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, #3 ' reg <- coni
C__unmount_3
 mov r22, #28 ' reg <- coni
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 jmp #LODL
 long @C___fdtab+9
 mov r20, RI ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 mov RI, r22
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C__unmount_7 ' EQI4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__unmount_2 ' JUMPV addrg
C__unmount_7
' C__unmount_4 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #8 wz,wc
 jmp #BR_B
 long @C__unmount_3 ' LTI4
 jmp #LODL
 long $ffffffff
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C___pstart
 mov BC, r22
 jmp #WLNG ' ASGNU4 addrg reg
 mov r0, #0 ' reg <- coni
C__unmount_2
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import __pstart

' Catalina Import __fdtab
' end
