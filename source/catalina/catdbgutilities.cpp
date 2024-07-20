#pragma GCC diagnostic ignored "-Wwrite-strings"

#include <string.h>

#include "catdbgutilities.h"


int StartsWith(const char *str, const char *match) {
   int n = strlen(match);

   return (strncmp(str, match, n) == 0);
}


int StartsWith(char *str, char *match) {
   int n = strlen(match);

   return (strncmp(str, match, n) == 0);
}


int EndsWith(const char *str, const char *match) {
   int n = strlen(match);
   int m = strlen(str);

   if (m >= n) {
      return (strncmp(&str[m-n], match, n) == 0);
   }
   else {
      return 0;
   }
}

int Contains(const char *str, const char *match) {
   const char *found;

   if ((found = strstr(str, match)) != NULL) {
      return (found - str);
   }
   return -1;
}

bool DirExists(const char *dirName) {
   struct stat myStat;
   if ((stat(dirName, &myStat) == 0) && S_ISDIR(myStat.st_mode)) {
      return true;
   }
   else {
      return false;
   }
}

// trim from start
static inline std::string &ltrim(std::string &s) {
        s.erase(s.begin(), std::find_if(s.begin(), s.end(), [](int c) {return !std::isspace(c);}));
        return s;
}

// trim from end
static inline std::string &rtrim(std::string &s) {
        s.erase(std::find_if(s.rbegin(), s.rend(), [](int c) {return !std::isspace(c);}).base(), s.end());
        return s;
}

// trim specific characters (i.e. any character in m) from end of s
static inline std::string &rtrim(std::string &s, std::string &m) {
        std::size_t found = s.find_last_not_of(m);
        if (found != std::string::npos) {
           s.erase(found+1);
        }
        else {
           s.clear();
        }
        return s;
}

// trim from both ends
static inline std::string &trim(std::string &s) {
        return ltrim(rtrim(s));
}

std::vector<std::string> Split(const std::string& input, const std::string& separators, bool remove_empty = false)
{
    std::vector<std::string> lst;
    std::ostringstream word;

    for (size_t n = 0; n < input.size(); ++n)
    {
        if (std::string::npos == separators.find(input[n]))
            word << input[n];
        else
        {
            if (!word.str().empty() || !remove_empty)
                lst.push_back(word.str());
            word.str("");
        }
    }
    if (!word.str().empty() || !remove_empty) {
        lst.push_back(word.str());
    }
    return lst;
}

namespace CatDbgUtilities {

   std::string DbgDLL::ExtractHubAddress(const std::string &aLine) {
       std::string ans = "0x";
       int i;
       int searchCount = aLine.length();
       if (searchCount > 8) {
          searchCount = 8;
       }
       for (i = 0; i < searchCount; i++) {
           if (aLine[i] != '(') {
               ans += aLine[i];
           }
           else {
               break;
           }
       }
       //printf("addr = %s\n", ans.c_str()); 

       return ans;
   }

   void DbgDLL::AddToSymbolTable(std::string &aLine) {
       if (StartsWith(aLine.c_str(), "'") && strstr(aLine.c_str(), "Catalina.spin") != NULL) {
           InCatalinaSpinSegment = true;
           return;
       }
       if (InCatalinaSpinSegment && EndsWith(aLine.c_str(), "object pointers")) {
           std::string splitChar= ":";
           std::vector<std::string> parts = Split(aLine, splitChar);
           RelocConstantString = parts[0];
           InCatalinaSpinSegment = false;

           return;
       }
       if (EndsWith(aLine.c_str(), FileNameTerminationText.c_str())) {
           std::string sourceFileName = ExtractSourceFileName(aLine);
           SourceFileList.push_back(sourceFileName);
           AddToOutput(sourceFileName);
           return;
       }
       std::string key;
       int Spos = aLine.rfind("L__");
       if (Spos >= 0) {
           key = aLine;
           key.erase(0, Spos);
           SymbolTable[key] = ExtractHubAddress(aLine);
           return;
       }

       if (EndsWith(aLine.c_str(), ">")) {
           //printf("line = %s\n", aLine.c_str()); 
           Spos = aLine.rfind('<');
           if (Spos >= 0) {
               std::string symStr = aLine;
               symStr.erase(0, Spos);
               std::string splitChars = "<:>";
               std::vector<std::string> parts = Split(symStr, splitChars, true);
               if (parts.size() != 2) { // Mal-formed symbol designator in list file
                  //printf("malformed line 2 = %s\n", aLine.c_str()); 
                  return;
               }
               SymbolTable[parts[1]] = ExtractHubAddress(aLine);
           }
           std::string quoteChar = "\'";
           std::vector<std::string> moreParts = Split(aLine, quoteChar, true);
           if (moreParts.size() == 2) { 
              // P2 format list file
              std::string splitChars = " ";
              std::vector<std::string> evenMoreParts = Split(moreParts[0], splitChars, true);
              if (evenMoreParts.size() != 2) { // Mal-formed symbol designator in list file
                 //printf("malformed line 2 = %s\n", aLine.c_str()); 
                 return;
              }
              std::string lookUpKey = trim(evenMoreParts[1]);
              //printf("lookup symbol = %s\n", lookUpKey.c_str());
              SymbolTable[lookUpKey] = ExtractHubAddress(aLine);
           }
           else if (moreParts.size() == 3) {
              // P1 format list file
              std::string lookUpKey = trim(moreParts[1]);
              //printf("lookup symbol = %s\n", lookUpKey.c_str());
              SymbolTable[lookUpKey] = ExtractHubAddress(aLine);
           }
           else {
              // not P1 or P2 format list file => Mal-formed symbol designator in list file
              //printf("malformed line 3 = %s\n", aLine.c_str()); 
              return;
           }
       }
   }

   int DbgDLL::FillListFile(const std::string &listFilePath) {
       SymbolTable.clear();
       SourceFileList.clear();
       InCatalinaSpinSegment = false;
       ListFile.clear();
       TheTotalText = std::string("We no longer load the listing file into this window because of the time it took.") + NewLine;
       ListFilePath = listFilePath;
       std::ifstream sr;
       sr.open(listFilePath);
       if (!sr.is_open()) {
          return -1;
       }
       try {
          while (!sr.eof()) {
              std::string aLine;
              getline(sr, aLine);
              ListFile.push_back(aLine);
              AddToSymbolTable(aLine);
          }
          sr.close();
       }
       catch (...) {
           // Any problems trying to read the .lst file.
           sr.close();
           return -1;
       }
       return 0;
   }

   void DbgDLL::SetLinux(bool linuxConventionForFilenames) {
       Linux = linuxConventionForFilenames;
   }

