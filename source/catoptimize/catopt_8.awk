#
# Phase 8
#
# AWK script to identify functions that do not require stack space to be 
# identified in BC because they do not dump any register arguments to stack
#
BEGIN {
   initialize_phase_8();
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
   f = $1; 
   if (known_function(f)) {
      getline;
      if (($0 == " jmp #NEWF") || ($0 == " PRIMITIVE(#NEWF)")) {
         getline;
      }
      if (left($0,10) == " sub SP, #") {
         getline;
      }
      if (($0 == " jmp #PSHM") || ($0 == " PRIMITIVE(#PSHM)")) {
         getline;
         getline;
      }
      if ($0 == " mov RI, FP") {
         getline;
         if ($0 == " add RI, #8") {
            getline;
            if ($0 == " sub BC, #4") {
               /* it's probably not necessary to check so far */
               uses_BC(f);
            }
         }
      }
   }
}
END {
   finalize_phase_8();
}
