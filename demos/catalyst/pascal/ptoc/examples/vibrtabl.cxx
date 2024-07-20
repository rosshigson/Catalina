#include "ptoc.h"

/*$N+*/
/*#include "crt.h"*/
#include "graph.h"

const double eps = 1e-8/*cm/s*/;
const double del = 1e-5/*cm*/;
const double alp = 0.975;
const double height = 8/*cm*/;
const double g = 980/*cm/s^2*/;
const double d = 0.1/*cm*/;
const double w = 200/*s-1*/;
const double a = -0.2/*cm*/;
const integer n = 69;
const longint nimpact = 500000;
typedef array<1,100,double> mas1;
typedef array<1,100,integer> mas2;
mas1 xn,vn,addxn,addvn2;
mas1 xnav,vn2av;
double t,delta01,delta;
mas2 ygr1,ygr2,ygr3,ygr4;
integer k,rad;
longint l;
integer maxx,maxy,ygrp1,ygrp2;
string title1;
pointer ps0,ps1,pc0,pc1;
   /*---------------------------------------------------------------------*/
double x0(double t)
{
   double x0_result;
   x0_result=a*sin(w*t);
   return x0_result;
}

double v0(double t)
{
   double v0_result;
   v0_result=a*w*cos(w*t);
   return v0_result;
}
/*---------------------------------------------------------------------*/
void init()
{
   integer i;

   title1="  n     <Xn>    <Vn^2>     Vn      Xn";
   t=0;
   for( i=1; i <= n; i ++)
   {
      xn[i]=d/2+2*del+2*(d/2+2*del)*(i-1);
      vn[i]=0;
      addxn[i]=0;
      addvn2[i]=0;
   }
}
   /*-----------------------------------------------------------------*/
void initgr()
{
   integer gd,gm;
   integer error;

   gd=detect;
   initgraph(gd,gm,"D:\\BP\\BGI");
   error=graphresult();
   if (error!=grok) 
   {
      output << grapherrormsg(error) << NL;
      input >> NL;
      exit(0);
   }
   cleardevice();
   setbkcolor(blue);
}  /*initgr*/
   /*-------------------------------------------------------------------*/
void newton(double tt1, double& t2)
{
   double f,derf;
   integer p;

   for( p=1; p <= 10; p ++)
   {
      f=-x0(t+tt1)+xn[1]+vn[1]*tt1-g*sqr(tt1)/2-d/2;
      derf=-v0(t+tt1)+vn[1]-g*tt1;
      tt1=tt1-f/derf;
   }
   t2=tt1;
}  /*newton*/
   /*--------------------------------------------------------------------*/
void predict1()
{
   double tf,t1,dt;
   double dx0,dx0init;

   t1=0;
   dx0init=-x0(t)+xn[1]-d/2;
   dt=(real)(1)/(1000*w);
   do {
   {
      do {
         t1=t1+dt;
         dx0=-x0(t+t1)+xn[1]+vn[1]*t1-g*sqr(t1)/2-d/2;
      } while (!(dx0<0));
      newton(t1,delta01);
   }
   } while (!(delta01>0));
}  /*predict1*/
   /*---------------------------------------------------------------------*/
void change()
{
   double vnold;

   if (k==0) 
   {
      vn[1]=-alp*vn[1]+2*v0(t);
      xn[1]=x0(t)+d/2+del;
   }
   else
   {
      vnold=vn[k+1];
      vn[k+1]=(real)(-1)/2*((alp-1)*vn[k+1]+vn[k]*(-1-alp));
      vn[k]=(real)(1)/2*((alp+1)*vnold+vn[k]*(1-alp));
   }
}  /*change*/
   /*---------------------------------------------------------------------*/
void re_count()
{
   integer i;

   if (delta>0) 
   {
      for( i=1; i <= n; i ++)
      {
         xn[i]=xn[i]+vn[i]*delta-g*sqr(delta)/2;
         vn[i]=vn[i]-g*delta;
      }
      for( i=2; i <= n; i ++)
      {
         if (xn[i]<(xn[i-1]+d))  xn[i]=xn[i-1]+d+del;
      }
      t=t+delta;
      change();
      if ((k==1) || (k==0)) 
         predict1();
      else
         delta01=abs(delta01-delta);
   }
}  /*re-count*/
   /*---------------------------------------------------------------------*/
void predict()
{
   double delta1;
   integer i;

   delta=1e25;
   for( i=1; i <= n-1; i ++)
   {
      if (vn[i]!=vn[i+1]) 
         delta1=(abs(xn[i+1]-xn[i]-d))/(vn[i]-vn[i+1]);
      else
         delta1=1e25;
      if ((delta1>0) && (delta1<delta)) 
      {
         delta=delta1;
         k=i;
      }
   }
   if ((k>0) && (abs(vn[k+1]-vn[k])<eps) && (abs(xn[k+1]-xn[k]-d)<del/10)) 
   {
      vn[k+1]=vn[k];
      delta=0;
   }
   if (delta>delta01) 
   {
      delta=delta01;
      k=0;
   }
}  /*predict*/
   /*----------------------------------------------------------------*/
void mean()
{
   integer i;

   for( i=1; i <= n; i ++)
   {
      addxn[i]=addxn[i]+xn[i]*delta;
      addvn2[i]=addvn2[i]+sqr(vn[i])*delta;
      xnav[i]=addxn[i]/t;
      vn2av[i]=addvn2[i]/t;
   }
}   /*mean*/
   /*-----------------------------------------------------------------*/
