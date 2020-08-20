//
//  NumberChallenges.swift
//  CodingChallenges
//
//  Created by Michael Brünen on 20.08.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import Foundation

struct NumberChallenges {
    // Challenge 16: Fizz Buzz
    func challenge16(input: Int) -> String {
        switch (input % 3 == 0, input % 5 == 0) {
            case (true, false):
                return "Fizz"
            case (false, true):
                return "Buzz"
            case (true, true):
                return "FizzBuzz"
            default:
                return String(input)
        }
    }

    // Challenge 17: Generate a random number in a range
    func challenge17(min: Int, max: Int) -> Int {
        return Int.random(in: min...max)
    }

    // Challenge 18: Recreate the pow() function
    func challenge18(input: Int, power: Int) -> Int {
        guard input > 0 && power > 0 else { return 0 }
        var result = input
        for _ in 1..<power {
            result *= input
        }
        return result
    }

    // Challenge 19: Swap two numbers
    // Swap two positive variable integers, a and b, without using a temporary variable.
    func challenge19(a: inout Int, b: inout Int) {
        (a, b) = (b, a)
    }
}