   int DbgDLL::GenerateDbgFile(std::vector<std::string> &debugPaths) {
       OutputString = "";
       DebugOutput.clear();
       std::string debugPath = "";
       for (int i = 0; i < debugPaths.size(); i++) {
           debugPath = debugPaths[i];
           try {
               if (!DirExists(debugPath.c_str())) {
                   AddToOutput("===== debug files directory provided does not exist.");
                   PostProcessDebugOutput();
                   WriteOutputToDbgFile();
                   return -1;
               }
           }
           catch (std::exception &err) {
               AddToOutput(std::string("===== Problem with debug files directory path: ") + err.what());
               PostProcessDebugOutput();
               WriteOutputToDbgFile();
               return -1;
           }
           if (!Linux && !EndsWith(debugPath.c_str(), "\\")) {
               debugPath += std::string("\\"); // Windows convention
           }
           if (Linux && !EndsWith(debugPath.c_str(), "/")) {
               debugPath += std::string("/"); // Linux convention
           }
           debugPaths[i] = debugPath;
       }
       OutputString = "";
       DebugOutput.clear();
       AddToOutput(std::string("RELOC ") + RelocConstantString + std::string("   (subtract this value from listing address to get hub address)"));
       AddToOutput("");
       PostProcessDebugOutput();
       WriteOutputToDbgFile();
       ProcessSourceFileList(debugPaths);
       WriteOutputToDbgFile();
       return 0;
   }

   std::string DbgDLL::GetOutputString() {
       return OutputString;
   }

   bool DbgDLL::ToggleShowNewTypeDefs() {
       ShowNewTypeDefs = !ShowNewTypeDefs;
       return ShowNewTypeDefs;
   }

   bool DbgDLL::ToggleShowStdTypeDefs() {
       ShowStdTypeDefs = !ShowStdTypeDefs;
       return ShowStdTypeDefs;
   }

   std::string DbgDLL::GetTheTotalText() {
       return TheTotalText;
   }

   void DbgDLL::Process_stabs_0x64(std::vector<std::string> &stablineParts) {
        // SOURCE filename
       std::string sourcePath = "";
       if (EndsWith(stablineParts[0].c_str(), "/")) {
          std::string trimChar = "/'";
           ProjectDirectory = rtrim(stablineParts[0], trimChar);
           Linux = (strstr(ProjectDirectory.c_str(), "/") != NULL);
       }
       else {
           Linux = Linux || (strstr(stablineParts[0].c_str(), "/") != NULL);
           if (Linux) {
               if (StartsWith(stablineParts[0].c_str(), "/")) {
                   sourcePath = stablineParts[0];
               }
               else {
                   sourcePath = ProjectDirectory + std::string("/") + stablineParts[0];
               }
           }
           else {
               if (strstr(stablineParts[0].c_str(), ":") != NULL) {
                   sourcePath = stablineParts[0];
               }
               else {
                   sourcePath = ProjectDirectory + std::string("\\") + stablineParts[0];
               }
           }
           AddToOutput(std::string("SOURCE  ") + "\"" + sourcePath + std::string("\""));
       }
   }

   void DbgDLL::Process_stabs_0x84(std::vector<std::string> &stablineParts) {
       // SOURCE
       std::string sourcePath = "";
       sourcePath = ProjectDirectory + std::string("\\") + stablineParts[0];
       AddToOutput(std::string("INCSRC  ") + "\"" + sourcePath + std::string("\""));
   }

   void DbgDLL::Process_stabs_128(std::vector<std::string> &stablineParts) {
         // LOCVAR
       std::string splitChar = ":=;";
       std::vector<std::string> parts = Split(stablineParts[0], splitChar);
       if (parts.size() < 2) {
           AddToOutput(std::string("===== Invalid typedef: ") + RebuildStabs(stablineParts));
           return;
       }
       if (isdigit(parts[1][0])) {

           // DEFER THIS PROCESSING TILL AFTER ALL TYPES FINALIZED !!!
           std::string typeNum = parts[1];
           std::string typeInfo = GetTypeName(typeNum);
           std::string accessStr = std::string("FP(") + stablineParts[4] + std::string(")");

           std::string varData = parts[0] + std::string(" (") + typeInfo + std::string(") @ ") + accessStr;
           if (LexLevel > 1) {
               AddToVisibleVarsList(LexLevel, varData);
               return;
           }
           std::string visibility = std::string("[") + StringConverterHelper::toString(LexLevel) + std::string("] ");
           //AddToOutput(std::string("LOCVAR ") + CurrentProc + visibility + varData);
           Locals.push_back(CurrentProc + visibility + varData);
           return;
       }
       if (parts[1].length() < 2) {
           AddToOutput(std::string("===== Invalid typedef: ") + RebuildStabs(stablineParts));
           return;
       }
       ExtractEmbeddedTypeDefsFrom_128(stablineParts[0]);
       return;
   }

   void DbgDLL::Process_stabs_32(std::vector<std::string> &stablineParts) {
         // GLOBVAR
       std::string splitChar = ":";
       std::vector<std::string> parts = Split(stablineParts[0], splitChar);
       if (parts.size() != 2 || parts[1].length() < 2 || !StartsWith(parts[1].c_str(), "G")) {
           AddToOutput(std::string("===== invalid global def: ") + RebuildStabs(stablineParts));
           return;
       }
       std::string typenum = parts[1];
       typenum.erase(0, 1);
       if (!TypeDefListHas(typenum)) {
           AddToOutput(std::string("===== undefined type in global def: ") + RebuildStabs(stablineParts));
           return;
       }
       std::string mangledSymbol = ConvertSymbolToMangledForm(parts[0]);

       
        // DEFER THIS PROCESSING TILL AFTER ALL TYPES FINALIZED !!!
       //AddToOutput(std::string("GLOBVAR ") + parts[0] + std::string(" (") + GetTypeName(typenum) + std::string(") @ ") + LocationOf(mangledSymbol));
       GlobVars.push_back(parts[0] + std::string(" (") + GetTypeName(typenum) + std::string(") @ ") + LocationOf(mangledSymbol));
       return;
   }

   void DbgDLL::Process_stabs_36(std::vector<std::string> &stablineParts) {
         // function name
       std::string splitChar = ":";
       std::vector<std::string> parts = Split(stablineParts[0], splitChar);
       CurrentProc = parts[0];
       LexLevel = 0;
       std::string funcNameStr = ConvertSymbolToMangledForm(CurrentProc) + std::string(" ' ") + std::string("<symbol:") + CurrentProc + std::string(">");
       for (int indexIntoLstFile = 0; indexIntoLstFile < ListFile.size(); indexIntoLstFile++) {
           if (EndsWith(ListFile[indexIntoLstFile].c_str(), funcNameStr.c_str())) {
               if ((strstr(ListFile[indexIntoLstFile + 1].c_str(), "jmp #NEWF") != NULL)
               ||  (strstr(ListFile[indexIntoLstFile + 1].c_str(), "calld PA,#NEWF") != NULL)
               ||  (strstr(ListFile[indexIntoLstFile + 1].c_str(), "long I32_NEWF") != NULL)
               ||  (CurrentProc == "main")) {
                
                   AddToOutput(std::string("FRAMED  ") + CurrentProc);
               }
               else {
                   AddToOutput(std::string("NOFRAME ") + CurrentProc);
               }
               return;
           }
       }
   }

