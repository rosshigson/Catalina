#include <prop.h>
#include <vgraphic.h>
#include "sound.h"

/*
 * TITLE: spacewar.c - Free flight space battle
 * 
 * DESCRIPTION:
 *          Based on the orinial PDP-1 SpaceWar! by Steve "Slug" Russell, Martin "Shag" Graetz and 
 *          Wayne Wiitanen, with modifications based on other implementations, and whatever struck 
 *          my fancy. 
 *
 *          SpaceWar! was hacked relentlessly by the development community in its day.  Feel free to 
 *          continue the tradition and hack away!  Send me your cool mods and I'll work them into
 *          the main release.
 * 
 * AUTHOR:  Eric Moyer
 *          Monumental thanks to Andre' LaMothe, for creating "SPACE_DEMO_001", on which this game is based.
 * 
 *          VGA support, "Cinematronics" enhancements and Catalina C version by Ross Higson.
 * 
 * CONTROLS:
 *          Two NES gamepads or a keyboard
 * 
 *                                Gamepad          Keyboard
 *              Function          Button       Player 0   Player 1
 *            ------------        ------       --------   --------
 *            Rotate Left         LEFT            j          a
 *            Rotate Right        RIGHT           k          s
 *            Shields             UP              i          w
 *            Hyperspace          DOWN            m          z
 *            Fire                A               u          q
 *            Thrust              B               o          e
 *            Start               START               SPACE
 * 
 *          The options screen is controlled by either players gamepad or keyboard.  
 *          Use UP/DOWN to choose an option, and A (or u or q) to toggle the option on or off.
 *          START or SPACE exits the option screen, or restarts the game at the GAME OVER screen.
 *
 *          During play, the amount of shield strength and fuel left for each player are shown 
 *          by horizontal bars at the top of the screen, and the number of lives left is shown
 *          by the number of small ship icons.
 *
 *
 * CATALINA COMPILE OPTIONS (note - not all combinations work on all platforms!):
 *
 *   -C GAMEPAD       : use the gamepad plugin (requires a cog)
 *   -C SW_GAMEPAD    : use the software gamepad (program is larger, but does not require a cog)
 *   -C NO_GAMEPAD    : don't use either the gamepad plugin or the software gamepad (program is smaller)
 *   -C KEYBOARD      : support the keybaord as well as the gamepad (program is larger, requires a cog)
 *   -C NO_KEYBOARD   : disable keyboard support (program is smaller, saves a cog)
 *   -C VGA_1152      : resolution is 1152x864
 *   -C VGA_1024      : resolution is 1024x768
 *   -C VGA_800       : resolution is 800x600
 *   -C VGA_640       : resolution is 640x480 - this is the default
 *   -C VGA_2_COLOR   : 2 colors (black & white) - this is the default
 *   -C VGA_4_COLOR   : 4 colors (black, red, green & white)
 *   -C DOUBLE_BUFFER : smoother graphics
 * 
 *   -lsound          : enable sound support (works on Hydra & C3 - may work on others)
 *   -lvgraphic       : required to enable graphics!
 */

//#define BFG
//#define EEPROM_GRAPHICS_ENABLE
//#define WATCH_VARIABLES
//#define PACING_OVERRUNS
//#define PACING_LED

//#define TEST_MONKEY_ENABLE   
//#define SIMPLE_BLACK_HOLE

#ifdef __CATALINA_libsound
#define SFX // enable sound effects
#endif

#define SFX_COG 0 // not currently enough RAM to load multiple kernels, so SFX cannot use a separate cog yet

#ifdef __CATALINA_BLACKBOX
#define STACK_SPACE 400 // 400 if debugging
#else
#define STACK_SPACE 300 // 300 if not debugging
#endif

/*
 * physical modeling constants (depending on selected video mode):
 */
#if defined __CATALINA_VGA_640

//#define ENABLE_ROCKS

#define SPACE_FRICTION              8          // from 0 to 15, 0 is infinite friction, 15 is 0.000001 approximately
#define MAX_SHIP_VEL                25         // maximum velocity of player's ship
#define SAR_SHIP_VEL                3          // sar by this amount
#define MAX_PROJECTILE_VEL          80
#define SCL_PROJECTILE_VEL          6          // scale by this amount
#define ANG_ROTATE                  1
#define SHL_ROTATE                  8          // shl by this amount
#define SHOT_TTL_INIT               60         // Shot time to live
#define BLACK_HOLE_GRAVITY          0x01F00000
#define GRAVITY_CLIP                0x00040000
#define SHIP_SCALE                  0x0028     //640 x 480 or less
#define P0_THRUSTER_DISTANCE        5
#define P1_THRUSTER_DISTANCE        11
#define ROR_THRUST                  10         // thrust ror by this amount
#define COLLISION_RANGE_FP          0x00080000 // Collision bounding box range, in fixed point
#define SHIP_GUN_PLACEMENT_DISTANCE 8
#define NUM_STARS                   10
#define NUM_DAMAGE_PARTICLES        3          // particles for each item of damage
#define DAMAGE_TTL_INIT             10         // time to live for damage particles

#elif defined __CATALINA_VGA_800

#ifndef __CATALINA_VGA_4_COLOR
#define ENABLE_ROCKS
#endif

#define SPACE_FRICTION              12         // from 0 to 15, 0 is infinite friction, 15 is 0.000001 approximately
#define MAX_SHIP_VEL                30         // maximum velocity of player's ship
#define SAR_SHIP_VEL                3          // sar by this amount
#define MAX_PROJECTILE_VEL          100       
#define SCL_PROJECTILE_VEL          10         // scale by this amount
#define ANG_ROTATE                  1         
#define SHL_ROTATE                  8          // shl by this amount
#define SHOT_TTL_INIT               45         // Shot time to live
#define BLACK_HOLE_GRAVITY          0x03200000
#define GRAVITY_CLIP                0x00060000
#define SHIP_SCALE                  0x0030
#define P0_THRUSTER_DISTANCE        7         
#define P1_THRUSTER_DISTANCE        16        
#define ROR_THRUST                  10         // thrust ror by this amount
#define COLLISION_RANGE_FP          0x000E0000 // Collision bounding box range, in fixed point
#define SHIP_GUN_PLACEMENT_DISTANCE 13        
#define NUM_STARS                   15        
#define NUM_DAMAGE_PARTICLES        3          // particles for each item of damage
#define DAMAGE_TTL_INIT             15         // time to live for damage particles

#elif defined __CATALINA_VGA_1024

#define ENABLE_ROCKS

#define SPACE_FRICTION              13         // from 0 to 15, 0 is infinite friction, 15 is 0.000001 approximately
#define MAX_SHIP_VEL                40         // maximum velocity of player's ship
#define SAR_SHIP_VEL                3          // sar by this amount
#define MAX_PROJECTILE_VEL          100       
#define SCL_PROJECTILE_VEL          12         // scale by this amount
#define ANG_ROTATE                  1         
#define SHL_ROTATE                  8          // shl by this amount
#define SHOT_TTL_INIT               50         // Shot time to live
#define BLACK_HOLE_GRAVITY          0x05600000
#define GRAVITY_CLIP                0x00060000
#define SHIP_SCALE                  0x003E
#define P0_THRUSTER_DISTANCE        11         
#define P1_THRUSTER_DISTANCE        22        
#define ROR_THRUST                  10         // thrust ror by this amount
#define COLLISION_RANGE_FP          0x000E0000 // Collision bounding box range, in fixed point
#define SHIP_GUN_PLACEMENT_DISTANCE 13        
#define NUM_STARS                   15        
#define NUM_DAMAGE_PARTICLES        3          // particles for each item of damage
#define DAMAGE_TTL_INIT             20         // time to live for damage particles

#elif defined __CATALINA_VGA_1152

#define SIMPLE_BLACK_HOLE

#define SPACE_FRICTION              13         // from 0 to 15, 0 is infinite friction, 15 is 0.000001 approximately
#define MAX_SHIP_VEL                30         // maximum velocity of player's ship
#define SAR_SHIP_VEL                3          // sar by this amount
#define MAX_PROJECTILE_VEL          100       
#define SCL_PROJECTILE_VEL          8          // scale by this amount
#define ANG_ROTATE                  1         
#define SHL_ROTATE                  8          // shl by this amount
#define SHOT_TTL_INIT               80         // Shot time to live
#define BLACK_HOLE_GRAVITY          0x07000000
#define GRAVITY_CLIP                0x00060000
#define SHIP_SCALE                  0x0040
#define P0_THRUSTER_DISTANCE        11         
#define P1_THRUSTER_DISTANCE        22        
#define ROR_THRUST                  10         // thrust ror by this amount
#define COLLISION_RANGE_FP          0x000E0000 // Collision bounding box range, in fixed point
#define SHIP_GUN_PLACEMENT_DISTANCE 13        
#define NUM_STARS                   15        
#define NUM_DAMAGE_PARTICLES        3          // particles for each item of damage
#define DAMAGE_TTL_INIT             20         // time to live for damage particles

#else

#define ENABLE_ROCKS

#define SPACE_FRICTION              8          // from 0 to 15, 0 is infinite friction, 15 is 0.000001 approximately
#define MAX_SHIP_VEL                25         // maximum velocity of player's ship
#define SAR_SHIP_VEL                3          // sar by this amount
#define MAX_PROJECTILE_VEL          80
#define SCL_PROJECTILE_VEL          6          // scale by this amount
#define ANG_ROTATE                  1
#define SHL_ROTATE                  8          // shl by this amount
#define SHOT_TTL_INIT               60         // Shot time to live
#define BLACK_HOLE_GRAVITY          0x01F00000
#define GRAVITY_CLIP                0x00040000
#define SHIP_SCALE                  0x0028     //640 x 480 or less
#define P0_THRUSTER_DISTANCE        5
#define P1_THRUSTER_DISTANCE        11
#define ROR_THRUST                  10         // thrust ror by this amount
#define COLLISION_RANGE_FP          0x00080000 // Collision bounding box range, in fixed point
#define SHIP_GUN_PLACEMENT_DISTANCE 8
#define NUM_STARS                   10
#define NUM_DAMAGE_PARTICLES        3          // particles for each item of damage
#define DAMAGE_TTL_INIT             10         // time to live for damage particles

#endif

//EEPROM ASSET MAP
#define EEPROM_SCREEN_TITLE       0x08000
#define EEPROM_SCREEN_OPTIONS     0x09800
#define EEPROM_SONG_GOTHIC        0x0B000
#define EEPROM_SONG_FF1_BATTLE    0x0BE52
#define EEPROM_SONG_NORTH_WALL    0x10108
#define EEPROM_SONG_GENTLE_WIND   0x117FB
#define EEPROM_SONG_LOST_LOVE     0x122B8

// Status display constants
#define PLAYER_1_STATS_X_POS      (-half_screen_width  + 10)
#define PLAYER_1_STATS_Y_POS      (+half_screen_height - 12)

#define PLAYER_0_STATS_X_POS      (+half_screen_width  - 10/2*12 - 8)
#define PLAYER_0_STATS_Y_POS      (+half_screen_height - 12)

#define STATUS_GAUGE_LENGTH        50

// game states
#define GAME_STATE_INIT      0
#define GAME_STATE_MENU      1
#define GAME_STATE_START     2
#define GAME_STATE_RUN       3

// angular constants to make object declarations easier
#define ANG_0    0x0000
#define ANG_360  0x2000
#define ANG_240  (0x2000*2/3)
#define ANG_180  (0x2000/2)
#define ANG_270  (0x2000*3/4)
#define ANG_300  (0x2000*5/6)
#define ANG_120  (0x2000/3)
#define ANG_90   (0x2000/4)
#define ANG_60   (0x2000/6)
#define ANG_45   (0x2000/8)
#define ANG_30   (0x2000/12)
#define ANG_22_5 (0x2000/16)
#define ANG_15   (0x2000/24)
#define ANG_10   (0x2000/36)
#define ANG_5    (0x2000/72)
#define ANG_1    (0x2000/360)

// player states
#define SHIP_STATE_ALIVE     0x80
#define SHIP_STATE_EXPLODING 0x7F
#define SHIP_STATE_STRICKEN  0x70
#define SHIP_STATE_DIE_DELAY 0x20
#define SHIP_STATE_DEAD      0x00

// rock states
#define ROCK_STATE_PRESENT   0x80
#define ROCK_STATE_EXPLODING 0x7F
#define ROCK_STATE_DIE_DELAY 0x20
#define ROCK_STATE_ABSENT    0x00


// control interface
#define THRUST_BUTTON_ID 1
#define FIRE_BUTTON_ID   0


// NES bit encodings
#define NES_RIGHT  0x01 // %00000001
#define NES_LEFT   0x02 // %00000010
#define NES_DOWN   0x04 // %00000100
#define NES_UP     0x08 // %00001000
#define NES_START  0x10 // %00010000
#define NES_SELECT 0x20 // %00100000
#define NES_B      0x40 // %01000000
#define NES_A      0x80 // %10000000

// Number of players
#define NUM_PLAYERS  2
#define PLAYER_0     0
#define PLAYER_1     1

// Player shots
#define NUM_SHOTS    12                     // Number of shots on screen at any time
#define PLAYER_1_SHOT_START (NUM_SHOTS / 2) // Index of first player 2 shot

// Random asteroids
#define NUM_ROCKS    2

// Objects
#define NUM_OBJECTS            (NUM_PLAYERS + NUM_SHOTS + NUM_ROCKS)
#define OBJECT_PLAYER_0        0
#define OBJECT_PLAYER_1        1
#define OBJECT_PLAYER_0_SHOT_0 NUM_PLAYERS
#define OBJECT_PLAYER_1_SHOT_0 (NUM_PLAYERS + PLAYER_1_SHOT_START)
#define OBJECT_ROCK_0          (NUM_PLAYERS + NUM_SHOTS)

// Black holes
#define BLACK_HOLE_X          0
#define BLACK_HOLE_Y          0

