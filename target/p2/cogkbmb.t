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

' USB "portB" connector pin assignments (upper port):
        HOST_B_ACTIVE_LED = _USB_BASE_PIN + 0
' USB protection enable/disable
        USB_PROTECT_ON = _USB_BASE_PIN + 1
' Smart pin pair used for the USB transceiver:
        DM_B = _USB_BASE_PIN + 2   ' DM_B is "The Brain"
        DP_B = _USB_BASE_PIN + 3   ' DP_B is passive

' Long repository pin#:
        USB_B_EVENT_REPO = _USB_BASE_PIN + 8

' LED to blink at host/driver fatal error:
        HOST_B_ERROR_LED = LED57

' #region (USB host cog)
dat
                orgh
                alignl
                org
'' B_usb_host_start
'------------------------------------------------------------------------------
' The USB host cog.
'------------------------------------------------------------------------------
B_usb_host_start

                'mov     lmm_bufad, PTRA                 ' Location of hub buffer for serial routine 
                flth    #HOST_B_ERROR_LED
                drvh    #USB_PROTECT_ON                 ' Enable P2-ES 64006-ES Serial Host USB Protection
' FIXME: kludge to set USB tx byte write ACKPIN<->WRPIN delay.
                'mov     B_htmp, ##__CLKFREQ
                mov     B_htmp, ##_CLOCKFREQ
                cmp     B_htmp, ##168_000_000     wcz
        if_be   mov     B_utx_tweak, #0
        if_a    mov     B_utx_tweak, #20
' Copy lut execution code from hub to lut
                mov     B_htmp, ##@B_hlut_end - 4           ' Dealing with hub addresses, so convert byte
                sub     B_htmp, ##@B_hlut_start             ' addresses to the N - 1 longs required by SETQ2
                shr     B_htmp, #2
                loc     pb, #@B_hlut_start
                setq2   B_htmp
                rdlong  0, pb                           ' Do the hub->lut copy
                mov     ijmp1, #B_isr1_B_frame              ' Set the USB 1ms B_frame handler ISR routine
                wxpin   #USB_STARTED, #USB_B_EVENT_REPO   ' Signal the client that the USB is started
                jmp     #B_host_B_reset                     ' Initialize host and enter main processing loop
''
'' B_txn_setup
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
'   B_retval - PID_ACK on success, otherwise error code.
'------------------------------------------------------------------------------
B_txn_setup
                setbyte B_ep_addr_pid, #PID_SETUP, #0
                mov     B_pkt_data, #SETUP_TXN_LEN        ' SETUP is single fixed size DATAx packet
                bitl    B_hstatus, #DATAx_TGLB            ' And always uses DATA0 packet
                mov     B_retry, #TXN_RETRIES             ' Retries possible as function will ignore a corrupt packet
                mov     pa, ptra                        ' Save SETUP struct pointer in case of B_retry
.setup
                call    #B_txn_out                        ' SETUP/OUT are the same transaction type, just different PIDs
                cmp     B_retval, #PID_ACK        wz
        if_z    ret
                call    #B_retry_wait
                cmp     B_retval, #ERR_TXN_RETRY  wz
        if_z    ret
                mov     ptra, pa                        ' Restore SETUP's DATAx pointer
                jmp     #.setup
''
'' B_txn_in
'------------------------------------------------------------------------------
' IN/INTERRUPT transaction.
' Possible function response: STALL or NAK handshake, or DATAx packet.
'------------------------------------------------------------------------------
' On entry:
'   B_ep_addr_pid - PID_IN(b0..7), address(b8..b14), endpoint(b15..18) and
'     CRC(b19..23).
' On exit:
'------------------------------------------------------------------------------
B_txn_in
                call    #B_wait_txn_ok                    ' ISR: ensure txn doesn't cross B_frame boundary
                setbyte B_ep_addr_pid, #PID_IN, #0
                call    #B_utx_token                      ' Put IN request on the bus
' Fall through to B_urx_packet
' vvvvvvvvvvvvvvvvvvvvvvvvvv
''
'' B_urx_packet
'------------------------------------------------------------------------------
' Wait for a packet from a device/function. As host, the only two packet types
' received are handshakes and IN DATAx.
'------------------------------------------------------------------------------
' On entry:
' On exit:
'   B_retval - the ID of the packet. If a PID fails validation, ERR_PACKET is
'     returned.
'------------------------------------------------------------------------------
B_urx_packet
                rqpin   B_urx, #DM_B                        ' Wait until start-of-packet signal appears on the USB.
                testb   B_urx, #SOPB              wc
        if_c    jmp     #B_urx_packet
                getct   B_hct2
                addct2  B_hct2, B_tat_wait                  ' Start the response turn-around timer
                bitl    B_hstatus, #EOPB                  ' Make sure sticky EOP flag is clear
                mov     B_newb_flg, #0                    ' Initialize for multi-byte read
.wait_sop
                rdpin   B_urx, #DM_B
                testb   B_urx, #SOPB              wc
        if_c    jmp     #.get_pid
                jnct2   #.wait_sop
        _ret_   mov     B_retval, #ERR_TAT
.get_pid
                call    #B_urx_next
                testb   B_urx, #BUS_ERRB          wc
        if_nc   jmp     #.chk_pid
        _ret_   mov     B_retval, #ERR_URX
.chk_pid
                cmp     B_retval, #PID_ACK        wz
        if_nz   cmp     B_retval, #PID_NAK        wz
        if_nz   cmp     B_retval, #PID_STALL      wz
        if_z    jmp     #.chk_eop                       ' Handshake, so check that packet is single byte
                testb   B_hstatus, #DATAx_TGLB    wc      ' Get low/full speed even/odd DATAx sequence to look for
                cmp     B_retval, #PID_DATA0      wz
   if_z_and_nc  jmp     #B_urx_data                       ' DATA0 and sequence match
   if_z_and_c   jmp     #.ack_resend                    ' Sequence error. Ignore data, resend the ACK that the device must have missed
                cmp     B_retval, #PID_DATA1      wz
   if_z_and_c   jmp     #B_urx_data                       ' DATA1 and sequence match
   if_z_and_nc  jmp     #.ack_resend
        _ret_   mov     B_retval, #ERR_PACKET             ' Some other bus error...
.ack_resend
                rqpin   B_urx, #DM_B
                testb   B_urx, #EOPB              wc
        if_nc   jmp     #.ack_resend
                mov     B_retval, #PID_ACK
                call    #B_utx_handshake                  ' Send handshake PID and return to caller
        _ret_   mov     B_retval, #ERR_DATAX_SYNC
.chk_eop
                testb   B_hstatus, #LOW_SPEEDB    wc
        if_nc   jmp     #.idle                          ' Full-speed doesn't need an additional read to get EOP status
                call    #B_urx_next                       ' Low-speed requires an additional read to get EOP status
                testb   B_hstatus, #EOPB          wc
        if_c    jmp     #.idle                          ' Low-speed EOP seen
                testb   B_urx, #BUS_ERRB          wz
        if_nc   mov     B_retval, #ERR_PACKET             ' No EOP where one was expected
        if_z    mov     B_retval, #ERR_URX                ' Bit unstuff error, EOP SE0 > 3 bits or SE1, so we're hosed
                ret
.idle
                rqpin   B_urx, #DM_B
                testb   B_urx, #J_IDLEB           wc
        if_nc   jmp     #.idle                          ' Wait for bus IDLE before returning handshake result
                ret