   void DbgDLL::Process_stabs_38(std::vector<std::string> &stablineParts) {
         // => stabs 40
       Process_stabs_40(stablineParts);
   }

   void DbgDLL::Process_stabs_40(std::vector<std::string> &stablineParts) {
         // LOCVAR or GLOBFILE

       // DEFER THIS PROCESSING TILL AFTER ALL TYPES FINALIZED !!!
       std::string splitChar = ":";
       std::vector<std::string> parts = Split(stablineParts[0], splitChar);
       if (parts.size() != 2) {
           AddToOutput(std::string("===== Invalid stabs line: ") + RebuildStabs(stablineParts));
           return;
       }
       std::string accessStr = "TBD";
       std::string typeNum = "";
       std::string typeInfo = "???";
       char scopeChar = parts[1][0];
       typeNum = parts[1];
       typeNum.erase(0, 1);
       std::string baseType = GetTypeName(typeNum);
       typeInfo = std::string("static ") + baseType;
       accessStr = LocationOf(stablineParts[4]);
       std::string varData = parts[0] + std::string(" (") + typeInfo + std::string(") @ ") + accessStr;
       if (LexLevel > 1) {
           AddToVisibleVarsList(LexLevel, varData);
           return;
       }

       std::string visibility = std::string("[") + StringConverterHelper::toString(LexLevel) + std::string("] ");
       if (scopeChar == 'V') {
           //AddToOutput(std::string("LOCVAR ") + CurrentProc + visibility + varData);
           Locals.push_back(CurrentProc + visibility + varData);
       }
       else if (scopeChar == 'S') {
           //AddToOutput(std::string("GLOBFILE ") + varData);
           GlobFiles.push_back(varData);
       }
       else {
           AddToOutput(std::string("===== undefined scopeChar in stabs 40: ") + RebuildStabs(stablineParts));
       }
   }

   void DbgDLL::Process_stabs_64(std::vector<std::string> &stablineParts) {
         // LOCVAR

       // DEFER THIS PROCESSING TILL AFTER ALL TYPES FINALIZED !!!
       std::string splitChar = ":";
       std::vector<std::string> parts = Split(stablineParts[0], splitChar);
       int regNum = atoi(stablineParts[4].c_str());
       if (regNum > 31) {
           regNum = regNum - 32;
       }
       std::string typeNum = parts[1];
       typeNum.erase(0, 1);
       std::string typeInfo = GetTypeName(typeNum);
       std::string accessStr = std::string("r") + StringConverterHelper::toString(regNum);
       ;
       std::string varData = parts[0] + std::string(" (") + typeInfo + std::string(") @ ") + accessStr;
       if (LexLevel > 1) {
           AddToVisibleVarsList(LexLevel, varData);
           return;
       }
       std::string visibility = std::string("[") + StringConverterHelper::toString(LexLevel) + std::string("] ");
       //AddToOutput(std::string("LOCVAR ") + CurrentProc + visibility + varData);
       Locals.push_back(CurrentProc + visibility + varData);
   }

   void DbgDLL::Process_stabs_100(std::vector<std::string> &stablineParts) {
         // ignored
       return;
   }

   void DbgDLL::Process_stabs_160(std::vector<std::string> &stablineParts) {
         // LOCVAR (function parameters)

       // DEFER THIS PROCESSING TILL AFTER ALL TYPES FINALIZED !!!
       std::string splitChar = ":";
       std::vector<std::string> parts = Split(stablineParts[0], splitChar);
       if (parts.size() != 2) {
           AddToOutput(std::string("===== Invalid stabs line: ") + RebuildStabs(stablineParts));
           return;
       }
       std::string typeNum = parts[1];
       typeNum.erase(0, 1); // Get rid of p
       std::string typeInfo = GetTypeName(typeNum);
       std::string accessStr = std::string("FP(") + stablineParts[4] + std::string(")");
       std::string visibility = std::string("[") + StringConverterHelper::toString(LexLevel) + std::string("] ");
       //AddToOutput(std::string("LOCVAR ") + CurrentProc + visibility + parts[0] + std::string(" (") + typeInfo + std::string(") @ ") + accessStr);
       Locals.push_back(CurrentProc + visibility + parts[0] + std::string(" (") + typeInfo + std::string(") @ ") + accessStr);
   }

   void DbgDLL::Process_stabn_0x44(std::vector<std::string> &stablineParts) {
         // LINENUM
       std::string searchStr = StripProcNameFromLabel(stablineParts[3]);
       std::string varData = "";
       if (LexLevel > 1) {
           for (int i = LexLevel - 2; i >= 0; i--) {
               if (VisibleVars.size() > i) {
                   varData += VisibleVars[i];
               }
           }
       }
       std::string trimChars = "| ";
       varData = rtrim(varData, trimChars);
       std::string procName = ExtractUnmangledProcNameFrom(stablineParts[3]);
       std::string loc = LocationOf(searchStr);
       if (WaitingForFirst0x44) {
           FirstLineLoc = loc;
           WaitingForFirst0x44 = false;
       }
       LastLineLoc = loc;
       AddToOutput(std::string("LINENUM ") + stablineParts[2] + std::string("[") + procName + std::string(",") + StringConverterHelper::toString(LexLevel) + std::string("] @ ") + loc + std::string(" ") + varData);
   }

   void DbgDLL::Process_stabn_0xe0(std::vector<std::string> &stablineParts) {
         // change LexLevel (down)
       LexLevel = atoi(stablineParts[2].c_str());
       if (LexLevel > 0) {
           VisibleVars[LexLevel - 1] = "";
       }
       return;
   }

   void DbgDLL::Process_stabn_0xc0(std::vector<std::string> &stablineParts) {
         // change LexLevel (up)
       LexLevel = atoi(stablineParts[2].c_str()) + 1;
       if (LexLevel > 1) {
           while (VisibleVars.size() < LexLevel - 1) {
               VisibleVars.push_back("");
           }
       }

       return;
   }

   void DbgDLL::Process_stabs_0x3c(std::vector<std::string> &stablineParts) {
         // ignored
       return;
   }

   void DbgDLL::AddToVisibleVarsList(int lexLevel, const std::string &varData) {
       int listIndex = lexLevel - 2;
       while (listIndex >= VisibleVars.size()) {
           VisibleVars.push_back("");
       }
       VisibleVars[listIndex] = VisibleVars[listIndex] + varData + std::string(" | ");
   }

