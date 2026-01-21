/*
 * These definitions are common for all Catalyst programs.
 *
 * This section contains user configurable options.
 *
 */
#define CATALYST_VER "Catalyst 8.8.5" // Banner string
#define AUTOFILE     "AUTOEXEC.TXT"   // auto-execution file if AUTOFILE
#define ONCEFILE     "EXECONCE.TXT"   // auto-execution file if ONCEFILE
#define MOREFILE     "____MORE.___"   // auto-execution more file if ONCEFILE
#define BIN_PATH     "/bin/"          // bin directory prefix
#ifdef __CATALINA_P2
#define MAX_CMD_LEN  1023             // maximum length of command line
#else
#define MAX_CMD_LEN  128              // maximum length of command line
#endif
#define ENV_FILE     "CATALYST.ENV"   // name of environment file
#define MAX_ENV_LEN  2048             // maximum length of environment string
#define MAX_PROMPT_LEN  20            // maximum length of prompt
#define DEFAULT_PROMPT "> "           // default prompt

#ifdef __CATALINA_liblinenoise
#define HISTORY_FILE "CATALYST.HST"   // default name of history file
#define MAX_HISTORY_LEN 100           // maximum number of history commands
#define ENABLE_FILE_COMPLETION 0      // 1 to enable use of completion file
#define ENABLE_DYNAMIC_COMPLETION 1   // 1 to enable dynamic completion
#define COMPLETION_FILE "COMPLETE.TXT" // default name of completion file
#define MAX_COMPLETION_LEN 8192       // maximum length of completion data
                                      // (seprate for file and dynamic)
#endif

#define BIN_EXT      ".BIN"
#define BIX_EXT      ".BIX"
#define LMM_EXT      ".LMM"
#define SMM_EXT      ".SMM"
#define XMM_EXT      ".XMM"

#define MAX_LUA_LEN  20               // maximum length of lua and luax command
#define LUA_CMD      "LUA"            // could be LUA or MLUA (no extension!)
#define LUA_EXT      ".LUA"

#define LUAX_CMD     "LUAX"           // could be LUAX or MLUAX (no extension!)
#define LUAX_EXT     ".LUX"

#define WINDOWS_EOL  0                // 1 = Windows style line termination
                                      // (or define Catalina symbol CR_ON_LF)

#if defined(__CATALINA_PC)||defined(__CATALINA_TTY)||defined(__CATALINA_TTY256)||defined(__CATALINA_SIMPLE)
#define SERIAL_HMI
#endif

#if WINDOWS_EOL
#define END_OF_LINE  "\r\n"           // windows style line terminator
#else
#define END_OF_LINE  "\n"             // Unix style line terminator
#endif

// Propeller 1 or Propeller 2 ...

#define ENABLE_FAT32    1             // 1 = support FAT32 (0 = FAT16 only)
#define ENABLE_DELETE   0             // 1 = delete AUTOFILE after execution

#ifdef __CATALINA_P2

// Propeller 2 ...

// On the Propeller 2 we have space to enable everything

#define ENABLE_AUTO     1             // 1 = execute cmd read from AUTOFILE
#define ENABLE_ONCE     1             // 1 = execute cmd read from ONCEFILE
#define ENABLE_LUA      1             // 1 = support Lua commands
#define ENABLE_ENV      1             // 1 = support Environment variables
#define ENABLE_SCRIPT   1             // 1 = execute multiple ONCEFILE commands

#else

// Propeller 1 ...

// On the Propeller 1 we generally do not have space to enable everything.
// It depends ont the platform, XMM and HMI type, but it usually comes down 
// to a choice between Lua commands and Scripting, and may require a little
// trial and error. 
// By default, we enable Lua commands and disable Scripting. 
//
// Note that disabling Lua commands does not disable Lua itself, it just 
// disables the auto-execution of Lua commands directly on the command line.
// Lua commands can still be executed by explicitly passing them to Lua,
// so (for example) you might have to say
//    lua list.lua *.bas
// instead of just
//    list *.bas
 
#define ENABLE_AUTO     1             // 1 = execute cmd read from AUTOFILE
#define ENABLE_ONCE     1             // 1 = execute cmd read from ONCEFILE
#define ENABLE_LUA      1             // 1 = support Lua commands
#define ENABLE_ENV      0             // 1 = support Environment variables
#define ENABLE_SCRIPT   0             // 1 = enable multiple ONCEFILE commands

#endif

// we only enable multi-CPU support on the TRIBLADEPROP
#ifdef __CATALINA_TRIBLADEPROP
#define ENABLE_CPU      1             // 1 = enable multi-cpu support
#else
#define ENABLE_CPU      0             // 1 = enable multi-cpu support
#endif

/*
 * This section contains options that MUST MATCH Catalina_Common.spin (on
 * the Propeller 1) and Catalina_constants.inc (on the Propeller 2). 
 *
 * *** DO NOT change them here without also changing those files!!! ***
 *
 * They are defined here for the C version of the Catalyst program loader.
 *
 */

#define SVC_MAX         96 

#define ARGV_MAX        24

#ifdef __CATALINA_P2

