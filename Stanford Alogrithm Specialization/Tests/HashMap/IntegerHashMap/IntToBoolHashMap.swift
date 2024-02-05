//
//  IntToBoolHashMap.swift
//  Tests
//
//  Created by Kevin Littles on 04/02/24.
//

import Foundation

final class ListNode {
    let key: Int
    var value: Bool
    var next: ListNode?

    init(key: Int, value: Bool) {
        self.key = key
        self.value = value
    }
}

final class IntToBoolHashMap {
    
    private var buckets: [ListNode?]

    init(capacity: Int) {
        self.buckets = Array(repeating: nil, count: capacity)
    }

    func insert(_ value: Bool, at key: Int) {
        let hash: Int = hash(for: key)
        let newNode: ListNode = .init(key: key, value: value)
        
        if let existingNode = buckets[hash] {
            newNode.next = existingNode
        }
        buckets[hash] = newNode
    }

    func value(for key: Int) -> Bool? {
        let hash: Int = hash(for: key)
        var node: ListNode? = buckets[hash]
        
        while let currentNode = node {
            if currentNode.key == key {
                return currentNode.value
            }
            node = currentNode.next
        }
        return nil
    }
    
    private func hash(for key: Int) -> Int {
        return abs(key) % buckets.count
    }
    
    private func contains(_ key: Int) -> Bool {
        return value(for: key) != nil
    }

}

