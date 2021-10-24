/*
 * demonstration program for BlackBox/BlackCat 
 *
 * make sure to compile it with the -g or -g3 flag
 *
 */
#define TEST_1_STRING "hello, world! (from BlackBox!)\n"

#define TEST_2_COUNT 100

#define TEST_3_INT 67

#define TEST_3_FLOAT 98.765e4

typedef struct person;

typedef struct person {
  char name[23];
  short age;
  float height;
  struct person *spouse;
  struct person *mother;
  struct person *father;
  int children;
  struct person *child_1;
  struct person *child_2;

};

extern void test_1(char *str);
extern int test_2(int i);
extern void test_3(int i, int j);
extern int test_4();
extern void test_5();
extern void test_6();
extern void test_7 (int i);
extern struct person test_8 (struct person p1, struct person p2);
extern void test_9(int i);
extern int test_function_10(int i);
extern void test_10 (int (*f) (int), int i);
extern void test_11(int i, int j);
extern void test_12(int dir, int *i, int **j);
extern void test_13(int numbers[]);

extern void print_person (struct person *p);
extern void print_result (char *str, int i);
extern void print_i_and_j (char *str, int i, int j);

