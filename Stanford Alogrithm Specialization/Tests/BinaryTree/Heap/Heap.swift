//
//  Heap.swift
//  Tests
//
//  Created by Kevin Littles on 03/02/24.
//

import Foundation

class Heap {
    
    var values: [Int]
    let areInCorrectOrder: (Int, Int) -> Bool

    var peek: Int? { values.first }

    init(values: [Int] = [], areInCorrectOrder: @escaping (Int, Int) -> Bool) {
        self.values = values
        self.areInCorrectOrder = areInCorrectOrder
        heapify()
    }

    func insert(_ value: Int) {
        values.append(value)
        swim(childIndex: values.count - 1)
    }

    func extract() -> Int? {
        guard !values.isEmpty else { return nil }
        values.swapAt(0, values.count - 1)
        let extracted = values.removeLast()
        if !values.isEmpty {
            sink(parentIndex: 0)
        }
        return extracted
    }
    
    private func heapify() {
        for index in stride(
            from: values.count / 2 - 1,
            through: 0,
            by: -1
        ) {
            sink(parentIndex: index)
        }
    }

    private func swim(childIndex: Int) {
        var childIndex = childIndex
        var parentIndex = self.parentIndex(of: childIndex)

        while childIndex > 0 && areInCorrectOrder(values[childIndex], values[parentIndex]) {
            values.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }
    }

    private func sink(parentIndex: Int) {
        var parentIndex = parentIndex

        while true {
            let leftChildIndex = leftChildIndex(of: parentIndex)
            let rightChildIndex = rightChildIndex(of: parentIndex)
            var candidateIndex = parentIndex

            if leftChildIndex < values.count && areInCorrectOrder(values[leftChildIndex], values[candidateIndex]) {
                candidateIndex = leftChildIndex
            }
            
            if rightChildIndex < values.count && areInCorrectOrder(values[rightChildIndex], values[parentIndex]) {
                if candidateIndex == parentIndex || areInCorrectOrder(values[rightChildIndex], values[candidateIndex]) {
                    candidateIndex = rightChildIndex
                }
            }

            if candidateIndex == parentIndex {
                break
            }

            values.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }

    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }

    private func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }
    
    private func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }
    
}
