#ifndef _PLUGIN__H
#define _PLUGIN__H
/*
 * The compiler expects _sys_plugin to look like this ... DO NOT ALTER!!!
 */
extern long _sys_plugin(long code, long param);

/*
 * Maximum possible number of cogs and locks (note: the current P2 has only 8
 * cogs, but a future version may have 16, so we allow for that possibility).
 */
#ifdef __CATALINA_P2
#define COG_MAX          16
#define LOCK_MAX         16
#else
#define COG_MAX           8
#define LOCK_MAX          8
#endif

/*
 * Plugin types:
 *
 * The request codes that each plugin supports are not defined here since
 * they are plugin dependent. Note the use of LMM_ is historical - the same
 * numbers are used for both LMM and XMM programs.
 *
 */
#define LMM_VMM 0
#define LMM_HMI 1
#define LMM_LIB 2
#define LMM_FLA 3
#define LMM_FLB 4
#define LMM_RTC 5
#define LMM_FIL 6
#define LMM_SIO 7
#define LMM_DUM 8
#define LMM_CGI 9
#define LMM_KBD 10
#define LMM_SCR 11
#define LMM_MOU 12
#define LMM_PRX 13
#define LMM_GAM 14
#define LMM_SND 15
#define LMM_ADC 16
#define LMM_S4  17
#define LMM_TTY 18
#define LMM_VGI 19
#define LMM_VDB 20
#define LMM_SPI 21
#define LMM_FLC 22
#define LMM_S2A 23
#define LMM_S2B 24
#define LMM_S8A 25
#define LMM_HYP 26
#define LMM_SM1 27
#define LMM_PM1 28
#define LMM_XCH 29
#define LMM_STO 30
#define LMM_P2P 31
#define LMM_RND 32
#define LMM_SVR 33

#define LMM_NUL 255

/*
 * Service types:
 *       
 * These service codes are common enough to be defined here. How they
 * map to plugin types and request codes is not defined here as this is
 * plugin dependent.
 *
 */

#define SVC_FLOAT_ADD    1 
#define SVC_FLOAT_SUB    2 
#define SVC_FLOAT_MUL    3 
#define SVC_FLOAT_DIV    4 
#define SVC_FLOAT_FLOAT  5 
#define SVC_FLOAT_TRUNC  6 
#define SVC_FLOAT_RND    7 
#define SVC_FLOAT_SQR    8 
#define SVC_FLOAT_CMP    9 
#define SVC_K_PRESENT    10
#define SVC_K_GET        11
#define SVC_K_WAIT       12
#define SVC_K_NEW        13
#define SVC_K_READY      14
#define SVC_K_CLEAR      15
#define SVC_K_STATE      16
#define SVC_M_PRESENT    17
#define SVC_M_BUTTON     18
#define SVC_M_BUTTONS    19
#define SVC_M_ABS_X      20
#define SVC_M_ABS_Y      21
#define SVC_M_ABS_Z      22
#define SVC_M_DELTA_X    23
#define SVC_M_DELTA_Y    24
#define SVC_M_DELTA_Z    25
#define SVC_M_RESET      26
#define SVC_T_GEOMETRY   27
#define SVC_T_CHAR       28
#define SVC_T_STRING     29
#define SVC_T_INT        30
#define SVC_T_UNSIGNED   31
#define SVC_T_HEX        32
#define SVC_T_BIN        33
#define SVC_T_SETPOS     34
#define SVC_T_GETPOS     35
#define SVC_T_MODE       36
#define SVC_T_SCROLL     37
#define SVC_T_COLOR      38
#define SVC_SD_INIT      39
#define SVC_SD_READ      40
#define SVC_SD_WRITE     41
#define SVC_SD_BYTEIO    42
#define SVC_SD_STOPIO    43
#define SVC_RTC_DEBUG    44
#define SVC_RTC_SETFREQ  45
#define SVC_RTC_GETCLOCK 46
#define SVC_SETTIME      47
#define SVC_RTC_GETTIME  48
#define SVC_FLOAT_SIN    49
#define SVC_FLOAT_COS    50
#define SVC_FLOAT_TAN    51
#define SVC_FLOAT_LOG    52
#define SVC_FLOAT_LOG10  53
#define SVC_FLOAT_EXP    54
#define SVC_FLOAT_EXP10  55
#define SVC_FLOAT_POW    56
#define SVC_FLOAT_FRAC   57
#define SVC_FLOAT_FMOD   58
#define SVC_FLOAT_ASIN   59
#define SVC_FLOAT_ACOS   60
#define SVC_FLOAT_ATAN   61
#define SVC_FLOAT_ATAN2  62
#define SVC_FLOAT_FLOOR  63
#define SVC_FLOAT_CEIL   64
#define SVC_T_COLOR_FG   65
#define SVC_T_COLOR_BG   66
#define SVC_GETTICKS     67
#define SVC_GETRANDOM    68
#define SVC_RESERVED     80 // 1 .. 80 reserved for Catalina use

