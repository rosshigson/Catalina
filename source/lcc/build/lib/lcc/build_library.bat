@echo off
copy ..\..\..\lib\assert.s
copy ..\..\..\lib\bbexit.s
copy ..\..\..\lib\yynull.s 
catbind *.s -i -e
