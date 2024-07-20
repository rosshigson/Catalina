/*
 * a program to help debug argument processing - displays the command-line
 * arguments as C sees them, then as they are represented in Hub RAM in
 * the ARGC and ARGV Hub locations. Suitable for Propeller 1 or Propeller 2.
 *
 * Compile with a command like:
 *
 *   catalina arg.c -lci -C C3 -C TTY
 * or
 *   catalina arg.c -p2 -lci -C P2_EDGE -C TTY
 *
 * Optionally add -D DISPLAY_REGISTRY to display the registry. For example:
 *
 *   catalina -arg.c -lci -C C3 -C COMPACT -C HIRES_VGA -D DISPLAY_REGISTRY
 *
 */


#ifdef __CATALINA_P2
// see target\p2\argument.inc
#define FREE_MEM  0x7BFFC
#define ARGV_0    0x7BE10
#define ARGC_ADDR 0x7BE08
#define ARGC_TYPE  unsigned long
#else
// see target\p1\Catalina_Common.spin
#define FREE_MEM  0x7FFC
#define ARGV_0    0x7E70
#define ARGC_ADDR 0x7E6C
#define ARGC_TYPE  unsigned short
#endif

#define MAX_ARGS 24

#include <hmi.h>
#include <plugin.h>

#ifdef DISPLAY_REGISTRY
/*
 * display_registry - decode and display the registry
 */
void display_registry(void) {
   int i;
   unsigned long  *a_ptr;
   
   i = 0;
   while (i < COG_MAX) {
      printf("Registry Entry %2d: ", i);
      // display plugin type
      printf("%3d ", (REGISTERED_TYPE(i)));
      // display plugin name
      printf("%-24.24s ", _plugin_name(REGISTERED_TYPE(i))); 
      // display pointer to the request block
      printf("$%05x: ", (REQUEST_BLOCK(i)));
      a_ptr = (unsigned long *)(REQUEST_BLOCK(i));   
      // first  Request_Block long                       
      printf("$%08x ", *(a_ptr +0));     
      // second Request_Block long                          
      printf("$%08x ", *(a_ptr +1));     
      printf("\n");
      i++;
   };
   printf("\n");
}
#endif

// wait for a keypress
void press_key_to_continue() {
   t_printf("Press a key to continue\n");
   k_wait();
}

#ifdef __CATALINA_LARGE
// The Propeller 1 XXM Kernel cannot read above 0x7FF0 when a LARGE
// program is executing from FLASH, so we do this instead to read
// areas like the FREE_MEM pointer using ordinary PASM ...
unsigned long ReadHub(unsigned long addr) {
  return PASM(" rdlong r0, r2\n");
}
#endif

void main(int argc, char *argv[]) {
   int i, j;
   unsigned long free;

#ifdef DISPLAY_REGISTRY
   display_registry();
   press_key_to_continue();
#endif

   // print FREE_MEM address and FREE_MEM pointer
   t_printf("FREE_MEM = %X\n", FREE_MEM);
#ifdef __CATALINA_LARGE
   // The Propeller 1 XXM Kernel cannot read above 0x7FF0 
   // when a LARGE program is executing from FLASH ...
   free = ReadHub(FREE_MEM);
#else
   // In all other cases we can read all Hub RAM directly ...
   free = *(unsigned long *)FREE_MEM;
#endif
   t_printf("*FREE_MEM = %X\n", free);
   t_printf("Press a key to continue\n");
   k_wait();

   // print C argc and argv ...
   t_printf("argc = %d\n", argc);
   press_key_to_continue();

   if (argc > 24) {
      // just in case argc is not correctly set
      argc = 24;
   }
   for (i = 0; i < argc; i++) {
      t_printf("argv[%d] = '%s'\n", i, argv[i]);
   }
   press_key_to_continue();

   // print Hub RAM ARGC and all the ARGV entries
   t_printf("ARGC     = %X\n", *((ARGC_TYPE *)ARGC_ADDR));
   for (i = 0; i < MAX_ARGS; i += 4) {
      t_printf("ARGV[%d] = %X ", i,   *(((unsigned long *)ARGV_0)+i));
      t_printf("ARGV[%d] = %X ", i+1, *(((unsigned long *)ARGV_0)+i+1));
      t_printf("ARGV[%d] = %X ", i+2, *(((unsigned long *)ARGV_0)+i+2));
      t_printf("ARGV[%d] = %X\n", i+3, *(((unsigned long *)ARGV_0)+i+3));
   }
   press_key_to_continue();

   // print memory from FREE_MEM pointer (if valid)
   // this should be the last memory block allocated
   if (free != 0) {
      t_printf("MEMORY %X:\n", free);
      for (i = 0; i < 48; i += 8) {
         for (j = 0; j < 8; j++) {
            t_printf("%X ",  *((unsigned long *)free + i + j));
         }
         t_char(1, '\n');
      }
      press_key_to_continue();
   }
}

