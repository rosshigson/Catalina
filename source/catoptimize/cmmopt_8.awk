#
# Phase 8
#
# AWK script to identify functions that do not require stack space to be 
# identified in BC because they do not dump any register arguments to stack
#
BEGIN {
   initialize_phase_8();
   f = "no function";
}
/^'/ { next }
/^{/ {
   getline;
   while (left($0,1) != "}") {
      getline;
   }
   next;
}
/^C_/  {
   if (known_function($1)) {
      f = $1; 
   }
   else {
      f = "no function"; 
   }
}

{
   if (($1 == "long") && ($2 == "I32_SPILL")) {
      if (f != "no function") {
         uses_BC(f);
      }
   }
}

END {
   finalize_phase_8();
}
