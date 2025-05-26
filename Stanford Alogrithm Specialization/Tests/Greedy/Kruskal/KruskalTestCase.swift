//
//  KruskalTestCase.swift
//
// Created by Kevin Littles on 18/05/25.
// Copyright (c) 2025. All rights reserved.
//

import XCTest

final class KruskalTestCase: XCTestCase {
    
    func test0() {
        XCTAssertEqual(
            Kruskal.maxSpacingKClustering(
                edges: StanfordTestInputs.maxSpacingKClustering,
                numberOfVertices: 500,
                k: 4
            ),
            106
        )
    }
    
    func testBig() {
        XCTAssertEqual(
            Kruskal.countClustersWithSpacingAtLeast3(from: StanfordTestInputs.maxSpacingKClusteringBig),
            6118
        )
    }
    
}
