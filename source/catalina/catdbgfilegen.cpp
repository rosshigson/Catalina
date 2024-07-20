#pragma GCC diagnostic ignored "-Wwrite-strings"

#include "catdbgfilegen.h"

using namespace CatDbgUtilities;

int main(int argc, char *argv[]) {
    if (argc < 2) {
        std::cout << std::endl;
        std::cout << std::string("Catalina Debug File Generator, Version ");
        std::cout << std::string(VERSION) << std::endl << std::endl;
        std::cout << std::string("Usage: catdbgfilegen \"path to .lst\"  \"-d .debug files dir\" [-s] [-n] [-linux]") << std::endl;
        std::cout << std::string("       -s  option: include standard  TYPEDEF lines in output") << std::endl;
        std::cout << std::string("       -n  option: include generated TYPEDEF lines in output") << std::endl;
        std::cout << std::string("       -d  option: path to .debug files -- multiple entries accepted") << std::endl;
        std::cout << std::string("   -linux  option: use Linux file conventions (needed if no / present in args") << std::endl;
        std::cout << std::string("  returns  0 if processing completed normally") << std::endl;
        std::cout << std::string("  returns -1 if .lst file could not be opened or error in cmd line arguments") << std::endl;
        std::cout << std::string("  returns -2 for any other error -- these are detailed in .dbg file") << std::endl;
        std::cout << std::string("") << std::endl;

        return -1;
    }

    // Launch (and name for local use) the dll that does all the heavy lifting.

    DbgDLL *DbgLib = new DbgDLL();

    // There is a GUI version that is used for testing that allows typedefs to be
    // toggled on or off by a menu click.  Here we make sure that, if the user inadvertently
    // puts multiple -s or -n options in the command line, he will still get what he expects.
    // That is the purpose of the two bools that follow.

    bool showStandardTypedefs = false;
    bool showNewTypedefs = false;

    // We will accumulate the various paths to debug files in this list of strings.

    std::vector<std::string> debugFilePaths = std::vector<std::string>();

    for (int i = 2; i < argc; i++) {
        if (StartsWith(argv[i], "-s")) {
            showStandardTypedefs = true;
            continue;
        }

        if (StartsWith(argv[i], "-n")) {
            showNewTypedefs = true;
            continue;
        }

        if (StartsWith(argv[i], "-linux") || (strstr(argv[i], "/") != NULL)) {
            DbgLib->SetLinux(true);
            continue;
        }

        if (StartsWith(argv[i], "-d")) {
            // Next argument is a path to a .debug directory.  Make
            // sure that there IS a next argument.
            if (++i < argc) {
                debugFilePaths.push_back(argv[i]);
                continue;
            }
            else {
                return -1;
            }
        }

        // If this point is reached, there was an unrecognized command line option.
        return -1;
    }

    if (showStandardTypedefs) {
       DbgLib->ToggleShowStdTypeDefs();
    }
    if (showNewTypedefs) {
       DbgLib->ToggleShowNewTypeDefs();
    }

    // The FillListFile() routine builds a symbol table (hashed) and a list of source files (with full path)
    // from information extracted from the .lst file

    int result = DbgLib->FillListFile(argv[1]);

    if (result != 0) {
        // Failed to open and read .lst file.  We have to report this this way because
        // a .dbg file is not open in this case.
        return -1;
    }

    // Note: Now that we can open the .lst file, we are also able to write a .dbg file,
    // so any further errors will be recorded there in detail.

    DbgLib->GenerateDbgFile(debugFilePaths); // Go generate a .dbg file

    std::string results = DbgLib->GetOutputString(); // Get a copy of the .dbg file

    // Any error, including not being able to open a .debug directory, or find
    // a required .debug file is reported in the .dbg file in a line that starts with =====

    if (strstr(results.c_str(), "=====") != NULL) {
        return -2;
    }
    else {
        return 0;
    }
}

