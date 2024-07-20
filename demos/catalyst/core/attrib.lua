--
-- The main purpose of this script is to generate the ANSI codes to set
-- screen attributes (i.e. text effects and colors) using the Set Graphic 
-- Rendition (SGR) escape sequence. Note that which attributes are supported 
-- and exactly what they do depends on the terminal emulator in use, and not 
-- on this program. For instance, Catalina's VTxx emulators do not support 
-- italic, and they interpret bright as both bright and bold. The payload 
-- internal terminal emulator does not support setting any attributes at all.
--
-- For example:
--
--   attrib yellow                     -- yellow fg
--   attrib on blue                    -- blue bg
--   attrib underscore                 -- set underscore effect only
--   attrib blink blue                 -- set blink and blue fg
--   attrib red on green               -- red fg on green bg
--   attrib red green                  -- same as previous
--   attrib bright red on green        -- bright red fg on green bg
--   attrib bright blink underscore invert yellow on blue
--   attrib normal                     -- reset effects and fg and bg colors 
--   attrib default                    -- reset fg color only
--   attrib on default                 -- reset bg color only
--   attrib default on default         -- reset fg and bg colors
--
-- version 6.5 - initial release, to coincide with Catalina 6.5

require "io";
require "os";
require "string";
require "propeller";

attrib = {};

color = { 
  {"BLACK", 30, 40}, 
  {"RED", 31,41},
  {"GREEN", 32,42},
  {"YELLOW", 33,43},
  {"BLUE", 34, 44},
  {"MAGENTA", 35,45},
  {"CYAN", 36,46},
  {"WHITE", 37,47},
  {"DEFAULT",39, 49}
};

effect = {
  {"NORMAL", 0, 0},
  {"BOLD", 1, 21},
  {"BRIGHT", 1, 21},
  {"DIM", 2, 22},
  {"ITALIC", 3, 23},
  {"UNDERLINE", 4, 24},
  {"UNDERSCORE", 4, 24},
  {"BLINK", 5, 25},
  {"REVERSE", 7, 27},
  {"INVERSE", 7, 27},
  {"INVERT", 7, 27}
};

-- miscellaneous variables
diagnose = false; -- if true, print dianostic messages

-- print help information
function do_help()
  print('usage:  attrib [-d] [ [effect ...] [ color ] [ on ] [ color ]');
  print('where:');
  print('  <effect> is one of:');
  print('    normal, bright, bold, dim, underscore, blink, reverse');
  print('  <color>  is one of:');
  print('    black, red, green, yellow, blue, magenta, cyan, white, default');
  print('NOTE: the actual behaviour of attributes depends on the terminal emulator');
end

-- detect if x is an effect, return effect number if so, or nil
function is_effect(x)
  local i;
  for i = 1, #effect do
    if (effect[i][1] == x) then
       return i;
    end
  end
  return nil;
end

-- detect if x is a color, return color number if so, or nil
function is_color(x)
  local i;
  for i = 1, #color do
    if (color[i][1] == x) then
       return i;
    end
  end
  return nil;
end

-- decode the command line arguments
function decode_args()
  if (#arg < 1) then
    do_help();
    io.stdout:flush();
    propeller.msleep(100);
    os.exit();
  else
    local i;
    local e;
    local c;
    local fg = true;
    if (#arg >= 1) then
      for i = 1, #arg do
        x = string.upper(arg[i]);
        if (x == '-D') then
          print("Diagnostic mode - attributes will be decoded but not used");
          diagnose = true;
        elseif (x == 'ON') then
          fg = false;
        else
          if fg then
            e = is_effect(x);
            if e then
              if diagnose then
                 print("fg effect '" .. x .. "' recognized");
              end
              attrib[#attrib+1]=effect[e][2];
            else
              c = is_color(x);
              if c then
                if diagnose then
                   print("fg color '" .. x .. "' recognized");
                end
                attrib[#attrib+1]=color[c][2];
                fg = false; -- assume next color is background
              else
                print("Error - unknown fg effect or color '" .. x .. "'");
              end
            end
          else
            e = is_effect(x);
            if e then
              print("Error - effects have no effect on background");
            else
              c = is_color(x);
              if c then
                if diagnose then
                   print("bg color '" .. x .. "' recognized");
                end
                attrib[#attrib+1]=color[c][3];
              else
                print("Error - unknown bg effect or color '" .. x .. "'");
              end
            end
          end
        end
      end
    end
  end
end

-- main starts here

decode_args();

if diagnose then
  print(tostring(#attrib) .. " attributes")
  esc = 'ESC';
else
  esc = string.char(27);
end

if #attrib > 0 then
  io.write(esc .. '[');
  for i = 1, #attrib do
    if (i > 1) then
       io.write(';');
    end
    io.write(tostring(attrib[i]));
  end
  io.write('m');
  if diagnose then
    io.write('\n');
  end
  io.stdout:flush();
  propeller.msleep(100);
  os.exit();
end
