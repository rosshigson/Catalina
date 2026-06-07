#ifndef _STDINT_H
#define _STDINT_H 1

/* Catalina target stdint.h for Cake/lcc native macOS builds. */

typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef signed short int16_t;
typedef unsigned short uint16_t;
typedef signed long int32_t;
typedef unsigned long uint32_t;
typedef signed long int64_t;
typedef unsigned long uint64_t;

typedef int8_t int_least8_t;
typedef uint8_t uint_least8_t;
typedef int16_t int_least16_t;
typedef uint16_t uint_least16_t;
typedef int32_t int_least32_t;
typedef uint32_t uint_least32_t;
typedef int64_t int_least64_t;
typedef uint64_t uint_least64_t;

typedef int8_t int_fast8_t;
typedef uint8_t uint_fast8_t;
typedef int16_t int_fast16_t;
typedef uint16_t uint_fast16_t;
typedef int32_t int_fast32_t;
typedef uint32_t uint_fast32_t;
typedef int64_t int_fast64_t;
typedef uint64_t uint_fast64_t;

typedef int32_t intptr_t;
typedef uint32_t uintptr_t;
typedef int32_t intmax_t;
typedef uint32_t uintmax_t;

#define INT8_MIN (-128)
#define INT8_MAX 127
#define UINT8_MAX 255U
#define INT16_MIN (-32767 - 1)
#define INT16_MAX 32767
#define UINT16_MAX 65535U
#define INT32_MIN (-2147483647L - 1L)
#define INT32_MAX 2147483647L
#define UINT32_MAX 4294967295UL
#define INT64_MIN INT32_MIN
#define INT64_MAX INT32_MAX
#define UINT64_MAX UINT32_MAX

#define INT_LEAST8_MIN INT8_MIN
#define INT_LEAST8_MAX INT8_MAX
#define UINT_LEAST8_MAX UINT8_MAX
#define INT_LEAST16_MIN INT16_MIN
#define INT_LEAST16_MAX INT16_MAX
#define UINT_LEAST16_MAX UINT16_MAX
#define INT_LEAST32_MIN INT32_MIN
#define INT_LEAST32_MAX INT32_MAX
#define UINT_LEAST32_MAX UINT32_MAX
#define INT_LEAST64_MIN INT64_MIN
#define INT_LEAST64_MAX INT64_MAX
#define UINT_LEAST64_MAX UINT64_MAX

#define INT_FAST8_MIN INT8_MIN
#define INT_FAST8_MAX INT8_MAX
#define UINT_FAST8_MAX UINT8_MAX
#define INT_FAST16_MIN INT16_MIN
#define INT_FAST16_MAX INT16_MAX
#define UINT_FAST16_MAX UINT16_MAX
#define INT_FAST32_MIN INT32_MIN
#define INT_FAST32_MAX INT32_MAX
#define UINT_FAST32_MAX UINT32_MAX
#define INT_FAST64_MIN INT64_MIN
#define INT_FAST64_MAX INT64_MAX
#define UINT_FAST64_MAX UINT64_MAX

#define INTPTR_MIN INT32_MIN
#define INTPTR_MAX INT32_MAX
#define UINTPTR_MAX UINT32_MAX
#define INTMAX_MIN INT32_MIN
#define INTMAX_MAX INT32_MAX
#define UINTMAX_MAX UINT32_MAX
#define SIZE_MAX UINT32_MAX
#define PTRDIFF_MIN INT32_MIN
#define PTRDIFF_MAX INT32_MAX

#define INT8_C(v) v
#define UINT8_C(v) v ## U
#define INT16_C(v) v
#define UINT16_C(v) v ## U
#define INT32_C(v) v ## L
#define UINT32_C(v) v ## UL
#define INT64_C(v) INT32_C(v)
#define UINT64_C(v) UINT32_C(v)
#define INTMAX_C(v) INT32_C(v)
#define UINTMAX_C(v) UINT32_C(v)

#define PRINTF_INT64_MODIFIER "l"
#define PRINTF_INT32_MODIFIER "l"
#define PRINTF_INT16_MODIFIER "h"
#define PRINTF_INTMAX_MODIFIER PRINTF_INT32_MODIFIER

#endif
