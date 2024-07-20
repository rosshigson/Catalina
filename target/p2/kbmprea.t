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

' Catalina Code

DAT ' code segment

' #region (USB hub execution)
                orgh
                alignl
'' A_hparse_con_desc
'------------------------------------------------------------------------------
' Parse a configuration descriptor chain to see if the device is a recognized
' one. If it is, start the task progression that will configure the device for
' use.
'------------------------------------------------------------------------------
' On entry:
'   A_hconfig_base - start address of the cached config descriptor chain.
' On exit:
'------------------------------------------------------------------------------
A_hparse_con_desc
                call    #A_init_kbdm_data                 ' Reset keyboard/mouse data area to start-up values
                mov     pa, #CON_wTotalLen
                add     pa, A_hconfig_base
                rdword  A_hcon_tot_len, pa                ' Keep config chain size handy
' Search the configuration descriptor for the Class/Subclass/Protocol "triad"
' that defines a keyboard and/or mouse.
                rdbyte  A_hnext_desc, A_hconfig_base        ' Config desc size is offset to first desc in chain
.next_intf
                mov     A_hsearch_key, #TYPE_INTERFACE
                call    #A_hsearch_desc_type
                cmp     ptrb, #0                wz
        if_z    jmp     #A_hA_set_config                    ' No more interface descs
                rdbyte  A_htmp, ptrb
                add     A_hnext_desc, A_htmp                ' Get offset to next desc, if any
                rdbyte  A_hhid_intf_idx, ptrb[INTF_bIntfNum]
                rdbyte  A_htmp, ptrb[INTF_bIntfClass]
                cmp     A_htmp, #CLASS_HID        wz      ' Only interested in the HID class interface descriptors
        if_nz   jmp     #.next_intf                     ' Search next interface in chain, if any
                rdbyte  A_htmp, ptrb[INTF_bSubClass]      ' Look for a boot interface sub-class
                cmp     A_htmp, #SUBCLASS_INTF_BOOT wz
        if_nz   jmp     #.next_intf
                rdbyte  A_hr3, ptrb[INTF_bProtocol] wz    ' Protocol must be non-zero
        if_z    jmp     #.next_intf
.endp
                mov     A_hsave1, ptrb
                mov     A_hsave2, A_hnext_desc
                mov     A_hsearch_key, #TYPE_ENDPOINT
                call    #A_hsearch_desc_type              ' Endpoint descs always follow interface descs
                cmp     ptrb, #0                wz
        if_nz   jmp     #.get_ep
.bad_ep
                mov     A_hnext_desc, A_hsave2
                mov     ptrb, A_hsave1
                jmp     #.next_intf
.get_ep
                rdbyte  A_hr1, ptrb[ENDP_bAddress]
                testb   A_hr1, #7                 wc      ' FIXME: define constant for endpoint IN/OUT bit
        if_nc   jmp     #.bad_ep                        ' Not an IN endpoint
                shl     A_hr1, #8 + 7
                add     ptrb, #ENDP_wMaxPktSize
                rdword  A_hr2, ptrb++
                and     A_hr2, ##$7ff                     ' Bits 10..0 define the max packet size
                rdbyte  A_hr0, ptrb                       ' Fetch the bInterval member (min poll interval, in milliseconds)
                mov     A_hnext_desc, A_hsave2
                mov     ptrb, A_hsave1
                cmp     A_hr3, #INTF_PROTO_KBD    wz
        if_nz   jmp     #.mouse
.keyboard
                loc     ptra, #@A_kbd_intf_num
                wrbyte  A_hhid_intf_idx, ptra++            ' Save interface index and poll interval values
                wrbyte  A_hr0, ptra++
                mov     A_hkbd_ep_addr, A_hctrl_ep_addr
                and     A_hkbd_ep_addr, ##ADDR_MASK
                or      A_hkbd_ep_addr, A_hr1                ' IN endpoint address
                wrbyte  A_hr2, ptra
                jmp     #.next_intf                     ' See if there's a mouse subclass
.mouse
                cmp     A_hr3, #INTF_PROTO_MOUSE  wz
        if_nz   jmp     #.next_intf
                loc     ptra, #@A_mouse_intf_num
                wrbyte  A_hhid_intf_idx, ptra++            ' Save interface index and poll interval values
                wrbyte  A_hr0, ptra++
                mov     A_hmouse_ep_addr, A_hctrl_ep_addr
                and     A_hmouse_ep_addr, ##ADDR_MASK
                or      A_hmouse_ep_addr, A_hr1              ' IN endpoint address
                wrbyte  A_hr2, ptra
                jmp     #.next_intf                     ' See if there's a keyboard protocol
