#include "ptoc.h"

/************************************************/
/*                                                */
/*   BGI Demo Program                             */
/*   Copyright (c) 1992 by Borland International  */
/*                                                */
/************************************************/



/*
  Borland Graphics Interface (BGI) demonstration
  program. This program shows how to use many features of
  the Graph unit.

  NOTE: to have this demo use the IBM8514 driver, specify a
  conditional define constant "Use8514" (using the {$DEFINE}
  directive or Options\Compiler\Conditional defines) and then
  re-compile.
*/

/*#include "Crt.h"*/
#include "dos.h"
#include "graph.h"



/* The five fonts available */
const array<0,4,asciiz> Fonts = 
{{"DefaultFont", "TriplexFont", "SmallFont", "SansSerifFont", "GothicFont"}};

/* The five predefined line styles supported */
const array<0,4,asciiz> LineStyles = 
{{"SolidLn", "DottedLn", "CenterLn", "DashedLn", "UserBitLn"}};

/* The twelve predefined fill styles supported */
const array<0,11,asciiz> FillStyles = 
{{"EmptyFill", "SolidFill", "LineFill", "LtSlashFill", "SlashFill",
 "BkSlashFill", "LtBkSlashFill", "HatchFill", "XHatchFill",
 "InterleaveFill", "WideDotFill", "CloseDotFill"}};

/* The two text directions available */
const array<0,1,asciiz> TextDirect = {{"HorizDir", "VertDir"}};

/* The Horizontal text justifications available */
const array<0,2,asciiz> HorizJust = {{"LeftText", "CenterText", "RightText"}};

/* The vertical text justifications available */
const array<0,2,asciiz> VertJust = {{"BottomText", "CenterText", "TopText"}};

integer GraphDriver;    /* The Graphics device driver */
integer GraphMode;      /* The Graphics mode value */
word MaxX, MaxY;        /* The maximum resolution of the screen */
integer ErrorCode;      /* Reports any graphics errors */
word MaxColor;          /* The maximum color value available */
pointer OldExitProc;      /* Saves exit procedure address */

/*$F+*/
void MyExitProc()
{
  ExitProc = OldExitProc;  /* Restore exit procedure address */
  CloseGraph();              /* Shut down the graphics system */
}    /* MyExitProc */
/*$F-*/

void Initialize()
/* Initialize graphics and report any errors that may occur */
{
  boolean InGraphicsMode;   /* Flags initialization of graphics mode */
  string PathToDriver;      /* Stores the DOS path to *.BGI & *.CHR */

  /* when using Crt and graphics, turn off Crt's memory-mapped writes */
  DirectVideo = false;
  OldExitProc = ExitProc;                 /* save previous exit proc */
  ExitProc = &MyExitProc;                 /* insert our exit proc in chain */
  PathToDriver = "";
  do {

#ifdef Use8514                            /* check for Use8514 $DEFINE */
    GraphDriver = ibm8514;
    GraphMode = ibm8514hi;
#else
    GraphDriver = detect;                 /* use autodetection */
#endif

    InitGraph(GraphDriver, GraphMode, PathToDriver);
    ErrorCode = GraphResult();             /* preserve error return */
    if (ErrorCode != grok)                /* error? */
    {
      output << "Graphics error: " << GraphErrorMsg(ErrorCode) << NL;
      if (ErrorCode == grfilenotfound)    /* Can't find driver file */
      {
        output << "Enter full path to BGI driver or type <Ctrl-Break> to quit:" << NL;
        input >> PathToDriver >> NL;
        output << NL;
      }
      else
        exit(1);                          /* Some other error: terminate */
    }
  } while (!(ErrorCode == grok));
  Randomize();                /* init random number generator */
  MaxColor = GetMaxColor();  /* Get the maximum allowable drawing color */
  MaxX = GetMaxX();          /* Get screen resolution values */
  MaxY = GetMaxY();
}    /* Initialize */

string Int2Str(longint L)
/* Converts an integer to a string for use with OutText, OutTextXY */
{
  string S;

  string Int2Str_result;
  str(L, S);
  Int2Str_result = S;
  return Int2Str_result;
}    /* Int2Str */

word RandColor()
/* Returns a Random non-zero color value that is within the legal
  color range for the selected device driver and graphics mode.
  MaxColor is set to GetMaxColor by Initialize */
{
  word RandColor_result;
  RandColor_result = Random(MaxColor)+1;
  return RandColor_result;
}    /* RandColor */

void DefaultColors()
/* Select the maximum color in the Palette for the drawing color */
{
  SetColor(MaxColor);
}    /* DefaultColors */

void DrawBorder()
/* Draw a border around the current view port */
{
  ViewPortType ViewPort;

  DefaultColors();
  SetLineStyle(SolidLn, 0, NormWidth);
  GetViewSettings(ViewPort);
    Rectangle(0, 0, ViewPort.x2-ViewPort.x1, ViewPort.y2-ViewPort.y1);
}    /* DrawBorder */

void FullPort()
/* Set the view port to the entire screen */
{
  SetViewPort(0, 0, MaxX, MaxY, ClipOn);
}    /* FullPort */

void MainWindow(string Header)
/* Make a default window and view port for demos */
{
  DefaultColors();                           /* Reset the colors */
  ClearDevice();                             /* Clear the screen */
  SetTextStyle(DefaultFont, HorizDir, 1);  /* Default text font */
  SetTextJustify(CenterText, TopText);     /* Left justify text */
  FullPort();                                /* Full screen view port */
  OutTextXY(MaxX / 2, 2, Header);          /* Draw the header */
  /* Draw main window */
  SetViewPort(0, TextHeight("M")+4, MaxX, MaxY-(TextHeight("M")+4), ClipOn);
  DrawBorder();                              /* Put a border around it */
  /* Move the edges in 1 pixel on all sides so border isn't in the view port */
  SetViewPort(1, TextHeight("M")+5, MaxX-1, MaxY-(TextHeight("M")+5), ClipOn);
}    /* MainWindow */

void StatusLine(string Msg)
/* Display a status line at the bottom of the screen */
{
  FullPort();
  DefaultColors();
  SetTextStyle(DefaultFont, HorizDir, 1);
  SetTextJustify(CenterText, TopText);
  SetLineStyle(SolidLn, 0, NormWidth);
  SetFillStyle(EmptyFill, 0);
  Bar(0, MaxY-(TextHeight("M")+4), MaxX, MaxY);      /* Erase old status line */
  Rectangle(0, MaxY-(TextHeight("M")+4), MaxX, MaxY);
  OutTextXY(MaxX / 2, MaxY-(TextHeight("M")+2), Msg);
  /* Go back to the main window */
  SetViewPort(1, TextHeight("M")+5, MaxX-1, MaxY-(TextHeight("M")+5), ClipOn);
}    /* StatusLine */

