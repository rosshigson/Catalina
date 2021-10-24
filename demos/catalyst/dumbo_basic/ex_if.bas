10 let i = 1
11 let j = 2
12 print "i =";i", j ="; j
20 print "test 1 : ";
30 if i <> 1 goto 2000
40 print "i=1"
50 print "test 2 : ";
60 if i = 1 goto 80
70 goto 2000
80 print "i=1"
90 print "test 3 : ";
100 if i = 1 then print "i=1"
110 print "test 4 : ";
120 if i = 1 then print "i=1" else print "i<>1"
130 print "test 5 : ";
140 if i <> 1 then print "i<>1" else print "i=1"
150 print "test 6 : ";
160 if i <> 1 then if j = 2 then print "i<>1,j=2"; else if j = 2 then print "i=1,j=2"; else print "i=1,j<>2"; end if : print " ... ok?"
170 print "test 7 : ";
180 if i = 1 then if j = 2 then print "i=1,j=2"; else if i = 1 then print "j<>2"; else print "i<>1"; end if : print " ... ok?"
1980 print "done"
1990 goto 9999
2000 print "i<>1"
9999 end