''
'' A_hsearch_desc_type
'------------------------------------------------------------------------------
' Search the configuration descriptor chain for a specific descriptor type.
'------------------------------------------------------------------------------
' On entry:
'   con_tot_len - total length of the config descriptor chain.
'   next_desc - offset from the configuration descriptor to start the search.
'     It is assumed that the offset will point to the start of a USB standard
'     descriptor.
'   search_key - descriptor type to match.
' On exit:
'   PTRB - if a match is found, the descriptor start address, otherwise zero.
'   next_desc - descriptor offset if found, otherwise unchanged.
'------------------------------------------------------------------------------
A_hsearch_desc_type
                mov     A_hsave0, A_hnext_desc
.next
                cmp     A_hnext_desc, A_hcon_tot_len  wcz
        if_ae   mov     ptrb, #0
        if_ae   mov     A_hnext_desc, A_hsave0
        if_ae   ret
                mov     ptrb, A_hconfig_base
                add     ptrb, A_hnext_desc
                rdbyte  A_htmp, ptrb[DESC_bDescType]
                cmp     A_htmp, A_hsearch_key        wz
        if_z    ret
                rdbyte  A_htmp, ptrb
                add     A_hnext_desc, A_htmp                 ' Get offset of next desc to check
                jmp     #.next
''
'' A_hA_set_config
'------------------------------------------------------------------------------
' If a newly-connected device is recognized, do whatever is needed to configure
' it according to its function, or functions. In the case of this boot protocol
' keyboard/mouse class driver:
' - SetConfiguration(config_num)
' - SetProtocol(boot)
' - SetIdle(indefinite)
' - Enter the device interrupt IN polling task stage.
'------------------------------------------------------------------------------
' On entry:
' On exit:
'------------------------------------------------------------------------------
A_hA_set_config
'                mov     A_hkbd_ep_addr, #0                ' DEBUG
'                mov     A_hmouse_ep_addr, #0              ' DEBUG
                mov     A_htmp2, #DEV_UNKNOWN
                cmp     A_hkbd_ep_addr, #0        wz
        if_z    cmp     A_hmouse_ep_addr, #0      wz
        if_z    jmp     #.notify_client                 ' No boot keyboard or mouse interface
.A_set_config
                loc     ptra, #@A_set_config
                mov     pa, #CON_bConfigVal             ' Get configuration value to set (always the default config in our case)
                add     pa, A_hconfig_base
                rdbyte  A_hpar1, pa
                wrword  A_hpar1, ptra[wValue]             ' Write the config value to the config SETUP struct
                mov     A_ep_addr_pid, A_hctrl_ep_addr      ' All configuration transactions use the control endpoint
                mov     pb, #0                          ' SetConfiguration() has no data stage
                call    #A_control_write
                cmp     A_retval, #PID_ACK        wz
        if_nz   ret
.kbd_config
                cmp     A_hkbd_ep_addr, #0        wz
        if_z    jmp     #.mouse_config                  ' No keyboard, so setup the mouse, if detected
                rdbyte  A_htmp, ##A_kbd_intf_num
                loc     ptra, #@A_set_protocol
                wrword  #BOOT_PROTOCOL, ptra[wValue]
                wrword  A_htmp, ptra[wIndex]
                mov     pb, #0                          ' SetProtocol() has no data stage
                call    #A_control_write
                cmp     A_retval, #PID_ACK        wz
        if_nz   mov     A_hkbd_ep_addr, #0
        if_nz   jmp     #.mouse_config
                mov     A_hpar1, #0                       ' SetIdle() duration 0 = indefinite
                rdbyte  A_hpar2, ##A_kbd_intf_num
                call    #A_hA_set_idle
                cmp     A_retval, #PID_ACK        wz
        if_nz   mov     A_hkbd_ep_addr, #0
        if_nz   jmp     #.mouse_config
                mov     A_hctwait, ##_1ms * 2
                call    #poll_waitx
                call    #A_hset_kbdled_report
                cmp     A_retval, #PID_ACK        wz
        if_nz   mov     A_hkbd_ep_addr, #0
        if_nz   jmp     #.mouse_config
                wrbyte  #KEY_NO_KEY, ##A_kbd_last_key
                mov     A_ep_addr_pid, A_hkbd_ep_addr
                call    #A_calc_crc5                      ' One-time calculation of the ep/addr/pid crc
                mov     A_hkbd_ep_addr, A_ep_addr_pid
                mov     A_ep_addr_pid, A_hctrl_ep_addr      ' Restore the control ep addr for mouse configuration
                mov     A_hkbd_poll_cnt, #0               ' Initialize key auto-repeat counters
                mov     A_hkbd_repeat, ##KBD_REPEAT_DELAY
                mov     A_poll_target, #A_poll_kbd
                mov     A_htmp2, #KB_READY                ' Keyboard interface configured
                getct   A_hct3
                addct3  A_hct3, ##KBD_POLL_INTERVAL       ' Wait an interval before the first IN poll
