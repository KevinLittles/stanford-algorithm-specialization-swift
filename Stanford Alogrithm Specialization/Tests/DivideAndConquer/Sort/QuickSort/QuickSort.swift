//
//  QuickSort.swift
//  Tests
//
//  Created by Kevin Littles on 18/01/24.
//

import Foundation

enum QuickSortPivot {
    case left
    case right
    case medianOfThree
}

struct QuickSort {
    
    private static var cumulativeComparisonCount: Int = 0
    
    static func comparisonCount(in array: inout [Int], with pivot: QuickSortPivot) -> Int {
        cumulativeComparisonCount = 0
        sort(&array, left: 0, right: array.count - 1, pivot: pivot)
        return cumulativeComparisonCount
    }
    
    private static func sort(_ array: inout [Int], left: Int, right: Int, pivot: QuickSortPivot) {
        guard left < right else { return }
        
        cumulativeComparisonCount += (right - left)

        var pivotIndex: Int {
            switch pivot {
            case .left:
                return left
            case .right:
                return right
            case .medianOfThree:
                let middle = (left + right) / 2
                let first = array[left]
                let mid = array[middle]
                let last = array[right]

                if (first < mid) == (mid < last) {
                    return middle
                } else if (mid < first) == (first < last) {
                    return left
                } else {
                    return right
                }
            }
        }

        let newPivotIndex: Int = divide(&array, left: left, right: right, pivotIndex: pivotIndex)
        conquer(&array, left: left, right: newPivotIndex - 1, pivot: pivot)
        conquer(&array, left: newPivotIndex + 1, right: right, pivot: pivot)
    }

    private static func divide(_ array: inout [Int], left: Int, right: Int, pivotIndex: Int) -> Int {
        array.swapAt(left, pivotIndex)
        
        let pivot: Int = array[left]
        var i: Int = left + 1

        for j in (left + 1)...right {
            if array[j] < pivot {
                array.swapAt(i, j)
                i += 1
            }
        }

        array.swapAt(left, i - 1)
        
        return i - 1
    }
    
    private static func conquer(_ array: inout [Int], left: Int, right: Int, pivot: QuickSortPivot) {
        sort(&array, left: left, right: right, pivot: pivot)
    }

}
