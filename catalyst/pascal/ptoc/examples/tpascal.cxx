#include "ptoc.h"





string print(string s)
{
   string print_result;
   output << s << ':' << format(s+'!',10) << NL;
   print_result = s;
   return print_result;
}

typedef varying_string<10> str10;
struct struct_ {
             integer i;
             double f;
             asciiz s;
             array<1,2,boolean> a;
                    struct { real re, im; } c;
}; 
typedef array<1,3,struct_> records;
typedef array<1,5,asciiz> list;
struct complex { real re, im; };
typedef integer (*handler)(integer error);
typedef void(*callback_1)();
typedef void(*callback_2)(string s);

const complex zero = {0.0, 0.0};
const records recs = {{{1,1.0,"first record", {{true,true}}, {0.0, 0.0}},
                  {2,2.0,"second record", {{true, false}}},
                  {3,4.0,"third record"}}};
const list lst = {{"one","two","three","four","five"}};


varying_string<5> s;
str10 ss;
text f;
longint i;
longint* ip;
handler hnd; 
callback_1 cb1;
callback_2 cb2;

const double x = 0.5;
const char c = '\14';
const char crlf[] = "\r\n";
const char beep[] = "\7Beep \7\7\7!";

integer exception_handler(integer error)  
{
   integer exception_handler_result;
   output << "exception" << error << " is raised" << NL;
   exception_handler_result = error;
   return exception_handler_result;
}

void my_callback_1();

static integer foo(integer& i)
{
   integer foo_result;
   foo_result = i;
   return foo_result;
}    /* foo */

void my_callback_1() 
{
   integer i;

   i = 1998;
   output << foo(i) << NL;
}

void my_callback_2 (string msg) 
{
   output << msg << NL;
}

void raise(handler f1, callback_1 p1, callback_2 p2)
{
   hnd = f1;
   cb1 = p1;
   cb2 = p2;
   hnd(1);
   cb2("exception");
}

void dummy(void* f)
{;
}

int main(int argc, const char* argv[])
{
   pio_initialize(argc, argv);
   raise(exception_handler, my_callback_1, my_callback_2);
   dummy(&i);
   output << string(beep)+crlf;
   print("hello world");
   s = "hi";
   s[1] = lst[1][1-1];
   print(s);
   ss = string("hi") + ' ' + "everybody";
   print(ss);
   s = ss;
   ss = print(s);
   print(ss);
   assign(f, "test.txt");
   rewrite(f);
   f << "Hello world" << format(1997,5) << NL;
   close(f);
   i = i ^ ((unsigned long)i >> 2);
   ip = &i;
   *ip = 0xabcd;
   return EXIT_SUCCESS;
}