void WaitToGo()
/* Wait for the user to abort the program or continue */
{
  const char Esc = '\33';
  char Ch;

  StatusLine("Esc aborts or press a key...");
  do {; } while (!KeyPressed());
  Ch = ReadKey();
  if (Ch == '\0')  Ch = ReadKey();      /* trap function keys */
  if (Ch == Esc) 
    exit(0);                           /* terminate program */
  else
    ClearDevice();                      /* clear screen, go on with demo */
}    /* WaitToGo */

void GetDriverAndMode(string& DriveStr, string& ModeStr)
/* Return strings describing the current device driver and graphics mode
  for display of status report */
{
  DriveStr = GetDriverName();
  ModeStr = GetModeName(GetGraphMode());
}    /* GetDriverAndMode */

void ReportStatus();

const integer X = 10;

static word Y;


static void WriteOut(string S)
/* Write out a string and increment to next line */
{
  OutTextXY(X, Y, S);
  Y += TextHeight("M")+2;
}    /* WriteOut */

void ReportStatus()
/* Display the status of all query functions after InitGraph */
{
  ViewPortType ViewInfo;         /* Parameters for inquiry procedures */
  LineSettingsType LineInfo;
  FillSettingsType FillInfo;
  TextSettingsType TextInfo;
  PaletteType Palette;
  string DriverStr;              /* Driver and mode strings */
  string ModeStr;

      /* ReportStatus */
  GetDriverAndMode(DriverStr, ModeStr);   /* Get current settings */
  GetViewSettings(ViewInfo);
  GetLineSettings(LineInfo);
  GetFillSettings(FillInfo);
  GetTextSettings(TextInfo);
  GetPalette(Palette);

  Y = 4;
  MainWindow("Status report after InitGraph");
  SetTextJustify(LeftText, TopText);
  WriteOut(string("Graphics device    : ")+DriverStr);
  WriteOut(string("Graphics mode      : ")+ModeStr);
  WriteOut(string("Screen resolution  : (0, 0, ")+Int2Str(GetMaxX())+", "+Int2Str(GetMaxY())+')');
  {
    WriteOut(string("Current view port  : (")+Int2Str(ViewInfo.x1)+", "+Int2Str(ViewInfo.y1)+", "+Int2Str(ViewInfo.x2)+", "+Int2Str(ViewInfo.y2)+')');
    if (ClipOn) 
      WriteOut("Clipping           : ON");
    else
      WriteOut("Clipping           : OFF");
  }
  WriteOut(string("Current position   : (")+Int2Str(GetX())+", "+Int2Str(GetY())+')');
  WriteOut(string("Palette entries    : ")+Int2Str(Palette.size));
  WriteOut(string("GetMaxColor        : ")+Int2Str(GetMaxColor()));
  WriteOut(string("Current color      : ")+Int2Str(GetColor()));
  {
    WriteOut(string("Line style         : ")+LineStyles[LineInfo.linestyle]);
    WriteOut(string("Line thickness     : ")+Int2Str(LineInfo.thickness));
  }
  {
    WriteOut(string("Current fill style : ")+FillStyles[FillInfo.pattern]);
    WriteOut(string("Current fill color : ")+Int2Str(FillInfo.color));
  }
  {
    WriteOut(string("Current font       : ")+Fonts[TextInfo.font]);
    WriteOut(string("Text direction     : ")+TextDirect[TextInfo.direction]);
    WriteOut(string("Character size     : ")+Int2Str(TextInfo.charsize));
    WriteOut(string("Horizontal justify : ")+HorizJust[TextInfo.horiz]);
    WriteOut(string("Vertical justify   : ")+VertJust[TextInfo.vert]);
  }
  WaitToGo();
}    /* ReportStatus */

void FillEllipsePlay()
/* Random filled ellipse demonstration */
{
  const integer MaxFillStyles = 12; /* patterns 0..11 */
  word MaxRadius;
  integer FillColor;

  MainWindow("FillEllipse demonstration");
  StatusLine("Esc aborts or press a key");
  MaxRadius = MaxY / 10;
  SetLineStyle(SolidLn, 0, NormWidth);
  do {
    FillColor = RandColor();
    SetColor(FillColor);
    SetFillStyle(Random(MaxFillStyles), FillColor);
    FillEllipse(Random(MaxX), Random(MaxY),
                Random(MaxRadius), Random(MaxRadius));
  } while (!KeyPressed());
  WaitToGo();
}    /* FillEllipsePlay */

void SectorPlay()
/* Draw random sectors on the screen */
{
  const integer MaxFillStyles = 12; /* patterns 0..11 */
  word MaxRadius;
  integer FillColor;
  integer EndAngle;

  MainWindow("Sector demonstration");
  StatusLine("Esc aborts or press a key");
  MaxRadius = MaxY / 10;
  SetLineStyle(SolidLn, 0, NormWidth);
  do {
    FillColor = RandColor();
    SetColor(FillColor);
    SetFillStyle(Random(MaxFillStyles), FillColor);
    EndAngle = Random(360);
    Sector(Random(MaxX), Random(MaxY), Random(EndAngle), EndAngle,
           Random(MaxRadius), Random(MaxRadius));
  } while (!KeyPressed());
  WaitToGo();
}    /* SectorPlay */

