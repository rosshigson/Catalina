'#line 1 "setjmp.e"
' The use of PRIMITIVE allows the library source files to be (mostly)
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.












' Catalina Code

DAT ' code segment

' Catalina Export _setjmp

 alignl ' align long

C__setjmp
 mov RI, r3        ' r3 is the address of our jmp_buf
































































 mov BC, r2
 jmp #WLNG        ' save our flag (should be zero for setjmp)




 add RI, #4
 cmp r2, #0 wz
 jmp #BR_Z
 long @C__setjmp_1 ' if flag is zero, don't save our mask


 mov BC, r2
 jmp #WLNG        ' TBD !!! Save signal mask here when implemented !!!




C__setjmp_1
 mov RI, r3        ' r3 is the address of our jmp_buf
 add RI, #8
 rdlong r0, SP     ' save our return address ...


 mov BC, r0
 jmp #WLNG        ' ... as our PC



 add RI, #4


 mov BC, SP
 jmp #WLNG       ' save our SP



 add RI, #4


 mov BC, FP
 jmp #WLNG       ' save our FP



 add RI, #4


 mov BC, R6
 jmp #WLNG       ' save R6



 add RI, #4


 mov BC, R7
 jmp #WLNG       ' save R7



 add RI, #4


 mov BC, R8
 jmp #WLNG       ' save R8



 add RI, #4


 mov BC, R9
 jmp #WLNG       ' save R9



 add RI, #4


 mov BC, R10
 jmp #WLNG       ' save R10



 add RI, #4


 mov BC, R11
 jmp #WLNG       ' save R11



 add RI, #4


 mov BC, R12
 jmp #WLNG       ' save R12



 add RI, #4


 mov BC, R13
 jmp #WLNG       ' save R13



 add RI, #4


 mov BC, R14
 jmp #WLNG       ' save R14



 add RI, #4


 mov BC, R15
 jmp #WLNG       ' save R15



 add RI, #4


 mov BC, R16
 jmp #WLNG       ' save R16



 add RI, #4


 mov BC, R17
 jmp #WLNG       ' save R17



 add RI, #4


 mov BC, R18
 jmp #WLNG       ' save R18



 add RI, #4


 mov BC, R19
 jmp #WLNG       ' save R19



 add RI, #4


 mov BC, R20
 jmp #WLNG       ' save R20



 add RI, #4


 mov BC, R21
 jmp #WLNG       ' save R21



 add RI, #4


 mov BC, R22
 jmp #WLNG       ' save R22



 add RI, #4


 mov BC, R23
 jmp #WLNG       ' save R23




 mov r0, #0        ' setjmp must return zero
 jmp #RETN



' Catalina Export siglongjmp

 alignl ' align long

C_siglongjmp
 mov RI, r3        ' r3 is the address of our jmp_buf








































































 jmp #RLNG
 mov r0, BC        ' recover the flag




 add RI, #4
 cmp r0, #0 wz
 jmp #BR_Z
 long @C_siglongjmp_1 ' if flag is zero, don't restore our mask


 jmp #RLNG      ' TBD !!! Restore signal mask here when implemented !!!
 mov r0, BC




C_siglongjmp_1
 mov RI, r3        ' r3 is the address of our jmp_buf
 add RI, #8


 jmp #RLNG       ' recover the PC saved by setjmp
 mov r0, BC



 add RI, #4


 jmp #RLNG       ' recover the SP saved by setjmp
 mov SP, BC



 add RI, #4


 jmp #RLNG       ' recover the FP saved by setjmp
 mov FP, BC



 add RI, #4


 jmp #RLNG       ' recover the R6 saved by setjmp
 mov R6, BC



 add RI, #4


 jmp #RLNG       ' recover the R7 saved by setjmp
 mov R7, BC



 add RI, #4


 jmp #RLNG       ' recover the R8 saved by setjmp
 mov R8, BC



 add RI, #4


 jmp #RLNG       ' recover the R9 saved by setjmp
 mov R9, BC



 add RI, #4


 jmp #RLNG       ' recover the R10 saved by setjmp
 mov R10, BC



 add RI, #4


 jmp #RLNG       ' recover the R11 saved by setjmp
 mov R11, BC



 add RI, #4


 jmp #RLNG       ' recover the R12 saved by setjmp
 mov R12, BC



 add RI, #4


 jmp #RLNG       ' recover the R13 saved by setjmp
 mov R13, BC



 add RI, #4


 jmp #RLNG       ' recover the R14 saved by setjmp
 mov R14, BC



 add RI, #4


 jmp #RLNG       ' recover the R15 saved by setjmp
 mov R15, BC



 add RI, #4


 jmp #RLNG       ' recover the R16 saved by setjmp
 mov R16, BC



 add RI, #4


 jmp #RLNG       ' recover the R17 saved by setjmp
 mov R17, BC



 add RI, #4


 jmp #RLNG       ' recover the R18 saved by setjmp
 mov R18, BC



 add RI, #4


 jmp #RLNG       ' recover the R19 saved by setjmp
 mov R19, BC



 add RI, #4


 jmp #RLNG       ' recover the R20 saved by setjmp
 mov R20, BC



 add RI, #4


 jmp #RLNG       ' recover the R21 saved by setjmp
 mov R21, BC



 add RI, #4


 jmp #RLNG       ' recover the R22 saved by setjmp
 mov R22, BC



 add RI, #4


 jmp #RLNG       ' recover the R23 saved by setjmp
 mov R23, BC




 wrlong r0, SP     ' save the setjmp PC as our return address
 mov r0, r2 wz     ' set up our return value if non-zero ...
 jmp #BRNZ       ' ... otherwise ...
 long @C_siglongjmp_2 ' ... return a value of one ...
 mov r0, #1        ' ... instead
