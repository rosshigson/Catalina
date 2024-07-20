'
' NOTE: The original 1CogKBM.spin2 has been split into 5 files - 2 files for 
' Port A, 2 files for Port B, and one common file:
'
' 1. cogkbma.s contains code and data for port A that can be 
'    placed AFTER the C sbrk.
' 
' 2. cogkbmb.s contains code and data for port B that can be 
'    placed AFTER the C sbrk.
'
' 3. kbmprea.s contains code and data for port A that 
'    must be placed BEFORE the C sbrk. 
'
' 4. kbmpreb.s contains code and data for port B that 
'    must be placed BEFORE the C sbrk. 
'
' 5. cogkbmc.s contains code and data common to both port
'    A and port B that must be placed BEFORE the C sbrk

CON

' define P2_REV_A for Rev A chips ...
'#define P2_REV_A

' Smart pin configuration for "long repository" mode:
        SP_REPO1_MODE   = %00001_0 | 1 << 16    ' %MMMMM_0, P[12:10] != %101

' P2-ES board user LEDs tied to pins:
        LED56 = 56
        LED57 = 57
        LED58 = 58
        LED59 = 59
        LED60 = 60
        LED61 = 61
        LED62 = 62
        LED63 = 63

' clock freq as a float 
        _FCLKFREQ      = float(_CLOCKFREQ)

' #region (Shared constants)
'------------------------------------------------------------------------------
' Notification values for client routines that handle mouse/keyboard data and
' error events posted by the USB. The USB cog communicates with the client
' through the USB_A_EVENT_REPO smart pin which is configured in repository mode.
' The client should poll this smart pin (testp #USB_A_EVENT_REPO wc) at four
' millisecond (or less) intervals and react appropriately when any of the below
' events are posted.
'------------------------------------------------------------------------------
' For these event notifications, this client uses a jump table:
         M_DATA = 0
         KBD_KEY_UPDATE = 1
         KBD_TGL_UPDATE = 2
         USB_ERROR = 3
' For these events, this client uses them as SKIPF values to LOCate the hub
' address of the applicable description string defined below:
        DEV_UNKNOWN    = %00_1111_1110  ' Connected device doesn't support boot protocol mouse/keyboard
        KB_READY       = %00_1111_1101  ' Boot keyboard protocol identified
        M_READY        = %00_1111_1011  ' Boot mouse protocol identified
        KBM_READY      = %00_1111_0111  ' Boot mouse + keyboard protocols identified
        DEV_DISCONNECT = %00_1100_1111  ' Device disconnect detected
        USB_STARTED    = %00_1011_1111  ' USB is running
        USB_NO_COG     = %00_0111_1111  ' USB cog failed to start
'------------------------------------------------------------------------------
' Reference: "Device Class Definition for Human Interace Devices (HID), v1.11,"
'            "Appendix B: Boot Interface".
'------------------------------------------------------------------------------
' Boot protocol mouse constants:
'------------------------------------------------------------------------------
' Mouse button bit assignments (left, right, center):
        MOUSE_LBTNB = 0
        MOUSE_RBTNB = 1
        MOUSE_CBTNB = 2      ' Button bits 3..7 device specific
' Mouse button bitflags:
        MOUSE_LBTNF = |< MOUSE_LBTNB
        MOUSE_RBTNF = |< MOUSE_RBTNB
        MOUSE_CBTNF = |< MOUSE_CBTNB
'------------------------------------------------------------------------------
' USB HID Keyboard/Keypad Page (0x07). The scancodes below are indexes into
' the scancode->character/function look-up table.
'------------------------------------------------------------------------------
' USB boot protocol key scancode constants. IMPORTANT: these constants are the
' keyboard scan codes per USB HID specification 1.11. The keypress value that
' the USB cog writes to the kbd_keypress location will be a 7-bit ASCII value
' if the key scancode represents an ASCII character e.g., TAB->$09,
' BACKSPACE->$08, SPACE->$20, DELETE->$7f, etc. If there is NOT an ACSII match,
' the keypress value will be the same as the key's HID scan code. In those
' cases, it is up to the client program to implement the action required for
' that key.
'------------------------------------------------------------------------------
' First four entries in the key lookup table are info/error indicators:
        KEY_NO_KEY = 0
        KEY_ERR_ROLLOVER = 1 
        KEY_POST_FAIL = 2 
        KEY_ERR_UNDEF = 3
' Alpha scancodes are contiguous in the lookup table, and if the caps lock key
' is toggled on, these are the only scancodes affected by it:
        KEY_A_a     = $04
        KEY_C_c     = $06
        KEY_T_t     = $17
        KEY_Z_z     = $1d
' Digit scancodes and their shifted characters:
        KEY_1       = $1e        ' 1 and !
        KEY_0       = $27        ' 0 and )
' Keyboard return (ENTER), tab, space, etc.:
        KEY_ENTER   = $28
        KEY_CAPSLK  = $39
' F1..F12 keys:
        KEY_F1      = $3a
        KEY_F12     = $45
' More special keys and cursor movement:
        KEY_PRTSCN  = $46
        KEY_SCRLK   = $47
        KEY_INSERT  = $49
        KEY_DELETE  = $4c
        KEY_UP      = $52
' Keypad keys:
        KEY_NUMLK   = $53
        KEY_DOT_DEL = $63
'------------------------------------------------------------------------------
' Keyboard LED output report toggle key bit postions:
        LED_NUMLKB = 0
        LED_CAPSLKB = 1
        LED_SCRLKB = 2
        LED_COMPOSEB = 3
        LED_KANAB = 4
        LED_CONST0B = 5
        LED_CONST1B = 6
        LED_CONST2B = 7
' Keyboard LED output report toggle key bitflags:
        LED_NUMLKF   = |< LED_NUMLKB
        LED_CAPSLKF  = |< LED_CAPSLKB
        LED_SCRLKF   = |< LED_SCRLKB
        LED_COMPOSEF = |< LED_COMPOSEB
        LED_KANAF    = |< LED_KANAB
        LED_CONST0F  = |< LED_CONST0B
        LED_CONST1F  = |< LED_CONST1B
        LED_CONST2F  = |< LED_CONST2B
