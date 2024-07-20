/*
 * startrek.c
 *
 * Super Star Trek Classic (v1.1)
 * Retro Star Trek Game 
 * C Port Copyright (C) 1996  <Chris Nystrom>
 * 
 * This program is free software; you can redistribute it and/or modify
 * in any way that you wish. _Star Trek_ is a trademark of Paramount
 * I think.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * This is a C port of an old BASIC program: the classic Super Star Trek
 * game. It comes from the book _BASIC Computer Games_ edited by David Ahl
 * of Creative Computing fame. It was published in 1978 by Workman Publishing,
 * 1 West 39 Street, New York, New York, and the ISBN is: 0-89489-052-3.
 * 
 * See http://www.cactus.org/~nystrom/startrek.html for more info.
 *
 * Contact Author of C port at:
 *
 * Chris Nystrom
 * 1013 Prairie Dove Circle
 * Austin, Texas  78758
 *
 * E-Mail: cnystrom@gmail.com, nystrom@cactus.org
 *
 * BASIC -> Conversion Issues
 *
 *     - String Names changed from A$ to sA
 *     - Arrays changed from G(8,8) to g[9][9] so indexes can
 *       stay the same.
 *
 * Here is the original BASIC header:
 *
 * SUPER STARTREK - MAY 16, 1978 - REQUIRES 24K MEMORY
 *
 ***        **** STAR TREK ****        ****
 *** SIMULATION OF A MISSION OF THE STARSHIP ENTERPRISE,
 *** AS SEEN ON THE STAR TREK TV SHOW.
 *** ORIGINAL PROGRAM BY MIKE MAYFIELD, MODIFIED VERSION
 *** PUBLISHED IN DEC'S "101 BASIC GAMES", BY DAVE AHL.
 *** MODIFICATIONS TO THE LATTER (PLUS DEBUGGING) BY BOB
 *** LEEDOM - APRIL & DECEMBER 1974,
 *** WITH A LITTLE HELP FROM HIS FRIENDS . . .
 *** COMMENTS, EPITHETS, AND SUGGESTIONS SOLICITED --
 *** SEND TO:  R. C. LEEDOM
 ***           WESTINGHOUSE DEFENSE & ELECTRONICS SYSTEMS CNTR.
 ***           BOX 746, M.S. 338
 ***           BALTIMORE, MD  21203
 ***
 *** CONVERTED TO MICROSOFT 8 K BASIC 3/16/78 BY JOHN BORDERS
 *** LINE NUMBERS FROM VERSION STREK7 OF 1/12/75 PRESERVED AS
 *** MUCH AS POSSIBLE WHILE USING MULTIPLE STATMENTS PER LINE
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
/* #include <time.h> */
#include <cog.h> // use _cnt instead of time as random seed

#ifndef FALSE
#define FALSE        0
#endif
 
#ifndef TRUE
#define TRUE         ! FALSE
#endif

/* Standard Line Length */
 
#define MAXLEN     255
 
/* Standard Terminal Sizes */
 
#define MAXROW      24
#define MAXCOL      80
 
/* Standard Page Size */
 
#define MAXLINES    66
 
/* Useful typedefs */
 
typedef int bool;
typedef char line[MAXCOL];
typedef char string[MAXLEN];

/* Function Declarations */

void intro(void);
void new_game(void);
void initialize(void);
void new_quadrant(void);
void course_control(void);
void complete_maneuver(void);
void exceed_quadrant_limits(void);
void maneuver_energy(void);
void short_range_scan(void);
void long_range_scan(void);
void phaser_control(void);
void photon_torpedoes(void);
void torpedo_hit(void);
void damage_control(void);
void shield_control(void);
void library_computer(void);
void galactic_record(void);
void status_report(void);
void torpedo_data(void);
void nav_data(void);
void dirdist_calc(void);
void galaxy_map(void);
void end_of_time(void);
void resign_commision(void);
void won_game(void);
void end_of_game(void);
void klingons_move(void);
void klingons_shoot(void);
void repair_damage(void);
void find_empty_place(void);
void insert_in_quadrant(void);
void get_device_name(void);
void string_compare(void);
void quadrant_name(void);
int function_d(int i);
int function_r(void);
void mid_str(char *a, char *b, int x, int y);
int cint(double d);
void compute_vector(void);
void sub1(void);
void sub2(void);
/*
void showfile(char *filename);
int openfile(char * sFilename, char * sMode);
void closefile(void);
*/
int getline(char *s);
void randomize(void);
int get_rand(int iSpread);
double rnd(void);

/* Global Variables */

int b3;                           /* Starbases in Quadrant */
int b4, b5;                 /* Starbase Location in sector */
int b9;                                 /* Total Starbases */

/* @@@ int c[2][10] = */  /* Used for location and movement */         
int c[3][10] = /* modified to match MS BASIC array indicies */
   {
     { 0 },
     { 0, 0, -1, -1, -1,  0,  1, 1, 1, 0 },
     { 1, 1,  1,  0, -1, -1, -1, 0, 1, 1 }
   };

int d0;                                     /* Docked flag */
int d1;                              /* Damage Repair Flag */
int e;                                   /* Current Energy */
int e0 = 3000;                          /* Starting Energy */
int g[9][9];                                     /* Galaxy */
int g5;                              /* Quadrant name flag */
int k[4][4];                               /* Klingon Data */
int k3;                            /* Klingons in Quadrant */
int k7;                               /* Klingons at start */
int k9;                             /* Total Klingons left */
int n;                       /* Number of secors to travel */
int p;                            /* Photon Torpedoes left */
int p0 = 10;                    /* Photon Torpedo capacity */
int q1, q2;             /* Quadrant Position of Enterprise */
int r1, r2;              /* Temporary Location Corrdinates */
int s;                             /* Current shield value */
int s3;                               /* Stars in quadrant */
int s8;                         /* Quadrant locating index */
int s9 = 200;                             /* Klingon Power */
int t0;                               /* Starting Stardate */
int t9;                                     /* End of time */
int z[9][9];                /* Cumulative Record of Galaxy */
int z3;                     /* string_compare return value */
int z1, z2;                /* Temporary Sector Coordinates */
int z4, z5;              /* Temporary quadrant coordinates */

double a, c1;                   /* Used by Library Computer */
double d[9];                                /* Damage Array */
double d4;         /* Used for computing damage repair time */
double s1, s2;     /* Current Sector Position of Enterprise */
double t;                               /* Current Stardate */
double w1;                                   /* Warp Factor */
double x, y, x1, x2;            /* Navigational coordinates */

char sA[4];                       /* An Object in a Sector */
char sC[7];                                   /* Condition */
char sQ[194];                /* Visual Display of Quadrant */

string sG2;                 /* Used to pass string results */

FILE *stream;
bool bFlag = FALSE;         /* Prevent multiple file opens */

/* Main Program */

int
main(void)
{
  intro();

  new_game();

  /* @@@ exit(0);  */ /* causes a warning in C++ */

  return(0);
}

void t_print(char *s) {
   t_string(1, s);
}

void t_cls() {
   t_char(1, 0x0c);
}

void t_prinf(float f) {
   t_float(1, f, 6);
}

void t_prini(int i) {
   t_integer(1, i);
}
void t_princ(char c) {
   t_char(1, c);
}

void 
  t_print_1in(char *s, int i) {
   t_print(s);
   t_prini(i);
   t_char(1, '\n');
}

