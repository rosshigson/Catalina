awka -i catapult_functions.h -f %1.awk>%1.c

IF EXIST %1.exe DEL %1.exe
gcc -I. -c catapult_functions.c
gcc -I. -O2 -s -o %1.exe %1.c catapult_functions.o libawka.a
IF EXIST %1.c DEL %1.c
