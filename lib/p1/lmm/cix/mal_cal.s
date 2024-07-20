' Catalina Code

DAT ' code segment
'
' LCC 4.2 for Parallax Propeller
' (Catalina v2.5 Code Generator by Ross Higson)
'

' Catalina Export calloc

 alignl ' align long
C_calloc ' <symbol:calloc>
 jmp #NEWF
 jmp #PSHM
 long $fa8000 ' save registers
 mov r23, r3 ' reg var <- reg arg
 mov r21, r2 ' reg var <- reg arg
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_lock ' CALL addrg
 cmp r21,  #0 wz
 jmp #BRNZ
 long @C_calloc_4 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_calloc_3 ' JUMPV addrg
C_calloc_4
 cmp r23,  #0 wz
 jmp #BRNZ
 long @C_calloc_6 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_calloc_3 ' JUMPV addrg
C_calloc_6
 jmp #LODL
 long $ffffffff
 mov r22, RI ' reg <- con
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 cmp r0, r23 wz,wc 
 jmp #BRAE
 long @C_calloc_9 ' GEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_calloc_3 ' JUMPV addrg
' C_calloc_8 ' (symbol refcount = 0)
 jmp #LODL
 long $ffffffff
 mov r22, RI ' reg <- con
 mov r0, r22 ' setup r0/r1 (2)
 mov r1, r21 ' setup r0/r1 (2)
 jmp #DIVU ' DIVU
 cmp r0, r23 wz,wc 
 jmp #BRAE
 long @C_calloc_13 ' GEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_calloc_3 ' JUMPV addrg
' C_calloc_12 ' (symbol refcount = 0)
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_calloc_3 ' JUMPV addrg
C_calloc_13
C_calloc_9
 mov r0, r21 ' setup r0/r1 (2)
 mov r1, r23 ' setup r0/r1 (2)
 jmp #MULT ' MULT(I/U)
 mov r15, r0 ' CVI, CVU or LOAD
 cmp r15,  #8 wz,wc 
 jmp #BRAE
 long @C_calloc_16 ' GEU4
 mov r15, #8 ' reg <- coni
 jmp #JMPA
 long @C_calloc_17 ' JUMPV addrg
C_calloc_16
 mov r22, r15
 add r22, #7 ' ADDU4 coni
 jmp #LODL
 long $fffffff8
 mov r20, RI ' reg <- con
 mov r15, r22 ' BANDI/U
 and r15, r20 ' BANDI/U (3)
C_calloc_17
 jmp #LODL
 long $1000000
 mov r22, RI ' reg <- con
 cmp r15, r22 wz,wc 
 jmp #BR_B
 long @C_calloc_18' LTU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 jmp #LODL
 long 0
 mov r0, RI ' reg <- con
 jmp #JMPA
 long @C_calloc_3 ' JUMPV addrg
C_calloc_18
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 mov r2, r15 ' CVI, CVU or LOAD
 mov BC, #4 ' arg size, rpsize = 4, spsize = 4
 jmp #CALA
 long @C_malloc ' CALL addrg
 mov r17, r0 ' CVI, CVU or LOAD
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_lock ' CALL addrg
 mov r22, #2 ' reg <- coni
 mov RI, r15
 shr RI, r22
 mov r22, RI ' RSHU (2)
 shl r22, #2 ' LSHU4 coni
 mov r19, r22 ' ADDI/P
 adds r19, r17 ' ADDI/P (3)
 jmp #JMPA
 long @C_calloc_21 ' JUMPV addrg
C_calloc_20
 jmp #LODL
 long -4
 mov r22, RI ' reg <- con
 adds r22, r19 ' ADDI/P (2)
 mov r19, r22 ' CVI, CVU or LOAD
 mov r20, #0 ' reg <- coni
 wrlong r20, r22 ' ASGNI4 reg reg
C_calloc_21
 mov r22, r19 ' CVI, CVU or LOAD
 mov r20, r17 ' CVI, CVU or LOAD
 cmp r22, r20 wz
 jmp #BRNZ
 long @C_calloc_20 ' NEU4
 mov BC, #0 ' arg size, rpsize = 0, spsize = 0
 jmp #CALA
 long @C__memory_unlock ' CALL addrg
 mov r0, r17 ' CVI, CVU or LOAD
C_calloc_3
 jmp #POPM ' restore registers
 jmp #RETF


' Catalina Import _memory_unlock

' Catalina Import _memory_lock

' Catalina Import malloc
' end