void 
t_x_y(int x, int y) {
   t_prini(x);
   t_print(",");
   t_prini(y);
}

void 
  t_print_2in(char *s, int i, int j) {
   t_print(s);
   t_x_y(i, j);
   t_char(1, '\n');
}

void
t_integer_3(int i) {
   if (i >= 100) {
      t_char (1, (char) i / 100 + '0');
      i = i - 100*(i / 100);
   }
   else {
      t_char(1, '0');
   }
   if (i >= 10) {
      t_char (1, (char) i / 10 + '0');
      i = i - 10*(i / 10);
   }
   else {
      t_char(1, '0');
   }
   t_char(1, (char) i + '0');
}

void
  t_print_1fn(char *s, float f) {
   t_print(s);
   t_prinf(f);
   t_char (1, '\n');
}

void t_gets(char *s) {
   int i = 0;
   char ch;

   while (i < MAXLEN - 1) {
      ch = (char)k_wait();
      if ((ch == '\n') || (ch == '\r')) {
         break;
      }
      else {
         t_char(1, ch);
         s[i++] = ch;
      }
   }
   t_char(1, '\n');
   s[i] = '\0';
}

void
showhelp(void) {

  t_print("\fSuper Star Trek Instructions\n\n");
  t_print("  When you see \"Command?\", enter\n");
  t_print("  one of the nine legal commands:\n\n");
  t_print("     nav, srs, lrs, pha, tor, \n");
  t_print("     shi, dam, com or xxx\n\n");
  t_print("  If you type in an illegal command,\n");
  t_print("  you'll get a short list of legal \n");
  t_print("  commands printed out.\n\n");
  t_print("  Some commands require you to enter \n");
  t_print("  data (for example, the \"nav\" command\n");
  t_print("  comes back with \"Course(1-9) ?\"\n\n");
  t_print("  If you type in illegal data (like\n");
  t_print("  negative numbers), that command will\n");
  t_print("  be aborted.\n\n");
  t_print("\nHit any key to continue:");k_wait();
  t_print("\fThe Galaxy\n\n");
  t_print("  The galaxy is divided into an 8 x 8 \n");
  t_print("  quadrant grid, and each quadrant\n");
  t_print("  is further divided into an 8 x 8 \n");
  t_print("  sector grid.\n\n");
  t_print("  You will be assigned a starting point\n");
  t_print("  somewhere in the galaxy to begin a \n");
  t_print("  tour of duty as commander of the \n");
  t_print("  starship Enterprise; Your mission:\n");
  t_print("  to seek out and destroy the fleet of \n");
  t_print("  Klingon warships which are menacing\n");
  t_print("  the United Federation of Planets.\n\n");
  t_print("Commands\n\n");
  t_print("  You have the following nine commands\n");
  t_print("  available to you as Captain of the\n");
  t_print("  Starship Enterprise:\n\n");
  t_print("     nav, srs, lrs, pha, tor, \n");
  t_print("     shi, dam, com or xxx\n\n");
  t_print("  Each command is explained below.\n");
  t_print("\nHit any key to continue:");k_wait();
  t_print("\f\"nav\" = Warp Engine Control\n\n");
  t_print("  Course is in a circular numerical\n");
  t_print("  vector arrangement: \n\n");
  t_print("      4    3    2     Integer and\n");
  t_print("        .  .  .       real values\n");
  t_print("          ...         may be used -\n");
  t_print("      5 ---*--- 1     thus course\n");
  t_print("          ...         1.5 is halfway\n");
  t_print("        .  .  .       between 1 and 2\n");
  t_print("      6    7    8\n\n");
  t_print("      -  COURSE -\n\n");
  t_print("  Values may approach 9.0, which itself\n");
  t_print("  is equivalent to 1.0.\n\n");
  t_print("  One warp factor is the size of one\n");
  t_print("  quadrant. Therefore, to get from\n");
  t_print("  quadrant 6,5 to 5,5 you would use\n");
  t_print("  course 3, warp factor 1.\n");
  t_print("\nHit any key to continue:");k_wait();
  t_print("\f\"srs\" = Short Range Sensor Scan\n\n");
  t_print("  Shows you a scan of your present \n");
  t_print("  quadrant.\n\n");
  t_print("  Symbology on your sensor screen is \n");
  t_print("  as follows:\n\n");
  t_print("    <*> = Your starship's position\n");
  t_print("    +K+ = Klingon battlecruiser\n");
  t_print("    >!< = Federation starbase \n");
  t_print("          (Refuel/Repair/Re-Arm here)\n");
  t_print("     *  = Star\n\n");
  t_print("  A condensed 'Status Report' will also\n");
  t_print("  be presented.\n");
  t_print("\nHit any key to continue:");k_wait();
  t_print("\f\"lrs\" = Long Range Sensor Scan\n\n");
  t_print("  Shows conditions in space for one \n");
  t_print("  quadrant on each side of the \n");
  t_print("  Enterprise (which is in the middle of\n");
  t_print("  the scan). The scan is coded in the \n");
  t_print("  form ### where the units digit is the\n");
  t_print("  number of stars, the tens digit is \n");
  t_print("  the number of starbases, and the \n");
  t_print("  hundreds digit is the number of \n");
  t_print("  Klingons.\n\n");
  t_print("  Example - 207 = 2 Klingons, \n");
  t_print("                  No Starbases,\n");
  t_print("                  & 7 stars.\n");
  t_print("\nHit any key to continue:");k_wait();
  t_print("\f\"pha\" = Phaser Control.\n\n");
  t_print("  Allows you to destroy the Klingon \n");
  t_print("  Battle Cruisers by zapping them with\n");
  t_print("  suitably large units of energy to \n");
  t_print("  deplete their shield power. \n");
  t_print("  (Remember, Klingons have phasers, \n");
  t_print("   too!)\n\n\n");
  t_print("\"tor\" = Photon Torpedo Control\n\n");
  t_print("  Torpedo course is the same as used in\n");
  t_print("  warp engine control. If you hit the \n");
  t_print("  Klingon vessel, he is destroyed and \n");
  t_print("  cannot fire back at you. If you miss,\n");
  t_print("  you are subject to the phaser fire of\n");
  t_print("  all other Klingons in the quadrant.\n\n");
  t_print("  The Library-Computer (\"com\" command)\n");
  t_print("  has an option to compute torpedo\n");
  t_print("  trajectory for you (option 2).\n");
  t_print("\nHit any key to continue:");k_wait();
  t_print("\f\"shi\" = Shield Control\n\n");
  t_print("  Defines the number of energy units to\n");
  t_print("  be assigned to the shields. Energy\n");
  t_print("  is taken from total ship's energy. \n");
  t_print("  Note that the status display total\n");
  t_print("  energy includes shield energy.\n\n\n");
  t_print("\"dam\" = Damage Control report\n\n");
  t_print("  Gives the state of repair of all \n");
  t_print("  devices. Where a negative 'State of \n");
  t_print("  Repair' shows that the device is \n");
  t_print("  temporarily damaged.\n");
  t_print("\nHit any key to continue:");k_wait();
  t_print("\f\"com\" = Library-Computer\n\n");
  t_print("  The Library-Computer contains six \n");
  t_print("  options:\n\n");
  t_print("  0 = Cumulative Galactic Record\n\n");
  t_print("    This option shows computer memory \n");
  t_print("    of the results of all previous\n");
  t_print("    short and long range sensor scans.\n\n");
  t_print("  1 = Status Report\n\n");
  t_print("    This option shows the number of \n");
  t_print("    Klingons, stardates, and starbases\n");
  t_print("    remaining in the game.\n\n");
  t_print("  2 = Photon Torpedo Data\n\n");
  t_print("    Which gives directions and distance\n");
  t_print("    from Enterprise to all Klingons\n");
  t_print("    in your quadrant.\n");
  t_print("\nHit any key to continue:");k_wait();
  t_print("\f  3 = Starbase Nav Data\n\n");
  t_print("    This option gives direction and \n");
  t_print("    distance to any starbase in your\n");
  t_print("    quadrant.\n\n");
  t_print("  4 = Direction/Distance Calculator\n\n");
  t_print("    This option allows you to enter \n");
  t_print("    coordinates for direction/distance\n");
  t_print("    calculations.\n\n");
  t_print("  5 = Galactic \"Region Name\" Map\n\n");
  t_print("    This option prints the names of \n");
  t_print("    the sixteen major galactic regions\n");
  t_print("    referred to in the game.\n\n\n");
  t_print("\"xxx\" = Exit the Game\n\n");
  t_print("  Resign your commission and exit.\n");
  t_print("\n\nHit any key to continue:");k_wait();
  t_print("\f");
   
}