   std::string DbgDLL::ExtractUnmangledProcNameFrom(std::string &s) {
       std::string ans = "";
       int procNamePos = s.rfind("-C_");
       if (procNamePos < 0) {
          return "????";
       }
       ans = s;
       ans.erase(0, procNamePos + 3);
       if (strstr(ans.c_str(), "_L") != NULL) {
           int pos = 0;
           pos = ans.rfind('_');
           if (pos > 0) {
              ans.erase(pos);
           }
           pos = ans.find('_');
           if (pos > 0) {
              ans.erase(0, pos + 1);
           }
           pos = ans.find('_');
           if (pos > 0) {
              ans.erase(0, pos + 1);
           }
       }
       return Unmangle(ans);
   }

   std::string DbgDLL::Unmangle(const std::string &s) {
       std::string ans = "";
       for (int i = 0; i < s.length(); i++) {
           if (isupper(s[i])) {
               ans += s[i];
               i++;
           }
           else {
               ans += s[i];
           }
       }
       return ans;
   }

   void DbgDLL::AddToOutput(const std::string &s) {
       DebugOutput.push_back(s);
   }

   std::string DbgDLL::ConvertSymbolToMangledForm(const std::string &symbol) {
       std::string answer = "C_";
       for (int i = 0; i < symbol.length(); i++) {
           answer += symbol[i];
           if (isupper(symbol[i])) {
               answer += '_';
           }
       }
       return answer;
   }

   std::vector<std::string> DbgDLL::ParseStabs(std::string &stabsLineIn) {
       std::vector<std::string> answer = {"", "", "", "", ""};
       std::string stub = stabsLineIn;
       std::string splitChar = "\"";
       std::vector<std::string> parts = Split(stub, splitChar);
       if (parts.size() != 3) {
           AddToOutput(std::string("===== Invalid input to ParseStabs():") + stabsLineIn);
           return answer;
       }
       answer[0] = parts[1];
       splitChar[0] = ',';
       parts = Split(parts[2], splitChar, true);
       if (parts.size() != 4) {
           AddToOutput(std::string("===== Invalid input to ParseStabs():") + stabsLineIn);
           return answer;
       }
       for (int i = 1; i < 5; i++) {
          answer[i] = parts[i - 1];
       }
       return answer;
   }

   std::vector<std::string> DbgDLL::ParseStabn(std::string &stabnLineIn) {
       std::vector<std::string> answer = {"", "", "", ""};
       std::string stub = stabnLineIn;
       stub.erase(0, 7); // Remove .stabn_
       std::string splitChar = ",";
       std::vector<std::string> parts = Split(stub, splitChar, true);
       if (parts.size() != 4) {
           AddToOutput(std::string("===== Invalid input to ParseStabn():") + stabnLineIn);
           return answer;
       }
       for (int i = 0; i < 4; i++) {
          answer[i] = parts[i];
       }
       return answer;
   }

   void DbgDLL::ExtractSourcePathFromDebugFile() {
       for (int i = 0; i < DebugFile.size(); i++) {
           std::string s = DebugFile[i];
           if (StartsWith(s.c_str(), ".stabs")) {
               std::vector<std::string> stablineParts = ParseStabs(s);
               if (stablineParts[1] == "0x64") {
                   Process_stabs_0x64(stablineParts);
               }
           }
       }
   }

   bool DbgDLL::TypeDefListHas(const std::string &typenum) {
       std::string searchStr = typenum + std::string(":");
       for (int i = 0; i < TypeDefs.size(); i++) {
           std::string s = TypeDefs[i];
           if (StartsWith(s.c_str(), searchStr.c_str())) {
              return true;
           }
       }
       return false;
   }

   std::string DbgDLL::GetTypeName(const std::string &typenum) {
       std::string searchStr = typenum + std::string(":");
       for (int i = 0; i < TypeDefs.size(); i++) {
           std::string s = TypeDefs[i];
           if (StartsWith(s.c_str(), searchStr.c_str())) {
               std::string splitChar = ":";
               std::vector<std::string> parts = Split(s, splitChar);
               return parts[1];
           }
       }
       return "";
   }

   std::string DbgDLL::GetTypeReference(const std::string &typenum) {
       std::string searchStr = typenum + std::string(":");
       for (int i = 0; i < TypeDefs.size(); i++) {
           std::string s = TypeDefs[i];
           if (StartsWith(s.c_str(), searchStr.c_str())) {
               std::string splitChar = ":";
               std::vector<std::string> parts = Split(s, splitChar);
               const char *part = parts[1].c_str();
               if (StartsWith(part, "struct[")) {
                   const char *indx = strchr(part, ']');
                   if (indx) {
                      return parts[1].substr(7, indx - part - 7);
                   }
                   else {
                      return parts[1];
                   }
               }
               else {
                  return parts[1];
               }
           }
       }
       return "";
   }

   void DbgDLL::FixTypeReferences(const char *ref, const char *name) {
       std::vector<std::string> NewTypeDefs = std::vector<std::string>();;
       std::vector<std::string> NewLocals = std::vector<std::string>();;
       std::vector<std::string> NewGlobVars = std::vector<std::string>();;
       std::vector<std::string> NewGlobFiles = std::vector<std::string>();;
       int len = strlen(ref);
       int indx;
       // fix references in TypeDefs
       for (int i = 0; i < TypeDefs.size(); i++) {
           std::string s = TypeDefs[i];
           while ((indx = Contains(s.c_str(), ref)) >= 0) {
               //printf("Fixing reference in TypeDef %s\n", s.c_str());
               s.replace(indx, len, name);
           }
           NewTypeDefs.push_back(s);
       }
       TypeDefs.swap(NewTypeDefs);
       // fix references in Locals
       for (int i = 0; i < Locals.size(); i++) {
           std::string s = Locals[i];
           while ((indx = Contains(s.c_str(), ref)) >= 0) {
               //printf("Fixing reference in Local %s\n", s.c_str());
               s.replace(indx, len, name);
           }
           NewLocals.push_back(s);
       }
       Locals.swap(NewLocals);
       // fix references in GlobVars
       for (int i = 0; i < GlobVars.size(); i++) {
           std::string s = GlobVars[i];
           while ((indx = Contains(s.c_str(), ref)) >= 0) {
               //printf("Fixing reference in GlobVar %s\n", s.c_str());
               s.replace(indx, len, name);
           }
           NewGlobVars.push_back(s);
       }
       GlobVars.swap(NewGlobVars);
       // fix references in GlobFiles
       for (int i = 0; i < GlobFiles.size(); i++) {
           std::string s = GlobFiles[i];
           while ((indx = Contains(s.c_str(), ref)) >= 0) {
               //printf("Fixing reference in GlobFile %s\n", s.c_str());
               s.replace(indx, len, name);
           }
           NewGlobFiles.push_back(s);
       }
       GlobFiles.swap(NewGlobFiles);
   }