.mouse_config
                cmp     A_hmouse_ep_addr, #0       wz
        if_z    jmp     #.notify_client                 ' Notify the client that a keyboard interface was configured
                rdbyte  A_htmp, ##A_mouse_intf_num
                loc     ptra, #@A_set_protocol
                wrword  #BOOT_PROTOCOL, ptra[wValue]
                wrword  A_htmp, ptra[wIndex]
                mov     pb, #0                          ' SetProtocol() has no data stage
                call    #A_control_write
                cmp     A_retval, #PID_ACK        wz
        if_nz   mov     A_hmouse_ep_addr, #0
        if_nz   ret
                cmp     A_hkbd_ep_addr, #0        wz      ' A SetIdle() duration of indefinite covers both keyboard and mouse
        if_nz   jmp     #.mouse_timer                   ' So skip if it has already been done
                mov     A_hpar1, #0                       ' SetIdle() duration 0 = indefinite
                rdbyte  A_hpar2, ##A_mouse_intf_num
                call    #A_hA_set_idle
                cmp     A_retval, #PID_ACK        wz
        if_nz   mov     A_hmouse_ep_addr, #0
        if_nz   ret
.mouse_timer
                mov     A_ep_addr_pid, A_hmouse_ep_addr
                call    #A_calc_crc5                      ' One-time calculation of the ep/addr/pid crc
                mov     A_hmouse_ep_addr, A_ep_addr_pid
                cmp     A_hkbd_ep_addr, #0         wz
        if_nz   mov     A_htmp2, #KBM_READY               ' Both keyboard and mouse interfaces were configured
        if_z    mov     A_htmp2, #M_READY                 ' Only the mouse interface configured
        if_z    mov     A_poll_target, #A_poll_mouse
        if_z    getct   A_hct3
        if_z    addct3  A_hct3, ##MOUSE_POLL_INTERVAL     ' Set first poll interval
.notify_client
        _ret_   wxpin   A_htmp2, #USB_A_EVENT_REPO          ' Notify the client keyboard and/or mouse configured
''
'' A_init_kbdm_data
'------------------------------------------------------------------------------
' Initialize the keyboard/mouse data area to start-up values.
'------------------------------------------------------------------------------
' On entry:
' On exit:
'------------------------------------------------------------------------------
A_init_kbdm_data
                mov     A_hkbd_ep_addr, #0
                mov     A_hmouse_ep_addr, #0
                loc     ptra, #@A_kbd_mouse_start
                loc     pa, #@A_kbd_mouse_end
.loop
                wrbyte  #0, ptra++
                cmp     ptra, pa                wz
        if_nz   jmp     #.loop
                wrbyte  #PID_DATA0, ##A_kbd_next_datax    ' Reset interrupt IN datax sequence
        _ret_   wrbyte  #PID_DATA0, ##A_mouse_next_datax
''
'' A_hA_set_idle
'------------------------------------------------------------------------------
' Execute a ControlWrite() that will perform the HID-specific HID_SET_IDLE
' function.
'------------------------------------------------------------------------------
' On entry:
'   A_hpar1 - Byte1 duration, byte0 reportID (HID 1.11, section 7.2.4).
'   A_hpar2 - index number of the target interface.
' On exit:
'------------------------------------------------------------------------------
A_hA_set_idle
                mov     A_hctwait, ##_1ms * 2
                call    #poll_waitx
                loc     ptra, #@A_set_idle
                wrword  A_hpar1, ptra[wValue]
                wrword  A_hpar2, ptra[wIndex]
                jmp     #A_control_write
