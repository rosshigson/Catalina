'
' set memory to a value (must be long aligned and a multiple of 4 bytes!)
' on entry:
'   r4 = address
'   r3 = value
'   r2 = size (bytes) 
'

' Catalina Code

DAT ' code segment

' Catalina Export g_memset

 alignl ' align long

C_g_memset

 word I16B_FCACHE + ((@C_g_memset_fc_end-@C_g_memset_fc_start)/4)<<S16B
 long 'align long
C_g_memset_fc_start
 tjz r2, #FC_START+(@C_g_memset_2-@C_g_memset_fc_start)/4
 mov r0, r3
 shl r3, #8
 or r0, r3
 shl r3, #8
 or r0, r3
 shl r3, #8
 or r0, r3
C_g_memset_1 
 wrlong r0, r4
 add r4, #4
 sub r2, #4 wz
 if_nz jmp #FC_START+(@C_g_memset_1-@C_g_memset_fc_start)/4
C_g_memset_2
 jmp #FC_RETURN   ' last inst returns from function
C_g_memset_fc_end

' end C_g_memset


