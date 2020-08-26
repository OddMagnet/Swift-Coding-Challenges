//
//  BinarySearchTree.swift
//  CodingChallenges
//
//  Created by Michael Brünen on 26.08.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import Foundation

class TreeNode<T> {
    var key: T
    var left: TreeNode<T>?
    var right: TreeNode<T>?

    init(key: T) {
        self.key = key
    }
}

// Challenge 54: Binary search trees
// For this challenge I had to look into part of the solutions, namely the steps needed for the init method
// These can be seen as comments in the method itself
class BinarySearchTree<T: Comparable> {
    var root: TreeNode<T>?

    init(with content: [T]) {
        // 1. Loop over every item in the array.
        for item in content {
            var isPlaced = false

            // 2. If we have a root node already, set it to be our tracker node – that’s the one we’re currently comparing against.
            if let rootNode = root {
                var tracker = rootNode

                while isPlaced == false {
                    // 3. If the item is less than or equal to our tracker,
                    if item <= tracker.key {
                        // and the tracker’s left value is nil
                        if tracker.left == nil {
                            // make a new node from our item, make it the tracker’s left value, then mark this item as being placed.
                            tracker.left = TreeNode(key: item)
                            isPlaced = true
                    // 4. If the item is less than or equal to our tracker but we already have a left value
                        } else {
                            // make that left value our new tracker and repeat the loop.
                            tracker = tracker.left!
                        }
                    // 5. If the item is greater than our tracker
                    } else {
                        // and tracker’s right value is nil
                        if tracker.right == nil {
                            // make a new node from our item, make it the tracker’s right value, then mark this item as being placed.
                            tracker.right = TreeNode(key: item)
                            isPlaced = true
                    // 6. If the item is greater than our tracker but we already have a right value
                        } else {
                            // make that right value our new tracker and repeat the loop.
                            tracker = tracker.right!
                        }
                    }
                }
            } else {
                // 7. If we don’t already have a root node, make one from the item and make that the tracker.
                root = TreeNode(key: item)
            }
        }
    }
}