void
intro(void)
{
  string sTemp;

  k_clear();

  t_print("\n\n");
  t_print(" *************************************\n");
  t_print(" *                                   *\n");
  t_print(" *                                   *\n");
  t_print(" *      * * Super Star Trek * *      *\n");
  t_print(" *                                   *\n");
  t_print(" *                                   *\n");
  t_print(" *************************************\n\n\n\n\n");

  t_print("\nDo you need instructions (y/n): ");
  
  t_gets(sTemp);

  if (sTemp[0] == 'y' || sTemp[0] == 'Y') {
    showhelp();
    //showfile("startrek.doc");
  }

  t_print("\n\n\n\n\n\n\n");
  t_print("                   ------*------\n");
  t_print("   -------------   `---  ------'\n");
  t_print("   `-------- --'      / /\n");
  t_print("            \\\\-------  --\n");
  t_print("            '-----------'\n");
  t_print("\n The USS Enterprise --- NCC - 1701\n\n\n");

  randomize();

  t = (get_rand(20) + 20) * 100;
}

void
new_game(void)
{
  string sTemp;

  initialize();

  new_quadrant();

  short_range_scan();

  while(1)
    {
      if (s + e <= 10 && (e < 10 || d[7] < 0))
        {
          t_print("\n** Fatal Error **   ");
          t_print("You've just stranded your ship in space.\n\n");
          t_print("You have insufficient maneuvering energy,\n");
          t_print("and Shield Control is presently incapable\n");
          t_print("of cross circuiting to engine room!!\n\n");
          end_of_time();
        }

      t_print("Command? ");

      t_gets(sTemp);
      t_print("Command= ");
      t_print(sTemp);
      t_print("\n");

      if (! strncmp(sTemp, "nav", 3))
        course_control();
      else if (! strncmp(sTemp, "srs", 3))
        short_range_scan();
      else if (! strncmp(sTemp, "lrs", 3))
        long_range_scan();
      else if (! strncmp(sTemp, "pha", 3))
        phaser_control();
      else if (! strncmp(sTemp, "tor", 3))
        photon_torpedoes();
      else if (! strncmp(sTemp, "shi", 3))
        shield_control();
      else if (! strncmp(sTemp, "dam", 3))
        damage_control();
      else if (! strncmp(sTemp, "com", 3))
        library_computer();
      else if (! strncmp(sTemp, "xxx", 3))
        resign_commision();
      else
    {
      t_print("Enter one of the following:\n\n");
      t_print("  nav - To Set Course\n");
      t_print("  srs - Short Range Sensors\n");
      t_print("  lrs - Long Range Sensors\n");
      t_print("  pha - Phasers\n");
      t_print("  tor - Photon Torpedoes\n");
      t_print("  shi - Shield Control\n");
      t_print("  dam - Damage Control\n");
      t_print("  com - Library Computer\n");
      t_print("  xxx - Resign Command\n");
      t_print("\n");
    }
    }
}

void
initialize(void)
{
  int i, j;
  char sX[2] = "";
  char sX0[4] = "is";

  /* InItialize time */

  /* @@@ t0 = t; */
  t0 = (int)t;
  t9 = 25 + get_rand(10);

  /* Initialize Enterprise */

  d0 = 0;
  e = e0;
  p = p0;
  s = 0;

  q1 = function_r();
  q2 = function_r();
  s1 = (double) function_r();
  s2 = (double) function_r();

  for (i = 1; i <= 8; i++)
    d[i] = 0.0;

  /* Setup What Exists in Galaxy */

  for (i = 1; i <= 8; i++)
    for (j = 1; j <= 8; j++)
      {
        k3 = 0;
        z[i][j] = 0;
        r1 = get_rand(100);
        if (r1 > 98)
          k3 = 3;
        else if (r1 > 95)
          k3 = 2;
        else if (r1 > 80)
          k3 = 1;

        k9 = k9 + k3;
        b3 = 0;

        if (get_rand(100) > 96)
          b3 = 1;

        b9 = b9 + b3;

        g[i][j] = k3 * 100 + b3 * 10 + function_r();
      }

  if (k9 > t9)
    t9 = k9 + 1;

  if (b9 == 0)
    {
      if (g[q1][q2] < 200)
        {
          g[q1][q2] = g[q1][q2] + 100;
          k9++;
        }

      g[q1][q2] = g[q1][q2] + 10;
      b9++;

      q1 = function_r();
      q2 = function_r();
    }

  k7 = k9;

  if (b9 != 1)
    {
      strcpy(sX, "s");
      strcpy(sX0, "are");
    }

  t_print("Your orders are as follows:\n\n");
  t_print("Destroy the "); t_prini(k9); t_print(" Klingon warships which\n");
  t_print("have invaded the galaxy before they can\n");
  t_print("attack Federation Headquarters on\nstardate "); t_prini(t0+t9); t_print(". This gives you "); t_prini(t9);
  t_print(" days.\nThere "); t_print(sX0); t_print(" ");t_prini(b9); t_print(" starbase"); t_print(sX); 
  t_print(" in the galaxy\nfor resupplying your ship.\n\n");

  t_print("Hit any key to accept command. ");
  k_wait();
  t_print("\n\n");
}

