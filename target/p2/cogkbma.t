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

' define P2_REV_A for Rev A chips (in the common file) ...

' USB "portA" connector pin assignments (lower port):
        HOST_A_ACTIVE_LED = _USB_BASE_PIN + 4
' USB protection enable/disable
        USB_A_PROTECT_ON = _USB_BASE_PIN + 5
' Smart pin pair used for the USB transceiver:
        DM_A = _USB_BASE_PIN + 6   ' DM_A is "The Brain"
        DP_A = _USB_BASE_PIN + 7   ' DP_A is passive

' Long repository pin#:
        USB_A_EVENT_REPO = _USB_BASE_PIN + 9

' LED to blink at host/driver fatal error:
        HOST_A_ERROR_LED = LED56

' #region (USB host cog)
dat
                orgh
                alignl
                org
'' A_usb_host_start
'------------------------------------------------------------------------------
' The USB host cog.
'------------------------------------------------------------------------------
A_usb_host_start

                'mov     lmm_bufad, PTRA                 ' Location of hub buffer for serial routine 
                flth    #HOST_A_ERROR_LED
                drvh    #USB_A_PROTECT_ON                 ' Enable P2-ES 64006-ES Serial Host USB Protection
' FIXME: kludge to set a USB tx byte write ACKPIN<->WRPIN delay.
                'mov     A_htmp, ##__CLKFREQ
                mov     A_htmp, ##_CLOCKFREQ
                cmp     A_htmp, ##168_000_000     wcz
        if_be   mov     A_utx_tweak, #0
        if_a    mov     A_utx_tweak, #20
' Copy lut execution code from hub to lut
                mov     A_htmp, ##@A_hlut_end - 4           ' Dealing with hub addresses, so convert byte
                sub     A_htmp, ##@A_hlut_start             ' addresses to the N - 1 longs required by SETQ2
                shr     A_htmp, #2
                loc     pb, #@A_hlut_start
                setq2   A_htmp
                rdlong  0, pb                           ' Do the hub->lut copy
                mov     ijmp1, #A_isr1_A_frame              ' Set the USB 1ms A_frame handler ISR routine
                wxpin   #USB_STARTED, #USB_A_EVENT_REPO   ' Signal the client that the USB is started
                jmp     #A_host_A_reset                     ' Initialize host and enter main processing loop
''
'' A_txn_setup
'------------------------------------------------------------------------------
' SETUP transaction. The mechanics of SETUP are identical to OUT, but it's
' special because the receiving function must not respond with either STALL or
' NAK, and must accept the DATAx packet that follows the SETUP token. If a
' non-control endpoint receives a SETUP token, or the function receives a
' corrupt packet, it must ignore the transaction
'------------------------------------------------------------------------------
' On entry:
'   PTRA - start address of the SETUP data struct.
' On exit:
'   A_retval - PID_ACK on success, otherwise error code.
'------------------------------------------------------------------------------
A_txn_setup
                setbyte A_ep_addr_pid, #PID_SETUP, #0
                mov     A_pkt_data, #SETUP_TXN_LEN        ' SETUP is single fixed size DATAx packet
                bitl    A_hstatus, #DATAx_TGLB            ' And always uses DATA0 packet
                mov     A_retry, #TXN_RETRIES             ' Retries possible as function will ignore a corrupt packet
                mov     pa, ptra                        ' Save SETUP struct pointer in case of A_retry
.setup
                call    #A_txn_out                        ' SETUP/OUT are the same transaction type, just different PIDs
                cmp     A_retval, #PID_ACK        wz
        if_z    ret
                call    #A_retry_wait
                cmp     A_retval, #ERR_TXN_RETRY  wz
        if_z    ret
                mov     ptra, pa                        ' Restore SETUP's DATAx pointer
                jmp     #.setup
''
'' A_txn_in
'------------------------------------------------------------------------------
' IN/INTERRUPT transaction.
' Possible function response: STALL or NAK handshake, or DATAx packet.
'------------------------------------------------------------------------------
' On entry:
'   A_ep_addr_pid - PID_IN(b0..7), address(b8..b14), endpoint(b15..18) and
'     CRC(b19..23).
' On exit:
'------------------------------------------------------------------------------
A_txn_in
                call    #A_wait_txn_ok                    ' ISR: ensure txn doesn't cross A_frame boundary
                setbyte A_ep_addr_pid, #PID_IN, #0
                call    #A_utx_token                      ' Put IN request on the bus
' Fall through to A_urx_packet
' vvvvvvvvvvvvvvvvvvvvvvvvvv
''
'' A_urx_packet
'------------------------------------------------------------------------------
' Wait for a packet from a device/function. As host, the only two packet types
' received are handshakes and IN DATAx.
'------------------------------------------------------------------------------
' On entry:
' On exit:
'   A_retval - the ID of the packet. If a PID fails validation, ERR_PACKET is
'     returned.
'------------------------------------------------------------------------------
A_urx_packet
                rqpin   A_urx, #DM_A                        ' Wait until start-of-packet signal appears on the USB.
                testb   A_urx, #SOPB              wc
        if_c    jmp     #A_urx_packet
                getct   A_hct2
                addct2  A_hct2, A_tat_wait                  ' Start the response turn-around timer
                bitl    A_hstatus, #EOPB                  ' Make sure sticky EOP flag is clear
                mov     A_newb_flg, #0                    ' Initialize for multi-byte read
.wait_sop
                rdpin   A_urx, #DM_A
                testb   A_urx, #SOPB              wc
        if_c    jmp     #.get_pid
                jnct2   #.wait_sop
        _ret_   mov     A_retval, #ERR_TAT
.get_pid
                call    #A_urx_next
                testb   A_urx, #BUS_ERRB          wc
        if_nc   jmp     #.chk_pid
        _ret_   mov     A_retval, #ERR_URX
.chk_pid
                cmp     A_retval, #PID_ACK        wz
        if_nz   cmp     A_retval, #PID_NAK        wz
        if_nz   cmp     A_retval, #PID_STALL      wz
        if_z    jmp     #.chk_eop                       ' Handshake, so check that packet is single byte
                testb   A_hstatus, #DATAx_TGLB    wc      ' Get low/full speed even/odd DATAx sequence to look for
                cmp     A_retval, #PID_DATA0      wz
   if_z_and_nc  jmp     #A_urx_data                       ' DATA0 and sequence match
   if_z_and_c   jmp     #.ack_resend                    ' Sequence error. Ignore data, resend the ACK that the device must have missed
                cmp     A_retval, #PID_DATA1      wz
   if_z_and_c   jmp     #A_urx_data                       ' DATA1 and sequence match
   if_z_and_nc  jmp     #.ack_resend
        _ret_   mov     A_retval, #ERR_PACKET             ' Some other bus error...
.ack_resend
                rqpin   A_urx, #DM_A
                testb   A_urx, #EOPB              wc
        if_nc   jmp     #.ack_resend
                mov     A_retval, #PID_ACK
                call    #A_utx_handshake                  ' Send handshake PID and return to caller
        _ret_   mov     A_retval, #ERR_DATAX_SYNC
.chk_eop
                testb   A_hstatus, #LOW_SPEEDB    wc
        if_nc   jmp     #.idle                          ' Full-speed doesn't need an additional read to get EOP status
                call    #A_urx_next                       ' Low-speed requires an additional read to get EOP status
                testb   A_hstatus, #EOPB          wc
        if_c    jmp     #.idle                          ' Low-speed EOP seen
                testb   A_urx, #BUS_ERRB          wz
        if_nc   mov     A_retval, #ERR_PACKET             ' No EOP where one was expected
        if_z    mov     A_retval, #ERR_URX                ' Bit unstuff error, EOP SE0 > 3 bits or SE1, so we're hosed
                ret
