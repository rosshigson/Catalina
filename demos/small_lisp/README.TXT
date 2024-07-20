This program demonstrates a C J Chaitin's Small Lisp interpreter, modified
slightly to run on Catalina.

C J Chaitin's original web page is now unavailable but can still be accessed 
via the Internet Archive Wayback Machine at:

https://web.archive.org/web/20110928190512/http://www.cs.umaine.edu/~chaitin/

There is only one C program in this folder (small_lisp.c). To build the 
programs, use the "build_all" command, specifying the platform for which you 
want to build (P2_EVAL etc) and the HMI option to use.

On the Propeller 1, the program will need to be built to use XMM RAM, and the
build_utilities script will need to be run with matching options. On the 
Propeller 2 it can be built as normal, or to use XMM RAM if it is available.

For example:

   build_all C3 TTY LARGE CACHED_1K OPTIMIZE FLASH
or
   build_all P2_EDGE 
or
   build_all P2_EVAL LARGE CACHED_1K 

The following program will be built: 

   small_lisp  - the Small Lisp interpreter.

When executed, it will print "LISP Interpreter Run" and wait for the entry
of Lisp commands. There is no prompt.

The following brief introduction to this Lisp interpreter is extrated from 
C J Chaitin's original web site.

-------------------------------------------------------------------------------

Example: To define factorial, enter the following and then press ENTER
(note - use cut and paste to enter this without typing it manually):

   define (f n) if = display n 0 1 * n (f - n 1)

To try it, enter the following and press ENTER:

   (f 5)

Syntax: empty list nil = (), lists & sublists built up from atoms which are names 
and unsigned integers. Token delimiter characters are blank, single-quote, 
double-quote, parens, and square brackets. A double-quote is used to include an 
S-exp within an M-exp. Square brackets enclose comments, [like this], and comments
may be nested.

Functional notation: (f x y z) is f(x,y,z). In M-exps parens for primitive functions
are omitted, in S-exps all parens are given explicitly. Defined functions are of the
form (lambda (parameter-list) function-body).

List-processing functions: 
   car (one argument, first element of list), 
   cdr (one arg, rest of list), 
   cons (two args, add new element to beginning of list), 
   atom (one argument, is-atom predicate), 
   = (two args, equal S-exp predicate), 
   append (two args, combines two lists), 
   length (one arg, number of elements in list), 
   size (one arg, number of characters in S-exp), 
   cadr (one arg, second element of list), 
   caddr (one arg, third element of list).

Pseudo-functions: 
   ' (one argument, quote, literally), 
   " (one argument, S-exp within M-exp), 
   if (three args, if-then-else selector function), 
   display (one arg, identity function, shows arg), 
   let (three args, let-be-in, temporary definition), 
   define (two args, define-to-be, permanent definition—allowed at top level only), 
   eval (one arg, evaluate S-exp in std environment), 
   lambda (two args, associates list of parameters with function body).

Arithmetic functions: 
   + (two args, addition), 
   - (two args, subtraction), 
   * (two args, multiplication), 
   ^ (two args, exponentiation), 
   < (two args, less-than predicate), 
   > (two args, greater-than predicate), 
   <= (two args, less-than-or-equal predicate), 
   >= (two args, greater-than-or-equal predicate), 
   = (two args, equality predicate), 
   base2-to-10 (one arg, converts list of bits to integer), 
   base10-to-2 (one arg, converts integer to list of bits).

Advanced functions: (For detailed explanations, see my book The Limits of Mathematics.) 
   try (three args, try within time-limit to evaluate S-exp with given binary data), 
   debug (one arg, identity function, shows arg—unlike display works within try), 
   read-bit (no arg, reads the next bit of the binary data), 
   read-exp (no arg, reads the next S-exp from the binary data), 
   bits (one arg, converts S-exp to bit string of ASCII characters). 

-------------------------------------------------------------------------------

For more actual examples of the Lisp syntax, see LISP.TXT.

-------------------------------------------------------------------------------

C J Chaitin's books are available here:

Exploring Randomness:

https://web.archive.org/web/20110929072244/http://www.umcs.maine.edu/~chaitin/ait/index.html

The Limits of Mathematics:

https://web.archive.org/web/20110520024402/http://www.umcs.maine.edu/~chaitin/lm.html

The Unknowable:

https://web.archive.org/web/20110520024402/http://www.umcs.maine.edu/~chaitin/unknowable/index.html

A HTML version of "The Unknowable" is also included in this directory.