void WriteModePlay()
/* Demonstrate the SetWriteMode procedure for XOR lines */
{
  const integer DelayValue = 50;  /* milliseconds to delay */
  ViewPortType ViewInfo;
  word Color;
  integer Left, Top;
  integer Right, Bottom;
  integer Step;            /* step for rectangle shrinking */

  MainWindow("SetWriteMode demonstration");
  StatusLine("Esc aborts or press a key");
  GetViewSettings(ViewInfo);
  Left = 0;
  Top = 0;
  {
    Right = ViewInfo.x2-ViewInfo.x1;
    Bottom = ViewInfo.y2-ViewInfo.y1;
  }
  Step = Bottom / 50;
  SetColor(GetMaxColor());
  Line(Left, Top, Right, Bottom);
  Line(Left, Bottom, Right, Top);
  SetWriteMode(XORPut);                    /* Set XOR write mode */
  do {
    Line(Left, Top, Right, Bottom);        /* Draw XOR lines */
    Line(Left, Bottom, Right, Top);
    Rectangle(Left, Top, Right, Bottom);   /* Draw XOR rectangle */
    Delay(DelayValue);                     /* Wait */
    Line(Left, Top, Right, Bottom);        /* Erase lines */
    Line(Left, Bottom, Right, Top);
    Rectangle(Left, Top, Right, Bottom);   /* Erase rectangle */
    if ((Left+Step < Right) && (Top+Step < Bottom)) 
      {
        Left += Step;                     /* Shrink rectangle */
        Top += Step;
        Right -= Step;
        Bottom -= Step;
      }
    else
      {
        Color = RandColor();                /* New color */
        SetColor(Color);
        Left = 0;                          /* Original large rectangle */
        Top = 0;
        {
          Right = ViewInfo.x2-ViewInfo.x1;
          Bottom = ViewInfo.y2-ViewInfo.y1;
        }
      }
  } while (!KeyPressed());
  SetWriteMode(CopyPut);                   /* back to overwrite mode */
  WaitToGo();
}    /* WriteModePlay */

void AspectRatioPlay()
/* Demonstrate  SetAspectRatio command */
{
  ViewPortType ViewInfo;
  integer CenterX;
  integer CenterY;
  word Radius;
  word Xasp, Yasp;
  integer i;
  word RadiusStep;

  MainWindow("SetAspectRatio demonstration");
  GetViewSettings(ViewInfo);
  {
    CenterX = (ViewInfo.x2-ViewInfo.x1) / 2;
    CenterY = (ViewInfo.y2-ViewInfo.y1) / 2;
    Radius = 3*((ViewInfo.y2-ViewInfo.y1) / 5);
  }
  RadiusStep = (Radius / 30);
  Circle(CenterX, CenterY, Radius);
  GetAspectRatio(Xasp, Yasp);
  for( i = 1; i <= 30; i ++)
  {
    SetAspectRatio(Xasp, Yasp+(i*GetMaxX()));    /* Increase Y aspect factor */
    Circle(CenterX, CenterY, Radius);
    Radius -= RadiusStep;                      /* Shrink radius */
  }
  Radius += RadiusStep*30;
  for( i = 1; i <= 30; i ++)
  {
    SetAspectRatio(Xasp+(i*GetMaxX()), Yasp);    /* Increase X aspect factor */
    if (Radius > RadiusStep) 
      Radius -= RadiusStep;                    /* Shrink radius */
    Circle(CenterX, CenterY, Radius);
  }
  SetAspectRatio(Xasp, Yasp);                  /* back to original aspect */
  WaitToGo();
}    /* AspectRatioPlay */

void TextPlay()
/* Demonstrate text justifications and text sizing */
{
  word Size;
  word W, H, X, Y;
  ViewPortType ViewInfo;

  MainWindow("SetTextJustify / SetUserCharSize demo");
  GetViewSettings(ViewInfo);
  {
    SetTextStyle(TriplexFont, VertDir, 4);
    Y = (ViewInfo.y2-ViewInfo.y1) - 2;
    SetTextJustify(CenterText, BottomText);
    OutTextXY(2*TextWidth("M"), Y, "Vertical");
    SetTextStyle(TriplexFont, HorizDir, 4);
    SetTextJustify(LeftText, TopText);
    OutTextXY(2*TextWidth("M"), 2, "Horizontal");
    SetTextJustify(CenterText, CenterText);
    X = (ViewInfo.x2-ViewInfo.x1) / 2;
    Y = TextHeight("H");
    for( Size = 1; Size <= 4; Size ++)
    {
      SetTextStyle(TriplexFont, HorizDir, Size);
      H = TextHeight("M");
      W = TextWidth("M");
      Y += H;
      OutTextXY(X, Y, string("Size ")+Int2Str(Size));
    }
    Y += H / 2;
    SetTextJustify(CenterText, TopText);
    SetUserCharSize(5, 6, 3, 2);
    SetTextStyle(TriplexFont, HorizDir, UserCharSize);
    OutTextXY((ViewInfo.x2-ViewInfo.x1) / 2, Y, "User defined size!");
  }
  WaitToGo();
}    /* TextPlay */

void TextDump()
/* Dump the complete character sets to the screen */
{
  const array<0,4,word> CGASizes = {{1, 3, 7, 3, 3}};
  const array<0,4,word> NormSizes = {{1, 4, 7, 4, 4}};
  word Font;
  ViewPortType ViewInfo;
  char Ch;

  for( Font = 0; Font <= 4; Font ++)
  {
    MainWindow(string(Fonts[Font])+" character set");
    GetViewSettings(ViewInfo);
    {
      SetTextJustify(LeftText, TopText);
      MoveTo(2, 3);
      if (Font == DefaultFont) 
        {
          SetTextStyle(Font, HorizDir, 1);
          Ch = '\0';
          do {
            OutText(Ch);
            if ((GetX() + TextWidth("M")) > (ViewInfo.x2-ViewInfo.x1)) 
              MoveTo(2, GetY() + TextHeight("M")+3);
            Ch = succ(char,Ch);
          } while (!(Ch >= '\377'));
        }
      else
        {
          if (MaxY < 200) 
            SetTextStyle(Font, HorizDir, CGASizes[Font]);
          else
            SetTextStyle(Font, HorizDir, NormSizes[Font]);
          Ch = '!';
          do {
            OutText(Ch);
            if ((GetX() + TextWidth("M")) > (ViewInfo.x2-ViewInfo.x1)) 
              MoveTo(2, GetY() + TextHeight("M")+3);
            Ch = succ(char,Ch);
          } while (!(Ch >= '\377'));
        }
    }    /* with */
    WaitToGo();
  }    /* for loop */
}    /* TextDump */

void LineToPlay();

static word Xasp, Yasp;


static integer AdjAsp(integer Value)
/* Adjust a value for the aspect ratio of the device */
{
  integer AdjAsp_result;
  AdjAsp_result = ((longint)(Value) * longint(Xasp)) / longint(Yasp);
  return AdjAsp_result;
}    /* AdjAsp */

