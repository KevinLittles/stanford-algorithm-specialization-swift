//
//  MinHeap.swift
//  Tests
//
//  Created by Kevin Littles on 03/02/24.
//

import Foundation

final class MinHeap: Heap {
    
    init(values: [Int] = []) {
        super.init(values: values, areInCorrectOrder: <)
    }
    
}
