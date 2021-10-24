1 rem
2 rem  This program can be used to assess performance (in lines per second).
3 rem  The program executes 12,000 lines of code, using a mix of arithmetic
4 rem  expressions, function calls, if statements, assgnments, gotos, gosubs 
5 rem  and return statements. Time the program and divide 12,000 by the 
6 rem  number of seconds it takes to execute.
7 rem

10 defint i-k
20 k = 0 : rem set k to 1 to enable printing
30 let i = 0 

40 print "starting" : t1 = timer

50 i = i + 1
60 if k = 1 then print "i="; i
70 on (i mod 4) gosub 100, 200, 300, 400
80 goto 500

100 a = ABS(i)
110 if k = 1 then print "a="; a
190 return

200 b = i/100.0 : c = i / 100.0
220 b = FIX (b)
230 c = INT (c)
240 if k = 1 then print "b=";b; "c=";c
290 return

300 gosub 400
390 return

400 d = pi*i
410 if k = 1 then print "d=";d;
490 return

500 e = a*b*c
510 if k = 1 then print "e=";e
520 goto 1000

1000 if i < 1000 goto 50

2000 t2 = timer
2010 print "stopping"
2020 print "took";t2-t1;"seconds"
2030 if t2-t1 = 0 then goto 2050
2040 print : print "result is ";12000/(t2-t1);"source lines of code/second"
2050 end
