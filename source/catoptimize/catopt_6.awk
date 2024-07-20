#
# Phase 6
#
# AWK script to replace optimizable instructions with relative jumps
#
BEGIN {
   p = 0;
   initialize_phase_6();
   print "' Optimized by Catalina Optimizer 1.0"

}
/^' Optimized by Catalina Optimizer / { 
   /* for the second pass, we use larger numbers (to avoid label collisions) */
   p = 100000;
   print "' Optimized (pass 2) by Catalina Optimizer 1.0"
}
/^' Catalina Optimized Warning / { next }
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
/ jmp #JMPA ' Catalina Optimizer / || / calld PA,#JMPA ' Catalina Optimizer / {
   if ($6 > 0) {
      n = p + $6
      opt = can_optimize($6)
   }
   else {
      n = p + $5
      opt = can_optimize($5)
   }
   if (length(opt) != 0) {
      getline;
      if (optimize_add(opt)) {
         d = rtrim($2,"'");
         printf " %s PC,#(%s-@:Opt_%06d) ' Catalina Optimized %s\n:Opt_%06d\n", opt, d, n, n, n
         /* printf " long %s-@:Opt_%06d ' Catalina Optimized %s (%s)\n:Opt_%06d\n", $2, n, n, opt,n */
      }
      else {
         apos = "'"
         d = rtrim($2,"'");
         printf " %s PC,#(@:Opt_%06d-%s) ' Catalina Optimized %s\n:Opt_%06d\n", opt, n, d, n, n
         /* printf " long @:Opt_%06d-%s ' Catalina Optimized %s (%s)\n:Opt_%06d\n", n, $2, n, opt, n */
      }
   }
   else {
      printf " %s %s\n", $1,$2
      getline;
      print $0
   }
   next;
}

/ jmp #BR.. ' Catalina Optimizer / || / calld PA,#BR.. ' Catalina Optimizer / {
   if ($6 > 0) {
      n = p + $6
      opt = can_optimize($6)
   }
   else {
      n = p + $5
      opt = can_optimize($5)
   }
   if (length(opt) != 0) {
      getline;
      if (optimize_add(opt)) {
         d = rtrim($2,"'");
         printf " %s PC,#(%s-@:Opt_%06d) ' Catalina Optimized %s\n:Opt_%06d\n", opt, d, n, n, n
         /* printf " long %s-@:Opt_%06d ' Catalina Optimized %s (%s)\n:Opt_%06d\n", $2, n, n, opt,n */
      }
      else {
         d = rtrim($2,"'");
         printf " %s PC,#(@:Opt_%06d-%s) ' Catalina Optimized %s\n:Opt_%06d\n", opt, n, d, n, n
         /* printf " long @:Opt_%06d-%s ' Catalina Optimized %s (%s)\n:Opt_%06d\n", n, $2, n, opt, n */
      }
   }
   else {
      printf " %s %s\n", $1,$2
      getline;
      print $0
   }
   next;
}

{ 
  print
  next
}
