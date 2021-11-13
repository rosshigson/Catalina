#
# Parallelize - an AWK script to process propeller pragmas
#
# Compiled with AWKA 0.7.5
#
# Copyright (c) 2020 Ross Higson
#
# +----------------------------------------------------------------------------------------------------------------------+
# |                                             TERMS OF USE: MIT License                                                |
# +----------------------------------------------------------------------------------------------------------------------+
# |Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated          |
# |documentation files (the "Software"), to deal in the Software without restriction, including without limitation the   |
# |rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit|
# |persons to whom the Software is furnished to do so, subject to the following conditions:                              |
# |                                                                                                                      |
# |The above copyright notice and this permission notice shall be included in all copies or substantial portions of the  |
# |Software.                                                                                                             |
# |                                                                                                                      |
# |THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE  |
# |WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR |
# |COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR      |
# |OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.      |
# +----------------------------------------------------------------------------------------------------------------------+
#

# return true if the line begins with the specified token (and is 
# followed by the end of line, a space or a tab, or a '(' character)
function token(str, token) {
   if ((left(str, length(token)) == token) && (length(str) == length(token) || (substr(str, length(token)+1, 1) == " ") || (substr(str, length(token)+1, 1) == "\t") || (substr(str, length(token)+1, 1) == "("))) {
       return 1;
   }
   return 0;
}

# remove up to 'len' chars from the beginning of str
function remove_chars(str, len) {
   if (length(str) <= len) {
      return "";
   }
   else {
      return trim(right(str, length(str)-len));
   }
}

# print an error message about a malformed option
function malformed_option(line) {
   print pragma > "/dev/stderr"
   printf("%s:%d: propeller pragma contains malformed option '%s'\n", FILENAME, line_no, line) > "/dev/stderr"
}

# trim parentheses from start and end of string
function trim_parentheses(str) {
   if ((left(str, 1) != "(") || (right(str, 1) != ")")) {
      malformed_option(str);
   }
   return substr(str, 2, length(str) - 2);
}

# 'right' fails if we try and remove the whole string, so ... 
function my_right(str, i) {
   if (length(str) == i) {
      str = "";
   }
   else {
      str = trim(right(str, length(str)-i));
   }
   return str;
}

# count parentheses, and return the index of the ")" 
# that matches the first "(", or zero if not found
function match_paren(str, len, count, open, closed, i) {
   # printf("line = %s\n", str) > "/dev/stderr"
   len = length(str);
   if (len < 2) {
      return 0;
   }
   open = index(str,"(")
   if (open == 0) {
      return 0;
   }
   count = 1;
   i = open + 1;
   # printf("found '(' at index %d\n", open) > "/dev/stderr"
   while (i <= len) {
      if (substr(str, i, 1) == "(") {
          count++;
      }
      else if (substr(str, i, 1) == ")") {
         count--;
         closed = i;
         if (count == 0) {
            # printf("match for '(' at %d is ')' at %d\n", open, closed) > "/dev/stderr"
            return closed;
         }
      }
      i++;
   }
   # printf("no match for '(' at %d\n", open) > "/dev/stderr"
   return 0;
}