' Keyboard modifier key bit positions:
        LEFT_CTRLB = 0
        LEFT_SHIFTB = 1
        LEFT_ALTB = 2
        LEFT_GUIB = 3
        RIGHT_CTRLB = 4
        RIGHT_SHIFTB = 5
        RIGHT_ALTB = 6 
        RIGHT_GUIB = 7
' Keyboard modifier bitflags
        LEFT_CTRLF   = |< LEFT_CTRLB
        LEFT_SHIFTF  = |< LEFT_SHIFTB
        LEFT_ALTF    = |< LEFT_ALTB
        LEFT_GUIF    = |< LEFT_GUIB
        RIGHT_CTRLF  = |< RIGHT_CTRLB
        RIGHT_SHIFTF = |< RIGHT_SHIFTB
        RIGHT_ALTF   = |< RIGHT_ALTB
        RIGHT_GUIF   = |< RIGHT_GUIB
' Keyboard modifier flag combinations:
        KEY_CTRLMOD  = LEFT_CTRLF | RIGHT_CTRLF
        KEY_SHIFTMOD = LEFT_SHIFTF | RIGHT_SHIFTF
        KEY_ALTMOD   = LEFT_ALTF | RIGHT_ALTF
' Keyboard buffer size:
        KBD_BUFFMASK = $0f      ' Keyboard key data buffer

' vvvvvvvvvvvvvvvvvvvvvvvv Copy from below to EOF vvvvvvvvvvvvvvvvvvvvvvvv
'------------------------------------------------------------------------------
' Low/full speed one-cog USB host with integrated mouse/keyboard 
' "boot protocol" support.
'------------------------------------------------------------------------------
' P2-ES Evaluation Board:
'   The USB D-/D+ data lines must be an adjacent even/odd pin pair, with the
'   lower (even) pin# assigned to DM_A constant and the upper (odd) pin assigned
'   to the DP_A constant.
'   Mouse/keyboard activity is shown on the P56 LED.
'   Host status changes are posted to the mouse/keyboard data area in hub RAM.
'------------------------------------------------------------------------------
{
  USB references:
  Universal Serial Bus Specification, Revision 2.0
    www.usb.org/developers/docs/usb20_docs/
  Device Class Definition for Human Interface Devices (HID), Version 1.11
    www.usb.org/developers/hidpage/

Smart pin configuration bits:
  D/# = %AAAA_BBBB_FFF_PPPPPPPPPPPPP_TT_MMMMM_0

USB smart pin modes (FPGA, test chip v1):
  %11000 = USB host, low-speed
  %11001 = USB host, full-speed
  %11010 = USB device, low-speed
  %11011 = USB device, full-speed

USB smart pin modes (scheduled for test chip v2):
  All USB smart pin modes have been consolidated to %11011.
  WXPIN is now used to set up the sub-modes and the NCO:
  bit 15 = 0 for device mode, 1 for host mode
  bit 14 = 0 for low-speed mode, 1 for full-speed mode
  bits 13..0 = NCO frequency

These modes require that two adjacent pins be configured together to form a USB pair, whose OUTs
will be overridden to control their output states. These pins must be an even/odd pair, having
only the LSB of their pin numbers different. For example: pins 0 and 1, pins 2 and 3, pins 4
and 5, etc., can form USB pairs. They can be configured via WRPIN with identical D data of
%1_110xx_0. Using D data of %0_110xx_0 will disable output drive and effectively create a USB
'sniffer'. A new WRPIN can be done to effect such a change without A_resetting the smart pin.

NOTE: in the current FPGA, there are no built-in 1.5k and 15k resistors, which the final silicon
smart pins will contain, so it is up to you to insert these yourself on the DP_A and DM_A lines.

The upper (odd) pin is the DP_A pin. This pin's IN is raised whenever the output buffer empties,
signaling that a new output byte can be written via WYPIN to the lower (even) pin. No
WXPIN/WYPIN instructions are used for this pin.

The lower (even) pin is the DM_A pin. This pin's IN is raised whenever a change of status occurs in
the receiver, at which point a RDPIN can be used on this pin to read the 16-bit status word.
WXPIN is used on this pin to set the NCO baud rate.

These DP_A/DM_A electrical designations can actually be switched by swapping low-speed and full-speed
modes, due to USB's mirrored line signaling.

To start USB, clear the DIR bits of the intended two pins and configure them each via WRPIN. Use
WXPIN on the lower pin to set the baud rate, which is a 16-bit fraction of the system clock. For
example, if the main clock is 80MHz and you want a 12MHz baud rate (full-speed), use
12,000,000 / 80,000,000 * $10000 = 9830. Then, set the pins' DIR bits. You are now ready to read
the receiver status via RDPIN and set output states and send packets via WYPIN, both on the
lower pin.

To affect the line states or send a packet, use WYPIN on the lower pin. Here are its D values:
 0 = output IDLE        - default state, float pins, except possible resistor(s) to 3.3V or GND
 1 = output SE0         - drive both DP_A and DM_A low
 2 = output K           - drive K state onto DP_A and DM_A (opposite)
 3 = output J           - drive J state onto DP_A and DM_A (opposite), like IDLE, but driven
 4 = output EOP         - output end-of-packet: SE0, SE0, J, then IDLE
 $80 = SOP              - output start-of-packet, then bytes, automatic EOP when buffer runs out

To send a packet, first do a 'WYPIN #$80, lowerpin'. Then, after each IN rise on the upper pin,
do a 'AKPIN upperpin', followed by a 'WYPIN byte,lowerpin' to buffer the next byte. Bits 31..8
of your data bytes are ignored, but by keeping those upper bits clear, WYPIN will be able to do
the fastest transfer to the smart pin, which takes only 4 clocks. The transmitter will automatically
send an EOP when you stop giving it bytes. To keep the output buffer from overflowing, you should
always verify that the upper pin's IN was raised after each WYPIN, before issuing another
WYPIN, even if you are just setting a state. The reason for this is that all output activity is
timed to the baud generator and even state changes must wait for the next bit period before being
implemented, at which time the output buffer empties.

There are separate state machines for transmitting and receiving. Only the baud generator is common
between them. The transmitter was just described above. Below, the receiver is detailed. Note that
the receiver receives not just input from another host/device, but all local output, as well.

At any time, a RDPIN/RQPIN can be executed on the lower pin to read the current 16-bit status of the
receiver, with the error flag going into C. The lower pin’s IN will be raised whenever a change
occurs in the receiver’s status. This will necessitate A WRPIN/WXPIN/WYPIN/RDPIN/AKPIN before IN can
be raised again, to alert of the next change in status.

NOTE that after the pin is acknowledged, it will take at least two clocks for IN to drop, before it
can be polled again:
    AKPIN    pin                   ' Acknowledge smart pin, releases IN from high
    NOP                            ' Elapse two clocks (or more)
    TESTP    pin         WC        ' IN  can now be polled again

The receiver's status bits are as follows:
 [31:16] <unused>                - $0000
 [15:8]  byte                    - last byte received
 [7]     byte toggle             - cleared on SOP, toggled on each byte received
 [6]     error                   - cleared on SOP, set on bit-unstuff error, EOP SE0 > 3 bits, or SE1
 [5]     EOP in                  - cleared on SOP or 7+ bits of J or K, set on EOP
 [4]     SOP in                  - cleared on EOP or 7+ bits of J or K, set on SOP
 [3]     steady-state indicator  - cleared on line change, set on 7+ bits of no line change
 [2]     SE0 in         (RESET)  - cleared on !SE0, set on 1+ bits of SE0
 [1]     K in           (RESUME) - cleared on !K, set on 1+ bits of K
 [0]     J in           (IDLE)   - cleared on !J, set on 1+ bits of J
The result of a RDPIN can be bit-tested for events of interest. It can also be shifted right by 8
bits to LSB-justify the last byte received and get the byte toggle bit into C, in order to determine
if you have a new byte.
}
'------------------------------------------------------------------------------
' USB References:
' Universal Serial Bus Specification, Revision 2.0
'   www.usb.org/developers/docs/usb20_docs/
' Device Class Definition for Human Interface Devices (HID), Version 1.11
'   www.usb.org/developers/hidpage/
' Universal Serial Bus (USB) HID Usage Tables, Version 1.12
'   www.usb.org/developers/hidpage/Hut1_12v2.pdf
'------------------------------------------------------------------------------
' #endregion (Basics of P2 USB Smart Pins)
' #region USB host constants)
'------------------------------------------------------------------------------
con
        _12Mbps        = round((12_000_000.0 / _FCLKFREQ) * 65536.0) ' = 4369 NCO @180MHz, 9830 @80MHz
        _1_5Mbps       = round((1_500_000.0 / _FCLKFREQ) * 65536.0)  ' = 546 NCO @180MHz, 1229 @80Mhz
        USB_V1HMODE_FS = %1_11001_0 + 1 << 16
        USB_V1DMODE_FS = %1_11011_0 + 1 << 16
        USB_H_FS_NCO   = %11 << 14 + _12Mbps
        USB_D_FS_NCO   = %01 << 14 + _12Mbps
        USB_V1HMODE_LS = %1_11000_0 + 1 << 16
        USB_V1DMODE_LS = %1_11010_0 + 1 << 16
        USB_H_LS_NCO   = %10 << 14 + _1_5Mbps
        USB_D_LS_NCO   = %00 << 14 + _1_5Mbps
        USB_V2MODE     = %1_11011_0 + 1 << 16 ' In P2 silicon v2 all USB smart pin modes are consolidated to %11011.
