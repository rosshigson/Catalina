' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

 alignl ' align long
C_sjug_67b11099__seed_L000001 ' <symbol:_seed>
 alignl ' align long
 long I32_PSHM + $400000<<S32 ' save registers
 alignl ' align long
 long I32_MOV + (r22)<<D32 + (CNT)<<S32 ' reg <- INDIRU4 addrg special
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
' C_sjug_67b11099__seed_L000001_2 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Init

DAT ' initialized data segment

 alignl ' align long
C_getrand_seeded_L000005 ' <symbol:seeded>
 long 0

' Catalina Export getrand

' Catalina Code

DAT ' code segment

 alignl ' align long
C_getrand ' <symbol:getrand>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $540000<<S32 ' save registers
 alignl ' align long
 long I32_LODI + (@C_getrand_seeded_L000005)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRI4 addrg
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_getrand_6)<<S32 ' NEI4 reg coni
 alignl ' align long
 long I32_CALA + (@C_sjug_67b11099__seed_L000001)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_srand)<<S32 ' CALL addrg
 word I16A_MOVI + (r22)<<D16A + (1)<<S16A ' reg <- coni
 alignl ' align long
 long I32_LODA + (@C_getrand_seeded_L000005)<<S32
 word I16A_WRLONG + (r22)<<D16A + RI<<S16A ' ASGNI4 addrg reg
 alignl ' align long
C_getrand_6
 alignl ' align long
 long I32_CALA + (@C_rand)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_CALA + (@C_rand)<<S32 ' CALL addrg
 word I16A_MOV + (r20)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_CALA + (@C_rand)<<S32 ' CALL addrg
 word I16A_MOV + (r18)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_SHLI + (r22)<<D16A + (20)<<S16A ' SHLI4 reg coni
 word I16A_SHLI + (r20)<<D16A + (10)<<S16A ' SHLI4 reg coni
 word I16A_XOR + (r22)<<D16A + (r20)<<S16A ' BXORI/U (1)
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' BXORI/U
 word I16A_XOR + (r0)<<D16A + (r18)<<S16A ' BXORI/U (3)
' C_getrand_3 ' (symbol refcount = 0)
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import rand

' Catalina Import srand
' end