void
new_quadrant(void)
{
  int i;
  float f;

  z4 = q1;
  z5 = q2;
  k3 = 0;
  b3 = 0;
  s3 = 0;
  g5 = 0; 
  d4 = (double) get_rand(100) / 100 / 50;
  z[q1][q2] = g[q1][q2];

  if (q1 >= 1 && q1 <= 8 && q2 >= 1 && q2 <= 8)
    {
      quadrant_name();

      if (t0 != t) {
        t_print("Now entering "); t_print(sG2); t_print(" quadrant...\n\n");
      }
      else
        {
          t_print("\nYour mission begins with your starship\n");
          t_print("located in the galactic quadrant\n"); t_print(sG2); t_print(".\n\n");
        }
    }

  /* @@@ k3 = g[q1][q2] * .01; */
  k3 = (int)(g[q1][q2] * .01);
  /* @@@ b3 = g[q1][q2] * .1 - 10 * k3; */
  b3 = (int)(g[q1][q2] * .1 - 10 * k3);
  s3 = g[q1][q2] - 100 * k3 - 10 * b3;

  if (k3 > 0)
    {
      t_print("Combat Area  Condition Red\n");

      if (s < 200)
        t_print("Shields Dangerously Low\n");
    }

  for (i = 1; i <= 3; i++)
    {
      k[i][1] = 0;
      k[i][2] = 0;
      k[i][3] = 0;
    }

  for (i = 0; i <= 192; i++)
    sQ[i] = ' ';

  sQ[193] = '\0';

  /* Position Enterprise, then Klingons, Starbases, and stars */
  
  strcpy(sA, "<*>");
  /* @@@ z1 = cint(s1); */
  z1 = (int)s1;
  /* @@@ z2 = cint(s2); */
  z2 = (int)s2;
  insert_in_quadrant();

  if (k3 > 0)
    {
      for (i = 1; i <= k3; i++)
        {
          find_empty_place();

          strcpy(sA, "+K+");
          z1 = r1;
          z2 = r2;
          insert_in_quadrant();

          k[i][1] = r1;
          k[i][2] = r2;
          k[i][3] = 100 + get_rand(200);
        }
    }

  if (b3 > 0)
    {
      find_empty_place();

      strcpy(sA, ">!<");
      z1 = r1;
      z2 = r2;
      insert_in_quadrant();

      b4 = r1;
      b5 = r2;
    }
  
  for (i = 1; i <= s3; i++)
    {
      find_empty_place();
      strcpy(sA, " * ");
      z1 = r1;
      z2 = r2;
      insert_in_quadrant();
    }
  
}

void
course_control(void)
{
  register i;
  /* @@@ int c2, c3, q4, q5; */
  int q4, q5;
  string sTemp;
  double c1;
  char sX[4] = "8";

  t_print("Course (0-9): ");

  t_gets(sTemp);

  t_print("\n");

  c1 = atof(sTemp);
 
  if (c1 == 9.0)
    c1 = 1.0;

  if (c1 < 0 || c1 > 9.0)
    {
      t_print("Lt. Sulu roports:\n");
      t_print(" Incorrect course data, sir!\n\n");
      return;
    }

  if (d[1] < 0.0)
    strcpy(sX, "0.2");

  t_print("Warp Factor (0-"); t_print(sX); t_print("): ");

  t_gets(sTemp);

  t_print("\n");

  w1 = atof(sTemp);

  if (d[1] < 0.0 && w1 > 0.21)
    {
      t_print("Warp Engines are damaged.\n");
      t_print("Maximum speed = Warp 0.2.\n\n");
      return;
    }

  if (w1 <= 0.0)
    return;

  if (w1 > 8.1)
    {
      t_print("Chief Engineer Scott reports:\n");
      t_print(" The engines won't take warp "); t_prinf(w1); t_print("!\n\n");
      return;
    }

  n = cint(w1 * 8.0); /* @@@ note: this is a real round in the original basic */
  
  if (e - n < 0)
    {
      t_print("Engineering reports:\n");
      t_print(" Insufficient energy available for\n maneuvering\n");
      t_print(" at warp "); t_prinf(w1); t_print("!\n\n");

      if (s >= n && d[7] >= 0.0)
        {
          t_print("Deflector Control Room acknowledges:\n ");
          t_prini(s); t_print(" units of energy presently deployed\nto shields.\n");
        }

      return;
    }

  klingons_move();

  repair_damage();

  strcpy(sA, "   ");
  /* @@@ z1 = cint(s1); */
  z1 = (int)s1;
  /* @@@ z2 = cint(s2); */
  z2 = (int)s2;
  insert_in_quadrant();

  /* @@@ c2 = cint(c1); */
  /* @@@ c3 = c2 + 1; */

  /* @@@ x1 = c[0][c2] + (c[0][c3] - c[0][c2]) * (c1 - c2); */
  /* @@@ x2 = c[1][c2] + (c[1][c3] - c[1][c2]) * (c1 - c2); */

  x1 = c[1][(int)c1] + (c[1][(int)c1 + 1] - c[1][(int)c1]) * (c1 - (int)c1);
  x2 = c[2][(int)c1] + (c[2][(int)c1 + 1] - c[2][(int)c1]) * (c1 - (int)c1);

  x = s1;
  y = s2;
  q4 = q1;
  q5 = q2;

  for (i = 1; i <= n; i++)
    {
      s1 = s1 + x1;
      s2 = s2 + x2;

      /* @@@ z1 = cint(s1); */
      z1 = (int)s1;
      /* @@@ z2 = cint(s2); */
      z2 = (int)s2;

      if (z1 < 1 || z1 >= 9 || z2 < 1 || z2 >= 9)
        {
          exceed_quadrant_limits();
          complete_maneuver();
          return;
        }

      string_compare();

      if (z3 != 1) /* Sector not empty */
        {
          s1 = s1 - x1;
          s2 = s2 - x2;
          t_print("Warp Engines shut down at sector ");
          t_prini(z1);
          t_char(1, ',');
          t_prini(z2);
          t_print("\ndue to bad navigation.\n\n");
          i = n + 1;
        }
    }

  complete_maneuver();
}

void
complete_maneuver(void)
{
  double t8;

  strcpy(sA, "<*>");
  /* @@@ z1 = cint(s1); */
  z1 = (int)s1;
  /* @@@ z2 = cint(s2); */
  z2 = (int)s2;
  insert_in_quadrant();

  maneuver_energy();

  t8 = 1.0;

  if (w1 < 1.0)
    t8 = w1;

  t = t + t8;

  if (t > t0 + t9)
    end_of_time();

  short_range_scan();
}

void
exceed_quadrant_limits(void)
{
  int x5 = 0;   /* Outside galaxy flag */

  /* @@@ x = (8 * (q1 - 1)) + x + (n * x1); */
  x = (8 * q1) + x + (n * x1);
  /* @@@ y = (8 * (q2 - 1)) + y + (n * x2); */
  y = (8 * q2) + y + (n * x2);

  /* @@@ q1 = cint(x / 8.0); */
  q1 = (int)(x / 8.0);
  /* @@@ q2 = cint(y / 8.0); */
  q2 = (int)(y / 8.0);
  
  /* @@@ s1 = x - ((q1 - 1) * 8); */
  s1 = x - (q1 * 8);
  /* @@@ s2 = y - ((q2 - 1) * 8); */
  s2 = y - (q2 * 8);

  /* @@@ if (cint(s1) == 0) */
  if ((int)s1 == 0)
    {
      q1 = q1 - 1;
      s1 = s1 + 8.0;
    }

  /* @@@ if (cint(s2) == 0) */
  if ((int)s2 == 0)
    {
      q2 = q2 - 1;
      s2 = s2 + 8.0;
    }

  /* check if outside galaxy */

  if (q1 < 1)
    {
      x5 = 1;
      q1 = 1;
      s1 = 1.0;
    }

  if (q1 > 8)
    {
      x5 = 1;
      q1 = 8;
      s1 = 8.0;
    }

  if (q2 < 1)
    {
      x5 = 1;
      q2 = 1;
      s2 = 1.0;
    }

  if (q2 > 8)
    {
      x5 = 1;
      q2 = 8;
      s2 = 8.0;
    }

  if (x5 == 1)
    {
      t_print("LT. Uhura reports:\n");
      t_print(" Message from Starfleet Command:\n\n");
      t_print(" Permission to attempt crossing of\ngalactic perimeter is hereby *denied*.\nShut down your engines.\n\n");
      t_print("Chief Engineer Scott reports:\n");
      /* @@@ printf("  Warp Engines shut down at sector %d, ", cint(s1)); */
      t_print(" Warp Engines shut down at sector "); t_prini((int)s1); t_print(", ");
      /* @@@ printf("%d of quadrant %d, %d.\n\n", cint(s2), q1, q2); */
      t_prini((int)s2); t_print("\nof quadrant "); t_prini(q1); t_print(", "); t_prini(q2); t_print(".\n\n");
    }
  /* else 
     new_quadrant(); @@@ this causes bugs when bouncing off galaxy walls.
                         basically, if you bounce very far, your quadrant contents
                         won't match your LRS.  Cool huh? */


  maneuver_energy();

  /* this section has a different order in the original.
  t = t + 1;
  
  if (t > t0 + t9)
    end_of_time();
  */

  if (t > t0 + t9)
    end_of_time();

  /* @@@ what does this do?? It's in the original.
  if (8 * q1 + q2 = 8 * q4 + q5) 
    { 
      complete_maneuver();
    }
  */

  t = t + 1;

  new_quadrant();
}

