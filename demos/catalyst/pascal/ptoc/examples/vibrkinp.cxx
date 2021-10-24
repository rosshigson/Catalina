#include "ptoc.h"


/*$N+*/
#include "graph.h"

const integer kmin = 0;
const double kev01 = 3e-8;
const double kvv01 = 1e-12;
const double kvt = 1e1;
const double tv0 = 0.15;
const double a = 0.6;
const double b = 0.005;
const double dvv = 0.36;
const double xe = 6e-3;
const double tt = 0.12;
const double n0 = 2.6e19;
const double dt = 5e-11;
const double tk = 1e-7;
const integer nn = 60;
const real ne0 = 3.3e14;
const double g = 1.0;
const double v0 = 1.3e7;
typedef array<0,60,double> mas1;
typedef matrix<0,60,0,60,double> mas3;
typedef array<0,60,integer> mas4;
mas1 n;
mas3 kev,kvv;
mas4 xgr1,ygr1,ygr2,ygr3,ygr4;
mas4 ygr5,ygr6;
double fmax,yn1,pump,ne,n1;
double t,dn,count,fe,tv;
double dfe,dcount,dpump;
double v1tr,v2tr,dv2tr,v2tr2;
integer k,i,j,m;
integer mmax,ci,tr;
string s,s1,s2,s3,s4;
text f;
   /*--------------------------------------------------------------------*/
void fkev( mas3& kev1 )
{
   integer i,j;

   for( i=0; i <= nn; i ++)
   {
      for( j=0; j <= nn; j ++)
      {
         if (i<j) 
            kev1[i][j]=kev01*exp(-a*abs(i-j))/(1+b*i);
         else
            kev1[i][j]=0;
      }
   }
}  /*kev*/
   /*---------------------------------------------------------------------*/
void fkvv(mas3& kvv1)
{
   integer i,j;

   for( i=0; i <= nn-1; i ++)
   {
      for( m=0; m <= nn-1; m ++)
         kvv1[i+1][m]=(i+1)*(m+1)*kvv01*exp(-dvv*abs(i-m))*
         ((real)(3)/2-0.5*exp(-dvv*abs(i-m)));
   }
}  /*fkvv*/
   /*---------------------------------------------------------------------*/
double nelectr( double t1)
{
   double nelectr_result;
   nelectr_result=ne0*exp(-v0*t1);
   return nelectr_result;
}
/*--------------------------------------------------------------------*/
void init()
{
   integer i;

   /*n[0]:=1.3e19;
    n[1]:=5.9e18;
    n[2]:=3e18;
    n[3]:=1.64e18;
    n[4]:=8.52e17;
    n[5]:=5.8e17;
    n[6]:=3.64e17;
    n[7]:=2.35e17; */
   for( i=0; i <= nn; i ++) n[i]=n0*(1-exp(-1/tv0))*exp(-i/tv0);
   pump=1/(exp(1/tv0)-1);
}  /*bg*/
   /*---------------------------------------------------------------------*/
void initgr()
{
   integer gm,gd,error;
   integer maxx,maxy,j;

   gd=detect;
   initgraph(gd,gm,"d:\\bp\\bgi");
   error=graphresult();
   if (error!=grok) 
   {
      output << grapherrormsg(error) << NL;
      input >> NL;
      exit(0);
   }
   setbkcolor(green);
   cleardevice();
}  /*init*/
   /*------------------------------------------------------------------*/
