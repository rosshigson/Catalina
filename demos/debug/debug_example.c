#include <stdio.h>
#include <stdlib.h>

#include "debug_example.h"

typedef unsigned long long my_int;

typedef enum aa { cat, dog };

typedef struct bb {
    int a;
    char * b;
    float c[10];
};

typedef struct cc {
    int **a;
    float *b[10];
    char **c;
};

typedef union dd {
    struct bb *x;
    struct cc y[20];
    enum aa z;
};

static my_int zzz;

typedef float (*fff) (int i, long j);

void take_fff (fff g) {
    ;
}

void print_person (struct person *p) {

    int i;

    printf("Name = %s", p->name);
    printf(", Age = %hd", p->age);
    if (p->spouse) {
        printf(", Spouse = %s", p->spouse->name);
    }
    if (p->mother) {
        printf(", Mother = %s",p->mother->name);
    }
    if (p->father) {
        printf(", Father = %s", p->father->name);
    }
    if ((p->children >= 1) && (p->child_1)) {
        printf(", Child 1 = %s", p->child_1->name);
    }
    if ((p->children >= 2) && (p->child_2)) {
        printf(", Child 2 = %s", p->child_2->name);
    }
    printf("\n");
}

void print_result (char *str, int i) {
    printf("%s = %d", str, i);
}

void print_i_and_j (char *str, int i, int j) {
    printf("%s i = %d, j = %d\n\n", str, i, j);
}

static struct person oldest;

static int an_array[] = {1, 2, 3, 4, 5, 6, 7, -1};

static int static_int;

void main(void) {

    int i;
    int j;
    int r;
    int s;
    int *k;
    struct person ross;
    struct person joanne;
    struct person patricia;
    struct person georgina;

    test_1(TEST_1_STRING);


    i = test_2(TEST_2_COUNT);
    print_result("Test 2 result", i);
    printf("\n");


    i = TEST_3_INT;
    test_3(i, TEST_3_INT);
    test_3(i, -TEST_3_INT);


    i = test_4();
    print_result("Test 4 result", i);
    printf("\n");


    test_5();


    test_6();


    test_7(20);


    printf("Test 8 : Starting\n");
    strcpy(ross.name, "ross");
    ross.age = 49;
    ross.height = 1.72;
    ross.spouse = &joanne;
    ross.mother = NULL;
    ross.father = NULL;
    ross.children = 2;
    ross.child_1 = &patricia;
    ross.child_2 = &georgina;
    strcpy(joanne.name, "joanne");
    joanne.age = 48;
    joanne.height = 1.68;
    joanne.spouse = &ross;
    joanne.mother = NULL;
    joanne.father = NULL;
    joanne.children = 2;
    joanne.child_1 = &patricia;
    joanne.child_2 = &georgina;
    strcpy(patricia.name, "patricia");
    patricia.age = 13;
    patricia.height = 1.6;
    patricia.spouse = NULL;
    patricia.mother = &joanne;
    patricia.father = &ross;
    patricia.children = 0;
    strcpy(georgina.name, "georgina");
    georgina.age = 10;
    georgina.height = 1.58;
    georgina.spouse = NULL;
    georgina.mother = &joanne;
    georgina.father = &ross;
    georgina.children = 0;

    oldest = test_8(patricia,georgina);
    printf("Test 8 : Oldest is %s\n", &oldest.name);

    i = 1;
    test_9(i);
    printf("\n");


    test_10(&test_function_10, 11);
    printf("\n");


    test_11(6, 3);
    test_11(8, -3);
    printf("\n");


    i = 2;
    j = 3;
    k = &j;
    print_i_and_j("Test 12 :", i, j);
    test_12(-1, &i, &k);
    print_i_and_j("Swapped :", i, j);
    test_12(1, &i, &k);
    print_i_and_j("Swapped again :", i, j);


    test_13(an_array);
    printf("\n");

    test_14();

    test_15();

    printf("All tests complete!\n");

    while(1) ;

}
