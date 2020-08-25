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
}
