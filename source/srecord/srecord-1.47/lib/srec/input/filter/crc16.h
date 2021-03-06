//
//      srecord - manipulate eprom load files
//      Copyright (C) 2000-2003, 2005-2008 Peter Miller
//
//      This program is free software; you can redistribute it and/or modify
//      it under the terms of the GNU General Public License as published by
//      the Free Software Foundation; either version 3 of the License, or
//      (at your option) any later version.
//
//      This program is distributed in the hope that it will be useful,
//      but WITHOUT ANY WARRANTY; without even the implied warranty of
//      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//      GNU General Public License for more details.
//
//      You should have received a copy of the GNU General Public License
//      along with this program. If not, see
//      <http://www.gnu.org/licenses/>.
//

#ifndef LIB_SREC_INPUT_FILTER_CRC16_H
#define LIB_SREC_INPUT_FILTER_CRC16_H

#include <lib/crc16.h>
#include <lib/endian.h>
#include <lib/srec/input/filter.h>
#include <lib/srec/memory.h>

/**
  * The srec_input_filter_crc16 class is used to represent the state of
  * a checksum filter that inserts a CRC16 into the data.
  */
class srec_input_filter_crc16:
    public srec_input_filter
{
public:
    /**
      * The destructor.
      */
    virtual ~srec_input_filter_crc16();

private:
    /**
      * The constructor.
      *
      * @param end
      *     The byte order.
      */
    srec_input_filter_crc16(const srec_input::pointer &deeper,
        unsigned long address, endian_t end);

public:
    /**
      * The create class method is used to create new dynamically
      * allocated instances of this class.
      *
      * @param deeper
      *     The incoming data source to be filtered
      * @param end
      *     The byte order.
      */
    static pointer create(const srec_input::pointer &deeper,
        unsigned long address, endian_t end);

protected:
    // See base class for documentation.
    bool read(srec_record &record);

    // See base class for documentation.
    void command_line(srec_arglex *cmdln);

private:
    /**
      * The address instance variable is used to remember where to place
      * the CRC in memory.
      */
    unsigned long address;

    /**
      * The end instance variable is used to remember whether the byte
      * order is big-endian or little-endian.
      */
    endian_t end;

    /**
      * The seed_mode instance variable is used to remember the desired
      * seed for the CRC16 calculation.  Defaults to CCITT.
      */
    crc16::seed_mode_t seed_mode;

    /**
      * The augment_flag instance variable is used to remember whether
      * or not the final 16-zero-bits augmentation should be applied to
      * the CRC.  Almost always true.
      */
    bool augment_flag;

    /**
      * The buffer instance variable is used to remember the contents
      * of the deeper file.  The deeper file must be read completely in
      * order to calculate the CRC, and the input may be out of address
      * order, necessitating this buffer.
      */
    srec_memory buffer;

    /**
      * The buffer_pos instance variable is used to remember where we
      * are up to in processing 'buffer'.
      */
    unsigned long buffer_pos;

    /**
      * The have_forwarded_header instance variable is used to remember
      * whether we have returned the file header to our reader yet.
      */
    bool have_forwarded_header;

    /**
      * The have_given_crc instance variable is used to remember
      * whether we have returned the CRC to our reader yet.
      */
    bool have_given_crc;

    /**
      * The have_forwarded_start_address instance variable is used to
      * remember whether we have returned the execution start address to
      * our reader yet.
      */
    bool have_forwarded_start_address;

    /**
      * The default constructor.  Do not use.
      */
    srec_input_filter_crc16();

    /**
      * The copy constructor.  Do not use.
      */
    srec_input_filter_crc16(const srec_input_filter_crc16 &);

    /**
      * The assignment operator.  Do not use.
      */
    srec_input_filter_crc16 &operator=(const srec_input_filter_crc16 &);
};

#endif // LIB_SREC_INPUT_FILTER_CRC16_H
