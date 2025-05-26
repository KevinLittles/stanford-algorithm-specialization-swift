//
//  JohnsonTestCase.swift
//
// Created by Kevin Littles on 25/05/25.
// Copyright (c) 2025. All rights reserved.
//

import XCTest

final class JohnsonTestCase: XCTestCase {

    func testAllPairs1ShortestShortestPath() {
        XCTAssertEqual(
            Johnson.shortestShortestPath(
                in: StanfordTestInputs.allPairs1
            ),
            nil
        )
    }

    func testAllPairs2ShortestShortestPath() {
        XCTAssertEqual(
            Johnson.shortestShortestPath(
                in: StanfordTestInputs.allPairs2
            ),
            nil
        )
    }

    func testAllPairs3ShortestShortestPath() {
        XCTAssertEqual(
            Johnson.shortestShortestPath(
                in: StanfordTestInputs.allPairs3
            ),
            -19
        )
    }
}
