#include <stdarg.h>
#include <hmi.h>

struct x {
   int x, y;
};

int add_em_up_four (char *str, int a, int b, int c, int d) {
  int sum;
  t_string(1, str);
  sum = a + b + c + d;
  t_integer (1, sum);
  t_string(1,"\n");
  return sum;
}

int add_em_up_vararg (char *str, struct x a, int count, ...) {
  va_list ap;
  int i, sum;

  t_string(1, str);
  va_start (ap, count);         /* Initialize the argument list. */

  sum = 0;
  for (i = 0; i < count; i++)
    sum += va_arg (ap, int);    /* Get the next argument value. */

  va_end (ap);                  /* Clean up. */
  t_integer (1, sum);
  t_string(1,"\n");
  return sum;
}

int main (void) {
  int i;
  struct x a;
  char *s1, *s2;

  s1 = "vararg=";
  s2 = "non vararg=";
  a.x = -1;
  a.y = -2;

  /* This prints 16. */
  i =  add_em_up_vararg (s1, a, 3, 5, 5, 6);

  /* This prints 55. */
  i = add_em_up_vararg (s1, a, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

  /* This prints 26. */
  i =  add_em_up_four (s2, 5, 6, 7, 8);

  t_string(1,"\nTest Passed if the answers are 16, 55 & 26\n\n");
  t_string(1,"Press a key to exit ...");
  k_wait();

  return 0;
}

