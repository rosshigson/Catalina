1 rem From: whirata@pixi.com (Wayne R Hirata) Newsgroups: comp.lang.basic.misc
2 rem Subject: Re: Old 1976 Star Trek in BASIC (no graphics)
3 rem Date: Sun, 17 Sep 1995 08:11:44 GMT
4 rem
5 rem  *** SUPER STAR TREK ***
6 rem   INTELLEC MDS VERSION
7 rem WRITTEN IN BASIC BY RON WILLIAMS
8 rem   INTEL CORP. - 5/15/76
9 rem ADAPTED FROM A FORTRAN VERSION WRITTEN
10 rem   FOR THE CDC 6600 IN 1974.
11 rem   FOR Dumbo BASIC IN 2009 (by rossh).
12 dim g1$(16),v$(5,5),c$(20),g(8,8),d$(12),q$(10,10),d4(12),d9(106)
13 dim s2(8,8),t$(10),s$(10),c2$(10),c5(10),g1(10),f1(10)
14 dim s7$(10),c1(10),c2(10),b2(10),b3(10) : q$ = "?"
15 data "S.R. SENSORS","L.R. SENSORS","PHASERS","PHOTON TUBES","LIFE SUPPORT"
20 data "WARP ENGINES","IMPULSE ENGINES","SHIELDS","SUBSPACE RADIO"
21 data "SHUTTLE CRAFT","COMPUTER","TRANSFER PANEL","ABANDON","CHART","COMPUTER"
22 data "DAMAGES","DESTRUCT","DOCK","IDLE","IMPULSE","LRSCAN","NAVIGATE","PHASERS","QUIT"
23 data "SHIELDS","SOS","SRSCAN","STATUS","TORPEDO","TRANSFER","VISUAL","WARP","SHORT"
24 data "MEDIUM","LONG","BEGINNER","NOVICE","SENIOR","EXPERT","COURSE","WCOST","ICOST"
25 data "PEFFECT","SCORE","END","ANTARES","SIRIUS","RIGEL","MERAK","PROCYON","CAPELLA"
26 data "VEGA","DENEB","CANOPUS","ALDEBARAN","ALTAIR","REGULUS","BELLATRIX","ARCTURUS"
27 data "POLLUX","SPICA",10.5,12,1.5,9,0,3,7.5,6,4.5
28 def fna(X)=INT(8*RND(X))+1:DEF FNB(X)=INT(10*RND(X))+1
29 def fnd(X)=X/60
30 def fnr(X)=INT(X*10+.5)/10:DEF FNS(X)=INT(X*100+.5)/100
35 randomize timer : rem gosub 40000
40 for i = 1 to 12 : read d$(i) : next : for i = 1 to 20 : read c$(i) : next
43 for i = 1 to 3 : read t$(i) : next : for i = 1 to 4 : read s$(i) : next : for i = 1 to 6
44 read c2$(i) : next : for i = 1 to 16 : read g1$(i) : next : for i = 1 to 9 : read c5(i) : next
45 rem CALL SETUP
46 gosub 24000 : s7$(1) = "   " : s7$(2) = "  " : s7$(3) = " " : s7$(4) = ""
70 if a2 <> 0 then 900
75 j4 = 0 : t1 = 0 : print : input "COMMAND ";a$ : if len (a$) > 1 then 110
80 print "USE AT LEAST 2 LETTERS, PLEASE." : goto 75
110 for i = 1 to 20
120 if a$ = left$(c$(i),len (a$)) then 150
130 next
135 input "ILLEGAL COMMAND - DO YOU NEED A LIST ";b$
136 if left$(b$,1) = "N" then 70
140 print : for i = 1 to 20 step 4
141 print c$(i);tab (12);c$(i+1);tab (22);c$(i+2);tab (32);c$(i+3)
142 next : print : goto 70
150 on i goto 200,225,250,275,290,300,325,350,375,400
160 on i-10 goto 425,450,475,500,525,540,550,575,600,625
170 print "ERROR AT 170 - SHOULD NOT BE HERE"
180 sto p
200 rem-ABANDON
201 gosub 35000
210 goto 70
225 rem-CHART
226 gosub 3000
230 goto 70
250 rem-COMPUTER
251 gosub 5000
260 goto 70
275 rem-DAMAGES
276 gosub 8000
280 goto 70
290 rem - DESTRUCT
291 gosub 36000 : goto 70
300 rem-DOCK
301 gosub 7000
310 goto 70
325 rem-IOLE
326 gosub 33000
330 if j3 = 0 then 70
331 if a2 <> 0 then 900
332 if g(q1,q2) = 1000 then 750
340 gosub 1000
345 goto 70
350 rem-IMPULSE
351 gosub 13000
352 if j3 = 0 then 70
353 goto 700
375 rem-LRSCAN
376 gosub 14000
377 goto 70
400 rem-NAVIGATE
401 gosub 34000
402 if j3 = 0 then 70
410 goto 700
425 rem-PHASERS
426 gosub 20000
427 if j3 = 0 then 70
428 gosub 1000
429 goto 70
450 rem-QUIT
455 goto 900
460 print "TOO BAD...WE HATE TO LOSE GOOD ASTRONAUTS!"
465 goto 37010
475 rem-SHIELDS
476 gosub 26000
477 if j3 = 0 then 70
478 if a2 <> 0 then 900
479 gosub 1000
480 s9 = 0
485 goto 70
500 rem-SOS
501 gosub 11000
502 goto 70
525 rem-SRSCAN
526 gosub 29000
530 goto 70
540 rem - STATUS
541 print
545 gosub 37000 : goto 70
550 rem-TORPEDOS
551 gosub 21000
552 if j3 = 0 then 70
555 goto 700
575 rem-TRANSFER
576 gosub 31000
580 if j3 = 0 then 70
585 if a2 <> 0 then 900
590 if g(q1,q2) <> 1000 then 70
595 goto 750
600 rem-VISUAL
601 gosub 32000
602 if j3 = 0 then 70
603 if a2 <> 0 then 900
610 if g(q1,q2) <> 1000 then 70
615 goto 750
625 rem-WARP
627 gosub 25000
630 goto 70
700 rem-AFTERMOVINGSTARSHIP
710 if a2 <> 0 then 900
720 if t1 <> 0 then gosub 9000
730 if a2 <> 0 then 900
740 if g(q1,q2) < 1000 then 790
750 gosub 2000
760 if a2 <> 0 then 900
770 goto 740
790 gosub 1000
795 goto 70
900 rem-WE'RE FINISHED
901 print : print : input "WOULD YOU LIKE TO TRY AGAIN ";a$
910 if left$(a$,1) = "Y" then 45
920 goto 460
940 rem-BEGINSUBROUTINES
1000 rem-ATTACK
1010 if (c3 <> 0) and (j4 = 0) then gosub 16000
1020 if k3 = 0 then return
1030 if a2 <> 0 then return
1040 p2 = 1/i8
1050 j5 = 0
1060 print
1070 if c5$ = "DOCKED" then 1780
1080 h2 = 0 : h3 = 0 : c6 = 1
1090 if s9 = 1 then c6 = 0.5+0.5*rnd(1)
1100 a3 = 0
1110 for l = 1 to k3
1120 if k6(l) < 0 then 1540
1130 a3 = 1
1140 d6 = 0.8+0.05*rnd(1)
1150 h4 = k6(l)*d6^k8(l)
1160 if (s4 = 0) and (s9 = 0) then 1230
1170 p3 = 0.1 : if p2*s3 > p3 then p3 = p2*s3
1180 h5 = p3*c6*h4+1
1190 if h5 > s3 then h5 = s3
1195 s3 = s3-h5
1200 h4 = h4-h5
1210 if (p3 > 0.1) and (h4 < 5.000000E-03*e1) then 1540
1230 j5 = 1
1240 print fnr(h4);"UNIT HIT ON THE ";s5$;" FROM ";
1250 j6 = k4(l) : j7 = k5(l)
1260 if q$(j6,j7) = "K" then print "KLINGON AT";
1270 if q$(j6,j7) = "C" then print "COMMANDER AT";
1280 print j6;"-";j7
1290 if h4 > h2 then h2 = h4
1300 h3 = h3+h4
1310 if h4 < (275-25*s8)*(1+0.5*rnd(1)) then 1530
1320 n4 = 1+int(h4/(500+100*rnd(1)))
1330 print "***CRITICAL HIT--";
1340 k9 = 1
1350 for w4 = 1 to n4
1360 j9 = int(12*rnd(1))+1
1370 c5(w4) = j9
1380 e3 = (h4*d5)/(n4*(75+25*rnd(1)))
1390 if j9 = 6 then e3 = e3/3
1395 d4(j9) = d4(j9)+e3
1400 if w4 = 1 then 1470
1420 for v = 1 to w4
1430 if j9 = c5(v-1) then 1480
1440 next v
1450 k9 = k9+1
1460 if k9 = 3 then print
1465 print " AND ";
1470 print d$(j9);
1480 next w4
1490 print " DAMAGED."
1500 if d4(8) = 0 then 1530
1510 if s4 <> 0 then print "*** SHIELDS KNOCKED DOWN."
1520 s4 = 0
1530 e1 = e1-h4
1540 next l
1550 if a3 = 0 then return
1560 if e1 <= 0 then 1750
1570 p4 = 100*p2*s3+0.5
1580 if j5 <> 0 then 1610
1590 print "KLINGONS ATTACK--SHIELD STRENGTH REDUCED TO ";
1600 goto 1650
1610 print "ENERGY LEFT:";fns(e1);"  SHIELDS ";
1620 if s4 <> 0 then print "UP,";
1630 if (s4 = 0) and (d4(8) = 0) then print "DOWN, ";
1640 if d4(8) > 0 then print "DAMAGED, ";
1650 print int(p4);"%"
1660 if (h2 < 200) and (h3 < 500) then 1800
1670 j8 = int(h3*rnd(1)*0.015)
1680 if j8 < 2 then 1800
1690 print
1700 print "MCCOY - 'SICKBAY TO BRIDGE. WE SUFFERED ";
1710 print j8;"CASUALTIES"
1720 print "     IN THAT LAST ATTACK'"
1730 c4 = c4+j8
1740 goto 1800
1750 f9 = 5
1760 gosub 10000
1770 return
1780 print "*** KLINGONS ATTACK-- STARBASE SHIELDS PROTECT ";
1790 print "THE ";s5$
1800 for w4 = 1 to k3
1810 k8(w4) = k7(w4)
1820 next w4
1830 gosub 28000
1840 return
2000 rem-AUTO VER
2001 print
2010 if j4 = 0 then 2050
2020 print "*** RED ALERT! RED ALERT!"
2030 print "***THE ";s5$;" HAS STOPPED IN A QUADRANT ";
2040 print "CONTAINING A SUPERNOVA."
2050 print "*** EMERGENCY AUTO -OVERRIDE ATTEMPTS TO HURL ";
2060 print s5$
2070 print "  SAFELY OUT OF THE QUADRANT."
2080 s2(q1,q2) = 1
2090 gosub 18000
2100 if d4(6) = 0 then 2290
2110 print
2120 print "WARP ENGINES DAMAGED."
2130 print
2140 print "ATTEMPTING TO ENGAGE IMPULSE ENGINES..."
2150 if d4(7) = 0 then 2190
2160 print "IMPULSE ENGINES DAMAGED."
2165 f9 = 8
2170 gosub 10000
2180 return
2190 p2 = 0.75*e1
2200 d6 = 4.000000E-03*(p2-50)
2210 d7 = 1.4142+1.2*rnd(1)
2220 d1 = d6
2230 if d6 > d7 then d1 = d7
2240 t1 = d1/0.4
2250 d2 = 12*rnd(1)
2260 j4 = 0
2270 gosub 13200
2280 goto 2400
2290 w1 = 6+2*rnd(1)
2300 w2 = w1*w1
2310 p2 = 0.75*e1
2320 d6 = p2/(w1*w1*w1*(s4+1))
2330 d7 = 1.4142+2*rnd(1)
2340 d1 = d6
2350 if d6 > d7 then d1 = d7
2360 t1 = 10*d1/w2
2370 d2 = 12*rnd(1)
2380 j4 = 0
2390 gosub 34500
2400 if j4 <> 0 then 2440
2410 f9 = 8
2420 gosub 10000
2430 return
2440 if r1 <> 0 then return
2450 f9 = 1
2460 gosub 10000
2470 return
3000 rem-CHART
3001 print : print "      1   2   3   4   5   6   7   8"
3010 print "     --- --- --- --- --- --- --- ---"
3020 for i = 1 to 8
3030 print i;" ";
3040 for j = 1 to 8
3060 on sgn (s2(i,j))+2 goto 3070,3090,3110
3065 print "ERR AT 3065" : sto p
3070 print " .1.";
3080 goto 3160
3090 print " ...";
3100 goto 3160
3110 if s2(i,j) > 1000 then 3150
3120 if g(i,j) < 1000 then print s7$(len (str$ (g(i,j))));str$ (g(i,j));
3130 if g(i,j) = 1000 then print " ***";
3140 goto 3160
3150 print s2(i,j)-1000;
3160 next j
3170 print
3180 next i : gosub 18400
3185 print
3190 print "THE ";s5$;" IS CURRENTLY IN ";g2$;" (";q1;"-";q2;")"
3200 return
4000 rem-CHOOSE
4001 for i = 1 to 10 : print : next : for i = 1 to 41 : print "*"; : next : print
4002 print "**";tab (39);"**"
4003 print "** WELCOME TO THE WORLD OF STAR TREK **"
4008 print "**";tab (39);"**" : for i = 1 to 41 : print "*"; : next : print
4010 print : print
4070 s8 = 0 : l2 = 0
4090 print "HOW LONG A GAME WOULD YOU LIKE";
4095 input a$
4100 for i = 1 to 3
4110 if a$ = left$(t$(i),len (a$)) then 4150
4120 next i
4130 print "WOULD YOU LIKE A SHORT, MEDIUM OR LONG GAME";
4140 goto 4095
4150 l2 = i
4160 print "ARE YOU A BEGINNER, NOVICE, SENIOR OR EXPERT PLAYER";
4170 input a$
4180 for i = 1 to 4
4190 if a$ = left$(s$(i),len (a$)) then 4220
4200 next i
4210 goto 4160
4220 s8 = i
4230 input "ENTER YOUR MISSION PASSWORD... ";x$
4244 print
4245 print "....SETTING UP THE GALAXY...."
4250 j = rnd(1)
4260 rem-INITIALIZE
4270 d5 = 0.5*s8
4280 i2 = int(l2+1+rnd(1)*3)
4290 if i2 > 5 then i2 = 5
4300 r3 = i2
4310 i5 = 7*l2
4320 r5 = i5
4340 r7 = (s8-2*rnd(1)+1)*s8*0.1+0.1
4350 if r7 < 0.2 then r7 = r7+0.1
4360 i1 = int(2*r7*i5)
4370 r1 = i1
4380 i4 = int(s8+0.0625*i1*rnd(1))
4390 r2 = i4
4400 i3 = (i1+4*i4)*i5
4410 r4 = i3
4420 return
5000 rem-COMPUTE
5001 if d4(11) = 0 then 5030
5010 print "LIBRARY COMPUTER DISABLED"
5020 return
5030 print "----LIBRARY COMPUTER ACTIVE----"
5040 input "PROGRAM NAME ";b$
5050 for i = 1 to 6
5060 if b$ = left$(c2$(i),len (b$)) then 5120
5070 next
5080 print "VALID PROGRAMS ARE:"
5090 print " COURSE  WCOST  ICOST"
5100 print " PEFFECT  SCORE  END"
5110 goto 5040
5120 on i goto 5200,5300,5400,5500,5600,5700
5200 rem-COURSE&DIRECTION
5210 input "ENTER QUADRANT AND SECTOR - ";a3,a4
5220 if (a3 <> int(a3)) or (a4 <> int(a4)) then 5990
5221 if a3 < 0 then 5040
5222 if a3 = 0 then a3 = 10*q1+q2
5223 a3 = a3+0.5
5225 k = int(a3/10)
5226 if (k < 1) or (k > 8) then 5990
5227 c6(1) = k : k = int(a3-c6(1)*10)
5228 if (k < 1) or (k > 8) then 5990
5229 c6(2) = k : a4 = a4+0.5
5230 k = int(a4/100)
5231 if (k < 1) or (k > 10) then 5990
5232 c6(1) = c6(1)+(k-1)/10 : k = int(a4-k*100)
5233 if (k < 1) or (k > 10) then 5990
5234 c6(2) = c6(2)+(k-1)/10
5235 x = q1+((s6-1)/10)-c6(1) : y = q2+((s7-1)/10)-c6(2)
5236 d1 = 0 : d2 = 0 : if (x = 0) and (y = 0) then 5250
5237 d1 = sqr (x*x+y*y)
5238 if x < 0 then z7 = sgn (y)*(3.1416-atn (abs (y/x)))
5239 if x = 0 then z7 = sgn (y)*1.5708
5240 if x > 0 then z7 = atn (y/x)
5245 d2 = 12-z7*1.909859 : if d2 > 12 then d2 = d2-12
5250 print "COURSE IS";fns(d2);" FOR A DISTANCE OF";
5260 print fns(d1);"QUADRANTS." : goto 5040
5300 rem-COST FOR WARP DRIVE
5302 input "ENTER DISTANCE AND WARP FACTOR ";d1,a4
5304 if (d1 < 0) then 5040
5310 c7 = d1*a4*a4*a4
5315 t1 = (10*d1)/(a4*a4)
5320 print "IT WOULD TAKE";fns(t1);"STARDATES AND USE"
5325 print fnr(c7);"UNITS OF ENERGY (";fnr(c7+c7);" IF SHIELDS ARE UP)"
5330 goto 5040
5400 rem-COST FOR IMPULSE POWER
5410 input "ENTER DISTANCE... ";d1
5420 if d1 < 0 then 5040
5430 c7 = 250*d1+50 : t1 = d1/0.4
5440 print "IT WOULD TAKE";fnr(t1);"STARDATES AND USE"
5450 print c7;"UNITS OF ENERGY"
5460 goto 5040
5500 rem-PHASER EFFECTIVENESS
5510 input "ENTER PHASER RANGE IN QUADRANTS ";a3
5520 if a3 < 0 then 5040
5530 a3 = a3*10 : c7 = (0.9^a3)*100
5540 print "PHASERS ARE ";left$(str$ (c7),5);"% EFFECTIVE AT THAT RANGE"
5550 goto 5040
5600 rem- SCORE
5610 gosub 23000
5620 goto 5040
5700 return
5990 print " FORMAT IS MN,XXYY...WHERE MN IS THE QUADRANT"
5991 print "AND XXYY IS THE SECTOR...E.G. 64,0307 REFERS"
5992 print "TO QUADRANT 6-4, SECTOR 3-7."
5993 print "NOTE: SECTOR COORDINATES MUST BE 4 DIGITS."
5995 goto 5040
6000 rem - DEADKL
6001 if t2$ <> "C" then 6100
6010 c3 = 0 : print "***COMMANDER AT";
6020 for f = 1 to r2
6030 if (c1(f) = q1) and (c2(f) = q2) then 6050
6040 next f
6050 c1(f) = c1(r2) : c2(f) = c2(r2) : c1(r2) = 0 : c2(r2) = 0
6060 r2 = r2-1 : f1(2) = 1.000000E+30
6070 if r2 <> 0 then f1(2) = d0-(i4/r2)*log (rnd(1))
6080 k2 = k2+1
6090 goto 6120
6100 print "***KLINGON AT";
6110 k1 = k1+1
6120 print a5;"-";a6;"DESTROYED."
6130 q$(a5,a6) = "." : r1 = r1-1
6140 if r1 = 0 then return
6150 r5 = r4/(r1+4*r2)
6160 g(q1,q2) = g(q1,q2)-100
6170 for f = 1 to k3
6180 if (k4(f) = a5) and (k5(f) = a6) then 6200
6190 next f
6200 k3 = k3-1
6210 if f > k3 then 6250
6220 for g = f to k3
6230 k4(g) = k4(g+1) : k5(g) = k5(g+1) : k6(g) = k6(g+1)
6235 k7(g) = k7(g+1) : k8(g) = k7(g)
6240 next g
6250 k4(k3+1) = 0 : k5(k3+1) = 0 : k7(k3+1) = 0 : k8(k3+1) = 0 : k6(k3+1) = 0
6260 return
7000 rem-DOCK
7001 if c5$ = "DOCKED" then 7100
7010 if b6 = 0 then 7020
7015 if (abs (s6-b6) <= 1) and (abs (s7-b7) <= 1) then 7040
7020 print s5$;" NOT ADJACENT TO A BASE."
7030 return
7040 c5$ = "DOCKED"
7050 print "HELMSMAN SULU - 'DOCKING MANEUVER COMPLETED.'"
7060 e1 = i7 : s3 = i8 : t4 = i9 : l1 = j1
7070 return
7100 print "MR. SULU - 'BUT CAPTAIN, WE'RE ALREADY DOCKED!'"
7110 return
8000 rem-DREPORT
8001 j = 0
8003 print
8005 for i = 1 to 12
8010 if d4(i) <= 0 then 8070
8020 if j <> 0 then 8060
8030 print "   DEVICE";space$(12);"-REPAIR TIMES-"
8040 print space$(21);"IN FLIGHT  DOCKED"
8050 j = 1
8060 print " ";d$(i);tab (23);fns(d4(i));tab (33);fns(d3*d4(i))
8070 next i
8080 if j = 0 then print "MR. SPOCK - 'ALL DEVICES FUNCTIONAL, CAPTAIN'"
8090 return
9000 rem-EVENTS
9001 m = 0 : d7 = d0+t1
9010 for l = 1 to 5
9020 if f1(l) > d7 then 9040
9030 m = l : d7 = f1(l)
9040 next l
9050 x6 = d7-d0 : d0 = d7
9060 r4 = r4-(r1+4*r2)*x6
9070 r5 = r4/(r1+4*r2)
9080 if r5 > 0 then 9120
9090 f9 = 2
9100 gosub 10000
9110 return
9120 if (d4(5) = 0) or (c5$ = "DOCKED") then 9180
9130 if (l1 >= x6) or (d4(5) <= l1) then 9160
9140 f9 = 3 : gosub 10000
9150 return
9160 l1 = l1-x6
9170 if d4(5) <= x6 then l1 = j1
9180 r = x6
9190 if c5$ = "DOCKED" then r = x6/d3
9200 for l = 1 to 12
9210 if d4(l) <= 0 then 9230
9220 d4(l) = d4(l)-r
9225 if d4(l) < 0 then d4(l) = 0
9226 if d4(l) <> 0 then 9230
9227 print : print "DAMAGE CONTROL- '";d$(l);" NOW OPERATIONAL.'"
9230 next l
9240 if m = 0 then return
9250 t1 = t1-x6
9260 on m goto 9270,9290,9340,9350,9470
9270 rem-SUPERNOVA
9280 x2 = 0 : y2 = 0 : gosub 27000
9285 f1(1) = d0-0.5*i5*log (rnd(1))
9286 if g(q1,q2) = 1000 then return
9287 goto 9001
9290 rem-TRACTOR BEAM
9291 if r2 = 0 then 9330
9292 if c5$ = "DOCKED" then 9325
9293 i = int(rnd(1)*r2)+1
9294 y6 = (c1(i)-q1)^2+(c2(i)-q2)^2
9295 if y6 = 0 then 9325
9296 y6 = sqr (y6) : t1 = 0.17778*y6
9297 print : print "***";s5$;" CAUGHT IN LONG-RANGE TRACTOR BEAM--"
9298 q1 = c1(i) : q2 = c2(i)
9299 s6 = fnb(1) : s7 = fnb(1)
9300 print "  PULLED TO QUADRANT";q1;"-";q2;", SECTOR";s6;"-";s7
9301 if r6 <> 0 then print "(REMAINDER OF IDLE PERIOD CANCELLED)"
9302 r6 = 0
9303 if s4 <> 0 then 9320
9304 if (d4(8) = 0) and (s3 > 0) then 9310
9305 print "(SHIELDS NOT CURRENTLY USABLE.)"
9307 goto 9320
9310 gosub 26500
9315 s9 = 0
9320 gosub 18000
9325 f1(2) = d0+t1-1.5*(i5/r2)*log (rnd(1))
9326 goto 9001
9330 f1(2) = 1.000000E+30 : goto 9001
9340 d9(1) = d0 : d9(2) = r1 : d9(3) = r2 : d9(4) = r3 : d9(5) = r4 : d9(6) = r5
9342 d9(7) = s1 : d9(8) = b1 : d9(9) = k1 : d9(10) = k2
9343 for i = 1 to 8 : for j = 1 to 8 : d9(i-1+8*(j-1)+11) = g(i,j) : next j : next i
9344 for i = 75 to 84 : d9(i) = c1(i-74) : next
9345 for i = 85 to 94 : d9(i) = c2(i-84) : next
9346 for i = 95 to 99 : d9(i) = b2(i-94) : next
9347 for i = 100 to 104 : d9(i) = b3(i-99) : next
9348 d9(105) = b4 : d9(106) = b5
9349 s0 = 1 : f1(3) = d0-0.3*i5*log (rnd(1)) : goto 9001
9350 rem - STARBASE ATTACK
9355 if (r2 = 0) or (r3 = 0) then 9400
9360 for i = 1 to r3 : for j = 1 to r2 : if (b2(i) = c1(j)) and (b3(i) = c2(j)) then 9410
9370 next j : next i
9380 f1(4) = d0+0.5+3*rnd(1)
9390 f1(5) = 1.000000E+30 : goto 9001
9400 f1(4) = 1.000000E+30 : f1(5) = 1.000000E+30 : goto 9001
9410 b4 = b2(i) : b5 = b3(i)
9420 if (b4 = q1) and (b5 = q2) then 9380
9430 f1(5) = d0+0.5+3*rnd(1)
9440 f1(4) = f1(5)-0.3*i5*log (rnd(1))
9450 if d4(9) > 0 then 9001
9455 print
9460 print "LT. UHURA- 'CAPTAIN, THE STARBASE IN";b4;"-";b5
9461 print " REPORTS THAT IT IS UNDER ATTACK AND CAN HOLD OUT"
9462 print " ON LY UNTIL STARDATE";fnr(f1(5));"'"
9465 if r6 = 0 then 9001
9466 print
9467 input "MR. SPOCK- 'CAPTAIN, SHALL WE CANCEL THE IDLE PERIOD";b$
9468 if left$(b$,1) = "Y" then r6 = 0
9469 goto 9001
9470 rem - STARBASE DESTROYED
9475 f1(5) = 1.000000E+30 : if (r2 = 0) or (r3 = 0) then 9001
9485 k = int(g(b4,b5)/100) : if g(b4,b5)-k*100 < 10 then 9001
9490 for i = 1 to r2 : if (c1(i) = b4) and (c2(i) = b5) then 9520
9510 next : goto 9001
9520 if s2(b4,b5) = -1 then s2(b4,b5) = 0
9530 if s2(b4,b5) > 999 then s2(b4,b5) = s2(b4,b5)-10
9540 if (b4 <> q1) or (b5 <> q2) then 9630
9550 for i = 1 to k3 : k = k4(i) : l = k5(i)
9560 if q$(k,l) = "C" then 9570
9565 next
9570 if k6(i) < 25+50*rnd(1) then 9001
9580 q$(b6,b7) = "." : b6 = 0 : b7 = 0
9590 gosub 17000
9600 print : print "MR. SPOCK- 'CAPTAIN, I BELIEVE THE STARBASE HAS";
9610 print " BEEN DESTROYED.'"
9620 goto 9680
9630 if (r3 = 1) or (d4(9) > 0) then 9680
9640 print
9650 print "LT. UHURA- 'CAPTAIN, STARFLEET COMMAND REPORTS THAT"
9660 print " THE STARBASE IN QUADRANT";b4;"-";b5;"HAS BEEN"
9670 print " DESTROYED BY A KLINGON COMMANDER.'"
9680 g(b4,b5) = g(b4,b5)-10
9690 if r3 <= 1 then 9730
9700 for i = 1 to r3 : if (b2(i) = b4) and (b3(i) = b5) then 9720
9710 next
9720 b2(i) = b2(r3) : b3(i) = b3(r3)
9730 r3 = r3-1
9740 goto 9001
10000 rem-FINISH
10001 a2 = 1 : print : print "IT IS STARDATE";fnr(d0) : print
10010 on f9 goto 10020,10130,10160,10185,10195,10205,10220,10235
10015 on f9-8 goto 10245,10270,10280
10020 rem-THE GAME HAS BEEN WON
10025 print "YOU HAVE DESTROYED THE KLINGON INVASION FLEET"
10027 print
10030 print "   ***THE FEDERATION IS SAVED***" : g1 = 1
10035 if (a1 = 0) or (b1 <> 0) then 10110
10040 if left$(s5$,1) <> "E" then 10110
10045 if 3*s1+35*n1+c4 >= 100 then 10110
10050 if d0-j2 <= 6 then 10070
10060 r8 = 0.1*s8*(s8+1)+0.1
10065 if (k1+k2)/(d0-j2) < r8 then 10110
10070 print
10075 print "IN FACT, YOU HAVE DONE SO WELL THAT STARFLEET COMMAND"
10076 if s8 = 4 then 10090
10080 print "PROMOTES YOU ON E STEP  IN RANK, ";
10085 if s8 = 1 then print "FROM BEGINNER TO NOVICE CLASS!"
10086 if s8 = 2 then print "FROM NOVICE TO SENIOR CLASS!"
10087 if s8 = 3 then print "FROM SENIOR TO EXPERT CLASS!"
10088 print "  ***CONGRATULATIONS***" : goto 10110
10090 print "PROMOTES YOU TO 'COMMODORE EMERITUS'."
10095 print
10100 print "NOW YOU CAN RETIRE AND WRITE YOUR OWN STAR TREK GAME!"
10110 gosub 23000
10120 return
10130 rem-FED RESOURCES DEPLETED
10135 print "YOUR TIME HAS RUN OUT, AND THE"
10136 print "FEDERATION HAS BEEN CONQUERED." : print
10137 print "YOUR STARSHIP IS NOW KLINGON PROPERY, AND YOU ARE PUT"
10138 print "ON TRIAL AS A WAR CRIMINAL. ON THE BASIS OF YOUR RECORD,"
10139 if r1*3 > i1 then 10150
10140 print "YOU ARE FOUND GUILTY AND SENTENCED TO DEATH!"
10145 a1 = 0 : gosub 23000 : return
10150 print "YOU ARE ACQUITTED" : gosub 23000 : return
10160 rem- L.S. FAILURE
10165 print "YOUR LIFE SUPPORT RESERVES HAVE RUN OUT, AND"
10170 print "YOU WILL SOON DIE OF ASPHYXIATION"
10172 print
10175 print "YOUR STARSHIP IS A DERELICT IN SPACE."
10180 goto 10300
10185 rem-ENERGY GONE
10190 print "YOUR ENERGY SUPPLY IS EXHAUSTED." : goto 10172
10195 rem-BATTLE DEFEAT
10200 print "THE ";s5$;" HAS BEEN DESTROYED IN BATTLE."
10201 goto 10300
10205 print "F9=6 INVALID" : return
10220 rem-NOVA
10225 print "YOUR STARSHIP HAS BEEN DESTROYED BY A NOVA."
10230 print "NICE SHOT, YOU HOCKEY PUCK!" : goto 10300
10235 rem-SUPERNOVA
10240 print "THE ";s5$;" HAS BEEN INCINERATED BY A SUPERNOVA."
10241 goto 10300
10245 rem-ABANDON(NO BASES)
10250 print "YOU HAVE BEEN CAPTURED BY THE KLINGONS.  IF YOU STILL"
10255 print "HAD A STARBASE TO BE RETURNED TO, YOU WOULD HAVE BEEN"
10260 print "REPATRIATED AND GIVEN ANOTHER CHANCE. SINCE YOU HAVE"
10265 print "NO STARBASES, YOU WILL BE MERCILESSLY TORTURED TO DEATH!"
10266 goto 10300
10270 rem - SELF-DESTRUCT
10271 print : print "THE ";s5$;" IS NOW AN EXPANDING CLOUD"
10272 print "OF SUB-ATOMIC PARTICLES..." : goto 10300
10280 rem-NOT REMATERIALIZED
10285 print "STARBASE WAS UNABLE TO RE-MATERIALIZE YOUR STARSHIP."
10300 print
10310 if left$(s5$,1) = "F" then s5$ = ""
10315 if left$(s5$,1) = "E" then s5$ = "FAERIE QUEENE"
10316 a1 = 0
10320 if r1 = 0 then 10355
10325 g3 = r4/i3 : b8 = (r1+2*r2)/(i1+2*i4)
10326 a3 = g3/b8
10327 if a3 < 1+0.5+rnd(1) then 10345
10330 print "AS A RESULT OF YOUR ACTIONS, A TREATY WITH THE KLINGON"
10331 print "EMPIRE HAS BEEN SIGNED. THE TERMS OF THE TREATY ARE"
10332 if a3 < 3*rnd(1) then 10340
10335 print "FAVORABLE TO THE FEDERATION." : print
10336 print "CONGRATULATIONS." : goto 10350
10340 print "HIGHLY UNFAVORABLE TO THE FEDERATION." : goto 10350
10345 print "THE FEDERATION WILL BE DESTROYED!"
10350 gosub 23000 : return
10355 print "SINCE YOU TOOK THE LAST KLINGON WITH YOU, YOU ARE"
10360 print "A MARTYR AND A HERO. SOMEDAY MAYBE THEY'LL ERECT"
10370 print "A STATUE IN YOUR MEMORY. REST IN PEACE AND TRY NOT"
10380 print "TO THINK ABOUT PIGEONS!" : g1 = 1 : a1 = 0
10390 gosub 23000 : return
11000 rem - HELP
11001 if c5$ <> "DOCKED" then 11020
11010 print "ENSIGN CHEKOV- 'BUT CAPTAIN, WE'RE AL READ Y DOCKED!'"
11015 return
11020 if d4(9) = 0 then 11030
11025 print "SUBSPACE RADIO DAMAGED...CANNOT TRANSMIT." : return
11030 if r3 <> 0 then 11050
11040 print "LT. UHURA- 'CAPTAIN, I'M NOT GETTING ANY RESPONSE";
11045 print " FROM STARBASE!'" : return
11050 n1 = n1+1 : if b6 = 0 then 11070
11060 goto 11130
11070 d1 = 1.000000E+30
11080 for l = 1 to r3 : x = 10*sqr ((b2(l)-q1)^2+(b3(l)-q2)^2)
11090 if x > d1 then 11110
11100 d1 = x : k = l
11110 next l
11120 q1 = b2(k) : q2 = b3(k) : gosub 18000
11130 q$(s6,s7) = "."
11135 print
11140 print "STARBASE IN QUADRANT";q1;"-";q2;"RESPONDS --";
11145 print " ";s5$;" DEMATERIALIZES."
11146 p2 = (1-0.98^d1)^0.333333
11150 for l = 1 to 3
11155 if l = 1 then print "1ST ";
11160 if l = 2 then print "2ND ";
11170 if l = 3 then print "3RD ";
11180 print "ATTEMPT TO RE-MATERIALIZE THE ";s5$;". . . . .";
11190 if rnd(1) > p2 then 11220
11200 print "FAILS." : next l
11210 f9 = 11 : gosub 10000 : return
11220 for l = 1 to 5 : i = b6+int(3*rnd(1))-1
11230 if (i < 1) or (i > 10) then 11260
11235 j = b7+int(3*rnd(1))-1
11240 if (j < 1) or (j > 10) then 11260
11250 if q$(i,j) = "." then 11270
11260 next l : print "FAILS." : goto 11210
11270 print "SUCCEEDS." : s6 = i : s7 = j : q$(i,j) = left$(s5$,1)
11280 gosub 7000 : print "LT. UHURA- 'CAPTAIN, WE MADE IT!'" : return
12000 rem-HITEM
12001 p4 = 2 : l5 = k3 : n = 1
12010 for k = 1 to l5
12020 if h3(k) = 0 then 12240
12030 d6 = 0.9+0.01*rnd(1) : h2 = h3(k)*d6^k7(n)
12040 p3 = k6(n)
12050 p = abs (p3) : if p4*h2 < p then p = p4*h2
12060 k6(n) = p3-sgn (p3)*abs (p)
12070 x8 = k4(n) : y8 = k5(n)
12080 if h2 > 4.99 then 12100
12090 print "VERY SMALL HIT ON " : goto 12110
12100 print fnr(h2);"UNIT HIT ON ";
12110 m$ = q$(x8,y8)
12120 if m$ = "K" then print "KLINGON AT";
12125 if m$ = "C" then print "COMMANDER AT";
12130 print x8;"-";y8
12140 if k6(n) <> 0 then 12180
12150 a5 = x8 : a6 = y8 : t2$ = q$(x8,y8) : gosub 6000
12160 if r1 <> 0 then 12250
12170 f9 = 1 : gosub 10000 : goto 12250
12180 if k6(n) < 0 then 12240
12190 if rnd(1) < 0.9 then 12240
12200 if k6(n) > (0.4+0.4*rnd(1))*p3 then 12240
12205 print
12210 print "***MR. SPOCK - 'CAPTAIN, THE VESSEL AT SECTOR";
12215 print x8;"-";y8
12220 print "  HAS JUST LOST ITS FIREPOWER.'"
12225 print
12230 k6(n) = -k6(n)
12240 n = n+1
12250 next k
12260 return
13000 rem - IMPULSE
13001 j3 = 0
13010 if d4(7) <> 0 then 13250
13020 if e1 <= 75 then 13070
13030 input "ENTER COURSE AND DISTANCE ";d2,d1
13040 if d2 < 0 then return
13050 p3 = 50+250*d1
13060 if p3 < e1 then 13140
13070 print
13080 print "1ST OFFICER SPOCK- 'CAPTAIN, THE IMPULSE ENGINES"
13090 print "REQUIRE 50 UNITS OF ENERGY TO ENGAGE, PLUS 250 UNITS"
13091 print "PER ";
13100 if e1 > 75 then 13120
13110 print "QUADRANT. THEY ARE, THEREFORE, USELESS NOW.'" : return
13120 print "QUADRANT. WE CAN GO, THEREFORE, A MAXIMUM OF ";
13130 print fnr(4.000000E-03*(e1-50)-0.05);"QUADRANTS.'" : return
13140 t1 = d1/0.4
13150 if t1 < r5 then 13200
13160 print "1ST OFFICER SPOCK- 'CAPTAIN, OUR SPEED UNDER IMPULSE"
13170 print "POWER IS ONLY 4 SECTORS PER STARDATE. ARE YOU SURE"
13180 input "WE DARE SPEND THE TIME' ";b$
13190 if left$(b$,1) <> "Y" then return
13200 gosub 15000 : j3 = 1
13210 if a2 <> 0 then return
13220 e1 = e1-p3
13230 if e1 > 0 then return
13240 f9 = 4 : gosub 10000 : return
13250 print "IMPULSE ENGINES DAMAGED." : return
14000 rem - LRSCAN
14001 n$ = "    # "
14005 print
14010 if d4(2) <> 0 then 14180
14020 print "L.R. SCAN FOR QUADRANT";q1;"-";q2 : print
14030 i = q1-1 : j = q1+1 : k = q2-1 : l = q2+1
14040 for m = i to j : for n = k to l
14050 if (m <= 0) or (m > 8) then 14110
14060 if (n <= 0) or (n > 8) then 14110
14070 if d4(11) = 0 then s2(m,n) = 1
14080 if g(m,n) >= 1000 then print " ***";
14090 if g(m,n) < 1000 then print space$(5-len (str$ (g(m,n))));g(m,n);
14100 goto 14120
14110 print n$;
14120 next n
14130 print
14140 next m
14150 if d4(11) = 0 then return
14155 print
14160 print "***WARNING*** - COMPUTER DISABLED - SCAN NOT RECORDED."
14170 return
14180 print "LONG RANGE SENSORS DAMAGED." : return
15000 rem - MOVE
15001 a5 = (15-d2)*0.523599
15010 d4 = -sin (a5) : d6 = cos (a5)
15020 b8 = abs (d4)
15030 if abs (d6) > b8 then b8 = abs (d6)
15040 d4 = d4/b8 : d6 = d6/b8 : t5 = 0 : t6 = 0
15050 if d0+t1 < f1(2) then 15080
15060 t5 = 1 : c5$ = "RED" : d1 = d1*(f1(2)-d0)/t1+0.1
15070 t1 = f1(2)-d0+1.000000E-05
15080 q$(s6,s7) = "." : x7 = s6 : y7 = s7 : h9 = int(10*d1*b8+0.5)
15090 if h9 = 0 then 15115
15100 for l = 1 to h9
15102 x7 = x7+d4 : x1 = int(x7+0.5) : y7 = y7+d6 : y1 = int(y7+0.5)
15105 if (x1 < 1) or (x1 > 10) then 15150
15106 if (y1 < 1) or (y1 > 10) then 15150
15108 if q$(x1,y1) = "O" then 15111
15109 if q$(x1,y1) <> "." then 15125
15110 next l
15111 d1 = 0.1*sqr ((s6-x1)^2+(s7-y1)^2)
15112 s6 = x1 : s7 = y1
15115 f4 = s6 : f5 = s7
15116 if q$(x1,y1) <> "O" then 15320
15120 t2 = fna(1) : t3 = fna(1)
15122 q1 = fna(1) : q2 = fna(1) : s6 = fnb(1) : s7 = fnb(1) : print
15123 print "*** SPACE PORTAL ENTERED ***" : goto 15307
15125 t6 = 1 : k = 50*d1/t1 : d1 = 0.1*sqr ((s6-x1)^2+(s7-y1)^2)
15127 if (q$(x1,y1) = "K") or (q$(x1,y1) = "C") then 15145
15129 print : print s5$;" BLOCKED BY ";
15130 if q$(x1,y1) = "*" then print "STAR AT";
15131 if q$(x1,y1) = "B" then print "STARBASE AT";
15132 print " SECTOR";x1;"-";y1;"...."
15133 print "EMERGENCY STOP REQUIRED";fnr(k);"UNITS OF ENERGY."
15135 e1 = e1-k
15137 s6 = int(x7-d4+0.5) : f4 = s6 : s7 = int(y7-d6+0.5) : f5 = s7
15140 if e1 > 0 then 15320
15141 f9 = 4 : gosub 10000 : return
15145 s6 = x1 : s7 = y1 : gosub 22000 : f4 = s6 : f5 = s7 : goto 15320
15150 if k3 = 0 then 15165
15155 for l = 1 to k3
15156 f3 = sqr ((x1-k4(l))^2+(y1-k5(l))^2)
15158 k8(l) = 0.5*(f3+k7(l)) : next l
15160 if g(q1,q2) <> 1000 then gosub 1000
15162 if a2 <> 0 then return
15165 x7 = 10*(q1-1)+s6 : y7 = 10*(q2-1)+s7
15170 x1 = int(x7+10*d1*b8*d4+0.5)
15175 y1 = int(y7+10*d1*b8*d6+0.5) : l6 = 0
15180 l5 = 0
15185 if x1 > 0 then 15195
15190 x1 = -x1+1 : l5 = 1
15195 if y1 > 0 then 15210
15200 y1 = -y1+1 : l5 = 1
15210 if x1 <= 80 then 15220
15215 x1 = 161-x1 : l5 = 1
15220 if y1 <= 80 then 15230
15225 y1 = 161-y1 : l5 = 1
15230 if l5 = 0 then 15240
15235 l6 = 1 : goto 15180
15240 if l6 = 0 then 15270
15260 print : print "*** MESSAGE FROM STARFLEET COMMAND.....STARDATE";
15261 print fnr(d0) : print : print "'PERMISSION TO CROSS GALACTIC ";
15262 print "PERIMETER IS HEREBY DENIED.'"
15263 print "    'SHUT DOWN ENGINES IMMMEDIATELY!'"
15264 print
15265 print "SCOTT HERE - 'ENGINES SHUT DOWN AT ";
15266 z1 = int((x1+9)/10) : z2 = int((y1+9)/10)
15267 print "QUADRANT";z1;"-";z2;", ";
15268 print "SECTOR";x1-10*(z1-1);"-";y1-10*(z2-1);"'"
15270 if t5 <> 0 then return
15295 q1 = int((x1+9)/10) : q2 = int((y1+9)/10)
15296 s6 = x1-10*(q1-1) : s7 = y1-10*(q2-1)
15307 gosub 18400
15310 print : print "ENTERING THE ";g2$;" QUADRANT (";q1;"-";q2;")"
15315 q$(s6,s7) = left$(s5$,1) : gosub 18000 : return
15320 q$(s6,s7) = left$(s5$,1)
15321 if l6 = 1 then return
15325 if k3 = 0 then 15390
15330 for l = 1 to k3
15340 f3 = sqr ((f4-k4(l))^2+(f5-k5(l))^2)
15350 k8(l) = 0.5*(k7(l)+f3)
15360 k7(l) = f3
15370 next l
15380 gosub 28000
15390 gosub 17000 : return
16000 rem-MOVECOM
16001 a = 1 : b = 1
16010 for k = 1 to k3
16020 c = k4(k) : d = k5(k)
16030 if q$(c,d) = "C" then 16050
16040 next k
16050 n = 0 : f = k6(k)+100*k3
16060 if f > 1000 then n = int(rnd(1)*k7(k)+1)
16065 if ((c5$ = "DOCKED") and ((b4 <> q1) or (b5 <> q2))) then n = -s8
16070 if n = 0 then n = int(((f+200*rnd(1))/150)-5)
16071 if n = 0 then return
16072 if (n > 0) and (k7(k) < 1.5) then return
16075 if abs (n) > s8 then n = sgn (n)*abs (s8)
16080 t = abs (n) : p = s6-c : q = s7-d
16085 if 2*abs (p) < abs (q) then p = 0
16090 if 2*abs (q) < abs (p) then q = 0
16095 if p <> 0 then p = sgn (p*n)
16100 if q <> 0 then q = sgn (q*n)
16105 r = c : s = d : q$(c,d) = "."
16110 for l2 = 1 to t : l = r+p : m = s+q
16115 if (l > 0) and (l <= 10) then 16120
16117 on sgn (n)+2 goto 16240,16165,16165
16120 if (m > 0) and (m <= 10) then 16130
16125 on sgn (n)+2 goto 16240,16135,16135
16130 if q$(l,m) = "." then 16195
16135 if (q = b) or (p = 0) then 16165
16140 m = s+b
16145 if (m > 0) and (m <= 10) then 16155
16150 on sgn (n)+2 goto 16240,16160,16160
16155 if q$(l,m) = "." then 16195
16160 b = -b
16165 if (p = a) or (q = 0) then 16200
16170 l = r+a
16175 if (l > 0) and (l <= 10) then 16185
16180 on sgn (n)+2 goto 16240,16190,16190
16185 if q$(l,m) = "." then 16195
16190 a = -a : goto 16200
16195 r = l : s = m
16200 next l2
16205 q$(r,s) = "C"
16210 if (r = c) and (s = d) then return
16215 k4(k) = r : k5(k) = s : k7(k) = sqr ((s6-r)^2+(s7-s)^2)
16220 k8(k) = k7(k) : if n > 0 then print "***COMMANDER ADVANCES TO ";
16225 if n < 0 then print "***COMMANDER RETREATS TO ";
16230 print " SECTOR";r;"-";s : gosub 28000 : return
16240 i = q1+int((l+9)/10)-1 : j = q2+int((m+9)/10)-1
16245 if (i < 1) or (i > 8) then 16350
16250 if (j < 1) or (j > 8) then 16350
16260 for l3 = 1 to r2
16265 if (c1(l3) = i) and (c2(l3) = j) then 16350
16270 next l3 : print "***COMMANDER ESCAPES TO ";
16275 print "QUADRANT";i;"-";j;" (AND REGAINS STRENGTH)"
16280 k4(k) = k4(k3) : k5(k) = k5(k3) : k7(k) = k7(k3) : k8(k) = k8(k3)
16285 k6(k) = k6(k3) : k3 = k3-1 : c3 = 0
16290 if c5$ <> "DOCKED" then gosub 17000
16300 gosub 28000
16310 g(q1,q2) = g(q1,q2)-100 : g(i,j) = g(i,j)+100
16320 for l3 = 1 to r2
16330 if (c1(l3) = q1) and (c2(l3) = q2) then 16340
16335 next l3
16340 c1(l3) = i : c2(l3) = j : return
16350 a = -a : b = -b : goto 16200
17000 rem - NEWCOND
17001 c5$ = "GREEN"
17010 if e1 < 1000 then c5$ = "YELLOW"
17020 if g(q1,q2) > 99 then c5$ = "RED"
17030 return
18000 rem- NEW QUAD
18001 j4 = 1 : b6 = 0 : b7 = 0 : k3 = 0 : c3 = 0
18010 u = g(q1,q2)
18020 if u > 999 then 18290
18030 k3 = int(0.01*u) : for a = 1 to 10 : for b = 1 to 10 : q$(a,b) = "." : next b : next a
18040 q$(s6,s7) = left$(s5$,1) : u = g(q1,q2) : if u < 100 then 18150
18050 u = u-100*k3 : for a = 1 to k3
18060 s = fnb(1) : k4(a) = s : t = fnb(1) : k5(a) = t
18070 if q$(s,t) <> "." then 18060
18080 q$(s,t) = "K" : k7(a) = sqr ((s6-s)^2+(s7-t)^2) : k8(a) = k7(a)
18090 k6(a) = rnd(1)*150+325 : next a
18100 if r2 = 0 then 18140
18110 for a = 1 to r2
18115 if (c1(a) = q1) and (c2(a) = q2) then 18130
18120 next a : goto 18140
18130 q$(s,t) = "C" : k6(k3) = 1000+400*rnd(1) : c3 = 1
18140 gosub 28000
18150 if u < 10 then 18190
18160 u = u-10
18170 b6 = fnb(1) : b7 = fnb(1) : if q$(b6,b7) <> "." then 18170
18180 q$(b6,b7) = "B"
18190 gosub 17000 : if u < 1 then return
18200 for a = 1 to u
18210 s = fnb(1) : t = fnb(1) : if q$(s,t) <> "." then 18210
18220 q$(s,t) = "*" : next a
18230 if (t2 <> q1) or (t3 <> q2) then return
18240 s = fnb(1) : t = fnb(1) : if q$(s,t) <> "." then 18240
18250 q$(s,t) = "O" : print
18260 print "MR. SPOCK - 'CAPTAIN, THE SHORT-RANGE SENSORS DETECT A"
18270 print "SPACE WARP SOMEWHERE IN THIS QUADRANT.'"
18280 return
18290 for a = 1 to 10 : for b = 1 to 10 : q$(a,b) = "." : next b : next a
18300 q$(s6,s7) = left$(s5$,1) : return
18400 g4$ = "III" : l = 2 : if q2 >= 5 then 18420
18410 l = 1
18420 g2$ = g1$(2*(q1-1)+l) : l = q2
18425 if l <= 4 then 18440
18430 l = q2-4
18440 g3$ = "IV" : if l = 4 then 18460
18450 g3$ = left$(g4$,l)
18460 g2$ = g2$+" "+g3$ : return
19000 rem - NOVA
19001 if rnd(1) > 0.1 then 19015
19010 gosub 27000 : return
19015 q$(a5,a6) = "." : print "***STAR AT SECTOR";a5;"-";a6;"NOVAS."
19020 g(q1,q2) = g(q1,q2)-1 : s1 = s1+1
19025 b9 = 1 : t6 = 1 : t7 = 1 : k = 0 : x1 = 0 : y1 = 0
19030 h4(b9,1) = a5 : h4(b9,2) = a6
19035 for m = b9to t6 : for q = 1 to 3 : for j = 1 to 3
19040 if j*q = 4 then 19260
19045 j5 = h4(m,1)+q-2 : j6 = h4(m,2)+j-2
19050 if (j5 < 1) or (j5 > 10) then 19260
19055 if (j6 < 1) or (j6 > 10) then 19260
19060 if q$(j5,j6) = "." then 19260
19065 if q$(j5,j6) = "O" then 19260
19070 if q$(j5,j6) <> "*" then 19105
19075 if rnd(1) >= 0.1 then 19085
19080 x2 = j5 : y2 = j6 : gosub 27000 : return
19085 t7 = t7+1 : h4(t7,1) = j5 : h4(t7,2) = j6 : g(q1,q2) = g(q1,q2)-1
19090 s1 = s1+1 : print "***STAR AT SECTOR";j5;"-";j6;"NOVAS."
19100 goto 19255
19105 if q$(j5,j6) <> "B" then 19140
19110 g(q1,q2) = g(q1,q2)-10 : for v = 1 to r3
19115 if (b2(v) <> q1) or (b3(v) <> q2) then 19125
19120 b2(v) = b2(r3) : b3(v) = b3(r3)
19125 next v : r3 = r3-1 : b6 = 0 : b7 = 0 : b1 = b1+1 : gosub 17000
19130 print "***STARBASE AT SECTOR";j5;"-";j6;"DESTROYED."
19135 goto 19255
19140 if (s6 <> j5) or (s7 <> j6) then 19190
19145 print "***STARSHIP BUFFETED BY NOVA." : if s4 <> 0 then 19155
19150 e1 = e1-1000 : goto 19170
19155 if s3 >= 1000 then 19180
19160 d6 = 1000-s3 : e1 = e1-d6 : gosub 17000 : s3 = 0 : s4 = 0
19165 print "***STARSHIP SHIELDS KNOCKED OUT." : d4(8) = 5.000000E-03*d5*rnd(1))*d6
19170 if e1 > 0 then 19185
19175 f9 = 7 : gosub 10000 : return
19180 s3 = s3-1000
19185 x1 = x1+s6-h4(m,1) : y1 = y1+s7-h4(m,2) : k = k+1 : goto 19260
19190 if q$(j5,j6) <> "C" then 19250
19195 for v = 1 to k3
19200 if (k4(v) = j5) and (k5(v) = j6) then 19210
19205 next v
19210 k6(v) = k6(v)-800 : if k6(v) <= 0 then 19250
19215 n5 = j5+j5-h4(m,1) : n6 = j6+j6-h4(m,2)
19220 print "***COMMANDER AT SECTOR";j5;"-";j6;"DAMAGED";
19225 if (n5 < 1) or (n5 > 10) or (n6 < 1) or (n6 > 10) then 19245
19230 print " AND BUFFETED TO SECTOR";n5;"-";n6
19235 q$(n5,n6) = "C" : k4(v) = n5 : k5(v) = n6
19240 k7(v) = sqr ((s6-n5)^2+(s7-n6)^2) : k8(v) = k7(v)
19241 q$(j5,j6) = "."
19245 print : goto 19260
19250 a5 = j5 : a6 = j6 : t2$ = q$(j5,j6) : gosub 6000 : goto 19260
19255 print : q$(j5,j6) = "."
19260 next j : next q : next m
19265 if t6 = t7 then 19280
19270 b9 = t6+1 : t6 = t7 : goto 19035
19280 if k = 0 then return
19290 d1 = k*0.1
19300 if x1 <> 0 then x1 = sgn (x1)
19310 if y1 <> 0 then y1 = sgn (y1)
19320 i = 3*(x1+1)+y1+2
19330 d2 = c5(i)
19340 if d2 = 0 then d1 = 0
19350 if d1 = 0 then return
19360 print : print " FOR CE OF NOVA DISPLACES STARSHIP."
19370 gosub 15000 : return
20000 rem-PHASERS
20001 p = 2 : j3 = 1
20020 if c5$ <> "DOCKED" then 20030
20025 print "PHASERS CAN'T BE FIRED THRU BASE SHIELDS." : goto 20080
20030 if d4(3) = 0 then 20050
20040 print "PHASER BANKS DAMAGED." : goto 20080
20050 if s4 = 0 then 20060
20055 print "SHIELDS MUST BE DOWN TO FIRE PHASERS." : goto 20080
20060 if k3 > 0 then 20090
20065 print
20070 print "MR. SPOCK - 'CAPTAIN, THE SHORT-RANGE SENSORS"
20075 print "  DETECT NO KLINGONS IN THIS QUADRANT.'"
20080 j3 = 0 : return
20090 print "PHASERS LOCKED ON TARGET. ENERGY AVAILABLE=";
20095 print 0.01*int(100*e1)
20100 input "UNITS TO FIRE ";p1 : if p1 < e1 then 20120
20110 print "ENERGY AVAILABLE ="; : goto 20095
20120 if p1 > 0 then 20140
20130 j3 = 0 : return
20140 e1 = e1-p1
20142 if d4(11) = 0 then 20147
20144 p1 = p1*(rnd(1)*0.5+0.5)
20145 print : print "COMPUTER MALFUNCTION HAMPERS PHASER ACCURACY." : print
20147 e = p1 : if k3 = 0 then 20310
20150 e = 0 : t5 = (k3*(k3+1))/2
20160 for i = 1 to k3 : h3(i) = ((k3+1-i)/t5)*p1
20170 h5(i) = abs (k6(i))/(p*0.9^k7(i))
20180 if h3(i) <= h5(i) then 20200
20190 e = e+(h3(i)-h5(i)) : h3(i) = h5(i)
20200 next i
20210 if e = 0 then 20280
20220 for i = 1 to k3 : r7 = h5(i)-h3(i)
20230 if r7 <= 0 then 20260
20240 if r7 >= e then 20270
20250 h3(i) = h5(i) : e = e-r7
20260 next i : goto 20280
20270 h3(i) = h3(i)+e : e = 0
20280 gosub 12000
20290 if (e <> 0) and (a2 = 0) then 20310
20300 j3 = 1 : return
20310 print fnr(e);"EXPENDED ON EMPTY SPACE." : j3 = 1 : return
21000 rem - PHOTO NS
21001 j3 = 1 : if d4(4) = 0 then 21015
21010 print "PHOTON TUBES DAMAGED." : goto 21035
21015 if t4 <> 0 then 21025
21020 print "NO TORPEDOS LEFT." : goto 21035
21025 input "TORPEDO COURSE ";c6
21030 if c6 >= 0 then 21040
21035 j3 = 0 : return
21040 input "BURST OF 3 ";b$ : n = 1
21045 if left$(b$,1) = "N" then 21066
21050 if left$(b$,1) <> "Y" then 21040
21051 if t4 > 2 then 21060
21055 print "NO BURST. ONLY";t4;"TORPEDOS LEFT." : goto 21035
21060 input "SPREAD ANGLE (3 - 30 DEG) ";g2
21061 if g2 < 0 then 21035
21062 if (g2 < 3) or (g2 > 30) then 21060
21063 g2 = fnd(g2)
21065 n = 3
21066 rem - CONTINUE
21070 for z6 = 1 to n
21075 if c5$ <> "DOCKED" then t4 = t4-1
21080 z7 = z6 : r = rnd(1)
21085 r = (r+rnd(1))*0.5-0.5
21090 if (r >= -0.4) and (r <= 0.4) then 21125
21095 r = (rnd(1)+1.2)*r : if n = 3 then 21105
21100 print "***TORPEDO MISFIRES..." : goto 21110
21105 print "***TORPEDO NUMBER";z6;"MISFIRES..."
21110 if rnd(1) > 0.2 then 21125
21115 print "***PHOTO N TUBES DAMAGED BY MISFIRE."
21120 d4(4) = d5*(1+2*rnd(1)) : goto 21440
21125 if (s4 <> 0) or (c5$ = "DOCKED") then r = r+1.000000E-03*s3*r
21130 a3 = c6+0.25*r : if n = 1 then 21140
21135 a8 = (15-a3+(2-z6)*g2)*0.523599 : print
21137 print "TRACK FOR TORPEDO NUMBER";z7;"--" : goto 21145
21140 print : print "TORPEDO TRACK --" : a8 = (15-a3)*0.523599
21145 x4 = -sin (a8) : y4 = cos (a8) : b8 = abs (x4)
21146 if abs (y4) > abs (x4) then b8 = abs (y4)
21150 x4 = x4/b8 : y4 = y4/b8 : x5 = s6 : y5 = s7
21155 for l9 = 1 to 15 : x5 = x5+x4 : a5 = int(x5+0.5)
21160 if (a5 < 1) or (a5 > 10) then 21430
21165 y5 = y5+y4 : a6 = int(y5+0.5)
21170 if (a6 < 1) or (a6 > 10) then 21430
21175 if (l9 = 5) or (l9 = 9) then print
21180 print fnr(x5);"-";fnr(y5);", ";
21185 if q$(a5,a6) <> "." then 21195
21190 goto 21425
21195 print : if q$(a5,a6) = "K" then 21220
21200 if q$(a5,a6) <> "C" then 21325
21205 if rnd(1) > 0.1 then 21220
21210 print "***COMMANDER AT SECTOR";a5;"-";a6;"USES ANTI-PHOTO N";
21215 print " DEVICE!" : print "  TORPEDO NEUTRALIZED." : goto 21435
21220 for v = 1 to k3
21225 if (a5 = k4(v)) and (a6 = k5(v)) then 21235
21230 next v
21235 k = k6(v) : w3 = 200+800*rnd(1)
21240 if abs (k) < w3 then w3 = abs (k)
21245 k6(v) = k-sgn (k)*abs (w3) : if k6(v) <> 0 then 21255
21250 t2$ = q$(a5,a6) : gosub 6000 : goto 21435
21255 if q$(a5,a6) = "K" then print "***KLINGON AT";
21260 if q$(a5,a6) = "C" then print "***COMMANDER AT";
21265 print a5;"-";a6;
21270 a7 = a8+2.5*(rnd(1)-0.5)
21275 w3 = abs (-sin (a7)) : if abs (cos (a7)) > w3 then w3 = abs (cos (a7))
21280 x7 = -sin (a7)/w3 : y7 = cos (a7)/w3
21285 p = int(a5+x7+0.5) : q = int(a6+y7+0.5)
21290 if (p < 1) or (p > 10) or (q < 1) or (q > 10) then 21320
21295 if q$(p,q) <> "." then 21320
21300 q$(p,q) = q$(a5,a6) : q$(a5,a6) = "." : print "DAMAGED--"
21305 print "  DISPLACED BY BLAST TO SECTOR";p;"-";q
21310 k4(v) = p : k5(v) = q : k7(v) = sqr ((s6-p)^2+(s7-q)^2)
21311 k8(v) = k7(v)
21315 gosub 28000 : goto 21435
21320 print "DAMAGED, BUT NOT DESTROYED." : goto 21435
21325 if q$(a5,a6) <> "B" then 21365
21330 print "***STARBASE DESTROYED...CONGRATULATIONS...YOU TURKEY!"
21335 if s2(q1,q2) < 0 then s2(q1,q2) = 0
21340 for w = 1 to r3
21345 if (b2(w) <> q1) or (b3(w) <> q2) then 21355
21350 b2(w) = b2(r3) : b3(w) = b3(r3)
21355 next w : q$(a5,a6) = "." : r3 = r3-1 : b6 = 0 : b7 = 0
21360 g(q1,q2) = g(q1,q2)-10 : b1 = b1+1 : gosub 17000 : goto 21435
21365 if q$(a5,a6) <> "*" then 21405
21370 if rnd(1) > 0.15 then 21385
21375 print "***STAR AT SECTOR";a5;"-";a6;"UNAFFECTED BY PHOTO N BLAST"
21380 goto 21435
21385 x2 = a5 : y2 = a6 : gosub 19000 : a5 = x2 : a6 = y2
21390 if g(q1,q2) = 1000 then return
21395 if a2 <> 0 then return
21400 goto 21435
21405 print : print "AAAAAIIIIIIIEEEEEEEAAAAAAAUUUUUUGGGGGGGHHHHHHHHHH!!!"
21410 print "  HACK!   HACK!  COUGH!   *CHOKE!*"
21415 print : print "MR. SPOCK- 'FASCINATING!'" : q$(a5,a6) = "."
21420 t2 = 0 : t3 = 0 : goto 21435
21425 next l9
21430 print : print "TORPEDO MISSED!"
21435 next z6
21440 if r1 <> 0 then return
21445 f9 = 1 : gosub 10000 : return
22000 rem - RAM
22001 print : print "*** RED ALERT!!  RED ALERT!! ***" : print
22010 print "*** COLLISION IMMINENT!!" : print
22020 print "*** ";s5$;" RAMS "; : w7 = 1 : if q$(s6,s7) = "C" then w7 = 2
22030 if w7 = 1 then print "KLINGON AT ";
22040 if w7 = 2 then print "COMMANDER AT ";
22050 print "SECTOR";s6;"-";s7 : a5 = s6 : a6 = s7 : t2$ = q$(s6,s7)
22060 gosub 6000 : print "***";s5$;" HEAVILY DAMAGED."
22070 k = int(5+rnd(1)*20) : print "***SICKBAY REPORTS";k;"CASUALTIES!"
22080 c4 = c4+k : for l = 1 to 12 : i = rnd(1)
22090 j = (3.5*w7*(rnd(1)+i)+1)*d5
22100 if l = 6 then j = j/3
22110 d4(l) = d4(l)+t1+j : next l : d4(6) = d4(6)-3
22120 if d4(6) < 0 then d4(6) = 0
22130 s4 = 0 : if r1 <> 0 then return
22140 f9 = 1 : gosub 10000 : return
23000 rem - SCORE
23001 p = d0-j2 : if (p <> 0) and (r1 = 0) then 23020
23010 if p < 5 then p = 5
23020 n = (k2+k1)/p : k = int(500*n+0.5) : l = 0
23030 if g1 <> 0 then l = 100*s8
23035 i = 0
23040 if left$(s5$,1) = "E" then m = 0
23045 if left$(s5$,1) = "F" then m = 1
23050 if left$(s5$,1) = "" then m = 2
23060 if a1 = 0 then i = 200
23070 j = 10*k1+50*k2+k+l-i-100*b1-100*m-35*n1-3*s1-c4
23080 print : if j <> 0 then 23100
23090 print "AS YET, YOU HAVE NO SCORE." : return
23100 print "YOUR SCORE --" : print : if k1 = 0 then 23120
23110 print k1;tab (5);"ORDINARY KLINGON(S) DESTROYED";tab (36);10*k1
23120 if k2 = 0 then 23140
23130 print k2;tab (5);"KLINGON COMMANDER(S) DESTROYED";tab (36);50*k2
23140 if k = 0 then 23160
23150 print fnr(n);tab (5);"KLINGONS PER STARDATE, AVERAGE";
23155 print tab (36);k
23160 if s1 = 0 then 23180
23170 print s1;tab (5);"STAR(S) DESTROYED";tab (36);-3*s1
23180 if b1 = 0 then 23200
23190 print b1;tab (5);"STARBASES DESTROYED";tab (36);-100*b1
23200 if n1 = 0 then 23220
23210 print n1;tab (5);"SOS CALL(S) TO A STARBASE";tab (36);-35*n1
23220 if c4 = 0 then 23240
23230 print c4;tab (5);"CASUALTIES INCURRED";tab (36);-c4
23240 if m = 0 then 23260
23250 print m;tab (5);"SHIP(S) LOST OR DESTROYED";tab (36)-100*m
23260 if a1 <> 0 then 23280
23270 print "PENALTY FOR GETTING YOURSELF KILLED";tab (36);-200
23280 if g1 = 0 then 23300
23290 print tab (5);"BONUS FOR WINNING ";s$(s8);" GAME";tab (36);l
23300 print tab (5);"-------------------------------------"
23310 print tab (28);"TOTAL";tab (36);j;"**" : return
24000 rem-SETUP
24001 a2 = 0 : g1 = 0 : gosub 4000 : s5$ = "ENTERPRISE"
24010 i7 = 5000 : e1 = i7 : i8 = 2500 : s3 = i8 : s4 = 0 : s9 = s4 : j1 = 4 : l1 = j1
24020 q1 = fna(1) : q2 = fna(1) : s6 = fnb(1) : s7 = fnb(1) : i9 = 10 : t4 = i9
24030 w1 = 5 : w2 = 25 : for i = 1 to 12 : d4(i) = 0 : next
24040 j2 = 100*int(31*rnd(1)+20) : d0 = j2 : k1 = 0 : k2 = 0 : n1 = 0 : n2 = 0 : r6 = 0 : c4 = 0
24050 a1 = 1 : d3 = 0.25 : for i = 1 to 8 : for j = 1 to 8 : s2(i,j) = 0 : next j : next i
24060 f1(1) = d0-0.5*i5*log (rnd(1)) : f1(5) = 1.000000E+30
24070 f1(2) = d0-1.5*(i5/r2)*log (rnd(1)) : i6 = 0
24080 f1(3) = d0-0.3*i5*log (rnd(1)) : f1(4) = d0-0.3*i5*log (rnd(1))
24090 for i = 1 to 8 : for j = 1 to 8 : k = int(rnd(1)*9+1) : i6 = i6+k
24100 g(i,j) = k : next j : next i : s1 = 0
24110 for i = 1 to i2
24120 x = int(rnd(1)*6+2) : y = int(rnd(1)*6+2)
24130 if g(x,y) >= 10 then 24120
24140 if i < 2 then 24180
24150 k = i-1 : for j = 1 to k : d1 = sqr ((b2(j)-x)^2+(b3(j)-y)^2)
24160 if d1 < 2 then 24120
24170 next j
24180 b2(i) = x : b3(i) = y : s2(x,y) = -1 : g(x,y) = g(x,y)+10 : next i
24190 b1 = 0 : k = i1-i4 : l = int(0.25*s8*(9-l2)+1)
24200 m = int((1-rnd(1)^2)*l) : if m > k then m = k
24210 n = 100*m
24220 x = fna(1) : y = fna(1) : if g(x,y)+n > 999 then 24220
24230 g(x,y) = g(x,y)+n : k = k-m : if k <> 0 then 24200
24240 for i = 1 to i4
24250 x = fna(1) : y = fna(1) : if (g(x,y) < 99) and (rnd(1) < 0.75) then 24250
24260 if g(x,y) > 899 then 24250
24270 if i = 1 then 24300
24280 m = i-1 : for j = 1 to m : if (c1(j) = x) and (c2(j) = y) then 24250
24290 next j
24300 g(x,y) = g(x,y)+100 : c1(i) = x : c2(i) = y : next i
24305 i = int(d0) : print : s0 = 0
24310 t2 = fna(1) : t3 = fna(1) : if g(t2,t3) < 100 then 24310
24320 if s8 <> 1 then 24440
24330 print "IT IS STARDATE";i;"...THE ORGANIAN PEACE TREATY BETWEEN"
24340 print "THE UNITED FEDERATION OF PLANETS AND THE KLINGON EMPIRE"
24350 print "HAS COLLAPSED AND THE FEDERATION IS BEING ATTACKED BY A"
24360 print "DEADLY KLINGON INVASION FLEET. AS CAPTAIN OF THE STARSHIP"
24370 print "U.S.S. ENTERPRISE, IT IS YOUR MISSION TO SEEK OUT AND"
24380 print "DESTROY THIS INVASION FORCE OF";i1;"BATTLE CRUISERS."
24390 print : print "YOU HAVE AN INITIAL ALLOTMENT OF";int(i5);
24400 print "STARDATES" : print "TO COMPLETE YOUR MISSION."
24410 print "AS THE MISSION PROCEEDS, YOU MAY BE GIVEN MORE TIME."
24420 print : print "YOU WILL HAVE";i2;"SUPPORTING STARBASE(S)." : print
24430 goto 24515
24440 print "STARDATE..............";i
24450 print "NUMBER OF KLINGONS....";i1
24460 print "NUMBER OF STARDATES...";int(i5)
24470 print "NUMBER OF STARBASES...";i2
24480 print "STARBASE LOCATIONS....";
24490 for i = 1 to i2 : print b2(i);"-";b3(i);
24500 if i <> i2 then print ", ";
24510 next i : print : print
24515 gosub 18400
24520 print "THE ";s5$;" IS CURRENTLY IN THE ";g2$;" QUADRANT."
24530 gosub 18000 : return
25000 rem - SETWARP
25010 input "WARP FACTOR ";k
25020 print
25025 if k < 1 then 25140
25026 if k > 10 then 25150
25030 j = w1 : w1 = k : w2 = w1*w1
25040 if (w1 <= j) or (w1 <= 6) then 25070
25050 if w1 <= 8 then 25080
25060 if w1 > 8 then 25100
25070 print "ENSIGN CHEKOV - 'WARP FACTOR";w1;"CAPTAIN'" : return
25080 print "ENGINEER SCOTT - 'AYE, BUT OUR MAXIMUM SAFE SPEED";
25090 print " IS WARP 6.'" : return
25100 if w1 = 10 then 25130
25110 print "ENGINEER SCOTT-'AYE, CAPTAIN, BUT OUR ENGINES MAY NOT ";
25120 print "TAKE IT.'" : return
25130 print "ENGINEER SCOTT-'AYE, CAPTAIN, WE'LL GIVE IT A TRY.'": return
25140 print "ENSIGN CHEKOV-'WE CAN'T GO BELOW WARP 1, CAPTAIN.'" : return
25150 print "ENSIGN CHEKOV-'OUR TO P SPEED IS WARP 10, CAPTAIN.'"
25160 return
26000 rem - SHIELDS
26001 j3 = 0 : if d4(8) <> 0 then 26600
26010 if s4 <> 0 then 26530
26500 input "SHIELDS ARE DOWN. DO YOU WANT THEM UP";b$
26510 if left$(b$,1) = "Y" then 26560
26520 return
26530 input "SHIELDS ARE UP. DO YOU WANT THEM DOWN";b$
26540 if left$(b$,1) = "Y" then 26590
26550 return
26560 s4 = 1 : s9 = 1 : if c5$ <> "DOCKED" then e1 = e1-50
26570 print "SHIELDS RAISED." : if e1 <= 0 then 26610
26580 j3 = 1 : return
26590 s4 = 0 : s9 = 1 : print "SHIELDS LOWERED." : j3 = 1 : return
26600 print "SHIELDS DAMAGED AND DOWN." : return
26610 print : print "SHIELDS USE UP LAST OF THE ENERGY."
26620 f9 = 4 : gosub 10000 : return
27000 rem - SUPERNOVA
27001 if x2 <> 0 then 27100
27010 n = int(rnd(1)*i6+1) : for x = 1 to 8 : for y = 1 to 8
27020 n = n-(g(x,y)-int(g(x,y)/10)*10) : if n <= 0 then 27040
27030 next y : next x : return
27040 if (x <> q1) or (y <> q2) then 27150
27050 if j4 <> 0 then 27150
27060 n = int(rnd(1)*(g(x,y)-int(g(x,y)/10)*10))+1
27070 for x3 = 1 to 10 : for y3 = 1 to 10 : if q$(x3,y3) <> "*" then 27090
27080 n = n-1 : if n = 0 then 27100
27090 next y3 : next x3
27100 print : print "*** RED ALERT!! RED ALERT!! ***"
27105 x3 = x2 : y3 = y2
27110 print "*** INCIPIENT SUPERNOVA DETECTED AT SECTOR";x3;"-";y3
27120 x = q1 : y = q2 : k = (x2-s6)^2+(y2-s7)^2
27130 if k > 1.5 then 27180
27140 print "*** EMERGENCY AUTO -OVERRIDE JAMMED ***" : a2 = 1 : goto 27180
27150 if d4(9) <> 0 then 27180
27160 print : print "MESSAGE FROM STARFLEET COMMAND...STARDATE";int(d0)
27170 print "'SUPERNOVA IN QUADRANT";x;"-";y;
27175 print "....CAUTION ADVISED'"
27180 n = g(x,y) : r = int(n/100) : q = 0
27190 if (x <> q1) or (y <> q2) then 27210
27200 k3 = 0 : c3 = 0
27210 if r = 0 then 27270
27220 r1 = r1-r : if r2 = 0 then 27270
27230 for l = 1 to r2 : if (c1(l) <> x) or (c2(l) <> y) then 27260
27240 c1(l) = c1(r2) : c2(l) = c2(r2) : c1(r2) = 0 : c2(r2) = 0
27250 r2 = r2-1 : r = r-1 : q = 1 : if r2 = 0 then f1(2) = 1.000000E+30
27260 next l
27270 if r3 = 0 then 27310
27280 for l = 1 to r3 : if (b2(l) <> x) or (b3(l) <> y) then 27300
27290 b2(l) = b2(r3) : b3(l) = b3(r3) : b2(r3) = 0 : b3(r3) = 0 : r3 = r3-1
27300 next l
27310 if x2 = 0 then 27350
27320 n = g(x,y)-int(g(x,y)/100)*100
27330 s1 = s1+(n-int(n/10)*10) : b1 = b1+int(n/10)
27340 k1 = k1+r : k2 = k2+q
27350 if (s2(x,y) <> 0) and (d4(9) <> 0) then s2(x,y) = 1000+g(x,y)
27360 if (d4(9) = 0) or ((q1 = x) and (q2 = y)) then s2(x,y) = 1
27370 g(x,y) = 1000
27380 if (r1 <> 0) or ((x = q1) and (y = q2)) then 27430
27390 print : print "MR. SPOCK- 'CAPTAIN, A SUPERNOVA IN QUADRANT";
27400 print x;"-";y;"HAS JUST DESTROYED THE LAST OF THE KLINGONS.'"
27420 f9 = 1 : gosub 10000 : return
27430 if a2 = 0 then return
27440 f9 = 8 : gosub 10000 : return
28000 rem - SORTKL
28001 if k3 <= 1 then return
28005 z4 = 0
28010 for o = 1 to k3-1 : if k7(o) <= k7(o+1) then 28080
28020 k = k7(o) : k7(o) = k7(o+1) : k7(o+1) = k
28030 k = k8(o) : k8(o) = k8(o+1) : k8(o+1) = k
28040 k = k4(o) : k4(o) = k4(o+1) : k4(o+1) = k
28050 k = k5(o) : k5(o) = k5(o+1) : k5(o+1) = k
28060 k = k6(o) : k6(o) = k6(o+1) : k6(o+1) = k
28070 z4 = 1
28080 next o
28090 if z4 <> 0 then 28005
28100 return
29000 rem-SRSCAN
29001 if d4(1) <> 0 then 29230 : rem damage ? rhn
29010 print : print "  1 2 3 4 5 6 7 8 9 10"
29020 for i = 1 to 10 : if i < 10 then print " ";
29030 print i; : for j = 1 to 10 : print q$(i,j);" "; : next j
29040 on i goto 29050,29060,29080,29090,29140
29045 on i-5 goto 29150,29160,29170,29200,29210
29050 print " STARDATE   ";fnr(d0) : goto 29220
29060 if c5$ <> "DOCKED" then gosub 17000
29070 print " CONDITION   ";c5$ : goto 29220
29080 print " POSITION   ";q1;"-";q2;", ";s6;"-";s7 : goto 29220
29090 print " LIFE SUPPORT  "; : if d4(5) <> 0 then 29110
29100 print "ACTIVE" : goto 29220
29110 if c5$ <> "DOCKED" then 29130
29120 print "DAMAGED, SUPPORTED BY STARBASE" : goto 29220
29130 print "DAMAGED, RESERVES=";fns(l1) : goto 29220
29140 print " WARP FACTOR  ";fnr(w1) : goto 29220
29150 print " ENERGY";space$(8);0.01*int(100*e1) : goto 29220
29160 print " TORPEDOS   ";t4 : goto 29220
29170 print " SHIELDS    "; : b$ = "DOWN," : if s4 <> 0 then b$ = "UP,"
29180 if d4(8) > 0 then b$ = "DAMAGED,"
29190 print b$;int(100*s3/i8+0.5);"%" : goto 29220
29200 print " KLINGONS LEFT ";r1 : goto 29220
29210 print " TIME LEFT   ";fns(r5)
29220 next i : return
29230 print "SHORT RANGE SENSORS DAMAGED." : return
30000 rem - TIMEWARP
30001 print : print "*** TIME WARP ENTERED ***" : print "YOU ARE TRAVELING"
30002 ";"
30010 if s0 <> 0 then 30050
30020 t1 = -0.5*i5*log (rnd(1))
30030 print " FOR WARD IN TIME";fnr(t1);"STARDATES."
30040 f1(2) = f1(2)+t1 : goto 30200
30050 m = d0 : d0 = d9(1)
30060 print "BACKWARD IN TIME";fnr(m-d0);"STARDATES." : s0 = 0
30070 r1 = d9(2) : r2 = d9(3) : r3 = d9(4) : r4 = d9(5) : r5 = d9(6)
30080 s1 = d9(7) : b1 = d9(8) : k1 = d9(9) : k2 = d9(10)
30090 for i = 1 to 8 : for j = 1 to 8 : g(i,j) = d9(i-1+8*(j-1)+11) : next j : next i
30100 for i = 75 to 84 : c1(i-74) = d9(i) : next
30110 for i = 85 to 94 : c2(i-84) = d9(i) : next
30120 for i = 95 to 99 : b2(i-94) = d9(i) : next
30130 for i = 100 to 104 : b3(i-99) = d9(i) : next : b4 = d9(105) : b5 = d9(106)
30140 f1(1) = d0-0.5*i5*log (rnd(1))
30150 if r2 <> 0 then f1(2) = d0-(i5/r2)*log (rnd(1))
30160 f1(3) = d0-0.5*i5*log (rnd(1))
30170 for i = 1 to 8 : for j = 1 to 8 : if 1 < s2(i,j) then s2(i,j) = 1
30180 next j : next i
30185 print
30190 print "SPOCK HAS RECONSTRUCTED A CORRECT STAR CHART FROM MEMORY."
30200 gosub 18000 : return
31000 rem - TRANSFER
31001 j3 = 0
31010 if d4(12) <> 0 then 31120
31020 input "NUMBER OF UNITS TO SHIELDS ";z3
31030 if z3 < 0 then return
31040 if e1+s3-z3 > 0 then 31060
31050 print "SCOTT HERE- 'WE ON LY HAVE";fnr(e1+s3);"UNITS LEFT.'"
31051 return
31060 e1 = e1+s3-z3 : s3 = z3 : print "--ENERGY TRANSFER COMPLETE--"
31070 print "(SHIP ENERGY=";fnr(e1);"  SHIELD ENERGY=";fnr(s3);")"
31075 j3 = 1
31080 t1 = 0.1 : p5 = (k3+4*c3)/48 : if p5 < 0.1 then p5 = 0.1
31090 if p5 > rnd(1) then gosub 1000
31100 if a2 <> 0 then return
31110 gosub 9000 : return
31120 print "TRANSFER PANEL DAMAGED." : return
32000 rem - VISUAL
32001 input "WHICH DIRECTION ";z
32005 print
32010 j3 = 0 : if z < 0 then return
32012 if z <= 12 then 32020
32014 print "DIRECTIONS ARE FROM 0 TO 12 ONLY" : goto 32001
32020 t1 = 0.05 : p = (k3+4*c3)/48 : if p < 0.05 then p = 0.05
32030 if p > rnd(1) then gosub 1000
32040 if a2 <> 0 then return
32050 gosub 9000 : j3 = 1 : if a2 <> 0 then return
32080 d5 = int((z/12)*8+1.5) : if d5 > 8 then d5 = 1
32085 for i = 1 to 5 : for j = 1 to 5 : v$(i,j) = " " : next j : next i : n = 0
32087 v$(3,3) = left$(s5$,1)
32090 on d5 goto 32100,32130,32150,32170,32190,32220,32260,32300
32100 i = s6-2 : j = s7-2 : v$(1,1) = q$ : if (j > 0) and (i > 0) then v$(1,1) = q$(i,j)
32110 i = s6-1 : j = s7-1 : v$(2,2) = q$ : if (i > 0) and (j > 0) then v$(2,2) = q$(i,j)
32120 n = n+1 : if n = 3 then 32350
32125 i = s6-2 : v$(1,2) = q$ : if (i > 0) and (j > 0) then v$(1,2) = q$(i,j)
32130 i = s6-2 : v$(1,3) = q$ : if i > 0 then v$(1,3) = q$(i,s7)
32135 i = s6-1 : v$(2,3) = q$ : if i > 0 then v$(2,3) = q$(i,s7)
32140 n = n+1 : if n = 3 then 32350
32145 i = s6-2 : j = s7+1 : v$(1,4) = q$ : if (i > 0) and (j < 11) then v$(1,4) = q$(i,j)
32150 i = s6-2 : j = s7+2 : v$(1,5) = q$ : if (i > 0) and (j < 11) then v$(1,5) = q$(i,j)
32155 i = s6-1 : j = s7+1 : v$(2,4) = q$ : if (i > 0) and (j < 11) then v$(2,4) = q$(i,j)
32160 n = n+1 : if n = 3 then 32350
32165 j = s7+2 : v$(2,5) = q$ : if (i > 0) and (j < 11) then v$(2,5) = q$(i,j)
32170 j = s7+2 : v$(3,5) = q$ : if j < 11 then v$(3,5) = q$(s6,j)
32175 j = s7+1 : v$(3,4) = q$ : if j < 11 then v$(3,4) = q$(s6,j)
32180 n = n+1 : if n = 3 then 32350
32185 i = s6+1 : j = s7+2 : v$(4,5) = q$ : if (i < 11) and (j < 11) then v$(4,5) = q$(i,j)
32190 i = s6+2 : j = s7+2 : v$(5,5) = q$ : if (i < 11) and (j < 11) then v$(5,5) = q$(i,j)
32195 i = s6+1 : j = s7+1 : v$(4,4) = q$ : if (i < 11) and (j < 11) then v$(4,4) = q$(i,j)
32200 n = n+1 : if n = 3 then 32350
32210 i = s6+2 : v$(5,4) = q$ : if (i < 11) and (j < 11) then v$(5,4) = q$(i,j)
32220 i = s6+2 : v$(5,3) = q$ : if i < 11 then v$(5,3) = q$(i,s7)
32230 i = s6+1 : v$(4,3) = q$ : if i < 11 then v$(4,3) = q$(i,s7)
32240 n = n+1 : if n = 3 then 32350
32250 i = s6+2 : j = s7-1 : v$(5,2) = q$ : if (i < 11) and (j > 0) then v$(5,2) = q$(i,j)
32260 i = s6+2 : j = s7-2 : v$(5,1) = q$ : if (i < 11) and (j > 0) then v$(5,1) = q$(i,j)
32270 i = s6+1 : j = s7-1 : v$(4,2) = q$ : if (i < 11) and (j > 0) then v$(4,2) = q$(i,j)
32280 n = n+1 : if n = 3 then 32350
32290 j = s7-2 : v$(4,1) = q$ : if (i < 11) and (j > 0) then v$(4,1) = q$(i,j)
32300 j = s7-2 : v$(3,1) = q$ : if j > 0 then v$(3,1) = q$(s6,j)
32310 j = s7-1 : v$(3,2) = q$ : if j > 0 then v$(3,2) = q$(s6,j)
32320 n = n+1 : if n = 3 then 32350
32330 i = s6-1 : j = s7-2 : v$(2,1) = q$ : if (i > 0) and (j > 0) then v$(2,1) = q$(i,j)
32340 goto 32100
32350 for i = 1 to 5
32360 if (v$(i,1) = " ") and (v$(i,3) = " ") and (v$(i,5) = " ") then 32390
32370 print " ";
32380 for j = 1 to 5 : print v$(i,j);" "; : next j : print
32390 next i : return
33000 rem - WAIT
33001 j3 = 0 : input "HOW MANY STARDATES";z5
33010 if (z5 < r5) and (k3 = 0) then 33030
33020 input "ARE YOU SURE? ";b$ : if left$(b$,1) <> "Y" then return
33030 r6 = 1
33040 if z5 <= 0 then r6 = 0
33050 if r6 = 0 then return
33060 t1 = z5 : z6 = z5
33070 if k3 = 0 then 33100
33080 t1 = 1+rnd(1) : if z5 < t1 then t1 = z5
33090 z6 = t1
33100 if t1 < z5 then gosub 1000
33110 if a2 <> 0 then return
33120 gosub 9000 : j3 = 1 : if a2 <> 0 then return
33130 z5 = z5-z6 : goto 33040
34000 rem:WARP
34001 j3 = 0 : if d4(6) <> 0 then 34750
34010 input "ENTER COURSE AND DISTANCE ";d2,d1
34020 if d2 < 0 then return
34030 p = (d1+0.05)*w1*w1*w1*(s4+1) : if p < e1 then 34150
34040 j3 = 0 : print : print "ENGINEERING TO BRIDGE--"
34050 if (s4 = 0) or (0.5*p > e1) then 34080
34060 print " WE HAVEN'T THE ENERGY TO GO THAT FAR WITH";
34070 print " THE SHIELDS UP." : return
34080 w = int((e1/(d1+0.05))^0.333333) : if w <= 0 then 34130
34090 print " WE HAVEN'T THE ENERGY. BUT WE COULD DO IT AT WARP";w
34100 if s4 <> 0 then 34120
34110 return
34120 print "  IF YOU'LL LOWER THE SHIELDS." : return
34130 print " WE CAN'T DO IT, CAPTAIN. WE HAVEN'T GOT THE ENERGY."
34140 return
34150 t1 = 10*d1/w2 : if t1 < 0.8*r5 then 34500
34160 print : print "MR. SPOCK - 'CAPTAIN, I COMPUTE THAT SUCH A TRIP"
34170 print " WILL REQUIRE APPROXIMATELY";fnr(100*t1/r5);
34180 print "PERCENT" : print "  OF OUR REMAINING TIME. ARE YOU SURE ";
34190 input "THIS IS WISE";b$ : if left$(b$,1) = "Y" then 34500
34200 j3 = 0 : return
34500 q4 = 0 : w = 0 : if w1 <= 6 then 34660
34510 p = d1*(6-w1)^2/66.66666 : if p > rnd(1) then q4 = 1
34520 if q4 <> 0 then d1 = rnd(1)*d1
34530 w = 0 : if w1 < 10 then 34550
34540 if 0.25*d1 > rnd(1) then w = 1
34550 if (q4 = 0) and (w = 0) then 34660
34560 a = (15-d2)*0.5236 : x1 = -sin (a) : x2 = cos (a)
34570 b8 = abs (x1) : if abs (x2) > abs (x1) then b8 = abs (x2)
34580 x1 = x1/b8 : y1 = y1/b8 : n = int(10*d1*b8+0.5) : x = s6 : y = s7
34590 if n = 0 then 34660
34600 for l = 1 to n
34610 x = x+x1 : q = int(x+0.5) : if (q < 1) or (q > 10) then 34660
34620 y = y+y1 : r = int(y+0.5) : if (r < 1) or (r > 10) then 34660
34630 if q$(q,r) = "." then 34650
34640 q4 = 0 : w = 0
34650 next l
34660 gosub 15000 : if a2 <> 0 then return
34670 e1 = e1-d1*w1*w1*w1*(s4+1) : if e1 > 0 then 34690
34680 f9 = 4 : gosub 10000 : return
34690 t1 = 10*d1/w2 : if w <> 0 then gosub 30000
34700 if q4 = 0 then 34740
34710 print : print "ENGINEERING TO BRIDGE--" : print "  SCOTT HERE- ";
34715 print "'WE'VE JUST BLOWN THE WARP ENGINES."
34720 print "  WE'LL HAVE TO SHUT 'ER DOWN HERE, CAPTAIN.'"
34725 d4(6) = d5*(3*rnd(1)+1)
34740 j3 = 1 : return
34750 print "WARP ENGINES DAMAGED." : return
35000 rem - ABANDON
35001 on sgn (d4(10))+2 goto 35010,35030,35020
35010 print "YE FAERIE QUEENE HAS NO SHUTTLE CRAFT." : return
35020 print "SHUTTLE CRAFT DAMAGED." : return
35030 print : print "***ABANDON SHIP! ABANDON SHIP!"
35040 print "***ALL HANDS ABANDON SHIP!" : print
35050 print "YOU AND THE BRIDGE CREW ESCAPE IN THE GALILEO."
35060 print "THE REMAINDER OF THE CREW BEAMS DOWN"
35070 print "TO THE NEAREST HABITABLE PLANET." : if r3 <> 0 then 35090
35080 f9 = 9 : gosub 10000 : return
35090 print : print "YOU ARE CAPTURED BY KLINGONS AND RELEASED TO "
35100 print "THE FEDERATION IN A PRISONER-OF-WAR EXCHANGE."
35110 print "STARFLEET PUTS YOU IN COMMAND OF ANOTHER SHIP,"
35120 print "THE FAERIE QUEENE WHICH IS ANTIQUATED, BUT"
35130 print "STILL USABLE." : n = int(rnd(1)*r3+1) : q1 = b2(n) : q2 = b3(n)
35140 s6 = 5 : s7 = 5 : gosub 18000 : q$(s6,s7) = "."
35145 for l = 1 to 3 : s6 = int(3*rnd(1)-1+b6)
35150 if (s6 < 1) or (s7 > 10) then 35180
35160 s7 = int(3*rnd(1)-1+b7) : if (s7 < 1) or (s7 > 10) then 35180
35170 if q$(s6,s7) = "." then 35190
35180 next l : goto 35140
35190 s5$ = "FAERIE QUEENE" : q$(s6,s7) = left$(s5$,1) : c5$ = "DOCKED"
35200 for l = 1 to 12 : d4(l) = 0 : next : d4(10) = -1 : e1 = 3000 : i7 = e1
35210 s3 = 1500 : i8 = s3 : t4 = 6 : i9 = t4 : l1 = 3 : j1 = l1 : s4 = 0 : w1 = 5 : w2 = 25
35220 return
36000 rem - DESTRUCT
36001 if d4(11) = 0 then 36030
36010 print "COMPUTER DAMAGED - CANNOT EXECUTE DESTRUCT SEQUENCE"
36020 return
36030 print : print "  ---WORKING---"
36040 print "IDENT IF ICATION-POSITIVE"
36050 print "SELF-DESTRUCT-SEQUENCE-ACTIVATED" : j = 3
36060 for i = 10 to 6 step -1 : print space$(j);i : gosub 36210 : j = j+3 : next
36070 print "ENTER-YOUR-MISSION-PASSWORD-TO -CONTINUE"
36080 print "SELF-DESTRUCT-SEQUENCE-OTHERWISE-DESTRUCT"
36090 print "SEQUENCE-WILL-BE-ABORTED"
36100 input b$ : if b$ <> x$ then 36190
36110 print "PASSWORD-ACCEPTED" : j = 10
36120 for i = 5 to 1 step -1 : print space$(j);i : gosub 36210 : j = j+3 : next
36130 print : print "*****ENTROPY OF ";s5$;" MAXIMIZED*****"
36140 print : if k3 = 0 then 36180
36150 w = 20*e1 : for l = 1 to k3 : if k6(l)*k7(l) > w then 36170
36160 a5 = k4(l) : a6 = k5(l) : t2$ = q$(a5,a6) : gosub 6000
36170 next l
36180 f9 = 10 : gosub 10000 : return
36190 print "PASSWORD-REJECTED"
36200 print "CONTINUITY-EFFECTED" : print : return
36210 k = 12345 : for m = 1 to 90 : k = k+1 : next m : return
37000 rem - STATUS
37001 for i = 1 to 10 : goto 29040 : return
37010 rem : end
40000 rem rhn fixup
40010 rem dim spc$(40)
40020 rem for j = 1 to 40 : spc$(j) = ""
40030 rem for i = 1 to j : spc$(j) = spc$(j)+" " : next i : next j
40900 rem return
