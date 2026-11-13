' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _malloc_first_present

 alignl ' align long
C__malloc_first_present ' <symbol:_malloc_first_present>
 calld PA,#PSHM
 long $f00000 ' save registers
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 mov r20, ##@C__malloc_free_list ' reg <- addrg
 mov r23, r22 ' ADDI/P
 adds r23, r20 ' ADDI/P (3)
 jmp #\@C__malloc_first_present_7 ' JUMPV addrg
C__malloc_first_present_4
 rdlong r22, r23 ' reg <- INDIRP4 reg
 mov r21, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 if_z jmp #\C__malloc_first_present_9 ' EQU4
 rdlong r22, r21 ' reg <- INDIRP4 reg
 wrlong r22, r23 ' ASGNP4 reg reg
 rdlong r22, r23 ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 if_z jmp #\C__malloc_first_present_11 ' EQU4
 rdlong r22, r23 ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 mov r20, ##0 ' reg <- con
 wrlong r20, r22 ' ASGNP4 reg reg
C__malloc_first_present_11
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #\@C__malloc_first_present_3 ' JUMPV addrg
C__malloc_first_present_9
' C__malloc_first_present_5 ' (symbol refcount = 0)
 adds r23, #4 ' ADDP4 coni
C__malloc_first_present_7
 mov r22, r23 ' CVI, CVU or LOAD
 mov r20, ##@C__malloc_free_list+84 ' reg <- addrg
 cmp r22, r20 wcz 
 if_b jmp #\C__malloc_first_present_4 ' LTU4
 mov r0, ##0 ' RET con
C__malloc_first_present_3
 calld PA,#POPM ' restore registers
 calld PA,#RETN


' Catalina Import _malloc_free_list
' end
