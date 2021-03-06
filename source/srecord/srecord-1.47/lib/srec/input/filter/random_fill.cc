//
//      srecord - manipulate eprom load files
//      Copyright (C) 2004, 2006-2008 Peter Miller
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

#include <lib/interval.h>
#include <lib/r250.h>
#include <lib/srec/input/filter/random_fill.h>
#include <lib/srec/record.h>


srec_input_filter_random_fill::~srec_input_filter_random_fill()
{
}


srec_input_filter_random_fill::srec_input_filter_random_fill(
        const srec_input::pointer &a1, const interval &a3) :
    srec_input_filter(a1),
    range(a3)
{
}


srec_input::pointer
srec_input_filter_random_fill::create(const srec_input::pointer &a_deeper,
    const interval &a_range)
{
    return pointer(new srec_input_filter_random_fill(a_deeper, a_range));
}


bool
srec_input_filter_random_fill::generate(srec_record &record)
{
    if (range.empty())
        return false;
    unsigned char buffer[srec_record::max_data_length];
    interval chunk(range.get_lowest(), range.get_lowest() + sizeof(buffer));
    chunk *= range;
    chunk.first_interval_only();
    int nbytes = chunk.get_highest() - chunk.get_lowest();
    for (int j = 0; j < nbytes; ++j)
        buffer[j] = r250();
    record =
        srec_record
        (
            srec_record::type_data,
            chunk.get_lowest(),
            buffer,
            nbytes
        );
    range -= chunk;
    return true;
}


bool
srec_input_filter_random_fill::read(srec_record &record)
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
