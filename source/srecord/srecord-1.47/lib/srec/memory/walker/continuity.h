//
//      srecord - manipulate eprom load files
//      Copyright (C) 2006-2008 Peter Miller
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

#ifndef LIB_SREC_MEMORY_WALKER_CONTINUITY_H
#define LIB_SREC_MEMORY_WALKER_CONTINUITY_H

#include <lib/srec/memory/walker.h>

/**
  * The srec_memory_walker_crc16 class is used to represent the parse
  * state of a memory walker which determines whether or not the data
  * are continuous.
  */
class srec_memory_walker_continuity:
    public srec_memory_walker
{
public:
    typedef boost::shared_ptr<srec_memory_walker_continuity> pointer;

    /**
      * The destructror.
      */
    virtual ~srec_memory_walker_continuity();

private:
    /**
      * The default constructor.  It is private on purpose, use the
      * #create class method instead.
      */
    srec_memory_walker_continuity();

public:
    /**
      * The create class method is used to create new dynamically
      * allocated instances of class.
      */
    static pointer create();

    /**
      * The is_continuous method is used to get the results of the
      * calculation.
      *
      * @returns
      *     true if the data has no holes, false if there are holes
      */
    bool is_continuous() const;

protected:
    // See base class for documentation.
    void observe(unsigned long, const void *, int);

private:
    unsigned long current_address;
    bool data_seen;
    int nholes;

    /**
      * The copy constructor.  No not use.
      */
    srec_memory_walker_continuity(const srec_memory_walker_continuity &);

    /**
      * The assignment operator.  No not use.
      */
    srec_memory_walker_continuity &operator=(
        const srec_memory_walker_continuity &);
};

#endif // LIB_SREC_MEMORY_WALKER_CONTINUITY_H
