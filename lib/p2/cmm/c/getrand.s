' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl_label
C_saag_68f73964__seed_L000001 ' <symbol:_seed>
 alignl_p1
 long I32_PSHM + $400000<<S32 ' save registers
' loading argument C_saag_68f73964__seed_L000001_3_L000004 to PASM eliminated
'START PASM ... 
 word I16B_PASM
 alignl

'... END PASM
' call to PASM eliminated
' loading argument C_saag_68f73964__seed_L000001_5_L000006 to PASM eliminated
'START PASM ... 
getct r0

'... END PASM
' call to PASM eliminated
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
' C_saag_68f73964__seed_L000001_2 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Init

DAT ' initialized data segment

 alignl_label
C_getrand_seeded_L000009 ' <symbol:seeded>
 long 0

' Catalina Export getrand

' Catalina Code

DAT ' code segment

 alignl_label
C_getrand ' <symbol:getrand>
 alignl_p1
 long I32_NEWF + 0<<S32
 alignl_p1
 long I32_PSHM + $540000<<S32 ' save registers
 alignl_p1
 long I32_LODI + (@C_getrand_seeded_L000009)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C_getrand_10)<<S32 ' NEI4 reg coni
 alignl_p1
 long I32_CALA + (@C_saag_68f73964__seed_L000001)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl_p1
 long I32_CALA + (@C_srand)<<S32 ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 alignl_p1
 long I32_LODA + (@C_getrand_seeded_L000009)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl_label
C_getrand_10
 alignl_p1
 long I32_CALA + (@C_rand)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C_rand)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl_p1
 long I32_CALA + (@C_rand)<<S32 ' CALL addrg
 word I16A_MOV + (r18)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r22)<<D16A + (20)<<S16A ' SHLI4 reg coni
 word I16A_SHLI + (r20)<<D16A + (10)<<S16A ' SHLI4 reg coni
 word I16A_XOR + (r22)<<D16A + (r20)<<S16A ' BXORI/U (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' BXORI/U
 word I16A_XOR + (r0)<<D16A + (r18)<<S16A ' BXORI/U (3)
' C_getrand_7 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl_p1

' Catalina Import rand

' Catalina Import srand
' end
