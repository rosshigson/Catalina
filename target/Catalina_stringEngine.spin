{{
+-----------------------------------------------------------------------------------------------------------------------------+               
¦ String Engine                                                                                                               ¦
¦                                                                                                                             ¦
¦ Author: Kwabena W. Agyeman                                                                                                  ¦                              
¦ Updated: 7/10/2009                                                                                                          ¦
¦ Designed For: P8X32A                                                                                                        ¦
¦                                                                                                                             ¦
¦ Copyright (c) 2009 Kwabena W. Agyeman                                                                                       ¦              
¦ See end of file for terms of use.                                                                                           ¦               
¦                                                                                                                             ¦
¦ Driver Info:                                                                                                                ¦
¦                                                                                                                             ¦
¦ The string engine provides string functions.                                                                                ¦
¦                                                                                                                             ¦ 
¦ The driver, is only guaranteed and tested to work at an 80Mhz system clock or higher. The driver is designed for the P8X32A ¦
¦ so port B will not be operational.                                                                                          ¦
¦                                                                                                                             ¦
¦ Nyamekye,                                                                                                                   ¦
+-----------------------------------------------------------------------------------------------------------------------------+ 
}}

VAR

  byte characterToCharacters[257]
  byte characterToCharactersPointer

  long charactersPointer
  long characterIndex 

  byte decimalCharacters[12]
  byte hexadecimalCharacters[9]
  byte binaryCharacters[33]

PUB putCharacter(character) '' 4 Stack longs

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Builds a string from individual characters. If more than 256 characters are entered the string will be reset.            ¦                                                                                                                
'' ¦                                                                                                                          ¦                                                                                         
'' ¦ Character - The next character to include in the string, handles backspace by removing the last entered character.       ¦
'' +--------------------------------------------------------------------------------------------------------------------------+
     
  ifnot(characterToCharactersPointer)
  
    bytefill(@characterToCharacters, 0, 257)

  if(characterToCharactersPointer and (character == 8))
    
    characterToCharacters[--characterToCharactersPointer] := 0

  case character

    9 .. 13, 32 .. 127: characterToCharacters[characterToCharactersPointer++] := character        

PUB getCharacters '' 4 Stack Longs

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Resets putCharacter for building a new string and returns the address of the old built string.                           ¦
'' ¦                                                                                                                          ¦
'' ¦ Returns a pointer to the string of characters built from putCharacter.                                                   ¦                                        
'' +--------------------------------------------------------------------------------------------------------------------------+

  characterToCharactersPointer := 0          

  return @characterToCharacters

PUB alphabeticallyBefore(characters, charactersBefore) '' 5 Stack Longs

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Compares two strings to see if one comes alphabetically before the other.                                                ¦
'' ¦                                                                                                                          ¦
'' ¦ Returns true if yes and false if no.                                                                                     ¦
'' ¦                                                                                                                          ¦
'' ¦ Characters       - A pointer to a string of characters.                                                                  ¦
'' ¦ CharactersBefore - A pointer to a string of characters that comes alphabetically before the other string of characters.  ¦
'' +--------------------------------------------------------------------------------------------------------------------------+

  repeat

    if(byte[characters] > byte[charactersBefore])
      return true

    ifnot(byte[characters] and byte[charactersBefore] and (byte[characters++] > byte[charactersBefore++]))
      quit

PUB alphabeticallyAfter(characters, charactersAfter) '' 5 Stack Longs

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Compares two strings to see if one comes alphabetically after the other.                                                 ¦
'' ¦                                                                                                                          ¦
'' ¦ Returns true if yes and false if no.                                                                                     ¦
'' ¦                                                                                                                          ¦
'' ¦ Characters      - A pointer to a string of characters.                                                                   ¦
'' ¦ CharactersAfter - A pointer to a string of characters that comes alphabetically after the other string of characters.    ¦
'' +--------------------------------------------------------------------------------------------------------------------------+

  repeat

    if(byte[characters] < byte[charactersAfter])
      return true

    ifnot(byte[characters] and byte[charactersAfter] and (byte[characters++] < byte[charactersAfter++]))
      quit

