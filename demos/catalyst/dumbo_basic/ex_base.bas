rem
rem Uncomment one (or both, just to see what happens) of the 
rem following 'option base' lines ...
rem
10 option base 0 : b = 0 
rem 20 option base 1 : b = 1
rem
30 rem test a declared int array
40 dim a(4,4)
50 for i = b to 4
60 for j = b to 4
70 let a(i,j) = ((5-b)*(i-b)+(j-b))
80 print "i =";i;"j =";j;"a(i,j) =";a(i,j)
90 next j,i
300 print "done!"
310 print "ok?"

