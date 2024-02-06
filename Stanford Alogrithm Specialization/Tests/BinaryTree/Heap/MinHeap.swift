//
//  MinHeap.swift
//  Tests
//
//  Created by Kevin Littles on 03/02/24.
//

import Foundation

final class MinHeap<Element: Comparable>: Heap<Element> {
    
    init(values: [Element] = []) {
        super.init(values: values, areInCorrectOrder: <)
    }
    
}
