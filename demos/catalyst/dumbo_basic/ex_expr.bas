10 F$ = "hello"
20 I$ = "goodbye"
30 L = 1
40  IF (LEN(I$) - LEN(F$) - L + 1) <= 0 THEN PRINT "YES" ELSE PRINT "NO"
50  IF (LEN(I$) - LEN(F$) - L + 1) > 0 THEN PRINT "YES" ELSE PRINT "NO"
60 x = 2
70 y = 1+(x-1)
80 print y;
90 if (y > 2) then print "y=";y else print "y<=2"
100 if F$ <> "hello" then print "bad" else print "good"
110 if I$ < F$ then print "good" else print "bad"
120 print -1^(2+2)
130 print "val="; &o77
140 end

