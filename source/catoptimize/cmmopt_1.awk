#
# Phase 1
#
# AWK script to identify all inlinable function calls in the SPIN file, 
# and the stack space requirements for each function (only function
# calls with stack space that can be represented as an 'immediate'
# can presently be 'inlined')
#
/^'/ { next }
/^{/ {
   getline;
   while (left($0,1) != "}") {
      getline;
   }
   next;
}
/[ \t]+long[ \t]+I32_CALA/  {
   s = ltrim($2,"#");
   if (left($4,1) == "(") {
      f = ltrim($4,"(@");
      f = left(f,length(f)-6);
   }
   else {
      f = ltrim($4,"@");
      f = left(f,length(f)-5);
   }
   getline; while (left($1,6) == "alignl") { getline }
   if (left($0, 26) == " word I16A_ADDI + SP<<D16A") {
      if (left($6, 1) == "(") {
         s = ltrim($6,"(");
         s = left(s, length(s)-7);
      }
      else {
         s = left($6, length($6)-6);
      }
   }
   else {
      s = "0";
   }
   print f, s
}