''
'' A_hset_kbdled_report
'------------------------------------------------------------------------------
' Execute a ControlWrite() that will perform the HID-specific HID_SET_REPORT
' function to set keyboard CapsLk, ScrLk and NumLk indicators.
'------------------------------------------------------------------------------
' On entry:
'   A_ep_addr_pid - device address and enpoint for the request.
' On exit:
'   A_retval - transaction result.
'------------------------------------------------------------------------------
A_hset_kbdled_report
                loc     ptra, #@A_set_report
                rdbyte  A_htmp, ##A_kbd_intf_num
                wrword  ##(TYPE_OUTPUT << 8), ptra[wValue] ' Byte1 report type, byte0 reportID (0)
                wrword  A_htmp, ptra[wIndex]
                wrword  #KBD_OUT_RPT_LEN, ptra[wLength]
                loc     pb, #@A_kbd_led_states            ' Start address of OUT data
                jmp     #A_control_write                  ' Execute ControlWrite(SET_REPORT) and back to caller
''
'' A_hget_kbd_in_report
'------------------------------------------------------------------------------
' Execute an IN interrupt transaction to poll for keyboard activity.
'------------------------------------------------------------------------------
' On entry:
' On exit:
'------------------------------------------------------------------------------
A_hget_kbd_in_report
                mov     A_ep_addr_pid, A_hkbd_ep_addr
                mov     A_hpar2, ##A_kbd_cur_report
                rdbyte  A_htmp, ##A_kbd_in_max_pkt          ' Always ask for max report size
                rdbyte  A_hpar3, ##A_kbd_next_datax
                setword A_hpar3, A_htmp, #1                 ' Max IN packet size to expect
                call    #A_do_int_in
                cmp     A_retval, #PID_ACK        wz
        if_z    jmp     #.data
                cmp     A_retval, #PID_NAK        wz
        if_nz   jmp     #A_host_error                     ' Something other than ACK/NAK, so likely fatal
' The NAK count is used to determine when key auto-repeat kicks in.
                add     A_hkbd_poll_cnt, #1
                cmp     A_hkbd_poll_cnt, A_hkbd_repeat wcz
        if_b    ret                                     ' No auto-repeat action
                cmp     A_hkbd_poll_cnt, ##KBD_REPEAT_DELAY wz
        if_z    drvnot  #HOST_A_ACTIVE_LED                ' Show keypress activity on the user LED
                rdbyte  A_hpar1, ##A_kbd_last_key           ' Peek at the last key-down scancode
                cmp     A_hpar1, #KEY_CAPSLK      wz
        if_z    mov     A_hpar1, #KEY_NO_KEY
                cmp     A_hpar1, #KEY_NO_KEY      wz
        if_z    mov     A_hkbd_repeat, ##KBD_REPEAT_DELAY ' Key repeat delay reset on KEY_NO_KEY
        if_z    mov     A_hkbd_poll_cnt, #0
        if_z    ret
                add     A_hkbd_repeat, ##KBD_REPEAT_RATE  ' Set the next repeat interval
                call    #A_repeat_key                     ' Repeat the key being held down and return to caller
        _ret_   wxpin   #KBD_KEY_UPDATE, #USB_A_EVENT_REPO ' Notify client of toggle key state change
.data
                cmp     A_hpar3, #0               wz
        if_z    ret                                     ' Ignore an empty DATAx packet
                drvnot  #HOST_A_ACTIVE_LED                ' Show keypress activity on the user LED
                rdbyte  A_hpar1, ##A_kbd_next_datax
                cmp     A_hpar1, #PID_DATA0       wz
        if_z    mov     A_hpar1, #PID_DATA1               ' Txn success, so toggle DATAx
        if_nz   mov     A_hpar1, #PID_DATA0
                wrbyte  A_hpar1, ##A_kbd_next_datax
                wrbyte  A_hpar3, ##A_kbd_max_index          ' Save actual bytes read
                call    #A_hkbd_compare                   ' Check keypress activity since last IN
.led_check
                rdbyte  A_htmp, ##A_kbd_led_states
                cmp     A_hkbd_ledstates, A_htmp    wz
        if_z    ret                                     ' No toggle key indicator changes, so we're done
                wrbyte  A_hkbd_ledstates, ##A_kbd_led_states' Update toggle key indicator states
                mov     A_ep_addr_pid, A_hctrl_ep_addr
                call    #A_hset_kbdled_report
                cmp     A_retval, #PID_ACK        wz
        if_nz   jmp     #A_host_error                     ' FIXME: on !ACK try to recover instead of fatal error
        _ret_   wxpin   #KBD_TGL_UPDATE, #USB_A_EVENT_REPO ' Notify client of toggle key state change
