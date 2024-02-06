//
//  PrimTestCase.swift
//  Tests
//
//  Created by Kevin Littles on 05/02/24.
//

import XCTest

final class PrimTestCase: XCTestCase {
    
    func test0() {
        XCTAssertEqual(
            Prim.calculateMinimumSpanningTreeCost(
                edges: StanfordTestInputs.minimumSpanningTree,
                startVertex: 1)
            ,
            -3612829
        )
    }
    
}