PUB startsWithCharacter(charactersToSearch, characterToFind) '' 5 Stack Longs

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Checks if the string of characters begins with the specified character.                                                  ¦
'' ¦                                                                                                                          ¦
'' ¦ Returns true if yes and false if no.                                                                                     ¦
'' ¦                                                                                                                          ¦
'' ¦ CharactersToSearch - A pointer to the string of characters to search.                                                    ¦                                                           
'' ¦ CharacterToFind    - The character to find in the string of characters to search.                                        ¦                                                                           
'' +--------------------------------------------------------------------------------------------------------------------------+

  return (byte[charactersToSearch] == characterToFind)

PUB startsWithCharacters(charactersToSearch, charactersToFind)

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Checks if the string of characters begins with the specified characters.                                                 ¦
'' ¦                                                                                                                          ¦
'' ¦ Returns true if yes and false if no.                                                                                     ¦
'' ¦                                                                                                                          ¦
'' ¦ CharactersToSearch - A pointer to the string of characters to search.                                                    ¦                                                           
'' ¦ CharactersToFind   - A pointer to the string of characters to find in the string of characters to search.                ¦                                                                           
'' +--------------------------------------------------------------------------------------------------------------------------+

  return (charactersToSearch == findCharacters(charactersToSearch, charactersToFind))

PUB endsWithCharacter(charactersToSearch, characterToFind) '' 5 Stack Longs

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Checks if the string of characters ends with the specified character.                                                    ¦
'' ¦                                                                                                                          ¦
'' ¦ Returns true if yes and false if no.                                                                                     ¦
'' ¦                                                                                                                          ¦
'' ¦ CharactersToSearch - A pointer to the string of characters to search.                                                    ¦                                                           
'' ¦ CharacterToFind    - The character to find in the string of characters to search.                                        ¦                                                                           
'' +--------------------------------------------------------------------------------------------------------------------------+

  return (byte[charactersToSearch + strsize(charactersToSearch) - 1] == characterToFind)

PUB endsWithCharacters(charactersToSearch, charactersToFind)

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Checks if the string of characters ends with the specified characters.                                                   ¦
'' ¦                                                                                                                          ¦
'' ¦ Returns true if yes and false if no.                                                                                     ¦
'' ¦                                                                                                                          ¦
'' ¦ CharactersToSearch - A pointer to the string of characters to search.                                                    ¦                                                           
'' ¦ CharactersToFind   - A pointer to the string of characters to find in the string of characters to search.                ¦                                                                           
'' +--------------------------------------------------------------------------------------------------------------------------+

  return ((charactersToSearch + (strsize(charactersToSearch) - strsize(charactersToFind)) - 2) == findCharacters(charactersToSearch, charactersToFind)) 

PUB findCharacter(charactersToSearch, characterToFind) '' 5 Stack Longs

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Searches a string of characters for the first occurence of the specified character.                                      ¦
'' ¦                                                                                                                          ¦
'' ¦ Returns the address of that character if found and zero if not found.                                                    ¦
'' ¦                                                                                                                          ¦
'' ¦ CharactersToSearch - A pointer to the string of characters to search.                                                    ¦                                                           
'' ¦ CharacterToFind    - The character to find in the string of characters to search.                                        ¦                                                                           
'' +--------------------------------------------------------------------------------------------------------------------------+

  repeat strsize(charactersToSearch--)
  
    if(byte[++charactersToSearch] == characterToFind)
    
      return charactersToSearch

PUB replaceCharacter(charactersToSearch, characterToReplace, characterToReplaceWith) '' 11 Stack Longs

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Replaces the first occurence of the specified character in a string of characters with another character.                ¦
'' ¦                                                                                                                          ¦
'' ¦ Returns the address of the next character after the character replaced sucess and zero on failure.                       ¦
'' ¦                                                                                                                          ¦
'' ¦ CharactersToSearch     - A pointer to the string of characters to search.                                                ¦                                                                    
'' ¦ CharacterToReplace     - The character to find in the string of characters to search.                                    ¦                                                                               
'' ¦ CharacterToReplaceWith - The character to replace the character found in the string of characters to search.             ¦                                                                                                           
'' +--------------------------------------------------------------------------------------------------------------------------+

  result := findCharacter(charactersToSearch, characterToReplace)

  if(result)
  
    byte[result++] := characterToReplaceWith