   void DbgDLL::EmitTypeDefs() {
       for (int i = 0; i < TypeDefs.size(); i++) {
           std::string s = TypeDefs[i];
           int colon = s.find(":");
           if (colon != std::string::npos) {
               //printf("Adding Final TYPEDEF \"%s\"\n", s.replace(colon, 1, " ").c_str());
               // NOTE: This code assumes that up to MaxStandardTypeValue, 
               //       the index and the type number will always be the same!
               if (ShowNewTypeDefs && i > MaxStandardTypeValue) {
                   AddToOutput(std::string("TYPEDEF ") + s.replace(colon, 1, " "));
               }
               if (ShowStdTypeDefs && i <= MaxStandardTypeValue) {
                   AddToOutput(std::string("TYPEDEF ") + s.replace(colon, 1, " "));
               }
           }
       }
   }

   void DbgDLL::EmitLocals() {
       for (int i = 0; i < Locals.size(); i++) {
          //printf("Adding Final LOCVAR \"%s\"\n", Locals[i].c_str());
          AddToOutput(std::string("LOCVAR ") + Locals[i]);
       }
   }

   void DbgDLL::EmitGlobVars() {
       for (int i = 0; i < GlobVars.size(); i++) {
          //printf("Adding Final GLOBVAR \"%s\"\n", GlobVars[i].c_str());
          AddToOutput(std::string("GLOBVAR ") + GlobVars[i]);
       }
   }

   void DbgDLL::EmitGlobFiles() {
       for (int i = 0; i < GlobFiles.size(); i++) {
          //printf("Adding Final GLOBFILE \"%s\"\n", GlobFiles[i].c_str());
          AddToOutput(std::string("GLOBFILE ") + GlobFiles[i]);
       }
   }

   std::vector<std::string> DbgDLL::DivideStringAt(const std::string &s, char divChar) {
       std::vector<std::string> ans = {"", ""};
       int divideSpot = s.find(divChar);
       if (divideSpot == std::string::npos) {
           ans[0] = s;
           ans[1] = "";
           return ans;
       }
       else {
           ans[0] = s;
           ans[0].erase(divideSpot);
           ans[1] = s;
           ans[1].erase(0, divideSpot);
       }
       return ans;
   }

   std::vector<std::string> DbgDLL::DivideStringAtLast(const std::string &s, char divChar) {
       std::vector<std::string> ans = {"", ""};
       int divideSpot = s.rfind(divChar);
       if (divideSpot == std::string::npos) {
           ans[0] = s;
           ans[1] = "";
           return ans;
       }
       else {
           ans[0] = s;
           ans[0].erase(divideSpot);
           ans[1] = s;
           ans[1].erase(0, divideSpot);
       }
       return ans;
   }

   void DbgDLL::AddType(const std::string &typeNum, const std::string &def) {
       int typeValue = atoi(typeNum.c_str());
       if (!TypeDefListHas(typeNum)) {
          //printf("Adding Initial TYPEDEF %d = \"%s\"\n", typeValue, def.c_str());
          TypeDefs.push_back(typeNum + std::string(":") + def);
          // AddToOuptut now done later - see EmitTypeDefs
          //if (ShowNewTypeDefs && typeValue > MaxStandardTypeValue) {
              //AddToOutput(std::string("TYPEDEF ") + typeNum + std::string(" ") + def);
          //}
          //if (ShowStdTypeDefs && typeValue <= MaxStandardTypeValue) {
              //AddToOutput(std::string("TYPEDEF ") + typeNum + std::string(" ") + def);
          //}
       }
       else {
          // when we update a type, we replace all references to the 
          // old type with the new type
          std::string old_def = GetTypeName(typeNum);
          if (strcmp(old_def.c_str(), def.c_str()) != 0) {
             //printf("Replacing Type %d \"%s\" with \"%s\" \n", typeValue, old_def.c_str(), def.c_str());
             FixTypeReferences(old_def.c_str(), def.c_str());
          }
       }
       // fix references (including self references) in case the pointer 
       // to the type is not subsequently made explicit as a new type itself
       // (which can happen if - for example - there are no other references 
       // to a pointer to a struct or union made outside the type itself)
       std::string new_name = GetTypeReference(typeNum);
       if (new_name.length() > 0) {
          std::string old_def = std::string("*<") + typeNum + std::string(">");
          std::string new_def = std::string("*") + new_name;
          //printf("Replacing Type \"%s\" with \"%s\" \n", old_def.c_str(), new_def.c_str());
          FixTypeReferences(old_def.c_str(), new_def.c_str());
       }
   }

   std::string DbgDLL::ExtractTypeNumberFromEnd(const std::string &s) {
       int digitsPos;
       std::string result;
       for (digitsPos = s.length() - 1; digitsPos >= 0; digitsPos--) {
           if (isdigit(s[digitsPos])) {
              continue;
           }
           break;
       }
       result = s;
       return result.erase(0, digitsPos + 1);
   }

