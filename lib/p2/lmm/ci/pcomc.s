' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v3.15 Code Generator by Ross Higson)
'

' Catalina Export _malloc_combine_chunks

 alignl ' align long
C__malloc_combine_chunks ' <symbol:_malloc_combine_chunks>
 jmp #PSHM
 long $f40000 ' save registers
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r2 ' ADDI/P (2)
 rdlong r22, r22 ' reg <- INDIRU4 reg
 mov r23, r22 ' ADDI/P
 adds r23, r2 ' ADDI/P (3)
 jmp #LODL
 long -8
 mov r22, RI ' reg <- con
 adds r22, r3 ' ADDI/P (2)
 mov r20, r23 ' CVI, CVU or LOAD
 mov r18, r3 ' CVI, CVU or LOAD
 sub r20, r18 ' SUBU (1)
 wrlong r20, r22 ' ASGNU4 reg reg
 mov r22, r2 ' CVI, CVU or LOAD
 jmp #LODI
 long @C_ml_last
 mov r20, RI ' reg <- INDIRP4 addrg
 cmp r22, r20 wz
 jmp #BRNZ
 long @C__malloc_combine_chunks_7 ' NEU4
 mov r21, #1 ' reg <- coni
 jmp #JMPA
 long @C__malloc_combine_chunks_8 ' JUMPV addrg
C__malloc_combine_chunks_7
 mov r21, #0 ' reg <- coni
C__malloc_combine_chunks_8
 cmps r21,  #0 wz
 jmp #BRNZ
 long @C__malloc_combine_chunks_4 ' NEI4
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r23 ' ADDI/P (2)
 rdlong r20, r22 ' reg <- INDIRP4 reg
 and r20, #3 ' BANDU4 coni
 adds r20, r3 ' ADDI/P (1)
 wrlong r20, r22 ' ASGNP4 reg reg
C__malloc_combine_chunks_4
 jmp #LODI
 long @C_ml_last
 mov r22, RI ' reg <- INDIRP4 addrg
 mov r20, r2 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C__malloc_combine_chunks_9 ' NEU4
 jmp #LODL
 long @C_ml_last
 wrlong r3, RI ' ASGNP4 addrg reg
C__malloc_combine_chunks_9
 mov r0, #0 ' RET coni
' C__malloc_combine_chunks_3 ' (symbol refcount = 0)
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import ml_last
' end
