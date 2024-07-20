/*
 * Demonstration of associating names with special variables by declaring
 * them as "extern volatile". The program does nothing useful, and is 
 * intended only for comparison with test_specials_1.c
 *
 * This program will compile only on the Propeller 2 - i.e.
 *
 *    catalina -p2 test_specials_2.c 
 * 
 * Note that definitions similar to these are included in the files
 * "prop2.h", and this is the preferred way of defining them.
 */
extern volatile _DIRA;
extern volatile _DIRB;
extern volatile _OUTA;
extern volatile _OUTB;
extern volatile _INA;
extern volatile _INB;

void main(void) {
    _DIRA = _DIRA | 0x1;
    _DIRB = _DIRB | 0x2;
    _OUTA = _OUTA & 0x3;
    _OUTB = _OUTB & 0x4;
    _INA = _INA ^ 0x5;
    _INB = _INB ^ 0x6;
}

