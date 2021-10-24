10 let i = 0
20 print "enter a number (1 - 10): ";
25 input i
26 print "i =", i
30 if i < 0 OR i > 255 then print "error" stop
31 print "ok!"
40 on i goto 110,120,130,140,150,160,170,180,190,200
50 print "fell through!"
60 end
110 print "one"
120 print "two"
130 print "three"
140 print "four"
150 print "five"
160 print "six"
170 print "seven"
180 print "eight"
190 print "nine"
200 print "ten"

201 print "enter a number (1 - 10): ";
202 input i
203 if i < 0 OR i > 255 then print "error" stop
204 on i gosub 210,220,230,240,250,260,270,280,290,300
205 print "done!"
206 end
210 print "one"
215 return
220 print "two"
225 return
230 print "three"
235 return
240 print "four"
245 return
250 print "five"
255 return
260 print "six"
265 return
270 print "seven"
275 return
280 print "eight"
285 return
290 print "nine"
295 return
300 print "ten"
305 return

