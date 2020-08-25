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

extension Int {
    func isEven() -> Bool {
        return self % 2 == 0
    }
}

// MARK: Challenge 41 extension
extension Collection where Iterator.Element == Int {
    func median() -> Double? {
        guard count != 0 else { return nil }

        let sorted = self.sorted()
        let middleIndex = sorted.count / 2

        if self.count.isEven() { return Double(sorted[middleIndex] + sorted[middleIndex - 1]) / 2 }
        else { return Double(sorted[middleIndex]) }
    }
}

// MARK: Challenge 42 extension
extension Collection where Iterator.Element: Comparable {
    func firstIndexOf(_ searched: Iterator.Element) -> Int? {
        for (index, element) in self.enumerated() {
            if element == searched { return index }
        }
        return nil
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

    // Challenge 41: Find the median
    func challenge41(input: [Int]) -> Double? {
        return input.median()
    }

    // Challenge 42: Recreate firstIndex(of:)
    func challenge42<T: Comparable>(input: [T], element: T) -> Int? {
        return input.firstIndexOf(element)
    }

    // Challenge 43: Linked lists, print all nodes
    func challenge43() -> String {
        let linkedList = LinkedList<Character>()
        var prevNode: Node<Character>? = nil

        for letter in "abcdefghijklmnopqrstuvwxyz" {
            let newNode = Node(value: letter)

            if let previous = prevNode {    // not the first node
                previous.next = newNode
            } else {                        // first node
                linkedList.head = newNode
            }

            prevNode = newNode
        }

        return linkedList.allNodesValuesString
    }
}