   std::string DbgDLL::ExtractEmbeddedTypeDefsFrom_128(const std::string &s) {
       try {
           std::string splitChar = "=";
           std::string sCopy = s;
           std::string typeNum;
           std::vector<std::string> subparts;
           std::string structName;
           subparts = DivideStringAt(sCopy, ':');
           structName = subparts[0];
       recurse:
           splitChar = "=";
           std::vector<std::string> parts = Split(sCopy, splitChar);
           if (parts.size() == 1) {
              return sCopy;
           }
           int lastPartIndex = parts.size() - 1;
           int precPartIndex = lastPartIndex - 1;
           typeNum = ExtractTypeNumberFromEnd(parts[precPartIndex]);
           char typeBeingDefined = parts[lastPartIndex][0];
           if (isdigit(typeBeingDefined)) {
              typeBeingDefined = 'r';
           }
           if (typeBeingDefined == 'r') {
               std::string def = structName;
               AddType(typeNum, def);
               return parts[1];
           }
           if (typeBeingDefined == 'f') {
               subparts = DivideStringAt(parts[lastPartIndex], ',');
               subparts[0].erase(0, 1);
               std::string def = std::string("func[") + GetTypeName(subparts[0]) + std::string("]");
               AddType(typeNum, def);
               parts[lastPartIndex] = subparts[1];
               goto reassemble_sCopy;
           }
           if (typeBeingDefined == 'e') {
               subparts = DivideStringAt(parts[lastPartIndex], ';');
               subparts[1].erase(0, 1); // remove ';'
               std::string def = std::string("enum[") + structName + std::string("]");
               AddType(typeNum, def);
               parts[lastPartIndex] = subparts[1];
               goto reassemble_sCopy;
           }
           if (typeBeingDefined == 'a') {
               subparts = DivideStringAt(parts[lastPartIndex], ',');
               if (subparts[0] == "") {
                  subparts[0] = subparts[1];
               }
               splitChar = ";";
               std::vector<std::string> aparts = Split(subparts[0], splitChar, true);
               int arraySize = atoi(aparts[2].c_str());
               arraySize++;
               std::string def = std::string("array[") + StringConverterHelper::toString(arraySize) + std::string("](") + GetTypeName(aparts[3]) + std::string(")");
               AddType(typeNum, def);
               parts[lastPartIndex] = subparts[1];
               goto reassemble_sCopy;
           }
           if (typeBeingDefined == '*') {
               subparts = DivideStringAt(parts[lastPartIndex], ',');
               subparts[0].erase(0, 1); // Remove the * to leave 2
               std::string trimChar = ";";
               subparts[0] = rtrim(subparts[0], trimChar);
               //printf("Looking for type number %s\n", subparts[0].c_str());
               std::string name = GetTypeReference(subparts[0]);
               std::string def;
               if (name.size() > 0) {
                  def = std::string("*") + name;
                  //printf("Found short type name %s\n", name.c_str());
               }
               else {
                 // can be a reference to a forward declared type, so use
                 // a generated name (we will have to fix this later!)
                  def = std::string("*") + "<" + subparts[0] +">";
               }
               AddType(typeNum, def);
               parts[lastPartIndex] = subparts[1];
               goto reassemble_sCopy;
           }
           if (typeBeingDefined == 's' || typeBeingDefined == 'u') {
               parts[lastPartIndex].erase(0, 1); // Remove the s (or u)
               while (isdigit(parts[lastPartIndex][0])) {
                  parts[lastPartIndex].erase(0, 1);
               }
               splitChar[0] = ';';
               subparts = Split(parts[lastPartIndex], splitChar, false);
               std::string type = "";
               int i;
               for (i = 0; i < subparts.size(); i++) {
                   if (subparts[i].length() == 0) {
                      break;
                   }
                   std::string splitChars = ":,";
                   std::vector<std::string> sparts = Split(subparts[i], splitChars);
                   type += std::string(" ") + sparts[0] + std::string("("); // RLA 1/22/2010  added space after ( to make structs more readable
                   type += GetTypeName(sparts[1]) + std::string(".") + sparts[2] + std::string(".") + sparts[3] + std::string(")");
               }
               std::string defName = "struct";
               if (typeBeingDefined == 'u') {
                   defName = "union";
               }
               std::string def;
               if (lastPartIndex > 1) {
                  // embdedded type - simply mark as anonymous
                  def = defName + std::string("[<anon>]{ ") + type + std::string("}");
               }
               else {
                  def = defName + std::string("[") + structName + std::string("]{ ") + type + std::string("}");
               }
               AddType(typeNum, def);
               // reconstruct unused parts
               parts[lastPartIndex] = "";
               for (int j = i + 1; j < subparts.size(); j++) {
                  parts[lastPartIndex] += subparts[j] + ";";
               }
               goto reassemble_sCopy;
           }
           if (typeBeingDefined == 'x') {
              // we ignore type x - if the type is eventually defined, there will be full definition elsewhere
              return s;
           }
           AddToOutput(std::string("===== unknown embedded typedef in: ") + s);
           return s;
       reassemble_sCopy:
           sCopy = parts[0];
           for (int i = 1; i < parts.size() - 1; i++) {
               sCopy += (std::string("=") + parts[i]);
           }
           sCopy += parts[parts.size() - 1];
           goto recurse;
       }
       catch (std::exception &err) {
           AddToOutput(std::string("===== exception (") + err.what() + std::string(") processing ") + s);
           return s;
       }
   }

   std::string DbgDLL::RebuildStabs(std::vector<std::string> &stablineParts) {
       std::string answer = ".stabs \"" + stablineParts[0] + std::string("\"");
       for (int i = 1; i < sizeof(stablineParts) / sizeof(stablineParts[0]); i++) {
           answer += ',' + stablineParts[i];
       }
       return answer;
   }

   std::string DbgDLL::LocationOf(const std::string &searchStr) {
       std::string ans;
       std::unordered_map<std::string,std::string>::const_iterator got = SymbolTable.find (searchStr);
       if (got == SymbolTable.end()) {
          ans = "???";
       }
       else {
          ans = got->second;
       }
       return ans;
   }

   std::string DbgDLL::StripProcNameFromLabel(const std::string &label) {
       std::string splitChar = "-";
       std::vector<std::string> parts = Split(label, splitChar);
       return parts[0];
   }

   std::string DbgDLL::ExtractSourceFileName(const std::string &s) {
       int nameStrIndex = s.find("L__");
       if (nameStrIndex < 1) {
           return std::string("Invalid input: ") + s;
       }
       std::string s2 = s;
       s2.erase(0, nameStrIndex + 3); // Remove L__
       s2.erase(s2.length() - FileNameTerminationText.length()); // ..and terminator
       std::string splitChar = "_";
       std::vector<std::string> parts = Split(s2, splitChar);
       std::string answer = parts[0];
       try {
           std::string hexStr = "";
           for (int i = 1; i < parts.size(); i++) {
               if (parts[i].length() > 2) {
                   hexStr = parts[i];
                   hexStr.erase(2);
               }
               else {
                   hexStr = parts[i];
               }
               int num;
               sscanf(hexStr.c_str(), "%x", &num);
               answer += static_cast<char>(num) + parts[i].erase(0, 2);
           }
           return answer;
       }
       catch (...) {
           return std::string("Invalid input: ") + s;
       }
   }

   void DbgDLL::ProcessDebugFileLineByLine() {
       VisibleVars.clear();
       WaitingForFirst0x44 = true;
       FirstLineLoc = LastLineLoc = "";
       for (int i = 0; i < DebugFile.size(); i++) {
           std::string s = DebugFile[i];
           if (StartsWith(s.c_str(), ".stabs")) {
               std::vector<std::string> stablineParts = ParseStabs(s);
               std::string sType = stablineParts[1];
               if (sType == "32") {
                  Process_stabs_32(stablineParts);
               }
               else if (sType == "36") {
                  Process_stabs_36(stablineParts);
               }
               else if (sType == " 100") {
                  Process_stabs_100(stablineParts);
               }
               else if (sType == "128") {
                  Process_stabs_128(stablineParts);
               }
               else if (sType == "38") {
                  Process_stabs_38(stablineParts);
               }
               else if (sType == "40") {
                  Process_stabs_40(stablineParts);
               }
               else if (sType == "64") {
                  Process_stabs_64(stablineParts);
               }
               else if (sType == "0x64") {
                  Process_stabs_0x64(stablineParts);
               }
               else if (sType == "0x84") {
                  Process_stabs_0x84(stablineParts);
               }
               else if (sType == "0x3c") {
                  Process_stabs_0x3c(stablineParts);
               }
               else if (sType == "160") {
                  Process_stabs_160(stablineParts);
               }
               else {
                  AddToOutput(std::string("===== Unexpected .stabs type: ") + sType);
               }
               continue;
           }
           if (StartsWith(s.c_str(), ".stabn")) {
               std::vector<std::string> stablineParts = ParseStabn(s);
               std::string nType = stablineParts[0];
               if (nType == "0xe0") {
                  Process_stabn_0xe0(stablineParts);
               }
               else if (nType == "0xc0") {
                  Process_stabn_0xc0(stablineParts);
               }
               else if (nType == "0x44") {
                  Process_stabn_0x44(stablineParts);
               }
               else {
                  AddToOutput(std::string("===== Unexpected .stabn type: ") + nType);
               }
               continue;
           }
           AddToOutput(std::string("===== Invalid stab line: ") + s);
       }
   }

