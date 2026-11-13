' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _malloc_search_free_list

 alignl ' align long
C__malloc_search_free_list ' <symbol:_malloc_search_free_list>
 jmp #PSHM
 long $d00000 ' save registers
 mov r22, r3
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C__malloc_free_list
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 mov RI, r22
 jmp #RLNG
 mov r23, BC ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C__malloc_search_free_list_7 ' JUMPV addrg
C__malloc_search_free_list_4
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 mov RI, r22
 jmp #RLNG
 mov r22, BC ' reg <- INDIRU4 reg
 sub r22, #8 ' SUBU4 coni
 cmp r22, r2 wz,wc 
 jmp #BR_B
 long @C__malloc_search_free_list_8' LTU4
 mov r0, r23 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C__malloc_search_free_list_3 ' JUMPV addrg
C__malloc_search_free_list_8
' C__malloc_search_free_list_5 ' (symbol refcount = 0)
 mov RI, r23
 jmp #RLNG
 mov r23, BC ' reg <- INDIRP4 reg
C__malloc_search_free_list_7
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C__malloc_search_free_list_4 ' NEU4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C__malloc_search_free_list_3
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import _malloc_free_list
' end
