..\catalina\awka -f %1.awk>%1.c

IF EXIST %1.exe DEL %1.exe
gcc -I. -I..\catalina -O2 -s -o %1.exe %1.c ..\catalina\libawka.a

IF EXIST %1.c DEL %1.c