''
'' A_hkbd_compare
'------------------------------------------------------------------------------
' Compare current and previous keyboard data buffers for keypress changes.
'------------------------------------------------------------------------------
' On entry:
' On exit:
'   A_hpar1 - scancode of the last key in the down state, otherwise zero
'     (KEY_NO_KEY) if no keys were in the down state.
'   A_hkbd_modkeys - the current (possibly changed) modifier key states.
'------------------------------------------------------------------------------
A_hkbd_compare
                mov     A_hrep, #0                        ' Keep track of new key(s) pressed
                mov     A_hpar3, #KEY_NO_KEY
                loc     ptrb, #@A_kbd_cur_report + 2      ' Start of scancode array
                rdbyte  A_hpar1, ptrb++                   ' First array byte tells us if no keys down or keyboard error
                cmp     A_hpar1, #KEY_ERR_UNDEF   wcz     ' First four key values in lookup table are "special" scancodes
        if_a    jmp     #.get_keys                      ' Process normal scancode
                cmp     A_hpar1, #KEY_NO_KEY      wz
        if_z    jmp     #.end_keys                      ' No key activity or key up event, so commit current to previous
                loc     ptra, #@A_kbd_prev_report         ' Keyboard rollover overflow or other error
                loc     pb, #@A_kbd_cur_report
                mov     A_hr0, #KBD_IN_RPT_LEN            ' This data can't be used for compare purposes in the future
                jmp     #A_hmemcpy                        ' So make the previous data the current data and return to caller
' Walk the scancode array looking for pressed keys
.get_keys
                rdbyte  A_hr0, ##A_kbd_max_index
                mov     A_hr3, A_hr0
                add     A_hr3, ##A_kbd_cur_report           ' Last scancode array element
.next_key
                cmp     A_hpar1, #KEY_NO_KEY      wz
        if_z    jmp     #.end_keys                      ' No more pressed keys in the current report
                call    #A_check_key                      ' Process this scancode
                cmp     ptrb, A_hr3               wz      ' Check for array end
        if_nz   rdbyte  A_hpar1, ptrb++
        if_nz   jmp     #.next_key
.end_keys
                rdbyte  A_htmp, ##A_kbd_last_key
                cmp     A_hpar3, A_htmp             wz
        if_nz   mov     A_hkbd_repeat, ##KBD_REPEAT_DELAY  ' Scancode was different than last,
        if_nz   mov     A_hkbd_poll_cnt, #0                ' so reset auto-repeat
        if_nz   wrbyte  A_hpar3, ##A_kbd_last_key
.end
                loc     ptra, #@A_kbd_cur_report          ' Done processing current IN report
                loc     pb, #@A_kbd_prev_report
                mov     A_hr0, #KBD_IN_RPT_LEN
                call    #A_hmemcpy                        ' So it becomes the previous report for future compare
                cmp     A_hrep, #0                wz
        if_nz   wxpin   #KBD_KEY_UPDATE, #USB_A_EVENT_REPO ' Signal the client that keyboard status has changed
                ret
''
'' A_check_key (boot protocol specific)
'------------------------------------------------------------------------------
' See if the given scancode exists in the previously read keyboard data. If
' found it means the key is still pressed and can be ignored. If not found it's
' a new keypress to process.
'------------------------------------------------------------------------------
' On entry:
'   A_hr0 - Count of total keyboard data bytes.
'   A_hpar1 - scancode to check.
'   A_hkbd_ledstates - current CapsLock, NumLock and ScrollLock bitflags.
' On exit:
'   A_hpar1 - input scancode if matched (still in the down state), otherwise the
'     scancode of the newly pressed key.
'   A_hkbd_ledstates - possibly modified toggle key state.
'   A_hpar3 - scancode of the last key found in the down state.
'------------------------------------------------------------------------------
A_check_key
                loc     ptra, #@A_kbd_prev_report + 2
                mov     A_hr1, ##A_kbd_prev_report
                add     A_hr1, A_hr0                        ' Last scancode array element
.loop
                rdbyte  A_htmp, ptra++
                cmp     A_htmp, A_hpar1             wz
        if_z    mov     A_hpar3, A_hpar1
        if_z    ret                                     ' Key still in down state, so done with this key
                cmp     ptra, A_hr1               wz
        if_nz   jmp     #.loop
