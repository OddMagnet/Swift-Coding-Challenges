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
}
