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
'' B_hparse_con_desc
'------------------------------------------------------------------------------
' Parse a configuration descriptor chain to see if the device is a recognized
' one. If it is, start the task progression that will configure the device for
' use.
'------------------------------------------------------------------------------
' On entry:
'   B_hconfig_base - start address of the cached config descriptor chain.
' On exit:
'------------------------------------------------------------------------------
B_hparse_con_desc
                call    #B_init_kbdm_data                 ' Reset keyboard/mouse data area to start-up values
                mov     pa, #CON_wTotalLen
                add     pa, B_hconfig_base
                rdword  B_hcon_tot_len, pa                ' Keep config chain size handy
' Search the configuration descriptor for the Class/Subclass/Protocol "triad"
' that defines a keyboard and/or mouse.
                rdbyte  B_hnext_desc, B_hconfig_base        ' Config desc size is offset to first desc in chain
.next_intf
                mov     B_hsearch_key, #TYPE_INTERFACE
                call    #B_hsearch_desc_type
                cmp     ptrb, #0                wz
        if_z    jmp     #B_hB_set_config                    ' No more interface descs
                rdbyte  B_htmp, ptrb
                add     B_hnext_desc, B_htmp                ' Get offset to next desc, if any
                rdbyte  B_hhid_intf_idx, ptrb[INTF_bIntfNum]
                rdbyte  B_htmp, ptrb[INTF_bIntfClass]
                cmp     B_htmp, #CLASS_HID        wz      ' Only interested in the HID class interface descriptors
        if_nz   jmp     #.next_intf                     ' Search next interface in chain, if any
                rdbyte  B_htmp, ptrb[INTF_bSubClass]      ' Look for a boot interface sub-class
                cmp     B_htmp, #SUBCLASS_INTF_BOOT wz
        if_nz   jmp     #.next_intf
                rdbyte  B_hr3, ptrb[INTF_bProtocol] wz    ' Protocol must be non-zero
        if_z    jmp     #.next_intf
.endp
                mov     B_hsave1, ptrb
                mov     B_hsave2, B_hnext_desc
                mov     B_hsearch_key, #TYPE_ENDPOINT
                call    #B_hsearch_desc_type              ' Endpoint descs always follow interface descs
                cmp     ptrb, #0                wz
        if_nz   jmp     #.get_ep
.bad_ep
                mov     B_hnext_desc, B_hsave2
                mov     ptrb, B_hsave1
                jmp     #.next_intf
.get_ep
                rdbyte  B_hr1, ptrb[ENDP_bAddress]
                testb   B_hr1, #7                 wc      ' FIXME: define constant for endpoint IN/OUT bit
        if_nc   jmp     #.bad_ep                        ' Not an IN endpoint
                shl     B_hr1, #8 + 7
                add     ptrb, #ENDP_wMaxPktSize
                rdword  B_hr2, ptrb++
                and     B_hr2, ##$7ff                     ' Bits 10..0 define the max packet size
                rdbyte  B_hr0, ptrb                       ' Fetch the bInterval member (min poll interval, in milliseconds)
                mov     B_hnext_desc, B_hsave2
                mov     ptrb, B_hsave1
                cmp     B_hr3, #INTF_PROTO_KBD    wz
        if_nz   jmp     #.mouse
.keyboard
                loc     ptra, #@B_kbd_intf_num
                wrbyte  B_hhid_intf_idx, ptra++            ' Save interface index and poll interval values
                wrbyte  B_hr0, ptra++
                mov     B_hkbd_ep_addr, B_hctrl_ep_addr
                and     B_hkbd_ep_addr, ##ADDR_MASK
                or      B_hkbd_ep_addr, B_hr1                ' IN endpoint address
                wrbyte  B_hr2, ptra
                jmp     #.next_intf                     ' See if there's a mouse subclass
