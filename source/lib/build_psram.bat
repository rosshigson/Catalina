@echo off

rem Build the parts of the library Catalyst needs, using PSRAM. Note that
rem this script assumes the output should be put in ..\.. which is the
rem correct location when this script is called from the folder
rem    demos\catalyst\catalina\lib
rem To change this, change the setting of TMP_OUTPUT below.

call unset CATALINA_DEFINE

set CATALINA_DEFINE=PSRAM

set path=.;%PATH%

rem get the short path name, then substitute \ with \\

call set_short_path TMP_LCCDIR "%LCCDIR%"
set TMP_LCCDIR=%TMP_LCCDIR:\=\\%

call set_short_path TMP_OUTPUT "..\.."
set TMP_OUTPUT=%TMP_OUTPUT:\=\\%

make clean -f makefile.mgw LCCDIR=%TMP_LCCDIR%
make -B all -f makefile.mgw PROPELLER_2=TRUE LCCDIR=%TMP_LCCDIR% OUTPUT=%TMP_OUTPUT%

make clean -f makefile.mgw LCCDIR=%TMP_LCCDIR%
make -B all -f makefile.mgw COMPACT=TRUE  PROPELLER_2=TRUE LCCDIR=%TMP_LCCDIR% OUTPUT=%TMP_OUTPUT%

make clean -f makefile.mgw LCCDIR=%TMP_LCCDIR%
make -B all -f makefile.mgw LARGE=TRUE PROPELLER_2=TRUE LCCDIR=%TMP_LCCDIR%  OUTPUT=%TMP_OUTPUT%

make clean -f makefile.mgw LCCDIR=%TMP_LCCDIR%
make -B all -f makefile.mgw NATIVE=TRUE  PROPELLER_2=TRUE LCCDIR=%TMP_LCCDIR% OUTPUT=%TMP_OUTPUT%
