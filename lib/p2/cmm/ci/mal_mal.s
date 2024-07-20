' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export malloc

 alignl ' align long
C_malloc ' <symbol:malloc>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_PSHM + $fe8000<<S32 ' save registers
 word I16A_MOV + (r23)<<D16A + (r2)<<S16A ' reg var <- reg arg
 alignl ' align long
 long I32_CALA + (@C__memory_lock)<<S32 ' CALL addrg
 word I16A_CMPI + (r23)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_malloc_4)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C__memory_unlock)<<S32 ' CALL addrg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_malloc_3)<<S32 ' JUMPV addrg
 alignl ' align long
C_malloc_4
 word I16A_CMPI + (r23)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_malloc_6)<<S32 ' GEU4 reg coni
 word I16A_MOVI + (r23)<<D16A + (8)<<S16A ' reg <- coni
 alignl ' align long
 long I32_JMPA + (@C_malloc_7)<<S32 ' JUMPV addrg
 alignl ' align long
C_malloc_6
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDI + (r22)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_NEGI + (r20)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r23)<<D16A + (r20)<<S16A ' BANDI/U (3)
 alignl ' align long
C_malloc_7
 alignl ' align long
 long I32_MOVI + RI<<D32 + (256)<<S32
 word I16A_CMP + (r23)<<D16A + RI<<S16A
 alignl ' align long
 long I32_BR_A + (@C_malloc_8)<<S32 ' GTU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_SHRI + (r22)<<D16A + (3)<<S16A ' SHRU4 reg coni
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C__malloc_store ' reg <- addrg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A ' ADDI/P
 word I16A_ADDS + (r17)<<D16A + (r20)<<S16A ' ADDI/P (3)
 word I16A_RDLONG + (r22)<<D16A + (r17)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_Z + (@C_malloc_10)<<S32 ' EQU4 reg coni
 word I16A_RDLONG + (r22)<<D16A + (r21)<<S16A ' reg <- INDIRP4 reg
 word I16A_WRLONG + (r22)<<D16A + (r17)<<S16A ' ASGNP4 reg reg
 word I16A_NEGI + (r22)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_NEGI + (r18)<<D16A + (-($fffffffd)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl ' align long
 long I32_CALA + (@C__memory_unlock)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C_malloc_3)<<S32 ' JUMPV addrg
 alignl ' align long
C_malloc_10
 alignl ' align long
C_malloc_8
 word I16A_MOV + (r17)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + (r19)<<D16A + (0)<<S16A ' reg <- coni
 alignl ' align long
C_malloc_12
 word I16A_SHRI + (r17)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_ADDSI + (r19)<<D16A + (1)<<S16A ' ADDI4 reg coni
' C_malloc_13 ' (symbol refcount = 0)
 word I16A_CMPI + (r17)<<D16A + (8)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_malloc_12)<<S32 ' GEU4 reg coni
 word I16A_CMPSI + (r19)<<D16A + (21)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_malloc_15)<<S32 ' LTI4 reg coni
 alignl ' align long
 long I32_CALA + (@C__memory_unlock)<<S32 ' CALL addrg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_malloc_3)<<S32 ' JUMPV addrg
 alignl ' align long
C_malloc_15
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__malloc_first_present)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_malloc_17)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r22)<<D16A + (8)<<S16A ' reg <- coni
 word I16A_SHL + (r22)<<D16A + (r19)<<S16A ' LSHI/U (1)
 word I16A_ADDI + (r22)<<D16A + (8)<<S16A ' ADDU4 reg coni
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(64)<<S32 ' reg <- conli
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_SUBI + (r22)<<D16A + (1)<<S16A ' SUBU4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long $ffffffc0 ' reg <- con
 word I16A_MOV + (r15)<<D16A + (r22)<<S16A ' BANDI/U
 word I16A_AND + (r15)<<D16A + (r20)<<S16A ' BANDI/U (3)
 alignl ' align long
 long I32_LODI + (@C_ml_last)<<S32
 word I16A_MOV + (r22)<<D16A + RI<<S16A ' reg <- INDIRP4 addrg
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_malloc_19)<<S32 ' NEU4 reg coni
 word I16A_MOVI + (r2)<<D16A + (0)<<S16A ' reg ARG coni
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__sbrk)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r20)<<D16A + (r17)<<S16A
 word I16A_ADDI + (r20)<<D16A + (7)<<S16A ' ADDU4 reg coni
 word I16A_NEGI + (r18)<<D16A + (-($fffffff8)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_MOV + (r22)<<D16A + (r20)<<S16A ' SUBU
 word I16A_SUB + (r22)<<D16A + (r17)<<S16A ' SUBU (3)
 word I16A_MOV + (r2)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__sbrk)<<S32 ' CALL addrg
 alignl ' align long
