
// token parsing function 

extern int token_parser(unsigned char *tokstr);

// tokens 
//
// note that only characters 0x20 .. 0x7F are allowed to appear in 
// Dumbo BASIC source files, so we can use any other values as tokens

#define EOL             0
#define EOS             1 
#define TOKERR          2

#define VAR_INT         3   // integer var 
#define VAR_FLT         4   // float var (must follow EX_VAR_INT)
#define VAR_STR         5   // string var (must follow EX_VAR_FLT)
#define VAR_DIMINT      6   // integer array var
#define VAR_DIMFLT      7   // float array var (must follow EX_VAR_DIMINT)
#define VAR_DIMSTR      8   // string array var (must follow EX_VAR_DIMFLT)
#define ARG_INT         9   // integer arg 
#define ARG_FLT        10   // float arg 
#define ARG_STR        11   // string arg 
#define ARG_DIMINT     12   // integer array arg 
#define ARG_DIMFLT     13   // float array arg 
#define ARG_DIMSTR     14   // string array arg 

#define LOCK           20
#define UNLOCK         21
#define SHARED         22
#define ACCESS         23
#define AS             24
#define INPUTSTRING    25
#define VARPTR         26
#define VARPTRSTRING   27
#define USR            28
#define CALL           29

// 0x30 (32) to 0x7f (127) reserved for BASIC characters

#define VALUE         128
#define INTID         129
#define FLTID         130   // must follow INTID
#define STRID         131   // must follow FLTID
#define DIMINTID      132
#define DIMFLTID      133   // must follow DIMINTID
#define DIMSTRID      134   // must follow DIMFLTID
#define ERRID         135
#define PI            136
#define LTE           137
#define NEQ           138
#define GTE           139
#define PRINT         140
#define WRITE         141
#define OPEN          142
#define CLOSE         143
#define OUTPUT        144
#define APPEND        145
#define RANDOM        146
#define GET           147
#define PUT           148
#define CVI           149
#define CVS           150
#define CVD           151
#define FIELD         152
#define LSET          153
#define RSET          154
#define LOF           155
#define LOC           156
#define xEOF          157
#define RESUME        158
#define LET           159
#define DIM           160
#define IF            161
#define THEN          162
#define AND           163
#define OR            164
#define GOTO          165
#define INPUT         166
#define REM           167
#define FOR           168
#define TO            169
#define NEXT          170
#define STEP          171
#define READ          172      
#define DATA          173      
#define RESTORE       174   
#define END           175       
#define STOP          176      
#define GOSUB         177     
#define RETURN        178    
#define ELSE          179      
#define ON            180        
#define OPTION        181    
#define BASE          182      
#define RANDOMIZE     183 
#define WHILE         184     
#define WEND          185      
#define DEF           186       
#define DEFINT        187    
#define DEFSNG        188    
#define DEFDBL        189    
#define DEFSTR        190    
#define PEEK          191      
#define POKE          192      
#define NOT           193       
#define XOR           194       
#define EQV           195       
#define IMP           196       
#define USING         197     
#define LINE          198     
#define WIDTH         199     
#define CLEAR         200     
#define TRON          201     
#define TROFF         202     
#define ERASE         203     
#define CLS           204       
#define POS           205       
#define ERL           206       
#define ERR           207       
#define FRE           208      
#define BEEP          209      
#define ERROR         210     
#define SIN           211
#define COS           212
#define TAN           213
#define LOG           214
#define POW           215
#define SQR           216
#define MOD           217
#define ABS           218
#define LEN           219
#define ASC           220
#define ASIN          221
#define ACOS          222
#define ATAN          223
#define INT           224
#define RND           225
#define VAL           226
#define VALLEN        227
#define INSTR         228
#define SPC           229    
#define TAB           230    
#define CINT          231   
#define CSNG          232   
#define CDBL          233   
#define TIMER         234  
#define SWAP          235   
#define FIX           236    
#define ATN           237    
#define SGN           238    
#define EXP           239    
#define CHRSTRING     240
#define STRSTRING     241
#define LEFTSTRING    242
#define RIGHTSTRING   243
#define MIDSTRING     244
#define STRINGSTRING  245
#define HEXSTRING     246
#define OCTSTRING     247
#define DATESTRING    248
#define TIMESTRING    249
#define MKISTRING     250
#define MKDSTRING     251
#define MKSSTRING     252
#define INKEYSTRING   253
#define SPACESTRING   254

// Tokens beyond 254 must use an EXTEND token followed by an EX_XXXX token.
// These tokens are not returned by the token parser, but may be generated 
// when the line is tokenized, and so may be returned by gettoken(). 
// They will be returned as EXT(EX_XXXX) or ((EXTEND<<8)+EX_XXXX)

#define EXTEND        255

#define EX_ILLEGAL      0   // 0 is not a valid extended token

// macro to make extended token value

#define EXT(XXXX)      ((EXTEND<<8)+(XXXX))

