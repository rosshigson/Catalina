' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export s_bin

 alignl ' align long
C_s_bin ' <symbol:s_bin>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $e80000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((32)&$7FFFF)<<S32 ' reg <- cons
 word I16A_SUBS + (r22)<<D16A + (r21)<<S16A ' SUBI/P (1)
 word I16A_SHL + (r23)<<D16A + (r22)<<S16A ' LSHI/U (1)
 alignl ' align long
 long I32_JMPA + (@C_s_bin_3)<<S32 ' JUMPV addrg
 alignl ' align long
C_s_bin_2
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $80000000 ' reg <- con
 word I16A_AND + (r22)<<D16A + (r23)<<S16A ' BANDI/U (2)
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_s_bin_6)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_LODS + (r19)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 alignl ' align long
 long I32_JMPA + (@C_s_bin_7)<<S32 ' JUMPV addrg
 alignl ' align long
C_s_bin_6
 alignl ' align long
 long I32_LODS + (r19)<<D32S + ((49)&$7FFFF)<<S32 ' reg <- cons
 alignl ' align long
C_s_bin_7
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_s_tx)<<S32 ' CALL addrg
 word I16A_SHLI + (r23)<<D16A + (1)<<S16A ' SHLU4 reg coni
 alignl ' align long
C_s_bin_3
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_SUBSI + (r21)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_s_bin_2)<<S32 ' GTI4 reg coni
' C_s_bin_1 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import s_tx
' end
