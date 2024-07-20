' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export tty_decl

 alignl ' align long
C_tty_decl ' <symbol:tty_decl>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $eaa000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r4)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r19)<<D16A + (r2)<<S16A ' reg var <- reg arg
 word I16B_LODL + (r17)<<D16B
 alignl ' align long
 long 1000000000 ' reg <- con
 word I16A_MOVI + (r13)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_CMPSI + (r21)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_tty_decl_2)<<S32 ' GEI4 reg coni
 word I16A_MOVI + (r21)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
C_tty_decl_2
 word I16A_CMPSI + (r21)<<D16A + (10)<<S16A
 alignl ' align long
 long I32_BRBE + (@C_tty_decl_4)<<S32 ' LEI4 reg coni
 word I16A_MOVI + (r21)<<D16A + (10)<<S16A ' reg <- coni
 alignl ' align long
C_tty_decl_4
 word I16A_CMPSI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_tty_decl_6)<<S32 ' GEI4 reg coni
 word I16A_NEG + (r23)<<D16A + (r23)<<S16A ' NEGI4
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (45)<<S32 ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_tty_tx)<<S32 ' CALL addrg
 alignl ' align long
C_tty_decl_6
 word I16A_MOVI + (r22)<<D16A + (3)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_tty_decl_8)<<S32 ' EQI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' SUBI/P
 word I16A_SUBS + (r15)<<D16A + (r21)<<S16A ' SUBI/P (3)
 alignl ' align long
 long I32_JMPA + (@C_tty_decl_13)<<S32 ' JUMPV addrg
 alignl ' align long
C_tty_decl_10
 word I16A_MOVI + (r22)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_tty_decl_11 ' (symbol refcount = 0)
 word I16A_SUBSI + (r15)<<D16A + (1)<<S16A ' SUBI4 reg coni
 alignl ' align long
C_tty_decl_13
 word I16A_CMPSI + (r15)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_tty_decl_10)<<S32 ' GTI4 reg coni
 alignl ' align long
C_tty_decl_8
 word I16A_MOVI + (r15)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_tty_decl_17)<<S32 ' JUMPV addrg
 alignl ' align long
C_tty_decl_14
 word I16A_CMPS + (r23)<<D16A + (r17)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_tty_decl_18)<<S32 ' LTI4 reg reg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 alignl ' align long
 long I32_LODS + (r22)<<D32S + ((48)&$7FFFF)<<S32 ' reg <- cons
 word I16A_ADDS + (r22)<<D16A + (r0)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVUI
 word I16B_TRN1 + (r2)<<D16B ' zero extend
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_tty_tx)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r23)<<D16A + (r1)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r13)<<D16A + (-(-1)&$1F)<<S16A ' reg <- conn
 alignl ' align long
 long I32_JMPA + (@C_tty_decl_19)<<S32 ' JUMPV addrg
 alignl ' align long
C_tty_decl_18
 word I16A_CMPSI + (r17)<<D16A + (1)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_tty_decl_23)<<S32 ' EQI4 reg coni
 word I16A_CMPSI + (r13)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_tty_decl_23)<<S32 ' NEI4 reg coni
 word I16A_MOVI + (r22)<<D16A + (2)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_tty_decl_20)<<S32 ' EQI4 reg coni
 alignl ' align long
C_tty_decl_23
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (48)<<S32 ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_tty_tx)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_tty_decl_21)<<S32 ' JUMPV addrg
 alignl ' align long
C_tty_decl_20
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 word I16A_AND + (r22)<<D16A + (r19)<<S16A ' BANDI/U (2)
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_tty_decl_24)<<S32 ' EQI4 reg coni
 alignl ' align long
 long I32_MOVI + (r2)<<D32 + (32)<<S32 ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_tty_tx)<<S32 ' CALL addrg
 alignl ' align long
C_tty_decl_24
 alignl ' align long
C_tty_decl_21
 alignl ' align long
C_tty_decl_19
 word I16A_MOVI + (r22)<<D16A + (10)<<S16A ' reg <- coni
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16B_DIVS ' DIVI
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_tty_decl_15 ' (symbol refcount = 0)
 word I16A_ADDSI + (r15)<<D16A + (1)<<S16A ' ADDI4 reg coni
 alignl ' align long
C_tty_decl_17
 word I16A_CMPS + (r15)<<D16A + (r21)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_tty_decl_14)<<S32 ' LTI4 reg reg
' C_tty_decl_1 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import tty_tx
' end
