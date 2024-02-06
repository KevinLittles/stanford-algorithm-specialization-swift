//
//  WeightedCompletionTimeTestCase.swift
//  Tests
//
//  Created by Kevin Littles on 05/02/24.
//

import XCTest

final class WeightedCompletionTimeTestCase: XCTestCase {
    
    func test0_withDifference() {
        XCTAssertEqual(
            WeightedCompletionTime.calculate(StanfordTestInputs.weightedCompletionTime, with: .difference),
            69119377652
        )
    }
    
    func test0_withRatio() {
        XCTAssertEqual(
            WeightedCompletionTime.calculate(StanfordTestInputs.weightedCompletionTime, with: .ratio),
            67311454237
        )
    }
    
}