// Game options
#define OPTION_BLACK_HOLE      0x00000001 // %00000000_00000000_00000000_00000001
#define OPTION_SHOT_GRAVITY    0x00000002 // %00000000_00000000_00000000_00000010
#define OPTION_INERTIAL_SHOTS  0x00000004 // %00000000_00000000_00000000_00000100
#define OPTION_SHIELDS         0x00000008 // %00000000_00000000_00000000_00001000
#define OPTION_FUEL            0x00000010 // %00000000_00000000_00000000_00010000
#define OPTION_TWINKLE         0x00000020 // %00000000_00000000_00000000_00100000
#define OPTION_HYPERSPACE      0x00000040 // %00000000_00000000_00000000_01000000
#define OPTION_DAMAGE          0x00000080 // %00000000_00000000_00000000_10000000
#define OPTION_ROCKS           0x00000100 // %00000000_00000000_00000001_00000000
#define OPTION_BOUNCE          0x00000200 // %00000000_00000000_00000010_00000000
#define OPTION_NEGATIVE        0x00000400 // %00000000_00000000_00000100_00000000
#define OPTION_EXPANDED        0x00000800 // %00000000_00000000_00001000_00000000
#define OPTION_MONKEY_IS_ALIVE 0x80000000 // %10000000_00000000_00000000_00000000   // Enables input banger test

// Future options: Barriers?

//Ship Flags
#define SHIP_FLAG_SHIELDS_UP  0x01 // %00000001
#define SHIP_FLAG_THRUSTING   0x02 // %00000010
#define SHIP_FLAG_HYPERSPACE  0x04 // %00000100

//Menu Flags
#define MENU_FLAG__A_HELD                 0x01 // %00000001
#define MENU_FLAG__UP_DOWN_HELD           0x02 // %00000010
#define MENU_FLAG__REPEAT_GO_TIME_MET     0x04 // %00000100
#define MENU_FLAG__DO_REPEAT_CLICK        0x08 // %00001000

//BFG Flags
#define BFG_FLAG__OUT_OF_PLAY       0x01 // %00000001
#define BFG_FLAG__PICKUP            0x02 // %00000010
#define BFG_FLAG__HELD_BY_PLAYER_0  0x04 // %00000100
#define BFG_FLAG__HELD_BY_PLAYER_1  0x08 // %00001000
#define BFG_FLAG__DEPLOYED          0x10 // %00010000

//BFG
#define BFG_SPOKE_SIZE              50
#define BFG_HUB_SIZE                11

//Shield settings
#define SHIELD_CONSUMPTION_RATE_FXP ((STATUS_GAUGE_LENGTH << 16) / 300) // Shield consumption rate, fixed point
#define SHIELD_RADIUS               10

//Fuel settings
#define FUEL_CONSUMPTION_RATE_FXP   ((STATUS_GAUGE_LENGTH << 16) / 600) // Fuel consumption rate, fixed point
#define SHIP_HYPERSPACE_TIME        25

//Explosions
#define NUM_EXPLOSION_PARTICLES 12  // Number of particles in an explosion
#define EXPLOSION_RADIUS        30  // Explosion radius, in pixels

//Default game options
#define DEFAULT_OPTIONS       OPTION_BLACK_HOLE | OPTION_SHOT_GRAVITY | OPTION_SHIELDS | \
                              OPTION_FUEL | OPTION_INERTIAL_SHOTS | OPTION_TWINKLE | \
                              OPTION_HYPERSPACE | OPTION_DAMAGE | OPTION_ROCKS

//Vector drawing commands
#define VECTOR_MOVE           0x4000
#define VECTOR_DRAW           0x8000
#define VECTOR_END            0x0000

//Game pacing tick
#define PACING_TICK           1666666 // Target game frame rate
#define PACING_MARGIN         3000

//Black hole
#define NUM_BLACK_HOLE_PARTICLES 10

// gamepad delay (ticks)
#define GAMEPAD_DELAY         25000
#define GAMEPAD_DEBOUNCE      2500000


typedef char             byte;
typedef unsigned short   word;
typedef signed int       sint;
typedef unsigned int     uint;


// POLYGON OBJECTS

word player0_ship0[] = {
                          VECTOR_MOVE + ANG_0,                            //1
                          80,

                          VECTOR_DRAW + ANG_120 + ANG_10 + ANG_10,        //2
                          70,

                          VECTOR_DRAW + ANG_120 + ANG_10,                 //3
                          20,

                          VECTOR_DRAW + ANG_240 - ANG_10,                 //4
                          20,

                          VECTOR_DRAW + ANG_180 + ANG_10,                 //5
                          34,

                          VECTOR_DRAW + ANG_180 - ANG_10,                 //6
                          34,

                          VECTOR_DRAW + ANG_120 + ANG_10,                 //7
                          20,

                          VECTOR_MOVE + ANG_240 - ANG_10,                 //8
                          20,

                          VECTOR_DRAW + ANG_240 - ANG_10 - ANG_10,        //9
                          70,

                          VECTOR_DRAW + ANG_0,                            //10
                          80,

                          VECTOR_MOVE + ANG_90,                           //11
                          25,

                          VECTOR_DRAW + ANG_0,                            //12
                          28,

                          VECTOR_DRAW + ANG_270,                          //13
                          25,

                          VECTOR_END,
                          0
};

word player0_ship1[] = {
                          VECTOR_MOVE + ANG_0,                            //1
                          80,

                          //VECTOR_DRAW + ANG_120 + ANG_10 + ANG_10,      //2
                          //70,

                          VECTOR_DRAW + ANG_90,                           //2i
                          25,

                          VECTOR_DRAW + ANG_120 + ANG_10,                 //3
                          20,

                          VECTOR_DRAW + ANG_240 - ANG_10,                 //4
                          20,

                          VECTOR_DRAW + ANG_180 + ANG_10,                 //5
                          34,

                          VECTOR_DRAW + ANG_180 - ANG_10,                 //6
                          34,

                          VECTOR_DRAW + ANG_120 + ANG_10,                 //7
                          20,

                          VECTOR_MOVE + ANG_240 - ANG_10,                 //8
                          20,

                          VECTOR_DRAW + ANG_240 - ANG_10 - ANG_10,        //9
                          70,

                          VECTOR_DRAW + ANG_0,                            //10
                          80,

                          VECTOR_MOVE + ANG_90,                           //11
                          25,

                          VECTOR_DRAW + ANG_0,                            //12
                          28,

                          VECTOR_DRAW + ANG_270,                          //13
                          25,

                          VECTOR_END,
                          0
};

word player0_ship2[] = {
                          VECTOR_MOVE + ANG_0,                            //1
                          80,

                          VECTOR_DRAW + ANG_120 + ANG_10 + ANG_10,        //2
                          70,

                          VECTOR_DRAW + ANG_120 + ANG_10,                 //3
                          20,

                          VECTOR_DRAW + ANG_240 - ANG_10,                 //4
                          20,

                          VECTOR_DRAW + ANG_180 + ANG_10,                 //5
                          34,

                          VECTOR_DRAW + ANG_180 - ANG_10,                 //6
                          34,

                          VECTOR_DRAW + ANG_120 + ANG_10,                 //7
                          20,

                          VECTOR_MOVE + ANG_240 - ANG_10,                 //8
                          20,

                          //VECTOR_DRAW + ANG_240 - ANG_10 - ANG_10,      //9
                          //70,

                          VECTOR_DRAW + ANG_270,                          //9i
                          25,

                          VECTOR_DRAW + ANG_0,                            //10
                          80,

                          VECTOR_MOVE + ANG_90,                           //11
                          25,

                          VECTOR_DRAW + ANG_0,                            //12
                          28,

                          VECTOR_DRAW + ANG_270,                          //13
                          25,

                          VECTOR_END,
                          0
};

word player0_ship3[] = {
                          VECTOR_MOVE + ANG_0,                            //1
                          80,

                          //VECTOR_DRAW + ANG_120 + ANG_10 + ANG_10,      //2
                          //70,

                          VECTOR_DRAW + ANG_90,                           //2i
                          25,

                          VECTOR_DRAW + ANG_120 + ANG_10,                 //3
                          20,

                          VECTOR_DRAW + ANG_240 - ANG_10,                 //4
                          20,

                          //VECTOR_DRAW + ANG_180 + ANG_10,               //5
                          //34,

                          //VECTOR_DRAW + ANG_180 - ANG_10,               //6
                          //34,

                          //VECTOR_DRAW + ANG_120 + ANG_10,               //7
                          //20,

                          VECTOR_MOVE + ANG_240 - ANG_10,                 //8
                          20,

                          //VECTOR_DRAW + ANG_240 - ANG_10 - ANG_10,      //9
                          //70,

                          VECTOR_DRAW + ANG_270,                          //9i
                          25,

                          VECTOR_DRAW + ANG_0,                            //10
                          80,

                          VECTOR_MOVE + ANG_90,                           //11
                          25,

                          VECTOR_DRAW + ANG_0,                            //12
                          28,

                          VECTOR_DRAW + ANG_270,                          //13
                          25,

                          VECTOR_END,
                          0
};

word player1_ship0[] = {
                          VECTOR_MOVE + ANG_0,                            //1
                          36,

                          VECTOR_DRAW + ANG_60,                           //2
                          32,

                          VECTOR_DRAW + ANG_120,                          //3
                          32,

                          VECTOR_DRAW + ANG_180,                          //4
                          36,

                          VECTOR_DRAW + ANG_240,                          //5
                          32,

                          VECTOR_DRAW + ANG_300,                          //6
                          32,

                          VECTOR_DRAW + ANG_0,                            //7
                          36,

                          VECTOR_MOVE + ANG_0,                            //8
                          8,

                          VECTOR_DRAW + ANG_0,                            //9
                          38,

                          VECTOR_MOVE + ANG_180 - ANG_10 - ANG_10,        //10
                          30,

                          VECTOR_DRAW + ANG_180,                          //11
                          80,

                          VECTOR_DRAW + ANG_180 + ANG_10 + ANG_10,        //12
                          30,

                          VECTOR_MOVE + ANG_180 - ANG_10,                 //13
                          48,

                          VECTOR_DRAW + ANG_180 - ANG_10 - ANG_10 - ANG_5, //14
                          75,

                          VECTOR_MOVE + ANG_180 - ANG_10 - ANG_10 - ANG_10 - ANG_10 - ANG_5 - ANG_1,    //15
                          53,

                          VECTOR_DRAW + ANG_180 - ANG_10 - ANG_5 - ANG_1 - ANG_1 - ANG_1,       //16
                          120,

                          VECTOR_MOVE + ANG_180 + ANG_10,                 //17
                          48,

                          VECTOR_DRAW + ANG_180 + ANG_10 + ANG_10 + ANG_5, //18
                          75,

                          VECTOR_MOVE + ANG_180 + ANG_10 + ANG_10 + ANG_10 + ANG_10 + ANG_5 + ANG_1,    //19
                          53,

                          VECTOR_DRAW + ANG_180 + ANG_10 + ANG_5 + ANG_1 + ANG_1 + ANG_1,       //20
                          120,

                          VECTOR_END,
                          0
};


word player1_ship1[] = {
                          VECTOR_MOVE + ANG_0,                            //1
                          36,

                          VECTOR_DRAW + ANG_60,                           //2
                          32,

                          VECTOR_DRAW + ANG_120,                          //3
                          32,

                          VECTOR_DRAW + ANG_180,                          //4
                          36,

                          VECTOR_DRAW + ANG_240,                          //5
                          32,

                          VECTOR_DRAW + ANG_300,                          //6
                          32,

                          VECTOR_DRAW + ANG_0,                            //7
                          36,

                          VECTOR_MOVE + ANG_0,                            //8
                          8,

                          VECTOR_DRAW + ANG_0,                            //9
                          38,

                          VECTOR_MOVE + ANG_180 - ANG_10 - ANG_10,        //10
                          30,

                          VECTOR_DRAW + ANG_180,                          //11
                          80,

                          VECTOR_DRAW + ANG_180 + ANG_10 + ANG_10,        //12
                          30,

                          //VECTOR_MOVE + ANG_180 - ANG_10,               //13
                          //48,

                          //VECTOR_DRAW + ANG_180 - ANG_10 - ANG_10 - ANG_5, //14
                          //75,

                          //VECTOR_MOVE + ANG_180 - ANG_10 - ANG_10 - ANG_10 - ANG_10 - ANG_5 - ANG_1,    //15
                          //53,

                          //VECTOR_DRAW + ANG_180 - ANG_10 - ANG_5 - ANG_1 - ANG_1 - ANG_1,     //16
                          //120,

                          VECTOR_MOVE + ANG_180 + ANG_10,                 //17
                          48,

                          VECTOR_DRAW + ANG_180 + ANG_10 + ANG_10 + ANG_5, //18
                          75,

                          VECTOR_MOVE + ANG_180 + ANG_10 + ANG_10 + ANG_10 + ANG_10 + ANG_5 + ANG_1,    //19
                          53,

                          VECTOR_DRAW + ANG_180 + ANG_10 + ANG_5 + ANG_1 + ANG_1 + ANG_1,       //20
                          120,

                          VECTOR_END,
                          0
};

word player1_ship2[] = {
                          VECTOR_MOVE + ANG_0,                            //1
                          36,

                          VECTOR_DRAW + ANG_60,                           //2
                          32,

                          VECTOR_DRAW + ANG_120,                          //3
                          32,

                          VECTOR_DRAW + ANG_180,                          //4
                          36,

                          VECTOR_DRAW + ANG_240,                          //5
                          32,

                          VECTOR_DRAW + ANG_300,                          //6
                          32,

                          VECTOR_DRAW + ANG_0,                            //7
                          36,

                          VECTOR_MOVE + ANG_0,                            //8
                          8,

                          VECTOR_DRAW + ANG_0,                            //9
                          38,

                          VECTOR_MOVE + ANG_180 - ANG_10 - ANG_10,        //10
                          30,

                          VECTOR_DRAW + ANG_180,                          //11
                          80,

                          VECTOR_DRAW + ANG_180 + ANG_10 + ANG_10,        //12
                          30,

                          VECTOR_MOVE + ANG_180 - ANG_10,                 //13
                          48,

                          VECTOR_DRAW + ANG_180 - ANG_10 - ANG_10 - ANG_5, //14
                          75,

                          VECTOR_MOVE + ANG_180 - ANG_10 - ANG_10 - ANG_10 - ANG_10 - ANG_5 - ANG_1,    //15
                          53,

                          VECTOR_DRAW + ANG_180 - ANG_10 - ANG_5 - ANG_1 - ANG_1 - ANG_1,          //16
                          120,

                          //VECTOR_MOVE + ANG_180 + ANG_10,               //17
                          //48,

                          //VECTOR_DRAW + ANG_180 + ANG_10 + ANG_10 + ANG_5, //18
                          //75,

                          //VECTOR_MOVE + ANG_180 + ANG_10 + ANG_10 + ANG_10 + ANG_10 + ANG_5 + ANG_1,    //19
                          //53,

                          //VECTOR_DRAW + ANG_180 + ANG_10 + ANG_5 + ANG_1 + ANG_1 + ANG_1,        //20
                          //120,

                          VECTOR_END,
                          0
};


