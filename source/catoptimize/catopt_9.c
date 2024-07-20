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
a_VAR *bcl_awk = NULL;
a_VAR *bc_awk = NULL;
a_VAR *spl_awk = NULL;
a_VAR *call_awk = NULL;
a_VAR *f_awk = NULL;
a_VAR *line1_awk = NULL;
a_VAR *line2_awk = NULL;

struct gvar_struct *_gvar;

a_VAR **_lvar;
a_VAR *_litd0_awka=NULL, *_litd1_awka=NULL, *_litd2_awka=NULL, *_litd3_awka=NULL, *_litd4_awka=NULL, *_litd5_awka=NULL;
a_VAR *_lits0_awka=NULL, *_lits1_awka=NULL, *_lits2_awka=NULL, *_lits3_awka=NULL, *_lits4_awka=NULL, *_lits5_awka=NULL, *_lits6_awka=NULL, *_lits7_awka=NULL, *_lits8_awka=NULL, *_lits9_awka=NULL, *_lits10_awka=NULL, *_lits11_awka=NULL, *_lits12_awka=NULL, *_lits13_awka=NULL, *_lits14_awka=NULL, *_lits15_awka=NULL, *_lits16_awka=NULL;
a_VAR *_litr0_awka=NULL, *_litr1_awka=NULL, *_litr2_awka=NULL, *_litr3_awka=NULL, *_litr4_awka=NULL, *_litr5_awka=NULL, *_litr6_awka=NULL, *_litr7_awka=NULL;
void BEGIN();
void MAIN();