.idle
                rqpin   A_urx, #DM_A
                testb   A_urx, #J_IDLEB           wc
        if_nc   jmp     #.idle                          ' Wait for bus IDLE before returning handshake result
                ret
''
'' A_utx_token
'------------------------------------------------------------------------------
' Send a token packet with CRC5 checksum of address and endpoint. It is the
' responsibility of the caller to append the appropriate inter-packet delay,
' if one is required.
'------------------------------------------------------------------------------
' On entry:
'   A_ep_addr_pid - packed with the PID, address and endpoint.
' On exit:
'------------------------------------------------------------------------------
A_utx_token
                rqpin   A_urx, #DM_A
                testb   A_urx, #J_IDLEB           wc
        if_nc   jmp     #A_utx_token
                mov     A_utx, #OUT_SOP
                call    #A_utx_byte                       ' Send sync byte
                mov     A_htmp, A_ep_addr_pid               ' Preserve the PID and destination
                mov     A_pkt_cnt, #3
.next_byte
                getbyte A_utx, A_htmp, #0                   ' Bytes on the bus LSB->MSB
                shr     A_htmp, #8                        ' Shift to next byte to send
.wait
                testp   #DP_A                     wc
        if_nc   jmp     #.wait
                akpin   #DP_A
                wypin   A_utx, #DM_A
        _ret_   djnz    A_pkt_cnt, #.next_byte
''
'' A_txn_out
'------------------------------------------------------------------------------
' SETUP/OUT/INTERRUPT transaction.
' Possible function response in order of precedence: STALL, ACK, NAK.
'------------------------------------------------------------------------------
' On entry:
'   A_ep_addr_pid - PID_OUT(b0..7), address(b8..b14), endpoint(b15..18) and
'     CRC(b19..23).
'   PTRA - start address of the data buff/struct that has the bytes to send.
'   A_pkt_data - count of DATAx payload bytes to send.
' On exit:
'------------------------------------------------------------------------------
A_txn_out
                call    #A_wait_txn_ok                    ' ISR: ensure txn doesn't cross A_frame boundary
                call    #A_utx_token                      ' Put SETUP/OUT token on the bus
                rdfast  ##(|< 31), ptra                 ' Use hub RAM FIFO interface to read the tx buffer
                mov     A_pkt_cnt, A_pkt_data
' Fall through to A_utx_data
' vvvvvvvvvvvvvvvvvvvvvvvv
''
'' A_utx_data
'------------------------------------------------------------------------------
' Transmit a DATAx packet with USB-16 checksum of payload. The payload CRC is
' calculated while the data byte is being shifted out. Since data stage
' success/fail is not determined until the status stage of the transaction,
' this routine is only concerned about the current DATAx packet.
'------------------------------------------------------------------------------
' On entry:
'   PTRA - hub start address of the data to read.
'   A_pkt_cnt - data payload size.
' On exit:
'------------------------------------------------------------------------------
A_utx_data
                rqpin   A_urx, #DM_A
                testb   A_urx, #SOPB              wc
        if_c    jmp     #A_utx_data
                mov     A_hctwait, A_ip_delay
                call    #poll_waitx                     ' SETUP/OUT token always precedes tx DATAx so insert IP delay
                mov     A_utx, #OUT_SOP
                call    #A_utx_byte                       ' Send sync
                bmask   A_crc, #15                        ' Prime the CRC16 pump
                testb   A_hstatus, #DATAx_TGLB    wc      ' Set the requested DATAx PID
        if_nc   mov     A_utx, #PID_DATA0
        if_c    mov     A_utx, #PID_DATA1
                call    #A_utx_byte                       ' No CRC calc done on PID
                cmp     A_pkt_cnt, #0             wz      ' Check if sending a zero length payload
        if_z    jmp     #.send_A_crc                      ' If so, only the CRC goes out
.read_byte
                rfbyte  A_utx                             ' Fetch data byte
                call    #A_utx_byte
                rev     A_utx                             ' Calculate CRC while the data is shifting out
                setq    A_utx                             ' SETQ left-justifies the reflected data byte
                crcnib  A_crc, ##USB16_POLY               ' Run CRC calc on the data nibs
                crcnib  A_crc, ##USB16_POLY
                djnz    A_pkt_cnt, #.read_byte
.send_A_crc
                xor     A_crc, ##$ffff                    ' Final XOR, and send the calculated CRC16
                getbyte A_utx, A_crc, #0
                call    #A_utx_byte
                getbyte A_utx, A_crc, #1
                call    #A_utx_byte                       ' Last CRC byte out
                jmp     #A_urx_packet                     ' Handle function response/error and back to caller
''
'' A_urx_data
'------------------------------------------------------------------------------
' Receive a DATAx_ payload with USB-16 checksum. The CRC is calculated as the
' payload bytes are received. The routine reads bytes until EOP is detected and
' expects that the packet includes at least the CRC word.
'
' In control transfers, it's possible to recieve fewer data bytes than what
' was requested, which makes it difficult to determine where the data stops
' and the CRC word begins. So the CRC calculation is done on every byte of the
' packet, including the CRC word. The CRC value should then be equal to the
' USB-16 expected residual value of 0xB001.
'
' The routine writes the IN packet data to a static max_packet_size buffer
' so the caller can verify IN success before writing the data to its final
' destination.
'------------------------------------------------------------------------------
' On entry:
'   A_pkt_data - max byte count expected to be in the packet.
'   A_newb_flg - signals new byte ready when toggled.
' On exit:
'   A_pkt_cnt - actual number of bytes read.
'------------------------------------------------------------------------------
A_urx_data
                wrfast  ##(|< 31), ##A_urx_buff           ' Use hub RAM FIFO interface to buffer bytes received
                bmask   A_crc, #15                        ' Prime the CRC16 pump
                mov     A_pkt_cnt, #0                     ' Keep track of payload bytes received
                mov     A_pkt_tmp, A_pkt_data
                add     A_pkt_tmp, #2                     ' Tweak payload byte count to include CRC word
.wait_byte
' In-line rx for max speed
                rqpin   A_urx, #DM_A
                mov     A_utx, #BYTE_TGLF                 ' Reg A_utx free in this context
                and     A_utx, A_urx
                cmp     A_newb_flg, A_utx           wz      ' Fetch a byte whenever the flags differ
        if_nz   xor     A_newb_flg, #BYTE_TGLF            ' Synchronize flags
        if_nz   jmp     #.get_byte                      ' New byte!
                testb   A_urx, #EOPB              wc
        if_c    jmp     #.chk_A_crc                       ' At end-of-packet
                jmp     #.wait_byte
.get_byte
                getbyte A_retval, A_urx, #1                 ' New byte from smart pins
                wfbyte  A_retval                          ' Add it to the data buffer
                rev     A_retval                          ' Calculate CRC while next byte is shifting in
                setq    A_retval                          ' SETQ left-justifies the reflected data byte
                crcnib  A_crc, ##USB16_POLY               ' Run CRC calc on the data nibs
                crcnib  A_crc, ##USB16_POLY
.end_A_crc
                add     A_pkt_cnt, #1
                cmp     A_pkt_cnt, A_pkt_tmp        wcz
        if_a    mov     A_retval, #ERR_PACKET             ' Error if payload > expected size
        if_a    ret
' For full-speed at 80MHz, the time it takes to do the final byte write and
' CRC verify has likely put us into the EOP zone. The P2 smart pins keep the
' EOP flag "sticky" for 7-bits of J, but at 80MHz, it still could be possible
' to miss it, so cheat a bit and look for SOP clear here.
                rqpin   A_urx, #DM_A
                testb   A_urx, #SOPB              wc      ' FIXME: checking for EOP set should work when > 80MHz
        if_c    jmp     #.wait_byte                     ' Next read will catch EOP at low-speed
