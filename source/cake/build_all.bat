@echo off
cd src
gcc build.c -D TEST -D__CATALINA__ -o build
build
copy /Y cake.exe "%LCCDIR%"\bin\cake.exe
copy /Y cakeconfig.h "%LCCDIR%"\bin\cakeconfig.h
cd ..

if "%1"=="" goto no_parameters

rem also build cake for the specified Propeller platform
make_cake %*

:no_parameters

