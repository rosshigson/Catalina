#include <serial8.h>

void s_decl(unsigned port, int value, int digits, int flag) {
   int i = 1000000000;
   int j;
   int result = 0;

   //  digits := 1 #> digits <# 10
   //  if value < 0
   //    -value
   //    tx(port,"-")
   //
   //  i := 1_000_000_000
   //  if flag & 3
   //    if digits < 10                                ' less than 10 digits?
   //      repeat (10 - digits)                        '   yes, adjust divisor
   //        i /= 10
   //
   //  repeat digits
   //    if value => i
   //      tx(port,value / i + "0")
   //      value //= i
   //      result~~
   //    elseif (i == 1) OR result OR (flag & 2)
   //      tx(port,"0")
   //    elseif flag & 1
   //      tx(port," ")
   //    i /= 10
   //
   if (digits < 1) {
      digits = 1;
   }
   if (digits > 10) {
      digits = 10;
   }
   if (value < 0) {
      value = -value;
      s_tx(port, '-');
   }
   if (flag & 3) {
       for (j = 10-digits; j > 0; j--) {
         i /= 10; //  adjust divisor
       }
   }
   
   for (j = 0; j < digits; j++) {
     if (value >= i) {
       s_tx(port, value / i + '0');
       value %= i;
       result = -1;
     }
     else if ((i == 1) || result || (flag & 2)) {
       s_tx(port,'0');
     }
     else if (flag & 1) {
       s_tx(port,' ');
     }
     i /= 10;
   }
}
