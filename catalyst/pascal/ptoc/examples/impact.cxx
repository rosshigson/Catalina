#include "ptoc.h"

/*$N+*/

/*#include "crt.h"*/

const double alp = 0.975;
const integer n = 12;
const double v = 10;

typedef matrix<1,50,1,50,double> mas1;
typedef array<1,50,double> mas2;
mas1 matr;
mas2 vel1,vel2;
double d,b;
integer i,j,k;
/*-------------------------------------------------------------------*/
void calc()
{
    integer i,j;

  b=(1+alp)/2;
  d=1-b;
  matr[1][1]=d;
  matr[1][2]=b;
  matr[2][1]=b;
  matr[2][2]=d;
  for( i=3; i <= n; i ++)
     {
        for( j=1; j <= i-1; j ++)
          {
             matr[i][j]=matr[i-1][j]*b;
             matr[i-1][j]=matr[i-1][j]*d;
          }
        matr[i-1][i]=b;
        matr[i][i]=d;
     }
  for( i=1; i <= n; i ++)
     matr[i][1]=matr[i][1]*(-alp);
}   /*calc*/
/*-----------------------------------------------------------------*/
void multi()
{
     integer i,j;

   for( i=1; i <= n; i ++) vel2[i]=0;
   for( i=1; i <= n; i ++)
      {
        for( j=1; j <= n; j ++)
           {
              vel2[i]=vel2[i]+matr[i][j]*vel1[j];
           }
       }
   for( i=1; i <= n; i ++) vel1[i]=vel2[i];
}   /*multi*/
/*--------------------------------------------------------------------*/
void print()
{
     integer i;

   output << NL;
   for( i=1; i <= n; i ++)
     output << "  V[" << format(i,2) << "] = " << format(vel1[i],12,7) << NL;
   input >> NL;
}  /*print*/
/*--------------------------------------------------------------------*/
int main(int argc, const char* argv[])
{
   pio_initialize(argc, argv);
   for( i=1; i <= n; i ++)  vel1[i]=-v;
   calc();
   print();
   do {
      {
         multi();
         print();
      }
   } while (!(vel1[1]>0));
   return EXIT_SUCCESS;
}



