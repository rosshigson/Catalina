@echo off

echo.
echo  ===========================
echo  Cleaning all Catalyst Demos
echo  ===========================
echo.

rem del /s /f /q "image\*"
rm -fr image/*

cd core
call clean_all
cd ..

cd fymodem
call clean_all
cd ..

cd xvi-2.51
call clean_all
cd ..

cd pascal\p5_c
call clean_all
cd ..\..

cd jzip
call clean_all
cd ..

cd dumbo_basic
call clean_all
cd ..

cd sst
call clean_all
cd ..

cd lua-5.4.4
call clean_all
cd ..

cd catalina
call clean_all
cd ..

cd time
call clean_all
cd ..

:done
echo.
echo ====
echo Done
echo ====
echo.


