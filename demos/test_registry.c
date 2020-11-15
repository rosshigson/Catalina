#include <catalina_hmi.h>
#include <catalina_plugin.h>

int main(void) {
   unsigned long r;
   int i;
   int c = _cogid();

   r = _registry();
   t_printf("registry = %x\n", r);

   i = _locate_plugin(LMM_HMI);
   t_printf("HMI cog = %d\n", i);
   i = _request_status(i);
   t_printf("HMI request status = %d\n", i);
   i = _locate_plugin(LMM_FLA);
   t_printf("FLA cog = %d\n", i);
   t_printf("my cog id = %d\n", c);
   i = _locate_plugin(LMM_VMM);
   t_printf("VMM cog = %d\n", i);
   t_printf("registering ...\n");
   _register_plugin(c, LMM_VMM);
   i = _locate_plugin(LMM_VMM);
   t_printf("VMM cog = %d\n", i);
   t_printf("unregistering ...\n");
   _unregister_plugin(c);
   i = _locate_plugin(LMM_VMM);
   t_printf("VMM cog = %d\n", i);

   t_string(1, "Press any key to exit ...\n");
   k_wait();

   return 0;
}

