@echo off

rem get the short path name, then substitute \ with \\

call set_short_path TMP_LCCDIR "%LCCDIR%"
set TMP_LCCDIR=%TMP_LCCDIR:\=\\%

rem now clean and make everything

make clobber -f makefile.mgw HOSTFILE=etc\\catalina_win32.c LCCDIR=%TMP_LCCDIR%
make all -f makefile.mgw HOSTFILE=etc\\catalina_win32.c LCCDIR=%TMP_LCCDIR%


