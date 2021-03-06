//
//      srecord - Manipulate EPROM load files
//      Copyright (C) 2008 Peter Miller
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

#ifndef LIB_PRETTY_SIZE_H
#define LIB_PRETTY_SIZE_H

#include <string>

/**
  * The pretty_size function is used to convert a number into a smaller
  * number with a multiplying suffix (kMGT...).
  *
  * @param x
  *     The number to be converted.
  * @param width
  *     The width of the field you would like to print the number in.
  *     More than six is unnecessary.
  * @returns
  *     a string, including the suffix.
  */
std::string pretty_size(long long x, int width = 0);

// vim:ts=8:sw=4:et
#endif // LIB_PRETTY_SIZE_H
