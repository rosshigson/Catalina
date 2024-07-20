#include <graphics.h>

extern int _cgi_cog;

// Draw a solid triangle
//
void g_tri(int x1, int y1, int x2, int y2, int x3, int y3) {
   // reorder vertices by descending y
   int x0, y0;
  
   switch (((y1 >= y2)?0x04:0x00) 
         | ((y2 >= y3)?0x02:0x00) 
         | ((y1 >= y3)?0x01:0x00)) {
     case 0x00:
        x0 = x1; y0 = y1; // longmove(@x0, @x1, 2)
        x1 = x3; y1 = y3; // longmove(@x1, @x3, 2)
        x3 = x0; y3 = y0; // longmove(@x3, @xy, 2)
        break;
        
     case 0x02:
        x0 = x1; y0 = y1; // longmove(@x0, @x1, 2)
        x1 = x2; y1 = y2; // longmove(@x1, @x2, 4)
        x3 = x0; y3 = y0; // longmove(@x3, @xy, 2)
        break;

     case 0x03:
        x0 = x1; y0 = y1; // longmove(@x0, @x1, 2)
        x1 = x2; y1 = y2; // longmove(@x1, @x2, 2)
        x2 = x0; y2 = y0; // longmove(@x2, @x0, 2)
        break;
     case 0x04:
        x0 = x3; y0 = y3; // longmove(@x0, @x3, 2)
        x2 = x1; y2 = y1; // longmove(@x2, @x1, 4)
        x1 = x0; y1 = y0; // longmove(@x1, @x0, 2)
        break;
     case 0x05:
        x0 = x2; y0 = y2; // longmove(@x0, @x2, 2)
        x2 = x3; y2 = y3; // longmove(@x2, @x3, 2)
        x3 = x0; y3 = y0; // longmove(@x3, @x0, 2)
        break;
   }
   // draw triangle

   g_fill(x1, y1, 
          ((x3 - x1) << 16) / (y1 - y3 + 1), 
          ((x2 - x1) << 16) / (y1 - y2 + 1), 
          ((x3 - x2) << 16) / (y2 - y3 + 1), 
          y1 - y2, 
          y1 - y3);
}