' CRC OK = Payload CRC calc ^ packet's CRC bytes = $B001 (the USB-16 expected residual)
.chk_A_crc
                sub     A_pkt_cnt, #2                     ' Adjust payload count to exclude the CRC bytes read
                xor     A_crc, ##USB16_RESIDUAL   wz      ' CRC of (data + transmitted CRC) XOR residual should equal zero
        if_nz   jmp     #A_urx_packet                     ' CRC fail; discard data and wait until data re-sent or transfer timeout
                mov     A_retval, #PID_ACK
                mov     A_hctwait, A_ip_delay
                call    #poll_waitx
' Fall through to A_utx_handshake
' vvvvvvvvvvvvvvvvvvvvvvvvvvvvv
''
'' A_utx_handshake
'------------------------------------------------------------------------------
' Transmit a handshake PID. The routine assumes that the bus is IDLE and
' the appropriate IP delay has been inserted.
'------------------------------------------------------------------------------
' On entry:
'   A_retval - handshake PID to send.
' On exit:
'   A_retval unchanged.
'------------------------------------------------------------------------------
A_utx_handshake
                mov     A_utx, #OUT_SOP
                call    #A_utx_byte                       ' Send sync
                mov     A_utx, A_retval
                call    #A_utx_byte                       ' Send handshake PID
.idle
                rqpin   A_urx, #DM_A
                testb   A_urx, #J_IDLEB           wc
        if_nc   jmp     #.idle                          ' Wait for IDLE to ensure the PID tx is complete
                mov     A_hctwait, A_tat_wait               ' Ensure one turn-around time before next transaction
                jmp     #poll_waitx
''
'' A_utx_byte
'------------------------------------------------------------------------------
' Wait for the USB tx buffer to empty and feed it a new byte.
'------------------------------------------------------------------------------
' On entry:
'   A_utx - byte to transmit.
' On exit:
'------------------------------------------------------------------------------
A_utx_byte
                testp   #DP_A                     wc
        if_nc   jmp     #A_utx_byte
                akpin   #DP_A
                waitx   A_utx_tweak       ' Wait #3 if < 180MHz, wait #20 if 180MHz+
        _ret_   wypin   A_utx, #DM_A
''
'' A_urx_next
'------------------------------------------------------------------------------
' Fetch the next data byte of a packet. Always check receiver status for EOP.
'------------------------------------------------------------------------------
' On entry:
' On exit:
'   A_retval - the byte read.
'   A_urx - the receiver status. The caller must check the A_hstatus reg EOP flag
'     on return. If EOP is set, the byte in reg A_retval remains as the last byte
'     received.
'------------------------------------------------------------------------------
A_urx_next
                rdpin   A_urx, #DM_A
                mov     A_utx, #BYTE_TGLF                 ' Reg A_utx free in this context
                and     A_utx, A_urx
                cmp     A_newb_flg, A_utx           wz      ' Fetch a byte whenever the flags differ
        if_nz   xor     A_newb_flg, #BYTE_TGLF            ' Synchronize flags
        if_nz   getbyte A_retval, A_urx, #1                 ' Fetch the new byte
        if_nz   ret                                     ' New byte is priority, so return now
                testb   A_urx, #SOPB              wc
                testb   A_urx, #BUS_ERRB          wz
   if_c_and_nz  jmp     #A_urx_next                       ' If SOP still raised and !BUS_ERRB a new byte should be coming
        if_nc   bith    A_hstatus, #EOPB                  ' If EOP make it sticky, otherwise it's a bus error
                ret
''
'' A_wait_txn_ok
'------------------------------------------------------------------------------
' Wait for a window within the 1ms A_frame boundary that will ensure that a
' transaction can complete without spanning the A_frame.
'------------------------------------------------------------------------------
' On entry:
' On exit:
'------------------------------------------------------------------------------
A_wait_txn_ok
                mov     A_htmp2, #0
.wait
                testb   A_hstatus, #TXN_LIMITB    wc
        if_c    add     A_htmp2, #1
        if_c    jmp     #.wait                          ' In "no transaction" zone, so wait for the next A_frame
                cmp     A_htmp2, #0               wz
        if_z    ret
                mov     A_hctwait, A_ip_delay
                jmp     #poll_waitx                     ' In the "transaction OK" zone, so good to go
''
'' poll_waitx
'------------------------------------------------------------------------------
' The one millisecond A_frame timer is implemented as an interrupt service
' routine. Since this timing is critical, care must be taken to avoid any
' instructions that can delay the interrupt branch, which will likely upset
' the timer. WAITX is among those instructions, so any time you're inside
' an IN/OUT/SETUP transaction, use this routine instead of WAITX.
'------------------------------------------------------------------------------
' On entry:
'   A_hctwait - wait interval in sysclocks.
' On exit:
'------------------------------------------------------------------------------
poll_waitx
                getct   A_hct2
                addct2  A_hct2, A_hctwait
.wait
                jnct2   #.wait
                ret
''
'' A_retry_wait
'------------------------------------------------------------------------------
' Transaction A_retry handling for NAK/STALL or bus error.
'------------------------------------------------------------------------------
' On entry:
'   A_retval - transaction response PID or error code.
' On exit:
'------------------------------------------------------------------------------
A_retry_wait
                cmp     A_retval, #PID_STALL      wz
        if_z    ret                                     ' STALL is special case
                cmp     A_retval, #PID_NAK        wz
        if_z    jmp     #.nak
                mov     A_hctwait, ##_1us * 250           ' Transaction error wait...
                call    #poll_waitx
.dec
                sub     A_retry, #1               wz
        if_z    mov     A_retval, #ERR_TXN_RETRY          ' Only set error code if no retries left
                ret                                     ' Retry result to caller
.nak
                mov     A_hctwait, ##_1us * 33            ' Seems to be a reasonable NAK delay
                call    #poll_waitx
                cmp     A_nak_retry, #NAK_NOLIMIT wz
        if_z    ret                                     ' Indefinite NAK retries
                sub     A_nak_retry, #1           wz
        if_z    mov     A_retval, #ERR_NAK
                ret
''
'' A_calc_crc5
'------------------------------------------------------------------------------
' Calculate USB-5 CRC. The upper word of the CRC pre-calc table in LUT contains
' the data used for the USB-5 CRC lookups. The token packet is three bytes in
' length, and the PID is not included in the CRC calculation:
'  CRC5  FRAME_NUMBER SOF (full-speed)
'  CRC5  ENDP ADDRESS PID
' %00000_1111_1111111_xxxxxxxx
'------------------------------------------------------------------------------
' On entry:
'   A_ep_addr_pid - stuffed with the function endpoint, address and
'     SETUP/IN/OUT/SOF PID according to the USB standard.
' On exit:
'   A_ep_addr_pid - CRC value appended to the packet.
'------------------------------------------------------------------------------
A_calc_crc5
                and     A_ep_addr_pid, ##EP_ADDR_MASK     ' Clear existing CRC, if any
                mov     A_htmp, A_ep_addr_pid
                shr     A_htmp, #8                        ' PID not included in CRC calc
                mov     A_crc, #$1f                       ' Initial CRC5 value
                rev     A_htmp                            ' Input data reflected
                setq    A_htmp                            ' CRCNIB setup for data bits 0..7
                crcnib  A_crc, #USB5_POLY
                crcnib  A_crc, #USB5_POLY                 ' Data bits 0..7 calculated
                shl     A_htmp, #9                wc      ' Shift out processed bits + 1 to set up CRC of remaining bits 8..10
                crcbit  A_crc, #USB5_POLY                 ' Inline instead of REP as we're in hubexec
                shl     A_htmp, #1                wc
                crcbit  A_crc, #USB5_POLY
                shl     A_htmp, #1                wc
                crcbit  A_crc, #USB5_POLY
                xor     A_crc, #$1f                       ' Final XOR value
                shl     A_crc, #8 + 11                    ' CRC to bits 23..19 of the token packet
        _ret_   or      A_ep_addr_pid, A_crc                ' Put the CRC in its new home
