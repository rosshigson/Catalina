#
# Phase 3
#
# AWK script to replace calls to inlinable functions
#
BEGIN {
   initialize_phase_3();
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
/^C_/  {
   f = $1; 
   if (known_function(f)) {
      /* remove the actual function (will be inlined at each call) */
      printf "' Catalina Optimizer - %s removed (Inlined)\n", f
      getline;
      while (1) {
         if (($1 == "jmp") && (($2 == "#RETF") || ($2 == "#RETN"))) {
            break;
         }
         if (($1 == "calld") && (($2 == "PA,#RETF") || ($2 == "PA,#RETN"))) {
            break;
         }
         getline;
      }
   }
   else {
      /* not inlinable call - reconstruct original line */
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
      if ((left($0, 10) == " jmp #CALA") || (left($0, 15) == " calld PA,#CALA")) {
         cal = $0
         getline;
         f = ltrim($2, "@");
         if (known_function(f)) {
            /* inline it */
            insert_inline(f);
            getline;
            if (left($0, 10) != " add SP, #") {
               print $0
            }
         }
         else {
            /* not inlinable call - reconstruct lines */
            print bcl
            print spl
            print cal " "
            print $0
         }

      }
      else {
         /* not inlinable call - reconstruct original lines */
         print bcl
         print spl
         print $0
      }
   }
   else if (left($0, 10) == " add SP, #") {
      spl = $0;
      getline;
      if ((left($0, 10) == " jmp #CALA") || (left($0, 15) == " calld PA,#CALA")) {
         cal = $0
         getline;
         f = ltrim($2, "@");
         if (known_function(f)) {
            /* inline it */
            insert_inline(f);
            getline;
            if (left($0, 10) != " add SP, #") {
               print $0
            }
         }
         else {
            /* not inlinable call - reconstruct lines */
            print bcl
            print spl
            print cal " "
            print $0
         }

      }
      else {
         /* not inlinable call - reconstruct original lines */
         print bcl
         print spl
         print $0
      }
   }
   else if ((left($0,10) == " jmp #CALA") || (left($0, 15) == " calld PA,#CALA")) {
      cal = $0;
      getline;
      f = ltrim($2, "@");
      if (known_function(f)) {
         /* inline it */
         insert_inline(f);
      }
      else {
         /* reconstruct lines */
         print bcl
         print cal " "
         print $0
      }
   }
   else {
      /* not inlinable call - reconstruct original lines */
      print bcl
      print $0
   }
   next;
}
/^[ \t]+jmp #CALA/ || /^[ \t]+calld[ \t]PA,#CALA/ {
   cal = $0;
   getline;
   f = ltrim($2, "@");
   if (known_function(f)) {
      /* inline it */
      insert_inline(f);
   }
   else {
      /* not inlinable call - reconstruct original lines */
      print cal " "
      print $0
   }
   next;
}        
{ print }
