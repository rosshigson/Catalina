' Catalina Code

DAT ' code segment

' Catalina Export _rotxy

 alignl ' align long

C__rotxy
 word I16B_FCACHE + ((@C_rotxy_fc_end-@C_rotxy_fc_start)/4)<<S16B
 ' r2 = t
 ' r3 = addr of coord (x)
 ' r4 = addr of result struct (x)
 alignl ' align long 
C_rotxy_fc_start
 rdlong r0, r3
 add r3,#4
 rdlong r1, r3
 setq r1
 qrotate r0, r2
 getqx r0
 getqy r1
 wrlong r0, r4
 add r4, #4
 wrlong r1, r4
 jmp #FC_RETURN    ' last inst returns from function
C_rotxy_fc_end
' end


