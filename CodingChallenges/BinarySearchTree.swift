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

    // Challenge 45: Traversing the tree
    func traverse(closure: (TreeNode<T>) -> Void) -> Void {
        left?.traverse(closure: closure)
        closure(self)
        right?.traverse(closure: closure)
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

    private func minDepth(from node: TreeNode<T>?) -> Int {
        // check that node is not nil, non-existing nodes add no depth
        guard let node = node else { return 0 }
        // recursively call this function until an empty node is found
        let totalMinDepth = 1 + min(minDepth(from: node.left), minDepth(from: node.right))
        return totalMinDepth
    }

    private func maxDepth(from node: TreeNode<T>?) -> Int {
        // check that node is not nil, non-existing nodes add no depth
        guard let node = node else { return 0 }
        // recursively call this function until an empty node is found
        let totalMaxDepth = 1 + max(maxDepth(from: node.left), maxDepth(from: node.right))
        return totalMaxDepth
    }

    // Challenge 54: Binary search trees
    // a BST is considered balanced when the difference between minDepth and maxDepth is <= 1
    func isBalanced() -> Bool {
        // check if there is a root. Empty trees are always balanced
        guard let root = root else { return true }
        let difference = maxDepth(from: root) - minDepth(from: root)
        return difference <= 1
    }
}
