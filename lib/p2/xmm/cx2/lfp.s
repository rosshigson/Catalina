' Catalina Code

DAT ' code segment
'
' LCC 4.2 (LARGE) for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export _malloc_first_present

 alignl ' align long
C__malloc_first_present ' <symbol:_malloc_first_present>
 jmp #PSHM
 long $f00000 ' save registers
 mov r22, r2
 shl r22, #2 ' LSHI4 coni
 jmp #LODL
 long @C__malloc_free_list
 mov r20, RI ' reg <- addrg
 mov r23, r22 ' ADDI/P
 adds r23, r20 ' ADDI/P (3)
 jmp #JMPA
 long @C__malloc_first_present_7 ' JUMPV addrg
C__malloc_first_present_4
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov r21, r22 ' CVI, CVU or LOAD
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C__malloc_first_present_9 ' EQU4
 mov RI, r21
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 mov RI, r23
 mov BC, r22
 jmp #WLNG ' ASGNP4 reg reg
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 cmp r22,  #0 wz
 jmp #BR_Z
 long @C__malloc_first_present_11 ' EQU4
 mov RI, r23
 jmp #RLNG
 mov r22, BC ' reg <- INDIRP4 reg
 adds r22, #4 ' ADDP4 coni
 jmp #LODL
 long 0
 mov r20, RI ' reg <- con
 mov RI, r22
 mov BC, r20
 jmp #WLNG ' ASGNP4 reg reg
C__malloc_first_present_11
 mov r0, r21 ' CVI, CVU or LOAD
 jmp #JMPA
 long @C__malloc_first_present_3 ' JUMPV addrg
C__malloc_first_present_9
' C__malloc_first_present_5 ' (symbol refcount = 0)
 adds r23, #4 ' ADDP4 coni
C__malloc_first_present_7
 mov r22, r23 ' CVI, CVU or LOAD
 jmp #LODL
 long @C__malloc_free_list+84
 mov r20, RI ' reg <- addrg
 cmp r22, r20 wz,wc 
 jmp #BR_B
 long @C__malloc_first_present_4' LTU4
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
C__malloc_first_present_3
 jmp #POPM ' restore registers
 jmp #RETN


' Catalina Import _malloc_free_list
' end
