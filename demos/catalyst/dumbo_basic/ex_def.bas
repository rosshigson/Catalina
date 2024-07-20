10 print "defint..."
20 defint a
30 print "defsng..."
40 defsng b, c-d
50 print "defdbl..."
60 defsng x-z,f,g
70 print "defstr..."
80 defstr p-t,u-z
90 defint a
100 defsng b
120 defstr c
130 a = -1.1 : b = -2.3
140 print "a='";a;"'"
150 print "b='";b;"'"
160 print "c='";c;"'"
180 width 100
190 clear 6000
200 print int(b); cint(b); fix(b);
210 a = 513
220 print hex$(a); " "; oct$(a)
230 print timer
240 defint x,y
250 x=1:y=2
260 print x,y
270 swap x,y
280 print x,y
290 print "date=";date$
300 print "time=";time$
310 print "timer=";timer
320 date$ = "11-01-2020"
330 time$ = "23:59:59"
340 end

