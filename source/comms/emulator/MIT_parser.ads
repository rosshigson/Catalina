-------------------------------------------------------------------------------
--             This file is part of the Ada Terminal Emulator                --
--               (Terminal_Emulator, Term_IO and Redirect)                   --
--                               package                                     --
--                                                                           --
--                             Version 0.1                                   --
--                                                                           --
--                   Copyright (C) 2003 Ross Higson                          --
--                                                                           --
-- The Ada Terminal Emulator package is free software; you can redistribute  --
-- it and/or modify it under the terms of the GNU General Public License as  --
-- published by the Free Software Foundation; either version 2 of the        --
-- License, or (at your option) any later version.                           --
--                                                                           --
-- The Ada Terminal Emulator package is distributed in the hope that it will --
-- be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General --
-- Public License for more details.                                          --
--                                                                           --
-- You should have received a copy of the GNU General Public License along   --
-- with the Ada Terminal Emulator package - see file COPYING; if not, write  --
-- to the Free Software Foundation, Inc., 59 Temple Place - Suite 330,       --
-- Boston, MA  02111-1307, USA.                                              --
-------------------------------------------------------------------------------

with MIT_Defs;
use MIT_Defs;

generic

   type PSES is private;
   type LPSES is access PSES;

package MIT_Parser is

   pragma Linker_Options ("-lMIT");

   type ParserStruct;  -- forward declare

   type PS is access ParserStruct;

   type PROC_PS is access procedure (p_s : in PS);

   type ParserStruct is record

      -- global control pointers and input buffer
      pSp : LPSES;
      lpD : PA_LPSTR;
      iDL : PA_INT;

      -- global parser buffers
      pendingstr : PA_PUCHAR;
      pendingpos : PA_USHORT;
      maxbuffer  : PA_USHORT;
      iArgs      : iArgs_Array;
      argcount   : PA_USHORT;

      -- global parser states
      curchar      : PA_UCHAR;
      pendingstate : PA_INT;
      pendingfunc  : PROC_PS;
      curdcs       : PROC_PS;

      -- global parser state and options flags
      nocontrol   : PA_BOOL;
      letCR       : PA_BOOL;
      prnctrlmode : PA_BOOL;
      dumping     : PA_BOOL;
      dumperror   : PA_BOOL;
      largebuffer : PA_BOOL;
      vterrorchar : PA_INT;
      vt_mode     : PA_INT;

      -- global mode-dependant tables
      ESC1tbl       : PESC1tbl_rec;
      ESC1tbl_count : PA_INT;

      -- static vars inside functions

      -- Process ESC
      esc2seq : PESC2tbl_rec;
      esc_i   : PA_USHORT;

      -- ProcessCSI, ProcessDCS, Process_DECCFS
      numstarted      : PA_BOOL;
      numended        : PA_BOOL;
      semicol         : PA_USHORT;
      flagvector      : PA_USHORT;
      csi_f           : PA_INT;
      csi_i           : PA_USHORT;
      pa_terminate    : PA_PUCHAR;
      j               : PA_USHORT;
      terminate_count : PA_USHORT;

      -- ProcessSCS, Process_DECDLD, Process_DECAUPSS, Process_DECRSCI
      intrms    : intrms_Array;
      Gx        : PA_USHORT;
      cslen     : PA_USHORT;
      intrcount : PA_USHORT;

      -- Process_DECDMAC
      hex1         : PA_USHORT;
      count        : PA_USHORT;
      pstr         : PA_PUCHAR;
      gettingCount : PA_BOOL;
      doingRep     : PA_BOOL;

   end record;


   generic

      with procedure ProcessAnsi (pSesptr : LPSES; iCode : PA_INT; args : LPARGS);

   package MIT_Processor is

      function  InitializeParser return PS;

      procedure ResetParser (p_s : PS);

      procedure FlushParserBuffer (p_s : PS);

      procedure SwitchParserMode (p_s : PS; mode : PA_INT);

      procedure ProcessSKIP (p_s : PS);

      procedure ParseAnsiData (p_s       : PS;
                               pSesptr   : LPSES;
                               lpData    : PA_LPSTR;
                               iiDataLen : PA_INT);

      --  all were CPP:
      pragma Import (C, InitializeParser, "InitializeParser");
      pragma Import (C, ResetParser, "ResetParser");
      pragma Import (C, FlushParserBuffer, "FlushParserBuffer");
      pragma Import (C, SwitchParserMode, "SwitchParserMode");
      pragma Import (C, ParseAnsiData, "ParseAnsiData");
      pragma Import (C, ProcessSKIP, "ProcessSKIP");

   end MIT_Processor;

end MIT_Parser;