void LineToPlay()
/* Demonstrate MoveTo and LineTo commands */
{
  const integer MaxPoints = 15;
  array<0,MaxPoints,PointType> Points;
  ViewPortType ViewInfo;
  integer I, J;
  integer CenterX;        /* The center point of the circle */
  integer CenterY;
  word Radius;
  word StepAngle;
  real Radians;


  MainWindow("MoveTo, LineTo demonstration");
  GetAspectRatio(Xasp, Yasp);
  GetViewSettings(ViewInfo);
  {
    CenterX = (ViewInfo.x2-ViewInfo.x1) / 2;
    CenterY = (ViewInfo.y2-ViewInfo.y1) / 2;
    Radius = CenterY;
    while ((CenterY+AdjAsp(Radius)) < (ViewInfo.y2-ViewInfo.y1)-20) 
      Radius += 1;
  }
  StepAngle = 360 / MaxPoints;
  for( I = 0; I <= MaxPoints - 1; I ++)
  {
    Radians = (StepAngle * I) * pi / 180;
    Points[I].x = CenterX + round(cos(Radians) * Radius);
    Points[I].y = CenterY - AdjAsp(round(sin(Radians) * Radius));
  }
  Circle(CenterX, CenterY, Radius);
  for( I = 0; I <= MaxPoints - 1; I ++)
  {
    for( J = I; J <= MaxPoints - 1; J ++)
    {
      MoveTo(Points[I].x, Points[I].y);
      LineTo(Points[J].x, Points[J].y);
    }
  }
  WaitToGo();
}    /* LineToPlay */

void LineRelPlay();

/* Demonstrate MoveRel and LineRel commands */
const integer MaxPoints = 12;


static array<1,MaxPoints,PointType> Poly;      /* Stores a polygon for filling */

static ViewPortType CurrPort;

static void DrawTesseract()
/* Draw a Tesseract on the screen with relative move and
  line drawing commands, also create a polygon for filling */
{
  const FillPatternType CheckerBoard = {{0, 0x10, 0x28, 0x44, 0x28, 0x10, 0, 0}};
  integer X, Y, W, H;


  GetViewSettings(CurrPort);
  {
    W = (CurrPort.x2-CurrPort.x1) / 9;
    H = (CurrPort.y2-CurrPort.y1) / 8;
    X = ((CurrPort.x2-CurrPort.x1) / 2) - round(2.5 * W);
    Y = ((CurrPort.y2-CurrPort.y1) / 2) - (3 * H);

    /* Border around viewport is outer part of polygon */
    Poly[1].x = 0;     Poly[1].y = 0;
    Poly[2].x = CurrPort.x2-CurrPort.x1; Poly[2].y = 0;
    Poly[3].x = CurrPort.x2-CurrPort.x1; Poly[3].y = CurrPort.y2-CurrPort.y1;
    Poly[4].x = 0;     Poly[4].y = CurrPort.y2-CurrPort.y1;
    Poly[5].x = 0;     Poly[5].y = 0;
    MoveTo(X, Y);

    /* Grab the whole in the polygon as we draw */
    MoveRel(0, H);      Poly[6].x = GetX();  Poly[6].y = GetY();
    MoveRel(W, -H);     Poly[7].x = GetX();  Poly[7].y = GetY();
    MoveRel(4*W, 0);    Poly[8].x = GetX();  Poly[8].y = GetY();
    MoveRel(0, 5*H);    Poly[9].x = GetX();  Poly[9].y = GetY();
    MoveRel(-W, H);     Poly[10].x = GetX(); Poly[10].y = GetY();
    MoveRel(-4*W, 0);   Poly[11].x = GetX(); Poly[11].y = GetY();
    MoveRel(0, -5*H);   Poly[12].x = GetX(); Poly[12].y = GetY();

    /* Fill the polygon with a user defined fill pattern */
    SetFillPattern(CheckerBoard, MaxColor);
    FillPoly(12, Poly.body());

    MoveRel(W, -H);
    LineRel(0, 5*H);   LineRel(2*W, 0);    LineRel(0, -3*H);
    LineRel(W, -H);    LineRel(0, 5*H);    MoveRel(0, -5*H);
    LineRel(-2*W, 0);  LineRel(0, 3*H);    LineRel(-W, H);
    MoveRel(W, -H);    LineRel(W, 0);      MoveRel(0, -2*H);
    LineRel(-W, 0);

    /* Flood fill the center */
    FloodFill((CurrPort.x2-CurrPort.x1) / 2, (CurrPort.y2-CurrPort.y1) / 2, MaxColor);
  }
}    /* DrawTesseract */

void LineRelPlay()

{
  MainWindow("LineRel / MoveRel demonstration");
  GetViewSettings(CurrPort);
    /* Move the viewport out 1 pixel from each end */
    SetViewPort(CurrPort.x1-1, CurrPort.y1-1, CurrPort.x2+1, CurrPort.y2+1, ClipOn);
  DrawTesseract();
  WaitToGo();
}    /* LineRelPlay */

void PiePlay();

static word xasp1, yasp1;


static integer adjasp1(integer Value)
/* Adjust a value for the aspect ratio of the device */
{
  integer adjasp1_result;
  adjasp1_result = ((longint)(Value) * longint(xasp1)) / longint(yasp1);
  return adjasp1_result;
}    /* AdjAsp */



static void GetTextCoords(word AngleInDegrees, word Radius, integer& X, integer& Y)
/* Get the coordinates of text for pie slice labels */
{
  real Radians;

  Radians = AngleInDegrees * pi / 180;
  X = round(cos(Radians) * Radius);
  Y = round(sin(Radians) * Radius);
}    /* GetTextCoords */

void PiePlay()
/* Demonstrate  PieSlice and GetAspectRatio commands */
{
  ViewPortType ViewInfo;
  integer CenterX;
  integer CenterY;
  word Radius;
  integer X, Y;


  MainWindow("PieSlice / GetAspectRatio demonstration");
  GetAspectRatio(xasp1, yasp1);
  GetViewSettings(ViewInfo);
  {
    CenterX = (ViewInfo.x2-ViewInfo.x1) / 2;
    CenterY = ((ViewInfo.y2-ViewInfo.y1) / 2) + 20;
    Radius = (ViewInfo.y2-ViewInfo.y1) / 3;
    while (adjasp1(Radius) < round((ViewInfo.y2-ViewInfo.y1) / 3.6)) 
      Radius += 1;
  }
  SetTextStyle(TriplexFont, HorizDir, 4);
  SetTextJustify(CenterText, TopText);
  OutTextXY(CenterX, 0, "This is a pie chart!");

  SetTextStyle(TriplexFont, HorizDir, 3);

  SetFillStyle(SolidFill, RandColor());
  PieSlice(CenterX+10, CenterY-adjasp1(10), 0, 90, Radius);
  GetTextCoords(45, Radius, X, Y);
  SetTextJustify(LeftText, BottomText);
  OutTextXY(CenterX+10+X+TextWidth("H"), CenterY-adjasp1(10+Y), "25 %");

  SetFillStyle(HatchFill, RandColor());
  PieSlice(CenterX, CenterY, 225, 360, Radius);
  GetTextCoords(293, Radius, X, Y);
  SetTextJustify(LeftText, TopText);
  OutTextXY(CenterX+X+TextWidth("H"), CenterY-adjasp1(Y), "37.5 %");

  SetFillStyle(InterleaveFill, RandColor());
  PieSlice(CenterX-10, CenterY, 135, 225, Radius);
  GetTextCoords(180, Radius, X, Y);
  SetTextJustify(RightText, CenterText);
  OutTextXY(CenterX-10+X-TextWidth("H"), CenterY-adjasp1(Y), "25 %");

  SetFillStyle(WideDotFill, RandColor());
  PieSlice(CenterX, CenterY, 90, 135, Radius);
  GetTextCoords(112, Radius, X, Y);
  SetTextJustify(RightText, BottomText);
  OutTextXY(CenterX+X-TextWidth("H"), CenterY-adjasp1(Y), "12.5 %");

  WaitToGo();
}    /* PiePlay */