''
'' B_utx_token
'------------------------------------------------------------------------------
' Send a token packet with CRC5 checksum of address and endpoint. It is the
' responsibility of the caller to append the appropriate inter-packet delay,
' if one is required.
'------------------------------------------------------------------------------
' On entry:
'   B_ep_addr_pid - packed with the PID, address and endpoint.
' On exit:
'------------------------------------------------------------------------------
B_utx_token
                rqpin   B_urx, #DM_B
                testb   B_urx, #J_IDLEB           wc
        if_nc   jmp     #B_utx_token
                mov     B_utx, #OUT_SOP
                call    #B_utx_byte                       ' Send sync byte
                mov     B_htmp, B_ep_addr_pid               ' Preserve the PID and destination
                mov     B_pkt_cnt, #3
.next_byte
                getbyte B_utx, B_htmp, #0                   ' Bytes on the bus LSB->MSB
                shr     B_htmp, #8                        ' Shift to next byte to send
.wait
                testp   #DP_B                     wc
        if_nc   jmp     #.wait
                akpin   #DP_B
                wypin   B_utx, #DM_B
        _ret_   djnz    B_pkt_cnt, #.next_byte
''
'' B_txn_out
'------------------------------------------------------------------------------
' SETUP/OUT/INTERRUPT transaction.
' Possible function response in order of precedence: STALL, ACK, NAK.
'------------------------------------------------------------------------------
' On entry:
'   B_ep_addr_pid - PID_OUT(b0..7), address(b8..b14), endpoint(b15..18) and
'     CRC(b19..23).
'   PTRA - start address of the data buff/struct that has the bytes to send.
'   B_pkt_data - count of DATAx payload bytes to send.
' On exit:
'------------------------------------------------------------------------------
B_txn_out
                call    #B_wait_txn_ok                    ' ISR: ensure txn doesn't cross B_frame boundary
                call    #B_utx_token                      ' Put SETUP/OUT token on the bus
                rdfast  ##(|< 31), ptra                 ' Use hub RAM FIFO interface to read the tx buffer
                mov     B_pkt_cnt, B_pkt_data
' Fall through to B_utx_data
' vvvvvvvvvvvvvvvvvvvvvvvv
''
'' B_utx_data
'------------------------------------------------------------------------------
' Transmit a DATAx packet with USB-16 checksum of payload. The payload CRC is
' calculated while the data byte is being shifted out. Since data stage
' success/fail is not determined until the status stage of the transaction,
' this routine is only concerned about the current DATAx packet.
'------------------------------------------------------------------------------
' On entry:
'   PTRA - hub start address of the data to read.
'   B_pkt_cnt - data payload size.
' On exit:
'------------------------------------------------------------------------------
B_utx_data
                rqpin   B_urx, #DM_B
                testb   B_urx, #SOPB              wc
        if_c    jmp     #B_utx_data
                mov     B_hctwait, B_ip_delay
                call    #B_poll_waitx                     ' SETUP/OUT token always precedes tx DATAx so insert IP delay
                mov     B_utx, #OUT_SOP
                call    #B_utx_byte                       ' Send sync
                bmask   B_crc, #15                        ' Prime the CRC16 pump
                testb   B_hstatus, #DATAx_TGLB    wc      ' Set the requested DATAx PID
        if_nc   mov     B_utx, #PID_DATA0
        if_c    mov     B_utx, #PID_DATA1
                call    #B_utx_byte                       ' No CRC calc done on PID
                cmp     B_pkt_cnt, #0             wz      ' Check if sending a zero length payload
        if_z    jmp     #.send_B_crc                      ' If so, only the CRC goes out
.read_byte
                rfbyte  B_utx                             ' Fetch data byte
                call    #B_utx_byte
                rev     B_utx                             ' Calculate CRC while the data is shifting out
                setq    B_utx                             ' SETQ left-justifies the reflected data byte
                crcnib  B_crc, ##USB16_POLY               ' Run CRC calc on the data nibs
                crcnib  B_crc, ##USB16_POLY
                djnz    B_pkt_cnt, #.read_byte
.send_B_crc
                xor     B_crc, ##$ffff                    ' Final XOR, and send the calculated CRC16
                getbyte B_utx, B_crc, #0
                call    #B_utx_byte
                getbyte B_utx, B_crc, #1
                call    #B_utx_byte                       ' Last CRC byte out
                jmp     #B_urx_packet                     ' Handle function response/error and back to caller
''
'' B_urx_data
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
'   B_pkt_data - max byte count expected to be in the packet.
'   B_newb_flg - signals new byte ready when toggled.
' On exit:
'   B_pkt_cnt - actual number of bytes read.
'------------------------------------------------------------------------------
B_urx_data
                wrfast  ##(|< 31), ##B_urx_buff           ' Use hub RAM FIFO interface to buffer bytes received
                bmask   B_crc, #15                        ' Prime the CRC16 pump
                mov     B_pkt_cnt, #0                     ' Keep track of payload bytes received
                mov     B_pkt_tmp, B_pkt_data
                add     B_pkt_tmp, #2                     ' Tweak payload byte count to include CRC word
.wait_byte
' In-line rx for max speed
                rqpin   B_urx, #DM_B
                mov     B_utx, #BYTE_TGLF                 ' Reg B_utx free in this context
                and     B_utx, B_urx
                cmp     B_newb_flg, B_utx           wz      ' Fetch a byte whenever the flags differ
        if_nz   xor     B_newb_flg, #BYTE_TGLF            ' Synchronize flags
        if_nz   jmp     #.get_byte                      ' New byte!
                testb   B_urx, #EOPB              wc
        if_c    jmp     #.chk_B_crc                       ' At end-of-packet
                jmp     #.wait_byte
.get_byte
                getbyte B_retval, B_urx, #1                 ' New byte from smart pins
                wfbyte  B_retval                          ' Add it to the data buffer
                rev     B_retval                          ' Calculate CRC while next byte is shifting in
                setq    B_retval                          ' SETQ left-justifies the reflected data byte
                crcnib  B_crc, ##USB16_POLY               ' Run CRC calc on the data nibs
                crcnib  B_crc, ##USB16_POLY
.end_B_crc
                add     B_pkt_cnt, #1
                cmp     B_pkt_cnt, B_pkt_tmp        wcz
        if_a    mov     B_retval, #ERR_PACKET             ' Error if payload > expected size
        if_a    ret
' For full-speed at 80MHz, the time it takes to do the final byte write and
' CRC verify has likely put us into the EOP zone. The P2 smart pins keep the
' EOP flag "sticky" for 7-bits of J, but at 80MHz, it still could be possible
' to miss it, so cheat a bit and look for SOP clear here.
                rqpin   B_urx, #DM_B
                testb   B_urx, #SOPB              wc      ' FIXME: checking for EOP set should work when > 80MHz
        if_c    jmp     #.wait_byte                     ' Next read will catch EOP at low-speed
' CRC OK = Payload CRC calc ^ packet's CRC bytes = $B001 (the USB-16 expected residual)
.chk_B_crc
                sub     B_pkt_cnt, #2                     ' Adjust payload count to exclude the CRC bytes read
                xor     B_crc, ##USB16_RESIDUAL   wz      ' CRC of (data + transmitted CRC) XOR residual should equal zero
        if_nz   jmp     #B_urx_packet                     ' CRC fail; discard data and wait until data re-sent or transfer timeout
                mov     B_retval, #PID_ACK
                mov     B_hctwait, B_ip_delay
                call    #B_poll_waitx
