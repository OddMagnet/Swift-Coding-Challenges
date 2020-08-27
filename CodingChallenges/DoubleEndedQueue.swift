//
//  DoubleEndedQueue.swift
//  CodingChallenges
//
//  Created by Michael Brünen on 27.08.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import Foundation

// Challenge 48: Implement a deque data structure
struct Deque<T> {
    var array = [T]()
    var count: Int { return array.count }

    mutating func pushFront(_ value: T) {
        array.insert(value, at: 0)
    }

    mutating func pushBack(_ value: T) {
        array.append(value)
    }

    mutating func popFront() -> T? {
        guard count > 0 else { return nil }
        return array.removeFirst()
    }

    mutating func popBack() -> T? {
        guard count > 0 else { return nil }
        return array.removeLast()
    }
}
