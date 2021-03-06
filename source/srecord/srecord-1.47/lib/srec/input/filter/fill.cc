//
//      srecord - manipulate eprom load files
//      Copyright (C) 1998, 1999, 2001, 2002, 2004, 2006-2008 Peter Miller
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

#include <cstring>

#include <lib/interval.h>
#include <lib/srec/input/filter/fill.h>
#include <lib/srec/record.h>


srec_input_filter_fill::~srec_input_filter_fill()
{
    delete [] filler_block;
}


srec_input_filter_fill::srec_input_filter_fill(const srec_input::pointer &a1,
        int a2, const interval &a3) :
    srec_input_filter(a1),
    filler_value(a2),
    filler_block(0),
    range(a3)
{
}


srec_input::pointer
srec_input_filter_fill::create(const srec_input::pointer &a_deeper,
    int a_value, const interval &a_range)
{
    return pointer(new srec_input_filter_fill(a_deeper, a_value, a_range));
}


bool
srec_input_filter_fill::generate(srec_record &record)
{
    if (range.empty())
        return false;
    interval chunk(range.get_lowest(), range.get_lowest() + 256);
    chunk *= range;
    chunk.first_interval_only();
    if (!filler_block)
    {
        filler_block = new unsigned char [256];
        memset(filler_block, filler_value, 256);
    }
    record =
        srec_record
        (
            srec_record::type_data,
            chunk.get_lowest(),
            filler_block,
            chunk.get_highest() - chunk.get_lowest()
        );
    range -= chunk;
    return true;
}


bool
srec_input_filter_fill::read(srec_record &record)
{
    if (!srec_input_filter::read(record))
        return generate(record);
    if (record.get_type() == srec_record::type_data)
    {
        range -=
            interval
            (
                record.get_address(),
                record.get_address() + record.get_length()
            );
    }
    return true;
}