word player1_ship3[] = {
                          VECTOR_MOVE + ANG_0,                            //1
                          36,

                          VECTOR_DRAW + ANG_60,                           //2
                          32,

                          VECTOR_DRAW + ANG_120,                          //3
                          32,

                          VECTOR_DRAW + ANG_180,                          //4
                          36,

                          VECTOR_DRAW + ANG_240,                          //5
                          32,

                          VECTOR_DRAW + ANG_300,                          //6
                          32,

                          VECTOR_DRAW + ANG_0,                            //7
                          36,

                          VECTOR_MOVE + ANG_0,                            //8
                          8,

                          VECTOR_DRAW + ANG_0,                            //9
                          38,

                          //VECTOR_MOVE + ANG_180 - ANG_10 - ANG_10,      //10
                          //30,

                          //VECTOR_DRAW + ANG_180,                        //11
                          //80,

                          //VECTOR_DRAW + ANG_180 + ANG_10 + ANG_10,      //12
                          //30,

                          //VECTOR_MOVE + ANG_180 - ANG_10,               //13
                          //48,

                          //VECTOR_DRAW + ANG_180 - ANG_10 - ANG_10 - ANG_5, //14
                          //75,

                          //VECTOR_MOVE + ANG_180 - ANG_10 - ANG_10 - ANG_10 - ANG_10 - ANG_5 - ANG_1,    //15
                          //53,

                          //VECTOR_DRAW + ANG_180 - ANG_10 - ANG_5 - ANG_1 - ANG_1 - ANG_1,        //16
                          //120,

                          //VECTOR_MOVE + ANG_180 + ANG_10,               //17
                          //48,

                          //VECTOR_DRAW + ANG_180 + ANG_10 + ANG_10 + ANG_5, //18
                          //75,

                          //VECTOR_MOVE + ANG_180 + ANG_10 + ANG_10 + ANG_10 + ANG_10 + ANG_5 + ANG_1,    //19
                          //53,

                          //VECTOR_DRAW + ANG_180 + ANG_10 + ANG_5 + ANG_1 + ANG_1 + ANG_1,        //20
                          //120,

                          VECTOR_END,
                          0
};


word vectors_shield[] = {
                          VECTOR_MOVE + ANG_0,                        // Octagonal shield
                          70,

                          VECTOR_DRAW + ANG_45,
                          70,

                          VECTOR_MOVE + ANG_90,
                          70,

                          VECTOR_DRAW + ANG_90 + ANG_45,
                          70,

                          VECTOR_MOVE + ANG_180,
                          70,

                          VECTOR_DRAW + ANG_180 + ANG_45,
                          70,

                          VECTOR_MOVE + ANG_270,
                          70,

                          VECTOR_DRAW + ANG_270 + ANG_45,
                          70,

                          VECTOR_MOVE + ANG_0,
                          70,

                          VECTOR_END,
                          0
};


word vectors_rock[] = {
                          VECTOR_MOVE + ANG_0,
                          70,

                          VECTOR_DRAW + (ANG_1 * 50),
                          75,

                          VECTOR_DRAW + (ANG_1 * 100),
                          70,

                          VECTOR_DRAW + (ANG_1 * 140),
                          50,

                          VECTOR_DRAW + (ANG_1 * 170),
                          75,

                          VECTOR_DRAW + (ANG_1 * 200),
                          65,

                          VECTOR_DRAW + (ANG_1 * 250),
                          50,

                          VECTOR_DRAW + (ANG_1 * 320),
                          70,

                          VECTOR_DRAW + (ANG_1 * 350),
                          40,

                          VECTOR_DRAW + ANG_0,
                          70,

                          VECTOR_END,
                          0
};

#ifdef BFG
word vectors_bfg[] = {
                          VECTOR_MOVE + ANG_0,
                          BFG_SPOKE_SIZE,

                          VECTOR_DRAW + (ANG_1 * 60),
                          BFG_HUB_SIZE,

                          VECTOR_DRAW + (ANG_1 * 120),
                          BFG_SPOKE_SIZE,

                          VECTOR_DRAW + (ANG_1 * 180),
                          BFG_HUB_SIZE,

                          VECTOR_DRAW + (ANG_1 * 240),
                          BFG_SPOKE_SIZE,

                          VECTOR_DRAW + (ANG_1 * 300),
                          BFG_HUB_SIZE,

                          VECTOR_DRAW + ANG_0,
                          BFG_SPOKE_SIZE,

                          VECTOR_END,
                          0
};
#endif

#ifdef WATCH_VARIABLES
byte fixed_pt_string_0[]  = "-00000.0000";
byte int_string_0[]       = "-00000";
#endif

byte title1_string[]      = "SPACEWAR!";
byte version_string[]     = "4.0 (CATALINA VGA)";
byte title3_string[]      = "WRITTEN BY ERIC MOYER";
byte title4_string[]      = "VGA AND CATALINA VERSION BY ROSS HIGSON";
byte title_start_string[] = "PRESS <START> TO BEGIN";

byte game_over_string[]   = "GAME OVER";
byte game_over_restart[]  = "PRESS <START>";

byte options_string[]     = "OPTIONS - UP/DOWN SELECTS, 'A' CHANGES";

byte *option_strings[]   = {
                            "BLACK HOLE",
                            "SHOT GRAVITY",
                            "INERTIAL SHOTS",
                            "SHIELDS",
                            "FUEL",
                            "TWINKLE",
                            "HYPERSPACE",
                            "SHIP DAMAGE",
                            "RANDOM ROCKS",
                            "BOUNCE BACK",
                            "NEGATIVE GRAVITY",
                            "EXPANDED UNIVERSE",
#ifdef BFG
                            "BFG",
#endif
                            "\xFF"
};

byte on_string[]        = "ON";
byte off_string[]       = "OFF";

// screen geometry
sint color_mode;
sint x_tiles;
sint y_tiles;
sint screen_width;
sint half_screen_width;
sint screen_height;
sint half_screen_height;

// common object properties
sint object_x[NUM_OBJECTS];
sint object_y[NUM_OBJECTS];
sint object_dx[NUM_OBJECTS];
sint object_dy[NUM_OBJECTS];

// player's ship
byte ship_state[NUM_PLAYERS];
byte ship_flags[NUM_PLAYERS];
sint ship_shield_power_fxp[NUM_PLAYERS];
sint ship_fuel_fxp[NUM_PLAYERS];
byte lives[NUM_PLAYERS];
byte damage[NUM_PLAYERS];
sint ship_angle[NUM_PLAYERS];
sint thrust_dx[NUM_PLAYERS];
sint thrust_dy[NUM_PLAYERS];
sint friction_dx[NUM_PLAYERS];
sint friction_dy[NUM_PLAYERS];
sint bforce_dx[NUM_PLAYERS];
sint bforce_dy[NUM_PLAYERS];
sint player_nes_buttons[NUM_PLAYERS];
sint score[NUM_PLAYERS];

word * player0_ship[4] = { 
   player0_ship0, 
   player0_ship1, 
   player0_ship2, 
   player0_ship3 
};

word * player1_ship[4] = { 
   player1_ship0, 
   player1_ship1, 
   player1_ship2, 
   player1_ship3
};

#ifdef BFG
// bfg
sint bfg_x;
sint bfg_y;
byte bfg_flags;
#endif

#ifdef ENABLE_ROCKS
// rock
sint rock_state[NUM_ROCKS]; // present, exploding or absent
sint rock_scale[NUM_ROCKS]; // floating point
sint rock_angle[NUM_ROCKS];
sint rock_spin[NUM_ROCKS];
#endif

// explosion particles
sint explosion_dx_fxp[NUM_EXPLOSION_PARTICLES]; // particle delta x (fixed point)
sint explosion_dy_fxp[NUM_EXPLOSION_PARTICLES]; // particle delta y (fixed point)

// damage particles
sint damage_x[NUM_DAMAGE_PARTICLES*4];    // particle x
sint damage_y[NUM_DAMAGE_PARTICLES*4];    // particle y
sint damage_dx[NUM_DAMAGE_PARTICLES*4];   // particle delta x
sint damage_dy[NUM_DAMAGE_PARTICLES*4];   // particle delta y
byte damage_ttl[NUM_DAMAGE_PARTICLES*4];  // particle time to live

// player's shots
word shot_time_to_live[NUM_SHOTS];

// ship time to remain in hyperspace
byte hyper_time[NUM_PLAYERS];

// stars
sint star_x[NUM_STARS];
sint star_y[NUM_STARS];

sint random_var;      // global random variable

byte fire_debounce;   // button debounce

// nes gamepad vars
sint nes_buttons;
sint button_temp;

// black hole
sint black_hole_particle_mask;
sint black_hole_particle_angle[NUM_BLACK_HOLE_PARTICLES];
sint black_hole_particle_radius[NUM_BLACK_HOLE_PARTICLES];

// game mode options
sint game_options;

#if defined(PACING_OVERRUNS) || defined(PACING_LED)
// pacing
sint pacing_cnt;
sint pacing_target;
sint pacing_wrapped_target;
#endif

#ifdef SFX

void SFX_Manager();

void SFX_stop_ship_action_sounds(sint player);

sint sfx_flags;

sint thrust_snd_flag;
sint shield_snd_flag;
word sfx_cnt_ship0_shot;
word sfx_cnt_ship1_shot;
byte sfx_cnt_shield;
byte shield_snd_ascending;

#define SFX_SND_SHIP0_SHOT_START 0x0001 // %00000000_00000001
#define SFX_SND_SHIP0_SHOT       0x0002 // %00000000_00000010
#define SFX_SND_SHIP1_SHOT_START 0x0004 // %00000000_00000100
#define SFX_SND_SHIP1_SHOT       0x0008 // %00000000_00001000
#define SFX_SND_SHIP0_THRUST     0x0010 // %00000000_00010000
#define SFX_SND_SHIP1_THRUST     0x0020 // %00000000_00100000
#define SFX_SND_SHIP0_SHIELD     0x0040 // %00000000_01000000
#define SFX_SND_SHIP1_SHIELD     0x0080 // %00000000_10000000
#define SFX_SND_EXPLODE          0x0100 // %00000001_00000000
#define SFX_SND_SHIELD_SUSTATIN  0x0200 // %00000010_00000000
#define SFX_SND_DAMAGE           0x0400 // %00000100_00000000

#if SFX_COG

// SFX_Manager has own cog:
#define SFX_SHOT_SOUND_COUNT     511
#define SFX_SHIELD_CNT_CYCLE     255
#define SFX_SHOT_SCALE           2
#define SFX_SHOT_DIVISOR         60

// sound effects process stack
#define SFX_STACK_SIZE 50
unsigned long sfx_stack[SFX_STACK_SIZE];

#else

// SFX_Manager does not have own cog:
#define SFX_SHOT_SOUND_COUNT     20
#define SFX_SHIELD_CNT_CYCLE     10
#define SFX_SHOT_SCALE           20
#define SFX_SHOT_DIVISOR         15

#endif

#endif



// return square root of integer
uint square_root(uint n) {
   uint root = 0, bit, trial;
   bit = (n >= 0x10000) ? 1<<30 : 1<<14;
   do {
      trial = root+bit;
      if (n >= trial) {
         n -= trial;
         root = trial+bit;
      }
      root >>= 1;
      bit  >>= 2;
   } while (bit);
   return root;
}

// return keystate of key (if keyboard enabled) or 0 (if no keyboard)
#ifdef __CATALINA_NO_KEYBOARD
#define keystate(key) (0)
#else
#define keystate(key) (gk_state(key))
#endif

#ifdef ENABLE_ROCKS
void KillRock(sint rock_index) {
   if (rock_state[rock_index] == ROCK_STATE_PRESENT) {
     rock_state[rock_index] = ROCK_STATE_EXPLODING;
   }
#ifdef SFX
   sfx_flags |= SFX_SND_EXPLODE;
#endif
}
#endif

void KillPlayer(sint player_index) {
   if (lives[player_index] > 0) {
     --lives[player_index];
   }
   ship_state[player_index] = SHIP_STATE_EXPLODING;
#ifdef SFX
   sfx_flags |= SFX_SND_EXPLODE;
   SFX_stop_ship_action_sounds(player_index);
#endif
}

sint Rand_Range(sint rstart, sint rend) {
   sint r_delta, result;
   // returns a random number from [rstart to rend] inclusive
   r_delta = rend - rstart + 1;
   random_var = _rand_forward(random_var);
   result = rstart + ((random_var & 0x7FFFFFFF) % r_delta);
   return result;
}