void Bar3DPlay()
/* Demonstrate Bar3D command */
{
  const integer NumBars = 7;  /* The number of bars drawn */
  const array<1,NumBars,byte> BarHeight = {{1, 3, 2, 5, 4, 2, 1}};
  const integer YTicks = 5;  /* The number of tick marks on the Y axis */
  ViewPortType ViewInfo;
  word H;
  real XStep;
  real YStep;
  integer I, J;
  word Depth;
  word Color;

  MainWindow("Bar3D / Rectangle demonstration");
  H = 3*TextHeight("M");
  GetViewSettings(ViewInfo);
  SetTextJustify(CenterText, TopText);
  SetTextStyle(TriplexFont, HorizDir, 4);
  OutTextXY(MaxX / 2, 6, "These are 3D bars !");
  SetTextStyle(DefaultFont, HorizDir, 1);
    SetViewPort(ViewInfo.x1+50, ViewInfo.y1+40, ViewInfo.x2-50, ViewInfo.y2-10, ClipOn);
  GetViewSettings(ViewInfo);
  {
    Line(H, H, H, (ViewInfo.y2-ViewInfo.y1)-H);
    Line(H, (ViewInfo.y2-ViewInfo.y1)-H, (ViewInfo.x2-ViewInfo.x1)-H, (ViewInfo.y2-ViewInfo.y1)-H);
    YStep = (real)(((ViewInfo.y2-ViewInfo.y1)-(2*H))) / YTicks;
    XStep = (real)(((ViewInfo.x2-ViewInfo.x1)-(2*H))) / NumBars;
    J = (ViewInfo.y2-ViewInfo.y1)-H;
    SetTextJustify(CenterText, CenterText);

    /* Draw the Y axis and ticks marks */
    for( I = 0; I <= YTicks; I ++)
    {
      Line(H / 2, J, H, J);
      OutTextXY(0, J, Int2Str(I));
      J = round(J-YStep);
    }


    Depth = trunc(0.25 * XStep);     /* Calculate depth of bar */

    /* Draw X axis, bars, and tick marks */
    SetTextJustify(CenterText, TopText);
    J = H;
    for( I = 1; I <= succ(integer,NumBars); I ++)
    {
      SetColor(MaxColor);
      Line(J, (ViewInfo.y2-ViewInfo.y1)-H, J, (ViewInfo.y2-ViewInfo.y1-3)-(H / 2));
      OutTextXY(J, (ViewInfo.y2-ViewInfo.y1)-(H / 2), Int2Str(I-1));
      if (I != succ(integer,NumBars)) 
      {
        Color = RandColor();
        SetFillStyle(I, Color);
        SetColor(Color);
        Bar3D(J, round((ViewInfo.y2-ViewInfo.y1-H)-(BarHeight[I] * YStep)),
                 round(J+XStep-Depth), round((ViewInfo.y2-ViewInfo.y1)-H-1), Depth, TopOn);
        J = round(J+XStep);
      }
    }

  }
  WaitToGo();
}    /* Bar3DPlay */

void BarPlay()
/* Demonstrate Bar command */
{
  const integer NumBars = 5;
  const array<1,NumBars,byte> BarHeight = {{1, 3, 5, 2, 4}};
  const array<1,NumBars,byte> Styles = {{1, 3, 10, 5, 9}};
  ViewPortType ViewInfo;
  word BarNum;
  word H;
  real XStep;
  real YStep;
  integer I, J;
  word Color;

  MainWindow("Bar / Rectangle demonstration");
  H = 3*TextHeight("M");
  GetViewSettings(ViewInfo);
  SetTextJustify(CenterText, TopText);
  SetTextStyle(TriplexFont, HorizDir, 4);
  OutTextXY(MaxX / 2, 6, "These are 2D bars !");
  SetTextStyle(DefaultFont, HorizDir, 1);
    SetViewPort(ViewInfo.x1+50, ViewInfo.y1+30, ViewInfo.x2-50, ViewInfo.y2-10, ClipOn);
  GetViewSettings(ViewInfo);
  {
    Line(H, H, H, (ViewInfo.y2-ViewInfo.y1)-H);
    Line(H, (ViewInfo.y2-ViewInfo.y1)-H, (ViewInfo.x2-ViewInfo.x1)-H, (ViewInfo.y2-ViewInfo.y1)-H);
    YStep = (real)(((ViewInfo.y2-ViewInfo.y1)-(2*H))) / NumBars;
    XStep = (real)(((ViewInfo.x2-ViewInfo.x1)-(2*H))) / NumBars;
    J = (ViewInfo.y2-ViewInfo.y1)-H;
    SetTextJustify(CenterText, CenterText);

    /* Draw Y axis with tick marks */
    for( I = 0; I <= NumBars; I ++)
    {
      Line(H / 2, J, H, J);
      OutTextXY(0, J, Int2Str(I));
      J = round(J-YStep);
    }

    /* Draw X axis, bars, and tick marks */
    J = H;
    SetTextJustify(CenterText, TopText);
    for( I = 1; I <= succ(integer,NumBars); I ++)
    {
      SetColor(MaxColor);
      Line(J, (ViewInfo.y2-ViewInfo.y1)-H, J, (ViewInfo.y2-ViewInfo.y1-3)-(H / 2));
      OutTextXY(J, (ViewInfo.y2-ViewInfo.y1)-(H / 2), Int2Str(I));
      if (I != succ(integer,NumBars)) 
      {
        Color = RandColor();
        SetFillStyle(Styles[I], Color);
        SetColor(Color);
        Bar(J, round((ViewInfo.y2-ViewInfo.y1-H)-(BarHeight[I] * YStep)), round(J+XStep), (ViewInfo.y2-ViewInfo.y1)-H-1);
        Rectangle(J, round((ViewInfo.y2-ViewInfo.y1-H)-(BarHeight[I] * YStep)), round(J+XStep), (ViewInfo.y2-ViewInfo.y1)-H-1);
      }
      J = round(J+XStep);
    }

  }
  WaitToGo();
}    /* BarPlay */

