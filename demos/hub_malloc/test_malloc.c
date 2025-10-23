/******************************************************************************
 *         A simnple program to test malloc and related functions.            *
 *                                                                            *
 * This program will use the standard malloc functions defined in stdlib      *
 * unless the Catalina symbol HUB_MALLOC is defined, If so, it will use       *
 * an alternate set of hub malloc functions. The differences between the      *
 * two sets of functions is only very evident when the program is compiled    *
 * in XMM LARGE mode.                                                         *
 *                                                                            *
 * To use the standard malloc functions, compile this program with a command  *
 * like:                                                                      *
 *   catalina test_malloc.c -lc                                               *
 * or                                                                         *
 *   catalina -p2 test_malloc.c -lc                                           *
 *                                                                            *
 * To use the hub malloc functions, compile it with a command like:           *
 *   catalina test_malloc.c -lc -C HUB_MALLOC                                 *
 * or                                                                         *
 *   catalina -p2 test_malloc.c -lc -C HUB_MALLOC                             *
 *                                                                            *
 *                                                                            *
 ******************************************************************************/

#include <stdlib.h>
#include <hmi.h>
#include <prop.h>

#ifdef __CATALINA_HUB_MALLOC

#include <hmalloc.h>
#define my_brk     _hbrk
#define my_malloc  hub_malloc
#define my_calloc  hub_calloc
#define my_realloc hub_realloc
#define my_free    hub_free

#else

#define my_brk     _sbrk
#define my_malloc  malloc
#define my_calloc  calloc
#define my_realloc realloc
#define my_free    free

#endif

struct list_entry {
   struct list_entry *next;
   int val;
};

int main (void) {
   int i;
   struct list_entry *list_head;
   struct list_entry *curr, *next, *last;
   void *c;

   t_string(1, "Hello, world (from Catalina!)\n");
   t_string(1, "Testing brk...\n");
   t_string(1, "Press any key to continue...\n");
   k_wait();
   i = my_brk(10);
   t_string(1, "brk = ");
   t_hex(1, i);
   t_string(1, "\n");
   i = my_brk(0);
   t_string(1, "brk = ");
   t_hex(1, i);
   t_string(1, "\n");
   t_string(1, "...done\n\n");

   t_string(1, "Testing malloc...\n");
   t_string(1, "Press any key to continue...\n");
   k_wait();
   t_string(1, "size = ");
   t_integer(1, sizeof(struct list_entry));
   t_string(1, "\n");
   for (i = 0; i < 10; i++) {
      curr = (struct list_entry *)my_malloc (sizeof(struct list_entry));
      if (curr == 0) {
         t_string(1, "malloc failed!\n");
      }
      else {
         curr->next = list_head;
         curr->val = i;
         list_head = curr;
      }
   }
   i = my_brk(0);
   t_string(1, "brk = ");
   t_hex(1, i);
   t_string(1, "\n");
   curr = list_head;
   while (curr != 0) {
      t_string(1, "(addr = ");
      t_hex(1, (unsigned)curr);
      t_string(1, ", val = ");
      t_integer(1, curr->val);
      t_string(1, ")  ");
      curr = curr-> next;
   }
   t_string(1, "...done\n\n");

   t_string(1, "Testing realloc...\n");
   t_string(1, "Press any key to continue...\n");
   k_wait();
   last = 0;
   next = list_head;
   while (next != 0) {
      curr = my_realloc(next, 10*sizeof(struct list_entry));
      if (curr == 0) {
         t_string(1, "realloc failed!\n");
      }
      if (last == 0) {
         list_head = curr;
      }
      else {
         last->next = curr;
      }
      last = curr;
      next = curr->next;
   }      
   curr = list_head;
   while (curr != 0) {
      t_string(1, "(addr = ");
      t_hex(1, (unsigned)curr);
      t_string(1, ", val = ");
      t_integer(1, curr->val);
      t_string(1, ")  ");
      curr = curr-> next;
   }
   i = my_brk(0);
   t_string(1, "brk = ");
   t_hex(1, i);
   t_string(1, "\n");
   t_string(1, "...done\n\n");

   t_string(1, "Testing free...\n");
   t_string(1, "Press any key to continue...\n");
   k_wait();
   curr = list_head;
   while (curr != 0) {
      next = curr->next;
      my_free(curr);
      curr = next;
   }      
   i = my_brk(0);
   t_string(1, "brk = ");
   t_hex(1, i);
   t_string(1, "\n");
   t_string(1, "...done\n\n");

   t_string(1, "Testing calloc...\n");
   t_string(1, "Press any key to continue...\n");
   k_wait();
   c = my_calloc(10, 200);
   if (c == 0) {
      t_string(1, "calloc failed!\n");
   }
   i = my_brk(0);
   t_string(1, "brk = ");
   t_hex(1, i);
   t_string(1, "\n");
   t_string(1, "...done\n\n");
   
   t_string(1, "Goodbye (from Catalina!)\n");
   t_string(1, "Press any key to exit ...\n");
   k_wait();

   return 0;
}
