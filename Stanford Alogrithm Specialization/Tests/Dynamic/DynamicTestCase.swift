//
//  DynamicTestCase.swift
//  Glorify
//
// Created by Kevin Littles on 18/05/25.
// Copyright (c) 2025. All rights reserved.
//

import XCTest

final class DynamicTestCase: XCTestCase {
    
    func testMaximumWeightIndependentSet() {
        XCTAssertEqual(
            Dynamic.mwisBitString(
                for: StanfordTestInputs.maxWeightIndependentSet,
                vertices: [1, 2, 3, 4, 17, 117, 517, 997]
            ),
            "10100110"
        )
    }
    
    func testKnapsackOptimalValue() {
        XCTAssertEqual(
            Dynamic.knapsack01(
                capacity: StanfordTestInputs.knapsackItems.capacity,
                items: StanfordTestInputs.knapsackItems.items
            ),
            2493893
        )
    }
    
    func testKnapsackBig() {
        XCTAssertEqual(
            Dynamic.knapsackRecursiveMemoization(
                capacity: StanfordTestInputs.bigKnapsackItems.capacity,
                items: StanfordTestInputs.bigKnapsackItems.items
            ),
            4243395
        )
    }
    
}
