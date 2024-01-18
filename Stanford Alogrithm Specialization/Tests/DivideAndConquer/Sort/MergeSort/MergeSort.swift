//
//  MergeSort.swift
//  Tests
//
//  Created by Kevin Littles on 16/01/24.
//

import Foundation

struct MergeSort {
    
    private static var cumulativeInversionsCount: Int = 0
    
    static func inversionCount(_ array: [Int]) -> Int {
        cumulativeInversionsCount = 0
        sort(array)
        return cumulativeInversionsCount
    }
    
    @discardableResult
    private static func sort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else {
            return array
        }
        
        var (left, right): ([Int], [Int]) = divide(array)
        left = sort(left)
        right = sort(right)
        
        return conquer(left, right: right)
    }
    
    private static func divide(_ array: [Int]) -> ([Int], [Int]) {
        let midIndex: Int = array.count/2
        return (Array(array[..<midIndex]), Array(array[midIndex...]))
    }
    
    private static func conquer(_ left: [Int], right: [Int]) -> [Int] {
        
        let conqueredArrayCount: Int = left.count + right.count
        var conqueredArray: [Int] = []
        
        var leftIndex: Int = 0
        var rightIndex: Int = 0
        
        for _ in 0..<conqueredArrayCount {
            if leftIndex >= left.count {
                conqueredArray.append(contentsOf: Array(right[rightIndex...]))
                break
            } else if rightIndex >= right.count {
                conqueredArray.append(contentsOf: Array(left[leftIndex...]))
                break
            } else if left[leftIndex] <= right[rightIndex] {
                conqueredArray.append(left[leftIndex])
                leftIndex += 1
            } else {
                conqueredArray.append(right[rightIndex])
                rightIndex += 1
                cumulativeInversionsCount += left.count - leftIndex
            }
        }
        
        return conqueredArray
    }
    
}
