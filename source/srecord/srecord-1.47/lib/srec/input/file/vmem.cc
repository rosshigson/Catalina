//
//      srecord - manipulate eprom load files
//      Copyright (C) 2003, 2005-2008 Peter Miller
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

#include <cctype>
#include <lib/srec/input/file/vmem.h>
#include <lib/srec/record.h>


srec_input_file_vmem::~srec_input_file_vmem()
{
}


srec_input_file_vmem::srec_input_file_vmem(const std::string &a_file_name) :
    srec_input_file(a_file_name),
    seen_some_input(false),
    address(0)
{
}


srec_input::pointer
srec_input_file_vmem::create(const std::string &a_file_name)
{
    return pointer(new srec_input_file_vmem(a_file_name));
}


bool
srec_input_file_vmem::read(srec_record &record)
{
    for (;;)
    {
        int c = get_char();
        if (c < 0)
        {
            if (!seen_some_input)
                fatal_error("file contains no data");
            return false;
        }
        if (c == '@')
        {
            // collect address
            address = 0;
            for (;;)
            {
                address = (address << 4) + get_nibble();
                c = peek_char();
                if (c < 0 || !isxdigit((unsigned char)c))
                    break;
            }
            continue;
        }
        if (isspace((unsigned char)c))
            continue;

        if (c == '/')
        {
            c = get_char();
            if (c == '/')
            {
                for (;;)
                {
                    c = get_char();
                    if (c == '\n' || c < 0)
                        break;
                }
                continue;
            }
            if (c == '*')
            {
                for (;;)
                {
                    for (;;)
                    {
                        c = get_char();
                        if (c < 0)
                        {
                            eof_within_comment:
                            fatal_error("end-of-file within comment");
                        }
                        if (c == '*')
                            break;
                    }
                    for (;;)
                    {
                        c = get_char();
                        if (c < 0)
                            goto eof_within_comment;
                        if (c != '*')
                            break;
                    }
                    if (c =='/')
                        break;
                }
                continue;
            }
            fatal_error("malformed comment");
        }

        // collect value
        get_char_undo(c);
        unsigned char value[5];
        size_t nbytes = 0;
        while (nbytes < sizeof(value))
        {
            value[nbytes++] = get_byte();
            c = peek_char();
            if (c < 0 || !isxdigit((unsigned char)c))
                break;
        }
        switch (nbytes)
        {
        default:
            fatal_error("value has too many bytes (%d)", (int)nbytes);

        case 1:
        case 2:
        case 4:
            record =
                srec_record
                (
                    srec_record::type_data,
                    address * nbytes,
                    value,
                    nbytes
                );
            break;
        }

        // This is not a byte address, it's a chunk address.
        ++address;
        seen_some_input = true;
        return true;
    }
}


const char *
srec_input_file_vmem::get_file_format_name()
    const
{
    return "Verilog VMEM";
}