'------------------------------------------------------------------------------
' Time units converted to clock cycles for the given P2 Mhz clock speed
        _1ms   = round(_FCLKFREQ / 1_000.0)
        _1us   = round(float(_1ms) / 1_000.0)
        _100ns = round(float(_1us) / 1_000.0 * 100.0)
        LSBTns = 667.0                          ' Low-Speed bit period, in nanoseconds
        FSBTns = 83.54                          ' Full-Speed bit period, in nanoseconds
        _1LSBT = round(_FCLKFREQ / 1_000_000_000.0 * LSBTns)' = 53 clocks @ 80Mhz, 80 clocks @ 120Mhz
        _1FSBT = round(_FCLKFREQ / 1_000_000_000.0 * FSBTns)' = 7 clocks @ 80Mhz, 10 clocks @ 120Mhz
' Time delays and intervals
' Useful USB constants and wait intervals:
        CONNECT_WAIT    = _1ms * 250            ' Connect/disconnect verification delay
        RESET_HOLD      = _1ms * 15             ' Host A_reset state hold time
        XFER_RETRIES    = 12                    ' Maximum retries before retiring a transfer
        TXN_RETRIES     = 12                    ' Maximum retries before retiring a transaction
        NAK_NOLIMIT     = 0                     ' Unlimited NAK retries
        IN_NAK_RETRIES  = 50000                 ' Control transfer IN-NAK A_retry limit (0 = unlimited)
        OUT_NAK_RETRIES = 50000                 ' Control transfer OUT-NAK A_retry limit (0 = unlimited)
        XFER_WAIT       = _1ms * 5              ' Transfer A_retry wait timespan
' Standard Device request maximum timeout periods:
        TO_STANDARD  = _1ms * 5000              ' Non-specific maximum timout period
        TO_DATA      = _1ms * 500               ' Standard Device requests with a data stage
        TO_NODATA    = _1ms * 50                ' Standard Device requests without a data stage
        TO_SETADDR   = _1ms * 50                ' Device SetAddress() command processing maximum
        TO_CHGADDR   = _1ms * 2                 ' Device SetAddress() period allowed to change its address before next request sent
'------------------------------------------------------------------------------
' Low-Speed inter-packet delay, in bit periods (Section 7.1.18). For the host,
' the range is a minimum of two bit periods and a maximum of 7.5 bit periods:
'------------------------------------------------------------------------------
        IP_DELAY_LS  = round(4.0 * LSBTns * float(_1us) / 1000.0) ' Range @180MHz: 240 to 901 clocks (1.334us to 5.003us)
        IP_DELAY_FS  = round(4.0 * FSBTns * float(_1us) / 1000.0) ' Range @180MHz: 30 to 112  clocks (0.166us to 0.623us)
