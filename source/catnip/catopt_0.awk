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
/[ \t]+jmp[ \t]+#LODL/ || /[ \t]+calld[ \t]PA,#LODL/ {
   line1 = $0
   getline;
   if ($1 == "long") {
      line2 = $0
      if ((left($2,1) >= "0") && (left($2,1) <= "9")) {
         val = 0 + $2
         getline;
         if ((val >= 0) && (val <= 511)) {
            if (($1 == "mov") && ($3 == "RI")) {
               print " mov " $2 " #" val " ' Catalina optimized load\n"
            }
            else {
               print " mov RI, #" val " ' Catalina optimized load\n"
               print $0
            }
         }
         else {
            print line1
            print line2
            print $0
         }
      }
      else if (left($2,1) == "-") {
         val = 0 + right($2, length($2)-1)
         getline;
         if ((val >= 0) && (val <= 511)) {
            if (($1 == "mov") && ($3 == "RI")) {
               print " neg " $2 " #" val " ' Catalina optimized load\n"
            }
            else {
               print " neg RI, #" val " ' Catalina optimized load\n"
               print $0
            }
         }
         else {
            print line1
            print line2
            print $0
         }
      }
      else if ((left($2,6) == "$fffff") || (left($2,6) == "$FFFFF")) {
         str = right($2, length($2)-6)
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
         getline;
         if ((len == 3) && (val >= 0) && (4096 - val <= 511)) {
            if (($1 == "mov") && ($3 == "RI")) {
               print " neg " $2 " #" 4096 - val " ' Catalina optimized load\n"
            }
            else {
               print " neg RI, #" val " ' Catalina optimized load\n"
               print $0
            }
         }
         else {
            print line1
            print line2
            print $0
         }
      }
      else if (left($2,1) == "$") {
         len = length($2) - 1
         str = right($2, length($2)-1)
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
         getline;
         if ((val >= 0) && (val <= 511)) {
            if (($1 == "mov") && ($3 == "RI")) {
               print " mov " $2 " #" val " ' Catalina optimized load\n"
            }
            else {
               print " mov RI, #" val " ' Catalina optimized load\n"
               print $0
            }
         }
         else {
            print line1
            print line2
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