.mouse
                cmp     B_hr3, #INTF_PROTO_MOUSE  wz
        if_nz   jmp     #.next_intf
                loc     ptra, #@B_mouse_intf_num
                wrbyte  B_hhid_intf_idx, ptra++            ' Save interface index and poll interval values
                wrbyte  B_hr0, ptra++
                mov     B_hmouse_ep_addr, B_hctrl_ep_addr
                and     B_hmouse_ep_addr, ##ADDR_MASK
                or      B_hmouse_ep_addr, B_hr1              ' IN endpoint address
                wrbyte  B_hr2, ptra
                jmp     #.next_intf                     ' See if there's a keyboard protocol
''
'' B_hsearch_desc_type
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
B_hsearch_desc_type
                mov     B_hsave0, B_hnext_desc
.next
                cmp     B_hnext_desc, B_hcon_tot_len  wcz
        if_ae   mov     ptrb, #0
        if_ae   mov     B_hnext_desc, B_hsave0
        if_ae   ret
                mov     ptrb, B_hconfig_base
                add     ptrb, B_hnext_desc
                rdbyte  B_htmp, ptrb[DESC_bDescType]
                cmp     B_htmp, B_hsearch_key        wz
        if_z    ret
                rdbyte  B_htmp, ptrb
                add     B_hnext_desc, B_htmp                 ' Get offset of next desc to check
                jmp     #.next
''
'' B_hB_set_config
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
B_hB_set_config
'                mov     B_hkbd_ep_addr, #0                ' DEBUG
'                mov     B_hmouse_ep_addr, #0              ' DEBUG
                mov     B_htmp2, #DEV_UNKNOWN
                cmp     B_hkbd_ep_addr, #0        wz
        if_z    cmp     B_hmouse_ep_addr, #0      wz
        if_z    jmp     #.notify_client                 ' No boot keyboard or mouse interface
.B_set_config
                loc     ptra, #@B_set_config
                mov     pa, #CON_bConfigVal             ' Get configuration value to set (always the default config in our case)
                add     pa, B_hconfig_base
                rdbyte  B_hpar1, pa
                wrword  B_hpar1, ptra[wValue]             ' Write the config value to the config SETUP struct
                mov     B_ep_addr_pid, B_hctrl_ep_addr      ' All configuration transactions use the control endpoint
                mov     pb, #0                          ' SetConfiguration() has no data stage
                call    #B_control_write
                cmp     B_retval, #PID_ACK        wz
        if_nz   ret
.kbd_config
                cmp     B_hkbd_ep_addr, #0        wz
        if_z    jmp     #.mouse_config                  ' No keyboard, so setup the mouse, if detected
                rdbyte  B_htmp, ##B_kbd_intf_num
                loc     ptra, #@B_set_protocol
                wrword  #BOOT_PROTOCOL, ptra[wValue]
                wrword  B_htmp, ptra[wIndex]
                mov     pb, #0                          ' SetProtocol() has no data stage
                call    #B_control_write
                cmp     B_retval, #PID_ACK        wz
        if_nz   mov     B_hkbd_ep_addr, #0
        if_nz   jmp     #.mouse_config
                mov     B_hpar1, #0                       ' SetIdle() duration 0 = indefinite
                rdbyte  B_hpar2, ##B_kbd_intf_num
                call    #B_hB_set_idle
                cmp     B_retval, #PID_ACK        wz
        if_nz   mov     B_hkbd_ep_addr, #0
        if_nz   jmp     #.mouse_config
                mov     B_hctwait, ##_1ms * 2
                call    #B_poll_waitx
                call    #B_hset_kbdled_report
                cmp     B_retval, #PID_ACK        wz
        if_nz   mov     B_hkbd_ep_addr, #0
        if_nz   jmp     #.mouse_config
                wrbyte  #KEY_NO_KEY, ##B_kbd_last_key
                mov     B_ep_addr_pid, B_hkbd_ep_addr
                call    #B_calc_crc5                      ' One-time calculation of the ep/addr/pid crc
                mov     B_hkbd_ep_addr, B_ep_addr_pid
                mov     B_ep_addr_pid, B_hctrl_ep_addr      ' Restore the control ep addr for mouse configuration
                mov     B_hkbd_poll_cnt, #0               ' Initialize key auto-repeat counters
                mov     B_hkbd_repeat, ##KBD_REPEAT_DELAY
                mov     B_poll_target, #B_poll_kbd
                mov     B_htmp2, #KB_READY                ' Keyboard interface configured
                getct   B_hct3
                addct3  B_hct3, ##KBD_POLL_INTERVAL       ' Wait an interval before the first IN poll
