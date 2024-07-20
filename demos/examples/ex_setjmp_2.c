/*
 * Test setjmp/longjmp example taken from:
 * http://www.cs.utk.edu/~plank/plank/classes/cs360/360/notes/Setjmp/lecture.html
 *
 */
#include <setjmp.h>
#include <hmi.h>


int proc_4(jmp_buf env, int i) {
  if (i == 0) longjmp(env, 1);
  return 14 % i;
}
  
int proc_3(jmp_buf env, int i, int j) {
  return proc_4(env, i) + proc_4(env, j);
}

int proc_2(jmp_buf env, int i, int j, int k) {
  return proc_3(env, i, k) + proc_3(env, j, k);
}

int proc_1(jmp_buf env, int i, int j, int k, int l) {
  return proc_2(env, i, j, k+1);
}


int main(int argc, char **argv) {
  jmp_buf env;
  int sj;
  int i, j, k, l;

  t_string(1, "Test 2 for setjmp/longjmp\n");

  k_clear();
  t_string(1, "Press a key to start\n");
  k_wait();

  sj = setjmp(env);
  if (sj != 0) {
    t_string(1, "\nTest passed if you see this!\n\n");
    t_string(1, "Press any key to continue...\n");
    k_wait();
    exit(0);
  }

  i = 1;
  j = 2;
  k = 3;
  l = 4;


  t_string(1, "proc_1(");
  t_integer(1, i);
  t_string(1, ", ");
  t_integer(1, j);
  t_string(1, ", ");
  t_integer(1, k);
  t_string(1, ", ");
  t_integer(1, l);
  t_string(1, ") = ");
  t_integer(1, proc_1(env, i, j, k, l));

  t_string(1, "\nTest 2 passed if the result is 4\n\n");

  i = 0;
  j = 0;
  k = 0;
  l = 0;


  t_string(1, "proc_1(");
  t_integer(1, i);
  t_string(1, ", ");
  t_integer(1, j);
  t_string(1, ", ");
  t_integer(1, k);
  t_string(1, ", ");
  t_integer(1, l);
  t_string(1, ") = ");
  t_integer(1, proc_1(env, i, j, k, l));

  t_string(1, "\nTest 2 failed if you see this!\n\n");
  t_string(1, "Press any key to exit ...\n");
  k_wait();

  return 0;  
}
  
