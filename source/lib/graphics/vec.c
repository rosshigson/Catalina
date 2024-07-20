#include <graphics.h>

// Draw a vector sprite
//
//   x,y         - center of vector sprite
//   vecscale    - scale of vector sprite ($100 = 1x)
//   vecangle    - rotation angle of vector sprite in bits[12..0]
//   vecdef_ptr  - address of vector sprite definition
//
//
// Vector sprite definition:
//
//   word $8000|$4000+angle  'vector mode + 13-bit angle 
//                           '(mode: $4000=plot, $8000=line)
//   word length             'vector length
//   ...                     'more vectors
//   ...
//   word 0                  'end of definition
//
void g_vec(int x, int y, int vecscale, int vecangle, 
           void * vecdef_ptr) {
   register int *arg_ptr = G_VAR.ARGS;
   
   *arg_ptr++ = x;
   *arg_ptr++ = y;
   *arg_ptr++ = vecscale;
   *arg_ptr++ = vecangle;
   *arg_ptr = (int)vecdef_ptr;
   _setcommand(CGI_vec, (long)G_VAR.ARGS);
}
