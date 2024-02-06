//
//  Job.swift
//  Tests
//
//  Created by Kevin Littles on 05/02/24.
//

import Foundation

struct Job {
    
    var weight: Int
    var length: Int
    
    var difference: Int {
        weight - length
    }
    
    var ratio: Double {
        Double(weight) / Double(length)
    }
    
}
