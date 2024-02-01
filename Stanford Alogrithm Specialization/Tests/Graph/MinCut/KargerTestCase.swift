//
//  KargerTestCase.swift
//  Tests
//
//  Created by Kevin Littles on 21/01/24.
//

import XCTest

final class KargerTestCase: XCTestCase {
    
    func test0() throws {
        try XCTSkipIf(true)
        XCTAssertEqual(
            Karger.minCut(
                of: StanfordTestInputs.karger,
                in: 100
            ),
            17
        )
    }
    
    func test1() {
        XCTAssertEqual(
            Karger.minCut(
                of: [
                    1: [2, 4],
                    2: [1, 3, 4],
                    3: [2, 4],
                    4: [1, 2, 3],
                ],
                in: 100
            ),
            2
        )
    }
    
}