#parse line for pragma options
function get_pragma_options(line, options, i)
{
   options = 0;
   threads = "";
   ticks = "";
   factory = "";
   foreman = "";
   local = "";
   output = "";
   worker = "";
   stack = "";
   cogs = "";
   lock = "";
   name = "";
   vars = "";
   when = "";

   while (length(line) > 0) {
      # printf("line = %s\n", line);
      if (token(line, "threads")) {
          line = remove_chars(line, 7);
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else {
                threads = left(line, i);
                line = my_right(line, i);
                threads = trim_parentheses(threads);
                # printf("threads = '%s'\n", threads);
             }
          }
          else {
             malformed_option(line);
             return;
          }
          options++;
      }
      else if (token(line, "memory")) {
          line = remove_chars(line, 6);
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else {
                new_mgmt = left(line, i);
                line = my_right(line, i);
                new_mgmt = trim_parentheses(new_mgmt);
                # printf("memory = '%s'\n", new_mgmt);
                if (management == "") {
                    management = new_mgmt;
                }
                else if (management != new_mgmt) {
                   print pragma > "/dev/stderr"
                   printf("%s:%d: propeller pragma specifies conflicting memory management\n", FILENAME, line_no) > "/dev/stderr"
                }
             }
          }
          else {
             malformed_option(line);
             return;
          }
          options++;
      }
      else if (token(line, "if")) {
          line = remove_chars(line, 2);
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else {
                when = left(line, i);
                line = my_right(line, i);
                when = trim_parentheses(when);
                # printf("if = '%s'\n", when);
             }
          }
          else {
             malformed_option(line);
             return;
          }
          options++;
      }
      else if (token(line, "ticks")) {
          line = remove_chars(line, 5);
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else {
                ticks = left(line, i);
                line = my_right(line, i);
                ticks = trim_parentheses(ticks);
                # printf("ticks = '%s'\n", ticks);
             }
          }
          else {
             malformed_option(line);
             return;
          }
          options++;
      }
      else if (token(line, "factory")) {
          line = remove_chars(line, 7);
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else {
                factory = left(line, i);
                line = my_right(line, i);
                factory = trim_parentheses(factory);
                # printf("factory = '%s'\n", factory);
             }
          }
          else {
              factory = "";
          }
          options++;
      }
      else if (token(line, "foreman")) {
          line = remove_chars(line, 7);
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else {
                foreman = left(line, i);
                line = my_right(line, i);
                foreman = trim_parentheses(foreman);
                # printf("foreman = '%s'\n", foreman);
             }
          }
          else {
              foreman = "";
          }
          options++;
      }
      else if (token(line, "local")) {
          line = remove_chars(line, 5);
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else {
                local = left(line, i);
                line = my_right(line, i);
                local = trim_parentheses(local);
                gsub(",", ";", local);
                # printf("local = '%s'\n", local);
             }
          }
          else {
             malformed_option(line);
             return;
          }
          options++;
      }
      else if (token(line, "output")) {
          line = remove_chars(line, 6);
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else {
                output = left(line, i);
                line = my_right(line, i);
                output = trim_parentheses(output);
                gsub(",", ";", output);
                # printf("output = '%s'\n", output);
             }
          }
          else {
             malformed_option(line);
             return;
          }
          options++;
      }
      else if (token(line, "worker")) {
          line = remove_chars(line, 6);
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else if ((i = match_paren(line)) == 2) {
                # special case: treat worker() as worker(void)
                worker = "void";
                line = my_right(line, i);
             }
             else {
                worker = left(line, i);
                line = my_right(line, i);
                worker = trim_parentheses(worker);
                gsub(",", ";", worker);
                # printf("worker = '%s'\n", worker);
             }
          }
          else {
              worker = "";
          }
          options++;
      }
      else if (token(line, "lock")) {
          line = remove_chars(line, 4);
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else {
                lock = left(line, i);
                line = my_right(line, i);
                lock = trim_parentheses(lock);
                # printf("lock = '%s'\n", lock);
             }
          }
          else {
              lock = "";
          }
          options++;
      }
      else if (token(line, "stack")) {
          line = remove_chars(line, 5);
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else {
                stack = left(line, i);
                line = my_right(line, i);
                stack = trim_parentheses(stack);
                # printf("stack = '%s'\n", stack);
             }
          }
          else {
             malformed_option(line);
             return;
          }
          options++;
      }
      else if (token(line, "cogs")) {
          line = remove_chars(line, 4);
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else {
                cogs = left(line, i);
                line = my_right(line, i);
                cogs = trim_parentheses(cogs);
                # printf("cogs = '%s'\n", cogs);
             }
          }
          else {
             malformed_option(line);
             return;
          }
          options++;
      }
      else {
          # must be a name, with or without vars
          # printf("it's a name: %s\n", line);
          i = index(line, "(");
          j = index(line, " ");
          if ((i > 0) && (j > 0) && (j < i)) {
              # make sure we don't have multiple words before the vars!
              for (k = j; k < i; k++) {
                  if (substr(line, k, 1) != " ") {
                      i = k - 1;
                      break;
                  }
              }
          }
          if (i == 0) {
             i = length(line);
          }
          else {
             i--;
          }
          if (i > 0) {
             name = trim(left(line,i));
             line = my_right(line, i);
          }
          if (left(line, 1) == "(") {
             if ((i = match_paren(line)) == 0) {
                malformed_option(line);
                return;
             }
             else {
                vars = left(line, i);
                line = my_right(line, i);
                vars = trim_parentheses(vars);
                gsub(",", ";", vars);
                # printf("vars = '%s'\n", vars);
             }
          }
          options++;
      }
   }
   return options;
}

