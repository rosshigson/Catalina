#
# Phase 1
#
# AWK script to identify all inlinable function calls in the SPIN file, 
# and the stack space requirements for each function (only function
# calls with stack space that can be represented as an 'immediate'
# can presently be 'inlined')
#
# NOTE: Do not process calls in PASM functions!
#
/^'START PASM.../ {
   getline;
   while (left($0,13) != "'... END PASM") {
      getline;
   }
   next;
}
/^'/ { }
/^{/ {
   getline;
   while (left($0,1) != "}") {
      getline;
   }
   next;
}
/[ \t]+jmp[ \t]+#CALA/ || /[ \t]+calld[ \t]PA,#CALA/ {
   getline;
   f = ltrim($2,"@")
   getline;
   if (left($0, 10) == " add SP, #") {
      s = ltrim($3,"#");
   }
   else {
      s = "0";
   }
   print f, s
}

