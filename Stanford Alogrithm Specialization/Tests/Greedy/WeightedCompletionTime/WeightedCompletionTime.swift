//
//  WeightedCompletionTime.swift
//  Tests
//
//  Created by Kevin Littles on 05/02/24.
//

import Foundation

struct WeightedCompletionTime {
    
    enum CalculationType {
        case difference
        case ratio
    }
    
    static func calculate(_ jobs: [Job], with calculationType: CalculationType) -> Int {
        var jobs: [Job] = jobs
        quicksort(&jobs, low: 0, high: jobs.count - 1, with: calculationType)
        
        var currentTime = 0
        var totalWeightedCompletionTime = 0

        for job in jobs {
            currentTime += job.length
            totalWeightedCompletionTime += job.weight * currentTime
        }

        return totalWeightedCompletionTime
    }

    private static func partition(_ jobs: inout [Job], low: Int, high: Int, with calculationType: CalculationType) -> Int {
        let pivot = jobs[high]
        var i = low

        if calculationType == .difference {
            for j in low..<high {
                if jobs[j].difference > pivot.difference ||
                   (jobs[j].difference == pivot.difference && jobs[j].weight > pivot.weight) {
                    jobs.swapAt(i, j)
                    i += 1
                }
            }
        } else if calculationType == .ratio {
            for j in low..<high {
                if jobs[j].ratio > pivot.ratio ||
                   (jobs[j].ratio == pivot.ratio && jobs[j].weight > pivot.weight) {
                    jobs.swapAt(i, j)
                    i += 1
                }
            }
        }

        jobs.swapAt(i, high)
        return i
    }
    
    private static func quicksort(_ jobs: inout [Job], low: Int, high: Int, with calculationType: CalculationType) {
        if low < high {
            let pivot = partition(&jobs, low: low, high: high, with: calculationType)
            quicksort(&jobs, low: low, high: pivot - 1, with: calculationType)
            quicksort(&jobs, low: pivot + 1, high: high, with: calculationType)
        }
    }

}