void CirclePlay()
/* Draw random circles on the screen */
{
  word MaxRadius;

  MainWindow("Circle demonstration");
  StatusLine("Esc aborts or press a key");
  MaxRadius = MaxY / 10;
  SetLineStyle(SolidLn, 0, NormWidth);
  do {
    SetColor(RandColor());
    Circle(Random(MaxX), Random(MaxY), Random(MaxRadius));
  } while (!KeyPressed());
  WaitToGo();
}    /* CirclePlay */


void RandBarPlay()
/* Draw random bars on the screen */
{
  integer MaxWidth;
  integer MaxHeight;
  ViewPortType ViewInfo;
  word Color;

  MainWindow("Random Bars");
  StatusLine("Esc aborts or press a key");
  GetViewSettings(ViewInfo);
  {
    MaxWidth = ViewInfo.x2-ViewInfo.x1;
    MaxHeight = ViewInfo.y2-ViewInfo.y1;
  }
  do {
    Color = RandColor();
    SetColor(Color);
    SetFillStyle(Random(CloseDotFill)+1, Color);
    Bar3D(Random(MaxWidth), Random(MaxHeight),
          Random(MaxWidth), Random(MaxHeight), 0, TopOff);
  } while (!KeyPressed());
  WaitToGo();
}    /* RandBarPlay */

void ArcPlay()
/* Draw random arcs on the screen */
{
  word MaxRadius;
  word EndAngle;
  ArcCoordsType ArcInfo;

  MainWindow("Arc / GetArcCoords demonstration");
  StatusLine("Esc aborts or press a key");
  MaxRadius = MaxY / 10;
  do {
    SetColor(RandColor());
    EndAngle = Random(360);
    SetLineStyle(SolidLn, 0, NormWidth);
    Arc(Random(MaxX), Random(MaxY), Random(EndAngle), EndAngle, Random(MaxRadius));
    GetArcCoords(ArcInfo);
    {
      Line(ArcInfo.x, ArcInfo.y, ArcInfo.xstart, ArcInfo.ystart);
      Line(ArcInfo.x, ArcInfo.y, ArcInfo.xend, ArcInfo.yend);
    }
  } while (!KeyPressed());
  WaitToGo();
}    /* ArcPlay */

void PutPixelPlay()
/* Demonstrate the PutPixel and GetPixel commands */
{
  const integer Seed = 1962; /* A seed for the random number generator */
  const integer NumPts = 2000; /* The number of pixels plotted */
  const char Esc = '\33';
  word I;
  word X, Y, Color;
  integer XMax, YMax;
  ViewPortType ViewInfo;

  MainWindow("PutPixel / GetPixel demonstration");
  StatusLine("Esc aborts or press a key...");

  GetViewSettings(ViewInfo);
  {
    XMax = (ViewInfo.x2-ViewInfo.x1-1);
    YMax = (ViewInfo.y2-ViewInfo.y1-1);
  }

  while (! KeyPressed()) 
  {
    /* Plot random pixels */
    RandSeed = Seed;
    I = 0;
    while ((! KeyPressed()) && (I < NumPts)) 
    {
      I += 1;
      PutPixel(Random(XMax)+1, Random(YMax)+1, RandColor());
    }

    /* Erase pixels */
    RandSeed = Seed;
    I = 0;
    while ((! KeyPressed()) && (I < NumPts)) 
    {
      I += 1;
      X = Random(XMax)+1;
      Y = Random(YMax)+1;
      Color = GetPixel(X, Y);
      if (Color == RandColor()) 
        PutPixel(X, Y, 0);
    }
  }
  WaitToGo();
}    /* PutPixelPlay */

void PutImagePlay();

const integer r = 20;

static ViewPortType CurPort;


static void MoveSaucer(integer& X, integer& Y, integer Width, integer Height)
{
  integer Step;

  Step = Random(2*r);
  if (odd(Step)) 
    Step = -Step;
  X = X + Step;
  Step = Random(r);
  if (odd(Step)) 
    Step = -Step;
  Y = Y + Step;

  /* Make saucer bounce off viewport walls */
  {
    if (CurPort.x1 + X + Width - 1 > CurPort.x2) 
      X = CurPort.x2-CurPort.x1 - Width + 1;
    else
      if (X < 0) 
        X = 0;
    if (CurPort.y1 + Y + Height - 1 > CurPort.y2) 
      Y = CurPort.y2-CurPort.y1 - Height + 1;
    else
      if (Y < 0) 
        Y = 0;
  }
}    /* MoveSaucer */

void PutImagePlay()
/* Demonstrate the GetImage and PutImage commands */

{
  const integer StartX = 100;
  const integer StartY = 50;

  word Pausetime;
  pointer Saucer;
  integer X, Y;
  word ulx, uly;
  word lrx, lry;
  word Size;
  word I;

  ClearDevice();
  FullPort();

  /* PaintScreen */
  ClearDevice();
  MainWindow("GetImage / PutImage Demonstration");
  StatusLine("Esc aborts or press a key...");
  GetViewSettings(CurPort);

  /* DrawSaucer */
  Ellipse(StartX, StartY, 0, 360, r, (r / 3)+2);
  Ellipse(StartX, StartY-4, 190, 357, r, r / 3);
  Line(StartX+7, StartY-6, StartX+10, StartY-12);
  Circle(StartX+10, StartY-12, 2);
  Line(StartX-7, StartY-6, StartX-10, StartY-12);
  Circle(StartX-10, StartY-12, 2);
  SetFillStyle(SolidFill, MaxColor);
  FloodFill(StartX+1, StartY+4, GetColor());

  /* ReadSaucerImage */
  ulx = StartX-(r+1);
  uly = StartY-14;
  lrx = StartX+(r+1);
  lry = StartY+(r / 3)+3;

  Size = ImageSize(ulx, uly, lrx, lry);
  GetMem(Saucer, Size);
  GetImage(ulx, uly, lrx, lry, Saucer);
  PutImage(ulx, uly, Saucer, XORPut);                /* erase image */

  /* Plot some "stars" */
  for( I = 1; I <= 1000; I ++)
    PutPixel(Random(MaxX), Random(MaxY), RandColor());
  X = MaxX / 2;
  Y = MaxY / 2;
  Pausetime = 70;

  /* Move the saucer around */
  do {
    PutImage(X, Y, Saucer, XORPut);                  /* draw image */
    Delay(Pausetime);
    PutImage(X, Y, Saucer, XORPut);                  /* erase image */
    MoveSaucer(X, Y, lrx - ulx + 1, lry - uly + 1);  /* width/height */
  } while (!KeyPressed());
  FreeMem(Saucer, Size);
  WaitToGo();
}    /* PutImagePlay */


