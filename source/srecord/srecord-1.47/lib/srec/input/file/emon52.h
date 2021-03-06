//
//      srecord - manipulate eprom load files
//      Copyright (C) 2001, 2003, 2006-2008 Peter Miller
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

#ifndef LIB_SREC_INPUT_FILE_EMON52_H
#define LIB_SREC_INPUT_FILE_EMON52_H

#include <lib/srec/input/file.h>

/**
  * The emon52 class is used to parse an EMON52 formatted file (Elektor
  * Monitor, dunno what the 52 is for).
  */
class srec_input_file_emon52:
    public srec_input_file
{
public:
    /**
      * The destructor.
      */
    virtual ~srec_input_file_emon52();

private:
    /**
      * A constructor.  The input is read from the named file (or
      * the standard input if the file anme is "-").
      *
      * @param file_name
      *     The name of the file to be read.
      */
    srec_input_file_emon52(const std::string &file_name);

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
    bool read(srec_record &record);

    // See base class for documentation.
    const char *get_file_format_name() const;

private:
    /**
      * The skip_white_space method is used to skip space characters.
      * The format requires spaces in some locations, this method
      * skips the space of present.
      */
    void skip_white_space();

    /**
      * The default constructor.  Do not use.
      */
    srec_input_file_emon52();

    /**
      * The copy constructor.  Do not use.
      */
    srec_input_file_emon52(const srec_input_file_emon52 &);

    /**
      * The assignment operator.  Do not use.
      */
    srec_input_file_emon52 &operator=(const srec_input_file_emon52 &);
};

#endif // LIB_SREC_INPUT_FILE_EMON52_H
