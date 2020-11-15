' Catalina Code

DAT ' code segment

' Catalina Export _setjmp

 alignl ' align long

C__setjmp

 word I16B_EXEC

 alignl ' align long

 mov RI, r3        ' r3 is the address of our jmp_buf

 wrlong r2, RI     ' save our flag (should be zero for setjmp)

 add RI, #4
 cmp r2, #0 wz
 if_z add PC, #(@C__setjmp_1-@C__setjmp_0)

C__setjmp_0
 wrlong r2, RI     ' TBD !!! Save signal mask here when implemented !!!

C__setjmp_1
 mov RI, r3        ' r3 is the address of our jmp_buf
 add RI, #8
 rdlong r0, SP     ' save our return address ...

 wrlong r0, RI     ' ... as our PC
 add RI, #4

 wrlong SP, RI     ' save our SP
 add RI, #4

 wrlong FP, RI     ' save our FP
 add RI, #4

 wrlong R6, RI     ' save R6
 add RI, #4

 wrlong R7, RI     ' save R7
 add RI, #4

 wrlong R8, RI     ' save R8
 add RI, #4

 wrlong R9, RI     ' save R9
 add RI, #4

 wrlong R10, RI     ' save R10
 add RI, #4

 wrlong R11, RI     ' save R11
 add RI, #4

 wrlong R12, RI     ' save R12
 add RI, #4

 wrlong R13, RI     ' save R13
 add RI, #4

 wrlong R14, RI     ' save R14
 add RI, #4

 wrlong R15, RI     ' save R15
 add RI, #4

 wrlong R16, RI     ' save R16
 add RI, #4

 wrlong R17, RI     ' save R17
 add RI, #4

 wrlong R18, RI     ' save R18
 add RI, #4

 wrlong R19, RI     ' save R19
 add RI, #4

 wrlong R20, RI     ' save R20
 add RI, #4

 wrlong R21, RI     ' save R21
 add RI, #4

 wrlong R22, RI     ' save R22
 add RI, #4

 wrlong R23, RI     ' save R23

 mov r0, #0        ' setjmp must return zero

 jmp #EXEC_STOP
 word I16B_RETN

' Catalina Export longjmp

 alignl ' align long

C_longjmp

word I16B_EXEC

 alignl ' align long

 mov RI, r3        ' r3 is the address of our jmp_buf

 rdlong r0, RI     ' recover the flag

 add RI, #4
 cmp r0, #0 wz
 if_z add PC, #(@C_longjmp_1-@C_longjmp_0) ' if flag is zero, don't restore our mask

C_longjmp_0
 rdlong r0, RI     ' TBD !!! Restore signal mask here when implemented !!!

C_longjmp_1
 mov RI, r3        ' r3 is the address of our jmp_buf
 add RI, #8
 
 rdlong r0, RI     ' recover the PC saved by setjmp
 add RI, #4

 rdlong SP, RI     ' recover the SP saved by setjmp
 add RI, #4

 rdlong FP, RI     ' recover the FP saved by setjmp
 add RI, #4

 rdlong R6, RI     ' recover the R6 saved by setjmp
 add RI, #4

 rdlong R7, RI     ' recover the R7 saved by setjmp
 add RI, #4

 rdlong R8, RI     ' recover the R8 saved by setjmp
 add RI, #4

 rdlong R9, RI     ' recover the R9 saved by setjmp
 add RI, #4

 rdlong R10, RI     ' recover the R10 saved by setjmp
 add RI, #4

 rdlong R11, RI     ' recover the R11 saved by setjmp
 add RI, #4

 rdlong R12, RI     ' recover the R12 saved by setjmp
 add RI, #4

 rdlong R13, RI     ' recover the R13 saved by setjmp
 add RI, #4

 rdlong R14, RI     ' recover the R14 saved by setjmp
 add RI, #4

 rdlong R15, RI     ' recover the R15 saved by setjmp
 add RI, #4

 rdlong R16, RI     ' recover the R16 saved by setjmp
 add RI, #4

 rdlong R17, RI     ' recover the R17 saved by setjmp
 add RI, #4

 rdlong R18, RI     ' recover the R18 saved by setjmp
 add RI, #4

 rdlong R19, RI     ' recover the R19 saved by setjmp
 add RI, #4

 rdlong R20, RI     ' recover the R20 saved by setjmp
 add RI, #4

 rdlong R21, RI     ' recover the R21 saved by setjmp
 add RI, #4

 rdlong R22, RI     ' recover the R22 saved by setjmp
 add RI, #4

 rdlong R23, RI     ' recover the R23 saved by setjmp


 wrlong r0, SP     ' save the setjmp PC as our return address
 mov r0, r2 wz     ' set up our return value if non-zero ...
 if_nz add PC, #(@C_longjmp_2-@C_longjmp_00)

