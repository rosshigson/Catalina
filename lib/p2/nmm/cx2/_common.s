' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

' Catalina Export __vol

 alignl ' align long
C___vol ' <symbol:__vol>
 byte 48
 byte 58
 byte 0

' Catalina Export __valid

' Catalina Code

DAT ' code segment

 alignl ' align long
C___valid ' <symbol:__valid>
 calld PA,#PSHM
 long $540000 ' save registers
 mov r22, #0 ' reg <- coni
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 if_z jmp #\C___valid_2 ' EQU4
 rdlong r20, r2 ' reg <- INDIRP4 reg
 mov r18, r20 ' CVI, CVU or LOAD
 cmp r18, r22 wz
 if_z jmp #\C___valid_2 ' EQU4
 rdbyte r22, r20 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_z jmp #\C___valid_2 ' EQI4
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 rdword r22, r22 ' reg <- CVUI4 INDIRU2 reg
 adds r20, #6 ' ADDP4 coni
 rdword r20, r20 ' reg <- CVUI4 INDIRU2 reg
 cmps r22, r20 wz
 if_nz jmp #\C___valid_2 ' NEI4
 mov r0, #1 ' reg <- coni
 jmp #\@C___valid_1 ' JUMPV addrg
C___valid_2
 mov r0, #0 ' reg <- coni
C___valid_1
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Data

DAT ' uninitialized data segment

' Catalina Export __fs

 alignl ' align long
C___fs ' <symbol:__fs>
 byte 0[872]

' Catalina Export __fdtab

 alignl ' align long
C___fdtab ' <symbol:__fdtab>
 byte 0[256]

' Catalina Code

DAT ' code segment
' end
