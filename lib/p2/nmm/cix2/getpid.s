' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C__getpid_my_pid_L000005 ' <symbol:my_pid>
 byte $0

' Catalina Export _getpid

' Catalina Code

DAT ' code segment

 alignl ' align long
C__getpid ' <symbol:_getpid>
 calld PA,#NEWF
 calld PA,#PSHM
 long $400000 ' save registers
 mov r22, ##@C__getpid_my_pid_L000005 ' reg <- addrg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 cmps r22,  #0 wz
 if_nz jmp #\C__getpid_6 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C_srand ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 calld PA,#CALA
 long @C_rand ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 wrbyte r22, ##@C__getpid_my_pid_L000005 ' ASGNU1 addrg reg
C__getpid_6
 mov r22, ##@C__getpid_my_pid_L000005 ' reg <- addrg
 rdbyte r22, r22 ' reg <- CVUI4 INDIRU1 reg
 mov r0, r22 ' CVI, CVU or LOAD
' C__getpid_3 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 calld PA,#RETF


' Catalina Import _cnt

' Catalina Import srand

' Catalina Import rand
' end