# set memory management if memory management has been specified, 
# and check it does not conflict with existing setting
function memory_management() {
   if (management != "") {
      if ((management == "static") || (management == "dynamic")) {
         set_memory_management(management);
      }
      else {
         if (!reported) {
            print pragma > "/dev/stderr"
            printf("%s:%d: propeller pragma specifies invalid memory management\n", FILENAME, line_no) > "/dev/stderr"
            reported = 1;
         }
      }
   }
}

BEGIN {
   line_no = 0;
   initialize_pragma();
}

/^[[:blank:]]*#pragma[[:blank:]]+propeller[[:blank:]]+worker[[:blank:]]*$/ {
   line_no++;
   # print "// processing erroneouos worker pragma\n";
   print pragma > "/dev/stderr"
   printf("%s:%d: propeller pragma does not specify input variables\n", FILENAME, line_no) > "/dev/stderr"
   next;
}

/^[[:blank:]]*#pragma[[:blank:]]+propeller[[:blank:]]+worker[[:blank:]]*\(/ {
   line_no++;
   # print "// processing anonymous worker pragma\n";
   pragma = $0
   $1 = "";
   $2 = "";
   n = get_pragma_options(trim($0));
   name = "_worker";
   if ((n == 0) || (worker == "")) {
      print pragma > "/dev/stderr"
      printf("%s:%d: propeller pragma does not specify input variables\n", FILENAME, line_no) > "/dev/stderr"
   }
   else {
      if (factory == "") {
          factory = "_factory";
      }
      if (foreman == "") {
          foreman = "_foreman";
      }
      if (stack == "") {
          stack = "200";
      }
      if (lock == "") {
          lock = "_kernel_lock";
      }
      if (cogs == "") {
          cogs = "ANY_COG";
      }
      if (threads == "") {
         threads = "10";
      }
      if (ticks == "") {
         ticks = "100";
      }

      memory_management();

      if (!known_factory(factory)) {
         define_factory(factory, foreman, stack, lock, cogs, FILENAME, line_no);
      }
      define_worker(name, worker, local, output, when, stack, factory, threads, ticks, FILENAME, line_no);
      add_line_to_worker("__main", "##worker##", FILENAME, line_no);
      add_line_to_worker("__main", name, FILENAME, line_no);
   }
   next;
}