.mouse_config
                cmp     B_hmouse_ep_addr, #0       wz
        if_z    jmp     #.notify_client                 ' Notify the client that a keyboard interface was configured
                rdbyte  B_htmp, ##B_mouse_intf_num
                loc     ptra, #@B_set_protocol
                wrword  #BOOT_PROTOCOL, ptra[wValue]
                wrword  B_htmp, ptra[wIndex]
                mov     pb, #0                          ' SetProtocol() has no data stage
                call    #B_control_write
                cmp     B_retval, #PID_ACK        wz
        if_nz   mov     B_hmouse_ep_addr, #0
        if_nz   ret
                cmp     B_hkbd_ep_addr, #0        wz      ' A SetIdle() duration of indefinite covers both keyboard and mouse
        if_nz   jmp     #.mouse_timer                   ' So skip if it has already been done
                mov     B_hpar1, #0                       ' SetIdle() duration 0 = indefinite
                rdbyte  B_hpar2, ##B_mouse_intf_num
                call    #B_hB_set_idle
                cmp     B_retval, #PID_ACK        wz
        if_nz   mov     B_hmouse_ep_addr, #0
        if_nz   ret
.mouse_timer
                mov     B_ep_addr_pid, B_hmouse_ep_addr
                call    #B_calc_crc5                      ' One-time calculation of the ep/addr/pid crc
                mov     B_hmouse_ep_addr, B_ep_addr_pid
                cmp     B_hkbd_ep_addr, #0         wz
        if_nz   mov     B_htmp2, #KBM_READY               ' Both keyboard and mouse interfaces were configured
        if_z    mov     B_htmp2, #M_READY                 ' Only the mouse interface configured
        if_z    mov     B_poll_target, #B_poll_mouse
        if_z    getct   B_hct3
        if_z    addct3  B_hct3, ##MOUSE_POLL_INTERVAL     ' Set first poll interval
.notify_client
        _ret_   wxpin   B_htmp2, #USB_B_EVENT_REPO          ' Notify the client keyboard and/or mouse configured
''
'' B_init_kbdm_data
'------------------------------------------------------------------------------
' Initialize the keyboard/mouse data area to start-up values.
'------------------------------------------------------------------------------
' On entry:
' On exit:
'------------------------------------------------------------------------------
B_init_kbdm_data
                mov     B_hkbd_ep_addr, #0
                mov     B_hmouse_ep_addr, #0
                loc     ptra, #@B_kbd_mouse_start
                loc     pa, #@B_kbd_mouse_end
.loop
                wrbyte  #0, ptra++
                cmp     ptra, pa                wz
        if_nz   jmp     #.loop
                wrbyte  #PID_DATA0, ##B_kbd_next_datax    ' Reset interrupt IN datax sequence
        _ret_   wrbyte  #PID_DATA0, ##B_mouse_next_datax
''
'' B_hB_set_idle
'------------------------------------------------------------------------------
' Execute a ControlWrite() that will perform the HID-specific HID_SET_IDLE
' function.
'------------------------------------------------------------------------------
' On entry:
'   B_hpar1 - Byte1 duration, byte0 reportID (HID 1.11, section 7.2.4).
'   B_hpar2 - index number of the target interface.
' On exit:
'------------------------------------------------------------------------------
B_hB_set_idle
                mov     B_hctwait, ##_1ms * 2
                call    #B_poll_waitx
                loc     ptra, #@B_set_idle
                wrword  B_hpar1, ptra[wValue]
                wrword  B_hpar2, ptra[wIndex]
                jmp     #B_control_write
