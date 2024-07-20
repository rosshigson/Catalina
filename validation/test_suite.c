/* 
 * Simple compiler test_suite. Tests very basic i/o, simple integer
 * arithmetic, comparisons, case statements, recursion, structures, 
 * indirection, parameter passing, variadic functions, statics etc.
 *
 * Intended to be verified by the Lua script "test_suite.lua" to 
 * confirm that a simple compilation works ok.
 *
 * This program can also be used by the Lua script "test_suite_blackbox.lua"
 * to test the blackbox debugger, but in that case the symbol NO_INPUT 
 * should also be defined, to stop the program waiting for user input.
 */

#include <hmi.h>

#define TEST_2_COUNT 100

static int static_i = 303;
static int static_j = 505;

void test_1(char *str) {
   t_string(1,str);
}

int test_2(int i) {
   int j;

   t_string(1,"Test 2 : Printing integers: ");
   for (j = 0; j < i; j++) {
      t_integer(1, j + 1);
      if (j < i - 1) {
         t_char(1, ',');
      }
   }
   t_string(1, "\n");
   return j;
}

void test_3(int i, int j) {
   t_string(1,"Test 3 : Test integer equality - ");
   t_integer(1, i);
   t_string(1," and ");
   t_integer(1, j);
   if (i == j) {
      t_string(1," are");
   }
   else {
      t_string(1," are not");
   }
   t_string(1," equal\n");
}

int test_4() {
   int k;

   t_string(1, "Test 4 : Press a key : ");
#ifndef NO_INPUT
   while (!k_ready()) {
   }
   k = k_get();
#else
   k = 0x99;
#endif
   t_string(1, " Key = ");
   t_hex(1, k);
   t_string(1, "\n");
   return k;
}

void test_5() {
   int k,l,m,n;

   k = 967;
   l = 73;
   m = 0;

   t_string(1, "Test 5 : Multiplying ");
   t_integer(1, k);
   t_string(1, " by ");
   t_integer(1, l);
   t_string(1, " = ");
   m = k * l;
   t_integer(1, m);
   if ( m / k != l) {
      t_string(1, " : Failed\n");
   }
   else {
      t_string(1, " : Passed\n");
   }
   
   k = 1092283;
   l = 13;
   m = 0;
   n = 0;
   t_string(1, "Test 5 : Dividing ");
   t_integer(1, k);
   t_string(1, " by ");
   t_integer(1, l);
   t_string(1, " = ");
   m = k / l;
   t_integer(1, m);
   t_string(1, " with remainder ");
   n = k % l;
   t_integer(1, n);
   if (k != l*m+n) {
      t_string(1, " : Failed (");
      t_integer(1, l*m+n);
      t_string(1, ")\n");
   }
   else {
      t_string(1, " : Passed\n");
   }
}

void test_6() {
   int ch = 0;
   char *str;

   t_string(1, "Test 6 : Press 0 .. 9, or any other key to continue\n");
loop:
#ifndef NO_INPUT
   ch = k_wait();
#else
   if (ch == 0) {
      ch = '9';
   }
   else {
      ch = '\n';
   }
#endif
   switch (ch) {
      case '0': str = "zero"; break;
      case '1': str = "one"; break;
      case '2': str = "two"; break;
      case '3': str = "three"; break;
      case '4': str = "four"; break;
      case '5': str = "five"; break;
      case '6': str = "six"; break;
      case '7': str = "seven"; break;
      case '8': str = "eight"; break;
      case '9': str = "nine"; break;
      default:  t_string(1, "\nTest 6 : Done\n"); return;
   }
   t_string(1, str);
   t_char(1, ' ');
   goto loop;
}

void test_7_recurse(int i) {
   if (i > 0) {
      test_7_recurse(i-1);
      t_integer(1, i);
      t_char(1,' ');
   }
   else {
      t_string(1," ZERO! ");
   }
}

void test_7 (int i) {
   t_string(1, "Test 7 : Start\n");
   test_7_recurse(i);
   t_string(1, "\nTest 7 : Done\n");
}


typedef struct person {
  char *name;
  int age;
};

void print_person (struct person *p) {

   t_string(1, "Name = ");
   t_string(1, p->name);
   t_string(1, ", Age = ");
   t_integer(1, p->age);
   t_char(1, '\n');
}

struct person test_8 (struct person p1, struct person p2) {
   struct person tmp;
   
   print_person(&p1);
   print_person(&p2);

   if (p1.age > p2.age) {
      tmp = p1;
   }
   else {
      tmp = p2;
   }
   return tmp;
}

int test_9_part_1 (int i) {
   int j;
   int k;
   int l;

   j = i++;
   k = ++i + j++;
   l = ++i + ++j + k-- + i++ + j++ + --k;
   return l;
}