void
maneuver_energy(void)
{
  e = e - n - 10;

  if (e >= 0)
    return;

  t_print("Shield Control supplies energy to\ncomplete maneuver.\n\n");

  s = s + e;
  e = 0;

  if (s <= 0)
    s = 0;
}

void
short_range_scan(void)
{
  register i, j;

  strcpy(sC, "GREEN");

  if (e < e0 * .1)
    strcpy(sC, "AMBER");

  if (k3 > 0)
    strcpy(sC, "*RED*");

  /* @@@ need to clear the docked flag here */
  d0 = 0;

  /* @@@ for (i = s1 - 1; i <= s1 + 1; i++) */
  for (i = (int)(s1 - 1); i <= (int)(s1 + 1); i++)
    /* @@@ for (j = s2 - 1; j <= s2 + 1; j++) */
    for (j = (int)(s2 - 1); j <= (int)(s2 + 1); j++)
      if (i >= 1 && i <= 8 && j >= 1 && j <= 8)
        {
          strcpy(sA, ">!<");
          z1 = i;
          z2 = j;
          string_compare();
          if (z3 == 1)
            {
              d0 = 1;
              strcpy(sC, "DOCK ");
              e = e0;
              p = p0;
              t_print("Shields dropped for docking purposes.\n");
              s = 0;
            }
        }
          
  if (d[2] < 0.0)
    {
      t_print("\n*** Short Range Sensors are out ***\n");
      return;
    }

  t_print("------------------------\n");
  for (i = 0; i < 8; i++)
    {
      for (j = 0; j < 24; j++)
        t_char(1,sQ[i * 24 + j]); 

      if (i == 0)
         t_print_1in(" Stardate ", (int) t);
      if (i == 1) {
         t_print(    " Cndition "); t_print(sC); t_print("\n");
      }
      if (i == 2)
         t_print_2in(" Quadrant ", q1, q2);
      if (i == 3)
    /* @@@ printf("    Sector              %d, %d\n", cint(s1), cint(s2)); */
         t_print_2in(" Sector   ", (int)s1, (int)s2);
      if (i == 4)
         t_print_1in(" Torpedos ", p);
      if (i == 5)
         t_print_1in(" Energy   ", e + s);
      if (i == 6)
         t_print_1in(" Shields  ", s);
      if (i == 7)
         t_print_1in(" Klingons ", k9);
    }
  t_print("------------------------\n\n");

  return;
}

void
long_range_scan(void)
{
  register i, j;

  if (d[3] < 0.0)
    {
      t_print("Long Range Sensors are inoperable.\n");
      return;
    }

  t_print_2in("Long Range Scan for Quadrant ", q1, q2); t_char(1, '\n');

  for (i = q1 - 1; i <= q1 + 1; i++)
    {
      t_print("-------------------\n:");
      for (j = q2 - 1; j <= q2 + 1; j++)
        if (i > 0 && i <= 8 && j > 0 && j <= 8)
          {
            z[i][j] = g[i][j];
            t_print(" "); t_integer_3(z[i][j]); t_print(" :");
          }
        else
          t_print(" *** :");
      t_print("\n");
    }

    t_print("-------------------\n\n");
}

void
phaser_control(void)
{
  register i;
  int iEnergy;
  int h1, h;
  string sTemp;

  if (d[4] < 0.0)
    {
      t_print("Phasers Inoperative\n\n");
      return;
    }

  if (k3 <= 0)
    {
      t_print("Science Officer Spock reports:\n");
      t_print(" 'Sensors show no enemy ships in this\nquadrant'\n\n");
      return;
    }

  if (d[8] < 0.0)
    /* @@@ printf("Computer failure happers accuracy.\n"); */
    t_print("Computer failure hampers accuracy.\n");

  t_print("Phasers locked on target;\n");
  t_print("Energy available = "); t_prini(e); t_print(" units\n\n");

  t_print("Number of units to fire: ");

  t_gets(sTemp);

  t_print("\n");

  iEnergy = atoi(sTemp);

  if (iEnergy <= 0)
    return;

  if (e - iEnergy < 0)
    {
      t_print("Not enough energy available.\n\n");
      return;
    }

  e = e - iEnergy;

  if (d[8] < 0.0)
    /* @@@ iEnergy = iEnergy * rnd(); */
    iEnergy = (int)(iEnergy * rnd());

  h1 = iEnergy / k3;

  for (i = 1; i <= 3; i++)
    {
      if (k[i][3] > 0)
        {
          /* @@@ h = (h1 / function_d(0) * (rnd() + 2)); */
          h = (int)(h1 / function_d(i) * (rnd() + 2));
          if (h <= .15 * k[i][3])
            {
              t_print("Sensors show no damage to enemy at ");
              t_print_2in("", k[i][1], k[i][2]); t_char(1, '\n');
            }
          else
            {
              k[i][3] = k[i][3] - h;
              t_prini(h); t_print_2in(" unit hit on Klingon at\nsector ", k[i][1], k[i][2]);
              if (k[i][3] <= 0)
                {
                  t_print("*** Klingon Destroyed ***\n\n");
                  k3--;
                  k9--;
                  z1 = k[i][1];
                  z2 = k[i][2];
                  strcpy(sA, "   ");
                  insert_in_quadrant();
                  k[i][3] = 0;
                  g[q1][q2] = g[q1][q2] - 100;
                  z[q1][q2] = g[q1][q2];
                  if (k9 <= 0)
                    won_game();
                }
              else
                /* @@@ printf("\n"); */
                t_print("   (Sensors show "); t_prini(k[i][3]); t_print(" units remaining.)\n\n");
            }
        }
    }

  klingons_shoot();
}

