/*
 * this program uses no HMI functions - it is handy for 
 * testing the debugger on platforms without any HMI
 */

int func_1(int i) {
   return i + i;
}

int func_2(int i) {
   return i * i;
}

int func_3 (int i) {
   return func_1(func_2(i));
}

int main(void) {
   int j;

   j = func_1(1);
   j += func_2(j);
   j += func_3(j);

   return 0;
}
