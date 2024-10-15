' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _load_overlay_unmanaged

 alignl ' align long
C__load_overlay_unmanaged ' <symbol:_load_overlay_unmanaged>
 calld PA,#NEWF
 sub SP, #28
 calld PA,#PSHM
 long $ea8000 ' save registers
 mov r23, r4 ' reg var <- reg arg
 mov r21, r3 ' reg var <- reg arg
 mov r19, r2 ' reg var <- reg arg
 mov r2, FP
 sub r2, #-(-32) ' reg ARG ADDRLi
 mov r3, #0 ' reg ARG coni
 mov r4, r23 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__open_unmanaged
 add SP, #8 ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 cmps r17,  #0 wcz
 if_b jmp #\C__load_overlay_unmanaged_3 ' LTI4
 mov r2, r19 ' CVI, CVU or LOAD
 mov r3, r21 ' CVI, CVU or LOAD
 mov r4, r17 ' CVI, CVU or LOAD
 mov BC, #12 ' arg size, rpsize = 12, spsize = 12
 sub SP, #8 ' stack space for reg ARGs
 calld PA,#CALA
 long @C__read
 add SP, #8 ' CALL addrg
 mov r2, r17 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 calld PA,#CALA
 long @C__close_unmanaged ' CALL addrg
C__load_overlay_unmanaged_3
 cmps r17,  #0 wcz
 if_b jmp #\C__load_overlay_unmanaged_6 ' LTI4
 mov r15, #1 ' reg <- coni
 jmp #\@C__load_overlay_unmanaged_7 ' JUMPV addrg
C__load_overlay_unmanaged_6
 mov r15, #0 ' reg <- coni
C__load_overlay_unmanaged_7
 mov r0, r15 ' CVI, CVU or LOAD
' C__load_overlay_unmanaged_2 ' (symbol refcount = 0)
 calld PA,#POPM ' restore registers
 add SP, #28 ' framesize
 calld PA,#RETF


' Catalina Import _read

' Catalina Import _close_unmanaged

' Catalina Import _open_unmanaged
' end