// these must match constants.inc
#define MAX_COGS        16
#define HUB_SIZE        0x7C000
#define FREE_MEM        (HUB_SIZE - 4)
#define COGSTORE        (FREE_MEM - 4)
#define XMM_CACHE_RSP   (COGSTORE - 4)
#define XMM_CACHE_CMD   (XMM_CACHE_RSP - 4)
#define REGISTRY        (XMM_CACHE_CMD - MAX_COGS*4)
#define REQUESTS        (REGISTRY - 2*SVC_MAX - MAX_COGS*4*2)
#define ARGV_0          (REQUESTS - ARGV_MAX*4)
#define ARGV_ADDR       (ARGV_0 - 4)
#define ARGC_ADDR       (ARGV_ADDR - 4)
#define DEBUG_FLAG      (ARGC_ADDR - 16)
#define DEBUG_IN        (DEBUG_FLAG - 4)
#define DEBUG_OUT       (DEBUG_IN - 4)
#define DEBUG_ADDR      (DEBUG_OUT - 4)
#define DEBUG_BREAK     (DEBUG_ADDR - 4)
#define PROXY_XFER      (DEBUG_BREAK - 4)
#define MEM_LOCK        (PROXY_XFER - 4)
#define CGI_DATA        (MEM_LOCK - 4)

#else

// These must match Catalina_Common.spin
#define HUB_SIZE        0x8000
#define FREE_MEM        (HUB_SIZE - 4)
#define COGSTORE        (FREE_MEM - 4)
#define XMM_CACHE_RSP   (COGSTORE - 4)
#define XMM_CACHE_CMD   (XMM_CACHE_RSP - 4)
#define REGISTRY        (XMM_CACHE_CMD - 8*4)
#define REQUESTS        (REGISTRY - 2*SVC_MAX - 8*4*2)
#define ARGV_0          (REQUESTS - ARGV_MAX*4)
#define ARGV_ADDR       (ARGV_0 - 2)
#define ARGC_ADDR       (ARGV_ADDR - 2)
#define DEBUG_FLAG      (ARGC_ADDR - 16)
#define DEBUG_IN        (DEBUG_FLAG - 4)
#define DEBUG_OUT       (DEBUG_IN - 4)
#define DEBUG_ADDR      (DEBUG_OUT - 4)
#define DEBUG_BREAK     (DEBUG_ADDR - 4)
#define PROXY_XFER      (DEBUG_BREAK - 4)
#define MEM_LOCK        (PROXY_XFER - 4)
#define CGI_DATA        (MEM_LOCK - 4)

#endif

#define MAX_LOAD_SIZE   4194304
#define MAX_CLUS_SIZE   32768
#define MAX_FLIST_SIZE  (MAX_LOAD_SIZE/MAX_CLUS_SIZE)
#define FLIST_LOG2      9
#define FLIST_SSIZ      (1<<FLIST_LOG2)

#define FLIST_ADDRESS   (ARGC_ADDR - (4*MAX_FLIST_SIZE))
#define FLIST_BUFF      (FLIST_ADDRESS - FLIST_SSIZ)
#define FLIST_SIOB      (FLIST_BUFF - 68)
#define FLIST_XFER      (FLIST_SIOB - 12)
#define FLIST_SECT      (FLIST_XFER - 4)
#define FLIST_SHFT      (FLIST_SECT - 4)
#define FLIST_FSIZ      (FLIST_SHFT - 4)
#define FLIST_PSTK      (FLIST_FSIZ - 4)
#define FLIST_PREG      (FLIST_PSTK - 4)

// check if we are using the cache

#if defined(__CATALINA_CACHED_1K)
#define CACHE_BYTES_LOG2 10
#define __USING_CACHE
#elif defined(__CATALINA_CACHED_2K)
#define CACHE_BYTES_LOG2 11
#define __USING_CACHE
#elif defined(__CATALINA_CACHED_4K)
#define CACHE_BYTES_LOG2 12
#define __USING_CACHE
#elif defined(__CATALINA_CACHED_8K)
#define CACHE_BYTES_LOG2 13
#define __USING_CACHE
#elif defined(__CATALINA_CACHED_16K)
#define CACHE_BYTES_LOG2 14
#define __USING_CACHE
#elif defined(__CATALINA_CACHED_32K)
#define CACHE_BYTES_LOG2 15
#define __USING_CACHE
#elif defined(__CATALINA_CACHED_64K)
#define CACHE_BYTES_LOG2 16
#define __USING_CACHE
#elif defined(__CATALINA_CACHED)
#define CACHE_BYTES_LOG2 13
#define __USING_CACHE
#endif

#ifdef __USING_CACHE

// we are using the cache

#define XMM_CACHE       (FLIST_PREG - (1<<CACHE_BYTES_LOG2))

#define RUNTIME_ALLOC   XMM_CACHE
#define LOADTIME_ALLOC  XMM_CACHE

#define CACHE_COG       7
//#ifdef __CATALINA_libpsram
// we need to reserve a cog for the PSRAM driver
//#define PSRAM_COG       6
//#define STORE_COG       5
//#define LAST_COG        4
//#else
#define STORE_COG       6
#define LAST_COG        5
//#endif

#else

// we are not using the cache

#define RUNTIME_ALLOC   CGI_DATA
#define LOADTIME_ALLOC  FLIST_PREG

#define CACHE_COG       -1
#define STORE_COG       7
#define LAST_COG        6

#endif

