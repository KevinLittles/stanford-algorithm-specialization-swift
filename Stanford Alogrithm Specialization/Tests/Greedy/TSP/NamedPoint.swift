//
//  NamedPoint.swift
//
// Created by Kevin Littles on 25/05/25.
// Copyright (c) 2025. All rights reserved.
//

struct NamedPoint {
    let id: Int
    let x: Double
    let y: Double

    func distance(to other: NamedPoint) -> Double {
        let dx = x - other.x
        let dy = y - other.y
        return (dx * dx + dy * dy).squareRoot()
    }
}
