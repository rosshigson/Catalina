' Catalina Code

DAT ' code segment

' Catalina Export _muldiv64

 alignl ' align long

 ' r4 = mult1
 ' r3 = mult2
 ' r2 = divisor
C__muldiv64
 word I16B_FCACHE + ((@C_muldiv64_fc_end-@C_muldiv64_fc_start)/4)<<S16B
 alignl ' align long 
C_muldiv64_fc_start
 qmul r3, r4 ' mult1 * mult2
 getqx r0 ' get lower 32 bits of product
 getqy r1 ' get upper 32 bits of product
 setq  r1 ' set upper 32 bits of product
 qdiv  r0, r2 ' divide product by divisor
 getqx r0 ' get quotient of division
 jmp #FC_RETURN    ' last inst returns from function
C_muldiv64_fc_end
' end