''
'' B_hset_kbdled_report
'------------------------------------------------------------------------------
' Execute a ControlWrite() that will perform the HID-specific HID_SET_REPORT
' function to set keyboard CapsLk, ScrLk and NumLk indicators.
'------------------------------------------------------------------------------
' On entry:
'   B_ep_addr_pid - device address and enpoint for the request.
' On exit:
'   B_retval - transaction result.
'------------------------------------------------------------------------------
B_hset_kbdled_report
                loc     ptra, #@B_set_report
                rdbyte  B_htmp, ##B_kbd_intf_num
                wrword  ##(TYPE_OUTPUT << 8), ptra[wValue] ' Byte1 report type, byte0 reportID (0)
                wrword  B_htmp, ptra[wIndex]
                wrword  #KBD_OUT_RPT_LEN, ptra[wLength]
                loc     pb, #@B_kbd_led_states            ' Start address of OUT data
                jmp     #B_control_write                  ' Execute ControlWrite(SET_REPORT) and back to caller
''
'' B_hget_kbd_in_report
'------------------------------------------------------------------------------
' Execute an IN interrupt transaction to poll for keyboard activity.
'------------------------------------------------------------------------------
' On entry:
' On exit:
'------------------------------------------------------------------------------
B_hget_kbd_in_report
                mov     B_ep_addr_pid, B_hkbd_ep_addr
                mov     B_hpar2, ##B_kbd_cur_report
                rdbyte  B_htmp, ##B_kbd_in_max_pkt          ' Always ask for max report size
                rdbyte  B_hpar3, ##B_kbd_next_datax
                setword B_hpar3, B_htmp, #1                 ' Max IN packet size to expect
                call    #B_do_int_in
                cmp     B_retval, #PID_ACK        wz
        if_z    jmp     #.data
                cmp     B_retval, #PID_NAK        wz
        if_nz   jmp     #B_host_error                     ' Something other than ACK/NAK, so likely fatal
' The NAK count is used to determine when key auto-repeat kicks in.
                add     B_hkbd_poll_cnt, #1
                cmp     B_hkbd_poll_cnt, B_hkbd_repeat wcz
        if_b    ret                                     ' No auto-repeat action
                cmp     B_hkbd_poll_cnt, ##KBD_REPEAT_DELAY wz
        if_z    drvnot  #HOST_B_ACTIVE_LED                ' Show keypress activity on the user LED
                rdbyte  B_hpar1, ##B_kbd_last_key           ' Peek at the last key-down scancode
                cmp     B_hpar1, #KEY_CAPSLK      wz
        if_z    mov     B_hpar1, #KEY_NO_KEY
                cmp     B_hpar1, #KEY_NO_KEY      wz
        if_z    mov     B_hkbd_repeat, ##KBD_REPEAT_DELAY ' Key repeat delay reset on KEY_NO_KEY
        if_z    mov     B_hkbd_poll_cnt, #0
        if_z    ret
                add     B_hkbd_repeat, ##KBD_REPEAT_RATE  ' Set the next repeat interval
                call    #B_repeat_key                     ' Repeat the key being held down and return to caller
        _ret_   wxpin   #KBD_KEY_UPDATE, #USB_B_EVENT_REPO ' Notify client of toggle key state change
.data
                cmp     B_hpar3, #0               wz
        if_z    ret                                     ' Ignore an empty DATAx packet
                drvnot  #HOST_B_ACTIVE_LED                ' Show keypress activity on the user LED
                rdbyte  B_hpar1, ##B_kbd_next_datax
                cmp     B_hpar1, #PID_DATA0       wz
        if_z    mov     B_hpar1, #PID_DATA1               ' Txn success, so toggle DATAx
        if_nz   mov     B_hpar1, #PID_DATA0
                wrbyte  B_hpar1, ##B_kbd_next_datax
                wrbyte  B_hpar3, ##B_kbd_max_index          ' Save actual bytes read
                call    #B_hkbd_compare                   ' Check keypress activity since last IN
