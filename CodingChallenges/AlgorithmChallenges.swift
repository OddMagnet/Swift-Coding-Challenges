//
//  AlgorithmChallenges.swift
//  CodingChallenges
//
//  Created by Michael Brünen on 29.08.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import Foundation

// MARK: Challenge 55, 56 & 59 extension
extension Array where Element: Comparable {
    func bubbleSort() -> [Element] {
        // no need to sort arrays with 1 or less items
        guard self.count > 1 else { return self }

        var array = self
        // every full loop over the array will put an item in it's final spot
        // the first loop puts the highest in it's final spot, the second the next highest, etc.
        // using this knowledge it's possible to reduce the amount of checks made every loop
        var highestIndexToCheck = array.count

        repeat {
            // remember the index of the last swap, if this doesn't get changed the array is sorted
            var lastSwapIndex = 0

            for i in 0 ..< highestIndexToCheck - 1 {
                // in addition to swapping items, also remember the highest last swap index
                if array[i] > array[i + 1] {
                    array.swapAt(i, i + 1)
                    lastSwapIndex = i + 1
                }
            }

            // after every full loop, set the new highest to check index
            highestIndexToCheck = lastSwapIndex
        } while highestIndexToCheck != 0

        return array
    }

    func insertionSort() -> [Element] {
        // no need to sort arrays with 1 or less items
        guard self.count > 1 else { return self }

        var array = self

        for i in 1 ..< count {
            // second index for moving back
            var currentIndex = i

            // copy of the item that is currently being sorted
            let currentItem = array[currentIndex]

            // move back in the array until the current item is smaller, or the start of the array is reached
            while currentIndex > 0 && currentItem < array[currentIndex - 1] {
                // with every step back, move the bigger item to the right
                array[currentIndex] = array[currentIndex - 1]
                // and reduce the current index further for the next step
                currentIndex -= 1
            }

            // after the last step back, either due to the item not being smaller anymore, or the start of the array being reached
            // place the item in its sorted placed
            array[currentIndex] = currentItem
        }

        return array
    }

    func quickSort() -> [Element] {
        guard count > 1 else { return self }

        let midPoint = self[count / 2]
        let smaller = filter { $0 < midPoint }
        let bigger = filter { $0 > midPoint }
        let equal = filter { $0 == midPoint }

        return smaller.quickSort() + equal + bigger.quickSort()
    }
}

struct AlgorithmChallenges {
    // Challenge 55: Bubble sort
    func challenge55<T: Comparable>(input: [T]) -> [T] {
        return input.bubbleSort()
    }

    // Challenge 56: Insertion sort
    func challenge56<T: Comparable>(input: [T]) -> [T] {
        return input.insertionSort()
    }

    // Challenge 57: Isomorphic values
    func challenge57(inputA: Any, inputB: Any) -> Bool {
        // convert both inputs to an array of characters
        let arrayA = Array(String(describing: inputA))
        let arrayB = Array(String(describing: inputB))
        // they can only be isomorphic if they're the same length
        guard arrayA.count == arrayB.count else { return false }

        // track mapped characters
        var characterMap = [Character: Character]()

        // loop over all characters, checking mappings for each and creating them if necessary
        // as soon as either characterA or characterB is mapped with 2 different characters, return false
        for (index, characterA) in arrayA.enumerated() {
            let characterB = arrayB[index]

            // if there is already a mapping for characterA, check it against characterB
            if let mapping = characterMap[characterA] {
                if mapping != characterB { return false }
            } else {
                // if not, check if the map contains characterB already
                if characterMap.values.contains(characterB) { return false }
                // if not, create it
                characterMap[characterA] = characterB
            }
        }

        // if the whole loop ran through without returning false, then the inputs are isomorphic
        return true
    }

    // Challenge 58: Balanced brackets
    func challenge58(input: String) -> Bool {
        // create a character set containing all non-valid characters
        let invalidCharacters = CharacterSet(charactersIn: "<{[()]}>").inverted
        // check that the input only contains valid characters
        guard input.rangeOfCharacter(from: invalidCharacters) == nil else { return false }

        // using an array with append() and popLast() to get the same functionality as with a stack
        var bracketArray = [Character]()
        // map opening to closing brackets
        let bracketMap: [Character: Character] = [
            "<": ">",
            "{": "}",
            "[": "]",
            "(": ")"
        ]

        for bracket in input {
            // check if it's an opening bracket, if so append it to the array
            if bracketMap.keys.contains(bracket) {
                bracketArray.append(bracket)
            } else {
            // otherwise it must be a closing bracket
                // check the last bracket in the array
                if let lastBracket = bracketArray.popLast() {
                    // if there is one, check if it's a fitting opening bracket, return false if not
                    if bracketMap[lastBracket] != bracket { return false }
                } else {
                    // if there is none, then the input can't be balanced brackets
                    return false
                }
            }
        }

        // if the loop ran over all brackets and didn't return false
        // and the bracketArray count is now 0, then the input had balanced brackets
        return bracketArray.count == 0
    }

