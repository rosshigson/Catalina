 /***************************************************************************\
 *                                                                           *
 *                      prop2.h Smart Pin Tests                              *
 *                                                                           *
 * This program shows how to use the smart pin functions defined in the      *
 * "prop2.h" file.                                                           *
 *                                                                           *
 \***************************************************************************/

#include <stdio.h>
#include <stdint.h>
#include <prop2.h>

#define ledpin 56
#define reppin 57

#define ncomode 0x4CUL // 0b01001100
#define repmode 0x06UL // 0b00000110
#define unique  0xc0ffee00UL

void main()
{
    uint32_t sysfreq = _clockfreq();
    uint32_t pinfreq = sysfreq / 4; // how often the pin should toggle
    uint32_t bitperiod = 16000;
    uint32_t incr = 0x80000000U / (pinfreq / bitperiod);
    uint32_t result;

    // test repository mode
    _wrpin(reppin, repmode);
    _dirh(reppin);
    _wxpin(reppin, unique+reppin);
    result = _rdpin(reppin);
    _dirl(reppin);
    _wrpin(reppin, 0);
    printf("Smartpin %d programmed with value %X\n", reppin, unique+reppin);
    printf("Smartpin %d returns value %X\n\n", reppin, result);

    // test nco mode
    printf("Smartpin %d programmed to flash\n", ledpin);
    _dirl(ledpin);
    _wrpin(ledpin, ncomode);
    _wxpin(ledpin, bitperiod);
    _wypin(ledpin, incr);
    _dirh(ledpin); // enable smart pin

    // just indicate we are still running
    for(;;) {
        printf(".\n");
        _waitx(sysfreq);
    }
}
