10 REM
20 OPEN "O", #1, "TEST.DAT"
30 FIELD #1, 4 AS A$, 4 AS B$, 4 AS C$
40 A$=MKD$(123456.0)
50 PRINT USING "######.##"; CVD(A$);
60 PRINT
70 END
