#
# Phase 13
#
# AWK script to remove functions not specifically identified as required
#
BEGIN {
   code = 0;
   initialize_phase_13();
}
/^'/ { 
   print 
   next 
}
/^{/ {
   print 
   getline;
   while (left($0,1) != "}") {
      print 
      if (getline <= 0) {
         break;
      }
   }
   print 
   next
}
/^Catalina_Code/ {
   code = 1;
}
/^Catalina_Cnst/ {
   code = 0;
}
/^Catalina_Data/ {
   code = 0;
}
/^Catalina_Init/ {
   code = 0;
}
/^C_/  {
   if (code) {
      f = $1;
      if (!required_function(f)) {
         /* remove the function */
         printf "' Catalina Optimizer - %s removed (Not Required)\n", f
         print "' ",$0
         getline;
         while (1) {
            if (left($0,1) == "{") {
               /* skip code that is commented out */
               print $0
               do {
                  if (getline <= 0) {
                     break;
                  }
                  print $0
               } while (left($0,1) != "}");
            }
            else if (($1 == "jmp") && (($2 == "#RETF") || ($2 == "#RETN"))) {
               print "' ",$0
               break;
            }
            else if (($1 == "calld") && (($2 =="PA,#RETF") || ($2 == "PA,#RETN"))) {
               print "' ",$0
               break;
            }
            else if (($1 == "'") && (left($2, 3) == "end")) {
               print "' ",$0
               break;
            }
            else {
               print "' ",$0
            }
            getline;
         }
      }
      else {
         /* printf "' Catalina Optimizer - %s not removed (Required)\n", f */
         /* not removable - reconstruct original line */
         print $0
      }
      next;
   }
   else {
      f = $1;
      if (!required_function(f)) {
         printf "' Catalina Optimizer - %s removed (Not Required)\n", f
         print "' ",$0
         getline;
         while (1) {
            if (left($0,1) == "{") {
               /* skip code that is commented out */
               print $0
               do {
                  if (getline <= 0) {
                     break;
                  }
                  print $0
               } while (left($0,1) != "}");
            }
            else if (($1 == "") || (($1 != "'") && ($1 != "byte") && ($1 != "word") && ($1 != "long"))) {
               print "' ",$0
               break;
            }
            else {
               print "' ",$0
            }
            if (getline <= 0) {
               break;
            }
         }
      }
      else {
         print $0
      }
      next;
   }
}
{ print }