.led_check
                rdbyte  B_htmp, ##B_kbd_led_states
                cmp     B_hkbd_ledstates, B_htmp    wz
        if_z    ret                                     ' No toggle key indicator changes, so we're done
                wrbyte  B_hkbd_ledstates, ##B_kbd_led_states' Update toggle key indicator states
                mov     B_ep_addr_pid, B_hctrl_ep_addr
                call    #B_hset_kbdled_report
                cmp     B_retval, #PID_ACK        wz
        if_nz   jmp     #B_host_error                     ' FIXME: on !ACK try to recover instead of fatal error
        _ret_   wxpin   #KBD_TGL_UPDATE, #USB_B_EVENT_REPO ' Notify client of toggle key state change
''
'' B_hkbd_compare
'------------------------------------------------------------------------------
' Compare current and previous keyboard data buffers for keypress changes.
'------------------------------------------------------------------------------
' On entry:
' On exit:
'   B_hpar1 - scancode of the last key in the down state, otherwise zero
'     (KEY_NO_KEY) if no keys were in the down state.
'   B_hkbd_modkeys - the current (possibly changed) modifier key states.
'------------------------------------------------------------------------------
B_hkbd_compare
                mov     B_hrep, #0                        ' Keep track of new key(s) pressed
                mov     B_hpar3, #KEY_NO_KEY
                loc     ptrb, #@B_kbd_cur_report + 2      ' Start of scancode array
                rdbyte  B_hpar1, ptrb++                   ' First array byte tells us if no keys down or keyboard error
                cmp     B_hpar1, #KEY_ERR_UNDEF   wcz     ' First four key values in lookup table are "special" scancodes
        if_a    jmp     #.get_keys                      ' Process normal scancode
                cmp     B_hpar1, #KEY_NO_KEY      wz
        if_z    jmp     #.end_keys                      ' No key activity or key up event, so commit current to previous
                loc     ptra, #@B_kbd_prev_report         ' Keyboard rollover overflow or other error
                loc     pb, #@B_kbd_cur_report
                mov     B_hr0, #KBD_IN_RPT_LEN            ' This data can't be used for compare purposes in the future
                jmp     #B_hmemcpy                        ' So make the previous data the current data and return to caller
' Walk the scancode array looking for pressed keys
.get_keys
                rdbyte  B_hr0, ##B_kbd_max_index
                mov     B_hr3, B_hr0
                add     B_hr3, ##B_kbd_cur_report           ' Last scancode array element
.next_key
                cmp     B_hpar1, #KEY_NO_KEY      wz
        if_z    jmp     #.end_keys                      ' No more pressed keys in the current report
                call    #B_check_key                      ' Process this scancode
                cmp     ptrb, B_hr3               wz      ' Check for array end
        if_nz   rdbyte  B_hpar1, ptrb++
        if_nz   jmp     #.next_key
.end_keys
                rdbyte  B_htmp, ##B_kbd_last_key
                cmp     B_hpar3, B_htmp             wz
        if_nz   mov     B_hkbd_repeat, ##KBD_REPEAT_DELAY  ' Scancode was different than last,
        if_nz   mov     B_hkbd_poll_cnt, #0                ' so reset auto-repeat
        if_nz   wrbyte  B_hpar3, ##B_kbd_last_key
.end
                loc     ptra, #@B_kbd_cur_report          ' Done processing current IN report
                loc     pb, #@B_kbd_prev_report
                mov     B_hr0, #KBD_IN_RPT_LEN
                call    #B_hmemcpy                        ' So it becomes the previous report for future compare
                cmp     B_hrep, #0                wz
        if_nz   wxpin   #KBD_KEY_UPDATE, #USB_B_EVENT_REPO ' Signal the client that keyboard status has changed
                ret
''
'' B_check_key (boot protocol specific)
'------------------------------------------------------------------------------
' See if the given scancode exists in the previously read keyboard data. If
' found it means the key is still pressed and can be ignored. If not found it's
' a new keypress to process.
'------------------------------------------------------------------------------
' On entry:
'   B_hr0 - Count of total keyboard data bytes.
'   B_hpar1 - scancode to check.
'   B_hkbd_ledstates - current CapsLock, NumLock and ScrollLock bitflags.
' On exit:
'   B_hpar1 - input scancode if matched (still in the down state), otherwise the
'     scancode of the newly pressed key.
'   B_hkbd_ledstates - possibly modified toggle key state.
'   B_hpar3 - scancode of the last key found in the down state.
'------------------------------------------------------------------------------
B_check_key
                loc     ptra, #@B_kbd_prev_report + 2
                mov     B_hr1, ##B_kbd_prev_report
                add     B_hr1, B_hr0                        ' Last scancode array element
