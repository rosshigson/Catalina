#
# Phase 4
#
# AWK script to enumerate optimization candidates
#
BEGIN { print "' Catalina Optimized Warning : This is a temporary file used by the Catalina Optimizer\n' Catalina Optimized Warning : It is not intended to be used and will not run correctly\n" }
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
/#JMPA/ {
   print $0 " ' Catalina Optimizer " ++i
   next 
}
/#BR_Z/ {
   print $0 " ' Catalina Optimizer " ++i 
   next 
}
/#BRNZ/ {
   print $0 " ' Catalina Optimizer " ++i 
   next 
}
/#BRAE/ {
   print $0 " ' Catalina Optimizer " ++i 
   next 
}
/#BR_A/ {
   print $0 " ' Catalina Optimizer " ++i 
   next 
}
/#BRBE/ {
   print $0 " ' Catalina Optimizer " ++i 
   next 
}
/#BR_B/ {
   print $0 " ' Catalina Optimizer " ++i 
   next
}
{ 
   print
   next 
}