   void DbgDLL::ProcessDebugFile() {
       TypeDefs.clear();
       Locals.clear();
       GlobVars.clear();
       GlobFiles.clear();
       ProcessDebugFileLineByLine();
       AddToOutput(std::string("RANGE ") + FirstLineLoc + std::string("..") + LastLineLoc);
   }

   void DbgDLL::ProcessSourceFileList(std::vector<std::string> &debugPaths) {
       for (int i = 0; i < SourceFileList.size(); i++) {
           std::string sourcePathname = SourceFileList[i];
           std::string splitChar = "\\";
           if (Linux) {
              splitChar[0] = '/';
           }
           std::vector<std::string> parts = Split(sourcePathname, splitChar);
           std::string sourceFilename = parts[parts.size() - 1]; // Path info removed.
           std::string debugFileName = "";
           try {
               std::string noExtFilename = sourceFilename;
               noExtFilename.erase(sourceFilename.length() - 2);
               debugFileName = noExtFilename + std::string(".debug");
           }
           catch (...) {
               AddToOutput(std::string("===== Invalid source filename: ") + sourceFilename);
               return;
           }
           std::ifstream sr;
           bool foundDebugFile = false;
           std::string fullDebugFileName = "";
           for (int i = 0; i < debugPaths.size(); i++) {
               fullDebugFileName = debugPaths[i] + debugFileName;
               sr.open(fullDebugFileName);
               foundDebugFile = sr.is_open();
               if (foundDebugFile) {
                  break;
               }
               else {
                  sr.close();
               }
           }
           if (!foundDebugFile) {
               AddToOutput(std::string("===== Halting processing because couldn't find: ") + debugFileName);
               PostProcessDebugOutput();
               return;
           }
           try {
              DebugFile.clear();
              DebugOutput.clear();
              std::string theTotalText = "";
              while (!sr.eof()) {
                  std::string aLine;
                  getline(sr, aLine);
                  if (aLine.size() > 0) {
                     DebugFile.push_back(aLine);
                     theTotalText += aLine + std::string("\r\n");
                  }
              }
              sr.close();
           }
           catch (...) {
              sr.close();
              return;
           }
           ReglueDebugFile();
           ReorderDebugFile();
           DebugFile.clear();
           for (int i = 0; i < ReorderedDebugFile.size(); i++) {
               std::string s = ReorderedDebugFile[i];
               DebugFile.push_back(s);
           }
           ProcessDebugFile();
           PostProcessDebugOutput();
       }
   }

   void DbgDLL::ReorderDebugFile() {
       int i;
       std::vector<std::string>::iterator it;
       ReorderedDebugFile.clear();
       for (i = 0; i < DebugFile.size(); i++) {
           if (StartsWith(DebugFile[i].c_str(), ".stabn 0xc0")) {
               int insertPoint = FindWhere0xc0ShouldBePut();
               it = ReorderedDebugFile.begin() + insertPoint + 1;
               ReorderedDebugFile.insert(it, DebugFile[i]);
               FindMatching0xe0(i);
           }
           else if (EndsWith(DebugFile[i].c_str(), ",128,0,0,0")) {
               UnnestStabs128(i);
           }
           else {
               if (DebugFile[i] == "moved") {
                  continue;
               }
               ReorderedDebugFile.push_back(DebugFile[i]);
           }
       }
   }

   void DbgDLL::FindMatching0xe0(int start) {
       std::vector<std::string>::iterator it;
       std::vector<std::string> c0parts = ParseStabn(DebugFile[start]);
       for (int i = start + 1; i < DebugFile.size(); i++) {
           if (StartsWith(DebugFile[i].c_str(), ".stabn 0xe0")) {
               std::vector<std::string> e0parts = ParseStabn(DebugFile[i]);
               if (c0parts[2] == e0parts[2]) {
                   int insertPoint = ReorderedDebugFile.size();
                   for (i = i - 1; i > 0; i--) {
                       if (StartsWith(DebugFile[i].c_str(), ".stabn")) {
                          return;
                       }
                       it = ReorderedDebugFile.begin() + insertPoint;
                       ReorderedDebugFile.insert(it, DebugFile[i]);
                       DebugFile[i] = "moved";
                   }
               }
           }
       }
   }

   int DbgDLL::FindWhere0xc0ShouldBePut() {
       int i;
       for (i = ReorderedDebugFile.size() - 1; i > 0; i--) {
           if (StartsWith(ReorderedDebugFile[i].c_str(), ".stabn")) {
              return i;
           }
           if (strstr(ReorderedDebugFile[i].c_str(), ":F") != NULL) {
              return i;
           }
           continue;
       }
       return i;
   }

   void DbgDLL::UnnestStabs128(int debugFileIndex) {
       std::string s128 = DebugFile[debugFileIndex];
   recurse:
       int posOfEq = s128.find("=s");
       if (posOfEq < 0) {
           posOfEq = s128.find("=u");
           if (posOfEq < 0) {
               ReorderedDebugFile.push_back(s128);
               return;
           }
       }
       int newPosOfEq = s128.find("=s", posOfEq + 2);
       if (newPosOfEq < 0) {
           newPosOfEq = s128.find("=u", posOfEq + 2);
           if (newPosOfEq < 0) {
               ReorderedDebugFile.push_back(s128);
               return;
           }
       }
   tryAgain:
       int semisPos = newPosOfEq + 2;
       for (int k = semisPos; k < s128.length() - 1; k++) {
           if (s128[k] == ';' && s128[k + 1] == ';') {
               std::string stub = "";
               for (int kk = newPosOfEq; kk < k + 2; kk++) {
                   stub += s128[kk];
               }
               std::string typeNumStr = "";
               for (int kk = newPosOfEq - 1; kk > 0; kk--) {
                   if (isdigit(s128[kk])) {
                       typeNumStr = s128[kk] + typeNumStr;
                       continue;
                   }
                   break;
               }
               s128.erase(newPosOfEq, stub.length());
               ProcessUnnestedStruct(stub, typeNumStr, debugFileIndex);
               goto recurse;
           }
           if (s128[k] == '=' && ((s128[k + 1] == 's') || (s128[k + 1] == 'u'))) {
               newPosOfEq = k;
               goto tryAgain;
           }
       }
   }

