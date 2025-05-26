//
//  HeldKarpTSPTestCase.swift
//
// Created by Kevin Littles on 25/05/25.
// Copyright (c) 2025. All rights reserved.
//

import XCTest

final class HeldKarpTSPTestCase: XCTestCase {
    
    func testShortestTourCostForTSPInstance() {
        XCTAssertEqual(
            Int(HeldKarpTSP.shortestTourCost(
                for: StanfordTestInputs.tspCities
            ).rounded()),
            26442
        )
    }
}
