void main() {
   int i;
   int a, b, c;
   unsigned long t;

   printf("begin\n");
   t = clock();
   for (i = 0; i < 1000000; i++) {
      a = 1;
      b = 2;
      c = a+b;
   }
   printf("end, %u msec\n", clock()-t);
   while(1);
}
