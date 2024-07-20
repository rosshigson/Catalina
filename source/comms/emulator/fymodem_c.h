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

#include "fileapi.h"

/* max length of filename (including terminator) */
#define FYMODEM_FILE_NAME_MAX_LENGTH  64

/* setup comms port, mode (128 or 1024 byte blocks) and character delay time */
int fymodem_comms(HANDLE comms_handle, int mode, int time);

/* setup file name and timeout */
int fymodem_file(const char *file, int time);

/* abort ymodem transfer (send CAN CAN) */
int fymodem_abort();

/* receive file over ymodem */
int fymodem_receive();

/* send file over ymodem */
int fymodem_send();

/* retreive status of last operation */
int fymodem_status();

/* retreive expected count of last operation */
int fymodem_expected();

/* retreive actual count of last operation */
int fymodem_actual();

/* retreive file name of last operation */
char *fymodem_file_name ();

#endif
