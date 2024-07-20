#ifndef _FYMODEM_H_
#define _FYMODEM_H_

/**
 * Free YModem implementation.
 *
 * Fredrik Hederstierna 2014
 *
 * This file is in the public domain.
 * You can do whatever you want with it.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdarg.h>
#include <ctype.h>
#include <time.h>

#if defined(__CATALINA_libserial8)
#include <serial8.h>
#elif defined(__CATALINA_libserial4)
#include <serial4.h>
#elif defined(__CATALINA_libserial2) 
#include <serial2.h>
#elif defined(__CATALINA_libtty256) || defined(__CATALINA_libtty)
#include <tty.h>
#endif

/* max length of filename (including terminator) */
#define FYMODEM_FILE_NAME_MAX_LENGTH  (64)

/* set port (if not using main() functions provided) */
void fymodem_port(uint32_t port);

/* set small_mode and small_time (if not using main() functions provided) */
void fymodem_small(uint32_t mode, uint32_t time);

/* abort ymodem transfer (send CAN CAN) */
void fymodem_abort();

/* receive file over ymodem */
int32_t fymodem_receive(FILE **file,
                        char filename[FYMODEM_FILE_NAME_MAX_LENGTH],
                        uint32_t timeout,
                        uint32_t max_restarts);

/* send file over ymodem */
int32_t fymodem_send(FILE *file,
                     size_t txsize,
                     const char *filename,
                     uint32_t timeout);

/* retreive status of last operation */
int fymodem_status();

/* retreive expected count of last operation */
int fymodem_expected();

/* retreive actual count of last operation */
int fymodem_actual();

/* retreive file name of last operation */
char *fymodem_file_name ();

#endif