/* Draw random polygons with random fill styles on the screen */
const integer MaxPts = 5;


typedef array<1,MaxPts,PointType> PolygonType;

void PolyPlay()
{
  PolygonType Poly;
  word I, Color;

  MainWindow("FillPoly demonstration");
  StatusLine("Esc aborts or press a key...");
  do {
    Color = RandColor();
    SetFillStyle(Random(11)+1, Color);
    SetColor(Color);
    for( I = 1; I <= MaxPts; I ++)
      {
        PointType& with = Poly[I]; 

        with.x = Random(MaxX);
        with.y = Random(MaxY);
      }
    FillPoly(MaxPts, Poly.body());
  } while (!KeyPressed());
  WaitToGo();
}    /* PolyPlay */

void FillStylePlay();

static word Style;

static word Width;

static word Height;

static ViewPortType ViewInfo;


static void DrawBox(word X, word Y)
{
  SetFillStyle(Style, MaxColor);
    Bar(X, Y, X+Width, Y+Height);
  Rectangle(X, Y, X+Width, Y+Height);
  OutTextXY(X+(Width / 2), Y+Height+4, Int2Str(Style));
  Style += 1;
}    /* DrawBox */

void FillStylePlay()
/* Display all of the predefined fill styles available */
{
  word X, Y;
  word I, J;


  MainWindow("Pre-defined fill styles");
  GetViewSettings(ViewInfo);
  {
    Width = 2 * ((ViewInfo.x2+1) / 13);
    Height = 2 * ((ViewInfo.y2-10) / 10);
  }
  X = Width / 2;
  Y = Height / 2;
  Style = 0;
  for( J = 1; J <= 3; J ++)
  {
    for( I = 1; I <= 4; I ++)
    {
      DrawBox(X, Y);
      X += (Width / 2) * 3;
    }
    X = Width / 2;
    Y += (Height / 2) * 3;
  }
  SetTextJustify(LeftText, TopText);
  WaitToGo();
}    /* FillStylePlay */

void FillPatternPlay();

const array<0,11,FillPatternType> Patterns = {{
{{0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55, 0xaa, 0x55}},
{{0x33, 0x33, 0xcc, 0xcc, 0x33, 0x33, 0xcc, 0xcc}},
{{0xf0, 0xf0, 0xf0, 0xf0, 0xf, 0xf, 0xf, 0xf}},
{{0, 0x10, 0x28, 0x44, 0x28, 0x10, 0, 0}},
{{0, 0x70, 0x20, 0x27, 0x25, 0x27, 0x4, 0x4}},
{{0, 0, 0, 0x18, 0x18, 0, 0, 0}},
{{0, 0, 0x3c, 0x3c, 0x3c, 0x3c, 0, 0}},
{{0, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0x7e, 0}},
{{0, 0, 0x22, 0x8, 0, 0x22, 0x1c, 0}},
{{0xff, 0x7e, 0x3c, 0x18, 0x18, 0x3c, 0x7e, 0xff}},
{{0, 0x10, 0x10, 0x7c, 0x10, 0x10, 0, 0}},
{{0, 0x42, 0x24, 0x18, 0x18, 0x24, 0x42, 0}}}};

static word style1;

static word width1;

static word height1;

static ViewPortType viewinfo1;


static void drawbox1(word X, word Y)
{
  SetFillPattern(Patterns[style1], MaxColor);
    Bar(X, Y, X+width1, Y+height1);
  Rectangle(X, Y, X+width1, Y+height1);
  style1 += 1;
}    /* DrawBox */

void FillPatternPlay()
/* Display some user defined fill patterns */
{
  word X, Y;
  word I, J;


  MainWindow("User defined fill styles");
  GetViewSettings(viewinfo1);
  {
    width1 = 2 * ((viewinfo1.x2+1) / 13);
    height1 = 2 * ((viewinfo1.y2-10) / 10);
  }
  X = width1 / 2;
  Y = height1 / 2;
  style1 = 0;
  for( J = 1; J <= 3; J ++)
  {
    for( I = 1; I <= 4; I ++)
    {
      drawbox1(X, Y);
      X += (width1 / 2) * 3;
    }
    X = width1 / 2;
    Y += (height1 / 2) * 3;
  }
  SetTextJustify(LeftText, TopText);
  WaitToGo();
}    /* FillPatternPlay */

void ColorPlay();

static word Color;

static word width2;

static word height2;

static ViewPortType viewinfo2;


static void drawbox2(word X, word Y)
{
  SetFillStyle(SolidFill, Color);
  SetColor(Color);
    Bar(X, Y, X+width2, Y+height2);
  Rectangle(X, Y, X+width2, Y+height2);
  Color = GetColor();
  if (Color == 0) 
  {
    SetColor(MaxColor);
    Rectangle(X, Y, X+width2, Y+height2);
  }
  OutTextXY(X+(width2 / 2), Y+height2+4, Int2Str(Color));
  Color = succ(word,Color) % (MaxColor + 1);
}    /* DrawBox */

void ColorPlay()
/* Display all of the colors available for the current driver and mode */
{
  word X, Y;
  word I, J;


  MainWindow("Color demonstration");
  Color = 1;
  GetViewSettings(viewinfo2);
  {
    width2 = 2 * ((viewinfo2.x2+1) / 16);
    height2 = 2 * ((viewinfo2.y2-10) / 10);
  }
  X = width2 / 2;
  Y = height2 / 2;
  for( J = 1; J <= 3; J ++)
  {
    for( I = 1; I <= 5; I ++)
    {
      drawbox2(X, Y);
      X += (width2 / 2) * 3;
    }
    X = width2 / 2;
    Y += (height2 / 2) * 3;
  }
  WaitToGo();
}    /* ColorPlay */

