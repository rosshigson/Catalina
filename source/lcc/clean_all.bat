@echo off
rem
rem get the short path name, then substitute \ with \\
rem
call set_short_path TMP_LCCDIR "%LCCDIR%"
set TMP_LCCDIR=%TMP_LCCDIR:\=\\%
rem
rem now clean everything
rem
make clobber -f makefile.mgw HOSTFILE=etc\\catalina_win32.c LCCDIR=%TMP_LCCDIR%


