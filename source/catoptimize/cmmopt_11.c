/* This file generated by AWKA */

#include <libawka.h>
#include <setjmp.h>
#include <cat_functions.h>

int _split_req = 0, _split_max = INT_MAX;

extern int _dol0_used;
extern char _dol0_only;
extern char _env_used;
extern int _max_base_gc, _max_fn_gc;
extern struct awka_fn_struct *_awkafn;
jmp_buf context;
a_VAR *f_awk = NULL;

struct gvar_struct *_gvar;

a_VAR **_lvar;
a_VAR *_litd0_awka=NULL;
a_VAR *_lits0_awka=NULL;
a_VAR *_litr0_awka=NULL, *_litr1_awka=NULL, *_litr2_awka=NULL, *_litr3_awka=NULL;
void MAIN();

void
MAIN()
{
  int i, _curfile;
  if (*(awka_gets(a_bivar[a_FILENAME])) == '\0')
    awka_strcpy(a_bivar[a_FILENAME], "");
  i = setjmp(context);
  while (awka_getline(a_TEMP, awka_dol0(0), awka_gets(a_bivar[a_FILENAME]), FALSE, TRUE)->dval > 0 && awka_setNF())
  {
    if (awka_vartrue(awka_match(a_TEMP, FALSE, awka_dol0(0), _litr0_awka, NULL)))
    {
    }
    if (awka_vartrue(awka_match(a_TEMP, FALSE, awka_dol0(0), _litr1_awka, NULL)))
    {
      awka_match(a_TEMP, FALSE, awka_dol0(0), _litr2_awka, NULL);
      do
      {
        awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
      } while (strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd0_awka)), "}"));
      goto nextrec;
    }
    if (awka_vartrue(awka_match(a_TEMP, FALSE, awka_dol0(0), _litr3_awka, NULL)))
    {
      awka_varcpy(f_awk, awka_doln(1, 0));
      awka_print(NULL, 0, 0, awka_arg1(a_TEMP, f_awk));
    }
    nextrec:;
  }
}

int
main(int argc, char *argv[])
{
  _max_base_gc = 3;
  _max_fn_gc = 2;

  awka_varinit(f_awk);

  awka_varinit(_litd0_awka); awka_setd(_litd0_awka) = 1;
  awka_varinit(_lits0_awka); awka_strcpy(_lits0_awka, "}");
  awka_varinit(_litr0_awka); awka_strcpy(_litr0_awka, "/^'/"); awka_getre(_litr0_awka);
  awka_varinit(_litr1_awka); awka_strcpy(_litr1_awka, "/^{/"); awka_getre(_litr1_awka);
  awka_varinit(_litr2_awka); awka_strcpy(_litr2_awka, "/* skip code that is commented out */"); awka_getre(_litr2_awka);
  awka_varinit(_litr3_awka); awka_strcpy(_litr3_awka, "/^C_/"); awka_getre(_litr3_awka);

  if (!_lvar) {
    malloc( &_lvar, 7 * sizeof(a_VAR *) );
    _lvar[0] = _litd0_awka;
    _lvar[1] = _lits0_awka;
    _lvar[2] = _litr0_awka;
    _lvar[3] = _litr1_awka;
    _lvar[4] = _litr2_awka;
    _lvar[5] = _litr3_awka;
    _lvar[6] = NULL;
  }

  malloc( &_gvar, 2 * sizeof(struct gvar_struct) );
  awka_initgvar(0, "f_awk", f_awk);
  _gvar[1].name = NULL;
  _gvar[1].var  = NULL;

  malloc( &_awkafn, 1 * sizeof(struct awka_fn_struct) );
  _awkafn[0].name = NULL;
  _awkafn[0].fn   = NULL;

  awka_init(argc, argv, "0.7.5", "12 July 2001");

  _split_max = 1;
  _split_req = 1;
  _dol0_used = 1;

  MAIN();

  free(_litd0_awka);
  free(_lits0_awka->ptr); free(_lits0_awka);
  awka_killvar(_litr0_awka); free(_litr0_awka);
  awka_killvar(_litr1_awka); free(_litr1_awka);
  awka_killvar(_litr2_awka); free(_litr2_awka);
  awka_killvar(_litr3_awka); free(_litr3_awka);

  awka_exit(0);
}