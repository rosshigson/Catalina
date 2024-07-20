#include <vgraphic.h>

void g_justify(void *string_ptr, int *just_x, int *just_y) {
   int x;

   x = (strlen((char *)string_ptr)-1) * G_VAR.TEXT_XS * G_VAR.TEXT_SP + G_VAR.TEXT_XS * 5 - 1;

   switch ((G_VAR.TEXT_JUST >> 2) & 3) {
      case 0:
         *just_x = 0;
         break;
      case 1:
         *just_x = -x>>1;
         break;
      case 2:
         *just_x = -x;
         break;
      case 3:
         *just_x = 0;
         break;
   }
   switch (G_VAR.TEXT_JUST & 3) {
      case 0:
         *just_y = 0;
         break;
      case 1:
         *just_y = -G_VAR.TEXT_YS << 3;
         break;
      case 2:
         *just_y = -G_VAR.TEXT_YS << 4;
         break;
      case 3:
         *just_y = 0;
         break;
   }
}
