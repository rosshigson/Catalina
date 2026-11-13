' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
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
 jmp #PSHM
 long $540000 ' save registers
 mov r22, #0 ' reg <- coni
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r20, r22 wz
 jmp #BR_Z
 long @C___valid_2 ' EQU4
 mov RI, r2
 jmp #RLNG
 mov r20, BC ' reg <- INDIRP4 reg
 mov r18, r20 ' CVI, CVU or LOAD
 cmp r18, r22 wz
 jmp #BR_Z
 long @C___valid_2 ' EQU4
 mov RI, r20
 jmp #RBYT
 mov r22, BC ' reg <- INDIRU1 reg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BR_Z
 long @C___valid_2 ' EQI4
 mov r22, r2
 adds r22, #4 ' ADDP4 coni
 mov RI, r22
 jmp #RWRD
 mov r22, BC ' reg <- INDIRU2 reg
 and r22, cviu_m2 ' zero extend
 adds r20, #6 ' ADDP4 coni
 mov RI, r20
 jmp #RWRD
 mov r20, BC ' reg <- INDIRU2 reg
 and r20, cviu_m2 ' zero extend
 cmps r22, r20 wz
 jmp #BRNZ
 long @C___valid_2 ' NEI4
 mov r0, #1 ' reg <- coni
 jmp #JMPA
 long @C___valid_1 ' JUMPV addrg
C___valid_2
 mov r0, #0 ' reg <- coni
C___valid_1
 jmp #POPM ' restore registers
 jmp #RETN


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
