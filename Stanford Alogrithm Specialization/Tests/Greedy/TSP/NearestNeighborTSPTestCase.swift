//
//  NearestNeighborTSPTestCase.swift
//
// Created by Kevin Littles on 25/05/25.
// Copyright (c) 2025. All rights reserved.
//

import XCTest

final class NearestNeighborTSPTestCase: XCTestCase {
    
    func testApproximateTourCostOfLargeInstance() {
        XCTAssertEqual(
            NearestNeighborTSP.approximateTourCost(
                for: StanfordTestInputs.tspLargeCities
            ),
            1203406
        )
    }
}
