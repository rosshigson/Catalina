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
a_VAR *p_awk = NULL;
a_VAR *n_awk = NULL;
a_VAR *opt_awk = NULL;
a_VAR *d_awk = NULL;

struct gvar_struct *_gvar;

a_VAR **_lvar;
a_VAR *_litd0_awka=NULL, *_litd1_awka=NULL, *_litd2_awka=NULL, *_litd3_awka=NULL, *_litd4_awka=NULL;
a_VAR *_lits0_awka=NULL, *_lits1_awka=NULL, *_lits2_awka=NULL, *_lits3_awka=NULL, *_lits4_awka=NULL, *_lits5_awka=NULL;
a_VAR *_litr0_awka=NULL, *_litr1_awka=NULL, *_litr2_awka=NULL, *_litr3_awka=NULL, *_litr4_awka=NULL, *_litr5_awka=NULL, *_litr6_awka=NULL, *_litr7_awka=NULL;
void BEGIN();
void MAIN();

void
BEGIN()
{
  awka_vardblset(p_awk, 0);
  initialize_phase_6_fn(awka_arg0(a_TEMP));
  awka_print(NULL, 0, 0, awka_arg1(a_TEMP, _lits0_awka));

}


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
      awka_match(a_TEMP, FALSE, awka_dol0(0), _litr1_awka, NULL);
      awka_vardblset(p_awk, 100000);
      awka_print(NULL, 0, 0, awka_arg1(a_TEMP, _lits1_awka));
    }
    if (awka_vartrue(awka_match(a_TEMP, FALSE, awka_dol0(0), _litr2_awka, NULL)))
    {
      goto nextrec;
    }
    if (awka_vartrue(awka_match(a_TEMP, FALSE, awka_dol0(0), _litr3_awka, NULL)))
    {
      awka_print(NULL, 0, 0, awka_arg1(a_TEMP, awka_dol0(0)));
      goto nextrec;
    }
    if (awka_vartrue(awka_match(a_TEMP, FALSE, awka_dol0(0), _litr4_awka, NULL)))
    {
      awka_print(NULL, 0, 0, awka_arg1(a_TEMP, awka_dol0(0)));
      awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
      while (strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd2_awka)), "}"))
      {
        awka_print(NULL, 0, 0, awka_arg1(a_TEMP, awka_dol0(0)));
        awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
      }
      awka_print(NULL, 0, 0, awka_arg1(a_TEMP, awka_dol0(0)));
      goto nextrec;
    }
    if (awka_vartrue(awka_match(a_TEMP, FALSE, awka_dol0(0), _litr5_awka, NULL)))
    {
      awka_vardblset(n_awk, (p_awk->dval + awka_getd(awka_doln(8, 0))));
      awka_match(a_TEMP, FALSE, awka_dol0(0), _litr6_awka, NULL);
      awka_varcpy(opt_awk, can_optimize_fn(awka_arg1(a_TEMP, awka_doln(8, 0))));
      if (awka_length(opt_awk) != 0)
      {
        if (!strcmp(awka_gets(awka_left(a_TEMP, awka_doln(4, 0), _litd2_awka)), "("))
        {
          awka_varcpy(d_awk, awka_ltrim(a_TEMP, awka_arg2(a_TEMP, awka_doln(4, 0), _lits3_awka)));
          awka_varcpy(d_awk, awka_left(a_TEMP, d_awk, awka_tmp_dbl2var((awka_length(d_awk) - (6)))));
          goto __182;
        }
        awka_varcpy(d_awk, awka_left(a_TEMP, awka_doln(4, 0), awka_tmp_dbl2var((awka_length(awka_doln(4, 0)) - (5)))));
        __182:;
        awka_printf(NULL, 0, 0, awka_vararg(a_TEMP, _lits4_awka, opt_awk, d_awk, n_awk, n_awk, n_awk, NULL));
        goto __218;
      }
      awka_printf(NULL, 0, 0, awka_vararg(a_TEMP, _lits5_awka, awka_doln(1, 0), awka_doln(2, 0), awka_doln(3, 0), awka_doln(4, 0), NULL));
      __218:;
      goto nextrec;
    }
    if (awka_vartrue(awka_match(a_TEMP, FALSE, awka_dol0(0), _litr7_awka, NULL)))
    {
      awka_vardblset(n_awk, (p_awk->dval + awka_getd(awka_doln(8, 0))));
      awka_match(a_TEMP, FALSE, awka_dol0(0), _litr6_awka, NULL);
      awka_varcpy(opt_awk, can_optimize_fn(awka_arg1(a_TEMP, awka_doln(8, 0))));
      if (awka_length(opt_awk) != 0)
      {
        if (!strcmp(awka_gets(awka_left(a_TEMP, awka_doln(4, 0), _litd2_awka)), "("))
        {
          awka_varcpy(d_awk, awka_ltrim(a_TEMP, awka_arg2(a_TEMP, awka_doln(4, 0), _lits3_awka)));
          awka_varcpy(d_awk, awka_left(a_TEMP, d_awk, awka_tmp_dbl2var((awka_length(d_awk) - (6)))));
          goto __322;
        }
        awka_varcpy(d_awk, awka_left(a_TEMP, awka_doln(4, 0), awka_tmp_dbl2var((awka_length(awka_doln(4, 0)) - (5)))));
        __322:;
        awka_printf(NULL, 0, 0, awka_vararg(a_TEMP, _lits4_awka, opt_awk, d_awk, n_awk, n_awk, n_awk, NULL));
        goto __358;
      }
      awka_printf(NULL, 0, 0, awka_vararg(a_TEMP, _lits5_awka, awka_doln(1, 0), awka_doln(2, 0), awka_doln(3, 0), awka_doln(4, 0), NULL));
      __358:;
      goto nextrec;
    }
    awka_print(NULL, 0, 0, awka_arg1(a_TEMP, awka_dol0(0)));
    goto nextrec;
    nextrec:;
  }
}

