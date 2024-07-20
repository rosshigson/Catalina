#include "inttypes.h"
#include <stdio.h>
#include <hmi.h>

int main(void) {

    char *end;
    uintmax_t i = UINTMAX_MAX; // This type always exists.

    printf("The largest integer value is %u\n", i);
    printf("strtoimax '-123456789' = %ld\n", strtoimax("-123456789", &end, 10));
    printf("strtoumax '123456789' = %ld\n", strtoumax("123456789", &end, 10));

    t_string(1, "Press any key to exit ...");
    k_wait();

    return 0;
}
         
