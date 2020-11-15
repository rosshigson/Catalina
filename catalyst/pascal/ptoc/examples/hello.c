#include "ptoc.h"


text t = VOID_FILE;
integer i, j, k;
char s[10];
int main(int argc, const char* argv[])
{
   pio_initialize(argc, argv);
   cwrite("Hello world !\n");
   rewrite(t, "test.txt", 0, 0);
   twrite(&t, "%i%i%ihello\n", 1, 2, 3);
   reset(t, 0, 0, 0);
   tread(&t, "%i%i%i%s\n", &i, &j, &k, 1, items(s), s);
   cwrite("i =%i, j =%i, k =%i, s = \"%s\"\n", i, j, k, 1, items(s), s);
   close(t);
   return EXIT_SUCCESS;
}
