int test_1 () {
   return 1;
}

int test_inc_leaf (int i) {
   return ++i;
}

int test_inc_notleaf (int i) {
   return test_inc_leaf(i);
}

int test_inc_indirect (int *i) {
   return ++(*i);
}

int test_inc_addressed (int i) {
  return test_inc_indirect(&i);
}

int main (void) {
   int i;

   i = test_1();
   i = test_inc_leaf(i);
   i = test_inc_notleaf(i);
   i = test_inc_indirect (&i);
   i = test_inc_addressed (i);

   return 0;
}