void
photon_torpedoes(void)
{
  /* @@@ int c2, c3, x3, y3, x5; */
  int x3, y3, x5;
  string sTemp;
  double c1;

  if (p <= 0)
    {
      t_print("All photon torpedoes expended\n");
      return;
    }

  if (d[5] < 0.0)
    {
      t_print("Photon Tubes not operational\n");
      return;
    }

  t_print("Course (0-9): ");

  t_gets(sTemp);

  t_print("\n");

  c1 = atof(sTemp);

  if (c1 == 9.0)
    c1 = 1.0;

  /* @@@ if (c1 < 0 || c1 > 9.0) */
  if (c1 < 1.0 || c1 > 9.0)
    {
      t_print("Ensign Chekov roports:\n");
      t_print(" Incorrect course data, sir!\n\n");
      return;
    }

  e = e - 2;
  p--;

  /* @@@ c2 = cint(c1); */
  /* @@@ c3 = c2 + 1; */

  /* @@@ x1 = c[0][c2] + (c[0][c3] - c[0][c2]) * (c1 - c2); */
  /* @@@ x2 = c[1][c2] + (c[1][c3] - c[1][c2]) * (c1 - c2); */

  x1 = c[1][(int)c1] + (c[1][(int)c1 + 1] - c[1][(int)c1]) * (c1 - (int)c1);
  x2 = c[2][(int)c1] + (c[2][(int)c1 + 1] - c[2][(int)c1]) * (c1 - (int)c1);

  x = s1 + x1;
  y = s2 + x2;

  x3 = cint(x); /* @@@ note: this is a true integer round in the MS BASIC version */
  y3 = cint(y); /* @@@ note: this is a true integer round in the MS BASIC version */

  x5 = 0;

  t_print("Torpedo Track:\n");

  while (x3 >= 1 && x3 <= 8 && y3 >= 1 && y3 <= 8)
    {
      t_print_2in("    ", x3, y3);

      strcpy(sA, "   ");
      z1 = x3;
      z2 = y3;

      string_compare();

      if (z3 == 0)
        {
          torpedo_hit();
          klingons_shoot();
          return;
        }

      x = x + x1;
      y = y + x2;

      x3 = cint(x); /* @@@ note: this is a true integer round in the MS BASIC version */
      y3 = cint(y); /* @@@ note: this is a true integer round in the MS BASIC version */
    }

  t_print("Torpedo Missed\n\n");

  klingons_shoot();
}

void
torpedo_hit(void)
{
  int i, x3, y3;

  x3 = cint(x); /* @@@ note: this is a true integer round in the MS BASIC version */
  y3 = cint(y); /* @@@ note: this is a true integer round in the MS BASIC version */

  z3 = 0;

  strcpy(sA, " * ");
  string_compare();

  if (z3 == 1)
    {
      t_print("Star at "); t_x_y(x3, y3); t_print(" absorbed torpedo energy.\n\n");
      return;
    }

  strcpy(sA, "+K+");
  string_compare();

  if (z3 == 1)
    {
      t_print("*** Klingon Destroyed ***\n\n");
      k3--;
      k9--;

      if (k9 <= 0)
        won_game();

      for (i=0; i<=3; i++)
        if (x3 == k[i][1] && y3 == k[i][2])
          k[i][3] = 0;
    }

  strcpy(sA, ">!<");
  string_compare();

  if (z3 == 1)
    {
      t_print("*** Starbase Destroyed ***\n");
      b3--;
      b9--;

      if (b9 <= 0 && k9 <= t - t0 - t9)
        {
          t_print("That does it, Captain!!\n");
          t_print("You are hereby relieved of command\n");
          t_print("and sentanced to 99 stardates of hard\n");
          t_print("labor on Cygnus 12!!\n");
          resign_commision();
        }

      t_print("Starfleet Command reviewing your record\n");
      t_print("to consider court martial!\n\n");

      d0 = 0;    /* Undock */
    }

  z1 = x3;
  z2 = y3;
  strcpy(sA,"   ");
  insert_in_quadrant();

  g[q1][q2] = (k3 * 100) + (b3 * 10) + s3;
  z[q1][q2] = g[q1][q2];
}

void
damage_control(void)
{ 
  int a1;
  double d3 = 0.0;
  register i;

  if (d[6] < 0.0)
    {
      t_print("Damage Control report not available.\n");

      if (d0 == 0)
        return;

      d3 = 0.0;
      for (i = 1; i <= 8; i++)
        if (d[i] < 0.0)
          d3 = d3 + .1;

      if (d3 == 0.0)
        return;

      d3 = d3 + d4;
      if (d3 >= 1.0)
        d3 = 0.9;

      t_print("\nTechnicians standing by to effect\nrepairs to your ship;\n");
      /* @@@ printf("ship; Will you authorize the repair order (Y/N)? "); */
      t_print("Estimated time to repair: "); t_prinf(d3); t_print(" stardates.\n");
      t_print("Will you authorize the repair order (Y/N)? ");

      a1 = k_wait();

      if (a1 == 'Y' || a1 == 'y')
        {
          for (i = 1; i <= 8; i++)
            if (d[i] < 0.0)
              d[i] = 0.0;

          t = t + d3 + 0.1;
        }
    }

  t_print("Device            State of Repair\n");

  for (r1 = 1; r1 <= 8; r1++)
    {
      get_device_name();
      t_print(sG2);
      /* @@@ for (i = 1; i < 25 - strlen(sG2); i++) */
      for (i = 1; i < 25 - (int)strlen(sG2); i++)
      t_print(" ");
      /* @@@ printf("%4.1f\n", d[r1]); */
      t_prinf(d[r1]); t_char(1, '\n');
    }

  t_print("\n");
} 

void
shield_control(void)
{
  int i;
  string sTemp;

  if (d[7] < 0.0)
    {
      t_print("Shield Control inoperable\n");
      return;
    }

  t_print("Energy available = "); t_prini(e + s);

  t_print("\n\nInput number of units to shields: ");

  t_gets(sTemp);

  t_print("\n");

  i = atoi(sTemp);

  if (i < 0 || s == i)
    {
      t_print("<Shields Unchanged>\n\n");
      return;
    }

  if (i >= e + s)
    {
      t_print("Shield Control Reports:\n");
      t_print(" 'This is not the Federation Treasury.'\n");
      t_print("<Shields Unchanged>\n\n");
      return;
    }

  e = e + s - i;
  s = i;

  t_print("Deflector Control Room report:\n");
  t_print(" 'Shields now at "); t_prini(s); t_print(" units per your\n command.'\n\n");
}

void
library_computer(void)
{
  string sTemp;

  if (d[8] < 0.0)
    {
      t_print("Library Computer inoperable\n");
      return;
    }

  t_print("Computer active and awaiting command: ");

  t_gets(sTemp);
  t_print("\n");

  if (! strncmp(sTemp, "0", 1))
    galactic_record();
  else if (! strncmp(sTemp, "1", 1))
    status_report();
  else if (! strncmp(sTemp, "2", 1))
    torpedo_data();
  else if (! strncmp(sTemp, "3", 1))
    nav_data();
  else if (! strncmp(sTemp, "4", 1))
    dirdist_calc();
  else if (! strncmp(sTemp, "5", 1))
    galaxy_map();
  else
    {
      t_print("Functions available from Library-Computer:\n\n");
      t_print("   0 = Cumulative Galactic Record\n");
      t_print("   1 = Status Report\n");
      t_print("   2 = Photon Torpedo Data\n");
      t_print("   3 = Starbase Nav Data\n");
      t_print("   4 = Direction/Distance Calculator\n");
      t_print("   5 = Galaxy 'Region Name' Map\n\n");
    }
}

