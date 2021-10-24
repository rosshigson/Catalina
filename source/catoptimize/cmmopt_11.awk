#
# Phase 11
#
# AWK script to identify all C labels in the SPIN file 
#
/^'/ { }
/^{/ {
   /* skip code that is commented out */
   do {
      getline;
   } while (left($0,1) != "}");
   next;
}
/^C_/ {
   f = $1
   print f
}

