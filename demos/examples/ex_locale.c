/*
 * Test Locale functions
 */

#include <locale.h>
#include <hmi.h>

int main(void) {
   char *my_locale;
   struct lconv *my_locale_data;

   t_string (1, "Testing Locale\n");

   t_string (1, "\nSetting Locale to \"Rubbish\"\n");
   my_locale = setlocale (LC_ALL, "Rubbish");
   t_string(1, "Result is ");
   if (my_locale == NULL) {
      t_string(1, "NULL");
   }
   else {
      t_string(1, my_locale);
   }

   t_string (1, "\nSetting Locale to \"C\"\n");
   my_locale = setlocale (LC_ALL, "C");
   t_string(1, "Result is ");
   t_string(1, my_locale);

   t_string (1, "\nSetting Locale to \"\"\n");
   my_locale = setlocale (LC_ALL, "");
   t_string(1, "Result is ");
   t_string(1, my_locale);


   my_locale_data = localeconv();
   t_string(1, "\nMy Localeconv is ");
   if (my_locale == NULL) {
      t_string(1, "NULL");
   }
   else {
      t_string(1, "NOT NULL");
      t_string(1, "\nMy Decimal Point is ");
      t_string(1, my_locale_data->decimal_point);
      t_string(1, "\n");
   }

   t_string(1, "Press any key to exit ...\n");
   k_wait();

   return 0;
}


