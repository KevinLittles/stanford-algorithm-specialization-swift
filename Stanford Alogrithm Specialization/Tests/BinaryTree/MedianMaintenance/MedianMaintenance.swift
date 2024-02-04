//
//  MedianMaintenance.swift
//  Tests
//
//  Created by Kevin Littles on 03/02/24.
//

import Foundation

struct MedianMaintenance {
    
    static func usingHeap(for array: [Int]) -> Int {
        let maxHeap = MaxHeap()
        let minHeap = MinHeap()
        
        var medianSum = 0

        for number in array {
            if maxHeap.peek == nil || number <= maxHeap.peek! {
                maxHeap.insert(number)
            } else {
                minHeap.insert(number)
            }

            if maxHeap.values.count > minHeap.values.count + 1 {
                minHeap.insert(maxHeap.extract()!)
            } else if minHeap.values.count > maxHeap.values.count {
                maxHeap.insert(minHeap.extract()!)
            }

            let median = maxHeap.values.count >= minHeap.values.count ? maxHeap.peek! : minHeap.peek!
            medianSum = medianSum + median
            print(median)
        }

        return medianSum
    }
    
    static func usingBinarySearchTree(for array: [Int]) -> Int {
        var leftTree: BinarySearchTree?
        var rightTree: BinarySearchTree?
        var medianSum = 0

        for number in array {
            if let leftMax = leftTree?.maxValue() {
                if number <= leftMax {
                    leftTree?.insert(number)
                } else {
                    if rightTree == nil {
                        rightTree = BinarySearchTree(value: number)
                    } else {
                        rightTree?.insert(number)
                    }
                }
            } else {
                leftTree = BinarySearchTree(value: number)
            }

            while (leftTree?.size ?? 0) > (rightTree?.size ?? 0) + 1 {
                let leftMax = leftTree!.maxValue()
                if rightTree == nil {
                    rightTree = BinarySearchTree(value: leftMax)
                } else {
                    rightTree?.insert(leftMax)
                }
                leftTree = leftTree?.delete(leftMax)
            }

            while (rightTree?.size ?? 0) > (leftTree?.size ?? 0) {
                let rightMin = rightTree!.minValue()
                leftTree?.insert(rightMin)
                rightTree = rightTree?.delete(rightMin)
            }

            if (leftTree?.size ?? 0) >= (rightTree?.size ?? 0) {
                medianSum += leftTree!.maxValue()
            } else {
                medianSum += rightTree!.minValue()
            }
        }

        return medianSum
    }

}
