//
//  LinkedList.swift
//  CodingChallenges
//
//  Created by Michael Brünen on 25.08.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import Foundation

class Node<T> {
    var value: T
    var next: Node?

    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    var head: Node<T>?

    init(with content: [T]) {
        guard content.count != 0 else { return }
        var prevNode: Node<T>? = nil

        for element in content {
            let newNode = Node(value: element)

            // check that head is not nil, set if needed
            if let previous = prevNode { previous.next = newNode }
            else { head = newNode }

            // move on to the next node
            prevNode = newNode
        }

    }

    // MARK: Challenge 43
    func allNodeValues() -> [T] {
        var nodeArray = [T]()
        var current = head

        while let node = current {
            nodeArray.append(node.value)
            current = node.next
        }

        return nodeArray
    }

    var allNodesValuesString: String {
        return allNodeValues().map({ "\($0)" }).joined(separator: " ")
    }

    // MARK: Challenge 44
    func midPoint() -> T? {
        var midPointer = head
        var endPointer = head

        // by moving the midPointer by one item at a time and the endPointer by two,
        // by the time the endPointer reaches the end, the midPointer will be in the middle
        while endPointer != nil && endPointer?.next != nil {
            midPointer = midPointer?.next
            endPointer = endPointer?.next?.next
        }

        return midPointer?.value
    }
}