int
main(int argc, char *argv[])
{
  _max_base_gc = 4;
  _max_fn_gc = 2;

  awka_varinit(p_awk);
  awka_varinit(n_awk);
  awka_varinit(opt_awk);
  awka_varinit(d_awk);

  awka_varinit(_litd0_awka); awka_setd(_litd0_awka) = 0;
  awka_varinit(_litd1_awka); awka_setd(_litd1_awka) = 100000;
  awka_varinit(_litd2_awka); awka_setd(_litd2_awka) = 1;
  awka_varinit(_litd3_awka); awka_setd(_litd3_awka) = 6;
  awka_varinit(_litd4_awka); awka_setd(_litd4_awka) = 5;
  awka_varinit(_lits0_awka); awka_strcpy(_lits0_awka, "' Optimized by Catalina Optimizer 1.0");
  awka_varinit(_lits1_awka); awka_strcpy(_lits1_awka, "' Optimized (pass 2) by Catalina Optimizer 1.0");
  awka_varinit(_lits2_awka); awka_strcpy(_lits2_awka, "}");
  awka_varinit(_lits3_awka); awka_strcpy(_lits3_awka, "(");
  awka_varinit(_lits4_awka); awka_strcpy(_lits4_awka, " %s + ((%s-(@:Opt_%06d-4))&$1FF)<<S16B ' Catalina Optimized %s\n alignl ' align long\n:Opt_%06d\n");
  awka_varinit(_lits5_awka); awka_strcpy(_lits5_awka, " %s %s %s %s\n");
  awka_varinit(_litr0_awka); awka_strcpy(_litr0_awka, "/^' Optimized by Catalina Optimizer /"); awka_getre(_litr0_awka);
  awka_varinit(_litr1_awka); awka_strcpy(_litr1_awka, "/* for the second pass, we use larger numbers (to avoid label collisions) */"); awka_getre(_litr1_awka);
  awka_varinit(_litr2_awka); awka_strcpy(_litr2_awka, "/^' Catalina Optimized Warning /"); awka_getre(_litr2_awka);
  awka_varinit(_litr3_awka); awka_strcpy(_litr3_awka, "/^'/"); awka_getre(_litr3_awka);
  awka_varinit(_litr4_awka); awka_strcpy(_litr4_awka, "/^{/"); awka_getre(_litr4_awka);
  awka_varinit(_litr5_awka); awka_strcpy(_litr5_awka, "/[ \t]+long[ \t]+I32_JMPA/"); awka_getre(_litr5_awka);
  awka_varinit(_litr6_awka); awka_strcpy(_litr6_awka, "/* printf(\"'optimizing %s\n\", $8) */"); awka_getre(_litr6_awka);
  awka_varinit(_litr7_awka); awka_strcpy(_litr7_awka, "/[ \t]+long[ \t]+I32_BR/"); awka_getre(_litr7_awka);

  if (!_lvar) {
    malloc( &_lvar, 20 * sizeof(a_VAR *) );
    _lvar[0] = _litd0_awka;
    _lvar[1] = _litd1_awka;
    _lvar[2] = _litd2_awka;
    _lvar[3] = _litd3_awka;
    _lvar[4] = _litd4_awka;
    _lvar[5] = _lits0_awka;
    _lvar[6] = _lits1_awka;
    _lvar[7] = _lits2_awka;
    _lvar[8] = _lits3_awka;
    _lvar[9] = _lits4_awka;
    _lvar[10] = _lits5_awka;
    _lvar[11] = _litr0_awka;
    _lvar[12] = _litr1_awka;
    _lvar[13] = _litr2_awka;
    _lvar[14] = _litr3_awka;
    _lvar[15] = _litr4_awka;
    _lvar[16] = _litr5_awka;
    _lvar[17] = _litr6_awka;
    _lvar[18] = _litr7_awka;
    _lvar[19] = NULL;
  }

  malloc( &_gvar, 5 * sizeof(struct gvar_struct) );
  awka_initgvar(0, "p_awk", p_awk);
  awka_initgvar(1, "n_awk", n_awk);
  awka_initgvar(2, "opt_awk", opt_awk);
  awka_initgvar(3, "d_awk", d_awk);
  _gvar[4].name = NULL;
  _gvar[4].var  = NULL;

  malloc( &_awkafn, 1 * sizeof(struct awka_fn_struct) );
  _awkafn[0].name = NULL;
  _awkafn[0].fn   = NULL;

  awka_init(argc, argv, "0.7.5", "12 July 2001");

  _split_max = 8;
  _split_req = 1;
  _dol0_used = 1;

  BEGIN();
  MAIN();

  free(_litd0_awka);
  free(_litd1_awka);
  free(_litd2_awka);
  free(_litd3_awka);
  free(_litd4_awka);
  free(_lits0_awka->ptr); free(_lits0_awka);
  free(_lits1_awka->ptr); free(_lits1_awka);
  free(_lits2_awka->ptr); free(_lits2_awka);
  free(_lits3_awka->ptr); free(_lits3_awka);
  free(_lits4_awka->ptr); free(_lits4_awka);
  free(_lits5_awka->ptr); free(_lits5_awka);
  awka_killvar(_litr0_awka); free(_litr0_awka);
  awka_killvar(_litr1_awka); free(_litr1_awka);
  awka_killvar(_litr2_awka); free(_litr2_awka);
  awka_killvar(_litr3_awka); free(_litr3_awka);
  awka_killvar(_litr4_awka); free(_litr4_awka);
  awka_killvar(_litr5_awka); free(_litr5_awka);
  awka_killvar(_litr6_awka); free(_litr6_awka);
  awka_killvar(_litr7_awka); free(_litr7_awka);

  awka_exit(0);
}