PUB replaceAllCharacter(charactersToSearch, characterToReplace, characterToReplaceWith) '' 17 Stack Longs

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Replaces all occurences of the specified character in a string of characters with another character.                     ¦
'' ¦                                                                                                                          ¦
'' ¦ CharactersToSearch     - A pointer to the string of characters to search.                                                ¦                                                                    
'' ¦ CharacterToReplace     - The character to find in the string of characters to search.                                    ¦                                                                               
'' ¦ CharacterToReplaceWith - The character to replace the character found in the string of characters to search.             ¦                                                                                                           
'' +--------------------------------------------------------------------------------------------------------------------------+

  repeat while(charactersToSearch)

    charactersToSearch := replaceCharacter(charactersToSearch, characterToReplace, characterToReplaceWith)
  
PUB findCharacters(charactersToSearch, charactersToFind) : buffer | counter '' 6 Stack Longs 

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Searches a string of characters for the first occurence of the specified string of characters.                           ¦
'' ¦                                                                                                                          ¦
'' ¦ Returns the address of that string of characters if found and zero if not found.                                         ¦
'' ¦                                                                                                                          ¦
'' ¦ CharactersToSearch - A pointer to the string of characters to search.                                                    ¦                                                           
'' ¦ CharactersToFind   - A pointer to the string of characters to find in the string of characters to search.                ¦                                                                           
'' +--------------------------------------------------------------------------------------------------------------------------+

  repeat strsize(charactersToSearch--)

    if(byte[++charactersToSearch] == byte[CharactersToFind])

      repeat counter from 0 to (strsize(charactersToFind) - 1)

        if(byte[charactersToSearch][counter] <> byte[charactersToFind][counter])
          buffer~~

      ifnot(buffer~)
        return charactersToSearch

PUB replaceCharacters(charactersToSearch, charactersToReplace, charactersToReplaceWith) '' 12 Stack Longs

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Replaces the first occurence of the specified string of characters in a string of characters with another string of      ¦
'' ¦ characters. Will not enlarge or shrink a string of characters.                                                           ¦
'' ¦                                                                                                                          ¦
'' ¦ Returns the address of the next character after the string of characters replaced on sucess and zero on failure.         ¦
'' ¦                                                                                                                          ¦
'' ¦ CharactersToSearch      - A pointer to the string of characters to search.                                               ¦                                                                   
'' ¦ CharactersToReplace     - A pointer to the string of characters to find in the string of characters to search.           ¦                                                                                                       
'' ¦ CharactersToReplaceWith - A pointer to the string of characters that will replace the string of characters found in the  ¦
'' ¦                           string characters to search.                                                                   ¦                                           
'' +--------------------------------------------------------------------------------------------------------------------------+

  result := findCharacters(charactersToSearch, charactersToReplace)

  if(result)

    charactersToSearch := strsize(charactersToReplaceWith)
  
    if(strsize(charactersToReplace) < charactersToSearch)
      charactersToSearch := strsize(charactersToReplace)

    repeat charactersToSearch 
  
      byte[result++] := byte[charactersToReplaceWith++]

PUB replaceAllCharacters(charactersToSearch, charactersToReplace, charactersToReplaceWith) '' 18 Stack Longs

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Replaces all occurences of the specified string of characters in a string of characters with another string of           ¦
'' ¦ characters. Will not enlarge or shrink a string of characters.                                                           ¦
'' ¦                                                                                                                          ¦
'' ¦ CharactersToSearch      - A pointer to the string of characters to search.                                               ¦                                                                   
'' ¦ CharactersToReplace     - A pointer to the string of characters to find in the string of characters to search.           ¦                                                                                                       
'' ¦ CharactersToReplaceWith - A pointer to the string of characters that will replace the string of characters found in the  ¦
'' ¦                           string characters to search.                                                                   ¦                                           
'' +--------------------------------------------------------------------------------------------------------------------------+

  repeat while(charactersToSearch)

    charactersToSearch := replaceCharacters(charactersToSearch, charactersToReplace, charactersToReplaceWith)

