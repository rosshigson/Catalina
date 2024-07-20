#
# Phase 5
#
# AWK script to identify whether the optimizable instructions enumerated
# in phase 1 are within the range of an immediate add or sub instruction.
# Note that we allow a "guard" of 16 in case other optimizations which 
# move the the source and destination end up with them being too far apart.
#
BEGIN {
   FS = "[ :()]"
}
/#JMPA ' Catalina Optimizer / || /#JMPA ' Catalina Optimizer / {
   paren1 = substr($0,5,1);
   paren2 = substr($0,6,1)
   if ((paren1 == "(") || (paren2 == "(")) {
      # using spinnaker or homespun
      n = candidate_id($0);
   }
   else {
      # using p2asm 
      n = 0;
   }
   if (n > 0) {
      addr = str_to_hex($1);
      getline;
      dest = bytes_to_hex($5, $6, $7, $8) + 16;
      printf "' dest = %X\n", dest
      printf "' addr = %X\n", addr
      if ((dest > addr + 4) && ((dest - (addr + 4)) < 496)) {
         /* forward optimization possible */
         printf("' offs = %d\n", dest - (addr + 4));
         print n, "add"
      }
      else if ((dest < addr + 4) && (((addr + 4) - dest) < 496)) {
         /* reverse optimization possible */
         printf("' offs = %d\n", (addr + 4) - dest);
         print n, "sub"
      }
      else {
         /* printf "no optimization possible\n" */
      }
   }
   else {
      n = candidate_id($0);
      if (n > 0) {
         addr = str_to_hex($1);
         getline;
         dest = str_to_hex($6);
         printf "' dest = %X\n", dest
         printf "' addr = %X\n", addr
         if ((dest > addr + 4) && ((dest - (addr + 4)) < 496)) {
            /* forward optimization possible */
            printf("' offs = %d\n", dest - (addr + 4));
            print n, "add"
         }
         else if ((dest < addr + 4) && (((addr + 4) - dest) < 496)) {
            /* reverse optimization possible */
            printf("' offs = %d\n", (addr + 4) - dest);
            print n, "sub"
         }
         else {
            /* printf "no optimization possible\n" */
         }
      }
   }
}

/#BR_Z ' Catalina Optimizer / || /#BR_Z ' Catalina Optimizer / {
   paren1 = substr($0,5,1);
   paren2 = substr($0,6,1)
   if ((paren1 == "(") || (paren2 == "(")) {
      # using spinnaker or homespun
      n = candidate_id($0);
   }
   else {
      # using p2asm 
      n = 0;
   }
   if (n > 0) {
      addr = str_to_hex($1);
      getline;
      dest = bytes_to_hex($5, $6, $7, $8) + 16;
      printf "' dest = %X\n", dest
      printf "' addr = %X\n", addr
      if ((dest > addr + 4) && (dest - (addr + 4) < 496)) {
         /* forward optimization possible */
         printf("' offs = %d\n", dest - (addr + 4));
         print n, "if_z add"
      }
      else if ((dest < addr + 4) && ((addr + 4) - dest < 496)) {
         /* reverse optimization possible */
         printf("' offs = %d\n", (addr + 4) - dest);
         print n, "if_z sub"
      }
      else {
         /* printf "no optimization possible\n" */
      }
   }
   else {
      n = candidate_id($0);
      if (n > 0) {
         addr = str_to_hex($1);
         getline;
         dest = str_to_hex($6);
         printf "' dest = %X\n", dest
         printf "' addr = %X\n", addr
         if ((dest > addr + 4) && ((dest - (addr + 4)) < 496)) {
            /* forward optimization possible */
            printf("' offs = %d\n", dest - (addr + 4));
            print n, "if_z add"
         }
         else if ((dest < addr + 4) && (((addr + 4) - dest) < 496)) {
            /* reverse optimization possible */
            printf("' offs = %d\n", (addr + 4) - dest);
            print n, "if_z sub"
         }
         else {
            /* printf "no optimization possible\n" */
         }
      }
   }
}