C_malloc_19
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRAE + (@C_malloc_21)<<S32 ' GEI4 reg coni
 word I16B_LODL + (r17)<<D16B
 alignl ' align long
 long $ffffffff ' reg <- con
 alignl ' align long
 long I32_JMPA + (@C_malloc_22)<<S32 ' JUMPV addrg
 alignl ' align long
C_malloc_21
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__sbrk)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_malloc_22
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_malloc_23)<<S32 ' NEU4 reg reg
 word I16A_MOV + (r15)<<D16A + (r23)<<S16A
 word I16A_ADDI + (r15)<<D16A + (8)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPSI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BR_B + (@C_malloc_25)<<S32 ' LTI4 reg coni
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__sbrk)<<S32 ' CALL addrg
 word I16A_MOV + (r17)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_malloc_25
 alignl ' align long
C_malloc_23
 word I16A_MOV + (r22)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16A_NEGI + (r20)<<D16A + (-($ffffffff)&$1F)<<S16A ' reg <- conn
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_malloc_27)<<S32 ' NEU4 reg reg
 alignl ' align long
 long I32_CALA + (@C__malloc_sell_out)<<S32 ' CALL addrg
 word I16A_MOV + (r2)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__malloc_first_present)<<S32 ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_malloc_18)<<S32 ' NEU4 reg coni
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r19)<<S16A
 word I16A_SUBSI + (r3)<<D16A + (1)<<S16A ' SUBI4 reg coni
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__malloc_search_free_list)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C_malloc_31)<<S32 ' NEU4 reg coni
 alignl ' align long
 long I32_CALA + (@C__memory_unlock)<<S32 ' CALL addrg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
 long I32_JMPA + (@C_malloc_3)<<S32 ' JUMPV addrg
 alignl ' align long
C_malloc_31
 word I16A_MOV + (r2)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_MOVI + BC<<D16A + 4<<S16A ' arg size, rpsize = 4, spsize = 4
 alignl ' align long
 long I32_CALA + (@C__malloc_unlink_free_chunk)<<S32 ' CALL addrg
 alignl ' align long
 long I32_JMPA + (@C_malloc_18)<<S32 ' JUMPV addrg
 alignl ' align long
C_malloc_27
 word I16A_MOV + (r2)<<D16A + (r15)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r17)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__malloc_create_chunk)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 word I16A_MOV + (r21)<<D16A + (r0)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_malloc_17
 alignl ' align long
C_malloc_18
 word I16A_NEGI + (r22)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_NEGI + (r18)<<D16A + (-($fffffffe)&$1F)<<S16A ' reg <- conn
 word I16A_AND + (r20)<<D16A + (r18)<<S16A ' BANDI/U (1)
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_ADDI + (r23)<<D16A + (8)<<S16A ' ADDU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDI + (r22)<<D16A + (8)<<S16A ' ADDU4 reg coni
 alignl ' align long
 long I32_MOVI + (r20)<<D32 +(64)<<S32 ' reg <- conli
 word I16A_ADD + (r22)<<D16A + (r20)<<S16A ' ADDU (1)
 word I16A_NEGI + (r20)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r20)<<D16A + (r21)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r20)<<D16A + (r20)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUBI + (r20)<<D16A + (8)<<S16A ' SUBU4 reg coni
 word I16A_CMP + (r22)<<D16A + (r20)<<S16A
 alignl ' align long
 long I32_BR_A + (@C_malloc_33)<<S32 ' GTU4 reg reg
 word I16A_MOV + (r2)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_MOV + (r3)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16B_CPREP + 33<<S16B ' arg size, rpsize = 8, spsize = 8
 alignl ' align long
 long I32_CALA + (@C__malloc_truncate)<<S32
 word I16A_ADDI + SP<<D16A + 4<<S16A ' CALL addrg
 alignl ' align long
C_malloc_33
 alignl ' align long
 long I32_CALA + (@C__memory_unlock)<<S32 ' CALL addrg
 word I16A_MOV + (r0)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
C_malloc_3
 word I16B_POPM + 0<<S16B ' restore registers, do pop frame, do return
 alignl ' align long

' Catalina Export malloc_defragment

 alignl ' align long
C_malloc_defragment ' <symbol:malloc_defragment>
 alignl ' align long
 long I32_NEWF + 0<<S32
 alignl ' align long
 long I32_CALA + (@C__memory_lock)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C__malloc_sell_out)<<S32 ' CALL addrg
 alignl ' align long
 long I32_CALA + (@C__memory_unlock)<<S32 ' CALL addrg
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
' C_malloc_defragment_35 ' (symbol refcount = 0)
 word I16B_RETF + 0<<S32
 alignl ' align long

' Catalina Import _memory_unlock

' Catalina Import _memory_lock

' Catalina Import _malloc_store

' Catalina Import _malloc_sell_out

' Catalina Import _sbrk

' Catalina Import _malloc_create_chunk

' Catalina Import _malloc_truncate

' Catalina Import ml_last

' Catalina Import _malloc_search_free_list

' Catalina Import _malloc_first_present

' Catalina Import _malloc_unlink_free_chunk
' end
