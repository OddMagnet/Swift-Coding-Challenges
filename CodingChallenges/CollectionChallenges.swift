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

// MARK: Challenge 46 extension
extension Collection {
    func myMap<T>(_ transform: (Iterator.Element) throws -> T) rethrows -> [T] {
        var resultCollection = [T]()
        for element in self {
            resultCollection.append(try transform(element))
        }
        return resultCollection
    }
}

// MARK: Challenge 47 extension
extension Collection where Iterator.Element: Comparable {
    func myMin() -> Iterator.Element? {
        return self.sorted().first
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
    func challenge43(input: String) -> String {
        let linkedList = LinkedList<Character>(with: Array<Character>(input))
        return linkedList.allNodesValuesString
    }

    // Challenge 44: Linked list mid- point
    func challenge44<T>(input: [T]) -> T? {
        let list = LinkedList<T>(with: input)
        return list.midPoint()
    }

    // Challenge 45: Traversing the tree
    func challenge45<T: Comparable>(input: [T], closure: (TreeNode<T>) -> Void) -> Void {
        guard input.count > 0 else { return }
        let tree = BinarySearchTree(with: input)
        tree.root!.traverse(closure: closure)
    }

    // Challenge 46: Recreate map()
    func challenge46() {
        assert([1, 2, 3].myMap({ String($0) }) == ["1", "2", "3"])
        assert(["1", "2", "3"].myMap({ Int($0) }) == [1, 2, 3])
    }

    // Challenge 47: Recreate min()
    func challenge47<T: Comparable>(input: [T]) -> T? {
        return input.myMin()
    }

    // Challenge 48: Implement a deque data structure
    // See: DoubleEndedQueue.swift

    // Challenge 49: Sum the even repeats
    func challenge49(_ input: Int...) -> Int {
        let countedSet = NSCountedSet(array: input)
        var sum = 0
        for item in countedSet {
            if countedSet.count(for: item) % 2 == 0 {
                sum += item as! Int
            }
        }
        return sum
    }

    // MARK: PLACEHOLDER for challenges 50 - 53

    // Challenge 54: Binary search trees
    func challenge54<T: Comparable>(input: [T]) -> Bool {
        let tree = BinarySearchTree(with: input)
        return tree.isBalanced()
    }

}
