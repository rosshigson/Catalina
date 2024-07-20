10 '
11 ' An example of using the USR function to call an assembly language
12 ' function with one argument. Note that if the value used for the address 
13 ' of the C_sqrt function (line 210) is not correct, this program will fail.
14
15 ' This program will only work on a Propeller 2 when Dumbo Basic is
16 ' compiled in NATIVE mode.
17 '
18 ' See the file "example.pasm" for how the following data (which is our
19 ' compiled assembly language USR functions) was generated:

20 DATA &Hf6002c18 : '  mov r0,r2        ' divide arg ...
21 DATA &Hf0442c01 : '  shr r0,#1        ' ... by 2
22 DATA &Hfe000006 : '  calld PA,#RETN   ' and return

23 DATA &Hfac02c18 : '  rdbyte r0, r2    ' get first char of string ...
24 DATA &Hf1042c01 : '  add r0, #1       ' ... increment it ...
25 DATA &Hfc402c18 : '  wrbyte r0, r2    ' ... and save it back
26 DATA &Hf6002c18 : '  mov r0,r2        ' put string in r0
27 DATA &Hfe000006 : '  calld PA,#RETN   ' and return

40 ' Dimension an array of (integers) suitable for our program sizes:
41 '
42 DIM PROG%(8)
43 SIZE% = 8 ' Define this so we can use the correct size in the code below 

101 '
102 ' READ the DATA representing the USR functions into our program array:
103 '
110 FOR I = 1 TO SIZE%
120 READ PROG%(I)
130 NEXT I

201 '
202 ' Get the addresses of our programs (and print them if we want):
203 '
210 DEF USR0 = &H21da0 : ' We get this value (i.e. @C_sqrt) from dbasic.lst
220 DEF USR1 = VARPTR(PROG%(1))
230 DEF USR2 = VARPTR(PROG%(4))

240 ' PRINT "PROG USR0 = @C_sqrt"
250 ' PRINT "PROG USR1 = ";HEX$(VARPTR(PROG%(1)))
260 ' PRINT "PROG USR2 = ";HEX$(VARPTR(PROG%(5)))
270 ' FOR I = 1 TO SIZE%
280 ' PRINT "PROG (";I;") @ ADDR "; HEX$(VARPTR(PROG%(I)))"; = "; HEX$(PROG%(I))
290 ' NEXT I

301 '
302 ' Call our USR functions:
303 '
310 LET J#=USR(123.456)
320 print "USR(123.456) = "; J#
330 J#=USR0(654.321)
340 print "USR0(654.321) = "; J#
350 LET I% = USR1(12345)
360 print "USR1(12345) = "; I%
370 I% = USR1(54321)
380 print "USR1(54321) = "; I%
390 LET S$=USR2("HELLO")
400 print "USR2(""HELLO"") = "; S$
410 S$=USR2("GOODBYE")
420 print "USR2(""GOODBYE"") = "; S$
430 END

