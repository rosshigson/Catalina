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
 jmp #NEWF
 jmp #PSHM
 long $400000 ' save registers
 jmp #LODL
 long @C__getpid_my_pid_L000005
 rdbyte r22, RI ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 cmps r22,  #0 wz
 jmp #BRNZ
 long @C__getpid_6 ' NEI4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__cnt ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 mov r2, r22 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_srand ' CALL addrg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C_rand ' CALL addrg
 mov r22, r0 ' CVI, CVU or LOAD
 jmp #LODL
 long @C__getpid_my_pid_L000005
 wrbyte r22, RI ' ASGNU1 addrg reg
C__getpid_6
 jmp #LODL
 long @C__getpid_my_pid_L000005
 rdbyte r22, RI ' reg <- INDIRU1 addrg
 and r22, cviu_m1 ' zero extend
 mov r0, r22 ' CVI, CVU or LOAD
' C__getpid_3 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _cnt

' Catalina Import srand

' Catalina Import rand
' end