   void DbgDLL::ProcessUnnestedStruct(const std::string &stub, const std::string &typeNumStr, int debugFileIndex) {
       std::string structName = FindStructName(typeNumStr, debugFileIndex);
       std::string newStabsLine = ".stabs \"" + structName + std::string(":t") + typeNumStr + stub + std::string("\",128,0,0,0");
       ReorderedDebugFile.push_back(newStabsLine);
   }

   std::string DbgDLL::FindStructName(const std::string &typeNumStr, int debugFileIndex) {
       std::string splitChars = ":\"";
       std::string endsWithStr = typeNumStr + "\",128,0,0,0";
       for (int i = debugFileIndex + 1; i < DebugFile.size(); i++) {
           if (EndsWith(DebugFile[i].c_str(), endsWithStr.c_str())) {
               std::vector<std::string> parts = Split(DebugFile[i], splitChars);
               return parts[1];
           }
       }
       return "";
   }

   void DbgDLL::WriteOutputToDbgFile() {
       std::string dbgPath = ListFilePath;
       dbgPath.erase(ListFilePath.length() - 3, 3);
       dbgPath += std::string("dbg");
       std::ofstream sw;
       sw.open(dbgPath, std::ios::binary);
       try {
           sw.write(OutputString.c_str(), OutputString.length());
       }
       catch(...) {
       }
       sw.close();
   }

   std::string DbgDLL::LocvarProcname(const std::string &s) {
       std::string splitChars = " ["; // Now the procname can be split off at the first space.
       std::vector<std::string> parts = Split(s, splitChars);
       return parts[1];
   }

   void DbgDLL::ProcessSourceLineNumToOutputString() {
       for (int i = 0; i < DebugOutput.size(); i++) {
           std::string s = DebugOutput[i];
           if (StartsWith(s.c_str(), "LINENUM") || StartsWith(s.c_str(), "INCSRC")) {
               if (StartsWith(s.c_str(), "INCSRC")) {
                   OutputString += NewLine;
                   OutputString += s + NewLine;
                   OutputString += NewLine;
               }
               else {
                   OutputString += s + NewLine;
               }
           }
       }
   }

   void DbgDLL::FromDebugOutputToOutputString(const std::string &lineHeader) {
       bool found = false;
       bool doingLocVar = StartsWith(lineHeader.c_str(), "LOCVAR");
       bool doingSource = StartsWith(lineHeader.c_str(), "SOURCE");
       std::string currentProcName = "";
       for (int i = 0; i < DebugOutput.size(); i++) {
           std::string s = DebugOutput[i];
           if (StartsWith(s.c_str(), lineHeader.c_str())) {
               if (doingLocVar) {
                   std::string newProcname = LocvarProcname(s);
                   if (currentProcName != newProcname) {
                       currentProcName = newProcname;
                       OutputString += NewLine;
                   }
               }
               if (!found && !doingLocVar) {
                  OutputString += NewLine;
               }
               if (doingSource) {
                   OutputString += s + std::string("  [") + FirstLineLoc + std::string("..") + LastLineLoc + std::string("]") + NewLine;
                   return;
               }
               OutputString += s + NewLine;
               found = true;
           }
       }
       return;
   }

   void DbgDLL::PostProcessDebugOutput() {
       EmitTypeDefs();
       EmitLocals();
       EmitGlobVars();
       EmitGlobFiles();
       FromDebugOutputToOutputString("RELOC");
       FromDebugOutputToOutputString("SOURCE");
       FromDebugOutputToOutputString("=====");
       FromDebugOutputToOutputString("FRAMED");
       FromDebugOutputToOutputString("NOFRAME");
       FromDebugOutputToOutputString("TYPEDEF");
       FromDebugOutputToOutputString("GLOBVAR");
       FromDebugOutputToOutputString("GLOBFILE");
       FromDebugOutputToOutputString("LOCVAR");
       ProcessSourceLineNumToOutputString();
   }

   void DbgDLL::ReglueDebugFile() {
       std::vector<std::string> workList = std::vector<std::string>();
       for (int i = 0; i < DebugFile.size(); i++) {
           std::string line = DebugFile[i];
           if (StartsWith(line.c_str(), ".stabn")) {
               workList.push_back(line);
               continue;
           }
           std::vector<std::string> initialParts = ParseStabs(line);
           if (EndsWith(initialParts[0].c_str(), "\\\\")) {
               initialParts[0].erase(initialParts[0].length() - 2, 2);
           getContinuation:
               i++;
               std::string nextLine = DebugFile[i];
               std::vector<std::string> addedParts = ParseStabs(nextLine);
               if (EndsWith(addedParts[0].c_str(), "\\\\")) {
                   addedParts[0].erase(addedParts[0].length() - 2, 2);
                   initialParts[0] += addedParts[0];
                   goto getContinuation;
               }
               else {
                   initialParts[0] += addedParts[0];
                   std::string fixedLine = ".stabs \"" + initialParts[0] + "\"," + initialParts[1] + std::string(",") + initialParts[2] + std::string(",") + initialParts[3] + std::string(",") + initialParts[4];
                   workList.push_back(fixedLine);
               }
           }
           else {
               workList.push_back(line);
           }
       }
       DebugFile.clear();
       DebugFile = workList;
       DebugOutput.clear();
   }

   void DbgDLL::InitializeInstanceFields() {
      RelocConstantString = "0";
      NewLine = "\r\n";
      WaitingForFirst0x44 = true;
      FirstLineLoc = "";
      LastLineLoc = "";
      CurrentProc = "";
      LexLevel = 0;
      VisibleVars = std::vector<std::string>();
      ProjectDirectory = "";
      ListFilePath = "";
      Linux = false;
      InCatalinaSpinSegment = false;
      FileNameTerminationText = "_00_text0";
      SourceFileList = std::vector<std::string>();
      ListFile = std::vector<std::string>();
      SymbolTable = std::unordered_map<std::string, std::string>();
      DebugFile = std::vector<std::string>();
      ReorderedDebugFile = std::vector<std::string>();
      DebugOutput = std::vector<std::string>();
      TypeDefs = std::vector<std::string>();
      Locals = std::vector<std::string>();
      GlobVars = std::vector<std::string>();
      GlobFiles = std::vector<std::string>();
      OutputString = "";
      MaxStandardTypeValue = 15;
      ShowNewTypeDefs = false;
      ShowStdTypeDefs = false;
   }
}
