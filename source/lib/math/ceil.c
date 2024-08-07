/*
 * (c) copyright 1988 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 *
 * Author: Ceriel J.H. Jacobs
 */
/* $Id: ceil.c,v 1.2 1994/06/24 11:43:20 ceriel Exp $ */

#include	<math.h>

double
ceil(double x)
{
	double val;

	return modf(x, &val) > 0 ? val + 1.0 : val ;
	/*	this also works if modf always returns a positive
		fractional part
	*/
}
