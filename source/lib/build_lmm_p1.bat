@echo off

call unset CATALINA_DEFINE

set path=.;%PATH%

rem get the short path name, then substitute \ with \\

call set_short_path TMP_LCCDIR "%LCCDIR%"
set TMP_LCCDIR=%TMP_LCCDIR:\=\\%

call set_short_path TMP_OUTPUT "..\.."
set TMP_OUTPUT=%TMP_OUTPUT:\=\\%

make clean -f makefile.mgw LCCDIR=%TMP_LCCDIR%
make -B all -f makefile.mgw LCCDIR=%TMP_LCCDIR% OUTPUT=%TMP_OUTPUT%
