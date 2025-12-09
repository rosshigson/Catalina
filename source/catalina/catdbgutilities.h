#pragma once

#include <string>
#include <unordered_map>
#include <vector>
#include <cctype>
#include <stdexcept>
#include <algorithm> 
#include <iostream>
#include <fstream>

#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

#include "stringconverter.h"

int  StartsWith(char *str, char *match);

int  EndsWith(char *str, char *match);

namespace CatDbgUtilities {
    class DbgDLL {

     private:
        std::string RelocConstantString;
        std::string TheTotalText;
        std::string NewLine;
        bool WaitingForFirst0x44;
        std::string FirstLineLoc;
        std::string LastLineLoc;
        std::string CurrentProc;
        int LexLevel;
        std::vector<std::string> VisibleVars;
        std::string ProjectDirectory;
        std::string ListFilePath;
        bool Linux;
        bool InCatalinaSpinSegment;
        std::string FileNameTerminationText;
        std::vector<std::string> SourceFileList;
        std::vector<std::string> ListFile;
        std::unordered_map<std::string, std::string> SymbolTable;
        std::vector<std::string> DebugFile;
        std::vector<std::string> ReorderedDebugFile;
        std::vector<std::string> DebugOutput;
        std::vector<std::string> TypeDefs;
        std::vector<std::string> Locals;
        std::vector<std::string> GlobVars;
        std::vector<std::string> GlobFiles;
        std::string OutputString;
        int MaxStandardTypeValue; // Controls which typedefs are considered standard and which are new
        bool ShowNewTypeDefs; // If true, new typedefs are included in the output.
        bool ShowStdTypeDefs; // If true, standard typedefs are included inthe output.
        std::string ExtractHubAddress(const std::string &aLine);
        void AddToSymbolTable(std::string &aLine);
     public:
        int FillListFile(const std::string &listFilePath);
        void SetLinux(bool linuxConventionForFilenames);
        int GenerateDbgFile(std::vector<std::string> &debugPaths);

        std::string GetOutputString();

        bool ToggleShowNewTypeDefs();
        bool ToggleShowStdTypeDefs();
        std::string GetTheTotalText();
     private:
        void Process_stabs_0x64(std::vector<std::string> &stablineParts);
        void Process_stabs_0x84(std::vector<std::string> &stablineParts);
        void Process_stabs_128(std::vector<std::string> &stablineParts);
        void Process_stabs_32(std::vector<std::string> &stablineParts);
        void Process_stabs_36(std::vector<std::string> &stablineParts);
        void Process_stabs_38(std::vector<std::string> &stablineParts);
        void Process_stabs_40(std::vector<std::string> &stablineParts);
        void Process_stabs_64(std::vector<std::string> &stablineParts);

        void Process_stabs_100(std::vector<std::string> &stablineParts);
        void Process_stabs_160(std::vector<std::string> &stablineParts);
        void Process_stabn_0x44(std::vector<std::string> &stablineParts);
        void Process_stabn_0xe0(std::vector<std::string> &stablineParts);
        void Process_stabn_0xc0(std::vector<std::string> &stablineParts);
        void Process_stabs_0x3c(std::vector<std::string> &stablineParts);
        void AddToVisibleVarsList(int lexLevel, const std::string &varData);
        std::string ExtractUnmangledProcNameFrom(std::string &s);
        std::string Unmangle(const std::string &s);
        void AddToOutput(const std::string &s);
        std::string ConvertSymbolToMangledForm(const std::string &symbol);
        std::vector<std::string> ParseStabs(std::string &stabsLineIn);
        std::vector<std::string> ParseStabn(std::string &stabnLineIn);
        void ExtractSourcePathFromDebugFile();
        bool TypeDefListHas(const std::string &typenum);
        std::string GetTypeName(const std::string &typenum);
        std::string GetTypeReference(const std::string &typenum);
        void FixTypeReferences(const char *ref, const char *name);
        void EmitTypeDefs();
        void EmitLocals();
        void EmitGlobVars();
        void EmitGlobFiles();
        std::vector<std::string> DivideStringAt(const std::string &s, char divChar);
        std::vector<std::string> DivideStringAtLast(const std::string &s, char divChar);
        void AddType(const std::string &typeNum, const std::string &def);
        std::string ExtractTypeNumberFromEnd(const std::string &s);
        std::string ExtractEmbeddedTypeDefsFrom_128(const std::string &s);
        std::string RebuildStabs(std::vector<std::string> &stablineParts);
        std::string LocationOf(const std::string &searchStr);
        std::string StripProcNameFromLabel(const std::string &label);
        std::string ExtractSourceFileName(const std::string &s);
        void ProcessDebugFileLineByLine();
        void ProcessDebugFile();
        void ProcessSourceFileList(std::vector<std::string> &debugPaths);
        void ReorderDebugFile();
        void FindMatching0xe0(int start);
        int FindWhere0xc0ShouldBePut();
        void UnnestStabs128(int debugFileIndex);
        void ProcessUnnestedStruct(const std::string &stub, const std::string &typeNumStr, int debugFileIndex);
        std::string FindStructName(const std::string &typeNumStr, int debugFileIndex);
        void WriteOutputToDbgFile();
        std::string LocvarProcname(const std::string &s);
        void ProcessSourceLineNumToOutputString();
        void FromDebugOutputToOutputString(const std::string &lineHeader);
        void PostProcessDebugOutput();
        void ReglueDebugFile();

    private:
       void InitializeInstanceFields();

public:
       DbgDLL() {
          InitializeInstanceFields();
       }
    };
}
