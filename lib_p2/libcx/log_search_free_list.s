' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _malloc_search_free_list

 alignl ' align long
C__malloc_search_free_list ' <symbol:_malloc_search_free_list>
 PRIMITIVE(#PSHM)
 long $d00000 ' save registers
 mov r22, r3
 shl r22, #2 ' LSHI4 coni
 PRIMITIVE(#LODL)
 long @C__malloc_free_list
 mov r20, RI ' reg <- addrg
 adds r22, r20 ' ADDI/P (1)
 rdlong r23, r22 ' reg <- INDIRP4 reg
 PRIMITIVE(#JMPA)
 long @C__malloc_search_free_list_7 ' JUMPV addrg
C__malloc_search_free_list_4
 PRIMITIVE(#LODL)
 long -8
 mov r22, RI ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 sub r22, #8 ' SUBU4 coni
 cmp r22, r2 wcz 
 PRIMITIVE(#BR_B)
 long @C__malloc_search_free_list_8' LTU4
 mov r0, r23 ' CVI, CVU or LOAD
 PRIMITIVE(#JMPA)
 long @C__malloc_search_free_list_3 ' JUMPV addrg
C__malloc_search_free_list_8
' C__malloc_search_free_list_5 ' (symbol refcount = 0)
 rdlong r23, r23 ' reg <- INDIRP4 reg
C__malloc_search_free_list_7
 mov r22, r23 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 PRIMITIVE(#BRNZ)
 long @C__malloc_search_free_list_4 ' NEU4
 PRIMITIVE(#LODL)
 long 0
 mov r0, RI ' reg <- con
C__malloc_search_free_list_3
 PRIMITIVE(#POPM) ' restore registers
 PRIMITIVE(#RETN)


' Catalina Import _malloc_free_list
' end
