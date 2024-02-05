//
//  TwoSumTestCase.swift
//  Tests
//
//  Created by Kevin Littles on 04/02/24.
//

import XCTest

final class TwoSumTestCase: XCTestCase {
    
    func test0() {
        XCTAssertEqual(
            TwoSum.count(
                StanfordTestInputs.twoSumCount,
                inclusiveUpperLimit: 10000,
                bottomLimit: -10000
            ),
            427
        )
    }
    
}
