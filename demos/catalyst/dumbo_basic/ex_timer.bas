10 t1=timer
15 print "start",time$,"(";t1")"
20 for i = 1 to 1000000
30 j = 1
40 k = 2
50 l = 3
100 next i
105 t2=timer
120 print "done",time$,"(";t2;")"
125 print "took ";t2-t1;"seconds"
130 end
