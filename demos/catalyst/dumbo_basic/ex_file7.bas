10 PRINT "JUST PRESS ENTER WHEN PROMPTED FOR NAME TO END INPUT"
20 OPEN "O",#1,"PAYMENT.DAT"
30 INPUT "NAME";N$
40 IF N$="" THEN END
50 INPUT "SALARY";S
60 INPUT "BONUS";B
70 PRINT#1,N$;","S",";B
80 PRINT:GOTO 30
