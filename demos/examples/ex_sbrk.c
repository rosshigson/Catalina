#include <prop.h>
#include <hmi.h>
#include <stdlib.h>


struct list_entry {
   struct list_entry *next;
   int val;
};

int main (void) {
   int i;
   struct list_entry *list_head = NULL;
   struct list_entry *temp = NULL;
   t_string(1, "Hello, world (from Catalina!)\n");
   i = _sbrk(10);
   t_string(1, "sbrk = ");
   t_hex(1, i);
   t_string(1, "\n");
   i = _sbrk(0);
   t_string(1, "sbrk = ");
   t_hex(1, i);
   t_string(1, "\n");

   t_string(1, "size = ");
   t_integer(1, sizeof(struct list_entry));
   t_string(1, "\n");

   for (i = 0; i < 10; i++) {
      temp = (struct list_entry *)malloc (sizeof(struct list_entry));
      if (temp == 0) {
         t_string(1, "malloc failed!\n");
      }
      else {
         temp->next = list_head;
         temp->val = i;
         list_head = temp;
      }
   }

   i = _sbrk(0);
   t_string(1, "sbrk = ");
   t_hex(1, i);
   t_string(1, "\n");

   temp = list_head;
   while (temp != 0) {
      t_string(1, "(addr = ");
      t_hex(1, (unsigned)temp);
      t_string(1, ", val = ");
      t_integer(1, temp->val);
      t_string(1, ")  ");
      temp = temp-> next;
   }      
   t_string(1, "Goodbye (from Catalina!)\n");
   t_string(1, "Press any key to exit ...\n");
   k_wait();

   return 0;
}
