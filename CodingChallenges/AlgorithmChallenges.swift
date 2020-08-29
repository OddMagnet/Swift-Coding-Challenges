//
//  AlgorithmChallenges.swift
//  CodingChallenges
//
//  Created by Michael Brünen on 29.08.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import Foundation

// MARK: Challenge 55 extension
extension Array where Element: Comparable {
    func myBubbleSort() -> [Element] {
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
}

struct AlgorithmChallenges {
    // Challenge 55: Bubble sort
    func challenge55<T: Comparable>(input: [T]) -> [T] {
        return input.myBubbleSort()
    }
    
}
