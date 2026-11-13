' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _malloc_link_free_chunk

 alignl_label
C__malloc_link_free_chunk ' <symbol:_malloc_link_free_chunk>
 alignl_p1
 long I32_PSHM + $f80000<<S32 ' save registers
 word I16B_LODL + (r23)<<D16B
 alignl_p1
 long @C__malloc_free_list ' reg <- addrg
 word I16A_NEGI + (r22)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r2)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_MOV + (r21)<<D16A + (r22)<<S16A
 word I16A_SUBI + (r21)<<D16A + (8)<<S16A ' SUBU4 reg coni
 alignl_label
C__malloc_link_free_chunk_4
 word I16A_SHRI + (r21)<<D16A + (1)<<S16A ' SHRU4 reg coni
 word I16A_ADDSI + (r23)<<D16A + (4)<<S16A ' ADDP4 reg coni
' C__malloc_link_free_chunk_5 ' (symbol refcount = 0)
 word I16A_CMPI + (r21)<<D16A + (8)<<S16A
 alignl_p1
 long I32_BRAE + (@C__malloc_link_free_chunk_4)<<S32 ' GEU4 reg coni
 word I16A_NEGI + (r22)<<D16A + (-(-4)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_MOV + (r23)<<D16A + (r22)<<S16A ' CVI, CVU or LOAD
 word I16A_RDLONG + (r19)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 word I16A_MOV + (r22)<<D16A + (r2)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl_p1
 long 0 ' reg <- con
 word I16A_WRLONG + (r20)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 word I16A_WRLONG + (r19)<<D16A + (r2)<<S16A ' ASGNP4 reg reg
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl_p1
 long I32_BR_Z + (@C__malloc_link_free_chunk_7)<<S32 ' EQU4 reg coni
 word I16A_MOV + (r22)<<D16A + (r19)<<S16A
 word I16A_ADDSI + (r22)<<D16A + (4)<<S16A ' ADDP4 reg coni
 word I16A_WRLONG + (r2)<<D16A + (r22)<<S16A ' ASGNP4 reg reg
 alignl_label
C__malloc_link_free_chunk_7
 word I16A_WRLONG + (r2)<<D16A + (r23)<<S16A ' ASGNP4 reg reg
 word I16A_MOVI + R0<<D16A + (0)<<S16A ' RET coni
' C__malloc_link_free_chunk_3 ' (symbol refcount = 0)
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl_p1

' Catalina Import _malloc_free_list
' end
