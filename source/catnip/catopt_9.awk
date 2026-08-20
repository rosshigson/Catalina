#
# Phase 9
#
# AWK script to remove assignment of reg argument stack size to BC from those 
# function calls that don't use it.
#
# Also optimize away assignemts to other registers from r0 immedialy prior to a POPM
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
/^[ \t]+mov[ \t]+BC,[ \t]*##/  {
   bcl = $0;
   bc = ltrim($3, "#");
   getline;
   if (left($0, 10) == " sub SP, #") {
      spl = $0;
      getline;
      if ((left($0,10) == " jmp #CALA") || (left($0,15) == " calld PA,#CALA")) {
         call = $0
         getline;
         f = ltrim($2, "@");
         if (!known_function(f)) {
            /* any unknown function needs BC */
            printf " mov BC, ##%s\n", bc
         }
         else {
            /* optimize it out */
            printf "' mov BC, ##%s ' Catalina Optimized\n", bc
         }
         print spl
         print call
         printf " long @%s\n", f

      }
      else {
         /* not a call to a function - reconstruct original line */
         print bcl
         print spl
         print $0
      }
   }
   else if ((left($0,10) == " jmp #CALA") || (left($0,15) == " calld PA,#CALA")) {
      call = $0
      getline;
      f = ltrim($2, "@");
      if (!known_function(f)) {
         /* any unknown function needs BC */
         print bcl
      }
      else {
         /* optimize it out */
         printf "' mov BC, ##%s ' Catalina Optimized\n", bc
      }
      print call
      printf " long @%s\n", f
   }
   else {
      /* not a call to a function - reconstruct original line */
      print bcl
      print $0
   }
   next;
}
/^[ \t]+mov[ \t]+BC,[ \t]*#/  {
   bcl = $0;
   bc = ltrim($3, "#");
   getline;
   if (left($0, 10) == " sub SP, #") {
      spl = $0;
      getline;
      if ((left($0,10) == " jmp #CALA") || (left($0,15) == " calld PA,#CALA")) {
         call = $0
         getline;
         f = ltrim($2, "@");
         if (!known_function(f)) {
            /* any unknown function needs BC */
            print bcl
         }
         else {
            /* optimize it out */
            printf "' mov BC, #%s ' Catalina Optimized\n", bc
         }
         print spl
         print call
         printf " long @%s\n", f

      }
      else {
         /* not a call to a function - reconstruct original line */
         print bcl
         print spl
         print $0
      }
   }
   else if ((left($0,10) == " jmp #CALA") || (left($0,15) == " calld PA,#CALA")) {
      call = $0
      getline;
      f = ltrim($2, "@");
      if (!known_function(f)) {
         /* any unknown function needs BC */
         print bcl
      }
      else {
         /* optimize it out */
         printf "' mov BC, #%s ' Catalina Optimized\n", bc
      }
      print call
      printf " long @%s\n", f
   }
   else {
      /* not a call to a function - reconstruct original line */
      print bcl
      print $0
   }
   next;
}
/^[ \t]+mov[ \t]+/  {
   if ($3 == "r0") {
      line1 = $0;
      getline;
      if ((left($0,4) == "' C_") || (left($0,2) == "C_")) {
         line2 = $0
         getline;
      }
      else {
         line2 = ""
      }
      if ((left($0, 10) == " jmp #POPM") || (left($0,15) == " calld PA,#POPM")) {
         printf "' %s ' Catalina Optimized\n", line1
      }
      else {
         print line1
      }
      if (length(line2) > 0) {
         print line2
      }
      print $0
   }
   else {
      print $0
   }
   next
}
{ print }