C_siglongjmp_2
 jmp #RETN



' Catalina Export longjmp

 alignl ' align long

C_longjmp
 mov RI, r3        ' r3 is the address of our jmp_buf








































































 jmp #RLNG
 mov r0, BC        ' recover the flag




 add RI, #4
 cmp r0, #0 wz
 jmp #BR_Z
 long @C_longjmp_1 ' if flag is zero, don't restore our mask


 jmp #RLNG      ' TBD !!! Restore signal mask here when implemented !!!
 mov r0, BC




C_longjmp_1
 mov RI, r3        ' r3 is the address of our jmp_buf
 add RI, #8


 jmp #RLNG       ' recover the PC saved by setjmp
 mov r0, BC



 add RI, #4


 jmp #RLNG       ' recover the SP saved by setjmp
 mov SP, BC



 add RI, #4


 jmp #RLNG       ' recover the FP saved by setjmp
 mov FP, BC



 add RI, #4


 jmp #RLNG       ' recover the R6 saved by setjmp
 mov R6, BC



 add RI, #4


 jmp #RLNG       ' recover the R7 saved by setjmp
 mov R7, BC



 add RI, #4


 jmp #RLNG       ' recover the R8 saved by setjmp
 mov R8, BC



 add RI, #4


 jmp #RLNG       ' recover the R9 saved by setjmp
 mov R9, BC



 add RI, #4


 jmp #RLNG       ' recover the R10 saved by setjmp
 mov R10, BC



 add RI, #4


 jmp #RLNG       ' recover the R11 saved by setjmp
 mov R11, BC



 add RI, #4


 jmp #RLNG       ' recover the R12 saved by setjmp
 mov R12, BC



 add RI, #4


 jmp #RLNG       ' recover the R13 saved by setjmp
 mov R13, BC



 add RI, #4


 jmp #RLNG       ' recover the R14 saved by setjmp
 mov R14, BC



 add RI, #4


 jmp #RLNG       ' recover the R15 saved by setjmp
 mov R15, BC



 add RI, #4


 jmp #RLNG       ' recover the R16 saved by setjmp
 mov R16, BC



 add RI, #4


 jmp #RLNG       ' recover the R17 saved by setjmp
 mov R17, BC



 add RI, #4


 jmp #RLNG       ' recover the R18 saved by setjmp
 mov R18, BC



 add RI, #4


 jmp #RLNG       ' recover the R19 saved by setjmp
 mov R19, BC



 add RI, #4


 jmp #RLNG       ' recover the R20 saved by setjmp
 mov R20, BC



 add RI, #4


 jmp #RLNG       ' recover the R21 saved by setjmp
 mov R21, BC



 add RI, #4


 jmp #RLNG       ' recover the R22 saved by setjmp
 mov R22, BC



 add RI, #4


 jmp #RLNG       ' recover the R23 saved by setjmp
 mov R23, BC




 wrlong r0, SP     ' save the setjmp PC as our return address
 mov r0, r2 wz     ' set up our return value if non-zero ...
 jmp #BRNZ       ' ... otherwise ...
 long @C_longjmp_2 ' ... return a value of one ...
 mov r0, #1        ' ... instead
C_longjmp_2
 jmp #RETN



' end

