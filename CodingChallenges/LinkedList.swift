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
        var counter = 0
        var node = head

        // get the node count
        while let current = node {
            counter += 1;
            node = current.next
        }

        // get the mid-point
        let midpoint = counter / 2
        node = head
        while let current = node {
            counter -= 1
            if counter == midpoint { return current.value }
            node = current.next
        }

        // if list was empty, return nil
        return nil
    }
}