' Fall through to B_utx_handshake
' vvvvvvvvvvvvvvvvvvvvvvvvvvvvv
''
'' B_utx_handshake
'------------------------------------------------------------------------------
' Transmit a handshake PID. The routine assumes that the bus is IDLE and
' the appropriate IP delay has been inserted.
'------------------------------------------------------------------------------
' On entry:
'   B_retval - handshake PID to send.
' On exit:
'   B_retval unchanged.
'------------------------------------------------------------------------------
B_utx_handshake
                mov     B_utx, #OUT_SOP
                call    #B_utx_byte                       ' Send sync
                mov     B_utx, B_retval
                call    #B_utx_byte                       ' Send handshake PID
.idle
                rqpin   B_urx, #DM_B
                testb   B_urx, #J_IDLEB           wc
        if_nc   jmp     #.idle                          ' Wait for IDLE to ensure the PID tx is complete
                mov     B_hctwait, B_tat_wait               ' Ensure one turn-around time before next transaction
                jmp     #B_poll_waitx
''
'' B_utx_byte
'------------------------------------------------------------------------------
' Wait for the USB tx buffer to empty and feed it a new byte.
'------------------------------------------------------------------------------
' On entry:
'   B_utx - byte to transmit.
' On exit:
'------------------------------------------------------------------------------
B_utx_byte
                testp   #DP_B                     wc
        if_nc   jmp     #B_utx_byte
                akpin   #DP_B
                waitx   B_utx_tweak       ' Wait #3 if < 180MHz, wait #20 if 180MHz+
        _ret_   wypin   B_utx, #DM_B
''
'' B_urx_next
'------------------------------------------------------------------------------
' Fetch the next data byte of a packet. Always check receiver status for EOP.
'------------------------------------------------------------------------------
' On entry:
' On exit:
'   B_retval - the byte read.
'   B_urx - the receiver status. The caller must check the B_hstatus reg EOP flag
'     on return. If EOP is set, the byte in reg B_retval remains as the last byte
'     received.
'------------------------------------------------------------------------------
B_urx_next
                rdpin   B_urx, #DM_B
                mov     B_utx, #BYTE_TGLF                 ' Reg B_utx free in this context
                and     B_utx, B_urx
                cmp     B_newb_flg, B_utx           wz      ' Fetch a byte whenever the flags differ
        if_nz   xor     B_newb_flg, #BYTE_TGLF            ' Synchronize flags
        if_nz   getbyte B_retval, B_urx, #1                 ' Fetch the new byte
        if_nz   ret                                     ' New byte is priority, so return now
                testb   B_urx, #SOPB              wc
                testb   B_urx, #BUS_ERRB          wz
   if_c_and_nz  jmp     #B_urx_next                       ' If SOP still raised and !BUS_ERRB a new byte should be coming
        if_nc   bith    B_hstatus, #EOPB                  ' If EOP make it sticky, otherwise it's a bus error
                ret
''
'' B_wait_txn_ok
'------------------------------------------------------------------------------
' Wait for a window within the 1ms B_frame boundary that will ensure that a
' transaction can complete without spanning the B_frame.
'------------------------------------------------------------------------------
' On entry:
' On exit:
'------------------------------------------------------------------------------
B_wait_txn_ok
                mov     B_htmp2, #0
.wait
                testb   B_hstatus, #TXN_LIMITB    wc
        if_c    add     B_htmp2, #1
        if_c    jmp     #.wait                          ' In "no transaction" zone, so wait for the next B_frame
                cmp     B_htmp2, #0               wz
        if_z    ret
                mov     B_hctwait, B_ip_delay
                jmp     #B_poll_waitx                     ' In the "transaction OK" zone, so good to go
''
'' B_poll_waitx
'------------------------------------------------------------------------------
' The one millisecond B_frame timer is implemented as an interrupt service
' routine. Since this timing is critical, care must be taken to avoid any
' instructions that can delay the interrupt branch, which will likely upset
' the timer. WAITX is among those instructions, so any time you're inside
' an IN/OUT/SETUP transaction, use this routine instead of WAITX.
'------------------------------------------------------------------------------
' On entry:
'   B_hctwait - wait interval in sysclocks.
' On exit:
'------------------------------------------------------------------------------
B_poll_waitx
                getct   B_hct2
                addct2  B_hct2, B_hctwait
.wait
                jnct2   #.wait
                ret
''
'' B_retry_wait
'------------------------------------------------------------------------------
' Transaction B_retry handling for NAK/STALL or bus error.
'------------------------------------------------------------------------------
' On entry:
'   B_retval - transaction response PID or error code.
' On exit:
'------------------------------------------------------------------------------
B_retry_wait
                cmp     B_retval, #PID_STALL      wz
        if_z    ret                                     ' STALL is special case
                cmp     B_retval, #PID_NAK        wz
        if_z    jmp     #.nak
                mov     B_hctwait, ##_1us * 250           ' Transaction error wait...
                call    #B_poll_waitx
.dec
                sub     B_retry, #1               wz
        if_z    mov     B_retval, #ERR_TXN_RETRY          ' Only set error code if no retries left
                ret                                     ' Retry result to caller
.nak
                mov     B_hctwait, ##_1us * 33            ' Seems to be a reasonable NAK delay
                call    #B_poll_waitx
                cmp     B_nak_retry, #NAK_NOLIMIT wz
        if_z    ret                                     ' Indefinite NAK retries
                sub     B_nak_retry, #1           wz
        if_z    mov     B_retval, #ERR_NAK
                ret
''
'' B_calc_crc5
'------------------------------------------------------------------------------
' Calculate USB-5 CRC. The upper word of the CRC pre-calc table in LUT contains
' the data used for the USB-5 CRC lookups. The token packet is three bytes in
' length, and the PID is not included in the CRC calculation:
'  CRC5  FRAME_NUMBER SOF (full-speed)
'  CRC5  ENDP ADDRESS PID
' %00000_1111_1111111_xxxxxxxx
'------------------------------------------------------------------------------
' On entry:
'   B_ep_addr_pid - stuffed with the function endpoint, address and
'     SETUP/IN/OUT/SOF PID according to the USB standard.
' On exit:
'   B_ep_addr_pid - CRC value appended to the packet.
'------------------------------------------------------------------------------
B_calc_crc5
                and     B_ep_addr_pid, ##EP_ADDR_MASK     ' Clear existing CRC, if any
                mov     B_htmp, B_ep_addr_pid
                shr     B_htmp, #8                        ' PID not included in CRC calc
                mov     B_crc, #$1f                       ' Initial CRC5 value
                rev     B_htmp                            ' Input data reflected
                setq    B_htmp                            ' CRCNIB setup for data bits 0..7
                crcnib  B_crc, #USB5_POLY
                crcnib  B_crc, #USB5_POLY                 ' Data bits 0..7 calculated
                shl     B_htmp, #9                wc      ' Shift out processed bits + 1 to set up CRC of remaining bits 8..10
                crcbit  B_crc, #USB5_POLY                 ' Inline instead of REP as we're in hubexec
                shl     B_htmp, #1                wc
                crcbit  B_crc, #USB5_POLY
                shl     B_htmp, #1                wc
                crcbit  B_crc, #USB5_POLY
                xor     B_crc, #$1f                       ' Final XOR value
                shl     B_crc, #8 + 11                    ' CRC to bits 23..19 of the token packet
        _ret_   or      B_ep_addr_pid, B_crc                ' Put the CRC in its new home
