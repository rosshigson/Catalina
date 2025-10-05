#include <stdio.h>
#include <stdint.h>
#include <propeller.h>

#define SIZE_CHECK(type,size)\
  printf("sizeof %18s = %2d - %s\n",\
    #type,size,((sizeof(type)==size)?"ok":"wrong"))

#define ALIGN_CHECK(type,align)\
  {\
    struct s { char a; type b; } a;\
    printf("align  %18s = %2d - %s\n",\
      #type, align, ((char *)&a.b - &a.a)==align?"ok":"wrong");\
  }

enum my_enum { A = 'a', B = 'b', C = 'c', D = 'd' };

typedef enum my_enum my_enum_t;

struct my_struct {
   char a;
   short b;
   int c;
   char d;
   char e;
   float f;
}

typedef struct my_struct my_struct_type;

typedef char char_array_t[10];

typedef short short_array_t[10];

typedef int int_array_t[10];

void main(void) {
   _waitsec (1);
   SIZE_CHECK(char, 1);
   SIZE_CHECK(unsigned char, 1);
   SIZE_CHECK(wchar_t, 1);
   SIZE_CHECK(short, 2);
   SIZE_CHECK(unsigned short, 2);
   SIZE_CHECK(int, 4);
   SIZE_CHECK(unsigned int, 4);
   SIZE_CHECK(size_t, 4);
   SIZE_CHECK(long, 4);
   SIZE_CHECK(unsigned long, 4);
   SIZE_CHECK(long long, 4);
   SIZE_CHECK(unsigned long long, 4);
   SIZE_CHECK(float, 4);
   SIZE_CHECK(double, 4);
   SIZE_CHECK(long double, 4);
   SIZE_CHECK(intptr_t, 4);
   SIZE_CHECK(void *, 4);
   SIZE_CHECK(char *, 4);
   SIZE_CHECK(my_enum_t, 4);
   SIZE_CHECK(my_struct_type, 16);
   SIZE_CHECK(char_array_t, 10);
   SIZE_CHECK(short_array_t, 20);
   SIZE_CHECK(int_array_t, 40);

   ALIGN_CHECK(char, 1);
   ALIGN_CHECK(short, 2);
   ALIGN_CHECK(int, 4);
   ALIGN_CHECK(float, 4);
   ALIGN_CHECK(void *, 4);
   ALIGN_CHECK(my_enum_t, 4);

}