'------------------------------------------------------------------------------
' End-to-end signal delay, in bit periods (Section 7.1.19), measured at the
' data pins of the device from the SE0-to-J transition at the end of the EOP.
' For example, when a device transmits the data for an IN transaction, it will
' wait at least 16 bit periods for the host handshake response, but no more
' than 18 bit periods:
'   Low-Speed:  10.672us..12.006us (@80MHz: 853.8 to 960.5 clocks).
'   Full-Speed: 1.238us..1.494us (@80MHz: 106.2 to 119.5 clocks).
' When the host transmits data e.g. an OUT transaction, it must wait at least
' 18 bit periods before it will timeout the response and start a new transaction.
'------------------------------------------------------------------------------
        TAT_WAIT_LS  = round(22.0 * LSBTns * float(_1us) / 1000.0)
        TAT_WAIT_FS  = round(28.0 * FSBTns * float(_1us) / 1000.0)
'------------------------------------------------------------------------------
' Interrupt service routine timespans for 1ms interval A_frame generation.
' Target resolution is 1.00ms +/- 0.0005ms. At full-speed, a numbered
' start-of-A_frame packet is issued. At low-speed, a single EOP is issued as a
' "keep-alive" strobe to prevent a device from entering suspend mode.
'------------------------------------------------------------------------------
        TXN_OK_LS    = _1us * 667 - 6           ' All USB transactions must be started within this timespan
        NO_TXN_LS    = _1us * 333 - 7           ' Low-speed needs ~33% bandwidth per max packet of 8 bytes
        TXN_OK_FS    = _1us * 825 - 6           ' Full-speed needs ~10% bandwidth per max packet of 64 bytes
        NO_TXN_FS    = _1us * 175 - 7
' Non-USB related time intervals:
        PULSE_TIME   = _1ms * 750               ' LED-blinking heartbeat interval
' PID tokens
'------------------------------------------------------------------------------
' Token packet format.
'------------------------------------------------------------------------------
'                       CRC5  ENDP ADDRESS PID
        CRC_MASK     = %11111_0000_0000000_00000000
        EP_MASK      = %00000_1111_0000000_00000000
        ADDR_MASK    = %00000_0000_1111111_00000000
        EP_ADDR_MASK = %00000_1111_1111111_11111111
        EP_ADDR_ZERO = %00010_0000_0000000_00000000     ' CRC5 = $02 for addr zero, ep zero
'------------------------------------------------------------------------------
' Packet Identifier Bytes (PID). Notice that the first two LSBits are
' identical for each group.
'------------------------------------------------------------------------------
' Token:
        PID_OUT   = %1110_0001                  ' $e1
        PID_IN    = %0110_1001                  ' $69
        PID_SOF   = %1010_0101                  ' $a5
        PID_SETUP = %0010_1101                  ' $2d

' Data:
        PID_DATA0 = %1100_0011                  ' $c3
        PID_DATA1 = %0100_1011                  ' $4b
        PID_DATA2 = %1000_0111                  ' $87
        PID_MDATA = %0000_1111                  ' $0f

' Handshake:
        PID_ACK   = %1101_0010                  ' $d2
        PID_NAK   = %0101_1010                  ' $5a
        PID_STALL = %0001_1110                  ' $1e
        PID_NYET  = %1001_0110                  ' $96
' Special:
        PID_PRE   = %0011_1100                  ' $3c
        PID_ERR   = %0011_1100                  ' $3c
        PID_SPLIT = %0111_1000                  ' $78
        PID_PING  = %1011_0100                  ' $b4
        PID_RESVD = %1111_0000                  ' $f0
' Tx, rx and host related constants
' USB transmitter WYPIN D line state options:
        OUT_IDLE = 0
        OUT_SE0  = 1
        OUT_K    = 2
        OUT_J    = 3
        OUT_EOP  = 4
        OUT_SOP  = $80
' USB receiver RDPIN status bit positions:
        J_IDLEB = 0
        K_RESUMEB = 1
        SE0_RESETB = 2
        SE1_BADB = 3 
        SOPB = 4
        EOPB = 5
        BUS_ERRB = 6
        BYTE_TGLB = 7
' USB receiver RDPIN status bitflags:
        J_IDLEF    = |< J_IDLEB
        K_RESUMEF  = |< K_RESUMEB
        SE0_RESETF = |< SE0_RESETB
        SE1_BADF   = |< SE1_BADB
        SOPF       = |< SOPB
        EOPF       = |< EOPB
        BUS_ERRF   = |< BUS_ERRB
        BYTE_TGLF  = |< BYTE_TGLB
' USB CRC constants:
        USB5_POLY      = %0_0101 >< 5           ' USB5 polynomial is reflected when calculating CRC
        USB5_RESIDUAL  = %0_1100 >< 5           ' Expected CRC5 residual value when checking received data
        USB16_POLY     = $8005 >< 16            ' USB16 polynomial is reflected when calculating CRC
        USB16_RESIDUAL = $800d >< 16            ' Expected CRC16 residual value when checking received data
' Host->class driver USB connect speed:
        USB_SPEED_UNKNOWN = 0 
        USB_SPEED_LOW = 1
        USB_SPEED_FULL = 2
' Protocol error codes:
        ERR_NONE = 0 
        ERR_URX = 1
        ERR_SE1 = 2 
        ERR_PACKET = 3
        ERR_TAT = 4
        ERR_TXN_RETRY = 5
        ERR_XFER_RETRY = 6
        ERR_NAK = 7
        ERR_ACK_RETRY = 8
        ERR_EMPTY_PKT = 9
        ERR_RX_CRC = 10 
        ERR_DATAX_SYNC = 11
        ERR_CONFIG_FAIL = 12
        ERR_END = 13
' Debug stuff:
        DBG_FEEDBEEF = $efbeedfe                ' Handy byte sequence for hex search in .obj files
        DBG_C0DEDEAD = $addedec0                ' End of cog/lut code marker
        DBG_DADADEAD = $addedada                ' End of data marker
' Host status bit positions. Bit4 and bit5 use the receiver status constants for SOP and EOP:
        IDLEB = 0
        CONNECTEDB = 1
        LOW_SPEEDB = 2
        DATAx_TGLB = 3
        TXN_LIMITB = 4 
        DWNSTRM_HUBB = 8
