//
//      srecord - manipulate eprom load files
//      Copyright (C) 1998, 1999, 2002, 2003, 2006-2008 Peter Miller
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
#include <lib/srec/input.h>
#include <lib/srec/input/interval.h>
#include <lib/srec/record.h>


interval
srec_input_interval(srec_input::pointer ifp)
{
    interval range;
    srec_record record;
    while (ifp->read(record))
    {
        if (record.get_type() != srec_record::type_data)
            continue;
        range +=
            interval
            (
                record.get_address(),
                record.get_address() + record.get_length()
            );
    }
    return range;
}
