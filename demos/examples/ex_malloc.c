#include <hmi.h>
#include <stdlib.h>

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
   t_string(1, "Testing sbrk...\n");
   t_string(1, "Press any key to continue...\n");
   k_wait();
   i = _sbrk(10);
   t_string(1, "sbrk = ");
   t_hex(1, i);
   t_string(1, "\n");
   i = _sbrk(0);
   t_string(1, "sbrk = ");
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
      curr = (struct list_entry *)malloc (sizeof(struct list_entry));
      if (curr == 0) {
         t_string(1, "malloc failed!\n");
      }
      else {
         curr->next = list_head;
         curr->val = i;
         list_head = curr;
      }
   }
   i = _sbrk(0);
   t_string(1, "sbrk = ");
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
      curr = realloc(next, 10*sizeof(struct list_entry));
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
   i = _sbrk(0);
   t_string(1, "sbrk = ");
   t_hex(1, i);
   t_string(1, "\n");
   t_string(1, "...done\n\n");

   t_string(1, "Testing free...\n");
   t_string(1, "Press any key to continue...\n");
   k_wait();
   curr = list_head;
   while (curr != 0) {
      next = curr->next;
      free(curr);
      curr = next;
   }      
   i = _sbrk(0);
   t_string(1, "sbrk = ");
   t_hex(1, i);
   t_string(1, "\n");
   t_string(1, "...done\n\n");

   t_string(1, "Testing calloc...\n");
   t_string(1, "Press any key to continue...\n");
   k_wait();
   c = calloc(10, 200);
   if (c == 0) {
      t_string(1, "calloc failed!\n");
   }
   i = _sbrk(0);
   t_string(1, "sbrk = ");
   t_hex(1, i);
   t_string(1, "\n");
   t_string(1, "...done\n\n");
   
   t_string(1, "Goodbye (from Catalina!)\n");
   t_string(1, "Press any key to exit ...\n");
   k_wait();

   return 0;
}
