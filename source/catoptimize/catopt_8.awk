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
      if ((left($0, 10) == " jmp #NEWF") || (left($0, 15) == " calld PA,#NEWF")) {
         getline;
      }
      if (left($0,10) == " sub SP, #") {
         getline;
      }
      if ((left($0, 10) == " jmp #PSHM") || (left($0, 15) == " calld PA,#PSHM")) {
         getline;
         getline;
      }
      if (left($0, 11) == " mov RI, FP") {
         getline;
         if (left($0, 11) == " add RI, #8") {
            getline;
            if (left($0, 11) == " sub BC, #4") {
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