    // Challenge 59: Quicksort
    func challenge59<T: Comparable>(input: [T]) -> [T] {
        return input.quickSort()
    }

    // Challenge 60: Tic-Tac-Toe winner
    func challenge60(input: [[String]]) -> Bool {
        func isWin(_ a: String, _ b: String, _ c: String) -> Bool {
            guard a != "" else { return false }
            return a == b && b == c
        }

        // check columns and rows
        for index in 0...2 {
            if isWin(input[index][0], input[index][1], input[index][2]) { return true } // rows
            if isWin(input[0][index], input[1][index], input[2][index]) { return true } // columns
        }

        // check diagonal options, return true if either one is true, false otherwise
        return isWin(input[0][0], input[1][1], input[2][2]) // top left to bottom right
            || isWin(input[0][2], input[1][1], input[2][0]) // top right to bottom left
    }

    // Challenge 61: Find prime numbers
    // Using the Sieve of Eratosthenes algorithm (https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes)
    /* Pesudo code from wikipedia:
     algorithm Sieve of Eratosthenes is
         input: an integer n > 1.
         output: all prime numbers from 2 through n.

         let A be an array of Boolean values, indexed by integers 2 to n, initially all set to true.

         for i = 2, 3, 4, ..., not exceeding √n do
            if A[i] is true
                for j = i2, i2+i, i2+2i, i2+3i, ..., not exceeding n do
                    A[j] := false

         return all i such that A[i] is true.
     */
    func challenge61(max: Int) -> [Int] {
        var isPrime = [Bool](repeating: true, count: max)
        // challenge asks to exclude 0 and 1
        isPrime[0] = false; isPrime[1] = false

        for number in 2 ..< max {
            if isPrime[number] == true {
                for multipleOfNumber in stride(from: number * number, to: isPrime.count, by: number) {
                    // a multiple of a prime number can't be a prime
                    isPrime[multipleOfNumber] = false
                }
            }
        }

        // $0 is the index, $1 the value
        // in this case the value is a boolean, indicating if the number, which equals the index
        // is a prime, if so it is added to the return array
        return isPrime.enumerated().compactMap({ $1 == true ? $0 : nil })
    }

    // Challenge 62: Points to angles
    func challenge62(input: [(pointA: CGPoint, pointB: CGPoint)]) -> [CGFloat] {
        // Mapping each pair of points to create an array of angles
        return input.map { pointA, pointB in
            // calculate deltas for the atan2 function
            let deltaX = pointA.x - pointB.x
            let deltaY = pointA.y - pointB.y
            // calculate the angle in radians
            let radians = atan2(deltaY, deltaX)
            // convert to degrees
            let degrees = radians * 180 / CGFloat.pi
            // and correct for 0 degrees to lie (as is convention) on the positive X-Axis
            let degreesCorrected = degrees - 90
            // make sure to only return positive angles
            return degreesCorrected >= 0
                ? degreesCorrected
                : degreesCorrected + 360.0
        }
    }

    // Challenge 63: Flood fill
//  func challenge63(grid: inout [[Int]], newNumber: Int, replacing: Int? = nil   , point: (x: Int, y: Int), ) {
    func challenge63(grid: inout [[Int]], fillValue: Int, replaceValue: Int? = nil, startPoint: (x: Int, y: Int)) {
        // make sure the starting point is valid
        guard (0 ..< 10).contains(startPoint.x) else { return }
        guard (0 ..< 10).contains(startPoint.y) else { return }

        // on recursive calls this value will be set, on the first call it's the value at the startPoint
        let valueToReplace = replaceValue ?? grid[startPoint.y][startPoint.x]

        // check the current point
        if grid[startPoint.y][startPoint.x] == valueToReplace {
            // fill it with the new value
            grid[startPoint.y][startPoint.x] = fillValue

            // then fill the surrounding points
            challenge63(grid: &grid, fillValue: fillValue, replaceValue: valueToReplace, startPoint: (x: startPoint.x + 1, y: startPoint.y))
            challenge63(grid: &grid, fillValue: fillValue, replaceValue: valueToReplace, startPoint: (x: startPoint.x - 1, y: startPoint.y))
            challenge63(grid: &grid, fillValue: fillValue, replaceValue: valueToReplace, startPoint: (x: startPoint.x, y: startPoint.y + 1))
            challenge63(grid: &grid, fillValue: fillValue, replaceValue: valueToReplace, startPoint: (x: startPoint.x, y: startPoint.y - 1))
        }
    }
}