#define SVC_MAX          96 // 81 .. 96 available for general use

/*
 * structure of a request block (used to communicate with a plugin):
 */
typedef struct {
   unsigned int request;
   unsigned int response;
} request_t;

/*
 * Structure of the cog registry - the cog registry is a list of 8 pointers 
 * to request blocks (one for each cog).
 *
 * NOTE: to use the pointers, the upper byte must be masked off since this 
 *       contains the type of the plugin registered. Macros are provided
 *       to use these values - REGISTRY_ENTRY, REGISTERED_TYPE and 
 *       REQUEST_BLOCK (see below). Here is an example of their use:
 *
 *           int type;
 *           request_t *rqst;
 *
 *           type = REGISTERED_TYPE(i);
 *           rqst = REQUEST_BLOCK(i);
 */
typedef unsigned registry_t[8];

/*
 * Structure of the service registry - the service registry is a list of words 
 * (16 bits) where each word contains:
 *
 *    Bits 15 .. 12  : 4 bits : Cog id of plugin that implements the service
 *    Bits 11 ..  7  : 5 bits : Lock id (or 0x1F if no lock)
 *    Bits  6 ..  0  : 7 bits : Plugin-specific code (0x0 if not used)
 *
 *    Unused service entries are indicated by zeroes in the lower 7 bits -
 *    they are set to $FF80 during initialization.
 *
 * NOTE: to use the entries, the global service code is used as a negative
 *       index from the base of the registry. Macros are provided such
 *       as SERVICE_ENTRY, SERVICE_COG, SERVICE_LOCK and SERVICE_CODE -
 *       see below.
 */
typedef unsigned short service_t[SVC_MAX];

/*
 * Layer 1 (registry) functions:
 */
extern unsigned _registry();
extern void _register_plugin(int cog_id, int plugin_type);
extern void _unregister_plugin(int cog_id);

/*
 * Layer 2 (cog/plugin) functions:
 */
extern int _locate_plugin(int plugin_type);
extern int _short_plugin_request(long plugin_type, long code, long param);
extern int _long_plugin_request(long plugin_type, long code, long param);
extern int _long_plugin_request_2(long plugin_type, long code, long par1, long par2);
extern float _float_request(long plugin_type, long code, float a, float b);
extern long  _long_float_request(long plugin_type, long code, float a, float b);

/*
 * Layer 3 (service) functions:
 */
extern int _short_service(long svc, long param);
extern int _long_service(long svc, long param);
extern int _long_service_2(long svc, long par1, long par2);
extern float _float_service(long svc, float a, float b);
extern long _long_float_service(long svc, float a, float b);

/*
 * macros to simplify access to the cog/plugin registry. 
 * In each case, c is the cog id (0 .. 7 on P1, 0 .. 15 on P2).
 */
#define REGISTRY_ENTRY(c)  ((*((registry_t *)(_registry())))[c])
#define REGISTERED_TYPE(c) (REGISTRY_ENTRY(c)>>24)
#define REQUEST_BLOCK(c)   ((request_t *) (REGISTRY_ENTRY(c) & 0xFFFFFF))
/*
 * macros to simplify access to the service registry. 
 * In each case, s is the service id (0 .. SVC_MAX).
 */
#define SERVICE_POINTER(s) (((unsigned short *)(_registry()))-s)
#define SERVICE_ENTRY(s)   ((*((service_t *)(_registry())))[-s])
#define SERVICE_COG(s)     (SERVICE_ENTRY(s)>>12)
#define SERVICE_LOCK(s)    ((SERVICE_ENTRY(s)>>7) & 0x1F)
#define SERVICE_CODE(s)    (SERVICE_ENTRY(s) & 0x7F)

/*
 * convenience function to return a readable name of a plugin type:
 */
char *_plugin_name(int type);

#endif
