//
//  StringChallenges.swift
//  CodingChallenges
//
//  Created by Michael Brünen on 16.08.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import Foundation

extension String {
    func fuzzyContains(_ input: String) -> Bool {
        return self.range(of: input, options: .caseInsensitive) != nil
    }

    func asOrderedSet() -> NSOrderedSet {
        // Map the string to a Character array, create a NSOrderedSet from that and return it
        return NSOrderedSet(array: self.map({ $0 }))
    }
}

extension NSOrderedSet {
    func asJoinedString() -> String {
        // convert self to a Character array, then return it as a String
        let chars = Array(self) as! Array<Character>
        return String(chars)
    }
}

struct StringChallenges {
    // Challenge 1: Are the letters unique?
    func challenge1(input: String) -> Bool {
        let charSet = Set(input)
        return input.count == charSet.count
    }

    // Challenge 2: Is a string a palindrome?
    func challenge2(input: String) -> Bool {
        return input.lowercased() == String(input.reversed()).lowercased()
    }

    // Challenge 3: Do two strings contain the same characters?
    func challenge3(input1: String, input2: String) -> Bool {
        return input1.sorted() == input2.sorted()
    }

    // Challenge 4: Does one string contain another?
    func challenge4(input1: String, input2: String) -> Bool {
        return input1.fuzzyContains(input2)
    }

    // Challenge 5: Count the characters
    func challenge5(char: Character, input: String) -> Int {
        return input.filter({ $0 == char }).count
    }

    // Challenge 6: Remove duplicate letters from a string
    func challenge6(input: String) -> String {
        return input.asOrderedSet().asJoinedString()
    }

    // Challenge 7: Condense whitespace
    func challenge7(input: String) -> String {
        return input.replacingOccurrences(of: " +",                     // regular expression for 1 or more spaces
                                          with: " ",                    // the string that will be used to replace matches of the regex
                                          options: .regularExpression,  // enabling the use of regular expressions
                                          range: nil)                   // go over the whole string
    }

    // Challenge 8: String is rotated
    func challenge8(input: String, rotated: String) -> Bool {
        guard input.count == rotated.count else { return false }
        let allCombinations = input + input                             // twice the initial string contains all possible rotations
        return allCombinations.contains(rotated)
    }

    // Challenge 9: Find pangrams (a pangram is a string that contains every letter of the alphabet)
    func challenge9(input: String) -> Bool {
        let inputSet = Set(input.lowercased())                          // lowercased and put into a Set to remove duplicate characters
        let possibleAlphabet = inputSet.filter({ $0 >= "a" && $0 <= "z" })
        return possibleAlphabet.count == 26
    }

    // Challenge 10: Vowels and consonants
    // Given a string in English, return a tuple containing the number of vowels and consonants.
    func challenge10(input: String) -> (vowels: Int, consonants: Int) {
        // strings to check against
        let allVowels = "aeiou"
        let allConsonants = "bcdfghjklmnpqrstvwxyz"

        // counters
        var vowelCount = 0
        var consonantCount = 0

        // loop over every letter of the input and check if it's a vowel or consonant
        let lowercasedInput = input.lowercased()
        for letter in lowercasedInput {
            if allVowels.contains(letter) { vowelCount += 1 }
            else if allConsonants.contains(letter) { consonantCount += 1 }
        }

        return (vowelCount, consonantCount)
    }

    // Challenge 11: Three different letters
    func challenge11(input1: String, input2: String) -> Bool {
        // check length first for early exit
        guard input1.count == input2.count else { return false }

        // convert both to arrays
        let array1 = Array(input1)
        let array2 = Array(input2)
        var diffCounter = 0
        for (index, element) in array1.enumerated() {
            if array2[index] != element { diffCounter += 1 }
            if diffCounter > 3 { return false }
        }

        return true
    }

    // Challenge 12: Find longest prefix
    func challenge12(input: String) -> String {
        let elements = input.components(separatedBy: .whitespaces)
        guard let firstElement = elements.first else { return "" }

        var current = ""
        var best = ""

        for letter in firstElement {
            // add a letter to the current prefix
            current.append(letter)

            // check if it still works with all others
            for element in elements {
                if !element.hasPrefix(current) { return best }
            }

            // if it worked for all, assign current to best prefix
            best = current
        }

        return best
    }

    // Challenge 13: Run-length encoding
    func challenge13(input: String) -> String {
        /*
            INITIAL SOLUTION
            After reading 'run-length encoding' in the challenge I decided to look it up, put it indo pseudo code and implement it in Swift
            While this solution works I got curious how well it performs compared to other solutions, sadly this solution does not perform well
            Further down are two more solutions which both perform notably better, but are not my own, credits for both goes to Paul Hudson
         */
        // Reduce the input string into an array of tuples where each tuple has a counter and the letter
        let tempResult = Array(input).reduce([(letter: Character, counter: Int)]()) { result, current in
            // check if the current letter is already in the last tuple element, if so increase it's counter
            if result.last?.letter == current {
                var temp = result
                temp[temp.count - 1].counter += 1
                return temp
            }
            // if not, add a new tuple element to the array
            return result + [(current, 1)]
        }

        // convert the tuple array to a string again
        var finalResult = ""
        for element in tempResult {
            finalResult += "\(element.letter)\(element.counter)"
        }
        return finalResult

        /*
         ALTERNATIVE SOLUTION 1
         ----------------------
         var currentLetter: Character?
         var returnValue = ""
         var letterCounter = 0
         for letter in input {
            if letter == currentLetter {
                letterCounter += 1
            } else {
                if let current = currentLetter {
                    returnValue.append("\(current)\(letterCounter)")
                }
                currentLetter = letter
                letterCounter = 1
            }
         }
         if let current = currentLetter {
            returnValue.append("\(current)\(letterCounter)")
         }
         */

        /*
         ALTERNATIVE SOLUTION 2
         ----------------------
         var returnValue = ""
         var letterCounter = 0
         let letterArray = Array(input)
         for i in 0 ..< letterArray.count {
            letterCounter += 1
            if i + 1 == letterArray.count
            || letterArray[i] != letterArray[i + 1] {
                returnValue += "\(letterArray[i])\(letterCounter)"
                letterCounter = 0
            }
         }
         */
    }

    func challenge14(input: String, current: String = "", results: inout [String]) {
        let inputLength = input.count
        let inputArray = Array(input)

        if (inputLength == 0) {
            results.append(current)
        } else {
            // for every letter
            for index in 0 ..< inputLength {
                // get the letters before the current
                let previousLetters = String(inputArray[0 ..< index ])
                // and the ones following the current letter
                let followingLetters = String(inputArray[index+1 ..< inputLength])

                // then recursively call this function with the remaining letters
                challenge14(input: previousLetters + followingLetters,
                            current: current + String(inputArray[index]),
                            results: &results)
            }
        }
    }
}