' Host status bitflags. Unless otherwise noted, bit states are active high:
        IDLEF        = |< IDLEB                 ' Set when USB in idle state
        CONNECTEDF   = |< CONNECTEDB            ' USB device A_connected
        LOW_SPEEDF   = |< LOW_SPEEDB            ' Low-speed device A_connected, clear if full-speed
        DATAx_TGLF   = |< DATAx_TGLB            ' Cleared if sending DATA0 packet, set if sending DATA1 packet
        TXN_LIMITF   = |< TXN_LIMITB            ' No-go area to prevent transactions from spanning A_frame boundary
'       EOPF         = |< EOPB                  ' Same bit position as the USB receiver RDPIN constant defined above
'       BUS_ERRF     = |< BUS_ERRB              ' Same bit position as the USB receiver RDPIN constant defined above
'       BYTE_TGLF    = |< BYTE_TGLB             ' Same bit position as the USB receiver RDPIN constant defined above
        DWNSTRM_HUBF = |< DWNSTRM_HUBB          ' Not yet implemented
'------------------------------------------------------------------------------
' Keyboard and mouse constants:
'------------------------------------------------------------------------------
' Keyboard interrupt endpoint poll interval and auto-repeat timing. Since the
' interrupt IN transactions are executed on a timed basis, use that to
' calculate auto-repeat initial delay and repeat rate.
'------------------------------------------------------------------------------
        KBD_POLL_INTERVAL = _1ms * 8            ' Interrupt IN txn timespan
        KBD_REPEAT_DELAY  = 62                  ' 62 * 8ms = 496ms initial delay
        KBD_REPEAT_RATE   = 5                   ' 5 * 8ms = 40ms repeat rate
'------------------------------------------------------------------------------
' Mouse interrupt endpoint poll interval:
'------------------------------------------------------------------------------
        MOUSE_POLL_INTERVAL = _1ms * 8          ' Interrupt IN txn timespan
        MOUSE_NAK_DELAY     = 62                ' USER_LED feedback blink delay uses the NAK count
' #endregion (USB host constants)
' #region (USB Descriptor Definitions)
con
'------------------------------------------------------------------------------
' USB References:
' Universal Serial Bus Specification, Revision 2.0
'   www.usb.org/developers/docs/usb20_docs/
' Device Class Definition for Human Interface Devices (HID), Version 1.11
'   www.usb.org/developers/hidpage/
'------------------------------------------------------------------------------
' SETUP packet bmRequestType bit groups (Section 9.3.1, Table 9-2).
' Use TYPE_STANDARD for all USB Standard Device Request codes.
'------------------------------------------------------------------------------
' D7 Data direction  | D6:5 Type    | D4:0 Recipient
'------------------------------------------------------------------------------
' 0 - Host-to-device | 0 = Standard | 0 = Device
' 1 - Device-to-host | 1 = Class    | 1 = Interface
'                    | 2 = Vendor   | 2 = Endpoint
'                    | 3 = Reserved | 3 = Other
'                    |              | 4 -31 = Reserved
'------------------------------------------------------------------------------
        DIR_HOST_TO_DEV = 0 << 7
        DIR_DEV_TO_HOST = 1 << 7                ' D7 Data direction
        TYPE_STANDARD   = %00 << 5              ' D6:D5 Type (use Standard for all USB Standard Device Requests
        TYPE_CLASS      = %01 << 5
        TYPE_VENDOR     = %10 << 5
        TYPE_RESERVED   = %11 << 5
        RECIP_DEVICE    = %0_0000               ' D4..D0 Recipient
        RECIP_INTERFACE = %0_0001
        RECIP_ENDPOINT  = %0_0010
        RECIP_OTHER     = %0_0011
'       RECIP 4 - 31 = Reserved
'------------------------------------------------------------------------------
' Standard Device Request codes (Section 9.4, Table 9-4):
'------------------------------------------------------------------------------
        REQ_GET_STATUS = $00
        REQ_CLEAR_FEATURE = $01
        REQ_RESERVED_1 = $02
        REQ_SET_FEATURE = $03
        REQ_RESERVED2 = $04
        REQ_SET_ADDR = $05
        REQ_GET_DESC = $06
        REQ_SET_DESC = $07
        REQ_GET_CONFIG = $08
        REQ_SET_CONFIG = $09
        REQ_GET_INTF = $0a
        REQ_SET_INTF = $0b
        REQ_SYNC_FRAME = $0c
'------------------------------------------------------------------------------
' Standard descriptor types (Section 9.4, Table 9-5):
'------------------------------------------------------------------------------
        TYPE_DEVICE = $01
        TYPE_CONFIG = $02
        TYPE_STRING = $03
        TYPE_INTERFACE = $04
        TYPE_ENDPOINT = $05
        TYPE_QUALIFIER = $06
        TYPE_OTHER_SPEED = $07
        TYPE_INTERFACE_PWR = $08
        TYPE_OTG = $09
'------------------------------------------------------------------------------
' Device/Interface Class Codes (full list at www.usb.org/developers/defined_class):
'------------------------------------------------------------------------------
        CLASS_INFO_INTF = $00
        CLASS_AUDIO = $01
        CLASS_COMM = $02
        CLASS_HID = $03
        CLASS_UNDEF0 = $04
        CLASS_PHYSICAL = $05
        CLASS_IMAGE = $06
        CLASS_PRINTER = $07
        CLASS_MASS_STORAGE = $08
        CLASS_HUB = $09
        CLASS_CDC_DATA = $0a
        CLASS_SMARTCARD = $0b
        CLASS_UNDEF1 = $0c
        CLASS_CONT_SECURITY = $0d
        CLASS_VIDEO = $0e
        CLASS_HEALTH = $0f
        CLASS_AUDIO_VIDEO = $10
        CLASS_BILLBOARD = $11
        CLASS_TYPE_C_BRIDGE = $12
        CLASS_DIAGNOSTIC_DEV  = $dc
        CLASS_WIRELESS_CTRL   = $e0
        CLASS_MISCELLANEOUS   = $ef
        CLASS_APP_SPECIFIC    = $fe
        CLASS_VENDOR_SPECIFIC = $ff
'------------------------------------------------------------------------------
' HID Class Requests (v1.11 HID Device Class Definition Section 7.2):
'------------------------------------------------------------------------------
        HID_GET_REPORT = $01
        HID_GET_IDLE = $02
        HID_GET_PROTO = $03 ' $04 - $08 reserved
        HID_SET_REPORT = $09
        HID_SET_IDLE = $0a
        HID_SET_PROTO = $0b
