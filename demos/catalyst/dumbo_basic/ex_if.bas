10 let i = 1 : let j = 2 : let k = 3 : print "i ="; i; ", j ="; j; ", k = "; k

20 print "test 1 : ";
30 if i <> 1 goto 2010
40 print "i=1"

50 print "test 2 : ";
60 if i = 1 goto 80
70 goto 2010
80 print "i=1"

90 print "test 3 : ";
100 if i = 1 then print "i=1"

110 print "test 4 : ";
120 if i = 1 then print "i=1" else goto 2010

130 print "test 5 : ";
140 if i <> 1 then goto 2010 else print "i=1"

150 print "test 6 : ";
160 if i <> 1 then if j = 2 then goto 2010 else if j = 2 then goto 2010 else goto 2040 end if end if end if : print "i=1,j=2"; : print " ... ok!"

170 print "test 7 : ";
180 if i = 1 then if j = 2 then print "i=1,j=2"; else if i = 1 then goto 2040 else goto 2010 end if end if : print " ... ok!"

190 print "test 8 : ";
200 if i = 1 and j = 2 then print "i=1,"; : print "j=2"; : print " ... ok!" else 2040

210 print "test 9 : ";
220 if i <> 1 or j <> 2 then print "i<>1 "; : print "or j<>2 ... error!"; else print "i=1,"; : print "j=2"; : print " ..."; : print " ok!" end if

230 print "test 10: ";
240 if i = 1 and j = 2 then 250 else goto 2040 end if
250 print "i=1,j=2 ... ok!"

260 print "test 11: ";
270 if i = 1 and j = 2 then goto 280 else 2040 end if
280 print "i=1,j=2 ... ok!" 

290 print "test 13: ";
300 if i = 1 and j = 2 then 310 else goto 2040 end if
310 print "i=1,j=2 ... ok!"

320 print "test 14: ";
330 if i = 1 and j = 2 then goto 340 else 2040 end if
340 print "i=1,j=2 ... ok!" 

350 print "test 15: ";
360 if i = 1 and j = 2 then print "i=1,j=2 ... ok!" : goto 400 else goto 2040 

400 print "test 16: ";
410 if i = 1 goto 430 else 2010 : print "error 1!"
420 goto 2010
430 if j <> 2 goto 2020 else 440 end if : print "error 2!"
440 print "i=1,j=2 ... ok!"

500 print "test 17: ";
510 if i = 1 then 530 else goto 2010 : print "error 3!"
520 print "i<>1 ... error!"
530 if j <> 2 then 2020 else goto 540 end if : print "error 4!"
540 print "i=1,j=2 ... ok!"

550 print "test 18: ";
560 if i = 1 then goto 580 else goto 2010 : print "error 3!"
570 print "i<>1 ... error!"
580 if j <> 2 then goto 2020 else goto 590 end if : print "error 4!"
590 print "i=1,j=2 ... ok!"

600 print "test 19: ";
610 if i = 1 then if j = 2 then if k = 3 then print "i=2,j=2,k=3 ... ok!" else 2040 else 2020 else 2010 end if

620 print "test 20: ";
630 if i = 1 then if j = 2 then if k = 3 then print "i=2,j=2,k=3 ... ok!" : goto 640 end if else 2040 else 2020 else 2010

640 print "test 21: ";
650 if i = 1 then if j = 2 then if k = 3 then print "i=2,j=2,k=3 ... ok!" else 2040 else 2020  end if else 2010

660 print "test 22: ";
670 if i = 1 then if j = 2 then if k <> 3 then 2040 else print "i=2,j=2,k=3 ... ok!" else 2020 else 2010 end if

680 print "test 23: ";
690 if i = 1 then if j = 2 then if k <> 3 then 2040 else print "i=2,j=2,k=3 ... ok!" : goto 700 end if else 2020 else 2010

700 print "test 24: ";
710 if i = 1 then if j = 2 then if k <> 3 then 2040 else  print "i=2,j=2,k=3 ... ok!" else 2020  end if else 2010

720 print "test 25: ";
730 if i = 1 then if j <> 2 then 2020 else if k = 3 then print "i=2,j=2,k=3 ... ok!" else 2040 else 2010 end if

740 print "test 26: ";
750 if i = 1 then if j <> 2 then 2040 else if k = 3 then print "i=2,j=2,k=3 ... ok!" : goto 760 end if else 2020 else 2010

760 print "test 27: ";
770 if i = 1 then if j <> 2 then 2020 else if k = 3 then print "i=2,j=2,k=3 ... ok!" else 2040 end if else 2010



800 print "test 28: ";
810 if i = 1 then if j = 2 then if k = 3 then print "i=2,j=2,k=3 ... ok!" else 2040 end if else 2020 end if else 2010 end if

820 print "test 29: ";
830 if i = 1 then if j = 2 then if k = 3 then print "i=2,j=2,k=3 ... ok!" : goto 840 else 2040 end if else 2020 end if else 2010 end if

840 print "test 30: ";
850 if i = 1 then if j = 2 then if k = 3 then print "i=2,j=2,k=3 ... ok!" else 2040 end if else 2020 end if else 2010 end if

860 print "test 31: ";
870 if i = 1 then if j = 2 then if k <> 3 then 2040 else print "i=2,j=2,k=3 ... ok!" end if else 2020 end if else 2010 end if

880 print "test 32: ";
890 if i = 1 then if j = 2 then if k <> 3 then 2040 else print "i=2,j=2,k=3 ... ok!" : goto 900 end if else 2020 end if else 2010 end if

900 print "test 33: ";
910 if i = 1 then if j = 2 then if k <> 3 then 2040 else  print "i=2,j=2,k=3 ... ok!" end if else 2020 end if else 2010 end if

920 print "test 34: ";
930 if i = 1 then if j <> 2 then 2020 else if k = 3 then print "i=2,j=2,k=3 ... ok!" end if else 2040 end if else 2010 end if

940 print "test 35: ";
950 if i = 1 then if j <> 2 then 2040 else if k = 3 then print "i=2,j=2,k=3 ... ok!" : goto 960 end if else 2020 end if else 2010 end if

960 print "test 36: ";
970 if i = 1 then if j <> 2 then 2020 else if k = 3 then print "i=2,j=2,k=3 ... ok!" end if else 2040 end if else 2010 end if



1800 print "test 37: ";
1810 if k = 3 goto 1820 : goto 2030
1815 print "error!"
1820 if k = 1 then 2030 else 1830
1825 print "error!"
1830 print "k=3 ... ok!"

1850 print "test 38: ";
1860 if k = 2 goto 2030 : goto 1870
1865 print "error!"
1870 if k = 3 then 1880 else 2030
1875 print "error!"
1880 print "k=3 ... ok!"

1900 print "test 39: ";
1910 if i = 1 then print "i=1"; : print " ... ok"; else print "a<>1"; : print " ... error"; : end if : print "!"

1920 print "test 40: ";
1930 if i = 1 then if j = 2 then print "i=1,j=2"; else if i = 1 then goto 2040 else goto 2010 end if end if : print " ... ok!"


2000 print "done" : end

2010 print "i<>1 ... error!" : end

2020 print "j<>2 ... error!" : end

2030 print "k<>3 ... error!" : end

2040 print "i<>1 or j<>2 ... error!" : end

2050 print "i<>1 or j<>2 or k <> 3 ... error!" : end
