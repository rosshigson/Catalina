10 OPEN "R",1,"TEST1.DAT", 50
15 FIELD #1, 10 AS A$, 30 AS B$,10 AS C$
16 FIELD #1, 5 AS D$, 30 AS E$,15 AS F$
17 GET 1
18 PRINT A$;" ";B$;" ";C$
19 PRINT D$;" ";E$;" ";F$
20 CLOSE 1
30 OPEN "I",#2,"TEST1.DAT",100
40 OPEN "TEST2.DAT" FOR OUTPUT ACCESS READ SHARED WRITE AS 3 LEN=50
45 FIELD #3, 10 AS A$, 30 AS B$,10 AS C$
46 FIELD #3, 5 AS D$, 30 AS E$,15 AS F$
50 CLOSE
60 OPEN "TEST2.DAT" AS #1
70 CLOSE 1, #2, #3
80 END

