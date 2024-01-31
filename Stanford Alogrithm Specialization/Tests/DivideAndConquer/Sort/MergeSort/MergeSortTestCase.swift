//
//  MergeSortTestCase.swift
//  Tests
//
//  Created by Kevin Littles on 16/01/24.
//

import XCTest
import BigInt

final class MergeSortTestCase: XCTestCase {
    
    func test0() {
        XCTAssertEqual(
            MergeSort.inversionCount(StanfordTestInputs.mergeSort),
            2407905288
        )
    }
    
    func test1() {
        XCTAssertEqual(
            MergeSort.inversionCount([1, 3, 5, 2, 4, 6]),
            3
        )
    }
    
    func test2() {
        XCTAssertEqual(
            MergeSort.inversionCount([1, 2, 3, 4, 5, 6]),
            0
        )
    }
    
    func test3() {
        XCTAssertEqual(
            MergeSort.inversionCount([1, 2, 3, 4, 5, 6, 7]),
            0
        )
    }
    
    func test4() {
        XCTAssertEqual(
            MergeSort.inversionCount([1, 3, 5, 2, 4, 6, 0]),
            9
        )
    }
    
}
