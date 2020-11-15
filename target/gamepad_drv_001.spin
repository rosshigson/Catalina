' /////////////////////////////////////////////////////////////////////////////
' NES Gamepad driver
' Read both game pads and assembles the bits into a single 16-bit WORD
' Continously, caller simply accesss the shared memory location to read the
' current state of the gamepads
' AUTHOR: Andre' LaMothe
' LAST MODIFIED: 2.19.06
' VERSION 0.1
' COMMENTS:
' API Instructions
' Start object with:
'               object_name.start
'
' Read all 16 state bits in format:
' right game pad #1 [15..8] : left game pad #0 [7..0]
'               object_name.read
'
' test if a specific button is down with:
'               object_name.button(button_id)
'               returns TRUE or FALSE
' ///////////////////////////////////////////////////////////////////////////


CON
                      
  IO_JOY_CLK       = %00001000    
  IO_JOY_SHLDn     = %00010000    
  IO_JOY_DATAOUT0  = %00100000    
  IO_JOY_DATAOUT1  = %01000000    
  NES_LATCH_DELAY  = $40

  ' button ids/bit masks
  ' NES bit encodings general for state bits
  NES_RIGHT  = %00000001
  NES_LEFT   = %00000010
  NES_DOWN   = %00000100
  NES_UP     = %00001000
  NES_START  = %00010000
  NES_SELECT = %00100000
  NES_B      = %01000000
  NES_A      = %10000000

  ' NES bit encodings for NES gamepad 0
  NES0_RIGHT  = %00000000_00000001
  NES0_LEFT   = %00000000_00000010
  NES0_DOWN   = %00000000_00000100
  NES0_UP     = %00000000_00001000
  NES0_START  = %00000000_00010000
  NES0_SELECT = %00000000_00100000
  NES0_B      = %00000000_01000000
  NES0_A      = %00000000_10000000

  ' NES bit encodings for NES gamepad 1
  NES1_RIGHT  = %00000001_00000000
  NES1_LEFT   = %00000010_00000000
  NES1_DOWN   = %00000100_00000000
  NES1_UP     = %00001000_00000000
  NES1_START  = %00010000_00000000
  NES1_SELECT = %00100000_00000000
  NES1_B      = %01000000_00000000
  NES1_A      = %10000000_00000000


VAR

  long  cogon, cog
  long  nes_bits_parm       ' local storage for NES state/bits

PUB start : okay

'' Start the NES gamepad reading process
'' returns false if no cog available
''
  stop
  okay := cogon := (cog := cognew(@NES_Read_Gamepad_ASM_Entry, @nes_bits_parm)) > 0


PUB stop

'' Stops driver - frees a cog

  if cogon~
    cogstop(cog)

PUB read
'' Reads the NES state and sends it back to caller
  return(nes_bits_parm)


PUB button(nes_button)
'' Return TRUE/FALSE if sent button is down
  return(nes_button & nes_bits_parm)




DAT

' //////////////////////////////////////////////////////////////////
' NES Game Paddle Read ASM Version Reads Continuously
' //////////////////////////////////////////////////////////////////       
' reads both gamepads in parallel encodes 8-bits for each in format
' right game pad #1 [15..8] : left game pad #0 [7..0]
' results are constantly written to ->PAR as a LONG
' call with something like
' cognew(@NES_Read_Gamepad_ASM_Entry, @nes_buttons)
' where "nes_buttons" is where you want the results to be stored from the
' continuous scanning of the gamepads
'
' set I/O ports to proper direction

' P3 = JOY_CLK      (pin 4) / output
' P4 = JOY_SH/LDn   (pin 5) / output
' P5 = JOY_DATAOUT0 (pin 6) / input
' P6 = JOY_DATAOUT1 (pin 7) / input

' NES Bit Encoding
'
' RIGHT  = %00000001
' LEFT   = %00000010
' DOWN   = %00000100
' UP     = %00001000
' START  = %00010000
' SELECT = %00100000
' B      = %01000000
' A      = %10000000

        org $000