void
BEGIN()
{
  initialize_phase_9_fn(awka_arg0(a_TEMP));

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
      awka_print(NULL, 0, 0, awka_arg1(a_TEMP, awka_dol0(0)));
      goto nextrec;
    }
    if (awka_vartrue(awka_match(a_TEMP, FALSE, awka_dol0(0), _litr1_awka, NULL)))
    {
      awka_print(NULL, 0, 0, awka_arg1(a_TEMP, awka_dol0(0)));
      awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
      while (strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd0_awka)), "}"))
      {
        awka_print(NULL, 0, 0, awka_arg1(a_TEMP, awka_dol0(0)));
        awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
      }
      awka_print(NULL, 0, 0, awka_arg1(a_TEMP, awka_dol0(0)));
      goto nextrec;
    }
    if (awka_vartrue(awka_match(a_TEMP, FALSE, awka_dol0(0), _litr2_awka, NULL)))
    {
      awka_varcpy(bcl_awk, awka_dol0(0));
      awka_varcpy(bc_awk, awka_ltrim(a_TEMP, awka_arg2(a_TEMP, awka_doln(3, 0), _lits1_awka)));
      awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
      if (!strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd1_awka)), " sub SP, #"))
      {
        awka_varcpy(spl_awk, awka_dol0(0));
        awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
        if ((!strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd1_awka)), " jmp #CALA")) || !strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd2_awka)), " calld PA,#CALA"))
        {
          awka_varcpy(call_awk, awka_dol0(0));
          awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
          awka_varcpy(f_awk, awka_ltrim(a_TEMP, awka_arg2(a_TEMP, awka_doln(2, 0), _lits5_awka)));
          if (!(awka_vartrue(known_function_fn(awka_arg1(a_TEMP, f_awk)))))
          {
            awka_match(a_TEMP, FALSE, awka_dol0(0), _litr3_awka, NULL);
            awka_printf(NULL, 0, 0, awka_vararg(a_TEMP, _lits6_awka, bc_awk, NULL));
            goto __192;
          }
          awka_match(a_TEMP, FALSE, awka_dol0(0), _litr4_awka, NULL);
          awka_printf(NULL, 0, 0, awka_vararg(a_TEMP, _lits7_awka, bc_awk, NULL));
          __192:;
          awka_print(NULL, 0, 0, awka_arg1(a_TEMP, spl_awk));
          awka_print(NULL, 0, 0, awka_arg1(a_TEMP, call_awk));
          awka_printf(NULL, 0, 0, awka_vararg(a_TEMP, _lits8_awka, f_awk, NULL));
          goto __235;
        }
        awka_match(a_TEMP, FALSE, awka_dol0(0), _litr5_awka, NULL);
        awka_print(NULL, 0, 0, awka_arg1(a_TEMP, bcl_awk));
        awka_print(NULL, 0, 0, awka_arg1(a_TEMP, spl_awk));
        awka_print(NULL, 0, 0, awka_arg1(a_TEMP, awka_dol0(0)));
        __235:;
        goto __349;
      }
      if ((!strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd1_awka)), " jmp #CALA")) || !strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd2_awka)), " calld PA,#CALA"))
      {
        awka_varcpy(call_awk, awka_dol0(0));
        awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
        awka_varcpy(f_awk, awka_ltrim(a_TEMP, awka_arg2(a_TEMP, awka_doln(2, 0), _lits5_awka)));
        if (!(awka_vartrue(known_function_fn(awka_arg1(a_TEMP, f_awk)))))
        {
          awka_match(a_TEMP, FALSE, awka_dol0(0), _litr3_awka, NULL);
          awka_print(NULL, 0, 0, awka_arg1(a_TEMP, bcl_awk));
          goto __318;
        }
        awka_match(a_TEMP, FALSE, awka_dol0(0), _litr4_awka, NULL);
        awka_printf(NULL, 0, 0, awka_vararg(a_TEMP, _lits7_awka, bc_awk, NULL));
        __318:;
        awka_print(NULL, 0, 0, awka_arg1(a_TEMP, call_awk));
        awka_printf(NULL, 0, 0, awka_vararg(a_TEMP, _lits8_awka, f_awk, NULL));
        goto __349;
      }
      awka_match(a_TEMP, FALSE, awka_dol0(0), _litr5_awka, NULL);
      awka_print(NULL, 0, 0, awka_arg1(a_TEMP, bcl_awk));
      awka_print(NULL, 0, 0, awka_arg1(a_TEMP, awka_dol0(0)));
      __349:;
      goto nextrec;
    }
    if (awka_vartrue(awka_match(a_TEMP, FALSE, awka_dol0(0), _litr6_awka, NULL)))
    {
      awka_varcpy(bcl_awk, awka_dol0(0));
      awka_varcpy(bc_awk, awka_ltrim(a_TEMP, awka_arg2(a_TEMP, awka_doln(3, 0), _lits1_awka)));
      awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
      if (!strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd1_awka)), " sub SP, #"))
      {
        awka_varcpy(spl_awk, awka_dol0(0));
        awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
        if ((!strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd1_awka)), " jmp #CALA")) || !strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd2_awka)), " calld PA,#CALA"))
        {
          awka_varcpy(call_awk, awka_dol0(0));
          awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
          awka_varcpy(f_awk, awka_ltrim(a_TEMP, awka_arg2(a_TEMP, awka_doln(2, 0), _lits5_awka)));
          if (!(awka_vartrue(known_function_fn(awka_arg1(a_TEMP, f_awk)))))
          {
            awka_match(a_TEMP, FALSE, awka_dol0(0), _litr3_awka, NULL);
            awka_print(NULL, 0, 0, awka_arg1(a_TEMP, bcl_awk));
            goto __485;
          }
          awka_match(a_TEMP, FALSE, awka_dol0(0), _litr4_awka, NULL);
          awka_printf(NULL, 0, 0, awka_vararg(a_TEMP, _lits9_awka, bc_awk, NULL));
          __485:;
          awka_print(NULL, 0, 0, awka_arg1(a_TEMP, spl_awk));
          awka_print(NULL, 0, 0, awka_arg1(a_TEMP, call_awk));
          awka_printf(NULL, 0, 0, awka_vararg(a_TEMP, _lits8_awka, f_awk, NULL));
          goto __528;
        }
        awka_match(a_TEMP, FALSE, awka_dol0(0), _litr5_awka, NULL);
        awka_print(NULL, 0, 0, awka_arg1(a_TEMP, bcl_awk));
        awka_print(NULL, 0, 0, awka_arg1(a_TEMP, spl_awk));
        awka_print(NULL, 0, 0, awka_arg1(a_TEMP, awka_dol0(0)));
        __528:;
        goto __642;
      }
      if ((!strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd1_awka)), " jmp #CALA")) || !strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd2_awka)), " calld PA,#CALA"))
      {
        awka_varcpy(call_awk, awka_dol0(0));
        awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
        awka_varcpy(f_awk, awka_ltrim(a_TEMP, awka_arg2(a_TEMP, awka_doln(2, 0), _lits5_awka)));
        if (!(awka_vartrue(known_function_fn(awka_arg1(a_TEMP, f_awk)))))
        {
          awka_match(a_TEMP, FALSE, awka_dol0(0), _litr3_awka, NULL);
          awka_print(NULL, 0, 0, awka_arg1(a_TEMP, bcl_awk));
          goto __611;
        }
        awka_match(a_TEMP, FALSE, awka_dol0(0), _litr4_awka, NULL);
        awka_printf(NULL, 0, 0, awka_vararg(a_TEMP, _lits9_awka, bc_awk, NULL));
        __611:;
        awka_print(NULL, 0, 0, awka_arg1(a_TEMP, call_awk));
        awka_printf(NULL, 0, 0, awka_vararg(a_TEMP, _lits8_awka, f_awk, NULL));
        goto __642;
      }
      awka_match(a_TEMP, FALSE, awka_dol0(0), _litr5_awka, NULL);
      awka_print(NULL, 0, 0, awka_arg1(a_TEMP, bcl_awk));
      awka_print(NULL, 0, 0, awka_arg1(a_TEMP, awka_dol0(0)));
      __642:;
      goto nextrec;
    }
    if (awka_vartrue(awka_match(a_TEMP, FALSE, awka_dol0(0), _litr7_awka, NULL)))
    {
      if (!strcmp(awka_gets(awka_doln(3, 0)), "r0"))
      {
        awka_varcpy(line1_awk, awka_dol0(0));
        awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
        if ((!strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd3_awka)), "' C_")) || !strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd4_awka)), "C_"))
        {
          awka_varcpy(line2_awk, awka_dol0(0));
          awka_getline(a_TEMP, awka_dol0(2), awka_gets(a_bivar[a_FILENAME]), 0, TRUE);
          goto __715;
        }
        awka_strcpy(line2_awk, "");
        __715:;
        if ((!strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd1_awka)), " jmp #POPM")) || !strcmp(awka_gets(awka_left(a_TEMP, awka_dol0(0), _litd2_awka)), " calld PA,#POPM"))
        {
          awka_printf(NULL, 0, 0, awka_vararg(a_TEMP, _lits16_awka, line1_awk, NULL));
          goto __757;
        }
        awka_print(NULL, 0, 0, awka_arg1(a_TEMP, line1_awk));
        __757:;
        if (awka_length(line2_awk) > awka_getd(_litd5_awka))
        {
          awka_print(NULL, 0, 0, awka_arg1(a_TEMP, line2_awk));
        }
        awka_print(NULL, 0, 0, awka_arg1(a_TEMP, awka_dol0(0)));
        goto __788;
      }
      awka_print(NULL, 0, 0, awka_arg1(a_TEMP, awka_dol0(0)));
      __788:;
      goto nextrec;
    }
    awka_print(NULL, 0, 0, awka_arg1(a_TEMP, awka_dol0(0)));
    nextrec:;
  }
}

