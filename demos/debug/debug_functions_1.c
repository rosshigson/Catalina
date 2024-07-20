#include <stdio.h>

#include "debug_example.h"

void test_1(char *str) {
   printf(str);
}

int test_2(int i) {
   int j;

   printf("\nTest 2 : Printing integers: ");
   for (j = 0; j < i; j++) {
      printf("%d", j + 1);
      if (j < i - 1) {
         printf(",");
      }
   }
   printf("\n");
   return j;
}

void test_3(int i, int j) {
   printf("Test 3 : Test integer equality - %d and %d are", i, j);
   if (i != j) {
      printf(" not");
   }
   printf(" equal\n\n");
}

int test_4() {
   int k;

   printf( "Test 4 : Press a key : ");
   while (!k_ready()) {
   }
   printf( " Key = ");
   k = k_get();
   printf("%2x\n\n", k);
   return k;
}

void test_5() {
   int k,l,m,n;

   k = 967;
   l = 73;
   m = 0;

   m = k * l;
   printf( "Test 5 : Multiplying %d by %d = %d", k, l, m);
   
   k = 1092283;
   l = 13;
   m = 0;
   n = 0;
   m = k / l;
   n = k % l;
   printf( "\nTest 5 : Dividing %d by %d = %d with remainder %d", k, l, m, n);
   if (k != l*m+n) {
      printf( " : Failed (%s)\n\n", l*m+n);
   }
   else {
      printf( " : Passed\n\n");
   }
}

void test_6() {
   int ch;
   char *str;

   printf( "Test 6 : Press 0 .. 9, or any other key to continue\n");
loop:
   ch = k_wait();
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
      default:  printf( "\nTest 6 : completed\n"); return;
   }
   printf("%s ", str);
   goto loop;
}

void test_7_recurse(int i) {
   if (i > 0) {
      test_7_recurse(i-1);
      printf("%d ", i);
   }
   else {
      printf(" ZERO! ");
   }
}

void test_7 (int i) {
   printf( "Test 7 : starting\n");
   test_7_recurse(i);
   printf( "\nTest 7 : finished\n");
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
   //l = ++i + ++j + k--;
   return l;
}

int test_9_part_2 (int i) {
   register int j;
   register int k;
   register int l;

   j = i++; 
   k = ++i + j++;
   l = ++i + ++j + k-- + i++ + j++ + --k;
   //l = ++i + ++j + k--;
   return l;
}

void test_9(int i) {   
   printf( "Test 9 : %d = %d\n", test_9_part_1(i), test_9_part_2(i));
}

int test_function_10(int i) {
   return i*i;
}

void test_10 (int (*f) (int), int i) {
   printf("Test 10 : i = %d, squared = %d\n", i, f(i));
}


