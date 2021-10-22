#include "ptoc.h"


text t;
integer i, j, k;
array<1,10,char> s;
int main(int argc, const char* argv[])
{
   pio_initialize(argc, argv);
   output << "Hello world !" << NL;
   rewrite(t, "test.txt");
   t << 1 << 2 << 3 << "hello" << NL;
   reset(t);
   t >> i >> j >> k >> s >> NL;
   output << "i =" << i << ", j =" << j << ", k =" << k << ", s = \"" << s << '"' << NL;
   close(t);
   return EXIT_SUCCESS;
}
