#ifndef __CATAPULT_H
#define __CATAPULT_H

#include <cog.h>
#include <hmi.h>
#include <plugin.h>

#ifdef __CATAPULTED // file has been processed by Catalina Catapult

/*
 * define real macros that will facilitate multi-model support
 */

#ifndef CATAPULT_ERROR
#define CATAPULT_ERROR(name, address) \
{ \
   t_string(1, "Error: secondary "); \
   t_string(1, name); \
   t_string(1, " must specify address(0x"); \
   t_hex(1, (int)address); \
   t_string(1, ")\n"); \
}
#endif

#define RESERVE_SPACE(name) \
   char name##_RESERVED_SPACE[name##_RUNTIME_SIZE]

#define OVERLAY_SPACE \
   char __OVERLAY_SPACE[__OVERLAY_SIZE]

#define FIXED_START(name, arg, cog, result) \
{ \
   result = start_##name(&arg, cog); \
}

#define RESERVE_AND_START(name, arg, cog, result) \
{ \
   RESERVE_SPACE(name); \
   if (name##_CODE_ADDRESS != (int)&name##_RESERVED_SPACE) { \
      CATAPULT_ERROR(#name, &name##_RESERVED_SPACE); \
      while (1); \
   } \
   else { \
      result = start_##name(&arg, cog); \
   } \
}

#define RESERVED_ADDRESS(name) (&name##_RESERVED_SPACE)

#define RESERVED_START(name, arg, cog, result) \
{ \
   if (name##_CODE_ADDRESS != (int)RESERVED_ADDRESS(name)) { \
      CATAPULT_ERROR(#name, RESERVED_ADDRESS(name)); \
      while (1); \
   } \
   else { \
      result = start_##name(&arg, cog); \
   } \
}

#define OVERLAY_ADDRESS (&__OVERLAY_SPACE)

#define OVERLAY_START(name, arg, cog, result) \
{ \
   if (name##_CODE_ADDRESS != (int)OVERLAY_ADDRESS) { \
      CATAPULT_ERROR(#name, OVERLAY_ADDRESS); \
      while (1); \
   } \
   else { \
      result = start_##name(&arg, cog); \
   } \
}

#define STOP(cog) \
{ \
   _cogstop(cog); \
   _unregister_plugin(cog); \
}

#else

/*
 * define dummy macros that will allow the source to compile
 */

#error THIS FILE IS INTENDED TO BE COMPILED USING CATAPULT

#define RESERVED_SPACE(name)

#define OVERLAY_SPACE

#define FIXED_START(name, arg, cog, result) \
{ \
   name(&arg); \
   result = _cogid(); \
}

#define RESERVED_ADDRESS

#define RESERVED_START(name, arg, cog, result) \
{ \
   name(&arg); \
   result = _cogid(); \
}

#define RESERVE_AND_START(name, arg, cog, result) \
{ \
   name(&arg); \
   result = _cogid(); \
}

#define OVERLAY_ADDRESS

#define OVERLAY_START(name, arg, cog, result) \
{ \
   name(&arg); \
   result = _cogid(); \
}

#define STOP(cog)

#endif

#endif // __CATAPULT_H
