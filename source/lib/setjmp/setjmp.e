' The use of PRIMITIVE allows the library source files to be (mostly) 
' identical for both the P1 and P2. We define it here appropriately
' and preprocess the files when building the library.
#ifndef PRIMITIVE
#ifdef P2
#ifdef NATIVE
#define PRIMITIVE(op) calld PA, op
#else
#define PRIMITIVE(op) jmp op
#endif
#else
#define PRIMITIVE(op) jmp op
#endif
#endif

' Catalina Code

DAT ' code segment

' Catalina Export _setjmp

 alignl ' align long

C__setjmp
 mov RI, r3        ' r3 is the address of our jmp_buf

#ifdef P2
 wrlong r2, RI     ' save our flag (should be zero for setjmp)
 add RI, #4
 cmp r2, #0 wz
 if_z jmp #@C__setjmp_1 ' if flag is zero, don't save our mask
 wrlong r2, RI     ' TBD !!! Save signal mask here when implemented !!!
C__setjmp_1
 mov RI, r3        ' r3 is the address of our jmp_buf
 add RI, #8
 rdlong r0, SP     ' save our return address ...
 wrlong r0, RI     ' ... as our PC
 add RI, #4
#ifdef NATIVE
 wrlong PTRA, RI     ' save our SP
 add RI, #4
 wrlong PTRB, RI     ' save our FP
#else
 wrlong SP, RI     ' save our SP
 add RI, #4
 wrlong FP, RI     ' save our FP