''
'' A_isr1_A_frame
'------------------------------------------------------------------------------
' Full-speed/low-speed A_frame timing interrupt service routine.
'------------------------------------------------------------------------------
A_isr1_A_frame
                testb   A_hstatus, #TXN_LIMITB    wc
        if_nc   jmp     #.A_no_txn_zone                   ' Timer "txn OK" expired, go set "no txn" timer
                addct1  A_hct1, A_txn_ok_zone               ' Refresh the "txn OK zone" timespan
                testb   A_hstatus, #LOW_SPEEDB    wc
        if_nc   jmp     #.fullspeed
                mov     A_utx, #OUT_EOP                   ' Timer "no txn" expired, so it's end-of-A_frame
                call    #A_utx_byte                       ' EOP is the low-speed keep-alive strobe
                mov     A_isr_tmp, A_ip_delay               ' Normal inter-packet delay works when low-speed
                jmp     #.wait
.fullspeed
                mov     A_utx, #OUT_SOP
                call    #A_utx_byte                       ' Send sync byte
                mov     A_icrc, #$1f                      ' Prime the CRC5 pump
                mov     A_sof_pkt, A_frame                  ' CRC5 calculation done on the 11-bit A_frame number value
                rev     A_sof_pkt                         ' Input data reflected
                mov     A_utx, #PID_SOF
                call    #A_utx_byte                       ' Send token PID byte
                setq    A_sof_pkt                         ' CRCNIB setup for data bits 0..7
                crcnib  A_icrc, #USB5_POLY
                crcnib  A_icrc, #USB5_POLY                ' Data bits 0..7 calculated
                getbyte A_utx, A_frame, #0                  ' Send the low byte of the A_frame number
                call    #A_utx_byte
                shl     A_sof_pkt, #8                     ' Shift out processed bits to set up CRCBIT * 3
                rep     #2, #3                          ' Three data bits left to process
                shl     A_sof_pkt, #1             wc
                crcbit  A_icrc, #USB5_POLY                ' Data bits 8..10 calculated
                xor     A_icrc, #$1f                      ' Final XOR value
                getbyte A_utx, A_frame, #1                  ' Send remaining A_frame number bits
                shl     A_icrc, #3                        ' Merge CRC to bits 7..3 of the final token byte
                or      A_utx, A_icrc
                call    #A_utx_byte                       ' Last start-of-A_frame byte is on the wire
                add     A_frame, #1                       ' Calculate number for next A_frame
                and     A_frame, ##$7ff
                mov     A_isr_tmp, ##IP_DELAY_FS          ' Use normal inter-packet delay when full-speed
.wait
                rqpin   A_utx, #DM_A
                testb   A_utx, #SOPB              wc
        if_c    jmp     #.wait
                waitx   A_isr_tmp                         ' Make sure bus is idle before
                bitl    A_hstatus, #TXN_LIMITB            ' Bus ready for traffic
                reti1
.A_no_txn_zone
                addct1  A_hct1, A_no_txn_zone               ' Refresh the "no txn zone" timespan
                bith    A_hstatus, #TXN_LIMITB
                reti1
''
'' A_dev_reset
'------------------------------------------------------------------------------
' A device connection was detected. Set the appropriate smart pin FS/LS speed
' mode to match the device and perform a A_reset sequence prior to device
' enumeration.
'------------------------------------------------------------------------------
A_dev_reset
                rqpin   A_urx, #DM_A
                testb   A_urx, #K_RESUMEB         wc      ' K differential "1" in FS mode signals low-speed
        if_c    call    #A_set_speed_low                  ' These subroutines must restore the caller C flag
        if_nc   call    #A_set_speed_full                 ' state on return if C is used.
A_reset
                setint1 #0                              ' Don't want A_frame interrupt at A_reset
                wypin   #OUT_SE0, #DM_A                   ' Assert bus A_reset
                waitx   ##RESET_HOLD                    ' Spec is >= 10ms
                wypin   #OUT_IDLE, #DM_A
                bitl    A_hstatus, #TXN_LIMITB            ' Reset the A_frame txn OK/!OK flag
                mov     A_frame, #0                       ' Reset the A_frame count
                getct   A_hct1                            ' Reset the A_frame timer
                addct1  A_hct1, ##A_txn_ok_zone
                setint1 #1                              ' Set ISR event trigger to CT1-equals-CT
                mov     A_hctwait, ##_1ms * 21
                call    #poll_waitx                     ' Allow A_reset recovery time (Section 9.2.6.2)
                ret
''
'' A_set_speed_full
'------------------------------------------------------------------------------
' Full-speed is the host's native speed, so all that is needed is to set the FS
' settings to startup defaults.
'------------------------------------------------------------------------------
' On entry:
' On exit: Restore caller C flag state if C flag used!
'------------------------------------------------------------------------------
A_set_speed_full
                mov     A_txn_ok_zone, ##TXN_OK_FS        ' Set FS bandwidth usage limits
                mov     A_no_txn_zone, ##NO_TXN_FS
                mov     A_max_pkt_size, #64               ' Set FS control read/write DATAx packet size
                mov     A_tat_wait, ##TAT_WAIT_FS         ' Bus turn-around time in full-speed bit periods
        _ret_   mov     A_ip_delay, ##IP_DELAY_FS         ' Inter-packet delay in full-speed bit periods
''
'' A_set_speed_low
'------------------------------------------------------------------------------
' When a low-speed device connects, the D-/D+ signalling is inverted. If there
' is a downstream hub A_connected (not yet implemented), the baud generator
' remains set at the full-speed rate, but signalling is switched to low-speed,
' which reverses the D-/D+ polarity. The polarity can be changed without
' putting the smart pins into A_reset.
'------------------------------------------------------------------------------
' On entry:
' On exit: Restore caller C flag state if C flag used!
'------------------------------------------------------------------------------
A_set_speed_low
                test    A_hstatus, #DWNSTRM_HUBF wz       ' If no downstream hub A_connected, set low-speed baudrate
        if_z    dirl    #DP_A
        if_z    dirl    #DM_A
#ifdef P2_REV_A
                wrpin   ##USB_V1HMODE_LS, #DP_A           ' Low-speed signalling is always used
                wrpin   ##USB_V1HMODE_LS, #DM_A
        if_z    wxpin   ##_1_5Mbps, #DM_A                 ' Set 1.5Mbs baudrate if no downstream hub
#else
                wrpin   ##USB_V2MODE, #DP_A               ' Low-speed signalling is always used
                wrpin   ##USB_V2MODE, #DM_A
        if_z    wxpin   ##USB_H_LS_NCO, #DM_A             ' Host mode and 1.5Mbs baudrate if no downstream hub
#endif
        if_z    dirh    #DP_A
        if_z    dirh    #DM_A
                mov     A_txn_ok_zone, ##TXN_OK_LS        ' Set low-speed bandwidth usage limits
                mov     A_no_txn_zone, ##NO_TXN_LS
                mov     A_max_pkt_size, #8                ' Set LS control read/write DATAx packet size
                mov     A_tat_wait, ##TAT_WAIT_LS         ' Bus turn-around time in low-speed bit periods
                mov     A_ip_delay, ##IP_DELAY_LS         ' Inter-packet delay in low-speed bit periods
        _ret_   bith    A_hstatus, #LOW_SPEEDB            ' DM_A pulled high, so it's a Low-Speed device