' The previous key report has been searched and no match found, so this is a
' newly-pressed key. Now look for toggle key changes.
                mov     A_hkbd_scancode, A_hpar1            ' Save new scancode
                mov     A_htmp, A_hkbd_ledstates
                cmp     A_hpar1, #KEY_CAPSLK      wz
        if_z    bitnot  A_htmp, #LED_CAPSLKB
                cmp     A_hpar1, #KEY_SCRLK       wz
        if_z    bitnot  A_htmp, #LED_SCRLKB
                cmp     A_hpar1, #KEY_NUMLK       wz
        if_z    bitnot  A_htmp, #LED_NUMLKB
                cmp     A_htmp, A_hkbd_ledstates    wz
        if_nz   mov     A_hkbd_ledstates, A_htmp
        if_nz   mov     A_hpar3, #KEY_NO_KEY              ' Toggle key pressed cancels auto-repeat
        if_nz   ret                                     ' Done if toggle key processed
' Fall through with new keypress scancode
' vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
''
'' A_buffer_key
'------------------------------------------------------------------------------
' Process a newly-pressed key using the scancode table in hub. The keypress
' data is packed into a single long and written to a FIFO circular buffer.
' There is no check for buffer overflow.
'-+-------------------+---------------+----------+-------------+
' |       Byte3       |     Byte2     |   Byte1  |    Byte0    |
'-+-------------------+---------------+----------+-------------+
' | Toggle Key States | Modkey States | Scancode | ASCII Value |
'-+-------------------+---------------+----------+-------------+
' On entry:
'   A_hpar1 - the scancode of the key to process.
' On exit:
'   A_hrep - count of new keys in the scancode array
'   A_hpar2 = one of KBD_KEY_UPDATE, KBDBUFF_FULL
'   A_hpar3 - the scancode of the last-pressed key.
'------------------------------------------------------------------------------
A_buffer_key
                mov     A_hpar3, A_hpar1                    ' Save scancode for auto-repeat evaluation
                loc     ptra, #\@kbd_table
                shl     A_hpar1, #1                       ' Scancode table elements are word
                add     ptra, A_hpar1
                rdword  A_hpar2, ptra                     ' Lookup ASCII character pair (byte1 shifted, byte0 un-shifted)
                shr     A_hpar1, #1                       ' Restore scancode
                rdbyte  A_hkbd_modkeys, ##A_kbd_cur_report  ' Key array zero is shift/alt/ctrl/gui modifier bits
                testb   A_hkbd_ledstates, #LED_CAPSLKB wc
        if_nc   jmp     #.chk_shift                     ' CapsLock not active, so we can evaluate shift now
' Active CapsLock key only affects the alpha keys
' All modkeys other than SHIFT are left up to the client to handle
                cmp     A_hpar1, #KEY_Z_z         wcz     ' The first valid scancode is KEY_A_a
        if_a    jmp     #.chk_shift                     ' So if it's above KEY_Z_z it's not an alpha key
                test    A_hkbd_modkeys, #KEY_SHIFTMOD wz
        if_nz   getbyte A_hkbd_keypress, A_hpar2, #0        ' CapsLock AND Shift is lowercase alpha
        if_z    getbyte A_hkbd_keypress, A_hpar2, #1
                jmp     #.out_key
.chk_shift
                test    A_hkbd_modkeys, #KEY_SHIFTMOD wz  ' Determine upper/lower case ASCII character to send
        if_z    getbyte A_hkbd_keypress, A_hpar2, #0
        if_nz   getbyte A_hkbd_keypress, A_hpar2, #1
.out_key
' Add the newly pressed key data to the FIFO circular buffer
                setbyte A_hkbd_keypress, A_hkbd_ledstates, #3
                setbyte A_hkbd_keypress, A_hkbd_modkeys, #2
                setbyte A_hkbd_keypress, A_hpar1, #1
A_repeat_key
                loc     pa, #@kbd_buffer
                loc     pb, #@kbd_head
                rdlong  A_htmp, pb
                shl     A_htmp, #2
                add     pa, A_htmp
                wrlong  A_hkbd_keypress, pa               ' New data to buffer
                shr     A_htmp, #2
                add     A_hrep, #1
                incmod  A_htmp, #KBD_BUFFMASK             ' Advance head
        _ret_   wrlong  A_htmp, pb                        ' and save it