#endif
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
 PRIMITIVE(#RETN)

#else

#ifdef LARGE
 mov BC, r2
 PRIMITIVE(#WLNG)        ' save our flag (should be zero for setjmp)
#else
 wrlong r2, RI     ' save our flag (should be zero for setjmp)
#endif 

 add RI, #4
 cmp r2, #0 wz
 PRIMITIVE(#BR_Z)
 long @C__setjmp_1 ' if flag is zero, don't save our mask

#ifdef LARGE
 mov BC, r2
 PRIMITIVE(#WLNG)        ' TBD !!! Save signal mask here when implemented !!!
#else
 wrlong r2, RI     ' TBD !!! Save signal mask here when implemented !!!
#endif 

C__setjmp_1
 mov RI, r3        ' r3 is the address of our jmp_buf
 add RI, #8
 rdlong r0, SP     ' save our return address ...

#ifdef LARGE
 mov BC, r0
 PRIMITIVE(#WLNG)        ' ... as our PC
#else 
 wrlong r0, RI     ' ... as our PC
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, SP
 PRIMITIVE(#WLNG)       ' save our SP
#else
 wrlong SP, RI     ' save our SP
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, FP
 PRIMITIVE(#WLNG)       ' save our FP
#else
 wrlong FP, RI     ' save our FP
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, R6
 PRIMITIVE(#WLNG)       ' save R6
#else
 wrlong R6, RI     ' save R6
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, R7
 PRIMITIVE(#WLNG)       ' save R7
#else
 wrlong R7, RI     ' save R7
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, R8
 PRIMITIVE(#WLNG)       ' save R8
#else
 wrlong R8, RI     ' save R8
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, R9
 PRIMITIVE(#WLNG)       ' save R9
#else
 wrlong R9, RI     ' save R9
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, R10
 PRIMITIVE(#WLNG)       ' save R10
#else
 wrlong R10, RI     ' save R10
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, R11
 PRIMITIVE(#WLNG)       ' save R11
#else
 wrlong R11, RI     ' save R11
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, R12
 PRIMITIVE(#WLNG)       ' save R12
#else
 wrlong R12, RI     ' save R12
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, R13
 PRIMITIVE(#WLNG)       ' save R13
#else
 wrlong R13, RI     ' save R13
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, R14
 PRIMITIVE(#WLNG)       ' save R14
#else
 wrlong R14, RI     ' save R14
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, R15
 PRIMITIVE(#WLNG)       ' save R15
#else
 wrlong R15, RI     ' save R15
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, R16
 PRIMITIVE(#WLNG)       ' save R16
#else
 wrlong R16, RI     ' save R16
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, R17
 PRIMITIVE(#WLNG)       ' save R17
#else
 wrlong R17, RI     ' save R17
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, R18
 PRIMITIVE(#WLNG)       ' save R18
#else
 wrlong R18, RI     ' save R18
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, R19
 PRIMITIVE(#WLNG)       ' save R19
#else
 wrlong R19, RI     ' save R19
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, R20
 PRIMITIVE(#WLNG)       ' save R20
#else
 wrlong R20, RI     ' save R20
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, R21
 PRIMITIVE(#WLNG)       ' save R21
#else
 wrlong R21, RI     ' save R21
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, R22
 PRIMITIVE(#WLNG)       ' save R22
#else
 wrlong R22, RI     ' save R22
#endif 
 add RI, #4

#ifdef LARGE
 mov BC, R23
 PRIMITIVE(#WLNG)       ' save R23
#else
 wrlong R23, RI     ' save R23
#endif 

 mov r0, #0        ' setjmp must return zero
 PRIMITIVE(#RETN)

#endif

' Catalina Export siglongjmp

 alignl ' align long

C_siglongjmp
 mov RI, r3        ' r3 is the address of our jmp_buf

#ifdef P2

 rdlong r0, RI     ' recover the flag
 add RI, #4
 cmp r0, #0 wz
 if_z jmp #@C_siglongjmp_1 ' if flag is zero, don't restore our mask
 rdlong r0, RI     ' TBD !!! Restore signal mask here when implemented !!!
C_siglongjmp_1
 mov RI, r3        ' r3 is the address of our jmp_buf
 add RI, #8
 rdlong r0, RI     ' recover the PC saved by setjmp
 add RI, #4
#ifdef NATIVE
 rdlong PTRA, RI     ' recover the SP saved by setjmp
 add RI, #4
 rdlong PTRB, RI     ' recover the FP saved by setjmp
#else
 rdlong SP, RI     ' recover the SP saved by setjmp
 add RI, #4
 rdlong FP, RI     ' recover the FP saved by setjmp
#endif
 add RI, #4
 rdlong R6, RI     ' recover the R6 saved by setjmp
 add RI, #4
 rdlong R7, RI     ' recover the R7 saved by setjmp
 add RI, #4
 rdlong R8, RI     ' recover the R8 saved by setjmp
 add RI, #4
 rdlong R9, RI     ' recover the R9 saved by setjmp
 add RI, #4
 rdlong R10, RI    ' recover the R10 saved by setjmp
 add RI, #4
 rdlong R11, RI    ' recover the R11 saved by setjmp
 add RI, #4
 rdlong R12, RI    ' recover the R12 saved by setjmp
 add RI, #4
 rdlong R13, RI    ' recover the R13 saved by setjmp
 add RI, #4
 rdlong R14, RI    ' recover the R14 saved by setjmp
 add RI, #4
 rdlong R15, RI    ' recover the R15 saved by setjmp
 add RI, #4
 rdlong R16, RI    ' recover the R16 saved by setjmp
 add RI, #4
 rdlong R17, RI    ' recover the R17 saved by setjmp
 add RI, #4
 rdlong R18, RI    ' recover the R18 saved by setjmp
 add RI, #4
 rdlong R19, RI    ' recover the R19 saved by setjmp
 add RI, #4
 rdlong R20, RI    ' recover the R20 saved by setjmp
 add RI, #4
 rdlong R21, RI    ' recover the R21 saved by setjmp
 add RI, #4
 rdlong R22, RI    ' recover the R22 saved by setjmp
 add RI, #4
 rdlong R23, RI    ' recover the R23 saved by setjmp
#ifdef NATIVE
 wrlong r0, PTRA   ' save the setjmp PC as our return address
#else
 wrlong r0, SP     ' save the setjmp PC as our return address
#endif
 mov r0, r2 wz     ' set up our return value if non-zero ...
 if_nz jmp #@C_siglongjmp_2 ' ... otherwise return a value of one ...
 mov r0, #1        ' ... instead
C_siglongjmp_2
 PRIMITIVE(#RETN)

#else

#ifdef LARGE 
 PRIMITIVE(#RLNG)
 mov r0, BC        ' recover the flag
#else
 rdlong r0, RI     ' recover the flag
#endif 

 add RI, #4
 cmp r0, #0 wz
 PRIMITIVE(#BR_Z)
 long @C_siglongjmp_1 ' if flag is zero, don't restore our mask

#ifdef LARGE 
 PRIMITIVE(#RLNG)      ' TBD !!! Restore signal mask here when implemented !!!
 mov r0, BC
#else
 rdlong r0, RI     ' TBD !!! Restore signal mask here when implemented !!!
#endif

C_siglongjmp_1
 mov RI, r3        ' r3 is the address of our jmp_buf
 add RI, #8
 
#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the PC saved by setjmp
 mov r0, BC
#else
 rdlong r0, RI     ' recover the PC saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the SP saved by setjmp
 mov SP, BC
#else
 rdlong SP, RI     ' recover the SP saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the FP saved by setjmp
 mov FP, BC
#else
 rdlong FP, RI     ' recover the FP saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R6 saved by setjmp
 mov R6, BC
#else
 rdlong R6, RI     ' recover the R6 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R7 saved by setjmp
 mov R7, BC
#else
 rdlong R7, RI     ' recover the R7 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R8 saved by setjmp
 mov R8, BC
#else
 rdlong R8, RI     ' recover the R8 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R9 saved by setjmp
 mov R9, BC
#else
 rdlong R9, RI     ' recover the R9 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R10 saved by setjmp
 mov R10, BC
#else
 rdlong R10, RI     ' recover the R10 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R11 saved by setjmp
 mov R11, BC
#else
 rdlong R11, RI     ' recover the R11 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R12 saved by setjmp
 mov R12, BC
#else
 rdlong R12, RI     ' recover the R12 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R13 saved by setjmp
 mov R13, BC
#else
 rdlong R13, RI     ' recover the R13 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R14 saved by setjmp
 mov R14, BC
#else
 rdlong R14, RI     ' recover the R14 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R15 saved by setjmp
 mov R15, BC
#else
 rdlong R15, RI     ' recover the R15 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R16 saved by setjmp
 mov R16, BC
#else
 rdlong R16, RI     ' recover the R16 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R17 saved by setjmp
 mov R17, BC
#else
 rdlong R17, RI     ' recover the R17 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R18 saved by setjmp
 mov R18, BC
#else
 rdlong R18, RI     ' recover the R18 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R19 saved by setjmp
 mov R19, BC
#else
 rdlong R19, RI     ' recover the R19 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R20 saved by setjmp
 mov R20, BC
#else
 rdlong R20, RI     ' recover the R20 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R21 saved by setjmp
 mov R21, BC
#else
 rdlong R21, RI     ' recover the R21 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R22 saved by setjmp
 mov R22, BC
#else
 rdlong R22, RI     ' recover the R22 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R23 saved by setjmp
 mov R23, BC
#else
 rdlong R23, RI     ' recover the R23 saved by setjmp
#endif

 wrlong r0, SP     ' save the setjmp PC as our return address
 mov r0, r2 wz     ' set up our return value if non-zero ...
 PRIMITIVE(#BRNZ)       ' ... otherwise ...
 long @C_siglongjmp_2 ' ... return a value of one ...
 mov r0, #1        ' ... instead
C_siglongjmp_2
 PRIMITIVE(#RETN)

#endif

' Catalina Export longjmp

 alignl ' align long

C_longjmp
 mov RI, r3        ' r3 is the address of our jmp_buf

#ifdef P2

 rdlong r0, RI     ' recover the flag
 add RI, #4
 cmp r0, #0 wz
 ifz jmp #@C_longjmp_1 ' if flag is zero, don't restore our mask
 rdlong r0, RI     ' TBD !!! Restore signal mask here when implemented !!!
C_longjmp_1
 mov RI, r3        ' r3 is the address of our jmp_buf
 add RI, #8
 rdlong r0, RI     ' recover the PC saved by setjmp
 add RI, #4
#ifdef NATIVE
 rdlong PTRA, RI   ' recover the SP saved by setjmp
 add RI, #4
 rdlong PTRB, RI   ' recover the FP saved by setjmp
#else
 rdlong SP, RI     ' recover the SP saved by setjmp
 add RI, #4
 rdlong FP, RI     ' recover the FP saved by setjmp
#endif
 add RI, #4
 rdlong R6, RI     ' recover the R6 saved by setjmp
 add RI, #4
 rdlong R7, RI     ' recover the R7 saved by setjmp
 add RI, #4
 rdlong R8, RI     ' recover the R8 saved by setjmp
 add RI, #4
 rdlong R9, RI     ' recover the R9 saved by setjmp
 add RI, #4
 rdlong R10, RI    ' recover the R10 saved by setjmp
 add RI, #4
 rdlong R11, RI    ' recover the R11 saved by setjmp
 add RI, #4
 rdlong R12, RI    ' recover the R12 saved by setjmp
 add RI, #4
 rdlong R13, RI    ' recover the R13 saved by setjmp
 add RI, #4
 rdlong R14, RI    ' recover the R14 saved by setjmp
 add RI, #4
 rdlong R15, RI    ' recover the R15 saved by setjmp
 add RI, #4
 rdlong R16, RI    ' recover the R16 saved by setjmp
 add RI, #4
 rdlong R17, RI    ' recover the R17 saved by setjmp
 add RI, #4
 rdlong R18, RI    ' recover the R18 saved by setjmp
 add RI, #4
 rdlong R19, RI    ' recover the R19 saved by setjmp
 add RI, #4
 rdlong R20, RI    ' recover the R20 saved by setjmp
 add RI, #4
 rdlong R21, RI    ' recover the R21 saved by setjmp
 add RI, #4
 rdlong R22, RI    ' recover the R22 saved by setjmp
 add RI, #4
 rdlong R23, RI    ' recover the R23 saved by setjmp
#ifdef NATIVE
 wrlong r0, PTRA   ' save the setjmp PC as our return address
#else
 wrlong r0, SP     ' save the setjmp PC as our return address
#endif
 mov r0, r2 wz     ' set up our return value if non-zero ...
 if_nz jmp #@C_longjmp_2 ' ... otherwise return a value of one ...
 mov r0, #1        ' ... instead
C_longjmp_2
 PRIMITIVE(#RETN)

#else

#ifdef LARGE 
 PRIMITIVE(#RLNG)
 mov r0, BC        ' recover the flag
#else
 rdlong r0, RI     ' recover the flag
#endif 

 add RI, #4
 cmp r0, #0 wz
 PRIMITIVE(#BR_Z)
 long @C_longjmp_1 ' if flag is zero, don't restore our mask

#ifdef LARGE 
 PRIMITIVE(#RLNG)      ' TBD !!! Restore signal mask here when implemented !!!
 mov r0, BC
#else
 rdlong r0, RI     ' TBD !!! Restore signal mask here when implemented !!!
#endif

C_longjmp_1
 mov RI, r3        ' r3 is the address of our jmp_buf
 add RI, #8
 
#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the PC saved by setjmp
 mov r0, BC
#else
 rdlong r0, RI     ' recover the PC saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the SP saved by setjmp
 mov SP, BC
#else
 rdlong SP, RI     ' recover the SP saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the FP saved by setjmp
 mov FP, BC
#else
 rdlong FP, RI     ' recover the FP saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R6 saved by setjmp
 mov R6, BC
#else
 rdlong R6, RI     ' recover the R6 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R7 saved by setjmp
 mov R7, BC
#else
 rdlong R7, RI     ' recover the R7 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R8 saved by setjmp
 mov R8, BC
#else
 rdlong R8, RI     ' recover the R8 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R9 saved by setjmp
 mov R9, BC
#else
 rdlong R9, RI     ' recover the R9 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R10 saved by setjmp
 mov R10, BC
#else
 rdlong R10, RI     ' recover the R10 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R11 saved by setjmp
 mov R11, BC
#else
 rdlong R11, RI     ' recover the R11 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R12 saved by setjmp
 mov R12, BC
#else
 rdlong R12, RI     ' recover the R12 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R13 saved by setjmp
 mov R13, BC
#else
 rdlong R13, RI     ' recover the R13 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R14 saved by setjmp
 mov R14, BC
#else
 rdlong R14, RI     ' recover the R14 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R15 saved by setjmp
 mov R15, BC
#else
 rdlong R15, RI     ' recover the R15 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R16 saved by setjmp
 mov R16, BC
#else
 rdlong R16, RI     ' recover the R16 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R17 saved by setjmp
 mov R17, BC
#else
 rdlong R17, RI     ' recover the R17 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R18 saved by setjmp
 mov R18, BC
#else
 rdlong R18, RI     ' recover the R18 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R19 saved by setjmp
 mov R19, BC
#else
 rdlong R19, RI     ' recover the R19 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R20 saved by setjmp
 mov R20, BC
#else
 rdlong R20, RI     ' recover the R20 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R21 saved by setjmp
 mov R21, BC
#else
 rdlong R21, RI     ' recover the R21 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R22 saved by setjmp
 mov R22, BC
#else
 rdlong R22, RI     ' recover the R22 saved by setjmp
#endif
 add RI, #4

#ifdef LARGE 
 PRIMITIVE(#RLNG)       ' recover the R23 saved by setjmp
 mov R23, BC
#else
 rdlong R23, RI     ' recover the R23 saved by setjmp
#endif

 wrlong r0, SP     ' save the setjmp PC as our return address
 mov r0, r2 wz     ' set up our return value if non-zero ...
 PRIMITIVE(#BRNZ)       ' ... otherwise ...
 long @C_longjmp_2 ' ... return a value of one ...
 mov r0, #1        ' ... instead
C_longjmp_2
 PRIMITIVE(#RETN)

#endif

' end

