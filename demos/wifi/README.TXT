Please read this document in full before using the Parallax WiFi module with 
Catalina. It is highly likely that at least some configuration of both the 
WiFi module and the Catalina platform support files will be required. For
some of the programs to work correctly, the WiFi module firmware may also 
need to be updated.

Catalina supports the Parallax WiFi module using the HTTP, TCP and WebSockets
protocols.

This folder contains some WiFi test and demo programs. They are individually 
quite simple, but include different variants of essentially the same program 
to demonstrate the many ways the Propeller WiFi module can be used:

   testwifi.c       - test basic WiFi module functionality
   testhttp.c       - test a simple interactive HTTP (web) page

   tcp_client.c     - TCP connection (Propeller client) *
   tcp_server.c     - TCP connection (Propeller server) *
   pc_tcp_client.c  - TCP connection (PC client) *
   pc_tcp_server.c  - TCP connection (PC server) *

   ws_client.c      - indirect WebSocket connection (Propeller client) **
   ws_server.c      - indirect WebSocket connection (Propeller server) **
   pc_ws_client.c   - indirect WebSocket connection (PC client) **
   http_client.c    - indirect HTTP connection (Propeller client) **
   http_server.c    - indirect HTTP connection (Propeller server) **

   http_ap_client.c - direct HTTP connection (Propeller client) ***
   http_sp_server.c - direct HTTP connection (Propeller server) ***
   ws_ap_client.c   - direct WebSocket connection (Propeller client) ***
   ws_ap_server.c   - direct WebSocket connection (Propeller server) ***

   lua.c            - Lua built with WiFi support enabled ****
   luax.c           - Lua Execution engine with WiFi support enabled ****
   testhttp.lua     - a Lua demo program similar to testhttp.c ****

   gauge.lua        - A Lua demo of a custom widget *****
   gauge.htm        - the HTML code for the above demo *****

* These programs require the client to be running on a PC, and the server to
be running on a propeller (or vice_versa). TCP cannot be used to communicate 
between a client and a server both running on a propeller even when both have 
WiFi adaptors because the propeller WiFi module firmware only ever listens on 
port 80 (for HTTP and WebSockets requests). To communicate directly between 
two propellers, use HTTP or WebSockets instead. See the section below on 
"Propeller to Propeller Communications".

** These programs test two propellers communicating with each other using
HTTP or WebSockets indirectly - e.g. where both propeller modules JOIN an 
existing Access Point (e.g. an Access Point provided by a WiFi router).

*** These programs test two propellers communicating with each other using
HTTP or WebSockets directly - i.e. one WiFi module joins the Access Point
provided by the other WiFi module instead of both modules JOINing an existing 
WiFi Access Point. These programs also require a firmware update to both WiFi
modules. See the sections on "Propeller to Propeller Communications" and 
"WiFi Firmware Fixes" below.

**** Refer to the section below "Lua and WiFi" for details on Lua support for 
the WiFi module and the Lua demo program, which must be executed with a
version of Lua called wlua (also included) which loads the necessary serial 
comms and wifi support modules.

***** This demo requires the jQuery files be loaded into the WiFi adaptor.
See the README.TXT document in the jquery folder.

See the source code for more details on each of the programs, and how to 
configure and use them.

