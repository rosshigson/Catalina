@echo off
cd src
gcc build.c -D__CATALINA__ -o build
build
cd ..

if "%1"=="" goto no_parameters

rem also build cake for the specified Propeller platform
make_cake %*

:no_parameters