void ShotDamage(sint player_index, sint shot_index) {
   int new_damage, i, j;
   //only process live shots
   if (shot_time_to_live[shot_index] > 0) {
     if ((damage[player_index] >= 3) 
     ||  (shot_time_to_live[shot_index] > (SHOT_TTL_INIT*3/4)) 
     ||  !(game_options & OPTION_DAMAGE)) {
       //definite kill if already badly damaged, or if short range
       KillPlayer(player_index);
     }
     else {
       //just more damage
       if (damage[player_index] == 0) {
         new_damage = Rand_Range(0,1);
         damage[player_index] = new_damage + 1;
       }
       else {
         new_damage = 2 - damage[player_index];
         damage[player_index] = 3;
       }
        //show some debris
       for (i = 0; i < NUM_DAMAGE_PARTICLES - 1; i++) {
          j = NUM_DAMAGE_PARTICLES * (player_index * 2 + new_damage) + i;
          damage_x[j] = object_x[player_index]>>16;
          damage_y[j] = object_y[player_index]>>16;
          damage_dx[j] = Rand_Range(-2,2);
          damage_dy[j] = Rand_Range(-2,2);
          damage_ttl[j] = DAMAGE_TTL_INIT;
       }
#ifdef SFX
       sfx_flags |= SFX_SND_DAMAGE;
#endif

     }
#ifdef SFX
     SFX_stop_ship_action_sounds(player_index);
#endif
   }
}

void ShotToShip(sint shot_index, sint player_index) {
   if ((ship_state[player_index] == SHIP_STATE_ALIVE)
   &&  !(ship_flags[player_index] & SHIP_FLAG_SHIELDS_UP)) {
      if ((object_x[shot_index+OBJECT_PLAYER_0_SHOT_0] > (object_x[player_index] - COLLISION_RANGE_FP))
      &&  (object_x[shot_index+OBJECT_PLAYER_0_SHOT_0] < (object_x[player_index] + COLLISION_RANGE_FP))) {
         if ((object_y[shot_index+OBJECT_PLAYER_0_SHOT_0] > (object_y[player_index] - COLLISION_RANGE_FP))
         &&  (object_y[shot_index+OBJECT_PLAYER_0_SHOT_0] < (object_y[player_index] + COLLISION_RANGE_FP))) {
           //kill or damage - depends on range
           ShotDamage(player_index,shot_index);
           //absorb the shot
           shot_time_to_live[shot_index] = 0;
         }
      }
   }
}

#ifdef ENABLE_ROCKS
void ShotToRock(sint shot_index, sint rock_index) {
   if (rock_state[rock_index] == ROCK_STATE_PRESENT) {
      if ((object_x[shot_index+OBJECT_PLAYER_0_SHOT_0] > (object_x[rock_index+OBJECT_ROCK_0] - COLLISION_RANGE_FP))
      &&  (object_x[shot_index+OBJECT_PLAYER_0_SHOT_0] < (object_x[rock_index+OBJECT_ROCK_0] + COLLISION_RANGE_FP))) {
         if ((object_y[shot_index+OBJECT_PLAYER_0_SHOT_0] > (object_y[rock_index+OBJECT_ROCK_0] - COLLISION_RANGE_FP))
         &&  (object_y[shot_index+OBJECT_PLAYER_0_SHOT_0] < (object_y[rock_index+OBJECT_ROCK_0] + COLLISION_RANGE_FP))) {
            KillRock(rock_index);
            //absorb the shot
            shot_time_to_live[shot_index] = 0;
         }
      }
   }
}
#endif

#ifdef WATCH_VARIABLES
void Int_To_String(byte *str, sint i) {
   sint t;

   // does an sprintf(str, "%05d", i); job
   str += 4;
   for (t = 0; t <= 4; t++) {
      *str = 48 + (i % 10);
      i /= 10;
      str--;
   }
}

void Signed_Int_To_String(byte *str, sint i) {
   sint t;

   //Print the sign
   if (i < 0) {
      i = -i;
      *str = '-';
   }
   else {
      *str = '+';
   }

   Int_To_String(str++, i);
}

void Fixed_To_String(byte *str, sint fixed) {
   sint t, i;

   // does an sprintf(str, "%+05.04f", i); job

   //Print the sign
   if (fixed < 0) {
      fixed = -fixed;
      *str = '-';
   }
   else {
      *str = '+';
   }

   //Print the fractional portion
   str += 10;
   i = ((fixed & 0x0000FFFF) * 10000)>>16; // Get the fractional part, convert to 5 decimal digits of accuracy.

   for (t = 0; t <= 3; t++) {
     *str = 48 + (i % 10);
     i /= 10;
     str--;
   }

  //Print the decimal point
  *str = '.';
   str--;

  //Print the decimal portion
  i = fixed>>16;
  for (t = 0; t <= 4; t++) {
     *str = 48+(i % 10);
     i /= 10;
     str--;
  }
}
#endif

sint Sin(sint angle) {
  sint xy;

  if (angle & 0x1000) {
    if (angle & 0x800) {
       angle = -angle;
    }
    angle |= 0x7000;
    xy = -(*(unsigned short *)(angle << 1));
  }
  else {
    if (angle & 0x800) {
       angle = -angle;
    }
    angle |= 0x7000;
    xy = (*(unsigned short *)(angle << 1));
  }

  return xy;
}

sint Cos(sint angle) {
  return Sin(angle + 0x800);
}

#ifndef __CATALINA_NO_KEYBOARD
sint Read_Keyboard() {
   int nes_bits = 0;

   // Process keyboard keys
   if (keystate('w')) {
      nes_bits |= NES_UP<<8;
   }
   if (keystate('z')) {
      nes_bits |= NES_DOWN<<8;
   }
   if (keystate('a')) {
      nes_bits |= NES_LEFT<<8;
   }
   if(keystate('s')) {
      nes_bits |= NES_RIGHT<<8;
   }
   if (keystate('q')) {
      nes_bits |= NES_A<<8;
   }
   if(keystate('e')) {
      nes_bits |= NES_B<<8;
   }

   if (keystate('i')) {
      nes_bits |= NES_UP;
   }
   if (keystate('m')) {
      nes_bits |= NES_DOWN;
   }
   if (keystate('j')) {
      nes_bits |= NES_LEFT;
   }
   if(keystate('k')) {
      nes_bits |= NES_RIGHT;
   }
   if (keystate('u')) {
      nes_bits |= NES_A;
   }
   if(keystate('o')) {
      nes_bits |= NES_B;
   }

   // space is common start key
   if(keystate(' ')) {
      nes_bits |= NES_START | NES_START<<8;
   }

   return nes_bits;
}

#endif

#ifdef __CATALINA_GAMEPAD

// We are using the Catalina GAMEPAD. This plugin is easy to use - when we
// start it, we just give it a place to to store the gamepad bits ...

sint gamepad_bits = 0; 

#ifdef __CATALINA_NO_KEYBOARD

// We have no keyboard, so we can just use the gamepad bits directly

#define NES_Read_Gamepad() gamepad_bits 

#else

// if we have a keybaord, we must 'or' together the gamepad and keyboard bits

sint NES_Read_Gamepad() {
   sint nes_bits = gamepad_bits;
   nes_bits |= Read_Keyboard();
   return nes_bits;
}

#endif

#else

// We are not using the Catalina GAMEPAD, so we must provide an alternative

sint NES_Read_Gamepad() {
   
   sint nes_bits = 0;

#ifdef __CATALINA_SW_GAMEPAD  

   // The following C-based Gamepad software works only with HYDRA - but it
   // may be modified for use by other platforms by setting the bits below.

#define NES_CL 0x00000008 // PIN 3
#define NES_LT 0x00000010 // PIN 4
#define NES_D1 0x00000020 // PIN 5
#define NES_D2 0x00000040 // PIN 6

   sint i;

   // //////////////////////////////////////////////////////////////////
   // NES Game Paddle Read
   // //////////////////////////////////////////////////////////////////
   // reads both gamepads in parallel encodes 8-bits for each in format
   // right game pad #1 [15..8] : left game pad #0 [7..0]
   //
   // set I/O ports to proper direction
   // P3 = JOY_CLK      (4)
   // P4 = JOY_SH/LDn   (5)
   // P5 = JOY_DATAOUT0 (6)
   // P6 = JOY_DATAOUT1 (7)
   // NES Bit Encoding
   //
   // RIGHT  = %00000001
   // LEFT   = %00000010
   // DOWN   = %00000100
   // UP     = %00001000
   // START  = %00010000
   // SELECT = %00100000
   // B      = %01000000
   // A      = %10000000

   // step 1: set I/Os
   DIRA |=  (NES_LT|NES_CL);
   DIRA &= ~(NES_D1|NES_D2);
   //DIRA [3] = 1 // output
   //DIRA [4] = 1 // output
   //DIRA [5] = 0 // input
   //DIRA [6] = 0 // input

   // step 2: set clock and latch to 0
   OUTA &= ~(NES_LT|NES_CL);
   //OUTA [3] := 0 // JOY_CLK = 0
   //OUTA [4] := 0 // JOY_SH/LDn = 0

   // step 3: set latch to 1
   OUTA |= NES_LT;
   //OUTA [4] := 1 // JOY_SH/LDn = 1

   _waitcnt(CNT + GAMEPAD_DELAY);// a small delay is necessary

   // step 4: set latch to 0
   OUTA &= ~NES_LT;
   //OUTA [4] := 0 // JOY_SH/LDn = 0

   _waitcnt(CNT + GAMEPAD_DELAY);// a small delay is necessary

   // step 5: read first bit of each game pad
 
   // data is now ready to shift out
   // first bit is ready

   // left controller
   nes_bits = ((INA & NES_D1)>>5) | ((INA & NES_D2) << 2);
   //nes_bits := INA[5] | (INA[6] << 8)

   // step 7: read next 7 bits
   for (i = 0; i < 7; i++) {
      OUTA  |= NES_CL;
      // OUTA [3] := 1 // JOY_CLK = 1
      _waitcnt(CNT + GAMEPAD_DELAY);// a small delay is necessary
      OUTA &= ~NES_CL;
      // OUTA [3] := 0 // JOY_CLK = 0
      _waitcnt(CNT + GAMEPAD_DELAY);// a small delay is necessary
      nes_bits <<= 1;
      nes_bits |= ((INA & NES_D1)>>5) | ((INA & NES_D2) << 2);
   }

   // invert bits to make positive logic
   nes_bits = (~nes_bits & 0xFFFF);
 
   // Zero bits if no controller present
   if ((nes_bits & 0xff00) == 0xff00) {
      nes_bits &= 0x00ff;
   }
   if ((nes_bits & 0x00ff) == 0x00ff) {
      nes_bits &= 0xff00;
   }

#endif

#ifndef __CATALINA_NO_KEYBOARD

   // We are also using a keyboard, so 'or' in the keyboard bits
   nes_bits |= Read_Keyboard();
   
#endif       

   return nes_bits;
}

#endif

void WaitForStartButton() {
   nes_buttons = 0;

   //hang here until 'START' or '<SPACEBAR>' is pressed
   while (!(nes_buttons & (NES_START | (NES_START << 8))) && !(keystate(32)) 
#ifdef TEST_MONKEY_ENABLE         
   && !((game_options & OPTION_MONKEY_IS_ALIVE) && (Rand_Range(1,100) == 1))
#endif   
   ) {
      // Read NES controller buttons
      nes_buttons = NES_Read_Gamepad();
   }
   // debounce
   _waitcnt(CNT + GAMEPAD_DEBOUNCE);

   //hang here until 'START' and '<SPACEBAR>' are released
   while (((nes_buttons & (NES_START | (NES_START << 8))) || (keystate(32))) 
#ifdef TEST_MONKEY_ENABLE         
   &&     !((game_options & OPTION_MONKEY_IS_ALIVE) && (Rand_Range(1,100) == 1))
#endif   
   ) {
      // Read NES controller buttons
      nes_buttons = NES_Read_Gamepad();
   }
   //debounce
   _waitcnt(CNT + GAMEPAD_DEBOUNCE);
}


