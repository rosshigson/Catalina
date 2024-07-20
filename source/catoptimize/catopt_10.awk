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
/[ \t]+mov[ \t]+/  {
   line1 = $0
   s = rtrim($2, ",")
   d = $3 
   getline;
   if (($1 == "mov") && (rtrim($2,",") == d) && ($3 == s)) {
      print line1
      printf "'%s ' Catalina redundant\n", $0
   }
   else {
      print line1
      print $0
   }
   next
}
/[ \t]+rdbyte[ \t]+/ {
   line1 = $0
   d = rtrim($2, ",")
   getline;
   if (($1 == "and") && (rtrim($2,",") == d) && ($3 == "cviu_m1")) {
      print line1
      printf "'%s ' Catalina redundant\n", $0
   }
   else {
      print line1
      print $0
   }
   next
}
/[ \t]+rdword[ \t]+/ {
   line1 = $0
   d = rtrim($2, ",")
   getline;
   if (($1 == "and") && (rtrim($2,",") == d) && ($3 == "cviu_m2")) {
      print line1
      printf "'%s ' Catalina redundant\n", $0
   }
   else {
      print line1
      print $0
   }
   next
}
{ print }