.loop
                rdbyte  B_htmp, ptra++
                cmp     B_htmp, B_hpar1             wz
        if_z    mov     B_hpar3, B_hpar1
        if_z    ret                                     ' Key still in down state, so done with this key
                cmp     ptra, B_hr1               wz
        if_nz   jmp     #.loop
' The previous key report has been searched and no match found, so this is a
' newly-pressed key. Now look for toggle key changes.
                mov     B_hkbd_scancode, B_hpar1            ' Save new scancode
                mov     B_htmp, B_hkbd_ledstates
                cmp     B_hpar1, #KEY_CAPSLK      wz
        if_z    bitnot  B_htmp, #LED_CAPSLKB
                cmp     B_hpar1, #KEY_SCRLK       wz
        if_z    bitnot  B_htmp, #LED_SCRLKB
                cmp     B_hpar1, #KEY_NUMLK       wz
        if_z    bitnot  B_htmp, #LED_NUMLKB
                cmp     B_htmp, B_hkbd_ledstates    wz
        if_nz   mov     B_hkbd_ledstates, B_htmp
        if_nz   mov     B_hpar3, #KEY_NO_KEY              ' Toggle key pressed cancels auto-repeat
        if_nz   ret                                     ' Done if toggle key processed
' Fall through with new keypress scancode
' vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
''
'' B_buffer_key
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
'   B_hpar1 - the scancode of the key to process.
' On exit:
'   B_hrep - count of new keys in the scancode array
'   B_hpar2 = one of KBD_KEY_UPDATE, KBDBUFF_FULL
'   B_hpar3 - the scancode of the last-pressed key.
'------------------------------------------------------------------------------
B_buffer_key
                mov     B_hpar3, B_hpar1                    ' Save scancode for auto-repeat evaluation
                loc     ptra, #\@kbd_table
                shl     B_hpar1, #1                       ' Scancode table elements are word
                add     ptra, B_hpar1
                rdword  B_hpar2, ptra                     ' Lookup ASCII character pair (byte1 shifted, byte0 un-shifted)
                shr     B_hpar1, #1                       ' Restore scancode
                rdbyte  B_hkbd_modkeys, ##B_kbd_cur_report  ' Key array zero is shift/alt/ctrl/gui modifier bits
                testb   B_hkbd_ledstates, #LED_CAPSLKB wc
        if_nc   jmp     #.chk_shift                     ' CapsLock not active, so we can evaluate shift now
' Active CapsLock key only affects the alpha keys
' All modkeys other than SHIFT are left up to the client to handle
                cmp     B_hpar1, #KEY_Z_z         wcz     ' The first valid scancode is KEY_A_a
        if_a    jmp     #.chk_shift                     ' So if it's above KEY_Z_z it's not an alpha key
                test    B_hkbd_modkeys, #KEY_SHIFTMOD wz
        if_nz   getbyte B_hkbd_keypress, B_hpar2, #0        ' CapsLock AND Shift is lowercase alpha
        if_z    getbyte B_hkbd_keypress, B_hpar2, #1
                jmp     #.out_key
.chk_shift
                test    B_hkbd_modkeys, #KEY_SHIFTMOD wz  ' Determine upper/lower case ASCII character to send
        if_z    getbyte B_hkbd_keypress, B_hpar2, #0
        if_nz   getbyte B_hkbd_keypress, B_hpar2, #1
.out_key
' Add the newly pressed key data to the FIFO circular buffer
                setbyte B_hkbd_keypress, B_hkbd_ledstates, #3
                setbyte B_hkbd_keypress, B_hkbd_modkeys, #2
                setbyte B_hkbd_keypress, B_hpar1, #1
