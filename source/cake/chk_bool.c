#include <stdio.h>
#include <stdbool.h>

struct test_uchar {
    unsigned char   u1;
    unsigned char   u2;
};

struct test_bool {
    bool   b1;
    bool   b2;
};

#if __STDC_VERSION__ >= 199901L
struct test_Bool {
    _Bool   B1;
    _Bool   B2;
};
#endif

void main(void) {
   struct test_uchar u = { 0 };
   struct test_bool  b = { 0 };
#if __STDC_VERSION__ >= 199901L
   struct test_Bool  B = { 0 };
#endif

    printf("sizeof u = %d\n", sizeof(u));
    printf("sizeof b = %d\n", sizeof(b));
    printf("sizeof B = %d\n", sizeof(B));
}