''
'' A_hget_mouse_in_report
'------------------------------------------------------------------------------
' Execute an IN interrupt transaction to poll for mouse activity. If new mouse
' data is present, the button flags and X/Y direction/velocity values are
' packed into a single long and written to a FIFO circular buffer. There is no
' check for buffer overflow.
'-+----------+-----------+-----------+--------------+
' |  Byte3   |   Byte2   |   Byte1   |    Byte0     |
'-+----------+-----------+-----------+--------------+
' | Reserved | Y Dir/Vel | X Dir/Vel | Button Flags |
'-+----------+-----------+-----------+--------------+--------------------------
' On entry:
' On exit:
'------------------------------------------------------------------------------
A_hget_mouse_in_report
                mov     A_ep_addr_pid, A_hmouse_ep_addr
                loc     ptra, #@A_mouse_in_max_pkt
                rdbyte  A_htmp, ptra++                    ' Always ask for max report size
                rdbyte  A_hpar3, ptra++                   ' Word0 DATAx PID to expect
                setword A_hpar3, A_htmp, #1                 ' Word1 max IN packet size to expect
                mov     A_hpar2, ptra                     ' IN data to A_mouse_cur_report buffer
                call    #A_do_int_in
                cmp     A_retval, #PID_ACK        wz
        if_z    jmp     #.data
                cmp     A_retval, #PID_NAK        wz
        if_z    jmp     #.nak

                jmp     #A_host_error                     ' Something other than ACK/NAK, so likely fatal
.nak
                add     A_hmouse_poll_cnt, #1             ' Use the NAK results as a timer for LED feedback
                cmp     A_hmouse_poll_cnt, ##MOUSE_NAK_DELAY  wcz
        if_ae   drvnot  #HOST_A_ACTIVE_LED
        if_ae   mov     A_hmouse_poll_cnt, #0
                ret
.data
' Some devices may return a zero-length packet with ACK, which I'm not sure
' is "legal" or not. The easiest response is to just treat it as a NAK...
                cmp     A_hpar3, #0               wz
        if_z    jmp     #.nak
                mov     A_hmouse_poll_cnt, #0
                drvnot  #HOST_A_ACTIVE_LED                ' Show mouse activity on the feedback LED
                loc     ptra, #@A_mouse_next_datax
                rdbyte  A_hpar1, ptra
                cmp     A_hpar1, #PID_DATA0       wz
        if_z    mov     A_hpar1, #PID_DATA1               ' ACK, so toggle DATAx
        if_nz   mov     A_hpar1, #PID_DATA0
                wrbyte  A_hpar1, ptra
.data_out
                loc     ptra, #@A_mouse_cur_report        ' Pack mouse data into a single long for the client
                rdbyte  A_hr0, ptra++                     ' Button flags
                rdbyte  A_htmp, ptra++                    ' X direction and velocity is 8-bit signed
                setbyte A_hr0, A_htmp, #1
                rdbyte  A_htmp, ptra++                    ' Y direction and velocity is 8-bit signed
                setbyte A_hr0, A_htmp, #2
                cmp     A_last_mouse_data, A_hr0    wz      ' Some devices will occasionally "leak" stale data
        if_z    ret                                     ' so skip notifying the client if data unchanged
                mov     A_last_mouse_data, A_hr0
                wrlong  A_hr0, ##mouse_data
        _ret_   wxpin   #M_DATA, #USB_A_EVENT_REPO
''
' #endregion (USB hub execution)

' Catalina Init

DAT ' initialized data segment

   alignl

' #region Partially populated SETUP packets
'------------------------------------------------------------------------------
A_get_dev_desc            byte    (DIR_DEV_TO_HOST | TYPE_STANDARD | RECIP_DEVICE)
                        byte    REQ_GET_DESC
                        word    TYPE_DEVICE << 8
                        word    0       ' Zero or Language ID (Section 9.6.7)
                        word    0       ' Number of bytes to transfer if there is a data stage
A_get_config_desc         byte    (DIR_DEV_TO_HOST | TYPE_STANDARD | RECIP_DEVICE)
                        byte    REQ_GET_DESC
                        word    TYPE_CONFIG << 8
                        word    0       ' Zero or Language ID (Section 9.6.7)
                        word    0       ' Number of bytes to transfer if there is a data stage
A_set_config              byte    (DIR_HOST_TO_DEV | TYPE_STANDARD | RECIP_DEVICE)
                        byte    REQ_SET_CONFIG
                        word    0       ' Configuration value
                        word    0       ' Zero
                        word    0       ' Zero, as REQ_SET_CONFIG has no data stage
A_set_address             byte    (DIR_HOST_TO_DEV | TYPE_STANDARD | RECIP_DEVICE)
                        byte    REQ_SET_ADDR
                        word    0       ' Zero
                        word    0       ' Zero
                        word    0       ' Zero, as REQ_SET_ADDR has no data stage