' HID Descriptor types:
        TYPE_HID = $21
        TYPE_REPORT = $22
        TYPE_PHYSICAL = $23 ' HID types $24 - $2f are reserved
'------------------------------------------------------------------------------
' HID report types (v1.11 HID Device Class Definition, Section 7.2.1):
'------------------------------------------------------------------------------
        TYPE_INPUT = $01
        TYPE_OUTPUT = $02
        TYPE_FEATURE = $03 ' $04 - $ff are reserved
'------------------------------------------------------------------------------
' HID Interface SubClasses:
'------------------------------------------------------------------------------
        SUBCLASS_INTF_NONE = $00
        SUBCLASS_INTF_BOOT = $01
'------------------------------------------------------------------------------
' HID Protocol codes:
'------------------------------------------------------------------------------
        INTF_PROTO_NONE = $00
        INTF_PROTO_KBD = $01
        INTF_PROTO_MOUSE = $02

        BOOT_PROTOCOL = $00
        REPORT_PROTOCOL = $01
'------------------------------------------------------------------------------
' Other HID buffer lengths:
'------------------------------------------------------------------------------
        MAX_HID_REPTS   = 4             ' We have this many HID report buffers
        REPT_BUFF_LEN   = 1024          ' HID reports can be quite large
        REPT_STRUCT_LEN = REPT_BUFF_LEN + 2 ' Struct is wLength, bData[REPT_BUFF_LEN]
        LANG_BUFF_LEN   = 128           ' LangID array buffer (in bytes)
        USTR_BUFF_LEN   = 128           ' Unicode string buffer (in bytes)
'------------------------------------------------------------------------------
' USB-IF defined language IDs (http://www.usb.org/developers/docs.html)
'------------------------------------------------------------------------------
        LANG_ENG_US  = $0409            ' English (United States)
        LOCAL_LANGID = LANG_ENG_US      ' Set your default langID here
'------------------------------------------------------------------------------
' SETUP structure member offsets.
' NOTE: These offsets are defined in terms of the structure member's data type,
'       to take advantage of PTRA/B scaled indexing, e.g.:
'         RDBYTE D,   PTRA[bRequest]
'         WRWORD D/#, PTRA[wLength]
'------------------------------------------------------------------------------
        bmRequestType = 0
        bRequest      = 1
        wValue        = 1
        wIndex        = 2
        wLength       = 3
' SETUP bmRequestType combinations:
{
        HTD_STD_DEV = (DIR_HOST_TO_DEV | TYPE_STANDARD | RECIP_DEVICE)
        DTH_STD_DEV = (DIR_DEV_TO_HOST | TYPE_STANDARD | RECIP_DEVICE)
        HTD_STD_INT = (DIR_HOST_TO_DEV | TYPE_STANDARD | RECIP_INTERFACE)
        HTD_STD_EP  = (DIR_HOST_TO_DEV | TYPE_STANDARD | RECIP_ENDPOINT)
}
'------------------------------------------------------------------------------
' Standard USB descriptor structure sizes in bytes. The values defined are the
' minimum size of the descriptor:
'------------------------------------------------------------------------------
        SETUP_TXN_LEN = 8
        DEV_DESC_LEN  = 18
        CON_DESC_LEN  = 9
        INTF_DESC_LEN = 9
        ENDP_DESC_LEN = 7
        STR0_DESC_LEN = 4
        USTR_DESC_LEN = 4
'------------------------------------------------------------------------------
' Other USB-related buffer sizes:
'------------------------------------------------------------------------------
        URX_BUFF_LEN = 128      ' USB receiver scratch buffer
        CON_BUFF_LEN = 256      ' Entire configuration descriptor chain
'------------------------------------------------------------------------------
' CON_bmAttrs member bit positions:
'------------------------------------------------------------------------------
        ATTR_RESVB     = 7      ' Reserved (should always be one)
        ATTR_SELF_PWRB = 6      ' Device Self-Powered
        ATTR_RMT_WAKEB = 5      ' Supports remote wakeup
'       bmAttributes bits 4..0 reserved and A_reset to zero
'------------------------------------------------------------------------------
' Standard USB descriptor struct member offset and member size, in bytes. Note
' that the DESC_bLength and DESC_bDescType members are defined in all of the
' descriptors (including HID) at the offsets shown.
'------------------+
' !!! IMPORTANT !!!|
'------------------+
' All standard descriptor member offsets are defined in bytes, so if you want
' to use PTRA/B indexing for WORD or LONG data, the unscaled PTRx[##index20]
' syntax should be used and the compiler will invoke AUGS with RDxxxx/WRxxxx,
' e.g.: RDBYTE D,   PTRA[DEV_bMaxPktSize0] is OK when it's a byte member
'       WRWORD D/#, PTRA[##DEV_bIdProduct] use unscaled if member is word/long.
' If PTRA/B unscaled indexing is used with pre/post increment/decrement, one
' must be very careful...
'------------------------------------------------------------------------------
'       Member          Offset  Size    Value           Description
'------------------------------------------------------------------------------
        DESC_bLength     = 0    ' 1     Number          Minimum size of this descriptor in bytes
        DESC_bDescType   = 1    ' 1     Constant        TYPE_DEVICE
' Device Descriptor (Section 9.6.1, Table 9-8):
        DEV_bcdUSB       = 2    ' 2     BCD             e.g., 2.10 is $0210
        DEV_bDevClass    = 4    ' 1     Class           Class code assigned by USB-IF.
        DEV_bDevSubClass = 5    ' 1     SubClass        SubClass Code assigned by USB-IF.
        DEV_bProtocol    = 6    ' 1     Protocol        Protocol Code assigned by USB-IF.
        DEV_bMaxPktSize0 = 7    ' 1     Number          Max packet size for endpoint 0. Must be 8 for LS, 16, 32 or 64 for FS.
        DEV_idVendor     = 8    ' 2     ID              Vendor ID - must be obtained from USB-IF.
        DEV_idProduct    = 10   ' 2     ID              PRoduct ID - must be obtained from USB-IF.
        DEV_bcdDevice    = 12   ' 2     BCD             Device release number in BCD.
        DEV_iMfg         = 14   ' 1     Index           Index of string descriptor describing manufacturer - set to zero if no string.
        DEV_iProduct     = 15   ' 1     Index           Index of string descriptor describing product - set to zero if no string.
        DEV_iSerialNum   = 16   ' 1     Index           Index of string descriptor describing device serial number - set to zero if no string.
        DEV_iNumConfigs  = 17   ' 1     Number          Number of possible configurations.
