//
//      srecord - manipulate eprom load files
//      Copyright (C) 1998, 1999, 2001, 2002, 2005-2008 Peter Miller
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

#ifndef LIB_SREC_INPUT_FILTER_OR_H
#define LIB_SREC_INPUT_FILTER_OR_H

#include <lib/srec/input/filter.h>

/**
  * The srec_input_filter_and clas sis used to represent the input state
  * of a filter which bit-wise ORs all incoming data bytes with a fixed
  * value.
  */
class srec_input_filter_or:
    public srec_input_filter
{
public:
    /**
      * The destructor.
      */
    virtual ~srec_input_filter_or();

private:
    /**
      * The constructor.
      *
      * @param deeper
      *     The deeper input to be used as a data source.
      * @param value
      *     The value to be bit-wise ORed with each incoming data byte.
      */
    srec_input_filter_or(const srec_input::pointer &deeper, int value);

public:
    /**
      * The create class method is used to create new dynamically
      * allocated instances of this class.
      *
      * @param deeper
      *     The incoming data source to be filtered
      * @param value
      *     The value to be bit-wise ORed with each incoming data byte.
      */
    static pointer create(const srec_input::pointer &deeper, int value);

protected:
    // See base class for documentation.
    bool read(srec_record &record);

private:
    /**
      * The value instance variable is used to remember the value to be
      * bit-wise ORed with each incoming data byte.
      */
    int value;

    /**
      * The default constructor.  Do not use.
      */
    srec_input_filter_or();

    /**
      * The copy constructor.  Do not use.
      */
    srec_input_filter_or(const srec_input_filter_or &);

    /**
      * The assignment operator.  Do not use.
      */
    srec_input_filter_or &operator=(const srec_input_filter_or &);
};

#endif // LIB_SREC_INPUT_FILTER_OR_H