void
galactic_record(void)
{
  int i, j;

  t_print_2in("\nComputer Record of Galaxy for Quadrant ", q1, q2); t_char(1, '\n');
  t_print("   1   2   3   4   5   6   7   8\n");

  for (i = 1; i <= 8; i++)
  { 
    t_print("  --- --- --- --- --- --- --- ---\n");

    t_prini(i);

    for (j = 1; j <= 8; j++)
    {
      t_print(" ");

      if (z[i][j] == 0)
        t_print("***");
      else
        t_integer_3(z[i][j]);
    }

    t_print("\n");
  }

  t_print("  --- --- --- --- --- --- --- ---\n\n");
}

void
status_report(void)
{
  char sX[2] = "";

  t_print("   Status Report:\n\n");

  if (k9 > 1)
    strcpy(sX, "s");

  t_print("Klingon"); t_print(sX); t_print(" Left: "); t_prini(k9); t_char(1, '\n');

  t_print("Mission must be completed in "); t_prinf(.1 * (int)((t0 + t9 - t) * 10)); t_print("\nstardates\n");
    /* @@@ .1 * cint((t0 + t9 - t) * 10)); */

  if (b9 < 1)
  {
    t_print("Your stupidity has left you on your\nown in the galaxy -- you have no\nstarbases left!\n");
  }
  else
  {  
    strcpy(sX, "s");
    if (b9 < 2)
      strcpy(sX, "");

    t_print("The Federation is maintaining "); t_prini(b9); t_print("\nstarbase"); t_print(sX); t_print(" in the galaxy\n");
  }

  t_print("\n");
}

void
torpedo_data(void)
{
  int i;
  char sX[2] = "";

  if (k3 <= 0)
  {
    t_print("Science Officer Spock reports:\n");
    t_print(" 'Sensors show no enemy ships in this\n quadrant.'\n\n");
    return;
  }

  if (k3 > 1)
    strcpy(sX, "s");
 
  t_print("From Enterprise to Klingon battlecriuser"); t_print(sX); t_print("\n\n");

  for (i = 1; i <= 3; i++)
  {
    if (k[i][3] > 0)
    {
      w1 = k[i][1];
      x  = k[i][2];
      c1 = s1;
      a  = s2;

      compute_vector();
    }
  }
}

void
nav_data(void)
{
  if (b3 <= 0)
  {
    t_print("Mr. Spock reports,\n");
    t_print(" 'Sensors show no starbases in this\nquadrant.'\n\n");
    return;
  }

  w1 = b4;
  x  = b5;
  c1 = s1;
  a  = s2;

  compute_vector();
}

void
dirdist_calc(void)
{
  string sTemp;

  t_print("Direction/Distance Calculator\n\n");
  t_print("You are at quadrant "); t_x_y(q1, q2); t_print(" sector "); t_x_y((int)s1, (int)s2); t_print("\n\n");
    /* @@@ cint(s1), cint(s2)); */
    
  t_print("Please enter initial X coordinate: ");
  t_gets(sTemp);
  c1 = atoi(sTemp);

  t_print("Please enter initial Y coordinate: ");
  t_gets(sTemp);
  a = atoi(sTemp);

  t_print("Please enter final X coordinate: ");
  t_gets(sTemp);
  w1 = atoi(sTemp);

  t_print("Please enter final Y coordinate: ");
  t_gets(sTemp);
  x = atoi(sTemp);

  compute_vector();
}

void
galaxy_map(void)
{
  int i, j, j0;

  g5 = 1;

  t_print("\n              The Galaxy\n\n");
  t_print("   1   2   3   4   5   6   7   8\n");

  for (i = 1; i <= 8; i++)
  {
    t_print("  --- --- --- --- --- --- --- ---\n");

    t_prini(i);

    z4 = i;
    z5 = 1;
    quadrant_name();

    j0 = (int)(8 - (strlen(sG2) / 2));

    for (j = 0; j < j0; j++)
      t_print(" ");

    t_print(sG2);

    for (j = 0; j < j0; j++)
      t_print(" ");

    if (! (strlen(sG2) % 2))
      t_print(" ");

    z5 = 5;
    quadrant_name();

    j0 = (int)(8 - (strlen(sG2) / 2));

    for (j = 0; j < j0; j++)
      t_print(" ");

    t_print(sG2); 
   
    t_print("\n");
  }

  t_print("  --- --- --- --- --- --- --- ---\n\n");

}

void
compute_vector(void)
{
  x = x - a;
  a = c1 - w1;

  if (x <= 0.0)
  {
    if (a > 0.0)
    {    
      c1 = 3.0;
      sub2();
      return;
    }
    else
    {
      c1 = 5.0;
      sub1();
      return;
    }
  }
  else if (a < 0.0)
  {
    c1 = 7.0;
    sub2();
    return;
  }
  else
  {
    c1 = 1.0;
    sub1();
    return;
  }
}

void
sub1(void)
{
  x = fabs(x);
  a = fabs(a);

  if (a <= x)
    t_print_1fn("  DIRECTION = ", c1 + (a / x));
  else
    t_print_1fn("  DIRECTION = ", c1 + (((a * 2) - x) / a));

  t_print_1fn("  DISTANCE = ", (x > a) ? x : a); t_char(1, '\n');
}

void
sub2(void)
{
  x = fabs(x);
  a = fabs(a);

  if (a >= x)
    t_print_1fn("  DIRECTION = ", c1 + (x / a));
  else
    /* @@@ printf("  DIRECTION = %4.2f\n\n", c1 + (((x * 2) - a) / x)); */
    t_print_1fn("  DIRECTION = ", c1 + (((x * 2) - a) / x));

  /* @@@ printf("  DISTANCE = %4.2f\n", (x > a) ? x : a); */
  t_print_1fn("  DISTANCE = ", (x > a) ? x : a); t_char(1, '\n');
}

void
ship_destroyed(void)
{
  t_print("The Enterprise has been destroyed.\n");
  t_print("The Federation will be conquered.\n\n");

  end_of_time();
}

void
end_of_time(void)
{
  t_print("It is stardate "); t_prini((int) t); t_print(".\n\n");

  resign_commision();
}

void
resign_commision(void)
{
  t_print("There were "); t_prini(k9); t_print(" Klingon Battlecruisers\nleft at the end of your mission.\n\n");

  end_of_game();
}

void
won_game(void)
{
  t_print("Congradulations, Captain!  The last\nKlingon Battle Cruiser menacing the\nFederation has been destoyed.\n\n");
 
  if (t - t0 > 0)
    t_print_1fn("Your efficiency rating is ", 1000 * pow(k7 / (t - t0), 2));

  end_of_game();
}

void
end_of_game(void)
{
  string sTemp;

  if (b9 > 0)
    {
      t_print("The Federation is in need of a new\nstarship commander for a similar\n");
      t_print("mission. If there is a volunteer, let\nhim step forward and enter 'aye': ");

      t_gets(sTemp);
      t_print("\n");

      if (! strncmp(sTemp, "aye", 3))
        new_game();
    }

  t_print("Game over\n");
  exit(0);
}

void
klingons_move(void)
{
  int i;

  for (i = 1; i <= 3; i++)
    {
      if (k[i][3] > 0)
        {
          strcpy(sA, "   ");
          z1 = k[i][1];
          z2 = k[i][2];
          insert_in_quadrant();

          find_empty_place();

          k[i][1] = z1;
          k[i][2] = z2;
          strcpy(sA, "+K+");
          insert_in_quadrant();
        }
    }

  klingons_shoot();
}