PUB trimCharacters(characters) '' 4 Stack Longs

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Removes white space and new lines from the begining and end of a string of characters.                                   ¦
'' ¦                                                                                                                          ¦
'' ¦ Returns a pointer to the trimed string of characters.                                                                    ¦
'' ¦                                                                                                                          ¦
'' ¦ Characters - A pointer to a string of characters to be trimed.                                                           ¦                                                     
'' +--------------------------------------------------------------------------------------------------------------------------+

  repeat while((1 =< byte[characters]) and (byte[characters] =< 32) or (byte[characters] == 127))
  
    characters += 1

  result := characters

  characters := (characters + strsize(characters) - 1)
  
  repeat while((1 =< byte[characters]) and (byte[characters] =< 32) or (byte[characters] == 127))
  
    byte[characters--] := 0    

PUB tokenizeCharacters(characters) '' 4 Stack Longs

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Removes white space and new lines from in between of a string of characters.                                             ¦
'' ¦                                                                                                                          ¦
'' ¦ Through repeated calls on the same string of characters a new string to each sub string of characters is returned.       ¦
'' ¦                                                                                                                          ¦
'' ¦ Returns a pointer to a new tokenized sub string on each call and null when out of sub strings.                           ¦                                                                                           
'' ¦                                                                                                                          ¦
'' ¦ Characters - A pointer to a string of characters to be tokenized. Null after the first call to continue.                 ¦                                                                                               
'' +--------------------------------------------------------------------------------------------------------------------------+

  if(characters)

    charactersPointer := characters
  
    characterIndex := 0

  result := (charactersPointer + characterIndex)

  repeat while((33 =< byte[charactersPointer][characterIndex]) and (byte[charactersPointer][characterIndex] =< 126))
  
    characterIndex += 1   

  repeat while((1 =< byte[charactersPointer][characterIndex]) and (byte[charactersPointer][characterIndex] =< 32) or (byte[charactersPointer][characterIndex] == 127))
  
    byte[charactersPointer][characterIndex++] := 0       

PUB charactersToLowerCase(characters) '' 4 Stack Longs

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Demotes all upper case characters in the set of ("A","Z") to their lower case equivalents.                               ¦
'' ¦                                                                                                                          ¦
'' ¦ Characters - A pointer to a string of characters to convert to lowercase.                                                ¦ 
'' +--------------------------------------------------------------------------------------------------------------------------+

  repeat strsize(characters--)

    result := byte[++characters]

    if((result => "A") and (result =< "Z"))
    
      byte[characters] := (result + 32)

PUB charactersToUpperCase(characters) '' 4 Stack Longs

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Promotes all lower case characters in the set of ("a","z") to their upper case equivalents.                              ¦
'' ¦                                                                                                                          ¦
'' ¦ Characters - A pointer to a string of characters to convert to uppercase.                                                ¦ 
'' +--------------------------------------------------------------------------------------------------------------------------+

  repeat strsize(characters--)

    result := byte[++characters]

    if((result => "a") and (result =< "z"))
    
      byte[characters] := (result - 32)
  
