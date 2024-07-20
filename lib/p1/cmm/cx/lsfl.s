' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _malloc_search_free_list

 alignl ' align long
C__malloc_search_free_list ' <symbol:_malloc_search_free_list>
 alignl ' align long
 long I32_PSHM + $d00000<<S32 ' save registers
 word I16A_MOV + (r22)<<D16A + (r3)<<S16A
 word I16A_SHLI + (r22)<<D16A + (2)<<S16A ' SHLI4 reg coni
 word I16B_LODL + (r20)<<D16B
 alignl ' align long
 long @C__malloc_free_list ' reg <- addrg
 word I16A_ADDS + (r22)<<D16A + (r20)<<S16A ' ADDI/P (1)
 word I16A_RDLONG + (r23)<<D16A + (r22)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
 long I32_JMPA + (@C__malloc_search_free_list_7)<<S32 ' JUMPV addrg
 alignl ' align long
C__malloc_search_free_list_4
 word I16A_NEGI + (r22)<<D16A + (-(-8)&$1F)<<S16A ' reg <- conn
 word I16A_ADDS + (r22)<<D16A + (r23)<<S16A ' ADDI/P (2)
 word I16A_RDLONG + (r22)<<D16A + (r22)<<S16A ' reg <- INDIRU4 reg
 word I16A_SUBI + (r22)<<D16A + (8)<<S16A ' SUBU4 reg coni
 word I16A_CMP + (r22)<<D16A + (r2)<<S16A
 alignl ' align long
 long I32_BR_B + (@C__malloc_search_free_list_8)<<S32 ' LTU4 reg reg
 word I16A_MOV + (r0)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 alignl ' align long
 long I32_JMPA + (@C__malloc_search_free_list_3)<<S32 ' JUMPV addrg
 alignl ' align long
C__malloc_search_free_list_8
' C__malloc_search_free_list_5 ' (symbol refcount = 0)
 word I16A_RDLONG + (r23)<<D16A + (r23)<<S16A ' reg <- INDIRP4 reg
 alignl ' align long
C__malloc_search_free_list_7
 word I16A_MOV + (r22)<<D16A + (r23)<<S16A ' CVI, CVU or LOAD
 word I16A_CMPI + (r22)<<D16A + (0)<<S16A
 alignl ' align long
 long I32_BRNZ + (@C__malloc_search_free_list_4)<<S32 ' NEU4 reg coni
 word I16B_LODL + R0<<D16B
 alignl ' align long
 long 0 ' RET con
 alignl ' align long
C__malloc_search_free_list_3
 word I16B_POPM + $80<<S16B ' restore registers, do not pop frame, do return
 alignl ' align long

' Catalina Import _malloc_free_list
' end
