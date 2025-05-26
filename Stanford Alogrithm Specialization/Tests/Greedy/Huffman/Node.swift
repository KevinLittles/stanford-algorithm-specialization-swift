//
//  Node.swift
//
// Created by Kevin Littles on 18/05/25.
// Copyright (c) 2025. All rights reserved.
//

import Foundation

final class Node {
    
    let weight: Int
    var left: Node?
    var right: Node?
    
    init(weight: Int, left: Node? = nil, right: Node? = nil) {
        self.weight = weight
        self.left = left
        self.right = right
    }
    
}