''
'' B_isr1_B_frame
'------------------------------------------------------------------------------
' Full-speed/low-speed B_frame timing interrupt service routine.
'------------------------------------------------------------------------------
B_isr1_B_frame
                testb   B_hstatus, #TXN_LIMITB    wc
        if_nc   jmp     #.B_no_txn_zone                   ' Timer "txn OK" expired, go set "no txn" timer
                addct1  B_hct1, B_txn_ok_zone               ' Refresh the "txn OK zone" timespan
                testb   B_hstatus, #LOW_SPEEDB    wc
        if_nc   jmp     #.fullspeed
                mov     B_utx, #OUT_EOP                   ' Timer "no txn" expired, so it's end-of-B_frame
                call    #B_utx_byte                       ' EOP is the low-speed keep-alive strobe
                mov     B_isr_tmp, B_ip_delay               ' Normal inter-packet delay works when low-speed
                jmp     #.wait
.fullspeed
                mov     B_utx, #OUT_SOP
                call    #B_utx_byte                       ' Send sync byte
                mov     B_icrc, #$1f                      ' Prime the CRC5 pump
                mov     B_sof_pkt, B_frame                  ' CRC5 calculation done on the 11-bit B_frame number value
                rev     B_sof_pkt                         ' Input data reflected
                mov     B_utx, #PID_SOF
                call    #B_utx_byte                       ' Send token PID byte
                setq    B_sof_pkt                         ' CRCNIB setup for data bits 0..7
                crcnib  B_icrc, #USB5_POLY
                crcnib  B_icrc, #USB5_POLY                ' Data bits 0..7 calculated
                getbyte B_utx, B_frame, #0                  ' Send the low byte of the B_frame number
                call    #B_utx_byte
                shl     B_sof_pkt, #8                     ' Shift out processed bits to set up CRCBIT * 3
                rep     #2, #3                          ' Three data bits left to process
                shl     B_sof_pkt, #1             wc
                crcbit  B_icrc, #USB5_POLY                ' Data bits 8..10 calculated
                xor     B_icrc, #$1f                      ' Final XOR value
                getbyte B_utx, B_frame, #1                  ' Send remaining B_frame number bits
                shl     B_icrc, #3                        ' Merge CRC to bits 7..3 of the final token byte
                or      B_utx, B_icrc
                call    #B_utx_byte                       ' Last start-of-B_frame byte is on the wire
                add     B_frame, #1                       ' Calculate number for next B_frame
                and     B_frame, ##$7ff
                mov     B_isr_tmp, ##IP_DELAY_FS          ' Use normal inter-packet delay when full-speed
.wait
                rqpin   B_utx, #DM_B
                testb   B_utx, #SOPB              wc
        if_c    jmp     #.wait
                waitx   B_isr_tmp                         ' Make sure bus is idle before
                bitl    B_hstatus, #TXN_LIMITB            ' Bus ready for traffic
                reti1
.B_no_txn_zone
                addct1  B_hct1, B_no_txn_zone               ' Refresh the "no txn zone" timespan
                bith    B_hstatus, #TXN_LIMITB
                reti1
''
'' B_dev_reset
'------------------------------------------------------------------------------
' A device connection was detected. Set the appropriate smart pin FS/LS speed
' mode to match the device and perform a B_reset sequence prior to device
' enumeration.
'------------------------------------------------------------------------------
B_dev_reset
                rqpin   B_urx, #DM_B
                testb   B_urx, #K_RESUMEB         wc      ' K differential "1" in FS mode signals low-speed
        if_c    call    #B_set_speed_low                  ' These subroutines must restore the caller C flag
        if_nc   call    #B_set_speed_full                 ' state on return if C is used.
B_reset
                setint1 #0                              ' Don't want B_frame interrupt at B_reset
                wypin   #OUT_SE0, #DM_B                   ' Assert bus B_reset
                waitx   ##RESET_HOLD                    ' Spec is >= 10ms
                wypin   #OUT_IDLE, #DM_B
                bitl    B_hstatus, #TXN_LIMITB            ' B_reset the B_frame txn OK/!OK flag
                mov     B_frame, #0                       ' B_reset the B_frame count
                getct   B_hct1                            ' B_reset the B_frame timer
                addct1  B_hct1, ##B_txn_ok_zone
                setint1 #1                              ' Set ISR event trigger to CT1-equals-CT
                mov     B_hctwait, ##_1ms * 21
                call    #B_poll_waitx                     ' Allow B_reset recovery time (Section 9.2.6.2)
                ret
''
'' B_set_speed_full
'------------------------------------------------------------------------------
' Full-speed is the host's native speed, so all that is needed is to set the FS
' settings to startup defaults.
'------------------------------------------------------------------------------
' On entry:
' On exit: Restore caller C flag state if C flag used!
'------------------------------------------------------------------------------
B_set_speed_full
                mov     B_txn_ok_zone, ##TXN_OK_FS        ' Set FS bandwidth usage limits
                mov     B_no_txn_zone, ##NO_TXN_FS
                mov     B_max_pkt_size, #64               ' Set FS control read/write DATAx packet size
                mov     B_tat_wait, ##TAT_WAIT_FS         ' Bus turn-around time in full-speed bit periods
        _ret_   mov     B_ip_delay, ##IP_DELAY_FS         ' Inter-packet delay in full-speed bit periods
''
'' B_set_speed_low
'------------------------------------------------------------------------------
' When a low-speed device connects, the D-/D+ signalling is inverted. If there
' is a downstream hub B_connected (not yet implemented), the baud generator
' remains set at the full-speed rate, but signalling is switched to low-speed,
' which reverses the D-/D+ polarity. The polarity can be changed without
' putting the smart pins into B_reset.
'------------------------------------------------------------------------------
' On entry:
' On exit: Restore caller C flag state if C flag used!
'------------------------------------------------------------------------------
B_set_speed_low
                test    B_hstatus, #DWNSTRM_HUBF wz       ' If no downstream hub B_connected, set low-speed baudrate
        if_z    dirl    #DP_B
        if_z    dirl    #DM_B
#ifdef P2_REV_A
                wrpin   ##USB_V1HMODE_LS, #DP_B           ' Low-speed signalling is always used
                wrpin   ##USB_V1HMODE_LS, #DM_B
        if_z    wxpin   ##_1_5Mbps, #DM_B                 ' Set 1.5Mbs baudrate if no downstream hub
#else
                wrpin   ##USB_V2MODE, #DP_B               ' Low-speed signalling is always used
                wrpin   ##USB_V2MODE, #DM_B
        if_z    wxpin   ##USB_H_LS_NCO, #DM_B             ' Host mode and 1.5Mbs baudrate if no downstream hub
#endif
        if_z    dirh    #DP_B
        if_z    dirh    #DM_B
                mov     B_txn_ok_zone, ##TXN_OK_LS        ' Set low-speed bandwidth usage limits
                mov     B_no_txn_zone, ##NO_TXN_LS
                mov     B_max_pkt_size, #8                ' Set LS control read/write DATAx packet size
                mov     B_tat_wait, ##TAT_WAIT_LS         ' Bus turn-around time in low-speed bit periods
                mov     B_ip_delay, ##IP_DELAY_LS         ' Inter-packet delay in low-speed bit periods
        _ret_   bith    B_hstatus, #LOW_SPEEDB            ' DM_B pulled high, so it's a Low-Speed device
