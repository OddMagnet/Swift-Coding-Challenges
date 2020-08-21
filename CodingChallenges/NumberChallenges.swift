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

    // Challenge 20: Number is prime
    func challenge20(input: Int) -> Bool {
        guard input >= 2 else { return false }
        guard input != 2 else { return true }

        let maxDivisor = Int(ceil(sqrt(Double(input))))
        for divisor in 2...maxDivisor {
            if input % divisor == 0 { return false }
        }
        return true
    }

    // Challenge 21: Counting binary ones
    func challenge21(input: Int) -> (nextLowest: Int?, nextHighest: Int?) {
        guard input > 0 else { return (0, 0) }
        // helper function
        func binaryOnes(in input: Int) -> Int {
            let inputAsBinaryString = String(input, radix: 2)
            return inputAsBinaryString.filter({ $0 == "1" }).count
        }
        // variables
        var nextLowest: Int?
        var nextHighest: Int?
        let amountOfOnesInInput = binaryOnes(in: input)

        // Search for lower
        for i in (0 ..< input).reversed() {
            if binaryOnes(in: i) == amountOfOnesInInput {
                nextLowest = i
                break
            }
        }
        // Search for higher
        for i in (input + 1)...Int.max {
            if binaryOnes(in: i) == amountOfOnesInInput {
                nextHighest = i
                break
            }
        }

        return (nextLowest, nextHighest)
    }

    // Challenge 22: Binary reverse
    func challenge22(input: UInt8) -> Int {
        let inputAsBinaryString = String(input, radix: 2)
        let padding = String(repeating: "0", count: 8 - inputAsBinaryString.count)
        let paddedInput = padding + inputAsBinaryString
        let reversed = paddedInput.reversed()
        let outputString = String(reversed)
        return Int(outputString, radix: 2) ?? 0
    }

    // Challenge 23: Integer disguised as string
    func challenge23(input: String) -> Bool {
        for char in input {
            if Int(String(char)) == nil { return false }
        }
        return true
    }

    // Challenge 24: Add numbers inside a string
    func challenge24(input: String) -> Int {
        // replace all non-digit with the same character
        let digitsReplaced = input.replacingOccurrences(of: "\\D+", with: "x", options: .regularExpression)
        // then splitting into an array
        let numbersArray = digitsReplaced.split(separator: "x")
        // using the reduce function to both convert the strings to numbers and sum them up
        return numbersArray.reduce(0, { total, currentNumber in
            total + Int(String(currentNumber))! // since all non-digits were filtered before, a force unwrap is safe here
        })
    }

    // Challenge 25: Calculate a square root by hand
    // Not sure why this challenge was marked taxing, there was no mention of not using the "pow" function
    func challenge25(input: Int) -> Int {
        // raising something to the power of 0.5 is the same as calculating the square root
        let result = pow(Double(input), 0.5)
        // floor used since the challenge asked for the nearest rounded down integer
        return Int(floor(result))
    }
}
