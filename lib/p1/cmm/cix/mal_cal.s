' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export calloc

 alignl ' align long
C_calloc ' <symbol:calloc>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fa8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r3)<<S16A ' reg var <- reg arg
 word I16A_MOV + (r21)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C__memory_lock)<<S32 ' CALL addrg
 word I16A_CMPI + (r21)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_calloc_4)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C__memory_unlock)<<S32 ' CALL addrg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_calloc_3)<<S32 ' JUMPV addrg
 alignl ' align long
C_calloc_4
 word I16A_CMPI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_calloc_6)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C__memory_unlock)<<S32 ' CALL addrg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_calloc_3)<<S32 ' JUMPV addrg
 alignl ' align long
C_calloc_6
 word I16A_NEGI + (r22)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_CMP + (r0)<<D16A + (r23)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_calloc_9)<<S32 ' GEU4 reg reg
 alignl ' align long
 long I32_CALA + (@C__memory_unlock)<<S32 ' CALL addrg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_calloc_3)<<S32 ' JUMPV addrg
' C_calloc_8 ' (symbol refcount = 0)
 word I16A_NEGI + (r22)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r0)<<D16A + (r22)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16B_DIVU ' DIVU
 word I16A_CMP + (r0)<<D16A + (r23)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_calloc_13)<<S32 ' GEU4 reg reg
 alignl ' align long
 long I32_CALA + (@C__memory_unlock)<<S32 ' CALL addrg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_calloc_3)<<S32 ' JUMPV addrg
' C_calloc_12 ' (symbol refcount = 0)
 alignl ' align long
 long I32_CALA + (@C__memory_unlock)<<S32 ' CALL addrg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_calloc_3)<<S32 ' JUMPV addrg
 alignl ' align long
C_calloc_13
 alignl ' align long
C_calloc_9
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' setup r0/r1 (2)
 word I16A_MOV + (r1)<<D16A + (r23)<<S16A ' setup r0/r1 (2)
 word I16B_MULT ' MULT(I/U)
 word I16A_MOV + (r15)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r15)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_calloc_16)<<S32 ' GEU4 reg coni
 word I16A_MOVI + (r15)<<D16A + (8)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_calloc_17)<<S32 ' JUMPV addrg
 alignl ' align long
C_calloc_16
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r15)<<D16A + (r20)<<S16A ' BANDI/U (3)
 alignl ' align long
C_calloc_17
 word I16B_LODL + (r22)<<D16B
 alignl ' align long
 long $1000000 ' reg <- con
 word I16A_CMP + (r15)<<D16A + (r22)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_calloc_18)<<S32 ' LTU4 reg reg
 alignl ' align long
 long I32_CALA + (@C__memory_unlock)<<S32 ' CALL addrg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_calloc_3)<<S32 ' JUMPV addrg
 alignl ' align long
C_calloc_18
 alignl ' align long
 long I32_CALA + (@C__memory_unlock)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C_malloc)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_CALA + (@C__memory_lock)<<S32 ' CALL addrg
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A
 word I16A_SHRI + (r22)<<D16A + (2)<<S16A ' SHRU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r19)<<D16A + (r17)<<S16A ' ADDI/P (3)
 alignl ' align long
 long I32_JMPA + (@C_calloc_21)<<S32 ' JUMPV addrg
 alignl ' align long
C_calloc_20
 word I16A_NEGI + (r22)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r19)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r19)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r20)<<D16A + (0)<<S16A ' reg <- coni
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNI4 reg reg
 alignl ' align long
C_calloc_21
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_calloc_20)<<S32 ' NEU4 reg reg
 alignl ' align long
 long I32_CALA + (@C__memory_unlock)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_calloc_3
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Import _memory_unlock

' Catalina Import _memory_lock

' Catalina Import malloc
' end