''
'' B_hmemcpy
'------------------------------------------------------------------------------
' Bulk hub<->hub byte copy. Does not check for src/dest buffer overlap.
'------------------------------------------------------------------------------
' On entry:
'   PTRA - source address.
'   PB - destination address.
'   B_hr0 - length of copy, in bytes.
' On exit:
'------------------------------------------------------------------------------
B_hmemcpy
                rdbyte  B_htmp, ptra++
                wrbyte  B_htmp, pb
                add     pb, #1
        _ret_   djnz    B_hr0, #B_hmemcpy
''
'' B_host_error
'------------------------------------------------------------------------------
' A fatal USB error has occured. Notify the client and spin in a pseudo-idle
' loop until the errant device is B_disconnected.
'------------------------------------------------------------------------------
' On entry:
' On exit:
'------------------------------------------------------------------------------
B_host_error
                loc     ptra, #@B_usb_error_code
                wrlong  B_retval, ptra                    ' Post the USB operation result value
                wxpin   #USB_ERROR, #USB_B_EVENT_REPO     ' Signal the client an error has occurred
                mov     B_hrep, #5
.spin
                drvnot  #HOST_B_ERROR_LED
                mov     B_hctwait, ##PULSE_TIME >> 3
                call    #B_poll_waitx
                rqpin   B_urx, #DM_B
                testb   B_urx, #SE0_RESETB        wc
        if_nc   jmp     #.spin
                djnz    B_hrep, #.spin
        if_c    ret                             wc      ' Handle disconnect?
                mov     B_hrep, #5
                jmp     #.spin
''
'' B_poll_kbd, B_poll_mouse
'------------------------------------------------------------------------------
' Post interrupt IN transactions at configured intervals.
'------------------------------------------------------------------------------
' On entry:
' On exit:
'------------------------------------------------------------------------------
B_poll_kbd
                getct   B_hct3
                cmp     B_hmouse_ep_addr, #0      wz
        if_z    addct3  B_hct3, ##KBD_POLL_INTERVAL       ' Set the timer for next poll interval
        if_nz   addct3  B_hct3, ##_1ms * 4                ' Try to keep 4ms timespan between them
        if_nz   mov     B_poll_target, #B_poll_mouse
                jmp     #B_hget_kbd_in_report             ' Post IN txn and return to caller
B_poll_mouse
                getct   B_hct3
                cmp     B_hkbd_ep_addr, #0         wz
        if_z    addct3  B_hct3, ##MOUSE_POLL_INTERVAL     ' Mouse is the only B_connected device
        if_nz   addct3  B_hct3, ##_1ms * 4
        if_nz   mov     B_poll_target, #B_poll_kbd
                jmp     #B_hget_mouse_in_report           ' Post IN txn and return to caller
''


'' Host registers
B_htmp            long    0                               ' Scratch registers whose context remains within the same code block
B_htmp2           long    0
B_hrep            long    0                               ' Repeat count
B_hsave0          long    0                               ' Subroutine parameter saves
B_hsave1          long    0
B_hsave2          long    0
B_utx_tweak       long    0                               ' When sysclock speed above ~120MHz, need some fairy dust for USB tx
B_isr_tmp         long    0
B_pkt_tmp         long    0                               ' Tmp storage for routines that deal with datax packets
B_hr0             long    0                               ' Multi-purpose registers
B_hr1             long    0
B_hr2             long    0
B_hr3             long    0
B_hpar1           long    0                               ' Routine entry/exit parameters
B_hpar2           long    0
B_hpar3           long    0
B_hct1            long    0                               ' Timer for the 1ms B_frame generator interrupt service routine
B_hct2            long    0                               ' Function response bus turn-around timer
B_hct3            long    0                               ' Keyboard/mouse poll timer
' This register block is B_reset to zero when a USB device connects
B_hreg_init_start
B_hstatus         long    0                               ' Host status flags
B_hctwait         long    0                               ' Poll-based wait clocks
B_ip_delay        long    0                               ' Inter-packet delay in bit periods for B_connected device speed
B_tat_wait        long    0                               ' Maximum bus turn-around time in bit periods for B_connected device speed
B_nak_retry       long    0                               ' NAK B_retry count, unlimited retries if zero
B_txn_ok_zone     long    0                               ' Timespan that packets can be put on the bus
B_no_txn_zone     long    0                               ' Timespan in which packets must wait for bus to become available
B_xfer_retry      long    0                               ' Control transfer B_retry count
B_retry           long    0                               ' Transaction B_retry count
B_utx             long    0                               ' Byte to transmit on USB
B_urx             long    0                               ' Written by ISR only. LSByte receiver status flags, MSByte received data
B_newb_flg        long    0                               ' Receive "new byte" bit toggle detector
B_poll_target     long    0                               ' Address of a subroutine that polls an interrupt IN endpoint
B_hevent          long    0                               ' Command/request eventID posted by the driver cog
B_max_pkt_size    long    0                               ' Maximum payload bytes allowed, likely to change on device connect.
B_total_data      long    0                               ' Total bytes to tx/rx in a transfer data stage
B_stage_data      long    0                               ' Count of bytes sent/received so far during a data stage.
B_pkt_data        long    0                               ' Payload size of an OUT packet or bytes received on IN
B_frame           long    0                               ' USB 1ms B_frame counter value
B_sof_pkt         long    0                               ' ISR B_frame# packet and CRC5
B_icrc            long    0                               ' Only used by the 1ms B_frame output ISR routine
B_pkt_cnt         long    0                               ' Count of DATAx packet payload bytes
B_crc             long    0                               ' Used for CRC16 calculation
B_ep_addr_pid     long    0                               ' Endpoint and device addresses for B_connected device
B_retval          long    0                               ' Global success/fail return parameter
B_context_retval  long    0                               ' Operation contextual return parameter
' Keyboard/mouse stuff
B_hctrl_ep_addr   long    0
B_hctrl_max_pkt   long    0
B_hconfig_base    long    0
B_hcon_tot_len    long    0                               ' Size of the complete config descriptor chain
B_hhid_intf_idx   long    0                               ' Used during verbose descriptor terminal output
B_hsearch_key     long    0                               ' Descriptor type to search for in the config chain
B_hnext_desc      long    0                               ' Offset from the config descriptor start address to the next descriptor in the chain
B_hmouse_ep_addr  long    0
B_last_mouse_data long    0                               ' Last mouse data passed to the client
B_hmouse_poll_cnt long    0
' The following registers must match the layout of the "public" keyboard
' interface that is in hub RAM, starting at the kbd_count label.
B_hkbd_head       long    0                               ' Keyboard data buffer head
B_hkbd_ep_addr    long    0                               ' Keyboard interface endpoint address
B_hkbd_report     long    0                               ' Address of report descriptor data for the keyboard interface
B_hkbd_poll_cnt   long    0                               ' Poll interval counter used for key auto-repeat
B_hkbd_repeat     long    0                               ' Key auto-repeat delay threshold
B_hkbd_scancode   long    0                               ' kbd_scancode
B_hkbd_modkeys    long    0                               ' kbd_modkeys
B_hkbd_keypress   long    0                               ' kbd_keypress
B_hkbd_ledstates  long    0                               ' kbd_ledstates
B_hreg_init_end
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
B_hlut_start
'' B_on_connect
'------------------------------------------------------------------------------
' Perform configuration stuff required when a device intitially connects.
'------------------------------------------------------------------------------
' On entry:
' On exit:
'------------------------------------------------------------------------------
B_on_connect
                mov     B_hr0, #2                         ' FIXME: need to determine a reasonable limit for B_reset & B_retry
                call    #B_dev_reset                      ' B_reset device prior to Get Device Descriptor request