void Configure_Options() {
   sint i, y;
   sint selected_option = 0;
   sint num_options;
   sint menu_flags = 0;
   sint key_repeat_ticks;
   sint current_option_mask;
   sint done = 0;

#ifdef EEPROM_GRAPHICS_ENABLE
   // Get option screen
   EEPROM_Read(TILE_BUFFER, EEPROM_SCREEN_OPTIONS, ((screen_width * screen_height)>>3))
   repeat until EEPROM_IsDone
#endif

   g_clear();
   g_copy(DOUBLE_BUFFER);

   while (!done) {

      //ClearBox(screen_width-70,32,screen_width-32,97)
      //g_clear();

#ifdef SFX
#if !SFX_COG      
      // run the sounds effects periodically - not as good, but better than nothing!
      SFX_Manager();
#endif         
#endif

      // GET USER INPUT
      nes_buttons = NES_Read_Gamepad();
      nes_buttons = ((nes_buttons & 0xff00)>>8) | nes_buttons;  //Accept input from either gamepad

      // Draw titles
      g_textmode(1,1,6,1);
      g_colorwidth(1,0);

#ifndef EEPROM_GRAPHICS_ENABLE
      //g_text(-20, 86, title1_string);
      //g_text(-3, 73, version_string);
#endif

      //g_text(-110, -51, title3_string);
      //g_text(-123, -64, title4_string);
      g_text(-58, -111, title_start_string);

      //g_textmode(1,1,6,1);
      g_text(-100, 83, options_string);

      // Draw options states
      y = 55;
      num_options = 0;
      current_option_mask = 0x00000001;
      while (*option_strings[num_options] != 0xff) {

         // Draw option name
         g_text(-60, y, option_strings[num_options]);
         // Draw option setting
         if (game_options & current_option_mask) {
            g_text(60, y, on_string);
         }
         else {
            g_text(60, y, off_string);
         }

         // Toggle option, if seleted
         // Note: 'num_options' at this point is really the current option.
         if ((nes_buttons & NES_A) 
         &&  (selected_option == num_options) 
         &&  !(menu_flags & MENU_FLAG__A_HELD)) {
            g_colorwidth(0,0);
            g_text(60, y, off_string);
            g_text(60, y, on_string);
            g_colorwidth(1,0);
            game_options ^=  current_option_mask;  // Toggle the current option
            if (game_options & current_option_mask) {
               g_text(60, y, on_string);
            }
            else {
               g_text(60, y, off_string);
            }
         }

         // Advance to next line
         y -= 13;
         ++num_options;
         current_option_mask <<= 1;
      }

      // Point to current option
      y = 55 -(13 * selected_option);
      g_vec(90, y, 0x0020, ANG_180, player0_ship[0]);

      // PROCESS MENU SELECTION, ON KEY DOWN EVENTS WITH KEY REPEATS
      if (menu_flags & MENU_FLAG__UP_DOWN_HELD) {
        ++key_repeat_ticks;
        if (!(nes_buttons & (NES_DOWN | NES_UP))) {
           menu_flags &= ~(MENU_FLAG__UP_DOWN_HELD | MENU_FLAG__REPEAT_GO_TIME_MET | MENU_FLAG__DO_REPEAT_CLICK);
        }
        if (!(menu_flags & MENU_FLAG__REPEAT_GO_TIME_MET) && (key_repeat_ticks >= 8)) {
           menu_flags |= (MENU_FLAG__REPEAT_GO_TIME_MET | MENU_FLAG__DO_REPEAT_CLICK);
        }
        if ((menu_flags & MENU_FLAG__REPEAT_GO_TIME_MET) && (key_repeat_ticks >= 2)) {
           menu_flags |= MENU_FLAG__DO_REPEAT_CLICK;
        }
      }

      if ((!(menu_flags & MENU_FLAG__UP_DOWN_HELD)) 
      ||  (menu_flags & MENU_FLAG__DO_REPEAT_CLICK)) {
        if (nes_buttons & NES_UP) {
           g_colorwidth(0, 0);
           y = 55 -(13 * selected_option);
           g_vec(90, y, 0x0020, ANG_180, player0_ship[0]);
           menu_flags |= MENU_FLAG__UP_DOWN_HELD;
           if (selected_option == 0) {
              selected_option = num_options - 1;
           }
           else {
              --selected_option;
           }
        }
        if (nes_buttons & NES_DOWN) {
           g_colorwidth(0,0);
           y = 55 -(13 * selected_option);
           g_vec(90, y, 0x0020, ANG_180, player0_ship[0]);
           menu_flags |= MENU_FLAG__UP_DOWN_HELD;
           if (selected_option == num_options - 1) {
             selected_option = 0;
           }
           else {
              ++selected_option;
           }
        }
        key_repeat_ticks = 0;
        menu_flags &= ~MENU_FLAG__DO_REPEAT_CLICK;
      }

      // COPY BITMAP TO DISPLAY
      g_copy(DOUBLE_BUFFER);

      // PROCESS "START"
      if ((nes_buttons & NES_START) 
#ifdef TEST_MONKEY_ENABLE            
      ||  ((game_options & OPTION_MONKEY_IS_ALIVE) && (Rand_Range(1,100) == 1))
#endif         
      ) {
        done = 1;
      }

      // PROCESS BUTTON HELD FLAG
      if (nes_buttons & NES_A) {
         menu_flags |= MENU_FLAG__A_HELD;
      }
      else {
         menu_flags &= ~MENU_FLAG__A_HELD;
      }
   }

}

void main_game();

void main(void) {

   int  i, k;
   int  free_ram;
   int  tile_count;
   void *tile_space;
   int  stack_check; // only used to determine stack usage
   int sbrk;

   // get colour mode (2 or 4 color)
   color_mode = g_mode();

   // get x and y screen size (in tiles)
   x_tiles = cgi_x_tiles();
   y_tiles = cgi_y_tiles();

   screen_width  = x_tiles * (32>>color_mode);
   half_screen_width = screen_width/2;
   screen_height = y_tiles * 16;
   half_screen_height = screen_height/2;

#ifdef __CATALINA_GAMEPAD
   start_gamepad_updates(&gamepad_bits);
#endif

   // set background to black
   g_pallete(0,0);

   sbrk = _sbrk(0);
   // calculate free ram available for tile space (reserve STACK_SPACE bytes)
   free_ram = (int)&stack_check - _sbrk(0) - STACK_SPACE;

   // tile space must start on a tile boundary
   tile_space = (void *)(64 * (_sbrk(free_ram + TILE_SIZE - 1) / TILE_SIZE));
   tile_count = (((int)free_ram + TILE_SIZE - 1) / TILE_SIZE);

   // set up graphics driver
   g_setup(half_screen_width, half_screen_height, tile_count, tile_space);

   // set up double buffer driver (required if double buffering)
   g_db_setup(DOUBLE_BUFFER);

   //default game options
   game_options = DEFAULT_OPTIONS;

#ifdef TEST_MONKEY_ENABLE
   game_options |= OPTION_MONKEY_IS_ALIVE;
#endif

#ifdef SFX
   //start sound effects manager
   sfx_flags = 0;
   sfx_cnt_shield = 0;
   shield_snd_ascending = 1;

#if SFX_COG
   _coginit_C(SFX_Manager, &sfx_stack[SFX_STACK_SIZE]);
#endif

#endif

   //Show title screen
#ifdef EEPROM_GRAPHICS_ENABLE
   _waitcnt(CNT + 5000);
   g_clear();
   //EEPROM_Read(TILE_BUFFER, EEPROM_SCREEN_TITLE, ((screen_width * screen_height)>>3))
   while (!EEPROM_IsDone) { };
   g_textmode(1,1,6,1);
   g_text(Constant(-half_screen_width + 1), constant(-half_screen_height + 5), version_string);
   if (DOUBLE_BUFFER) {
      g_copy(DOUBLE_BUFFER);
   }
   //Wait for start button (or spacebar) to be pressed
   WaitForStartButton();
#endif

   // MAIN EXECUTION MANAGER
   while (1) {
     g_colorwidth(1,0);
     if ((tile_count > 120) && (color_mode == 0)) {
        g_textmode(7,12,6,5);
     }
     else {
        g_textmode(2,8,6,5);
     }
     g_text(0, 150, title1_string);
     g_textmode(1,1,6,5);
     g_text(0, 53, version_string);
     g_text(0, -51, title3_string);
     g_text(0, -64, title4_string);
     g_text(0, -111, title_start_string);
     //g_colorwidth(3,3)
     //g_box(-half_screen_width+5,-half_screen_height+5,screen_width-10,screen_height-10)
     g_copy(DOUBLE_BUFFER);
     WaitForStartButton();
     Configure_Options();
     main_game();
   }
}

