-- client.lua - Life program client
--
-- life.lua
-- original by Dave Bollinger <DBollinger@compuserve.com> posted to lua-l
-- modified to use ANSI terminal escape sequences
-- modified to use for instead of while

print("life client ...")

-- load common defintions ...
dofile 'common.lux'

local write = io.write

-- output universe to screen (if all the cells are ready)
-- accumulate output to reduce flicker
function draw_no_flicker()
  local out = "" 
  local row = ""
  for y = 1, height do
    repeat
      row = get_row(y)
      if propeller and not row then
        propeller.msleep(100)
      end
    until row
    out = out .. row
  end
  write(out)
end

-- output universe to screen (if all the cells are ready)
-- output a line at a time (cursor may flicker)
function draw()
  local row = ""
  for y = 1, height do
    repeat
      row = get_row(y)
      if propeller and not row then
        propeller.msleep(100)
      end
    until row
    write(row)
  end
end

-- the main routine
function LIFE(w,h)

  -- run until break
  local gen = 1
  write("\027[2J")	-- ANSI clear screen
  while true do
    write("\027[H")	-- ANSI home cursor
    if no_flicker then
      draw_no_flicker()
    else
      draw()
    end
    write("Life - generation ",gen,"\n")
    gen = gen + 1
    if gen > 2000 then break end
  end
end

print("... loaded")

LIFE(width,height)
