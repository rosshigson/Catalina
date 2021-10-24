#include "ptoc.h"

/*$N+*/
/*#include "crt.h"*/

const double sigma = 0.5/*km*/;
const double r1 = 5/*km*/;
typedef array<1,100,double> mas1;
typedef array<0,8,integer> mas2;
typedef array<0,8,string> mas3;
typedef array<0,8,double> mas4;
typedef array<0,8,double> mas5;
mas1 xb,yb;
mas2 npoint,nk;
mas3 filepath;
mas4 inp_;
mas5 xel,yel,pk;
integer ngr;
double mk;
/*----------------------------------------------------------------------*/
void init()
{
         filepath[1]="random.txt";
         filepath[2]="coord.txt";
         filepath[3]="war2.txt";
         filepath[4]="xy2.txt";
         ngr=2;
}  /*init*/
/*-----------------------------------------------------------------------*/
void make( integer i1 , integer k1)
{
  if (i1==1) 
    {
      xb[k1]=sigma*inp_[2];
      yb[k1]=sigma*inp_[3];
    }
  if (i1==2) 
    {
      xel[k1]=inp_[2];
      yel[k1]=inp_[3];
    }
}  /*make*/
/*----------------------------------------------------------------------*/
void calcul1()
{
    integer i,j,k,delta;
    double r;

   for( i=0; i <= npoint[2]; i ++) nk[i]=0;
   for( i=1; i <= npoint[1]; i ++)
      {
        delta=0;
        for( j=1; j <= npoint[2]; j ++)
          {
            r=sqrt(sqr(xb[i]-xel[j])+sqr(yb[i]-yel[j]));
            if (r<r1) 
               delta=delta+1;
          }
        nk[delta]=nk[delta]+1;
      }
   mk=0;
   for( k=1; k <= npoint[2]; k ++) mk=mk+k*nk[k];
   mk=mk/npoint[1];
   for( i=0; i <= npoint[2]; i ++) pk[i]=0;
   for( i=0; i <= npoint[2]; i ++)
     {
       for( j=i; j <= npoint[2]; j ++)
          pk[i]=pk[i]+nk[j];
       pk[i]=pk[i]/npoint[1];
     }
}  /*calcul1*/
/*------------------------------------------------------------------------*/
void main1()
{
     text fil;
     integer num2;
     integer i,j,k;

  for( i= 1; i <= ngr; i ++)
    {
      assign(fil,filepath[i]);
      reset(fil);
      fil >> npoint[i] >> num2;
      for( k=1; k <= npoint[i]; k ++)
        {
          for( j=1; j <= num2; j ++)
            fil >> inp_[j];
          make(i,k);
        }
      close(fil);
    }
  for( i=1; i <= ngr; i ++) calcul1();
}  /*main*/
/*-----------------------------------------------------------------------*/
void mail()
{
     text fil;
     integer k;

      assign(fil,filepath[3]);
      rewrite(fil);
  fil << "                 Task 2.1 , 2.2 :"  << NL;
  fil << NL;
  fil << "     <K> =  " << format(mk,12,7) << NL;
  fil << NL;
  fil << "    K          N(k)          P(i >= k) " << NL;
  fil << NL;
  for( k=0; k <= npoint[2]; k ++)
  fil << "    " << k << "          " << nk[k] << "          " << format(pk[k],12,7) << NL;
  fil << NL;
      close(fil);
      assign(fil,filepath[4]);
      rewrite(fil);
  fil << "     Xb                         Yb " << NL;
  for( k=1; k <= npoint[1]; k ++)
    fil << "  " << format(xb[k],12,7) << "               " << format(yb[k],12,7) << NL;
      close(fil);
}  /*mail*/
/*-----------------------------------------------------------------------*/
int main(int argc, const char* argv[])
{
  pio_initialize(argc, argv);
  init();
  main1();
  mail();
  return EXIT_SUCCESS;
}
