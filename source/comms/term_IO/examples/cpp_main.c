#include "ex7.h"

extern "C" {
  void adainit (void); 
  void adafinal (void);
  void method1 (A *t);
}

void method1 (A *t)
{
  t->method1 ();
}

int main ()
{
  A obj;

  adainit ();
  obj.method2 (3030);
  adafinal ();
}