C_longjmp_00 
 mov r0, #1        ' ... otherwise return a value of 1 instead

C_longjmp_2

 jmp #EXEC_STOP
 word I16B_RETN

' Catalina Export siglongjmp

 alignl ' align long

C_siglongjmp

word I16B_EXEC

 alignl ' align long

 mov RI, r3        ' r3 is the address of our jmp_buf

 rdlong r0, RI     ' recover the flag

 add RI, #4
 cmp r0, #0 wz
 if_z add PC, #(@C_siglongjmp_1-@C_siglongjmp_0) ' if flag is zero, don't restore our mask

C_siglongjmp_0
 rdlong r0, RI     ' TBD !!! Restore signal mask here when implemented !!!

C_siglongjmp_1
 mov RI, r3        ' r3 is the address of our jmp_buf
 add RI, #8
 
 rdlong r0, RI     ' recover the PC saved by setjmp
 add RI, #4

 rdlong SP, RI     ' recover the SP saved by setjmp
 add RI, #4

 rdlong FP, RI     ' recover the FP saved by setjmp
 add RI, #4

 rdlong R6, RI     ' recover the R6 saved by setjmp
 add RI, #4

 rdlong R7, RI     ' recover the R7 saved by setjmp
 add RI, #4

 rdlong R8, RI     ' recover the R8 saved by setjmp
 add RI, #4

 rdlong R9, RI     ' recover the R9 saved by setjmp
 add RI, #4

 rdlong R10, RI     ' recover the R10 saved by setjmp
 add RI, #4

 rdlong R11, RI     ' recover the R11 saved by setjmp
 add RI, #4

 rdlong R12, RI     ' recover the R12 saved by setjmp
 add RI, #4

 rdlong R13, RI     ' recover the R13 saved by setjmp
 add RI, #4

 rdlong R14, RI     ' recover the R14 saved by setjmp
 add RI, #4

 rdlong R15, RI     ' recover the R15 saved by setjmp
 add RI, #4

 rdlong R16, RI     ' recover the R16 saved by setjmp
 add RI, #4

 rdlong R17, RI     ' recover the R17 saved by setjmp
 add RI, #4

 rdlong R18, RI     ' recover the R18 saved by setjmp
 add RI, #4

 rdlong R19, RI     ' recover the R19 saved by setjmp
 add RI, #4

 rdlong R20, RI     ' recover the R20 saved by setjmp
 add RI, #4

 rdlong R21, RI     ' recover the R21 saved by setjmp
 add RI, #4

 rdlong R22, RI     ' recover the R22 saved by setjmp
 add RI, #4

 rdlong R23, RI     ' recover the R23 saved by setjmp


 wrlong r0, SP     ' save the setjmp PC as our return address
 mov r0, r2 wz     ' set up our return value if non-zero ...
 if_nz add PC, #(@C_siglongjmp_2-@C_siglongjmp_00)

C_siglongjmp_00 
 mov r0, #1        ' ... otherwise return a value of 1 instead

C_siglongjmp_2

 jmp #EXEC_STOP
 word I16B_RETN

' end

