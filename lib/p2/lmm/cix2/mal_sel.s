' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _malloc_sell_out

 alignl ' align long
C__malloc_sell_out ' <symbol:_malloc_sell_out>
 jmp #NEWF
 jmp #PSHM
 long $f40000 ' save registers
 jmp #LODL
 long @C__malloc_store
 mov r23, RI ' reg <- addrg
 jmp #JMPA
 long @C__malloc_sell_out_7 ' JUMPV addrg
C__malloc_sell_out_4
 rdlong r21, r23 ' reg <- INDIRP4 reg
 jmp #JMPA
 long @C__malloc_sell_out_10 ' JUMPV addrg
C__malloc_sell_out_9
 rdlong r22, r21 ' reg <- INDIRP4 reg
 wrlong r22, r23 ' ASGNP4 reg reg
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r21 ' ADDI/P (2)
 rdlong r20, r22 ' reg <- INDIRP4 reg
 jmp #LODL
 long $fffffffd
 mov r18, RI ' reg <- con
 and r20, r18 ' BANDI/U (1)
 wrlong r20, r22 ' ASGNP4 reg reg
 mov r2, r21 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C__malloc_do_free ' CALL addrg
 rdlong r21, r23 ' reg <- INDIRP4 reg
C__malloc_sell_out_10
 mov r22, r21 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BRNZ
 long @C__malloc_sell_out_9 ' NEU4
' C__malloc_sell_out_5 ' (symbol refcount = 0)
 adds r23, #4 ' ADDP4 coni
C__malloc_sell_out_7
 mov r22, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C__malloc_store+128
 mov r20, RI ' reg <- addrg
 cmp r22, r20 wcz 
 jmp #BR_B
 long @C__malloc_sell_out_4' LTU4
 mov r0, #0 ' RET coni
' C__malloc_sell_out_3 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _malloc_store

' Catalina Import _malloc_do_free
' end