' Configuration Descriptor (Section 9.6.3, Table 9-10):
'       DESC_bLength     = 0    ' 1     Number          Minimum size of the descriptor, in bytes
'       DESC_bDescType   = 1    ' 1     Constant        TYPE_CONFIG
        CON_wTotalLen    = 2    ' 2     Number          See Section 9.6.3, Table 9-10.
        CON_bNumIntf     = 4    ' 1     Number          Number of interfaces supported by this configuration.
        CON_bConfigVal   = 5    ' 1     Number          Value to use as an argument to the SetConfiguration() request to select this configuration.
        CON_iConfig      = 6    ' 1     Index           Index of string descriptor describing this configuration.
        CON_bmAttrs      = 7    ' 1     Bitmap          See Table 9-10.
        CON_bMaxPower    = 8    ' 1     mA              Expressed in 2MA units (i.e. 50 = 100 mA)
' Interface Descriptor (Section 9.6.5, Table 9-12):
'       DESC_bLength     = 0    ' 1     Number          Minimum size of the descriptor, in bytes
'       DESC_bDescType   = 1    ' 1     Constant        TYPE_INTERFACE
        INTF_bIntfNum    = 2    ' 1     Number          See Table 9-12.
        INTF_bAltSetting = 3    ' 1     Number          Value used to select this alternate setting for the interface identified in the prior field.
        INTF_bNumEndpts  = 4    ' 1     Number          See Table 9-12.
        INTF_bIntfClass  = 5    ' 1     Class           Class code (assigned by USB-IF). If this field is 0xFF, the interface class is vendor-specific.
        INTF_bSubClass   = 6    ' 1     SubClass        Subclass code (assigned by USB-IF). These codes are qualified by the value of the
                                '                       bIntfClass field. If the bInterfaceClass field is not set to 0xFF, all values are
                                '                       reserved for assignment by the USB-IF.
        INTF_bProtocol   = 7    ' 1     Protocol        Protocol code (assigned by the USB). These codes are qualified by the value of the
                                '                       bIntfClass and the bSubClass fields. If this field is set to 0xFF, the device uses a
                                '                       vendor-specific protocol for this interface.
        INTF_iInterface  = 8    ' 1     Index           Index of string descriptor describing this interface.
' Endpoint Descriptor (Section 9.6.6, Table 9-13):
'       DESC_bLength     = 0    ' 1     Number          Minimum size of the descriptor, in bytes
'       DESC_bDescType   = 1    ' 1     Constant        TYPE_ENDPOINT
        ENDP_bAddress    = 2    ' 1     Endpoint        See table 9-13.
        ENDP_bmAttrs     = 3    ' 1     Bitmap
        ENDP_wMaxPktSize = 4    ' 2     Number
        ENDP_bInterval   = 6    ' 1     Number
' String Descriptor Zero (Section 9.6.7, Table 9-15):
'       DESC_bLength     = 0    ' 1     N + 2
'       DESC_bDescType   = 1    ' 1     Constant
        STR0_wLangID     = 2    ' N     LangID[(N - 2) / 2]
' Unicode String Descriptor (Section 9.6.7, Table 9-16):
'       DESC_bLength     = 0    ' 1     N + 2
'       DESC_bDescType   = 1    ' 1     Constant
        USTR_wString     = 2    ' N     wString[(N - 2) / 2]
' #region Descriptors required by this device class
'------------------------------------------------------------------------------
' HID Descriptor (Section 6.2.1)
'------------------------------------------------------------------------------
'       DESC_bLength     = 0    ' 1     Number          Minimum size of the descriptor, in bytes
'       DESC_bDescType   = 1    ' 1     Constant        TYPE_HID
        HID_bcdHID       = 2    ' 2     BCD             e.g., 1.10 is $0110
        HID_bCountryCode = 4    ' 1     Number          Hardware target country
        HID_bNumDesc     = 5    ' 1     Number          Number of HID class descriptors to follow, always at least one.
        HID_bDescType    = 6    ' 1     Constant        Type of HID class descriptor e.g. TYPE_REPORT ($22).
        HID_wDescLength  = 7    ' 2     Number          Total length of descriptor(s).
' Keyboard and mouse report data buffer lengths (boot protocol):
        KBD_OUT_RPT_LEN = 1     ' CapsLock, NumLock and ScrollLock status bits
        KBD_IN_RPT_LEN  = 8     ' Maximum keyboard boot protocol IN data packet size
        MOUSE_RPT_LEN   = 8     ' Maximum mouse boot protocol IN data packet size
'------------------------------------------------------------------------------
' #endregion Descriptors required by this device class
' #endregion Con (USB Descriptor Definitions)

' Catalina Init

DAT ' initialized data segment

   alignl
   orgh

