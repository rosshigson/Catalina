10 print "testing INPUT ..."
20 input A$ : print A$
30 print "testing INPUT with prompt ..."
40 input "INPUT:"; A$ : print A$
50 print "testing LINE INPUT ..."
60 line input A$ : print A$
70 print "testing LINE INPUT; ..."
80 line input; A$ : print A$
90 print "testing LINE INPUT with prompt ..."
100 line input "LINE INPUT:"; A$ : print A$
110 print "testing LINE INPUT; with prompt ..."
120 line input; "LINE INPUT:"; A$ : print A$
200 goto 10
