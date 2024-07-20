' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _unmount

 alignl ' align long
C__unmount ' <symbol:_unmount>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r23, #3 ' reg <- coni
C__unmount_3
 mov r22, r23
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C___fdtab ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r22, r22 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C__unmount_7 ' EQU4
 mov r0, ##-1 ' RET con
 jmp #\@C__unmount_2 ' JUMPV addrg
C__unmount_7
' C__unmount_4 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #64 wcz
 if_b jmp #\C__unmount_3 ' LTI4
 mov r22, ##$ffffffff ' reg <- con
 wrlong r22, ##@C___pstart ' ASGNU4 addrg reg
 mov r0, #0 ' reg <- coni
C__unmount_2
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Import __pstart

' Catalina Import __fdtab
' end