/#BRNZ ' Catalina Optimizer / || /#BRNZ ' Catalina Optimizer / {
   paren1 = substr($0,5,1);
   paren2 = substr($0,6,1)
   if ((paren1 == "(") || (paren2 == "(")) {
      # using spinnaker or homespun
      n = candidate_id($0);
   }
   else {
      # using p2asm 
      n = 0;
   }
   if (n > 0) {
      addr = str_to_hex($1);
      getline;
      dest = bytes_to_hex($5, $6, $7, $8) + 16;
      printf "' dest = %X\n", dest
      printf "' addr = %X\n", addr
      if ((dest > addr + 4) && (dest - (addr + 4) < 496)) {
         /* forward optimization possible */
         printf("' offs = %d\n", dest - (addr + 4));
         print n, "if_nz add"
      }
      else if ((dest < addr + 4) && ((addr + 4) - dest < 496)) {
         /* reverse optimization possible */
         printf("' offs = %d\n", (addr + 4) - dest);
         print n, "if_nz sub"
      }
      else {
         /* printf "no optimization possible\n" */
      }
   }
   else {
      n = candidate_id($0);
      if (n > 0) {
         addr = str_to_hex($1);
         getline;
         dest = str_to_hex($6);
         printf "' dest = %X\n", dest
         printf "' addr = %X\n", addr
         if ((dest > addr + 4) && ((dest - (addr + 4)) < 496)) {
            /* forward optimization possible */
            printf("' offs = %d\n", dest - (addr + 4));
            print n, "if_nz add"
         }
         else if ((dest < addr + 4) && (((addr + 4) - dest) < 496)) {
            /* reverse optimization possible */
            printf("' offs = %d\n", (addr + 4) - dest);
            print n, "if_nz sub"
         }
         else {
            /* printf "no optimization possible\n" */
         }
      }
   }
}

/#BRAE ' Catalina Optimizer / || /#BRAE ' Catalina Optimizer / {
   paren1 = substr($0,5,1);
   paren2 = substr($0,6,1)
   if ((paren1 == "(") || (paren2 == "(")) {
      # using spinnaker or homespun
      n = candidate_id($0);
   }
   else {
      # using p2asm 
      n = 0;
   }
   if (n > 0) {
      addr = str_to_hex($1);
      getline;
      dest = bytes_to_hex($5, $6, $7, $8) + 16;
      printf "' dest = %X\n", dest
      printf "' addr = %X\n", addr
      if ((dest > addr + 4) && (dest - (addr + 4) < 496)) {
         /* forward optimization possible */
         printf("' offs = %d\n", dest - (addr + 4));
         print n, "if_ae add"
      }
      else if ((dest < addr + 4) && ((addr + 4) - dest < 496)) {
         /* reverse optimization possible */
         printf("' offs = %d\n", (addr + 4) - dest);
         print n, "if_ae sub"
      }
      else {
         /* printf "no optimization possible\n" */
      }
   }
   else {
      n = candidate_id($0);
      if (n > 0) {
         addr = str_to_hex($1);
         getline;
         dest = str_to_hex($6);
         printf "' dest = %X\n", dest
         printf "' addr = %X\n", addr
         if ((dest > addr + 4) && ((dest - (addr + 4)) < 496)) {
            /* forward optimization possible */
            printf("' offs = %d\n", dest - (addr + 4));
            print n, "if_ae add"
         }
         else if ((dest < addr + 4) && (((addr + 4) - dest) < 496)) {
            /* reverse optimization possible */
            printf("' offs = %d\n", (addr + 4) - dest);
            print n, "if_ae sub"
         }
         else {
            /* printf "no optimization possible\n" */
         }
      }
   }
}

/#BR_A ' Catalina Optimizer / || /#BR_A ' Catalina Optimizer /  {
   paren1 = substr($0,5,1);
   paren2 = substr($0,6,1)
   if ((paren1 == "(") || (paren2 == "(")) {
      # using spinnaker or homespun
      n = candidate_id($0);
   }
   else {
      # using p2asm 
      n = 0;
   }
   if (n > 0) {
      addr = str_to_hex($1);
      getline;
      dest = bytes_to_hex($5, $6, $7, $8) + 16;
      printf "' dest = %X\n", dest
      printf "' addr = %X\n", addr
      if ((dest > addr + 4) && (dest - (addr + 4) < 496)) {
         /* forward optimization possible */
         printf("' offs = %d\n", dest - (addr + 4));
         print n, "if_a add"
      }
      else if ((dest < addr + 4) && ((addr + 4) - dest < 496)) {
         /* reverse optimization possible */
         printf("' offs = %d\n", (addr + 4) - dest);
         print n, "if_a sub"
      }
      else {
         /* printf "no optimization possible\n" */
      }
   }
   else {
      n = candidate_id($0);
      if (n > 0) {
         addr = str_to_hex($1);
         getline;
         dest = str_to_hex($6);
         printf "' dest = %X\n", dest
         printf "' addr = %X\n", addr
         if ((dest > addr + 4) && ((dest - (addr + 4)) < 496)) {
            /* forward optimization possible */
            printf("' offs = %d\n", dest - (addr + 4));
            print n, "if_a add"
         }
         else if ((dest < addr + 4) && (((addr + 4) - dest) < 496)) {
            /* reverse optimization possible */
            printf("' offs = %d\n", (addr + 4) - dest);
            print n, "if_a sub"
         }
         else {
            /* printf "no optimization possible\n" */
         }
      }
   }
}