/^[[:blank:]]*#pragma[[:blank:]]+propeller[[:blank:]]+worker[[:blank:]]*[^\(]/ {
   line_no++;
   # print "// processing named worker pragma\n";
   pragma = $0
   $1 = "";
   $2 = "";
   n = get_pragma_options(trim($0));
   if ((n == 0)||(name == "")) {
      print pragma > "/dev/stderr"
      printf("%s:%d: propeller pragma does not specify a worker '%s'\n", FILENAME, line_no, w) > "/dev/stderr"
   }
   else {
      worker = vars;
      if (factory == "") {
          factory = "_factory";
      }
      if (foreman == "") {
          foreman = "_foreman";
      }
      if (stack == "") {
          stack = "200";
      }
      if (lock == "") {
          lock = "_kernel_lock";
      }
      if (cogs == "") {
          cogs = "ANY_COG";
      }
      if (threads == "") {
         threads = "10";
      }
      if (ticks == "") {
         ticks = "100";
      }

      memory_management();

      if (!known_factory(factory)) {
         define_factory(factory, foreman, stack, lock, cogs, FILENAME, line_no);
      }
      define_worker(name, worker, local, output, when, stack, factory, threads, ticks, FILENAME, line_no);
      add_line_to_worker("__main", "##worker##", FILENAME, line_no);
      add_line_to_worker("__main", name, FILENAME, line_no);
   }
   next;
}

/^[[:blank:]]*#pragma[[:blank:]]+propeller[[:blank:]]+factory/ {
   line_no++;
   # print "// processing factory pragma\n";
   pragma = $0
   $1 = "";
   $2 = "";
   $3 = "";
   n = get_pragma_options(trim($0));

   if (n == 0) {
      factory = "_factory";
   }
   else if (factory == "") {
      if (name == "") {
         factory = "_factory";
      }
      else {
         factory = name;
      }
   }
   if (foreman == "") {
       foreman = "_foreman";
   }

   if (stack == "") {
       stack = "50";
   }
   if (lock == "") {
      lock = "_kernel_lock";
   }
   if (cogs == "") {
      cogs = "ANY_COG";
   }

   memory_management();

   define_factory(factory, foreman, stack, lock, cogs, FILENAME, line_no);
   add_line_to_worker("__main", "##factory##", FILENAME, line_no);
   add_line_to_worker("__main", name, FILENAME, line_no);
   next;
}

/^[[:blank:]]*#pragma[[:blank:]]+propeller[[:blank:]]+begin/ {
   line_no++;
   # print "// processing begin\n";
   pragma = $0
   $1 = "";
   $2 = "";
   $3 = "";
   n = get_pragma_options(trim($0));
   if (n == 0) {
      name = "_worker";
   }
   else if (worker == "") {
      if (name == "") {
         name = "_worker";
      }
   }
   else {
      name = worker;
   }

   if (collecting) {
      print pragma > "/dev/stderr"
      printf("%s:%d: propeller pragma begin cannot be nested\n", FILENAME, line_no) > "/dev/stderr"
   }
   else {
      collecting = 1;
   }

   memory_management();

   if (known_worker(name)) {
      collecting_name = name;
   }
   else {
      print pragma > "/dev/stderr"
      printf("%s:%d: propeller pragma specifies unknown worker '%s'\n", FILENAME, line_no, name) > "/dev/stderr"
   }
   add_line_to_worker("__main", "##begin##", FILENAME, line_no);
   add_line_to_worker("__main", name, FILENAME, line_no);
   next;
}


/^[[:blank:]]*#pragma[[:blank:]]+propeller[[:blank:]]+end/ {
   line_no++;
   # print "// processing end\n";
   pragma = $0
   $1 = "";
   $2 = "";
   $3 = "";
   n = get_pragma_options(trim($0));
   if (n == 0) {
      name = "_worker";
   }
   else if (worker == "") {
      if (name == "") {
         name = "_worker";
      }
   }
   else {
      name = worker;
   }

   memory_management();

   if (exclusive) {
      print pragma > "/dev/stderr"
      printf("%s:%d: propeller pragma end appears before shared '%s'\n", FILENAME, line_no, name) > "/dev/stderr"
   }
   collecting = 0;
   add_line_to_worker("__main", "##end##", FILENAME, line_no);
   add_line_to_worker("__main", name, FILENAME, line_no);
   next;
}