.B_retry
                testb   B_hstatus, #LOW_SPEEDB    wc
        if_c    mov     B_hpar1, #USB_SPEED_LOW           ' Also the connect speed
        if_nc   mov     B_hpar1, #USB_SPEED_FULL
                mov     B_ep_addr_pid, ##EP_ADDR_ZERO     ' New connect, use pre-calc CRC for ep/addr zero
                loc     ptra, #@B_get_dev_desc            ' Hub start address of GetDeviceDescriptor SETUP struct
                wrword  #$40, ptra[wLength]             ' Request IN data stage max of 64 bytes will test actual < requested logic
                loc     pb, #@B_dev_desc_buff             ' Start address of DeviceDescriptor struct for IN data
                call    #B_control_read                   ' Execute GetDeviceDescriptor()
                cmp     B_retval, #PID_ACK        wz
        if_z    jmp     #.B_get_dev_desc
                mov     B_hctwait, ##_1ms * 500           ' If the first GetDescriptor() fails, B_reset and try again
                call    #B_poll_waitx
                sub     B_hr0, #1         wz              ' FIXME: need to determine a reasonable limit for B_reset & B_retry
        if_z    jmp     #B_host_error                     ' Post error and spin until the errant device is B_disconnected
                call    #B_reset                          ' Try another B_reset to see if the device responds
                jmp     #.B_retry
.B_get_dev_desc
                loc     pa, #@B_dev_desc_buff             ' Fetch the max packet size for control transactions from the
                add     pa, #DEV_bMaxPktSize0           ' appropriate Device Descriptor struct member offset
                rdbyte  B_max_pkt_size, pa
                mov     B_hctwait, ##_1ms
                call    #B_poll_waitx                     ' Do a B_reset before SetAddress(), but wait a bit first
                call    #B_reset
                loc     ptra, #@B_set_address             ' Hub start address of SetAddress SETUP struct
                wrword  #1, ptra[wValue]                ' Only support one device port at this time
                call    #B_control_write                  ' Execute SetAddress()
                cmp     B_retval, #PID_ACK        wz
        if_nz   ret                                     ' Back to idle if not ACK
                mov     B_hctwait, ##_1ms * 8
                call    #B_poll_waitx                     ' Allow SetAddress() a minimum 2ms recovery interval
                mov     B_ep_addr_pid, ##1 << 8           ' Device ep/addr now #1 and endpoint zero
                call    #B_calc_crc5
                loc     ptra, #@B_get_dev_desc            ' Repeat SETUP for GetDeviceDescriptor()
                loc     pb, #@B_dev_desc_buff             ' Start address of DeviceDescriptor struct has exact descriptor length
                rdbyte  B_total_data, pb
                wrword  B_total_data, ptra[wLength]       ' Assign it to the SETUP wLength struct member
                call    #B_control_read                   ' Execute GetDeviceDescriptor() again, but with updated data length
                cmp     B_retval, #PID_ACK        wz
        if_nz   ret                                     ' Back to idle if not ACK
                mov     B_hctrl_ep_addr, B_ep_addr_pid      ' Make the device control address and endpoint official
                loc     ptra, #@B_dev_desc_buff           ' Do the same with the control max packet size
                rdbyte  B_hctrl_max_pkt, ptra[DEV_bMaxPktSize0]
                mov     B_hctwait, ##_1us * 500
                call    #B_poll_waitx
                loc     ptra, #@B_get_config_desc         ' Hub start address of GetConfigurationDescriptor SETUP struct
                wrword  #$ff, ptra[wLength]             ' Maximum DATAx bytes for receive to the SETUP struct
                loc     pb, #@B_con_desc_buff             ' Hub start address of ConfigurationDescriptor structure
                call    #B_control_read                   ' Execute GetConfigurationDescriptor()
                cmp     B_retval, #PID_ACK        wz
        if_nz   ret
                loc     ptra, #@B_con_desc_buff           ' Check the config descriptor struct for expected data
                mov     B_hconfig_base, ptra              ' Will need this for configuration
                rdbyte  B_hr0, ptra++                     ' Config.bLength is at offset zero, expect >= CON_DESC_LEN
                rdbyte  B_hr1, ptra++                     ' Config.bDescType is next member, expect = TYPE_CONFIG constant
                rdword  B_htmp, ptra                      ' Config.wTotalLen is next member, expect >= bytes actually received
                cmp     B_hr0, #CON_DESC_LEN      wcz
        if_ae   cmp     B_hr1, #TYPE_CONFIG       wcz
        if_z    cmp     B_htmp, B_total_data        wcz
        if_b    mov     B_retval, #ERR_CONFIG_FAIL
        if_b    jmp     #B_host_error
                jmp     #B_hparse_con_desc
''
'' B_control_read
'------------------------------------------------------------------------------
' Perform a control read transaction (Section 8.5.3, Figure 8-37).
' Status reporting is always in the function-to-host direction.
'------------------------------------------------------------------------------
' On entry:
'   PTRA - start address of the SETUP data in hub.
'   PB - start address of the buffer/struct to be written to during the IN data
'     stage.
'   B_ep_addr_pid - device address, endpoint and CRC5.
' On exit:
'   B_retval - PID_ACK on success, otherwise error. If successful, reg B_total_data
'     contains the count of data stage bytes actually received, which must
'     always be <= the count requested.
'   B_context_retval - ERR_NONE if the overall transfer succeeds, otherwise a
'     more specific USB operation error code.
'------------------------------------------------------------------------------
B_control_read
                mov     B_hpar1, B_ep_addr_pid
                mov     B_hpar2, ptra
                mov     B_hpar3, pb                       ' Save dest buffer pointer
                mov     B_xfer_retry, #XFER_RETRIES
.xfer_start
                rdword  B_total_data, ptra[wLength]       ' Get the size of the data stage from the SETUP struct
                call    #B_txn_setup                      ' SETUP logic is the same for both control reads and writes
                cmp     B_retval, #PID_ACK        wz
        if_nz   ret                                     ' Back to caller to handle error
                cmp     B_total_data, #0          wz
        if_z    jmp     #B_pre_status_in                  ' No data, so directly to status stage
                mov     B_stage_data, #0                  ' Prepare for data stage
                mov     B_nak_retry, ##IN_NAK_RETRIES
                bith    B_hstatus, #DATAx_TGLB            ' Data stage starts with DATA1 PID
.data
                mov     B_pkt_data, B_total_data
                sub     B_pkt_data, B_stage_data
                cmp     B_pkt_data, B_max_pkt_size  wcz
        if_a    mov     B_pkt_data, B_max_pkt_size          ' Have a full packet with more data left
.B_nak_retry
                mov     B_retry, #TXN_RETRIES             ' B_reset bus error B_retry limit
.in_B_retry
                call    #B_txn_in
                cmp     B_retval, #PID_ACK        wz      ' Commit on ACK
        if_z    jmp     #.commit
                cmp     B_retval, #PID_STALL      wz
        if_z    jmp     #.B_xfer_retry                    ' STALL triggers a transfer B_retry
                call    #B_retry_wait                     ' Wait a bit before B_retry
                cmp     B_retval, #PID_NAK        wz
        if_z    jmp     #.B_nak_retry                     ' Function not ready to send data
                cmp     B_retval, #ERR_NAK        wz
        if_z    jmp     #.B_xfer_retry                    ' NAK limit exceeded triggers a transfer B_retry
                cmp     B_retval, #ERR_TXN_RETRY  wz
        if_nz   jmp     #.in_B_retry                      ' Bus error B_retry
                ret                                     ' The transfer has failed