''
'' A_hmemcpy
'------------------------------------------------------------------------------
' Bulk hub<->hub byte copy. Does not check for src/dest buffer overlap.
'------------------------------------------------------------------------------
' On entry:
'   PTRA - source address.
'   PB - destination address.
'   A_hr0 - length of copy, in bytes.
' On exit:
'------------------------------------------------------------------------------
A_hmemcpy
                rdbyte  A_htmp, ptra++
                wrbyte  A_htmp, pb
                add     pb, #1
        _ret_   djnz    A_hr0, #A_hmemcpy
''
'' A_host_error
'------------------------------------------------------------------------------
' A fatal USB error has occured. Notify the client and spin in a pseudo-idle
' loop until the errant device is A_disconnected.
'------------------------------------------------------------------------------
' On entry:
' On exit:
'------------------------------------------------------------------------------
A_host_error
                loc     ptra, #@A_usb_error_code
                wrlong  A_retval, ptra                    ' Post the USB operation result value
                wxpin   #USB_ERROR, #USB_A_EVENT_REPO     ' Signal the client an error has occurred
                mov     A_hrep, #5
.spin
                drvnot  #HOST_A_ERROR_LED
                mov     A_hctwait, ##PULSE_TIME >> 3
                call    #poll_waitx
                rqpin   A_urx, #DM_A
                testb   A_urx, #SE0_RESETB        wc
        if_nc   jmp     #.spin
                djnz    A_hrep, #.spin
        if_c    ret                             wc      ' Handle disconnect?
                mov     A_hrep, #5
                jmp     #.spin
''
'' A_poll_kbd, A_poll_mouse
'------------------------------------------------------------------------------
' Post interrupt IN transactions at configured intervals.
'------------------------------------------------------------------------------
' On entry:
' On exit:
'------------------------------------------------------------------------------
A_poll_kbd
                getct   A_hct3
                cmp     A_hmouse_ep_addr, #0      wz
        if_z    addct3  A_hct3, ##KBD_POLL_INTERVAL       ' Set the timer for next poll interval
        if_nz   addct3  A_hct3, ##_1ms * 4                ' Try to keep 4ms timespan between them
        if_nz   mov     A_poll_target, #A_poll_mouse
                jmp     #A_hget_kbd_in_report             ' Post IN txn and return to caller
A_poll_mouse
                getct   A_hct3
                cmp     A_hkbd_ep_addr, #0         wz
        if_z    addct3  A_hct3, ##MOUSE_POLL_INTERVAL     ' Mouse is the only A_connected device
        if_nz   addct3  A_hct3, ##_1ms * 4
        if_nz   mov     A_poll_target, #A_poll_kbd
                jmp     #A_hget_mouse_in_report           ' Post IN txn and return to caller
''


'' Host registers
A_htmp            long    0                               ' Scratch registers whose context remains within the same code block
A_htmp2           long    0
A_hrep            long    0                               ' Repeat count
A_hsave0          long    0                               ' Subroutine parameter saves
A_hsave1          long    0
A_hsave2          long    0
A_utx_tweak       long    0                               ' When sysclock speed above ~120MHz, need some fairy dust for USB tx
A_isr_tmp         long    0
A_pkt_tmp         long    0                               ' Tmp storage for routines that deal with datax packets
A_hr0             long    0                               ' Multi-purpose registers
A_hr1             long    0
A_hr2             long    0
A_hr3             long    0
A_hpar1           long    0                               ' Routine entry/exit parameters
A_hpar2           long    0
A_hpar3           long    0
A_hct1            long    0                               ' Timer for the 1ms A_frame generator interrupt service routine
A_hct2            long    0                               ' Function response bus turn-around timer
A_hct3            long    0                               ' Keyboard/mouse poll timer
' This register block is A_reset to zero when a USB device connects
A_hreg_init_start
A_hstatus         long    0                               ' Host status flags
A_hctwait         long    0                               ' Poll-based wait clocks
A_ip_delay        long    0                               ' Inter-packet delay in bit periods for A_connected device speed
A_tat_wait        long    0                               ' Maximum bus turn-around time in bit periods for A_connected device speed
A_nak_retry       long    0                               ' NAK A_retry count, unlimited retries if zero
A_txn_ok_zone     long    0                               ' Timespan that packets can be put on the bus
A_no_txn_zone     long    0                               ' Timespan in which packets must wait for bus to become available
A_xfer_retry      long    0                               ' Control transfer A_retry count
A_retry           long    0                               ' Transaction A_retry count
A_utx             long    0                               ' Byte to transmit on USB
A_urx             long    0                               ' Written by ISR only. LSByte receiver status flags, MSByte received data
A_newb_flg        long    0                               ' Receive "new byte" bit toggle detector
A_poll_target     long    0                               ' Address of a subroutine that polls an interrupt IN endpoint
A_hevent          long    0                               ' Command/request eventID posted by the driver cog
A_max_pkt_size    long    0                               ' Maximum payload bytes allowed, likely to change on device connect.
A_total_data      long    0                               ' Total bytes to tx/rx in a transfer data stage
A_stage_data      long    0                               ' Count of bytes sent/received so far during a data stage.
A_pkt_data        long    0                               ' Payload size of an OUT packet or bytes received on IN
A_frame           long    0                               ' USB 1ms A_frame counter value
A_sof_pkt         long    0                               ' ISR A_frame# packet and CRC5
A_icrc            long    0                               ' Only used by the 1ms A_frame output ISR routine
A_pkt_cnt         long    0                               ' Count of DATAx packet payload bytes
A_crc             long    0                               ' Used for CRC16 calculation
A_ep_addr_pid     long    0                               ' Endpoint and device addresses for A_connected device
A_retval          long    0                               ' Global success/fail return parameter
A_context_retval  long    0                               ' Operation contextual return parameter
' Keyboard/mouse stuff
A_hctrl_ep_addr   long    0
A_hctrl_max_pkt   long    0
A_hconfig_base    long    0
A_hcon_tot_len    long    0                               ' Size of the complete config descriptor chain
A_hhid_intf_idx   long    0                               ' Used during verbose descriptor terminal output
A_hsearch_key     long    0                               ' Descriptor type to search for in the config chain
A_hnext_desc      long    0                               ' Offset from the config descriptor start address to the next descriptor in the chain
A_hmouse_ep_addr  long    0
A_last_mouse_data long    0                               ' Last mouse data passed to the client
A_hmouse_poll_cnt long    0
' The following registers must match the layout of the "public" keyboard
' interface that is in hub RAM, starting at the kbd_count label.
A_hkbd_head       long    0                               ' Keyboard data buffer head
A_hkbd_ep_addr    long    0                               ' Keyboard interface endpoint address
A_hkbd_report     long    0                               ' Address of report descriptor data for the keyboard interface
A_hkbd_poll_cnt   long    0                               ' Poll interval counter used for key auto-repeat
A_hkbd_repeat     long    0                               ' Key auto-repeat delay threshold
A_hkbd_scancode   long    0                               ' kbd_scancode
A_hkbd_modkeys    long    0                               ' kbd_modkeys
A_hkbd_keypress   long    0                               ' kbd_keypress
A_hkbd_ledstates  long    0                               ' kbd_ledstates
A_hreg_init_end
                fit     $1e0                            ' Start of monitor in ROM registers
'------------------------------------------------------------------------------
' P2 standard register locations:
'------------------------------------------------------------------------------
'$1F0           RAM / IJMP3                             interrupt call   address for INT3
'$1F1           RAM / IRET3                             interrupt return address for INT3
'$1F2           RAM / IJMP2                             interrupt call   address for INT2
'$1F3           RAM / IRET2                             interrupt return address for INT2
'$1F4           RAM / IJMP1                             interrupt call   address for INT1
'$1F5           RAM / IRET1                             interrupt return address for INT1
'$1F6           RAM / PA                                CALLD-imm return, CALLPA parameter, or LOC address
'$1F7           RAM / PB                                CALLD-imm return, CALLPB parameter, or LOC address
'$1F8           PTRA                                    pointer A to hub RAM
'$1F9           PTRB                                    pointer B to hub RAM
'$1FA           DIRA                                    output enables for P31..P0
'$1FB           DIRB                                    output enables for P63..P32
'$1FC           OUTA                                    output states for P31..P0
'$1FD           OUTB                                    output states for P63..P32
'$1FE           INA *                                   input states for P31..P0
'$1FF           INB **                                  input states for P63..P32
' * also debug interrupt call address
'** also debug interrupt return address
'------------------------------------------------------------------------------
''
' #endregion (USB host cog)
' #region (Host LUT execution)
                orgf     $200 ' WAS 'org' IN ORIGINAL
