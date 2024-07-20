#
# Phase 0
#
# AWK script to optimize loads
#
/^'/ {
   print
   next
}
/^{/ {
   print
   getline
   while (left($0,1) != "}") {
      print
      getline
   }
   print
   next
}
/[ \t]+word[ \t]+I16B_LODL/ {
   line1 = $0
   dst = $4
   if (dst == "(") {
      dst = $5
   }
   dst = ltrim(dst,"(")
   dst = left(dst,3)
   dst = rtrim(dst,")<")
   getline; while ($1 == "alignl") { getline }
   if ($1 == "long") {
      if ((left($2,1) >= "0") && (left($2,1) <= "9")) {
         val = 0 + $2
         if ((val >= 0) && (val <= 31)) {
            print " word I16A_MOVI + (" dst ")<<D16A + (" val ")<<S16A ' Catalina optimized load\n"
         }
         else {
            print line1
            print $0
         }
      }
      else if (left($2,1) == "-") {
         val = 0 + right($2, length($2)-1)
         if ((val >= 0) && (val <= 31)) {
            print " word I16A_NEGI + (" dst ")<<D16A + (" val ")<<S16A ' Catalina optimized load\n"
         }
         else {
            print line1
            print $0
         }
      }
      else if ((left($2,7) == "$ffffff") || (left($2,7) == "$FFFFFF")) {
         len = length($2)-7
         if (len > 0) {
            str = right($2, len)
            len = length(str)
            val = 0
            for (i = 0; i < len; i++) {
               c = left(str,1)
               if (length(str) > 1) {
                  str = right(str,length(str)-1)
               }
               if ((c >= "0") && (c <= "9")) {
                  val = 16 * val + c
               }
               else if ((c >= "a") && (c <= "f")) {
                  val = 16 * val + (ascii(c) - ascii("a") + 10)
               }
               else if ((c >= "A") && (c <= "F")) {
                  val = 16 * val + (ascii(c) - ascii("A") + 10)
               }
               else {
                  break;
               }
            }
            if ((len == 2) && (val >= 0) && (256 - val <= 31)) {
               print " word I16A_NEGI + (" dst ")<<D16A + (" 256-val ")<<S16A ' Catalina optimized load\n"
            }
            else {
               print line1
               print $0
            }
         }
         else {
            print line1
            print $0
         }
      }
      else if (left($2,1) == "$") {
         len = length($2) - 1
         if (len > 0) {
            str = right($2, len)
            val = 0
            for (i = 0; i < len; i++) {
               c = left(str,1)
               if (length(str) > 1) {
                  str = right(str,length(str)-1)
               }
               if ((c >= "0") && (c <= "9")) {
                  val = 16 * val + c
               }
               else if ((c >= "a") && (c <= "f")) {
                  val = 16 * val + (ascii(c) - ascii("a") + 10)
               }
               else if ((c >= "A") && (c <= "F")) {
                  val = 16 * val + (ascii(c) - ascii("A") + 10)
               }
               else {
                  break;
               }
            }
            if ((val >= 0) && (val <= 31)) {
               print " word I16A_MOVI + (" dst ")<<D16A + (" val ")<<S16A ' Catalina optimized load\n"
            }
            else {
               print line1
               print $0
            }
         }
         else {
            print line1
            print $0
         }
      }
      else {
         print line1
         print $0
      }
   }
   else {
      print line1
      print $0
   }
   next
}
{ print }
