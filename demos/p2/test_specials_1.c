/*
 * Demonstration of associating names with special variables by declaring
 * them as "extern volatile". The program does nothing useful, and is 
 * intended only for comparison with test_specials_2.c
 *
 * This program will compile on the P1 or P2 - i.e.
 *
 *    catalina test_specials_1.c
 *    catalina -p2 test_specials_1.c 
 * 
 * Note that definitions similar to these are included in the files
 * "prop.h", and this is the preferred way of defining them.
 */
extern volatile DIRA;
extern volatile DIRB;
extern volatile OUTA;
extern volatile OUTB;
extern volatile INA;
extern volatile INB;

void main(void) {
    DIRA = DIRA | 0x1;
    DIRB = DIRB | 0x2;
    OUTA = OUTA & 0x3;
    OUTB = OUTB & 0x4;
    INA = INA ^ 0x5;
    INB = INB ^ 0x6;
}

