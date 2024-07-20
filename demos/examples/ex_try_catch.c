/* 
 * TRY/CATCH example code using setjmp/longjmp taken from:
 * http://www.di.unipi.it/~nids/docs/longjump%5Ftry%5Ftrow%5Fcatch.shtml
 *
 */
#include <hmi.h>
#include <setjmp.h>

#define TRY       do{ jmp_buf ex_buf__; switch( setjmp(ex_buf__) ){ case 0: while(1){
#define CATCH(x)  break; case x:
#define FINALLY   break; } default:
#define ETRY      } }while(0)
#define THROW(x)  longjmp(ex_buf__, x)

#define FOO_EXCEPTION  (1)
#define BAR_EXCEPTION  (2)
#define BAZ_EXCEPTION  (3)

int
main(int argc, char** argv) {
   t_string(1, "Test TRY/CATCH\n");
    
   TRY
   {
      t_string(1, "In Try Statement\n");
      THROW( BAR_EXCEPTION );
      t_string(1, "Test TRY/CATCH failed if you see this line\n");
   }
   CATCH( FOO_EXCEPTION )
   {
      t_string(1, "Got Exception Foo!\n");
   }
   CATCH( BAR_EXCEPTION )
   {
      t_string(1, "Got Exception Bar!\n");
   }
   CATCH( BAZ_EXCEPTION )
   {
      t_string(1, "Got Exception Baz!\n");
   }
   FINALLY
   {
      t_string(1, "...et in arcadia Ego\n");
   }
   ETRY;

   t_string(1, "Test TRY/CATCH passed if you saw exception Bar\n");

   t_string(1, "Press any key to continue...\n");
   k_wait();

   return 0;
}
