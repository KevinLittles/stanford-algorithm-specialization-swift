//
//  Point.swift
//
// Created by Kevin Littles on 25/05/25.
// Copyright (c) 2025. All rights reserved.
//

import Foundation

struct Point: Hashable {
    let x: Double
    let y: Double

    func distance(to other: Point) -> Double {
        let dx = x - other.x
        let dy = y - other.y
        let euclidean = sqrt(dx * dx + dy * dy)
        return euclidean.rounded()
    }
}
