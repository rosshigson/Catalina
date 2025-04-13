This folder contains the jQuery files required to run the Catalina jQuery 
demo, including a custom widget called "jquery.simplegauge".

These files must be loaded into the WiFi module file system. The easiest
way to do this is using the "jq_load" scripts.

This script uses the curl utility, which must be available. If it is not,
the files must be loaded manually - see below. To use the script, execute 
"jq_load" in this directory, specifying the IP address of the WiFi adapter. 
For example:

   jq_load 192.168.1.115

The files can also be loaded manually using the WiFi adapter web interface.
For example, if the WiFi adapter is on IP address 192.168.1.115, open a 
browser to http://192.168.1.115/update-ffs.html. Then press "Empty" to
empty the file system, and upload each of the files in this directory one
by one (note: you do not need this README.TXT file or the jq_load scripts).

WARNING: BE SURE TO EMPTY THE FILE SYSTEM BEFORE UPLOADING ANY NEW FILES! 

If the WiFi adapter file system fills up because it already contains some 
files, including previous versions of these files, loading any new files
can corrupt the Flash memory of the WiFi adapter, which will then need to
be re-flashed.

A note about the jQuery source
==============================

The jQuery files in this folder were downloaded from the latest stable build 
of jQuery UI (which includes jQuery itself) from https://jqueryui.com/. The 
version was https://jqueryui.com/resources/download/jquery-ui-1.14.1.zip.

Tthe following files from the distribution zip were copied into this folder:

  external/jquery.js                 => jquery.js
  jquery-ui.js                       => jquery-ui.js
  jquery-ui.css                      => jquery-ui.css
  jquery-ui.structure.css            => jquery-ui.structure.css
  jquery-ui.theme.css                => jquery-ui.theme.css
  images/ui-icons_444444_256x240.png => ui-icons_444444_256x240.png
  images/ui-icons_555555_256x240.png => ui-icons_555555_256x240.png
  images/ui-icons_777620_256x240.png => ui-icons_777620_256x240.png
  images/ui-icons_777777_256x240.png => ui-icons_777777_256x240.png
  images/ui-icons_cc0000_256x240.png => ui-icons_cc0000_256x240.png
  images/ui-icons_ffffff_256x240.png => ui-icons_ffffff_256x240.png

The file jquery-ui.css was edited to remove all instances of the "images/" 
path - since the WiFi adapter file system does not support subdirectores,
all the files must be in the same directory.

If a different version of jQuery UI is used, the filenames may be different
and additional files may be needed - edit the jq_load scripts accordingly.