void main_game() {
   sint i, j, k;
   sint base, base2;
   sint dx, dy;
   sint x, y;
   sint x2, y2;
   sint length;
   sint f, v, a;
   sint r;
   uint r_squared;
   sint player_index;
   sint shot_index;
   sint rock_index;
   sint watchval_int;
   sint watchval_fixed;
   sint died;
   sint shield_angle;
#if defined(PACING_OVERRUNS) || defined(PACING_LED)
   sint curr_count;      // saves counter
#endif   

   // initialize random variable
   random_var = CNT*171732;
   random_var = _rand_forward(random_var);
   lives[PLAYER_0] = 5;
   lives[PLAYER_1] = 5;

#ifdef WATCH_VARIABLES
   //Initialize debug watch variables
   watchval_fixed = 0;
   watchval_int   = 0;
#endif   

   // generate random stars
   for (i = 0; i < NUM_STARS; i++) {
      star_x[i] = Rand_Range((-half_screen_width), (half_screen_width));
      star_y[i] = Rand_Range((-half_screen_height), (half_screen_height));
   }

   while ((lives[PLAYER_0] != 0) & (lives[PLAYER_1] != 0)) {

#ifdef SFX      
     // Stop any ship action sounds in progress
     SFX_stop_ship_action_sounds(0);
     SFX_stop_ship_action_sounds(1);
#endif     

     // Initialize object info
     for (i = 0; i < NUM_OBJECTS; i++) {
        object_x[i] = 0;
        object_y[i] = 0;
        object_dx[i] = 0;
        object_dy[i] = 0;
     }

     // Initialize ship info
     object_x[OBJECT_PLAYER_0] = (((half_screen_width) - 30) << 16);
     object_y[OBJECT_PLAYER_0] = (((half_screen_height) - 30) << 16);
     object_x[OBJECT_PLAYER_1] = (-(((half_screen_width) - 30) << 16));
     object_y[OBJECT_PLAYER_1] = (-(((half_screen_height) - 30) << 16));
     ship_angle[OBJECT_PLAYER_0] = ANG_270;
     ship_angle[OBJECT_PLAYER_1] = ANG_90;
     shield_angle = ANG_0;

     for (player_index = 0; player_index < NUM_PLAYERS; player_index++) {
        ship_state[player_index]            = SHIP_STATE_ALIVE;
        ship_flags[player_index]            = 0;
        score[player_index]                 = 0;
        ship_shield_power_fxp[player_index] = (STATUS_GAUGE_LENGTH << 16); // Fixed point
        ship_fuel_fxp[player_index]         = (STATUS_GAUGE_LENGTH << 16); // Fixed point
     }

     // Initialize shot info
     for (shot_index = 0; shot_index < NUM_SHOTS; shot_index++) {
       shot_time_to_live[shot_index] = 0;
     }
#ifdef BFG
     // Initialize BFG
     bfg_flags = BFG_FLAG__OUT_OF_PLAY;
#endif     

     // Initialize black hole
     black_hole_particle_mask = 0;

#ifdef ENABLE_ROCKS     
     // Initialize rocks
     for (rock_index = 0; rock_index < NUM_ROCKS; rock_index++) {
       rock_state[rock_index] = ROCK_STATE_ABSENT;
     }
#endif

     // Initialize explosion particles
     for (i = 0; i < NUM_EXPLOSION_PARTICLES; i++) {
       //Create random fixed point dx's and dy's between -1.0 and 1.0
       //Note: The distrubution of these random points is currently a square.
       //      Would be better to pick points in polar space and make the distribution
       //      a circle, or even to force the density distribution so that it was
       //      more dense near the middle.
       explosion_dx_fxp[i] = Rand_Range(-0x0000ffff,0x0000ffff);
       explosion_dy_fxp[i] = Rand_Range(-0x0000ffff,0x0000ffff);
     }

     // BEGIN GAME LOOP 
     died = 0;

     damage[PLAYER_0] = 0;
     damage[PLAYER_1] = 0;

     g_clear();

     while (died == 0) {

#if defined(PACING_OVERRUNS) || defined(PACING_LED)
       curr_count = CNT; // Save current counter value
#endif       

#if !DOUBLE_BUFFER
       g_clear();
#endif     

#ifdef SFX
#if !SFX_COG       
       // run the sounds effects periodically - not as good, but better than nothing!
       SFX_Manager();
#endif       
#endif

       shield_angle += (0x2000 / 31);

       // Read NES controller buttons
#ifdef TEST_MONKEY_ENABLE
       if (game_options & OPTION_MONKEY_IS_ALIVE) {
          //Simulate random input for testing
          if (Rand_Range(1,20) <= 1) {
             nes_buttons = Rand_Range(0,0xffff);
          }
          else {
             nes_buttons = 0;
          }
       }
       else {
          nes_buttons = NES_Read_Gamepad();
       }
#else
       nes_buttons = NES_Read_Gamepad();
#endif       
       player_nes_buttons[0] = nes_buttons & 0xff;
       player_nes_buttons[1] = (nes_buttons>>8) & 0xff;

       // Process both player ships
       for (player_index = 0; player_index < NUM_PLAYERS; player_index++) {
         //Determine sound flags for current plater
#ifdef SFX
         if (player_index == 0) {
            thrust_snd_flag = SFX_SND_SHIP0_THRUST;
            shield_snd_flag = SFX_SND_SHIP0_SHIELD;
         }
         else {
            thrust_snd_flag = SFX_SND_SHIP1_THRUST;
            shield_snd_flag = SFX_SND_SHIP1_SHIELD;
         }
#endif
         if ((ship_state[player_index] == SHIP_STATE_ALIVE) 
         &&  !(ship_flags[player_index] & SHIP_FLAG_HYPERSPACE)) {

           // Process ROTATE
           button_temp = player_nes_buttons[player_index]; 
           // Process rotate left / right
           if ((button_temp & NES_RIGHT) != 0) {
              if (damage[player_index] >= 3) {
                 // lots of damage
                 ship_angle[player_index] -= (ANG_ROTATE << (SHL_ROTATE - 2));
              }
              else if (damage[player_index] >= 1) {
                 // a little damage
                 ship_angle[player_index] -= (ANG_ROTATE << (SHL_ROTATE - 1));
              }
              else {
                 // no damage
                 ship_angle[player_index] -= (ANG_ROTATE << SHL_ROTATE);
              }
           }

           if ((button_temp & NES_LEFT) != 0) {
              if (damage[player_index] >= 3) {
                 // lots of damage
                 ship_angle[player_index] += (ANG_ROTATE << (SHL_ROTATE - 2));
              }
              else if (damage[player_index] >= 1) {
                 // a little damage
                 ship_angle[player_index] += (ANG_ROTATE << (SHL_ROTATE - 1));
              }
              else {
                 // no damage
                 ship_angle[player_index] += (ANG_ROTATE << SHL_ROTATE);
              }
           }

           // Bounds test ship angle
           if (ship_angle[player_index] > ANG_360) {
              ship_angle[player_index] -= ANG_360;
           }
           else if (ship_angle[player_index] < 0) {
              ship_angle[player_index] += ANG_360;
           }

           // Process HYPERSPACE
           if (((button_temp & NES_DOWN) != 0) && (game_options & OPTION_HYPERSPACE)) {
              ship_flags[player_index] |= SHIP_FLAG_HYPERSPACE;
              hyper_time[player_index] = SHIP_HYPERSPACE_TIME;
           }

           // Process SHIELDS
           if (((button_temp & NES_UP) != 0) 
           &&  ship_shield_power_fxp[player_index] 
           &&  (game_options & OPTION_SHIELDS)) {
              ship_flags[player_index] |= SHIP_FLAG_SHIELDS_UP;

              // decrement shield power remaining
              if ((ship_shield_power_fxp[player_index] > SHIELD_CONSUMPTION_RATE_FXP)) {
                ship_shield_power_fxp[player_index] -= SHIELD_CONSUMPTION_RATE_FXP;
              }
              else {
                ship_shield_power_fxp[player_index] = 0;
              }
#ifdef SFX
              //Play shield sound
              sfx_flags |= shield_snd_flag;
#endif              
           }
           else {
              ship_flags[player_index] &= ~SHIP_FLAG_SHIELDS_UP;
#ifdef SFX
              //Stop shield sound
              sfx_flags &= ~shield_snd_flag;
#endif
           }
           // Process FIRE
           if (((button_temp & NES_A) != 0) & ((fire_debounce & (player_index + 1)) == 0)) {
              if (player_index == 0) {
                 i = 0;
                 j = PLAYER_1_SHOT_START - 1;
              }
              else {
                i = PLAYER_1_SHOT_START;
                j = NUM_SHOTS - 1;
              }
              shot_index = i;
              while (shot_index <= j) {
                 if (shot_time_to_live[shot_index] == 0) {
                    shot_time_to_live[shot_index] = SHOT_TTL_INIT + Rand_Range(-10,10);
                    object_x[shot_index + OBJECT_PLAYER_0_SHOT_0] 
                       = object_x[player_index] + Cos(ship_angle[player_index]) * SHIP_GUN_PLACEMENT_DISTANCE;
                    object_y[shot_index + OBJECT_PLAYER_0_SHOT_0] 
                       = object_y[player_index] + Sin(ship_angle[player_index]) * SHIP_GUN_PLACEMENT_DISTANCE;
                    if (game_options & OPTION_INERTIAL_SHOTS) {
                       // Shot velocity is ship velocity + muzzle velocity
                       object_dx[shot_index + OBJECT_PLAYER_0_SHOT_0] 
                          = SCL_PROJECTILE_VEL*Cos(ship_angle[player_index]) + object_dx[player_index];
                       object_dy[shot_index + OBJECT_PLAYER_0_SHOT_0] 
                          = SCL_PROJECTILE_VEL*Sin(ship_angle[player_index]) + object_dy[player_index];
                    }
                    else {
                       // Shot velocity is fixed regardless of ship velocity
                       object_dx[shot_index + OBJECT_PLAYER_0_SHOT_0] 
                          = SCL_PROJECTILE_VEL*Cos(ship_angle[player_index]) << 1;
                       object_dy[shot_index + OBJECT_PLAYER_0_SHOT_0] 
                          = SCL_PROJECTILE_VEL*Sin(ship_angle[player_index]) << 1;
                    }
  
                    fire_debounce |= (player_index + 1); // Set the debounce flag
#ifdef SFX 
                    //Play shot sound
                    if (player_index == 0) {
                       sfx_flags |= SFX_SND_SHIP0_SHOT_START;
                    }
                    else {
                       sfx_flags |= SFX_SND_SHIP1_SHOT_START;
                    }
#endif 
                    shot_index = j + 1; // quit; // TBD - SHOULD THIS BE CONTINUE???
                 }
                 shot_index++;
              }
           }
           else if ((button_temp & NES_A) == 0) {
             fire_debounce &= ~(player_index + 1); // Clear the debounce flag
           }

           // Process THRUST
           // all calculations for ship thrust and position model are performed in fixed point math
           if ((player_nes_buttons[player_index] & NES_B) 
           &&  (ship_fuel_fxp[player_index] || !(game_options & OPTION_FUEL))) {

              // compute thrust vector, scale down cos/sin a bit to slow ship's acceleration
              if (damage[player_index] >= 3) {
                // lots of damage
                thrust_dx[player_index] = Cos(ship_angle[player_index])>>(SAR_SHIP_VEL + 2);
                thrust_dy[player_index] = Sin(ship_angle[player_index])>>(SAR_SHIP_VEL + 2);
              }
              else if (damage[player_index] >= 1) {
                // a little damage
                thrust_dx[player_index] = Cos(ship_angle[player_index])>>(SAR_SHIP_VEL + 1);
                thrust_dy[player_index] = Sin(ship_angle[player_index])>>(SAR_SHIP_VEL + 1);
              }
              else {
                // no damage
                thrust_dx[player_index] = Cos(ship_angle[player_index])>>SAR_SHIP_VEL;
                thrust_dy[player_index] = Sin(ship_angle[player_index])>>SAR_SHIP_VEL;
              }

              // apply thrust to ships current velocity
              object_dx[player_index] += thrust_dx[player_index];
              object_dy[player_index] += thrust_dy[player_index];
 
              // decrement fuel remaining
              if (ship_fuel_fxp[player_index] > FUEL_CONSUMPTION_RATE_FXP) {
                ship_fuel_fxp[player_index] -= FUEL_CONSUMPTION_RATE_FXP;
              }
              else {
                ship_fuel_fxp[player_index] = 0;
              }

              // set thrusting flag
              ship_flags[player_index] |= SHIP_FLAG_THRUSTING;
#ifdef SFX
              // play thrust sound
              sfx_flags |= thrust_snd_flag;
#endif             
           }
           else {
              // clear thrusting flag
              ship_flags[player_index] &= ~SHIP_FLAG_THRUSTING;
#ifdef SFX
              //stop thrust sound
              sfx_flags &= ~thrust_snd_flag;
#endif             
           }

           // Process Friction
           // apply friction model, always in opposite direction of velocity
           // frictional force is proportional to velocity, use power of 2 math to save time
           object_dx[player_index] -= object_dx[player_index]>>SPACE_FRICTION;
           object_dy[player_index] -= object_dy[player_index]>>SPACE_FRICTION;

         }

         else if (!(ship_flags[player_index] & SHIP_FLAG_HYPERSPACE)) {

            // PROCESS DEGRADING SHIP STATE (EXPLODING -> DELAY -> DEAD)
            if (ship_state[player_index] > 0) {
               if (--ship_state[player_index] == 0) {
                  // ship has gone thorough all the decaying states of death, 
                  // now set 'died' flag so game round will end.
                  died = 1;
               }
            }
         }
         else {
            //ship must be in hyperspace
            if (hyper_time[player_index] != 0) {
               if (--hyper_time[player_index] == 0) {
                  ship_flags[player_index] &= ~SHIP_FLAG_HYPERSPACE;
                  // ship appears at random location - but not near edge (too hard to see!)
                  object_x[player_index] = Rand_Range((-half_screen_width + 50), (half_screen_width - 50))  << 16;
                  object_y[player_index] = Rand_Range((-half_screen_height + 50), (half_screen_height - 50)) << 16;
                  object_dx[player_index] = 0;
                  object_dy[player_index] = 0;
                  // always a chance of exploding when leaving hyperspace, chances increase with damage
                  if (Rand_Range(1,10) < damage[player_index] + 3) {
                     --lives[player_index];
                     ship_state[player_index] = SHIP_STATE_EXPLODING;
#ifdef SFX                     
                     sfx_flags |= SFX_SND_EXPLODE;
                     SFX_stop_ship_action_sounds(player_index);
#endif                     
                  }
               }
            }
         }
       }

       for (i = 0; i < NUM_OBJECTS; i++) {

         // Process Black Hole
         //     NOTE: processed if enabled, and object is not a dead ship or a ship in hyperspace
         if ((game_options & OPTION_BLACK_HOLE) 
         && !((i <= PLAYER_1) && ((ship_state[i] != SHIP_STATE_ALIVE) || (ship_flags[i] & SHIP_FLAG_HYPERSPACE))) 
         && !(((i >= OBJECT_PLAYER_0_SHOT_0) && (i < OBJECT_ROCK_0)) && !(game_options & OPTION_SHOT_GRAVITY))) {
           // now compute the acceleration toward the black hole, model based on F = (G*M1*M2)/r^2
           // in other words, the force is equal to the product of the two masses times some constant G divided
           // by the distance between the masses squared. Thus, we more or less need to accelerate the ship
           // toward the black hole(s) proportional to some lumped constant divided by the distance to the black
           // hole squared...

           // compute each force direction vector d(dx ,dy) toward the black hole, so we can compute its length
           dx = BLACK_HOLE_X - (object_x[i]>>16);
           dy = BLACK_HOLE_Y - (object_y[i]>>16);
           r_squared = (dx*dx + dy*dy); // no need to compute length r, when we are going to use r^2 in a moment

           // now compute the actual force itself, which is proportional to accel 
           // which in this sim will be used to change velocity each frame
           f = (BLACK_HOLE_GRAVITY / r_squared);
           if (f >= GRAVITY_CLIP) {
              f = GRAVITY_CLIP;
           }

           // f can be thought of as acceleration since its proportional to mass which is virtual and 
           // can be assumed to be 1
           // thus we can use it to create a velocity vector toward the black hole now in the 
           // direction of of the vector d(dx, dy)
           dx = dx << 16; // convert to fixed point
           dy = dy << 16;

           // compute length of d which is just r, careful to compute fixed point values properly
           r = (square_root(r_squared << 16))>>8; // square root operation turns 16.16 into 24.8. Convert r to integer

           // normalize the vector and scale by force magnityde
           dx = (f>>8) * ((dx / r)>>8);
           dy = (f>>8) * ((dy / r)>>8);

           // update velocity with acceleration due to black hole
           if (game_options & OPTION_NEGATIVE) {
              object_dx[i] -= dx;
              object_dy[i] -= dy;
           }
           else {
              object_dx[i] += dx;
              object_dy[i] += dy;
           }

           //if object is a player ship
           if (i < OBJECT_PLAYER_0_SHOT_0) {
              //Check for Collision with black hole
              if (ship_state[i] == SHIP_STATE_ALIVE) {
                 if ((object_x[i] > (BLACK_HOLE_X - COLLISION_RANGE_FP)) 
                 &&  (object_x[i] < (BLACK_HOLE_X + COLLISION_RANGE_FP))) {
                    if ((object_y[i] > (BLACK_HOLE_Y - COLLISION_RANGE_FP)) 
                    &&  (object_y[i] < (BLACK_HOLE_Y + COLLISION_RANGE_FP))) {
                       --lives[i];
                       ship_state[i] = SHIP_STATE_EXPLODING;
#ifdef SFX                       
                       sfx_flags |= SFX_SND_EXPLODE;
#endif                       
                       //Colliding with the black hole tends to fling your exploding bits super fast across
                       //  space, which looks silly, so chop the velocity down
                       object_dx[i] >>= 2;
                       object_dy[i] >>= 2;
#ifdef SFX                       
                       SFX_stop_ship_action_sounds(i);
#endif                       
                    }
                 }
              }
           }
         }

         // CLAMP OBJECT VELOCITIES
         // clamp maximum velocity, otherwise ship will get going light speed 
         // due to black holes when the distance approaches 0!
         dx = (object_dx[i]>>16);
         dy = (object_dy[i]>>16);

         // test if object velocity greater than threshold
         v = square_root(dx*dx + dy*dy);

         // perform comparison (to squared max, to make math easier)
         if (i < OBJECT_PLAYER_0_SHOT_0) {
            // Object is a ship
            if (v > MAX_SHIP_VEL) {
               // scale velocity vector back approx 1/8th
               object_dx[i] = MAX_SHIP_VEL*(object_dx[i] / v);
               object_dy[i] = MAX_SHIP_VEL*(object_dy[i] / v);
            }
         }
         else {
            // Object is a projectile (or a rock)
            if (v > MAX_PROJECTILE_VEL) {
               // scale velocity vector back approx 1/8th
               object_dx[i] = MAX_PROJECTILE_VEL*(object_dx[i] / v);
               object_dy[i] = MAX_PROJECTILE_VEL*(object_dy[i] / v);
            }
         }

         // UPDATE OBJECT POSITIONS 
         // Note: Time is currently wasted updating "inactive" shots, in order to
         // conserve the code space necessary to test for those cases.
         object_x[i] += object_dx[i];
         object_y[i] += object_dy[i];

         // screen bounds test for objects
         if (game_options & OPTION_BOUNCE) {
           //bounce back - bounce off edge
           if (object_x[i] > ((half_screen_width)<< 16)) {
              //object_x[i] = ((half_screen_width - 1)<< 16);
              object_dx[i] = -object_dx[i];
              if (i < NUM_PLAYERS) {
                 ship_angle[i] = ANG_180 - ship_angle[i];
              }
           }
           else if (object_x[i] < ((-half_screen_width)<<16)) {
              //object_x[i] = ((-half_screen_width + 1)<< 16);
              object_dx[i] = -object_dx[i];
              if (i < NUM_PLAYERS) {
                 ship_angle[i] = ANG_180 - ship_angle[i];
              }
           }
           if (object_y[i] > ((half_screen_height)<<16)) {
              //object_y[i] = ((half_screen_height - 1)<< 16);
              object_dy[i] = -object_dy[i];
              if (i < NUM_PLAYERS) {
                 ship_angle[i] = - ship_angle[i];
              }
           }
           else if (object_y[i] < ((-half_screen_height)<<16)) {
              //object_y[i] = ((-half_screen_height + 1)<< 16);
              object_dy[i] = -object_dy[i];
              if (i < NUM_PLAYERS) {
                 ship_angle[i] = - ship_angle[i];
              }
           }

           if (i < NUM_PLAYERS) {
              // Bounds test ship angle
              if (ship_angle[i] > ANG_360) {
                 ship_angle[i] -= ANG_360;
              }
              else if (ship_angle[i] < ANG_0) {
                 ship_angle[i] +=ANG_360;
              }
           }
         }
         else if (game_options & OPTION_EXPANDED) {

            //explanded universe - return on other side but universe is 1/4 bigger than screen on every side
            if (object_x[i] > ((3*screen_width/4)<< 16)) {
               object_x[i] -= ((3*half_screen_width)<<16);
            }
            else if (object_x[i] < ((-3*screen_width/4)<<16)) {
               object_x[i] += ((3*half_screen_width)<<16);
            }
            if (object_y[i] > ((3*screen_height/4)<<16)) {
               object_y[i] -= ((3*half_screen_height)<<16);
            }
            else if (object_y[i] < ((-3*screen_height/4)<<16)) {
               object_y[i] += ((3*half_screen_height)<<16);
            }
         }
         else {
            //open universe - return on other side
            if (object_x[i] > ((half_screen_width)<< 16)) {
               object_x[i] -= (screen_width<<16);
            }
            else if (object_x[i] < ((-half_screen_width)<<16)) {
               object_x[i] += (screen_width<<16);
            }
            if (object_y[i] > ((half_screen_height)<<16)) {
               object_y[i] -= (screen_height<<16);
            }
            else if (object_y[i] < ((-half_screen_height)<<16)) {
               object_y[i] += (screen_height<<16);
            }
          }
       }

       // PLAYER SHOTS 
       for (shot_index = 0; shot_index < NUM_SHOTS; shot_index++) {
          if (shot_time_to_live[shot_index] != 0) {
             --shot_time_to_live[shot_index];
             // shot to ship
             for (player_index = PLAYER_0; player_index <= PLAYER_1; player_index++) {
 
                // ignore ships in hyperspace
                if ((ship_flags[player_index] & SHIP_FLAG_HYPERSPACE) != 0) { // TBD - fix bug in original!!!
                   continue; // next;
                }
                //if (shot_index < PLAYER_1_SHOT_START) {
                //   player_index = PLAYER_1;
                //}
                //else {
                //   player_index = PLAYER_0;
                //}
 
                // SHOT TO SHIELD COLLISIONS
 
                // If the target ship's shields are up
                if (ship_flags[player_index] & SHIP_FLAG_SHIELDS_UP) {
                   dx = (object_x[shot_index+OBJECT_PLAYER_0_SHOT_0] - object_x[player_index])>>16;   // dx, as integer
                   dy = (object_y[shot_index+OBJECT_PLAYER_0_SHOT_0] - object_y[player_index])>>16;   // dy, as integer
                   r_squared = (dx*dx + dy*dy);
                   // If the shot is within the shield radius
                   if (r_squared < (SHIELD_RADIUS * SHIELD_RADIUS)) {
                   //if true
                     //SIMPLE REVERSE
                     object_dx[shot_index+OBJECT_PLAYER_0_SHOT_0] 
                        = -object_dx[shot_index+OBJECT_PLAYER_0_SHOT_0]  + Rand_Range(-10,10) << 16;
                     object_dy[shot_index+OBJECT_PLAYER_0_SHOT_0] 
                        = -object_dy[shot_index+OBJECT_PLAYER_0_SHOT_0]  + Rand_Range(-10,10) << 16;
                   //else {
                      //COMPLEX REVERSE
                   //}
                   }
                }
                // SHOT TO SHIP COLLISIONS
                ShotToShip(shot_index, player_index);
#ifdef ENABLE_ROCKS
                // SHOT TO ROCK COLLISIONS
                if (game_options & OPTION_ROCKS) {
                   for (rock_index = 0; rock_index < NUM_ROCKS; rock_index++) {
                     ShotToRock(shot_index, rock_index);
                   }
                }
#endif                
             }
          }
       }

       // PLAYER COLLISION 
       if ((ship_state[PLAYER_0] == SHIP_STATE_ALIVE) 
       &&  (ship_state[PLAYER_1] == SHIP_STATE_ALIVE) 
       &&  (((ship_flags[PLAYER_0] | ship_flags[PLAYER_1]) & SHIP_FLAG_HYPERSPACE) == 0)) {
          //NOTE: Ship/Ship collision detection uses 2x the standard Shot/Ship collision detection range
          if ((object_x[PLAYER_0] > (object_x[PLAYER_1] - (COLLISION_RANGE_FP<<1))) 
          &&  (object_x[PLAYER_0] < (object_x[PLAYER_1] + (COLLISION_RANGE_FP<<1)))) {
             if ((object_y[PLAYER_0] > (object_y[PLAYER_1] - (COLLISION_RANGE_FP<<1))) 
             &&  (object_y[PLAYER_0] < (object_y[PLAYER_1] + (COLLISION_RANGE_FP<<1)))) {
               if (!(ship_flags[PLAYER_0] & SHIP_FLAG_SHIELDS_UP)) {
                  KillPlayer(PLAYER_0);
               }
               if (!(ship_flags[PLAYER_1] & SHIP_FLAG_SHIELDS_UP)) {
                  KillPlayer(PLAYER_1);
               }
            }
          }
       }
#ifdef ENABLE_ROCKS       
       // ROCK COLLISION 
       if (game_options & OPTION_ROCKS) {
         for (rock_index = 0; rock_index < NUM_ROCKS; rock_index++) {
           for (player_index = 0; player_index < NUM_PLAYERS; player_index++) {
             if ((ship_state[player_index] == SHIP_STATE_ALIVE) 
             &&  (rock_state[rock_index] == ROCK_STATE_PRESENT) 
             &&  ((ship_flags[player_index] & SHIP_FLAG_HYPERSPACE) == 0)) {
               //NOTE: Rock to Rock collision detection uses 2x the standard Shot/Ship collision detection range
               if ((object_x[player_index] > (object_x[rock_index+OBJECT_ROCK_0] - (COLLISION_RANGE_FP<<1))) 
               &&  (object_x[player_index] < (object_x[rock_index+OBJECT_ROCK_0] + (COLLISION_RANGE_FP<<1)))) {
                  if ((object_y[player_index] > (object_y[rock_index+OBJECT_ROCK_0] - (COLLISION_RANGE_FP<<1))) 
                  &&  (object_y[player_index] < (object_y[rock_index+OBJECT_ROCK_0] + (COLLISION_RANGE_FP<<1)))) {
                     KillPlayer(player_index);
                  }
               }
             }
           }
         }
       }
#endif       

       //==================================================================================================
       // RENDERING SECTION
       //==================================================================================================

       // INITIALE TEXT COLOR AND SIZE
       g_textmode(1,1,5,3);
       g_colorwidth(1,0);

#ifdef WATCH_VARIABLES       
       // DRAW DEBUGGING WATCH VARIABLES

       //Draw fixed point watch variable
       Fixed_To_String(fixed_pt_string_0, watchval_fixed);
       g_text(PLAYER_1_STATS_X_POS, PLAYER_1_STATS_Y_POS - 20, fixed_pt_string_0);

       //Draw integer watch variable
       Signed_Int_To_String(int_string_0, watchval_int);
      g_text(PLAYER_0_STATS_X_POS, PLAYER_0_STATS_Y_POS - 22, int_string_0);
#endif         

#ifdef ENABLE_ROCKS
       // DRAW ROCKS
       if (game_options & OPTION_ROCKS) {
          //draw rocks that are visible, or make new ones appear at random, up to NUM_ROCKS
          for (i = 0; i < NUM_ROCKS; i++) {
             if (rock_state[i] == ROCK_STATE_PRESENT) {
                // rock is visible, so spin it and then draw it
                rock_angle[i] += rock_spin[i];
                if (rock_angle[i] > ANG_360) {
                   rock_angle[i] -= ANG_360;
                }
                else if (rock_angle[i] < ANG_0) {
                   rock_angle[i] +=ANG_360;
                }
                g_colorwidth(1,0);
                g_vec(object_x[i+OBJECT_ROCK_0]>>16, object_y[i+OBJECT_ROCK_0]>>16, 
                      rock_scale[i], rock_angle[i], vectors_rock);
             }
             else if (rock_state[i] <= ROCK_STATE_EXPLODING) {
                if (rock_state[i] > ROCK_STATE_DIE_DELAY) {
                   //Rock is in the ROCK_STATE_EXPLODING state, so draw explosion
                   x = object_x[i+OBJECT_ROCK_0]>>16;
                   y = object_y[i+OBJECT_ROCK_0]>>16;
                   //Set j to a fixed point value between 0.0 and 1.0 reflecting the progress of the
                   //   player explosion state.  Starts at 0.0 at beginning of explosion, and
                   //   ends at 1.0 at the end of the explosion.
                   j = 0x00010000 - (((rock_state[i] - ROCK_STATE_DIE_DELAY) << 16) 
                         / (ROCK_STATE_EXPLODING - ROCK_STATE_DIE_DELAY));
                   //Scale j by 90 degrees and convert back to integer.  Now j will range from 0 to 90 degrees
                   //   over the course of the explosion.
                   j = (j * ANG_90)>>16;
                   //Compute a fixed point value which ranges from 0.0 to the explosion radius over the course
                   //   of the explosion in a sinusoidal expansion (rapidly at first, then slowly at the end).
                   //   This value will be used to scale the displayed distance of the explosion particles
                   //   from the ship's center.
                   j = Sin(j) * EXPLOSION_RADIUS;
                   //Loop over all the explosion particles
                   for (k = 0; k < NUM_EXPLOSION_PARTICLES; k++) {
                      //Draw an explosion particle
                      g_colorwidth(Rand_Range(1,3),1);
                      g_plot(((explosion_dx_fxp[k] * (j>>16))>>16) + x, ((explosion_dy_fxp[k] * (j>>16))>>16) + y);
                   }
                }
                if (rock_state[i] > ROCK_STATE_ABSENT) {
                   // PROCESS DEGRADING ROCK STATE (EXPLODING -> DELAY -> ABSENT)
                   --rock_state[i];
                }
                else if (Rand_Range(0, 3000) <= 1) {
                   // rocks make an appearance at random times
                   rock_state[i] = ROCK_STATE_PRESENT;
                   rock_angle[i] = ANG_1 * Rand_Range(1,359);
                   rock_scale[i] = (SHIP_SCALE/2) + Rand_Range(0, (SHIP_SCALE/2));
                   rock_spin[i] = ANG_1 * Rand_Range(-5, 5);
                   // rock appears on a random edge - but not right near ships!
                   if (Rand_Range(0,1) == 0) {
                      object_x[i+OBJECT_ROCK_0] = ((half_screen_width - 1)<<16);
                      object_y[i+OBJECT_ROCK_0] = Rand_Range ((-half_screen_height + 50), (half_screen_height - 50))<<16;
                   }
                   else {
                      object_x[i+OBJECT_ROCK_0] = Rand_Range ((-half_screen_width + 100), (half_screen_width - 100))<<16;
                      object_y[i+OBJECT_ROCK_0] = ((half_screen_height - 1)<<16);
                   }
                   object_dx[i+OBJECT_ROCK_0] = Rand_Range (-2,2)<<16;
                   object_dy[i+OBJECT_ROCK_0] = Rand_Range (-2,2)<<16;
                   if ((object_dx[i+OBJECT_ROCK_0] == 0) && (object_dy[i+OBJECT_ROCK_0] == 0)) {
                      // don't let initial speed be zero
                      object_dx[i+OBJECT_ROCK_0] = 1<<16;
                   }
                }
             }
          }
       }
#endif

       // DRAW PLAYER SHIPS AND STATS
       for (player_index = 0; player_index < NUM_PLAYERS; player_index++) {

          if (!(ship_flags[player_index] & SHIP_FLAG_HYPERSPACE)) {
             //---------------------
             // DRAW SHIPS
             //---------------------
             // extract whole parts of fixed point position to save time in parameters
             x = object_x[player_index]>>16;
             y = object_y[player_index]>>16;
  
             if ((ship_state[player_index] <= SHIP_STATE_EXPLODING) 
             &&  (ship_state[player_index] > SHIP_STATE_DIE_DELAY)) {
                //Ship is in the SHIP_STATE_EXPLODING state, so draw explosion
  
                if (ship_state[player_index] > SHIP_STATE_STRICKEN) {
                   if (player_index == PLAYER_0) {
                      g_colorwidth(2,1);
                      g_vec(x, y, SHIP_SCALE, ship_angle[player_index], player0_ship[damage[player_index]]);
                   }
                   else {
                      g_colorwidth(3,1);
                      g_vec(x, y, SHIP_SCALE, ship_angle[player_index], player1_ship[damage[player_index]]);
                   }
                }
                else {
                   //Set j to a fixed point value between 0.0 and 1.0 reflecting the progress of the
                   //   player explosion state.  Starts at 0.0 at beginning of explosion, and
                   //   ends at 1.0 at the end of the explosion.
                   j = 0x00010000 - (((ship_state[player_index] - SHIP_STATE_DIE_DELAY) << 16) 
                         / (SHIP_STATE_EXPLODING - SHIP_STATE_DIE_DELAY));
                   //Scale j by 90 degrees and convert back to integer.  Now j will range from 0 to 90 degrees
                   //   over the course of the explosion.
                   j = (j * ANG_90) >> 16;
                   //Compute a fixed point value which ranges from 0.0 to the explosion radius over the course
                   //   of the explosion in a sinusoidal expansion (rapidly at first, then slowly at the end).
                   //   This value will be used to scale the displayed distance of the explosion particles
                   //   from the ship's center.
                   j = Sin(j) * EXPLOSION_RADIUS;
                   //Loop over all the explosion particles
                   for (i = 0; i < NUM_EXPLOSION_PARTICLES; i++) {
                      //Draw an explosion particle
                      g_colorwidth(Rand_Range(1,3),1);
                      g_plot(((explosion_dx_fxp[i] * (j>>16))>>16) + x, ((explosion_dy_fxp[i] * (j>>16))>>16) + y);
                   }
                }
             }
             else {
                if (ship_state[player_index] == SHIP_STATE_ALIVE) {
                   //Ship is alive, so draw it
                   if (player_index == PLAYER_0) {
                      g_colorwidth(2,0);
                      g_vec(x, y, SHIP_SCALE, ship_angle[player_index], player0_ship[damage[player_index]]);
                   }
                   else {
                      g_colorwidth(3,0);
                      g_vec(x, y, SHIP_SCALE, ship_angle[player_index], player1_ship[damage[player_index]]);
                   }
    
                   g_colorwidth(1,0);
    
                   //If shields are up, then show them
                   if (ship_flags[player_index] & SHIP_FLAG_SHIELDS_UP) {
                      g_vec(x, y, SHIP_SCALE, shield_angle, vectors_shield);
                   }
    
                   //Draw thruster
                   random_var = _rand_forward(random_var);
                   if ((ship_flags[player_index] & SHIP_FLAG_THRUSTING) && (random_var & 0x01)) {
                      //Offset the flare from ship center
                      if (player_index) {
                         //Player 1
                         //g_colorwidth(1,0)
                         dx = x - ((Cos(ship_angle[PLAYER_1]) * P1_THRUSTER_DISTANCE)>>16);
                         dy = y - ((Sin(ship_angle[PLAYER_1]) * P1_THRUSTER_DISTANCE)>>16);
                      }
                      else {
                         //Player 0
                         //g_colorwidth(2,0)
                         dx = x - ((Cos(ship_angle[PLAYER_0]) * P0_THRUSTER_DISTANCE)>>16);
                         dy = y - ((Sin(ship_angle[PLAYER_0]) * P0_THRUSTER_DISTANCE)>>16);
                      }
                      g_plot(dx, dy);
                      g_line(dx - (thrust_dx[player_index]>>ROR_THRUST), dy - (thrust_dy[player_index]>>ROR_THRUST));
                   }
                }
             }
          }
          //---------------------
          // DRAW DAMAGE
          //---------------------
          for (i = 0; i < (4 * NUM_DAMAGE_PARTICLES - 1); i++) {
             if (damage_ttl[i] > 0) {
                damage_ttl[i]--;
                if (i < 2*NUM_DAMAGE_PARTICLES) {
                   g_colorwidth(2,1);
                }
                else {
                   g_colorwidth(3,1);
                }
                damage_x[i] += damage_dx[i];
                damage_y[i] += damage_dy[i];
                g_plot(damage_x[i],damage_y[i]);
             }
          }
          //---------------------
          // DRAW PLAYER STATS
          //---------------------
          g_colorwidth(1,0);
          if (player_index == 0) {
             x = PLAYER_0_STATS_X_POS;
             y = PLAYER_0_STATS_Y_POS;
          }
          else {
             x = PLAYER_1_STATS_X_POS;
             y = PLAYER_1_STATS_Y_POS;
          }

          // DRAW FUEL REMAINING
          if (ship_fuel_fxp[player_index] && (game_options & OPTION_FUEL)) {
             g_plot(x                                    , y + 7);
             g_line(x + (ship_fuel_fxp[player_index]>>16), y + 7);
             g_plot(x                                    , y + 8);
             g_line(x + (ship_fuel_fxp[player_index]>>16), y + 8);
          }
     
          // DRAWSHIELD POWER REMAINING
          if (ship_shield_power_fxp[player_index] && (game_options & OPTION_SHIELDS)) {
             j = ship_shield_power_fxp[player_index]>>16;
             for (i = x; i <= x + j; i += 2) {
                g_plot(i, y + 10);
                g_plot(i, y + 11);
             }
          }
       }

       // DRAW SHOTS
       for (shot_index = 0; shot_index < NUM_SHOTS; shot_index++) {
          if (shot_time_to_live[shot_index] != 0) {
             // Draw 2x2 shot
             x = object_x[shot_index+OBJECT_PLAYER_0_SHOT_0]>>16;
             y = object_y[shot_index+OBJECT_PLAYER_0_SHOT_0]>>16;
             g_plot(x  ,y  );
             g_plot(x+1,y+1);
             g_plot(x+1,y  );
             g_plot(x  ,y+1);
          }
       }
       // DRAW SHIPS REMAINING
       if (lives[PLAYER_0] != 0) {
          for (i = 1; i < lives[PLAYER_0]; i++) {
             g_vec(PLAYER_0_STATS_X_POS + ((i - 1)<<3) + 4, 
                   PLAYER_0_STATS_Y_POS, 0x0015, (0x2000>>2), player0_ship[0]);
          }
       }
       if (lives[PLAYER_1] != 0) {
          for (i = 1; i < lives[PLAYER_1]; i++) {
             g_vec(PLAYER_1_STATS_X_POS + ((i - 1)<<3) + 4, 
                   PLAYER_1_STATS_Y_POS, 0x0015, (0x2000>>2), player1_ship[0]);
          }
       }

#ifdef BFG       
       // DRAW BFG
       if (bfg_flags & BFG_FLAG__PICKUP) {
           g_vec(bfg_x, bfg_y, 0x0020, shield_angle, vectors_bfg);
       }
#endif       

       // PROCESS AND RENDER BLACK HOLE
       if ((game_options & OPTION_BLACK_HOLE) != 0) {
#ifdef SIMPLE_BLACK_HOLE
          // Old style black hole animation
          length = 8;
          for (i = 0; i< 5; i++) {
            g_plot(BLACK_HOLE_X,BLACK_HOLE_Y);
            g_line(BLACK_HOLE_X + Rand_Range(-length,length), BLACK_HOLE_Y + Rand_Range(-length,length));
          }
#else // SIMPLE_BLACK_HOLE          
          g_plot(0,0);
          j = 1;
          for (i = 0; i < NUM_BLACK_HOLE_PARTICLES - 1; i++) {
             if (!(black_hole_particle_mask & j)) {
                //Particle does not exist.  Randomly choose whether to spawin it
                if (Rand_Range(1,20) < 2) {
                   //Spawn particle
                   black_hole_particle_angle[i] = Rand_Range(ANG_0, ANG_360);
                   black_hole_particle_radius[i] = (20 << 16);
                   black_hole_particle_mask |= j;
                }
             }
             else {
                //Particle exists so render and update it
                g_plot((Cos(black_hole_particle_angle[i]) * (black_hole_particle_radius[i]>>16))>>16,  
                      (Sin(black_hole_particle_angle[i]) * (black_hole_particle_radius[i]>>16))>>16);
                //g_plot((Cos(black_hole_particle_angle[i]) * 6)>>16,  
                //      (Sin(black_hole_particle_angle[i]) * 6)>>16)
                black_hole_particle_radius[i] -= 0x8000;
                black_hole_particle_angle[i] += (ANG_1 * 3) * (9 - (black_hole_particle_radius[i]>>16));
                if (black_hole_particle_angle[i] > ANG_360) {
                   black_hole_particle_angle[i] -= ANG_360;
                }
                //If particle has reached the center
                if  (black_hole_particle_radius[i] < 0) {
                   //Extinguish particle
                   black_hole_particle_mask &= ~j;
                }
             }
             j <<= 1;
          }
#endif // SIMPLE_BLACK_HOLE
       }

       // DRAW STARS
       if (game_options & OPTION_TWINKLE) {
          //twinkle stars randomly
          for (i = 0; i < NUM_STARS; i++) {
             if (Rand_Range(0,10) > color_mode) {
                g_plot(star_x[i], star_y[i]);
             }
             else if (color_mode > 0) {
                g_colorwidth(2,0);
                g_plot(star_x[i], star_y[i]);
             }
          }
       }
       else {
          // simple plot
          for (i = 0; i < NUM_STARS; i++) {
             g_plot(star_x[i], star_y[i]);
          }
       }

       //==================================================================================================
       // PACING
       //==================================================================================================
#ifdef PACING_OVERRUNS
       //OLD Pacing algorithm
       if ((curr_count>>1) < 0x7fffffff - (PACING_TICK>>1)) {
          //No counter wrap
          if ((curr_count>>1) + ((PACING_TICK>>1) - (PACING_MARGIN>>1)) > (CNT>>1)) {
             //Wait for pacing
             _waitcnt(curr_count + PACING_TICK);
          }
          else {
             //Missed target frame rate.  Indicate with a large square dot in the corner, and continue on
             g_plot((half_screen_width-1), (half_screen_height-1));
             g_plot((half_screen_width-2), (half_screen_height-1));
             g_plot((half_screen_width-1), (half_screen_height-2));
             g_plot((half_screen_width-2), (half_screen_height-2));
          }
       }
       else {
          //Counter wrap
          g_plot(-(half_screen_width-1), (half_screen_height-1));
          g_plot(-(half_screen_width-2), (half_screen_height-1));
          g_plot(-(half_screen_width-1), (half_screen_height-2));
          g_plot(-(half_screen_width-2), (half_screen_height-2));
       }
#endif           

#ifdef PACING_LED
       //NEW Pacing algorithm (PACING_OVERRUNS not currently supported)
       OUTA |= 1; //Set debug LED

       pacing_target = (curr_count + PACING_TICK)>>2;
       pacing_cnt = CNT>>2;
       if (pacing_target < (0x7fffffff>>2)) {
          //No wrap
          j = pacing_target + (0x7fffffff>>2);
          while ((pacing_cnt < pacing_target) or (pacing_cnt > j)) {
             pacing_cnt = CNT>>2
          }
       }
       else {
          //Wrap
          j = pacing_target - (0x7fffffff>>2)
          while ((pacing_cnt < pacing_target) and (pacing_cnt > j)) {
             pacing_cnt = CNT>>2
          }
       }

       //Clear debug LED
       OUTA &= 0xFFFFFFE //Clear debug LED
#endif       

       // move bitmap to display if double buffering
       g_move(DOUBLE_BUFFER);
     }

   }

   //----------------------------
   // Game Over
   //----------------------------

#ifdef SFX   
   SFX_stop_ship_action_sounds(0);
   SFX_stop_ship_action_sounds(1);
#endif

   g_textmode(4,1,5,3);
   g_colorwidth(1,0);
   g_text(-90, 30, game_over_string);
   g_copy(DOUBLE_BUFFER);
   _waitcnt(70000000 + CNT);

   g_textmode(1,1,5,3);
   g_text(-34, -35, game_over_restart);
   g_copy(DOUBLE_BUFFER);

   // WAIT FOR RESTART
   WaitForStartButton();
   g_clear();
   g_copy(DOUBLE_BUFFER);

}