void drawax()
{
   integer i,j;
   integer size;
   string s1;

   setcolor(white);
   maxx=getmaxx();
   maxy=getmaxy();
   size=imagesize(maxx-220,maxy-50,maxx-130,maxy-40);
   getmem(ps0,size);
   getimage(maxx-220,maxy-50,maxx-130,maxy-40,ps0);
   setlinestyle(solidln,0xaaa,normwidth);
   rectangle(6,6,maxx-6,maxy-6);
   rectangle(3,3,maxx-3,maxy-3);
   settextstyle(defaultfont,horizdir,1);
   line(maxx-120,50,maxx-120,maxy-50);
   line(maxx-220,maxy-50,maxx-20,maxy-50);
   for( j=0; j <= 10; j ++)
      line(maxx-112,round((real)((maxy-100)*j)/10)+50,maxx-128,round((real)((maxy-100)*j)/10)+50);
   for( j=1; j <= 20; j ++)
      line(round(10*j)+maxx-220,maxy-50,round(10*j)+maxx-230,maxy-40);
   str(height,8,s1);
   s1=string("H=")+s1+" cm";
   settextstyle(defaultfont,vertdir,1);
   outtextxy(maxx-95,50,s1);
   settextstyle(defaultfont,horizdir,1);
   ygrp1=maxy-50;
   getmem(ps1,size);
   getimage(maxx-220,maxy-50,maxx-130,maxy-40,ps1);

   rad=round(d/(2*height)*(maxy-100));
   size=imagesize(maxx-200-rad,maxy-100-rad,maxx-200+rad,maxy-100+rad);
   getmem(pc0,size);
   getimage(maxx-200-rad,maxy-100-rad,maxx-200+rad,maxy-100+rad,pc0);
   setcolor(red);
   setfillstyle(1,12);
   fillellipse(maxx-200,maxy-100,rad,rad);
   getmem(pc1,size);
   getimage(maxx-200-rad,maxy-100-rad,maxx-200+rad,maxy-100+rad,pc1);
   putimage(maxx-200-rad,maxy-100-rad,pc0,0);
   for( i=1; i <= n; i ++)
   {
      ygr1[i]=round(maxy-50-(maxy-100)*xn[i]/height-rad);
      ygr2[i]=round(maxy-50-(maxy-100)*xn[i]/height-rad);
      putimage(maxx-180,ygr1[i],pc1,0);
      putimage(maxx-70,ygr2[i],pc1,0);
   }
}  /*drawax*/
   /*--------------------------------------------------------------------*/
void table( longint k1)
{
   integer i,j;
   string s,s1,s2;

   setlinestyle(solidln,0xaaa,normwidth);
   setfillstyle(1,1);
   setcolor(15);
   if (n>30)  j=30; else j=n;
   bar3d(30,25,385,25+12*(j+3)+10,10,topon);
   str(k1,s);
   s=string("Collision number = ")+s;
   str(t,12,5,s1);
   outtextxy(40,30,s);
   str(k,3,s2);
   s=string("Time=")+s1+"s   K = "+s2;
   outtextxy(40,42,s);
   outtextxy(40,54,title1);
   for( i=1; i <= j; i ++)
   {
      str(i,3,s);
      str(xnav[i],8,5,s1);
      str(vn2av[i],8,3,s2);
      s=s+' '+s1+"  "+s2;
      str(vn[i],8,3,s1);
      str(xn[i],8,5,s2);
      s=s+' '+s1+"  "+s2;
      outtextxy(40,54+(i)*12,s);
   }
}   /*table*/
   /*----------------------------------------------------------------*/
void drawgr()
{
   integer j,i;
   string s,s1,s2;

   setlinestyle(solidln,0xaaa,normwidth);
   setfillstyle(1,1);
   setcolor(15);
   for( i=1; i <= n; i ++)
   {
      if (abs(xnav[i])<(1.1*height)) 
      {
         ygr3[i]=round(maxy-50-(maxy-100)*xn[i]/height-rad);
         ygr4[i]=round(maxy-50-(maxy-100)*xnav[i]/height-rad);
      }
      if (ygr3[i]!=ygr1[i]) 
      {
         putimage(maxx-180,ygr1[i],pc0,0);
         putimage(maxx-180,ygr3[i],pc1,0);
         ygr1[i]=ygr3[i];
      }
   }
   for( i=1; i <= n; i ++)
   {
      if (ygr4[i]!=ygr2[i]) 
      {
         putimage(maxx-70,ygr2[i],pc0,0);
         putimage(maxx-70,ygr4[i],pc1,0);
         ygr2[i]=ygr4[i];
      }
   }
   ygrp2=round(maxy-50-(maxy-100)*x0(t)/height);
   if (ygrp2!=ygrp1) 
   {
      putimage(maxx-220,ygrp1,ps0,0);
      putimage(maxx-220,ygrp2,ps1,0);
      ygrp1=ygrp2;
   }
}   /*drawgr*/
   /*----------------------------------------------------------------*/
int main(int argc, const char* argv[])
{
   pio_initialize(argc, argv);
   init();
   initgr();
   drawax();
   predict1();
   l=1;
   do {
   {
      predict();
      re_count();
      mean();
      if (l % longint(2) ==0) 
         drawgr();
      if (l % longint(1000) ==0) 
         table(l);
      l=l+longint(1);
   }
   } while (!keypressed());
   closegraph();
   return EXIT_SUCCESS;
}