void PalettePlay()
/* Demonstrate the use of the SetPalette command */
{
  const integer XBars = 15;
  const integer YBars = 10;
  word I, J;
  word X, Y;
  word Color;
  ViewPortType ViewInfo;
  word Width;
  word Height;
  PaletteType OldPal;

  GetPalette(OldPal);
  MainWindow("Palette demonstration");
  StatusLine("Press any key...");
  GetViewSettings(ViewInfo);
  {
    Width = (ViewInfo.x2-ViewInfo.x1) / XBars;
    Height = (ViewInfo.y2-ViewInfo.y1) / YBars;
  }
  X = 0; Y = 0;
  Color = 0;
  for( J = 1; J <= YBars; J ++)
  {
    for( I = 1; I <= XBars; I ++)
    {
      SetFillStyle(SolidFill, Color);
      Bar(X, Y, X+Width, Y+Height);
      X += Width+1;
      Color += 1;
      Color = Color % (MaxColor+1);
    }
    X = 0;
    Y += Height+1;
  }
  do {
    SetPalette(Random(GetMaxColor() + 1), Random(65));
  } while (!KeyPressed());
  SetAllPalette(OldPal);
  WaitToGo();
}    /* PalettePlay */

void CrtModePlay()
/* Demonstrate the use of RestoreCrtMode and SetGraphMode */
{
  ViewPortType ViewInfo;
  char Ch;

  MainWindow("SetGraphMode / RestoreCrtMode demo");
  GetViewSettings(ViewInfo);
  SetTextJustify(CenterText, CenterText);
  {
    OutTextXY((ViewInfo.x2-ViewInfo.x1) / 2, (ViewInfo.y2-ViewInfo.y1) / 2, "Now you are in graphics mode");
    StatusLine("Press any key for text mode...");
    do {; } while (!KeyPressed());
    Ch = ReadKey();
    if (Ch == '\0')  Ch = ReadKey();    /* trap function keys */
    RestoreCrtMode();
    output << "Now you are in text mode." << NL;
    output << "Press any key to go back to graphics...";
    do {; } while (!KeyPressed());
    Ch = ReadKey();
    if (Ch == '\0')  Ch = ReadKey();    /* trap function keys */
    SetGraphMode(GetGraphMode());
    MainWindow("SetGraphMode / RestoreCrtMode demo");
    SetTextJustify(CenterText, CenterText);
    OutTextXY((ViewInfo.x2-ViewInfo.x1) / 2, (ViewInfo.y2-ViewInfo.y1) / 2, "Back in graphics mode...");
  }
  WaitToGo();
}    /* CrtModePlay */

void LineStylePlay()
/* Demonstrate the predefined line styles available */
{
  word Style;
  word Step;
  word X, Y;
  ViewPortType ViewInfo;


  ClearDevice();
  DefaultColors();
  MainWindow("Pre-defined line styles");
  GetViewSettings(ViewInfo);
  {
    X = 35;
    Y = 10;
    Step = (ViewInfo.x2-ViewInfo.x1) / 11;
    SetTextJustify(LeftText, TopText);
    OutTextXY(X, Y, "NormWidth");
    SetTextJustify(CenterText, TopText);
    for( Style = 0; Style <= 3; Style ++)
    {
      SetLineStyle(Style, 0, NormWidth);
      Line(X, Y+20, X, ViewInfo.y2-40);
      OutTextXY(X, ViewInfo.y2-30, Int2Str(Style));
      X += Step;
    }
    X += 2*Step;
    SetTextJustify(LeftText, TopText);
    OutTextXY(X, Y, "ThickWidth");
    SetTextJustify(CenterText, TopText);
    for( Style = 0; Style <= 3; Style ++)
    {
      SetLineStyle(Style, 0, ThickWidth);
      Line(X, Y+20, X, ViewInfo.y2-40);
      OutTextXY(X, ViewInfo.y2-30, Int2Str(Style));
      X += Step;
    }
  }
  SetTextJustify(LeftText, TopText);
  WaitToGo();
}    /* LineStylePlay */

void UserLineStylePlay()
/* Demonstrate user defined line styles */
{
  word Style;
  word X, Y, I;
  ViewPortType ViewInfo;

  MainWindow("User defined line styles");
  GetViewSettings(ViewInfo);
  {
    X = 4;
    Y = 10;
    Style = 0;
    I = 0;
    while (X < ViewInfo.x2-4) 
    {
      /*$B+*/
      Style = Style | (1 << (I % 16));
      /*$B-*/
      SetLineStyle(UserBitLn, Style, NormWidth);
      Line(X, Y, X, (ViewInfo.y2-ViewInfo.y1)-Y);
      X += 5;
      I += 1;
      if (Style == 65535) 
      {
        I = 0;
        Style = 0;
      }
    }
  }
  WaitToGo();
}    /* UserLineStylePlay */


void SayGoodbye()
/* Say goodbye and then exit the program */
{
  ViewPortType ViewInfo;

  MainWindow("");
  GetViewSettings(ViewInfo);
  SetTextStyle(TriplexFont, HorizDir, 4);
  SetTextJustify(CenterText, CenterText);
    OutTextXY((ViewInfo.x2-ViewInfo.x1) / 2, (ViewInfo.y2-ViewInfo.y1) / 2, "That's all folks!");
  StatusLine("Press any key to quit...");
  do {; } while (!KeyPressed());
}    /* SayGoodbye */

int main(int argc, const char* argv[])
{     /* program body */
  pio_initialize(argc, argv);
  Initialize();
  ReportStatus();

  AspectRatioPlay();
  FillEllipsePlay();
  SectorPlay();
  WriteModePlay();

  ColorPlay();
  /* PalettePlay only intended to work on these drivers: */
  if ((GraphDriver == ega) ||
     (GraphDriver == ega64) ||
     (GraphDriver == vga)) 
    PalettePlay();
  PutPixelPlay();
  PutImagePlay();
  RandBarPlay();
  BarPlay();
  Bar3DPlay();
  ArcPlay();
  CirclePlay();
  PiePlay();
  LineToPlay();
  LineRelPlay();
  LineStylePlay();
  UserLineStylePlay();
  TextDump();
  TextPlay();
  CrtModePlay();
  FillStylePlay();
  FillPatternPlay();
  PolyPlay();
  SayGoodbye();
  CloseGraph();
  return EXIT_SUCCESS;
}