'------------------------------------------------------------------------------
' The SET_PROTOCOL request is supported by devices in the "Boot" subclass. The
' wValue field dictates which protocol should be used.
'
' When initialized, all devices default to report protocol. However the host
' should not make any assumptions about the device state and should set the
' desired protocol whenever initializing a device.
'------------------------------------------------------------------------------
A_set_protocol            byte    (DIR_HOST_TO_DEV | TYPE_CLASS | RECIP_INTERFACE)
                        byte    HID_SET_PROTO
                        word    BOOT_PROTOCOL   ' 0 = Boot Protocol, 1 = Report Protocol
                                                ' (HID 1.11 Section 7.2.6).
                        word    0               ' Interface index number.
                        word    0               ' Zero, as HID_SET_PROTO has no data stage.
'------------------------------------------------------------------------------
A_set_idle                byte    (DIR_HOST_TO_DEV | TYPE_CLASS | RECIP_INTERFACE)
                        byte    HID_SET_IDLE
                        word    0       ' Byte1 = duration, byte0 = ReportID. A duration of zero inhibits
                                        ' reporting until a change is detected in the report data

                                        ' (HID 1.11 Section 7.2.4).
                        word    0       ' Interface index number.
                        word    0       ' Zero, as HID_SET_IDLE has no data stage.
A_set_report              byte    (DIR_HOST_TO_DEV | TYPE_CLASS | RECIP_INTERFACE)
                        byte    HID_SET_REPORT
                        word    0       ' Byte1 = report type, byte0 = ReportID.
                                        ' (HID 1.11 Section 7.2.2).
                        word    0       ' Interface index number.
                        word    0       ' Size of the report, in bytes.
                        alignl
' #endregion Partially populated SETUP packets
' #region Data buffers and structures
'------------------------------------------------------------------------------
' Class driver data structure for boot protocol keyboard.
' FIXME: Device endpoint/address and DATAx toggle state probably should be
'        maintained by the host and not the class driver.
'------------------------------------------------------------------------------
A_kbd_mouse_start
A_kbd_intf_num            byte    0                       ' Keyboard interface index (zero-based)
A_kbd_interval            byte    0                       ' Minimum poll interval, in milliseconds
A_kbd_in_max_pkt          byte    0                       ' Boot protocol IN report max is 8 bytes
A_kbd_next_datax          byte    0                       ' DATAx PID expected on the next IN transaction
A_kbd_max_index           byte    0                       ' Actual length of the current IN interrupt packet
A_kbd_led_states          byte    0                       ' Output report for keyboard toggle key indicator LED states
A_kbd_cur_report          byte    0[KBD_IN_RPT_LEN]       ' Compare buffers for key down/up detection
A_kbd_prev_report         byte    0[KBD_IN_RPT_LEN]
A_kbd_last_key            byte    0                       ' Used for key auto-repeat
' Class driver data structure for boot protocol mouse:
A_mouse_intf_num          byte    0                       ' Mouse interface index (zero based)
A_mouse_interval          byte    0                       ' Minimum poll interval, in milliseconds
A_mouse_in_max_pkt        byte    0                       ' Boot protocol IN report min of three bytes, max of 8
A_mouse_next_datax        byte    0                       ' DATAx PID expected on the next IN transaction
A_mouse_cur_report        byte    0[MOUSE_RPT_LEN]        ' Max mouse IN data buffer
A_mouse_prev_report       byte    0[MOUSE_RPT_LEN]
A_kbd_mouse_end                                           ' End of keyboard/mouse data block
                          alignl
'------------------------------------------------------------------------------
' The USB data cache area gets zero-filled at every device disconnect
'------------------------------------------------------------------------------
A_usb_cache_start
A_urx_buff                byte    0[URX_BUFF_LEN]         ' USB IN DATAx scratch buffer
A_dev_desc_buff           byte    0[DEV_DESC_LEN]         ' Device descriptor
A_con_desc_buff           byte    0[CON_BUFF_LEN]         ' Configuration descriptor chain
A_usb_cache_end
                          alignl
'------------------------------------------------------------------------------
' #endregion (Data buffers and structures)
' #region (USB Boot Protocol Mouse/Keyboard Hub Interface)
'------------------------------------------------------------------------------
' Current error state of the USB, posted by the USB_ERROR event. The error code
' will be one of the constants in the "Protocol error codes" enumeration.
A_usb_error_code  long    ERR_NONE
                  alignl

' NOTE: remainder of USB Boot Protocol Mouse/Keyboard Hub Interface moved 
'       to Catalina_1CogKbM_Common.spin2
                  orgh

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