A note about ALL the demo programs - JOINing a WiFi network(SSID/Access Point)
can take time - typically 5 to 20 seconds. If the demo is a server program, 
always start the server first, and wait for it to indicate it has JOINed 
before starting the correspondong client or attempting to access the server 
via a browser etc. In most cases, the program will indicate what to do 
(e.g. "Open a browser to "xxx.xxx.xxx.xxx/prop").

Note that all the programs (except for wlua and wluax) in this folder are 
built with the -C NO_HMI Catalina option, and instead use a serial plugin 
to communicate with both the WiFi module and the user. This means that the 
usual C stdio functions (printf() etc) are not available - instead, use 
the serial comms library functions (s_str() etc). However, the WiFi 
library does include two stdio-like functions useful for building and 
decoding strings used to communicate with the adaptor from C programs:

   isprintf() : an integer version of the stdio sprintf() function.
   isscanf()  : an integer version of the stdio sscanf() function.

Before building the programs, there are some things that will need to be
configured:

1. Edit the file "config.h" to set at least the SSID and PASSPHRASE as
   appropriate for the WiFi network. It is also possible to configure which 
   serial port to use for user interaction (USER_PORT), and whether DEBUG 
   messages should be printed. 

2. For a P2 EDGE with the WiFi adaptor installed on pin group 16 (i.e. on 
   pins 16 .. 23) there is a P2_WIFI platform configuration file provided 
   ("target/p2/P2_WIFI.inc"). Use it by defining the Catalina symbol P2_WIFI. 
   For example, add -C P2_WIFI to your Catalina commands, or use the build 
   script as follows:

      build_all P2_WIFI

   Otherwise set up the serial port configuration in the appropriate 
   platform file before running the programs. This is described in detail 
   later in this document. If a pin group OTHER than 56 (i.e pins 56 .. 63) 
   is used then port 0 will be used to communicate with the WiFi module,
   and port 1 can be used for user interaction and debug messages. If pins
   pins 56 .. 63 are used instead then port 1 will be unavailable and port 0 
   must be used for both WiFi communications and user interaction. Edit 
   "config.h" and set USER_PORT to 0.

3. Edit tcp_client.c and pc_tcp_client.c to modify the value of the following:

      SERVER_IP       : IP address of server. Note that this is NOT the same 
                        value in both - in tcp_client.c it must be the WiFi
                        IP address of the PC, and in pc_tcp_client it must 
                        be the WiFi IP address of the propeller.

4. The following constant (used in tcp_client.c and pc_tcp_client.c) can also 
   be modified if the default well-known port is unusable in a particular 
   network:

      WELL_KNOWN_PORT : port used to establish TCP connections. The default 
                        is 666. This can be modified provided to any port 
                        not otherwise used which is permitted access through 
                        the firewall. It should not be port 80, since this 
                        port is always used by the WiFi module.

5. The Propeller WiFi module may need to be configured. See the section below
   "Setting up the WiFi module" for details.

There is a build_all script that can be used to build all the programs.
Specify the platform, memory model and other build options as parameters. 
For example:

   build all C3 LARGE FLASH CACHED_1K TTY
or
   build_all P2_WIFI
or
   build_all P2_EDGE LARGE CACHED_64K OPTIMIZE

Apart from wlua (and wluax), any HMI options will be ignored, because the 
other programs in this folder do not use the normal HMI or C stdio functions 
for user interaction, and are compiled with -C NO_HMI to reduce both the code
size and the number of cogs used. Instead of the usual HMI, they use serial 
port 0 for WiFi communications and serial port 1 for user I/O. But it is 
easier to debug Lua programs if Lua uses the standard HMI functions, so the
HMI is used in the case of wua and wluax. If extra cogs or code space is 
required, wlua and wluax can be compiled with the NO_HMI option AFTER the 
Lua program has been debugged.

Note that this introduces complexity into the platform configuration on the
Propeller 1 when a serial HMI option is used (e.g. TTY). For all programs 
OTHER than wlua and wluax, the Extras.spin file should be configured with 
port 0 to communicate with the WiFi module, and port 1 to connect to the 
normal serial I/O pins (i.e. pins 30 & 31). But for wlua and wluax, port 0 
should be configured to communicate with the WiFi module, but port 1 should 
not be configured or used, since wlua and wluax will expect to use these pins
via the serial HMI.

The default is to build all programs in COMPACT mode on a Propeller 1, or
NATIVE mode on a Propeller 2, except for the wlua and wluax programs, which
will be built in LARGE mode on a Propeller 1 and COMPACT mode on a Propeller
2. If a memory model is specified on the command line it is used for all
programs. If the programs are built to use XMM RAM, then the build_utilities 
script can be run to build the necessary utilities to load the programs.

The build_all script will build all the propeller binaries, which should
succeed - and it will also try to use gcc to build the PC binaries (i.e. 
pc_tcp_client, pc_tcp_server and pc_ws_server) - but this may fail under 
Windows even if a version of gcc is installed because these programs require 
sockets support, which is provided by Linux or by the Cygwin version of gcc, 
but not by the MinGW/MSYS2 version of gcc. If the build_all script fails to 
build these programs, they will need to be built separately (e.g. using 
Cygwin).

Once built, load the programs using payload in interactive mode to see the 
program output. For example (if the Propeller is connected to comm port X):

   payload -pX testhttp.bin -i
or
   payload -pX testhttp.bin -Ivt100

If the program consists of a client and a server, load them in two separate
command windows. For example, assuming one Propeller is connected to comm port
X and the other to comm port Y, then in one window, enter:

   payload -pX ws_server.c -i

And, once that program indicates it has joined the network, in the other 
window enter:

   payload -pY ws_client.c -i

Note that some of the PC programs may require Administrator (Windows) or root
(Linux) privileges to execute successfully, and some programs and/or ports may
need to be granted internet access through the firewall. How this is done
will vary depending on on your version of Windows or Linux and installed 
security software - see the appropriate documentation.

WiFi On the Propeller 1:
========================

On the Propeller 1, WiFi programs must use the "extended" version of the
4 port serial plugin, which is enabled by linking with libserial4x (i.e. 
using the -lserial4x command line option). The Makefile provided is set
up to do this automatically.

On the Propeller 1, you have to provide suitable pin functions - i.e.
wifi_DI_PIN(), wifi_DO_PIN(), wifi_BRK_PIN(), wifi_RES_PIN() and 
wifi_PGM_PIN() - see the examples in each program. You may also need
to configure at least the first serial port of the serial4x plugin 
appropriately (use two ports if available, except for wlua and wlaux).
See 'Extras.spin' in the 'target/p1' directory.

For example, to use the WiFi module on pins 14&15 and see user messages 
on pins 30&31, both at 115200 baud, which would be appropriate for all 
the programs other than wlua and wluax - see below), in the section on
configuring libserial4x that file might contain lines like:

   S4.AddPort(0,15,14,-1,-1,0,0,115200);
   S4.AddPort(1,31,30,-1,-1,0,0,115200);

