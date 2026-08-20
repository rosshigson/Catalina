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
/[ \t]+jmp[ \t]+#CALA/ || /[ \t]+calld[ \t]+PA,#CALA/ {
   getline;
   f = ltrim($2,"@")
   getline;
   if (($1 == "add") && ($2 == "SP,")) {
      s = ltrim($3,"#");
   }
   else {
      s = "-1";
   }
   print f, s
}
