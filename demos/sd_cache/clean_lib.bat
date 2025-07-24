@echo off

echo.
echo  ======================
echo  Cleaning Local Library
echo  ======================
echo.

cd local
call clean_all
cd ..

:done
echo.
echo ====
echo Done
echo ====
echo.