' #region (USB Boot Protocol Mouse/Keyboard Hub Interface)
'------------------------------------------------------------------------------
' The mouse data must be treated as read-only by the client.
' Whenever the USB processes a mouse event, it will refresh the mouse x/y
' position/velocity and button data. The client must poll the USB_B_EVENT_REPO
' smart pin and read the updated data when the USB has posted the M_DATA event.
'-+----------+-----------+-----------+--------------+
' |  Byte3   |   Byte2   |   Byte1   |    Byte0     |
'-+----------+-----------+-----------+--------------+
' | Reserved | Y Dir/Vel | X Dir/Vel | Button Flags |
'-+----------+-----------+-----------+--------------+--------------------------
mouse_data      long    0
'------------------------------------------------------------------------------
' Keyboard FIFO buffer.
'------------------------------------------------------------------------------
kbd_tail        long    0       ' Client read/write, USB read-only
kbd_head        long    0       ' USB read/write, client read-only
kbd_buffer      long    -1[KBD_BUFFMASK + 1]
'------------------------------------------------------------------------------
kbd_table
' original table ...
' {$00} word KEY_NO_KEY, KEY_ERR_ROLLOVER, KEY_POST_FAIL, KEY_ERR_UNDEF ' $03
' {$04} word $4161, $4262, $4363, $4464                                 ' $07: Aa Bb Cc Dd
' {$08} word $4565, $4666, $4767, $4868, $4969, $4A6A, $4B6B, $4C6C     ' $0f: Ee Ff Gg Hh Ii Jj Kk Ll
' {$10} word $4D6D, $4E6E, $4F6F, $5070, $5171, $5272, $5373, $5474     ' $17: Mm Nn Oo Pp Qq Rr Ss Tt
' {$18} word $5575, $5676, $5777, $5878, $5979, $5A7A, $2131, $4032     ' $1f: Uu Vv Ww Xx Yy Zz !1 @2
' {$20} word $2333, $2434, $2535, $5E36, $2637, $2A38, $2839, $2930     ' $27: #3 $4 %5 ^6 &7 *8 (9 )0
' {$28} word $0D0D, $1B1B, $0808, $0909, $2020, $5F2D, $2B3D, $7B5B     ' $2f: Enter Esc BkSpc Tab Spc _- += {[
' {$30} word $7D5D, $7C5C, $7E23, $3A3B, $2227, $7E60, $3C2C, $3E2E     ' $37: }] |\ ~# :; ""' ~` <, >.
' {$38} word $3F2F, $3939, $3A3A, $3B3B, $3C3C, $3D3D, $3E3E, $3F3F     ' $3f: ?/ CapsLock F1 F2 F3 F4 F5 F6
' {$40} word $4040, $4141, $4242, $4343, $4444, $4545, $4646, $4747     ' $47: F7 F8 F9 F10 F11 F12 PrtSc, ScrLk
' {$48} word $4848, $4949, $4A4A, $4B4B, $087F, $4D4D, $4E4E, $4F4F     ' $4f: Pause, Ins, Home PgUp BkSpc_Del End PgDn Right
' {$50} word $5050, $5151, $5252, $5353, $2F2F, $2A2A, $2D2D, $2B2B     ' $57: Left Down Up KpdNumLck Kp/ Kp* Kp- Kp+
' {$58} word $0D0D, $3131, $3232, $3333, $5034, $3535, $3636, $3737     ' $5f: KpEnter Kp1_End Kp2_Down Kp3_PgDn Kp4_Left Kp5 Kp6_Right Kp7_Home
' {$60} word $3838, $3939, $3030, $7F2E, $5C7C, $6565                   ' $65: Kp8_Up Kp9_PgUp Kp0_Ins Kp._Del Kp\_| App
' P1 compatible key codes for non-ASCII keys (i.e. Parallax key codes)
{$00} word KEY_NO_KEY, KEY_ERR_ROLLOVER, KEY_POST_FAIL, KEY_ERR_UNDEF ' $03
{$04} word $4161, $4262, $4363, $4464                                 ' $07: Aa Bb Cc Dd
{$08} word $4565, $4666, $4767, $4868, $4969, $4A6A, $4B6B, $4C6C     ' $0f: Ee Ff Gg Hh Ii Jj Kk Ll
{$10} word $4D6D, $4E6E, $4F6F, $5070, $5171, $5272, $5373, $5474     ' $17: Mm Nn Oo Pp Qq Rr Ss Tt
{$18} word $5575, $5676, $5777, $5878, $5979, $5A7A, $2131, $4032     ' $1f: Uu Vv Ww Xx Yy Zz !1 @2
{$20} word $2333, $2434, $2535, $5E36, $2637, $2A38, $2839, $2930     ' $27: #3 $4 %5 ^6 &7 *8 (9 )0
{$28} word $0D0D, $1B1B, $0808, $0909, $2020, $5F2D, $2B3D, $7B5B     ' $2f: Enter Esc BkSpc Tab Spc _- += {[
{$30} word $7D5D, $7C5C, $7E23, $3A3B, $2227, $7E60, $3C2C, $3E2E     ' $37: }] |\ ~# :; ""' ~` <, >.
{$38} word $3F2F, $3939, $D0D0, $D1D1, $D2D2, $D3D3, $D4D4, $D5D5     ' $3f: ?/ CapsLock F1 F2 F3 F4 F5 F6
{$40} word $D6D6, $D7D7, $D8D8, $D9D9, $DADA, $DBDB, $DCDC, $DDDD     ' $47: F7 F8 F9 F10 F11 F12 PrtSc, ScrLk
{$48} word $4848, $CACA, $C4C4, $C6C6, $08C9, $C5C5, $C7C7, $C1C1     ' $4f: Pause, Ins, Home PgUp BkSpc_Del End PgDn Right
{$50} word $C0C0, $C3C3, $C2C2, $5353, $EFEF, $EEEE, $EDED, $ECEC     ' $57: Left Down Up KpdNumLck Kp/ Kp* Kp- Kp+
{$58} word $EBEB, $E1E1, $E2E2, $E3E3, $E4E4, $E5E5, $E6E6, $E7E7     ' $5f: KpEnter Kp1_End Kp2_Down Kp3_PgDn Kp4_Left Kp5 Kp6_Right Kp7_Home
{$60} word $E8E8, $E9E9, $E0E0, $EAEA, $5C7C, $CCCC                   ' $65: Kp8_Up Kp9_PgUp Kp0_Ins Kp._Del Kp\_| App

' #endregion (USB Boot Protocol Mouse/Keyboard Hub Interface)
   orgh
   alignl

{ MIT License
+----------------------------------------------------------------------------------------------------------------------+
|                                             TERMS OF USE: MIT License                                                |
+----------------------------------------------------------------------------------------------------------------------+
|Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated          |
|documentation files (the "Software"), to deal in the Software without restriction, including without limitation the   |
|rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit|
|persons to whom the Software is furnished to do so, subject to the following conditions:                              |
|                                                                                                                      |
|The above copyright notice and this permission notice shall be included in all copies or substantial portions of the  |
|Software.                                                                                                             |
|                                                                                                                      |
|THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE  |
|WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR |
|COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR      |
|OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.      |
+----------------------------------------------------------------------------------------------------------------------+
}
