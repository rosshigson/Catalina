/* An interim version of <stdbool.h> from C/C++ Users Journal
 * May 2002.  This file may be included from C90, C++, or C99
 * (but C99 should come with its own version).
 */

/* If C++, do nothing since bool is built in */
#if !defined(__cplusplus)

#  if !defined(__bool_true_false_are_defined)
#    define __bool_true_false_are_defined 1

     /* If this is C99 or later, use built-in bool */
#    if __STDC_VERSION__ >= 199901L
#      define bool _Bool
#    else
       /* Choose an unsigned type that can be used as a bitfield */
#      define bool unsigned int
#    endif

#    define true 1
#    define false 0
#  endif 

#endif /* !defined(__cplusplus) */