/^[[:blank:]]*#pragma[[:blank:]]+propeller[[:blank:]]+exclusive/ {
   line_no++;
   # print "// processing exclusive\n";
   pragma = $0
   $1 = "";
   $2 = "";
   $3 = "";
   excl_opt="";
   if ($4 == "lock") {
      $4 = "";
      excl_opt = "lock";
   }
   else if ($4  == "extern") {
      $4 = "";
      excl_opt = "extern";
   }
   n = get_pragma_options(trim($0));
   if (n == 0) {
      name = "_region";
   }
   else if (worker == "") {
      if (name == "") {
         name = "_region";
      }
   }
   else {
      name = worker;
   }

   memory_management();

   if (exclusive) {
      print pragma > "/dev/stderr"
      printf("%s:%d: propeller pragma exclusive cannot be nested\n", FILENAME, line_no) > "/dev/stderr"
   }
   else {
      exclusive = 1;
   }

   if (!known_exclusion(name)) {
      define_exclusion(name, FILENAME, line_no, excl_opt);
   }
   if (collecting) {
       # add to worker segment
      add_line_to_worker(collecting_name, "##exclusive##", FILENAME, line_no);
      add_line_to_worker(collecting_name, name, FILENAME, line_no);
   }
   else {
       # add to main_segment
      add_line_to_worker("__main", "##exclusive##", FILENAME, line_no);
      add_line_to_worker("__main", name, FILENAME, line_no);
   }
   next;
}


/^[[:blank:]]*#pragma[[:blank:]]+propeller[[:blank:]]+shared/ {
   line_no++;
   # print "// processing shared\n";
   pragma = $0
   $1 = "";
   $2 = "";
   $3 = "";
   excl_opt="";
   if ($4 == "lock") {
      $4 = "";
      excl_opt = "lock";
   }
   else if ($4  == "extern") {
      $4 = "";
      excl_opt = "extern";
   }
   n = get_pragma_options(trim($0));
   if (n == 0) {
      name = "_region";
   }
   else if (worker == "") {
      if (name == "") {
         name = "_region";
      }
   }
   else {
      name = worker;
   }

   memory_management();

   exclusive = 0;
   if (!known_exclusion(name)) {
      define_exclusion(name, FILENAME, line_no, excl_opt);
   }
   if (collecting) {
       # add to worker segment
      add_line_to_worker(collecting_name, "##shared##", FILENAME, line_no);
      add_line_to_worker(collecting_name, name, FILENAME, line_no);
   }
   else {
       # add to main_segment
      add_line_to_worker("__main", "##shared##", FILENAME, line_no);
      add_line_to_worker("__main", name, FILENAME, line_no);
   }
   next;
}

/^[[:blank:]]*#pragma[[:blank:]]+propeller[[:blank:]]+wait/ {
   line_no++;
   # print "// processing wait\n";
   pragma = $0
   $1 = "";
   $2 = "";
   $3 = my_right($3,4);
   n = get_pragma_options(trim($0));
   if (n == 0) {
      name = "_worker";
   }
   else if (worker == "") {
      if (name == "") {
         name = "_worker";
      }
   }
   else {
      name = worker;
   }

   memory_management();

   if (!known_worker(name)) {
      print pragma > "/dev/stderr"
      printf("%s:%d: propeller pragma specifies unknown worker '%s'\n", FILENAME, line_no, name) > "/dev/stderr"
   }

   add_line_to_worker("__main", "##wait##", FILENAME, line_no);
   if (vars == "") {
      add_line_to_worker("__main", name, FILENAME, line_no);
   }
   else {
      add_line_to_worker("__main", name " " vars, FILENAME, line_no);
   }
   next;
}

/^[[:blank:]]*#pragma[[:blank:]]+propeller[[:blank:]]+start/ {
   line_no++;
   # print "// processing start\n";
   pragma = $0
   $1 = "";
   $2 = "";
   $3 = "";
   n = get_pragma_options(trim($0));
   if (n == 0) {
      name = "_factory";
   }
   else if (factory == "") {
      if (name == "") {
         name = "_factory";
      }
   }
   else {
      name = factory;
   }

   memory_management();

   if (!known_factory(name)) {
      print pragma > "/dev/stderr"
      printf("%s:%d: propeller pragma specifies unknown factory '%s'\n", FILENAME, line_no, name) > "/dev/stderr"
   }
   add_line_to_worker("__main", "##start##", FILENAME, line_no);
   add_line_to_worker("__main", name, FILENAME, line_no);
   next;
}