A_hlut_start
'' A_on_connect
'------------------------------------------------------------------------------
' Perform configuration stuff required when a device intitially connects.
'------------------------------------------------------------------------------
' On entry:
' On exit:
'------------------------------------------------------------------------------
A_on_connect
                mov     A_hr0, #2                         ' FIXME: need to determine a reasonable limit for A_reset & A_retry
                call    #A_dev_reset                      ' Reset device prior to Get Device Descriptor request
.A_retry
                testb   A_hstatus, #LOW_SPEEDB    wc
        if_c    mov     A_hpar1, #USB_SPEED_LOW           ' Also the connect speed
        if_nc   mov     A_hpar1, #USB_SPEED_FULL
                mov     A_ep_addr_pid, ##EP_ADDR_ZERO     ' New connect, use pre-calc CRC for ep/addr zero
                loc     ptra, #@A_get_dev_desc            ' Hub start address of GetDeviceDescriptor SETUP struct
                wrword  #$40, ptra[wLength]             ' Request IN data stage max of 64 bytes will test actual < requested logic
                loc     pb, #@A_dev_desc_buff             ' Start address of DeviceDescriptor struct for IN data
                call    #A_control_read                   ' Execute GetDeviceDescriptor()
                cmp     A_retval, #PID_ACK        wz
        if_z    jmp     #.A_get_dev_desc
                mov     A_hctwait, ##_1ms * 500           ' If the first GetDescriptor() fails, A_reset and try again
                call    #poll_waitx
                sub     A_hr0, #1         wz              ' FIXME: need to determine a reasonable limit for A_reset & A_retry
        if_z    jmp     #A_host_error                     ' Post error and spin until the errant device is A_disconnected
                call    #A_reset                          ' Try another A_reset to see if the device responds
                jmp     #.A_retry
.A_get_dev_desc
                loc     pa, #@A_dev_desc_buff             ' Fetch the max packet size for control transactions from the
                add     pa, #DEV_bMaxPktSize0           ' appropriate Device Descriptor struct member offset
                rdbyte  A_max_pkt_size, pa
                mov     A_hctwait, ##_1ms
                call    #poll_waitx                     ' Do a A_reset before SetAddress(), but wait a bit first
                call    #A_reset
                loc     ptra, #@A_set_address             ' Hub start address of SetAddress SETUP struct
                wrword  #1, ptra[wValue]                ' Only support one device port at this time
                call    #A_control_write                  ' Execute SetAddress()
                cmp     A_retval, #PID_ACK        wz
        if_nz   ret                                     ' Back to idle if not ACK
                mov     A_hctwait, ##_1ms * 8
                call    #poll_waitx                     ' Allow SetAddress() a minimum 2ms recovery interval
                mov     A_ep_addr_pid, ##1 << 8           ' Device ep/addr now #1 and endpoint zero
                call    #A_calc_crc5
                loc     ptra, #@A_get_dev_desc            ' Repeat SETUP for GetDeviceDescriptor()
                loc     pb, #@A_dev_desc_buff             ' Start address of DeviceDescriptor struct has exact descriptor length
                rdbyte  A_total_data, pb
                wrword  A_total_data, ptra[wLength]       ' Assign it to the SETUP wLength struct member
                call    #A_control_read                   ' Execute GetDeviceDescriptor() again, but with updated data length
                cmp     A_retval, #PID_ACK        wz
        if_nz   ret                                     ' Back to idle if not ACK
                mov     A_hctrl_ep_addr, A_ep_addr_pid      ' Make the device control address and endpoint official
                loc     ptra, #@A_dev_desc_buff           ' Do the same with the control max packet size
                rdbyte  A_hctrl_max_pkt, ptra[DEV_bMaxPktSize0]
                mov     A_hctwait, ##_1us * 500
                call    #poll_waitx
                loc     ptra, #@A_get_config_desc         ' Hub start address of GetConfigurationDescriptor SETUP struct
                wrword  #$ff, ptra[wLength]             ' Maximum DATAx bytes for receive to the SETUP struct
                loc     pb, #@A_con_desc_buff             ' Hub start address of ConfigurationDescriptor structure
                call    #A_control_read                   ' Execute GetConfigurationDescriptor()
                cmp     A_retval, #PID_ACK        wz
        if_nz   ret
                loc     ptra, #@A_con_desc_buff           ' Check the config descriptor struct for expected data
                mov     A_hconfig_base, ptra              ' Will need this for configuration
                rdbyte  A_hr0, ptra++                     ' Config.bLength is at offset zero, expect >= CON_DESC_LEN
                rdbyte  A_hr1, ptra++                     ' Config.bDescType is next member, expect = TYPE_CONFIG constant
                rdword  A_htmp, ptra                      ' Config.wTotalLen is next member, expect >= bytes actually received
                cmp     A_hr0, #CON_DESC_LEN      wcz
        if_ae   cmp     A_hr1, #TYPE_CONFIG       wcz
        if_z    cmp     A_htmp, A_total_data        wcz
        if_b    mov     A_retval, #ERR_CONFIG_FAIL
        if_b    jmp     #A_host_error
                jmp     #A_hparse_con_desc
''
'' A_control_read
'------------------------------------------------------------------------------
' Perform a control read transaction (Section 8.5.3, Figure 8-37).
' Status reporting is always in the function-to-host direction.
'------------------------------------------------------------------------------
' On entry:
'   PTRA - start address of the SETUP data in hub.
'   PB - start address of the buffer/struct to be written to during the IN data
'     stage.
'   A_ep_addr_pid - device address, endpoint and CRC5.
' On exit:
'   A_retval - PID_ACK on success, otherwise error. If successful, reg A_total_data
'     contains the count of data stage bytes actually received, which must
'     always be <= the count requested.
'   A_context_retval - ERR_NONE if the overall transfer succeeds, otherwise a
'     more specific USB operation error code.
'------------------------------------------------------------------------------
A_control_read
                mov     A_hpar1, A_ep_addr_pid
                mov     A_hpar2, ptra
                mov     A_hpar3, pb                       ' Save dest buffer pointer
                mov     A_xfer_retry, #XFER_RETRIES
.xfer_start
                rdword  A_total_data, ptra[wLength]       ' Get the size of the data stage from the SETUP struct
                call    #A_txn_setup                      ' SETUP logic is the same for both control reads and writes
                cmp     A_retval, #PID_ACK        wz
        if_nz   ret                                     ' Back to caller to handle error
                cmp     A_total_data, #0          wz
        if_z    jmp     #A_pre_status_in                  ' No data, so directly to status stage
                mov     A_stage_data, #0                  ' Prepare for data stage
                mov     A_nak_retry, ##IN_NAK_RETRIES
                bith    A_hstatus, #DATAx_TGLB            ' Data stage starts with DATA1 PID
.data
                mov     A_pkt_data, A_total_data
                sub     A_pkt_data, A_stage_data
                cmp     A_pkt_data, A_max_pkt_size  wcz
        if_a    mov     A_pkt_data, A_max_pkt_size          ' Have a full packet with more data left
.A_nak_retry
                mov     A_retry, #TXN_RETRIES             ' Reset bus error A_retry limit
