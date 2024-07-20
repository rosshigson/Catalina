/*
 * Test setjmp/longjmp example taken from:
 * http://www.cs.utk.edu/~plank/plank/classes/cs360/360/notes/Setjmp/lecture.html
 *
 */
#include <hmi.h>
#include <setjmp.h>

int main(void) {
  jmp_buf env;
  int i;

  t_string(1, "Test 1 of setjmp/longjmp\n");
  k_clear();
  t_string(1, "Press a key to start\n");
  k_wait();

  i = setjmp(env);
  t_string(1, "i = ");
  t_integer(1, i);
  t_string(1, "\n");

  if (i != 0) {
     t_string(1, "Test 1 passed if you see\n'i = 0' followed by\n'i = 2' above\n");
     t_string(1, "Press any key to continue...\n");
     k_wait();
     exit(0);
  }

  longjmp(env, 2);
  t_string(1, "Test 1 failed if you see this!\n");

  t_string(1, "Press any key to exit ...\n");
  k_wait();

  return 0;
}

