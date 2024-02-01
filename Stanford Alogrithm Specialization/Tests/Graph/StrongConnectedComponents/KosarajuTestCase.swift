//
//  KosarajuTestCase.swift
//  Tests
//
//  Created by Kevin Littles on 31/01/24.
//

import XCTest

final class KosarajuTestCase: XCTestCase {
    
    func test0() throws {
        try XCTSkipIf(true)
        XCTAssertEqual(
            Kosaraju.strongConnectedComponentsSizes(StanfordTestInputs.kosaraju).prefix(5),
            [434821, 968, 459, 313, 211]
        )
    }
    
    func test2() {
        XCTAssertEqual(
            Kosaraju.strongConnectedComponentsSizes([1: [2], 2: [3], 3: []]),
            [1, 1, 1]
        )
    }

    func test3() {
        XCTAssertEqual(
            Kosaraju.strongConnectedComponentsSizes([1: [2], 2: [1], 3: [4], 4: [3], 5: [6], 6: [5]]),
            [2, 2, 2]
        )
    }

    func test4() {
        XCTAssertEqual(
            Kosaraju.strongConnectedComponentsSizes([1: [2], 2: [1], 3: [1]]),
            [2, 1]
        )
    }

    func test5() {
        XCTAssertEqual(
            Kosaraju.strongConnectedComponentsSizes([1: [2, 3], 2: [4], 3: [4], 4: [1]]),
            [4]
        )
    }

    func test6() {
        XCTAssertEqual(
            Kosaraju.strongConnectedComponentsSizes([1: [2], 2: [3], 3: [4], 4: [2]]),
            [3, 1]
        )
    }

    func test7() {
        XCTAssertEqual(
            Kosaraju.strongConnectedComponentsSizes([1: [2, 3], 2: [3, 4], 3: [1], 4: []]),
            [3, 1]
        )
    }

    func test8() {
        XCTAssertEqual(
            Kosaraju.strongConnectedComponentsSizes([1: [2], 2: [3], 3: [1], 4: []]),
            [3, 1]
        )
    }

    func test9() {
        XCTAssertEqual(
            Kosaraju.strongConnectedComponentsSizes([1: [2, 3], 2: [1], 3: [2]]),
            [3]
        )
    }
    
    func test10() {
        XCTAssertEqual(
            Kosaraju.strongConnectedComponentsSizes([1: [2], 2: [3], 3: [1], 4: [5], 5: [6], 6: [4], 7: [8], 8: [7], 9: [10], 10: [11], 11: [12], 12: [9], 13: [14], 14: [15], 15: [16], 16: [17], 17: [13]]),
            [5, 4, 3, 3, 2]
        )
    }

    func test11() {
        XCTAssertEqual(
            Kosaraju.strongConnectedComponentsSizes([1: [2], 2: [1], 3: [4], 4: [3], 5: [6], 6: [5], 7: [8], 8: [7], 9: [10], 10: [9], 11: [12], 12: [11], 13: [14], 14: [13]]),
            [2, 2, 2, 2, 2, 2, 2]
        )
    }

    func test12() {
        XCTAssertEqual(
            Kosaraju.strongConnectedComponentsSizes([1: [2], 2: [3], 3: [1], 4: [5], 5: [4], 6: [7], 7: [6], 8: [9], 9: [8], 10: [11], 11: [10], 12: [13], 13: [12], 14: [15], 15: [14]]),
            [3, 2, 2, 2, 2, 2, 2]
        )
    }

    func test13() {
        XCTAssertEqual(
            Kosaraju.strongConnectedComponentsSizes([1: [2, 7], 2: [3, 8], 3: [4, 9], 4: [5, 10], 5: [6, 11], 6: [1, 12], 7: [8], 8: [9], 9: [10], 10: [11], 11: [12], 12: [7]]),
            [6, 6]
        )
    }

    func test14() {
        XCTAssertEqual(
            Kosaraju.strongConnectedComponentsSizes([1: [2], 2: [3], 3: [4], 4: [5], 5: [6], 6: [7], 7: [1], 8: [9], 9: [10], 10: [11], 11: [12], 12: [13], 13: [8], 14: [15], 15: [16], 16: [17], 17: [18], 18: [14]]),
            [7, 6, 5]
        )
    }

    func test15() {
        XCTAssertEqual(
            Kosaraju.strongConnectedComponentsSizes([1: [2, 3], 2: [4], 3: [5], 4: [6], 5: [7], 6: [1], 7: [8], 8: [9], 9: [10], 10: [11], 11: [12], 12: [13], 13: [14], 14: [7]]),
            [8, 4, 1, 1]
        )
    }
    
}