.commit
                cmp     B_pkt_cnt, #0             wz      ' Empty pkt means previous pkt was max_pkt_len
        if_z    jmp     #.pre_status                    ' and also end-of-data
                loc     ptra, #@B_urx_buff                ' Copy DATAx in rx buffer to dest struct
                mov     B_hr0, B_pkt_cnt
                call    #B_hmemcpy                        ' B_hmemcpy(PTRA, PB, B_hr0)
                add     B_stage_data, B_pkt_cnt             ' Update bytes received on commit
                cmp     B_stage_data, B_total_data  wz      ' Have all asked-for bytes?
        if_z    jmp     #.pre_status                    ' Have all the data that's coming, so done
                cmp     B_pkt_cnt, B_pkt_data       wcz     ' Check for short packet
        if_b    jmp     #.pre_status                    ' Actual payload < expected means end of data stage
        if_a    mov     B_retval, #ERR_PACKET
        if_a    mov     B_context_retval, B_retval          ' In this case overall and context are the same
        if_a    ret                                     ' Caller must handle ERR_PACKET
                bitnot  B_hstatus, #DATAx_TGLB            ' Toggle DATAx sync bit
                jmp     #.data                          ' Start next IN transaction
.pre_status
                mov     B_total_data, B_stage_data          ' Replace the asked-for byte count with the bytes actually received
                setbyte B_ep_addr_pid, #PID_OUT, #0
                mov     B_pkt_data, #0
                bith    B_hstatus, #DATAx_TGLB            ' Status stage starts with DATA1 PID
                mov     B_retry, #TXN_RETRIES             ' B_reset txn B_retry limit
                mov     B_nak_retry, ##OUT_NAK_RETRIES
.out_B_retry
                call    #B_txn_out                        ' Send empty OUT DATAx packet to confirm IN data received OK
                cmp     B_retval, #PID_ACK        wz
        if_z    ret                                     ' All is good when ACK
                cmp     B_retval, #PID_STALL      wz
        if_z    jmp     #.B_xfer_retry                    ' STALL triggers a transfer B_retry
                call    #B_retry_wait                     ' Wait a bit before B_retry
                cmp     B_retval, #ERR_NAK        wz
        if_z    jmp     #.B_xfer_retry                    ' NAK limit exceeded triggers a transfer B_retry
                cmp     B_retval, #ERR_TXN_RETRY  wz
        if_nz   jmp     #.out_B_retry                     ' Retry due to bus error or OUT-NAK B_retry limit not reached
                ret                                     ' Caller must handle transfer retirement
' I've encountered transfer STALL, even though the data looks correct, and
' instances of getting stuck in an endless OUT-NAK loop. Repeating the entire
' ControlRead() transfer gets things unstuck most of the time...
.B_xfer_retry
                mov     B_hctwait, ##XFER_WAIT
                call    #B_poll_waitx
                call    #B_wait_txn_ok
                mov     B_ep_addr_pid, B_hpar1
                mov     ptra, B_hpar2
                mov     pb, B_hpar3
                djnz    B_xfer_retry, #.xfer_start
                mov     B_context_retval, B_retval          ' Preserve the USB error code
        _ret_   mov     B_retval, #ERR_XFER_RETRY
''
'' B_control_write
'------------------------------------------------------------------------------
' Perform a control write transaction (Section 8.5.3, Figure 8-37). Status
' reporting is always in the function-to-host direction. It is assumed that
' the SETUP data struct is filled with the required values.
'------------------------------------------------------------------------------
' On entry:
'   PTRA - points to the start of the struct for the SETUP data.
'   PB - the start address of the struct/buffer to be read for the OUT data
'     stage.
'   B_ep_addr_pid - the proper CRC'd address and endpoint to use.
' On exit:
'   B_retval - used to convey the success/failure of each stage.
'   B_context_retval - ERR_NONE if the overall transfer succeeds, otherwise a
'     more specific USB operation error code.
'------------------------------------------------------------------------------
B_control_write
                mov     B_hpar1, B_ep_addr_pid
                mov     B_hpar2, ptra
                mov     B_hpar3, pb
                mov     B_xfer_retry, #XFER_RETRIES
.xfer_start
                mov     B_nak_retry, #NAK_NOLIMIT         ' Unlimited NAK retries the default
                rdword  B_total_data, ptra[wLength]       ' Get the size of the data stage from the SETUP struct
                call    #B_txn_setup                      ' SETUP logic is the same for both control reads and writes
                cmp     B_retval, #PID_ACK        wz
        if_nz   ret                                     ' Back to caller to handle error
                cmp     B_total_data, #0          wz
        if_z    jmp     #B_pre_status_in                  ' No data, so directly to status stage
                mov     B_stage_data, #0                  ' Prepare for data stage
                setbyte B_ep_addr_pid, #PID_OUT, #0       ' PID isn't part of the CRC calc
                bith    B_hstatus, #DATAx_TGLB            ' Data stage starts with DATA1 PID
                mov     B_retry, #TXN_RETRIES             ' B_reset txn B_retry limit
.data
                mov     B_pkt_data, B_total_data
                sub     B_pkt_data, B_stage_data
                cmp     B_pkt_data, B_max_pkt_size  wcz
        if_a    mov     B_pkt_data, B_max_pkt_size          ' Data remaining is > max_pkt, so cap at max_pkt
.out_B_retry
                mov     ptra, pb                        ' Set current location in the OUT data buffer/struct
                call    #B_txn_out
                cmp     B_retval, #PID_ACK        wz
        if_z    jmp     #.commit                        ' Function got the data
                call    #B_retry_wait                     ' Wait a bit before B_retry
                cmp     B_retval, #ERR_TXN_RETRY  wz      ' Out of !NAK retries?
        if_nz   jmp     #.out_B_retry
                ret                                     ' Caller must handle transfer retirement
.commit
                mov     pb, ptra                        ' Save the current buffer/struct location
                add     B_stage_data, B_pkt_data
                cmp     B_stage_data, B_total_data  wz
        if_nz   bitnot  B_hstatus, #DATAX_TGLB            ' Toggle DATAx sync bit
        if_nz   jmp     #.data                          ' More data to send
B_pre_status_in
                bith    B_hstatus, #DATAx_TGLB            ' Status stage expects IN to be an empty DATA1 packet
                mov     B_retry, #TXN_RETRIES             ' B_reset txn B_retry limit
.status_B_retry
                mov     B_pkt_data, #0
                call    #B_txn_in
                cmp     B_retval, #PID_ACK        wz      ' ACK says a DATA1 packet was received
        if_z    cmp     B_pkt_data, #0            wz      ' DEBUG: should never fail if the function is USB compliant?
        if_z    ret                                     ' Control Write finished
                cmp     B_retval, #PID_STALL      wz      ' STALL needs to go to the caller for resolution
        if_z    ret
                call    #B_retry_wait                     ' NAK or bus error, so delay a bit
                cmp     B_retval, #ERR_TXN_RETRY  wz
        if_nz   jmp     #.status_B_retry
                ret                                     ' Caller must handle transfer retirement