To use a serial HMI option with wlua and wluax, do not configure port 1,
so the file should instead look like:

   S4.AddPort(0,15,14,-1,-1,0,0,115200);

If a second serial port is available, set USER_PORT in "config.h" to 1.
Otherwise set USER_PORT to 0 and WiFi information and debug messages will
appear interspersed with WiFi interactions.

WiFi  on the Propeller 2:
=========================

On the Propeller 2, WiFi programs can use either the 2 port or 8 port 
serial plugin. By default, the 2 port plugin is used. Modify the Makefile
to use the 8 port serial plugin.

On the Propeller 2, the platform configuration file must be configured 
appropriately. In particular, the wifi library expects the WiFi module
to be on the first serial port (port 0). If you want to be able to use
the WiFi module to load software into the Propeller 2, then this port
must use pins 62 & 63 (ie. pin group 56 .. 63).

Also, note that the P2-EC32MB does not connect pins 58, 59, 60 or 61, which 
means you should specify -1 to disable the use of those pins if you install 
the module on pin group 56 .. 63. This also means you will usually need to 
power-cycle the WiFi module to reset it before executing any program that 
uses the WiFi module, and it also means that programs that USE the wifi
module cannot currently be loaded this way (use payload or Catalyst instead).

If you do NOT need to load software via the WiFi module, it is instead
recommended to install the WiFi module on a pin group other than 56 .. 63 
(e.g. pin group 16 .. 23), to allow access to the WiFi module RES and PGM 
pins. This allows the WiFi software to reset the WiFi module as required.

If a second serial port is available, set USER_PORT in "config.h" to 1.
Otherwise set USER_PORT to 0 and user messages will appear interspersed
with WiFi interactions. 

A platform configuration file is provided which is suitable for use with a 
P2_EDGE with the WiFi adaptor installed on pin group 16 (i.e. pins 16 .. 23).
It is called "target/p2/P2WIFI.inc" and is used if the Catalina symbol P2_WIFI
is defined. For example:

   build_all P2_WIFI
or
   catalina -p2 testhttp.c -lci -lwifi -lserial2 -C NO_HMI -C P2_WIFI

The P2_WIFI configuration makes the second port available (using pins 62 & 63) 
if NO_HMI is specified - otherwise, the second serial port is disabled, so 
that pins 62 & 63 can be used as normal for a serial HMI.

Using One Port (not recommended)
--------------------------------

An example of platform configuration details for using one port on pins
62 & 63) as port 0 are as shown below.

Note that by default, the constants defined for the 2 port serial plugin
are also used for the first 2 ports of the 8 port serial plugin, so you 
don't need to specify anything more to also use the 8 port serial plugin.

