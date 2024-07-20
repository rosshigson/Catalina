@ECHO OFF

..\catalina\awka -i cat_functions.h -f %1.awk>%1.c

IF EXIST %1.exe DEL %1.exe
gcc -I. -I ..\catalina\ -c cat_functions.c
gcc -I. -I ..\catalina -O2 -s -o %1.exe %1.c cat_functions.o ..\catalina\libawka.a

IF EXIST %1.c DEL %1.c