.in_A_retry
                call    #A_txn_in
                cmp     A_retval, #PID_ACK        wz      ' Commit on ACK
        if_z    jmp     #.commit
                cmp     A_retval, #PID_STALL      wz
        if_z    jmp     #.A_xfer_retry                    ' STALL triggers a transfer A_retry
                call    #A_retry_wait                     ' Wait a bit before A_retry
                cmp     A_retval, #PID_NAK        wz
        if_z    jmp     #.A_nak_retry                     ' Function not ready to send data
                cmp     A_retval, #ERR_NAK        wz
        if_z    jmp     #.A_xfer_retry                    ' NAK limit exceeded triggers a transfer A_retry
                cmp     A_retval, #ERR_TXN_RETRY  wz
        if_nz   jmp     #.in_A_retry                      ' Bus error A_retry
                ret                                     ' The transfer has failed
.commit
                cmp     A_pkt_cnt, #0             wz      ' Empty pkt means previous pkt was max_pkt_len
        if_z    jmp     #.pre_status                    ' and also end-of-data
                loc     ptra, #@A_urx_buff                ' Copy DATAx in rx buffer to dest struct
                mov     A_hr0, A_pkt_cnt
                call    #A_hmemcpy                        ' A_hmemcpy(PTRA, PB, A_hr0)
                add     A_stage_data, A_pkt_cnt             ' Update bytes received on commit
                cmp     A_stage_data, A_total_data  wz      ' Have all asked-for bytes?
        if_z    jmp     #.pre_status                    ' Have all the data that's coming, so done
                cmp     A_pkt_cnt, A_pkt_data       wcz     ' Check for short packet
        if_b    jmp     #.pre_status                    ' Actual payload < expected means end of data stage
        if_a    mov     A_retval, #ERR_PACKET
        if_a    mov     A_context_retval, A_retval          ' In this case overall and context are the same
        if_a    ret                                     ' Caller must handle ERR_PACKET
                bitnot  A_hstatus, #DATAx_TGLB            ' Toggle DATAx sync bit
                jmp     #.data                          ' Start next IN transaction
.pre_status
                mov     A_total_data, A_stage_data          ' Replace the asked-for byte count with the bytes actually received
                setbyte A_ep_addr_pid, #PID_OUT, #0
                mov     A_pkt_data, #0
                bith    A_hstatus, #DATAx_TGLB            ' Status stage starts with DATA1 PID
                mov     A_retry, #TXN_RETRIES             ' Reset txn A_retry limit
                mov     A_nak_retry, ##OUT_NAK_RETRIES
.out_A_retry
                call    #A_txn_out                        ' Send empty OUT DATAx packet to confirm IN data received OK
                cmp     A_retval, #PID_ACK        wz
        if_z    ret                                     ' All is good when ACK
                cmp     A_retval, #PID_STALL      wz
        if_z    jmp     #.A_xfer_retry                    ' STALL triggers a transfer A_retry
                call    #A_retry_wait                     ' Wait a bit before A_retry
                cmp     A_retval, #ERR_NAK        wz
        if_z    jmp     #.A_xfer_retry                    ' NAK limit exceeded triggers a transfer A_retry
                cmp     A_retval, #ERR_TXN_RETRY  wz
        if_nz   jmp     #.out_A_retry                     ' Retry due to bus error or OUT-NAK A_retry limit not reached
                ret                                     ' Caller must handle transfer retirement
' I've encountered transfer STALL, even though the data looks correct, and
' instances of getting stuck in an endless OUT-NAK loop. Repeating the entire
' ControlRead() transfer gets things unstuck most of the time...
.A_xfer_retry
                mov     A_hctwait, ##XFER_WAIT
                call    #poll_waitx
                call    #A_wait_txn_ok
                mov     A_ep_addr_pid, A_hpar1
                mov     ptra, A_hpar2
                mov     pb, A_hpar3
                djnz    A_xfer_retry, #.xfer_start
                mov     A_context_retval, A_retval          ' Preserve the USB error code
        _ret_   mov     A_retval, #ERR_XFER_RETRY
''
'' A_control_write
'------------------------------------------------------------------------------
' Perform a control write transaction (Section 8.5.3, Figure 8-37). Status
' reporting is always in the function-to-host direction. It is assumed that
' the SETUP data struct is filled with the required values.
'------------------------------------------------------------------------------
' On entry:
'   PTRA - points to the start of the struct for the SETUP data.
'   PB - the start address of the struct/buffer to be read for the OUT data
'     stage.
'   A_ep_addr_pid - the proper CRC'd address and endpoint to use.
' On exit:
'   A_retval - used to convey the success/failure of each stage.
'   A_context_retval - ERR_NONE if the overall transfer succeeds, otherwise a
'     more specific USB operation error code.
'------------------------------------------------------------------------------
A_control_write
                mov     A_hpar1, A_ep_addr_pid
                mov     A_hpar2, ptra
                mov     A_hpar3, pb
                mov     A_xfer_retry, #XFER_RETRIES
.xfer_start
                mov     A_nak_retry, #NAK_NOLIMIT         ' Unlimited NAK retries the default
                rdword  A_total_data, ptra[wLength]       ' Get the size of the data stage from the SETUP struct
                call    #A_txn_setup                      ' SETUP logic is the same for both control reads and writes
                cmp     A_retval, #PID_ACK        wz
        if_nz   ret                                     ' Back to caller to handle error
                cmp     A_total_data, #0          wz
        if_z    jmp     #A_pre_status_in                  ' No data, so directly to status stage
                mov     A_stage_data, #0                  ' Prepare for data stage
                setbyte A_ep_addr_pid, #PID_OUT, #0       ' PID isn't part of the CRC calc
                bith    A_hstatus, #DATAx_TGLB            ' Data stage starts with DATA1 PID
                mov     A_retry, #TXN_RETRIES             ' Reset txn A_retry limit
.data
                mov     A_pkt_data, A_total_data
                sub     A_pkt_data, A_stage_data
                cmp     A_pkt_data, A_max_pkt_size  wcz
        if_a    mov     A_pkt_data, A_max_pkt_size          ' Data remaining is > max_pkt, so cap at max_pkt
.out_A_retry
                mov     ptra, pb                        ' Set current location in the OUT data buffer/struct
                call    #A_txn_out
                cmp     A_retval, #PID_ACK        wz
        if_z    jmp     #.commit                        ' Function got the data
                call    #A_retry_wait                     ' Wait a bit before A_retry
                cmp     A_retval, #ERR_TXN_RETRY  wz      ' Out of !NAK retries?
        if_nz   jmp     #.out_A_retry
                ret                                     ' Caller must handle transfer retirement
.commit
                mov     pb, ptra                        ' Save the current buffer/struct location
                add     A_stage_data, A_pkt_data
                cmp     A_stage_data, A_total_data  wz
        if_nz   bitnot  A_hstatus, #DATAX_TGLB            ' Toggle DATAx sync bit
        if_nz   jmp     #.data                          ' More data to send
A_pre_status_in
                bith    A_hstatus, #DATAx_TGLB            ' Status stage expects IN to be an empty DATA1 packet
                mov     A_retry, #TXN_RETRIES             ' Reset txn A_retry limit
.status_A_retry
                mov     A_pkt_data, #0
                call    #A_txn_in
                cmp     A_retval, #PID_ACK        wz      ' ACK says a DATA1 packet was received
        if_z    cmp     A_pkt_data, #0            wz      ' DEBUG: should never fail if the function is USB compliant?
        if_z    ret                                     ' Control Write finished
                cmp     A_retval, #PID_STALL      wz      ' STALL needs to go to the caller for resolution
        if_z    ret
                call    #A_retry_wait                     ' NAK or bus error, so delay a bit
                cmp     A_retval, #ERR_TXN_RETRY  wz
        if_nz   jmp     #.status_A_retry
                ret                                     ' Caller must handle transfer retirement
