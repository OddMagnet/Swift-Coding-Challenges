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
}
