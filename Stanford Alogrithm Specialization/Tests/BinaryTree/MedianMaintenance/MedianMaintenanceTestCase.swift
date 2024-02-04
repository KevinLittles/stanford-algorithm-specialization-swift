//
//  MedianMaintenanceTestCase.swift
//  Tests
//
//  Created by Kevin Littles on 03/02/24.
//

import XCTest

final class MedianMaintenanceTestCase: XCTestCase {
    
    func test0_usingHeap() {
        let cumulativeMedian: Int = MedianMaintenance.usingHeap(for: StanfordTestInputs.medianMaintenanceSum)
        XCTAssertEqual(cumulativeMedian % 10000, 1213)
    }
    
    func test0_usingBinarySearchTree() {
        let cumulativeMedian: Int = MedianMaintenance.usingBinarySearchTree(for: StanfordTestInputs.medianMaintenanceSum)
        XCTAssertEqual(cumulativeMedian % 10000, 1213)
    }
    
    func test1_usingHeap() {
        XCTAssertEqual(
            MedianMaintenance.usingHeap(
                for: [1]
            ),
            1
        )
    }

    func test2_usingHeap() {
        XCTAssertEqual(
            MedianMaintenance.usingHeap(
                for: [4,3,2,1]
            ),
            12
        )
    }

    func test3_usingHeap() {
        XCTAssertEqual(
            MedianMaintenance.usingHeap(
                for: [4,3,2,1,5]
            ),
            15
        )
    }

    func test4_usingHeap() {
        XCTAssertEqual(
            MedianMaintenance.usingHeap(
                for: [4,3,2,1,5,6]
            ),
            18
        )
    }

    func test5_usingHeap() {
        XCTAssertEqual(
            MedianMaintenance.usingHeap(
                for: [4,3,2,1,5,6,7]
            ),
            22
        )
    }

    
}