B_repeat_key
                loc     pa, #@kbd_buffer
                loc     pb, #@kbd_head
                rdlong  B_htmp, pb
                shl     B_htmp, #2
                add     pa, B_htmp
                wrlong  B_hkbd_keypress, pa               ' New data to buffer
                shr     B_htmp, #2
                add     B_hrep, #1
                incmod  B_htmp, #KBD_BUFFMASK             ' Advance head
        _ret_   wrlong  B_htmp, pb                        ' and save it
''
'' B_hget_mouse_in_report
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
B_hget_mouse_in_report
                mov     B_ep_addr_pid, B_hmouse_ep_addr
                loc     ptra, #@B_mouse_in_max_pkt
                rdbyte  B_htmp, ptra++                    ' Always ask for max report size
                rdbyte  B_hpar3, ptra++                   ' Word0 DATAx PID to expect
                setword B_hpar3, B_htmp, #1                 ' Word1 max IN packet size to expect
                mov     B_hpar2, ptra                     ' IN data to B_mouse_cur_report buffer
                call    #B_do_int_in
                cmp     B_retval, #PID_ACK        wz
        if_z    jmp     #.data
                cmp     B_retval, #PID_NAK        wz
        if_z    jmp     #.nak

                jmp     #B_host_error                     ' Something other than ACK/NAK, so likely fatal
.nak
                add     B_hmouse_poll_cnt, #1             ' Use the NAK results as a timer for LED feedback
                cmp     B_hmouse_poll_cnt, ##MOUSE_NAK_DELAY  wcz
        if_ae   drvnot  #HOST_B_ACTIVE_LED
        if_ae   mov     B_hmouse_poll_cnt, #0
                ret
.data
' Some devices may return a zero-length packet with ACK, which I'm not sure
' is "legal" or not. The easiest response is to just treat it as a NAK...
                cmp     B_hpar3, #0               wz
        if_z    jmp     #.nak
                mov     B_hmouse_poll_cnt, #0
                drvnot  #HOST_B_ACTIVE_LED                ' Show mouse activity on the feedback LED
                loc     ptra, #@B_mouse_next_datax
                rdbyte  B_hpar1, ptra
                cmp     B_hpar1, #PID_DATA0       wz
        if_z    mov     B_hpar1, #PID_DATA1               ' ACK, so toggle DATAx
        if_nz   mov     B_hpar1, #PID_DATA0
                wrbyte  B_hpar1, ptra
.data_out
                loc     ptra, #@B_mouse_cur_report        ' Pack mouse data into a single long for the client
                rdbyte  B_hr0, ptra++                     ' Button flags
                rdbyte  B_htmp, ptra++                    ' X direction and velocity is 8-bit signed
                setbyte B_hr0, B_htmp, #1
                rdbyte  B_htmp, ptra++                    ' Y direction and velocity is 8-bit signed
                setbyte B_hr0, B_htmp, #2
                cmp     B_last_mouse_data, B_hr0    wz      ' Some devices will occasionally "leak" stale data
        if_z    ret                                     ' so skip notifying the client if data unchanged
                mov     B_last_mouse_data, B_hr0
                wrlong  B_hr0, ##mouse_data
        _ret_   wxpin   #M_DATA, #USB_B_EVENT_REPO
''
' #endregion (USB hub execution)

' Catalina Init

DAT ' initialized data segment

   alignl

' #region Partially populated SETUP packets
'------------------------------------------------------------------------------
B_get_dev_desc            byte    (DIR_DEV_TO_HOST | TYPE_STANDARD | RECIP_DEVICE)
                        byte    REQ_GET_DESC
                        word    TYPE_DEVICE << 8
                        word    0       ' Zero or Language ID (Section 9.6.7)
                        word    0       ' Number of bytes to transfer if there is a data stage
B_get_config_desc         byte    (DIR_DEV_TO_HOST | TYPE_STANDARD | RECIP_DEVICE)
                        byte    REQ_GET_DESC
                        word    TYPE_CONFIG << 8
                        word    0       ' Zero or Language ID (Section 9.6.7)
                        word    0       ' Number of bytes to transfer if there is a data stage