int test_9_part_2 (int i) {
   register int j;
   register int k;
   register int l;

   j = i++; 
   k = ++i + j++;
   l = ++i + ++j + k-- + i++ + j++ + --k;
   return l;
}

int test_function_10(int i) {
   return i*i;
}

void print_result (char *str, int i) {
   t_string(1, str);
   t_string(1, " = ");
   t_integer(1, i);
}

void print_i_and_j (char *str, int i, int j) {
   t_string(1, str);
   t_string(1, " i = ");
   t_integer(1, i);
   t_string(1,", j = ");
   t_integer(1, j);
   t_char(1, '\n');
}
   
void test_10 (int (*f) (int), int i) {
   print_result("Test 10 : i", i);
   print_result(", squared", f(i));
}

void test_11(int i, int j)
{
   print_i_and_j("Test 11 :", i, j);
   print_result("i+j", i+j);
   print_result("; i-j", i-j);
   print_result("; i*j", i*j);
   print_result("; i/j", i/j);
   print_result("; i%j", i%j);
   print_result("; i<<j", i<<j);
   print_result("; i>>j", i>>j);
   print_result("; ~i", ~i);
   print_result("; i|j", i|j);
   print_result("; i&j", i&j);
   print_result("; i^j", i^j);
   t_string(1,"\n");
}

void test_12(int dir, int *i, int **j) {
   int tmp;
   if (dir > 0) {
      // swap i and j one way
      tmp = *i;
      *i = **j;
      **j = tmp;
   }
   else {
     // swap i and j another way
     tmp = **j;
     **j = *i;
     *i = tmp;
   }
}

void test_13 (int i, int j, int a, int b, int c) {
   int *k;

   k = &i;
   print_result("Test 13: i", *k);
   t_string(1, "\n");
   k = &j;
   print_result("Test 13: j", *k);
   t_string(1, "\n");
   print_result("Test 13: a + b + c", a + b + c);
   t_string(1, "\n");
}

int test_14 (int count, ...) {
  va_list ap;
  int i, sum;

  va_start (ap, count);         /* Initialize the argument list. */

  sum = 0;
  for (i = 0; i < count; i++) {
    sum += va_arg (ap, int);    /* Get the next argument value. */
  }

  va_end (ap);                  /* Clean up. */
  return sum;
}


int test_string(char * str) {
   return (int) str[0];
}

void press_key_to_continue() {
   t_string(1, "\nPress any key to continue ...");
#ifndef NO_INPUT
   k_wait();
#endif
   t_char(1,'\n');
   t_char(1,'\n');
}

int main(void) {
   int i;
   int j;
   int r;
   int s;
   int *k;
   struct person p1;
   struct person p2;
   struct person p3;

   k_clear();

   test_1("Test 1 : Hello, World! (from Catalina)\n");

   press_key_to_continue();

   i = test_2(TEST_2_COUNT);

   press_key_to_continue();

        test_3(i, TEST_2_COUNT);
        test_3(i, TEST_2_COUNT-1);

   press_key_to_continue();

   i = test_4();

   press_key_to_continue();

   test_5();

   press_key_to_continue();

   test_6();

   press_key_to_continue();

   test_7(20);

   press_key_to_continue();

   t_string(1, "Test 8 : Start\n");
   p1.name = "ross";
   p1.age = 49;
   p2.name = "joanne";
   p2.age = 48;
   p3 = test_8(p1,p2);
   t_string(1, "Test 8 : Oldest is ");
   t_string(1, p3.name);
   t_string(1,"\nTest 8 : Done\n");

   press_key_to_continue();

   i = 1;

   t_string(1, "Test 9 : ");
   t_integer(1, test_9_part_1(i));
   t_string(1, " = ");
   t_integer(1, test_9_part_2(i));
   t_char(1,'\n');

   press_key_to_continue();

   test_10(&test_function_10, 11);
   t_char(1,'\n');

   press_key_to_continue();

   test_11(6, 3);
   test_11(8, -3);
   t_string(1,"Test 11 : Done\n");

   press_key_to_continue();

   i = 2;
   j = 3;
   k = &j;

   print_i_and_j("Test 12 :", i, j);
   test_12(-1, &i, &k);
   print_i_and_j("Swapped :", i, j);
   test_12(1, &i, &k);
   print_i_and_j("Swapped again :", i, j);
   t_string(1,"Test 12 : Done\n");

   press_key_to_continue();

   test_13(i, j, 1, 2, 3);
   test_13(1, 2, 3, 4, 5);
   test_13(static_i, static_j, 1, 2, 3);

   press_key_to_continue();

   i = test_14(20, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20);

   print_result("Test 14 : sum", i);
   t_string(1, "\n\n");

   t_string(1, "All tests complete!\n");

   press_key_to_continue();

#ifdef NO_INPUT
   while (1) { };
#endif
   return 0;
}
