#
# Phase 10
#
# AWK script to identify redundant moves and unnecessary truncation
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
/^[ \t]+word[ \t]+I16A_MOV[^I]/  {
   d1 = left($4, length($4)-6)
   s1 = left($6, length($6)-6)
   print $0
   getline; while ($1 == "alignl") { getline }
   if (($1 == "word") && ($2 == "I16A_MOV")) {
      d2 = left($4, length($4)-6)
      s2 = left($6, length($6)-6)
      if ((s1 == d2) && (s2 == d1)) {
         printf "'%s ' Catalina redundant\n", $0
      }
      else {
         print $0
      }
   }
   else {
      print $0
   }
   next
}
/^[ \t]+word[ \t]+I16A_RDBYTE/ {
   line = $0
   d1 = left($4, length($4)-6)
   print $0
   getline; while ($1 == "alignl") { getline }
   if (($1 == "word") && ($2 == "I16B_TRN1")) {
      d2 = left($4, length($4)-6)
      if (d1 == d2) {
         printf "'%s ' Catalina redundant\n", $0
      }
      else {
         print $0
      }
   }
   else {
      print $0
   }
   next
}
/^[ \t]+word[ \t]+I16A_RDWORD/ {
   line = $0
   d1 = left($4, length($4)-6)
   print $0
   getline; while ($1 == "alignl") { getline }
   if (($1 == "word") && ($2 == "I16B_TRN2")) {
      d2 = left($4, length($4)-6)
      if (d1 == d2) {
         printf "'%s ' Catalina redundant\n", $0
      }
      else {
         print $0
      }
   }
   else {
      print $0
   }
   next
}
{ print }