PUB numberToDecimal(number, length) '' 5 Stack Longs

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Converts an integer number to the decimal string of that number padded with zeros.                                       ¦
'' ¦                                                                                                                          ¦
'' ¦ Returns a pointer to the converted string.                                                                               ¦
'' ¦                                                                                                                          ¦
'' ¦ Number - A 32 bit signed integer number to be converted to a string.                                                     ¦
'' ¦ Length - The length of the number in the converted string. " " or "-" will be tacked onto the front of the string.       ¦     
'' +--------------------------------------------------------------------------------------------------------------------------+

  length := ((length <# 10) #> 0)

  decimalCharacters := " "
    
  if(number < 0)
    -number
    decimalCharacters := "-"
  
  if(number == negx)
      
    bytemove(@decimalCharacters, string("-2147483648"), 12)  
  
  else
  
    repeat result from 10 to 1
      decimalCharacters[result] := ((number // 10) + "0")
      number /= 10

  bytemove(@decimalCharacters[1], @decimalCharacters[(11 - length)], (length + 1))
    
  return @decimalCharacters

PUB numberToHexadecimal(number, length) '' 5 Stack Longs 

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Converts an integer number to the hexadecimal string of that number padded with zeros.                                   ¦
'' ¦                                                                                                                          ¦
'' ¦ Returns a pointer to the converted string.                                                                               ¦
'' ¦                                                                                                                          ¦
'' ¦ Number - A 32 bit signed integer number to be converted to a string.                                                     ¦
'' ¦ Length - The length of the converted string, negative numbers need a length of 8 for sign extension.                     ¦
'' +--------------------------------------------------------------------------------------------------------------------------+

  repeat result from 7 to 0
    hexadecimalCharacters[result] := lookupz((number & $F): "0".."9", "A".."F")
    number >>= 4

  return @hexadecimalCharacters[(8 - ((length <# 8) #> 0))]

PUB numberToBinary(number, length) '' 5 Stack Longs

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Converts an integer number to the binary string of that number padded with zeros.                                        ¦
'' ¦                                                                                                                          ¦
'' ¦ Returns a pointer to the converted string.                                                                               ¦
'' ¦                                                                                                                          ¦
'' ¦ Number - A 32 bit signed integer number to be converted to a string.                                                     ¦
'' ¦ Length - The length of the converted string, negative numbers need a length of 32 for sign extension.                    ¦
'' +--------------------------------------------------------------------------------------------------------------------------+

  repeat result from 31 to 0
    binaryCharacters[result] := ((number & $1) + "0")
    number >>= 1

  return @binaryCharacters[(32 - ((length <# 32) #> 0))]
 
PUB decimalToNumber(characters) | buffer, counter '' 6 Stack Longs.

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Converts a decimal string into an integer number.                                                                        ¦
'' ¦                                                                                                                          ¦
'' ¦ Returns the converted integer.                                                                                           ¦
'' ¦                                                                                                                          ¦
'' ¦ Characters - A pointer to the decimal string to convert.                                                                 ¦
'' +--------------------------------------------------------------------------------------------------------------------------+

  buffer := byte[characters]
  
  counter := (strsize(characters) <# 11)
  
  repeat while(counter--)
    result *= 10
    result += lookdownz(byte[characters++]: "0".."9")

  if(buffer == "-")
    -result   
      
PUB hexadecimalToNumber(characters) : buffer | counter '' 5 Stack Longs.

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Converts a hexadecimal string into an integer number.                                                                    ¦
'' ¦                                                                                                                          ¦
'' ¦ Returns the converted integer.                                                                                           ¦
'' ¦                                                                                                                          ¦
'' ¦ Characters - A pointer to the hexadecimal string to convert.                                                             ¦
'' +--------------------------------------------------------------------------------------------------------------------------+

  counter := (strsize(characters) <# 8)

  repeat while(counter--)
    buffer <<= 4
    buffer += lookdownz(byte[characters++]: "0".."9", "A".."F")    

PUB binaryToNumber(characters) : buffer | counter '' 5 Stack Longs.

'' +--------------------------------------------------------------------------------------------------------------------------+
'' ¦ Converts a binary string into an integer number.                                                                         ¦
'' ¦                                                                                                                          ¦
'' ¦ Returns the converted integer.                                                                                           ¦
'' ¦                                                                                                                          ¦
'' ¦ Characters - A pointer to the binary string to convert.                                                                  ¦
'' +--------------------------------------------------------------------------------------------------------------------------+

  counter := (strsize(characters) <# 32)

  repeat while(counter--)
    buffer <<= 1
    buffer += lookdownz(byte[characters++]: "0", "1")  
   
{{
                            TERMS OF USE: MIT License 

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
}}

