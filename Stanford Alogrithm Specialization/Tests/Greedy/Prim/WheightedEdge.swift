//
//  WheightedEdge.swift
//  Tests
//
//  Created by Kevin Littles on 05/02/24.
//

import Foundation

struct WheightedEdge: Comparable {
    
    var vertices: (Int, Int)
    var cost: Int
    
    static func < (lhs: WheightedEdge, rhs: WheightedEdge) -> Bool {
        lhs.cost < rhs.cost
    }
    
    static func == (lhs: WheightedEdge, rhs: WheightedEdge) -> Bool {
        lhs.cost == rhs.cost
    }
    
}