B_set_config              byte    (DIR_HOST_TO_DEV | TYPE_STANDARD | RECIP_DEVICE)
                        byte    REQ_SET_CONFIG
                        word    0       ' Configuration value
                        word    0       ' Zero
                        word    0       ' Zero, as REQ_SET_CONFIG has no data stage
B_set_address             byte    (DIR_HOST_TO_DEV | TYPE_STANDARD | RECIP_DEVICE)
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
B_set_protocol            byte    (DIR_HOST_TO_DEV | TYPE_CLASS | RECIP_INTERFACE)
                        byte    HID_SET_PROTO
                        word    BOOT_PROTOCOL   ' 0 = Boot Protocol, 1 = Report Protocol
                                                ' (HID 1.11 Section 7.2.6).
                        word    0               ' Interface index number.
                        word    0               ' Zero, as HID_SET_PROTO has no data stage.
'------------------------------------------------------------------------------
B_set_idle                byte    (DIR_HOST_TO_DEV | TYPE_CLASS | RECIP_INTERFACE)
                        byte    HID_SET_IDLE
                        word    0       ' Byte1 = duration, byte0 = ReportID. A duration of zero inhibits
                                        ' reporting until a change is detected in the report data

                                        ' (HID 1.11 Section 7.2.4).
                        word    0       ' Interface index number.
                        word    0       ' Zero, as HID_SET_IDLE has no data stage.
B_set_report              byte    (DIR_HOST_TO_DEV | TYPE_CLASS | RECIP_INTERFACE)
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
B_kbd_mouse_start
B_kbd_intf_num            byte    0                       ' Keyboard interface index (zero-based)
B_kbd_interval            byte    0                       ' Minimum poll interval, in milliseconds
B_kbd_in_max_pkt          byte    0                       ' Boot protocol IN report max is 8 bytes
B_kbd_next_datax          byte    0                       ' DATAx PID expected on the next IN transaction
B_kbd_max_index           byte    0                       ' Actual length of the current IN interrupt packet
B_kbd_led_states          byte    0                       ' Output report for keyboard toggle key indicator LED states
B_kbd_cur_report          byte    0[KBD_IN_RPT_LEN]       ' Compare buffers for key down/up detection
B_kbd_prev_report         byte    0[KBD_IN_RPT_LEN]
B_kbd_last_key            byte    0                       ' Used for key auto-repeat
' Class driver data structure for boot protocol mouse:
B_mouse_intf_num          byte    0                       ' Mouse interface index (zero based)
B_mouse_interval          byte    0                       ' Minimum poll interval, in milliseconds
B_mouse_in_max_pkt        byte    0                       ' Boot protocol IN report min of three bytes, max of 8
B_mouse_next_datax        byte    0                       ' DATAx PID expected on the next IN transaction
B_mouse_cur_report        byte    0[MOUSE_RPT_LEN]        ' Max mouse IN data buffer
B_mouse_prev_report       byte    0[MOUSE_RPT_LEN]
B_kbd_mouse_end                                           ' End of keyboard/mouse data block
                          alignl
'------------------------------------------------------------------------------
' The USB data cache area gets zero-filled at every device disconnect
'------------------------------------------------------------------------------
B_usb_cache_start
B_urx_buff                byte    0[URX_BUFF_LEN]         ' USB IN DATAx scratch buffer
B_dev_desc_buff           byte    0[DEV_DESC_LEN]         ' Device descriptor
B_con_desc_buff           byte    0[CON_BUFF_LEN]         ' Configuration descriptor chain
B_usb_cache_end
                          alignl
'------------------------------------------------------------------------------
' #endregion (Data buffers and structures)
' #region (USB Boot Protocol Mouse/Keyboard Hub Interface)
'------------------------------------------------------------------------------
' Current error state of the USB, posted by the USB_ERROR event. The error code
' will be one of the constants in the "Protocol error codes" enumeration.
B_usb_error_code  long    ERR_NONE
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
