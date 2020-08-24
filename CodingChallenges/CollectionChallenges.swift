//
//  CollectionChallenges.swift
//  CodingChallenges
//
//  Created by Michael Brünen on 24.08.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import Foundation

// MARK: Challenge 37 extension
extension Collection where Iterator.Element == Int {
    func count(of digit: Character) -> Int {
        /* First solution
        var counter = 0
        // For every element in the collection
        for element in self {
            // convert it to a string
            let elementString = String(element)
            // then loop over every character of the string
            for char in elementString {
                // and increase counter on match
                if char == digit { counter += 1 }
            }
        }
        return counter
         */

        // Improved solution
        // add up the counts of all elements of the collection
        return self.reduce(0, { total, current in
            // for each element, convert it to a string, then filter the characters and use the resulting arrays count
            total + String(current).filter({ char in
                char == digit
            }).count
        })
    }
}

// MARK: Challenge 38 extension
extension Collection where Iterator.Element: Comparable {
    func smallest(count: Int) -> [Iterator.Element] {
        return Array(self.sorted().prefix(count))
    }
}

// MARK: Challenge 38 extension
extension Collection where Iterator.Element == String {
    func sortedByLongest(longestFirst: Bool = true) -> [Iterator.Element] {
        return self.sorted(by: {
            $0.count > $1.count
        })
    }
}

struct CollectionChallenges {
    // Challenge 37: Count the numbers
    func challenge37(input: [Int], countOf digit: Character) -> Int {
        return input.count(of: digit)
    }

    // Challenge 38: Find N smallest
    func challenge38<T: Comparable>(input: [T], count: Int) -> [T] {
        return input.smallest(count: count)
    }

    // Challenge 39: Sort a string array by length
    func challenge39(input: [String]) -> [String] {
        return input.sortedByLongest()
    }

    // Challenge 40: Missing numbers in array
    func challenge40(input: [Int]) -> [Int] {
        let wholeArray = Array(1...100)
        let inputSet = Set(input)       // using a Set for it's faster lookup
        var result: [Int] = []

        for number in wholeArray {
            if !inputSet.contains(number) { result.append(number) }
        }

        return result
    }
}
