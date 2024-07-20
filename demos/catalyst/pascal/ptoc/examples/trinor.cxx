#include "ptoc.h"


/*#include "crt.h"*/

const real t0 = 0.12;
const real xe = 0.006;
const integer e1 = 16;
const real a = 0.8;
const real alf = 0.7;
const real g = 1.4;
const integer jk = 5000;
typedef array<0,20,real> mas1;
integer i,n,e2;
mas1 f,fb;
real tr,c,fe,tv;
real tv1,tv2,tvt;
real v0,v0b,tvb1;
real e;
real v1,v2,v1b,v2b;
boolean flag;
void momtr(real tvr , real& v1tr , real& v2tr )
{
    integer n;
    real v0tr;

  v0tr=0; v1tr=0; v2tr=0;
  tr=t0/(2*xe*tvr);
  e2=round(tr);
  for( n=0; n <= e1; n ++)
   f[n]=exp(-n/tvr+n*(n-1)/(2*tvr*tr));
  for( n=0; n <= e1; n ++)
   {
    if (n<=e2) 
     {
       v0tr=v0tr+f[n];
       v1tr=v1tr+n*f[n];
       v2tr=v2tr+n*(n-1)*f[n];
     }
    else
     {
       v0tr=v0tr+f[e2]/(n)*e2;
       v1tr=v1tr+n*f[e2]/(n)*e2;
       v2tr=v2tr+n*(n-1)*f[e2]/(n)*e2;
     }
   }
  v1tr=v1tr/v0tr;
  v2tr=v2tr/v0tr;
}  /*momtr*/
void momb(real tvb ,real tvbb1, real& v1b1 , real& v2b1 )
{
    integer i;
    real v0b1;

  v0b1=0; v1b1=0; v2b1=0;
  fb[0]=1;
  fb[1]=exp(-1/tvbb1);
  for( n=2; n <= e1; n ++)
   {
    fb[n]=fb[n-1]*exp(-1/tvb);
   }
  for( n=0; n <= e1; n ++)
     {
       v0b1=v0b1+fb[n];
       v1b1=v1b1+n*fb[n];
       v2b1=v2b1+n*(n-1)*fb[n];
     }
  v1b1=v1b1/v0b1;
  v2b1=v2b1/v0b1;
}  /*momb*/
/*-------------------------------------------------------------------*/
void find(real ee)
{
 flag=true;
 momb(alf,alf,v1b,v2b);
 if (ee<=v1b) 
   {
     flag=false;
     tv1=alf;
     tv2=0;
     do {
       tvb1=(tv1+tv2)/2;
       momb(alf,tvb1,v1b,v2b);
        if (v1b>ee) 
          tv1=tvb1;
        else
          tv2=tvb1;
     } while (!(abs(v1b-ee)<(ee/jk)));
   }
   else
     {
       tvb1=alf;
       momb(alf,tvb1,v1b,v2b);
     }
    tv1=5*ee;
    tv2=0;
    do {
     tvt=(tv1+tv2)/2;
     momtr(tvt,v1,v2);
       if (v1>ee) 
         tv1=tvt;
        else
         tv2=tvt;
     } while (!(abs(v1-ee)<(ee/jk)));
}  /*find*/
/*-----------------------------------------------------------------*/
int main(int argc, const char* argv[])
{
 pio_initialize(argc, argv);
 output << " Input E = [0..3] ";
 input >> e >> NL;
 do {
     find(e);
     if (flag== true)  fe=a*xe*(v2-v2b)/(g*e);
       else fe=a*xe*(v2-v2b)/e;
     output << "   V1tr = " << format(v1,3,7) << "  V2tr = " << format(v2,3,7) << "  Ttr = " << format(tr,3,7) << NL;
     output << "   V1b = " << format(v1b,2,7) << "  V2b = " << format(v2b,2,7) << "  Tv1 = " << format(tvb1,3,7) << NL;
     output << "   Fe = " << format((fe*100),2,7) << " %." << NL;
   output << " Input E = ";
   input >> e >> NL;
 } while (!(e==0));
 return EXIT_SUCCESS;
}


