#
# Phase 7
#
# AWK script to identify all function calls in the SPIN file, 
# and the stack space requirements for each function (if any). 
#
/^'/ { }
/^{/ {
   getline;
   while (left($0,1) != "}") {
      getline;
   }
   next;
}
/^[ \t]+long[ \t]+I32_CALA/  {
   if (left($4,1)=="(") {
      f = ltrim($4,"(@");
      f = left(f, length(f)-6);
   }
   else {
      f = ltrim($4,"@");
      f = left(f, length(f)-5);
   }
   /* print "f= ", f */
   getline; while ($1 == "alignl") { getline }
   if (($1 == "word") && ($2 == "I16A_ADDI") && ($4 == "SP<<D16A")) {
      s = $6;
      /* print "s= ", s */
      if (left(s,1)=="(") {
         s = ltrim(s,"(");
         s = left(s, length(s)-7);
      }
      else {
         s = left(s, length(s)-6);
       }
   }
   else if (($1 == "long") && ($2 == "I32_LODA")) {
      s = $4;
      /* print "s= ", s */
      getline; while ($1 == "alignl") { getline }
      if (($1 == "word") && ($2 == "I16_ADD") && ($4 == "SP<<D16A")) {
         if (left(s,1)=="(") {
            s = ltrim(s,"(");
            s = left(s, length(s)-6);
         }
         else {
            s = left(s, length(s)-5);
          }
       }
   }
   else {
      s = "-1";
   }
   print f, s
}
