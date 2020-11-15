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
	Seek file pointer to a given position
	This function does not return status - refer to the fileinfo->pointer value
	to see where the pointer wound up.
	Requires a SECTOR_SIZE scratch buffer
*/
void DFS_Seek(PFILEINFO fileinfo, uint32_t offset, uint8_t *scratch)
{
   uint32_t tempint;
#if APPLY_PATCHES
	uint16_t endcluster=0;  //canny/reza 5/7 fixed
#endif
#if __CATALINA_DEBUG_DOSFS
   t_string(1, "\nDSF_Seek offset ");
   t_integer(1, offset);
   t_string(1, "\n");
   DFS_press_to_continue();
#endif
	// larwe 9/16/06 bugfix split case 0a/0b and changed fallthrough handling
	// Case 0a - Return immediately for degenerate case
	if (offset == fileinfo->pointer) {
		return;
	}
	
	// Case 0b - Don't allow the user to seek past the end of the file
	if (offset > fileinfo->filelen) {
		offset = fileinfo->filelen;
		// NOTE NO RETURN HERE!
	}

	// Case 1 - Simple rewind to start
	// Note _intentional_ fallthrough from Case 0b above
	if (offset == 0) {
		fileinfo->cluster = fileinfo->firstcluster;
		fileinfo->pointer = 0;
		return;		// larwe 9/16/06 +1 bugfix
	}
	// Case 2 - Seeking backwards. Need to reset and seek forwards
	else if (offset < fileinfo->pointer) {
		fileinfo->cluster = fileinfo->firstcluster;
		fileinfo->pointer = 0;
		// NOTE NO RETURN HERE!
	}

	// Case 3 - Seeking forwards
	// Note _intentional_ fallthrough from Case 2 above

	// Case 3a - Seek size does not cross cluster boundary - 
	// very simple case
	// larwe 9/16/06 changed .rem to .quot in both div calls, bugfix
	if (div(fileinfo->pointer, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot ==
	  div(fileinfo->pointer + offset, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot) {
		fileinfo->pointer = offset;
	}
	// Case 3b - Seeking across cluster boundary(ies)
	else {
		// round file pointer down to cluster boundary
		fileinfo->pointer = div(fileinfo->pointer, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot *
		  fileinfo->volinfo->secperclus * SECTOR_SIZE;

		// seek by clusters
		// larwe 9/30/06 bugfix changed .rem to .quot in both div calls
#if APPLY_PATCHES
      // canny/reza 5/7  added endcluster related code
      endcluster = div(offset, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot;
      while (div(fileinfo->pointer, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot !=endcluster) {
#else
		while (div(fileinfo->pointer, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot !=
		  div(fileinfo->pointer + offset, fileinfo->volinfo->secperclus * SECTOR_SIZE).quot) {
#endif
			fileinfo->cluster = DFS_GetFAT(fileinfo->volinfo, scratch, &tempint, fileinfo->cluster);
			// Abort if there was an error
			if (fileinfo->cluster == 0x0ffffff7) {
				fileinfo->pointer = 0;
				fileinfo->cluster = fileinfo->firstcluster;
				return;
			}
			fileinfo->pointer += SECTOR_SIZE * fileinfo->volinfo->secperclus;
		}

		// since we know the cluster is right, we have no more work to do
		fileinfo->pointer = offset;
	}
#if __CATALINA_DEBUG_DOSFS
   t_string(1, "\nDFS_Seek\n");
   dump_fileinfo(fileinfo);
   DFS_press_to_continue();
#endif
}