#ifdef SFX

void SFX_Manager() {

   do {

      //-------------------
      // SHOT SOUNDS
      //-------------------
      if ((sfx_flags & SFX_SND_SHIP0_SHOT_START) != 0) {
         //Start ship 0 shot sound
         sfx_cnt_ship0_shot = 0;
         sfx_flags &= ~SFX_SND_SHIP0_SHOT_START;
         sfx_flags |= SFX_SND_SHIP0_SHOT;
      }

      if ((sfx_flags & SFX_SND_SHIP0_SHOT) != 0) {
         //Play ship 0 shot sound
         PlaySoundFM(5, SHAPE_SAWTOOTH, 
              0x0400 - (sfx_cnt_ship0_shot * SFX_SHOT_SCALE), 
              (SAMPLE_RATE / SFX_SHOT_DIVISOR), 128, 0x2468ACEF);
         if (++sfx_cnt_ship0_shot == SFX_SHOT_SOUND_COUNT) {
            sfx_flags &= ~SFX_SND_SHIP0_SHOT;
         }
      }

      if ((sfx_flags & SFX_SND_SHIP1_SHOT_START) != 0) {
         //Start ship 1 shot sound
         sfx_cnt_ship1_shot = 0;
         sfx_flags &= ~SFX_SND_SHIP1_SHOT_START;
         sfx_flags |= SFX_SND_SHIP1_SHOT;
      }
  
      if ((sfx_flags & SFX_SND_SHIP1_SHOT) != 0) {
         //Stop ship 1 shot sound
         PlaySoundFM(4, SHAPE_SAWTOOTH, 
              0x0520 - (sfx_cnt_ship1_shot * SFX_SHOT_SCALE), 
              (SAMPLE_RATE / SFX_SHOT_DIVISOR), 128, 0x2468ACEF);
         if (++sfx_cnt_ship1_shot == SFX_SHOT_SOUND_COUNT) {
            sfx_flags &= ~SFX_SND_SHIP1_SHOT;
         }
      }
  
      //-------------------
      // THRUST SOUNDS
      //-------------------
      if ((sfx_flags & (SFX_SND_SHIP0_THRUST | SFX_SND_SHIP1_THRUST)) != 0) {
         //Play thrust sound
         PlaySoundFM(3, SHAPE_NOISE, 0x080 + Rand_Range(0,0x030), 
              (SAMPLE_RATE / 2), 75, 0x2468ACEF);
      }

      //-------------------
      // SHIELD SOUNDS
      //-------------------
      if ((sfx_flags & (SFX_SND_SHIP0_SHIELD | SFX_SND_SHIP1_SHIELD | SFX_SND_SHIELD_SUSTATIN)) != 0) {
         //play shield sound
         PlaySoundFM(2, SHAPE_SINE, 0x255 + sfx_cnt_shield * 2, 
              (SAMPLE_RATE / 8), 80, 0x2468ACEF);
  
         //set sustain, so that shield sound always ends and bottom of pitch warble cycle
         sfx_flags |= SFX_SND_SHIELD_SUSTATIN;
   
         //Model shield sound warble as a triangle shaped pitch change
         if (shield_snd_ascending) {
            ++sfx_cnt_shield;
            if (sfx_cnt_shield >= SFX_SHIELD_CNT_CYCLE) {
               shield_snd_ascending = 0;
            }
         }
         else {
            --sfx_cnt_shield;
            if(sfx_cnt_shield == 0) {
               shield_snd_ascending = 1;
               //End sustain.  Shield sound will stop if shields are currently inactive. (This forces
               //the shield sound to always end at the bottom of the pitch warble cycle).
               sfx_flags &= ~SFX_SND_SHIELD_SUSTATIN;
            }
         }
      }
      else {
         sfx_cnt_shield = 0;
         shield_snd_ascending = 1;
      }
  
      //-------------------
      // EXPLOSION SOUNDS
      //-------------------
      if ((sfx_flags & SFX_SND_EXPLODE) != 0) {
         //Play explosion sound
         PlaySoundFM(3, SHAPE_NOISE, 0x100 , (SAMPLE_RATE / 1), 110, 0x2468ACEF);
         sfx_flags &= ~SFX_SND_EXPLODE;
      }
  
      //-------------------
      // DAMAGE SOUNDS
      //-------------------
      if ((sfx_flags & SFX_SND_DAMAGE) != 0) {
         //Play explosion sound
         PlaySoundFM(3, SHAPE_NOISE, 0x200 , (SAMPLE_RATE / 2), 110, 0x2468ACEF);
         sfx_flags &= ~SFX_SND_DAMAGE;
      }
#if SFX_COG   
    } while (1); // loop forever
#else
    } while (0); // only loop once
#endif   

}

void SFX_stop_ship_action_sounds(sint player) {

  if (player == 0) {
    sfx_flags &= ~(SFX_SND_SHIP0_THRUST | SFX_SND_SHIP0_SHIELD);
  }
  else {
    sfx_flags &= ~(SFX_SND_SHIP1_THRUST | SFX_SND_SHIP1_SHIELD);
  }
}
#endif
