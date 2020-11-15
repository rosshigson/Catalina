10 C$ = "h ello"
15 D$ = MID$(C$, 2, LEN(C$) - 1) : rem ONLY 1 SPACE
16 print D$
20 if MID$(C$, 2, 1) = " " then C$ = MID$(C$, 2, LEN(C$) - 1) : rem ONLY 1 SPACE
30 print c$
40 end
