-- server.lua - Life program server
--
-- original by Dave Bollinger <DBollinger@compuserve.com> posted to lua-l
--

print("life server ...")

-- load common definitions ...
common = dofile('common.lux')

-- this is used by ALOHA ...
port_0_index = { }

function ARRAY2D(w,h)
  local t = {w=w,h=h,y=h,x=w}
  for y = 1, h do
    t[y] = {}
    for x = 1, w do
      t[y][x] = 0
    end
  end
  return t
end

_CELLS = {}

-- return row y (return nil if it has not been generated yet)
function _CELLS:get_row(y)
  local out = ""
  if self.ready and not self.drawn then
    local w = self.w
    for x = 1, w do
       out = out .. (((self[y][x]>0) and ALIVE) or DEAD)
    end
    return out .. "\n"
  else
    return nil
  end
end

-- give birth to a "shape" within the cell array
function _CELLS:spawn(shape,left,top)
  for y = 0, shape.h-1 do
    for x = 0, shape.w-1 do
      self[top+y][left+x] = shape[y*shape.w+x+1]
    end
  end
end

-- run the CA to generate one cell of the next generation on each call, 
-- and when the whole array has been generated, set the 'ready' flag
function _CELLS:evolve(next)
  local y  = self.y
  if y > 0 then
    local x = self.x
    local h = self.h
    local w = self.w
    if x > 0 then
      local xp1 = x%w+1
      local yp1 = y%h+1
      local xm1 = x-1 if xm1 == 0 then xm1 = w end
      local ym1 = y-1 if ym1 == 0 then ym1 = h end
      local sum = self[ym1][xm1] + self[ym1][x] + self[ym1][xp1] +
                  self[y][xm1] + self[y][xp1] +
                  self[yp1][xm1] + self[yp1][x] + self[yp1][xp1]
      next[y][x] = ((sum==2) and self[y][x]) or ((sum==3) and 1) or 0
      self.x = x-1
    else
      self.y = y-1
      if self.y == 0 then
        -- the next generation is ready to be drawn
        next.ready = true
      else
        self.x = w
      end
    end
  end
end

-- constructor
function CELLS(w,h)
  local c = ARRAY2D(w,h)
  local ready = false
  local drawn = false
  c.spawn = _CELLS.spawn
  c.evolve = _CELLS.evolve
  c.draw = _CELLS.draw
  c.get_row = _CELLS.get_row
  return c
end

--
-- shapes suitable for use with spawn() above
--
HEART = { 1,0,1,1,0,1,1,1,1; w=3,h=3 }
GLIDER = { 0,0,1,1,0,1,0,1,1; w=3,h=3 }
EXPLODE = { 0,1,0,1,1,1,1,0,1,0,1,0; w=3,h=4 }
FISH = { 0,1,1,1,1,1,0,0,0,1,0,0,0,0,1,1,0,0,1,0; w=5,h=4 }
BUTTERFLY = { 1,0,0,0,1,0,1,1,1,0,1,0,0,0,1,1,0,1,0,1,1,0,0,0,1; w=5,h=5 }
GLIDERGUN = {
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,
   0,0,0,0,0,0,0,1,0,1,1,0,0,0,0,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,
   1,1,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,
   1,1,0,0,0,0,0,1,0,1,1,0,0,0,0,0,1,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
   0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; 
   w=36,h=9
}

-- create two arrays
thisgen = CELLS(width,height)
nextgen = CELLS(width,height)

-- this service gets row y of this generation.
-- it returns nil if the row has not yet been generated, and when 
-- the last row has been retreived it sets the 'drawn' flag
function get_row(serial) 
   y = bs.deserializeN(serial, 1)
   row = thisgen:get_row(y);
   if row and y == height then
     thisgen.drawn = true
     collectgarbage();
   end
   return bs.serialize(row)
end

-- this service just quits the server ...
function quit()
  print("Client requested shutdown\n")
  os.exit()
end

-- this is the function this server executes in the background ...
function background()
  if not nextgen.ready then 
    -- evolve some cells of the next generation on each bg call
    local i
    for i = 1, cells_per_bg_call do
      thisgen:evolve(nextgen)
    end
  end
  if nextgen.ready and thisgen.drawn then
     thisgen,nextgen = nextgen,thisgen
     thisgen.x = thisgen.w
     thisgen.y = thisgen.h
     thisgen.drawn = false
     nextgen.ready = false
  end
end

-- the main routine
function LIFE()
  -- create some life
  -- about 1000 generations of fun, then a glider steady-state
  thisgen:spawn(GLIDER,5,4)
  thisgen:spawn(EXPLODE,25,10)
  thisgen:spawn(FISH,4,12)

  -- in an 80x30 universe it takes aboout 300 generations 
  -- before the glider gun shoots itself
  --thisgen:spawn(GLIDERGUN,2,2) 

  thisgen.ready = true
end

print("... loaded")

-- the LIFE routine sets up the universe - evolution 
-- is driven by the calls to the 'background' function

LIFE()

