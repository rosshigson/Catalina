@echo off
echo.
echo  ======================
echo  Building Local Library
echo  ======================
echo.

rem save current CATALINA_DEFINE
set TMP_DEFINE2=%CATALINA_DEFINE%
rem clear CATALINA_DEFINE
set CATALINA_DEFINE=

cd local
call build_all %1 %2 
cd ..

:done
rem restore orignal CATALINA_DEFINE 
set CATALINA_DEFINE=%TMP_DEFINE%

echo.
echo ====
echo Done
echo ====
echo.

