' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _malloc_search_free_list

 alignl ' align long
C__malloc_search_free_list ' <symbol:_malloc_search_free_list>
 calld PA,#PSHM
 long $d00000 ' save registers
 mov r22, r3
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C__malloc_free_list ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r23, r22 ' reg <- INDIRP4 reg
 jmp #\@C__malloc_search_free_list_7 ' JUMPV addrg
C__malloc_search_free_list_4
 mov r22, ##-8 ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #8 ' SUBU4 coni
 cmp r22, r2 wcz 
 if_b jmp #\C__malloc_search_free_list_8 ' LTU4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #\@C__malloc_search_free_list_3 ' JUMPV addrg
C__malloc_search_free_list_8
' C__malloc_search_free_list_5 ' (symbol refcount = 0)
 rdlong r23, r23 ' reg <- INDIRP4 reg
C__malloc_search_free_list_7
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_nz jmp #\C__malloc_search_free_list_4  ' NEU4
 mov r0, ##0 ' RET con
C__malloc_search_free_list_3
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Import _malloc_free_list
' end
