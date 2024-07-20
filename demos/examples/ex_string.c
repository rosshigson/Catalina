#include <hmi.h>
#include <string.h>

char str3[100];

void test_1(char * str1, char *str2) {
   t_string(1, "Test 1 : ");
   strcpy(str3,str1);
   strcat(str3,str2);
   t_string(1, str3);
   t_char(1, '\n');
}

void test_2(char * str1) {
   t_string(1, "Test 2 : length of '");
   t_string(1, str1);
   t_string(1, "' = ");
   t_integer(1, strlen(str1));
   t_char(1, '\n');
}

void test_3(char * str1, char *str2) {
   int i;
   t_string(1, "Test 3 : ");
   t_string(1, str1);
   i = strcmp(str1,str2);
   if (i < 0) t_string(1," < ");
   if (i == 0) t_string(1," == ");
   if (i > 0) t_string(1," > ");
   t_string(1, str2);
   t_char(1, '\n');
}


void test_4(char * str1, char *str2) {
   int i;
   t_string(1, "Test 4 : index in '");
   t_string(1, str1);
   t_string(1, "' of '");
   t_string(1, str2);
   t_string(1, "' = ");
   if (strstr(str1,str2) == NULL) {
      i = -1;
   }
   else {
      i = strstr(str1,str2) - str1;
   }
   t_integer(1, i);
   t_char(1, '\n');
}

void test_5(char *str1) {
   char mem[50];
   memcpy(mem, str1, strlen(str1)+1);
   t_string(1, "Test 5 : ");
   t_string(1, mem);
   t_char(1, '\n');
}

int main(void) {

   char * str1 = "hello, ";
   char * str2 = "world\n";

   test_1(str1, str2);
   test_2("now is the time for all good men to come to the aid of the party");
   test_3("boo", "hoo");
   test_3("boo", "boo");
   test_4("needle in a haystack", "hay");
   test_5("qwertyuiop");

   t_string(1, "Press any key to exit ...\n");
   k_wait();
   
   return 0;
}
