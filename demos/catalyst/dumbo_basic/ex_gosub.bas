10 GOSUB 40
20 PRINT "BACK FROM SUBROUTINE"
30 END
40 PRINT "SUBROUTINE";
50 PRINT " IN";
60 PRINT " PROGRESS"
70 gosub 100
80 RETURN
90 STOP
100 print "... now one level deeper ..."
110 gosub 150
120 return
150 print "... now another level deeper ..."
160 return 100