void
klingons_shoot(void)
{
  int h, i;

  if (k3 <= 0)
    return;

  if (d0 != 0)
    {
      t_print("Starbase shields protect the Enterprise\n\n");
      return;
    }

  for (i = 1; i <= 3; i++)
    {
      if (k[i][3] > 0)
        {
          h = (int) ((k[i][3] / function_d(i)) * (2 + rnd()));
          s = s - h;
          /* @@@ k[i][3] = k[i][3] / (3 + rnd()); */
          k[i][3] = (int)(k[i][3] / (3 + rnd()));

          t_prini(h); t_print(" unit hit on Enterprise from\nsector ");
          t_print_2in("", k[i][1], k[i][2]);
          t_print("\n");

              if (s <= 0)
                {
                  t_print("\n");
                  ship_destroyed();
                }

              t_print("    <Shields down to "); t_prini(s); t_print(" units>\n\n");

          if (h >= 20)
            {
              if (rnd() <= 0.6 || (h / s) > 0.2)
                {
                  r1 = function_r();
                  d[r1] = d[r1] - (h / s) - (0.5 * rnd());

                  get_device_name();

                  t_print("Damage Control reports\n   '"); t_print(sG2);
                  t_print("' damaged by hit\n\n");
                }
            }
        }
    }
} 

void
repair_damage(void)
{
  int i;
  double d6;              /* Repair Factor */

  d6 = w1;

  if (w1 >= 1.0)
    d6 = w1 / 10;

  for (i = 1; i <= 8; i++)
    {
      if (d[i] < 0.0)
        {
          d[i] = d[i] + d6;
          if (d[i] > -0.1 && d[i] < 0)
            d[i] = -0.1;
          else if (d[i] >= 0.0)
            {
              if (d1 != 1)
                d1 = 1;

              t_print("Damage Control report:\n   ");
              r1 = i;
              get_device_name();
              t_print(sG2); t_print(" repair completed\n\n");
            }
        }
    }

  if (rnd() <= 0.2)
    {
      r1 = function_r();

      if (rnd() < .6)
        {
          d[r1] = d[r1] - (rnd() * 5.0 + 1.0);
          t_print("Damage Control report:\n   ");
          get_device_name();
          t_print(sG2); t_print(" damaged\n\n");
        }
      else
        {
          d[r1] = d[r1] + (rnd() * 3.0 + 1.0);
          t_print("Damage Control report:\n   ");
          get_device_name();
          t_print(sG2); t_print(" state of repair improved\n\n");
        }
    }
}

/* Misc Functions and Subroutines */

void
find_empty_place(void)
{
  /* @@@ while (z3 == 0) this is a nasty one.*/
  do
    {
      r1 = function_r();
      r2 = function_r();

      strcpy(sA, "   ");

      z1 = r1;
      z2 = r2;

      string_compare();
    } while (z3 == 0);

  z3 = 0;
}

void
insert_in_quadrant(void)
{
  int i, j = 0;

  /* @@@ s8 = ((z2 - 1) * 3) + ((z1 - 1) * 24) + 1; */
  s8 = ((int)(z2 - 0.5) * 3) + ((int)(z1 - 0.5) * 24) + 1;

  for (i = s8 - 1; i <= s8 + 1; i++)
    sQ[i] = sA[j++];

  return;
}

void
get_device_name(void)
{
  static char * device_name[] = {
    "", "Warp Engines","Short Range Sensors","Long Range Sensors",
    "Phaser Control","Photon Tubes","Damage Control","Shield Control",
    "Library-Computer"};

  if (r1 < 0 || r1 > 8)
    r1 = 0;

  strcpy(sG2, device_name[r1]);

  return;
}

void
string_compare(void)
{
  int i;
  char sB[4];

  z1 = (int)(z1 + 0.5);
  z2 = (int)(z2 + 0.5);

  s8 = ((z2 - 1) * 3) + ((z1 - 1) * 24) + 1;

  mid_str(sB, sQ, s8, 3);

  i = strncmp(sB, sA, 3);

  if (i == 0)
    z3 = 1;
  else
    z3 = 0;

  return;
}

void
quadrant_name(void)
{
  static char * quad_name[] = {"","Antares","Rigel","Procyon","Vega",
    "Canopus","Altair","Sagittarius","Pollux","Sirius","Deneb","Capella",
    "Betelgeuse","Aldebaran","Regulus","Arcturus","Spica"};

  static char * sect_name[] = {""," I"," II"," III"," IV"};

  if (z4 < 1 || z4 > 8 || z5 < 1 || z5 > 8)
    strcpy(sG2, "Unknown");

  if (z5 <= 4)
    strcpy(sG2, quad_name[z4]);
  else
    strcpy(sG2, quad_name[z4+8]);

  if (g5 != 1)
    {
      if (z5 > 4)
      z5 = z5 - 4;
      strcat(sG2, sect_name[z5]);
    }

  return;
}

int
function_d(int i)
{
  int j;

  /* @@@ j = sqrt(pow((k[i][1] - s1), 2) + pow((k[i][2] - s2), 2)); */
  j = (int)sqrt(pow((k[i][1] - s1), 2) + pow((k[i][2] - s2), 2));

  return j;
}

int
function_r(void)
{
  return(get_rand(8));
}

void
mid_str(char *a, char *b, int x, int y)
{
  //t_print("x= ");
  //t_prini(x);
  --x;
  y += x;

  //t_print("mid ");
  //t_prini(x);
  //t_print(" to ");
  //t_prini(y);
  //t_print(" \n");

  /* @@@ while (x < y && x <= strlen(b)) */
  while (x < y && x <= (int)strlen(b)) {
    char c;
    c = *(b + x++);
    *a++ = c;
    //t_print("'");
    //t_princ(c);
    //t_print("' ");
  }

  *a = '\0';
}

/* Round off floating point numbers instead of truncating */

int
cint (double d)
{
  int i;

  i = (int) (d + 0.5);

  return(i);
}
/*
void
showfile(char *filename)
{
  line lBuffer;
  int iRow = 0;

  if (openfile(filename, "r") != 0)
    return;

  while (getline(lBuffer) != 0)
    {
      printf(lBuffer);
      
      if (iRow++ > MAXROW - 3)
        {
          getchar();
          iRow = 0;
        }
    }

  closefile();
}

int
openfile(char * sFilename, char * sMode)
{
  if (bFlag || (stream = fopen (sFilename, sMode)) == NULL)
    {
      fprintf (stderr, "\nError - Unable to open file: %s.\n\n", sFilename);
      return 1;
    }

  bFlag = TRUE;

  return 0;
}

void
closefile(void)
{
  if (! bFlag)
    fclose(stream);

  bFlag = FALSE;
}

int
getline(char *s)
{
  if (fgets(s, MAXCOL, stream) == NULL)
    return(0);
  else
    return(strlen(s));
}
*/

/* Seed the randomizer with the timer */
void
randomize(void)
{
  //time_t timer;

  //srand ((unsigned) time (&timer));
  srand ((unsigned) _cnt());
}

/* Returns an integer from 1 to iSpread */
int
get_rand(int iSpread)
{
  return((rand() % iSpread) + 1);
}

double
rnd(void)
{
  double d;

  d = rand() / (double) RAND_MAX;
  
  return(d);
}