''
'' B_do_int_in
'------------------------------------------------------------------------------
' Execute an IN interrupt transaction.
'------------------------------------------------------------------------------
' On entry:
'   B_ep_addr_pid - The function address and endpoint for the IN request.
'   B_hpar2 - Address of the IN data buffer
'   B_hpar3 - Word1 has max data packet size, word0 has the DATAx to expect.
' On exit:
'   B_retval - the result of the operation.
'   B_hpar3 - the count of IN data bytes actually received.
'------------------------------------------------------------------------------
B_do_int_in
                getword B_htmp, B_hpar3, #0
                cmp     B_htmp, #PID_DATA0        wz
                bitnz   B_hstatus, #DATAx_TGLB            ' Set/B_reset flag for DATAx to expect
                mov     B_retry, #TXN_RETRIES
.B_retry
                getword B_pkt_data, B_hpar3, #1             ' IN max packet length
                call    #B_txn_in
                cmp     B_retval, #PID_ACK        wz      ' ACK if data received
        if_z    jmp     #.commit
                cmp     B_retval, #PID_NAK        wz      ' NAK if no data available (common)
        if_nz   cmp     B_retval, #PID_STALL      wz      ' STALL if the endpoint has a transfer issue and must be B_reset (rare)
        if_z    jmp     #.post_ret                      ' The caller must handle either
                call    #B_retry_wait
                cmp     B_retval, #ERR_TXN_RETRY  wz
        if_z    jmp     #.post_ret
                jmp     #.B_retry
.commit
                cmp     B_pkt_cnt, #0             wz
        if_z    jmp     #.post_ret                      ' Skip copy if it's an empty packet
                loc     ptra, #@B_urx_buff                ' Copy the rx buffer
                mov     pb, B_hpar2                       ' to the destination buffer
                mov     B_hr0, B_pkt_cnt
                call    #B_hmemcpy                        ' B_hmemcpy(PTRA, PB, B_hr0)
.post_ret
                mov     B_hpar3, B_pkt_cnt                  ' IN bytes actually received
                ret
''
'' B_host_B_reset
B_host_B_reset
                setint1 #0
                dirl    #DP_B                             ' Put smart pins into B_reset
                dirl    #DM_B
#ifdef P2_REV_A
                wrpin   ##USB_V1HMODE_FS, #DP_B           ' The host is also the root hub, so full-speed is its native speed
                wrpin   ##USB_V1HMODE_FS, #DM_B
                wxpin   ##_12Mbps, #DM_B                  ' Default to Full-Speed
#else
                wrpin   ##USB_V2MODE, #DP_B               ' Low-speed signalling is always used
                wrpin   ##USB_V2MODE, #DM_B
                wxpin   ##USB_H_FS_NCO, #DM_B             ' Host mode and default to 12Mbs baudrate
#endif
                dirh    #DM_B                             ' Crank them smart pins up
                dirh    #DP_B
                waitx   ##_1us * 10
                wypin   ##OUT_IDLE, #DM_B
                mov     pa, #B_hreg_init_start            ' B_reset all host common registers
.regloop
                altd    pa
                mov     0-0, #0
                add     pa, #1
                cmp     pa, #B_hreg_init_end      wz
        if_nz   jmp     #.regloop
                loc     ptra, #@B_usb_cache_start         ' USB descriptor buffer area
                mov     B_hr0, ##B_usb_cache_end
                sub     B_hr0, ptra
                mov     B_hr1, #0                         ' Zero fill descriptor buffers
.buffloop
                wrbyte  B_hr1, ptra++
                djnz    B_hr0, #.buffloop
                mov     B_poll_target, ##B_hpulse_led
                call    B_poll_target
' Fall through to B_disconnected loop
' vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
''
'' B_disconnected
'-----------------------------------------------------------------------------------------------------------------
' Device connect handling (Section 7.1.7.3).
'-----------------------------------------------------------------------------------------------------------------
' The 15K pull-down resistors on D+ and D- allow the host to passively monitor the bus lines while waiting for a
' device to connect (Section 7.1.7.3).
'-----------------------------------------------------------------------------------------------------------------
B_disconnected
                pollct3                         wc
        if_c    call    B_poll_target                     ' Toggle the host wait for connect USER_LED
                rqpin   B_urx, #DM_B
                and     B_urx, #J_IDLEF | K_RESUMEF wcz   ' Wait for rise of J or K, mutually exclusive
        if_z    jmp     #B_disconnected                   ' J and K still low, so keep waiting for connect
        if_ne   jmp     #.connect_test                  ' J or K is high, so test for connect
.se1_test
                mov     B_hctwait, ##_1ms * 100           ' J and K high is illegal SE1 state, so wait and retest
                call    #B_poll_waitx
                rqpin   B_urx, #DM_B
                and     B_urx, #J_IDLEF | K_RESUMEF wcz
        if_ne   mov     B_retval, #ERR_NONE               ' SE0 or idle state B_resets any previous error
        if_ne   jmp     #B_disconnected                   ' Back to connect detection loop
.se1            'SE1 is a fatal error condition
                waitx   ##_1ms * 100
                mov     B_retval, #ERR_SE1
                call    #B_host_error                     ' Seeing SE1 for any length of time is not good...
.connect_test                                           ' Test lines until stable J/K state seen
                mov     B_hctwait, ##_1ms * 100
                call    #B_poll_waitx                     ' Total of 100ms debounce interval (Section 7.1.7.3)
                rqpin   B_urx, #DM_B
                and     B_urx, #J_IDLEF | K_RESUMEF wcz
        if_z    jmp     #B_disconnected                   ' DP_B and DM_B low
        if_e    jmp     #.se1_test                      ' DP_B and DM_B high
B_connected
                bith    B_hstatus, #CONNECTEDB            ' Device plugged in
                drvh    #HOST_B_ACTIVE_LED
                call    #B_on_connect                     ' Initial device configuration
                cmp     B_retval, #PID_ACK        wz      ' Anything other than ACK means the device is unusable
        if_nz   jmp     #B_disconnected
' Fall through to idle/processing loop
' vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
B_hidle
                rqpin   B_urx, #DM_B
                testb   B_urx, #SE0_RESETB        wc
        if_c    jmp     #.se0_test
                pollct3                         wc
        if_c    call    B_poll_target                     ' Call the current poll/wait subroutine
                jmp     #B_hidle
' Check for extended SE0 state on the bus
.se0_test
                mov     B_hctwait, ##_1ms
                call    #B_poll_waitx                     ' Wait a bit and test for SE0 again
                rqpin   B_urx, #DM_B
                testb   B_urx, #SE0_RESETB        wc
        if_nc   jmp     #B_hidle                          ' Bus still IDLE
                call    #B_wait_txn_ok
                setint1 #0                              ' Turn off B_frame strobe interrupt
                wypin   ##OUT_IDLE, #DM_B                 ' Float USB
                drvh    #HOST_B_ACTIVE_LED
                wxpin   #DEV_DISCONNECT, #USB_B_EVENT_REPO ' Notify client of disconnect
                jmp     #B_host_B_reset                     ' Device B_disconnected
''
'' B_hpulse_led
'------------------------------------------------------------------------------
' Toggle a user LED when the host is the connect wait loop or the main USB
' processing loop.
'------------------------------------------------------------------------------
B_hpulse_led
                getct   B_hct3
                addct3  B_hct3, ##PULSE_TIME
        _ret_   drvnot  #HOST_B_ACTIVE_LED
''
B_hlut_end
                fit     $400
' #endregion (Host LUT execution)
                orgh
'
' NOTE: Hub execution and data regions moved to kbmpreb.s
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
