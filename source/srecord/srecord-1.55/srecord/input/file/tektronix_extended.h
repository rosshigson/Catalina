//
// srecord - manipulate eprom load files
// Copyright (C) 2000, 2002, 2003, 2006-2008, 2010 Peter Miller
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

#ifndef SRECORD_INPUT_FILE_TEKTRONIX_EXTENDED_H
#define SRECORD_INPUT_FILE_TEKTRONIX_EXTENDED_H

#include <srecord/input/file.h>

namespace srecord {

/**
  * The srecord::input_file_tektronix_extended clas sis used to represent
  * the parse state of an input file in Tektronix Extended format.
  */
class input_file_tektronix_extended:
    public input_file
{
public:
    /**
      * The destructor.
      */
    virtual ~input_file_tektronix_extended();

private:
    /**
      * The constructor.
      *
      * @param file_name
      *     The name of the file to be read.
      */
    input_file_tektronix_extended(const std::string &file_name);

public:
    /**
      * The create class method is used to create new dynamically
      * allocated instances of this class.
      *
      * @param file_name
      *     The name of the file to be read.
      * @returns
      *     smart pointer to new instance
      */
    static pointer create(const std::string &file_name);

protected:
    // See base class for documentation.
    bool read(record &record);

    // See base class for documentation.
    const char *get_file_format_name() const;

private:
    /**
      * The data_record_count instance variable is used to remember the
      * number of data records seen in the input so far.
      */
    int data_record_count;

    /**
      * The read_inner method is used to read a record of input.
      * The read method is a wrapper around this method.
      */
    bool read_inner(record &);

    /**
      * The garbage_warning instance variable is used to remember
      * whether or not a warning about garbage line in the input has
      * been issued yet.
      */
    bool garbage_warning;

    /**
      * The seen_some_input instance variable is used to remember whether
      * any data has been seen in this file yet.
      */
    bool seen_some_input;

    /**
      * The header_seen instance variable is used to remember whether
      * the header record has been seen yet.
      */
    bool header_seen;

    /**
      * The termination_seen instance variable is used to remember
      * whether the termination record has been seen yet.
      */
    bool termination_seen;

    /**
      * The default constructor.  Do not use.
      */
    input_file_tektronix_extended();

    /**
      * The copy constructor.  Do not use.
      */
    input_file_tektronix_extended(const input_file_tektronix_extended &);

    /**
      * The assignment operator.  Do not use.
      */
    input_file_tektronix_extended &operator=(
        const input_file_tektronix_extended &);
};

};

#endif // SRECORD_INPUT_FILE_TEKTRONIX_EXTENDED_H
