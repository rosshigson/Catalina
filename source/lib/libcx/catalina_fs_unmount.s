' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _unmount

 alignl ' align long
C__unmount ' <symbol:_unmount>
 PRIMITIVE(#PSHM)
 long $d00000 ' save registers
 mov r23, #3 ' reg <- coni
C__unmount_3
 mov r22, #28 ' reg <- coni
 #ifndef NO_INTERRUPTS
  stalli
 #endif
 qmul r22, r23 ' MULI4
 getqx r0
 #ifndef NO_INTERRUPTS
  allowi
 #endif
 mov r20, ##@C___fdtab+9 ' reg <- addrg
 mov r22, r0 ' ADDI/P
 adds r22, r20 ' ADDI/P (3)
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C__unmount_7 ' EQI4
 mov r0, ##-1 ' RET con
 jmp #\@C__unmount_2 ' JUMPV addrg
C__unmount_7
' C__unmount_4 ' (symbol refcount = 0)
 adds r23, #1 ' ADDI4 coni
 cmps r23,  #8 wcz
 if_b jmp #\C__unmount_3 ' LTI4
 mov r22, ##$ffffffff ' reg <- con
 wrlong r22, ##@C___pstart ' ASGNU4 addrg reg
 mov r0, #0 ' reg <- coni
C__unmount_2
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import __pstart

' Catalina Import __fdtab
' end
