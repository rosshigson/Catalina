cd src

rmdir /s /q catalina

set OPTIONS=-target=catalina -D__CATALINA__ -D__CATALYST__ -D__INT_BOOL__ -DTEST

cake %OPTIONS% token.c
cake %OPTIONS% hashmap.c
cake %OPTIONS% console.c
cake %OPTIONS% tokenizer.c
cake %OPTIONS% osstream.c
cake %OPTIONS% fs.c
cake %OPTIONS% options.c
cake %OPTIONS% object.c
cake %OPTIONS% expressions.c
cake %OPTIONS% pre_expressions.c
cake %OPTIONS% parser.c
cake %OPTIONS% compile.c
cake %OPTIONS% visit_defer.c
cake %OPTIONS% visit_il.c
cake %OPTIONS% flow.c
cake %OPTIONS% error.c
cake %OPTIONS% target.c
cake %OPTIONS% type.c
cake %OPTIONS% main.c
cd ..
