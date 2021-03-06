//
// srecord - manipulate eprom load files
// Copyright (C) 1998, 1999, 2001-2003, 2006-2010 Peter Miller
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation; either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program. If not, see
// <http://www.gnu.org/licenses/>.
//

#include <srecord/output/file/intel.h>
#include <srecord/record.h>


srecord::output_file_intel::~output_file_intel()
{
    if (enable_footer_flag)
        write_inner(1, 0L, 0, 0);
}


srecord::output_file_intel::output_file_intel(const std::string &a_file_name) :
    srecord::output_file(a_file_name),
    address_base(1),
    pref_block_size(32),
    mode(linear)
{
    // The address base always has the lower 16 bits set to zero.
    // By making it be 1, we force the first data record to emit an
    // address base record first.
}


srecord::output::pointer
srecord::output_file_intel::create(const std::string &a_file_name)
{
    return pointer(new srecord::output_file_intel(a_file_name));
}


void
srecord::output_file_intel::write_inner(int tag, unsigned long address,
    const void *data, int data_nbytes)
{
    //
    // Make sure the line is not too long.
    //
    if (data_nbytes >= 256)
        fatal_error("data length (%d) too long", data_nbytes);

    //
    // Emit the line as hexadecimal text.
    //
    put_char(':');
    checksum_reset();
    put_byte(data_nbytes);
    unsigned char tmp[2];
    srecord::record::encode_big_endian(tmp, address, 2);
    put_byte(tmp[0]);
    put_byte(tmp[1]);
    put_byte(tag);
    const unsigned char *data_p = (const unsigned char *)data;
    for (int j = 0; j < data_nbytes; ++j)
        put_byte(data_p[j]);
    put_byte(-checksum_get());
    put_char('\n');
}


void
srecord::output_file_intel::write(const srecord::record &record)
{
    unsigned char tmp[4];
    switch (record.get_type())
    {
    case srecord::record::type_header:
        //
        // This format can't do header records
        //
        break;

    case srecord::record::type_data:
        //
        // Segmented mode has an ugly boundary condition.
        //
        if (mode != linear)
        {
            //
            // If the record would cross a segment boundary, split the
            // record across the boundary.  This avoids an ambiguity in
            // the Intel spec.
            //
            srecord::record::address_t begin_segment =
                record.get_address() >> 16;
            srecord::record::address_t end_segment =
                (record.get_address() + record.get_length() - 1) >> 16;
            if (begin_segment != end_segment)
            {
                int split = (1L << 16) - (record.get_address() & 0xFFFF);
                srecord::record part1
                (
                    srecord::record::type_data,
                    record.get_address(),
                    record.get_data(),
                    split
                );
                write(part1);
                srecord::record part2
                (
                    srecord::record::type_data,
                    record.get_address() + split,
                    record.get_data() + split,
                    record.get_length() - split
                );
                write(part2);
                return;
            }
        }

        if ((record.get_address() & 0xFFFF0000) != address_base)
        {
            address_base = record.get_address() & 0xFFFF0000;
            if (mode == linear)
            {
                srecord::record::encode_big_endian(tmp, address_base >> 16, 2);
                write_inner(4, 0L, tmp, 2);
            }
            else
            {
                if (address_base >= (1UL << 20))
                    data_address_too_large(record);
                srecord::record::encode_big_endian(tmp, address_base >> 4, 2);
                write_inner(2, 0L, tmp, 2);
            }
        }
        write_inner
        (
            0,
            record.get_address() & 0x0000FFFF,
            record.get_data(),
            record.get_length()
        );
        break;

    case srecord::record::type_data_count:
        // ignore
        break;

    case srecord::record::type_execution_start_address:
        if (enable_goto_addr_flag)
        {
            srecord::record::encode_big_endian(tmp, record.get_address(), 4);
            write_inner((mode == linear ? 5 : 3), 0L, tmp, 4);
        }
        break;

    case srecord::record::type_unknown:
        fatal_error("can't write unknown record type");
        break;
    }
}


void
srecord::output_file_intel::line_length_set(int n)
{
    //
    // Given the number of characters, figure the maximum number of
    // data baytes.
    //
    n = (n - 11) / 2;

    //
    // Constrain based on the file format.
    // (255 is the largest that will fit in the data size field)
    //
    if (n < 1)
        n = 1;
    else if (n > 255)
        n = 255;

    //
    // An additional constraint is the size of the srecord::record
    // data buffer.
    //
    if (n > srecord::record::max_data_length)
        n = srecord::record::max_data_length;
    pref_block_size = n;
}


void
srecord::output_file_intel::address_length_set(int x)
{
    mode = (x <= 2 ? segmented : linear);
}


int
srecord::output_file_intel::preferred_block_size_get()
        const
{
    return pref_block_size;
}


const char *
srecord::output_file_intel::format_name()
    const
{
    return "Intel-Hex";
}