int
main(int argc, char *argv[])
{
  _max_base_gc = 3;
  _max_fn_gc = 2;

  awka_varinit(bcl_awk);
  awka_varinit(bc_awk);
  awka_varinit(spl_awk);
  awka_varinit(call_awk);
  awka_varinit(f_awk);
  awka_varinit(line1_awk);
  awka_varinit(line2_awk);

  awka_varinit(_litd0_awka); awka_setd(_litd0_awka) = 1;
  awka_varinit(_litd1_awka); awka_setd(_litd1_awka) = 10;
  awka_varinit(_litd2_awka); awka_setd(_litd2_awka) = 15;
  awka_varinit(_litd3_awka); awka_setd(_litd3_awka) = 4;
  awka_varinit(_litd4_awka); awka_setd(_litd4_awka) = 2;
  awka_varinit(_litd5_awka); awka_setd(_litd5_awka) = 0;
  awka_varinit(_lits0_awka); awka_strcpy(_lits0_awka, "}");
  awka_varinit(_lits1_awka); awka_strcpy(_lits1_awka, "#");
  awka_varinit(_lits2_awka); awka_strcpy(_lits2_awka, " sub SP, #");
  awka_varinit(_lits3_awka); awka_strcpy(_lits3_awka, " jmp #CALA");
  awka_varinit(_lits4_awka); awka_strcpy(_lits4_awka, " calld PA,#CALA");
  awka_varinit(_lits5_awka); awka_strcpy(_lits5_awka, "@");
  awka_varinit(_lits6_awka); awka_strcpy(_lits6_awka, " mov BC, ##%s\n");
  awka_varinit(_lits7_awka); awka_strcpy(_lits7_awka, "' mov BC, ##%s ' Catalina Optimized\n");
  awka_varinit(_lits8_awka); awka_strcpy(_lits8_awka, " long @%s\n");
  awka_varinit(_lits9_awka); awka_strcpy(_lits9_awka, "' mov BC, #%s ' Catalina Optimized\n");
  awka_varinit(_lits10_awka); awka_strcpy(_lits10_awka, "r0");
  awka_varinit(_lits11_awka); awka_strcpy(_lits11_awka, "' C_");
  awka_varinit(_lits12_awka); awka_strcpy(_lits12_awka, "C_");
  awka_varinit(_lits13_awka); awka_strcpy(_lits13_awka, "");
  awka_varinit(_lits14_awka); awka_strcpy(_lits14_awka, " jmp #POPM");
  awka_varinit(_lits15_awka); awka_strcpy(_lits15_awka, " calld PA,#POPM");
  awka_varinit(_lits16_awka); awka_strcpy(_lits16_awka, "' %s ' Catalina Optimized\n");
  awka_varinit(_litr0_awka); awka_strcpy(_litr0_awka, "/^'/"); awka_getre(_litr0_awka);
  awka_varinit(_litr1_awka); awka_strcpy(_litr1_awka, "/^{/"); awka_getre(_litr1_awka);
  awka_varinit(_litr2_awka); awka_strcpy(_litr2_awka, "/^[ \t]+mov[ \t]+BC,[ \t]*##/"); awka_getre(_litr2_awka);
  awka_varinit(_litr3_awka); awka_strcpy(_litr3_awka, "/* any unknown function needs BC */"); awka_getre(_litr3_awka);
  awka_varinit(_litr4_awka); awka_strcpy(_litr4_awka, "/* optimize it out */"); awka_getre(_litr4_awka);
  awka_varinit(_litr5_awka); awka_strcpy(_litr5_awka, "/* not a call to a function - reconstruct original line */"); awka_getre(_litr5_awka);
  awka_varinit(_litr6_awka); awka_strcpy(_litr6_awka, "/^[ \t]+mov[ \t]+BC,[ \t]*#/"); awka_getre(_litr6_awka);
  awka_varinit(_litr7_awka); awka_strcpy(_litr7_awka, "/^[ \t]+mov[ \t]+/"); awka_getre(_litr7_awka);

  if (!_lvar) {
    malloc( &_lvar, 32 * sizeof(a_VAR *) );
    _lvar[0] = _litd0_awka;
    _lvar[1] = _litd1_awka;
    _lvar[2] = _litd2_awka;
    _lvar[3] = _litd3_awka;
    _lvar[4] = _litd4_awka;
    _lvar[5] = _litd5_awka;
    _lvar[6] = _lits0_awka;
    _lvar[7] = _lits1_awka;
    _lvar[8] = _lits2_awka;
    _lvar[9] = _lits3_awka;
    _lvar[10] = _lits4_awka;
    _lvar[11] = _lits5_awka;
    _lvar[12] = _lits6_awka;
    _lvar[13] = _lits7_awka;
    _lvar[14] = _lits8_awka;
    _lvar[15] = _lits9_awka;
    _lvar[16] = _lits10_awka;
    _lvar[17] = _lits11_awka;
    _lvar[18] = _lits12_awka;
    _lvar[19] = _lits13_awka;
    _lvar[20] = _lits14_awka;
    _lvar[21] = _lits15_awka;
    _lvar[22] = _lits16_awka;
    _lvar[23] = _litr0_awka;
    _lvar[24] = _litr1_awka;
    _lvar[25] = _litr2_awka;
    _lvar[26] = _litr3_awka;
    _lvar[27] = _litr4_awka;
    _lvar[28] = _litr5_awka;
    _lvar[29] = _litr6_awka;
    _lvar[30] = _litr7_awka;
    _lvar[31] = NULL;
  }

  malloc( &_gvar, 8 * sizeof(struct gvar_struct) );
  awka_initgvar(0, "bcl_awk", bcl_awk);
  awka_initgvar(1, "bc_awk", bc_awk);
  awka_initgvar(2, "spl_awk", spl_awk);
  awka_initgvar(3, "call_awk", call_awk);
  awka_initgvar(4, "f_awk", f_awk);
  awka_initgvar(5, "line1_awk", line1_awk);
  awka_initgvar(6, "line2_awk", line2_awk);
  _gvar[7].name = NULL;
  _gvar[7].var  = NULL;

  malloc( &_awkafn, 1 * sizeof(struct awka_fn_struct) );
  _awkafn[0].name = NULL;
  _awkafn[0].fn   = NULL;

  awka_init(argc, argv, "0.7.5", "12 July 2001");

  _split_max = 3;
  _split_req = 1;
  _dol0_used = 1;

  BEGIN();
  MAIN();

  free(_litd0_awka);
  free(_litd1_awka);
  free(_litd2_awka);
  free(_litd3_awka);
  free(_litd4_awka);
  free(_litd5_awka);
  free(_lits0_awka->ptr); free(_lits0_awka);
  free(_lits1_awka->ptr); free(_lits1_awka);
  free(_lits2_awka->ptr); free(_lits2_awka);
  free(_lits3_awka->ptr); free(_lits3_awka);
  free(_lits4_awka->ptr); free(_lits4_awka);
  free(_lits5_awka->ptr); free(_lits5_awka);
  free(_lits6_awka->ptr); free(_lits6_awka);
  free(_lits7_awka->ptr); free(_lits7_awka);
  free(_lits8_awka->ptr); free(_lits8_awka);
  free(_lits9_awka->ptr); free(_lits9_awka);
  free(_lits10_awka->ptr); free(_lits10_awka);
  free(_lits11_awka->ptr); free(_lits11_awka);
  free(_lits12_awka->ptr); free(_lits12_awka);
  free(_lits13_awka->ptr); free(_lits13_awka);
  free(_lits14_awka->ptr); free(_lits14_awka);
  free(_lits15_awka->ptr); free(_lits15_awka);
  free(_lits16_awka->ptr); free(_lits16_awka);
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