//
//  TwoSum.swift
//  Tests
//
//  Created by Kevin Littles on 04/02/24.
//

import Foundation

struct TwoSum {
    
    static func count(_ array: [Int], inclusiveUpperLimit: Int, bottomLimit: Int) -> Int {
        let hashMap: IntToBoolHashMap = .init(capacity: array.count)
        
        for number in array {
            hashMap.insert(true, at: number)
        }
        
        var sumCount: Int = 0
        
        for sum in bottomLimit...inclusiveUpperLimit {
            for number in array {
                let missing: Int = sum - number

                if missing != number,
                   hashMap.value(for: missing) ?? false {
                    
                    sumCount += 1
                    break
                }
            }
        }
        
        return sumCount
    }
    
}
