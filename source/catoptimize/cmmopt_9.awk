#
# Phase 9
#
# AWK script to remove assignment of reg argument stack size to BC from those 
# function calls that don't use it.
#
# Also optimize away assignemts to registers immedialy prior to a POPM
#
BEGIN {
   initialize_phase_9();
}
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
/^[ \t]+word[ \t]+I16A_MOVI[ \t]+\+[ \t]+BC/  {
   bcl = $0;
   getline; while (left($1,6) == "alignl") { getline }
   sp1 = "";
   sp2 = "";
   if (left($0, 20) == " word I16A_ADDI + SP") {
      sp1 = $0;
      getline; while (left($1,6) == "alignl") { getline }
   }
   else if (left($0, 20) == " word I16A_SUBI + SP") {
      sp1 = $0;
      getline; while (left($1,6) == "alignl") { getline }
   }
   else if (left($0, 14) == " long I32_LODA") {
      sp1 = $0;
      getline; while (left($1,6) == "alignl") { getline }
      if (left($0, 19) == " word I16A_SUB + SP") {
         sp2 = $0;
         getline; while (left($1,6) == "alignl") { getline }
      }
   }
   if (left($0,14) == " long I32_CALA") {
      if (left($4,1)=="(") {
         f = ltrim($4,"(@");
         f = left(f, length(f)-6);
      }
      else {
         f = ltrim($4,"@");
         f = left(f, length(f)-5);
      }
      if (known_function(f)) {
         /* call to a known function - optimize it out */
         printf "' %s ' Catalina Optimized\n", bcl
      }
      else {
         /* not a call to a known function - reconstruct original line */
         print bcl
      }
   }
   else {
      /* not a call to a known function - reconstruct original line */
      print bcl
   }
   if (sp1 != "") {
      print sp1
   }
   if (sp2 != "") {
      print sp2
   }
   print $0
   next;
}

/^[ \t]+word[ \t]+I16A_MOV[ \t]+\+[ \t]+/  {
   line1 = $0;
   line2 = "";
   if ((toupper($6) == "(R0)<<S16A") || (toupper($6) == "R0<<S16A")) {
      getline; while (left($1,6) == "alignl") { getline }
      if ((left($0,4) == "' C_") || (left($0,2) == "C_")) {
         line2 = $0
         getline; while (left($1,6) == "alignl") { getline }
      }
      if (left($0, 15) == " word I16B_POPM") {
         printf "' %s ' Catalina Optimized\n", line1
      }
      else if (left($0, 15) == " word I16B_RETN") {
         printf "' %s ' Catalina Optimized\n", line1
      }
      else if (left($0, 14) == " word I16B_RETF") {
         printf "' %s ' Catalina Optimized\n", line1
      }
      else if (left($0, 14) == " long I32_RETF") {
         printf "' %s ' Catalina Optimized\n", line1
      }
      else {
         print line1
      }
      if (line2 != "") {
         print line2
      }
      print $0
   }
   else {
      print line1
   }
   next
}

{ print }
