//
//  StringChallenges.swift
//  CodingChallenges
//
//  Created by Michael Brünen on 16.08.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import Foundation

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
}
