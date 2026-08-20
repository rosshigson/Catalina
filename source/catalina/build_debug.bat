bison -y -Wno-conflicts-sr -d blackbox_y.y
flex -oblackbox_l.c blackbox_l.l
gcc -D WIN32_PATHS -o blackbox.exe y.tab.c blackbox_l.c blackbox_comms.c rs232.c printf.c lua-5.4.8/src/linit.c -L lua-5.4.8\src -llua
cp blackbox.exe "..//..//bin//"blackbox.exe
