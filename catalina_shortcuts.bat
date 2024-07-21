@echo off
rem
rem Batch File to Create Catalina Shortcuts in the Windows Start Menu
rem
rem %1 - Quoted Menu Name (e.g. "Catalina 7.6.3")
rem      If not specified, then "Catalina" is used.
rem %2 - Quoted path to Catalina (e.g. "C:\Users\rossh\Catalina-7.6.3-alpha")
rem      If not specified, then the current directory is used.
rem
set menu="%1"
set menu=%menu:"=%
if "%menu%" == "" set menu=Catalina
set catpath="%2"
set catpath=%catpath:"=%
if "%catpath%" == "" set catpath=%CD%

echo.
echo ==========================================================================
echo   !!! THIS BATCH FILE MUST BE EXECUTED WITH ADMINISTRATOR PRIVILEGES !!!
echo.
echo Start Menu name will be "%menu%"
echo   Catalina Path will be "%catpath%"
echo ==========================================================================
echo.

SET/P proceed="Proceed to create shortcuts [y/N]? "
if "%proceed%" == "y" SET proceed=Y
if NOT "%proceed%" == "Y" goto done

mkdir "%ALLUSERSPROFILE%\Start Menu\Programs\%menu%"

bin\shortcut /F:"%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\Catalina Command Line.lnk" /A:C /T:"cmd.exe" /P:"/c %catpath%\bin\catalina_cmd.bat" /W:"%catpath%" /I:"%catpath%\Catalina.ico"
bin\shortcut /F:"%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\Catalina Geany IDE.lnk" /A:C /T:"%catpath%\bin\catalina_geany.bat" /W:"%catpath%" /I:"%catpath%\catalina_geany\geany.ico"
bin\shortcut /F:"%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\README.TXT.lnk" /A:C /T:"%catpath%\README.TXT" /W:"%catpath%"
bin\shortcut /F:"%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\README_P2.TXT.lnk" /A:C /T:"%catpath%\README_P2.TXT" /W:"%catpath%"

mkdir "%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\Documents"

bin\shortcut /F:"%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\Documents\Catalina BlackBox Reference Manual.lnk" /A:C /T:"%catpath%\Documents\Catalina BlackBox Reference Manual.pdf" /W:"%catpath%" 
bin\shortcut /F:"%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\Documents\Catalina P1 Command Summary.lnk" /A:C /T:"%catpath%\Documents\Catalina P1 Command Summary.pdf" /W:"%catpath%" 
bin\shortcut /F:"%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\Documents\Catalina P2 Command Summary.lnk" /A:C /T:"%catpath%\Documents\Catalina P2 Command Summary.pdf" /W:"%catpath%" 
bin\shortcut /F:"%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\Documents\Catalina Reference Manual (Propeller 1).lnk" /A:C /T:"%catpath%\Documents\Catalina Reference Manual (Propeller 1).pdf" /W:"%catpath%" 
bin\shortcut /F:"%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\Documents\Catalina Reference Manual (Propeller 2).lnk" /A:C /T:"%catpath%\Documents\Catalina Reference Manual (Propeller 2).pdf" /W:"%catpath%" 
bin\shortcut /F:"%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\Documents\Catalyst Reference Manual.lnk" /A:C /T:"%catpath%\Documents\Catalyst Reference Manual.pdf" /W:"%catpath%" 
bin\shortcut /F:"%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\Documents\Getting Started With Blackbox.lnk" /A:C /T:"%catpath%\Documents\Getting Started With Blackbox.pdf" /W:"%catpath%" 
bin\shortcut /F:"%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\Documents\Getting Started With Catalina.lnk" /A:C /T:"%catpath%\Documents\Getting Started With Catalina.pdf" /W:"%catpath%" 
bin\shortcut /F:"%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\Documents\Getting Started With Catapult.lnk" /A:C /T:"%catpath%\Documents\Getting Started With Catapult.pdf" /W:"%catpath%" 
bin\shortcut /F:"%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\Documents\Getting Started With the Catalina Geany IDE.lnk" /A:C /T:"%catpath%\Documents\Getting Started With the Catalina Geany IDE.pdf" /W:"%catpath%" 
bin\shortcut /F:"%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\Documents\Lua on the Propeller 2 with Catalina.lnk" /A:C /T:"%catpath%\Documents\Lua on the Propeller 2 with Catalina.pdf" /W:"%catpath%" 
bin\shortcut /F:"%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\Documents\Optimizer Reference Manual.lnk" /A:C /T:"%catpath%\Documents\Catalina Optimizer Reference Manual.pdf" /W:"%catpath%" 
bin\shortcut /F:"%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\Documents\Parallel Processing with Catalina.lnk" /A:C /T:"%catpath%\Documents\Parallel Processing with Catalina.pdf" /W:"%catpath%" 
bin\shortcut /F:"%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\Documents\Payload Command Summary.lnk" /A:C /T:"%catpath%\Documents\Payload Command Summary.pdf" /W:"%catpath%" 
bin\shortcut /F:"%ALLUSERSPROFILE%\Start Menu\Programs\%menu%\Documents\Selecting Catalina Options.lnk" /A:C /T:"%catpath%\Documents\Selecting Catalina Options.pdf" /W:"%catpath%" 

:done
echo.
echo Done!
