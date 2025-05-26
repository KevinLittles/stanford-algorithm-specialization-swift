//
//  TwoSATTestCase.swift
//  Glorify
//
// Created by Kevin Littles on 25/05/25.
// Copyright (c) 2025. All rights reserved.
//

import XCTest

final class TwoSATTestCase: XCTestCase {
    
    func testTwoSAT1() {
        XCTAssertTrue(TwoSAT.isSatisfiable(from: StanfordTestInputs.twoSAT1()))
    }

    func testTwoSAT2() {
        XCTAssertFalse(TwoSAT.isSatisfiable(from: StanfordTestInputs.twoSAT2()))
    }

    func testTwoSAT3() {
        XCTAssertTrue(TwoSAT.isSatisfiable(from: StanfordTestInputs.twoSAT3()))
    }

    func testTwoSAT4() {
        XCTAssertTrue(TwoSAT.isSatisfiable(from: StanfordTestInputs.twoSAT4()))
    }

    func testTwoSAT5() {
        XCTAssertFalse(TwoSAT.isSatisfiable(from: StanfordTestInputs.twoSAT5()))
    }

    func testTwoSAT6() {
        XCTAssertFalse(TwoSAT.isSatisfiable(from: StanfordTestInputs.twoSAT6()))
    }
}