void draw()
{
   integer maxx,maxy,j,r,f;

   setcolor(red);
   maxx=getmaxx();
   maxy=getmaxy();
   line(50,maxy-50,maxx,maxy-50);
   line(50,maxy-50,50,0);
   fmax=0;
   for( k=kmin; k <= nn; k ++)
      if (log(n[k])>fmax)  fmax=log(n[k]);
   for( k=kmin; k <= nn; k ++)
   {
      yn1=log(n[k])/log(n0);
      xgr1[k]=round((real)((maxx-50))/(nn)*k)+50;
      ygr1[k]=-round((maxy-50)*yn1)+maxy-50;
   }
   if (nn<= 100) 
   {
      for( k=kmin; k <= nn; k ++)
         line(xgr1[k],maxy-42,xgr1[k],maxy-58);
   }
   for( j=1; j <= 10; j ++)
      line(42,round((real)((maxy-50)*j)/10),58,round((real)((maxy-50)*j)/10));
   setlinestyle(dottedln,0xaaa,normwidth);
   for( j=1; j <= 10; j ++)
      line(58,round((real)((maxy-50)*j)/10),maxx,round((real)((maxy-50)*j)/10));
   setlinestyle(solidln,0xaaa,normwidth);
   setcolor(green);
   for( k=kmin; k <= nn-1; k ++)
      line(xgr1[k],ygr2[k],xgr1[k+1],ygr2[k+1]);
   setcolor(blue);
   for( k=kmin; k <= nn-1; k ++)
   {
      line(xgr1[k],ygr1[k],xgr1[k+1],ygr1[k+1]);
      ygr2[k]=ygr1[k];
   }
   ygr2[nn]=ygr1[nn];
   setfillstyle(1,green);
   bar(200,10,600,30);
   str(pump,12,s);
   str(t,12,s3);
   s1=string("V1 =")+s+" t = "+s3;
   outtextxy(200,10,s1);
   tv=2/(log(n[0]/n[2]));
   tr=round(tt/(2*xe*tv));
   if (tr > 30)  tr = 30;
   n1=pump-v1tr;
   /*if t>(1.05)*t0 then*/
   for( k=kmin; k <= nn; k ++)
   {
      yn1=log(n[0])/log(n0)-(dvv*(k-1)+log(k+1))/log(n0);
      ygr5[k]=-round((maxy-50)*yn1)+maxy-50;
   }
   setcolor(green);
   for( k= kmin; k <= nn-1; k ++)
      line(xgr1[k],ygr6[k],xgr1[k+1],ygr6[k+1]);
   setcolor(lightblue);
   for( k=kmin; k <= nn-1; k ++)
   {
      line(xgr1[k],ygr5[k],xgr1[k+1],ygr5[k+1]);
      ygr6[k]=ygr5[k];
   }
   ygr6[nn]=ygr5[nn];

   for( k=kmin; k <= nn; k ++)
   {
      if  (k<tr) 
         yn1=log(n[0]*exp(-k/tv+xe*k*k/(tt)))/log(n0);
      else
         yn1=log(n[0]*exp(-tr/(2*tv)-(real)(1)/2)*(tr+1)/(k+1))/log(n0);
      ygr3[k]=-round((maxy-50)*yn1)+maxy-50;
   }
   setcolor(green);
   for( k=kmin; k <= nn-1; k ++)
      line(xgr1[k],ygr4[k],xgr1[k+1],ygr4[k+1]);
   setcolor(red);
   for( k=kmin; k <= nn-1; k ++)
   {
      line(xgr1[k],ygr3[k],xgr1[k+1],ygr3[k+1]);
      ygr4[k]=ygr3[k];
   }
   ygr4[nn]=ygr3[nn];
   setcolor(blue);
   v1tr=0;
   v2tr=0;
   for( k=1; k <= tr; k ++)
   {
      v1tr=v1tr+k*(n[k]/n0);
      v2tr=v2tr+k*(k-1)*(n[k]/n0);
   }
   str(v1tr,12,s4);
   str(fe,12,s3);
   str(dfe,12,s1);
   str(tv,12,s2);
   s1=string("V1Tr = ")+s4+" Tv = "+s2+" fe = "+s3+" dfe ="+s1;
   bar(20,maxy-35,maxx,maxy);
   outtextxy(20,maxy-35,s1);
   str(v2tr,12,s1);
   str(n1,12,s2);
   s1=string("V2Tr = ")+s1+" n1 = "+s2;
   outtextxy(20,maxy-20,s1);
   str(nn,s2);
   s1=string("n=")+s2;
   outtextxy(maxx-60,maxy-60,s1);
}  /*draw*/
   /*---------------------------------------------------------------------*/
void print()
{
   integer i,j;

   f << format((t*1e9),10,5) << "  " << format(fe,10,5) << "  " << format(n1,10,5) << "  " << format((log(t*1e9)),10,5);
   f << "  " << format((log(fe)),10,5) << "  " << format((log(n1)),10,5) << "  " << format((sqr(fe*100)),10,5) << NL;
}
   /*----------------------------------------------------------------------*/

int main(int argc, const char* argv[])
{
   pio_initialize(argc, argv);
   count=0;
   pump=0;
   fkev(kev);
   fkvv(kvv);
   init();
   initgr();
   assign(f,"vibrkinp.txt");
   rewrite(f);
   f << " Time          fe          n1         Ln(Time)     Ln(fe)     Ln(n1)       fe^2" << NL;
   draw();
   t=0;

   do {
      ne=nelectr(t);
      dpump=0;
      dcount=0;
      for( m=1; m <= nn; m ++)
      {
         for( k=0; k <= m; k ++)
         {
            dn=n[k]*kev[k][m]*ne*dt;
            dpump=dpump+dn*(m-k-xe*(sqr(m+(real)(1)/2)-sqr(k+(real)(1)/2)))/n0;
            n[m]=n[m]+dn;
            n[k]=n[k]-dn;
         }
      }
      for( m=0; m <= nn-1; m ++)
      {
         for( i=0; i <= nn-1; i ++)
         {
            dn=n[m]*n[i+1]*kvv[i+1][m]*dt/2;
            dcount=dcount+2*xe*dn*(m-i)/n0;
            n[m+1]=n[m+1]+dn;
            n[m]=n[m]-dn;
            n[i+1]=n[i+1]-dn;
            n[i]=n[i]+dn;

            dn=n[m+1]*n[i]*kvv[i+1][m]*exp(-2*xe*(m-i)/tt)*dt/2;
            dcount=dcount+2*xe*dn*(i-m)/n0;
            n[m+1]=n[m+1]-dn;
            n[m]=n[m]+dn;
            n[i+1]=n[i+1]+dn;
            n[i]=n[i]-dn;
         }
      }
      pump=pump+dpump;
      count=count+dcount;
      n[nn]=n[nn]-kvt*dt*n[nn];
      n[0]=n[0]+kvt*dt*n[nn];
      fe=g*count/pump;
      dfe=g*dcount/dpump;
      if ((round(t/dt) % 10)==0)  draw();
      /*if ((t=50e-9) or (t=150e-9)) then print;
       if ((round(t/dt) mod round(1e-7/dt) =0) and (t>dt)) then print;*/
      t=t+dt;
   } while (!((t > tk) || keypressed()));
   closegraph();
   close(f);
   return EXIT_SUCCESS;
}

