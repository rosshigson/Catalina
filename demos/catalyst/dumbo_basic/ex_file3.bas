10 ON ERROR GOTO 2000
20 OPEN "A", #1, "NAMES.DAT"
30 PRINT "JUST PRESS ENTER WHEN PROMPTED FOR NAME TO END INPUT"
110 REM ADD NEW ENTRIES TO FILE
120 INPUT "NAME"; N$
130 IF N$="" THEN 200 : ' CARRIAGE RETURN EXITS INPUT LOOP
140 LINE INPUT "ADDRESS? "; A$
150 LINE INPUT "BIRTHDAY? "; B$
160 PRINT#1, N$
170 PRINT#1, A$
180 PRINT#1, B$
190 PRINT: GOTO 120
200 CLOSE #1
210 END
2000 ON ERROR GOTO 0
2010 END
