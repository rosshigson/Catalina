'#line 1 "set_PAT.e"











' Catalina Code

DAT ' code segment

' Catalina Export _set_PAT

 alignl ' align long

C__set_P_A_T_
   ror r5, #1 wc
   cmp r4, #0 wz
   setpat r3, r2
   PRIMITIVE(#RETN)
' end

