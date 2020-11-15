'
' move memory (must be long aligned, and size a multiple of 4, and not overlap!)
' on entry:
'   r4 = dst
'   r3 = src
'   r2 = size (bytes) 
'

' Catalina Code

DAT ' code segment

' Catalina Export g_memmove

 alignl ' align long

C_g_memmove

 word I16B_FCACHE + ((@C_g_memmove_fc_end-@C_g_memmove_fc_start)/4)<<S16B
 long 'align long
C_g_memmove_fc_start
 tjz r2, #FC_START+(@C_g_memmove_2-@C_g_memmove_fc_start)/4
 shr r2, #2
C_g_memmove_1 
 rdlong r0, r3
 wrlong r0, r4
 add r3, #4
 add r4, #4
 djnz r2, #FC_START+(@C_g_memmove_1-@C_g_memmove_fc_start)/4
C_g_memmove_2
 jmp #FC_RETURN    ' last inst returns from function
C_g_memmove_fc_end

' end C_g_memmove