' inline asm entry point
NES_Read_Gamepad_ASM_Entry

        ' step 1: set I/Os, 
        or  DIRA, #(IO_JOY_CLK | IO_JOY_SHLDn)          ' JOY_CLK and JOY_SH/LDn to outputs
        and DIRA, #(!(IO_JOY_DATAOUT0 | IO_JOY_DATAOUT1)) & $1ff ' JOY_DATAOUT0 and JOY_DATAOUT1 to inputs
        
NES_Latchbits

        ' step 2: set latch and clock to 0
        and OUTA, #(!(IO_JOY_CLK | IO_JOY_SHLDn)) & $1ff ' JOY_CLK = 0, JOY_SH/LDn = 0

        ' initialize counter and delay to let NES settle
        mov _counter, CNT
        add _counter, #NES_LATCH_DELAY
        waitcnt _counter, #NES_LATCH_DELAY
        
        ' step 3: set latch to 1
        or OUTA, #(IO_JOY_SHLDn) ' JOY_SH/LDn = 1

        ' initialize counter and delay to let NES settle
        mov _counter, CNT
        add _counter, #NES_LATCH_DELAY
        waitcnt _counter, #NES_LATCH_DELAY
                                     
        ' step 4: set latch to 0
        and OUTA,#(!(IO_JOY_SHLDn) & $1ff) ' JOY_SH/LDn = 0

        ' clear gamepad storage word
        xor _nes_bits, _nes_bits

        ' step 5: read 8 bits, 1st bits are already latched and ready, simply save and clock remaining bits
        mov _index, #8

NES_Getbits_Loop

        shl _nes_bits, #$1 '             ' shift results 1 bit to the left each time
        
        mov _nes_gamepad0, INA           ' read all 32-bits of input including gamepads
        mov _nes_gamepad1, _nes_gamepad0 ' copy all 32-bits of input including gamepads

        ' the next 6 instructions could also be done with a test, mask, write, but this is cleaner and executes in the same amount
        ' of time always
        ' now extract bits from inputs
        and _nes_gamepad0, #(IO_JOY_DATAOUT0)
        and _nes_gamepad1, #(IO_JOY_DATAOUT1)

        ' shift bits into place, so that gamepad0 bits fall into bit 0 of 16-bit result and gamepad1 bits fall into bit 8 of 16-bit result
        ' then continuously shift the entire result until every buttons has been shifted into position from both gamepads
        shr _nes_gamepad0, #5
        shl _nes_gamepad1, #2

        ' finally OR results into accumulating result/sum
        or _nes_bits, _nes_gamepad0
        or _nes_bits, _nes_gamepad1

        ' pulse clock...
        or OUTA, #%00001000 ' JOY_CLK = 1

        ' initialize counter and delay to let NES settle
        mov _counter, CNT
        add _counter, #NES_LATCH_DELAY
        waitcnt _counter, #NES_LATCH_DELAY
        
        and OUTA,#%11110111 ' JOY_CLK = 0

        ' initialize counter and delay to let NES settle
        mov _counter, CNT
        add _counter, #NES_LATCH_DELAY
        waitcnt _counter, #NES_LATCH_DELAY

        djnz _index, #NES_Getbits_Loop
        ' END NES_getbits_loop

        ' invert bits to make positive logic
        xor _nes_bits, _MAXINT

        ' mask lower 16-bits only
        and _nes_bits, _NES_GAMEPAD_MASK

        ' finally write results back out to caller
        wrlong _nes_bits, par ' now access main memory and write the value

        ' continue looping...
        jmp #NES_Latchbits


' VARIABLE DECLARATIONS ///////////////////////////////////////////////////////

_MAXINT                 long                    $ffff_ffff                      ' 32-bit maximum value constant
_NES_GAMEPAD_MASK       long                    $0000_ffff                      ' mask for NES lower 16-bits 

_nes_bits               long                    $0                              ' storage for 16 NES gamepad bits (lower 16-bits)
_nes_gamepad0           long                    $0                              ' left gamepad temp storage
_nes_gamepad1           long                    $0                              ' right gamepad temp storage
_index                  long                    $0                              ' general counter/index
_counter                long                    $0                              ' general counter
                   