''
'' A_do_int_in
'------------------------------------------------------------------------------
' Execute an IN interrupt transaction.
'------------------------------------------------------------------------------
' On entry:
'   A_ep_addr_pid - The function address and endpoint for the IN request.
'   A_hpar2 - Address of the IN data buffer
'   A_hpar3 - Word1 has max data packet size, word0 has the DATAx to expect.
' On exit:
'   A_retval - the result of the operation.
'   A_hpar3 - the count of IN data bytes actually received.
'------------------------------------------------------------------------------
A_do_int_in
                getword A_htmp, A_hpar3, #0
                cmp     A_htmp, #PID_DATA0        wz
                bitnz   A_hstatus, #DATAx_TGLB            ' Set/A_reset flag for DATAx to expect
                mov     A_retry, #TXN_RETRIES
.A_retry
                getword A_pkt_data, A_hpar3, #1             ' IN max packet length
                call    #A_txn_in
                cmp     A_retval, #PID_ACK        wz      ' ACK if data received
        if_z    jmp     #.commit
                cmp     A_retval, #PID_NAK        wz      ' NAK if no data available (common)
        if_nz   cmp     A_retval, #PID_STALL      wz      ' STALL if the endpoint has a transfer issue and must be A_reset (rare)
        if_z    jmp     #.post_ret                      ' The caller must handle either
                call    #A_retry_wait
                cmp     A_retval, #ERR_TXN_RETRY  wz
        if_z    jmp     #.post_ret
                jmp     #.A_retry
.commit
                cmp     A_pkt_cnt, #0             wz
        if_z    jmp     #.post_ret                      ' Skip copy if it's an empty packet
                loc     ptra, #@A_urx_buff                ' Copy the rx buffer
                mov     pb, A_hpar2                       ' to the destination buffer
                mov     A_hr0, A_pkt_cnt
                call    #A_hmemcpy                        ' A_hmemcpy(PTRA, PB, A_hr0)
.post_ret
                mov     A_hpar3, A_pkt_cnt                  ' IN bytes actually received
                ret
''
'' A_host_A_reset
A_host_A_reset
                setint1 #0
                dirl    #DP_A                             ' Put smart pins into A_reset
                dirl    #DM_A
#ifdef P2_REV_A
                wrpin   ##USB_V1HMODE_FS, #DP_A           ' The host is also the root hub, so full-speed is its native speed
                wrpin   ##USB_V1HMODE_FS, #DM_A
                wxpin   ##_12Mbps, #DM_A                  ' Default to Full-Speed
#else
                wrpin   ##USB_V2MODE, #DP_A               ' Low-speed signalling is always used
                wrpin   ##USB_V2MODE, #DM_A
                wxpin   ##USB_H_FS_NCO, #DM_A             ' Host mode and default to 12Mbs baudrate
#endif
                dirh    #DM_A                             ' Crank them smart pins up
                dirh    #DP_A
                waitx   ##_1us * 10
                wypin   ##OUT_IDLE, #DM_A
                mov     pa, #A_hreg_init_start            ' Reset all host common registers
.regloop
                altd    pa
                mov     0-0, #0
                add     pa, #1
                cmp     pa, #A_hreg_init_end      wz
        if_nz   jmp     #.regloop
                loc     ptra, #@A_usb_cache_start         ' USB descriptor buffer area
                mov     A_hr0, ##A_usb_cache_end
                sub     A_hr0, ptra
                mov     A_hr1, #0                         ' Zero fill descriptor buffers
.buffloop
                wrbyte  A_hr1, ptra++
                djnz    A_hr0, #.buffloop
                mov     A_poll_target, ##A_hpulse_led
                call    A_poll_target
' Fall through to A_disconnected loop
' vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
''
'' A_disconnected
'-----------------------------------------------------------------------------------------------------------------
' Device connect handling (Section 7.1.7.3).
'-----------------------------------------------------------------------------------------------------------------
' The 15K pull-down resistors on D+ and D- allow the host to passively monitor the bus lines while waiting for a
' device to connect (Section 7.1.7.3).
'-----------------------------------------------------------------------------------------------------------------
A_disconnected
                pollct3                         wc
        if_c    call    A_poll_target                     ' Toggle the host wait for connect USER_LED
                rqpin   A_urx, #DM_A
                and     A_urx, #J_IDLEF | K_RESUMEF wcz   ' Wait for rise of J or K, mutually exclusive
        if_z    jmp     #A_disconnected                   ' J and K still low, so keep waiting for connect
        if_ne   jmp     #.connect_test                  ' J or K is high, so test for connect
.se1_test
                mov     A_hctwait, ##_1ms * 100           ' J and K high is illegal SE1 state, so wait and retest
                call    #poll_waitx
                rqpin   A_urx, #DM_A
                and     A_urx, #J_IDLEF | K_RESUMEF wcz
        if_ne   mov     A_retval, #ERR_NONE               ' SE0 or idle state A_resets any previous error
        if_ne   jmp     #A_disconnected                   ' Back to connect detection loop
.se1            'SE1 is a fatal error condition
                waitx   ##_1ms * 100
                mov     A_retval, #ERR_SE1
                call    #A_host_error                     ' Seeing SE1 for any length of time is not good...
.connect_test                                           ' Test lines until stable J/K state seen
                mov     A_hctwait, ##_1ms * 100
                call    #poll_waitx                     ' Total of 100ms debounce interval (Section 7.1.7.3)
                rqpin   A_urx, #DM_A
                and     A_urx, #J_IDLEF | K_RESUMEF wcz
        if_z    jmp     #A_disconnected                   ' DP_A and DM_A low
        if_e    jmp     #.se1_test                      ' DP_A and DM_A high
A_connected
                bith    A_hstatus, #CONNECTEDB            ' Device plugged in
                drvh    #HOST_A_ACTIVE_LED
                call    #A_on_connect                     ' Initial device configuration
                cmp     A_retval, #PID_ACK        wz      ' Anything other than ACK means the device is unusable
        if_nz   jmp     #A_disconnected
' Fall through to idle/processing loop
' vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
A_hidle
                rqpin   A_urx, #DM_A
                testb   A_urx, #SE0_RESETB        wc
        if_c    jmp     #.se0_test
                pollct3                         wc
        if_c    call    A_poll_target                     ' Call the current poll/wait subroutine
                jmp     #A_hidle
' Check for extended SE0 state on the bus
.se0_test
                mov     A_hctwait, ##_1ms
                call    #poll_waitx                     ' Wait a bit and test for SE0 again
                rqpin   A_urx, #DM_A
                testb   A_urx, #SE0_RESETB        wc
        if_nc   jmp     #A_hidle                          ' Bus still IDLE
                call    #A_wait_txn_ok
                setint1 #0                              ' Turn off A_frame strobe interrupt
                wypin   ##OUT_IDLE, #DM_A                 ' Float USB
                drvh    #HOST_A_ACTIVE_LED
                wxpin   #DEV_DISCONNECT, #USB_A_EVENT_REPO ' Notify client of disconnect
                jmp     #A_host_A_reset                     ' Device A_disconnected
''
'' A_hpulse_led
'------------------------------------------------------------------------------
' Toggle a user LED when the host is the connect wait loop or the main USB
' processing loop.
'------------------------------------------------------------------------------
A_hpulse_led
                getct   A_hct3
                addct3  A_hct3, ##PULSE_TIME
        _ret_   drvnot  #HOST_A_ACTIVE_LED
''
A_hlut_end
                fit     $400
' #endregion (Host LUT execution)
                orgh
'
' NOTE: Hub execution and data regions moved to kbmprea.s
'       Common definitions moved to cogkbmc.s
'
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
