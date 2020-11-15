#include <stdio.h>

typedef struct PVAL PVAL;

typedef int ParseContext;
typedef int PValOp;
typedef int String;

struct PVAL {
    void (*fcn)(ParseContext *c, PValOp op, PVAL *pv);
    union {
        String *str;
        int val;
    } u;
};

void main() {

    PVAL *pv;

    pv->fcn = 0;
}

