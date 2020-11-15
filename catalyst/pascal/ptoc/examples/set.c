#include "ptoc.h"

typedef enum {e0, e1, e2, e3, e4, e5, e6, e7, e8, e9,
        e10, e11, e12, e13, e14, e15, e16, e17, e18, e19,
        e20, e21, e22, e23, e24, e25, e26, e27, e28, e29, 
        e30, e31, e32, e33, e34, e35, e36, e37, e38, e39, 
        e40, e41, e42, e43, e44, e45, e46, e47, e48, e49, last_enum_} enum_;
typedef set set50;
set50 s, s1;
set non_printable;	 
integer elem;
int main(int argc, const char* argv[])
{
   pio_initialize(argc, argv);
   s = setof(range(e10,e15),e20,range(e48,e49), eos);
   non_printable = setof(range(chr(0) , chr(31)), eos);
    for( elem = 0; elem <= 127; elem ++)
      if ( inset(chr(elem), non_printable) )

        cwrite ("%4i",  elem );
    cwrite("\n");

   if (inset(e49, s)) 
      cwrite("operation in Ok\n");
   s = difference(s, setof(e48, eos));
   if (equivalent(join(intersect(s, setof(range(e0,e12), eos)), setof(e20,e49, eos)), difference(s, setof(e13,e14,e15,e16, eos)))) 
      cwrite("operations * + - Ok\n");
   s1 = join(s, setof(e0, eos));
   if ((subset(s, s1)) && (equivalent(difference(s1, setof(e0, eos)), s)) && (subset(s, s))) 
      cwrite("operations := <= >= = Ok\n");
   return EXIT_SUCCESS;
}