/^[[:blank:]]*#pragma[[:blank:]]+propeller[[:blank:]]+stop/ {
   line_no++;
   # print "// processing stop\n";
   pragma = $0
   $1 = "";
   $2 = "";
   $3 = "";
   n = get_pragma_options(trim($0));
   if (n == 0) {
      name = "_factory";
   }
   else if (factory == "") {
      if (name == "") {
         name = "_factory";
      }
   }
   else {
      name = factory;
   }

   memory_management();

   if (!known_factory(name)) {
      print pragma > "/dev/stderr"
      printf("%s:%d: propeller pragma specifies unknown factory '%s'\n", FILENAME, line_no, name) > "/dev/stderr"
   }

   add_line_to_worker("__main", "##stop##", FILENAME, line_no);
   add_line_to_worker("__main", name, FILENAME, line_no);
   next;
}

/^[[:blank:]]*#pragma[[:blank:]]+propeller[[:blank:]]+lock/ {
   line_no++;
   # print "// processing lock\n" > "/dev/stderr"
   pragma = $0
   $1 = "";
   $2 = "";
   $3 = my_right($3, 4);
   n = get_pragma_options(trim($0));
   if (n == 0) {
      name = "_kernel_lock";
   }
   else if (name == "") {
      if (lock != "") {
         name = lock;
      }
      else if (vars != "") {
         name = vars;
      }
      else {
         name = "_kernel_lock";
      }
   }

   add_line_to_worker("__main", "##lock##", FILENAME, line_no);
   add_line_to_worker("__main", name, FILENAME, line_no);
   next;
}

/^[[:blank:]]*#pragma[[:blank:]]+propeller[[:blank:]]+extern/ {
   line_no++;
   # print "// processing extern\n";
   pragma = $0
   $1 = "";
   $2 = "";
   $3 = "";
   n = get_pragma_options(trim($0));
   if (n == 0) {
      name = "_kernel_lock";
   }
   else if (name == "") {
      name = "_kernel_lock";
   }

   memory_management();

   add_line_to_worker("__main", "##extern##", FILENAME, line_no);
   add_line_to_worker("__main", name, FILENAME, line_no);
   next;
}

/^[[:blank:]]*#pragma[[:blank:]]+propeller[[:blank:]]+kernel/ {
   line_no++;
   # print "// processing kernel\n";
   pragma = $0
   $1 = "";
   $2 = "";
   $3 = "";
   n = get_pragma_options(trim($0));
   if (n == 0) {
      name = "_kernel_lock";
   }
   else if (name == "") {
      name = "_kernel_lock";
   }

   memory_management();

   add_line_to_worker("__main", "##kernel##", FILENAME, line_no);
   add_line_to_worker("__main", name, FILENAME, line_no);
   next;
}

/^[[:blank:]]*#pragma[[:blank:]]+propeller/ {
   line_no++;
   pragma = $0
   print pragma > "/dev/stderr"
   printf("%s:%d: warning: propeller pragma not recognized\n", FILENAME, line_no) > "/dev/stderr"
   next;
}

/^[[:blank:]]*#pragma/ {
   line_no++;
   pragma = $0
   print pragma > "/dev/stderr"
   printf("%s:%d: warning: non-propeller pragma ignored\n", FILENAME, line_no) > "/dev/stderr"
   next;
}

{
   line_no++;
   if (collecting) {
       # collect to worker segment
       add_line_to_worker(collecting_name, $0, FILENAME, line_no);
   }
   else {
       # collect to main_segment
       add_line_to_worker("__main", $0, FILENAME, line_no);
   }
}

END {
   finalize_pragma();
}
