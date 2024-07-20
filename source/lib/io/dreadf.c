/*
	DOSFS Embedded FAT-Compatible Filesystem
	(C) 2005 Lewin A.R.W. Edwards (sysadm@zws.com)

	You are permitted to modify and/or use this code in your own projects without
	payment of royalty, regardless of the license(s) you choose for those projects.

	You cannot re-copyright or restrict use of the code as released by Lewin Edwards.
*/

#include <string.h>
#include <stdlib.h>
#include <dosfs.h>

/*
	Read an open file
	You must supply a prepopulated FILEINFO as provided by DFS_OpenFile, and a
	pointer to a SECTOR_SIZE scratch buffer.
	Note that returning DFS_EOF is not an error condition. This function updates the
	successcount field with the number of bytes actually read.
*/
uint32_t DFS_ReadFile(PFILEINFO fileinfo, uint8_t *scratch, uint8_t *buffer, uint32_t *successcount, uint32_t len)
{
	uint32_t remain=0;
	uint32_t result = DFS_OK;
	uint32_t sector=0;
	uint32_t bytesread=0;
   int i;
   unsigned long l;

#if __CATALINA_DEBUG_DOSFS
   t_string(1, "\nDSF_ReadFile\n");
   dump_fileinfo(fileinfo);
   DFS_press_to_continue();
#endif

   // Don't try to read past EOF
	if (len > fileinfo->filelen - fileinfo->pointer)
		len = fileinfo->filelen - fileinfo->pointer;

	remain = len;
	*successcount = 0;

	while (remain && result == DFS_OK) {
		// This is a bit complicated. The sector we want to read is addressed at a cluster
		// granularity by the fileinfo->cluster member. The file pointer tells us how many
		// extra sectors to add to that number.
		sector = fileinfo->volinfo->dataarea +
		  ((fileinfo->cluster - 2) * fileinfo->volinfo->secperclus) +
		  div(div(fileinfo->pointer,fileinfo->volinfo->secperclus * SECTOR_SIZE).rem, SECTOR_SIZE).quot;

		// Case 1 - File pointer is not on a sector boundary
		if (div(fileinfo->pointer, SECTOR_SIZE).rem) {
			uint16_t tempreadsize;

			// We always have to go through scratch in this case
			result = DFS_ReadSector(fileinfo->volinfo->unit, scratch, sector, 1);

			// This is the number of bytes that we actually care about in the sector
			// just read.
			tempreadsize = SECTOR_SIZE - (div(fileinfo->pointer, SECTOR_SIZE).rem);
					
			// Case 1A - We want the entire remainder of the sector. After this
			// point, all passes through the read loop will be aligned on a sector
			// boundary, which allows us to go through the optimal path 2A below.
		   	if (remain >= tempreadsize) {
				memcpy(buffer, scratch + (SECTOR_SIZE - tempreadsize), tempreadsize);
				bytesread = tempreadsize;
				buffer += tempreadsize;
				fileinfo->pointer += tempreadsize;
				remain -= tempreadsize;
			}
			// Case 1B - This read concludes the file read operation
			else {
				memcpy(buffer, scratch + (SECTOR_SIZE - tempreadsize), remain);

				buffer += remain;
				fileinfo->pointer += remain;
				bytesread = remain;
				remain = 0;
			}
		}
		// Case 2 - File pointer is on sector boundary
		else {
			// Case 2A - We have at least one more full sector to read and don't have
			// to go through the scratch buffer. You could insert optimizations here to
			// read multiple sectors at a time, if you were thus inclined (note that
			// the maximum multi-read you could perform is a single cluster, so it would
			// be advantageous to have code similar to case 1A above that would round the
			// pointer to a cluster boundary the first pass through, so all subsequent
			// [large] read requests would be able to go a cluster at a time).
			if (remain >= SECTOR_SIZE) {
				result = DFS_ReadSector(fileinfo->volinfo->unit, buffer, sector, 1);
				remain -= SECTOR_SIZE;
				buffer += SECTOR_SIZE;
				fileinfo->pointer += SECTOR_SIZE;
				bytesread = SECTOR_SIZE;
			}
			// Case 2B - We are only reading a partial sector
			else {
				result = DFS_ReadSector(fileinfo->volinfo->unit, scratch, sector, 1);
				memcpy(buffer, scratch, remain);
				buffer += remain;
				fileinfo->pointer += remain;
				bytesread = remain;
				remain = 0;
			}
		}

		*successcount += bytesread;

		// check to see if we stepped over a cluster boundary
		if (div(fileinfo->pointer - bytesread, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot !=
		  div(fileinfo->pointer, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot) {
			// An act of minor evil - we use bytesread as a scratch integer, knowing that
			// its value is not used after updating *successcount above
			bytesread = 0;
#if __CATALINA_FAT12_SUPPORT
			if (((fileinfo->volinfo->filesystem == FAT12) && (fileinfo->cluster >= 0xff8)) ||
#else
			if (fileinfo->volinfo->filesystem == FAT12)
            return DFS_NOSUPPORT;
         else if (
#endif               
			  ((fileinfo->volinfo->filesystem == FAT16) && (fileinfo->cluster >= 0xfff8)) ||
			  ((fileinfo->volinfo->filesystem == FAT32) && (fileinfo->cluster >= 0x0ffffff8)))
				result = DFS_EOF;
			else
				fileinfo->cluster = DFS_GetFAT(fileinfo->volinfo, scratch, &bytesread, fileinfo->cluster);
		}
	}
	
	return result;
}

