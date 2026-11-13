/* 
 * 64 bit "infix" functions
 */

#include "int64.h"

Uint64 _int64(uint32_t hi, uint32_t lo) {
  Uint64 c;
  c.hi = hi;
  c.lo = lo;
  return c;
}

Int64 _int32(int32_t lo) {
  Uint64 c;
  c.hi = (lo < 0) ? -1 : 0;
  c.lo = lo;
  return c;
}

Uint64 _uint32(uint32_t lo) {
  Uint64 c;
  c.hi = 0;
  c.lo = lo;
  return c;
}

Int64  _add64(Int64 a, Int64 b) {
  Int64 c;
  LL_ADD(c, a, b);
  return c;
}

Int64  _sub64(Int64 a, Int64 b) {
  Int64 c;
  LL_SUB(c, a, b);
  return c;
}

Int64  _mul64(Int64 a, Int64 b) {
  Int64 c;
  LL_MUL(c, a, b);
  return c;
}

Int64  _mul32(uint32_t a, uint32_t b) {
  Int64 c;
  LL_MUL32(c, a, b);
  return c;
}

Int64  _div64(Int64 a, Int64 b) {
  Int64 c;
  LL_DIV(c, a, b);
  return c;
}

Int64  _mod64(Int64 a, Int64 b) {
  Int64 c;
  LL_MOD(c, a, b);
  return c;
}

Int64 _neg64(Int64 a) {
  Int64 c;
  LL_NEG(c, a);
  return c;
}

Uint64 _and64(Uint64 a, Uint64 b) {
  Int64 c;
  LL_AND(c, a, b);
  return c;
}

Uint64 _or64(Uint64 a, Uint64 b) {
  Int64 c;
  LL_OR(c, a, b);
  return c;
}

Uint64 _xor64(Uint64 a, Uint64 b) {
  Int64 c;
  LL_XOR(c, a, b);
  return c;
}

Uint64 _not64(Uint64 a) {
  Int64 c;
  LL_NOT(c, a);
  return c;
}

Uint64 _shl32(uint32_t a, uint32_t b) {
  Uint64 c;
  LL_ISHL(c, a, b);
  return c;
}

Uint64 _shl64(Uint64 a, uint32_t b) {
  Uint64 c;
  LL_SHL(c, a, b);
  return c;
}

Uint64 _lsr64(Uint64 a, uint32_t b) {
  Uint64 c;
  LL_USHR(c, a, b);
  return c;
}

Int64 _asr64(Int64 a, uint32_t b) {
  Int64 c;
  LL_SHR(c, a, b);
  return c;
}


