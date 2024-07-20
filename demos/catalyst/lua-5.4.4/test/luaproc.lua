--
-- original luaproc multithreaded "hello world"
-- (modified only to use luaproc as a synonym of threads):
--

-- load luaproc
luaproc = require "threads"

-- create an additional worker
luaproc.setnumworkers( 2 )

-- create a new lua process
luaproc.newproc( [[
  luaproc = threads
  -- create a communication channel
  luaproc.newchannel( "achannel" )
  -- create a sender lua process
  luaproc.newproc( [=[
    luaproc = threads
    -- send a message
    luaproc.send( "achannel", "hello world from luaproc" )
  ]=] )
  -- create a receiver lua process
  luaproc.newproc( [=[
    luaproc = threads
    -- receive and print a message
    print( luaproc.receive( "achannel" ))
  ]=] )
]] )
luaproc.wait()

