10 '
11 ' An example of using the CALL statement to call an assembly language
12 ' function with up to 4 arguments.
13 '

14 '
15 ' See the file "example.pasm" for how the following data (which is our
16 ' compiled assembly language function) was generated:
17 '
20 DATA &Hfd647058 : ' drvl #56         ' light a LED to prove we were called
21 DATA &Hf6002c18 : ' mov r0, r2       ' add ...
22 DATA &Hf1002c19 : ' add r0, r3       ' ... our ...
23 DATA &Hf1002c1a : ' add r0, r4       ' ... first 3 arguments
24 DATA &Hfc602c1b : ' wrlong r0, r5    ' write result to the 4th argument
25 DATA &Hfe000006 : ' PRIMITIVE(#RETN) ' and return

31 '
32 ' Dimension an array of (integers) suitable for our program size:
33 '
34 DIM PROG%(6)
35 SIZE% = 6 ' Define this so we can use the correct size in the code below 

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
310 CALL ADDR%(1,2,3,VARPTR(RESULT%))
320 PRINT "RESULT = ";RESULT%
330 END
