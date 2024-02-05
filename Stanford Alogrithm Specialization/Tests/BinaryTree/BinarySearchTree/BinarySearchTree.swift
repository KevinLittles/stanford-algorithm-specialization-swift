//
//  BinarySearchTree.swift
//  Tests
//
//  Created by Kevin Littles on 04/02/24.
//

import Foundation

class BinarySearchTree {
    
    var value: Int
    var left: BinarySearchTree?
    var right: BinarySearchTree?
    var size = 1

    init(value: Int) {
        self.value = value
    }

    func insert(_ value: Int) {
        self.size += 1
        if value < self.value {
            if let left = left {
                left.insert(value)
            } else {
                self.left = BinarySearchTree(value: value)
            }
        } else {
            if let right = right {
                right.insert(value)
            } else {
                self.right = BinarySearchTree(value: value)
            }
        }
    }

    func delete(_ value: Int) -> BinarySearchTree? {
        if value < self.value {
            left = left?.delete(value)
        } else if value > self.value {
            right = right?.delete(value)
        } else {
            if left == nil {
                return right
            } else if right == nil {
                return left
            } else {
                self.value = right!.minValue()
                right = right!.delete(self.value)
            }
        }
        size -= 1
        return self
    }

    func minValue() -> Int {
        var currentNode = self
        while let next = currentNode.left {
            currentNode = next
        }
        return currentNode.value
    }

    func maxValue() -> Int {
        var currentNode = self
        while let next = currentNode.right {
            currentNode = next
        }
        return currentNode.value
    }
    
}
