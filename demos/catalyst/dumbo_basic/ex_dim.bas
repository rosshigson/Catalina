10 rem We can have all of x, x%, x!, x# and x$ - as well as an array of each ! 
20 x= 12345 : x% = 54321 : x! = 123.456 : x# = 654.321 : x$ = "wow, cool... "
25 print "x =";x;"x%=";x%;"x#=";x#;"x!=";x!;"x$=";x$
30 rem test a declared int array
40 dim a(12,12)
50 for i = 1 to 12
60 for j = 1 to 12
70 let a(i,j) = (12*i+j)
80 print "i =";i;"j =";j;"a(i,j) =";a(i,j)
90 next j,i
100 rem test a declared real array
110 dim x#(10,10)
120 for i = 1 to 10
130 for j = 1 to 10
140 x#(i,j) = i+j/10.0
150 print "i =";i;"j =";j;"x#(i,j) =";x#(i,j)
160 next i,j
170 dim s$(20,20)
180 for i = 1 to 20
190 for j = 1 to 20
200 if i < j then s$(i,j) = "i less than j" else s$(i,j) = "i not less than j"
220 print "i =";i;"j =";j;s$(i,j)
230 next j,i
240 rem next array is autodeclared with dimensions = 10
245 rem dim x!(10,10)
250 for i = 1 to 10
260 for j = 1 to 10
270 x!(i,j) = i+j/10.0
280 print "i =";i;"j =";j;"x!(i,j) =";x!(i,j)
290 next i,j
300 print "done!"
310 print "ok?"
320 end
