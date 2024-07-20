10 '
11 ' An example of using the CALL statement to call an assembly language
12 ' function with up to 4 arguments. This version will only work on a
13 ' Propeller 1 when Dumbo Basic is compiled in LARGE mode.
16 '
17 ' See the file "example.pasm" for how the following data (which is our
18 ' compiled assembly language function) was generated:
19 '
20 DATA &H00000000 : ' nop              ' 
21 DATA &Ha0bc6635 : ' mov r0, r2       ' add ...
22 DATA &H80bc6636 : ' add r0, r3       ' ... our ...
23 DATA &H80bc6637 : ' add r0, r4       ' ... first 3 arguments
24 DATA &Ha0bc5c38 : ' mov RI, r5       ' write ...
25 DATA &Ha0bc5e33 : ' mov BC, r0       ' ... result ...
26 DATA &H5c7c0028 : ' jmp #WLNG        ' ... to the 4th argument
27 DATA &H5c7c000c : ' jmp #RETN        ' and return

31 '
32 ' Dimension an array of (integers) suitable for our program size:
33 '
34 DIM PROG%(8)
35 SIZE% = 8 ' Define this so we can use the correct size in the code below 

101 '
102 ' READ the DATA representng the function into our program array:
103 '
110 FOR I = 1 TO SIZE%
120 READ PROG%(I)
130 NEXT I

201 '
202 ' Get the address of our program (and also print the program):
203 '
210 ADDR%=VARPTR(PROG%(1))
220 PRINT "PROG ADDR = ";HEX$(ADDR%)
230 FOR I = 1 TO SIZE%
240 PRINT "PROG (";I;") = "; HEX$(PROG%(I))
250 NEXT I

301 '
302 ' Call the function at the address, passing up to 4 arguments,
303 ' the last of which is an address to put the result:
304 '
305 RESULT% = 0
310 CALL ADDR%(39,100,200,VARPTR(RESULT%))
320 PRINT "RESULT = ";RESULT%
330 END
