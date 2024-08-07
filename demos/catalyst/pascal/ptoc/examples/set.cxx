#include "ptoc.h"

enum enum_ {e0, e1, e2, e3, e4, e5, e6, e7, e8, e9,
        e10, e11, e12, e13, e14, e15, e16, e17, e18, e19,
        e20, e21, e22, e23, e24, e25, e26, e27, e28, e29, 
        e30, e31, e32, e33, e34, e35, e36, e37, e38, e39, 
        e40, e41, e42, e43, e44, e45, e46, e47, e48, e49, last_enum_};
typedef set_of_enum(enum_) set50;
set50 s, s1;
set non_printable;	 
integer elem;
int main(int argc, const char* argv[])
{
   pio_initialize(argc, argv);
   s = set_of_enum(enum_)::of(range(e10,e15),e20,range(e48,e49), eos);
   non_printable = set::of(range(chr(0) , chr(31)), eos);
    for( elem = 0; elem <= 127; elem ++)
      if ( non_printable.has(chr(elem)) )

        output <<  format(elem,4);
    output << NL;

   if (s.has(e49)) 
      output << "operation in Ok" << NL;
   s = s - set_of_enum(enum_)::of(e48, eos);
   if (s * set_of_enum(enum_)::of(range(e0,e12), eos) + set_of_enum(enum_)::of(e20,e49, eos) == s - set_of_enum(enum_)::of(e13,e14,e15,e16, eos)) 
      output << "operations * + - Ok" << NL;
   s1 = s + set_of_enum(enum_)::of(e0, eos);
   if ((s <= s1) && (s1 - set_of_enum(enum_)::of(e0, eos) == s) && (s >= s)) 
      output << "operations := <= >= = Ok" << NL;
   return EXIT_SUCCESS;
}