Note that when using only one port, the USER_PORT setting in "config.h"
(and also in "wifi.c" if you are using the local wifi functions rather than
the wifi library) should be set to 0 to make the user messages also appear 
on that port. They will appear interspersed with Wifi interactions, and 
since WiFi commands are only terminated by a CR and not an LF, some terminal
emulators may need to ignore CRs, or translate CRs to LFs to see all the 
output. For example, if using the payload internal interactive terminal 
emulator, add -q1 to ignore CRs. If using the Comms external terminal 
emulator, select either the "Do not Process CRs" or "Auto LF on CR" option.

   ' WiFi constants
   ' ==============

   #if !defined(_WIFI_BASE_PIN)
   _WIFI_BASE_PIN = 56   ' base pin of P2 WX adaptor board (64007)
   #endif

   _WIFI_DO  = _WIFI_BASE_PIN + 7   ' must match pin used for serial comms
   _WIFI_DI  = _WIFI_BASE_PIN + 6   ' must match pin used for serial comms
   _WIFI_RES = -1 ' _WIFI_BASE_PIN + 0   ' -1 disables module RESET function
   _WIFI_PGM = -1 ' _WIFI_BASE_PIN + 1   ' -1 disables module PGM function
   _WIFI_BRK = _WIFI_DI             ' -1 disables module BREAK function

   #if !defined(_WIFI_BAUDRATE)
   _WIFI_BAUDRATE = 230400   ' must match baud rate configured in WiFi board
   #endif

   ' 2 Port Serial constants
   ' =======================

   _RX1_PIN   = _WIFI_DO
   _TX1_PIN   = _WIFI_DI
   _RX1_MODE  = %0000_0000_000_0000000000000_00_11111_0
   _TX1_MODE  = %0000_0000_000_0000000000000_01_11110_0
   _BAUDRATE1 = _WIFI_BAUDRATE ' _BAUDRATE
   _RX2_PIN   = -1
   _TX2_PIN   = -1
   _RX2_MODE  = %0000_0000_000_0000000000000_00_11111_0
   _TX2_MODE  = %0000_0000_000_0000000000000_01_11110_0
   _BAUDRATE2 = _BAUDRATE ' _WIFI_BAUDRATE

Using Two Ports (Recommended)
-----------------------------

Below is an example platform configuration that uses two ports - this 
configuration uses the WiFi module installed on pin group 16 .. 23 configured 
as port 0, with user messages appearing on the normal pins used for serial 
I/O (i.e. pins 62 & 63), which are configured as port 1.

Note that by default, the constants defined for the 2 port serial plugin
are also used for the first 2 ports of the 8 port serial plugin, so you 
don't need to specify anything more to also use the 8 port serial plugin.

Note that when using two ports, the USER_PORT setting in "config.h" (and 
also in "wifi.c" if you are using the local wifi functions rather than the 
wifi library) should be set to 1 to make the user messages also appear on 
the second port rather than appearing interspersed with Wifi interactions 
on port 0.

   ' WiFi constants
   ' ==============

   #if !defined(_WIFI_BASE_PIN)
   _WIFI_BASE_PIN = 16   ' base pin of P2 WX adaptor board (64007)
   #endif

   _WIFI_DO  = _WIFI_BASE_PIN + 7   ' must match pin used for serial comms
   _WIFI_DI  = _WIFI_BASE_PIN + 6   ' must match pin used for serial comms
   _WIFI_RES = _WIFI_BASE_PIN + 0   ' -1 disables module RESET function
   _WIFI_PGM = _WIFI_BASE_PIN + 1   ' -1 disables module PGM function
   _WIFI_BRK = _WIFI_DI             ' -1 disables module BREAK function

   #if !defined(_WIFI_BAUDRATE)
   _WIFI_BAUDRATE = 230400   ' must match baud rate configured in WiFi board
   #endif

   ' 2 Port Serial constants
   ' =======================

   _RX1_PIN   = _WIFI_DO
   _TX1_PIN   = _WIFI_DI
   _RX1_MODE  = %0000_0000_000_0000000000000_00_11111_0
   _TX1_MODE  = %0000_0000_000_0000000000000_01_11110_0
   _BAUDRATE1 = _WIFI_BAUDRATE ' _BAUDRATE
   _RX2_PIN   = _RX_PIN
   _TX2_PIN   = _TX_PIN
   _RX2_MODE  = %0000_0000_000_0000000000000_00_11111_0
   _TX2_MODE  = %0000_0000_000_0000000000000_01_11110_0
   _BAUDRATE2 = _BAUDRATE ' _WIFI_BAUDRATE


The advantage of using a pin group other than 56 .. 63 for the WiFi module
is that the WiFi modules RES and PGM pins can be used, which means the software can reset the WiFi module instead of it having to power cycle 
the propeller before executing a Wifi program,

Setting up the WiFi module
==========================

