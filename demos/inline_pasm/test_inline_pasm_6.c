/*****************************************************************************
 *                                                                           *
 *            Using the Catalina Optimizer with Inline PASM                  *
 *                                                                           *
 * In general, the Catalina Optimizer can be used with Inline PASM. However, *
 * there are some circumstances when the Optimizer will remove code that     *
 * appears to be unused by the C code, but which is required by the PASM.    *
 * This program demonstrates one technique for "forcing" the Catalina        *
 * Optimizer to include Inline PASM even when it thinks the function with    *
 * the it is not used. It also demonstrates how the inability for            *
 * the _PASM macro to access local variables is not really a problem when    *
 * the Catalina Optimizer is used.                                           *
 *                                                                           *
 * This program will work in TINY or NATIVE mode on a Propeller 1 or 2.      *
 * Note that while the same technique can be used, this example will not     *
 * compile correctly in COMPACT mode because COMPACT mode uses a different   *
 * PASM format. See the "compact.inc" file in the target directory for more  *
 * details on COMPACT PASM.                                                  * 
 *                                                                           *
 * Compile this program with the Optimizer using a command like:             *
 *                                                                           *
 *   catalina -lci -C TTY -C C3 test_inline_pasm_6.c -O5                     *
 *                                                                           *
 * Remove or comment out the line "dummy_t dummy = abc;" to see the effect   *
 * this line has.                                                            *
 *                                                                           *
 *****************************************************************************/

#include <prop.h>
#include <stdio.h>

// make sure we are compiled using the correct model for our PASM code
#ifdef __CATALINA_COMPACT
#error "This program will not work in COMPACT mode"
#endif

// this function exists only to define storage for 
// long abc - it cannot actually be called from C ...
void abc(void) {
  PASM(
     "abc long 12345\n");
}

// this function reads and returns the value of abc - it
// works for both NATIVE and TINY programs ...
int read_abc() {
   return PASM(
     "#ifdef NATIVE\n"      // propeller 2 NATIVE PASM
     " rdlong r0, ##@abc\n"
     "#else\n"              // propeller 1 or 2 TINY PASM
     " jmp #LODL\n"
     " long @abc\n"
     " rdlong r0, RI\n"
     "#endif\n"
   );
}

// this type allows us to create a reference to function abc ...
typedef void (*dummy_t)(void);

// this function simply sums its arguments using PASM ...
int sum(int a, int b, int c, int d) {
  return PASM(
    " mov r0, _PASM(a)\n"
    " add r0, _PASM(b)\n"
    " add r0, _PASM(c)\n"
    " add r0, _PASM(d)\n"
   );
}

// variables declared at file scope are global, and 
// can be referenced using the _PASM() macro ...
static value;

// this function uses the _PASM() macro to refer to value ...
void add_to_value(int a) {
   PASM(
    "#ifdef NATIVE\n"             // propeller 2 NATIVE PASM
    " rdlong r0, ##@_PASM(value)\n"
    " add r0, _PASM(a)\n"
    " wrlong r0, ##@_PASM(value)\n"
    "#else\n"                     // propeller 1 or 2 TINY PASM
    " jmp #LODL\n"
    " long @_PASM(value)\n"
    " rdlong r0, RI\n"
    " add r0, _PASM(a)\n"
    " wrlong r0, RI\n"
    "#endif\n"
   );
}

void main() {
   int a = 1;
   int b = 2;
   int c = 3;
   int d = 4;
   int total;

   // without the following line, the function abc would be 
   // removed by the Catalina Optimizer, because it looks 
   // like it is unused by the C program (it is used, but
   // only from within the inline PASM in read_abc) ...
   dummy_t dummy = abc;

   printf("abc = %d\n",   read_abc());

   // the following code will NOT work because the _PASM
   // macro cannot be used on local identifiers ...
   /*
   total = PASM(
    " mov r0, _PASM(a)\n"
    " add r0, _PASM(b)\n"
    " add r0, _PASM(c)\n"
    " add r0, _PASM(d)\n"
   );
   */

   // however, the following code WILL work - and the 
   // overhead of the function call will be eliminated
   // by using the Catalina optimizer ...
   total = sum(a, b, c, d);
   printf("total = %d\n", total);

   value = 11;
   add_to_value(22);
   printf("value = %d\n", value);
   while (1);
}

