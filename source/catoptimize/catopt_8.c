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
a_VAR *_litd0_awka=NULL, *_litd1_awka=NULL, *_litd2_awka=NULL, *_litd3_awka=NULL;
a_VAR *_lits0_awka=NULL, *_lits1_awka=NULL, *_lits2_awka=NULL, *_lits3_awka=NULL, *_lits4_awka=NULL, *_lits5_awka=NULL, *_lits6_awka=NULL, *_lits7_awka=NULL, *_lits8_awka=NULL;
a_VAR *_litr0_awka=NULL, *_litr1_awka=NULL, *_litr2_awka=NULL, *_litr3_awka=NULL;
void BEGIN();
void MAIN();
void END();

void
BEGIN()
{
  initialize_phase_8_fn(awka_arg0(a_TEMP));

}


void
END()
{
  finalize_phase_8_fn(awka_arg0(a_TEMP));

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
      goto nextrec;
    }
    if (awka_vartrue(awka_match(a_TEMP, FALSE, awka_dol0(0), _litr1_awka, NULL)))
    {
      awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
      while (strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd0_awka)), "}"))
      {
        awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
      }
      goto nextrec;
    }
    if (awka_vartrue(awka_match(a_TEMP, FALSE, awka_dol0(0), _litr2_awka, NULL)))
    {
      awka_varcpy(f_awk, awka_doln(1, 0));
      if (awka_vartrue(known_function_fn(awka_arg1(a_TEMP, f_awk))))
      {
        awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
        if ((!strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd1_awka)), " jmp #NEWF")) || !strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd2_awka)), " calld PA,#NEWF"))
        {
          awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
        }
        if (!strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd1_awka)), " sub SP, #"))
        {
          awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
        }
        if ((!strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd1_awka)), " jmp #PSHM")) || !strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd2_awka)), " calld PA,#PSHM"))
        {
          awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
          awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
        }
        if (!strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd3_awka)), " mov RI, FP"))
        {
          awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
          if (!strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd3_awka)), " add RI, #8"))
          {
            awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
            if (!strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd3_awka)), " sub BC, #4"))
            {
              awka_match(a_TEMP, FALSE, awka_dol0(0), _litr3_awka, NULL);
              uses_BC_fn(awka_arg1(a_TEMP, f_awk));
    } } } } }
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
  awka_varinit(_litd1_awka); awka_setd(_litd1_awka) = 10;
  awka_varinit(_litd2_awka); awka_setd(_litd2_awka) = 15;
  awka_varinit(_litd3_awka); awka_setd(_litd3_awka) = 11;
  awka_varinit(_lits0_awka); awka_strcpy(_lits0_awka, "}");
  awka_varinit(_lits1_awka); awka_strcpy(_lits1_awka, " jmp #NEWF");
  awka_varinit(_lits2_awka); awka_strcpy(_lits2_awka, " calld PA,#NEWF");
  awka_varinit(_lits3_awka); awka_strcpy(_lits3_awka, " sub SP, #");
  awka_varinit(_lits4_awka); awka_strcpy(_lits4_awka, " jmp #PSHM");
  awka_varinit(_lits5_awka); awka_strcpy(_lits5_awka, " calld PA,#PSHM");
  awka_varinit(_lits6_awka); awka_strcpy(_lits6_awka, " mov RI, FP");
  awka_varinit(_lits7_awka); awka_strcpy(_lits7_awka, " add RI, #8");
  awka_varinit(_lits8_awka); awka_strcpy(_lits8_awka, " sub BC, #4");
  awka_varinit(_litr0_awka); awka_strcpy(_litr0_awka, "/^'/"); awka_getre(_litr0_awka);
  awka_varinit(_litr1_awka); awka_strcpy(_litr1_awka, "/^{/"); awka_getre(_litr1_awka);
  awka_varinit(_litr2_awka); awka_strcpy(_litr2_awka, "/^C_/"); awka_getre(_litr2_awka);
  awka_varinit(_litr3_awka); awka_strcpy(_litr3_awka, "/* it's probably not necessary to check so far */"); awka_getre(_litr3_awka);

  if (!_lvar) {
    malloc( &_lvar, 18 * sizeof(a_VAR *) );
    _lvar[0] = _litd0_awka;
    _lvar[1] = _litd1_awka;
    _lvar[2] = _litd2_awka;
    _lvar[3] = _litd3_awka;
    _lvar[4] = _lits0_awka;
    _lvar[5] = _lits1_awka;
    _lvar[6] = _lits2_awka;
    _lvar[7] = _lits3_awka;
    _lvar[8] = _lits4_awka;
    _lvar[9] = _lits5_awka;
    _lvar[10] = _lits6_awka;
    _lvar[11] = _lits7_awka;
    _lvar[12] = _lits8_awka;
    _lvar[13] = _litr0_awka;
    _lvar[14] = _litr1_awka;
    _lvar[15] = _litr2_awka;
    _lvar[16] = _litr3_awka;
    _lvar[17] = NULL;
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

  BEGIN();
  MAIN();
  END();

  free(_litd0_awka);
  free(_litd1_awka);
  free(_litd2_awka);
  free(_litd3_awka);
  free(_lits0_awka->ptr); free(_lits0_awka);
  free(_lits1_awka->ptr); free(_lits1_awka);
  free(_lits2_awka->ptr); free(_lits2_awka);
  free(_lits3_awka->ptr); free(_lits3_awka);
  free(_lits4_awka->ptr); free(_lits4_awka);
  free(_lits5_awka->ptr); free(_lits5_awka);
  free(_lits6_awka->ptr); free(_lits6_awka);
  free(_lits7_awka->ptr); free(_lits7_awka);
  free(_lits8_awka->ptr); free(_lits8_awka);
  awka_killvar(_litr0_awka); free(_litr0_awka);
  awka_killvar(_litr1_awka); free(_litr1_awka);
  awka_killvar(_litr2_awka); free(_litr2_awka);
  awka_killvar(_litr3_awka); free(_litr3_awka);

  awka_exit(0);
}
