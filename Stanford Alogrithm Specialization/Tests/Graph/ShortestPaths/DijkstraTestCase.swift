//
//  DijkstraTestCase.swift
//  Tests
//
//  Created by Kevin Littles on 01/02/24.
//

import XCTest

final class DijkstraTestCase: XCTestCase {
    
    func test0() {
        let shortestPaths: [Int: Int] = Dijkstra.shortestPaths(
            for: StanfordTestInputs.dijkstra,
            from: 1,
            maxDistance: 1000000
        )
        XCTAssertEqual(shortestPaths[7], 2599)
        XCTAssertEqual(shortestPaths[37], 2610)
        XCTAssertEqual(shortestPaths[59], 2947)
        XCTAssertEqual(shortestPaths[82], 2052)
        XCTAssertEqual(shortestPaths[99], 2367)
        XCTAssertEqual(shortestPaths[115], 2399)
        XCTAssertEqual(shortestPaths[133], 2029)
        XCTAssertEqual(shortestPaths[165], 2442)
        XCTAssertEqual(shortestPaths[188], 2505)
        XCTAssertEqual(shortestPaths[197], 3068)
    }
    
    func test1() {
        XCTAssertEqual(
            Dijkstra.shortestPaths(
                for: [
                    0: [(1, 2), (2, 4)],
                    1: [(0, 2), (2, 1), (3, 7)],
                    2: [(0, 4), (1, 1), (3, 3)],
                    3: [(1, 7), (2, 3)]
                ],
                from: 0
            ), [0: 0, 1: 2, 2: 3, 3: 6]
        )
    }
    
    func test2() {
        XCTAssertEqual(
            Dijkstra.shortestPaths(
                for: [
                    0: [(1, 6), (2, 2)],
                    1: [(0, 6), (2, 3), (3, 1)],
                    2: [(0, 2), (1, 3), (3, 5)],
                    3: [(1, 1), (2, 5)]
                ],
                from: 0
            ), [0: 0, 1: 5, 2: 2, 3: 6]
        )
    }

    func test3() {
        XCTAssertEqual(
            Dijkstra.shortestPaths(
                for: [
                    0: [(1, 4)],
                    1: [(0, 4), (2, 11)],
                    2: [(1, 11), (3, 3)],
                    3: [(2, 3)]
                ],
                from: 0
            ), [0: 0, 1: 4, 2: 15, 3: 18]
        )
    }

    func test4() {
        XCTAssertEqual(
            Dijkstra.shortestPaths(
                for: [
                    0: [(1, 1)],
                    1: [(0, 1), (2, 1), (3, 4)],
                    2: [(1, 1), (3, 1)],
                    3: [(1, 4), (2, 1)]
                ],
                from: 2
            ), [0: 2, 1: 1, 2: 0, 3: 1]
        )
    }

    func test5() {
        XCTAssertEqual(
            Dijkstra.shortestPaths(
                for: [
                    0: [(2, 7)],
                    2: [(0, 7), (1, 6), (3, 2)],
                    1: [(2, 6)],
                    3: [(2, 2)]
                ],
                from: 3
            ), [0: 9, 1: 8, 2: 2, 3: 0]
        )
    }

    func test6() {
        XCTAssertEqual(
            Dijkstra.shortestPaths(
                for: [
                    0: [(1, 10)],
                    1: [(0, 10), (2, 10)],
                    2: [(1, 10), (3, 10)],
                    3: [(2, 10)]
                ],
                from: 0
            ), [0: 0, 1: 10, 2: 20, 3: 30]
        )
    }

    func test7() {
        XCTAssertEqual(
            Dijkstra.shortestPaths(
                for: [
                    0: [(1, 3), (2, 5)],
                    1: [(0, 3), (2, 2), (3, 6)],
                    2: [(0, 5), (1, 2)],
                    3: [(1, 6)]
                ],
                from: 1
            ), [0: 3, 1: 0, 2: 2, 3: 6]
        )
    }

    func test8() {
        XCTAssertEqual(
            Dijkstra.shortestPaths(
                for: [
                    0: [(1, 8)],
                    1: [(0, 8), (2, 1)],
                    2: [(1, 1), (3, 2)],
                    3: [(2, 2)]
                ],
                from: 2
            ), [0: 9, 1: 1, 2: 0, 3: 2]
        )
    }

    func test9() {
        XCTAssertEqual(
            Dijkstra.shortestPaths(
                for: [
                    0: [(1, 1)],
                    1: [(0, 1), (2, 4)],
                    2: [(1, 4), (3, 1)],
                    3: [(2, 1), (4, 1)],
                    4: [(3, 1)]
                ],
                from: 4
            ), [0: 7, 1: 6, 2: 2, 3: 1, 4: 0]
        )
    }
    
}
