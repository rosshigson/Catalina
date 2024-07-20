' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _unmount

 alignl ' align long
C__unmount ' <symbol:_unmount>
 jmp #PSHM
 long $d00000 ' save registers
 mov r23, #3 ' reg <- coni
C__unmount_3
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C___fdtab
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C__unmount_7 ' EQU4
 jmp #LODL
 long -1
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C__unmount_2 ' JUMPV addrg
C__unmount_7
' C__unmount_4 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #20 wz,wc
 jmp #BR_B
 long @C__unmount_3 ' LTI4
 jmp #LODL
 long $ffffffff
 mov r22, RI ' reg <- con
 jmp #LODL
 long @C___pstart
 wrlong r22, RI ' ASGNU4 addrg reg
 mov r0, #0 ' RET coni
C__unmount_2
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import __pstart

' Catalina Import __fdtab
' end
