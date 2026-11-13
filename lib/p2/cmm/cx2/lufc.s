' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _malloc_unlink_free_chunk

 alignl_label
C__malloc_unlink_free_chunk ' <symbol:_malloc_unlink_free_chunk>
 alignl_p1
 long I32_PSHM + $ea0000<<S32 ' save registers
 word I16A_RDLONG + (r23)<<D16A + (r2)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_RDLONG + (r21)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r21)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BRNZ + (@C__malloc_unlink_free_chunk_4)<<S32 ' NEU4 reg coni
 word I16B_LODL + (r19)<<D16B
 alignl_p1
 long @C__malloc_free_list-4 ' reg <- addrg
 word I16A_NEGI + (r22)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r17)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r17)<<D16A + (8)<<S16A ' SUBU4 reg coni
 alignl_label
C__malloc_unlink_free_chunk_7
 word I16A_SHRI + (r17)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_ADDSI + (r19)<<D16A + (4)<<S16A ' ADDP4 reg coni
' C__malloc_unlink_free_chunk_8 ' (symbol refcount = 0)
 word I16A_CMPI + (r17)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BRAE + (@C__malloc_unlink_free_chunk_7)<<S32 ' GEU4 reg coni
 word I16A_WRLONG + (r23)<<D16A + (r19)<<S16A ' ASGNP4 reg reg
 alignl_p1
 long I32_JMPA + (@C__malloc_unlink_free_chunk_5)<<S32 ' JUMPV addrg
 alignl_label
C__malloc_unlink_free_chunk_4
 word I16A_WRLONG + (r23)<<D16A + (r21)<<S16A ' ASGNP4 reg reg
 alignl_label
C__malloc_unlink_free_chunk_5
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__malloc_unlink_free_chunk_10)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r21)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_label
C__malloc_unlink_free_chunk_10
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C__malloc_unlink_free_chunk_3 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Import _malloc_free_list
' end