/#BRBE ' Catalina Optimizer / || /#BRBE ' Catalina Optimizer / {
   paren1 = substr($0,5,1);
   paren2 = substr($0,6,1)
   if ((paren1 == "(") || (paren2 == "(")) {
      # using spinnaker or homespun
      n = candidate_id($0);
   }
   else {
      # using p2asm 
      n = 0;
   }
   if (n > 0) {
      addr = str_to_hex($1);
      getline;
      dest = bytes_to_hex($5, $6, $7, $8) + 16;
      printf "' dest = %X\n", dest
      printf "' addr = %X\n", addr
      if ((dest > addr + 4) && (dest - (addr + 4) < 496)) {
         /* forward optimization possible */
         printf("' offs = %d\n", dest - (addr + 4));
         print n, "if_be add"
      }
      else if ((dest < addr + 4) && ((addr + 4) - dest < 496)) {
         /* reverse optimization possible */
         printf("' offs = %d\n", (addr + 4) - dest);
         print n, "if_be sub"
      }
      else {
         /* printf "no optimization possible\n" */
      }
   }
   else {
      n = candidate_id($0);
      if (n > 0) {
         addr = str_to_hex($1);
         getline;
         dest = str_to_hex($6);
         printf "' dest = %X\n", dest
         printf "' addr = %X\n", addr
         if ((dest > addr + 4) && ((dest - (addr + 4)) < 496)) {
            /* forward optimization possible */
            printf("' offs = %d\n", dest - (addr + 4));
            print n, "if_be add"
         }
         else if ((dest < addr + 4) && (((addr + 4) - dest) < 496)) {
            /* reverse optimization possible */
            printf("' offs = %d\n", (addr + 4) - dest);
            print n, "if_be sub"
         }
         else {
            /* printf "no optimization possible\n" */
         }
      }
   }
}

/#BR_B ' Catalina Optimizer / || /#BR_B ' Catalina Optimizer /  {
   paren1 = substr($0,5,1);
   paren2 = substr($0,6,1)
   if ((paren1 == "(") || (paren2 == "(")) {
      # using spinnaker or homespun
      n = candidate_id($0);
   }
   else {
      # using p2asm 
      n = 0;
   }
   if (n > 0) {
      addr = str_to_hex($1);
      getline;
      dest = bytes_to_hex($5, $6, $7, $8) + 16;
      printf "' dest = %X\n", dest
      printf "' addr = %X\n", addr
      if ((dest > addr + 4) && (dest - (addr + 4) < 496)) {
         /* forward optimization possible */
         printf("' offs = %d\n", dest - (addr + 4));
         print n, "if_b add"
      }
      else if ((dest < addr + 4) && ((addr + 4) - dest < 496)) {
         /* reverse optimization possible */
         printf("' offs = %d\n", (addr + 4) - dest);
         print n, "if_b sub"
      }
      else {
         /* printf "no optimization possible\n" */
      }
   }
   else {
      n = candidate_id($0);
      if (n > 0) {
         addr = str_to_hex($1);
         getline;
         dest = str_to_hex($6);
         printf "' dest = %X\n", dest
         printf "' addr = %X\n", addr
         if ((dest > addr + 4) && ((dest - (addr + 4)) < 496)) {
            /* forward optimization possible */
            printf("' offs = %d\n", dest - (addr + 4));
            print n, "if_b add"
         }
         else if ((dest < addr + 4) && (((addr + 4) - dest) < 496)) {
            /* reverse optimization possible */
            printf("' offs = %d\n", (addr + 4) - dest);
            print n, "if_b sub"
         }
         else {
            /* printf "no optimization possible\n" */
         }
      }
   }
}