A new WiFi module, or one that has just had its firmware reloaded, may have
its settings set to default values and may need some initial configuration 
to work correctly with Catalina.

This process is described in detail in the Parallax documentation, but here
is a quick summary:

1.  With the WiFi module installed and powered on, use a PC to find the WiFi 
    access point that starts with wx- followed by 6 alphanumeric characters 
    (e.g. "wx-3ff605").

2. Connect to that WiFi access point. No password is required.

3. Use a browser to go to the WiFi module Configuration home page by 
   navigating to http://192.168.4.1

4. Click on "Settings" to open the Settings page, and ensure the following 
   settings are set:

      Reset Pin: CTS (GPI013)

      Communications Baud Rate: Must match what the serial comms port is
                                configured to use - typically, this will be 
                                115200 for Propeller 1, or 
                                230400 for Propeller 2

      Communications Stop Bits: 1 Stop Bit

      Serial Commands (AKA CMD): Enabled

   Press "Save to Flash" at the bottom of the page.

5. To make the module appear on a local WiFi network, click on "Networks"
   to go to the Networks tab. Set the "WiFi mode" to "STA+AP". A list of 
   available network access points should appear. Note the "Station IP 
   address" of the module for future reference. Select the network to 
   connect to, enter any required password, and press "Connect!".

Using a local copy of the WiFi library functions
================================================

A complete copy of the wifi library with debug enabled, and configured to use
port 0 for WiFi and port 1 for displaying debug messages is provided in the
files wifi.h and wifi.c.

To use these functions instead of those in the wifi library, compile the
program along with wifi.c instead of -lwifi. For example, instead of using
a command like:

   catalina -p2 testwifi.c -lwifi -lserial2 -lci -C NO_HMI

use a command like:

   catalina -p2 testwifi.c wifi.c -lserial2 -lci -C NO_HMI

WiFi Firmware Fixes
===================

Some versions of the WiFi module firmware have issues with TCP support.

When running tcp_client on the propeller and pc_tcp_server on the PC, the 
program output on the propeller should look something like:

   Rcvd: Message 1 from the TCP Server

   Rcvd: Message 2 from the TCP Server

   Rcvd: Message 3 from the TCP Server

   Rcvd: Message 4 from the TCP Server

   ... etc ...

If, instead, the output looks like this ...

   Rcvd: Message 1 from the TCP Server

   Rcvd: Message 1 from the TCP Server
   Message 2 from the TCP Server

   Rcvd: Message 1 from the TCP Server
   Message 2 from the TCP Server
   Message 2 from the TCP Server

   Rcvd: Message 1 from the TCP Server
   Message 2 from the TCP Server
   Message 3 from the TCP Server
   Message 4 from the TCP Server

   ... etc ...

Or the output simply stops after a few seconds, then you need to update the 
firmware in your WiFi module if you need to use TCP. The updated firmware
is in the file ESP_Reload_FS_and_FW_Catalina.zip - it contains the updated 
firmware and installation instructions.

The firmware update is also required if you need propellers to talk to each
other directly using HTTP or WebSockets (it is not required if the propellers
only need to communicate indirectly). See the section below on "Propeller
to Propeller Communications".

In summary, if neither TCP nor direct communications are required, the WiFi 
module firmware does NOT need to be updated.

If the WiFi firmware is updated, all settings will reset to default values, 
so the WiFi module may need to be reconfigured before use. See the section on 
"Setting up the WiFi module"

Propeller to Propeller Communications
=====================================

If you have more than one propeller equipped with a WiFi module, then you have
two choices for propeller to propeller communications:

1. By having all propellers JOIN an existing WiFi Access Point (AP) - e.g.
   the Access Point provided by the WiFi router used to access the internet. 
   This is refered to in this document as "indirect communications".

2. By having one propeller acting as a WiFi Access Point (using AP or STA+AP
   mode) and having others JOIN that AP (using STA or STA+AP mode). This is
   referred to in this document as "direct communications".

Indirect communications is convenient if you have an existing WiFi router, but
direct communications is the method you would need to use (for example) in a
multi-propeller application that may have no access to any WiFi network other
than that which can be provided by the propeller WiFi modules themselves.

Both direct and indirect communications can use HTTP or WebSockets, but not
TCP. This is because the only TCP port that the WiFi module firmware opens 
is port 80, which is intended for HTTP traffic. TCP CAN be used to communicate
between a propeller and another computer that can have additional ports open 
(e.g. the demo TCP programs in this folder can be run on a PC and use port 
666 by default).

