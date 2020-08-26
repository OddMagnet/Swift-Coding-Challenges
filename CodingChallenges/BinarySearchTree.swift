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
