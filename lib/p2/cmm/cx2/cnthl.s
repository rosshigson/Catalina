' Catalina Code

DAT ' code segment

' Catalina Export _cnthl

 alignl ' align long

C__cnthl
 word I16B_FCACHE + ((@C_cnthl_fc_end-@C_cnthl_fc_start)/4)<<S16B
 alignl ' align long
C_cnthl_fc_start
 getct r1 wc
 getct r0
 wrlong r0, r2
 add r2, #4
 wrlong r1, r2
 jmp #FC_RETURN    ' last inst returns from function
C_cnthl_fc_end
' end


