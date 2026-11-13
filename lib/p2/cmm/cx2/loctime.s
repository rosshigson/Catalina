' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export localtime

 alignl_label
C_localtime ' <symbol:localtime>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $fd0000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl_p1
 long I32_CALA + (@C__tzset)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_gmtime)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODI + (@C__timezone)<<S32
 word I16A_MOV + (r18)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 alignl_p1
 long I32_LODS + (r16)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r16)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_SUBS + (r20)<<D16A + (r0)<<S16A ' SUBI/P (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_LODI + (@C__timezone)<<S32
 word I16A_MOV + (r20)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 alignl_p1
 long I32_LODS + (r18)<<D32S + ((60)&$7FFFF)<<S32 ' reg <- cons
 word I16A_MOV + (r0)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_SUBS + (r22)<<D16A + (r1)<<S16A ' SUBI/P (1)
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_mktime)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C__dstget)<<S32 ' CALL addrg
 word I16A_MOV + (r19)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r19)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C_localtime_2)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_MOVI + (r18)<<D32 +(60)<<S32 ' reg <- conli
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r18)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_ADD + (r20)<<D16A + (r0)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRI4 reg
 alignl_p1
 long I32_MOVI + (r20)<<D32 +(60)<<S32 ' reg <- conli
 word I16A_MOV + (r0)<<D16A + (r19)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r20)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_ADD + (r22)<<D16A + (r1)<<S16A ' ADDU (1)
 word I16A_WRLONG + (r22)<<D16A + (r21)<<S16A ' ASGNI4 reg reg
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_mktime)<<S32 ' CALL addrg
 alignl_label
C_localtime_2
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
' C_localtime_1 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import _timezone

' Catalina Import _dstget

' Catalina Import _tzset

' Catalina Import gmtime

' Catalina Import mktime
' end
