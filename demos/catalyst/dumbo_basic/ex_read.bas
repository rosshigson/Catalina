5 PRINT
10 PRINT "CITY", "STATE", "ZIP"
20 READ C$, S$, Z
30 DATA "DENVER,", "COLORADO", 80211
40 DATA "Sydney,", "NSW", 2106
50 PRINT C$, S$, Z
60 READ C$, S$, Z
70 PRINT C$, S$, Z
80 restore 40
90 READ C$, S$, Z
100 PRINT C$, S$, Z
110 END