//
//  Huffman.swift
//
// Created by Kevin Littles on 18/05/25.
// Copyright (c) 2025. All rights reserved.
//

import Foundation

struct Huffman {
    
    static func maxCodewordLength(for weights: [Int]) -> Int {
        let heap = buildMinHeap(from: weights)
        let root = buildHuffmanTree(with: heap)
        return maxDepth(of: root)
    }
    
    static func minCodewordLength(for weights: [Int]) -> Int {
        let heap = buildMinHeap(from: weights)
        let root = buildHuffmanTree(with: heap)
        return minDepth(of: root)
    }
    
    private static func buildMinHeap(from weights: [Int]) -> Heap<Node> {
        let heap = Heap<Node>(areInCorrectOrder: { $0.weight < $1.weight })
        for weight in weights {
            heap.insert(Node(weight: weight))
        }
        return heap
    }
    
    private static func buildHuffmanTree(with heap: Heap<Node>) -> Node? {
        while heap.values.count > 1 {
            guard let left = heap.extract(), let right = heap.extract() else { break }
            let merged = Node(weight: left.weight + right.weight, left: left, right: right)
            heap.insert(merged)
        }
        return heap.extract()
    }
    
    private static func maxDepth(of node: Node?, level: Int = 0) -> Int {
        guard let node = node else { return level - 1 }
        if node.left == nil && node.right == nil {
            return level
        }
        return max(
            maxDepth(of: node.left, level: level + 1),
            maxDepth(of: node.right, level: level + 1)
        )
    }
    
    private static func minDepth(of node: Node?, level: Int = 0) -> Int {
        guard let node = node else { return Int.max }
        if node.left == nil && node.right == nil {
            return level
        }
        return min(
            minDepth(of: node.left, level: level + 1),
            minDepth(of: node.right, level: level + 1)
        )
    }
    
}
