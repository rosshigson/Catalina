#
# Phase 5
#
# AWK script to identify whether the optimizable instructions enumerated
# in phase 1 are within the range of a relative jump instruction. Note 
# that we cannot use the full jump range (+/- 255) because with compact
# code it can happen that the destination moves out of range of the 
# jump address due to other optimizations, or the addition or removal
# of "align" statements. There is no way to guarantee this, but we 
# allow a "guard" of +/- 16, which should cover pretty much all 
# contingencies.
#
BEGIN {
   FS = "[ :()]"
}
/^'/ { next; }
/^{/ {
   getline;
   while (left($0,1) != "}") {
      getline;
   }
   next;
}
/[ \t]+long[ \t]+I32_JMPA/  {
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
      dest = bytes_to_addr24($5, $6, $7, $8) + 16;
      if ((dest > (addr+4)) && ((dest - (addr+4)) < 240)) {
         /* forward optimization possible */
         # printf "' dest = %X\n", dest
         # printf "' addr = %X\n", addr
         print n, "word I16B_JMPR"
      }
      else if ((dest < (addr+4)) && (((addr+4) - dest) < 240)) {
         /* reverse optimization possible */
         # printf "' dest = %X\n", dest
         # printf "' addr = %X\n", addr
         print n, "word I16B_JMPR"
      }
      else {
         /* printf "no optimization possible\n" */
      }
   }
   else {
      n = candidate_id($0);
      if (n > 0) {
         addr = str_to_hex($1);
         dest = str_to_addr24($6);
         if ((dest > (addr+4)) && ((dest - (addr+4)) < 240)) {
            /* forward optimization possible */
            # printf "' dest = %X\n", dest
            # printf "' addr = %X\n", addr
            print n, "word I16B_JMPR"
         }
         else if ((dest < (addr+4)) && (((addr+4) - dest) < 240)) {
            /* reverse optimization possible */
            # printf "' dest = %X\n", dest
            # printf "' addr = %X\n", addr
            print n, "word I16B_JMPR"
         }
         else {
            /* printf "no optimization possible\n" */
         }
      }
   }
}
/[ \t]+long[ \t]+I32_BR_Z/  {
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
      dest = bytes_to_addr24($5, $6, $7, $8) + 16;
      if ((dest > (addr+4)) && ((dest - (addr+4)) < 240)) {
         /* forward optimization possible */
         # printf "' dest = %X\n", dest
         # printf "' addr = %X\n", addr
         print n, "word I16B_RJ_Z"
      }
      else if ((dest < (addr+4)) && (((addr+4) - dest) < 240)) {
         /* reverse optimization possible */
         # printf "' dest = %X\n", dest
         # printf "' addr = %X\n", addr
         print n, "word I16B_RJ_Z"
      }
      else {
         /* printf "no optimization possible\n" */
      }
   }
   else {
      n = candidate_id($0);
      if (n > 0) {
         addr = str_to_hex($1);
         dest = str_to_addr24($6);
         if ((dest > (addr+4)) && ((dest - (addr+4)) < 240)) {
            /* forward optimization possible */
            # printf "' dest = %X\n", dest
            # printf "' addr = %X\n", addr
            print n, "word I16B_RJ_Z"
         }
         else if ((dest < (addr+4)) && (((addr+4) - dest) < 240)) {
            /* reverse optimization possible */
            # printf "' dest = %X\n", dest
            # printf "' addr = %X\n", addr
            print n, "word I16B_RJ_Z"
         }
         else {
            /* printf "no optimization possible\n" */
         }
      }
   }   
}
/[ \t]+long[ \t]+I32_BRNZ/  {
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
      dest = bytes_to_addr24($5, $6, $7, $8) + 16;
      if ((dest > (addr+4)) && ((dest - (addr+4)) < 240)) {
         /* forward optimization possible */
         # printf "' dest = %X\n", dest
         # printf "' addr = %X\n", addr
         print n, "word I16B_RJNZ"
      }
      else if ((dest < (addr+4)) && (((addr+4) - dest) < 240)) {
         /* reverse optimization possible */
         # printf "' dest = %X\n", dest
         # printf "' addr = %X\n", addr
         print n, "word I16B_RJNZ"
      }
      else {
         /* printf "no optimization possible\n" */
      }
   }
   else {
      n = candidate_id($0);
      if (n > 0) {
         addr = str_to_hex($1);
         dest = str_to_addr24($6);
         if ((dest > (addr+4)) && ((dest - (addr+4)) < 240)) {
            /* forward optimization possible */
            # printf "' dest = %X\n", dest
            # printf "' addr = %X\n", addr
            print n, "word I16B_RJNZ"
         }
         else if ((dest < (addr+4)) && (((addr+4) - dest) < 240)) {
            /* reverse optimization possible */
            # printf "' dest = %X\n", dest
            # printf "' addr = %X\n", addr
            print n, "word I16B_RJNZ"
         }
         else {
            /* printf "no optimization possible\n" */
         }
      }
   }   
}
/[ \t]+long[ \t]+I32_BR_A/  {
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
      dest = bytes_to_addr24($5, $6, $7, $8) + 16;
      if ((dest > (addr+4)) && ((dest - (addr+4)) < 240)) {
         /* forward optimization possible */
         # printf "' dest = %X\n", dest
         # printf "' addr = %X\n", addr
         print n, "word I16B_RJ_A"
      }
      else if ((dest < (addr+4)) && (((addr+4) - dest) < 240)) {
         /* reverse optimization possible */
         # printf "' dest = %X\n", dest
         # printf "' addr = %X\n", addr
         print n, "word I16B_RJ_A"
      }
      else {
         /* printf "no optimization possible\n" */
      }
   }
   else {
      n = candidate_id($0);
      if (n > 0) {
         addr = str_to_hex($1);
         dest = str_to_addr24($6);
         if ((dest > (addr+4)) && ((dest - (addr+4)) < 240)) {
            /* forward optimization possible */
            # printf "' dest = %X\n", dest
            # printf "' addr = %X\n", addr
            print n, "word I16B_RJ_A"
         }
         else if ((dest < (addr+4)) && (((addr+4) - dest) < 240)) {
            /* reverse optimization possible */
            # printf "' dest = %X\n", dest
            # printf "' addr = %X\n", addr
            print n, "word I16B_RJ_A"
         }
         else {
            /* printf "no optimization possible\n" */
         }
      }
   }   
}
/[ \t]+long[ \t]+I32_BRAE/  {
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
      dest = bytes_to_addr24($5, $6, $7, $8) + 16;
      if ((dest > (addr+4)) && ((dest - (addr+4)) < 240)) {
         /* forward optimization possible */
         # printf "' dest = %X\n", dest
         # printf "' addr = %X\n", addr
         print n, "word I16B_RJAE"
      }
      else if ((dest < (addr+4)) && (((addr+4) - dest) < 240)) {
         /* reverse optimization possible */
         # printf "' dest = %X\n", dest
         # printf "' addr = %X\n", addr
         print n, "word I16B_RJAE"
      }
      else {
         /* printf "no optimization possible\n" */
      }
   }
   else {
      n = candidate_id($0);
      if (n > 0) {
         addr = str_to_hex($1);
         dest = str_to_addr24($6);
         if ((dest > (addr+4)) && ((dest - (addr+4)) < 240)) {
            /* forward optimization possible */
            # printf "' dest = %X\n", dest
            # printf "' addr = %X\n", addr
            print n, "word I16B_RJAE"
         }
         else if ((dest < (addr+4)) && (((addr+4) - dest) < 240)) {
            /* reverse optimization possible */
            # printf "' dest = %X\n", dest
            # printf "' addr = %X\n", addr
            print n, "word I16B_RJAE"
         }
         else {
            /* printf "no optimization possible\n" */
         }
      }
   }   
}
/[ \t]+long[ \t]+I32_BR_B/  {
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
      dest = bytes_to_addr24($5, $6, $7, $8) + 16;
      if ((dest > (addr+4)) && ((dest - (addr+4)) < 240)) {
         /* forward optimization possible */
         # printf "' dest = %X\n", dest
         # printf "' addr = %X\n", addr
         print n, "word I16B_RJ_B"
      }
      else if ((dest < (addr+4)) && (((addr+4) - dest) < 240)) {
         /* reverse optimization possible */
         # printf "' dest = %X\n", dest
         # printf "' addr = %X\n", addr
         print n, "word I16B_RJ_B"
      }
      else {
         /* printf "no optimization possible\n" */
      }
   }
   else {
      n = candidate_id($0);
      if (n > 0) {
         addr = str_to_hex($1);
         dest = str_to_addr24($6);
         if ((dest > (addr+4)) && ((dest - (addr+4)) < 240)) {
            /* forward optimization possible */
            # printf "' dest = %X\n", dest
            # printf "' addr = %X\n", addr
            print n, "word I16B_RJ_B"
         }
         else if ((dest < (addr+4)) && (((addr+4) - dest) < 240)) {
            /* reverse optimization possible */
            # printf "' dest = %X\n", dest
            # printf "' addr = %X\n", addr
            print n, "word I16B_RJ_B"
         }
         else {
            /* printf "no optimization possible\n" */
         }
      }
   }   
}
/[ \t]+long[ \t]+I32_BRBE/  {
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
      dest = bytes_to_addr24($5, $6, $7, $8) + 16;
      if ((dest > (addr+4)) && ((dest - (addr+4)) < 240)) {
         /* forward optimization possible */
         # printf "' dest = %X\n", dest
         # printf "' addr = %X\n", addr
         print n, "word I16B_RJBE"
      }
      else if ((dest < (addr+4)) && (((addr+4) - dest) < 240)) {
         /* reverse optimization possible */
         # printf "' dest = %X\n", dest
         # printf "' addr = %X\n", addr
         print n, "word I16B_RJBE"
      }
      else {
         /* printf "no optimization possible\n" */
      }
   }
   else {
      n = candidate_id($0);
      if (n > 0) {
         addr = str_to_hex($1);
         dest = str_to_addr24($6);
         if ((dest > (addr+4)) && ((dest - (addr+4)) < 240)) {
            /* forward optimization possible */
            # printf "' dest = %X\n", dest
            # printf "' addr = %X\n", addr
            print n, "word I16B_RJBE"
         }
         else if ((dest < (addr+4)) && (((addr+4) - dest) < 240)) {
            /* reverse optimization possible */
            # printf "' dest = %X\n", dest
            # printf "' addr = %X\n", addr
            print n, "word I16B_RJBE"
         }
         else {
            /* printf "no optimization possible\n" */
         }
      }
   }
}