When using indirect communications, all the propellers JOIN the AP offered by 
the WiFi network, and they can communicate with each other using HTTP or 
WebSockets. WebSockets offers similar capabilities to those offered by TCP 
but can run over HTTP. 

For an example of indirect communications using HTTP, see the files 
http_client.c and http_server.c.

For an example of indirect communications using WebSockets, see the files 
ws_client.c and ws_server.c.

For an example of direct communications using WebSockets, see the files 
ws_ap_client.c and ws_ap_server.c. 

For an example of direct communications using HTTP, see the files 
http_ap_client.c and http_ap_server.c.


Lua and Wifi
============

This directory contains a version of the interactive Lua interpreter (which
will be built as wlua) and the Lua execution engine (which will be built as
wluax) which load the necessary serial comms and wifi libraries for Lua to
access the WiFi module. These libraries are not currently loaded by the other
versions of Lua provided with Catalina, (e.g. lua, ilua, elua etc).

There is also an example Lua program "testhttp.lua", which is very similar 
to the C program "testhttp.c" that can be used to test Lua's serial comms 
and wifi support.

To execute it, you would use Catalyst commands like:

   wlua testhttp.lua

or, to compile the program and then execute the compiled version:

   clua testhttp.lua
   wluax testhttp.lux

Like the other WiFi programs in this directory, wlua and wluax are compiled
with the NO_HMI option, so the usual user interaction and I/O functions
(e.g. print() etc) are unavailable, so (like the C programs) the serial 
library functions should be used for user interaction instead. 

This also means no error messages will be produced by Lua itself when the 
program is loaded. To detect simple syntax errors, use the Lua compiler to 
compile the program beforehand even if the text version is going to be 
executed, and also print diagnostic messages using the serial I/O functions 
to port 1 as appropriate. See the program "testhttp.lua" for an example.

The Lua serial library is very similar to the C serial library, except the
names have been changed to suit Lua - for example:

  s = require "serial";

  s.str(p, s);   -- same as s_tx(p, s);    (does not return a result)
  r = s.rx(p);   -- same as r = s_rx(p);   (returns an integer result)
  ... etc ...

And similarly for the "wifi" Lua library. In most cases, the functions are
very similar in parameter profiles and return values. For example:

  wifi = require "wifi";

  wifi.BREAK();                   -- same as wifi_BREAK();
  wifi.RESET();                   -- same as wifi_RESET();
  wifi.PGM();                     -- same as wifi_PGM();
  wifi.OK();                      -- same as wifi_OK();

  r = wifi.INIT(a ,b, c, d, e);   -- same as r = wifi_INIT(a, b, c, d, e);
  r = wifi.AUTO();                -- same as r = wifi_AUTO();
  r = wifi.CONNECT(a);            -- same as r = wifi_CONNECT(a);
  r = wifi.CLOSE();               -- same as r = wifi_CLOSE();
  r = wifi.SEND(h, s, d);         -- same as r = wifi_SEND(h, s, d);
  r = wifi.REPLY(h, r, t, d);     -- same as r = wifi_REPLY(h, r, t, d);
  r = wifi.SEND_DATA(h, r, t, d); -- same as r = wifi_SEND_DATA(h, r, t, d);
  r = wifi.SET(s, v);             -- same as r = wifi_SET(s, v);
  r = wifi.JOIN(s, p);            -- same as r = wifi_JOIN(s, p);

However, since Lua does not allow variable addresses to be passed as
parameters, whenever a Lua wifi Library function has to return values, they 
are returned as multiple Lua return values. Here are all the functions that 
differ in this way:

  wifi = require "wifi"

  r,p     = wifi.PATH(h);         -- r = wifi_PATH(h, &p);
  r,v     = wifi.ARG(n);          -- r = wifi_ARG(n, &v);
  r,v     = wifi.CHECK(n, v);     -- r = wifi_CHECK(n, &v);
  r,i     = wifi.LISTEN(p);       -- r = wifi_LISTEN(p, &i);
  r,h     = wifi.CONNECT(a, p);   -- r = wifi_CONNECT(a, p, &h);
  r,d,s   = wifi.RECV(h, m);      -- r = wifi_RECV(h, m, &d, &s);
  r,e,h,v = wifi.POLL(m);         -- r = wifi_POLL(m, &e, &h, &v);

See the file testhttp.lua for examples of the use of these functions.

The Lua support files in this directory are:

  linit.c   - initialization code which loads the Lua serial and wifi modules
