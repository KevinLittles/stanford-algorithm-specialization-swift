//
//  HuffmanTestCase.swift
//
// Created by Kevin Littles on 18/05/25.
// Copyright (c) 2025. All rights reserved.
//

import XCTest

final class HuffmanTestCase: XCTestCase {
    
    func testMaxCodewordLength() {
        XCTAssertEqual(
            Huffman.maxCodewordLength(for: StanfordTestInputs.huffmanSymbolWeights),
            19
        )
    }
    
    func testMinCodewordLength() {
        XCTAssertEqual(
            Huffman.minCodewordLength(for: StanfordTestInputs.huffmanSymbolWeights),
            9
        )
    }
    
}
